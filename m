Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp289865ejb;
        Fri, 9 Jun 2023 03:49:42 -0700 (PDT)
X-Received: by 2002:a1c:ed15:0:b0:3f7:f584:579d with SMTP id l21-20020a1ced15000000b003f7f584579dmr595395wmh.0.1686307782442;
        Fri, 09 Jun 2023 03:49:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686307782; cv=none;
        d=google.com; s=arc-20160816;
        b=yJQl0SMA9q9Xytn1bC7iWQg9m/GQ+DNm0Ni7L612ADAA/cSE6Y1LheeZ2p3wROCPYP
         tjQF5oiYONcB2cdcS5pwERBrpnNXZ8u6+lqTyvRvWlcOEvezULDda9Mclq8syMNKL7e2
         mG9pOUz91AJtN+y9kgQkxuEpgS0LWT9z+gPITjeuSIVQ2hhqvBRGw4nTUztmVCCP+Ek+
         QGFt6JZj1Yawuyorj/M1dRpPjiMuDyIvmdDIxFMe97IEDD7yWppcT6wsu4Y69dLQNQJ+
         z82UHwwxDdPpHzmun/+NlaN5hdhm/TxP9sJJbaqU//gzO3jWz7SVPcOpfsqg/WoHfwn6
         jsQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=R/F/L6gm+zkVK5EOXjzGUKkb1zlWJACWpFKWw3y8T80=;
        b=h5FE74xo/Qo+st4RYy+B1bkHUrkXi16u7uNbtho86T9/0aelfMLiEQYx2A604kvL65
         FFwZFfS3YY9YT/5RwlKTWK7k8BLkwyQ88EljzQ/IAXpRo38Bm1RNYZhK5GtuD3w7cbat
         xBnRm0EKcOoSSmRthZaDWoxmqGXkSGQzoAykiTkPKr1u2mBSrekBU6ab/KsBHm0dOWac
         EmTRe8DEmv0yeTrYW0Ztf17uVMXdGNEiZazIp4/+giKmxglIfZ90YdYp3o2cawlb7A5f
         cngVkvKz6xffEv9++dXIXjAJcE/P02uN6jbbDCCQ+WWt+h3uTUEhY6CgTjW9aEnD/Tk+
         vyUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LFO2lzV3;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id x15-20020a1c7c0f000000b003ee0da0cb76sor496523wmc.3.2023.06.09.03.49.42
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 09 Jun 2023 03:49:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LFO2lzV3;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686307782; x=1688899782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R/F/L6gm+zkVK5EOXjzGUKkb1zlWJACWpFKWw3y8T80=;
        b=LFO2lzV35nvXrFwGqKhLi351u+HgMzt5AZ+zBIWSBd1I1NTl7W8W2zC3zxPNwjCyC7
         akALs4J/gU/9lijzLBwVe4rr+5hdMFJ8GMWcL/8F4X758twcQva3ritUPG/hwLlokusg
         nwK7/6kT35orJIiiXPqQif8OsQwHGS+6Q5K7sv+1dnhUIBaHFOe0V0NFOFZzCzXLuBPv
         en4IUwhGbWzxXJc5YJ9yoGjg2FGiXT/kR2J5+eGCT7zT5trbzKih3SImEaXLTfEvIEeV
         hCSG67TtjZg3tf0Ye1EBIwNH6WWdKTtgd8hIpaO7L52VGxJWn1IEs3a8jKrfQAHbDY2b
         P6WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686307782; x=1688899782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R/F/L6gm+zkVK5EOXjzGUKkb1zlWJACWpFKWw3y8T80=;
        b=Y1E68hmYm6yXii9M0mGQWqHdFHJaElphlksN7PolkT4dbyTgKYJh/sdvbZPc+UqtW7
         q4iLwZeJlOtNE4NEIdX61HvzD3vV3hHZUAl4H6+iFsB9x7q66wtlQKMQhQtRM+xOZBgi
         3c26rLG9pNrtPlxLEB06QbjrnZdUWGcTZu5ggTG+EPV2+mHx0DQKIk95XTQXsEFcgJ7I
         bAzJWbLs9i2++S9inIageITLGUT2qkyOP7EAsz3kJ1OSsmvOwvgRPHm9XaMYuUT1r64Q
         wJWANCbhm5Mhtg1b3buo58XQg58iB7GmxYKWDddFWIB/E9eljMFh8FLWDjAnAOyD+mjU
         bSbw==
X-Gm-Message-State: AC+VfDzsqvqegUP35IadAwVDRmRPdjTDqYvt1kFJAEW2qMlwCNyPjBAt
	Ad2KgUDNU21nNckA3desc8gA98wslFzZ5b08rwNUNIXv
X-Google-Smtp-Source: ACHHUZ6/xjRARBlemyArWkK+2LV+0U9ls37BHapadOzvc+xtzVVGCHIJ+GYJx2KRBpu/wWGIibLS4g==
X-Received: by 2002:a7b:c385:0:b0:3f4:bb58:d174 with SMTP id s5-20020a7bc385000000b003f4bb58d174mr652758wmj.22.1686307782121;
        Fri, 09 Jun 2023 03:49:42 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (23.171.88.92.rev.sfr.net. [92.88.171.23])
        by smtp.gmail.com with ESMTPSA id l15-20020adff48f000000b003078cd719ffsm4112422wro.95.2023.06.09.03.49.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 09 Jun 2023 03:49:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 22/22] tests/tcg/aarch64: Rename bti-crt.inc.c -> bti-crt.c.inc
Date: Fri,  9 Jun 2023 12:47:17 +0200
Message-Id: <20230609104717.95555-23-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230609104717.95555-1-philmd@linaro.org>
References: <20230609104717.95555-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: zOFhSGZFCev/

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
