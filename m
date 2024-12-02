Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2802645njk;
        Mon, 2 Dec 2024 05:14:56 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVcnOjefC3eT/UtDUZ+jogGDRFLrSDi29aMfWR7hQu2Vd2H5anp5hh4GcKn1JBR99qSgjaqZSBQl3gVxw==@linaro.org
X-Received: by 2002:a05:6000:156e:b0:385:e45b:92a2 with SMTP id ffacd0b85a97d-385e45b940emr7061844f8f.7.1733145296071;
        Mon, 02 Dec 2024 05:14:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733145296; cv=none;
        d=google.com; s=arc-20240605;
        b=hTdVixAes8FTJBNVTndi9+IczeYa6hTWsZQK0TCCOGU1kQ0jme302BrJCQPVgs5wT7
         vLFY54zrxrcTtHBA5jgX5Ejz0PLbpWRmWoJljjR86EUXEVmsXOtcP0jOssfQYpbF2lIs
         5LU1LVz/8HLgFAlEIdv/IWik8qTTqFqmg6wB2OnA+M4/KqJCm2qespWnjkFOxFf+tJex
         C04AX+o+JEJLP3za3c5UfXTxESH3MqoMKjlbinZ1uWuPFjiA/0bVdy9ogjdyGqEk4ewL
         ELFp9scVMzQRGZGVzFwjNYLAP6WF2nGXrpfMAifpvF3NzOvSorrb7qQsKE2GTqsn6b8z
         j4xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=2ViFvWD2hAYTuBKEMhbDqPcZsE6RzFHNeiujTaxjrOk=;
        fh=Tc/UZKNAJ4XaPnBMPAdQsprj45cRRDdrbJMwg+lGB24=;
        b=UDtCDdDYYSp6j9lqQ0L4j6SmFjLLv82yxe9fWaZ/yV0GVlAhPA8OnljDGA0SfMMaMX
         hWo6UWjUoRzQROiOrqLAEYLewat/JJR3gyEBrXwg2Vt+td+EkWrCOEOMfOrxkef6d1YT
         Rcx0DYLyN31yCk01lYUW1IR8+ClQ85jrk1zblx8uk2eHw62DHFiGbA+SrktJgNLjJkHP
         /QaR/RnooTOZ3tZQDPD3G5zHf0NR8mw7eJ8QVt0To4nck0H4E40i6kbylHMYsIrI2VIw
         C9xR1VxHsBY7Fy4LLmxPcIjEHvjWIEW0+Yy6X+B91Zy6AizvnHWC5Gyxc0KPj79RwbPo
         m5bQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qP2ixutB;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-434aa75ca74sor29117845e9.1.2024.12.02.05.14.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 02 Dec 2024 05:14:56 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qP2ixutB;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733145295; x=1733750095; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ViFvWD2hAYTuBKEMhbDqPcZsE6RzFHNeiujTaxjrOk=;
        b=qP2ixutBLlURiKw0iQWy48HVAIFu5j2M94U+UWWfHmGgGkDy1xpAH0Ged1X03Gg2Hk
         ZnQz6XqJP33DUh1mS44ku9bYI40CEsudisp/n08S/d4WdHxaNNuKLsQmlPTlIpd7/Jy8
         5xGx3o5u9iDBa7vYGdAtVyGagwR2nYIQxVY4mstXPzM2TwV1AxUK93axujyXhOPJCdDn
         JaXv/1k6n8uwPjC66vPTsEeLgJ8ZDJwb3q13I7JQ4kdLFJu6lOiMz4OZLq/X30FFaaGJ
         ZJANf4nOg+f1XzxA0d6UKz7s58UICoW9jrSpnd3/rD9uvaS5A1z5550egNk8oYUzrYMw
         0CAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733145295; x=1733750095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2ViFvWD2hAYTuBKEMhbDqPcZsE6RzFHNeiujTaxjrOk=;
        b=hR341QBpd2k6x8aYep+pe2+0J03pK2COsG1qCKZOGesj9gKRFOKg1lDwBgUM9yOyvs
         MmS/JBECTzaFfLAW565gxybj1NmLcVpEj9Tz9UczyxmjFMlmup2Hd6EylpT8mdnr0W9E
         rNWsL0Nc8keVINLUF0wD4oGsd2gzHyAg6hPDDw2vJ2n0JT4MTcowLVQbSEmFFp+bORX5
         QgvbpEchgjE43aMXMiceoIHKIqVk8vNynGLQwat/pXYQAT2CULIJIAmT+E2cg8jIIqT8
         45tz6lWVfH5N1m5BkGswUXEJjoTURCcabE7b41ciFbU708CQWkdEjci6OrvHt+K8EES0
         wHjw==
X-Forwarded-Encrypted: i=1; AJvYcCVQpN+LfW6ATH0j6vfOOfRvVXgAuOk21mWZLJkGsotJsMtapOcqZW2CnzHAKFUAeNmyML0QtEQQX5T3lA==@linaro.org
X-Gm-Message-State: AOJu0YyDvG411eSmVrCuGpuYgRvaoHyz4YrtzoukhUXe0rYHiMIjDdlD
	9NsZmMYmIm2DYnSR0OO9+K085btn/9XWSj0NwvLDiBBxUhIo/OqSAU3N+BcketgThw==
X-Gm-Gg: ASbGncv+pWlvBrz5cvAchTgPGm2g9yAGBs1tXupryVH4wQj3s/0dJ7BWC31xPAl2dxB
	adteHLAt9R/Nl8pV6CwBODTPyeRBS1EEvibEKXiCd3TD3waqpdElLztutnnyGqM/RtgEge364KL
	DwCKSWF2Kp4DGYsnEyrqYdur7+MThV1jknZZGvxA4JXZOSSAT21QzEzz8pwSD+K32Yr4pHWr4N3
	BJkf4ISajmqVx19xULpBlDVTgfY5gDyk3bB+Hh1o2aWH76x3+zdAek=
X-Google-Smtp-Source: AGHT+IHyyRQ2lvLX2YA9SmELgzRKWHRiLqS12n5m43U7VAgYLq+/2bRqSLCD2YnKzj1RyoNLuWAQAA==
X-Received: by 2002:a5d:6c6a:0:b0:382:485b:f976 with SMTP id ffacd0b85a97d-385cbd7c5c0mr16062827f8f.15.1733145295487;
        Mon, 02 Dec 2024 05:14:55 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385dea1e4ebsm10160157f8f.1.2024.12.02.05.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 05:14:55 -0800 (PST)
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
Subject: [PATCH v2 for-10.0 49/54] target/sparc: Set default NaN pattern explicitly
Date: Mon,  2 Dec 2024 13:13:42 +0000
Message-Id: <20241202131347.498124-50-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241202131347.498124-1-peter.maydell@linaro.org>
References: <20241202131347.498124-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: HWj5SAgxAtIl

Set the default NaN pattern explicitly for SPARC, and remove
the ifdef from parts64_default_nan.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/sparc/cpu.c             | 2 ++
 fpu/softfloat-specialize.c.inc | 5 +----
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index 0f2997a85e6..6b66ecb3f59 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -818,6 +818,8 @@ static void sparc_cpu_realizefn(DeviceState *dev, Error **errp)
     set_float_3nan_prop_rule(float_3nan_prop_s_cba, &env->fp_status);
     /* For inf * 0 + NaN, return the input NaN */
     set_float_infzeronan_rule(float_infzeronan_dnan_never, &env->fp_status);
+    /* Default NaN value: sign bit clear, all frac bits set */
+    set_float_default_nan_pattern(0b01111111, &env->fp_status);
 
     cpu_exec_realizefn(cs, &local_err);
     if (local_err != NULL) {
diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
index ecb7a52ae7c..06185237d0f 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -136,10 +136,7 @@ static void parts64_default_nan(FloatParts64 *p, float_status *status)
     uint8_t dnan_pattern = status->default_nan_pattern;
 
     if (dnan_pattern == 0) {
-#if defined(TARGET_SPARC)
-        /* Sign bit clear, all frac bits set */
-        dnan_pattern = 0b01111111;
-#elif defined(TARGET_HEXAGON)
+#if defined(TARGET_HEXAGON)
         /* Sign bit set, all frac bits set. */
         dnan_pattern = 0b11111111;
 #else
-- 
2.34.1
