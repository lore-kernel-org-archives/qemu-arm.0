Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2779821njj;
        Mon, 5 May 2025 16:24:17 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWGxx96C13jDgprkRuYrPQQaWa3GXto43r9W4zuwu8EJli7lQdtGYKDwoe2lDZujuAUU/m25DI4gwaA8Q==@linaro.org
X-Received: by 2002:a17:902:f541:b0:22d:e57a:2795 with SMTP id d9443c01a7336-22e1ec37a19mr104418735ad.47.1746487457315;
        Mon, 05 May 2025 16:24:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746487457; cv=none;
        d=google.com; s=arc-20240605;
        b=bWajw8cDRuN0VDwwC0ree+9i5HHijm/6G/0adyhbunHEvIEZ5CIRrRT8UJwT6bwtDs
         UwhIJeL2BfnhBp5fj3OYz6WrV8qql3JMncKEaRxHWLRSs6CC8HMpoRopEi12ESelik+7
         dYCYygGwi01C3bnZAAkosQxbQm+Dbo8gni+z86fM9G3CsM4Th1Py+oxRHd1ldx3NMmkJ
         xHOgXoD3hVYnrVHiaa6Hlf7jg0KmIOFBpuWuO7ppj0fa5GS45qFsDYGgTHppr9U9kX2n
         cNPk/7to3Ay0SroIOm2Q7ps0GvfuCT9NTMlG5jzCsp8pHxWGSDT5wOBtcedlP6ORXg1W
         wk6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=JZyZRD3+F1iwfSbHdRXdy1kvrAVUcrfC5UGzBivz9WE=;
        fh=R6uS5k0xcPBD6tgmM17Y3qD2H+SZelA6tK9zeO3KcmM=;
        b=LxLKmQRVlY+Bysel/M7ntcJ5T/IZ+iAbszqw/uIuN4zE0Gk8myQbfOnL+7cdgN+Bpt
         PEPkafFTsETmj2JBsXtI48OfTGhxC9QSyVgSEXB5WKarmlhpKQs3ZeHX2JzaELTNB1Fo
         fOvipSeDMonpHf6+3sFFnqGIhWrRt9esepFVGb1V/ekqNhnhJaU5k150UgeZ/yZ8RbmT
         zOXSLtsy7iYZJsEIJtJU6ufhnyq4f2rdYhsibe3hfbogsQSdjSIqvxSwczKUR71yJ50R
         e9b1JyNlzfUu5SstvEXAZdHVW4VR7LOfklBN7wBXuNWSjZosqpBhutCMgENi8vzY+/rA
         jfuQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AKcCRTM5;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0bb1943bsor59512185ad.4.2025.05.05.16.24.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 May 2025 16:24:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AKcCRTM5;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746487457; x=1747092257; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JZyZRD3+F1iwfSbHdRXdy1kvrAVUcrfC5UGzBivz9WE=;
        b=AKcCRTM5gnkKDA7ye2ed5OBAOJfP4cgrknnGufZIpBsqVHunDMcZowpV5Tb+NvJ0jv
         jnmPYZE3pZd8CIBttAvKjW+IoKFDTQtWEUIVW6L3MJJoIU1LdeqO4b7icueP0XChH6bE
         ckOLe5n1qbPdAl+qwyBXuJUMbMpBIaS6lUXCgXlKMGwcKbw8TEs3qni1gLOZj2ILsOO7
         cq8/87iVCKBPaq0XTyx1q1CbabgxtH6jGgRlvH+77BX8k9FZ0ClK4E4wJhPeiXqD3+C+
         zwELFr7FJpfw6eT5iFT0jXblo+XahkvFlbbFSzfnL/WvBvPQNzVT5S68V8CaiO/8yVdu
         koTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746487457; x=1747092257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JZyZRD3+F1iwfSbHdRXdy1kvrAVUcrfC5UGzBivz9WE=;
        b=UKN7P2MXX4Bo78Va9rnycwL/t0SZ5gVcsq7hlg0aNGL28/3ktjAu43Qd5Fg5FOVY90
         gWMT2xuvsrf3W5fdWtdl99JsHpBQdZ0fdaxgjnTfrpyxybTnIsueCygJVrXpvx3WLMgG
         zu1EMcULDb0V52iTGf4ODea6ojmSxis328MaPyKMCEYeM+ps52lDLt7raKctkc1c8JJQ
         Lcy6O4B4eWm4ILqX8fs+O3ki2mr4OK0kwis3NAh2+vprwkaEVQz8HEnjGeA4LDqf0v7a
         +eMA9ygsmzg+TnlCKfv8uRANriqTElmOgjfpgMibuvHVH2TuVjzz0uJEGa5MVN3to03L
         DoKg==
X-Forwarded-Encrypted: i=1; AJvYcCWMcTfpw4k/wCxl2ed3ZJAfXfpSd89Nf4xbPiLF7iiil3M0Zv+qD6ejOMsBikoZ4lYjxXob98ykzZUvoQ==@linaro.org
X-Gm-Message-State: AOJu0YyxBf9ZHoa83v4rUWGPnJi41gfIvBgDY8U9V7j+FeYUnhTB53Wm
	MGliEUr+v1ctEBaqvGIjNv0WpY+TezrbKZBCfmORlQl6QC6FteNEvhAdeVYhmlH/Ww==
X-Gm-Gg: ASbGncsCGSGv8dQX3HyhWpFQ0A/z0HXSuSUx7l/TIRigmG2ScO2wIMf0Jwh8Lxuasb3
	0xeGO+r/vW6sZoFQRILj0seP6JmCj0+t09cj5yoaNvOymNFXFkNkm/oSpCXK7C/OGINMxx2CFYL
	A9LEI6kR/uwKR19WbPvNYESC6s1F6DqkPtcO6u8jgYInYgFg61J6/DxN/JpJSiWAXOjaqkb2TsG
	o+NXb1advSFxY9DnDtWxCSc5sJySFcdnJ7KrIYbraf9dnVoIm50Ej+TFnMxE+tTqiHV4Tn6MaCe
	cqDxl+ilXom4QzEBu55flDdr0XzFvJC7+hnxaQm/
X-Google-Smtp-Source: AGHT+IFEA4+6Enx3vNjJJnWRowlGdPJWotti1f/99w5zc3Slf+B8+XCjIsdF9QTYHlr+hw5AzkI5eQ==
X-Received: by 2002:a17:902:fc84:b0:223:64bb:f657 with SMTP id d9443c01a7336-22e1ec35548mr130085795ad.46.1746487456895;
        Mon, 05 May 2025 16:24:16 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e16348edasm58705265ad.28.2025.05.05.16.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 16:24:16 -0700 (PDT)
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
Subject: [PATCH v6 50/50] target/arm/tcg/vfp_helper: compile file twice (system, user)
Date: Mon,  5 May 2025 16:20:15 -0700
Message-ID: <20250505232015.130990-51-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
References: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 3O+69wR6CJQL

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/tcg/vfp_helper.c | 4 +++-
 target/arm/tcg/meson.build  | 3 ++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/target/arm/tcg/vfp_helper.c b/target/arm/tcg/vfp_helper.c
index b32e2f4e27c..b1324c5c0a6 100644
--- a/target/arm/tcg/vfp_helper.c
+++ b/target/arm/tcg/vfp_helper.c
@@ -19,12 +19,14 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "exec/helper-proto.h"
 #include "internals.h"
 #include "cpu-features.h"
 #include "fpu/softfloat.h"
 #include "qemu/log.h"
 
+#define HELPER_H "tcg/helper.h"
+#include "exec/helper-proto.h.inc"
+
 /*
  * Set the float_status behaviour to match the Arm defaults:
  *  * tininess-before-rounding
diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
index 7502c5cded6..2d1502ba882 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -34,7 +34,6 @@ arm_ss.add(files(
   'mve_helper.c',
   'op_helper.c',
   'vec_helper.c',
-  'vfp_helper.c',
 ))
 
 arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
@@ -68,10 +67,12 @@ arm_common_system_ss.add(files(
   'neon_helper.c',
   'tlb_helper.c',
   'tlb-insns.c',
+  'vfp_helper.c',
 ))
 arm_user_ss.add(files(
   'hflags.c',
   'iwmmxt_helper.c',
   'neon_helper.c',
   'tlb_helper.c',
+  'vfp_helper.c',
 ))
-- 
2.47.2
