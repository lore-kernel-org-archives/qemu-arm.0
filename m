Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2801609njk;
        Mon, 2 Dec 2024 05:13:57 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWW4VSU8An+L6618sCCWj8G9ogUWH2BXBf49XGJbKhAK0gf1BlKf4Fcgq1wqkKVmo1+Piz8av7d845qow==@linaro.org
X-Received: by 2002:a5d:47af:0:b0:385:ef39:6cd5 with SMTP id ffacd0b85a97d-385ef396e98mr4114415f8f.1.1733145237222;
        Mon, 02 Dec 2024 05:13:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733145237; cv=none;
        d=google.com; s=arc-20240605;
        b=JIl31YjEsd08bRX/qC2AApLqBcFRLs0CHkI+hg0FTtch27q3gTqW/Be437V3w/yppy
         7jspRVwjwnxSd6pbI3ZBA6y0RSP32LjHesS6rGs4xQPVraHNHPfHF57rdtju5rdYETQM
         dSDAbsV8XcMxUWYQ1TcX55Y3ueb3nO7wX6hcqzGmPOHhT53czYQ7rG9WBcLecLzw7Fb3
         Dgpaif8P8pj9BMc+YD8X4CJ7+HXmJiyKge9DvtpcWVVA/RqqimGWE7/xORHMiTJqir6W
         9xih3RmUveviTt9Ot8CNf4Tirq1OiBkRvuZkMN3jWg226m5/QUXRw8TOzB0BR/pPB/nO
         WIKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=X86TKVmBDvN75raroOS5cqB5k378L/9aSAueAeunYPY=;
        fh=/8tRCjGO/oCTDvCdDXzkI9/6C1v8pdcbOWtnF8rG4mM=;
        b=Yf2atLreUAJHF//qrdzDHYIbIuix+DyqOx14cf682wnHdU6orz+TOSHsjpAhuq7n+P
         Ko9eESRPMj5sms9lGnwWBSgwoc7z0CwVWFX1iw7RHwUSqTr8e9YhwQGSxTY6FvyD5jkV
         S7l/iyP3O8RUUeiB4RDR9JoYOCnBHnk5SKRzaioGlTcA3YpFQ3B1lfswV3ejPfGRIMBJ
         aES0SJbS/xg9Oc24sYG9ysFTWDsNg0iG8+3Fd/WYaIkdOjKio0Pv1yWGqr5o9Yaogc58
         wXk66QptvB+RH+rhnkOP9txICPDKfhqj+WheGkQMvqNdY9RqKCjJhdG6NmO4XZqyFWk8
         OqVg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pq2sHcrR;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-385dfafa86esor2321404f8f.5.2024.12.02.05.13.57
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 02 Dec 2024 05:13:57 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pq2sHcrR;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733145237; x=1733750037; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X86TKVmBDvN75raroOS5cqB5k378L/9aSAueAeunYPY=;
        b=pq2sHcrRPaNX2pbJxDu69RLxdLtXvuFNtbSjaepRjLhvmUOQiuzkgG2XvF88eheGgc
         a9hAp9Ra1Nu/OaaiDkyA7wN/esV3+wVNeLoeYfFZDbFHhTALq+CJ8MqaJySiA6px+R1D
         8OHyK22UTHpCOjvGT/IRW78EO8EEvSyowPHIHYmdW9px9L5PZwx4Reav7bppxoapw9aW
         9lC6yc0+K8YgMVxjnjHIRZh9NkPXzUmZlBhvAGZ0TUD1mVqaTsHcHQyf39WYK9n5lZ2g
         BszwBkdtIhIhU15Su91HrL0Stp08w2suzqGhgHc3rodDurlodgxP5XfLt27ygwP4r78b
         vz8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733145237; x=1733750037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X86TKVmBDvN75raroOS5cqB5k378L/9aSAueAeunYPY=;
        b=rDdMh8ZFcwKmf17Vu7cDdHd5JctJtjGpJ70hI2ZPWCE1Jef1NryUFv7jZYuBdLo850
         vn6UBFhOYTP6czQ/cCeUr1JYnQL7EWXep5Z4zHG6PUljMas1o/q0Fe5s7SUFGeP6S5kY
         kIwa8Si+UvtNyf7Kjd5sQYJ7gsinOM6tveZ767bCC/wB4rq3XTjKf0t0shnZ5i35FOjl
         akfVu79lawGcdo6aT/u2SVtY6aCqpMDIPqykUmtxi5RL/zd/xEc5TuPcOVqb4/83XGye
         KbnOZUaZLx1AIv63gCZKdvVkhybPI52R5zJ3DJCPUVGystwAl57sw5NXZCxTXmxI+BeW
         tpng==
X-Forwarded-Encrypted: i=1; AJvYcCX9/EIXt7+vXgIzte/8nAqF9CsHX+FfeAczmtvkMVbnniG+j50ZSY+FdIlJbg+xUV4E6iM4WJDWRs5FEg==@linaro.org
X-Gm-Message-State: AOJu0Yw1gf8SUtbFV6VeesfHvkefOgfoFjgmr/UfQpiIJdZIAmyMQcJ7
	87vddnSOVlgs84ndH0KLRktkj/+3DtrkyMctSZ7R0v4ojstA/Xhs3hf24nBwjmHPkg==
X-Gm-Gg: ASbGncun+8GWlEKbnkA8wGOCyeDBwQueFcH8fQs8Np1i1fbUw3T6cFhnlx+nxXWXI/9
	nmzad7Po28dzEaJMmyoQ4teA1i5AFEBVvdHOCaPl5/PtiAAu8Lex7pJ5iWVDRkZUbs0GrNFUmFg
	yKmSQkrG5iNecRega/sDpltYHeXG0LPGJPM8ZDKI/cLLU4TNhrcY1ysADxvDZe8dr42fbZV3R3I
	o7CxJpthzXrkunpJkG7+1j5uSxsNhKc8RzlUhgYqhhJZN9zC6Fk4js=
X-Google-Smtp-Source: AGHT+IFdQQWgR/bNLUdTgu3F5FTRNJTdAqhmVVBqbLbMiui/GUGucj15DDJzu/49uD8zVv4Y52wGZQ==
X-Received: by 2002:a5d:47af:0:b0:385:ef39:6cd5 with SMTP id ffacd0b85a97d-385ef396e98mr4114344f8f.1.1733145236576;
        Mon, 02 Dec 2024 05:13:56 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385dea1e4ebsm10160157f8f.1.2024.12.02.05.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 05:13:56 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Song Gao <gaosong@loongson.cn>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Thomas Huth <thuth@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>
Subject: [PATCH v2 for-10.0 05/54] target/arm: Set FloatInfZeroNaNRule explicitly
Date: Mon,  2 Dec 2024 13:12:58 +0000
Message-Id: <20241202131347.498124-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241202131347.498124-1-peter.maydell@linaro.org>
References: <20241202131347.498124-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: z78XRQrLRyUb

Set the FloatInfZeroNaNRule explicitly for the Arm target,
so we can remove the ifdef from pickNaNMulAdd().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c               | 3 +++
 fpu/softfloat-specialize.c.inc | 8 +-------
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 6938161b954..ead39793985 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -173,11 +173,14 @@ void arm_register_el_change_hook(ARMCPU *cpu, ARMELChangeHookFn *hook,
  *  * tininess-before-rounding
  *  * 2-input NaN propagation prefers SNaN over QNaN, and then
  *    operand A over operand B (see FPProcessNaNs() pseudocode)
+ *  * 0 * Inf + NaN returns the default NaN if the input NaN is quiet,
+ *    and the input NaN if it is signalling
  */
 static void arm_set_default_fp_behaviours(float_status *s)
 {
     set_float_detect_tininess(float_tininess_before_rounding, s);
     set_float_2nan_prop_rule(float_2nan_prop_s_ab, s);
+    set_float_infzeronan_rule(float_infzeronan_dnan_if_qnan, s);
 }
 
 static void cp_reg_reset(gpointer key, gpointer value, gpointer opaque)
diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
index f5b422e07b5..b3ffa54f368 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -489,13 +489,7 @@ static int pickNaNMulAdd(FloatClass a_cls, FloatClass b_cls, FloatClass c_cls,
         /*
          * Temporarily fall back to ifdef ladder
          */
-#if defined(TARGET_ARM)
-        /*
-         * For ARM, the (inf,zero,qnan) case returns the default NaN,
-         * but (inf,zero,snan) returns the input NaN.
-         */
-        rule = float_infzeronan_dnan_if_qnan;
-#elif defined(TARGET_MIPS)
+#if defined(TARGET_MIPS)
         if (snan_bit_is_one(status)) {
             /*
              * For MIPS systems that conform to IEEE754-1985, the (inf,zero,nan)
-- 
2.34.1
