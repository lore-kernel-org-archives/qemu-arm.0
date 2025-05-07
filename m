Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp95660njb;
        Wed, 7 May 2025 16:46:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXc4P0Ox76X1Hp0gvSOXcuEMX8BBGYdX0k421bvvn1iu7tP+OBjHveomRxbsZ/IDgZMKasDqJv73ciyYw==@linaro.org
X-Received: by 2002:a17:902:e5d2:b0:22e:4a29:629c with SMTP id d9443c01a7336-22e8f0b60d0mr17223765ad.47.1746661614823;
        Wed, 07 May 2025 16:46:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746661614; cv=none;
        d=google.com; s=arc-20240605;
        b=CPaaNDliAUF5UxV2fwELBLMI9ZBvel17n3lZrwzcp3/WHyI+rswZ/8RMHWJC13SNMP
         WcKeYO7wRukVgr6553JMSgcJZ2InuT8WIJO/hTZ+5IDNzVTRNFRiyyj+T8b48+f0oeO7
         JhwFOJqmOD67LYb6m3vRwk/2sqkd/m4ObaCBP9gcIZ9D5SyvU0bd11gw9f4uwAjOPpat
         HsPWKJtVgkhngei6UzwHYatgnqaYy2CyMWR2o9lfmG5Pt7lMj3PbLtkVgOjZLqzTY4i+
         g6dljIfAntaPlFAvo8B5Ulg7WnIVyfFW6S3NBxVLYSjhlGi8O7L7o54Mzoowl1VLOhvs
         3AWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=rsZT/scaGxab+Vo7Y7hWrcYUC7iBy9GgtXflG2/7Eik=;
        fh=gMXSaUIIcBjjv0r2Mo20ktqNEMe/FgAYtnIx3d3XpxU=;
        b=Nn9rxTcC03JH3yxmRorQobd3v2qW19x2LmJgFlAjJDedsQ2zXTw0c2KrCCVf/DLtFH
         NbeN6pkA/0ia6uDjJMX5Pj0z/bewcFnFu+2JV/l5Dy21X2F8q/wpn+fhkddjk+ep0HnS
         ObHGvQeUIehKdQoBnbSAcF/3xWxp+/hixjbdVVeS63XbhTIp3DP6KS4j88GOMTfWmQPD
         SZZQ7nhRuBfIUQjcGOhUf6jzuXMSKo1d1QQEk/cAFQnE7D8mSd9aEyVQVoRmnvrsNQ5u
         S3rMXXS99hXPc92Mm/jTa5zVlcUlgXW08BIZnQcGeKafNX2Jgn2cwZrmxV6ImpEQJl6m
         6Blg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IoV21u4T;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e62f26778sor23254395ad.15.2025.05.07.16.46.54
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 07 May 2025 16:46:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IoV21u4T;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746661614; x=1747266414; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rsZT/scaGxab+Vo7Y7hWrcYUC7iBy9GgtXflG2/7Eik=;
        b=IoV21u4TvxSDeI3v/fXJq5m4iSuquXRytS/6cSZyXT/bVCUrTPKNxMIiGMrMW1lpwf
         axG16CjOA2RQoIUStzRCVq+862lFuWiPq0K5UYN3sxSIXQTSUg8dXsrvApYVF2UH5MrM
         4wFNaAxo4Phg6tlnJxELbjKdn/oQuTNLnaGWYeMqOBwWfV1spWYk6e9SX2YgD3KhAq2V
         QyczPRurOKYbEuY1KXIi/5OGErqSD3Z3ydcQzL/58voCBIvbeVMPzTZFSUvXrS+Sygro
         OD6gSHbX6cxTpmjiluXDsMt2FxKToReYXGdUAhkBrVfWks9fUiYjyAp1F8O69LGTqAwq
         cNUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746661614; x=1747266414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rsZT/scaGxab+Vo7Y7hWrcYUC7iBy9GgtXflG2/7Eik=;
        b=YCHixkNvZEMNbET5baJ6zKPGinfG4VaqDrzO7lU7wRkGcq3C0hLHdfJyiBT+CddnAT
         EhGISxTCN3OeXWI7hcvT+9ctf/2hb3Lq1b1zTwOu0mNZcvUcpoV2fjrXHgfZp3WRpcGp
         XJdSHOTZTw9Qoj4xWkza+0CnXvhHI5/Xh9GCfyA62EIrqQbGVOezyu/tTuqhq0e1AR7f
         aVfmnuKV6i7h777FQEi6EjwtvzuGv/syBixdMi3kz8+N16VOtbcR0L42Cawrxe0zVtK0
         aZf2GxXPjSGVzt507n8BtgI2oiD8DuZ+QJ4Z49m3q0qYm68FwlQ/7P47Fc781ZHQhJYR
         S5SA==
X-Forwarded-Encrypted: i=1; AJvYcCWkSJu8eNT+ylULMkW1u5ahRgWE/PgJ42iiCRecV2+V6o0Zteg2atDwtZXjd8H/LT3WAqPrP8qIOoaXZQ==@linaro.org
X-Gm-Message-State: AOJu0YyXC14+EwmoZ/P0FllPAIvQMb0uTtqaGI2apXNVzPNApl4bt/kl
	rWaq+cZW1/Eu0raFozrMX9UTQMCjRrFoyOBHtjU6NAk+RvncICIrEt5W1MhwV+a7SQ==
X-Gm-Gg: ASbGnctrCvTzGUbubE/7tVniljfOI8ocg27lK7mgHSMW/gsmF7uQTMYwl1X2ClDTDD6
	EGfhhTJJAOhTi/hesB9UkXZi+RkzJij8STR+EoNkw47C7Z0MpZKrxOg0/Jgh9gzzXtzxn237U0d
	987aRPUMA51QEzL5navYOWNseDp4SrrFQw+F+XztcsLkgm5l6NfJVXyTn16Xf0WpPGYBoJZLF9e
	v1zlih/umEEyYOUm2Q+MbXT7rw24isYtElT15sG/ylPC9tWSWDOXmvNAwqxGBvzDA0HUAeEZua3
	aZw2paCDNZcklXHpB6WDzxRtCU34F6AkGgOaB8OQ
X-Google-Smtp-Source: AGHT+IFL2cEF8uWqAwFWksJ6sodfxO21NIRA2iSBkFtqqdnEK0CiHPjzx/0QR8TPRq3IFPVB09ZJeQ==
X-Received: by 2002:a17:902:f60e:b0:22e:7c8b:7e66 with SMTP id d9443c01a7336-22e864ee727mr14841735ad.26.1746661614429;
        Wed, 07 May 2025 16:46:54 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e151e97absm100792435ad.62.2025.05.07.16.46.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 16:46:54 -0700 (PDT)
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
Subject: [PATCH v7 43/49] target/arm/tcg/iwmmxt_helper: compile file twice (system, user)
Date: Wed,  7 May 2025 16:42:34 -0700
Message-ID: <20250507234241.957746-44-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
References: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 4TZ27K1SjWGN

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
