Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCE35CD13D9
	for <qemu-arm@archiver.kernel.org>; Thu, 30 Apr 2026 00:25:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wIF9s-0006ey-65; Wed, 29 Apr 2026 20:21:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wIF9e-0006Rp-Jx
 for qemu-arm@nongnu.org; Wed, 29 Apr 2026 20:21:25 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wIF9c-0006Hq-Qn
 for qemu-arm@nongnu.org; Wed, 29 Apr 2026 20:21:22 -0400
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-82f943870baso170565b3a.1
 for <qemu-arm@nongnu.org>; Wed, 29 Apr 2026 17:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777508479; x=1778113279; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8iu7JU2SThPHsUv1CtXawL6MiBuo03vVN4iwnvdls48=;
 b=esPxlzjxaN1NJGQiObugRchq8Oa3NQuG7b84nAc2QTvp0kBtgOPAx8J1uiTeD7TrFW
 MUozp9EjZ2z/1Y+tOM1jBO91hPE9e/J9feuHQqmsqHpD8gRdPsBHLCABEhMnmDfgsW1y
 /CYUA/8bdbADO0kK7DpjpSdVAuVTPFN1ZtFmo0cbc50e1rhrcmX0eRbBplwkkoyki27T
 DhMG1f4WiNb145+fjdU4oiDMgAAlvXEWCPRjGJCGa23VSwwi3N3hmEHRMV12548VOJLk
 UjG6CTBGWlNoVSIDBIF8vPFMq3Ojps5iWiThNNO4daxeeyseWYZtfbi6b71tPjgX8r/J
 9OCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777508479; x=1778113279;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=8iu7JU2SThPHsUv1CtXawL6MiBuo03vVN4iwnvdls48=;
 b=sJDPrZBdOtPnU/pXXcajq6oho8wYnz5IZ0ip88l/S5NKqkqpi7TNvwIgs+QfuN4tY/
 +aiNVORjdCJAJ8f//Vs83FJeNYuTHRSvddoO+zu4RzzrMsgkiXk9QjAcOTgb59NUvqEm
 8CS8o4co3Bmt5dRcsKlpSaDQ7MY0Ehlt2s8Cyb+ds3g6KPjGnAxpZ+rM/5weZ/ikRJ2P
 1PFbY47nTcm7quq10ODF2qsPkATReT+89dyJfdUy3BIGIdm3HVr8TSpztB1tK6AKbXLi
 gMvewVKd7PnKVpSsudb6Weh29pWTg/QVgquR+dYqyrP/XB5sjhlYVMlL5zBF6Sp3wsto
 bR8A==
X-Gm-Message-State: AOJu0Ywt5VPTX0CeTicAWN6dkWvr7y5R9pUR/DAg6oDzpzKymIMVvTaq
 4+ww3xr/xrBfPdXEBinW7ryDm8DZ9z/O1vH++IIQuWiFHQGO5vM07MMh+4LaJK+XYM7GA0O77Xw
 At2HHgFk=
X-Gm-Gg: AeBDieukZKWc8Jw5pCo7EcvGFyal8KjQ2E7HH0kPRwRuDoF0UyGTemD2vDepnRilU6C
 9QrneZ/mBQnuNJ3Cv6RZCXvQDlzqgMYiE0MbCw6mPjfM8npDSBvH7iO53B0pLlal1w7L/dhgUHb
 jSvZ+jx26meGlR3M8xVCBmcnGpxBEuNjAtHCMkCRgLqTBS/s3zLbxb7AtCNFejbRrbWQnRDpHf+
 ED5NpFjuhjIPjBK1E+wXeSRAwTqmFO+lJepppNZgR88STFi5ZD4xYV+1Vu6/iduVjFnRd8OL6R9
 mEKD7WqgBkDsD0UVCapoTwoPv/7vX2HLLWN5EusFYlqGysmiWuIQMQ0/mLuzj+LKyQTnXpyvbsY
 qqPCsfclZNBknlePak1il49MNmHamF0f93bQSbV2OQzmY7lMKF2RQLUwHVTguBIybnYKLtZGsG9
 I8DbJuUOIQzlDVSlfblckGvEUL6y+zrB0tj3APpt5I
X-Received: by 2002:a05:6a00:301f:b0:827:2ee0:411f with SMTP id
 d2e1a72fcca58-834fdb93775mr810864b3a.4.1777508478509; 
 Wed, 29 Apr 2026 17:21:18 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-834ed5cd3b8sm3461727b3a.16.2026.04.29.17.21.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Apr 2026 17:21:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 12/47] target/arm: Add FPMR_EL to TBFLAGS
Date: Thu, 30 Apr 2026 10:20:11 +1000
Message-ID: <20260430002046.59739-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430002046.59739-1-richard.henderson@linaro.org>
References: <20260430002046.59739-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Prepare to perform access checks for direct and
indirect uses of FPMR.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h               |  1 +
 target/arm/tcg/translate.h     |  2 ++
 target/arm/tcg/hflags.c        | 41 ++++++++++++++++++++++++++++++++++
 target/arm/tcg/translate-a64.c |  1 +
 4 files changed, 45 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 25cae59878..5d051e1d2d 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2538,6 +2538,7 @@ FIELD(TBFLAG_A64, ZT0EXC_EL, 39, 2)
 FIELD(TBFLAG_A64, GCS_EN, 41, 1)
 FIELD(TBFLAG_A64, GCS_RVCEN, 42, 1)
 FIELD(TBFLAG_A64, GCSSTR_EL, 43, 2)
+FIELD(TBFLAG_A64, FPMR_EL, 45, 2)
 
 /*
  * Helpers for using the above. Note that only the A64 accessors use
diff --git a/target/arm/tcg/translate.h b/target/arm/tcg/translate.h
index 77fdc5f3a1..1648c2c96f 100644
--- a/target/arm/tcg/translate.h
+++ b/target/arm/tcg/translate.h
@@ -199,6 +199,8 @@ typedef struct DisasContext {
     uint8_t gm_blocksize;
     /* True if the current insn_start has been updated. */
     bool insn_start_updated;
+    /* FMPR exception EL or 0 if enabled. */
+    uint8_t fpmr_el;
     /* Offset from VNCR_EL2 when FEAT_NV2 redirects this reg to memory */
     uint32_t nv2_redirect_offset;
 } DisasContext;
diff --git a/target/arm/tcg/hflags.c b/target/arm/tcg/hflags.c
index 7e6f8d3647..6759b36f28 100644
--- a/target/arm/tcg/hflags.c
+++ b/target/arm/tcg/hflags.c
@@ -237,6 +237,43 @@ static int zt0_exception_el(CPUARMState *env, int el)
     return 0;
 }
 
+/*
+ * Return the exception level to which exceptions should be taken for FPMR.
+ * C.f. the ARM pseudocode function CheckFPMREnabled.
+ */
+static int fpmr_exception_el(CPUARMState *env, int el)
+{
+    switch (el) {
+    case 0:
+        if (el_is_in_host(env, el)) {
+            if (!(env->cp15.sctlr_el[2] & SCTLR_EnFPM)) {
+                return 2;
+            }
+            break;
+        }
+        if (!(env->cp15.sctlr_el[1] & SCTLR_EnFPM)) {
+            return 1;
+        }
+        /* fall through */
+    case 1:
+        if (!(arm_hcrx_el2_eff(env) & HCRX_ENFPM)) {
+            return 2;
+        }
+        break;
+    case 2:
+        break;
+    case 3:
+        return 0;
+    default:
+        g_assert_not_reached();
+    }
+    if (arm_feature(env, ARM_FEATURE_EL3)
+        && !(env->cp15.scr_el3 & SCR_ENFPM)) {
+        return 3;
+    }
+    return 0;
+}
+
 static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
                                         ARMMMUIdx mmu_idx)
 {
@@ -500,6 +537,10 @@ static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
         }
     }
 
+    if (cpu_isar_feature(aa64_fpmr, env_archcpu(env))) {
+        DP_TBFLAG_A64(flags, FPMR_EL, fpmr_exception_el(env, el));
+    }
+
     return rebuild_hflags_common(env, fp_el, mmu_idx, flags);
 }
 
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 3c6559964b..b013dd51cb 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -10726,6 +10726,7 @@ static void aarch64_tr_init_disas_context(DisasContextBase *dcbase,
     dc->gcs_en = EX_TBFLAG_A64(tb_flags, GCS_EN);
     dc->gcs_rvcen = EX_TBFLAG_A64(tb_flags, GCS_RVCEN);
     dc->gcsstr_el = EX_TBFLAG_A64(tb_flags, GCSSTR_EL);
+    dc->fpmr_el = EX_TBFLAG_A64(tb_flags, FPMR_EL);
     dc->vec_len = 0;
     dc->vec_stride = 0;
     dc->cp_regs = arm_cpu->cp_regs;
-- 
2.43.0


