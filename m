Received: by 2002:a17:504:794b:b0:1be9:327d:8ee3 with SMTP id uo11csp1413063njb;
        Thu, 28 Nov 2024 02:43:19 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWGjJ0ZsCAsPmqp2+4+ug2AMlCkY+8w2Msi/iB84lHPXyp2xOLHQHgxQcymiCVrKaEM3Khnq0ZsUbf8Pw==@linaro.org
X-Received: by 2002:a05:600c:3585:b0:434:a4a6:51f8 with SMTP id 5b1f17b1804b1-434a9d328f1mr65155955e9.0.1732790598844;
        Thu, 28 Nov 2024 02:43:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732790598; cv=none;
        d=google.com; s=arc-20240605;
        b=HxvR5qWy4lUN+KIozcdaTSD3bAD58EY+aqP+8tdivYx63sxAzjBT6Kupk06lD9U8HK
         VdyQrQE6h2PktDqReNOpeWPsVeS0xxJ3W1VdwNZObJO6x4ftksf49cv3AXFcGiS5kZTC
         1EQ06/OE443E0GcNPdM1knDMVQMULtFEOhfMyX2aLvOFR3qKcstIcypvNlWykH9i7MCt
         wsslIfijLxKj94dF/MaJLmFjxHAVJxVgbgwMHb8IKS/xdf1WasICZ6amiEKiTpzm2HhF
         qhzTIdyTqYYFfC+pOoy/94bytjdFJGuewVSduD47Nhq1/Vx8jylsKoCBRh6xVQAWRTQs
         I2RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=CN209ow1u88/SvecQPZ/3IUJ9A/OS7lKONjS1X1zVa4=;
        fh=6YtBKgIwW9ZUxfkU/ilKIMTbrYLJ8BfNG8wjS+Fufak=;
        b=iGPwNkVDIJ0+d9u9XEJ4SA1tYelKlLNGIcjLrYFLF1NNi5TdcrznmnBbU108bKEmQ+
         hROWc7GlSRXOtgAc3jhQ39X1dxHiumBu3fvZrShpd4URUa51bTjrJu4pYv45N2Wy2f3l
         PHqGeY87lseWSzNZTQJ5v2EeMbsfcGwrneqDxUjBPkfUv8d7aPczeG9m7I9ggjrO6xW6
         EZaspx9FdeCCYvuXKBpMqaEQdqpnxsHL2OnDMeiJXo7mSX74gg9vMcW0IA9BbO2dxNvQ
         /zeR5vo7AiVOEEZKjQuh0LIok4i+YQarYr5/qOInAeH/8YHTxsKyoXfIe5bhis5hr8Oy
         Vhhw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eKQ9O7eb;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-434b10a0170sor4778185e9.11.2024.11.28.02.43.18
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 28 Nov 2024 02:43:18 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eKQ9O7eb;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732790598; x=1733395398; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CN209ow1u88/SvecQPZ/3IUJ9A/OS7lKONjS1X1zVa4=;
        b=eKQ9O7ebCYSkwBKeInks57s2o0XuqzuAc8Iy/CV4qAlx86o0DvcWeBjKGv0P8Szc36
         HKr1xI8YrXo441cMbwlZREfIdBRmCVKCWhFqqBw5LvhRCK+hZdiy87GTLew7mIWd+SO3
         dwdYNahQs5Es3ZPU6hJUXgkjU9hCLd5QEuRzJDFJUzP91iWzJOnhEt1k5UIxN++12GaK
         Rfo5GaGx0y3663JgWyvDahUdC9Q/W1jVss0zzZnO7zUkuTnLXEAF3NltVofbTc0D7FKO
         EUP2X1oHTcvwAgSdDjpxxjnx9qgzyfIefgBJVnDcsSDFyUVsk7b+cMpD/LYCySJTY6xL
         vGxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732790598; x=1733395398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CN209ow1u88/SvecQPZ/3IUJ9A/OS7lKONjS1X1zVa4=;
        b=dfn/YftZLdcs2BQzK7qxiFyr16+WZZ6deRHBHCwQThNi7SEwx6P1/gAy0XgS10viOA
         c4JD97qrPt9JS+fLt9WGqaE29ku9rymWk/Ys8j/2KuQH+ocZbMjADiFIceJIXCPh4sn9
         noKGIYZCUiabqj1AzkYfM7/isQ+wV5KEi3J8O8Y74M1rm+EpIq6jNitKC1cNECtkBpNh
         MM94jhdY3MziuiuPLu/4o7P3m910Jqodh0GiIhzAJSx9l+4I14mRScQY0hbGXdIcTHEf
         CV81y4r82KyM5+eWfxKbmEsWIHqw+XF6Gy3YlxEeYPYuK99Wj/uzaSNut7qePqUI7/TY
         FKkw==
X-Forwarded-Encrypted: i=1; AJvYcCWoi+G8a2Adw3ur6lchnHI9fm9+R96btbgUB3V7wkO79WPMAEX0F7WskJ8WuCEnmnZ9cv7z69h+EEiDlg==@linaro.org
X-Gm-Message-State: AOJu0Yx/xlVmARU1cYEoviDTzvVth9fgfOhqcStBF8ck6yBU47SX+WWY
	gFXwFedzC1zJ8TDtd34KND+PoEjfZz2xH6HEolLYSK1Uj6rpNt7FkvzlnthWlBZakQ==
X-Gm-Gg: ASbGncuIY0aG38yZakxRKO285I+CoowevwNX5iN7C47UNiDztJO7V5ylHkzZbhI8AsL
	0j1uREckF49eNSiwzT1WN7KEZ34f9tVp6BJPIwrN/MT0F2SSwhaGFT9uf2Vdd+/id8lS3ThfKEK
	I5+2ADjFrHYK3MH84Gjw/d3DwF9GTVayRS1aJZPdAiDhVR2/y8hAAwiMRoiqQjI/Et3+uIMSl4F
	ydAKE62BsGEAXkqCmTCjMnY1h85eZlfyYtyXeJJy3fVo2OQr5cbKY4=
X-Google-Smtp-Source: AGHT+IEO1+yaqAG0WEQQ3aJywsZ4ugi2GG41LKAVgzk9zB7hp56n63EPXyCDGvevvW/FlBUvnmIY0A==
X-Received: by 2002:a05:600c:3587:b0:434:9da3:602f with SMTP id 5b1f17b1804b1-434a9dc6765mr66825315e9.16.1732790598368;
        Thu, 28 Nov 2024 02:43:18 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385ccd68958sm1292959f8f.67.2024.11.28.02.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 02:43:18 -0800 (PST)
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
Subject: [PATCH for-10.0 06/25] target/s390: Set FloatInfZeroNaNRule explicitly
Date: Thu, 28 Nov 2024 10:42:51 +0000
Message-Id: <20241128104310.3452934-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241128104310.3452934-1-peter.maydell@linaro.org>
References: <20241128104310.3452934-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: avpAFcYPBQEn

Set the FloatInfZeroNaNRule explicitly for s390, so we
can remove the ifdef from pickNaNMulAdd().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/s390x/cpu.c             | 2 ++
 fpu/softfloat-specialize.c.inc | 2 --
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index 514c70f3010..d5941b5b9df 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -206,6 +206,8 @@ static void s390_cpu_reset_hold(Object *obj, ResetType type)
         set_float_detect_tininess(float_tininess_before_rounding,
                                   &env->fpu_status);
         set_float_2nan_prop_rule(float_2nan_prop_s_ab, &env->fpu_status);
+        set_float_infzeronan_rule(float_infzeronan_dnan_always,
+                                  &env->fpu_status);
        /* fall through */
     case RESET_TYPE_S390_CPU_NORMAL:
         env->psw.mask &= ~PSW_MASK_RI;
diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
index b3ffa54f368..db914ddbb1c 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -516,8 +516,6 @@ static int pickNaNMulAdd(FloatClass a_cls, FloatClass b_cls, FloatClass c_cls,
          * a default NaN
          */
         rule = float_infzeronan_dnan_never;
-#elif defined(TARGET_S390X)
-        rule = float_infzeronan_dnan_always;
 #endif
     }
 
-- 
2.34.1
