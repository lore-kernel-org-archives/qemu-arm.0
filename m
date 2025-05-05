Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2779814njj;
        Mon, 5 May 2025 16:24:16 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUZbMd63QP+MF5bZWmm9Yg5rQai8OYXVyGgUoONzce/yJN5bFYKr17yyiXHc5CzaUL8WXcIP5CtP7pJ+A==@linaro.org
X-Received: by 2002:a17:902:c950:b0:215:58be:3349 with SMTP id d9443c01a7336-22e3279d4ccmr25406205ad.14.1746487456454;
        Mon, 05 May 2025 16:24:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746487456; cv=none;
        d=google.com; s=arc-20240605;
        b=aN7aQqSMrN+gJbuRLCDsGa8dxx9NsfL3gfh5491S0VlCUNXYNdOsNNWUzJQhiC/Wgj
         iIstFEFFzULQzxGdvF/mWgPHXp1qojjJGoj1z3ZTBeBkRfjfW7qtkXlTd12MN1s81ho3
         1dYXzETzDlGItyupQzgANn1YBCXCC9bB9maoBsNYgjgMpWr1SgZPvovq/UKVXtbb9G3Y
         yS18cR7DE1kci2sT6pWyZvQuWHJkwTwW/tNnmYVMaYwHpdYJ7wdh6qOIX4Wk2C34w9q+
         6yiwL3Q26lUrC6ouT/Q3pxL9uSmAZOXmUYJaY+I5XckyHq+eUpA8zC6RTUkEDl1zbQXd
         g1Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=D50FgSNi0pKqcQ8O05hlTOFeOSvMmvlw2mBrg4KVMZU=;
        fh=oHjPHjefgmNoCbmu9dlVp0EYT5B4kAkc197uqBxLZZ0=;
        b=iF6hSw6hYqKg9/GrxF2h6ApiLCJSgHT9oRameFEkwM54R+oa2dBW8cihKbCT6IDcSn
         /sBUKNzRhEfBoaJ9dx04CjBhuy/RqZqHIJPd7d124zbjrbp2L4EhLMG+fGbVTBN2otNW
         XfT4mI7uuD75exzefVf6UFgCHZYrlqD+oekHHMqBnZMD4khhNM/f6Z8g1US5/DeNQuF8
         5DqK7w8LoQoGQJfUR0MXv2cCP5U0hqiHL2Vr8YGZd/JfDTiWm7zABCxaeg2biEHDrW5g
         Tuqj9BQPQbQPnGYRBfOE+4luo8X4ZUSK7EeGC6xlOvgSZoan0vBybC91k69q1f7b3kHN
         Drlg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dLckB855;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0bb05e6dsor44180905ad.1.2025.05.05.16.24.16
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 May 2025 16:24:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dLckB855;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746487456; x=1747092256; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D50FgSNi0pKqcQ8O05hlTOFeOSvMmvlw2mBrg4KVMZU=;
        b=dLckB855WvQ6b0GUVnho2AxUC50+t9TWSevWFQEG57O0MBKv5V/K3ddo+zLv9EKbF+
         6ULztTsI47pmkBGXbMgrFbi+3v0EZpJfIhJ8cS5/Mb5H6nP/y4VpzzfOIgwYhwKX1KpV
         atAPIeWOaroB9VG0D6Sfm6y2mjsDrquAu2AO2kwLjtKfbmhpyMiI9LdwL82GvBTco5+w
         JZRkLfzFbUEejOENhshxVlqERnzo8xoT5yXGeKYPejujc/nXn0b7OaN3xvp9om8pOS8D
         2Y96NaGSzVbPWqjvl/bh/XyBTzBWuWlaPkETQeF0nzVQ7HdK66uJfNuXYGtQGT6sYENg
         LMjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746487456; x=1747092256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D50FgSNi0pKqcQ8O05hlTOFeOSvMmvlw2mBrg4KVMZU=;
        b=jkdN8pcvaDXpcyz53rmEiWlqdHu5+9p4y5Ptuum+sBkQS9rWs06Xx4x/y6LF/9Ds4x
         tQ4hIYMg7Xb8J499AVThhaN7UCqk5R0LKsBRSRMcB8wg7LC7h6PGCQJaiDJCO3Qaqz2q
         uxb5ZwQICc/0grCnzOWoDXWV5bLzGqkba+DJhzP6Zb4EH0j36Foxo9M5Ul6j7L9MqGoe
         800ppPya8pNl+vehwhDjEhQOMm/DltBIA7YW9XY8EqIrH2ibeD2FaazcGKThJzuxkVum
         YbEGVCNEdPExctYv3zDTy3vp1aNOCJ16MnaVXI6FkGBiM6L48RqQ1YH2Te/Xqdiu1Dtd
         0p6Q==
X-Forwarded-Encrypted: i=1; AJvYcCW4oI5qLfr05viVVNCLShsbLpcWP3uhNto4BRAD9mrQTxLiz7+in++atQ7x5B+eM0bBzz91yGkG17j1dw==@linaro.org
X-Gm-Message-State: AOJu0Yz4J0ThvlBE0tvs+KVHUQD5c/0A6B9NpQ+EcMn8ZUAO3EIjhGIO
	tl9Dz04k+YzJGzVDJ+n7LvqCaS8ti2Tbn0V+pzrK1B+PVbo+cpgD8aajZ0Uysis7Aw==
X-Gm-Gg: ASbGncuxLXc1mGRMBfMY3OWwauR7Xz43s/j6ZNIvk3gRU/3vwcQs0l+EdBE2+XA4j1l
	Z/acNehsUaFLPIFOZJZaGu7v8MD8OWnnAYmI5dFY+fS4rjFK+ss0I8qe/nb0Q3NdOI8At4wpub1
	vCkyuKMM8e8094PCgEkNKLLZ1WMl37n1PH4VVeKoWmGdFvWByS8v4RCcPvR8rUSYk8Y9hWUaTUp
	hWEFDixLeVbTeAIeY+PCyWVTpJiK9pFcfZaqvbQGBuAc6LsDNGjOZ7rY0Q6E4MfDp6SYEherKE4
	BbRsi7+8ODkVSQFdxOG+9P4yvOqdCvCh7A69NJFB
X-Google-Smtp-Source: AGHT+IEL4UfW/fNN2+1qFoskfy2C2PqX7WLykiEeT5Zb9TMUjzEO1zSNYPd1AXKmg/5TTMpRlWPNzg==
X-Received: by 2002:a17:902:e5ca:b0:21f:53a5:19e0 with SMTP id d9443c01a7336-22e327f74c6mr16808835ad.12.1746487456046;
        Mon, 05 May 2025 16:24:16 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e16348edasm58705265ad.28.2025.05.05.16.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 16:24:15 -0700 (PDT)
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
Subject: [PATCH v6 49/50] target/arm/tcg/arith_helper: compile file once
Date: Mon,  5 May 2025 16:20:14 -0700
Message-ID: <20250505232015.130990-50-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
References: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: X79S5QX27jsJ

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/tcg/arith_helper.c | 5 +++--
 target/arm/tcg/meson.build    | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/target/arm/tcg/arith_helper.c b/target/arm/tcg/arith_helper.c
index 9a555c7966c..670139819df 100644
--- a/target/arm/tcg/arith_helper.c
+++ b/target/arm/tcg/arith_helper.c
@@ -6,11 +6,12 @@
  * SPDX-License-Identifier: GPL-2.0-or-later
  */
 #include "qemu/osdep.h"
-#include "cpu.h"
-#include "exec/helper-proto.h"
 #include "qemu/crc32c.h"
 #include <zlib.h> /* for crc32 */
 
+#define HELPER_H "tcg/helper.h"
+#include "exec/helper-proto.h.inc"
+
 /*
  * Note that signed overflow is undefined in C.  The following routines are
  * careful to use unsigned types where modulo arithmetic is required.
diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
index 5d326585401..7502c5cded6 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -34,7 +34,6 @@ arm_ss.add(files(
   'mve_helper.c',
   'op_helper.c',
   'vec_helper.c',
-  'arith_helper.c',
   'vfp_helper.c',
 ))
 
@@ -59,6 +58,7 @@ arm_system_ss.add(when: 'CONFIG_ARM_V7M', if_true: files('cpu-v7m.c'))
 arm_user_ss.add(when: 'TARGET_AARCH64', if_false: files('cpu-v7m.c'))
 
 arm_common_ss.add(files(
+  'arith_helper.c',
   'crypto_helper.c',
 ))
 
-- 
2.47.2
