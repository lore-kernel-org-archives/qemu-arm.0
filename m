Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp339747ejb;
        Thu, 8 Jun 2023 06:31:23 -0700 (PDT)
X-Received: by 2002:adf:f711:0:b0:30a:d9e6:7acd with SMTP id r17-20020adff711000000b0030ad9e67acdmr1776333wrp.6.1686231083422;
        Thu, 08 Jun 2023 06:31:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686231083; cv=none;
        d=google.com; s=arc-20160816;
        b=fMX+skWo9S7A1Gbm0FX5jy0sD7xXibFItXy95UsK34Xlh8E1NMR4QYL5yNGGNVnMon
         yUNlBEEzJaNQ3qlwGLl28L19AwoemRe8NajcbwxWi2eQO1EzYvykSC9q6OPJGsZ+Bkc6
         AcoZE+v3ZtxwBE1TLwMePee3I0/9rs6g4A93+qbvnqkuAuznHQ442xffU9FbcDr+H5Fo
         ig/+Agux9jkGQgcN3/DVAjBUp9f5kifCxnkEuaq4xZKx5uoU3pgTLzcVVSCGrPNSoz3B
         MgyovR2c2Bn6dczf1Tf1j63HnVYvN6RNDVSm6ECRnz81IkqzgalP/VAGWTO4V1ajkQYn
         WfGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=R/F/L6gm+zkVK5EOXjzGUKkb1zlWJACWpFKWw3y8T80=;
        b=m/xCumh1OMoGLa3r/fGW67003sWPz8K8GgiUpypyq89OsWuF9Xfoa1MmnLLNMrO/KS
         /W/AKFiaSfnv9U02J/oiXIE6ksD1mlnFO099S4SVvw6PHrqIeKdG8yGortQ6rH6CQe8u
         UrlWSt4ksmf+rXpZBiNrP31lyh95LUwcBDBqW8creDybUmnlEQjrpg8s5kWJU94jho86
         9/KfAmzcqXXb8X4FFGqPZ7afhRgnGIVdgJQ4hKkwcEu8J1efRrlsEYbz4BP/7soWvDbw
         X7DCRILJRQBWlxDll39c9Ju35aw8QbfMFg8MAZMsAodboLy0yc20eGIJd0mcTz1jDpVr
         iXXw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JSt74Soc;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id az15-20020a05600c600f00b003f7fcac774bsor342723wmb.3.2023.06.08.06.31.23
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 08 Jun 2023 06:31:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JSt74Soc;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686231083; x=1688823083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R/F/L6gm+zkVK5EOXjzGUKkb1zlWJACWpFKWw3y8T80=;
        b=JSt74SocMJbSpH9d7lDvOU8mQoi0/RVg2JluqSvjpvJuA++dwnyncBL3H5qJ/SNLFo
         r/YOlTwcSKMvK7rXip538USYAqqlwqVzfPX63N8eKGjqZqJbvIj9Vy/++AG85RMiNgtq
         vn7vLJgQG1ZveR8Z5wFj3XKpO+IxmB6Ck7kW98u7WGwA42Cel+UeqA3oOrewc4LaSfQ4
         fpbqs4NnZItGRGApnOCfQ+QZDGn3AUduEQfuIBpbYgAcaGnziNnC673nM7OYo/5d3asW
         7rZHMldU/Y4n4JvhGreiI9b4wN8IWNnRkDqJBPdBrKpqk23ER0RB4SHmb+ZhuF7GqLrx
         F4wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686231083; x=1688823083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R/F/L6gm+zkVK5EOXjzGUKkb1zlWJACWpFKWw3y8T80=;
        b=FxBVrvwEVgN735TzcJtM7y9GXgmq86kN63P6yyOR42I7Lxucho1BCOHmYv+BPOz7Gr
         4Ad4Iu+gEU0+i0tq0FAsheAZZF+y9J2XhNI2jzUQNfLEwKj8b7OrL4MklMbSPD88M0Gy
         yEDAYfrsQ8Si3+pX4hAg+cIArUaTBn/dITOwrnZ4VlgAJaz+luEXQGVkA7jttDcyhLDB
         LENf/Tb1NMlINRxub1M1b5jFJJZnqvzFIOIZacWUUszsawmQ0mnUNqBs8aizAQJyCt4P
         sMW3XP/nfnVO05RccxTHacdwwh6uid/vDkBAbINfcdmhtSWciKEj5Lm9PihfMdisD9OB
         mMBg==
X-Gm-Message-State: AC+VfDzKnkVGbqZM5HyC7J7atoDDGm6PYK6WDPuYLWL8ypGlJFrYNUTp
	ZaPvAau3FeI/0l0XiI5V1GM++8ql
X-Google-Smtp-Source: ACHHUZ6RsiAID39DaIGkbTi5XhZpyJvVNvr0DgM7in6YvHIFCW0/uLKFvHb0zwnoOSYSi61mxsACRA==
X-Received: by 2002:a05:600c:da:b0:3f7:a20a:561d with SMTP id u26-20020a05600c00da00b003f7a20a561dmr1405285wmm.8.1686231083175;
        Thu, 08 Jun 2023 06:31:23 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain ([176.176.169.168])
        by smtp.gmail.com with ESMTPSA id z10-20020a1c4c0a000000b003f50d6ee334sm1961021wmf.47.2023.06.08.06.31.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 08 Jun 2023 06:31:22 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org,
	qemu-riscv@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 2/5] tests/tcg/aarch64: Rename bti-crt.inc.c -> bti-crt.c.inc
Date: Thu,  8 Jun 2023 15:31:05 +0200
Message-Id: <20230608133108.72655-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230608133108.72655-1-philmd@linaro.org>
References: <20230608133108.72655-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: uTRpLqd4qau2

Since commit 139c1837db ("meson: rename included C source files
to .c.inc"), QEMU standard procedure for included C files is to
use *.c.inc.

Besides, since commit 6a0057aa22 ("docs/devel: make a statement
about includes") this is documented as the Coding Style:

  If you do use template header files they should be named with
  the ``.c.inc`` or ``.h.inc`` suffix to make it clear they are
  being included for expansion.

Therefore rename 'bti-crt.inc.c' as 'bti-crt.c.inc'.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/aarch64/bti-1.c                          | 2 +-
 tests/tcg/aarch64/bti-3.c                          | 2 +-
 tests/tcg/aarch64/{bti-crt.inc.c => bti-crt.c.inc} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename tests/tcg/aarch64/{bti-crt.inc.c => bti-crt.c.inc} (100%)

diff --git a/tests/tcg/aarch64/bti-1.c b/tests/tcg/aarch64/bti-1.c
index 61924f0d7a..99a879af23 100644
--- a/tests/tcg/aarch64/bti-1.c
+++ b/tests/tcg/aarch64/bti-1.c
@@ -2,7 +2,7 @@
  * Branch target identification, basic notskip cases.
  */
 
-#include "bti-crt.inc.c"
+#include "bti-crt.c.inc"
 
 static void skip2_sigill(int sig, siginfo_t *info, ucontext_t *uc)
 {
diff --git a/tests/tcg/aarch64/bti-3.c b/tests/tcg/aarch64/bti-3.c
index a852856d9a..8c534c09d7 100644
--- a/tests/tcg/aarch64/bti-3.c
+++ b/tests/tcg/aarch64/bti-3.c
@@ -2,7 +2,7 @@
  * BTI vs PACIASP
  */
 
-#include "bti-crt.inc.c"
+#include "bti-crt.c.inc"
 
 static void skip2_sigill(int sig, siginfo_t *info, ucontext_t *uc)
 {
diff --git a/tests/tcg/aarch64/bti-crt.inc.c b/tests/tcg/aarch64/bti-crt.c.inc
similarity index 100%
rename from tests/tcg/aarch64/bti-crt.inc.c
rename to tests/tcg/aarch64/bti-crt.c.inc
-- 
2.38.1
