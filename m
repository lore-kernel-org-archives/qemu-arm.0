Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8E34C5DF97
	for <qemu-arm@archiver.kernel.org>; Wed, 26 Aug 2026 17:43:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wzHeP-0000bU-4d; Wed, 26 Aug 2026 13:43:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wzHeB-0000EE-4d
 for qemu-arm@nongnu.org; Wed, 26 Aug 2026 13:42:47 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wzHe7-0004so-IK
 for qemu-arm@nongnu.org; Wed, 26 Aug 2026 13:42:46 -0400
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-cbedf433a99so1082531a12.2
 for <qemu-arm@nongnu.org>; Wed, 26 Aug 2026 10:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787766161; x=1788370961; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=4DTRMRX/m8M9HLcbkE5HBmAKiem3+hEkL/xDor/hWQs=;
 b=qhNhDa35CGVyeOT7UtcQi3l/q8etN/EeC9NT8QDVLkTbDbUMYEQuFBf1wkMLgX70zH
 J+axNDV+5FnnB4dQasrHr03d/wtWdM8oUbLzR0KYup1OMnnExIxGu80N18fOP9F3AbBl
 AabS5HdlEa/CKlEWE3bsDQubr9IHIjoUsQZAdLp8LUOE80QP4jcs8q+N0WCyDgJ6/ta5
 7abOKCjzF6rR15taCMfoBRGFmzsMyz3zRSMUqpQwzPwzhew0ST/3WuPLtH+JfK+cYHOz
 tCz/IhzizjoEoPZ6ONfui7ZH/MERK/9Dc4dxwuv1pOckhBhMynVCNHfJzO6UlxnL5461
 8eyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787766161; x=1788370961;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=4DTRMRX/m8M9HLcbkE5HBmAKiem3+hEkL/xDor/hWQs=;
 b=oVNNMxIxoUwbpclCzx5I5dVfNeik685/LfDR6Jetuyny0OiQSTOas2L70HBuo2EiY5
 T65drjBTsXnQr51aFGJSEBsGjLuKKi9g68FYfbnK56qmYYXMzyYHSYuFdSuA2pDxpcd1
 Rd9lo2dAxFMJWYp4A2WBuHazwrbe7YtywjM2STNu5sBh8Aeuw4M3XUW8JknKXK4QScLG
 /fcBgNUB01HiXEKRcO74xdKIx4XyGT7ar4nJu9lCcZsfqIHwt8xsiiEIDIvPN/0O3D5/
 emszajLPpoqM+y3qZDghtoSz+prkb8c2ZUbmHkmYiApGsGzsGIHlQVUIUoBHA/8IbFex
 8nHA==
X-Gm-Message-State: AFuF++lnL5iPhhD/G9hBbIMZgA2TigjjXoDDQ9yHFS+pr45X5lJ5iDfz
 C8EQXRJ4F19jORQXkwsTFXk2zM6bYMaVl3+xf4ReWb3XAwmIhw6lAdhQX2xny/bJS14=
X-Gm-Gg: AR+sD11uYu9Cqlo8MXWLKceys3/xu042Gj/4v8hX29jYHdQiu6fe7lvFSvlsaqN++TP
 rGrGJGgKDYPUyvvWwXyCIXELaN3EULPbC1FbZTIiJKTQly33Jeck9lmVDVDWxuadpj29/gP3/BK
 irCXovdbdu1bz87JGFLXR36XKcLRVxrtFPfVB1+19LNUjvhFvPyZz6K6JzEjY/6aBvKMmip5PME
 CCwcBfu7iJbgluAUTFHfBzT/gVHeJ62KQT/kie0ppjye9VxYZCQlAd2oUoxIdggDBrMCr3aCg3I
 PVn2OXe/GYjTPxnZJbKy6/KH79E9gVfnW9uxsFKki1FgVfCdp6dMJiCMnDLZcYGpNrX9UqrlBEC
 Dc9AMMxPKyXef2gtSaglu7CvwYYmEwTCcJgG8fb69QL0UEHtQng16/QnXFudyqYgkvFNAwSew/0
 itLHz1DLJtT1EJvNvjiMCT9p/zA5lnlIK726QGcC2bQpETsnHeXxisniJ1X0or0rd2EfjnqT5mj
 nR+zgwQ/T0xOWnGKQ==
X-Received: by 2002:a05:6a21:9202:b0:3c3:64cb:9b99 with SMTP id
 adf61e73a8af0-3cf76283ed6mr18676265637.6.1787766161249; 
 Wed, 26 Aug 2026 10:42:41 -0700 (PDT)
Received: from stoup (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cc1bec66020sm1260072a12.21.2026.08.26.10.42.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2026 10:42:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 23/25] target/arm: Implement AESDIMC
Date: Wed, 26 Aug 2026 10:42:10 -0700
Message-ID: <20260826174213.614571-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260826174213.614571-1-richard.henderson@linaro.org>
References: <20260826174213.614571-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/helper-defs.h   |  1 +
 target/arm/tcg/crypto_helper.c | 31 +++++++++++++++++++++++++++++++
 target/arm/tcg/translate-sve.c |  2 ++
 target/arm/tcg/sve.decode      |  3 +++
 4 files changed, 37 insertions(+)

diff --git a/target/arm/tcg/helper-defs.h b/target/arm/tcg/helper-defs.h
index 512054d2f5d..269ac515065 100644
--- a/target/arm/tcg/helper-defs.h
+++ b/target/arm/tcg/helper-defs.h
@@ -461,6 +461,7 @@ DEF_HELPER_FLAGS_4(crypto_aesd, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(crypto_aesmc, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(crypto_aesimc, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(crypto_aesemc, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(crypto_aesdimc, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
 DEF_HELPER_FLAGS_4(crypto_aese_idx, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(crypto_aesd_idx, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
diff --git a/target/arm/tcg/crypto_helper.c b/target/arm/tcg/crypto_helper.c
index ae677cdf209..07d008c1be5 100644
--- a/target/arm/tcg/crypto_helper.c
+++ b/target/arm/tcg/crypto_helper.c
@@ -224,6 +224,37 @@ void HELPER(crypto_aesemc)(void *vd, void *vn, void *vm, uint32_t desc)
     } while (s > 0);
 }
 
+void HELPER(crypto_aesdimc)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t opr_sz = simd_oprsz(desc);
+    intptr_t idx = simd_data(desc);
+    void *vm_idx = vm + idx * 16;
+    intptr_t s = opr_sz - 16;
+
+    do {
+        intptr_t base = ROUND_DOWN(s, 4 * 16);
+        AESState rk = *(AESState *)(vm_idx + base);
+        do {
+            AESState *ad = (AESState *)(vd + s);
+            AESState *st = (AESState *)(vn + s);
+            AESState t;
+
+            /* Like above: Arm AK comes first; api AK comes last */
+            if (HOST_BIG_ENDIAN) {
+                t.d[0] = st->d[1] ^ rk.d[1];
+                t.d[1] = st->d[0] ^ rk.d[0];
+                aesdec_ISB_ISR_IMC_AK(&t, &t, &aes_zero, false);
+                ad->d[0] = t.d[1];
+                ad->d[1] = t.d[0];
+            } else {
+                t.v = st->v ^ rk.v;
+                aesdec_ISB_ISR_IMC_AK(ad, &t, &aes_zero, false);
+            }
+            s -= 16;
+        } while (s >= base);
+    } while (s > 0);
+}
+
 /*
  * SHA-1 logical functions
  */
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 64ff2345307..1098cf0b388 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -8348,6 +8348,8 @@ TRANS_FEAT_STREAMING_IF(AESD_idx, aa64_sve_aes2, aa64_ssve_aes,
                         do_aes2_idx, a, gen_helper_crypto_aesd_idx)
 TRANS_FEAT_STREAMING_IF(AESEMC, aa64_sve_aes2, aa64_ssve_aes,
                         do_aes2_idx, a, gen_helper_crypto_aesemc)
+TRANS_FEAT_STREAMING_IF(AESDIMC, aa64_sve_aes2, aa64_ssve_aes,
+                        do_aes2_idx, a, gen_helper_crypto_aesdimc)
 
 TRANS_FEAT(FCVTNT_sh_m, aa64_sme_or_sve2, gen_gvec_fpst_arg_zpz,
            gen_helper_sve2_fcvtnt_sh, a, 0, FPST_A64)
diff --git a/target/arm/tcg/sve.decode b/target/arm/tcg/sve.decode
index 5832e0190c6..7030d81db7e 100644
--- a/target/arm/tcg/sve.decode
+++ b/target/arm/tcg/sve.decode
@@ -1991,6 +1991,9 @@ AESD_idx        01000101 00 1 .. .10111011 ..... ...00   @aes2_4
 AESEMC          01000101 00 1 .. .11111010 ..... ....0   @aes2_2
 AESEMC          01000101 00 1 .. .11111010 ..... ...00   @aes2_4
 
+AESDIMC         01000101 00 1 .. .11111011 ..... ....0   @aes2_2
+AESDIMC         01000101 00 1 .. .11111011 ..... ...00   @aes2_4
+
 # SVE2 crypto constructive binary operations
 SM4EKEY         01000101 00 1 ..... 11110 0 ..... .....  @rd_rn_rm_e0
 RAX1            01000101 00 1 ..... 11110 1 ..... .....  @rd_rn_rm_e0
-- 
2.53.0


