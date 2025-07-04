Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1250946dyc;
        Fri, 4 Jul 2025 07:24:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUOKZMy8WBt1o9KYQjd5rujiwMzESyzO0leuAmOKzEGu95Wq/Uzuip/9nFczWcmogAOQNbqrvSDPILA5Q==@linaro.org
X-Google-Smtp-Source: AGHT+IF+e+ShUMtiQrFFY6DJJkrIo5W7DsLRhIxFLVVEXb3KIhn0Y/rueWdvxvpwKMMxsYCp4bLs
X-Received: by 2002:a05:622a:1e0e:b0:476:add4:d2cf with SMTP id d75a77b69052e-4a996442554mr43792641cf.16.1751639064586;
        Fri, 04 Jul 2025 07:24:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751639064; cv=none;
        d=google.com; s=arc-20240605;
        b=M75d71yY5i5MCL+dd+HZIAVdSW0smZdueMgy19oW0+CwuHu+mk4zJjTmeguUExuisK
         IPNOW6KwS0GRUFoXXvA+CfblJK9P3zarjfhoFQoSRK16C8EaocLVsLbAz4PyPbC4muwH
         snD45+AAhM1iV6rzc0vC4PyMmxc8SuHnvBkNBoYFIDzhKDs/ylcMXfhQtDuxzzsIwEGY
         fiUUhxzy8pJ7G/bd3KlVjRcEfOjl/F/4eaBK0lLCFm5M9Fm2burEtsHQVyCcau+JXW8X
         xLxXAJDYIuCdPvHt0Z6/zyiAcetKYxWanhpQ3Kot+guWpH1QCB6y2DWQkOqj88SgbGi6
         O1HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=RfwmDf3/yL1RuRZgQLbRD4ioWrvuc1PHMAmmtaTrtA8=;
        fh=s400U+Tx6cQDhtn+2Oey97pyo8KpW6wmR0wxZgTa8vk=;
        b=cNH7JiTX+tODH4BcHVzTkE2I8GhrD2k8m02lol/4GePuS4x6pJaPfpPd4mfevWC1Vk
         uyP3emnu6zze+LVoel4zo+RHSyvKI5in9a6LQ01SIRikwY3yT2/xcj1WjGOfoTd0UpDa
         qr53DH+pOMKKseXiw7XKOWl5//7j8TEED5nW7yNWzqMg+vgxf1N5zNKbj8ji3ndeeKuE
         lkrY9x3iMMMnAoTA+Cudhhx8ePcBYqhFBh4t+0mSK3OEiZXOExGyDT1jKvdynsHdakad
         s64MM/NujdbCPX1m++tMpN0ZA/PfgNM9C7s/hYzkhILSIH+GxTS/cJXKzYbYYkBjyIQ1
         bMgg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fgfE3BC7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d5dbed8bf0si215743785a.438.2025.07.04.07.24.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jul 2025 07:24:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fgfE3BC7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXhKU-0008Ay-HD; Fri, 04 Jul 2025 10:23:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhI7-0004wC-QA
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:21:28 -0400
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhI5-0005On-4A
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:21:27 -0400
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-2ea35edc691so366770fac.2
 for <qemu-arm@nongnu.org>; Fri, 04 Jul 2025 07:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751638884; x=1752243684; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RfwmDf3/yL1RuRZgQLbRD4ioWrvuc1PHMAmmtaTrtA8=;
 b=fgfE3BC7qkG3PEH5pGXO6BoEj7VAQZtiwtw8QUySekQ4yJ4JyyAEzzZitaa8BRxNY9
 AMmmTx4g6g92ccsbN7vlwGr2+D6/6A3tY9K/nJLDSMc7vZQSmbOzpdHHO/SGVGFRq83n
 S2p6KhLCsjJIT7z70Hxo/6rV62aPqIIIVaU8y0P8s/VSR2Fz1969QYSDwhlKXYZ0/AQQ
 MSFdrUJUeUIZ9EbsatAmm8EE5oEicVUpIw7AQCZF+TgLS81P2o2xaO8tgjvxvqTb8Ae/
 anFmvaN0+9tqYSGl8KCU3KCiE/oO43ZeBQYlyHgwoUnB0qBCXTA3U0yz27whMfryqgKu
 85Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751638884; x=1752243684;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RfwmDf3/yL1RuRZgQLbRD4ioWrvuc1PHMAmmtaTrtA8=;
 b=ldax/D3ucZDgnbPCu+gZEoTJNZaZ4JFRKZiWmT81Bsdgeo7/uzpq0b+JsjhQlQmLAl
 QbKWD+iPXKOt5Ks+y3tJF5lYSuzd5ovbX2i88MHvhQzUsZuhzOEaJ3R4chuymxqWClmF
 1aNYwtekQMCYVZQTd5k+QsfAHtE3zdBV1KIY4Zd2BkPocm+c6rGYMbDUbPQl8D5ViZCc
 DO4joVHy2QNPzzoe/kT3RmP9/aYImPMvxviMuQ7Pb2gIpgwkU5Gwls4qzp4AoryBY7U9
 JVvThRY7dUbE2Ptj/R8ukmGLd7WfNWCxIdtTLwPfdhZ3J9qmnPMQdRbA5XHGXaD6YQV4
 1WdQ==
X-Gm-Message-State: AOJu0YxuiOvHFmjb+OAwJa4E7Z+xHb1Meoqp2PENR77axZElscVe1l+E
 rwgVWNWbd1S1N+Sux9nFx5Rv50Ozl+HAErrofjE9XCo78mhtCMOIwWoM2w3t0mT+FJKvTnx4nNu
 mGj2l1vk=
X-Gm-Gg: ASbGncvnGZw+JYVXzGCIMuoiRyh8knlRWnBRN4JUxLi0WtNpN/BG/KQqxVf8TftIEuB
 yosFAxEUDCa+//qF+hybfZbz5DsZ6TVDbkgLhLMIkZPdA5PNt6ElVAAP6W1Vz0aInHtiTG8v5lw
 KUFA2zpzJnYJ8787VkKzO4D84JNlLBzMatScAWyClmg0wS1qKulkdbla0grg0adu0yjSn+sFogT
 CftqRZi4jucAKNwVH/OimB11XKqUIB6BcYBKz1chywSaAktMWTFCh+ONXve3vju3R8x4OZJp9eZ
 2P39woR1CMTKlLEVushpk8dtY1xM7RW40WmoE6+fu8YkT9PI3zJHkXU+HahTH4oI01KR90PXfLP
 YFJ6ORWOuY2x+GlCWF+eqqDWrqZXJe2tt9zCEPcuXlaA8BqYk
X-Received: by 2002:a05:6870:a351:b0:2d9:45b7:8ffc with SMTP id
 586e51a60fabf-2f796a7b418mr1595963fac.3.1751638883993; 
 Fri, 04 Jul 2025 07:21:23 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2f78ff0471esm528016fac.3.2025.07.04.07.21.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 07:21:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	qemu-stable@nongnu.org
Subject: [PATCH v4 008/108] target/arm: Fix f16_dotadd vs nan selection
Date: Fri,  4 Jul 2025 08:19:31 -0600
Message-ID: <20250704142112.1018902-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704142112.1018902-1-richard.henderson@linaro.org>
References: <20250704142112.1018902-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2f;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2f.google.com
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
X-TUID: i+gtg2cQ9sGx

Implement FPProcessNaNs4 within f16_dotadd, rather than
simply letting NaNs propagate through the function.

Cc: qemu-stable@nongnu.org
Fixes: 3916841ac75 ("target/arm: Implement FMOPA, FMOPS (widening)")
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/sme_helper.c | 62 +++++++++++++++++++++++++++----------
 1 file changed, 46 insertions(+), 16 deletions(-)

diff --git a/target/arm/tcg/sme_helper.c b/target/arm/tcg/sme_helper.c
index de0c6e54d4..8f33387e4b 100644
--- a/target/arm/tcg/sme_helper.c
+++ b/target/arm/tcg/sme_helper.c
@@ -1005,25 +1005,55 @@ static float32 f16_dotadd(float32 sum, uint32_t e1, uint32_t e2,
      *  - we have pre-set-up copy of s_std which is set to round-to-odd,
      *    for the multiply (see below)
      */
-    float64 e1r = float16_to_float64(e1 & 0xffff, true, s_f16);
-    float64 e1c = float16_to_float64(e1 >> 16, true, s_f16);
-    float64 e2r = float16_to_float64(e2 & 0xffff, true, s_f16);
-    float64 e2c = float16_to_float64(e2 >> 16, true, s_f16);
-    float64 t64;
+    float16 h1r = e1 & 0xffff;
+    float16 h1c = e1 >> 16;
+    float16 h2r = e2 & 0xffff;
+    float16 h2c = e2 >> 16;
     float32 t32;
 
-    /*
-     * The ARM pseudocode function FPDot performs both multiplies
-     * and the add with a single rounding operation.  Emulate this
-     * by performing the first multiply in round-to-odd, then doing
-     * the second multiply as fused multiply-add, and rounding to
-     * float32 all in one step.
-     */
-    t64 = float64_mul(e1r, e2r, s_odd);
-    t64 = float64r32_muladd(e1c, e2c, t64, 0, s_std);
+    /* C.f. FPProcessNaNs4 */
+    if (float16_is_any_nan(h1r) || float16_is_any_nan(h1c) ||
+        float16_is_any_nan(h2r) || float16_is_any_nan(h2c)) {
+        float16 t16;
 
-    /* This conversion is exact, because we've already rounded. */
-    t32 = float64_to_float32(t64, s_std);
+        if (float16_is_signaling_nan(h1r, s_f16)) {
+            t16 = h1r;
+        } else if (float16_is_signaling_nan(h1c, s_f16)) {
+            t16 = h1c;
+        } else if (float16_is_signaling_nan(h2r, s_f16)) {
+            t16 = h2r;
+        } else if (float16_is_signaling_nan(h2c, s_f16)) {
+            t16 = h2c;
+        } else if (float16_is_any_nan(h1r)) {
+            t16 = h1r;
+        } else if (float16_is_any_nan(h1c)) {
+            t16 = h1c;
+        } else if (float16_is_any_nan(h2r)) {
+            t16 = h2r;
+        } else {
+            t16 = h2c;
+        }
+        t32 = float16_to_float32(t16, true, s_f16);
+    } else {
+        float64 e1r = float16_to_float64(h1r, true, s_f16);
+        float64 e1c = float16_to_float64(h1c, true, s_f16);
+        float64 e2r = float16_to_float64(h2r, true, s_f16);
+        float64 e2c = float16_to_float64(h2c, true, s_f16);
+        float64 t64;
+
+        /*
+         * The ARM pseudocode function FPDot performs both multiplies
+         * and the add with a single rounding operation.  Emulate this
+         * by performing the first multiply in round-to-odd, then doing
+         * the second multiply as fused multiply-add, and rounding to
+         * float32 all in one step.
+         */
+        t64 = float64_mul(e1r, e2r, s_odd);
+        t64 = float64r32_muladd(e1c, e2c, t64, 0, s_std);
+
+        /* This conversion is exact, because we've already rounded. */
+        t32 = float64_to_float32(t64, s_std);
+    }
 
     /* The final accumulation step is not fused. */
     return float32_add(sum, t32, s_std);
-- 
2.43.0

