Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2801628njk;
        Mon, 2 Dec 2024 05:13:58 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVB/zXTwd47Ao7JlDFyRSPuxIRlFq6QPKoH+ryaK5GIFW/MCC7rsablOigx4iX5gkZ0y2tEPUCLtpVGew==@linaro.org
X-Received: by 2002:a5d:5988:0:b0:382:3754:38e7 with SMTP id ffacd0b85a97d-385cbd8185amr14640077f8f.23.1733145238308;
        Mon, 02 Dec 2024 05:13:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733145238; cv=none;
        d=google.com; s=arc-20240605;
        b=ICohLjZ4k4g+WHFtaJPWF5R9dKdiV4sTQYImqA8XJIOw4K7f+bnGxiT0Iyd+xSuttO
         OqSUnnvjBQ8QoZY/z4sOwYd2NPczm1E7CyNp/E3bm3Wep5WP/lzVwGTOtudArGtgtX5p
         J7FQK8CbUAiCi4rRBrIWnKWJ7CImGlD2itYQm9IIbJc1TTiFOceFFPVXsAOPVWSYeHin
         RO4KoAcZYVHIOZ8yvOGY6qG0PIYG2uZKxsfQR0GcpAUa0fTGdLemtV7VYwWbKOrOazZu
         od4bZu1rLOO1fwDXR2UYB5PViMIh88H2qDGu+9YESdFT6/8jPqaD8LIB9uhBo4/brgHD
         LF3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=04rCvvMWBdPOtJMZYEuwTadqTTp/Q9o9M7TcBLMjcm0=;
        fh=MEENl9XkY7qdC1DA7RtX02WQZFV8uBXEuqZoTSIXaOg=;
        b=H6nKmwobPgNYUxuwdvoqqT5hfPGWRrePY2KlSAEpOTbq+lsk1oj9vREwAIujuxYno3
         +bvM7ZXfjxpQtOZfhPHOO9dB5Ni4B7rO9CdEpqJ6JUftZM5ga4J9r8yK1Dzw8rcSQjC0
         KdLJ2Zqo9f61OWXJAIlc59+Z9seYvebYFNrfTxQ0coZyrIO0578yOOLpPRwpomViMPtn
         srdwaXn/B51qB4CyhVMJT7PXQqQ1eRl2Sv3s3kl/scnSnlSntEHONGC/KzUmG5Ly1qK4
         qDVajfrCsyuKqIGrzhj4Z09sHvy8JBVYQ5CP+pPxX+uzWL2/Dy3PMIGXeSI0l5+4Pc8t
         DoRQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=c485mQLD;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-385e307bae6sor1181564f8f.0.2024.12.02.05.13.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 02 Dec 2024 05:13:58 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=c485mQLD;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733145238; x=1733750038; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=04rCvvMWBdPOtJMZYEuwTadqTTp/Q9o9M7TcBLMjcm0=;
        b=c485mQLDb58uEUqf1yzEsu0QATcp6HcIhMmUrfn36wrFE0tCQBdQ8CtvVm7+5bCxFp
         VnFpYn+H627/2eO1r8U90w586I/9LfXP/pGHywQQY90zJ8zlplhHWZkqxfE7uRgNaDIn
         6+9hf2ULID9G0gWhrVdcoeSrNmQrSG400RNOM6O5J/AYiY4QGr9Y24r9tJf8jIAmjOMJ
         VlgRmf34d+FaIH3hgtUqs41lwT98w+CbryEAxo2WYwC851ZrgnrUrEJVXEBAC3pENBW9
         +dfXjS/G05OVAsPsYOwU0vj4diq6Rm2Oh23hA0UJwIHo4uvOsjeqJMmphmx0PB+U9tFL
         VaSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733145238; x=1733750038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=04rCvvMWBdPOtJMZYEuwTadqTTp/Q9o9M7TcBLMjcm0=;
        b=Txn5LYccjiJXSRnrKpxZ/KZQDT1EwOAGM0u711fzQQ8CSB7VY2ZWlnsV9jhhvSnHm5
         4qWpKAEVgqwwjdxlpFepIomt9lTrsH2X0n6KhRtXQIRsiCuHJFqtN+xZ1UmYa/3rVWcC
         cjKKI+/ADss/Q0hUzjp2Vabyu7Dj2BIMr06BT5dcW2V2wrK7nwzW19bzowZV5OengLHY
         SxkCBAHt1uATboKPYoo44Hqha/Z8jTQJymXuzRALfPabVL8P5Dk0FC9YgYkoIVvExQ4N
         EsgrSwLIebJipbQOzAgG0ULF5h2L06mchWHKujzFlzMTWSiIXdFAEkySxwolNNzKeyo1
         M4uw==
X-Forwarded-Encrypted: i=1; AJvYcCVYHhMm6WF9Ncb0z944GvObHBcSxVG6CmdcaN8mAucmquGu2vaTcQmtVgP8uZV7Jd06SfSNFckA1cYGgg==@linaro.org
X-Gm-Message-State: AOJu0YyyJqgoO0IkyeoL4YuJQlXgCVbwn1GZqfY3qQ4uwszZmMB4Mylc
	F7QhiCo6WOS2ewsmD3to2lu5en9kpEiYVXc+MOlV4+JkGQch3cd8uKQ7n80jY1vVdg==
X-Gm-Gg: ASbGncsjvUQP02cKmPKhpcJqy7NT7Ls8fX6EQ0P3oXtp3ONJXDfEWTmsx/klkH1f+Un
	YDllgx6W2s//UyLMxscamomZKkq18Yy+oHK/OFQoz7NumYNk8/5fhlUcYeNcTa7njohdAwPyL6d
	KQ6mILWDXhd514ZB0p9GhHb6TFOv+DlyuG2RjJgqIPgeEqMPkpBEOJ9d1Oxn986lldKuvs2Xix3
	Y2JV6GSFmGHwKxAO8/LZpSCW83DqW29jtTtZC6PewYtJaBLPGn+oHg=
X-Google-Smtp-Source: AGHT+IEYDlhUZi9tNaFiTL1YEiPgH90/P6r0qgNvdF/ZYG+u30YboedBRcHxxQBWbNrDwYwgiOjJrg==
X-Received: by 2002:a05:6000:1ac9:b0:382:4abd:c3c9 with SMTP id ffacd0b85a97d-385cbd73eeemr16904034f8f.7.1733145237666;
        Mon, 02 Dec 2024 05:13:57 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385dea1e4ebsm10160157f8f.1.2024.12.02.05.13.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 05:13:57 -0800 (PST)
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
Subject: [PATCH v2 for-10.0 06/54] target/s390: Set FloatInfZeroNaNRule explicitly
Date: Mon,  2 Dec 2024 13:12:59 +0000
Message-Id: <20241202131347.498124-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241202131347.498124-1-peter.maydell@linaro.org>
References: <20241202131347.498124-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: QcdNejGhTeB6

Set the FloatInfZeroNaNRule explicitly for s390, so we
can remove the ifdef from pickNaNMulAdd().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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
