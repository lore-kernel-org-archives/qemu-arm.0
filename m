Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp45123njb;
        Mon, 12 May 2025 11:08:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXHvORJID8pOgfDGSY88hua1ukvurn1oYrIGbQVDeU5PiWOeQ+HtDNVnYhjraBKHSX1pQDUaq7skg0U1w==@linaro.org
X-Received: by 2002:a05:6a20:3d8f:b0:1f5:7fcb:397d with SMTP id adf61e73a8af0-215abb8fae5mr14703035637.16.1747073335420;
        Mon, 12 May 2025 11:08:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747073335; cv=none;
        d=google.com; s=arc-20240605;
        b=cVlyYFR2aQ2pt70+LsWs/MSjmBrJzMVkLY//y6Mp1nacmVSV14jPlVEToUlkAf6t7D
         rBzUEnCg/Vg4qoBFPfEWxYcLJaDo78WcAjcuABeQvUHMk4c8M91L7xk3PbIx/T5kmfsP
         jj+kQ/ibc2sj6BqZYs439tokZRZlSGu+lwU5HrOrkNj99ua/KdIE0YjJra/LaEX93v+D
         c0xdIh/mVW/hUl3kf0L8lGItFGyNoX5IsKyJtkrpQhUeXb0HXlQewrfil1OZH/p7aAeN
         ZBZV8xsSD7rcj18ZeZBBLJwWd1fD949iCvIYQClOKXfAi9L9f3mXxo3VGw3By34zTw0Z
         uzug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=11Q55+gMF5u6Eo9NyNW4V+s1ceVG/+YyEcTpuHMGI4c=;
        fh=JwiDcduoIdQC/Fh5P1IrvCXCyNOxGEPiY6UKljj7tB4=;
        b=PeIN97uWmGFIc5lTcKPkS+oInUinafgLC54oRpnU0R1mYAZD8yO53HMaQqyHItcpny
         C2YVJWwZ9BtMmcoqx+PYSW2VuDTVSnFvjxwoQPHQ5VtuoK3AnyJ9gADakP7wKkhHxHUm
         OwW6gG/5vXlk4IOxQnDCuDi67kKulhnQft5SiDPPcJ2wYSq8CR1pmmbAnX/h7SvmMUVn
         3sQNj5rXB9jmK34rzD/Z8Hex2RxotkTomhkMyDB3YJCJ4YQgvpsH+chDes0i22/ctQ2U
         +gTTwVS823DOVfBQ1LgjEdINaVimZb50OfVfTnDWQLyhZzJ2C9X/dPN3ONiD4+NkEAUS
         eqSQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rpxYXth4;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-74237a74ccfsor4633206b3a.10.2025.05.12.11.08.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 12 May 2025 11:08:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rpxYXth4;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747073335; x=1747678135; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=11Q55+gMF5u6Eo9NyNW4V+s1ceVG/+YyEcTpuHMGI4c=;
        b=rpxYXth4sWACX/0VgkaCor72D8Dmr7fcYJgtu7rq35qrfB29sngaF+pqzLKLDJ3A2l
         FYS3XpIBbZVE+YoSzfOQUW74NGiYIWXUWZ/DZfucGrswkQZXJ/7wZjpQqNMjTDlOygAA
         W7uRScn+QyG3yU0mf8K5ju3kxp+rNuzo5EP7WiDQkkPkCZ/Bm+rQoCWrT+n8wviWAQMf
         kGshBMxQzkPc+/8yo6NTSy0t495K/LwpfmUtPskwuhxEpFzRplWh/jVbpiZiFS8lVsuZ
         uyQQp2AUhm/WIWSGzygVrAagxWBCGmfmj07mF5TashJjpGVTdU02nljOjoMwK1eGZrSe
         eKlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747073335; x=1747678135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=11Q55+gMF5u6Eo9NyNW4V+s1ceVG/+YyEcTpuHMGI4c=;
        b=SGtOIH8QzdHdcgm2rVCdXiVJafuDA3DhDmmlVV9M6T6QnNfbMEPNyw9VH6Jdx/4lz/
         GFOMRdiBpX2sTl015qvm2I77GvRoMkHNf16FTt+LYO8L8oYH37M7XWBukA32D0aOzf2N
         x95Hb/krRQ2U5ykkgC0wZPCl3W+8OKgxVB1sF/l+TJ+WKIsVh/0VwOJuhtgETuup62rA
         +aZHM86UJNTvUH4mCAIgK4XmBQrQzH5Re/Vohz6FPwEKTN6DKoIh98XyYVU3yiOSsec5
         Nard3U841jVngGmnj8kQlUHs2R90eKH1RZIBLsevZSHTnaSSnvOqvO9WNGqxbtfeUQgs
         L6kA==
X-Forwarded-Encrypted: i=1; AJvYcCWuTn3nw8vN5zJc2mMozNfAkN9j/IrKhB27J+dRQglGq7gWUbgWRE8qIWKY7dsIQIqUUxey6PgCwfekGA==@linaro.org
X-Gm-Message-State: AOJu0YyppcGFcUP+brRS9aQPnYQ2hck0FEIgUqEg4XKp5D5IMTQFqIUV
	EvcL4qkp5WndykYcG/z8SpmK65amrtWNm5ZX4aBEq5I26e96EaYffJAWi1pedqRawQ==
X-Gm-Gg: ASbGncv91v1St/xP2+sEg6leyVhRoA2xxLv4sWOYMofYCV6yb5SoH2n5Ax/PdT3x4lI
	pe/CG7Kt7ZPXPKQr8ynV6XaBGWmhm/qy+6fGXasOH5O7u/5Qlj34oUKc2JheER8uRs8LPagB03v
	cahtkuHEk25vnfnXGekgEeBW2RrJZfZmml9yOV3oduXl3nxtAGEoKnmrtjPUJK0v5otL8U3esxW
	albnfQHcAjdYsS3/9vjhnFTyEkYpb78UyEuzfA8aiAldm3S1PGVPKL+ayfKjtGbeuIOscskoJAD
	5aZTebGOhwNE380/8PK+rmdYIe8PqtL6Tyaix24chBVQGYj1XOA=
X-Google-Smtp-Source: AGHT+IHHZxH27Fblpk+T6nzSm6gwzWmiuunS0CeLF3GYhXIAV+SAz8d1QBV/IJKqUKfOEduj/U+Kxw==
X-Received: by 2002:a05:6a00:a10:b0:740:9d7c:aeb9 with SMTP id d2e1a72fcca58-7423c0737cdmr18544639b3a.21.1747073334907;
        Mon, 12 May 2025 11:08:54 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237705499sm6438580b3a.33.2025.05.12.11.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 11:08:54 -0700 (PDT)
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
Subject: [PATCH v8 43/48] target/arm/tcg/neon_helper: compile file twice (system, user)
Date: Mon, 12 May 2025 11:04:57 -0700
Message-ID: <20250512180502.2395029-44-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
References: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: hhXfTZWC4T1w

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
