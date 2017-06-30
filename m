Received: by 10.25.227.6 with SMTP id a6csp5073913lfh;
        Thu, 29 Jun 2017 20:01:25 -0700 (PDT)
X-Received: by 10.55.195.6 with SMTP id a6mr23810693qkj.114.1498791685753;
        Thu, 29 Jun 2017 20:01:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498791685; cv=none;
        d=google.com; s=arc-20160816;
        b=Fui5C3W++VLGFBAC4p/YPKtyw3yhYyQuINA51kWVElbJjoI5qJig0x7PgcwxrSx2bL
         //zFgwV2XuVki+S8ednxoqAJK6lYtIqSZqW+L873Ok32+6WfmoA72gOPiuhdkXfsjR/7
         mqnhesSNy2LRuLVBmSjToRO0uJ+sE0DQ4tGIC+m87TiCQXFLsnvk3lCnAbkklRo2xHfn
         UqQBj4rbkEYyct/JGtU5JG/NpVob9xghFv9UVwTqlVbp8eKyq2Xn/rJLTn5ItQ8w5gF9
         voKCCB4WluE9p9DpBFQHc2826mxHg2E7TaI9HdQ6i1q+u62lDVqJ21M3uNJiSM5zgjy+
         zTEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature:dkim-signature:arc-authentication-results;
        bh=9+VPGfdtKuJBD0EeWUtUyRIwxM763rJdXOYIOMsSux0=;
        b=HVPwhMEuCLBnCyH3ivu/YDc6BoPZzwnuCVUVzvxi0QbW5BMpv8V8EzZ2THDaRFfeC2
         AW/qS1xYFS67doJU+cNqzvyKAWDD/rI23RE6Rvhk5+HQMNCmn0EEEgZKoiNQ+FUUnNWB
         tH28Cm/MGQT7j6AQVjFian49yuD/5SGqIYwgYc3Hxt1UHQwpBtEv+ZF+GGNs4ETgtnb6
         YPr/Q0uQznrKW/Q7wkC6dF4OD6w/nnqO3LLbGLPVBqYCVLrK99dReZ33sRMyzodwAxiV
         UNVrtm6dum5+SgwW/aPQ+h9omXNhG7AFvAbNi6jMJ6ZmXp5LSbN2GCBcYZS9fvyur/An
         OCiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@aj.id.au header.b=nGq3mu3F;
       dkim=fail header.i=@messagingengine.com header.b=KIBY8Qyj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g2si6484772qtg.323.2017.06.29.20.01.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 29 Jun 2017 20:01:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au header.b=nGq3mu3F;
       dkim=fail header.i=@messagingengine.com header.b=KIBY8Qyj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42275 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dQmBO-0002oV-Sr
	for alex.bennee@linaro.org; Thu, 29 Jun 2017 23:01:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49302)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1dQmBK-0002mz-TF
	for qemu-arm@nongnu.org; Thu, 29 Jun 2017 23:01:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1dQmBF-0007X8-VR
	for qemu-arm@nongnu.org; Thu, 29 Jun 2017 23:01:18 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:33957)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <andrew@aj.id.au>)
	id 1dQmBF-0007W4-I6; Thu, 29 Jun 2017 23:01:13 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id BF8F120A22;
	Thu, 29 Jun 2017 23:01:11 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
	by compute4.internal (MEProxy); Thu, 29 Jun 2017 23:01:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:date:from:message-id:subject:to:x-me-sender:x-me-sender
	:x-sasl-enc:x-sasl-enc; s=fm1; bh=9+VPGfdtKuJBD0EeWUtUyRIwxM763r
	JdXOYIOMsSux0=; b=nGq3mu3FZMjnbYMIVbK5KNlGSmv+aiN1ZBREUaD4866WxZ
	WL2v9NdP86gn9N5sLzPfdoc5kugZJhcLq3K2VbqerjqE3UsVWCMHXc/JyXs8zbVa
	fZ+EjweFMIdjuyl27z1cm8hkIN6AtmTaBgBdgHE85msDcWYHXM+Y0XcRg4TJqVCk
	qHZyL6UAt8986DZE+Q1MhAZD7/+Iq0qswLwVnrDl6OMJLlkzgBc765KPvhVBdit8
	f+AT7hF0x38SGH3U2QOShEcT/DHuOGX/NgEitUlUkXNWQaO4xjBSv1F6CqtpoioS
	o5iGEFm4fvi8jgkjmE55uAAQ5ultCifGfsFh3gZA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:message-id:subject:to
	:x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=9+VPGf
	dtKuJBD0EeWUtUyRIwxM763rJdXOYIOMsSux0=; b=KIBY8QyjbsERNTfqyCKEoG
	l6/fiKTTmVaCNqcB+VRiwh6NurT5k5/5xxMx0StjoSbWWd64p68t+WuK5pqDsUw/
	5L3SRsG6MFdRhOxG7HvfJPtco4+k6kdlmQX3ISRsg51JSqvMUII7znZ1jySzq32T
	GHLLkxa4P3H3s/1ZJueI63Qj0umtfMMD+VRrSDXw7CkUSXqATALFihGL8WZunzDN
	6tCF3FuQKy1h9lR1bgKAqdEoOTYGr6a6HSaobAI6c3oMqDHRdeoheUs88TlJ6W1O
	okLqg7gmSrXJkmbZL4Db1wqxwTs1Nk5w4RFsz1i1+s0NxwKHpRi9b8R+A23PXmdQ
	==
X-ME-Sender: <xms:975VWQIMWlq_CIAl3rD8t-YjN4OKZ7B3XSi6Al6CFZdbxsMbx3hKrw>
X-Sasl-enc: v5Gkn88SsykeLW1pWWSa9KVqnscWw9RP7hTXvvctD6dv 1498791670
Received: from keelia.au.ibm.com
	(ppp118-210-130-225.bras1.adl6.internode.on.net [118.210.130.225])
	by mail.messagingengine.com (Postfix) with ESMTPA id 7A968240B0;
	Thu, 29 Jun 2017 23:01:08 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: qemu-devel@nongnu.org
Date: Fri, 30 Jun 2017 12:30:58 +0930
Message-Id: <20170630030058.28943-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.11.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.111.4.25
Subject: [Qemu-arm] [RFC PATCH 1/1] memory: Support unaligned accesses on
 aligned-only models
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, f4bug@amsat.org, qemu-arm@nongnu.org,
	joel@jms.id.au, pbonzini@redhat.com, clg@kaod.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5D2H1Np5wnEH

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
Hello,

This RFC patch stems from a discussion on a patch for an ADC model[1] where it
was pointed out that I should be able to use the .impl member of
MemoryRegionOps to constrain how my read() and write() callbacks where invoked.

I tried Phil's suggested approach and found I got reads of size 4, but with an
address that was not 4-byte aligned.

Looking at the source for access_with_adjusted_size() lead to the comment

     /* FIXME: support unaligned access? */

which at least suggests that the implementation isn't complete.

So, this patch is a quick and incomplete attempt at resolving the issue to see
whether I'm on the right track or way off in the weeds.

I've lightly tested it with the ADC model mentioned above, and it appears to do
the right thing (I changed the values generated by the ADC to distinguish
between the lower and upper 16 bits).

Things the patch is not:

1. Capable of handling unaligned writes
2. Tested on big-endian models

If the general idea of the patch is reasonable I'll look to resolve the above
to points.

Cheers,

Andrew

[1] http://lists.nongnu.org/archive/html/qemu-arm/2017-05/msg00400.html
 memory.c | 144 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 137 insertions(+), 7 deletions(-)

diff --git a/memory.c b/memory.c
index 0ddc4cc28deb..b9fae8d382bc 100644
--- a/memory.c
+++ b/memory.c
@@ -432,6 +432,7 @@ static MemTxResult  memory_region_read_accessor(MemoryRegion *mr,
 {
     uint64_t tmp;
 
+
     tmp = mr->ops->read(mr->opaque, addr, size);
     if (mr->subpage) {
         trace_memory_region_subpage_read(get_cpu_index(), mr, addr, tmp, size);
@@ -552,7 +553,7 @@ static MemTxResult memory_region_write_with_attrs_accessor(MemoryRegion *mr,
     return mr->ops->write_with_attrs(mr->opaque, addr, tmp, size, attrs);
 }
 
-static MemTxResult access_with_adjusted_size(hwaddr addr,
+static MemTxResult access_with_adjusted_size_aligned(hwaddr addr,
                                       uint64_t *value,
                                       unsigned size,
                                       unsigned access_size_min,
@@ -567,10 +568,11 @@ static MemTxResult access_with_adjusted_size(hwaddr addr,
                                       MemoryRegion *mr,
                                       MemTxAttrs attrs)
 {
+
+    MemTxResult r = MEMTX_OK;
     uint64_t access_mask;
     unsigned access_size;
     unsigned i;
-    MemTxResult r = MEMTX_OK;
 
     if (!access_size_min) {
         access_size_min = 1;
@@ -579,7 +581,6 @@ static MemTxResult access_with_adjusted_size(hwaddr addr,
         access_size_max = 4;
     }
 
-    /* FIXME: support unaligned access? */
     access_size = MAX(MIN(size, access_size_max), access_size_min);
     access_mask = -1ULL >> (64 - access_size * 8);
     if (memory_region_big_endian(mr)) {
@@ -596,6 +597,133 @@ static MemTxResult access_with_adjusted_size(hwaddr addr,
     return r;
 }
 
+/* Assume power-of-two size */
+#define align_down(addr, size) ((addr) & ~((size) - 1))
+#define align_up(addr, size) \
+    ({ typeof(size) __size = size; align_down((addr) + (__size) - 1, (__size)); })
+
+static MemTxResult access_with_adjusted_size_unaligned(hwaddr addr,
+                                      uint64_t *value,
+                                      unsigned size,
+                                      unsigned access_size_min,
+                                      unsigned access_size_max,
+                                      bool unaligned,
+                                      MemTxResult (*access)(MemoryRegion *mr,
+                                                            hwaddr addr,
+                                                            uint64_t *value,
+                                                            unsigned size,
+                                                            unsigned shift,
+                                                            uint64_t mask,
+                                                            MemTxAttrs attrs),
+                                      MemoryRegion *mr,
+                                      MemTxAttrs attrs)
+{
+    uint64_t access_value = 0;
+    MemTxResult r = MEMTX_OK;
+    hwaddr access_addr[2];
+    uint64_t access_mask;
+    unsigned access_size;
+
+    if (unlikely(!access_size_min)) {
+        access_size_min = 1;
+    }
+    if (unlikely(!access_size_max)) {
+        access_size_max = 4;
+    }
+
+    access_size = MAX(MIN(size, access_size_max), access_size_min);
+    access_addr[0] = align_down(addr, access_size);
+    access_addr[1] = align_up(addr + size, access_size);
+
+    if (memory_region_big_endian(mr)) {
+        hwaddr cur;
+
+        /* XXX: Big-endian path is untested...  */
+
+        for (cur = access_addr[0]; cur < access_addr[1]; cur += access_size) {
+            uint64_t mask_bounds[2];
+
+            mask_bounds[0] = MAX(addr, cur) - cur;
+            mask_bounds[1] =
+                MIN(addr + size, align_up(cur + 1, access_size)) - cur;
+
+            access_mask = (-1ULL << mask_bounds[0] * 8) &
+                (-1ULL >> (64 - mask_bounds[1] * 8));
+
+            r |= access(mr, cur, &access_value, access_size,
+                  (size - access_size - (MAX(addr, cur) - addr)),
+                  access_mask, attrs);
+
+            /* XXX: Can't do this hack for writes */
+            access_value >>= mask_bounds[0] * 8;
+        }
+    } else {
+        hwaddr cur;
+
+        for (cur = access_addr[0]; cur < access_addr[1]; cur += access_size) {
+            uint64_t mask_bounds[2];
+
+            mask_bounds[0] = MAX(addr, cur) - cur;
+            mask_bounds[1] =
+                MIN(addr + size, align_up(cur + 1, access_size)) - cur;
+
+            access_mask = (-1ULL << mask_bounds[0] * 8) &
+                (-1ULL >> (64 - mask_bounds[1] * 8));
+
+            r |= access(mr, cur, &access_value, access_size,
+                  (MAX(addr, cur) - addr), access_mask, attrs);
+
+            /* XXX: Can't do this hack for writes */
+            access_value >>= mask_bounds[0] * 8;
+        }
+    }
+
+    *value = access_value;
+
+    return r;
+}
+
+static inline MemTxResult access_with_adjusted_size(hwaddr addr,
+                                      uint64_t *value,
+                                      unsigned size,
+                                      unsigned access_size_min,
+                                      unsigned access_size_max,
+                                      bool unaligned,
+                                      MemTxResult (*access)(MemoryRegion *mr,
+                                                            hwaddr addr,
+                                                            uint64_t *value,
+                                                            unsigned size,
+                                                            unsigned shift,
+                                                            uint64_t mask,
+                                                            MemTxAttrs attrs),
+                                      MemoryRegion *mr,
+                                      MemTxAttrs attrs)
+{
+    unsigned access_size;
+
+    if (!access_size_min) {
+        access_size_min = 1;
+    }
+    if (!access_size_max) {
+        access_size_max = 4;
+    }
+
+    access_size = MAX(MIN(size, access_size_max), access_size_min);
+
+    /* Handle unaligned accesses if the model only supports natural alignment */
+    if (unlikely((addr & (access_size - 1)) && !unaligned)) {
+        return access_with_adjusted_size_unaligned(addr, value, size,
+                access_size_min, access_size_max, unaligned, access, mr, attrs);
+    }
+
+    /*
+     * Otherwise, if the access is aligned or the model specifies it can handle
+     * unaligned accesses, use the 'aligned' handler
+     */
+    return access_with_adjusted_size_aligned(addr, value, size,
+            access_size_min, access_size_max, access, mr, attrs);
+}
+
 static AddressSpace *memory_region_to_address_space(MemoryRegion *mr)
 {
     AddressSpace *as;
@@ -1238,16 +1366,18 @@ static MemTxResult memory_region_dispatch_read1(MemoryRegion *mr,
         return access_with_adjusted_size(addr, pval, size,
                                          mr->ops->impl.min_access_size,
                                          mr->ops->impl.max_access_size,
+                                         mr->ops->impl.unaligned,
                                          memory_region_read_accessor,
                                          mr, attrs);
     } else if (mr->ops->read_with_attrs) {
         return access_with_adjusted_size(addr, pval, size,
                                          mr->ops->impl.min_access_size,
                                          mr->ops->impl.max_access_size,
+                                         mr->ops->impl.unaligned,
                                          memory_region_read_with_attrs_accessor,
                                          mr, attrs);
     } else {
-        return access_with_adjusted_size(addr, pval, size, 1, 4,
+        return access_with_adjusted_size(addr, pval, size, 1, 4, true,
                                          memory_region_oldmmio_read_accessor,
                                          mr, attrs);
     }
@@ -1316,20 +1446,20 @@ MemTxResult memory_region_dispatch_write(MemoryRegion *mr,
     }
 
     if (mr->ops->write) {
-        return access_with_adjusted_size(addr, &data, size,
+        return access_with_adjusted_size_aligned(addr, &data, size,
                                          mr->ops->impl.min_access_size,
                                          mr->ops->impl.max_access_size,
                                          memory_region_write_accessor, mr,
                                          attrs);
     } else if (mr->ops->write_with_attrs) {
         return
-            access_with_adjusted_size(addr, &data, size,
+            access_with_adjusted_size_aligned(addr, &data, size,
                                       mr->ops->impl.min_access_size,
                                       mr->ops->impl.max_access_size,
                                       memory_region_write_with_attrs_accessor,
                                       mr, attrs);
     } else {
-        return access_with_adjusted_size(addr, &data, size, 1, 4,
+        return access_with_adjusted_size_aligned(addr, &data, size, 1, 4,
                                          memory_region_oldmmio_write_accessor,
                                          mr, attrs);
     }
-- 
2.11.0

