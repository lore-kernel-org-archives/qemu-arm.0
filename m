Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21FB6F55805
	for <qemu-arm@archiver.kernel.org>; Tue, 21 Apr 2026 05:21:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wF3Sa-0000SW-Hs; Tue, 21 Apr 2026 01:15:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wF3Ro-0008AW-Tn
 for qemu-arm@nongnu.org; Tue, 21 Apr 2026 01:14:57 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wF3Rm-0006eC-MZ
 for qemu-arm@nongnu.org; Tue, 21 Apr 2026 01:14:56 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-2b2ea1b3962so22757975ad.0
 for <qemu-arm@nongnu.org>; Mon, 20 Apr 2026 22:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776748492; x=1777353292; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=127uBHcVT1oBIbFF2ckf3+yTVZK3U9JgwdEZdx7lwQY=;
 b=S7ozD9QwUH74iZtHeA+yUZugKoSxsOONUBPzk99481OPi2tomcwF6VreZnrnFH6rE5
 GfwpKj5oW+Yw+yosRT8yRUXGwKG9sLfP8AITARwL28qGEhGLcCQKtMc6Rt+1mjdD3vdK
 8loLnswKhvRRvXXb53SQhD0rj1N2bUhILeaOdpPVCzyndxv3IX0S3D0VZyzBiZuwfDC5
 t89XolqkA+IK/L4edeYiquVtaqfHitZLWG3Bc37SlshEVUzkEB4vbtcXmzp7cZQoBnN8
 tRTZ2Flfpo5ZmhuHB7BFbzctCNj5b3O7pP4r0xeKSkpDzS382Xk27GULP7laaXRz/7As
 nZdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776748492; x=1777353292;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=127uBHcVT1oBIbFF2ckf3+yTVZK3U9JgwdEZdx7lwQY=;
 b=Zc73aaCEjFyRhMyU2kqIzdvqFFFzUS7bsv3WEM73dddRoYyHz+j36TSuHpzqR3Rgae
 5RDkQ1WxWqMyFbBMhsoqOsh5nRyeL+VV6p9m4un4ZjFZeylxIvbJLBxLZk846BIVj3od
 Bvv8xd+TIyO3QQvTEqL/mgkzwfPzWeKCcKAecAgc6qpyrkcnu2TYTfY9Zzc8QB2+bTqm
 rAkTy1Pw6bT05xbVuMq2NoUpNhQGp1cH66vujEtU31K11xYTEHEnh7X2NMRJz0MbssvT
 sAj9Mq3HHUalhTREeezZRGHIuTjMk7jZwliS1eVLp+/2QYKEsCwkZehwq/3lXSkB95VQ
 xKQQ==
X-Gm-Message-State: AOJu0YyqF8T3NZHHDQlAnGqeg402EwTUZGhgB+zRZVlXclXQkZKK6uAM
 baaO9lQmmiLIcEqxMRAnzrlCGhfXRBHYWEUrnQt0YonkP1tflYmopUBJWP5hN4yXCTY=
X-Gm-Gg: AeBDieu17uo71G+//VgvPMAIyzExM2K44dFT3QsHSQBKq1tTMw8BRU0+PnkMlSAK01r
 bPSIAlJgH43svVv2PYdrhLS8qYeijCZnRsFn393RCN1wm0lE3YLVW3omABIHUUttHjHLgwbDjF/
 lMIRLGGlRzvxxKBuzHYt5d1ZHazppMmrQoOSol3KgHNsc0k41dQgTizaKFDiWw/flbMWEBLPZUE
 vlqHsxfMS/efahfIrQoeMeOrcied0jDdrgVIK8hZ/15m0aOWUvMheuSigQ+WEXTkKLc8muZOyEs
 Ru7wDpCZSakmM8YJcAYC3djmqUFmBRujro2OyIPJ1Ggm3oGOuOB7xyOhS9zKq4vnxGDlXZCZHpW
 wgeTfBOgIG3qAm8QMc9vT7aukb8gE5Y+X+4ehYlNYyPemHPH8vvmP/ob9JwGmiUn1FMYpDVBTIC
 2G4V/jxMGq/6JayusJIF6ovVWpa8plBkKICGVXVrv0
X-Received: by 2002:a17:902:7c0f:b0:2b2:b117:1e16 with SMTP id
 d9443c01a7336-2b5f9f7e95fmr123067035ad.20.1776748491520; 
 Mon, 20 Apr 2026 22:14:51 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b5fab0cddfsm174631715ad.49.2026.04.20.22.14.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2026 22:14:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 25/37] target/arm: Rename SME BFCVT patterns to BFCVT_hs
Date: Tue, 21 Apr 2026 15:13:34 +1000
Message-ID: <20260421051346.41106-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260421051346.41106-1-richard.henderson@linaro.org>
References: <20260421051346.41106-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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

The existing pattern is BFCVT (BFloat16 to 8-bit floating-point).
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
index 0055e97a2b..a0f03c4671 100644
--- a/target/arm/tcg/sme_helper.c
+++ b/target/arm/tcg/sme_helper.c
@@ -1742,7 +1742,7 @@ DO_MLALL_IDX(sme2_sumlall_idx_s, uint32_t, int8_t, uint8_t, H4, H1, +)
 #undef DO_MLALL_IDX
 
 /* Convert and compress */
-void HELPER(sme2_bfcvt)(void *vd, void *vs, float_status *fpst, uint32_t desc)
+void HELPER(sme2_bfcvt_hs)(void *vd, void *vs, float_status *fpst, uint32_t desc)
 {
     ARMVectorReg scratch;
     size_t oprsz = simd_oprsz(desc);
diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index c6a8eec32c..1267d3e65f 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -1447,8 +1447,8 @@ static bool do_zz_fpst(DisasContext *s, arg_zz_n *a, int data,
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


