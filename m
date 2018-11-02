Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp2211271wro;
        Fri, 2 Nov 2018 07:57:45 -0700 (PDT)
X-Google-Smtp-Source: AJdET5e76rvrLuDKUKOzTo1eNo/Udha4BRDMaXZPpmPf1KuboaLdD+zVYyisXtzGytNd36zR8xOz
X-Received: by 2002:ac8:1987:: with SMTP id u7mr8592115qtj.86.1541170665774;
        Fri, 02 Nov 2018 07:57:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1541170665; cv=none;
        d=google.com; s=arc-20160816;
        b=RrtTGtlH6sndXmtpmvaQvvpasvzuDYpXyWj/bwkCZVk6I01ungfB0dDQi141fSlTmc
         rdOqR/ICXJh9iQMnaJgtOB2UwOFz8JumfjCBxh4TJZAH/6QnzDFY5A402MWVQxGbtojs
         dk2dlrTf08JV7tgQhSUujewTQynm0u6OSUEIwHEZIN/6BwRc9lrhAoJkJZDPv7s7w+WQ
         8zXQk+c68bK8mOtySilP/VtcmjLwIb9yotOgcGL4ZP/TCvLjQh3icS3fB8a7Bjybmmja
         XnRHpWKYhusXdZ7e3Q/BM8VRpXQ7R/8XzIvkI/5bi2vcnQDjNkn+tJLLtPF7OSkeunWh
         kqzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=gYge3JpLCAszNSWZKrrE6al9e3ChMpf2vAek9PkFKjE=;
        b=zXFRykEZ226+0zzhPxm7Nbsg9y7piVUORkWJfLqkrLbVnvhitDc2Ca1Q4tmv4iyEy6
         5K7v5Ekrm9dIFrAO7ou2FINxmzfU92VUeNN8nADEyZkBAIi4fl+CVXVAlH+3Pciw9luL
         GSi6byKYSCKqw3signiyNNl1iGbBiuO8btIV2KyqoWgFcYYyTN1QLpGgXHEfCXxclzTM
         kf3CpRsC/btl/dfbGOQhmTHNLoeyl6nIMNkPEaVZSlVHo++W7AnaXLzGKdK2VqpbAMxX
         hgWqfAZp1RLPSv0yqPcHC8r2ym+x+08FNiy3Pay3WoZMCIllOp2X9GJo+FujEKURuG1a
         9cAg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=D6lyjo2E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j95-v6si5036732qte.235.2018.11.02.07.57.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 02 Nov 2018 07:57:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=D6lyjo2E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52041 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gIatN-0004Iy-7S
	for alex.bennee@linaro.org; Fri, 02 Nov 2018 10:57:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56709)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gIaqX-0002Fm-9D
	for qemu-arm@nongnu.org; Fri, 02 Nov 2018 10:54:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gIaqV-0003IU-R2
	for qemu-arm@nongnu.org; Fri, 02 Nov 2018 10:54:49 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:32803)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gIaqV-0003G4-En
	for qemu-arm@nongnu.org; Fri, 02 Nov 2018 10:54:47 -0400
Received: by mail-wr1-x441.google.com with SMTP id u1-v6so2301300wrn.0
	for <qemu-arm@nongnu.org>; Fri, 02 Nov 2018 07:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=gYge3JpLCAszNSWZKrrE6al9e3ChMpf2vAek9PkFKjE=;
	b=D6lyjo2EhDFZR6R+dExJAJ+tCB5dzPbRemOKLpQDlUaMxddUG0naBZbF8mtGwkHJuZ
	G6UzQSK29PC2ltfakMN+8rNCDM4RnpGgpJZvWQdyN/wBJjgWts6SBM1eqyCHr4HJEEwV
	DTxHcBaPZAz1zei/oSgzagiTTsX/VGwESR+ic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=gYge3JpLCAszNSWZKrrE6al9e3ChMpf2vAek9PkFKjE=;
	b=LvFWxA2pKa9cnw2EG9TCPAEgC8tMNNYMoJZih1uzrRX8OJ4QiEPNeuCx6W0vO9Oki6
	a30/TTG5oyv7XYUuQOwcM5p6bQhIzzURNllYbOzY2XzbxsWV0r5bPcDRNdgTS++bKV92
	m08S9VvPW+ALzf2i9VAmWWQY5Bi8FPZAXLxvAxDj0BFowMBsBZ1IAXDNqVqhK8DzITrD
	NGBkwhk35ZqmoJrJQbWBQS6Zb4zqKQlWw9Qw6qPLos/myxzgJIXOKZ3lsZR+Fg8Sdbf/
	CIHgyNMlHieSWfsYV71ASm5xP1idXeu4vnfDwllaQS9Yeqo8TUUkubzj1GUGX2icnspN
	vKrw==
X-Gm-Message-State: AGRZ1gK2s5cyCfuOv0rqEecUa4wK2iMIieVNgG/cl6PMt6DmLFtY9Nt8
	pOwJHwwrccQMtYpk2glmKsr+3FoU37k=
X-Received: by 2002:adf:fdc8:: with SMTP id
	i8-v6mr11143944wrs.276.1541170483105; 
	Fri, 02 Nov 2018 07:54:43 -0700 (PDT)
Received: from cloudburst.Home ([2a02:c7f:504f:6300:a3de:88d8:75ae:bf4c])
	by smtp.gmail.com with ESMTPSA id
	l5-v6sm10698454wrv.84.2018.11.02.07.54.42
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 02 Nov 2018 07:54:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri,  2 Nov 2018 14:54:33 +0000
Message-Id: <20181102145433.4553-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181102145433.4553-1-richard.henderson@linaro.org>
References: <20181102145433.4553-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::441
Subject: [Qemu-arm] [PATCH v2 5/5] target/arm: Convert t32ee from feature
 bit to isar3 test
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
X-TUID: j3p6KtQbJp0T

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h     | 6 +++++-
 linux-user/elfload.c | 2 +-
 target/arm/cpu.c     | 4 ----
 target/arm/helper.c  | 2 +-
 target/arm/kvm32.c   | 3 ---
 target/arm/machine.c | 3 +--
 6 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 8e6779936e..895f9909d8 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1575,7 +1575,6 @@ enum arm_features {
     ARM_FEATURE_NEON,
     ARM_FEATURE_M, /* Microcontroller profile.  */
     ARM_FEATURE_OMAPCP, /* OMAP specific CP15 ops handling.  */
-    ARM_FEATURE_THUMB2EE,
     ARM_FEATURE_V7MP,    /* v7 Multiprocessing Extensions */
     ARM_FEATURE_V7VE, /* v7 Virtualization Extensions (non-EL2 parts) */
     ARM_FEATURE_V4T,
@@ -3172,6 +3171,11 @@ static inline bool isar_feature_jazelle(const ARMISARegisters *id)
     return FIELD_EX32(id->id_isar1, ID_ISAR1, JAZELLE) != 0;
 }
 
+static inline bool isar_feature_t32ee(const ARMISARegisters *id)
+{
+    return FIELD_EX32(id->id_isar3, ID_ISAR3, T32EE) != 0;
+}
+
 static inline bool isar_feature_aa32_aes(const ARMISARegisters *id)
 {
     return FIELD_EX32(id->id_isar5, ID_ISAR5, AES) != 0;
diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 5bccd2e243..a3503c83c9 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -466,7 +466,7 @@ static uint32_t get_elf_hwcap(void)
     GET_FEATURE(ARM_FEATURE_V5, ARM_HWCAP_ARM_EDSP);
     GET_FEATURE(ARM_FEATURE_VFP, ARM_HWCAP_ARM_VFP);
     GET_FEATURE(ARM_FEATURE_IWMMXT, ARM_HWCAP_ARM_IWMMXT);
-    GET_FEATURE(ARM_FEATURE_THUMB2EE, ARM_HWCAP_ARM_THUMBEE);
+    GET_FEATURE_ID(t32ee, ARM_HWCAP_ARM_THUMBEE);
     GET_FEATURE(ARM_FEATURE_NEON, ARM_HWCAP_ARM_NEON);
     GET_FEATURE(ARM_FEATURE_VFP3, ARM_HWCAP_ARM_VFPv3);
     GET_FEATURE(ARM_FEATURE_V6K, ARM_HWCAP_ARM_TLS);
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 8f16e96b6c..e08a2d2d79 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1440,7 +1440,6 @@ static void cortex_a8_initfn(Object *obj)
     set_feature(&cpu->env, ARM_FEATURE_V7);
     set_feature(&cpu->env, ARM_FEATURE_VFP3);
     set_feature(&cpu->env, ARM_FEATURE_NEON);
-    set_feature(&cpu->env, ARM_FEATURE_THUMB2EE);
     set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
     set_feature(&cpu->env, ARM_FEATURE_EL3);
     cpu->midr = 0x410fc080;
@@ -1509,7 +1508,6 @@ static void cortex_a9_initfn(Object *obj)
     set_feature(&cpu->env, ARM_FEATURE_VFP3);
     set_feature(&cpu->env, ARM_FEATURE_VFP_FP16);
     set_feature(&cpu->env, ARM_FEATURE_NEON);
-    set_feature(&cpu->env, ARM_FEATURE_THUMB2EE);
     set_feature(&cpu->env, ARM_FEATURE_EL3);
     /* Note that A9 supports the MP extensions even for
      * A9UP and single-core A9MP (which are both different
@@ -1572,7 +1570,6 @@ static void cortex_a7_initfn(Object *obj)
     set_feature(&cpu->env, ARM_FEATURE_V7VE);
     set_feature(&cpu->env, ARM_FEATURE_VFP4);
     set_feature(&cpu->env, ARM_FEATURE_NEON);
-    set_feature(&cpu->env, ARM_FEATURE_THUMB2EE);
     set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
     set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
     set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
@@ -1618,7 +1615,6 @@ static void cortex_a15_initfn(Object *obj)
     set_feature(&cpu->env, ARM_FEATURE_V7VE);
     set_feature(&cpu->env, ARM_FEATURE_VFP4);
     set_feature(&cpu->env, ARM_FEATURE_NEON);
-    set_feature(&cpu->env, ARM_FEATURE_THUMB2EE);
     set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
     set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
     set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 0ea95b0815..bea4d5350d 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5455,7 +5455,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         define_arm_cp_regs(cpu, vmsa_pmsa_cp_reginfo);
         define_arm_cp_regs(cpu, vmsa_cp_reginfo);
     }
-    if (arm_feature(env, ARM_FEATURE_THUMB2EE)) {
+    if (cpu_isar_feature(t32ee, cpu)) {
         define_arm_cp_regs(cpu, t2ee_cp_reginfo);
     }
     if (arm_feature(env, ARM_FEATURE_GENERIC_TIMER)) {
diff --git a/target/arm/kvm32.c b/target/arm/kvm32.c
index 9ededa3c73..8b2c9b3075 100644
--- a/target/arm/kvm32.c
+++ b/target/arm/kvm32.c
@@ -115,9 +115,6 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
     set_feature(&features, ARM_FEATURE_VFP3);
     set_feature(&features, ARM_FEATURE_GENERIC_TIMER);
 
-    if (extract32(id_pfr0, 12, 4) == 1) {
-        set_feature(&features, ARM_FEATURE_THUMB2EE);
-    }
     if (extract32(ahcf->isar.mvfr1, 20, 4) == 1) {
         set_feature(&features, ARM_FEATURE_VFP_FP16);
     }
diff --git a/target/arm/machine.c b/target/arm/machine.c
index 239fe4e84d..07f904709a 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -321,9 +321,8 @@ static const VMStateDescription vmstate_m = {
 static bool thumb2ee_needed(void *opaque)
 {
     ARMCPU *cpu = opaque;
-    CPUARMState *env = &cpu->env;
 
-    return arm_feature(env, ARM_FEATURE_THUMB2EE);
+    return cpu_isar_feature(t32ee, cpu);
 }
 
 static const VMStateDescription vmstate_thumb2ee = {
-- 
2.17.2

