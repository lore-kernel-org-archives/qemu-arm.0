Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp493151ejo;
        Mon, 11 Dec 2023 13:23:07 -0800 (PST)
X-Received: by 2002:a17:906:2cb:b0:a1d:3511:6674 with SMTP id 11-20020a17090602cb00b00a1d35116674mr4812837ejk.13.1702329787265;
        Mon, 11 Dec 2023 13:23:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702329787; cv=none;
        d=google.com; s=arc-20160816;
        b=qUhnsGekXDQLYvhHfvgNuNYozeGLMC28vMolMzNUBn4tthR/lMbySmz/Ot9hHDXv5i
         zvqTeRmqARuvOUpI745+Wp89yUjw16x15wz3AG4iouoxJ6U73TbjvDRulkUvaAeGhYhs
         UH+/4SXohZRImVZKAm+BEQH4BiZZNpEERuFwwBvGd36Rf4RgwddexR5BZDruQlXiBW5I
         qk+Y9Lvh8DqM5H6FV5aZDt2OBCAWnUNP802+xCtOGAYzlEccJKCTZhl+wSxiCE2cYNHI
         ZyoEeYhkTRh9ma3CrmPpM4xVL5fJMx/8yV0lgogaAFuOIND/E88/tUvLdGs+yJQ0DCBW
         7R2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=fz8HKxM7VVSIi3osZUv3wojb8Ys1Hua/IsYgZ7swcCg=;
        fh=ogyy/JNPeEdVnpId/GDwwe0pe92olXpzP0mQGo1nC0s=;
        b=SolAwzX9FVjw+q/57iWSp80fYsCZRtQ8UhKKDjlUvY6YdIvmWnJJpYpiZ0FA1mwS9I
         xqQfWqQy8S5MT/HITddRQvKNH0wit7wxVIHepUqqoBcejK5IwfYdHWJup83TRzREpu1k
         g94WQZXoEAGQloUWPrnicm5c0FLlIYt/ZtgMDFaGhjormiMcbw4fpd8koD8Y12NFGTcW
         yzlhF6TaRBhdYvpdilWKnVxEBzzEfni18OFmgDwz+/83r8F15bu8+SmnGts4/jlqpTJa
         pE9Bt8f0p0o6n7OkgZ20rMHovxXMooHiFWuEpA3spv1MrOLGThnRoDttZuxUTu+jpybC
         J68Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Dz4xYDxL;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id mm8-20020a170906cc4800b00a22e073f9ccsor182004ejb.6.2023.12.11.13.23.07
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 11 Dec 2023 13:23:07 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Dz4xYDxL;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702329787; x=1702934587; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fz8HKxM7VVSIi3osZUv3wojb8Ys1Hua/IsYgZ7swcCg=;
        b=Dz4xYDxLbbDwbf7f4bnhq+lPqhUdGcviYtdKYE7LyRb0V/XZ7Pzh7QZ+jS0SBp7Qfi
         aaIBU+zWOC7n8sIQSA/0IBwCxcKAaThYMuXclhsbqGfOjz9wvM+GnlMTe+Dsj/ButWtH
         RGKj1X3Z2MN1p1mQ2AXtZdOrWl6xWrfMV4dPeJzmmmyfP40k7PkSd2mUNplSRH9rT7i9
         4jVPEHKolM/GCxzlF+bF5a4w+dTd8vJWpvpgIZk4iAxegV9KOJ1jzNIjqcXmuhsQlTra
         CjDz6qsLCIIGl6dpTY7J9aTCrv5lI/8E8O9CDxxNT+KAN4Q0raXd0V8Cp+3S5gOciAQl
         2ALg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702329787; x=1702934587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fz8HKxM7VVSIi3osZUv3wojb8Ys1Hua/IsYgZ7swcCg=;
        b=BqUJ3AhzUllr/ILZyI+1Z1xQ1iSB9JilecoRCQcL7hMgA25T2EBRdiAPhFxvAExOmF
         0uL0LTWBwOM4TSERT6kynvoCl72owHyWw8O9NvyPD1Q3hDbHg6naKAxTLOZPkcvYhSDC
         N0UVmiGQ7L/17Pce+UTGGNoqM+I9Mu0w/9UdkY0s6oohwZ4MLoltHz4f3IkExoO7dhkM
         WNWxNj3XW9mfkxOLJgA6DR+HwuZRRqteNJoSITI4OhSVd4xHpnusEz8q9/20NmzVDp74
         SsOzaS0WHSS0+FX5RudXeFnP8PQTDlYnznMl1FlNeBQpJExslqE/BTMnxLQ02oiLL1uR
         IUqw==
X-Gm-Message-State: AOJu0Yz7ImGRYbU+d70ca2gG+jYsCgk6am5j1a88d9/G0svn3yX6yq3W
	S0ZQz5wGZPRZcjV/hgFaEbMdtJqv
X-Google-Smtp-Source: AGHT+IEqSygAcNwC+o5B672MJ7q2nrXQaLih0XxOY9Iv/XLw9Z61UiqNUbCr3QSxyrAi+85OAHMOjg==
X-Received: by 2002:a17:907:2723:b0:a1f:8149:558c with SMTP id d3-20020a170907272300b00a1f8149558cmr4160576ejl.30.1702329787041;
        Mon, 11 Dec 2023 13:23:07 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.175.193])
        by smtp.gmail.com with ESMTPSA id qo14-20020a170907874e00b00a1f6737be65sm5109488ejc.82.2023.12.11.13.23.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 11 Dec 2023 13:23:06 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>,
	Peter Xu <peterx@redhat.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Eduardo Habkost <eduardo@habkost.net>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	qemu-riscv@nongnu.org,
	David Hildenbrand <david@redhat.com>,
	Warner Losh <imp@bsdimp.com>,
	Claudio Fontana <cfontana@suse.de>,
	Brian Cain <bcain@quicinc.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Kyle Evans <kevans@freebsd.org>,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH 22/24] exec/cpu-all: Restrict inclusion of 'exec/user/guest-base.h'
Date: Mon, 11 Dec 2023 22:19:59 +0100
Message-ID: <20231211212003.21686-23-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231211212003.21686-1-philmd@linaro.org>
References: <20231211212003.21686-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: zZf+S0gZUwog

Declare 'have_guest_base' in "exec/user/guest-base.h".
Very few files require this header, so explicitly include
it there instead of "exec/cpu-all.h" which is used in many
source files.
Assert this user-specific header is only included from user
emulation.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/exec/cpu-all.h         | 3 ---
 include/exec/user/guest-base.h | 6 ++++++
 bsd-user/main.c                | 1 +
 linux-user/elfload.c           | 1 +
 linux-user/main.c              | 1 +
 5 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 2d568ae4f0..5b75d04ff6 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -74,9 +74,6 @@
 
 #if defined(CONFIG_USER_ONLY)
 #include "exec/user/abitypes.h"
-#include "exec/user/guest-base.h"
-
-extern bool have_guest_base;
 
 /*
  * If non-zero, the guest virtual address space is a contiguous subset
diff --git a/include/exec/user/guest-base.h b/include/exec/user/guest-base.h
index afe2ab7fbb..cf40151360 100644
--- a/include/exec/user/guest-base.h
+++ b/include/exec/user/guest-base.h
@@ -7,6 +7,12 @@
 #ifndef EXEC_USER_GUEST_BASE_H
 #define EXEC_USER_GUEST_BASE_H
 
+#ifndef CONFIG_USER_ONLY
+#error Cannot include this header from system emulation
+#endif
+
 extern uintptr_t guest_base;
 
+extern bool have_guest_base;
+
 #endif
diff --git a/bsd-user/main.c b/bsd-user/main.c
index e6014f517e..c331d727e1 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -36,6 +36,7 @@
 #include "qemu/help_option.h"
 #include "qemu/module.h"
 #include "exec/exec-all.h"
+#include "exec/user/guest-base.h"
 #include "tcg/startup.h"
 #include "qemu/timer.h"
 #include "qemu/envlist.h"
diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index cf9e74468b..f9e9ac1760 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -6,6 +6,7 @@
 #include <sys/shm.h>
 
 #include "qemu.h"
+#include "exec/user/guest-base.h"
 #include "user-internals.h"
 #include "signal-common.h"
 #include "loader.h"
diff --git a/linux-user/main.c b/linux-user/main.c
index 0cdaf30d34..84691d707b 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -38,6 +38,7 @@
 #include "qemu/help_option.h"
 #include "qemu/module.h"
 #include "qemu/plugin.h"
+#include "exec/user/guest-base.h"
 #include "exec/exec-all.h"
 #include "exec/gdbstub.h"
 #include "gdbstub/user.h"
-- 
2.41.0
