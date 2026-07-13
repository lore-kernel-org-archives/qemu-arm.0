Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AD43C44501
	for <qemu-arm@archiver.kernel.org>; Mon, 13 Jul 2026 23:04:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wjPfp-00066k-Rz; Mon, 13 Jul 2026 19:02:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wjPfn-00064T-BJ
 for qemu-arm@nongnu.org; Mon, 13 Jul 2026 19:02:51 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wjPfl-0005mF-Eh
 for qemu-arm@nongnu.org; Mon, 13 Jul 2026 19:02:51 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-2ce7d2adef4so4016535ad.3
 for <qemu-arm@nongnu.org>; Mon, 13 Jul 2026 16:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783983768; x=1784588568; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=XNp999Clca8qTMzc4jizfYop/326GBQLd9efVVSHuso=;
 b=YK5MXY3+ULU6nOnu7V9frDJP5MjNxJy/aH+lzHv8zBLsSrVTBvWDpfBGHJTxbVOopa
 SO4gWxM2zZB8MaP1+ao3DIqgBPLSc/wgAiMWieoO56Xdk96mKDi8Tqa0AgjmPJ9eGHqv
 +QBGLb9RzovYnmk5G1biMLolkQI9jHiVxLb596wyBriTEJb3xom8wNVCynt1YQNvl0YR
 HgjLm3O3vhAmGBuwAWNkO7TBOTLlfW9dZxUHs1xYvGghiWVmehCdYC2NBW8AStAViRl4
 jz/Ihtz3OtdKS3OyrxYv4xXhGvHJn+tLmNiXqGPyIBpl3nVjYDr83aN05lIoDdqmEEkM
 QNGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783983768; x=1784588568;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=XNp999Clca8qTMzc4jizfYop/326GBQLd9efVVSHuso=;
 b=KKwIMOo+aKpAQnLlnTiV+a/EXJGUgghlyYAqgFe2x5OV3PbQAVJWMlRkqr4+KMcLjr
 +P17AqSbkCXEC8dg07Jrlt3e1YH4KZr7xUYY9O0xxbkXeVtZvwomDpqKLp2d1PFzIcbi
 HT3NxD96T3josvT/rPd67ac4VYZqUNIq9tkIwdtaYAcbmOgyO15Bualjk1k6DDu0Keow
 WRuMiD6j49yD5XTgaEJnMDGPYb6YyI+J+sml24RPXbm2a9+ZBmF0ixPXIo4rJYNhdRXv
 0bj3MG4RqzCJVhRDYhfvouthHTISgeP2yrR4rlIIKfZIsqtIEmQKoqKrbhwTts6an+I6
 Ev2A==
X-Gm-Message-State: AOJu0YxfZyNaSaFftzRdUnzhvtMz82sWl9ghofw/aSd+pcb9cYjao4FX
 efAd9eauvVMwzV2XvYkRrTJFb5mruPnvMdajkZrtdmcUDuT1GsOnASeOlg33poonHrsMiDv/97R
 lfbkA
X-Gm-Gg: AfdE7clWNF8tQi/rgugVJaRvnE9c7NOCX7aJwmCxbOGJCh44mosZLYR/IbS9T5OXGv4
 YbY+KHOBT4cPESvrujxs0QAbQKxt1D2kruwZnHEVHE1hkL3GbdQdJUT+yzOAeiptioMj8kYA/TF
 WxWlm66L+z8t5CQGXMKfNdaML6obpNDyUskHiBGLoxQ4VXR6y4tSS/ydNN/fitVfZ4bdM3frPhx
 1bmEy35U1+HxUyEd3kttKZnSNMfzkJHpKH0R9z+Gp2j+O4X/IoGdk+p171Qj3t3950VgChq+Hcs
 T9P2YvC5I/PjYfraI0HAbtMd6WbPm3mEIaJNqn+mqDzd+zVpBwYJS9nVxdA9WS72ETHkedCYdn5
 wxBAs/1qfGGvweZU5LEdfPu6A3xGkr/33xotWOpwFQPiAJOSc2PaLia2Z0keWKahypxONFLlX+3
 uQ9yt/uO2RyIrNSkoF5Q==
X-Received: by 2002:a17:903:2f88:b0:2ca:b8fd:1a8f with SMTP id
 d9443c01a7336-2ce9f044760mr103764575ad.39.1783983767979; 
 Mon, 13 Jul 2026 16:02:47 -0700 (PDT)
Received: from stoup.. ([71.212.146.49]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ccc9bf8e9csm106902965ad.24.2026.07.13.16.02.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2026 16:02:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 03/10] target/arm: Implement BFTMOPA (non-widening)
Date: Mon, 13 Jul 2026 16:02:37 -0700
Message-ID: <20260713230244.70174-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260713230244.70174-1-richard.henderson@linaro.org>
References: <20260713230244.70174-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-features.h        | 5 +++++
 target/arm/tcg/helper-sme-defs.h | 1 +
 target/arm/tcg/sme_helper.c      | 6 ++++++
 target/arm/tcg/translate-sme.c   | 2 ++
 target/arm/tcg/sme.decode        | 1 +
 5 files changed, 15 insertions(+)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index 4190398a1d..d3bf0746cb 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1842,6 +1842,11 @@ static inline bool isar_feature_aa64_sme_mop4_i16i64(const ARMISARegisters *id)
     return isar_feature_aa64_sme_mop4(id) && isar_feature_aa64_sme_i16i64(id);
 }
 
+static inline bool isar_feature_aa64_sme_tmop_b16b16(const ARMISARegisters *id)
+{
+    return isar_feature_aa64_sme_tmop(id) && isar_feature_aa64_sme_b16b16(id);
+}
+
 static inline bool isar_feature_aa64_sme_tmop_f16f16(const ARMISARegisters *id)
 {
     return isar_feature_aa64_sme_tmop(id) && isar_feature_aa64_sme_f16f16(id);
diff --git a/target/arm/tcg/helper-sme-defs.h b/target/arm/tcg/helper-sme-defs.h
index 84707e6c71..224de45294 100644
--- a/target/arm/tcg/helper-sme-defs.h
+++ b/target/arm/tcg/helper-sme-defs.h
@@ -405,5 +405,6 @@ DEF_HELPER_FLAGS_4(sme_usmop4s_sb, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sme_usmop4a_dh, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sme_usmop4s_dh, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_6(sme_bftmopa_hh, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_6(sme_ftmopa_hh, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_6(sme_ftmopa_ss, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, fpst, i32)
diff --git a/target/arm/tcg/sme_helper.c b/target/arm/tcg/sme_helper.c
index 49fd3d07e4..e57c56d5f2 100644
--- a/target/arm/tcg/sme_helper.c
+++ b/target/arm/tcg/sme_helper.c
@@ -2831,6 +2831,12 @@ void HELPER(sme_bfmop4a_hh)(void *vza, void *vzn, void *vzm,
     sme_mop4(vza, vzn, vzm, fpst, desc, sizeof(bfloat16), inner_bfmop4a_hh);
 }
 
+void HELPER(sme_bftmopa_hh)(void *vza, void *vzn, void *vzm, void *vzk,
+                            float_status *fpst, uint32_t desc)
+{
+    sme_tmop(vza, vzn, vzm, vzk, fpst, desc, MO_16, inner_bfmop4a_hh);
+}
+
 static void inner_bfmop4s_hh(void *vd, void *vn, void *vm, void *vinfo)
 {
     bfloat16 *d = vd, *n = vn, *m = vm;
diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index 6cb9628e75..7d21ebabc3 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -2156,6 +2156,8 @@ static bool do_tmop_fp(DisasContext *s, arg_tmop *a, MemOp esz,
     return true;
 }
 
+TRANS_FEAT(BFTMOPA_hh, aa64_sme_tmop_b16b16, do_tmop_fp,
+           a, MO_16, FPST_ZA, gen_helper_sme_bftmopa_hh)
 TRANS_FEAT(FTMOPA_hh, aa64_sme_tmop_f16f16, do_tmop_fp,
            a, MO_16, FPST_ZA_F16, gen_helper_sme_ftmopa_hh)
 TRANS_FEAT(FTMOPA_ss, aa64_sme_tmop, do_tmop_fp,
diff --git a/target/arm/tcg/sme.decode b/target/arm/tcg/sme.decode
index 16ed3ca391..f0f9b3f61d 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -1142,5 +1142,6 @@ USMOP4_dh       1010 0001 110. ...0 0000 00.. ..0. 1...         @mop4_o3
 @tmop_o2        .... .... ... zm:5 ... ... .... idx:2 .. zad:2 \
                 &tmop zn=%zn_ax2 zk=%tmop_zk
 
+BFTMOPA_hh      1000 0001 011 ..... 000 ... .... .. 100 .       @tmop_o1
 FTMOPA_hh       1000 0001 010 ..... 000 ... .... .. 100 .       @tmop_o1
 FTMOPA_ss       1000 0000 010 ..... 000 ... .... .. 00 ..       @tmop_o2
-- 
2.43.0


