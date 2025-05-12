Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp42879njb;
        Mon, 12 May 2025 11:05:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUiURJWIeDdFGubyGSP54F2N4vZ9i23b1zQp0oyttfNjpcc2O3/sKHSRUWveeWaj/J23PKXDKpTzULEyQ==@linaro.org
X-Received: by 2002:a17:902:f543:b0:22e:4b74:5f5f with SMTP id d9443c01a7336-2317cb419c9mr4747125ad.17.1747073137333;
        Mon, 12 May 2025 11:05:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747073137; cv=none;
        d=google.com; s=arc-20240605;
        b=Lx6Ic/3J408qArhuBMqr3BE+oubWtv71Oq+3wTMxujxv1d4C4owIj09YcHejJtC4KX
         pFna86xUP30hKtFxEiB7AlkaURD2yNMdLuLHafyWCHcbFxaizsym2VhG9NMRxq0U3Y7D
         ioHEzoj9P37dHafFHQQU3eZ3aQ65AoydQ3e/IxqUVZoENzfHG+3VVkR0AvQ4R3R/oWtN
         shNtNz2njviiQij6MRpoce30LYEK5NC1peZK/MUNl0B5U2r1DxfcI4KMVFWpsx0TNUKz
         DsLtnwEETSEu4+zZPC48+p3e5zjXhQFmnDOqJ59+jwDCyJF1IM8CZrfUslbTWhRrQsWu
         XovQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=rVtP/RnhHG9awohdmhc7BZy6oUycGDI8ImSQa94LuXo=;
        fh=f/mwyi4+F6jXSt8hbHNEWYtilVB8ewCqK5zvU8o5bJg=;
        b=KgRgklFiBwYns7g1A516V6PSbEcuf3+JObjkHwk6M6jmYKWfoqSav+ZaWWu33ORL4L
         cKfVQ9Gk3PbLEkTA77p2tBcwht/2S4aYCcuk42mAZFqKmQ7X/6GrrwbSsa033n5iTMEw
         WOT9nTs+sbA4oYV/XOEXvCqbb9ZRa6GS0/M/9Zrx/jKeUvdbR9vVqEz62SzRyAgzi+OU
         7V/oZtCGkSS83Pl+GPvM+lKbFp1cOsHvUXcCFZBCiqXztXpo0uHcQ1RcZ33i1ob6PSW8
         JalluXFnreBehZXy+Lh+m3v59KAEbdFDKgQJpDGnqIIjaye5MO66F1F1tlrSHMclPnyT
         jCEw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Th0TZ8uP;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e7f455137sor49622315ad.8.2025.05.12.11.05.37
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 12 May 2025 11:05:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Th0TZ8uP;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747073137; x=1747677937; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rVtP/RnhHG9awohdmhc7BZy6oUycGDI8ImSQa94LuXo=;
        b=Th0TZ8uPb8GR3MtgjJWQ6SBLqHSO8R4vyxK8h6u5JEhOWzgOr3phpPQhE49bmdvrA9
         g3jLk3w9yMCsh0lgO3AMPn7II9Lqdg5iqdp7JEIGDXVqRvyqTc9uucBy5k8ifV43JsNF
         hGTLoqelVkmjPEghPxNY1TbZ/7c41t3rYgXxT5/FAkJBXl6NQEhg/TvV+N6V20334rml
         R8mqz/Ai3SEX5SCeSVb7pB+kckRCaCVomtWlJkeTid18JbtaclTqINkRZy124bj3++wa
         sSmMtHl6qEO1+dQfkaC5Po89j3ZkpnygTaCyKEkt1z+GLk8QFEQv5JwEqSOOkul4Z6fl
         pvAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747073137; x=1747677937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rVtP/RnhHG9awohdmhc7BZy6oUycGDI8ImSQa94LuXo=;
        b=UtDgke+mEBTpOyoMcrgcgUZa0PFUoS7Jxegq+0mhJMWhISo4R6MCDXnrXoU9hCnCsG
         sW2IwhXxFPC0CgMOqcVAngDuH/bAzjFH0DAl6GdcTL+rNTurDsPG39ygBlPlCVaDxBMr
         6nO180TJ4lKh+fT26CFVt8Y4HoOfv+ZUumsZ2bL8goobju0RtAb7HhJ+USK8lDFEV8zs
         lVqKdmtcs2ArRNJJ8pqkQP63VJ2HK0x2F6I1pmmFOYBh+2/RxuFJ99yXbSbi+O309KwW
         nOV0vAQe0AMGy4XQsSohUceKaoWuxK3JgjHd52NocO4V8+T9V5Af+buENS6FAmiU6oVu
         +vMA==
X-Forwarded-Encrypted: i=1; AJvYcCWVT0jX5Nw77ED/hRoBbiwhsBVbFKUlJDodV3UuSCP3+NSo3h5jV8+lg5sNHjW5IYxjwQwqdg3QHVXMoQ==@linaro.org
X-Gm-Message-State: AOJu0YwrRD9/tA7FmDuSYr0dUrRiFXiOODTt2rBlDvSoA6mDZ8cpQsD+
	r6rvo3oMft6KdeudeFn8mj416Z81pDo+FpnrKoouXIVfg85LR+IH9pexOlJEZQIwfw==
X-Gm-Gg: ASbGncsxWh4UOBOHC5IPO35JDhArauLWK4JZvMK5wtidtzsDDvDlQVOJ61YTwUyjYlU
	j9+9bDaBKuqOqzTfGccfD8CmYoiLBgd+gjt4oVGILHCGejnDqs8l45swOPjzu7uLxyCv1Y+16I9
	Dh7x3ZwCr3YzULEP+kG0m1DRA7CLYMP0VVov0FVfiro07Nx7ykz9tyt7J9UFTskdyjkHCXdSM5d
	wnaF8wGtSrF5F4J14I36qGolvKsxbaONUEUZKo5a7PsYiwNruUCtCHg6kxWcfLaJxAqv7ZWQTh7
	TAsaM1QkitbtlQH0I3E88YUBh4disXW/cmIFJwP1mZnJYtOXTtw=
X-Google-Smtp-Source: AGHT+IHQktjkFkIYbxcsH/03GT/KqC3Zw458X78euWuyq7vNjTjOxPnKiAkDjbUnG4wIaS9Ypg1Ktw==
X-Received: by 2002:a17:903:2f92:b0:22d:c846:3e32 with SMTP id d9443c01a7336-2317cb65e55mr5398205ad.25.1747073136768;
        Mon, 12 May 2025 11:05:36 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc82a2e4fsm65792005ad.232.2025.05.12.11.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 11:05:36 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	kvm@vger.kernel.org,
	alex.bennee@linaro.org,
	anjo@rev.ng,
	qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v8 28/48] target/arm/cortex-regs: compile file once (system)
Date: Mon, 12 May 2025 11:04:42 -0700
Message-ID: <20250512180502.2395029-29-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
References: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: RnxLXDdywIzM

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/meson.build b/target/arm/meson.build
index 7db573f4a97..6e0327b6f5b 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -16,7 +16,6 @@ arm_system_ss = ss.source_set()
 arm_common_system_ss = ss.source_set()
 arm_system_ss.add(files(
   'arm-qmp-cmds.c',
-  'cortex-regs.c',
   'machine.c',
   'ptw.c',
 ))
@@ -38,6 +37,7 @@ arm_common_system_ss.add(when: 'TARGET_AARCH64', if_false: files(
 arm_common_system_ss.add(files(
   'arch_dump.c',
   'arm-powerctl.c',
+  'cortex-regs.c',
   'debug_helper.c',
   'helper.c',
   'vfp_fpscr.c',
-- 
2.47.2
