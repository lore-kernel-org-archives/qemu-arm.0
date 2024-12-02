Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2801767njk;
        Mon, 2 Dec 2024 05:14:06 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVj1La8BJ20aSWCi/SKu4tXZ86muInKLrjqnv9+3kLg6udj7Cg5ryaEM8gBQ2fmC2RibVsxiIPyb0TdTA==@linaro.org
X-Received: by 2002:a05:600c:3b16:b0:434:a2b3:a504 with SMTP id 5b1f17b1804b1-434a9dc0208mr207983645e9.13.1733145245939;
        Mon, 02 Dec 2024 05:14:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733145245; cv=none;
        d=google.com; s=arc-20240605;
        b=itg3/Ys80BcBJmEeCQ36HXgu7nHirfgPHw+OfhrAUlReW9oGcMIOjO0pD8nsvIg2Me
         dP5WAAnU8vPHKriweHO6k6iuo7ncXbR2ADqEWkaDq1smfIy4h+ULrtX8AtSmOZDLJZEg
         PJhzK10BrBg/rvbuVAdlgya12hqx0aqPFaFGmXsUeR30EdHXWOeDqOqKWH9i9NleWxPO
         i8LfKmV0+ttQkBGTeOFBwOJBiI3uhe7GK3CnUIQyvd0+E+JXB0eq4tumX7zp9Gy5H/ru
         0C5IvPqIxlWiDvFE4EjuROmOXw8d5K2E4hZkU+Tda3QwxlOaK/FjMj2wcHQmkd0wR22a
         juWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=q4kNtCiwJHe+Pk4Qi2sHCtONsH6gpm3d9+pTiscaZow=;
        fh=infX7uvmmf99W/dD/6Wwd9+ATDFz43kvIwMFtAopgKk=;
        b=kx/y0DjZtrtXLuF5FH3KL0931BvAbDcSXIkeDlACEf1efojp+FcnIFgs3Gd9ynNpjl
         n9E4aswz3OAt/vxFzQeDpZ2eBIgvby/GXhVxQalumwHKcunfrVvj0e4NKq+fR0E3bbti
         pXSmx2llDF9Puyys3Xldj42F6BrhUyh+ngWamrxkac/aVFf3iCfYUh7YgzvbdjuMhxNE
         9dMZrXy/vuoMr3m71O6oHXKMwtLVcNK8/3wv9KH1nxxzvriX3y59q3vhxrf6lM7a/JHA
         Ab7qCHwsPRjCrH/ORE1cg3A/CJXUT93hj8KxWuY52260aeuMRA4SIDp8UmLsqGx5XCsQ
         UpwQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FqsNo8HA;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-385de1ba74asor1762945f8f.3.2024.12.02.05.14.05
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 02 Dec 2024 05:14:05 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FqsNo8HA;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733145245; x=1733750045; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q4kNtCiwJHe+Pk4Qi2sHCtONsH6gpm3d9+pTiscaZow=;
        b=FqsNo8HAovn6bZwplS+7zCDhjefNHDkn4h4AyU+fpoOWRq2C0F5sDChQmdhXkPw8KU
         GWPqyD02Drs60eVTd8uV8pViFHRgwoAKteZzAfKxHsm3d9Q1VfwtmeY+l8dzrSOWWkYK
         ALHOnZaSMIe8FUCFFJCcfY1eWsZrvOD583NHY6C9d0CVCqWZgaaeCBzghTaaVkdyUVPn
         L/IPGFuiQXt11f6u0NSArCOCJNC7LlIkte1+0+ODfBT/TRnZFMP1WybRvnRlRyBlRbPy
         NzTz/8WxfIaVcmHXAUZu8O4481wIDUmZR8AZhT2V+BOLaypO3XvTwDiAqY+abNE92Sgr
         YoJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733145245; x=1733750045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q4kNtCiwJHe+Pk4Qi2sHCtONsH6gpm3d9+pTiscaZow=;
        b=noszbHSSL1UgFZINMiZ9YpTlxpMmvXk2P/wZLzZm44U2Lll6nn5x2fVOt6sAHUQEBw
         SSRwVwC7ZEnFCuOSJcq7wLAwqgHcMUVcfIL8EgTu8DrOOvTUieGWXuO1IuO/JBuZCzd4
         fR+kMRAgz881+en21lkMuzJWm7Pl9cO07ulstwAALvaDncoBVN7k2AN+uX6FMFlcGeKs
         aQ7dKeoSpX95MBMnkWLmqs/g7Em51ZJG8Wckz+NWLyy74QBhcRmmKYr/gJXtlgEW50sR
         ip1OQWiks4SacUSTOApUUk4lQdvXuGwgNwdQB+m7cf6ecz/qBYrrFbX6fFnW0XnI9lYz
         XNMg==
X-Forwarded-Encrypted: i=1; AJvYcCXQAmGb0xAPrzM9B1gQOATHQvXwRskMY6Hn/goBt5XiHQBlwIcKBKt0PagwJ8gBngNy7L4HfZRmY3Qb9w==@linaro.org
X-Gm-Message-State: AOJu0YynGnKQbWP8H9K6VvalVeIc7wSjLAOacBbFeMWye5ubErdEe5Ls
	f30cYlH8ZVml1KahtaDVKmk0xjm929zdv+qKI6UKPCViQzerrI0ryyO18mtbusJEvw==
X-Gm-Gg: ASbGncuYhKMGpP9L6g8b2zViSzlQKuNZfZuNTmBSlYVT71ZLxKuyGIpujvaG2A4AMFE
	cKsM9ywbvshloKr9dQ/haCFsHH6sIkwLh4DPDqx1plyemRhFn4W0/b9xbzyim3poVKr3NYv+qfz
	PDhCrmVG2RKe9OdZV/+kEHbPb5V11cO6rI4pwNN9y5LJeFTpCKmTsh5YMqA0q+OVa008aLYCCRq
	UtxoUNpAqUMfGFjs204rhX1BvDiaBLR9cu9SjN5gWU//2vEAqgh+qw=
X-Google-Smtp-Source: AGHT+IGd2Yn0QVxN56A7BlMwFtqVEZnLl3ztItNlndvu0+AAcffqEeZuYQTc1zSsEDdvnH9FAJZOEg==
X-Received: by 2002:a5d:5983:0:b0:385:f409:b42 with SMTP id ffacd0b85a97d-385f4090e8bmr2787900f8f.53.1733145240053;
        Mon, 02 Dec 2024 05:14:00 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385dea1e4ebsm10160157f8f.1.2024.12.02.05.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 05:13:59 -0800 (PST)
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
Subject: [PATCH v2 for-10.0 08/54] target/mips: Set FloatInfZeroNaNRule explicitly
Date: Mon,  2 Dec 2024 13:13:01 +0000
Message-Id: <20241202131347.498124-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241202131347.498124-1-peter.maydell@linaro.org>
References: <20241202131347.498124-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 4kYv5Ny+B33S

Set the FloatInfZeroNaNRule explicitly for the MIPS target,
so we can remove the ifdef from pickNaNMulAdd().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/fpu_helper.h       |  9 +++++++++
 target/mips/msa.c              |  4 ++++
 fpu/softfloat-specialize.c.inc | 16 +---------------
 3 files changed, 14 insertions(+), 15 deletions(-)

diff --git a/target/mips/fpu_helper.h b/target/mips/fpu_helper.h
index 7c3c7897b45..be66f2f813a 100644
--- a/target/mips/fpu_helper.h
+++ b/target/mips/fpu_helper.h
@@ -28,6 +28,7 @@ static inline void restore_flush_mode(CPUMIPSState *env)
 static inline void restore_snan_bit_mode(CPUMIPSState *env)
 {
     bool nan2008 = env->active_fpu.fcr31 & (1 << FCR31_NAN2008);
+    FloatInfZeroNaNRule izn_rule;
 
     /*
      * With nan2008, SNaNs are silenced in the usual way.
@@ -35,6 +36,14 @@ static inline void restore_snan_bit_mode(CPUMIPSState *env)
      */
     set_snan_bit_is_one(!nan2008, &env->active_fpu.fp_status);
     set_default_nan_mode(!nan2008, &env->active_fpu.fp_status);
+    /*
+     * For MIPS systems that conform to IEEE754-1985, the (inf,zero,nan)
+     * case sets InvalidOp and returns the default NaN.
+     * For MIPS systems that conform to IEEE754-2008, the (inf,zero,nan)
+     * case sets InvalidOp and returns the input value 'c'.
+     */
+    izn_rule = nan2008 ? float_infzeronan_dnan_never : float_infzeronan_dnan_always;
+    set_float_infzeronan_rule(izn_rule, &env->active_fpu.fp_status);
 }
 
 static inline void restore_fp_status(CPUMIPSState *env)
diff --git a/target/mips/msa.c b/target/mips/msa.c
index 9dffc428f5c..cc152db27f9 100644
--- a/target/mips/msa.c
+++ b/target/mips/msa.c
@@ -74,4 +74,8 @@ void msa_reset(CPUMIPSState *env)
 
     /* set proper signanling bit meaning ("1" means "quiet") */
     set_snan_bit_is_one(0, &env->active_tc.msa_fp_status);
+
+    /* Inf * 0 + NaN returns the input NaN */
+    set_float_infzeronan_rule(float_infzeronan_dnan_never,
+                              &env->active_tc.msa_fp_status);
 }
diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
index 2023b2bd632..db9a466e05b 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -489,21 +489,7 @@ static int pickNaNMulAdd(FloatClass a_cls, FloatClass b_cls, FloatClass c_cls,
         /*
          * Temporarily fall back to ifdef ladder
          */
-#if defined(TARGET_MIPS)
-        if (snan_bit_is_one(status)) {
-            /*
-             * For MIPS systems that conform to IEEE754-1985, the (inf,zero,nan)
-             * case sets InvalidOp and returns the default NaN
-             */
-            rule = float_infzeronan_dnan_always;
-        } else {
-            /*
-             * For MIPS systems that conform to IEEE754-2008, the (inf,zero,nan)
-             * case sets InvalidOp and returns the input value 'c'
-             */
-            rule = float_infzeronan_dnan_never;
-        }
-#elif defined(TARGET_SPARC) || \
+#if defined(TARGET_SPARC) || \
     defined(TARGET_XTENSA) || defined(TARGET_HPPA) || \
     defined(TARGET_I386) || defined(TARGET_LOONGARCH)
         /*
-- 
2.34.1
