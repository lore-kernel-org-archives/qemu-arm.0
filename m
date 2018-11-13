Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp4522056wrw;
        Tue, 13 Nov 2018 07:44:14 -0800 (PST)
X-Google-Smtp-Source: AJdET5eIKr/rGyg/7RuBhPzt+M5xVIV9svtPGma5dwWeDmpCVA2wR58UiGjo8YMOPkh3VYfcCuju
X-Received: by 2002:a37:8d81:: with SMTP id p123mr5221589qkd.241.1542123854650;
        Tue, 13 Nov 2018 07:44:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542123854; cv=none;
        d=google.com; s=arc-20160816;
        b=Qmmx9hKfZHyNdXFMqiIaaTh/qdCYiEVe2GHfQ4Y9Lm92vBBZAhHWtRzWuyzDs5d34a
         wDX8kal0izx9l+R0fsU+3veHDdK0JQfjANCvkE9ygKv6cJuyNA7QJzvXptqW8PtlnJbZ
         9AYgg5MMcdmonDV+8ll+OhVoJ2y8VYfTFCBtSyL5tAO47UtZ/Qy0FxMy36tyZUIr/cou
         /juMNcWjyqF83BKYxGTlEsTxn5mETkAjays+gUgR2/KuiyfqQwHU7tKU23ShaOTQYOCl
         f7F40PfMoigNXj1MBPw6McJ8r1aeI4QEDyIJyNLBkia4i6bN4vpB4W00fleSHtsm2DsL
         LFxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=CVcvIslv5WWkfBYxl9Mw9FAOSkXdpfKXat0+V0xS4Bs=;
        b=AAoJoiX/uBenZFmkT4aesxFoLZ0w0+Fafaa59nC610YHWAwkv39rxO3VSMBG3e+eXY
         hDfU4OwdSUGE7zl1CGJZz+f7pcc6DIcFrJw58rPbFSXkcTNBm2lNK6YyMn+3jeEy5EFc
         ELfwaHJ6NVWwmIhhDZD1HdO9tXxDUDDl4Ijmp8hG5uzo7uMXexHykcE3dnDSQVZdrEkA
         jvhe92WN9UHNjiBL5JDULK2zJ6BwZHfwD4P8M07rBTZWWE6avhwJUoPqdDMCxtQEa2v6
         SGcOjMk+aVxSf1ia0mkW/ZB2fdYhwp3Av1Q5tw3IuoyDMxDOyDkz3RpXyGf4wO5X2NcD
         zCAw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GqA3uVk7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m7si1374014qvq.39.2018.11.13.07.44.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Nov 2018 07:44:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GqA3uVk7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54556 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gMarN-0002eU-V2
	for alex.bennee@linaro.org; Tue, 13 Nov 2018 10:44:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40535)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gMar5-0002cS-Nv
	for qemu-arm@nongnu.org; Tue, 13 Nov 2018 10:43:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gMar0-0002V6-I8
	for qemu-arm@nongnu.org; Tue, 13 Nov 2018 10:43:54 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:56102)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gMaqy-0002FB-79
	for qemu-arm@nongnu.org; Tue, 13 Nov 2018 10:43:49 -0500
Received: by mail-wm1-x343.google.com with SMTP id i73-v6so7116481wmd.5
	for <qemu-arm@nongnu.org>; Tue, 13 Nov 2018 07:43:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=CVcvIslv5WWkfBYxl9Mw9FAOSkXdpfKXat0+V0xS4Bs=;
	b=GqA3uVk7k+oZ4dkSt8E0OsPLnFa4USOUakEwEIu+U3j70dg0/eXEK+Ewcr7MS+MorW
	dZlWiYHuCqsypym/Xbw2Igh/ZU55EwczfH2VchNx1avVDqtuJZc4S80GVD5sdafPiP9X
	+Wp6f7KHr9qvicjjkaLjbBJZFN+y8CNy4+2AM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=CVcvIslv5WWkfBYxl9Mw9FAOSkXdpfKXat0+V0xS4Bs=;
	b=QX4g+WJ3xsiSP+7dokJ4H8c9uFlN4QkqyNZQcvZe5FNcP8mHxQoU337dEGIKUEwmqy
	DHyVrPZnsocIM11g9AW7fNmOkgMrUvnJMWgB4OZikH1FoM6KJjAL3wveGp+RHw/H3g/x
	9HXFYwJREJSii9lyU5goGx/M+vPFe0efBZ8ojstBrFFMO281GPcQtU5dxjyUgqqKRB02
	SLaWQOoaaADtLbCMA+kH0dlasN5ctxgtF0jpRhWvY8E5LflE9FnJW37Zp06EQ7cXKp0D
	77jz/t2Y4aT6GpAC2isn6wp+Baj7kroKtXxZhp1BGXc6mrYVyd3JkFfQ325J7E5VQnVj
	SduQ==
X-Gm-Message-State: AGRZ1gK3ICcS4cCHDjM8GQKHwhbUe1UP9ovGrtd63Po/q85xGI3usR8m
	P5ZV0beMwhsaeUsf4HE2J8471A==
X-Received: by 2002:a7b:cd97:: with SMTP id y23mr2406905wmj.129.1542123801311; 
	Tue, 13 Nov 2018 07:43:21 -0800 (PST)
Received: from cloudburst.twiddle.net
	(26.red-176-87-105.dynamicip.rima-tde.net. [176.87.105.26])
	by smtp.gmail.com with ESMTPSA id
	s16sm3479709wrt.77.2018.11.13.07.43.20
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 13 Nov 2018 07:43:20 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue, 13 Nov 2018 16:42:26 +0100
Message-Id: <20181113154226.14396-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181113154226.14396-1-richard.henderson@linaro.org>
References: <20181113154226.14396-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::343
Subject: [Qemu-arm] [PATCH v4 4/4] target/arm: Fill in ARMISARegisters for
 kvm32
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9cDkUqW0d7pj

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/kvm32.c | 40 +++++++++++++++++++++++++++++++++++-----
 1 file changed, 35 insertions(+), 5 deletions(-)

diff --git a/target/arm/kvm32.c b/target/arm/kvm32.c
index bc0badf53d..bd51eb43c8 100644
--- a/target/arm/kvm32.c
+++ b/target/arm/kvm32.c
@@ -44,7 +44,7 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
      * and then query that CPU for the relevant ID registers.
      */
     int err = 0, fdarray[3];
-    uint32_t midr, id_pfr0, mvfr1;
+    uint32_t midr, id_pfr0;
     uint64_t features = 0;
 
     /* Old kernels may not know about the PREFERRED_TARGET ioctl: however
@@ -71,9 +71,39 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
 
     err |= read_sys_reg32(fdarray[2], &midr, ARM_CP15_REG32(0, 0, 0, 0));
     err |= read_sys_reg32(fdarray[2], &id_pfr0, ARM_CP15_REG32(0, 0, 1, 0));
-    err |= read_sys_reg32(fdarray[2], &mvfr1,
+
+    err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_isar0,
+                          ARM_CP15_REG32(0, 0, 2, 0));
+    err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_isar1,
+                          ARM_CP15_REG32(0, 0, 2, 1));
+    err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_isar2,
+                          ARM_CP15_REG32(0, 0, 2, 2));
+    err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_isar3,
+                          ARM_CP15_REG32(0, 0, 2, 3));
+    err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_isar4,
+                          ARM_CP15_REG32(0, 0, 2, 4));
+    err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_isar5,
+                          ARM_CP15_REG32(0, 0, 2, 5));
+    if (read_sys_reg32(fdarray[2], &ahcf->isar.id_isar6,
+                       ARM_CP15_REG32(0, 0, 2, 7))) {
+        /*
+         * Older kernels don't support reading ID_ISAR6. This register was
+         * only introduced in ARMv8, so we can assume that it is zero on a
+         * CPU that a kernel this old is running on.
+         */
+        ahcf->isar.id_isar6 = 0;
+    }
+
+    err |= read_sys_reg32(fdarray[2], &ahcf->isar.mvfr0,
+                          KVM_REG_ARM | KVM_REG_SIZE_U32 |
+                          KVM_REG_ARM_VFP | KVM_REG_ARM_VFP_MVFR0);
+    err |= read_sys_reg32(fdarray[2], &ahcf->isar.mvfr1,
                           KVM_REG_ARM | KVM_REG_SIZE_U32 |
                           KVM_REG_ARM_VFP | KVM_REG_ARM_VFP_MVFR1);
+    /*
+     * FIXME: There is not yet a way to read MVFR2.
+     * Fortunately there is not yet anything in there that affects migration.
+     */
 
     kvm_arm_destroy_scratch_host_vcpu(fdarray);
 
@@ -95,13 +125,13 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
     if (extract32(id_pfr0, 12, 4) == 1) {
         set_feature(&features, ARM_FEATURE_THUMB2EE);
     }
-    if (extract32(mvfr1, 20, 4) == 1) {
+    if (extract32(ahcf->isar.mvfr1, 20, 4) == 1) {
         set_feature(&features, ARM_FEATURE_VFP_FP16);
     }
-    if (extract32(mvfr1, 12, 4) == 1) {
+    if (extract32(ahcf->isar.mvfr1, 12, 4) == 1) {
         set_feature(&features, ARM_FEATURE_NEON);
     }
-    if (extract32(mvfr1, 28, 4) == 1) {
+    if (extract32(ahcf->isar.mvfr1, 28, 4) == 1) {
         /* FMAC support implies VFPv4 */
         set_feature(&features, ARM_FEATURE_VFP4);
     }
-- 
2.17.2

