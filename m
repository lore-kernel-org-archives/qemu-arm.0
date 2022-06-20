Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp596987lft;
        Mon, 20 Jun 2022 10:53:45 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vHI1GEf6mn/GCjrrlUzDfoM1PAMHxAw07G0h7jxoZtRq/wJR9nMm3JhzjFOc62te9I4sCw
X-Received: by 2002:a05:620a:24c7:b0:6a7:2d03:2de3 with SMTP id m7-20020a05620a24c700b006a72d032de3mr17747937qkn.134.1655747624778;
        Mon, 20 Jun 2022 10:53:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655747624; cv=none;
        d=google.com; s=arc-20160816;
        b=w4v814Mk61N+0S429Qr1msMXzENPNf0cctyWtUgxWMlXe/dsX4xLNbzbuNzJtko3Bg
         0EYiD849Eeg5XdFNNrIetyPAad8WDI3+AXYTlQN7D+lcF8G4W+mbbRHPMhgPkesqLWka
         yIeE1P69HF79IrnC06oh1qAnTgeQwn/o1z5nuZnHpFgssU60SubyMTy79/HRfvcOzRfZ
         QjRijQ0lR3Hbr6RuGFtf7tDZUlC4clfOt631suhH/JqSjtrWalGe7kfrqJUXtsdH+rNG
         CGQQ0wfgZl/wgTBTwtlZHDTaDfWTY8PERWm7ngrVqvrkMDsbBJqJJtZ4VALea/SvGzWz
         J/zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=viKLoyqhEy5uuARWIFm/MLLiPrBCa2bHnN3PYLnlpNM=;
        b=W+7KTFPYzzOEroO18xPhs2EM3b/udRA1hqWMuaExsDLUJOP26+FVJzk/2UTDiFR4Jf
         ATSk/et7HzeuW148sqjB3TWanocQQPIo5ziU8NwJ2S8oO4DLbQMoo0ag6u1jQ+urwCsl
         pkcYpwrSuNDBtG6fzvAU5vqHtcWw7e2CPS85zgOj6Fz55Os9uppavPazsOKGVA6d1SDQ
         VEIIZRC5sAhHaugmURSG+PSViSZz1BTmTm6gcArkTOTj0KEdUxCOK98dVHVnlGxb6gJr
         xG+9Ou1aXgoMus4IGCH5ePXl7PhGeWRlaBRC/HCyDs41mTUkmVolMVnf8QVchi85AkPg
         kZMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ntM9aoU+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p16-20020a05622a049000b00304e37a41f8si9176131qtx.250.2022.06.20.10.53.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jun 2022 10:53:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ntM9aoU+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o3Laq-0006Ub-4z
	for alex.bennee@linaro.org; Mon, 20 Jun 2022 13:53:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LZp-0005QG-NA
 for qemu-arm@nongnu.org; Mon, 20 Jun 2022 13:52:41 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:41768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LZn-0001KY-9G
 for qemu-arm@nongnu.org; Mon, 20 Jun 2022 13:52:41 -0400
Received: by mail-pf1-x430.google.com with SMTP id i64so10863171pfc.8
 for <qemu-arm@nongnu.org>; Mon, 20 Jun 2022 10:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=viKLoyqhEy5uuARWIFm/MLLiPrBCa2bHnN3PYLnlpNM=;
 b=ntM9aoU+H9gscRilksmOPIALY4nehLFcZnJZ3P2COLMv7IcW7aiFe/5cZbEqE+ESDk
 YPKgSJFgV+ZwSrK93Iv0sVym5zdY/klSfYPTJXC1bWA1fK/RZ3CkfF8FvswZtKa4vpML
 KahqRlT9B0pptatVQ3u8OZr3RovqcRbq5/etbOrdvRRda0PmPRFjPgTFGynaOZboRsdB
 pxDHgAfpb+rteDHSlFRoPOcwdKZzNMOgoAhUNDaAIBjfHxGcNyMnVDFBid/dSLVL9rA6
 yyJqngtoriKtIdkGBwwCSESvVr+cvP/ll5qVeKkOM5eHR7U5rE2IL9I+ih1dItsPynxT
 8Oig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=viKLoyqhEy5uuARWIFm/MLLiPrBCa2bHnN3PYLnlpNM=;
 b=cbf8undK7aAmgbaiDrO4UjUslu5+QKnBxBn42T3TM7StckjhYaaAmEL4CtyQ8bPtjM
 wJErGljCpQKADBR78iWDRazXufV/Kyx1BGbZFwe/QhPKjgcbzKPO97vQ0po83gqBxst9
 waAy84Qqi3a9Nuqjs5Q5a+oV0EtkvLogKRcedNzN6gr0AXETiWDZEGZHNJayF4y81EzT
 ev/VV6jaCScsrcVV2V+IM/7F0UlJHRTLMnG9WcDGfNVjO48sfYmycL6P7qfkO1xnEuOD
 EStjao0yDFAshSnEUDOyIHeA376KB1etyYmTKmMEicixZygkDu/IsJ3HV5+ecmpNtjIQ
 zwTw==
X-Gm-Message-State: AJIora9xFCKB++RaEz6CTcooJo23+mLFW23iooP2nH4lwgKbe3tzyQ2c
 P5bPewrUvZUPaej8ndR9nHLV+w==
X-Received: by 2002:a63:f944:0:b0:3fd:4f29:67e9 with SMTP id
 q4-20020a63f944000000b003fd4f2967e9mr22228777pgk.593.1655747557916; 
 Mon, 20 Jun 2022 10:52:37 -0700 (PDT)
Received: from stoup.. ([2602:47:d49e:3c01:a3e0:8a80:7b85:aea6])
 by smtp.gmail.com with ESMTPSA id
 j14-20020aa7928e000000b00525133f98adsm5138138pfa.146.2022.06.20.10.52.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 10:52:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 01/51] target/arm: Implement TPIDR2_EL0
Date: Mon, 20 Jun 2022 10:51:45 -0700
Message-Id: <20220620175235.60881-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220620175235.60881-1-richard.henderson@linaro.org>
References: <20220620175235.60881-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: idDnxwsebNmT

This register is part of SME, but isn't closely related to the
rest of the extension.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h    |  1 +
 target/arm/helper.c | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index df677b2d5d..05d1e2e8dd 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -474,6 +474,7 @@ typedef struct CPUArchState {
             };
             uint64_t tpidr_el[4];
         };
+        uint64_t tpidr2_el0;
         /* The secure banks of these registers don't map anywhere */
         uint64_t tpidrurw_s;
         uint64_t tpidrprw_s;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 6457e6301c..d21ba7ab83 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6279,6 +6279,35 @@ static const ARMCPRegInfo zcr_reginfo[] = {
       .writefn = zcr_write, .raw_writefn = raw_write },
 };
 
+#ifdef TARGET_AARCH64
+static CPAccessResult access_tpidr2(CPUARMState *env, const ARMCPRegInfo *ri,
+                                    bool isread)
+{
+    int el = arm_current_el(env);
+
+    if (el == 0) {
+        uint64_t sctlr = arm_sctlr(env, el);
+        if (!(sctlr & SCTLR_EnTP2)) {
+            return CP_ACCESS_TRAP;
+        }
+    }
+    /* TODO: FEAT_FGT */
+    if (el < 3
+        && arm_feature(env, ARM_FEATURE_EL3)
+        && !(env->cp15.scr_el3 & SCR_ENTP2)) {
+        return CP_ACCESS_TRAP_EL3;
+    }
+    return CP_ACCESS_OK;
+}
+
+static const ARMCPRegInfo sme_reginfo[] = {
+    { .name = "TPIDR2_EL0", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 3, .crn = 13, .crm = 0, .opc2 = 5,
+      .access = PL0_RW, .accessfn = access_tpidr2,
+      .fieldoffset = offsetof(CPUARMState, cp15.tpidr2_el0) },
+};
+#endif /* TARGET_AARCH64 */
+
 void hw_watchpoint_update(ARMCPU *cpu, int n)
 {
     CPUARMState *env = &cpu->env;
@@ -8440,6 +8469,9 @@ void register_cp_regs_for_features(ARMCPU *cpu)
     }
 
 #ifdef TARGET_AARCH64
+    if (cpu_isar_feature(aa64_sme, cpu)) {
+        define_arm_cp_regs(cpu, sme_reginfo);
+    }
     if (cpu_isar_feature(aa64_pauth, cpu)) {
         define_arm_cp_regs(cpu, pauth_reginfo);
     }
-- 
2.34.1

