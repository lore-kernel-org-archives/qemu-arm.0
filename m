Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C12DFF887E
	for <qemu-arm@archiver.kernel.org>; Thu, 30 Apr 2026 00:24:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wIFAJ-0007ED-5x; Wed, 29 Apr 2026 20:22:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wIFA2-0006pT-Uw
 for qemu-arm@nongnu.org; Wed, 29 Apr 2026 20:21:51 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wIFA0-0006NE-5B
 for qemu-arm@nongnu.org; Wed, 29 Apr 2026 20:21:46 -0400
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-82f4a53ae20so246742b3a.3
 for <qemu-arm@nongnu.org>; Wed, 29 Apr 2026 17:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777508503; x=1778113303; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jLgm9UDQEHLrvYYVImCj/f7lgJUJBmTicj8qoBhaXM0=;
 b=jmrGTSoVtJBULaHSZUD9ljsbMxs2LMcmbQdWfUS9oennm/yW7mpSi2HdksgVwGMbZ2
 RGwD61pOvV9+pZNg3XVqGV32XJwNt/JQDBCTtsZVyf6tWUiiyjaU4DePVjTqZGhEBb/V
 AegIbArEchZuGWS7pDeCG1D3V+FO63nrDBaSi3QnDFGWiZVQcJvjR/wGvg9Qc90gymoV
 VDkrg8Tn0tAaSiWBX50VPV6F6+O8zcmNuca9k8HleijfPapPUNTdE1qkSBsY3fOo5nXp
 mbpYCKpI5kzoAsiimy88qseGYrxRyRzJ/pS7MdDYQLBYe0TaGqPxX8GPSrVxJrePnmQi
 tj3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777508503; x=1778113303;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=jLgm9UDQEHLrvYYVImCj/f7lgJUJBmTicj8qoBhaXM0=;
 b=hO1HDwGq4uCgFoCLudL6wIApQYTOWtjzI3nd8U4EeuHubIsK2M7Y63OyRA2/JE6A9D
 Vg45kUjx5z0PPSz1KqG0pMG2yjn74GOJwyQOgnGcH+K5K91C50ciYHxNoTogsF6X2FHl
 1/Q4ixFfxnZ3NzQBfieU2y1o3KjdGUpv602L3LpoN3XVN4rO1W12p+U/QEJQBq/Xn61q
 wWKaVHulImr9xAVNcNBTGwJxJYzhHyyzq3N1KEhKC2S1NzMXz7JGth90jTZU8XpHYEEy
 odO9PJTi+GyQRbYmGkdZtaTxF+fz0iPnSxqKWYcBmUcvGMvLvgRPQuNFh5EglDA04xwG
 KfhQ==
X-Gm-Message-State: AOJu0YyhdBP3NC3Mbi0uCFTgz2l34TCe6mFdf0pYwYUOLQmQQILzywkb
 feNozl7JzRcoirF1xIjJZ6LI1i2xtxymzkmXVpPH5tkSBXq4CkyrfQYfuaLlcE0xZezhXaCCDBW
 01PVYQVY=
X-Gm-Gg: AeBDiesN5oQP7sjHxeBilfGx1g+X/OOigI3Uri+HEIIflf0d3YYdRicRMxvVVpX4LPO
 WZJ44yZfZhuitWDkOa/TPL9ga/UkuF0ijyfRqT1iJ8ng4aZN70/MMepqEsMvM2yRK97R6lU3vl7
 kRbvQB7bfgIKm8qhU3yl6kRwLhma6aDbGicmATZ2OWapDiTsZkBSuC1x2FEPZLQW783JGTM9uDv
 ixBEKaR2XzdmFbUEquRf7sFgtL68S4FY+N2t2waHfSKWQrAaUwo4yQTOYNtQXsmKIMDrACu+cHo
 KfNtQ7NCNGvEs5twPecbUhL1cW9pSgvW6WRI9hP+XFdePMGFF/CXlLAP8tUeCHs1aGWaOmEoPaL
 6cf9idS2+j6JCz2nkMv0j01vlpe40jXDm2vpipPzH2pmVuYERgNy9vxRSC+TFcUnA1v1YnxRTUv
 vRK0hkALI8w+EPhmYT8whINCcJMlv6y30WgBfUSZyG
X-Received: by 2002:a05:6a00:a111:b0:82f:4f63:31e1 with SMTP id
 d2e1a72fcca58-834fdb0971fmr866254b3a.8.1777508502736; 
 Wed, 29 Apr 2026 17:21:42 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-834ed5cd3b8sm3461727b3a.16.2026.04.29.17.21.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Apr 2026 17:21:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 23/47] target/arm: Rename SME BFCVT patterns to BFCVT_hs
Date: Thu, 30 Apr 2026 10:20:22 +1000
Message-ID: <20260430002046.59739-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430002046.59739-1-richard.henderson@linaro.org>
References: <20260430002046.59739-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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


