Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp95684njb;
        Wed, 7 May 2025 16:46:57 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVltHVxFfcl6xxmvrzL6DNOqf1w6CA8H0k3RJ4PT01GXBlbd5uTbt6kFJXIMKPZMcgzCH3ogFZy+hOZ4g==@linaro.org
X-Received: by 2002:a17:903:2447:b0:22e:3b65:9279 with SMTP id d9443c01a7336-22e8dc8f2femr18983295ad.53.1746661617321;
        Wed, 07 May 2025 16:46:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746661617; cv=none;
        d=google.com; s=arc-20240605;
        b=fZkGrtYCJ+6X/aolYvfLkI+NIPjkOT5JUF8d5bWGP2aPpwJXstv90EIszEPCpZoq9V
         DOxtOdP+2DCejMkw055qNn2IoiNUABviobw3WbmeKj4ImObQkDJiotv3DBZvQ8xVNWz/
         Gxdq9n2PKHWOw/JUnWE7SgdipbeQGO0Z7k0abt7eyMQqLmpM+K6sbhl0JhHn076zx1gE
         k049BsPkVH3QcioPNFuENTJo68gKipjL7Jhdf89myco1BTx2rNQvUg0td6i4QNWvEWE1
         8QilxeZuJkOeOaYoDrI9l86+YP3l9GzoewHqyhPk3dytCumocY6EmsSw7+DVQ/8+inUP
         0jew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=iy4NKdbqFEoI1LwuiWAT6ispFyw4zHMXwGZpZSKm4tQ=;
        fh=kWGEZbqcSnwiCyT6VqqtxO4S4PViYnYL4rzBs8Jf3Nc=;
        b=fkd6nVGGT+/ztI1PSWNoiHIM6Qy4KVTNZ813sGs/a8yg9sdCdVyOkcbBAIPka2Q6H3
         Tl+VnELBDvBbWf4RmZlz1AcjTOrYKavc+FPx1oDZ3hVW3nqCujO03S0JGRkbqX/9Je+D
         b8P9/xOFYdpjUrOGm/opugxMbfqbNvcwmcicQRmaS2V3CDSv04goiDmgG8QxLvOyKdMO
         lpmIiJD3wAziX1s7q6IZvaZV+mQS5mHaEyExj/pu8aVSyBXJef45hREm/fSK80q2Hj+Z
         6u4c8n2meZxi/gHZXg8m2PgrCCQtqofq9T7w887ouWA7ENQEdOX+7DfLLkY1q4ONtKi6
         BR1Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZHzBLxVC;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0bb3c4acsor95353465ad.9.2025.05.07.16.46.57
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 07 May 2025 16:46:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZHzBLxVC;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746661617; x=1747266417; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iy4NKdbqFEoI1LwuiWAT6ispFyw4zHMXwGZpZSKm4tQ=;
        b=ZHzBLxVCA0ImPuK00JMFNcDG+jFu9d8JFXaAUHhTNw6l9ym3vXzz62P0A+olwkaDml
         6K7iH+Ewiu11V+AbBn6qXZ/B0slNDOYTt4xfYaohuFgxqbyTM88l6UVIN++fJ3ZChLl5
         /KNRMxgtaHTkB2/jPCfuD+I5uPue0xcDkIeSUz8QoxVZGNSsPn7CZsSo190F0ENoZe+L
         3FdCwygpoVabhGVJ3jX2/l0c7Y8yBhYhyh2RAA+u6uRHTsl5MyyyJlEAlHYymrLo+RXO
         RtgQJuRSi6nOdF0BBbvl1qXR9TDNah20QEtKnEUPmiPKO5ZBLThIxsKCB8LWwZJmfT8G
         6OZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746661617; x=1747266417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iy4NKdbqFEoI1LwuiWAT6ispFyw4zHMXwGZpZSKm4tQ=;
        b=OpJb0LZDaAa6I30eyrsSOZAYQsA+oqqaRCAMF327ovZ4C97nwUjvSKYSZVqfxePZ2l
         TvOFcgTGYXU6Zd4lP7SmuaN7IbVEvDgaFctwmnVwA6/o6orLOYCWE0fSwfd5JTHqxlV2
         xJcM1SLn91fZH1nQCzcbLI2Hh1O+HvmuqFO2htuFI19gqSH0i7jxRXVz8qjAH2ITaMIB
         5K7I+oC7Ll1hmv4YZh+wZd1fdnOvqg0TuE9WfThgtHckPX1/QsiWltkAKwLe/zdf6piH
         VvYhDmJPCV1itM+nXtM8O96fs7KLzwj3bY72DMR9qD0+eYGyT+pCG51vnURFkIfulPw7
         dLxA==
X-Forwarded-Encrypted: i=1; AJvYcCUVP+/jJFbufWQn06M39IjM8nYh+vALddzIw/nyiVtSEo4WctN3EF6zzzsGgcwBFZJ5xkDhAW5250IxuA==@linaro.org
X-Gm-Message-State: AOJu0YwdIPl/p7s9VpDvDJ/e17pXXUStoppuAj41Qf/EFbfpB++kmCVd
	BhlqHb4ek4CG8rRlvNjsfCFSvb2mdSwux99cGvFPf6XWa4rSqVJ6IrdRGCLwG9uXHw==
X-Gm-Gg: ASbGncufqZUZqRNkkzbOKRkT8oISOaqyFHQaeMCnXIIvRXinVv75kZp9PRazqSjkg5n
	/3gCqfPiqIy/zBfm1JDUn8zkPJ9Pm/GjZB7J6JgZTLoHjuUzYuspHVzSfw8mmnlUcF3EsRjFHw5
	SH51+r1Y5Ue1DINR906GiZGycTDm5QAMFvQc0ee2el2QiukVkOvvDiaMQi5y9vxugMO1sUoDqJQ
	y+SIPZ04P1hsOhx73FG0/nOm8CaOEBKku0Tm5ELdo8BhvAlRV/TK5PJwGm1McMS5JvrVdymTfH0
	QHTB3JbJ1wbxv9JMlPTfESJSQLQS4GK6StSBxlqi
X-Google-Smtp-Source: AGHT+IHof0yGRKomWjIKigklmtvQ5jmLC5TJCNDejIRDGpUvjaUrG8dHyZvJSvt3A8FELVtsKi1m3Q==
X-Received: by 2002:a17:902:f607:b0:224:10a2:cad9 with SMTP id d9443c01a7336-22e865f74aamr20930515ad.41.1746661616957;
        Wed, 07 May 2025 16:46:56 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e151e97absm100792435ad.62.2025.05.07.16.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 16:46:56 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	anjo@rev.ng,
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	alex.bennee@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v7 46/49] target/arm/helper: restrict define_tlb_insn_regs to system target
Date: Wed,  7 May 2025 16:42:37 -0700
Message-ID: <20250507234241.957746-47-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
References: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: lS5MFckaeCMZ

Allows to include target/arm/tcg/tlb-insns.c only for system targets.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/helper.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index e3ca4f5187d..0f3d11b0e12 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7764,7 +7764,9 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         define_arm_cp_regs(cpu, not_v8_cp_reginfo);
     }
 
+#ifndef CONFIG_USER_ONLY
     define_tlb_insn_regs(cpu);
+#endif
 
     if (arm_feature(env, ARM_FEATURE_V6)) {
         /* The ID registers all have impdef reset values */
-- 
2.47.2
