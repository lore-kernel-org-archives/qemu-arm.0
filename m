Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1251048dyc;
        Fri, 4 Jul 2025 07:24:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVzxq4DN4bA9rqGGQOJxVAElDr5tHkGCkEBRotNfRhnWB5i+pHcZpcVWOgJiHkravwCVPWeizs2kIG1WA==@linaro.org
X-Google-Smtp-Source: AGHT+IGoVei2jADztnP6wbSbO8TYzR7+Q+VSOprqROUbGT8HmDgycVL6SQ0tl9UGftMyPvgZvl8I
X-Received: by 2002:ac8:5792:0:b0:494:ad27:72ae with SMTP id d75a77b69052e-4a99682ec11mr42485671cf.48.1751639074537;
        Fri, 04 Jul 2025 07:24:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751639074; cv=none;
        d=google.com; s=arc-20240605;
        b=SvaJWproIi5Tdf8RXuWLjrrWYD10XbqG+Z2xh8QuzUjbmqC21sMYmAlMSbkmztq5CZ
         IMKLSptx4CzzYIthdtlpp9c/+rlMgFNoEmRi7EIHlN6kY4UFCFKNoFyKoa5iFRSJvON8
         CiW1EtY76MoCpDuYsIKUtvEAs3Im9iBmgNO/eqC0d5J0rQ+GB53JfIUBJ06Msa362RJ4
         xITbpXPcOgltV07sljj9Rt2Df36Zdi+EvhWLZzfOToywtzTBdKwt/lxc/DhGQPzUy23f
         YXn31Sn9P/5cDFXJKEzerbvfMXQh+4MPhwjVNeHAqjP4vCZJUSDf3nz/uoOqiddQdAhg
         rkVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=1CvnYhdClMbhruEBotoxV/Si4Ta54uQOuX2WFi9R0V0=;
        fh=s400U+Tx6cQDhtn+2Oey97pyo8KpW6wmR0wxZgTa8vk=;
        b=SSoTtTy8QyYJvY9DWecMrQShLs4OdBjJkAw8U3pOBUX3jQxc/ieNYVVqht3qwkZgQr
         Ai1aRYuZffWKqR+iDsfNi9rgaot2XFiBoN0qoIRQ1GR8DfS3R/gUddSXVzGaQ4p9wYgO
         F10exT1/smeq8xFOjSPu9IdTzifFsuyL2hOwY6fWUdXDiQ2/21X/gD9V//mw6KHagCD1
         VOlkQgTlQTZvymGYaZ+26A7z/ktAp1icLoHSei1oL/Y9tYzibpCE6Lsyxo39EI8wi2Gj
         50akA/GVODOO10vOMvuIK7DExObX/CdKKT2s+O+6s87frZHLvyhe5m6wlHuyYVP9O/VI
         pdYQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="UX6PdGV/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a9949f3876si23211651cf.72.2025.07.04.07.24.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jul 2025 07:24:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="UX6PdGV/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXhKa-0000MU-Kq; Fri, 04 Jul 2025 10:24:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhI9-0004zp-SM
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:21:32 -0400
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhI7-0005Q5-4Y
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:21:29 -0400
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-2e95f0b6cb7so407820fac.3
 for <qemu-arm@nongnu.org>; Fri, 04 Jul 2025 07:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751638885; x=1752243685; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1CvnYhdClMbhruEBotoxV/Si4Ta54uQOuX2WFi9R0V0=;
 b=UX6PdGV/ZFIMkpM1pUk5Y0BJaIH+zz4o311IvRfnJkjhjdeqiQSOibwenV0csP+LZu
 uL9jcIQHRSf3N1LSO7MDkTr1hcf+f//1gukPD7Ejyd2LSraQTI2w1jwdVXVCFbEVtrFL
 yVmq6vRPuW3c+vEhoSXeexxSk6xal916N2x7K5kJv9X1KvqNa652CiFldnBo+9zcCRHY
 qTPcUe/mYgJ9uokyG8g/eMtCh/beUdu+fsq3qoEQADIJW0fYDV618GgE09kZ00X649M1
 UZrdfsafO7Szrogf9Q3Fht25FjnU/wXz8AXzVvsUTK4YxuaXEj8dXQ5rm7J5OR8SCHe5
 eGFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751638885; x=1752243685;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1CvnYhdClMbhruEBotoxV/Si4Ta54uQOuX2WFi9R0V0=;
 b=c8WEF7yIJXe0MrABjhiDP6qOYguL5nint8ixXhf0Hu2E1xPe2ArWjs+NG2gVCgHU4d
 p9iStEZ0sgMHePeGxGVtZLl2HsrCVP13yvcMBsQ2ydsjgv7PrXo5YsiwE/Ba2eonDn+Q
 xOIMXONE2XAk52n+D/nfGzSTV2P457+TU8iHrOI1kpJR1F8WzrLeJ1nkReZClvNfTtQt
 RLp3cnz/w+fFydgYp6ufh1GYjiuoRXYOu5Eu1xOEfZatZ2AG+58xNTvDggZa2RZ3n33Y
 YNMVEIrJGDOHrbVssWBL3awaf+2HB0srIm7FFOxEv1THAnOyZRW5uyh0xrz5p/LBNjfw
 /R7A==
X-Gm-Message-State: AOJu0YygYtmfnKWxW5/e2v7GsaeCSjvFneSwAGLhKbu+sYlvYyL1Ad1U
 aMO6ABOFJX+2EkqdcMMc/ZCpKvz9CwhCrxcqvXJrEWY6xpOjDZdyB7P7SzQxHj0Vxv4=
X-Gm-Gg: ASbGnctbE475GVCgmerGG1IVKApT+yW2UFps7xf+8FLn4D3Rh9hlzFQbSC6urKOEE7U
 JjwaDAT8ZySPQJSJI6b2kr1J8B+6THKG8GAVKR+/NRhJ/pTSSs1i4/GMN3kATC3pebizQREPe1x
 n17kbAGvXKMEwB7CVngdPw30M7qEOYEAYH3lMOU3hIIWvxRLioddMi8SYzdYrLl1pU6aR16Sf4s
 pWaIPqwUyaAHBuLmIRyixdF0K5F+4q/L5IPBz0YTU9z9tnUAWaugVcMV6QMlJvNWCcZsgjMNHMx
 oz2R5y8Pa5xV9rn5sdHn6ZBDM8rWFYa3e31e9XpZycFcKp9edCgEAcCRh0LmrdEg3wnrclHJ95g
 ZTAb/nxEHcVXo7QN/MBjsIGzwrAfkbxfVaExjl9iM00vXfxnD
X-Received: by 2002:a05:6870:ebcd:b0:2c7:6150:fff7 with SMTP id
 586e51a60fabf-2f796ce49bcmr1769357fac.35.1751638885391; 
 Fri, 04 Jul 2025 07:21:25 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2f78ff0471esm528016fac.3.2025.07.04.07.21.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 07:21:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	qemu-stable@nongnu.org
Subject: [PATCH v4 009/108] target/arm: Fix bfdotadd_ebf vs nan selection
Date: Fri,  4 Jul 2025 08:19:32 -0600
Message-ID: <20250704142112.1018902-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704142112.1018902-1-richard.henderson@linaro.org>
References: <20250704142112.1018902-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::29;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x29.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: evTjT20eEoM/

Implement FPProcessNaNs4 within bfdotadd_ebf, rather than
simply letting NaNs propagate through the function.

Cc: qemu-stable@nongnu.org
Fixes: 0e1850182a1 ("target/arm: Implement FPCR.EBF=1 semantics for bfdotadd()")
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/vec_helper.c | 75 ++++++++++++++++++++++++++-----------
 1 file changed, 53 insertions(+), 22 deletions(-)

diff --git a/target/arm/tcg/vec_helper.c b/target/arm/tcg/vec_helper.c
index 986eaf8ffa..3b7f308803 100644
--- a/target/arm/tcg/vec_helper.c
+++ b/target/arm/tcg/vec_helper.c
@@ -2989,31 +2989,62 @@ float32 bfdotadd(float32 sum, uint32_t e1, uint32_t e2, float_status *fpst)
 float32 bfdotadd_ebf(float32 sum, uint32_t e1, uint32_t e2,
                      float_status *fpst, float_status *fpst_odd)
 {
-    /*
-     * Compare f16_dotadd() in sme_helper.c, but here we have
-     * bfloat16 inputs. In particular that means that we do not
-     * want the FPCR.FZ16 flush semantics, so we use the normal
-     * float_status for the input handling here.
-     */
-    float64 e1r = float32_to_float64(e1 << 16, fpst);
-    float64 e1c = float32_to_float64(e1 & 0xffff0000u, fpst);
-    float64 e2r = float32_to_float64(e2 << 16, fpst);
-    float64 e2c = float32_to_float64(e2 & 0xffff0000u, fpst);
-    float64 t64;
+    float32 s1r = e1 << 16;
+    float32 s1c = e1 & 0xffff0000u;
+    float32 s2r = e2 << 16;
+    float32 s2c = e2 & 0xffff0000u;
     float32 t32;
 
-    /*
-     * The ARM pseudocode function FPDot performs both multiplies
-     * and the add with a single rounding operation.  Emulate this
-     * by performing the first multiply in round-to-odd, then doing
-     * the second multiply as fused multiply-add, and rounding to
-     * float32 all in one step.
-     */
-    t64 = float64_mul(e1r, e2r, fpst_odd);
-    t64 = float64r32_muladd(e1c, e2c, t64, 0, fpst);
+    /* C.f. FPProcessNaNs4 */
+    if (float32_is_any_nan(s1r) || float32_is_any_nan(s1c) ||
+        float32_is_any_nan(s2r) || float32_is_any_nan(s2c)) {
+        if (float32_is_signaling_nan(s1r, fpst)) {
+            t32 = s1r;
+        } else if (float32_is_signaling_nan(s1c, fpst)) {
+            t32 = s1c;
+        } else if (float32_is_signaling_nan(s2r, fpst)) {
+            t32 = s2r;
+        } else if (float32_is_signaling_nan(s2c, fpst)) {
+            t32 = s2c;
+        } else if (float32_is_any_nan(s1r)) {
+            t32 = s1r;
+        } else if (float32_is_any_nan(s1c)) {
+            t32 = s1c;
+        } else if (float32_is_any_nan(s2r)) {
+            t32 = s2r;
+        } else {
+            t32 = s2c;
+        }
+        /*
+         * FPConvertNaN(FPProcessNaN(t32)) will be done as part
+         * of the final addition below.
+         */
+    } else {
+        /*
+         * Compare f16_dotadd() in sme_helper.c, but here we have
+         * bfloat16 inputs. In particular that means that we do not
+         * want the FPCR.FZ16 flush semantics, so we use the normal
+         * float_status for the input handling here.
+         */
+        float64 e1r = float32_to_float64(s1r, fpst);
+        float64 e1c = float32_to_float64(s1c, fpst);
+        float64 e2r = float32_to_float64(s2r, fpst);
+        float64 e2c = float32_to_float64(s2c, fpst);
+        float64 t64;
 
-    /* This conversion is exact, because we've already rounded. */
-    t32 = float64_to_float32(t64, fpst);
+        /*
+         * The ARM pseudocode function FPDot performs both multiplies
+         * and the add with a single rounding operation.  Emulate this
+         * by performing the first multiply in round-to-odd, then doing
+         * the second multiply as fused multiply-add, and rounding to
+         * float32 all in one step.
+         */
+        t64 = float64_mul(e1r, e2r, fpst_odd);
+        t64 = float64r32_muladd(e1c, e2c, t64, 0, fpst);
+
+        /* This conversion is exact, because we've already rounded. */
+        t32 = float64_to_float32(t64, fpst);
+    }
 
     /* The final accumulation step is not fused. */
     return float32_add(sum, t32, fpst);
-- 
2.43.0

