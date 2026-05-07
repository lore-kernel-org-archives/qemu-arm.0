Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8B53CD3445
	for <qemu-arm@archiver.kernel.org>; Thu,  7 May 2026 23:51:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wL8Oi-0000hs-IE; Thu, 07 May 2026 19:44:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wL8Of-0000Xm-9H
 for qemu-arm@nongnu.org; Thu, 07 May 2026 19:44:49 -0400
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wL8Od-0001Bk-6L
 for qemu-arm@nongnu.org; Thu, 07 May 2026 19:44:48 -0400
Received: by mail-ot1-x330.google.com with SMTP id
 46e09a7af769-7d4c383f2fcso1173801a34.0
 for <qemu-arm@nongnu.org>; Thu, 07 May 2026 16:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778197486; x=1778802286; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=frMLyLCvl39yyHGRVg1BfkvNzPqVXTkDy/pQM/rMJ6k=;
 b=t/rdhqnNXPIdqGJxNSYL7PueW0yvnui2Y672iTgiTdgEXzDEAB12QLmrj5KYoTPshE
 iQdYTzbhU4/NYQmgJHJvNwggDX9aSFBdbfvIS3eWBH/nBHUuPS9zPBtNVGODXs2rZ/SY
 cahL7Hh3GRP1j5EkNi8flhCYLrz7/mzY+u3YgwivpPxGQHk8EEqZK03l64zwGUlIHgCI
 8Ut/h8fXGl9xvLARveOcNSi1bPec68AAL8dJppGcNCesqd0BZxPOPgKR06dCf5aoXi/L
 xM4fEuwifRCav3ClFtZ8fqJU0cy1NUoBIr91k6iyUGt8yXSrM8/ltTJm3cOkFGgXmAXE
 EtSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778197486; x=1778802286;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=frMLyLCvl39yyHGRVg1BfkvNzPqVXTkDy/pQM/rMJ6k=;
 b=Txe3edEp5fbSLRQ5vW3EPtOGGcqVD5BLvHX7QZy/zmHkPX/+BXqhm4zA0dNFEMB8zJ
 0u2nPgM8bNchrmab1z+gBIaSOWAwl/6xJxz9+kI1KosY3afFzfR4Wn/+3t6S86knjJSr
 7uXDOq18ccXEsRr9NvsTor/tUj0X7U4n6+yfoWh4o9xQHGs6rf16/XR8u+7UdYf4JgAp
 h9AY1cVZpIxr8CWJ3Ymasj1rOK8nlhTcw2RKtSU46pn4qO5YuGmIow5Mm/Mugmfp3NJI
 5FquMC5jbnH5SHi4RqEc8gc5rwHtHL7PvSuZfHtJRTU4NVx0XrnBHOeh7r8N0ZQLezYS
 2HGw==
X-Gm-Message-State: AOJu0Yz14TQWuPzxqcJXGoXll6PWLi9MlWP1/r4TkYRupJFQpao+ITA8
 OWQ/ugwtBl3Y7YN+KTn9jeWpE7EnnKzX629juVN0mO0tKlq8cvdRQLt0LuVb+9sDwnm85OvEDyZ
 ygkkE
X-Gm-Gg: AeBDiev915A4Qd/IOA2GTpZ7YcZ7vBY37xySYcLrP3PhfyimJqbXcGZrcawZOR+HwtG
 W45ygm39rvWV2fvYgjRzKRpf11a6XApiztJUE9JYEBk80vDdBleRi9+Fr8r7NdrN1Y3r2h9NQ6j
 UfHTc7U3SzojHZjLok28Gq3ieuEFBm2X2M/wPuoScuezSVAhp9jkrkdga43A3Ba+eU1eIa4h9Ui
 5Z0DpRNw18+54nw6sEeHc8zfOlfM60Q3dyNWNPJDw2CkWOlOfWz2uTji0NHsh8dd2xdEvZCAEGV
 X6a7S0fySxoGrIvZab8cyDpkoSeIEIms2zAPqqwMXhh7OFVLsBGWTX4feHjW2nBmhfza6acGlBP
 aAA1tbIs3XtyFxIsezXgcpE058q8bgaDlMtJv3AwDm8tyogUHqwSPgxsLWVq5/dpFcb/hKI0kQk
 ppR/+iKt6xJo63ZW2o8MKKIyXQjKxE6jGk66Jy0mwUejqtUH0rvsoGCDmz
X-Received: by 2002:a05:6830:43a9:b0:7dc:cb67:cb67 with SMTP id
 46e09a7af769-7e36615c337mr487975a34.5.1778197486009; 
 Thu, 07 May 2026 16:44:46 -0700 (PDT)
Received: from stoup.attlocal.net ([2600:381:c938:6375:9641:bbb2:a93a:bb4c])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7e367d8feb1sm84320a34.23.2026.05.07.16.44.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2026 16:44:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 32/60] target/arm: Implement FCVTN (16- to 8-bit fp) for SVE
Date: Thu,  7 May 2026 18:43:45 -0500
Message-ID: <20260507234413.643512-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260507234413.643512-1-richard.henderson@linaro.org>
References: <20260507234413.643512-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x330.google.com
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
 target/arm/tcg/helper-fp8-defs.h |  1 +
 target/arm/tcg/fp8_helper.c      | 23 +++++++++++++++++++++++
 target/arm/tcg/translate-sve.c   |  2 ++
 target/arm/tcg/sve.decode        |  1 +
 4 files changed, 27 insertions(+)

diff --git a/target/arm/tcg/helper-fp8-defs.h b/target/arm/tcg/helper-fp8-defs.h
index 023a49e12f..e67fb191c2 100644
--- a/target/arm/tcg/helper-fp8-defs.h
+++ b/target/arm/tcg/helper-fp8-defs.h
@@ -16,5 +16,6 @@ DEF_HELPER_FLAGS_4(sme2_fcvtl_hb, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
 DEF_HELPER_FLAGS_4(sve2_bfcvtn_bh, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
 
 DEF_HELPER_FLAGS_5(gvec_fcvt_bh, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_FLAGS_4(sve2_fcvtn_bh, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
 
 DEF_HELPER_FLAGS_5(advsimd_fcvt_bs, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, env, i32)
diff --git a/target/arm/tcg/fp8_helper.c b/target/arm/tcg/fp8_helper.c
index 2252d2c526..6588768ba1 100644
--- a/target/arm/tcg/fp8_helper.c
+++ b/target/arm/tcg/fp8_helper.c
@@ -409,6 +409,29 @@ void HELPER(gvec_fcvt_bh)(void *vd, void *vn, void *vm,
     clear_tail(vd, oprsz, simd_maxsz(desc));
 }
 
+void HELPER(sve2_fcvtn_bh)(void *vd, void *vn, CPUARMState *env, uint32_t desc)
+{
+    FP8Context ctx = fp8_dst_start(env, desc);
+    fcvt_fp8_output_fn *output_fmt = fcvt_fp8_output_fmt[ctx.f8fmt];
+    uint16_t *n0 = vn;
+    uint16_t *n1 = vn + sizeof(ARMVectorReg);
+    uint8_t *d = vd;
+    bool osc = FIELD_EX64(env->vfp.fpmr, FPMR, OSC);
+    size_t oprsz = simd_oprsz(desc);
+    size_t nelem = oprsz / 2;
+
+    for (size_t i = 0; i < nelem; ++i) {
+        float16 e0 = n0[H2(i)];
+        float16 e1 = n1[H2(i)];
+        d[H1(2 * i + 0)] = fcvt_f16_to_fp8(e0, output_fmt,
+                                           ctx.scale, osc, &ctx.stat);
+        d[H1(2 * i + 1)] = fcvt_f16_to_fp8(e1, output_fmt,
+                                           ctx.scale, osc, &ctx.stat);
+    }
+
+    fp8_finish(env, &ctx);
+}
+
 void HELPER(advsimd_fcvt_bs)(void *vd, void *vn, void *vm,
                              CPUARMState *env, uint32_t desc)
 {
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 7276d9c44a..c7fcf27183 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -4099,6 +4099,8 @@ TRANS_FEAT(BF1CVTLT, aa64_sme2_or_sve2_f8cvt, do_f8cvt, a,
 TRANS_FEAT(BF2CVTLT, aa64_sme2_or_sve2_f8cvt, do_f8cvt, a,
            gen_helper_sve2_bfcvt, true, true)
 
+TRANS_FEAT(FCVTN, aa64_sme2_or_sve2_f8cvt, do_f8cvt,
+           a, gen_helper_sve2_fcvtn_bh, false, false)
 TRANS_FEAT(BFCVTN, aa64_sme2_or_sve2_f8cvt, do_f8cvt,
            a, gen_helper_sve2_bfcvtn_bh, false, false)
 
diff --git a/target/arm/tcg/sve.decode b/target/arm/tcg/sve.decode
index b6ef8ed8de..806953bc35 100644
--- a/target/arm/tcg/sve.decode
+++ b/target/arm/tcg/sve.decode
@@ -1101,6 +1101,7 @@ BF2CVT          01100101 00 001 000 001111 ..... .....          @rd_rn_e0
 BF1CVTLT        01100101 00 001 001 001110 ..... .....          @rd_rn_e0
 BF2CVTLT        01100101 00 001 001 001111 ..... .....          @rd_rn_e0
 
+FCVTN           01100101 00 001 010 001100 ....0 .....          @rd_rnx2 esz=1
 BFCVTN          01100101 00 001 010 001110 ....0 .....          @rd_rnx2 esz=1
 
 ### SVE FP Compare with Zero Group
-- 
2.43.0


