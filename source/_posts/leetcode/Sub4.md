---
title: 4.寻找两个有序数组的中位数
mathjax: true
date: 2020-01-14 00:12:57
categories: 
- 算法
tags:
- leetcode
---
# LeetCode 寻找两个有序数组的中位数

第4题

```java

给定两个大小为 m 和 n 的有序数组 nums1 和 nums2。

请你找出这两个有序数组的中位数，并且要求算法的时间复杂度为 O(log(m + n))。

你可以假设 nums1 和 nums2 不会同时为空。

示例 1:

nums1 = [1, 3]
nums2 = [2]

则中位数是 2.0
示例 2:

nums1 = [1, 2]
nums2 = [3, 4]

则中位数是 (2 + 3)/2 = 2.5

来源：力扣（LeetCode）
链接：https://leetcode-cn.com/problems/median-of-two-sorted-arrays

```

## 中位数定义

>将一个集合划分为两个长度相等的子集，其中一个子集中的元素总是大于另一个子集中的元素。

## 解题思路

将数组进行切。

- 长度为 m 的数组，有 0 到 m 总共 m + 1 个位置可以切。

- 把数组 A 和数组 B 分别在 i 和 j 进行切割。

- 将 i 的左边和 j 的左边组合成「左半部分」，将 i 的右边和 j 的右边组合成「右半部分」。

### 当 A 数组和 B 数组的总长度是偶数时，如果我们能够保证

- 左半部分的长度等于右半部分 $i+j=m-i+n-j$, 也就是 $j=(m+n)/2-i$

- 左半部分最大的值小于等于右半部分最小的值 $max(A[i-1],B[j-1])<=min(A[i],B[j])$

那么，中位数就可以表示如下

$(左半部分最大值+右半部分最小值)/2$==>$(max(A[i-1],B[j-1])+min(A[i],B[j]))/2$

### 当 A 数组和 B 数组的总长度是奇数时，如果我们能够保证

- 左半部分的长度比右半部分大1，即$i+j=m-i+n-j+1$ 也就是 $j=(m+n+1)/2-i$

- 左半部分最大的值小于等于右半部分最小的值 $max(A[i-1],B[j-1]) <=min(A[i],B[j])$

那么，中位数就是

左半部分最大值，也就是左半部比右半部分多出的那一个数==>$max(A[i-1],B[j-1])$

### 对以上条件进行分析

#### 第一个条件

我们其实可以合并为 $j=(m+n+1)/2-i$，因为如果$m+n$ 是偶数，由于我们取的是 int 值，所以加 1 也不会影响结果。当然，由于 $0<=i<=m$，为了保证 $0<=j<=n$，我们必须保证 $m<=n$。

- $m≤n,i<m,j=(m+n+1)/2−i≥(m+m+1)/2−i>(m+m+1)/2−m=0$

- $m≤n,i>0,j=(m+n+1)/2−i≤(n+n+1)/2−i<(n+n+1)/2=n$

最后一步由于是 int 间的运算，所以 $1/2=0$

#### 第二个条件

奇数和偶数的情况是一样的，我们进一步分析。

为了保证 $max(A[i-1],B[j-1])<=min(A[i],B[j])$，因为 A 数组和 B 数组是有序的，所以 $A[i-1]<=A[i]，B[i-1]<=B[i] 这是一定的，所以我们只需要保证 $B[j-1]<=A[i]和A[i-1]<=B[j]$，即我们要分两种情况讨论：

- $B[j-1]>A[i]$，并且为了不越界，要保证 $j!= 0，i!=m$，此时很明显，我们需要增加 i ，为了数量的平衡还要减少 j ，幸运的是 $j=(m+n+1)/2-i$，i 增大，j 自然会减少。

- $A[i-1]>B[j]$，并且为了不越界，要保证 $i!=0，j!=n$，此时和上边的情况相反，我们要减少 i ，增大 j 。

上边两种情况，我们把边界都排除了，需要单独讨论。

- 当 i=0, 或者 j=0，也就是切在了最前边。此时左半部分当 j = 0 时，最大的值就是 $A[i-1]$ ；当 i=0 时 最大的值就是 $B[j-1]$。右半部分最小值和之前一样。

- 当 i = m 或者 j = n，也就是切在了最后边。此时左半部分最大值和之前一样。右半部分当 $j=n$ 时，最小值就是 $A[i]$；当 i = m 时，最小值就是$B[j]$。

所有的思路都理清了，最后一个问题，增加 i 的方式。当然用二分了。初始化 i 为中间的值，然后减半找中间的，减半找中间的，减半找中间的直到答案。

### 源代码

```java
class Solution {
    public double findMedianSortedArrays(int[] A, int[] B) {
        int m = A.length;
        int n = B.length;
        if (m > n) { 
            return findMedianSortedArrays(B,A); // 保证 m <= n
        }
        int iMin = 0, iMax = m;
        while (iMin <= iMax) {
            int i = (iMin + iMax) / 2;
            int j = (m + n + 1) / 2 - i;
            if (j != 0 && i != m && B[j-1] > A[i]){ // i 需要增大
                iMin = i + 1; 
            }
            else if (i != 0 && j != n && A[i-1] > B[j]) { // i 需要减小
                iMax = i - 1; 
            }
            else { // 达到要求，并且将边界条件列出来单独考虑
                int maxLeft = 0;
                if (i == 0) { maxLeft = B[j-1]; }
                else if (j == 0) { maxLeft = A[i-1]; }
                else { maxLeft = Math.max(A[i-1], B[j-1]); }
                if ( (m + n) % 2 == 1 ) { return maxLeft; } // 奇数的话不需要考虑右半部分

                int minRight = 0;
                if (i == m) { minRight = B[j]; }
                else if (j == n) { minRight = A[i]; }
                else { minRight = Math.min(B[j], A[i]); }

                return (maxLeft + minRight) / 2.0; //如果是偶数的话返回结果
            }
        }
        return 0.0;
    }
}
```

## 总结

- 时间复杂度

我们对较短的数组进行了二分查找，所以时间复杂度是 $O(log(min(m,n)))$。

- 空间复杂度

只有一些固定的变量，和数组长度无关，所以空间复杂度是 $O(1)$。

## 资料

- [源码地址](https://github.com/smltq/spring-boot-demo/blob/master/leetcode/src/main/java/com/easy/leetcode/Sub4.java)
- [文章地址](https://github.com/smltq/blog/tree/master/source/_posts/leetcode/Sub4.md)
- [LeetCode 题解目录](https://github.com/smltq/spring-boot-demo/blob/master/leetcode)