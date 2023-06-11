Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp1370969ejb;
        Sun, 11 Jun 2023 02:00:40 -0700 (PDT)
X-Received: by 2002:adf:f98d:0:b0:309:566f:3cd with SMTP id f13-20020adff98d000000b00309566f03cdmr2642799wrr.6.1686474040731;
        Sun, 11 Jun 2023 02:00:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686474040; cv=none;
        d=google.com; s=arc-20160816;
        b=rbqqGpa/dwvPSrDlG6bmfXaPxUkFPaa3jBuq8nmCwThJ3uDMU9H0LWLRATQYPg+gwJ
         OO9vVUqOZdwDoSXvcBy0diOGbqZMZLUN6d2q2/RSAbHrMTlW3cLe+RCGL799yztsvLbb
         h/UvzkufTEFbBQKz/4UKaLtC9vliNqcWQ9BoW8sa4SAwDvINn/mu3x/t9OhjFnKtJ1SM
         e/uLQ9NkM4cNyE+/rWTZNgad+LJAH2wgNOeywN3x5n+gNN8Ga7FsiZpABF75by226tak
         /653UXlA1gn+tXo6przDbehdFlpjy+eJkKUm9R+yL4SUAbEw55ymc9vC3W/bteIOJsA9
         SL9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=R/F/L6gm+zkVK5EOXjzGUKkb1zlWJACWpFKWw3y8T80=;
        b=GNOXx+mtn8WONc9o8xZOjSol/4leO6aZSfAGcvJwErdpPJ06CVdjCdOPfo5nl7NFSG
         OHW3n8k7FQPItE2Cb6zBF2e5Z+8ACVMNntY/5s5dup+p6Wt4/2vffdavr2Fbegu8cude
         wd0iZt6C9NJMRft+e2yPmMOtiuk1jh8rhqohQDmQM6c0EqXo9JqdJdBJ2wtV+UEavA+n
         uXS/Evv1Pcabq9Uqjiqm/Deon1aJYHTyPBlJ5xqqbg5g0ZdVynxHo+alnu9HvhBaFatm
         iHmUu1AbUCb+eeHfc5v4TPQ1diNrA8g/LNS6L8LmqabTfJL/Yr3Tz7g7ir1HcSU7LweH
         Z7+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KMH4A5NV;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id j25-20020adfb319000000b00307cd38d9b5sor2643446wrd.9.2023.06.11.02.00.40
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 11 Jun 2023 02:00:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KMH4A5NV;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686474040; x=1689066040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R/F/L6gm+zkVK5EOXjzGUKkb1zlWJACWpFKWw3y8T80=;
        b=KMH4A5NVVpQqs0+u339v2qEHWKHSsqO0eHhvqtEv6XuXXum/KWS0MOkaqywQKG70KE
         nYWnbHXeVsMgLCyvux3JAetmGkz20tCCx6zJRbS61NB+0w1yIjRh4MdVq5QbwcueV4HW
         sOyPbv5MN6l6DySYx33HQLXck7okuMHImvz0O9MUJDj40r14WU73r3ACTC/qYzeccrDU
         LcBRGUtxkldoGv7yFAZk86i8UqgW/Nb/y2AX2jf1Jqd2gCW/He5ZiFXjN/kvZ7TWeZ7Q
         npTdwyNs5DwCxXbLasgzubfejF37koB8xhmj7bHvujujtkqd511lgm74nskdWFCnYtnZ
         bTbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686474040; x=1689066040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R/F/L6gm+zkVK5EOXjzGUKkb1zlWJACWpFKWw3y8T80=;
        b=bo3u0JUUdRgPLIk3bH11rHqJzlru5mTNv3cWyi7bCfYzfsYyC/n8ecqf808WddLfSn
         QiYrpdLnUYmCBesGkiqxA490j/KDjjndGZc9orAbf6eb798R8vv2NJd0lT/JJ4SeRqya
         jFetNkiNYbMJQUUV6DeR9qHqyabyisV/fElqV/20njBf2G8/zOq8Vqevwx/8TaU/KIgI
         6L83z+8cDZJXPXQEfrkhMBQi5P3oQhDtOKUguEbPxWpAce2f1n0Hd6rQpEPBsveDZuHn
         pvFLAqr0gpYN5YfAO6uctmR8L+AryEX2pB0YyKgFJYEfAaOldnrK0OBUr3fsbrJ1mmEj
         4gBw==
X-Gm-Message-State: AC+VfDwvr2Qmy81tRPrWEYXCwqUGXGn08qqC/kTTrb57ub01xNYIUBgx
	j8+3qeuTdkrl3bD9aga8um9k6IWh
X-Google-Smtp-Source: ACHHUZ4HEuH0fpMSXFeq2lM2+eohGzSGtm0VpsMnqzyocUpSDvVFBiNApLwC3wdz+ZaQ1SIdyLE99g==
X-Received: by 2002:adf:f649:0:b0:30a:9014:838d with SMTP id x9-20020adff649000000b0030a9014838dmr2645906wrp.11.1686474040470;
        Sun, 11 Jun 2023 02:00:40 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (91-163-26-170.subs.proxad.net. [91.163.26.170])
        by smtp.gmail.com with ESMTPSA id v18-20020a5d43d2000000b0030ae93bd196sm9052286wrr.21.2023.06.11.02.00.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 11 Jun 2023 02:00:40 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 26/26] tests/tcg/aarch64: Rename bti-crt.inc.c -> bti-crt.c.inc
Date: Sun, 11 Jun 2023 10:58:46 +0200
Message-Id: <20230611085846.21415-27-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230611085846.21415-1-philmd@linaro.org>
References: <20230611085846.21415-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: b1voV4ioBko2

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
