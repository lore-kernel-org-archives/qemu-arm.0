Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp19563njj;
        Wed, 30 Apr 2025 23:24:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW6aOMcOMwKCOaUcAQbV2NVkw/ySZlBc3vFvcYTHdb/lGmhTjoW6kweVHQR5xxTzFlZiXuVhCxXrf7CVQ==@linaro.org
X-Received: by 2002:a05:6a00:3003:b0:736:b400:b58f with SMTP id d2e1a72fcca58-74048fcf549mr2388789b3a.0.1746080642446;
        Wed, 30 Apr 2025 23:24:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746080642; cv=none;
        d=google.com; s=arc-20240605;
        b=KTiRGaFRyk/N9B9Nt2fcpVmrZ+6W+YMpAqdJbtKWbt2ecVW6KhQomPOCnpJDOBC7gc
         fGYYytojaGE5Kw3Wgp/jt/Hw2Klk/mg9JJ4u5C+UeXuMM203BjWoCJOQNnUnRmCvqS47
         j1/b9h078ZRqlEv8vxtkcyxjsPO8cuiJ0KFNhJjEZMTvtlnn4CdtUGAnmyYt6xb3Bync
         ewZ+PGFgkERoQj1QnvMSDclBFLtfdY8LElnGcBUnmu4CWlHQ0QHPcuw8ck3H7Me1yOG8
         LS7nltIvet/ruW5fSiSEA0V7iti0qB+BebighAzOsAHRR6MKnSgrJpQvKvkzbbxm6k9C
         eeaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Emf7r2NlJCGBegzvSaP4+YNHnVcvC5KK1KGZi+oKRes=;
        fh=522uhqBH2KKeoHMz8t5apGvgMB3WUHknBmkDGzWB2Y0=;
        b=Rm++pQEaXfuy/VlCio9X7UJusdLp0eK/R4EvLl12uAd3Jz+087MAL4E1NlEfr0/zvJ
         hw4qC+q8Y0unGd8uveTvGFnGTKNy0BjmAfw2SFwYn3kk4i7mhA1Z63kyVMFy/FnvfQpw
         guU45+PiB47IzRw1WhkafMBdNmgmpF8quZfaA0EezLTTicPbCFlEid6/wE9V3EcGUzIz
         NzdJX0mHIbrvV5kh6vBWP4+abxkzMqI5zGt8QyFilCB+hBuVz2ndxhW2PlscXMhLT3lF
         28y2W40hDkYww4/z5Ytex7CcwNPLxyM3eK0si3upV892bj+fL5Blsq9s7rMhewXjpE24
         BfSg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=X5cRDVNZ;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404fa16a8dsor60407b3a.5.2025.04.30.23.24.02
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 30 Apr 2025 23:24:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=X5cRDVNZ;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746080642; x=1746685442; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Emf7r2NlJCGBegzvSaP4+YNHnVcvC5KK1KGZi+oKRes=;
        b=X5cRDVNZdavP7RM1guyvW3K5HbiKDEzQJOr2aVQajApVWCRIryurQa1Gh94qIs1nmZ
         sfhy3expolC8ZF2AcI0d/VyPN6LKB+HU7GKYOUbgP1NYb76de84OPs3+izjfwzBhHmCA
         XLmllUHIk/NHMnL2DggJ8DhJoecbtk8gtEcIpyBI6YkPBKGYvTiN0UybJD8tZhULSuXx
         IF+keKSVU34ttgsuHTeTl0hFLcraZd9wVGcIG1l9+A9230qDzEy186HknPgY/MpcMcgt
         t1pAkZAWMb/Hs373ja3h1TY8LXnY7I9ykguQUBmjBLf2inkK5dEFcZf69IGcrY/gYIvL
         eokg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746080642; x=1746685442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Emf7r2NlJCGBegzvSaP4+YNHnVcvC5KK1KGZi+oKRes=;
        b=xCsXMp34X7VufkOWAcVEDRJhkBU+FlTyDJIuaGUl8JpTModgqemo8JH+7l2WJ9r0mF
         eori7BsbrNOMM9EwYuRX3xsgoJmYCSq+RVukOX3uigYav31jZ+Hyu+iFo3qgogxtwsjP
         PTMT/G734UzN4wyA5jdyq9B6Dvo6SV4EdX4oIuiELRXJp/OXk06b5YuTyIQyd2XoglMN
         mAARnkwSOXV3vJSWnop7yVBzBU0ZaxLks0bdfrHMO2dk0YHikq8Pb6NGn2W6uIPsOKId
         pv6aPaUS+VNelcAEYY4DtCJ45gSJBcyiqkIJjhVIIRBNpX20l5o6bMJUD9+5UuDHM7Fh
         gaHw==
X-Forwarded-Encrypted: i=1; AJvYcCVQzbj7z1p2911OdtDJ0Dwim0mjy/vp0caTbo76GC2NswY3m0E/dfeOFEQzRV36PgIkmCsYCEnX4NxzLQ==@linaro.org
X-Gm-Message-State: AOJu0YwkqPYcNYJ6N9Yo8y0lvhasnuNAP9x4970VdoKdaFpEyfmbAQoR
	FdacgcLxAFVZlm8aTM1TEz6l7rLOq3E3aZT5d6jj+WcBG8edqJ2EXGmXd1/RjVtcug==
X-Gm-Gg: ASbGncsTUaJWwk86OgUnKT9lm/+YlAt6dzOW25/ZZQrdXiOGs2wsAbN2z4nuY65OfYB
	TuMXFSIIQoGKcJhWI7DSDxVr+58THyITyMFHCKofoabgWXBh2zY8WNMmp2juX0BlqG95/ifUtQY
	sCIq7za4nlznK+0gKNvB80ZU7ybpjy5LC16IQ/tz3G6anwjaI9KJcEJ/ay0isj7vGJ3wBfouD1Z
	QMHDBjWc26DOg2Af4E4Mh13BJkyQev5MAMCz2G8Yd4SJ/y4aeXYXl1RMqsAwHhLfR8Blk+ONByc
	ggeN/bHBrM+/8qDMG4WhnW6QpBr4lVBcB6dhouRL
X-Google-Smtp-Source: AGHT+IE22a31367JIZHwwKpXwGfowHm8X6Fj6YHyiKmD1fh8ib1PzRjpm73hHdINL6KudHQM2Ftrww==
X-Received: by 2002:a05:6a00:2e84:b0:73d:f9d2:9c64 with SMTP id d2e1a72fcca58-7404946fbd5mr1830280b3a.10.1746080642040;
        Wed, 30 Apr 2025 23:24:02 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7404f9fed21sm108134b3a.93.2025.04.30.23.24.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 23:24:01 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	richard.henderson@linaro.org,
	alex.bennee@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	anjo@rev.ng,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	kvm@vger.kernel.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 12/33] target/arm/cpu32-stubs.c: compile file twice (user, system)
Date: Wed, 30 Apr 2025 23:23:23 -0700
Message-ID: <20250501062344.2526061-13-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
References: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: MTb6+l5tBRzt

It could be squashed with commit introducing it, but I would prefer to
introduce target/arm/cpu.c first.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/meson.build | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/target/arm/meson.build b/target/arm/meson.build
index 89e305eb56a..de214fe5d56 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -11,13 +11,9 @@ arm_ss.add(zlib)
 arm_ss.add(when: 'CONFIG_KVM', if_true: files('hyp_gdbstub.c', 'kvm.c'), if_false: files('kvm-stub.c'))
 arm_ss.add(when: 'CONFIG_HVF', if_true: files('hyp_gdbstub.c'))
 
-arm_ss.add(when: 'TARGET_AARCH64',
-  if_true: files(
-    'cpu64.c',
-    'gdbstub64.c'),
-  if_false: files(
-    'cpu32-stubs.c'),
-)
+arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
+  'cpu64.c',
+  'gdbstub64.c'))
 
 arm_system_ss = ss.source_set()
 arm_common_system_ss = ss.source_set()
@@ -32,8 +28,12 @@ arm_system_ss.add(files(
 
 arm_user_ss = ss.source_set()
 arm_user_ss.add(files('cpu.c'))
+arm_user_ss.add(when: 'TARGET_AARCH64', if_false: files(
+  'cpu32-stubs.c'))
 
 arm_common_system_ss.add(files('cpu.c'), capstone)
+arm_common_system_ss.add(when: 'TARGET_AARCH64', if_false: files(
+  'cpu32-stubs.c'))
 
 subdir('hvf')
 
-- 
2.47.2
