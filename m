Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2779785njj;
        Mon, 5 May 2025 16:24:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWGJWmEIzGfawXEU7LoMWKkOl8APdasxKbkvdtHizXtDi7fhDyBiKJrO28x8afhIZIQih4kC0xHrFeAlg==@linaro.org
X-Received: by 2002:a17:90b:3b8b:b0:2fe:861b:1ae3 with SMTP id 98e67ed59e1d1-30a7dad3b1amr996691a91.8.1746487452944;
        Mon, 05 May 2025 16:24:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746487452; cv=none;
        d=google.com; s=arc-20240605;
        b=RThfujlE2NRKvNMoNIjWIbA3rtEHFtwk7zafsaUtnzoi7Dtlj7Qkmcac/7DOKSep/I
         bVjRVhvL1WKgUC9pSJ8sjBJNmO8HokUHF4lZNIODHf6LkhgdLYEHJPbRTXcY9Q5dAZtL
         Xd2hGoRPB8xHKFW7n+9kbl9cEtvwV+B8g7iKknPyDEVxz7Enp7msFEZ/2eWo8z1YuXwB
         /U9h7juQKqohYZvMqSnFg+0Asnsful9MzrhP1EApCG6aSg2JCQKrIaI6RXaiubeN3crz
         7+KP5why6dkzL2+0SDaoxP+QIaY9tjcs08kPyw+F1pfCzdcRwFzWohTw8mpq3tCoUeRN
         j6jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=11Q55+gMF5u6Eo9NyNW4V+s1ceVG/+YyEcTpuHMGI4c=;
        fh=5G6SFk5MQkEzi2UFdrokLeM6nnAO0nILDxHseR5jQy0=;
        b=Ndi7m+BqK3dzacfQC6M9EEJ/oAZrbJJIo0F1YfT44N/SI3KzhvgVM7eWZ1fA5UVd6w
         kEMLoGZK4Hesc/tr3ub2x+RNBRVbb7En1VEH+2xQhL6AO5jDdamsVjR37NY+afT3sWwa
         Qb5JMBszdiwpJa/q5SbrzeBmC0xmbCKXk0aXNjL6rtsNrE0PX+JN9c09go+YapGphnzt
         ruIgR3zgOhgrENAuE67Ziz02zS7Ia1+dPtHjIe0V6dk5sMGE5lCzRTTGpYJXWS4ry/FT
         iBWtTUuTbYd3go1K7hmeL2s/q1io/1n7eK7/lMisjfNX9BYge9ZpZpfyF3aWNP5W0dz+
         OoZw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RXV90I75;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0be74613sor55472425ad.16.2025.05.05.16.24.12
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 May 2025 16:24:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RXV90I75;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746487452; x=1747092252; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=11Q55+gMF5u6Eo9NyNW4V+s1ceVG/+YyEcTpuHMGI4c=;
        b=RXV90I75YmzK7URiS/m4QSwHifYkf+ktgFXwJCXk6/DCHZ+mqoZeiE/9TEFBV5Nc+u
         iCupY07sN8LwpVyPTkGMEkZkJbscrHlS27Vy3/EKJXhDiYwc0+7n5y20yWnzC2MFDooF
         cQtykhwBpM1kaaijL2uJP5bcst9vZRheK0sDczUGfC5N1bAEmYdTN30ON3kiBJMluzw9
         iD+jV2X/YTRm8qtvWyttSxJ4aYTTb0GS9vPj7YfG7LFb3dWTeKQuaY9JhGTzVig+bSyS
         B8R7Otc+Ci32ajOs1B7/zUa1BjaQfKh8rNmKdWLYd5gOHbCuczChZ4YaI8nyDiFluujX
         hoQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746487452; x=1747092252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=11Q55+gMF5u6Eo9NyNW4V+s1ceVG/+YyEcTpuHMGI4c=;
        b=A5ov5lHsjZzr+c5MDZcLn5NAotBayvUZ//m82/jkEAiIw9CvapKFD/BOx5Z3tgdgFO
         NYykDRGsaF160w0tU1tLRKYYZNwDt4jrXACTL+/1itTd2v/dR9Uko3y/DuJOa5ihcII+
         As07RlYVWb2hTZKwH+W2AZN1rtVmH+0NrPPRKI8zGUJ5L9mNvFKcJt4ntrKkbegkSfvU
         4AI2VvidZ8MoFgdcY+iOXXE+lSG4tUMo1TqPjO7p7zi5WJbu0oLev+u2Loi45NssMv1G
         z9F77g+flYy4aFYZx3T3uXQhiCzMZKCRsWJdnsL6QedVZJA+wEsIgFOiathcBQDue9ff
         H0gw==
X-Forwarded-Encrypted: i=1; AJvYcCWSxzX27hT431GN6mz/EKTZIOYPWQdpVKhY6GIwPtjK1/X8JLq8fwwCFgjFtKMS0zZtVOIoVFqMXULC/w==@linaro.org
X-Gm-Message-State: AOJu0YwGr23iQP/0ewlCjqTCgO50zdxC5i3pp/ZDft830ZJ3EHVqzs9A
	gV/gHiUeZtVVXlW+K2T/k9SMNyK7Oil/XDQ8BmUIOXC5knb+EiyQ/hxnKAev4fOeGw==
X-Gm-Gg: ASbGncuPJBHzHryrrpUgGSerm9EzdwaU/TdYhpSNb85rukxSa7/+9w6N8mvxBv+psaj
	aiHpLWp37KIpzEOQ8fuMzTwuw1DdAQstB7zGn04Z04G68CJhsdx49u+7GPk8UoZURVeN5etsjtk
	poq1yJbfks5hwydDw6dyO79Nue/k7O8LTpiEIE1m0xYAmYi/pAMbbDMNN63BGkgVnigi8pAH8te
	b8hkUzhjfUGAIY2osl5FHfi7uU2eFU2JcwX4Wqs1Na6bndrQrEqyjOjkbWVXVsKWeLvmDTGhi/U
	RSXtpWpNceKn8G+KPQt6RDlQIA9EbyLCMwrC32fYMhKJ+oov5kk=
X-Google-Smtp-Source: AGHT+IHEfEn8enc/UUEJkyenE0/ZzWHcJwnmTdVTyMTIF5jEMniI55M6dBRUpyvPtgQEw4fn++nWVg==
X-Received: by 2002:a17:902:c412:b0:220:cd9f:a180 with SMTP id d9443c01a7336-22e365b89d7mr13254335ad.53.1746487452569;
        Mon, 05 May 2025 16:24:12 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e16348edasm58705265ad.28.2025.05.05.16.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 16:24:12 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	anjo@rev.ng,
	Peter Maydell <peter.maydell@linaro.org>,
	alex.bennee@linaro.org,
	kvm@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v6 45/50] target/arm/tcg/neon_helper: compile file twice (system, user)
Date: Mon,  5 May 2025 16:20:10 -0700
Message-ID: <20250505232015.130990-46-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
References: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 39b0V3MWm99i

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/tcg/neon_helper.c | 4 +++-
 target/arm/tcg/meson.build   | 3 ++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/target/arm/tcg/neon_helper.c b/target/arm/tcg/neon_helper.c
index e2cc7cf4ee6..2cc8241f1e4 100644
--- a/target/arm/tcg/neon_helper.c
+++ b/target/arm/tcg/neon_helper.c
@@ -9,11 +9,13 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "exec/helper-proto.h"
 #include "tcg/tcg-gvec-desc.h"
 #include "fpu/softfloat.h"
 #include "vec_internal.h"
 
+#define HELPER_H "tcg/helper.h"
+#include "exec/helper-proto.h.inc"
+
 #define SIGNBIT (uint32_t)0x80000000
 #define SIGNBIT64 ((uint64_t)1 << 63)
 
diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
index 02dfe768c5d..af786196d2f 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -32,7 +32,6 @@ arm_ss.add(files(
   'translate-vfp.c',
   'm_helper.c',
   'mve_helper.c',
-  'neon_helper.c',
   'op_helper.c',
   'tlb_helper.c',
   'vec_helper.c',
@@ -68,8 +67,10 @@ arm_common_ss.add(files(
 arm_common_system_ss.add(files(
   'hflags.c',
   'iwmmxt_helper.c',
+  'neon_helper.c',
 ))
 arm_user_ss.add(files(
   'hflags.c',
   'iwmmxt_helper.c',
+  'neon_helper.c',
 ))
-- 
2.47.2
