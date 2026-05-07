Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52BEBCD3445
	for <qemu-arm@archiver.kernel.org>; Thu,  7 May 2026 23:47:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wL8Oh-0000fQ-A9; Thu, 07 May 2026 19:44:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wL8Oa-0000Uz-IO
 for qemu-arm@nongnu.org; Thu, 07 May 2026 19:44:45 -0400
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wL8OY-0001A9-MM
 for qemu-arm@nongnu.org; Thu, 07 May 2026 19:44:44 -0400
Received: by mail-oi1-x231.google.com with SMTP id
 5614622812f47-479f7e75a6bso577414b6e.2
 for <qemu-arm@nongnu.org>; Thu, 07 May 2026 16:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778197481; x=1778802281; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M57Im4p8Ek/6ItuYj7c2sfqrPfiuBzTkBGB/xxKHk94=;
 b=B9ZnDqqODEbbx8YqbHjFDvOPaPCVOzKHo+jom3LMXKIiY0D0hJNiNgDdC6uSfLE0z0
 z3w5f/Umh+CQNUT8TNGiT0sqYjS81SqOkork+MSRL9M68B7pJvQpz61nruzMak1gE5/C
 GuXHPTyjmqJYCAroAIpMj6tkJbbcmrIa9fainBNPMUZydJBe5/Jc63Y8taOnf4kbvTi/
 JHEQlco00SbK2hP0K6xbBHZieYGwtewQheQ77x4rFYVVAx+mUDZU2bmxIAnfUBjzkB70
 vBfKSXQCI8S5gbz6AmBM/fHyi9KRtghHTZHKG10ZRbbk2ObNcnKuXuiurOV5+9GJvGbP
 UX8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778197481; x=1778802281;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=M57Im4p8Ek/6ItuYj7c2sfqrPfiuBzTkBGB/xxKHk94=;
 b=dzDGweIHk1sObB9pN/QALBa43OJznFJEqtk14tYweZxndW08k1LMv6jwIX6H3EkXmP
 qegm/MFJCneEW8t8gPR+G2Rsjzz5PAUonaOLKjan7gRGbKEg3pcxRFLnMlYEptj3Mk3K
 tdGRo+kLrxh1PkojtCRPoRITTbs5oZVsbwi5QozxKCd6xdXmxv03peZiGC1cGO8DGqJy
 BkuVFbca8zjrmjVba/KdNUVmHJ791L+ePOVhArQf2+ASL+9fP38knJEsD8YYLRV0GrF8
 syICbCSlvek0Da6Sr0thI4ovpeFS5GYHdgoetfsCysFTpi3M07y63G5iE9hEJ4uZZuYV
 e4RA==
X-Gm-Message-State: AOJu0YzvrgUC/ldUZ4aRR1dCdyralKmslWBmOhO8Mm9Q/EKjD9e4p4kh
 axN5NIVj1y41c0BsNWXexSAki0GNfHaS3JtUiJDdBnn0ItHhJ4SeMByO+z6pKrbeQKc=
X-Gm-Gg: AeBDievoNPS1bD4F/z6vqm4pEcqXJjC61hMPJfx0TfNoxsLuUZpLOcvVU+7vuERGEFk
 UP5U2dBemXyd1mRA4SmGOU9qAr/i43M19nwgkrSwJ4ZRqE45AwAvqwOR1cRFZTUnx/c1Nzr4YNN
 oIRKcRLZz57e2HtbKqPaZUg0UVURUviTfP84nOfExzB3NY63LsVcFOZNLggNsmn3fO2gENg835X
 4uVDwSwI5wX0iSIpQp0pBJEAC6J12obxXzdPqANqDo7g6KLejCY+vl7pWPo8s2EfTi7O7dlMEfK
 kNUKzx+K+0hIn66qBTM5C88/UcVXWlijxu8vrf5+dGFdtmZ34WPhBGgkKgbv7LwyW+rY4vboYJE
 WRiWTMd+jKFGYHrKqDotEs3YsUst4hOU4g8LiaunC5ze98y0OZjWAKHPhbxU5ZKtqFXNgJCHltV
 V+QnWbyA35wzDn5qTBt3oqiJW2wLxEjzR5+MSLkpdFjqVgytw59n6B38qG
X-Received: by 2002:a05:6808:1529:b0:47b:c2a2:1c6c with SMTP id
 5614622812f47-4804222a9a6mr6526910b6e.16.1778197481413; 
 Thu, 07 May 2026 16:44:41 -0700 (PDT)
Received: from stoup.attlocal.net ([2600:381:c938:6375:9641:bbb2:a93a:bb4c])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7e367d8feb1sm84320a34.23.2026.05.07.16.44.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2026 16:44:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 28/60] target/arm: Implement F1CVT, F1CVTL, F2CVT,
 F2CVTL for SME
Date: Thu,  7 May 2026 18:43:41 -0500
Message-ID: <20260507234413.643512-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260507234413.643512-1-richard.henderson@linaro.org>
References: <20260507234413.643512-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x231.google.com
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
 target/arm/tcg/helper-fp8-defs.h |  2 ++
 target/arm/tcg/fp8_helper.c      | 47 ++++++++++++++++++++++++++++++++
 target/arm/tcg/translate-sme.c   |  5 ++++
 target/arm/tcg/sme.decode        |  5 ++++
 4 files changed, 59 insertions(+)

diff --git a/target/arm/tcg/helper-fp8-defs.h b/target/arm/tcg/helper-fp8-defs.h
index 3021dafd44..b5dc2b7064 100644
--- a/target/arm/tcg/helper-fp8-defs.h
+++ b/target/arm/tcg/helper-fp8-defs.h
@@ -10,3 +10,5 @@ DEF_HELPER_FLAGS_4(sme2_bfcvtl_hb, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
 
 DEF_HELPER_FLAGS_4(advsimd_fcvtl_hb, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
 DEF_HELPER_FLAGS_4(sve2_fcvt_hb, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
+DEF_HELPER_FLAGS_4(sme2_fcvt_hb, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
+DEF_HELPER_FLAGS_4(sme2_fcvtl_hb, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
diff --git a/target/arm/tcg/fp8_helper.c b/target/arm/tcg/fp8_helper.c
index 0e906f2d83..fce02f68fa 100644
--- a/target/arm/tcg/fp8_helper.c
+++ b/target/arm/tcg/fp8_helper.c
@@ -213,6 +213,33 @@ void HELPER(sme2_bfcvt_hb)(void *vd, void *vn, CPUARMState *env, uint32_t desc)
     fp8_finish(env, &ctx);
 }
 
+void HELPER(sme2_fcvt_hb)(void *vd, void *vn, CPUARMState *env, uint32_t desc)
+{
+    FP8Context ctx = fp8_src_start(env, desc, 0xf);
+    fp8_input_fn *input_fmt = fp8_input_fmt[ctx.f8fmt];
+    uint8_t *n = vn;
+    uint16_t *d0 = vd;
+    uint16_t *d1 = vd + sizeof(ARMVectorReg);
+    size_t oprsz = simd_oprsz(desc);
+    size_t nelem = oprsz / 2;
+    ARMVectorReg scratch;
+
+    if (vectors_overlap(vd, 2, vn, 1)) {
+        n = memcpy(&scratch, vn, oprsz);
+    }
+
+    for (size_t i = 0; i < nelem; ++i) {
+        d0[H2(i)] = fcvt_fp8_to_f16(n[H1(i)], input_fmt,
+                                    ctx.scale, &ctx.stat);
+    }
+    for (size_t i = 0; i < nelem; ++i) {
+        d1[H2(i)] = fcvt_fp8_to_f16(n[H1(i + nelem)], input_fmt,
+                                    ctx.scale, &ctx.stat);
+    }
+
+    fp8_finish(env, &ctx);
+}
+
 void HELPER(sme2_bfcvtl_hb)(void *vd, void *vn, CPUARMState *env, uint32_t desc)
 {
     FP8Context ctx = fp8_src_start(env, desc, 0x3f);
@@ -232,3 +259,23 @@ void HELPER(sme2_bfcvtl_hb)(void *vd, void *vn, CPUARMState *env, uint32_t desc)
 
     fp8_finish(env, &ctx);
 }
+
+void HELPER(sme2_fcvtl_hb)(void *vd, void *vn, CPUARMState *env, uint32_t desc)
+{
+    FP8Context ctx = fp8_src_start(env, desc, 0xf);
+    fp8_input_fn *input_fmt = fp8_input_fmt[ctx.f8fmt];
+    uint8_t *n = vn;
+    uint16_t *d0 = vd;
+    uint16_t *d1 = vd + sizeof(ARMVectorReg);
+    size_t oprsz = simd_oprsz(desc);
+    size_t nelem = oprsz / 2;
+
+    for (size_t i = 0; i < nelem; ++i) {
+        uint8_t e0 = n[H1(2 * i + 0)];
+        uint8_t e1 = n[H1(2 * i + 1)];
+        d0[H2(i)] = fcvt_fp8_to_f16(e0, input_fmt, ctx.scale, &ctx.stat);
+        d1[H2(i)] = fcvt_fp8_to_f16(e1, input_fmt, ctx.scale, &ctx.stat);
+    }
+
+    fp8_finish(env, &ctx);
+}
diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index 2841b2b8cb..0cbad3e006 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -1546,6 +1546,11 @@ static bool do_f8cvt(DisasContext *s, arg_zz_n *a,
     return true;
 }
 
+TRANS_FEAT(F1CVT, aa64_sme2_f8cvt, do_f8cvt, a, gen_helper_sme2_fcvt_hb, 0)
+TRANS_FEAT(F2CVT, aa64_sme2_f8cvt, do_f8cvt, a, gen_helper_sme2_fcvt_hb, 1)
+TRANS_FEAT(F1CVTL, aa64_sme2_f8cvt, do_f8cvt, a, gen_helper_sme2_fcvtl_hb, 0)
+TRANS_FEAT(F2CVTL, aa64_sme2_f8cvt, do_f8cvt, a, gen_helper_sme2_fcvtl_hb, 1)
+
 TRANS_FEAT(BF1CVT, aa64_sme2_f8cvt, do_f8cvt, a, gen_helper_sme2_bfcvt_hb, 0)
 TRANS_FEAT(BF2CVT, aa64_sme2_f8cvt, do_f8cvt, a, gen_helper_sme2_bfcvt_hb, 1)
 TRANS_FEAT(BF1CVTL, aa64_sme2_f8cvt, do_f8cvt, a, gen_helper_sme2_bfcvtl_hb, 0)
diff --git a/target/arm/tcg/sme.decode b/target/arm/tcg/sme.decode
index df9586c1a5..d6192eb59d 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -853,6 +853,11 @@ UUNPK_4bh       11000001 011 10101 111000 ....0 ...01       @zz_4x2_n1
 UUNPK_4hs       11000001 101 10101 111000 ....0 ...01       @zz_4x2_n1
 UUNPK_4sd       11000001 111 10101 111000 ....0 ...01       @zz_4x2_n1
 
+F1CVT           11000001 001 00110 111000 ..... ....0       @zz_2x1
+F2CVT           11000001 101 00110 111000 ..... ....0       @zz_2x1
+F1CVTL          11000001 001 00110 111000 ..... ....1       @zz_2x1
+F2CVTL          11000001 101 00110 111000 ..... ....1       @zz_2x1
+
 BF1CVT          11000001 011 00110 111000 ..... ....0       @zz_2x1
 BF2CVT          11000001 111 00110 111000 ..... ....0       @zz_2x1
 BF1CVTL         11000001 011 00110 111000 ..... ....1       @zz_2x1
-- 
2.43.0


