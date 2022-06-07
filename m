Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp2414669lfb;
        Tue, 7 Jun 2022 14:03:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyrSKoG7VYBj83TpNbgMl73/4p/QChxtz8y+6g+N2hyO16Nfua6ZSgiH9yZcjXq/REtfhUc
X-Received: by 2002:a05:620a:29d3:b0:6a6:d1b8:7067 with SMTP id s19-20020a05620a29d300b006a6d1b87067mr6050666qkp.327.1654635783762;
        Tue, 07 Jun 2022 14:03:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654635783; cv=none;
        d=google.com; s=arc-20160816;
        b=rfKPmGlcUoHd5rod9o5lm1vSCxTvv5Z9olEJXQY6pXHQKW1JMkMHF+beplpp6xFBzW
         dqNtv9nkhdFUyHqcWUqSfvAZ5lilkS9/exq7+t2W+967fPvAqk5N1WEKot0udrXkO9df
         pklVrxHpmjgdvuV1B5eQ+2I/m7jlWssOT6HGk3CbJMwxg/FH3gNLkFSLQK7f3Kfx8Jx7
         3zeAblPbQUYlqoJOCLdtPdJa/zTcTOc8bcbALNx25IDJG2ZWJfYgKcreBe8UBCyT2QFy
         RlrdlaWnmjzyEiWcfPPxRNYmKRuyxcu5qSwzTgYw+Itu/oNQJIV1J9MIdLicIB2ITDv8
         Ztbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=cwMIrzdINWrV/sQZ3wz6KuPhrAMN58vwUNHGWXs01ZE=;
        b=wHVDAKO9GnfmQ1RbK+XTxCJsDuPNTU1sGXhpsBfH7pqDb1FFO1UZNhA3EOZuM9G2Ww
         AqQ/3rRnkQxWgN7yxlSjnlLE1ChB4XVmoDb542tCYATcSbNB61y08pFOuQsnfxflmLRt
         H3yGq9Kv98vqeecbsb/P1SMT0ucwFL0DJRfmVtRRQ0TfD9R7EmFomgVQtxoWfxcMTz7X
         KxMrf9NnXkdlrVKzdz+/VHFFjU4InNaeN2e9u0zxto8C0nbGfwH3br7M8K2UrVbWk5UO
         U6sDggeprxpuVNEs473At4b3jKrRNGdqD/MNhoSTMsin1Bg+mSHC/jMjmvrl+Zipn3xY
         FUBA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QKMR5SYL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y13-20020ac85f4d000000b00304eaadd58csi4146386qta.575.2022.06.07.14.03.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jun 2022 14:03:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QKMR5SYL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nygLv-00063N-7b
	for alex.bennee@linaro.org; Tue, 07 Jun 2022 17:03:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyftN-0007xj-Nu
 for qemu-arm@nongnu.org; Tue, 07 Jun 2022 16:33:33 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:54982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyftJ-0007Lm-5v
 for qemu-arm@nongnu.org; Tue, 07 Jun 2022 16:33:33 -0400
Received: by mail-pj1-x1030.google.com with SMTP id j7so16650172pjn.4
 for <qemu-arm@nongnu.org>; Tue, 07 Jun 2022 13:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cwMIrzdINWrV/sQZ3wz6KuPhrAMN58vwUNHGWXs01ZE=;
 b=QKMR5SYLvauIOvMxGqZz5lQx7HyhZIObePwQ7I6a+BLJySLKZV+e9/DqjFJceWdwMC
 K7BsTTNVazex9j0s+lsd78MZzqGaB4K/vOfylXybePBbiL+rrMKP9mw3m50BQrvSSasD
 Mu1GnrHjg7kB5yPF6/WOcUt0U3b01+EBoCKz5o7PTgppf80hjMYJ0Zh+vGQtKRKYOzD+
 O1d09FC2PZeMK2B2eI9YDihtkJG9+yR65uMKV9247z0eVOl6HL0lfCMtWRd0oDQSF/Ou
 sm6nCIOdHZR6Y1/8e2ZyFxZfIfWUVKDtmOwwpdM5y4pI6YMe4zoMBdU8PpRwi6JKbfsX
 zQww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cwMIrzdINWrV/sQZ3wz6KuPhrAMN58vwUNHGWXs01ZE=;
 b=ePIskNqIXSHtl7XuYmOplhctyNzegQrIZY27KIyyLMvFS5yg+KqAtSsh9MGIdyAvrr
 Hl39Zgt5UmjsXwnW3JCAYMyK1eDs41A7VpprBZKPr9kTeAtCvKKlAFnN66pwbGxQxE4l
 fTAUBfgvTcNflgo+PUhXJWR6KjEJ2Z10lVE52X/73PZsFfzwKNpa1ZhO9ykwjduufln6
 kk+Hdz54ZjIuInTFHf0m4t9/HBDfkdGp4M64RkG2F2+kh07tb387QK2zFxbncZC3glV4
 ZRwL0387pi+I7OeUIZdG1Bh70GHoSeScs63ZT9rXd+SO/FUCgIsIxDQYHb60fIlg/YBr
 Bs2Q==
X-Gm-Message-State: AOAM530/4MDDVIlEerixJyBeiJgxr7+BggAs4Jcbp3F7m5zfCqLbPQ3c
 OEpv9wm7ZvDkCoCzqBFJ6gJmPeAPF1y3Uw==
X-Received: by 2002:a17:903:4049:b0:167:515b:3efa with SMTP id
 n9-20020a170903404900b00167515b3efamr21517813pla.41.1654634007677; 
 Tue, 07 Jun 2022 13:33:27 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 s22-20020a17090aba1600b001d9780b7779sm4227856pjr.15.2022.06.07.13.33.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:33:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 22/71] target/arm: Add SMEEXC_EL to TB flags
Date: Tue,  7 Jun 2022 13:32:17 -0700
Message-Id: <20220607203306.657998-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607203306.657998-1-richard.henderson@linaro.org>
References: <20220607203306.657998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
X-TUID: Mznkda5Ux569

This is CheckSMEAccess, which is the basis for a set of
related tests for various SME cpregs and instructions.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h           |  2 ++
 target/arm/translate.h     |  1 +
 target/arm/helper.c        | 52 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-a64.c |  1 +
 4 files changed, 56 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 31094a9248..511c30d7d7 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1134,6 +1134,7 @@ void aarch64_sync_64_to_32(CPUARMState *env);
 
 int fp_exception_el(CPUARMState *env, int cur_el);
 int sve_exception_el(CPUARMState *env, int cur_el);
+int sme_exception_el(CPUARMState *env, int cur_el);
 
 /**
  * sve_vqm1_for_el:
@@ -3272,6 +3273,7 @@ FIELD(TBFLAG_A64, ATA, 15, 1)
 FIELD(TBFLAG_A64, TCMA, 16, 2)
 FIELD(TBFLAG_A64, MTE_ACTIVE, 18, 1)
 FIELD(TBFLAG_A64, MTE0_ACTIVE, 19, 1)
+FIELD(TBFLAG_A64, SMEEXC_EL, 20, 2)
 
 /*
  * Helpers for using the above.
diff --git a/target/arm/translate.h b/target/arm/translate.h
index f473a21ed4..a492e4217b 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -42,6 +42,7 @@ typedef struct DisasContext {
     bool ns;        /* Use non-secure CPREG bank on access */
     int fp_excp_el; /* FP exception EL or 0 if enabled */
     int sve_excp_el; /* SVE exception EL or 0 if enabled */
+    int sme_excp_el; /* SME exception EL or 0 if enabled */
     int vl;          /* current vector length in bytes */
     /* Flag indicating that exceptions from secure mode are routed to EL3. */
     bool secure_routed_to_el3;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 616ea70c9e..e0123dce67 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6222,6 +6222,55 @@ int sve_exception_el(CPUARMState *env, int el)
     return 0;
 }
 
+/*
+ * Return the exception level to which exceptions should be taken for SME.
+ * C.f. the ARM pseudocode function CheckSMEAccess.
+ */
+int sme_exception_el(CPUARMState *env, int el)
+{
+#ifndef CONFIG_USER_ONLY
+    if (el <= 1 && !el_is_in_host(env, el)) {
+        switch (FIELD_EX64(env->cp15.cpacr_el1, CPACR_EL1, SMEN)) {
+        case 1:
+            if (el != 0) {
+                break;
+            }
+            /* fall through */
+        case 0:
+        case 2:
+            return 1;
+        }
+    }
+
+    if (el <= 2 && arm_is_el2_enabled(env)) {
+        /* CPTR_EL2 changes format with HCR_EL2.E2H (regardless of TGE). */
+        if (env->cp15.hcr_el2 & HCR_E2H) {
+            switch (FIELD_EX64(env->cp15.cptr_el[2], CPTR_EL2, SMEN)) {
+            case 1:
+                if (el != 0 || !(env->cp15.hcr_el2 & HCR_TGE)) {
+                    break;
+                }
+                /* fall through */
+            case 0:
+            case 2:
+                return 2;
+            }
+        } else {
+            if (FIELD_EX64(env->cp15.cptr_el[2], CPTR_EL2, TSM)) {
+                return 2;
+            }
+        }
+    }
+
+    /* CPTR_EL3.  Since ESM is negative we must check for EL3.  */
+    if (arm_feature(env, ARM_FEATURE_EL3)
+        && !FIELD_EX64(env->cp15.cptr_el[3], CPTR_EL3, ESM)) {
+        return 3;
+    }
+#endif
+    return 0;
+}
+
 /*
  * Given that SVE is enabled, return the vector length for EL.
  */
@@ -13719,6 +13768,9 @@ static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
         }
         DP_TBFLAG_A64(flags, SVEEXC_EL, sve_el);
     }
+    if (cpu_isar_feature(aa64_sme, env_archcpu(env))) {
+        DP_TBFLAG_A64(flags, SMEEXC_EL, sme_exception_el(env, el));
+    }
 
     sctlr = regime_sctlr(env, stage1);
 
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index d438fb89e7..8bbd1b7f07 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -14608,6 +14608,7 @@ static void aarch64_tr_init_disas_context(DisasContextBase *dcbase,
     dc->align_mem = EX_TBFLAG_ANY(tb_flags, ALIGN_MEM);
     dc->pstate_il = EX_TBFLAG_ANY(tb_flags, PSTATE__IL);
     dc->sve_excp_el = EX_TBFLAG_A64(tb_flags, SVEEXC_EL);
+    dc->sme_excp_el = EX_TBFLAG_A64(tb_flags, SMEEXC_EL);
     dc->vl = (EX_TBFLAG_A64(tb_flags, VL) + 1) * 16;
     dc->pauth_active = EX_TBFLAG_A64(tb_flags, PAUTH_ACTIVE);
     dc->bt = EX_TBFLAG_A64(tb_flags, BT);
-- 
2.34.1

