Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp2168316lfq;
        Fri, 18 Dec 2020 02:48:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyBlheWmhqLPAM4EwGdZIHECO71waPrZiJEpt9d/TAASeyKIgxkSvD/LTv2h9g9ONzJOBl4
X-Received: by 2002:a25:c802:: with SMTP id y2mr5029476ybf.364.1608288529772;
        Fri, 18 Dec 2020 02:48:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1608288529; cv=none;
        d=google.com; s=arc-20160816;
        b=wBDnbeWeJ6Gmye+LvAtxsH5L5DBui+j4k2SU18ivfnbwrZRc05LI7kLaaw37eNXRHA
         NSWfxo2u1xcwtakZeWQ+3GsiT8suDcLV2ZClkDh2CitDbEtvq5FacHuOC+c3M6/bUP78
         kczB4LyUV5jmv1US/v470DY1YqlBrIN6V3Tcj0gmKV/mNvCFQyyUYCW0aVff2zminsaN
         wfYqcsNEyMvfXac8a5aD+FJ7DOu0eGLp0XlKsgWsKiUiU5MFMW5Un3lYGkORpmhzLRUY
         Z3lGMP1k1EtPHueNxaHwjk7hJt6PDRsA1gNl7oxWazoZonjg+GnQRZV35rtZHIiaeIJh
         43cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=JHknvnDR0kSzGQtG5Tjash3RMqcN5Illov61Tcq4U9U=;
        b=e026PEyZACOm2BlHNQg/99xGsiJhwAHrnboT7PThNIWvFgLWJVjjzGewzhYBVz/71x
         xIKXgO7lVd4RVBoawNcYIWy7QsN3Ipn6248YUQihLGqwGQrjqxOgL+Q1PqvYdfU/vioP
         UTW+Ogxf30F+3sgN3jmLrT+jwqkbzp6tOqrrqRsAbVVRrItcy/k7sz0xfvvVHQWwOOwN
         x8UYGlKardxqHVK8z4gcKIkJg82T3Lo8KleZmG8kopMtuZ2Bqc/j9qyLVTFpKZIJC7mp
         3YjTsD6h1fuHbmRxVhDBk72dJQMphZ04crWDEmx4gNiEH6prD5+RDXQWO7Tj5y2930fe
         FNPA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u44si7383740ybi.470.2020.12.18.02.48.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Dec 2020 02:48:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kqDJZ-0002Xr-4m
	for alex.bennee@linaro.org; Fri, 18 Dec 2020 05:48:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>)
 id 1kqD9Y-00071I-4A; Fri, 18 Dec 2020 05:38:28 -0500
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:55296
 helo=ns207790.ip-94-23-215.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>)
 id 1kqD9W-0003Ks-HD; Fri, 18 Dec 2020 05:38:27 -0500
Received: from basile.remlab.net (ip6-localhost [IPv6:::1])
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTP id 920D25FD51;
 Fri, 18 Dec 2020 11:38:02 +0100 (CET)
From: remi.denis.courmont@huawei.com
To: qemu-arm@nongnu.org
Subject: [PATCH 11/18] target/arm: do S1_ptw_translate() before address space
 lookup
Date: Fri, 18 Dec 2020 12:37:52 +0200
Message-Id: <20201218103759.19929-11-remi.denis.courmont@huawei.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <3337797.iIbC2pHGDl@basile.remlab.net>
References: <3337797.iIbC2pHGDl@basile.remlab.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:41d0:2:5a1a::; envelope-from=remi@remlab.net;
 helo=ns207790.ip-94-23-215.eu
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Il7qvjbFS+BG

From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>

In the secure stage 2 translation regime, the VSTCR.SW and VTCR.NSW
bits can invert the secure flag for pagetable walks. This patchset
allows S1_ptw_translate() to change the non-secure bit.

Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 649c9237ce..4b6ffcd326 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10396,7 +10396,7 @@ static bool get_level1_table_address(CPUARMState *env, ARMMMUIdx mmu_idx,
 
 /* Translate a S1 pagetable walk through S2 if needed.  */
 static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
-                               hwaddr addr, MemTxAttrs txattrs,
+                               hwaddr addr, bool *is_secure,
                                ARMMMUFaultInfo *fi)
 {
     if (arm_mmu_idx_is_stage1_of_2(mmu_idx) &&
@@ -10406,6 +10406,9 @@ static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
         int s2prot;
         int ret;
         ARMCacheAttrs cacheattrs = {};
+        MemTxAttrs txattrs = {};
+
+        assert(!*is_secure); /* TODO: S-EL2 */
 
         ret = get_phys_addr_lpae(env, addr, MMU_DATA_LOAD, ARMMMUIdx_Stage2,
                                  false,
@@ -10446,9 +10449,9 @@ static uint32_t arm_ldl_ptw(CPUState *cs, hwaddr addr, bool is_secure,
     AddressSpace *as;
     uint32_t data;
 
+    addr = S1_ptw_translate(env, mmu_idx, addr, &is_secure, fi);
     attrs.secure = is_secure;
     as = arm_addressspace(cs, attrs);
-    addr = S1_ptw_translate(env, mmu_idx, addr, attrs, fi);
     if (fi->s1ptw) {
         return 0;
     }
@@ -10475,9 +10478,9 @@ static uint64_t arm_ldq_ptw(CPUState *cs, hwaddr addr, bool is_secure,
     AddressSpace *as;
     uint64_t data;
 
+    addr = S1_ptw_translate(env, mmu_idx, addr, &is_secure, fi);
     attrs.secure = is_secure;
     as = arm_addressspace(cs, attrs);
-    addr = S1_ptw_translate(env, mmu_idx, addr, attrs, fi);
     if (fi->s1ptw) {
         return 0;
     }
-- 
2.29.2

