Received: by 2002:a05:6512:2248:0:0:0:0 with SMTP id i8csp464479lfu;
        Sat, 30 Apr 2022 22:50:34 -0700 (PDT)
X-Received: by 2002:a17:902:f549:b0:15e:60a0:c6d1 with SMTP id h9-20020a170902f54900b0015e60a0c6d1mr6530800plf.134.1651384234544;
        Sat, 30 Apr 2022 22:50:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651384234; cv=none;
        d=google.com; s=arc-20160816;
        b=bqtHI+FiwtKBJFlvHblufELDjr9RUUSE5MwW90q6PEBY9KXAUui9rZ5rn5I4qm9sKz
         YMzL/CwfDQzqCJ+QUktMMxsE8QzyNnUnF9JsNkV6sVj6INjTHlt3e31hAmToykVZggKq
         O5nM5513zeN10nAkmOVBBiJT4/KRkKytO5TxanAN95Qq7RlqeH/TAyGUv7WUikjG3/5R
         XrpU0bwx4BT/bH6K2enqtJd9MxVB3bLrF6iqwabDaAcW+IXKlkl3jaOxev1tdHwXI0SP
         p6fEdHGkf4nh2DrXdc8IQOKtxSHAp2sfpFzacsvcBG13GK6WYzApmTWyL6MknLYuH/fF
         pWyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Iax7WDyltN6Kt3t+wmKMWbwwcMdu+ckfkULh3ecB8vc=;
        b=azCtNoGtB+CMiFuwq8HGwzr41e2Mz0/mlK/dlg4AqkzqbigCOfoFaP26gUKarA9Rmf
         n1XZztDDbL97GMSMk8Yw07jPH+GmmkaC/MMyjzaxMwpTRvh2qcWXmdaIs+sFT3kylb4E
         gXYj/qSOLD/O0W181eCiN4Lt9ucNoDzPKwPDC5mmgjkYoB46m5Gbi1gV6ThUv6luoE6O
         gejHHRb0SB5dg5+TF5oKS+7vdR7v/o7493QyQhRF31zOQ77gZCnr273gCcVQD1DppiWb
         PRSfwLSGsd4ddNRyLmXA5Y2/ljYTsE5PomaPpvyCYKjPHdS/5Y67cuWGVRmJNdM8s6ky
         Wqug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Yrtapjsu;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id s35-20020a056a001c6300b00508dc668585sor5776886pfw.101.2022.04.30.22.50.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 30 Apr 2022 22:50:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Yrtapjsu;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Iax7WDyltN6Kt3t+wmKMWbwwcMdu+ckfkULh3ecB8vc=;
        b=YrtapjsuJeas+ekHLlJWwJINwFiVI15EUFWgNMzabGC+yHM4oIKKc4hjDK6BL8Lpjl
         sWLzntig6CCRKwjyZrhWkNUmF5vfAaTsvE5qCjC/1lc39FNET8k+lqmwnARvCw4ULcau
         ueYW6vk1GOCkV4tjBijkSl/tJWwT9kjzniWv1HA04KaGYu/fov5/gFpqPSmtqbrE8hnA
         kH4/SziGeggoyFKKUWS0Rkb8Ge4TFsDsZ4DvY4N73xrJiTCfBbDaNi0LeFRG2CsMbTE5
         DKEc0EaNOG5/eZe7cKKzX7UyUAD9AiFrdlpD5LCRqYNn6v2K48NKpsKDnSE8TqEAbCXD
         ebOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Iax7WDyltN6Kt3t+wmKMWbwwcMdu+ckfkULh3ecB8vc=;
        b=KFAQUk/rBA/jLdOLI2BFgDvpsLc2rRvx/4vQYSAf0xzjbF0QbOek/gJM1FLm6u4mQx
         x4PWutDPawwtoaEttCnpLTHP/AgJyQAcmXe5YEk26+Y4zAFA0V6jQNoI22j+5wm/1zPP
         IXZ76/3Zpl0sfiOv0HBlhVhW0xsjaHoWCIpBWCl7a3Hh48IPQ349ba/t1aHQJ6yEj5md
         phoBrojyJuIOuAhKBxFYbMSBnHUxQqimaNcw64rp1ZBL3qGcsYLys7TyjAkEh/dggDw9
         gn/oqwN+dYIfHfb4azyeRPDr6jmdxJ3jiu5n9a0MT10sXNZb6zm2ytoy1qbnrSVlfUnO
         Fkqg==
X-Gm-Message-State: AOAM531P7X1ixgCOAJM6rIzWciUSUy1x9dSPPQuxFzFtQa5JsRpPSKsp
	0XogQ+99N0kg+BPeIxUPHzbZh/Gm
X-Google-Smtp-Source: ABdhPJz0o/2t9nSylklg/pKgLMeS5fWHKXn8SiAyJzfxYUg4AhDKFnA4birVYKGOp7/fyExJInF36w==
X-Received: by 2002:aa7:9852:0:b0:50d:6d10:2094 with SMTP id n18-20020aa79852000000b0050d6d102094mr6014190pfq.4.1651384234090;
        Sat, 30 Apr 2022 22:50:34 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. ([71.212.142.129])
        by smtp.gmail.com with ESMTPSA id cm18-20020a17090afa1200b001cd8e9ea22asm17310342pjb.52.2022.04.30.22.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Apr 2022 22:50:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v4 04/45] target/arm: Make some more cpreg data static const
Date: Sat, 30 Apr 2022 22:49:46 -0700
Message-Id: <20220501055028.646596-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220501055028.646596-1-richard.henderson@linaro.org>
References: <20220501055028.646596-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: DihlBWKwz4EU

These particular data structures are not modified at runtime.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index a68f14fe8e..ca6ba9bd82 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7860,7 +7860,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .resetvalue = cpu->pmceid1 },
         };
 #ifdef CONFIG_USER_ONLY
-        ARMCPRegUserSpaceInfo v8_user_idregs[] = {
+        static const ARMCPRegUserSpaceInfo v8_user_idregs[] = {
             { .name = "ID_AA64PFR0_EL1",
               .exported_bits = 0x000f000f00ff0000,
               .fixed_bits    = 0x0000000000000011 },
@@ -8000,7 +8000,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
      */
     if (arm_feature(env, ARM_FEATURE_EL3)) {
         if (arm_feature(env, ARM_FEATURE_AARCH64)) {
-            ARMCPRegInfo nsacr = {
+            static const ARMCPRegInfo nsacr = {
                 .name = "NSACR", .type = ARM_CP_CONST,
                 .cp = 15, .opc1 = 0, .crn = 1, .crm = 1, .opc2 = 2,
                 .access = PL1_RW, .accessfn = nsacr_access,
@@ -8008,7 +8008,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
             };
             define_one_arm_cp_reg(cpu, &nsacr);
         } else {
-            ARMCPRegInfo nsacr = {
+            static const ARMCPRegInfo nsacr = {
                 .name = "NSACR",
                 .cp = 15, .opc1 = 0, .crn = 1, .crm = 1, .opc2 = 2,
                 .access = PL3_RW | PL1_R,
@@ -8019,7 +8019,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         }
     } else {
         if (arm_feature(env, ARM_FEATURE_V8)) {
-            ARMCPRegInfo nsacr = {
+            static const ARMCPRegInfo nsacr = {
                 .name = "NSACR", .type = ARM_CP_CONST,
                 .cp = 15, .opc1 = 0, .crn = 1, .crm = 1, .opc2 = 2,
                 .access = PL1_R,
@@ -8172,13 +8172,13 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .access = PL1_R, .type = ARM_CP_CONST,
               .resetvalue = cpu->pmsav7_dregion << 8
         };
-        ARMCPRegInfo crn0_wi_reginfo = {
+        static const ARMCPRegInfo crn0_wi_reginfo = {
             .name = "CRN0_WI", .cp = 15, .crn = 0, .crm = CP_ANY,
             .opc1 = CP_ANY, .opc2 = CP_ANY, .access = PL1_W,
             .type = ARM_CP_NOP | ARM_CP_OVERRIDE
         };
 #ifdef CONFIG_USER_ONLY
-        ARMCPRegUserSpaceInfo id_v8_user_midr_cp_reginfo[] = {
+        static const ARMCPRegUserSpaceInfo id_v8_user_midr_cp_reginfo[] = {
             { .name = "MIDR_EL1",
               .exported_bits = 0x00000000ffffffff },
             { .name = "REVIDR_EL1"                },
@@ -8223,7 +8223,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .access = PL1_R, .readfn = mpidr_read, .type = ARM_CP_NO_RAW },
         };
 #ifdef CONFIG_USER_ONLY
-        ARMCPRegUserSpaceInfo mpidr_user_cp_reginfo[] = {
+        static const ARMCPRegUserSpaceInfo mpidr_user_cp_reginfo[] = {
             { .name = "MPIDR_EL1",
               .fixed_bits = 0x0000000080000000 },
         };
@@ -8302,7 +8302,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
     }
 
     if (arm_feature(env, ARM_FEATURE_VBAR)) {
-        ARMCPRegInfo vbar_cp_reginfo[] = {
+        static const ARMCPRegInfo vbar_cp_reginfo[] = {
             { .name = "VBAR", .state = ARM_CP_STATE_BOTH,
               .opc0 = 3, .crn = 12, .crm = 0, .opc1 = 0, .opc2 = 0,
               .access = PL1_RW, .writefn = vbar_write,
-- 
2.34.1
