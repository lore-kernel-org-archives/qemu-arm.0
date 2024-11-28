Received: by 2002:a17:504:794b:b0:1be9:327d:8ee3 with SMTP id uo11csp1413093njb;
        Thu, 28 Nov 2024 02:43:21 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXmc7Lj98iuCTuuY8+YyCiNq2fcbhNL1HY/DMsP+XaoU/SOAZr3tcQDIXTIpiEZu9mXF7vh7QoN72OAdg==@linaro.org
X-Received: by 2002:a05:6000:1f83:b0:382:4851:46d2 with SMTP id ffacd0b85a97d-385c6cca8bamr5705568f8f.1.1732790601743;
        Thu, 28 Nov 2024 02:43:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732790601; cv=none;
        d=google.com; s=arc-20240605;
        b=OkN4CbLLIbrheTX8pz+hmIaayy4AfZR2Q/VJrqEb7wgqCq25DVxgxAuK48g/GZVYV+
         fgJxpxicH6blbZza/behxwUasmCXkap1XPPMXWEY+rNBFMewZybUmsGskFo49gUS8Fm2
         Wq+Hq3LRscxBLeQTJxVs6bnJXhxVCELY8WyH8elSo0D0vDusCH5d/kBOp5BvGxFu59vM
         vZ8/8J1uWE+0xbSM+A8WEryhOD8ecmZKmuYLJI3q6sWT8Sy/LZDDwQyyCVQnJY2BOYmD
         TtjUo5vRsDTkF133Z4sqV1PGVnePdF1qC85GZ5psjWmHXNfvuNoWoHKLAQ9IW9uxL0qt
         Cy0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=oGeQkgWiOnpuuXWXZlTMDkuSTfoKIXOn3w/Ju141f2Q=;
        fh=+BzQvH8LIjQbf+VEpB0OX0HIJRzAK5EZDgQmV9kyjFA=;
        b=RWkIRlieBg4vQDxfJIuEDyg3wd16bm0P7y/UxyWGB51zpJNzhtXKcCZXXt2uYVTIu0
         /O3q0HMGxTsf2S5bf7c+9RCgCZNi5wtUqg2mpf++io2QbtSuRCc1dp+G5JqAYOAJO23q
         6PW+alN3jv/BpaiollISUSgBkooFHnzW2oqBteYdhehntkdZ4Pv/DhCcoDjxU6EUdZD2
         S+PF3DaeNwBDpUofNBt1cxOyNo42CkEoRnFzLxTlyTApxPhi2jFlXTDR0KCISrIR1kFd
         nO3Dvxzsv5YSdkyVvCUVTTm+UaUnZ695YTDSDJ9/smCb3ndbnsg3cKBBxUsuFzxeSPUK
         fs7g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zklAoIre;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-385ccd367e8sor394956f8f.3.2024.11.28.02.43.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 28 Nov 2024 02:43:21 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zklAoIre;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732790601; x=1733395401; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oGeQkgWiOnpuuXWXZlTMDkuSTfoKIXOn3w/Ju141f2Q=;
        b=zklAoIreOGV44Qop6R0eH+bkMtVJ52qyEEnj3viMlJ4d+TnSsBqBWIp4SQMVAG6dS5
         fe5oQKNpXeDrZv6lYNdZL5MnYbcQhB5EjsVcLyqP3ShNbZWSnp9GOmUNw7ILYAP2xqjU
         WiAjhWnKa/Kl3rP0gIxgrdvTj8b8SUWNTOfV3/YnFcSShxIS7E7gtxGzFZgJn6j0fmvZ
         B3WLw21ui9g2sQXhU3ChmjcpEOxY2HJz4fx6l3RDEGUaoUvvG18XSbQf2rb9F3I6VZtr
         sI2g0n39F5mPJhclYZs8tvQgLlbsCNX7E+i8J2TUhrgmLhXgFSkBEY3JHhoZFTqLAve/
         DXWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732790601; x=1733395401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oGeQkgWiOnpuuXWXZlTMDkuSTfoKIXOn3w/Ju141f2Q=;
        b=DWTj4vElKcWH4Nuw68VhM7xgfYuRLMGIqXNTGFXlS8oSfz5JP/rX97IzuqMk8tWytC
         9fECUqskb+v8yoDObMQgu3svXhUp//htOVHy20RxX0kbfDIohRX429Ti6EN6UywH19lE
         2bfPZSh5FfnLTqmHiU5RfuL6RpgalRyG3rmWbmGHqVQ2rI1IKDCwIyAXU9i5gsx5DBdF
         4boV1Sr2bgfZ0MMwkAMR0jpJ3x0hWKdO2HkyE8UZNWfem3gvw3SRGGaK4/NFAQYerZc+
         NQPts29Qqes/3LIs0mw2T4NwYdW5xw9PYNcgcmQeekM+6JEBN0byiKPbIOMnTgF2TsXY
         vn3w==
X-Forwarded-Encrypted: i=1; AJvYcCXRU28J2LjR03qlwHFkvQ3r2ETVNvJjWq7r+NBCVhxg7SFG9Dso5w5T91/dpsNhaQSU9KgkMf1x3Ocb0g==@linaro.org
X-Gm-Message-State: AOJu0YzA/abFDYFVr8Bhf3mNHrzy01bsGEY5gzUHCwGE6zhEJoBsTy7X
	1+XHwKwi/AL+VelaQvav93A1Z+rDDzKcD1gwOD1/IXqvVjOmNydI+uF792f14h16Cw==
X-Gm-Gg: ASbGncs1S3uL1z/gi0pHqHDWgk4jEY9FvlM6lb90yfIjxdfLugHcUzC/PyRbLPPuu8F
	05tGsr8IElVGOU6q2UGtpcxdKzG5NIovaUnD/WJybmKbh5Ft/mSXsY1gBLOoXwAwv7i9Qana7Xz
	m2R+px4rC6dm9AYPjEZdW2rMUW4umEiVV9dhkfR7V5FYz5UuYv9QU7SJuXaPoWGHY660VwKzGAZ
	SQY9R2m7vlUmEbMjlQVjc2eEL5jgDbjhq43KDfq3NHgk9IVx9ZX/QA=
X-Google-Smtp-Source: AGHT+IGjPCC8FhcTdAsDhnejmdWY3ApnB/Rlz4vhTiLGyw/FgA4UJIVI5PC65VDBKzcbWkvKFR0hsA==
X-Received: by 2002:adf:e199:0:b0:382:134d:65e0 with SMTP id ffacd0b85a97d-385c6edc41dmr5806320f8f.56.1732790601162;
        Thu, 28 Nov 2024 02:43:21 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385ccd68958sm1292959f8f.67.2024.11.28.02.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 02:43:20 -0800 (PST)
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
Subject: [PATCH for-10.0 09/25] target/sparc: Set FloatInfZeroNaNRule explicitly
Date: Thu, 28 Nov 2024 10:42:54 +0000
Message-Id: <20241128104310.3452934-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241128104310.3452934-1-peter.maydell@linaro.org>
References: <20241128104310.3452934-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: lYAPcN4s6hX0

Set the FloatInfZeroNaNRule explicitly for the SPARC target,
so we can remove the ifdef from pickNaNMulAdd().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/sparc/cpu.c             | 2 ++
 fpu/softfloat-specialize.c.inc | 3 +--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index dd7af86de73..61f2d3fbf23 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -814,6 +814,8 @@ static void sparc_cpu_realizefn(DeviceState *dev, Error **errp)
      * the CPU state struct so it won't get zeroed on reset.
      */
     set_float_2nan_prop_rule(float_2nan_prop_s_ba, &env->fp_status);
+    /* For inf * 0 + NaN, return the input NaN */
+    set_float_infzeronan_rule(float_infzeronan_dnan_never, &env->fp_status);
 
     cpu_exec_realizefn(cs, &local_err);
     if (local_err != NULL) {
diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
index db9a466e05b..7e57e85348b 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -489,8 +489,7 @@ static int pickNaNMulAdd(FloatClass a_cls, FloatClass b_cls, FloatClass c_cls,
         /*
          * Temporarily fall back to ifdef ladder
          */
-#if defined(TARGET_SPARC) || \
-    defined(TARGET_XTENSA) || defined(TARGET_HPPA) || \
+#if defined(TARGET_XTENSA) || defined(TARGET_HPPA) || \
     defined(TARGET_I386) || defined(TARGET_LOONGARCH)
         /*
          * For LoongArch systems that conform to IEEE754-2008, the (inf,zero,nan)
-- 
2.34.1
