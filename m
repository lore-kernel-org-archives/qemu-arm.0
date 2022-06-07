Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp2412885lfb;
        Tue, 7 Jun 2022 13:59:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyASdWNncETj52WTdNZOIZ9pj47BSlsJ6aggRhQrADmZZ/69dkhYhGCYRcAxTN2Rq8+lVE1
X-Received: by 2002:a05:620a:40d4:b0:6a6:5398:ce26 with SMTP id g20-20020a05620a40d400b006a65398ce26mr21163840qko.135.1654635596121;
        Tue, 07 Jun 2022 13:59:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654635596; cv=none;
        d=google.com; s=arc-20160816;
        b=kr3kOUMx6hwGt51xWTLCOuJjHLDLKg7gvVifPfRIJ90w7V8z+V3mUchnab4dzhta1J
         dlToFKd2oDtELkhs7knHO3dkNG+J5i7drVqiYff287/dEWFr24UQrx4J5IOca5Nw0AmM
         nv+ZBVL+P6FkmdiIjZ9kld0DL6u5imHTsdgb2gHtxMaEwfYY3WIL1+AVz5rZbtHyEWWT
         z0aELL9qNXovey5qUN1JZUMk17jdIB3XKcb6hUMNBFmCQFl6GKTV0MOCy/MgM/5qi/lt
         AV19rM8aABVuN4k+O8ELIgjWzZYZi/Y/81Y+0qrCLJedtFvrDT3xO1CEv3fAA8i6egBE
         af1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ZL65kXUjogqHvImAlQL3thwutvuDb7SzFLJksV0LJ4Y=;
        b=RZSh0kAPbilH1oqFOjy3NPIPDIYO7fv2flvKDUcdyKjNczeaRLAOFs9HypHYhwuD6U
         k+k3yT91BBYsf9K9sxZpfrD574dQZd5YLY+Gu/O4pd602UL8prYRU4SiVbjM6lFjT/FD
         DJ665MWs/xD/Sj7QlQJWR9Kk1zS7I/uu9q+MpJbSp7BG2D3cHPIwdPzx07hBRx/yaR1B
         vZtXsaxNBPY5SD6M5eg44SoTqr4IV8sAe+LhMsRe5TLrBWp8Q+nh4Nk4Y4cWB44TnVYb
         Eh8CzFBBUI5aR2bF3JUdjZ7oRpRorXn7dDvq0wTZZ8ORuC+VTeFRDoh7DiiTgtQ3nFEc
         nJnw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oyZCl3Qe;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s14-20020ac85cce000000b00304f1f952bdsi2954144qta.531.2022.06.07.13.59.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jun 2022 13:59:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oyZCl3Qe;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nygIt-0000iy-JH
	for alex.bennee@linaro.org; Tue, 07 Jun 2022 16:59:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyftN-0007wH-Ck
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:33:33 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:33637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyftI-0007L9-3V
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:33:33 -0400
Received: by mail-pf1-x432.google.com with SMTP id w21so16550583pfc.0
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZL65kXUjogqHvImAlQL3thwutvuDb7SzFLJksV0LJ4Y=;
 b=oyZCl3QeNSgnai4eb64j5o0WWhTfPMUEEAoEMEhb8iGHYBycW2wjHMcYPgnX0wZD0g
 mqIe9TEXte/Lg+oZ/9+WWCIPnvePQ6KafWAID1zMXkb7bX73ikfLRUaM3PyeyMDBcrPc
 UoPApnh5MzOyul2QCB+D1aPiUMB5iHmhVK8ae3NWm9Lc0R3YS0Lfm/zdgvsJjdwe4nUr
 t4Ols75QK6zfibyxEetK5Ia7LjY2iT+7oVLxyIl5oM4+US+R+G+JbEBjOyrZ38i2hsjf
 sBHCjOwyr3K2pxKWQaIw9MD8rvnb9UHnWkrD9LvnITSycfckHTz0CVwJJv2+qeLMrDRp
 lOfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZL65kXUjogqHvImAlQL3thwutvuDb7SzFLJksV0LJ4Y=;
 b=GGE2bS2tfphtt4hUwbqFMTHbfm3OEaBIwge7fSHpQ8sFWcMvVnBE0eCRpmEwHVtgn4
 K/QZ9vRUwI1dtZ5p8yar3b36TJiur8+10Wg8P5wvTtHxXKvrY41UHiU+sUiEwS2SbPlI
 OmaIVNI2n4MzZdD/z2OhII62l7hhktGcxIux9RkoVwBnjjk1LpwgT2u/ZrHbAgo5jtJ9
 Y0deqO0WrYpgLoMeQD3az8oR4Kb7fLzxc8vQviF57rWukZGKNHzw/PwqihzFhNJAa4h8
 KZARA1nOAmGjQo9kwLPbDR29wP0Utow0HJzPkHGrZI3EVOwYMLwRj4ElQry8p2zrrpNq
 yvaA==
X-Gm-Message-State: AOAM53250QM5IMtI8ctmSlNZnRSuWcia8FFSkiYPRy7cHLyhI3195akP
 CQXx1NAYVaJ/qmYcx43O84ElLEv9tghm2w==
X-Received: by 2002:a63:4d16:0:b0:3fe:2062:60db with SMTP id
 a22-20020a634d16000000b003fe206260dbmr2022304pgb.214.1654634006641; 
 Tue, 07 Jun 2022 13:33:26 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 s22-20020a17090aba1600b001d9780b7779sm4227856pjr.15.2022.06.07.13.33.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:33:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 21/71] target/arm: Implement TPIDR2_EL0
Date: Tue,  7 Jun 2022 13:32:16 -0700
Message-Id: <20220607203306.657998-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607203306.657998-1-richard.henderson@linaro.org>
References: <20220607203306.657998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: l6iTLELAmNqI

This register is part of SME, but isn't closely related to the
rest of the extension.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h    |  1 +
 target/arm/helper.c | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 246371f93b..31094a9248 100644
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
index 48534db0bd..616ea70c9e 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6283,6 +6283,35 @@ static const ARMCPRegInfo zcr_reginfo[] = {
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
@@ -8444,6 +8473,9 @@ void register_cp_regs_for_features(ARMCPU *cpu)
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

