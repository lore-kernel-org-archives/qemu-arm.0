Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp3792387dye;
        Wed, 2 Jul 2025 06:01:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU9gbYjDx22B4Mwax/ifBITZ76vKNPxdrJyNoFnlFCaDAUH4jJha0psfJjU1MG8uZRGKhxOTObqu9CcpA==@linaro.org
X-Google-Smtp-Source: AGHT+IEJWP762TxdFjbLKt8Xo5ednqlzzKCq45Cn7Dmyo8SCmDzBVUXIzaMp7cqNrTFwwHnMvtUt
X-Received: by 2002:a05:620a:44d4:b0:7d4:6257:3a14 with SMTP id af79cd13be357-7d5c47f6e75mr515810985a.55.1751461260976;
        Wed, 02 Jul 2025 06:01:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751461260; cv=none;
        d=google.com; s=arc-20240605;
        b=IwwixnXyQkD/hYihEz7arATAgpINX5AUKlTUrY3xdpCt4MMTkEBIeXNN7vFqmLFAkD
         gQZXB8lakg4Yw4zB7h0laG27DTpuqMBuTpXhcsV6J9fMkbVA8Vtd0Erwai/w+ALuxY1k
         +UKAwdbnjmTGPfXlinG9WcG5VLZPSdTx6a+GYVSPpVdA9Xzpq5pupR867bh7GVDOZl6Z
         kGLHBKLiqbz4/mkoKGSE/5nPfHrRgoVduspiZp7Z2TyzOPW6ZRWP8rRC+4DXRGycH5hf
         mG2OHzORRgRz8em58mui3KkVG0MM8Sg5eHod2ylBKdenQ27O/RmUCmNnmaavAZ+lblbW
         GpSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=TIQHpPeuKZzV1rP5pPxwpxTkr9f6iYIg/XVvMM56LWg=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=hRc8ngBG33u0uRCERyF8gVE8iTKGvW1EFvVP+sBijCvPkLk6YUli2fQM5cyw6/yZ/0
         iE8UKYppPm5b6/o/37e5Z6zq5WwoAZcIXeTcSO8HLoJiUC6IbEPKdDxrOLcJt23b41/3
         8AxzamIzK7zSuvVjkdnY9xdXeNYJK92D38SsFQiPHzf2zBr21DzT5IxVeVsnag5l72WU
         LcPeNugPo9Of83r2l6RIN7oKo6pfCCg8hTNRw3f7NG/aT6joaP5Vg1LiWz7G9zdQsnuP
         Kvde6AZZiG983EA7HBkCqKmcIOo1FtsRSC8CP0tJC6XnZFMlZ1vlBqyPc9Zw/5qPR8N1
         YnLA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=T5PIKamE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d458085300si762598085a.358.2025.07.02.06.01.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Jul 2025 06:01:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=T5PIKamE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uWwqQ-0006aN-20; Wed, 02 Jul 2025 08:45:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWwn9-0008Vh-LE
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 08:42:25 -0400
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWwn0-0003B6-0P
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 08:42:22 -0400
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-2eaad5eb1easo3613384fac.3
 for <qemu-arm@nongnu.org>; Wed, 02 Jul 2025 05:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751460129; x=1752064929; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TIQHpPeuKZzV1rP5pPxwpxTkr9f6iYIg/XVvMM56LWg=;
 b=T5PIKamE0ijB/dCK1gyNZug2GkJ31aVo8qg8oZBFLUkiOeBgLgbET9S6cOePj7ne5/
 G1ODAqq4Ycq1XZVU1Eb4ZcrpLGhPINc/MiAN66870eLq1ZNUU3bucF2/Teh79PbyB50P
 4O6ivJ6+NaCR1w7dV8oySNocJtbmry5MmFpzE42R+eQoWydCBpve1fyF8Wwkmam0uBzZ
 l54TaAZybcZgfIS+iS8beR9D94esaAR+u8eT1acBQnHDLjB77q/yWWAO5eHskDF/mov5
 T/XyK31Yp0SjoWMJtiN1mqoTEMT4ZSYbyf2HZKBVbpw1XCDCDK+3sHgFnapJ7Nd84p84
 9E+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751460129; x=1752064929;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TIQHpPeuKZzV1rP5pPxwpxTkr9f6iYIg/XVvMM56LWg=;
 b=CjpH0hfHa0cS6OsrPc4lTfFED2Y/3b69QGkzYjSre5nF+YXWuSB432nO5Wl/TKbqVf
 VrXQtjq/1XAKspHajG9lgpJLKa9fPxtwlv2RfEDPdFp/pllup9dOlgzVjvf9gWPBA/39
 th/TjhlCqSkoH88Xw7NYLiLOzhT9vVW/UDmmW+ng2TYLr4d8l88c4HBB8gatA+SSvwt5
 ljGojmniAXHdBn1wn8IUOusviF647wQj2kOeCT/qlBLMmzSg3B5FAauOhm84OsaUaC3c
 SxMG0/PaUng0sAalpRJ4OM2KmIppb62MLX5Jd+4YoWOs/+9A88gMISMDFVJQCcyrFIu6
 hWyw==
X-Gm-Message-State: AOJu0YwUVcnUlQajajmT7JxAgASKNLcMI3F+rPcKE1Vxl+p0s9/Y1eVx
 /V3PPEor4BsY4aQhfG+AMHKVOxbnprRMRAL6qW4Kp8BQ5/zmu4SeMim2NYKkbf0ZRJg=
X-Gm-Gg: ASbGnctD6fiGCMghrylFF6bLh11xo93jcJ/eopoZI8VD0EBC40S3ykq6+FGlRppORb9
 0nnGEWdBojrurmS+8Z+pGgqLzydi+CM3jU2RS6shj8K/8J2vn3ss2AXgH/Na1Syd6BtBTEr0Uqp
 s3amhfEipa7nKIFj0wdPsj0l6BgdKUsj9x7ITTJ5S7xktHVnFKyjoLmX1T3DElDaf+MtiJ/HU/f
 VQHiiygmuMDk+pLCQpEQ745mpXgKi+oIfLCeXSJT0yxZlGOuLdsu6YTpyKHwvXKFGjHvzJZaVZn
 tWYrIMgzcXl//YMVDz5bGR72X3Gd0Vilhgrk+4eXZXZWCqTAHhhqSgsCIVNFw+2e37cKCg==
X-Received: by 2002:a05:6871:6183:b0:2d5:4b92:a2fc with SMTP id
 586e51a60fabf-2f5a8b9475amr1910720fac.3.1751460128952; 
 Wed, 02 Jul 2025 05:42:08 -0700 (PDT)
Received: from stoup.. ([187.210.107.185]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2efd50f7d89sm3907004fac.34.2025.07.02.05.42.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 05:42:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v3 89/97] target/arm: Implement LUTI2, LUTI4 for SME2/SME2p1
Date: Wed,  2 Jul 2025 06:34:02 -0600
Message-ID: <20250702123410.761208-90-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702123410.761208-1-richard.henderson@linaro.org>
References: <20250702123410.761208-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::31;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x31.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: THIhx7Y/GFh7

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/helper.h        | 24 ++++++++++
 target/arm/tcg/vec_internal.h  | 16 +++++++
 target/arm/tcg/sve_helper.c    | 15 ------
 target/arm/tcg/translate-sme.c | 56 ++++++++++++++++++++++
 target/arm/tcg/vec_helper.c    | 88 ++++++++++++++++++++++++++++++++++
 target/arm/tcg/sme.decode      | 42 ++++++++++++++++
 6 files changed, 226 insertions(+), 15 deletions(-)

diff --git a/target/arm/tcg/helper.h b/target/arm/tcg/helper.h
index 392bf7b9b5..d9565c8069 100644
--- a/target/arm/tcg/helper.h
+++ b/target/arm/tcg/helper.h
@@ -1188,3 +1188,27 @@ DEF_HELPER_FLAGS_4(gvec_uminp_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
 DEF_HELPER_FLAGS_3(gvec_urecpe_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(gvec_ursqrte_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sme2_luti2_1b, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
+DEF_HELPER_FLAGS_4(sme2_luti2_1h, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
+DEF_HELPER_FLAGS_4(sme2_luti2_1s, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
+
+DEF_HELPER_FLAGS_4(sme2_luti2_2b, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
+DEF_HELPER_FLAGS_4(sme2_luti2_2h, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
+DEF_HELPER_FLAGS_4(sme2_luti2_2s, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
+
+DEF_HELPER_FLAGS_4(sme2_luti2_4b, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
+DEF_HELPER_FLAGS_4(sme2_luti2_4h, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
+DEF_HELPER_FLAGS_4(sme2_luti2_4s, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
+
+DEF_HELPER_FLAGS_4(sme2_luti4_1b, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
+DEF_HELPER_FLAGS_4(sme2_luti4_1h, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
+DEF_HELPER_FLAGS_4(sme2_luti4_1s, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
+
+DEF_HELPER_FLAGS_4(sme2_luti4_2b, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
+DEF_HELPER_FLAGS_4(sme2_luti4_2h, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
+DEF_HELPER_FLAGS_4(sme2_luti4_2s, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
+
+DEF_HELPER_FLAGS_4(sme2_luti4_4b, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
+DEF_HELPER_FLAGS_4(sme2_luti4_4h, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
+DEF_HELPER_FLAGS_4(sme2_luti4_4s, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
diff --git a/target/arm/tcg/vec_internal.h b/target/arm/tcg/vec_internal.h
index 236927c640..ad3bfabc34 100644
--- a/target/arm/tcg/vec_internal.h
+++ b/target/arm/tcg/vec_internal.h
@@ -337,6 +337,22 @@ bfloat16 helper_sme2_ah_fmin_b16(bfloat16 a, bfloat16 b, float_status *fpst);
 float32 sve_f16_to_f32(float16 f, float_status *fpst);
 float16 sve_f32_to_f16(float32 f, float_status *fpst);
 
+/* Extract @len bits from an array of uint64_t at offset @pos bits. */
+static inline uint64_t extractn(uint64_t *p, unsigned pos, unsigned len)
+{
+    uint64_t x;
+
+    p += pos / 64;
+    pos = pos % 64;
+
+    x = p[0];
+    if (pos + len > 64) {
+        x = (x >> pos) | (p[1] << (-pos & 63));
+        pos = 0;
+    }
+    return extract64(x, pos, len);
+}
+
 /*
  * Decode helper functions for predicate as counter.
  */
diff --git a/target/arm/tcg/sve_helper.c b/target/arm/tcg/sve_helper.c
index dfce9697e2..70baa7a6b0 100644
--- a/target/arm/tcg/sve_helper.c
+++ b/target/arm/tcg/sve_helper.c
@@ -3035,21 +3035,6 @@ void HELPER(sve_rev_d)(void *vd, void *vn, uint32_t desc)
     }
 }
 
-static uint64_t extractn(uint64_t *p, unsigned pos, unsigned len)
-{
-    uint64_t x;
-
-    p += pos / 64;
-    pos = pos % 64;
-
-    x = p[0];
-    if (pos + len > 64) {
-        x = (x >> pos) | (p[1] << (-pos & 63));
-        pos = 0;
-    }
-    return extract64(x, pos, len);
-}
-
 static void depositn(uint64_t *p, unsigned pos, unsigned len, uint64_t val)
 {
     p += pos / 64;
diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index 9592f6a996..d38b8a5ca2 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -1697,3 +1697,59 @@ static bool trans_SEL(DisasContext *s, arg_SEL *a)
     }
     return true;
 }
+
+static bool do_lut(DisasContext *s, arg_lut *a,
+                   gen_helper_gvec_2_ptr *fn, bool strided)
+{
+    if (sme_sm_enabled_check(s) && sme2_zt0_enabled_check(s)) {
+        int svl = streaming_vec_reg_size(s);
+        tcg_gen_gvec_2_ptr(vec_full_reg_offset(s, a->zd),
+                           vec_full_reg_offset(s, a->zn),
+                           tcg_env, svl, svl, strided | (a->idx << 1), fn);
+    }
+    return true;
+}
+
+TRANS_FEAT(LUTI2_c_1b, aa64_sme2, do_lut, a, gen_helper_sme2_luti2_1b, false)
+TRANS_FEAT(LUTI2_c_1h, aa64_sme2, do_lut, a, gen_helper_sme2_luti2_1h, false)
+TRANS_FEAT(LUTI2_c_1s, aa64_sme2, do_lut, a, gen_helper_sme2_luti2_1s, false)
+
+TRANS_FEAT(LUTI2_c_2b, aa64_sme2, do_lut, a, gen_helper_sme2_luti2_2b, false)
+TRANS_FEAT(LUTI2_c_2h, aa64_sme2, do_lut, a, gen_helper_sme2_luti2_2h, false)
+TRANS_FEAT(LUTI2_c_2s, aa64_sme2, do_lut, a, gen_helper_sme2_luti2_2s, false)
+
+TRANS_FEAT(LUTI2_c_4b, aa64_sme2, do_lut, a, gen_helper_sme2_luti2_4b, false)
+TRANS_FEAT(LUTI2_c_4h, aa64_sme2, do_lut, a, gen_helper_sme2_luti2_4h, false)
+TRANS_FEAT(LUTI2_c_4s, aa64_sme2, do_lut, a, gen_helper_sme2_luti2_4s, false)
+
+TRANS_FEAT(LUTI4_c_1b, aa64_sme2, do_lut, a, gen_helper_sme2_luti4_1b, false)
+TRANS_FEAT(LUTI4_c_1h, aa64_sme2, do_lut, a, gen_helper_sme2_luti4_1h, false)
+TRANS_FEAT(LUTI4_c_1s, aa64_sme2, do_lut, a, gen_helper_sme2_luti4_1s, false)
+
+TRANS_FEAT(LUTI4_c_2b, aa64_sme2, do_lut, a, gen_helper_sme2_luti4_2b, false)
+TRANS_FEAT(LUTI4_c_2h, aa64_sme2, do_lut, a, gen_helper_sme2_luti4_2h, false)
+TRANS_FEAT(LUTI4_c_2s, aa64_sme2, do_lut, a, gen_helper_sme2_luti4_2s, false)
+
+TRANS_FEAT(LUTI4_c_4h, aa64_sme2, do_lut, a, gen_helper_sme2_luti4_4h, false)
+TRANS_FEAT(LUTI4_c_4s, aa64_sme2, do_lut, a, gen_helper_sme2_luti4_4s, false)
+
+static bool do_lut_s4(DisasContext *s, arg_lut *a, gen_helper_gvec_2_ptr *fn)
+{
+    return !(a->zd & 0b01100) && do_lut(s, a, fn, true);
+}
+
+static bool do_lut_s8(DisasContext *s, arg_lut *a, gen_helper_gvec_2_ptr *fn)
+{
+    return !(a->zd & 0b01000) && do_lut(s, a, fn, true);
+}
+
+TRANS_FEAT(LUTI2_s_2b, aa64_sme2p1, do_lut_s8, a, gen_helper_sme2_luti2_2b)
+TRANS_FEAT(LUTI2_s_2h, aa64_sme2p1, do_lut_s8, a, gen_helper_sme2_luti2_2h)
+
+TRANS_FEAT(LUTI2_s_4b, aa64_sme2p1, do_lut_s4, a, gen_helper_sme2_luti2_4b)
+TRANS_FEAT(LUTI2_s_4h, aa64_sme2p1, do_lut_s4, a, gen_helper_sme2_luti2_4h)
+
+TRANS_FEAT(LUTI4_s_2b, aa64_sme2p1, do_lut_s8, a, gen_helper_sme2_luti4_2b)
+TRANS_FEAT(LUTI4_s_2h, aa64_sme2p1, do_lut_s8, a, gen_helper_sme2_luti4_2h)
+
+TRANS_FEAT(LUTI4_s_4h, aa64_sme2p1, do_lut_s4, a, gen_helper_sme2_luti4_4h)
diff --git a/target/arm/tcg/vec_helper.c b/target/arm/tcg/vec_helper.c
index e1ded43af7..91881d68fd 100644
--- a/target/arm/tcg/vec_helper.c
+++ b/target/arm/tcg/vec_helper.c
@@ -3443,3 +3443,91 @@ void HELPER(gvec_ursqrte_s)(void *vd, void *vn, uint32_t desc)
     }
     clear_tail(d, opr_sz, simd_maxsz(desc));
 }
+
+static inline void do_lut_b(void *zd, uint64_t *indexes, uint64_t *table,
+                            unsigned elements, unsigned segbase,
+                            unsigned dstride, unsigned isize,
+                            unsigned tsize, unsigned nreg)
+{
+    for (unsigned r = 0; r < nreg; ++r) {
+        uint8_t *dst = zd + dstride * r;
+        unsigned base = segbase + r * elements;
+
+        for (unsigned e = 0; e < elements; ++e) {
+            unsigned index = extractn(indexes, (base + e) * isize, isize);
+            dst[H1(e)] = extractn(table, index * tsize, 8);
+        }
+    }
+}
+
+static inline void do_lut_h(void *zd, uint64_t *indexes, uint64_t *table,
+                            unsigned elements, unsigned segbase,
+                            unsigned dstride, unsigned isize,
+                            unsigned tsize, unsigned nreg)
+{
+    for (unsigned r = 0; r < nreg; ++r) {
+        uint16_t *dst = zd + dstride * r;
+        unsigned base = segbase + r * elements;
+
+        for (unsigned e = 0; e < elements; ++e) {
+            unsigned index = extractn(indexes, (base + e) * isize, isize);
+            dst[H2(e)] = extractn(table, index * tsize, 16);
+        }
+    }
+}
+
+static inline void do_lut_s(void *zd, uint64_t *indexes, uint32_t *table,
+                            unsigned elements, unsigned segbase,
+                            unsigned dstride, unsigned isize,
+                            unsigned tsize, unsigned nreg)
+{
+    for (unsigned r = 0; r < nreg; ++r) {
+        uint32_t *dst = zd + dstride * r;
+        unsigned base = segbase + r * elements;
+
+        for (unsigned e = 0; e < elements; ++e) {
+            unsigned index = extractn(indexes, (base + e) * isize, isize);
+            dst[H4(e)] = table[H4(index)];
+        }
+    }
+}
+
+#define DO_SME2_LUT(ISIZE, NREG, SUFF, ESIZE) \
+void helper_sme2_luti##ISIZE##_##NREG##SUFF                             \
+    (void *zd, void *zn, CPUARMState *env, uint32_t desc)               \
+{                                                                       \
+    unsigned vl = simd_oprsz(desc);                                     \
+    unsigned strided = extract32(desc, SIMD_DATA_SHIFT, 1);             \
+    unsigned idx = extract32(desc, SIMD_DATA_SHIFT + 1, 4);             \
+    unsigned elements = vl / ESIZE;                                     \
+    unsigned dstride = (!strided ? 1 : NREG == 4 ? 4 : 8);              \
+    unsigned segments = (ESIZE * 8) / (ISIZE * NREG);                   \
+    unsigned segment = idx & (segments - 1);                            \
+    ARMVectorReg indexes;                                               \
+    memcpy(&indexes, zn, vl);                                           \
+    do_lut_##SUFF(zd, indexes.d, (void *)env->za_state.zt0, elements,   \
+                  segment * NREG * elements,                            \
+                  dstride * sizeof(ARMVectorReg), ISIZE, 32, NREG);     \
+}
+
+DO_SME2_LUT(2,1,b, 1)
+DO_SME2_LUT(2,1,h, 2)
+DO_SME2_LUT(2,1,s, 4)
+DO_SME2_LUT(2,2,b, 1)
+DO_SME2_LUT(2,2,h, 2)
+DO_SME2_LUT(2,2,s, 4)
+DO_SME2_LUT(2,4,b, 1)
+DO_SME2_LUT(2,4,h, 2)
+DO_SME2_LUT(2,4,s, 4)
+
+DO_SME2_LUT(4,1,b, 1)
+DO_SME2_LUT(4,1,h, 2)
+DO_SME2_LUT(4,1,s, 4)
+DO_SME2_LUT(4,2,b, 1)
+DO_SME2_LUT(4,2,h, 2)
+DO_SME2_LUT(4,2,s, 4)
+DO_SME2_LUT(4,4,b, 1)
+DO_SME2_LUT(4,4,h, 2)
+DO_SME2_LUT(4,4,s, 4)
+
+#undef DO_SME2_LUT
diff --git a/target/arm/tcg/sme.decode b/target/arm/tcg/sme.decode
index f7e4143b7d..5a5b8ff8a5 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -945,3 +945,45 @@ ZERO_za         11000000 000011 110 .. 0000000000 00.   \
                 &zero_za ngrp=2 nvec=4 rv=%mova_rv off=%off1_x4
 ZERO_za         11000000 000011 111 .. 0000000000 00.   \
                 &zero_za ngrp=4 nvec=4 rv=%mova_rv off=%off1_x4
+
+### SME Lookup Table Read
+
+&lut            zd zn idx
+
+# LUTI2, consecutive
+LUTI2_c_1b      1100 0000 1100 11 idx:4    00 00 zn:5 zd:5      &lut
+LUTI2_c_1h      1100 0000 1100 11 idx:4    01 00 zn:5 zd:5      &lut
+LUTI2_c_1s      1100 0000 1100 11 idx:4    10 00 zn:5 zd:5      &lut
+
+LUTI2_c_2b      1100 0000 1000 11 idx:3  1 00 00 zn:5 .... 0    &lut zd=%zd_ax2
+LUTI2_c_2h      1100 0000 1000 11 idx:3  1 01 00 zn:5 .... 0    &lut zd=%zd_ax2
+LUTI2_c_2s      1100 0000 1000 11 idx:3  1 10 00 zn:5 .... 0    &lut zd=%zd_ax2
+
+LUTI2_c_4b      1100 0000 1000 11 idx:2 10 00 00 zn:5 ... 00    &lut zd=%zd_ax4
+LUTI2_c_4h      1100 0000 1000 11 idx:2 10 01 00 zn:5 ... 00    &lut zd=%zd_ax4
+LUTI2_c_4s      1100 0000 1000 11 idx:2 10 10 00 zn:5 ... 00    &lut zd=%zd_ax4
+
+# LUTI2, strided (must check zd alignment)
+LUTI2_s_2b      1100 0000 1001 11 idx:3  1 00 00 zn:5 zd:5      &lut
+LUTI2_s_2h      1100 0000 1001 11 idx:3  1 01 00 zn:5 zd:5      &lut
+
+LUTI2_s_4b      1100 0000 1001 11 idx:2 10 00 00 zn:5 zd:5      &lut
+LUTI2_s_4h      1100 0000 1001 11 idx:2 10 01 00 zn:5 zd:5      &lut
+
+# LUTI4, consecutive
+LUTI4_c_1b      1100 0000 1100 101 idx:3    00 00 zn:5 zd:5     &lut
+LUTI4_c_1h      1100 0000 1100 101 idx:3    01 00 zn:5 zd:5     &lut
+LUTI4_c_1s      1100 0000 1100 101 idx:3    10 00 zn:5 zd:5     &lut
+
+LUTI4_c_2b      1100 0000 1000 101 idx:2  1 00 00 zn:5 .... 0   &lut zd=%zd_ax2
+LUTI4_c_2h      1100 0000 1000 101 idx:2  1 01 00 zn:5 .... 0   &lut zd=%zd_ax2
+LUTI4_c_2s      1100 0000 1000 101 idx:2  1 10 00 zn:5 .... 0   &lut zd=%zd_ax2
+
+LUTI4_c_4h      1100 0000 1000 101 idx:1 10 01 00 zn:5 ... 00   &lut zd=%zd_ax4
+LUTI4_c_4s      1100 0000 1000 101 idx:1 10 10 00 zn:5 ... 00   &lut zd=%zd_ax4
+
+# LUTI4, strided (must check zd alignment)
+LUTI4_s_2b      1100 0000 1001 101 idx:2  1 00 00 zn:5 zd:5     &lut
+LUTI4_s_2h      1100 0000 1001 101 idx:2  1 01 00 zn:5 zd:5     &lut
+
+LUTI4_s_4h      1100 0000 1001 101 idx:1 10 01 00 zn:5 zd:5     &lut
-- 
2.43.0

