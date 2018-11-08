Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp443716wrw;
        Thu, 8 Nov 2018 09:55:56 -0800 (PST)
X-Google-Smtp-Source: AJdET5eG6Xk+C6Nmql1ARzHW37OQy5ezdxDeh5vXn7OjizO+JBklzawVT0XznoloH5p31BRuuPTh
X-Received: by 2002:ac8:6151:: with SMTP id d17mr2586090qtm.194.1541699756273;
        Thu, 08 Nov 2018 09:55:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541699756; cv=none;
        d=google.com; s=arc-20160816;
        b=tYH4qgCbEcO9ioac5KuVJ00+zfsrDl0okq9bR5CDBD76wLPJtrYTseNcztgBRg5TE+
         Yv4GatlDq7OCUhJS+sIdaxLOhX3ws0AyUc8CXDd83SmojtWDyN5Lh4I8Myj9kz/DrG0o
         re6GOWa61e0TgKeJTLbWVCwde71b5pUhbJKJ9ml1VUydlA0K1tMZ9+4m0o+jU0VxAxDI
         mqbVr1tFOMGzzd4HwAHRC3rvBReGhvHsxE76tFAzPL6Z3SmLdOnOBDKlNKBBL0aivFmd
         TJPb/7xpcWAQzMdMNw8zEmU+BjGRZ82a9UmXfidchaqRPh0S1FRo1ssjUkhogSF2QYaQ
         Lvjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=Xb8qasGGEBVJuzUJvReZfnwfw3l/sa7Djl2gXpUSNbI=;
        b=Rq0k2T/QBldBFYcm2gChbuxswtjc9n9qDfhE/6LTptHjqVGGS9dVX07oQanP68XuJ+
         MxkDFGibBu5ujLNy+RJqmr3N0z9k7g9kyGLRau8BvllPoQ1i1ZnXl0UK+wM2dgLmninz
         euYXAsrP5a+KoDawzwQctJN8QJAbnKjld0ic2pWYoxNmu1lE5IMaaqCvjNkT+XfBBf8K
         gh2/hLKGZb0OBpHCPs51klpPCwYS9784BmSBY7P7u0Tvbx5qHaMs3D0CPgamLz/upuzW
         PZjyeVctBBLeiqsA+RmF4DtztEvzOJpSoVlGGje+lygkPlohzJQp9NEWdxwTBZKr1tdn
         7NRg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Kbxa93T5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k27si3507837qvf.30.2018.11.08.09.55.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 08 Nov 2018 09:55:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Kbxa93T5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58336 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gKoX5-0001yj-P2
	for alex.bennee@linaro.org; Thu, 08 Nov 2018 12:55:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39545)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gKoW8-0001cD-JM
	for qemu-devel@nongnu.org; Thu, 08 Nov 2018 12:54:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gKoW7-0008Cl-EG
	for qemu-devel@nongnu.org; Thu, 08 Nov 2018 12:54:56 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:36225)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gKoW7-0008Bw-6R
	for qemu-devel@nongnu.org; Thu, 08 Nov 2018 12:54:55 -0500
Received: by mail-wr1-x444.google.com with SMTP id z13-v6so19844123wrs.3
	for <qemu-devel@nongnu.org>; Thu, 08 Nov 2018 09:54:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Xb8qasGGEBVJuzUJvReZfnwfw3l/sa7Djl2gXpUSNbI=;
	b=Kbxa93T5t7ZLwlFtc6CCj6X9YXueMS0TjwI435j0TefkO1bNI4Pky9czNZ2PmgF/z5
	1xei0ZWuPWlc+2Fs9Z0PIQ0ueF7JPp6rfLplUwmNMGMNyD49kkGzqCKqJgG8kS6LLN7u
	aDqkeX1j/0dhI51AzjBoawlKmzksB48rusWF8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Xb8qasGGEBVJuzUJvReZfnwfw3l/sa7Djl2gXpUSNbI=;
	b=gBtyI/ESK3zx+GkrOYZxhPIG4zMZu/STklikp1BlfxLI1Sr1iGbmVe2PXFSxJ4VmSa
	qDmtH++e3TO28VivJ28O3BsuSxB/NgRzMoL45PsZ3IcQIVv4TNo1oX8YqTMhaxz6OGGR
	PdAEy5NoTnE9ubDQtjp0o5hcxPKp7cIt9cszJRGUiEArkCcQtT3G8GuaxVpmOa6MtfQq
	4j3gFrz/4w4DD3pqmXn+hf94for8VV6Qrh7ZyI1fYvcB8G+qk8rxBB0rE6HbfHIrqUPl
	Icu4mlEMaj6OtuV80S44DTcUVWOvljrzNFqWobMiD+C5P6R4el398nEms+GBLpCR8zPd
	Ly0w==
X-Gm-Message-State: AGRZ1gK1077iZ5n6tq/Ybn6GMez/PaUIPTVJ7YJyYzKK1HvZTLTl9WiU
	+rn37oDKai8jfViT8AuNqOsXTMa0HHhv1Q==
X-Received: by 2002:adf:9441:: with SMTP id
	59-v6mr4860421wrq.305.1541699693655; 
	Thu, 08 Nov 2018 09:54:53 -0800 (PST)
Received: from cloudburst.twiddle.net
	(70.red-2-141-114.dynamicip.rima-tde.net. [2.141.114.70])
	by smtp.gmail.com with ESMTPSA id
	l42-v6sm4411384wre.37.2018.11.08.09.54.52
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 08 Nov 2018 09:54:53 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu,  8 Nov 2018 18:52:45 +0100
Message-Id: <20181108175246.13416-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181108175246.13416-1-richard.henderson@linaro.org>
References: <20181108175246.13416-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: [Qemu-devel] [PATCH v3 4/5] target/arm: Fill in ARMISARegisters for
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
X-TUID: YV4kR4f22vI7

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/kvm32.c | 33 ++++++++++++++++++++++++++++-----
 1 file changed, 28 insertions(+), 5 deletions(-)

diff --git a/target/arm/kvm32.c b/target/arm/kvm32.c
index de573f9aa8..9ededa3c73 100644
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
@@ -71,9 +71,32 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
 
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
+    err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_isar6,
+                          ARM_CP15_REG32(0, 0, 2, 7));
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
 
@@ -95,13 +118,13 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
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

