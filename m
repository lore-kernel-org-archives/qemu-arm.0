Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2779780njj;
        Mon, 5 May 2025 16:24:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWFmbPYPtuWO2DlPqCDi+9sIxssYRtDdaZ6Dm22GAwHqmvsJBvia7hMat+ZrzlQkVONf1olmTFT49lRMw==@linaro.org
X-Received: by 2002:a17:903:98b:b0:224:3c6:7865 with SMTP id d9443c01a7336-22e1e8c86ebmr121018145ad.3.1746487452120;
        Mon, 05 May 2025 16:24:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746487452; cv=none;
        d=google.com; s=arc-20240605;
        b=GteIfZby7d3J+JzDo3IMNaXstm7nBf3Xf8kC2G1Sww7zJqxzexpqzeUs720+ro/QHg
         9DLGsfA/0G9HAylP7oVXpdckwO+Bo4vdRoEdInrPpyRZSTkv4UM4kLkrKtMsI16AX83x
         brKD/LG1hsbJ8U3dfuEQwox6EBfj8WHwW4U7TXd+mft7AbW1o5aXUYhSiq51wVb+tmA+
         W5ahMVpZdiBcRJKJHygbRGKgEBKyBuaiBf08rkJy9GCtGit+ZGSsQe8LmieAV7scdHP7
         Zr96E6jq30rkAwqp3pvqBnS1uoHLHd577R9eYLVtIFzFqPwJiQE+MIuWffMYzSq9K+1b
         Gshg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=rsZT/scaGxab+Vo7Y7hWrcYUC7iBy9GgtXflG2/7Eik=;
        fh=S1wgI+2c+H33ksAnfzJQob4Dk3f+B1ktBne/osNYJBA=;
        b=a+vJPLTMnZkeKTu2TJGj4QSLvdVtYFTR+l3uNp+QK//sVMtm+IQO6wj/eT3aX/4gNi
         4pBrfu0b7yFJvlYVkcoVC9aF8Y+o+xeomxVIrK1/iDT8Z4q7VUaDFOQLAjrkW9cP6mTY
         QKQrZFEZU3xTZUkPcrMDvwwyAfLienfUTr4Tauy6NG40afCq8LBvmdH1xFKGbalk+O+E
         ayN950aytaJ8bL62tGC/piU2jVuuWePielkP3u749n2uIO7YA1HI+vHrPpRXuie7LRrl
         p+2DgMY4JY2cZhJ2C2Qtvda8dKHzVZ/wKKLZ0e2tP2hfrDeGBRPPj6TqSlXElIIGMy6y
         xtmA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BLI4HCRN;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0bb198bfsor54195895ad.4.2025.05.05.16.24.12
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 May 2025 16:24:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BLI4HCRN;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746487452; x=1747092252; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rsZT/scaGxab+Vo7Y7hWrcYUC7iBy9GgtXflG2/7Eik=;
        b=BLI4HCRNtHvphTCDuDjU+SQYjhHLC+h/75TVRV5GNW9ZXJEkvQfqWxpx+s1oO1Tf5k
         FCYR3ZhY06CXeGL7IOMtiL5AjKh79xzJ73L+X28xTReGP4g/4VdPgw2DsNKGadtsHx+Y
         8q2+ilwbiMSN4H2mgRrIhyXUAL2cXac3JfdgSn1TRUFtox9sbYsctZzRZ+cGcah9mH6N
         7szZe6rF7K9/u4fJ6svoNxZz8P0BUb3RfXYJfyL6DBxkofcPXDHCj4lUbzMSYfzKv4BA
         8QHDcBlCcqGBUnrlyT2CeqZAi51mJuHuTVlfkYv6B8/K0J1/IkSUZqe3zGVsP6qCMWg3
         MT1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746487452; x=1747092252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rsZT/scaGxab+Vo7Y7hWrcYUC7iBy9GgtXflG2/7Eik=;
        b=EehuWNoTgogt1PE2sbSfP0madfdmaEIdjOtEHmyV+R4BKDyyLEpJPjCmq6vH9rOd37
         1AN8toSkvUIvAbME+GQg3axj7oCvMfC2vHmilzTQdIyAfGMl9/RmeYBJh9IulADQParC
         uRHSzVV61N2WZosE4zHHMREh2G4vkmWAiDYr1v2cQUS3cnj5yzRvxthfGPcsztpqEuxv
         tKBmXxJ+MOhA/IidtkvMUauadG717opmEIM6JWSS6fa+/7m9Qvs/THpUAJmm9eiq17iu
         dnsmcYFQABZnyHF/fO4bcqLdOQ8FWrg3x5indOW7OzgMLx7hI6a2/1KKlPzqAlINISm8
         EnKA==
X-Forwarded-Encrypted: i=1; AJvYcCWKa5Iek+W8pO4eNDcFDJfT6TE9ACQMLA/x5dFOmb5sNJx5w1wRLYoy7NBYFeleOyPS6rMBaAQctV5GVQ==@linaro.org
X-Gm-Message-State: AOJu0YzGPG+5QjovHANbNhoq0Ee7U5nrsOWbgatwr2b3h4y/TKiaEjB7
	XCqy+7CJv08uHTrU5lGPF/5mBKqlkA55KbhFdrjXvqBMBIiNNm9qaRrGQoBn17zheQ==
X-Gm-Gg: ASbGncufqIzgDwtcu9dK+EW0qNufqImj49WYrDIKGSGK3lFO5mBamN6RA0N7ifJ6SVo
	zkFD5cAobWRK754l7dUODSZYuUrGizD8X7/2/dDgLCWJvqJpBqh9IENcax1X8JKikG13svmWekK
	roam2lu7XvpmkzkpYhjEgQMUQ/WKunaXVnndBGLOhuiXfxwe9E6tOUhW7AK3Pq6yUsB3teZwNsD
	W3h25P5jIUVEghSYFdskIdSsrVj6MsqNjePI2i7d9dBmrRq3nX1dpmcnthAzoI7aTjh5KMYXjDt
	eohofzU+O9ySYtazkMEQixDuTjPfAo65ALoIOaGy/TBs6WWGGP8=
X-Google-Smtp-Source: AGHT+IFAhPucFlkZ11OgWLPowthveQnohlxYQE/0ZLy0irLJH4rJEHICQLoX26yFH/+v+7ZBHx2EcQ==
X-Received: by 2002:a17:902:fc43:b0:224:1e7a:43fe with SMTP id d9443c01a7336-22e1ea8de5cmr133671325ad.46.1746487451718;
        Mon, 05 May 2025 16:24:11 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e16348edasm58705265ad.28.2025.05.05.16.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 16:24:11 -0700 (PDT)
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
Subject: [PATCH v6 44/50] target/arm/tcg/iwmmxt_helper: compile file twice (system, user)
Date: Mon,  5 May 2025 16:20:09 -0700
Message-ID: <20250505232015.130990-45-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
References: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: gPU0Kh0A3ObY

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
