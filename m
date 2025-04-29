Received: by 2002:a17:504:8616:b0:1be9:327d:8ee3 with SMTP id o22csp23003njm;
        Mon, 28 Apr 2025 22:00:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWCUQojRr/3nvTjnZ6J+7e4U6tdNzacNz1NFqDWedBwG/vRmgJQDYOV6JXKuQ1lLYAP4zeSe/0GlKmJsw==@linaro.org
X-Received: by 2002:a17:902:d587:b0:227:e82b:b585 with SMTP id d9443c01a7336-22de7015e2fmr22935145ad.20.1745902825855;
        Mon, 28 Apr 2025 22:00:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745902825; cv=none;
        d=google.com; s=arc-20240605;
        b=QxGBD752ZDAyJpJDgFU5nWSF1V7EcnAeZbiwZ7Z8KPsWfFRKqerrrNbcWBWKisLRJq
         5Qjlh3hTaYWrvBCXohCNjDao+ZDBRlOOEMLrJEsx0PO4NNgGpxNWHXPm6c7z9GSB3p0P
         IFV6HZJjaIFPv/fwW0ULbCVtEmhZAs9i8y65s/6xiBplN0NiwBlM4igROtWiVIm7dlPK
         PAdw3Yd6S5CP0yJMAiqIXfkayZP0Gb4UT3oNcftArP1bO8JRYWgppeJXLfc1uur4XZO/
         aXv9OlW+b1b0yMCV7ikhoC8QcmZrl0fVvm2mzGdbP6GYzMho/a32n36g/a9SbBG8PCsa
         /RDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=3lofZ2Bm8qaw0g+MX7QK5XKjfJFx9l5xRSef1IWMqPI=;
        fh=34F0UhaiNKqzTxvvD2c7Oub3fTE8HHdz+h9frYU/Wiw=;
        b=QUNvRNC2xbaz/WPtSI/0XcCKbiYptelMG3G3VXRd6BkZiKsG7e7DgT5yCAYbuz+Foh
         UVKXKlcqKQWL7DCbXMvCcjOi/tq3vQQ2G5M3/NZnW9aNXQuegyAtu4Z+9PY1TAvYBQ6M
         zJlEHFGpqWngQeTSHbsNFy1Ad6ZbeAZMjQUbJW4/no/0WYNGdvGcjR+uBozztEE+DkyM
         3EoZctct6TftNHwLAQUBis1Os8E+cFF2iExwWcC/EoFneXg3J6kD/zkHKSdYF3xxX2mg
         ghz9ZpnnZwUjZ1w8x9pe+Q2POdWGftaUr3omw13lnwTNKRO1wNp9KQNHsluvUnSeTjd+
         5zDw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fWUedQ19;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22db50f93d5sor66267235ad.14.2025.04.28.22.00.25
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 28 Apr 2025 22:00:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fWUedQ19;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745902825; x=1746507625; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3lofZ2Bm8qaw0g+MX7QK5XKjfJFx9l5xRSef1IWMqPI=;
        b=fWUedQ19g0gI1dKjrMRbK7ldxKJvTTxr4KTkybUQgy8vNaE9fLK27E/nUlBz+bxWsW
         kRGdTmEOWccaGVMAbvUCHKIAaVg2H5XLNVcx4Dgz3N9vEUdaSy48mr6okteqHc3GsBIY
         yhcqGF01KmKUnIY6RbsVkfkDEVzZlRFtNlGNI+YlBvMvUWR9p0tYzQ1PuWTBD7RmFNkG
         nqpW/40W+xoL3gYxp3Z1snJpu3h78k2n9lfmZFB027GDwHvIlNgVzdWOY6WngvzMR8Sl
         32Y/dZEc5sL3hYXqc56Ki/i/4bGhqZDiV5bRofAw1gs5xEOnbO5xylBK9xzbsdE5C50Z
         dKjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745902825; x=1746507625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3lofZ2Bm8qaw0g+MX7QK5XKjfJFx9l5xRSef1IWMqPI=;
        b=PMsBFcsySnL8FO4D7i0xm7GKhkBd6eBt7IoSSwomR5sAg0Z4+4c+CvpdcomEgm4yrl
         qEG3nN5Fm5xGfb7+kCpDh7WqmBDe9xElx47w2Ii1nnh/DzvmE3wag5R6s3LSiSXvvlOo
         F5ZMIGUb+g8v9p/7HGVcn5MclFoG+G5Ol+u7vhH5ALMktoQW4PQ7HLvuKJhftTlus3P8
         b4SMAIxtbUTql7TVmzudW5GIgiF0otg9/KK0dzXRYQwsxvRotyg4mVDzz/1FJHorAH3I
         zU0G1EjL2fQIbQi4lvP5kz7RdHRegxnTHjxAhzsm1i/89KUoH3vBEVP1Cm2r2txRTxNQ
         COlg==
X-Forwarded-Encrypted: i=1; AJvYcCVSY22rdbYmYPGoUhvptqRobPGab+mAP+0ArJxnxmCD57nSrlXLFXF9bSFSYwc7Ru5DYwaMfJEOVHQFQA==@linaro.org
X-Gm-Message-State: AOJu0YxvQnBFu2LJfFEsPcnB2V4ZmbfPe82mtfvenpT4LwJ0XwcQk5zT
	FCfyq7gChhM46ikURYMZAiBzwRn3DTVOWvxbagYznyl6ccdkeIhsTIb+Ipmn4AUTgQ==
X-Gm-Gg: ASbGncsyXFXLqojcWylLtn3K1z3AkVFXFoAz89TQulJLsLIYWA+Kv+X+lzl+LsKORHx
	9O6luWoL9poL33m4amBXBn1pad3Hl04LPrl0tkhQ9iqPwhGSnDrwW1igAoRcdQDucZU7DJHgll+
	kA6h//AJlYbsiS88hFRaoFPJBhAebD7RYE/dciOBtg4TjQ/kqkK5GUyhVrc+zuIt5zUSzSxFg0H
	QsyuaZK1ZTP3hOSIEmRMsU9uYGM6gMwatg1l/Dog7GDn0Cks+9a3U6UXd9Pf+yw9kn5GVnqagZu
	egsS0wF6wD2LQUfg9z5kzGvsdYqeoO9KodINOHQLf3cpveY++98=
X-Google-Smtp-Source: AGHT+IHKajVGWFwx2GV64yYYge6HnuSIfHi7SBgyTCx5wiAVxc+fYk17l7nH2nNKkMp7ATQMXoSv6g==
X-Received: by 2002:a17:902:f70f:b0:22c:2492:b96b with SMTP id d9443c01a7336-22de7015dfcmr25481425ad.15.1745902825364;
        Mon, 28 Apr 2025 22:00:25 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dbd6f7sm93004015ad.76.2025.04.28.22.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 22:00:24 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	kvm@vger.kernel.org,
	alex.bennee@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	qemu-arm@nongnu.org,
	anjo@rev.ng,
	richard.henderson@linaro.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 10/13] target/arm/cpu: remove TARGET_AARCH64 around aarch64_cpu_dump_state common
Date: Mon, 28 Apr 2025 22:00:07 -0700
Message-ID: <20250429050010.971128-11-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250429050010.971128-1-pierrick.bouvier@linaro.org>
References: <20250429050010.971128-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: J5rXloSPsH5T

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/cpu.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 85e886944f6..48ebaf614ee 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1213,8 +1213,6 @@ static void arm_disas_set_info(CPUState *cpu, disassemble_info *info)
 #endif
 }
 
-#ifdef TARGET_AARCH64
-
 static void aarch64_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 {
     ARMCPU *cpu = ARM_CPU(cs);
@@ -1372,15 +1370,6 @@ static void aarch64_cpu_dump_state(CPUState *cs, FILE *f, int flags)
     }
 }
 
-#else
-
-static inline void aarch64_cpu_dump_state(CPUState *cs, FILE *f, int flags)
-{
-    g_assert_not_reached();
-}
-
-#endif
-
 static void arm_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 {
     ARMCPU *cpu = ARM_CPU(cs);
-- 
2.47.2
