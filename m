Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp450407wrw;
        Thu, 8 Nov 2018 10:02:11 -0800 (PST)
X-Google-Smtp-Source: AJdET5cRx2jtb40QS9FGGJupwODOKl0bHGrIE9jILV180jKNn36fxptP09EQh7afTPvne/TyYGlP
X-Received: by 2002:a0c:87b7:: with SMTP id 52mr5514972qvj.8.1541700131382;
        Thu, 08 Nov 2018 10:02:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541700131; cv=none;
        d=google.com; s=arc-20160816;
        b=T6icAdEray1ZnJgEvuKa2cK21wcaQqv468UUMkcgSq68bFLU5+8ZhYxTFHnBiEW8s8
         0HXs4e80gzM7VJSIpiAixaK1QZEKYpNVszKsAf6trVugwYqCfZt36EjcNzyiFqs/c4+6
         S5DHom2lfqC9+uwHYfeP33Qzuq3YZgf/Q595aMdCiVnXz+YPi0P/3v3SsEx8naWahRuQ
         G1PU37BuBjYqMiNSoLewdq8dso0AzZzPnRhP+Vs1eUvavu7tLJcuziJ4f6NXapm3Ua5l
         Muu/q5vUIaZg3htQi9lnkPhEGy4z69WI2l+2xWOvArxJoUwcoELg3GMHuGsaGP/fu7qs
         8Mbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=zlFdkBkZo5nt5LFadOS5kmImPmiLZuKCuNQcIkYLDuU=;
        b=egW08P6IqXsfgAzXVKuOrBHOgQYgD9fqjxMCNcZy7GnZcD7lXtWDF0Id+etOJ8p9vI
         ZEiPxiePB8YPYkhCQHyTsXMe4drh5Xpmyz6zTHAOU27E4G4W/hB0npkkIdvkAPNsf9NH
         zfi1LbctZq9UTK+7Ir07bIQ2ytWrayRPqPd5yvoQ2Sn/JdrFhtmckHG5u8U++pPicuBT
         7dLjifplrzNQILnAF/SlwB8VWllN8sieQ8sam+ocVX7m0LjphCiUGpOz8XL7GhLll9o7
         VSgjiBnIkH0RkJL8Sq/RIPsxfrLjrGB/TtyDtHhbTeW6dAzXzwCx4KHRnjbLQ9U3gD1T
         V+9w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iKmxGaMW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c55si3755490qta.170.2018.11.08.10.02.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 08 Nov 2018 10:02:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iKmxGaMW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58377 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gKod8-0008Pt-U0
	for alex.bennee@linaro.org; Thu, 08 Nov 2018 13:02:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39587)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gKoWA-0001cY-Dz
	for qemu-arm@nongnu.org; Thu, 08 Nov 2018 12:54:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gKoW8-0008Df-9o
	for qemu-arm@nongnu.org; Thu, 08 Nov 2018 12:54:58 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:34551)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gKoW7-0008Cg-U3
	for qemu-arm@nongnu.org; Thu, 08 Nov 2018 12:54:56 -0500
Received: by mail-wm1-x342.google.com with SMTP id f1-v6so2075018wmg.1
	for <qemu-arm@nongnu.org>; Thu, 08 Nov 2018 09:54:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=zlFdkBkZo5nt5LFadOS5kmImPmiLZuKCuNQcIkYLDuU=;
	b=iKmxGaMW4tihGC/qQdP4MkkPVOeTV3lkT+LEx6VeHFTUeNlVXS821ei5djZx+OAh9X
	GGMv2/6LEyFZiAa/xrwwD2/C0bKBvMmJcNIIfMITE/frD1lrZL2TPw1ha5uMubU/ZJd3
	syD7pbaYkRKxkP2j8fs55pyrTBEhuvxNOsAoE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=zlFdkBkZo5nt5LFadOS5kmImPmiLZuKCuNQcIkYLDuU=;
	b=hUIpX9AIJh8ESju00tJXztI7XCSvxbZXktnwlrwmcJnCN/BouBoJkebmjIYIR/7fib
	pwXcDLZ/3gnR1J4Gjv5Ji0jh041ErBnbovi1jZ3wAx9VFMpLtzDJbzryrsx/co5sytH1
	2iEvszFPkb5UCQAC0zCdXCjFcFGvXAO9BSeHH3MAvdTY24h9BAxlA85hnyNIeEN8qWPI
	GiPDUaMQxw2UxYFdRCOzQQblTwT0pB3hKzgvv3xUQ5Xh/QPXlGHjBnygrSmJ8tsm5fjt
	BK50TGBIHhz/umk96Js27WEJWnqYP9jkYvckb1DP3dEoJpudNMorKBNgKlvbG5wHttcd
	Hd7w==
X-Gm-Message-State: AGRZ1gL6bTqd1FJWmbAZCYnepUQQm1/C/laBD5bgGruRvHjqHLa1KIdQ
	8LFCJ/06wYlaH6yAFaRrWHyA6g==
X-Received: by 2002:a1c:5885:: with SMTP id
	m127-v6mr2005469wmb.118.1541699694705; 
	Thu, 08 Nov 2018 09:54:54 -0800 (PST)
Received: from cloudburst.twiddle.net
	(70.red-2-141-114.dynamicip.rima-tde.net. [2.141.114.70])
	by smtp.gmail.com with ESMTPSA id
	l42-v6sm4411384wre.37.2018.11.08.09.54.53
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 08 Nov 2018 09:54:54 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu,  8 Nov 2018 18:52:46 +0100
Message-Id: <20181108175246.13416-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181108175246.13416-1-richard.henderson@linaro.org>
References: <20181108175246.13416-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::342
Subject: [Qemu-arm] [PATCH v3 5/5] target/arm: Convert t32ee from feature
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
X-TUID: rHVXsBczZIdp

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
index b5eff79f73..5c2c77c31d 100644
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
index 784a4c2dfc..d4dc0bc225 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1451,7 +1451,6 @@ static void cortex_a8_initfn(Object *obj)
     set_feature(&cpu->env, ARM_FEATURE_V7);
     set_feature(&cpu->env, ARM_FEATURE_VFP3);
     set_feature(&cpu->env, ARM_FEATURE_NEON);
-    set_feature(&cpu->env, ARM_FEATURE_THUMB2EE);
     set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
     set_feature(&cpu->env, ARM_FEATURE_EL3);
     cpu->midr = 0x410fc080;
@@ -1520,7 +1519,6 @@ static void cortex_a9_initfn(Object *obj)
     set_feature(&cpu->env, ARM_FEATURE_VFP3);
     set_feature(&cpu->env, ARM_FEATURE_VFP_FP16);
     set_feature(&cpu->env, ARM_FEATURE_NEON);
-    set_feature(&cpu->env, ARM_FEATURE_THUMB2EE);
     set_feature(&cpu->env, ARM_FEATURE_EL3);
     /* Note that A9 supports the MP extensions even for
      * A9UP and single-core A9MP (which are both different
@@ -1583,7 +1581,6 @@ static void cortex_a7_initfn(Object *obj)
     set_feature(&cpu->env, ARM_FEATURE_V7VE);
     set_feature(&cpu->env, ARM_FEATURE_VFP4);
     set_feature(&cpu->env, ARM_FEATURE_NEON);
-    set_feature(&cpu->env, ARM_FEATURE_THUMB2EE);
     set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
     set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
     set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
@@ -1629,7 +1626,6 @@ static void cortex_a15_initfn(Object *obj)
     set_feature(&cpu->env, ARM_FEATURE_V7VE);
     set_feature(&cpu->env, ARM_FEATURE_VFP4);
     set_feature(&cpu->env, ARM_FEATURE_NEON);
-    set_feature(&cpu->env, ARM_FEATURE_THUMB2EE);
     set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
     set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
     set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 96301930cc..e28770833a 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5457,7 +5457,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
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

