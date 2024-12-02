Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2801974njk;
        Mon, 2 Dec 2024 05:14:18 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU9+10/UlHhQ/cIWQJ0YblK6OYvzDMS6tjHKdMGrZ6tZm+HQ785Atr1apJf4RD60dZIVMlHkSW12aaQeg==@linaro.org
X-Received: by 2002:a05:6000:705:b0:382:49fe:6f8a with SMTP id ffacd0b85a97d-385c6edd520mr24174028f8f.55.1733145258620;
        Mon, 02 Dec 2024 05:14:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733145258; cv=none;
        d=google.com; s=arc-20240605;
        b=kGYVy6Pz3NcfHcQ/gX6XC1TrukTE7m/q6yEuiucIkZa8kCU7JHlYP0QYm7w6RC2+n9
         HZPdwLpOKNYbmIOdUn1y5CBjV1kPgnySSCA79pdOG5cC+LzxamUG7BOXCm+Ilfd2nVTe
         32SUkkDC2ZHXGaek0Y9qIhQFVphjTubwJZD3ak7lgN48phVAUf7AcnVODWelD/4TntFR
         nSllC2bsu2w9asBoWARJyup84+mcsGyvo1nLAVfYJpt+RrQ/WsFpfEIw4gUdzUxO8rb9
         3uf1kY/WJ+lwiGoaE45HA1qGu7Q5qtmQ02rqUOxFcrP1uO8zkKWWhzpPIG1wshsHyZqn
         o55w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=2Xzjo6YdgDduUN5CW5xi57KmQUyStE6Nvif1Jh7XAts=;
        fh=YCdO5iI3ne+MZiMm9aU4wXUUqMoSLDzKXBDH0nLtdxo=;
        b=P5tInhH6EA2gzz2YSDTk6kd6DP4gHerMuu2XO22VUz7YSWX9ox/Td3phGMh6TALPgH
         2dI2f/pKLeQfpSbdjiKyQgMwohli76tOPKGiwjgqiDtuzYkWyH+F+6FSB6BfdMSFGoNB
         A/wk59slz9nYraTlm8plZSseRG3vugBggCBcaDmu5GYfFEcu9B0EC4WNEkcr2MYhHDZC
         qODszTFdrft+IhcOhtq67aQ5ZS69jU2xvLIPGM782aEZKhdiWHei4DDugjQ4gDDFGoQA
         /iIyv1VLuunq7zXI1QQiy6PYV7LAitC65VNtrGF5KcIFtoPp2vgKCOWbujaB7a5mS4IS
         dczw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QC2sCmXy;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-434b10a2f4bsor43009035e9.10.2024.12.02.05.14.18
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 02 Dec 2024 05:14:18 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QC2sCmXy;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733145258; x=1733750058; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Xzjo6YdgDduUN5CW5xi57KmQUyStE6Nvif1Jh7XAts=;
        b=QC2sCmXyu7PIIHaulypu3IZFNxrr9BMrGnaVrSHrXpB/mcbw4ir7WtCrG0N3Xrq1ej
         IetxhtLKDr+kYjF4VOHFicdQhMCDlOdY0kPpswd1htO85Q4+JbZlVADHPYUXr1wriOXv
         WjGY8dm64JHQ8nn1qDfZV/VUEPqwomZX3xGhrpu6WlelE7EyoSxXgJLW8YJYNWRTapOp
         dkxs9UuZANEOFkqKhF7YWhj436aqpGJsLUVMSWul8CMiBg9VWy45qYNLXBpAdotQYmtf
         tYZTybk4kZjx0xb4TZkr6OGc0idxmAhot1GUNy5i4keBT8yTcPtddBqBwxKyWSV3AknQ
         UImQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733145258; x=1733750058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Xzjo6YdgDduUN5CW5xi57KmQUyStE6Nvif1Jh7XAts=;
        b=GZEqt9zexICQxlae/MauQKsSs0lo/oU2oGGz70Ef6m1is6ZuXhUfNw0WDdMqjosgVK
         /TEhPGtrFEWleCWa61bqn5QsAtXC9BLRG4hm1qlE5O5SDo1s4ajG5RZeaeGSyCWddoR3
         p5CirznxbNejkkkZ2nWg2UkdP22nbgqeUZ+CONInjqIIGQ2FJhemVy2JDRyu0nHcPDeX
         Srz/PS6BIIsSduO7vN9oJg6USJRJDVynui+rhLqj4S8bgL5J5MDONBA0sRyzvNmDUli2
         yR/1+z6yOKw1P1u0n2wL4GIu0p83/iuDd0YJkocjLEMXW88kwiRoBRFFu+89sLsPC0Av
         CNSg==
X-Forwarded-Encrypted: i=1; AJvYcCV0W/D3pp5QmIayd7LN79niAQ3PD0QFFxW38xvmw9JGsJavwsHkO2MBPgGRi9N/vbVT4T3ZQ+2rPiq3fw==@linaro.org
X-Gm-Message-State: AOJu0YyKU9JRuVBDBJI0GZuGXnLVyZYn7Hmi53+wVZ4FG2iA6A4iSy/H
	QYwkJ4b4jLn2fZBdaJiCw8z8ncnlF52Eb7IU2vtQ4kECCHrubP1EOdlzEh1przFWhg==
X-Gm-Gg: ASbGncuYPPNT+1NlMU093qulTr5k/n522NFd+WrH/SRwtiUxH8XxDI39K5TRHa5w+VZ
	s1nsVkMpx4zXh8xWmOrvMkxRXAHcVji0lw7G4Q5GR57btPE8ulWPc+7oSbmlexDzuqPhz9aobnF
	pb1iFrhbhx4iDZtdABt3Yb3sdYgr3mwMQa7i6NMN/vrKQlnXOh/wFKK+JQm+jAnlQhneR9Scr23
	5ypvqYHnS25Zv8pvzAMMvnFRM1FBqKf++I8pr0v3R2E3xvA9AWGXzs=
X-Google-Smtp-Source: AGHT+IGVRwQv64xZT/ys+pYM7FLew3XpNvoLwo0JpRjreFc4Elcn+x+eqDZ6C7lHAc4rYFvS+ozJRw==
X-Received: by 2002:a05:600c:4f85:b0:431:4f29:9539 with SMTP id 5b1f17b1804b1-434a9dfbb05mr223665295e9.32.1733145256407;
        Mon, 02 Dec 2024 05:14:16 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385dea1e4ebsm10160157f8f.1.2024.12.02.05.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 05:14:16 -0800 (PST)
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
Subject: [PATCH v2 for-10.0 17/54] target/arm: Set Float3NaNPropRule explicitly
Date: Mon,  2 Dec 2024 13:13:10 +0000
Message-Id: <20241202131347.498124-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241202131347.498124-1-peter.maydell@linaro.org>
References: <20241202131347.498124-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: mqTr9+ArVEsi

Set the Float3NaNPropRule explicitly for Arm, and remove the
ifdef from pickNaNMulAdd().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c               | 5 +++++
 fpu/softfloat-specialize.c.inc | 8 +-------
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index ead39793985..c81f6df3fca 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -173,6 +173,10 @@ void arm_register_el_change_hook(ARMCPU *cpu, ARMELChangeHookFn *hook,
  *  * tininess-before-rounding
  *  * 2-input NaN propagation prefers SNaN over QNaN, and then
  *    operand A over operand B (see FPProcessNaNs() pseudocode)
+ *  * 3-input NaN propagation prefers SNaN over QNaN, and then
+ *    operand C over A over B (see FPProcessNaNs3() pseudocode,
+ *    but note that for QEMU muladd is a * b + c, whereas for
+ *    the pseudocode function the arguments are in the order c, a, b.
  *  * 0 * Inf + NaN returns the default NaN if the input NaN is quiet,
  *    and the input NaN if it is signalling
  */
@@ -180,6 +184,7 @@ static void arm_set_default_fp_behaviours(float_status *s)
 {
     set_float_detect_tininess(float_tininess_before_rounding, s);
     set_float_2nan_prop_rule(float_2nan_prop_s_ab, s);
+    set_float_3nan_prop_rule(float_3nan_prop_s_cab, s);
     set_float_infzeronan_rule(float_infzeronan_dnan_if_qnan, s);
 }
 
diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
index b4f3f0efa82..3a2d0444475 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -505,13 +505,7 @@ static int pickNaNMulAdd(FloatClass a_cls, FloatClass b_cls, FloatClass c_cls,
     }
 
     if (rule == float_3nan_prop_none) {
-#if defined(TARGET_ARM)
-        /*
-         * This looks different from the ARM ARM pseudocode, because the ARM ARM
-         * puts the operands to a fused mac operation (a*b)+c in the order c,a,b
-         */
-        rule = float_3nan_prop_s_cab;
-#elif defined(TARGET_MIPS)
+#if defined(TARGET_MIPS)
         if (snan_bit_is_one(status)) {
             rule = float_3nan_prop_s_abc;
         } else {
-- 
2.34.1
