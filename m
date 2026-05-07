Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B24DBCD3445
	for <qemu-arm@archiver.kernel.org>; Thu,  7 May 2026 23:49:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wL8Oc-0000Wu-NJ; Thu, 07 May 2026 19:44:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wL8OZ-0000Ul-67
 for qemu-arm@nongnu.org; Thu, 07 May 2026 19:44:43 -0400
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wL8OX-00019Y-Ee
 for qemu-arm@nongnu.org; Thu, 07 May 2026 19:44:42 -0400
Received: by mail-ot1-x335.google.com with SMTP id
 46e09a7af769-7de7dc85b74so1231210a34.2
 for <qemu-arm@nongnu.org>; Thu, 07 May 2026 16:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778197480; x=1778802280; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Cccvunxfx9uaMVWDs1RsTfuuhTOzZU4EKjva9uf7aRc=;
 b=unpgSQ+Y52aC96Wmp+dzk3efVPXmJizzb3JxAyvja3n9qmWuQeMNcBFRolpycP5Hew
 fbkIRMbxqwFG0CAUzY+oyWTj2V7n1ZY+r9MFVCaFyznmbJCI48LuTEDvyLfhkRtAQ8ZO
 bIaCDa1qIELt2KqE3vzuGltEIZX/amG9HF3wt6R+yWmm/cUbZxFKwEkkeizVXZW+Yshq
 uOeBAKcxqYIc7orX3EeVZNQIDr7MSeJxnaUKw0pF89dRI3uZlrNJ/17q3h1u/rTFzO4k
 LCdlFZlsOeYL40ZDPSJT2ssh4YpN6HnlqLKpE9jBR3/dXyHxPSuPGoUuCK16ELOJPS9E
 dJwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778197480; x=1778802280;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Cccvunxfx9uaMVWDs1RsTfuuhTOzZU4EKjva9uf7aRc=;
 b=a6bFstbBHTOW9FRR3/gCzkOw6i4g66KagGJPCDPrNkbN0l+3aq0ildoza/BOIgW/j4
 FcaNaUP7hDC1X/6Kd+qo+mZO4DJvoxdSEgwgVG9xBE8HTacvt9nMpBBSCtLGz+hSnZ5y
 qaNSIrIz0QOYVDaCjfvVSBagsAS9Fs42zPFTS79hWvSvyD4RhVpQX+nXT4syRRtEpqOI
 wziqyY4JDHDgVuvMnd2ubFXJAEoloQ6oW6sEv9lyi3e8uStwlouIRUCnHttlUDwcED28
 ddyI5H4eFYWirICOwE0xjAjpWM0WrFVfo20ELL9oD/xoJKC16zlpMQ41RtBYeTOgRHl5
 AEaw==
X-Gm-Message-State: AOJu0YzF9woG4MXUSmAs83Xi7XDbnt/O0W1iiJyi85+AXxQ2nDIXYNC6
 2baEPVgLP76a3y5VbNeOH8DSAKzXh2J09Gv2TCaMX3awGEE2b5lpp6ekQ4B6VOUQVO0=
X-Gm-Gg: AeBDiesAKYBH25hE+/KzR4BfgkYNdf67XSIiHTgdno7oVcyEDpNZLTeAtJGwXP4Q4tL
 qAOKHjO7OeExK6gg18u5iG/IbQwUM3OjBE/lSqj51LiNl/YPXsxP0EmqrsYLXVlNBi1hhhcubJ9
 Rhrwvq0pA/j+rcZL0cDTW2DVUh65TQMPyVvTe8mDx4RTZ6KnuBAASK5w59JwG+SvZD3XVOPD7t4
 /iopZ8FI0tDjD65Z/+dNWf2HjjSFsY2lqNF+eMeoGfeXXmxaszPYdckSIt56chRHIdcBBTUFYod
 z+MtxHOJ0gFvnIYgIx07atnoguG/2vApX1eL4l7FItLljUsQIRbJvhq7diYfMBBPqinCBlHaATV
 sYfvdUZS0pSiX5Ur/AOcBnbc3MsAQj7GlTqtepEvaB6JusIc8IEJ+lig9l6DvPpqZbx+UySbrs4
 66Ku12V6TTRLG/jdi2CcvoM7oz9i9ok/wiEvbRrS45DWWEcg==
X-Received: by 2002:a05:6830:3918:b0:7dd:b184:1338 with SMTP id
 46e09a7af769-7e1dee8f95fmr6279260a34.6.1778197480211; 
 Thu, 07 May 2026 16:44:40 -0700 (PDT)
Received: from stoup.attlocal.net ([2600:381:c938:6375:9641:bbb2:a93a:bb4c])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7e367d8feb1sm84320a34.23.2026.05.07.16.44.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2026 16:44:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 27/60] target/arm: Implement F1CVT, F1CVTLT, F2CVT,
 F2CVTLT for SVE
Date: Thu,  7 May 2026 18:43:40 -0500
Message-ID: <20260507234413.643512-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260507234413.643512-1-richard.henderson@linaro.org>
References: <20260507234413.643512-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x335.google.com
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
 target/arm/tcg/helper-fp8-defs.h |  1 +
 target/arm/tcg/fp8_helper.c      | 16 ++++++++++++++++
 target/arm/tcg/translate-sve.c   |  9 +++++++++
 target/arm/tcg/sve.decode        |  5 +++++
 4 files changed, 31 insertions(+)

diff --git a/target/arm/tcg/helper-fp8-defs.h b/target/arm/tcg/helper-fp8-defs.h
index 718463422b..3021dafd44 100644
--- a/target/arm/tcg/helper-fp8-defs.h
+++ b/target/arm/tcg/helper-fp8-defs.h
@@ -9,3 +9,4 @@ DEF_HELPER_FLAGS_4(sme2_bfcvt_hb, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
 DEF_HELPER_FLAGS_4(sme2_bfcvtl_hb, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
 
 DEF_HELPER_FLAGS_4(advsimd_fcvtl_hb, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
+DEF_HELPER_FLAGS_4(sve2_fcvt_hb, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
diff --git a/target/arm/tcg/fp8_helper.c b/target/arm/tcg/fp8_helper.c
index 90f17f9e10..0e906f2d83 100644
--- a/target/arm/tcg/fp8_helper.c
+++ b/target/arm/tcg/fp8_helper.c
@@ -170,6 +170,22 @@ void HELPER(sve2_bfcvt)(void *vd, void *vn, CPUARMState *env, uint32_t desc)
     fp8_finish(env, &ctx);
 }
 
+void HELPER(sve2_fcvt_hb)(void *vd, void *vn, CPUARMState *env, uint32_t desc)
+{
+    FP8Context ctx = fp8_src_start(env, desc, 0xf);
+    fp8_input_fn *input_fmt = fp8_input_fmt[ctx.f8fmt];
+    uint8_t *n = vn;
+    uint16_t *d = vd;
+    size_t nelem = simd_oprsz(desc) / 2;
+
+    for (size_t i = 0; i < nelem; ++i) {
+        d[H2(i)] = fcvt_fp8_to_f16(n[H1(2 * i + ctx.high)],
+                                   input_fmt, ctx.scale, &ctx.stat);
+    }
+
+    fp8_finish(env, &ctx);
+}
+
 void HELPER(sme2_bfcvt_hb)(void *vd, void *vn, CPUARMState *env, uint32_t desc)
 {
     FP8Context ctx = fp8_src_start(env, desc, 0x3f);
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 9bab5feb93..5200f3d034 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -4081,6 +4081,15 @@ static bool do_f8cvt(DisasContext *s, arg_rr_esz *a,
     return true;
 }
 
+TRANS_FEAT(F1CVT, aa64_sme2_or_sve2_f8cvt, do_f8cvt, a,
+           gen_helper_sve2_fcvt_hb, false, false)
+TRANS_FEAT(F2CVT, aa64_sme2_or_sve2_f8cvt, do_f8cvt, a,
+           gen_helper_sve2_fcvt_hb, true, false)
+TRANS_FEAT(F1CVTLT, aa64_sme2_or_sve2_f8cvt, do_f8cvt, a,
+           gen_helper_sve2_fcvt_hb, false, true)
+TRANS_FEAT(F2CVTLT, aa64_sme2_or_sve2_f8cvt, do_f8cvt, a,
+           gen_helper_sve2_fcvt_hb, true, true)
+
 TRANS_FEAT(BF1CVT, aa64_sme2_or_sve2_f8cvt, do_f8cvt, a,
            gen_helper_sve2_bfcvt, false, false)
 TRANS_FEAT(BF2CVT, aa64_sme2_or_sve2_f8cvt, do_f8cvt, a,
diff --git a/target/arm/tcg/sve.decode b/target/arm/tcg/sve.decode
index e7984fa8e0..ca110f4bc1 100644
--- a/target/arm/tcg/sve.decode
+++ b/target/arm/tcg/sve.decode
@@ -1091,6 +1091,11 @@ FMINQV          01100100 .. 010 111 101 ... ..... .....         @rd_pg_rn
 FRECPE          01100101 .. 001 110 001100 ..... .....          @rd_rn
 FRSQRTE         01100101 .. 001 111 001100 ..... .....          @rd_rn
 
+F1CVT           01100101 00 001 000 001100 ..... .....          @rd_rn_e0
+F2CVT           01100101 00 001 000 001101 ..... .....          @rd_rn_e0
+F1CVTLT         01100101 00 001 001 001100 ..... .....          @rd_rn_e0
+F2CVTLT         01100101 00 001 001 001101 ..... .....          @rd_rn_e0
+
 BF1CVT          01100101 00 001 000 001110 ..... .....          @rd_rn_e0
 BF2CVT          01100101 00 001 000 001111 ..... .....          @rd_rn_e0
 BF1CVTLT        01100101 00 001 001 001110 ..... .....          @rd_rn_e0
-- 
2.43.0


