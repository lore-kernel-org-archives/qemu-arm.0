Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2179881njj;
        Sun, 4 May 2025 18:56:28 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVjY8nbomqUAlkzeX8gg+B1Ue/wnWzf3T1hP0BYhDxD3CvG6Co2/vvvoEvGZ62QVcZ84BzrrqqszpyFzg==@linaro.org
X-Received: by 2002:a17:90b:2e4b:b0:2ff:4e90:3c55 with SMTP id 98e67ed59e1d1-30a5aec265amr10701384a91.27.1746410188080;
        Sun, 04 May 2025 18:56:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746410188; cv=none;
        d=google.com; s=arc-20240605;
        b=chXVfSVmIM7svjzRj9VD0lwDmg64I/9CjQDkPDayKjDJvL1r2P21J/qzbf5q3Xb/Od
         +yz6c5oWalo8GDNegFeWR4O5WL1SNMiveDrF3ygPCRvC6oTK586DXyfe2IXjQRqz+Mwj
         SAMjWjPoaj7S8GUBONpOhG3wah+g9QSkFHAsk11T+8Gy+7tVZPvRuDw0kyJ1hh6b1cw2
         SxebYcMQazlk7uGDuu+oTtTMchwJSl2CAYhyHBO6dvyuKDnLNo4OPXyIfBBWsBbvKraa
         Tc6xSHqnCtnEXxkXBK/FlLJyatjbxAsOi2VKHSWe9eCjysjseIv2rPhiuGYskWq7slEi
         tycw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=qD9vVqLBGjput0IZ+F6o4hs3gsnwUP4nuOaAH5o+vHU=;
        fh=CyD/aJDQTyRjgxdWoMQGzaiI6n3AUasgm1lUe3O3PUY=;
        b=fKk6gMrj6anqEyfGitoBC3KS3NJ+48/GJWLlCtS/mccsCmMIZ8CxyNfIsZ0JMIsPxM
         1eqO9QN1oaR8jIN3NUjpapXgvzzT1vLwAIGlFXR9iFlJUtjOhXG2t7XVPlU333FDHOyS
         THkFjOIv6/Bim+N7yGB9FvjoLOYZ43TSiKudetjroWMEgCy6pBnKaMKauRg/+ecUqRlV
         eGW2GaIlk9MyLMfoMDArxOedzoVNXtO61Uzz283NqcXHKIvGsQRyX5eD6i+2r1ymdfaI
         D8gwgVVJT7J+I8xiByNrXNoqfn9ayCd57/z1hHND31Cs/xdKZhQiKnaVXXxuJP3Ykz8C
         s92w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oQxMRvoW;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-30a47340898sor4336598a91.0.2025.05.04.18.56.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 04 May 2025 18:56:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oQxMRvoW;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746410187; x=1747014987; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qD9vVqLBGjput0IZ+F6o4hs3gsnwUP4nuOaAH5o+vHU=;
        b=oQxMRvoWWHEtCVCeTmZ1s5YFBhbA3J+p2y1Yg6r649IlfFN5oRA7B3i2axLu87eClB
         p59xJcbW0SlqIXfBqPq8YIVWkz86KngYCz5ik/6oMfW2aTQXWWWmnMUlREv7kcesKTOQ
         AGZgbUQl0n/RGJUT2dGbgaCeVtte3cRRa96W2J46yXtegKF0qhB/ndPm+fqhE7zcviCt
         8rX2F5CigUbhOiXoAsP65ILJ4mpiT18gEiqpv34w/0T3gGw2RHihiNCkdQYjqKL+ESPL
         TAqEPqZ/28tUoiiizk6aDb/86NC1t6z5e1E2z74U2G2KwAyBRtumjZk0MTSj0Qr4QTQ8
         knKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746410187; x=1747014987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qD9vVqLBGjput0IZ+F6o4hs3gsnwUP4nuOaAH5o+vHU=;
        b=p8dW17Yl+vtkXnE4n5Tiwfi6cj8TxPagYt34DIYUVTp2nt8YeJ2qjLce1GjC9pRPv/
         H1+biCvdMN+WkPJKW0JkMR+mkZL/wWdFBFgt3W7/dFy/J0g6FeAEPTE8tPCaTquosqJm
         xbC3FM3HlJwSLc4Gkr09SDUWywHDDOnp9FkqPnlD69Il5me9rpnezwllfpRGFRPM4VQM
         a9nNdb/xOUtIYTTvvy5omD0ow/o8PUOAotCK3y3GrMyPl08boBBKXMan4hw8jQ7aZSBA
         66eTx7XbavM/zEWJOK/9RB1M19V5JwlPXngDlSQ5fpZZo5XIvntOkcKtwyIy/FZpAd5P
         D6kg==
X-Forwarded-Encrypted: i=1; AJvYcCXZFMn+7PiiopmN9sHjJH21ZsvjmA0PGdxzn5PMH6xfukew10VO7r57zoXqJqkBdUuXKLjUjIi+Nbt0UQ==@linaro.org
X-Gm-Message-State: AOJu0YzvsFc8meozE41/serumhEInyUlJ/BFsmf3OLMTy3wGC+UMAEmx
	LRSYTK7tycRB0339mO9BNAa1VCt/ZM2wmOvj5Nf5gndJW3oSqVLXpRjGWJlTpGRSWw==
X-Gm-Gg: ASbGncteb3sFz3b4mktLfTrtRdO/RWBO0XHeWt3fGWwc3DK5wAaFPjp/EesfdjiYZnA
	DiGvJMVwU3DN/l+clJsXuYb9+KQG3Ir0TxWQZnTLNisvgSW9sV2hlszTRW6TaXWjQz9UMiF8pyq
	Z/K7F7qWC7szFKTeeSJLGYKe4LFbo8rLAk+GPANB9Dk/Hn3PXSqofHBTlntjNZK0A67w6fSypYn
	U2RhJzzn8nNutHQoHQbJuPSD2oLSgXM3zDNL8I/1jce0dk3noe95ff3XHacErp0PVU0N6Mvgbou
	IB2y4RiT/1HQxXFcpR+ldUMkomBqCDKkjmDNEhCt
X-Google-Smtp-Source: AGHT+IHd/AYNlC9/+eGUzUQbXsHjdxY4eWx9rL/q1NHWCF/Mmj/1cPsEHPNZmlSNg6CCopLTE0vdnQ==
X-Received: by 2002:a17:90b:5830:b0:2f9:bcd8:da33 with SMTP id 98e67ed59e1d1-30a5ae599fcmr10633990a91.21.1746410187712;
        Sun, 04 May 2025 18:56:27 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a47640279sm7516495a91.44.2025.05.04.18.56.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 18:56:27 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	richard.henderson@linaro.org,
	alex.bennee@linaro.org,
	kvm@vger.kernel.org,
	Peter Maydell <peter.maydell@linaro.org>,
	anjo@rev.ng,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v5 44/48] target/arm/tcg/neon_helper: compile file twice (system, user)
Date: Sun,  4 May 2025 18:52:19 -0700
Message-ID: <20250505015223.3895275-45-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
References: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: iTJYKXJtEd23

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
index 3482921ccf0..ec087076b8c 100644
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
@@ -65,9 +64,11 @@ arm_common_system_ss.add(files(
   'crypto_helper.c',
   'hflags.c',
   'iwmmxt_helper.c',
+  'neon_helper.c',
 ))
 arm_user_ss.add(files(
   'crypto_helper.c',
   'hflags.c',
   'iwmmxt_helper.c',
+  'neon_helper.c',
 ))
-- 
2.47.2
