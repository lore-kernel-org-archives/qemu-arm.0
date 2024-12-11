Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp4194316njb;
        Wed, 11 Dec 2024 08:38:33 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX6rntkPR6E7IYK7xa8zoD8E/i8tj1IdU9rBzBaOs7BTnw8CAzzESRjiI24LzHiJXoztadYcwD+3N6CDw==@linaro.org
X-Google-Smtp-Source: AGHT+IES6HnySkdQ0To4ayBp+FmLld1ZAI8IN6P7lNofbsEa/wUwr9QP71OreZEGVxPm2Jl1rKMN
X-Received: by 2002:a05:622a:59c5:b0:466:b394:92bc with SMTP id d75a77b69052e-4679615495bmr248871cf.6.1733935113264;
        Wed, 11 Dec 2024 08:38:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733935113; cv=none;
        d=google.com; s=arc-20240605;
        b=P2K26xng1sMtmxO8S1L1p5DTNG9DVJHV8vKqgO/i4k3IzpRvuT8sHIZFstoiBNCo9G
         it3wd4WJcPy68wGpr/cDljf0fRiO1xT5b9mftzLmFi+l+FrVOzQWVzDipDf5TVYTn9D3
         xmytR4SP0j6XDSg+DqMqlWpt/AR12TmCIavFvI4xiSHDDvwTo4+1m6QyNXqbpVL43cPe
         OTmWLW18saL18dQQzuVH5tnpRYXbNrmcovl/lI71QwAPiHDT9/1HusMtWg4bV8+tn+z0
         5j2lI5k1e2v7ZH/lirKAI19ls354b20Vy5pQJ4w5o6uIoP7lgaLJlFkrlPwhCCmqrIA2
         aaZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=T9fh0NlbjmdbLKi3RiB0ekN1/PEOAZQ1NU7Dbs3dJ9Q=;
        fh=OZQBfL75rC14cCDy3q+1fYHCs9KjWAQ7ZJ3hTfS+5lQ=;
        b=ZXokH8c49mC8wpqAI1SFRwFkMiE5G1tDxt5mlgcoKDcTE3+gmzXg4ZBAPzGDOf2rlh
         T1Zv6KGZxU7JoJUqEyGTt5wMpPi81Za+NakTG0ByoQy4vwaaF5/Mkp/moqEDL4+zwaVV
         2ymSQzpLJAjsd9R2No1Htx4aaqtpMIb14YiG6ZUO/mlYtbUYIaJ1rt6EfWiA3bTd6cih
         jiR9igwatLUk/1/cdYfa7ivv/Rofdwxjxy/BnpuYChEReaKJ+EMRmBlmuB7HVOrXhTFG
         4/hIW4Z9V//bobVl+iC5mG6nMtCnsyMmhCKc0S0YFJ2JrGWcz5JboBufIJ6NgtO3Vy3X
         Nrbw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=l+6qoJfZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46786fc88cesi27119141cf.626.2024.12.11.08.38.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Dec 2024 08:38:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=l+6qoJfZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tLPg7-00044Y-Ae; Wed, 11 Dec 2024 11:35:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLPdc-0006mv-0F
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 11:32:36 -0500
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLPda-0001UA-6L
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 11:32:35 -0500
Received: by mail-qt1-x82f.google.com with SMTP id
 d75a77b69052e-4676859b911so28229861cf.2
 for <qemu-arm@nongnu.org>; Wed, 11 Dec 2024 08:32:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733934753; x=1734539553; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T9fh0NlbjmdbLKi3RiB0ekN1/PEOAZQ1NU7Dbs3dJ9Q=;
 b=l+6qoJfZc0fL6wo9e0UY/74NJ7XKD463nLUGuf7nj9BsK/+tIuVRBR9Co2UGu9FAmx
 FqRjTwiRK3ToTuV3n4Ug0EIv8dRkmDwXJK5FMOYerLnVUx1TZB7DDHal2sLSgaikDofd
 DgIsutytYqWpS7BLVDwvIrXEuYOlz43UcsGGuSxAgEUlk4n8BnZlXhguTUfm7vnHcjpv
 ySJ66qUu9Q7MIFOe62+vS8nmy/gx8jiFwNNcL21NjWdls95TMv/OFNbYTzUhpAeD69u5
 icIY4hMVmKNMhgTZVSNVBJEw0oWyfLXzTrl6MbmdmezDs9Q9Gyw2zw7S1jW2AvP38fvt
 ea7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733934753; x=1734539553;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T9fh0NlbjmdbLKi3RiB0ekN1/PEOAZQ1NU7Dbs3dJ9Q=;
 b=b4yTkd/pYAQfU0B7FScbt04aE/8M6Hntpg0f2o4VIP9ZFqw/vJspN8F7JH0XFepHIo
 PVlZypZRTdKN4P085mgWV9kumoTA7bYoiJ5Hrihf0bcoi2wFRyen+BIOLERcK4ojLtkt
 B6XjCAjpH2C++KlbKJKTfe2gBr2XeUQSiDbKiBHl3h1aT73wbSG4bonbCk7xcMr2ONL6
 kTGg5ENBLI0rU3bphy9cm79Y7Y+mNIQ2osOdcYdOv38ymN1udd0nkGEiBQYO72o3dbQk
 sMatTOEgaoV6ojFxc9UthTpt34OwB0uNQcKajIzcqz0qanJIyAEPg2DatY24TAyWAcUY
 yd/w==
X-Gm-Message-State: AOJu0YzNE5W1kIEieMlOAXrE+GUY0gmDDxEW6hd1kQ1M997vWvUryJxJ
 jhoPQSRFW1J1hBjRlA83NXvrBHPCDMqHo72TZgg63hbVedextI0tdZ218aHYMs8=
X-Gm-Gg: ASbGncvtJV/cjTAzdPdpkZPI11ak5Ce2sNND40uyOJKgy6RGDAeE9bY6PgFTnTgC/Hr
 MOAMxkLmNKn0cu8P8QeoKAj+3CiwkaEWNQ0/tU1GI6dmIvnnwZ9GMNMkFFZ8alasxS9qrzv8vMq
 Bwj9r2r+cya3m7Lg5trx2R4D6CDSoM5ok8lShWupKIAlal6efIsxHKOZRRQutQ/tRV0VW3v413r
 mKB8OjzCCpl8YO0arGRBOCUo7t2YvuGjO7hzEG04P8knkLyxz/JACqCFSVKPA==
X-Received: by 2002:a05:622a:9009:b0:466:ac8d:7341 with SMTP id
 d75a77b69052e-46795423747mr6206131cf.35.1733934753142; 
 Wed, 11 Dec 2024 08:32:33 -0800 (PST)
Received: from stoup.. ([187.217.227.247]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-46755db613csm43849381cf.70.2024.12.11.08.32.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 08:32:32 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 37/69] target/arm: Introduce gen_gvec_cls, gen_gvec_clz
Date: Wed, 11 Dec 2024 10:30:04 -0600
Message-ID: <20241211163036.2297116-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241211163036.2297116-1-richard.henderson@linaro.org>
References: <20241211163036.2297116-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82f.google.com
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
X-TUID: AV5UqEh1ZmTm

Add gvec interfaces for CLS and CLZ operations.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate.h      |  5 +++++
 target/arm/tcg/gengvec.c        | 35 +++++++++++++++++++++++++++++++++
 target/arm/tcg/translate-a64.c  | 29 +++++++--------------------
 target/arm/tcg/translate-neon.c | 29 ++-------------------------
 4 files changed, 49 insertions(+), 49 deletions(-)

diff --git a/target/arm/tcg/translate.h b/target/arm/tcg/translate.h
index 20cd0e851c..5c6c24f057 100644
--- a/target/arm/tcg/translate.h
+++ b/target/arm/tcg/translate.h
@@ -578,6 +578,11 @@ void gen_gvec_umaxp(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
 void gen_gvec_uminp(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
                     uint32_t rm_ofs, uint32_t opr_sz, uint32_t max_sz);
 
+void gen_gvec_cls(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
+                  uint32_t opr_sz, uint32_t max_sz);
+void gen_gvec_clz(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
+                  uint32_t opr_sz, uint32_t max_sz);
+
 /*
  * Forward to the isar_feature_* tests given a DisasContext pointer.
  */
diff --git a/target/arm/tcg/gengvec.c b/target/arm/tcg/gengvec.c
index f652520b65..834b2961c0 100644
--- a/target/arm/tcg/gengvec.c
+++ b/target/arm/tcg/gengvec.c
@@ -2358,3 +2358,38 @@ void gen_gvec_urhadd(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
     assert(vece <= MO_32);
     tcg_gen_gvec_3(rd_ofs, rn_ofs, rm_ofs, opr_sz, max_sz, &g[vece]);
 }
+
+void gen_gvec_cls(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
+                  uint32_t opr_sz, uint32_t max_sz)
+{
+    static const GVecGen2 g[] = {
+        { .fni4 = gen_helper_neon_cls_s8,
+          .vece = MO_8 },
+        { .fni4 = gen_helper_neon_cls_s16,
+          .vece = MO_16 },
+        { .fni4 = tcg_gen_clrsb_i32,
+          .vece = MO_32 },
+    };
+    assert(vece <= MO_32);
+    tcg_gen_gvec_2(rd_ofs, rn_ofs, opr_sz, max_sz, &g[vece]);
+}
+
+static void gen_clz32_i32(TCGv_i32 d, TCGv_i32 n)
+{
+    tcg_gen_clzi_i32(d, n, 32);
+}
+
+void gen_gvec_clz(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
+                  uint32_t opr_sz, uint32_t max_sz)
+{
+    static const GVecGen2 g[] = {
+        { .fni4 = gen_helper_neon_clz_u8,
+          .vece = MO_8 },
+        { .fni4 = gen_helper_neon_clz_u16,
+          .vece = MO_16 },
+        { .fni4 = gen_clz32_i32,
+          .vece = MO_32 },
+    };
+    assert(vece <= MO_32);
+    tcg_gen_gvec_2(rd_ofs, rn_ofs, opr_sz, max_sz, &g[vece]);
+}
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index c697f0e944..387bbbf906 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -10321,6 +10321,13 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
     }
 
     switch (opcode) {
+    case 0x4: /* CLZ, CLS */
+        if (u) {
+            gen_gvec_fn2(s, is_q, rd, rn, gen_gvec_clz, size);
+        } else {
+            gen_gvec_fn2(s, is_q, rd, rn, gen_gvec_cls, size);
+        }
+        return;
     case 0x5:
         if (u && size == 0) { /* NOT */
             gen_gvec_fn2(s, is_q, rd, rn, tcg_gen_gvec_not, 0);
@@ -10379,13 +10386,6 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
             if (size == 2) {
                 /* Special cases for 32 bit elements */
                 switch (opcode) {
-                case 0x4: /* CLS */
-                    if (u) {
-                        tcg_gen_clzi_i32(tcg_res, tcg_op, 32);
-                    } else {
-                        tcg_gen_clrsb_i32(tcg_res, tcg_op);
-                    }
-                    break;
                 case 0x2f: /* FABS */
                     gen_vfp_abss(tcg_res, tcg_op);
                     break;
@@ -10450,21 +10450,6 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
                         gen_helper_neon_cnt_u8(tcg_res, tcg_op);
                     }
                     break;
-                case 0x4: /* CLS, CLZ */
-                    if (u) {
-                        if (size == 0) {
-                            gen_helper_neon_clz_u8(tcg_res, tcg_op);
-                        } else {
-                            gen_helper_neon_clz_u16(tcg_res, tcg_op);
-                        }
-                    } else {
-                        if (size == 0) {
-                            gen_helper_neon_cls_s8(tcg_res, tcg_op);
-                        } else {
-                            gen_helper_neon_cls_s16(tcg_res, tcg_op);
-                        }
-                    }
-                    break;
                 default:
                 case 0x7: /* SQABS, SQNEG */
                     g_assert_not_reached();
diff --git a/target/arm/tcg/translate-neon.c b/target/arm/tcg/translate-neon.c
index 9c8829ad7d..1c89a53272 100644
--- a/target/arm/tcg/translate-neon.c
+++ b/target/arm/tcg/translate-neon.c
@@ -3120,6 +3120,8 @@ DO_2MISC_VEC(VCGT0, gen_gvec_cgt0)
 DO_2MISC_VEC(VCLE0, gen_gvec_cle0)
 DO_2MISC_VEC(VCGE0, gen_gvec_cge0)
 DO_2MISC_VEC(VCLT0, gen_gvec_clt0)
+DO_2MISC_VEC(VCLS, gen_gvec_cls)
+DO_2MISC_VEC(VCLZ, gen_gvec_clz)
 
 static bool trans_VMVN(DisasContext *s, arg_2misc *a)
 {
@@ -3227,33 +3229,6 @@ static bool trans_VREV16(DisasContext *s, arg_2misc *a)
     return do_2misc(s, a, gen_rev16);
 }
 
-static bool trans_VCLS(DisasContext *s, arg_2misc *a)
-{
-    static NeonGenOneOpFn * const fn[] = {
-        gen_helper_neon_cls_s8,
-        gen_helper_neon_cls_s16,
-        gen_helper_neon_cls_s32,
-        NULL,
-    };
-    return do_2misc(s, a, fn[a->size]);
-}
-
-static void do_VCLZ_32(TCGv_i32 rd, TCGv_i32 rm)
-{
-    tcg_gen_clzi_i32(rd, rm, 32);
-}
-
-static bool trans_VCLZ(DisasContext *s, arg_2misc *a)
-{
-    static NeonGenOneOpFn * const fn[] = {
-        gen_helper_neon_clz_u8,
-        gen_helper_neon_clz_u16,
-        do_VCLZ_32,
-        NULL,
-    };
-    return do_2misc(s, a, fn[a->size]);
-}
-
 static bool trans_VCNT(DisasContext *s, arg_2misc *a)
 {
     if (a->size != 0) {
-- 
2.43.0

