Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp368214nji;
        Wed, 11 Sep 2024 19:42:38 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWJzgZZyBRiLF1VqamzIauPb8tJjAgk4ISv9iSpsJo4QpPDwY1DJWFGldCFCG4jD/2igJAmTO9VfnYoCg==@linaro.org
X-Google-Smtp-Source: AGHT+IGEBrZkGXqzee3eN0zC5rASIwLUEXC9gPWOzA9kQWXoW4fsJQY7ZMvE1Q3N2xMQVIil4whv
X-Received: by 2002:a05:622a:189f:b0:458:3324:fff1 with SMTP id d75a77b69052e-458603cb537mr20717971cf.48.1726108958545;
        Wed, 11 Sep 2024 19:42:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726108958; cv=none;
        d=google.com; s=arc-20240605;
        b=jNH9NH8HtHOf5EKWvsjQvc4sI5JyJcVBEWtxn8jw2uZ5Qd4wybyyAYDSBAn6iDtCv7
         qxBF10bO+WQVNfCnpsyXc/qQEko6Nqc4oDmTGkQw0UiiF/x21SW8Bps6u+Bwr45V8FCX
         9l45nS3JXUcutnGJTFUwrGsOJsAMNpAJq6ukIToOct4uV7CjILZt66p2GCe/m8OF5sJ7
         NYmbts3lQMSWjzxnwKhtvIH3Nor14cuDnlHlZ+Q5F+UK09BmMzsLmvw8laIlIbRxJSNM
         aqFlQ/Ejrz0HweFbjpB2gdDdo30y8jJloc49FSvpSoEt07nkS3t2IMcKQrbTkub2zJ1T
         Twxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=zRNfpJRjZxrz6sJrwEuh2h0rfe1pxZcw68KhhXlHk4Q=;
        fh=ZhBia3nL9o1nuf7SbgdYn/0pDmAeja6gisyWXi2cqYE=;
        b=O889+cawHweEbkenv11vaYBMKR12w8QwcvbOJxBr0ydqHvc4Hn/U3Wy6p5C0CFoTcn
         IeWaB4Il9ta2iKNkoLX5B4+60pJBa58Zf2bSUGVJ82tZMp4SX3pQ220+NZkkqyxG7tnF
         9jcX0Du05G2HmPBxtmjoDfXd+u6m4nirzcriDSopZDiD3EFe+0SFCSgAHAXLYhOIEjYJ
         afCW+GcCXKjURSJDNU3ysB19EZzaogcSDPrwa1Q5jrTLn26mwC2o3zY4DoI9zcJryNr3
         IOwXe98ZCk1AHejQTqsgO+241IxZjEzeCUKnjzoPfj9oRXBmtCPJYdLaY7ezTJBGf8J6
         Onnw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=t78a3QH4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45822f8284asi119147661cf.423.2024.09.11.19.42.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Sep 2024 19:42:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=t78a3QH4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1soZm9-0003ir-IS; Wed, 11 Sep 2024 22:41:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1soZm2-0003DM-ST
 for qemu-devel@nongnu.org; Wed, 11 Sep 2024 22:41:35 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1soZm0-0004Cn-WD
 for qemu-devel@nongnu.org; Wed, 11 Sep 2024 22:41:34 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-201d5af11a4so5817935ad.3
 for <qemu-devel@nongnu.org>; Wed, 11 Sep 2024 19:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726108892; x=1726713692; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zRNfpJRjZxrz6sJrwEuh2h0rfe1pxZcw68KhhXlHk4Q=;
 b=t78a3QH4v26VcVyPlbpowVJBCxHVMm1rKItqLPooFbZYewE7eEHINKDkELieaxzprw
 8AIGGZ5NEtKKco9WGvfC2ntVsi0mmSBiOdQZmiOWkgYYMo3UpPYErI0c30nN4OmfLNzm
 PtIsqFRGim22wgtew0WzFmLy8gRtIzoMVAKeGoWWg3cXRFuzE3ehWwj6Xq5+PCvkT2zO
 7ZJyCaeDF17Y0/+5REVd4h+QG49UVVCN/MQUx8ZheYl6yuY2DRlCMzGlNZNJmCBFeQ7M
 xuYm8F6pigDNcCsBOXh+hP5V9Xo7OQ14ZLV/VIIU1Jodw/qbCcwVQilwcFpYu3iASBy4
 OI/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726108892; x=1726713692;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zRNfpJRjZxrz6sJrwEuh2h0rfe1pxZcw68KhhXlHk4Q=;
 b=jITpwitHCo4RohkhD+UB7i94GTLAEyZVnRiA3t6dzvzjNr7AVJ2jnSSHN6krO3p553
 hQ5byIHApD39ax/Hc0dmyUJYUMYLErSRkIGK7JxAkOBktDfWTM/ShyiH5vtMFr4Z7fbw
 EVrE5SBdrldM0d5b2uL5/AgxVwbKO6/DZ7//G77SovJ0ogcyKFf9b+NW7VCaOkEAaX7Y
 LWRKy7CjI26DpVRKWpbSqWqxWZ87YBZU/SBSyl6vpw7Qv49QZQ65RXyoL4wjZSu8Tt03
 o2MFWXipPUskw7S3nnodSlUZhmsxIwtfGWUpb4i8fU7GovuAi9bUC3eDnDLNmpJ8jzoe
 Nk6g==
X-Gm-Message-State: AOJu0YxWtopbM48GZVvUOadIOx5nTXs5D3s9QHr26poDxO1mtUz7exJ3
 JLCMiB6MTi8WUG06VzHI9vxu2kQiX5JN3Cvof2n4uunMnZBJe2dX9KOggdR4Ynjtg1zxx4GmpSP
 U
X-Received: by 2002:a17:902:da8c:b0:206:fd9d:b88d with SMTP id
 d9443c01a7336-2076e44def0mr17935605ad.61.1726108891645; 
 Wed, 11 Sep 2024 19:41:31 -0700 (PDT)
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2076afe9c61sm5635915ad.231.2024.09.11.19.41.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2024 19:41:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 17/29] target/arm: Convert handle_vec_simd_shli to
 decodetree
Date: Wed, 11 Sep 2024 19:41:02 -0700
Message-ID: <20240912024114.1097832-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240912024114.1097832-1-richard.henderson@linaro.org>
References: <20240912024114.1097832-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: sWK0xvf9dK0V

This includes SHL and SLI.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 33 +++------------------------------
 target/arm/tcg/a64.decode      | 15 +++++++++++++++
 2 files changed, 18 insertions(+), 30 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 5c76cdf101..1225aac665 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -6980,6 +6980,8 @@ TRANS(URSHR_v, do_vec_shift_imm, a, gen_gvec_urshr)
 TRANS(SRSRA_v, do_vec_shift_imm, a, gen_gvec_srsra)
 TRANS(URSRA_v, do_vec_shift_imm, a, gen_gvec_ursra)
 TRANS(SRI_v, do_vec_shift_imm, a, gen_gvec_sri)
+TRANS(SHL_v, do_vec_shift_imm, a, tcg_gen_gvec_shli)
+TRANS(SLI_v, do_vec_shift_imm, a, gen_gvec_sli);
 
 /* Shift a TCGv src by TCGv shift_amount, put result in dst.
  * Note that it is the caller's responsibility to ensure that the
@@ -10445,33 +10447,6 @@ static void disas_simd_scalar_two_reg_misc(DisasContext *s, uint32_t insn)
     }
 }
 
-/* SHL/SLI - Vector shift left */
-static void handle_vec_simd_shli(DisasContext *s, bool is_q, bool insert,
-                                 int immh, int immb, int opcode, int rn, int rd)
-{
-    int size = 32 - clz32(immh) - 1;
-    int immhb = immh << 3 | immb;
-    int shift = immhb - (8 << size);
-
-    /* Range of size is limited by decode: immh is a non-zero 4 bit field */
-    assert(size >= 0 && size <= 3);
-
-    if (extract32(immh, 3, 1) && !is_q) {
-        unallocated_encoding(s);
-        return;
-    }
-
-    if (!fp_access_check(s)) {
-        return;
-    }
-
-    if (insert) {
-        gen_gvec_fn2i(s, is_q, rd, rn, shift, gen_gvec_sli, size);
-    } else {
-        gen_gvec_fn2i(s, is_q, rd, rn, shift, tcg_gen_gvec_shli, size);
-    }
-}
-
 /* USHLL/SHLL - Vector shift left with widening */
 static void handle_vec_simd_wshli(DisasContext *s, bool is_q, bool is_u,
                                  int immh, int immb, int opcode, int rn, int rd)
@@ -10585,9 +10560,6 @@ static void disas_simd_shift_imm(DisasContext *s, uint32_t insn)
     }
 
     switch (opcode) {
-    case 0x0a: /* SHL / SLI */
-        handle_vec_simd_shli(s, is_q, is_u, immh, immb, opcode, rn, rd);
-        break;
     case 0x10: /* SHRN */
     case 0x11: /* RSHRN / SQRSHRUN */
         if (is_u) {
@@ -10628,6 +10600,7 @@ static void disas_simd_shift_imm(DisasContext *s, uint32_t insn)
     case 0x04: /* SRSHR / URSHR (rounding) */
     case 0x06: /* SRSRA / URSRA (accum + rounding) */
     case 0x08: /* SRI */
+    case 0x0a: /* SHL / SLI */
         unallocated_encoding(s);
         return;
     }
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 74ba1fa07c..77b860a3f2 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -1205,6 +1205,11 @@ FMOVI_s         0001 1110 .. 1 imm:8 100 00000 rd:5         esz=%esz_hsd
 @q_shri_d       . 1 .. ..... 1 ...... ..... . rn:5 rd:5     \
                 &qrri_e esz=3 imm=%neon_rshift_i6 q=1
 
+@q_shli_b       . q:1 .. ..... 0001 imm:3 ..... . rn:5 rd:5 &qrri_e esz=0
+@q_shli_h       . q:1 .. ..... 001  imm:4 ..... . rn:5 rd:5 &qrri_e esz=1
+@q_shli_s       . q:1 .. ..... 01   imm:5 ..... . rn:5 rd:5 &qrri_e esz=2
+@q_shli_d       . 1   .. ..... 1    imm:6 ..... . rn:5 rd:5 &qrri_e esz=3 q=1
+
 FMOVI_v_h       0 q:1 00 1111 00000 ... 1111 11 ..... rd:5  %abcdefgh
 
 # MOVI, MVNI, ORR, BIC, FMOV are all intermixed via cmode.
@@ -1254,3 +1259,13 @@ SRI_v           0.10 11110 .... ... 01000 1 ..... .....     @q_shri_b
 SRI_v           0.10 11110 .... ... 01000 1 ..... .....     @q_shri_h
 SRI_v           0.10 11110 .... ... 01000 1 ..... .....     @q_shri_s
 SRI_v           0.10 11110 .... ... 01000 1 ..... .....     @q_shri_d
+
+SHL_v           0.00 11110 .... ... 01010 1 ..... .....     @q_shli_b
+SHL_v           0.00 11110 .... ... 01010 1 ..... .....     @q_shli_h
+SHL_v           0.00 11110 .... ... 01010 1 ..... .....     @q_shli_s
+SHL_v           0.00 11110 .... ... 01010 1 ..... .....     @q_shli_d
+
+SLI_v           0.10 11110 .... ... 01010 1 ..... .....     @q_shli_b
+SLI_v           0.10 11110 .... ... 01010 1 ..... .....     @q_shli_h
+SLI_v           0.10 11110 .... ... 01010 1 ..... .....     @q_shli_s
+SLI_v           0.10 11110 .... ... 01010 1 ..... .....     @q_shli_d
-- 
2.43.0

