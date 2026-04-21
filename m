Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C2F0EA71A4
	for <qemu-arm@archiver.kernel.org>; Tue, 21 Apr 2026 05:21:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wF3Sa-0000V4-Vn; Tue, 21 Apr 2026 01:15:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wF3Ru-0008F5-HY
 for qemu-arm@nongnu.org; Tue, 21 Apr 2026 01:15:02 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wF3Rs-0006fq-ML
 for qemu-arm@nongnu.org; Tue, 21 Apr 2026 01:15:02 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-2a871daa98fso25131075ad.1
 for <qemu-arm@nongnu.org>; Mon, 20 Apr 2026 22:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776748499; x=1777353299; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j4lvls8REn2eXN6U4nRWxnCtYhx8hX39DXmOAnRWBww=;
 b=zZEGeIPg5sV2RSgCMSRxOdTSkigTZsWmQVsm5ZK65YulQ/qeApfVIpZWMbgWcvMphY
 Nf8SGB+y/t/Z5L3ZQffgFvkNq2hugG1QZiCJnS9HBT6ZirJWG6eZfgm5FL84ZarEN+wn
 mrVDtwfllbfDBiFHchlneA6l7PMXqQ601yycCivTEKEfNPcybKIBTm/UEFHslvZ/J2nG
 lDZABgHixssZ5Uk6ODYS8zS3MjwZpyK82CNMIk6/51cDgaQzTZpFaS5NlgqhRmMPa48Y
 Ya+aldMYitxO7xe23aaY5ybedYX+DcVOmAaOkiRydN+dl3SW5iN171yoegyMdUBsNBgq
 z9bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776748499; x=1777353299;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=j4lvls8REn2eXN6U4nRWxnCtYhx8hX39DXmOAnRWBww=;
 b=kdgGnzdx9cGBA0+pyUBMdlepHz6JPfX4Urp8pz9FleivuYO8vn4nsFiTIyOOhO3Jxg
 49nj5EiMGOt5nzVKEW1/WnBAKryeGqfKIyxMcOVCDwvrxnQcfpW3tiAlClAAQm6WIch4
 1Mo0viQ+rjJ1oBcuEt4TTeAnrSMn4JvqfuqLYkWzzMPooO4Ey1Y3ow+jWGOkliapYptK
 k1kaxX/zT668uxvqXbpGjYNaGeA25A0U7kjkuGPG9W+0TiYMW8NgiD9Vr1SUz8ceZMko
 TNLQyLK3oslRm+cmJtHoNlG4Kw1lUFk25HuQrWCNMyXSzOnnLYnvyZ9dXSdhcOk9z7ay
 X+Bg==
X-Gm-Message-State: AOJu0YzHSKUnIaQrXplnhvM/nn0nnoXUgsT+4gpoxXCH69X/QnxZkmIb
 i3hfAmgXUzpQCQeKaw9bYHIeZH3fb0fjoqOV2uH3jMiCyW7B8de2qCNZ+xI3rOWjXDDNhHYa9CP
 gvKCSosA=
X-Gm-Gg: AeBDievSGT74i/U1WSwuj4FpBIqu3Sv7JVP1yR7e8NlxBGqGHcpkiGJ6JFNI4uvT0v5
 pxT4dpWpyqXR8pwEDDjladXDkIxYgQy0lDEHzOqqPRpWgMHNw/JRYZ6xJxCVH+a35kaqQGOmh/x
 Zrex0foTOJ1Df++0FxeN36c484M/KMr5vWxz1jdO8zkS8Fp8Vt6FyP/FHdxW+gkVNm5Bh9MFKhS
 Vg1zyiC3ltZIP1QDzfqN/4UCQ/dYw9+x8oyKXkg6TGv/k/OmOficlYsOrhaeJSNvBTM+3wv8oqE
 r6zceyvkejnfE0vo9KUYGTmozofbyD8t+kQS0xTpaajJ9OKp9rhQik7Wpyz2ltHarropoCKOsL2
 XboLum82upvyCozhoRVHrumKVdcxXSz39n/oCmXfDRBKITa6muvdOiGxsA6K8jb5wbSir1PLbBW
 HK1ybyfjKgo6Eod16rWdEcICrBvHDRVFeFXHSi2cOQ
X-Received: by 2002:a17:903:2acb:b0:2b4:6398:6aa2 with SMTP id
 d9443c01a7336-2b5f9f3a802mr183703095ad.27.1776748498504; 
 Mon, 20 Apr 2026 22:14:58 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b5fab0cddfsm174631715ad.49.2026.04.20.22.14.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2026 22:14:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 28/37] target/arm: Implement F1CVT, F1CVTLT, F2CVT,
 F2CVTLT for SVE
Date: Tue, 21 Apr 2026 15:13:37 +1000
Message-ID: <20260421051346.41106-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260421051346.41106-1-richard.henderson@linaro.org>
References: <20260421051346.41106-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
index ed4923b1d5..32c7a82647 100644
--- a/target/arm/tcg/fp8_helper.c
+++ b/target/arm/tcg/fp8_helper.c
@@ -192,6 +192,34 @@ void HELPER(sve2_bfcvt)(void *vd, void *vn, CPUARMState *env, uint32_t desc)
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
+            d[H2(i)] = float8_e5m2_to_float16(e, ctx.scale, &ctx.stat);
+        }
+        break;
+    case OFP8_E4M3:
+        for (size_t i = 0; i < nelem; ++i) {
+            float8_e4m3 e = n[H1(2 * i + ctx.high)];
+            d[H2(i)] = float8_e4m3_to_float16(e, ctx.scale, &ctx.stat);
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
index 1540cbd6de..e31ab609f9 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -4080,6 +4080,15 @@ static bool do_f8cvt(DisasContext *s, arg_rr_esz *a,
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


