Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp2212787wro;
        Fri, 2 Nov 2018 07:59:22 -0700 (PDT)
X-Google-Smtp-Source: AJdET5cx/5haJLy5PILX9ap/iRpGKpf5dodfAQ24VYmcSSGY8qhifT07PjW462GccfU7nDby0VRE
X-Received: by 2002:ae9:f40b:: with SMTP id y11mr10831486qkl.228.1541170762890;
        Fri, 02 Nov 2018 07:59:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1541170762; cv=none;
        d=google.com; s=arc-20160816;
        b=tsjZIVXcGQVxtNtXuhrhxYFBS29UTXlClgRGkHkCaygjvNATunrPXIyfkoQO2XgXgZ
         b1oSBvxntzzaKivlXEC0x4KzxCPLEgx2/TAUpdqi/fdYGKn7/TVdMLXUTBLoDAkexxKD
         rvpPoPPn5dmuq9nZkk34XVlCzZjlf3jY94Mo7mW6/S93qiuqCoVaXpMzvA1HuThqhG+z
         /aXNDVUWwF0Bm3dZ76lhmc8JMExVDdDfBP+tL7Uxlp8EtbCS2kfMOKbY+HLcRGhmUVMW
         RTIQ91cyilsgRWY7FkC/i6d/W4Q0fw5dYjmPGVsQKz6jkqnQzQkZ7C0lpAsMMHA27gCM
         dq6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=Xb8qasGGEBVJuzUJvReZfnwfw3l/sa7Djl2gXpUSNbI=;
        b=uv/kLbYWKjzMeSObqOFOQOv9w8b/FD564UrT9UaWIovgKW3UuehVklSMJpddnMXK2w
         SXAxmk2uNuK9zaj70rvl1hs7+WC2HKloDcDp0ZMXc7KEI0fS3uvd1LeUdNA115iwgv2d
         eXs1RbFT3iPIAMfnXIEsRH9UWjcUJAu8yvlgeO/ZZbN33rwHkBdqH/4rXW8ujyDcq1NM
         0AaNRlu5U/oGtKooX8rc5GA7PbWu5zDrdL/5fyAmsjbH6urAbXepUpE5nnGL65T4gGIL
         +4gCS5txDicSy3SwWBOm2mS7TEf6YJxvgmzNSpRwinXvUe+dnntraCtKN89IZj9yXPNc
         qMZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=H02un9kK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q36si4127904qvj.97.2018.11.02.07.59.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 02 Nov 2018 07:59:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=H02un9kK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52050 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gIauw-0007B6-Dx
	for alex.bennee@linaro.org; Fri, 02 Nov 2018 10:59:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56623)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gIaqV-0002EL-Ca
	for qemu-arm@nongnu.org; Fri, 02 Nov 2018 10:54:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gIaqT-0003Gc-9c
	for qemu-arm@nongnu.org; Fri, 02 Nov 2018 10:54:47 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:54963)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gIaqR-0003FN-C8
	for qemu-arm@nongnu.org; Fri, 02 Nov 2018 10:54:43 -0400
Received: by mail-wm1-x342.google.com with SMTP id r63-v6so2231082wma.4
	for <qemu-arm@nongnu.org>; Fri, 02 Nov 2018 07:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Xb8qasGGEBVJuzUJvReZfnwfw3l/sa7Djl2gXpUSNbI=;
	b=H02un9kKY4HwUC6DAMGOmRsimNiZIkBVj9UB9ZOzhB2TDviQfJz9JeKYE+UtduRbZD
	VGB7ILbyYQwqjMDHlGhJsp5Y7TUD4X+EVmRZq3VgV6tKS2lQz74TRtX4tsyO1BNGh4It
	I2RKLKdUggwd5fSsKpFzzhLuBYeumuUE/MHCQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Xb8qasGGEBVJuzUJvReZfnwfw3l/sa7Djl2gXpUSNbI=;
	b=TGcIulUmSsZw5CNTw+j699gIXdyC1DiEobSU8oH+H9hWxT1dUJJPjQPt71QxV+VpFp
	kMWryU6KawQ/mrpj7NXXWHmccLf3Lk9cgLuQRhAR3QYBcq23mf6as2z6TxPOTx0UytyV
	2KqUxi0ELWap7+iW63A6beKUx8A1krVXt6jhr8ZUcv6TDZ2XE4Km3taErDjoeFl74uuI
	jjSnvhiTssEuSl4sKLzMHfvQRb0nQnn4C0TOxnxJo0IrwHDBxGHlYuDmDhGQjiwZuWmX
	12puBadJKIh9MKd6vRjoLSMfaU7kCLPacxMCrjIxFhv2riFpe7SS0eoNmbxH4SVtUjVE
	2chg==
X-Gm-Message-State: AGRZ1gIW06FeQ47u66hAk88b3gy+4TTY7/93mi+yMr3U681QG5EuIJKN
	KHvmDLOfM1rxak65OqIvu+FyFA==
X-Received: by 2002:a1c:1984:: with SMTP id 126-v6mr36015wmz.7.1541170482142; 
	Fri, 02 Nov 2018 07:54:42 -0700 (PDT)
Received: from cloudburst.Home ([2a02:c7f:504f:6300:a3de:88d8:75ae:bf4c])
	by smtp.gmail.com with ESMTPSA id
	l5-v6sm10698454wrv.84.2018.11.02.07.54.40
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 02 Nov 2018 07:54:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri,  2 Nov 2018 14:54:32 +0000
Message-Id: <20181102145433.4553-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181102145433.4553-1-richard.henderson@linaro.org>
References: <20181102145433.4553-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::342
Subject: [Qemu-arm] [PATCH v2 4/5] target/arm: Fill in ARMISARegisters for
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
X-TUID: 2pNapkwBsu/K

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

