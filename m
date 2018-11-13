Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp4695644wrw;
        Tue, 13 Nov 2018 10:17:21 -0800 (PST)
X-Google-Smtp-Source: AJdET5co3ucr5rqPWVfPz0qOy1QEls1IYBvRIcGfBfiDxswWM3hwRDK+9ReEIbLHFvafqg7tuDRe
X-Received: by 2002:a37:65c5:: with SMTP id z188mr5750628qkb.306.1542133041445;
        Tue, 13 Nov 2018 10:17:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542133041; cv=none;
        d=google.com; s=arc-20160816;
        b=DSWx4+YL/gts6XoI1k2PdOucw9rDt36miYnsfLUzu8bR+FwuTupJLDPjn8flOTy4u9
         N3xoOK/JwBDTZYIXj4fEEiZyIr4EKwuyxkMpSugauC9m/oHJViCtVojVlJeBXi+/CrlV
         /0qbXEPVUVkgAKTzfGEablIGUZzW/DYPeC4rN0sjoNEf4LsLCTeer1O/MsTC0kkfXz0S
         ykR6JgsXW6wpIM/DcJ5bK9cu6NKyPqCxDnKktI3YDSEMzQdWRooLfdmZqwZCXpejrlay
         sGBnskdKJALKKprbaFaP6DzHGvy/5X3cCK6A7DZV4WJ5mwBaB8tPO8/0YzaaZ6QYYo/F
         fldw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=CVcvIslv5WWkfBYxl9Mw9FAOSkXdpfKXat0+V0xS4Bs=;
        b=t7wQQsBrKoqF3Qhoi3iAfKjt2m4bSQpqYL9Mnpv+oYGHbM4q8Yj23MWxd5NneQNS7E
         TaGUcGTzeb1sviqGnygTYtRvQvM2a68fMkLhLWeyWRxaSpvVv//2WQvvbV2jcFcUthgV
         lqrjUs7CAVQsamDKO8wud9mQIiAeJCoaxbpWxdtcKSQ7g4Hj3FnS8v7LIDcCWCMxKR+S
         xmtr+adDe+CRJ6Kc5A7I3v6MAt4vff5kCW2nypQ15xYYYagce6UGxHr9fWIkN4wcFcDQ
         KQA1O0D+A8VBPAQhV+6bzf5tpSGs5NYNDxcmGMtMfk1lpR/i01ygRBTQ1OpySsAz35Wx
         AmIA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bOpPllLV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o62si1625675qtd.172.2018.11.13.10.17.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Nov 2018 10:17:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bOpPllLV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55562 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gMdFY-0004Ay-Ra
	for alex.bennee@linaro.org; Tue, 13 Nov 2018 13:17:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57899)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gMdE9-0003DL-On
	for qemu-devel@nongnu.org; Tue, 13 Nov 2018 13:15:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gMd1g-00084Z-SJ
	for qemu-devel@nongnu.org; Tue, 13 Nov 2018 13:03:01 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:54105)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gMd1g-00083z-Lz
	for qemu-devel@nongnu.org; Tue, 13 Nov 2018 13:03:00 -0500
Received: by mail-wm1-x343.google.com with SMTP id f10-v6so12869926wme.3
	for <qemu-devel@nongnu.org>; Tue, 13 Nov 2018 10:03:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=CVcvIslv5WWkfBYxl9Mw9FAOSkXdpfKXat0+V0xS4Bs=;
	b=bOpPllLV9MWbjmlwJqqTv01jVkpgO1z6WpqhAbgo07bAZnS0oEPnENCSFC46hvxde9
	mFZ9JzAUlVISo914WF54H7XMkUI5PEzZFvmjRFBq8d2S0S5N9wCJFyzS4WcXGEPU7LQi
	qxSlfz/k+uAZC9g+AFU3J7i7PutMxoEXBjVUQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=CVcvIslv5WWkfBYxl9Mw9FAOSkXdpfKXat0+V0xS4Bs=;
	b=txe+VdZAIXRewWHyiP67XYQosu9Fz5eLjtiIbaofayqOJxaweJtO/WxeF6DkD7hxsV
	67NmU7/YSdCHuJmYa7dmJVmh/s1CicmQ+mWCIubQY/N5wT8J4HT4xTUJSgQ1FCxCu9KI
	w6oOH1HXl9wsZbnGUFNVTngL+WIPXpSt4SfQXtHEeB6jbzPxMU5KPO5wb5L90nS61w3C
	3wUmbsLqNdcV0bRI3wEb2+uqSM+8rafHAkOMORAPy153C5rPXWfNX7DRUeYTCm1z2i2/
	Y5JffId48mqUeDDdSp+HUkko91NGOTSawwtOtKC6YfsoWU3LDAz+m4Fn74elR+JajBrr
	7zBw==
X-Gm-Message-State: AGRZ1gIZLL3VgB3893bzYG4pyDouSyqcm5HhKZeZ/7CcLa9h2l4nhH5D
	7fmwGU42ENfcwHGn8zrtdKHtin2IQjuY1A==
X-Received: by 2002:a1c:d14d:: with SMTP id i74mr1971100wmg.100.1542132179312; 
	Tue, 13 Nov 2018 10:02:59 -0800 (PST)
Received: from cloudburst.twiddle.net
	(26.red-176-87-105.dynamicip.rima-tde.net. [176.87.105.26])
	by smtp.gmail.com with ESMTPSA id
	j124-v6sm2715978wmb.1.2018.11.13.10.02.53
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 13 Nov 2018 10:02:58 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue, 13 Nov 2018 19:01:54 +0100
Message-Id: <20181113180154.17903-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181113180154.17903-1-richard.henderson@linaro.org>
References: <20181113180154.17903-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::343
Subject: [Qemu-devel] [PATCH v5 4/4] target/arm: Fill in ARMISARegisters for
 kvm32
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rWGFijkyQBfh

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

