Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp45112njb;
        Mon, 12 May 2025 11:08:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXwc68NB7iHCu5x1dMP/9AE9Qo+VGcS1jOFCgzNl9mavRe36Y38/UPr8tcH5Vphwt9bfupxc0uDEuWSaA==@linaro.org
X-Received: by 2002:a05:6a00:4fce:b0:736:b402:533a with SMTP id d2e1a72fcca58-7423bc1c81bmr17816180b3a.1.1747073334454;
        Mon, 12 May 2025 11:08:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747073334; cv=none;
        d=google.com; s=arc-20240605;
        b=Tbad2jbOEtCleQWwbo7t25yLxy7RzPkCwFNUPOVa5M4xl6kfK9S5wI4UNokbU5kpOZ
         PpMe+WI26xGUXmntv+kQC869SWjrZgr5UzhQuah2sMsPn9SOcm7N7UyMDmvaf8fSpju6
         n6q79d2yZur6mqdirb9BuvXdOIOTeV4ATsg4ncLLu57g1wpG5s0aoqWPgF75FZvYkD5p
         LVTGsDGXtKhJ3WrCSIdzrEJq2XC/r7Nnp7uTZMlNHF+3Nkov7yK9NHDf5E9RDbuJMmQF
         0RBKSywg+A445mjA+fG7hjJmlyN4AYATUn1+nh7Ud8oZ/LJEGJUjOS7/MAB96LtEoZJJ
         ngBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=rsZT/scaGxab+Vo7Y7hWrcYUC7iBy9GgtXflG2/7Eik=;
        fh=a27m09q0ffSVag7SHXh6UzDdawgihuXh9ZPBPxoasoc=;
        b=XVAkAUeNCoTMlQ9Qt38snwzkpe9bEb+JAaaVlyrH0jksHd0r8na4GjgxPn9YuufvFh
         zwTcXWFgk9kXLNfgT+ahjNOrfmjQoIt7pLZwmW0wmJFBfIXHiEnozPyWT3D5fvaOaKAo
         gP9Xkp3pj2fAEjJ5QUw8snIWDUriirrjCPlYGd/vmL4KiBkGVvlNhpHEsxSwN4RfFSx9
         /c7Mnxh59/xSXdO3jDHoCAK2aVYK4VQb2RwKGOrbuZiNQ9FWD9Dsn37DwBg1CV/w8G2G
         KFt+DKyTxEIwLXwtr/bVezDbog0oklXWM1UiAIFSFt/BoVpi8NYH+h0nZHjQesUXrde7
         GUJQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AGEE37W6;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-74237a8ff24sor4690134b3a.5.2025.05.12.11.08.54
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 12 May 2025 11:08:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AGEE37W6;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747073334; x=1747678134; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rsZT/scaGxab+Vo7Y7hWrcYUC7iBy9GgtXflG2/7Eik=;
        b=AGEE37W6CYZ8CSmW017YOR5B2nu3Sr+0tfBoZYMUdh+43J3biMxyFvwM/iNIAyCfsH
         LG3C8WqkPt1Up6tGdr5z9aj+Krsb7sL79FLCjcUVpytNz1o1vPeUSR1b5cTzU9MoQmD9
         MMK9rST8gKyRaadZqIZSAM8vA7EUKLlFt7ump9SFfryxcybY9XL5mlzn+pxW3afOoNUR
         s73gQQjZreDMea6hzTaIQETy+1rFIQj3OMhBmBcssH4D03DgXXLJ6VXFvMA6f+hYbfCL
         e77zA5M2HfsRv6cetafdQfBK/b1iE5a+UzDoSCxz3xOQRGexLpVfBUoAHnLSrprKeYSd
         /QOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747073334; x=1747678134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rsZT/scaGxab+Vo7Y7hWrcYUC7iBy9GgtXflG2/7Eik=;
        b=QUXOPe4LL3pKtG0a6zDrwpUvcSTlmfWowtS/6LqygHBMxmHDY2SD3vXtE4cdZKhFWG
         Op+dIgGlJj9SaNoSri5KRrhT2344CQYEs4oiwwBUeioN5WwD3RMxOWlgAhiyilmpQ0dc
         mgTsb2qZ6S8OrcpgTP+DXb6kLLTl4Sbskrq5IIkvn0hggUbBLbewHz6oBSdPXpSpg98d
         9y+Lk07qC1rc4fObdMYNxonQY525PMElq6+RX/brzxicMysMXhIY+HKwfHR9uUTh8ecU
         Jk+Nx2qiMsc6cxgLML0WG+UxVuEASmV82lZZEPKExj/4K1RbEKa/cQkD7OlpDFxRFPHh
         1+Iw==
X-Forwarded-Encrypted: i=1; AJvYcCVlhIKTjvfl0weTywKCzjAFUmC+cqdHIC8GLG+kr5OSE8v0LWHeHHs6otIjTqLiW7YVD7Z9fqG9ZfPXDg==@linaro.org
X-Gm-Message-State: AOJu0Ywwkf+cOYvMmFQdMnpA7Tx4ms+YAydxOq2545T5SQANMpH3Bwdq
	5RZljUsULQKamVdg8o+EAHFvQ11Psg6kjlO+0tnf2Z3Bb3jaTlgwY8Ua2Jv+PpqUxA==
X-Gm-Gg: ASbGncsXQB2V2PHZY7w/G2GJuW+ODa8LPfDytQU99ckpsN9cd2zow6ckgMb7TGXWaTs
	dLylxfcUK3KwxewXCzHhdVvSb4JyCxxRnJbPuUPTkSDoaHW37GWm/vTv2p6kTAmkcBdv+Kx83/T
	hMeyhDztwlcuecjG1LqQ8zXAe7VvQGK7aNwcKinOgfX9yruI5ziFFAzUX07cFqmDqNhVvtIgXRT
	G6lnC+e9iy+hC/rmR1QjjXgVHkIlrNujAasHxqfRZCQRbaH2oTIH1odLd9DmBLQo2SWGm9Tdt2l
	s3ndLc4DjDDG8sWpp3YtQWcYCxlmnHOPy71QoJSQwCQxDFu2p+g=
X-Google-Smtp-Source: AGHT+IH6YdqrqSaks8wWBL7UflSDaRJSFa1wzyXZCbqTKawKIDKnpbS3w5JOi0gp4TZnERIb/sowVQ==
X-Received: by 2002:a05:6a20:3950:b0:1f5:7280:1cf2 with SMTP id adf61e73a8af0-215abb030femr18972486637.12.1747073334073;
        Mon, 12 May 2025 11:08:54 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237705499sm6438580b3a.33.2025.05.12.11.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 11:08:53 -0700 (PDT)
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
Subject: [PATCH v8 42/48] target/arm/tcg/iwmmxt_helper: compile file twice (system, user)
Date: Mon, 12 May 2025 11:04:56 -0700
Message-ID: <20250512180502.2395029-43-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
References: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: odJYf6w/86TB

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/tcg/iwmmxt_helper.c | 4 +++-
 target/arm/tcg/meson.build     | 3 ++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/target/arm/tcg/iwmmxt_helper.c b/target/arm/tcg/iwmmxt_helper.c
index 610b1b2103e..ba054b6b4db 100644
--- a/target/arm/tcg/iwmmxt_helper.c
+++ b/target/arm/tcg/iwmmxt_helper.c
@@ -22,7 +22,9 @@
 #include "qemu/osdep.h"
 
 #include "cpu.h"
-#include "exec/helper-proto.h"
+
+#define HELPER_H "tcg/helper.h"
+#include "exec/helper-proto.h.inc"
 
 /* iwMMXt macros extracted from GNU gdb.  */
 
diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
index cee00b24cda..02dfe768c5d 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -30,7 +30,6 @@ arm_ss.add(files(
   'translate-mve.c',
   'translate-neon.c',
   'translate-vfp.c',
-  'iwmmxt_helper.c',
   'm_helper.c',
   'mve_helper.c',
   'neon_helper.c',
@@ -68,7 +67,9 @@ arm_common_ss.add(files(
 
 arm_common_system_ss.add(files(
   'hflags.c',
+  'iwmmxt_helper.c',
 ))
 arm_user_ss.add(files(
   'hflags.c',
+  'iwmmxt_helper.c',
 ))
-- 
2.47.2
