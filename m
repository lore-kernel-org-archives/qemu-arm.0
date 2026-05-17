Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B61ECD4F3C
	for <qemu-arm@archiver.kernel.org>; Sun, 17 May 2026 00:34:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wOPPk-0008C0-N7; Sat, 16 May 2026 20:31:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wOPOr-0007FZ-RD
 for qemu-arm@nongnu.org; Sat, 16 May 2026 20:30:36 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wOPOl-000543-Bd
 for qemu-arm@nongnu.org; Sat, 16 May 2026 20:30:32 -0400
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-837b39eb078so756802b3a.2
 for <qemu-arm@nongnu.org>; Sat, 16 May 2026 17:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778977825; x=1779582625; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jLgm9UDQEHLrvYYVImCj/f7lgJUJBmTicj8qoBhaXM0=;
 b=KepTBpZn7mFbolK24gdbIea7ECowoct3RpMh66SI5HQVanADGaJWpeZHUc5p5VAG7x
 2B4Bikb+NLfRKfPA0sScGWYmp2x/xaQwzp8HdMHS3enIc1/C/HzjO8XHBunQy7WhsNrb
 a8sjAWaMmDSSpPMgvDDIkHP7oWdO3sOqxkuYqtFbrdPBQvSL1O/sCk9MfbX5/JxaSYPp
 2Kfn3MgSmsCNSYFguMYmG0SsKaEa6Al0ma8zWGkdo9X/57cadWxJaFkpi7Wgp+bprIH9
 WyOiox08693u+lthFN0lujNOg/p/MEommwcGZhZThtN7azF5dJPQHdTv8x5hym2iCYFG
 rvSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778977825; x=1779582625;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=jLgm9UDQEHLrvYYVImCj/f7lgJUJBmTicj8qoBhaXM0=;
 b=n30AMzUJ3ZUBY6OZ3q+GUQZMOA+oLQSlXRf8K94qKl/KjUcVrwmg+5GWW8yH1hI0rh
 JD47obhyppPaTJyoZEY3qYX7mqcz//XgjacD7lnJbL/Kch1j0xHBevSede3TeV/yCLev
 MWT+BXwu/06UgtqOmawoN6e/qYbytJLJWsMBr7uSSINzD5JSv0cZnEuKp4mElpIRzpPB
 ukWAah3FdbujuMIR/uWLXMxuEYYdbqDz/xzcL/bCA4pmP6vSK4gaAMnt+ujuQ4OKopVy
 hbNeBQTYWDuahb/6YGg7J3rnZoChnblhTgtzyfiRec8RjpQMniXiIRtkOWFYQ9dxV/4I
 LMhg==
X-Gm-Message-State: AOJu0Ywa9yXlQNmj7PDbwR7B0RnqEYNJ8UOlL3DW2AFoQuhIT96NFRFr
 rqCP32h+3iBJdTxUjGM+A0eLvBJc/DbFy2v3riIjEQujAhTBiUfcMEMG90mLTmvr0eXC3QrGojr
 67fe3
X-Gm-Gg: Acq92OFo0ecB5iFDNtkEtlK70dRxQfPz/kn3i5T3L4w6Ei5R2o0NwKRMLGhsmapkcfR
 s+CTyUlktgb1Od9RnpvoV9MR7LzEY13ystbD7as09qWM6OEGvK9Y7rODDo+nom1g7VJ4PGLszEI
 o8/RetlNzta6Ma8Bafd3SbVCyBDbpCQ6GgOC0c0TJbQG9muOc0xYNXUWfrN1ewdzSAZbG+Jy8yr
 ppORmzgyDF2JsUkz03217i6nk0QhZdjq9Sn2BSGesR7MXxwaieeTy/MP2KQGXmqrYI5FtQ6AAYT
 Qovp7a/Ssa73t9Y1n3qxZhPMcS8C0BtHQcFJa8yJzmsKb6mxd6he3Mtr3lGBbxldzUecbem3E3i
 NVF2hG9ycNZ0W9oq0fZKSBovVF7mqU4GwTIbIbUJ1OCmwVGoCQh4/biM+MSHwn6ukAoiCVq3vx1
 X5yGJ5oQra+SVKoWqGN2NeEieaCU8C
X-Received: by 2002:a05:6a00:390f:b0:838:af72:fb2f with SMTP id
 d2e1a72fcca58-83f33aec2a5mr10335136b3a.6.1778977825480; 
 Sat, 16 May 2026 17:30:25 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-83f19663cfdsm12272745b3a.9.2026.05.16.17.30.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 May 2026 17:30:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v5 25/63] target/arm: Rename SME BFCVT patterns to BFCVT_hs
Date: Sat, 16 May 2026 17:29:24 -0700
Message-ID: <20260517003002.321430-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260517003002.321430-1-richard.henderson@linaro.org>
References: <20260517003002.321430-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

The existing pattern is BFCVT (single-precision to BFloat16).
In preparation for introducing more insns of the same name,
append the operand sizes.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/helper-sme-defs.h | 2 +-
 target/arm/tcg/sme_helper.c      | 2 +-
 target/arm/tcg/translate-sme.c   | 4 ++--
 target/arm/tcg/sme.decode        | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/arm/tcg/helper-sme-defs.h b/target/arm/tcg/helper-sme-defs.h
index c551797c6f..01aad4c231 100644
--- a/target/arm/tcg/helper-sme-defs.h
+++ b/target/arm/tcg/helper-sme-defs.h
@@ -250,7 +250,7 @@ DEF_HELPER_FLAGS_5(sme2_umlsll_idx_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr,
 DEF_HELPER_FLAGS_5(sme2_usmlall_idx_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sme2_sumlall_idx_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 
-DEF_HELPER_FLAGS_4(sme2_bfcvt, TCG_CALL_NO_RWG, void, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_4(sme2_bfcvt_hs, TCG_CALL_NO_RWG, void, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_4(sme2_bfcvtn, TCG_CALL_NO_RWG, void, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_4(sme2_fcvt_n, TCG_CALL_NO_RWG, void, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_4(sme2_fcvtn, TCG_CALL_NO_RWG, void, ptr, ptr, fpst, i32)
diff --git a/target/arm/tcg/sme_helper.c b/target/arm/tcg/sme_helper.c
index 7ef6f5d71b..30355662d9 100644
--- a/target/arm/tcg/sme_helper.c
+++ b/target/arm/tcg/sme_helper.c
@@ -1726,7 +1726,7 @@ DO_MLALL_IDX(sme2_sumlall_idx_s, uint32_t, int8_t, uint8_t, H4, H1, +)
 #undef DO_MLALL_IDX
 
 /* Convert and compress */
-void HELPER(sme2_bfcvt)(void *vd, void *vs, float_status *fpst, uint32_t desc)
+void HELPER(sme2_bfcvt_hs)(void *vd, void *vs, float_status *fpst, uint32_t desc)
 {
     ARMVectorReg scratch;
     size_t oprsz = simd_oprsz(desc);
diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index e2d17de165..88c1d78c40 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -1448,8 +1448,8 @@ static bool do_zz_fpst(DisasContext *s, arg_zz_n *a, int data,
     return true;
 }
 
-TRANS_FEAT(BFCVT, aa64_sme2, do_zz_fpst, a, 0,
-           FPST_A64, gen_helper_sme2_bfcvt)
+TRANS_FEAT(BFCVT_hs, aa64_sme2, do_zz_fpst, a, 0,
+           FPST_A64, gen_helper_sme2_bfcvt_hs)
 TRANS_FEAT(BFCVTN, aa64_sme2, do_zz_fpst, a, 0,
            FPST_A64, gen_helper_sme2_bfcvtn)
 TRANS_FEAT(FCVT_n, aa64_sme2, do_zz_fpst, a, 0,
diff --git a/target/arm/tcg/sme.decode b/target/arm/tcg/sme.decode
index ee874be1a6..7a8e1abb59 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -789,7 +789,7 @@ SUB_aaz_d       11000001 111 000010 .. 111 ...00 11 ...     @az_4x4_o3
 @zz_4x2_n1      ........ ... ..... ...... .... . .....      \
                 &zz_n n=1 zd=%zd_ax4 zn=%zn_ax2
 
-BFCVT           11000001 011 00000 111000 ....0 .....       @zz_1x2
+BFCVT_hs        11000001 011 00000 111000 ....0 .....       @zz_1x2
 BFCVTN          11000001 011 00000 111000 ....1 .....       @zz_1x2
 
 FCVT_n          11000001 001 00000 111000 ....0 .....       @zz_1x2
-- 
2.43.0


