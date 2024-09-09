Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp985099njb;
        Mon, 9 Sep 2024 09:27:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXA+4keUEr88K0LhZJmkXLBrWVukVgu1uX+mqpg7Exm5HzpFNZrpgz0Pptv+hFRo5oXJyK6rm2oRIM99Q==@linaro.org
X-Google-Smtp-Source: AGHT+IHN2bKtwsNm7VVAfK01LVs7QYl414Pkv4eVRKx+8Df3qUa0KSn44oJpKjVJp/+JU61GphM4
X-Received: by 2002:a05:620a:1789:b0:7a3:5fa3:328 with SMTP id af79cd13be357-7a99738bfb6mr1200500785a.54.1725899226695;
        Mon, 09 Sep 2024 09:27:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725899226; cv=none;
        d=google.com; s=arc-20240605;
        b=W00jfrUy0zQLLkc10EkOTyfIiMZ/iw1FLsXefYxPSNwJM5PUEPtp9rmBSpxPuEIcCR
         rsbv45MTObO24E6wQ9egi4fnTUDN7pyIrcB4gH4/Mok2DINahwbz08+c7fEOjaK1Tjn7
         kyKhDigfkYLFmAwG/oZU9uY7r9yLgXp4MGZKnWCaDZrZsDkh4r7M/H8A6VObm5h4mIG2
         2lxvOkY1f2IWtyMq2DWlBvy9cN39vtV4QHldveHKtUQ8ncwPf7bktcI8Ov/VwEAM+uh0
         K6Co+Mha3tSEFhe3B5xlqpnT9AfaQHHshIwD4fxJPu8EnYQPqK2dMSOrgSEsvHoaiTPq
         PIrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=NOWETvr8NmDSZ8tzcbfLVHwKDHp2zUEnQz3+srAIk+Q=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=g5vGcgdYKmXuDM77uY2CVP3bmpG6QtaVmNlv4nPk32dNoo5Pyv8Ad9RPWDPPJDtJI8
         EYpZnWKG/HqEWAo+jdOVtLiYfSeh5Uzo/wkqs5Jpx7/5mfovq4tYEPhF2Goxz5oJtZ3v
         OXWFS2jicQeSaem7Xmr0XNF2k98yn3egD2TLo3D5oOV8lxZtEeSufj1NM3uX5NbNwxAl
         i6OfinZlqMWWSxOxdTTq0YVphJqUW//RLhP/+ZEZnsYZQCCF8T9QWNNzZZKoHvGoJDDx
         O7MGAYoPr7kewlyTynAQcxnlCFfvd9dDMx6nDgjny2SxrQXCalN/puc1zrwsVGxDeJP/
         Qovw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EwnTgwN2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45822e62bf6si58836961cf.149.2024.09.09.09.27.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Sep 2024 09:27:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EwnTgwN2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1snhAU-0003o1-3I; Mon, 09 Sep 2024 12:23:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1snhAQ-0003WJ-Tv
 for qemu-devel@nongnu.org; Mon, 09 Sep 2024 12:23:06 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1snhAP-0007nj-3n
 for qemu-devel@nongnu.org; Mon, 09 Sep 2024 12:23:06 -0400
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-205909af9b5so35086945ad.3
 for <qemu-devel@nongnu.org>; Mon, 09 Sep 2024 09:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725898984; x=1726503784; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NOWETvr8NmDSZ8tzcbfLVHwKDHp2zUEnQz3+srAIk+Q=;
 b=EwnTgwN2yoTSgx5viUhdh6t/iDjAWHLb6WOrvY6e8RpjZv8j/Nr31WDaTGCBBZLlbh
 3yns77W/WbbKNgtKqtk5S97Eky/fdN88KUeBJnjx9qlEQiMMoQhq9+v7o1ZP5cSK70cT
 DVsr7h5fCu4JpCKkuckwyQNHTE9RsD+rc1I3LekqezNniW0z1GrTOZxjqUkp8oIGy1Je
 jky5lEiBtQeSOktcKUtaNHGJmjVgxHVf6OnBJBtTxh1lmiswV7N4AlZznSM3m2pN5bm+
 3YJX3RjG/IBuKPO9J4omNWPmOiT5gGnTK/PZw3ZGNbjFUk0CtV+dJ2T8ZqGx50g3Ko3O
 VUhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725898984; x=1726503784;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NOWETvr8NmDSZ8tzcbfLVHwKDHp2zUEnQz3+srAIk+Q=;
 b=YhNA3woDwmWPOie9X0QweQ5xj35ZFoieynSm3HeZ9szUluA77vCgS5fifUQvJvaZx6
 Zn5ZZQJ7TqZoS2YSmLO2fpkshy/V5d2ukFVAr7u3+0mcWVOqnTsu2Ni5e/16DPB9t4BO
 bwI3HDRS7Omk5xXqtjhf7GvfJaPDo3nRVQ+dUGTX3pc+qT/GzNewIy7J+7t8CXsw3WQI
 9UMTm3vriL9lVVJN9BUyr6t/1wRh/JQXCxa6kW6lJoeXq1qlXMXtgiXvpCkaxmGXZzlO
 er+sE3VJ61DoymvIFLl2/1VO9ez7luSfJ1DUrutyBpgErMhGkFvpSOm6ZrcIv+0UKHyh
 1qAg==
X-Gm-Message-State: AOJu0YxDkMCJ6YWtOGdAZZiRS43w9uYIuH+dQmkYzVptbTpN7ZC/XL3S
 pyG+6HtBA67l6XzyJULv92lhAWkuW6frINt78gquOi4kixAqyfdI0FP8MF1sp2B9Gwza3WJAmf+
 M
X-Received: by 2002:a17:902:eccf:b0:205:6a9b:7e3e with SMTP id
 d9443c01a7336-206f05faedcmr166646115ad.56.1725898983643; 
 Mon, 09 Sep 2024 09:23:03 -0700 (PDT)
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20710f35d79sm35753305ad.288.2024.09.09.09.23.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 09:23:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 24/29] target/arm: Convert handle_scalar_simd_shli to
 decodetree
Date: Mon,  9 Sep 2024 09:22:34 -0700
Message-ID: <20240909162240.647173-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240909162240.647173-1-richard.henderson@linaro.org>
References: <20240909162240.647173-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: vXOKDZkxUgbY

This includes SHL and SLI.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 44 +++++++---------------------------
 target/arm/tcg/a64.decode      |  4 ++++
 2 files changed, 13 insertions(+), 35 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index efd93a7f23..934746d2f2 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -7124,6 +7124,11 @@ static void gen_sri_d(TCGv_i64 dst, TCGv_i64 src, int64_t shift)
     }
 }
 
+static void gen_sli_d(TCGv_i64 dst, TCGv_i64 src, int64_t shift)
+{
+    tcg_gen_deposit_i64(dst, dst, src, shift, 64 - shift);
+}
+
 static bool do_vec_shift_imm_narrow(DisasContext *s, arg_qrri_e *a,
                                     WideShiftImmFn * const fns[3], MemOp sign)
 {
@@ -7201,6 +7206,9 @@ TRANS(SRSRA_s, do_scalar_shift_imm, a, gen_srsra_d, true, 0)
 TRANS(URSRA_s, do_scalar_shift_imm, a, gen_ursra_d, true, 0)
 TRANS(SRI_s, do_scalar_shift_imm, a, gen_sri_d, true, 0)
 
+TRANS(SHL_s, do_scalar_shift_imm, a, tcg_gen_shli_i64, false, 0)
+TRANS(SLI_s, do_scalar_shift_imm, a, gen_sli_d, true, 0)
+
 /* Shift a TCGv src by TCGv shift_amount, put result in dst.
  * Note that it is the caller's responsibility to ensure that the
  * shift amount is in range (ie 0..31 or 0..63) and provide the ARM
@@ -9417,38 +9425,6 @@ static void handle_shri_with_rndacc(TCGv_i64 tcg_res, TCGv_i64 tcg_src,
     }
 }
 
-/* SHL/SLI - Scalar shift left */
-static void handle_scalar_simd_shli(DisasContext *s, bool insert,
-                                    int immh, int immb, int opcode,
-                                    int rn, int rd)
-{
-    int size = 32 - clz32(immh) - 1;
-    int immhb = immh << 3 | immb;
-    int shift = immhb - (8 << size);
-    TCGv_i64 tcg_rn;
-    TCGv_i64 tcg_rd;
-
-    if (!extract32(immh, 3, 1)) {
-        unallocated_encoding(s);
-        return;
-    }
-
-    if (!fp_access_check(s)) {
-        return;
-    }
-
-    tcg_rn = read_fp_dreg(s, rn);
-    tcg_rd = insert ? read_fp_dreg(s, rd) : tcg_temp_new_i64();
-
-    if (insert) {
-        tcg_gen_deposit_i64(tcg_rd, tcg_rd, tcg_rn, shift, 64 - shift);
-    } else {
-        tcg_gen_shli_i64(tcg_rd, tcg_rn, shift);
-    }
-
-    write_fp_dreg(s, rd, tcg_rd);
-}
-
 /* SQSHRN/SQSHRUN - Saturating (signed/unsigned) shift right with
  * (signed/unsigned) narrowing */
 static void handle_vec_simd_sqshrn(DisasContext *s, bool is_scalar, bool is_q,
@@ -9900,9 +9876,6 @@ static void disas_simd_scalar_shift_imm(DisasContext *s, uint32_t insn)
     }
 
     switch (opcode) {
-    case 0x0a: /* SHL / SLI */
-        handle_scalar_simd_shli(s, is_u, immh, immb, opcode, rn, rd);
-        break;
     case 0x1c: /* SCVTF, UCVTF */
         handle_simd_shift_intfp_conv(s, true, false, is_u, immh, immb,
                                      opcode, rn, rd);
@@ -9940,6 +9913,7 @@ static void disas_simd_scalar_shift_imm(DisasContext *s, uint32_t insn)
     case 0x04: /* SRSHR / URSHR */
     case 0x06: /* SRSRA / URSRA */
     case 0x08: /* SRI */
+    case 0x0a: /* SHL / SLI */
         unallocated_encoding(s);
         break;
     }
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 6c2362b3bb..96803fe6e4 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -1291,6 +1291,7 @@ RSHRN_v         0.00 11110 .... ... 10001 1 ..... .....     @q_shri_s
 
 @shri_d         .... ..... 1 ...... ..... . rn:5 rd:5   \
                 &rri_e esz=3 imm=%neon_rshift_i6
+@shli_d         .... ..... 1 imm:6  ..... . rn:5 rd:5   &rri_e esz=3 
 
 SSHR_s          0101 11110 .... ... 00000 1 ..... .....     @shri_d
 USHR_s          0111 11110 .... ... 00000 1 ..... .....     @shri_d
@@ -1301,3 +1302,6 @@ URSHR_s         0111 11110 .... ... 00100 1 ..... .....     @shri_d
 SRSRA_s         0101 11110 .... ... 00110 1 ..... .....     @shri_d
 URSRA_s         0111 11110 .... ... 00110 1 ..... .....     @shri_d
 SRI_s           0111 11110 .... ... 01000 1 ..... .....     @shri_d
+
+SHL_s           0101 11110 .... ... 01010 1 ..... .....     @shli_d
+SLI_s           0111 11110 .... ... 01010 1 ..... .....     @shli_d
-- 
2.43.0

