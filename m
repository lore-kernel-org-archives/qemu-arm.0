Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp1952860ejd;
        Thu, 18 Apr 2024 12:27:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXkIEuVLtZk5oaUgPmAbCHB0ztz/uDTFt0lJBwzj7fjJ9Rd1VRmLv+bhEQcvmrlEmGX5Y2hqK2tCE9iAxnOutvDgwrXN6xL
X-Received: by 2002:a17:906:4686:b0:a52:3556:85db with SMTP id a6-20020a170906468600b00a52355685dbmr69392ejr.19.1713468433716;
        Thu, 18 Apr 2024 12:27:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713468433; cv=none;
        d=google.com; s=arc-20160816;
        b=RUxvc720EeAg594mZlav4TKRWOSqS/JP8w/szvFjdN8VewzYQqrtG7u/2bQ9Z3xcsa
         WG2RZTgbPkaQzStY9pz3Vy3esqtvzjG0LIVCEND6n1hwvtZ0KFc4fg4msd6S+aFjPt/w
         fiJNmRLr1Tq8xKY4qyZAd09913l9YRok4fybAXo2RKym4z9v+sCL1w5IA9Ydo4xRuCb6
         wl+xSZBk+oaQaNEzCJO+rSZ/Espnxzya578vu40RaE/pD7JHAgRY2crrq/4LVYOK1b+6
         ALfQ/D63tRMBSvH1v2OMiavXLBug0cwWNX0WRiWSZirtu3o0IEj6ubIvhWml5HSf/8kn
         Di8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Dml4vJCRKxCVY1uFtRIPG5lLzhQacgo/ZMSZt5sIQXk=;
        fh=NPRSV4VBEpK7l5hwP+FVzIstNZ/0tIxs0Wgh2HjQ5b8=;
        b=XAMiivkxkDP8iNHd7fqjLF6k9pcLxPf/lik3sdu2nqOGQkHGOJ2M6Q8QX4H63FrVZw
         NTwstdS4KLOh+I92CVjU/8JOSFqQg42Q+2W0ml7/KXzAyxzccq7RtNqAZYYO9FuiKqoy
         0nwrPSPSkOKTHY80Y2eGbPWai0A295MB4ZWDWLuT+dzFYHbPI6lJvPM6iDUouFZPFiJS
         CUzepfh0fdeK5uk+DPAJ6VFHrgcZo3UYHE+Ho3YMOPlrSlmQusZaq8NngI3sTaiQkdWt
         lxeLMzCRioMxThYsjHy14wqLQcNm3wuHUyotB+7MylbIAfMEzQXTWs8eCAniQlOeWY86
         gZLA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L5aFpv6H;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id md23-20020a170906ae9700b00a519d941850sor706772ejb.4.2024.04.18.12.27.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 18 Apr 2024 12:27:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L5aFpv6H;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713468433; x=1714073233; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dml4vJCRKxCVY1uFtRIPG5lLzhQacgo/ZMSZt5sIQXk=;
        b=L5aFpv6HagDGBboEGkj1QKNzCYF14FRkgb6qJEH8OICndnFSHkaqaAr7dIMnbzJYY3
         tCgHb5NGsqhRCIALf0zgjKjRvvqQuXk86WgiDvwu6Z3SdUXJwpyRZyp8eR2fHKdXIXIt
         ic0U66Gj39KyZUrHbi88FwzWZ4YDI4Y5rNzMsyJlwu3Tsaw5aQyvdTyRhV3lm/uUkLw1
         3/0LzLrik+p9zQWNH1oaipNbWZYGszn4XelzOEGRNH9LycZUMlW3sHpcIPIWlJoaNN0Y
         O43tLyWs2wgUz2Nw9RLYWhkS6Z0A2kjUg1fy78e+2ONbHZJRK9/PinQF09UB2jdi1YDO
         L/ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713468433; x=1714073233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dml4vJCRKxCVY1uFtRIPG5lLzhQacgo/ZMSZt5sIQXk=;
        b=CAmkeIukdTlg4iF5WHjrgdcpIt8ELLZES/HQseU0G5/D98xnYPNbFXRsvY5+gfDZxD
         UZYdjbawWzDSvm2bWfDjHq01gIEyaXGCFu2P16Xi4pzLOa7wc6gyuB3D2fps7GKridKB
         TCpeza5GROy/iKwnpPINdsvbyfwKHL86o1aCgdnGQJxq5ftNW3qnIfcmPRItbJom6Z6k
         UnYUgD4KtxtOtJVQ49/hOun/fZ8KXC/f//No4/VHMQnPp+LFgapSI5EQ+iXa3eR3e9y+
         EVQjMjfnlP5XqYbBoGTQQKyKBPEZuAe4yQr82m0JsMtNVirDL80rYWuF7kmTMY30eJbV
         hNjw==
X-Forwarded-Encrypted: i=1; AJvYcCXyqycLHHe2w96G7XKsrfZf5YvBhYaHMJktecmJZNNs81KgRe66ZZYcSV2M7aS2IdZxs1VjSivO00XSCiU2KvrHHW7roAZB
X-Gm-Message-State: AOJu0YwZ02s/K53MswXjzkwjnlcMIXxp6PBWoqiUUeApu2g7S+SIV8mS
	93Jj1bW8JVY+TMsdwa7x7ppehhI8VmxsB3nKgdQhqRLivIWdqP7ooEop1N2LSzI2Xw==
X-Google-Smtp-Source: AGHT+IErWPr/zfg0WmvCw3RKPanQkeAYRatbBUwaG2fx37IV0JpOFdDvX+lUOlTZSWvTHHNC9ulpZw==
X-Received: by 2002:a17:906:6bc7:b0:a52:13ee:8124 with SMTP id t7-20020a1709066bc700b00a5213ee8124mr59241ejs.35.1713468433364;
        Thu, 18 Apr 2024 12:27:13 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.151.213])
        by smtp.gmail.com with ESMTPSA id x16-20020a1709060a5000b00a5575c9d5b4sm967734ejf.63.2024.04.18.12.27.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 18 Apr 2024 12:27:12 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-riscv@nongnu.org,
	David Hildenbrand <david@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Anton Johansson <anjo@rev.ng>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Warner Losh <imp@bsdimp.com>,
	Kyle Evans <kevans@freebsd.org>,
	Riku Voipio <riku.voipio@iki.fi>,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH 15/24] exec: Restrict inclusion of 'user/guest-base.h'
Date: Thu, 18 Apr 2024 21:25:14 +0200
Message-ID: <20240418192525.97451-16-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240418192525.97451-1-philmd@linaro.org>
References: <20240418192525.97451-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: TGukmPcu7zAu

Declare 'have_guest_base' in "user/guest-base.h".

Very few files require this header, so explicitly include
it there instead of "exec/cpu-all.h" which is used in many
source files.

Assert this user-specific header is only included from user
emulation.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20231211212003.21686-23-philmd@linaro.org>
---
 include/exec/cpu-all.h    | 3 ---
 include/exec/cpu_ldst.h   | 2 ++
 include/user/guest-base.h | 6 ++++++
 bsd-user/main.c           | 1 +
 linux-user/elfload.c      | 1 +
 linux-user/main.c         | 1 +
 6 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 027f19e052..e75ec13cd0 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -65,9 +65,6 @@
 
 #if defined(CONFIG_USER_ONLY)
 #include "exec/user/abitypes.h"
-#include "user/guest-base.h"
-
-extern bool have_guest_base;
 
 /*
  * If non-zero, the guest virtual address space is a contiguous subset
diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index 2c5a0a5c81..6d47d3114a 100644
--- a/include/exec/cpu_ldst.h
+++ b/include/exec/cpu_ldst.h
@@ -73,6 +73,8 @@
 
 #if defined(CONFIG_USER_ONLY)
 
+#include "user/guest-base.h"
+
 #ifndef TARGET_TAGGED_ADDRESSES
 static inline abi_ptr cpu_untagged_addr(CPUState *cs, abi_ptr x)
 {
diff --git a/include/user/guest-base.h b/include/user/guest-base.h
index 1e42bca5db..055c1d14fe 100644
--- a/include/user/guest-base.h
+++ b/include/user/guest-base.h
@@ -7,6 +7,12 @@
 #ifndef USER_GUEST_BASE_H
 #define USER_GUEST_BASE_H
 
+#ifndef CONFIG_USER_ONLY
+#error Cannot include this header from system emulation
+#endif
+
 extern uintptr_t guest_base;
 
+extern bool have_guest_base;
+
 #endif
diff --git a/bsd-user/main.c b/bsd-user/main.c
index 01b313756e..29a629d877 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -36,6 +36,7 @@
 #include "qemu/help_option.h"
 #include "qemu/module.h"
 #include "exec/exec-all.h"
+#include "user/guest-base.h"
 #include "tcg/startup.h"
 #include "qemu/timer.h"
 #include "qemu/envlist.h"
diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index fc60c01d57..9ed4baa2ac 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -8,6 +8,7 @@
 
 #include "qemu.h"
 #include "user/tswap-target.h"
+#include "user/guest-base.h"
 #include "user-internals.h"
 #include "signal-common.h"
 #include "loader.h"
diff --git a/linux-user/main.c b/linux-user/main.c
index 149e35432e..94e4c47f05 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -38,6 +38,7 @@
 #include "qemu/help_option.h"
 #include "qemu/module.h"
 #include "qemu/plugin.h"
+#include "user/guest-base.h"
 #include "exec/exec-all.h"
 #include "exec/gdbstub.h"
 #include "gdbstub/user.h"
-- 
2.41.0
