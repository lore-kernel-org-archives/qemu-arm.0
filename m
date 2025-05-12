Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp45094njb;
        Mon, 12 May 2025 11:08:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXjv8cZjcaSVPtsu9+kF+D1iV0ckyhDPaJv41zsGWgL3rnVUnmQvrLtF7x9lTGX+2mdJMHAmavhQZeZIg==@linaro.org
X-Received: by 2002:a05:6a00:3cd2:b0:736:32d2:aa93 with SMTP id d2e1a72fcca58-7423c00942bmr19386476b3a.20.1747073332829;
        Mon, 12 May 2025 11:08:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747073332; cv=none;
        d=google.com; s=arc-20240605;
        b=C6TgzIciwg/zYCStbWIiwXt+91c2UfsJ0b8ffjj+XAwAvffwjry8nhhI6bOhrv2nik
         QdIDwoorpJkulys50bskcQUaEag10K3SjHaxbAAvOZyB/q8+86ZlcsD6Nz5XLeatxxMx
         5mClapipTHjwrkBVqvLTj1Cn1xjoAF+i8t7XB7D254YFmi/uHYtxuz6XDsE1FdLYO4da
         s8J00//3vTFPlCL7WH9IZyAN1kQlShgxd8E2H5ks6wr/jq6kXgMi+rIqg5FMzYv1ylwQ
         rjBFsJh81olDvS0086CduDLnP/3FKFAvyvcus/JEbGT58/xHJZybhuzfEyZJY9Turfgg
         sAkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=45kfheSbx4dAVwou8HhqFlnvbUQXjacWSTonOtivRHk=;
        fh=fr25GKbVyCP0UdVCS2yNc45F5hJMiDLxTO4r8jUAV5g=;
        b=P1Ej/NcY4R6QPViVBNzkxkJYS8PYdKxUpqJnVu36G0RyJOCe9Y+0VmFmWQqUmzhoTH
         c7SP10Rvd5K5pTuMzVj9J8cnvWXw/0sf2OGlVIYXamL1z0ghBO0ROSGJbvwX5R/0MiQJ
         riySNudXigk0+Vrlzx1e75Y1si9ZHFnzJceMB3QiNrffFSEUpmev/UMKW69vk8A31ahk
         HZs0gKug39ZdbWE9edsUzEFmY1N0V5KPzA0r6tTe+sl8E1rIBszwP1kD3vJ8J1SJe3ft
         +u2uAAaLbZy95g/Y0YYDq7THQGNpDGlpjqos0hDVmJck6U1ztlujEjpdJZ6cXbub7ZJL
         z6dQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rv1Kaf7S;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-74237734bfbsor4696227b3a.3.2025.05.12.11.08.52
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 12 May 2025 11:08:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rv1Kaf7S;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747073332; x=1747678132; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=45kfheSbx4dAVwou8HhqFlnvbUQXjacWSTonOtivRHk=;
        b=rv1Kaf7S4BbRNsRn82SUg76zmBuEefJyD2Zv0SlqL8sXJjkionv8IrVCcrJ7+aPPDX
         zopDIKxuXunIsXTJnK/VVxzY+/vEpvcFA/vt9cP8C6yQbW4q9WtCs0dmWIVEV5LjFpsz
         naAVPyyazWS8NdPQSzp8lCgtZONxg46wrl3P8GmQMfttNI0TetrOYKrpVHsDe8+Dxldh
         AaUbWO51acckClOy4tzku4qTbmMbhtJMnOLDEnKKnSYKPelNexZFaw3LRsQgehP1nphI
         v22cBe92saQq4pklnxGHvY5p35OyBIi6uykk2VyWxqC8nWi8G+nuTcXXISAcxdZ8Cb4z
         bjuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747073332; x=1747678132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=45kfheSbx4dAVwou8HhqFlnvbUQXjacWSTonOtivRHk=;
        b=Sjkz25FKZIHcectumf3CuKqd5dFz3zmydJOV5KaBGgUCJanMxlAWD0g/mI+ei9dBed
         0Qm7JQYeIA53qfN9fjVJVo21h6m2j9/hNgKbv3QvpF3cD359rz8vvhCZlROnLGioaQfY
         xbOvrp1cQ2LSOqr4V/Aiyck6UiqNaZTz6oPGFEIZW1Q7h3pEb+hlOclf1TobO18/hfEW
         Tp4iG9HK0fvGxa6zxu79bNqBC6lXVuJ3tSxMPPCZexpF6UgKTFq8W6fgSSCp7ERytY7Y
         MyjWYrQfcgPVVPIVK//LYASl9ccFJh0E1oHKRCko78bjaVoL5eCUJ+zx3hTQdyrcIcBe
         MlUA==
X-Forwarded-Encrypted: i=1; AJvYcCUTdLnkFOpGEccbahVC9XfuJScjQhhbjiKSAXy/ODc5YX2m8M2abU8OYST5ZgF3VZiZS34eWUGpGmJ/Og==@linaro.org
X-Gm-Message-State: AOJu0YwtSQr41l+agLMjUJo539CVIsqF3F3e4sZVKX7X+MRxlG2KerBU
	rJjWPzE7Drb23GBxihcqNsIIq7WGwARC1F1n85Jk/lEWWYHzpzXLaUsVbme0haJSFQ==
X-Gm-Gg: ASbGncuR8VgoFXAiammGnja98cIZ1NI5bjr8DvjJ8f/OgP+llzCuv3AcDfKq5+OVHNS
	7Lij4htnXoaFNHxKqBQ3ObwYsgk3y60MrcvmqFDhvyQ4L6kiFcpBD+jsNNwiILedQbVRSSC88CY
	OnuRfbkL2jWD3sYVVQKXjzUm/N23G3cSmOODo+GDs3vK3IgAHWerDje5nKbFNkuxOdbOV7QMXyy
	08Z25YDIfe121cYwl0ANDVF1RAu2an10Ho7gkN1vL1C9kWvzSxl+/mNa5vwoOix0YTqZwLUPNN3
	ExwKkrmY5YynKcHG9gWNsD5XwMFHAmJ6BhD/p8GLx/ecpHVwvbM=
X-Google-Smtp-Source: AGHT+IFhUEj8B0jzi2eY3hecuRh90QxHVyJSzWdBkDPS+yb9VWe1l8ymSiC5MeyMfg79bhe3uOQ8HA==
X-Received: by 2002:a05:6a00:a16:b0:732:5164:3cc with SMTP id d2e1a72fcca58-7423bffde33mr21159796b3a.19.1747073332366;
        Mon, 12 May 2025 11:08:52 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237705499sm6438580b3a.33.2025.05.12.11.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 11:08:52 -0700 (PDT)
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
Subject: [PATCH v8 40/48] target/arm/tcg/crypto_helper: compile file once
Date: Mon, 12 May 2025 11:04:54 -0700
Message-ID: <20250512180502.2395029-41-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
References: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: ozgKyqPa9LKX

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/tcg/crypto_helper.c | 6 ++++--
 target/arm/tcg/meson.build     | 5 ++++-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/target/arm/tcg/crypto_helper.c b/target/arm/tcg/crypto_helper.c
index 7cadd61e124..3428bd1bf0b 100644
--- a/target/arm/tcg/crypto_helper.c
+++ b/target/arm/tcg/crypto_helper.c
@@ -10,14 +10,16 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/bitops.h"
 
-#include "cpu.h"
-#include "exec/helper-proto.h"
 #include "tcg/tcg-gvec-desc.h"
 #include "crypto/aes-round.h"
 #include "crypto/sm4.h"
 #include "vec_internal.h"
 
+#define HELPER_H "tcg/helper.h"
+#include "exec/helper-proto.h.inc"
+
 union CRYPTO_STATE {
     uint8_t    bytes[16];
     uint32_t   words[4];
diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
index dd12ccedb18..2f73eefe383 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -30,7 +30,6 @@ arm_ss.add(files(
   'translate-mve.c',
   'translate-neon.c',
   'translate-vfp.c',
-  'crypto_helper.c',
   'hflags.c',
   'iwmmxt_helper.c',
   'm_helper.c',
@@ -63,3 +62,7 @@ arm_system_ss.add(files(
 
 arm_system_ss.add(when: 'CONFIG_ARM_V7M', if_true: files('cpu-v7m.c'))
 arm_user_ss.add(when: 'TARGET_AARCH64', if_false: files('cpu-v7m.c'))
+
+arm_common_ss.add(files(
+  'crypto_helper.c',
+))
-- 
2.47.2
