Received: by 2002:a17:906:494e:b0:982:8c08:340e with SMTP id f14csp2883923ejt;
        Mon, 19 Jun 2023 08:57:52 -0700 (PDT)
X-Received: by 2002:a17:907:7ea6:b0:988:dfdc:5a33 with SMTP id qb38-20020a1709077ea600b00988dfdc5a33mr1286503ejc.64.1687190272187;
        Mon, 19 Jun 2023 08:57:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687190272; cv=none;
        d=google.com; s=arc-20160816;
        b=gvtGiitIX+3HZp+ojjXXzIljh5i9MLLsD/NtB1ZgxqwIp2SWjlz6KXXbiaZoQkaiQH
         nZC99pguz1LMVu9vV3fM5M7M6TFWj3EYaZ+P11TKpj9FdzDNW3ziLScBEjmeg2QVDQ0D
         5m7mOOdWN6Cdd+1sue0+QQ7yt/hTbwtcVbesIGixq90vPb2i7SXrlsk1poT32R56DpGq
         NpuqVPmYCo8Wh5HWIw/NKa683VGZOb/hgiNOfZz1Pd7MPxxxLuSNyiNf5BogJ+yWeGNK
         P4E7J6pM+aF6uRqtbp6J7or9y8jOgPNv6fWF+LbUyqoyu2J1h/MRyt8+BjCPFMZR3gW+
         GsUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=R/F/L6gm+zkVK5EOXjzGUKkb1zlWJACWpFKWw3y8T80=;
        b=Fe1Rqhjcekhtgh9fKRqyV+wjQ0ClK+d1jN9yQlVlTlmQKQYGSUbfDqtiDJbCRY8wpV
         ZUZrznf/bZwc2nXhiR9GSxHx1SWVqwqU+hce5RCZ1xMxaOGZtKq5YdoMpKsk5L+LYJuM
         80UIklc+zTJ8EnUxUkd5RAkYHgav1Do1rTbevyj2FF8ZNif7Wdn4fVTzUXs8NePvUMzj
         AiCj8hikhqGwmgIv1o4/JplAYxyg0k3PDR7KZtJZGgfvQMY/cVHtYrW3pMjLpjTayRL0
         ervOB37vFjsM/Hr4+Cl1V5ZE9lkBqFP8h3YegaCgMgJElypauLCgKPbOob4BpKnq82t+
         EUHg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="lTQz/hrD";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 10-20020a170906200a00b00982389701b2sor1685825ejo.14.2023.06.19.08.57.52
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 19 Jun 2023 08:57:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="lTQz/hrD";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687190272; x=1689782272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R/F/L6gm+zkVK5EOXjzGUKkb1zlWJACWpFKWw3y8T80=;
        b=lTQz/hrD/kROkOm6WUC3LWp3Z9Ew6v38MUPBajjZkHyKZDOUlbnWGyE6RwRJE8WIst
         wR2yDd5fIDt6tDCuZlN+SOC6Qb/tkdsa2jXcAJObF1UcCdQPOobpbqXSxq8qoX7UHcnW
         W5Vv4aUgLggDF0omOW16rrW4YpyMVBeuNLW+zI7fKdD9mcgYkntX6v1y/6JI+Q6y0j2x
         URUXA7nHX1nATrW29poKLQRHJvxQo3RYfr9pBUeJJCqydU55iSDiw9F7tj2WZqHrWk1w
         yYQwR8c1gQVMJqgx1JomZ8cpabqB69maif7yze8457cdMV523aInoriqu721erUKw7yO
         qAEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687190272; x=1689782272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R/F/L6gm+zkVK5EOXjzGUKkb1zlWJACWpFKWw3y8T80=;
        b=TJQehIkNudB9aM9G+aO9lNmDvJulTNo0n4J0U6qH45pVJvThvnRyMgiqD2E2R/xZZ+
         Gefv7WuOlVuJ2lC5fJMECl9yR+Jt0ZUtTXdwjP4PIWbd46DPS3r12gasOq+rbPU85wTk
         2Oz0idglAYtXuRHEDnWv9CF8mueRhGXMdUR+vL6H6Q6sKuQIgzzbXzWPwxOvrtz0Qnc4
         Y0xHJyuFrfxM3Ng6HuUqCz16mMNKfZTQCtNLI8ltv41cU0PfpZ7rni6L3spI4JIFyJHr
         k+XkbnBwSM784DizCC9zpvJHInPyTqX8soNxNaOK/NXNeQrZgFffhmV5sn/O8YGd4lq4
         SvbQ==
X-Gm-Message-State: AC+VfDxS3v6VKb9WNKMnm0JXNdzLlZQazCLnM+QcT/1+3Dj6HvTLa/Qw
	dUYGXQBze6qWEi6e9lyAuqAfsBbQ46CIrgZ0IRxew7FH
X-Google-Smtp-Source: ACHHUZ6UuWrFjGJOswpQCAVm0fV/xeXiy+Io2O6zfEs72Sky0XhmxekroXMw3VQFFc0Y1HnMzpNvnw==
X-Received: by 2002:a17:907:9483:b0:978:8e58:e1b9 with SMTP id dm3-20020a170907948300b009788e58e1b9mr9824228ejc.74.1687190271909;
        Mon, 19 Jun 2023 08:57:51 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (sar95-h02-176-184-10-225.dsl.sta.abo.bbox.fr. [176.184.10.225])
        by smtp.gmail.com with ESMTPSA id pv19-20020a170907209300b00988ac5482c3sm1617449ejb.69.2023.06.19.08.57.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 19 Jun 2023 08:57:51 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 34/34] tests/tcg/aarch64: Rename bti-crt.inc.c -> bti-crt.c.inc
Date: Mon, 19 Jun 2023 17:55:10 +0200
Message-Id: <20230619155510.80991-22-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230619155510.80991-1-philmd@linaro.org>
References: <20230619154302.80350-1-philmd@linaro.org>
 <20230619155510.80991-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: dly89tOmnuS1

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
