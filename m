Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92A37FF887E
	for <qemu-arm@archiver.kernel.org>; Thu, 30 Apr 2026 00:23:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wIFAL-0007O3-NA; Wed, 29 Apr 2026 20:22:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wIFA8-0006si-P4
 for qemu-arm@nongnu.org; Wed, 29 Apr 2026 20:21:52 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wIFA6-0006Q3-Lb
 for qemu-arm@nongnu.org; Wed, 29 Apr 2026 20:21:52 -0400
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-82f6b592fc7so146285b3a.3
 for <qemu-arm@nongnu.org>; Wed, 29 Apr 2026 17:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777508509; x=1778113309; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L+v0OenRaeZRU5sqopMR+9IMg3L8wsZpGoK3Peg+SMo=;
 b=t0lkkA+X4qES9DwlwcrvEg4xg1J/OrZv51cCjbaohM5bclyR+ez7uyi8aifOfaiDpi
 tPhtYEqjk/K3a9bUH+xzrg6rNC+XhJI/lfe5t8j4QVw1rihBzfXTMj6/n/z3kEg2/izY
 Vi5Jt0EICHBQRDFoSdtPLdaAmE9IDCTt9uzBBz7r+PKtGFmBEl21+u21r1iR9oZsibVV
 GR256pVZYsdlWuS/Bmn2DeKgpvRzXD+oC1LzHNNA7BpJNjjePwQdNJ1OSw/5YKZREdih
 owVg72RpXgBapL+2DI/KEm3m+j49A/aByCeinWTRTtUOTkdN3i/W7e7OjQq1hAMCuCuh
 tzTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777508509; x=1778113309;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=L+v0OenRaeZRU5sqopMR+9IMg3L8wsZpGoK3Peg+SMo=;
 b=iAQxk4cDT7RRv3rMXIQ+xAWLZAO1m/tVfcqx0Cf7VPgPVRdELFkPD7Bbi0p15OiEmT
 c/syTNVHmD0lFwIXAUHYgglDIDt3qFSv+bRzQZC2BYa4Q1OGUvfFbrcuXv+1SXXSlLRG
 e4cvuGbtFJObFyG1L0u+DodY1N5vTEnjnMO5fq7C7zLJNMaJON3Wuxp65rJVn9hE/N8j
 Xg5KwpO2uiBXVnw3YcTRYT4GYiwj7ama4pmAuo4iQezs3aDIw8Ma8DZx3YHu1heUgN/e
 dxlRHmz3/iNEIwXO4hrk764RbMeT1RbbNvu5qpUg9synfLt7IECHFn2gNYwIwaxSqiw+
 9Xfw==
X-Gm-Message-State: AOJu0Yw7TH0yuJeSy7QvtWKASZicwlfR4r0bqO+acOCCzIQdJAw8LkuS
 Y5BIaeNTB6CAfU/5/TgWIXy8gVjsqZ8Z6EBjRRxIUXqj5AvC0rLLkvRSp/s2/jIjWe4=
X-Gm-Gg: AeBDieuCWj54AA3thPI45UqzpeVp4R85Yce3bgvRycsEmWdh+tpRffq6Cf6h6T03XKh
 4fwcrtntMubk+EElCf5Hcus+jf2xZRPb4RR+LErjq6+66NsLblBvEeIyO2X9gJO+k8WeiXi3Y+E
 6eIbnjJBRlizMzMrmwY+omQvadvQ36KKu1ainbIGmFu2fkj96SPYVUWADloHvXod6O/EukYspqi
 4TPd1qHfhEdghAcVYEFndMg6Jqodi2UUiRWDFoTlNzaxQWW0InYQSgaTUYSJaTPXUc8Pf9T10ax
 wa9tf7jPtOwzSkH87NJH4AP1B5joWumQET4uv2M/99VZpIxOpDl6LaqZgRGsbU7s2gpD/LJcEuJ
 HpmDOcC/W/lAtLjt6+3wifVthbRp3bQcYUYXA8wP9RD13WIkMU204Ed31xebaT5NqYcja/q0S9n
 g3PX/3+8jxdD8q6aX+sLfPVJcezsEriJqA277rPOGQ
X-Received: by 2002:a05:6a00:90a7:b0:82d:29f:d003 with SMTP id
 d2e1a72fcca58-834fdb44ed0mr903822b3a.12.1777508509164; 
 Wed, 29 Apr 2026 17:21:49 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-834ed5cd3b8sm3461727b3a.16.2026.04.29.17.21.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Apr 2026 17:21:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 26/47] target/arm: Implement F1CVT, F1CVTLT, F2CVT,
 F2CVTLT for SVE
Date: Thu, 30 Apr 2026 10:20:25 +1000
Message-ID: <20260430002046.59739-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430002046.59739-1-richard.henderson@linaro.org>
References: <20260430002046.59739-1-richard.henderson@linaro.org>
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
 target/arm/tcg/helper-fp8-defs.h |  1 +
 target/arm/tcg/fp8_helper.c      | 28 ++++++++++++++++++++++++++++
 target/arm/tcg/translate-sve.c   |  9 +++++++++
 target/arm/tcg/sve.decode        |  5 +++++
 4 files changed, 43 insertions(+)

diff --git a/target/arm/tcg/helper-fp8-defs.h b/target/arm/tcg/helper-fp8-defs.h
index 718463422b..3021dafd44 100644
--- a/target/arm/tcg/helper-fp8-defs.h
+++ b/target/arm/tcg/helper-fp8-defs.h
@@ -9,3 +9,4 @@ DEF_HELPER_FLAGS_4(sme2_bfcvt_hb, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
 DEF_HELPER_FLAGS_4(sme2_bfcvtl_hb, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
 
 DEF_HELPER_FLAGS_4(advsimd_fcvtl_hb, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
+DEF_HELPER_FLAGS_4(sve2_fcvt_hb, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
diff --git a/target/arm/tcg/fp8_helper.c b/target/arm/tcg/fp8_helper.c
index 2739cdb343..2d5fd688cc 100644
--- a/target/arm/tcg/fp8_helper.c
+++ b/target/arm/tcg/fp8_helper.c
@@ -221,6 +221,34 @@ void HELPER(sve2_bfcvt)(void *vd, void *vn, CPUARMState *env, uint32_t desc)
     fp8_finish(env, &ctx);
 }
 
+void HELPER(sve2_fcvt_hb)(void *vd, void *vn, CPUARMState *env, uint32_t desc)
+{
+    FP8Context ctx = fp8_src_start(env, desc, 0xf);
+    uint8_t *n = vn;
+    uint16_t *d = vd;
+    size_t nelem = simd_oprsz(desc) / 2;
+
+    switch (ctx.f8fmt) {
+    case OFP8_E5M2:
+        for (size_t i = 0; i < nelem; ++i) {
+            float8_e5m2 e = n[H1(2 * i + ctx.high)];
+            d[H2(i)] = fcvt_fp8e5m2_to_f16(e, ctx.scale, &ctx.stat);
+        }
+        break;
+    case OFP8_E4M3:
+        for (size_t i = 0; i < nelem; ++i) {
+            float8_e4m3 e = n[H1(2 * i + ctx.high)];
+            d[H2(i)] = fcvt_fp8e4m3_to_f16(e, ctx.scale, &ctx.stat);
+        }
+        break;
+    default:
+        float16_invalid_input(d, nelem, &ctx.stat);
+        break;
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


