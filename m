Received: by 2002:a17:504:794b:b0:1be9:327d:8ee3 with SMTP id uo11csp1413192njb;
        Thu, 28 Nov 2024 02:43:34 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXNh6MkCb4NmTXlqELJVLJ/QF3sGxQ7uHhmo09rikGFf/gbs07ZTxb/42egsQdEQ9AHAEKTriQq88NQYg==@linaro.org
X-Received: by 2002:a05:600c:1d9d:b0:434:9c1b:b36a with SMTP id 5b1f17b1804b1-434a9dbf226mr58770475e9.13.1732790613985;
        Thu, 28 Nov 2024 02:43:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732790613; cv=none;
        d=google.com; s=arc-20240605;
        b=Rk27vLM1q0M5M9CTIM90hVhMxZJvTumeHVEZ/dmwlTtsJqhlH8cFr36HXa4ks+Tu/h
         6b4x5pQbBBnsvy+GP+ipJR32gKaZ8K7sSm7t8FU0TfUCh+lohylex3x6c7DSbV4P7oxN
         G70d5qLHGbRrulR7As8+9JY6RMLsocGgHD4m9+Zfr9bFIZ0/94KIoNQIJfTbAIK64KNK
         dGrWtT8RMHOoSZAw2bRzqexDhUSI2FksZo4cE3HT2/DfgZhT98S4UHc7wDm6CNy4ECFZ
         h+3bFV9+Mwrtb4rKFU919ztjxjR30j/ORGN2o+0/Gr7ucHrHi6KU+ryi2D1lQqGEEJbD
         KWWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=M59b1YXia+t10MRDfuwOiG0kBN1H5nWvD2y8aDo+yb4=;
        fh=CV/gN14e5c4BcKXs/cRKGeT3IyuubZ5ML2YUHiQclfU=;
        b=hS4ImBORcVyqvD3DW9JhMkGdeZw1Cdbwe7Kp8cPjt9GDjQmNsFCAdRm3dAdeBM7r/N
         nqNC2UHUGLtRTSIPjDB1l110wIXtTJI5l4JB+l5Y5cKmVnUlu2w+sJFaDMChV09AoSjC
         5YxsaJ7YDSeDqKw+2ATX8aR13jIWxnDQ02T/VWEF7KAJHTu8Ey53TuCHNPafv8MpLjr9
         AcqfyNw8mpEbMwe6mzlwnJ6+sW+JtWHPuZ+qIO5zAupiIFain03ox361o5huUaqtThMB
         zRHG2r7lQ7wDuafwJz6FS2yQ+g5DW/rPEO8Zh+8SXK+9BjGTRK8053GPFQP44GbzRVUa
         dm7A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TZcsZqQC;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-434b10a0170sor4779615e9.11.2024.11.28.02.43.33
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 28 Nov 2024 02:43:33 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TZcsZqQC;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732790613; x=1733395413; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M59b1YXia+t10MRDfuwOiG0kBN1H5nWvD2y8aDo+yb4=;
        b=TZcsZqQC70hx5c/K0LPndi/+xD91Rj8ftF/xwzSn0y3yud0gJ9BVlKXJeiK8nC9Pfj
         r/b5eefDzw/FMOaeBVnQmddvEnc3Rv+KykSV25/fVrAy5932ZW4p45r/xBXs4DUP4TtI
         KvRMQ+7r/Z4TAlpCa5FMyz3imqv2kcccsMIeehod8F0/EgIsMavC9RruKKHQRMGVyOHC
         FpAUgjRRzNcYI7oDaDf0Xy9+US80L89ciPKDKZZGlXEsMmLQ0tjMbew+S9cGycNLAThp
         xMioMW5So5Sq4DTXQfGWVAL13KMqZ/Dn1IWcVX6s9cezgzFYawj5kD64J40mV/moDrvS
         meIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732790613; x=1733395413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M59b1YXia+t10MRDfuwOiG0kBN1H5nWvD2y8aDo+yb4=;
        b=rBX2OcsH9aQLydeDhYrtoUKaSAvaGeuJx1FCIfQKp1s8CKYYtV5d2c+OyB8B/R2JZb
         gXHRZN1+Feo6XaYgpJCOOYim5Ym3+lTyePDmyuShmg4RkHLEINiSa2bS6PtOkmrw3r1r
         vejJyQlCIK7J9ww7eN1jKD8nZaZkYzL/r7teAvU7rpptO4Q6QEk4hhXHt1zwY4HJP9aV
         5AlvenzwV1pe76Xn546UoRTZDPLG+CYinP+GoxYf79XxmtbLu7IbY53kQUaKDcZ+HEnj
         eFL6iWAaG/CUzvRG5ApVCV0+GoHrnlpfGXG8d3+B0jlwGVlfEHj5JLjq9f/B4oVyg9NM
         ZC3w==
X-Forwarded-Encrypted: i=1; AJvYcCVmIX+UfmyDIgKRPPlkThgHpLE2NoCriWoFc1M1UozVPop4VEH+1qUlwxTIXrRUsgivY5dcputkIAv+xw==@linaro.org
X-Gm-Message-State: AOJu0YwuSK5NNEx9iTcGIdhJy2vvleBvoeQts4mcPbYQKXwTwjW3umbN
	HHSvVIIB748DS6oHEdZ7qJQ/CRmFyQhG+dmK7gkgykqzCBrMxqgKTY6vPH+QoQZ3AA==
X-Gm-Gg: ASbGncu52jcOyWGFEmEgx0YfUxh7SjtbT9VBTeYgCnBgiS4MwVqVELwlqTklkVvd2KC
	fcz+glO4W779wDNHuqk/44sBx7FB8jcN8x2benqVCAWJ9z753itIzyLGRU8Qt3rnV7D+4Ll0DRE
	/QInfT29bOqJjneGciIMHUeMBY+aRCQHNZnqzCztNllSsPIBazlxmQTb4hb5GsPALpBaov3ItmU
	PF+1KurgN/6Y0uxe8N3Htfw1yMbSq6gF7HzGeW39yK3PKN8IsoLNws=
X-Google-Smtp-Source: AGHT+IFDBYQ0p8AMJvWcntf+/F6gf5Yuv4QaJlDohlcfyApXLCO7EQn6BfhYVR4vXEVLllhC1tMn/Q==
X-Received: by 2002:a05:6000:2d84:b0:382:5206:8b84 with SMTP id ffacd0b85a97d-385c6ebd177mr4215378f8f.14.1732790613468;
        Thu, 28 Nov 2024 02:43:33 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385ccd68958sm1292959f8f.67.2024.11.28.02.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 02:43:33 -0800 (PST)
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
Subject: [PATCH for-10.0 20/25] target/sparc: Set Float3NaNPropRule explicitly
Date: Thu, 28 Nov 2024 10:43:05 +0000
Message-Id: <20241128104310.3452934-21-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241128104310.3452934-1-peter.maydell@linaro.org>
References: <20241128104310.3452934-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 0G2qXNttBAC9

Set the Float3NaNPropRule explicitly for SPARC, and remove the
ifdef from pickNaNMulAdd().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/sparc/cpu.c             | 2 ++
 fpu/softfloat-specialize.c.inc | 2 --
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index 61f2d3fbf23..0f2997a85e6 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -814,6 +814,8 @@ static void sparc_cpu_realizefn(DeviceState *dev, Error **errp)
      * the CPU state struct so it won't get zeroed on reset.
      */
     set_float_2nan_prop_rule(float_2nan_prop_s_ba, &env->fp_status);
+    /* For fused-multiply add, prefer SNaN over QNaN, then C->B->A */
+    set_float_3nan_prop_rule(float_3nan_prop_s_cba, &env->fp_status);
     /* For inf * 0 + NaN, return the input NaN */
     set_float_infzeronan_rule(float_infzeronan_dnan_never, &env->fp_status);
 
diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
index 31b23ddb9bb..565790b1834 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -508,8 +508,6 @@ static int pickNaNMulAdd(FloatClass a_cls, FloatClass b_cls, FloatClass c_cls,
         } else {
             rule = float_3nan_prop_s_cab;
         }
-#elif defined(TARGET_SPARC)
-        rule = float_3nan_prop_s_cba;
 #elif defined(TARGET_XTENSA)
         if (status->use_first_nan) {
             rule = float_3nan_prop_abc;
-- 
2.34.1
