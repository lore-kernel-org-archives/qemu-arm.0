Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp5087056njd;
        Fri, 4 Apr 2025 15:36:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVlYTG1FuNb48qJKLCja/PJpy4WI4x6VfoGmUX/OnRxbX/oowOf+BaYQONmF8+c/2y/WSuivSCAI+ldVA==@linaro.org
X-Received: by 2002:a05:600c:1ca4:b0:43c:fcbc:968c with SMTP id 5b1f17b1804b1-43ecf842872mr40701065e9.7.1743806168207;
        Fri, 04 Apr 2025 15:36:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743806168; cv=none;
        d=google.com; s=arc-20240605;
        b=P++X1m5OBz5M/V7u+P/f34/ZHg5Ac4AwG3BnaoEg80+q0U9qxxXXqUb5lVs3UEueT1
         WvEJzQVzK5IfRvY9TEzu3khpKgveT0cn+vHzEAyhvkxjRETKw3KlhqVD8es41WriSJut
         Pa+BILIrw1GAy1YICDjX301bJYLKld8XulDF5nvNCVzYfEI+YUaj+Em1A+04QItNOvv3
         UkCSFcnYeu0aU8X9SqDZMWf1i+SYh0MF77ARJz9bMaYu/ztyRJhaBQn7QDOZ7L0WTBLO
         iKnbiH0xCQ4zzhu3Thn9OargdOstTA7um1dFubcBAAlBR0PuVgFaEv+K7S+C6Zg9/mus
         fFWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=XWF7rdm9ZKpOTMOhQjFoDhQRH+RhkK3qjttuQ8CqxOQ=;
        fh=PEN5QsIqeYO7+0zXjaB+HOzq7elEf+Y2w2L98UgCB4s=;
        b=c6kkuLcvq/Y+rDNY2qnina3rW5EOej9SsXBsUkOBT4Xvd1JkUjro7LbzwMaFuvAki9
         uABlYHCcFimzCayAoin4YJPk32vmJWGDTsvF5ecJPmzQPBbvc1KNya93mF9pbYEJaklq
         OwZUeBgeRYdDsszIOwLyt81kPpxys1o+hqap8Q+Gc0l99Cae0+Ihs9yMxcuR7kOKHgTE
         a/RIzUJTgoMjCQwMnDoNbwZp5W9rWmXlrx/Syy8dcGo4s/5Emp/44F2Pnb8/dfWu4BcG
         HIytO+uvqY0zOP2ctaLcHCoHzFV0dxOzX+GaY4UWhTMgycde067QeH90KAtegeaYbqk4
         yaww==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lkFmZXcV;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-43ec2733c1asor23286835e9.2.2025.04.04.15.36.08
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 04 Apr 2025 15:36:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lkFmZXcV;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743806168; x=1744410968; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XWF7rdm9ZKpOTMOhQjFoDhQRH+RhkK3qjttuQ8CqxOQ=;
        b=lkFmZXcVnRaOrdnFBimDJcXFaFs1b5lr67TAXc77JHUkpx5UBBdn6L4BbIIlSsFLBZ
         fn4LE2FoISg8mBRpj+DT3L7zubY1IEM2tT0cTTyGQYAISRhMN6EjBkyLLtKDxWI4xlLq
         6xwSe/1aiK896gNYWb7ix/mmljNueMQdRHokVe3Kys0n5iPeNbn1Zd6t8TciyX90pkAX
         V8/WFAPc2urjxv6bN9+eLIHlRxiE+Eia/D8xF+sWv1tYcIET1jqNP/5xrAmSDPKZScQt
         GDa8ezy22vgG9vdCzy4+hEMiWPkIcASFAo/OvRbIoKjF44jxoytYDaZJtmrnID4inKPq
         XM5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743806168; x=1744410968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XWF7rdm9ZKpOTMOhQjFoDhQRH+RhkK3qjttuQ8CqxOQ=;
        b=SJZQ1oaj7jb7TxK2xY6nYlf1Z0OZOp6cuJjg8vT+GoXcK1KIqSm3NK2ripwn42b+0B
         sqXK8kKO77lUVmbQ2IxnpUGOuUa07Vrb40Tfb+hpD60m9MeJ6lB22PHEayFUcNHJlas6
         tyF6M+IXPkTFgm/jnsJ2YMYO1GWRMWLbxqtYftQYA0Ax2boE0jB9p948EOD50Ww+1w/n
         +hwO85q4dQU0Z143f1DkHs1k+tsN/uwIntfcziUVYpSK4h6gWGZdl2oVd2zbGCeoKAjE
         ne2Xe+GKUi+BsdE0tcqWTGc1C18UueUS8mA2aayrCRx1mGyrhZvg08fxaBvNE8rVg2E+
         Sq9w==
X-Forwarded-Encrypted: i=1; AJvYcCWxOMGCCY4iwUIGCDPLdYOujLX+0nqtkfH8DXuFdgD6C3WgzQvY+uRKnbw1yC7RVpDieMToZxtCWLL9HA==@linaro.org
X-Gm-Message-State: AOJu0YxhD3KTcKtxZzzcdfLgmknxXGqN1yDW6emEhYuH3yUSNFRs8Yo3
	uyVAKCbQ96SJymsyhwO0t7hTXITm/nSvXSwv1dzZcKDzIzxcRkhXoBeXp8CPPCiM0A==
X-Gm-Gg: ASbGncvU8MRz2+lli91FN/2BfreWA3ZvaXPn10mcNfAlAQb4giB22VAeyWmgbFHGyPz
	nWTAy9u0x0cJCawr+hgJhzxGagg42Vu8+KfFabEK1EnXjPOyj+r5ENt1pE6Nvw8wwLVvBLw4TpZ
	0JHkjUsR2VShjJPaqWnEK8meltLYkabosIWLLTLV84FJMstI7zWLEN03mulFJOnQDWmddDQK1Qy
	6gcwNk58NAZJ+lyRG39/Dx+a2/xYvWvEaAMrsuvb2rNMIzxXMwbiYtG53iWRnDhewBaZkrlJXMs
	KAcllEn/BOY/V9KCCtlH2ajwNJMa+p/V9msXo4B9mrVdK2TVXEsFunVgC22+IDl0oLyIdCyMyDw
	PyiEklXRyceB3CW6ihVD0Px/S
X-Google-Smtp-Source: AGHT+IEJDeuVCQqd5+26e5u+Xkja1NbGYrALPQ3A0LUnM6TxcRo2jV+hsTPIJ/bYCN4WFg+E5YYW/g==
X-Received: by 2002:a5d:5983:0:b0:390:e9b5:d69c with SMTP id ffacd0b85a97d-39cba93bc86mr4406816f8f.25.1743806167717;
        Fri, 04 Apr 2025 15:36:07 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c300968a1sm5446597f8f.11.2025.04.04.15.36.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 04 Apr 2025 15:36:07 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Gustavo Romero <gustavo.romero@linaro.org>,
	Laurent Vivier <laurent@vivier.eu>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-10.1 9/9] target/arm: Build Aarch64 gdbstub helpers indistinctly
Date: Sat,  5 Apr 2025 00:35:21 +0200
Message-ID: <20250404223521.38781-10-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250404223521.38781-1-philmd@linaro.org>
References: <20250404223521.38781-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: sDyUCatzvXNP

The Aarch64 gdbstub code is guarded by checks on ARM_FEATURE_AARCH64
and isar_feature_aa64_sve(), only enabled for Aarch64 CPUs.
Remove TARGET_AARCH64 #ifdef'ry and build gdbstub64.c once.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/internals.h | 2 +-
 target/arm/gdbstub.c   | 4 ----
 target/arm/meson.build | 2 +-
 3 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 5e549b95e14..5fd2631e8e2 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1682,7 +1682,6 @@ static inline uint64_t pmu_counter_mask(CPUARMState *env)
   return (1ULL << 31) | ((1ULL << pmu_num_counters(env)) - 1);
 }
 
-#ifdef TARGET_AARCH64
 GDBFeature *arm_gen_dynamic_svereg_feature(CPUState *cpu, int base_reg);
 int aarch64_gdb_get_sve_reg(CPUState *cs, GByteArray *buf, int reg);
 int aarch64_gdb_set_sve_reg(CPUState *cs, uint8_t *buf, int reg);
@@ -1692,6 +1691,7 @@ int aarch64_gdb_get_pauth_reg(CPUState *cs, GByteArray *buf, int reg);
 int aarch64_gdb_set_pauth_reg(CPUState *cs, uint8_t *buf, int reg);
 int aarch64_gdb_get_tag_ctl_reg(CPUState *cs, GByteArray *buf, int reg);
 int aarch64_gdb_set_tag_ctl_reg(CPUState *cs, uint8_t *buf, int reg);
+#ifdef TARGET_AARCH64
 void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp);
 void arm_cpu_sme_finalize(ARMCPU *cpu, Error **errp);
 void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp);
diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index 30068c22627..e76142e8ddb 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -482,10 +482,8 @@ void arm_cpu_register_gdb_commands(ARMCPU *cpu)
     g_autoptr(GString) qsupported_features = g_string_new(NULL);
 
     if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
-    #ifdef TARGET_AARCH64
         aarch64_cpu_register_gdb_commands(cpu, qsupported_features, query_table,
                                           set_table);
-    #endif
     }
 
     /* Set arch-specific handlers for 'q' commands. */
@@ -514,7 +512,6 @@ void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu)
          * The lower part of each SVE register aliases to the FPU
          * registers so we don't need to include both.
          */
-#ifdef TARGET_AARCH64
         if (isar_feature_aa64_sve(&cpu->isar)) {
             GDBFeature *feature = arm_gen_dynamic_svereg_feature(cs, cs->gdb_num_regs);
             gdb_register_coprocessor(cs, aarch64_gdb_get_sve_reg,
@@ -546,7 +543,6 @@ void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu)
                                      gdb_find_static_feature("aarch64-mte.xml"),
                                      0);
         }
-#endif
 #endif
     } else {
         if (arm_feature(env, ARM_FEATURE_NEON)) {
diff --git a/target/arm/meson.build b/target/arm/meson.build
index 3065081d241..503d106b588 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -3,6 +3,7 @@ arm_ss.add(files(
   'cpu.c',
   'debug_helper.c',
   'gdbstub.c',
+  'gdbstub64.c',
   'helper.c',
   'vfp_fpscr.c',
 ))
@@ -13,7 +14,6 @@ arm_ss.add(when: 'CONFIG_HVF', if_true: files('hyp_gdbstub.c'))
 
 arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
   'cpu64.c',
-  'gdbstub64.c',
 ))
 
 arm_system_ss = ss.source_set()
-- 
2.47.1
