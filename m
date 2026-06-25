Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7514CDE00C
	for <qemu-arm@archiver.kernel.org>; Thu, 25 Jun 2026 22:37:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wcsfo-0005Gw-Ad; Thu, 25 Jun 2026 18:35:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wcsew-0004aG-1i
 for qemu-arm@nongnu.org; Thu, 25 Jun 2026 18:35:04 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wcser-0002KN-52
 for qemu-arm@nongnu.org; Thu, 25 Jun 2026 18:34:55 -0400
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-845b6d9bf39so177011b3a.1
 for <qemu-arm@nongnu.org>; Thu, 25 Jun 2026 15:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782426727; x=1783031527; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RW+IZvvF6GkkNpqRN02l7SdjWXYMFFvKHFm34aKmYgU=;
 b=CD6NTeZYzZ+iU/WcjE+HlWPN41eKCvhhZZs9j2XJBbFbBUP8ja2wAdk0BKFI1VnKJ9
 aMtdtLWH3Lxf+5ttgOT6mBD1TGEpLF1OrclBtVh1UJQVE8BsejPWQGNcTSfPY5cWBKKJ
 uFV90ZnO/rYIqMgsxNeC5cq+668d+a8QTQj/VkUSxcCU8UOCeVZdyphypVQvPsqWLpZU
 jMHVtp30qg73tC3QuJB2DdAKY/iIQ0Nc8boofQ+rTTf0tFuJVsfAbTtPP8kbun47aM8a
 odo9CD0nmuWsKqciaqrNeMp5BgukwQjb8AwMmUClzJxaQJ/h5vdvYz6yZ2AQBvfqsHfi
 b+Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782426727; x=1783031527;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=RW+IZvvF6GkkNpqRN02l7SdjWXYMFFvKHFm34aKmYgU=;
 b=VAmoipANaDj9Au/s+FVrUSxRC2nsS5jY5zXQnIKBrKyL0Hf0aTWcNdM2atRJ7NTplY
 7/Mla0sQK8rWVSNGs8yaG7WTNJN3lYxKB9rY76pFAehVBC+GKWSzQPxti0Bl4jW86jp/
 +afox8w8Suc0fDS8AbAYdS2qXBbr4IwAUQfPDl4BOy4bA3tCx+bQyyuaN12mPSVDno+s
 92MMF1FdMnelsFk9PLrY+4rOoxF/Tnb1vjvGi2SQNI832BoQLtQbwtO/osbrlJ+zNZCU
 KfC8QaGJg8mfdq4MS8OckrkHlb0697q/jUs8/RWr9oyc1kSTcWN535aP2La2Ua8BxT1p
 gBOA==
X-Gm-Message-State: AOJu0YxRY68eQOENkKkmv9GB0MdNVJPF5iT+0+SMvkLOpFH2t0tiOkEX
 KVdTTkOefdhZpPoduxS8+o2hMAYAXX4RruC7DH9uviNbrOECINslxq30SauqU2ViPXeN0odOF7L
 uRM0L
X-Gm-Gg: AfdE7cmHt9hbObFnZmn/xpOTq0Yy8kcIcScXY5SWZ6O59zfI7hEtW9TEI0XnKHxWuws
 U4Cl/IbiF9bxYRaqq6lkWuVxqsLY+sM6fSMZOZCTgPKj+ZQQNR4zTvpXdyrJhogeK7hBdo7PeEG
 QMghBbszZc/HhvzbLE3E45lEEfbbUYPFtmpTcT7Rc+CSBlTi46XFCX8Gx1q38+9WVmt17D/zzd/
 LOWeneq7n7riGsnhmIBI2RvZfbF6D54mDJcHOUdhgNG1H9UHnhnL0M1Rkz/3CBRBL+xvFx5jK1/
 ff8Bplwfuj93fvTwVN/fPNZKPwQNieQMiaWf26Uy71w3VbSA4ftO/ZKgA2XyMtQCjl/iEMF3wH8
 TDtZ80Pxt5g1Z7Hfkud222A2f1BJoZtblg3VLUEf1a384imfLi8AAwoRo7akiKkexraZgfW5/+h
 gaNujac/FQf5Ed/yeD5syPYeDzX0XMgKXq4a1R3TQtTiy/ZHYWhQ==
X-Received: by 2002:a05:6a00:c83:b0:82f:4725:f6d0 with SMTP id
 d2e1a72fcca58-84591cc5c60mr13545126b3a.29.1782426727401; 
 Thu, 25 Jun 2026 15:32:07 -0700 (PDT)
Received: from stoup.. (174-21-129-215.tukw.qwest.net. [174.21.129.215])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-845a412e5e9sm5450139b3a.54.2026.06.25.15.32.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jun 2026 15:32:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 08/15] target/arm: Implement FMOP4A (widening, 2-way,
 FP8 to FP16)
Date: Thu, 25 Jun 2026 15:31:53 -0700
Message-ID: <20260625223200.763198-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260625223200.763198-1-richard.henderson@linaro.org>
References: <20260625223200.763198-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-features.h        |  5 +++++
 target/arm/tcg/helper-fp8-defs.h |  1 +
 target/arm/tcg/fp8_helper.c      | 16 ++++++++++++++++
 target/arm/tcg/translate-sme.c   |  2 ++
 target/arm/tcg/sme.decode        |  3 +++
 5 files changed, 27 insertions(+)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index 4134dad994..4319a95921 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1812,6 +1812,11 @@ static inline bool isar_feature_aa64_sme_mop4_f8f32(const ARMISARegisters *id)
     return isar_feature_aa64_sme_mop4(id) && isar_feature_aa64_sme_f8f32(id);
 }
 
+static inline bool isar_feature_aa64_sme_mop4_f8f16(const ARMISARegisters *id)
+{
+    return isar_feature_aa64_sme_mop4(id) && isar_feature_aa64_sme_f8f16(id);
+}
+
 /*
  * Feature tests for "does this exist in either 32-bit or 64-bit?"
  */
diff --git a/target/arm/tcg/helper-fp8-defs.h b/target/arm/tcg/helper-fp8-defs.h
index 47f35a82dc..dedbd8541c 100644
--- a/target/arm/tcg/helper-fp8-defs.h
+++ b/target/arm/tcg/helper-fp8-defs.h
@@ -46,3 +46,4 @@ DEF_HELPER_FLAGS_5(sme_fvdot_idx_sb, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, env,
 DEF_HELPER_FLAGS_5(sme_fvdot_idx_hb, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, env, i32)
 
 DEF_HELPER_FLAGS_5(sme_fmop4a_sb, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_FLAGS_5(sme_fmop4a_hb, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, env, i32)
diff --git a/target/arm/tcg/fp8_helper.c b/target/arm/tcg/fp8_helper.c
index 46ef7758b3..9daaefacad 100644
--- a/target/arm/tcg/fp8_helper.c
+++ b/target/arm/tcg/fp8_helper.c
@@ -989,3 +989,19 @@ void HELPER(sme_fmop4a_sb)(void *vza, void *vzn, void *vzm,
     FP8MulContext ctx = fp8_mul_start(env, -1);
     sme_mop4(vza, vzn, vzm, &ctx, desc, sizeof(float32), inner_fmop4a_sb);
 }
+
+static void inner_fmop4a_hb(void *vd, void *vn, void *vm, void *vinfo)
+{
+    float16 *d = vd;
+    uint16_t *n = vn, *m = vm;
+    FP8MulContext *ctx = vinfo;
+
+    *d = f8dotadd_h(*n, *m, 2, *d, ctx);
+}
+
+void HELPER(sme_fmop4a_hb)(void *vza, void *vzn, void *vzm,
+                           CPUArchState *env, uint32_t desc)
+{
+    FP8MulContext ctx = fp8_mul_start(env, 0xf);
+    sme_mop4(vza, vzn, vzm, &ctx, desc, sizeof(float16), inner_fmop4a_hb);
+}
diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index 386ded1b90..b198c7c855 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -2090,3 +2090,5 @@ static bool do_mop4_fp8(DisasContext *s, arg_mop4 *a, MemOp esz,
 
 TRANS_FEAT(FMOP4A_sb, aa64_sme_mop4_f8f32,
            do_mop4_fp8, a, MO_32, gen_helper_sme_fmop4a_sb)
+TRANS_FEAT(FMOP4A_hb, aa64_sme_mop4_f8f16,
+           do_mop4_fp8, a, MO_16, gen_helper_sme_fmop4a_hb)
diff --git a/target/arm/tcg/sme.decode b/target/arm/tcg/sme.decode
index cbf6343822..43b6c32c04 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -1101,6 +1101,8 @@ LUTI4_s_4b      1100 0000 1001 101     1 00 00 00 ....0 zd:5    \
 @mop4_o3        .... .... ... m:1 .... .... .. n:1 ... . s:1 . zad:3 \
                 &mop4 zm=%mop4_zm zn=%mop4_zn
 
+@mop4_o1_s0     .... .... ... m:1 .... .... .. n:1 ... . .... zad:1 \
+                &mop4 zm=%mop4_zm zn=%mop4_zn s=0
 @mop4_o2_s0     .... .... ... m:1 .... .... .. n:1 ... . ... zad:2 \
                 &mop4 zm=%mop4_zm zn=%mop4_zn s=0
 
@@ -1113,3 +1115,4 @@ BFMOP4_sh       1000 0001 000. ...0 0000 00.. ..0. 00..         @mop4_o2
 FMOP4_sh        1000 0001 001. ...0 0000 00.. ..0. 00..         @mop4_o2
 
 FMOP4A_sb       1000 0000 011. ...0 0000 00.. ..00 00..         @mop4_o2_s0
+FMOP4A_hb       1000 0000 001. ...0 0000 00.. ..00 100.         @mop4_o1_s0
-- 
2.43.0


