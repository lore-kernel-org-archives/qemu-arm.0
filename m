Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp5073356ejc;
        Thu, 31 Aug 2023 06:00:55 -0700 (PDT)
X-Received: by 2002:a05:600c:d9:b0:401:dc7e:b688 with SMTP id u25-20020a05600c00d900b00401dc7eb688mr4384685wmm.6.1693486855267;
        Thu, 31 Aug 2023 06:00:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693486855; cv=none;
        d=google.com; s=arc-20160816;
        b=gbEx5kpwrKyJLy7OufMEoAyfsilc3F8l+SOMRfGKJoUA9b/t0g7FWvAJeqsPBxwOwV
         CAED874vgAP2EYOuu2UY8SzX7lDOMbJ5RenBvf3P5+fFBrQz9xkj3wzMlbvgx/FNPg0g
         l504vSELM7HKe1YDhtyiS1h+TCMwB6FEnjeam/FGLUnP2oZEi387L7JZlvOZRU75tWki
         p7czNOS4BqbHGgWusqrdebNof6irDVxl8AAFYkvwlPVmPWI6VkgohrVw1Gjrt07nWlqw
         k+kUC9ISppM1K5/1eUziPx0C4hzAToriziwjIVynd+MOYEtjfVkEhXhvK5EYq3R3KU21
         +81w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=7DlQKvvYxi/qCYEWGVTmqr7bzh4KTihilnnc7Rwr6fI=;
        fh=qdxsr9WPFtdJjlKxzgnvLnIy1YmgsSlAKZpFdRbbVlw=;
        b=nSaw805gRf+S/mZup87L7C9kRpkbqlrOipwGWi+uMjzGh2pFklX9Qv1JR6BNLqhSAR
         awY8vB6KF7gFV1HQUDnbytmrauS0ZK6A5wXfFHlnDP0pIKqCv7y3G/eXUgxZzc4zel/o
         bg1Efpbc+2S7En9KLAbAmzIcpMQzueg8RLtS5+xcK9gX+ErDPlOnVBvLW6NWaW4wrtPn
         gzKlBr88qXC/VnZ7VxBnSW6oH7QAJmnlr7V+JuASSvW4CW0wTy7bTnhsDyQjiXxgYP7F
         iTOzeU/rajg3h6KzyZuapR9k8gSGjMoKzdTsjFFjHEMAjxIkzRqjlxiIp89I5z+wItc4
         R8lQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MqU8tEFm;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id s17-20020a7bc391000000b003fef4f3d014sor561016wmj.9.2023.08.31.06.00.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 31 Aug 2023 06:00:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MqU8tEFm;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693486855; x=1694091655; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7DlQKvvYxi/qCYEWGVTmqr7bzh4KTihilnnc7Rwr6fI=;
        b=MqU8tEFmyg3G3SGPTycdVf7jrFBgK1afBDgo6bvegk1hcNLURbA/QJPH/U2cCtYV+F
         pmknnWknYu4H9OKF7SDkhxr7H5f6CHgnVozsdVeWswPtQfIPK8vX9vSKyLvFr9Ga9vHG
         5ur2hjc6hwu9eCl0ZnWURFlIrQCXBGe/iSJ69WQEO1NrUVMJ9OBmxXIYwEc1yzaWvGtu
         mnBkTxS9pyPv9H+wR1CLF7qCgLG9r3RLZyyYtTcYgQiNR99GcLChs8kQsTgseOnveXYR
         yKpo6PigStvETrhqnB/mIKZf0NU9pqAnt0oU5FLfU/KBewEg6iiMjC6vtOd2IkjejSCW
         b0iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693486855; x=1694091655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7DlQKvvYxi/qCYEWGVTmqr7bzh4KTihilnnc7Rwr6fI=;
        b=LJNLVgTl5aSe4vKWU368ojrdFhO7eqLlO73cYVbG825wuU+bZtHIDBZI17SziWVz/3
         do++QkhiDIB8weLH9IekL+92WC3EwkxIW12X58rifxfWwlW9PLgMHpuAcqm/f3uiGyTu
         R/xkaN9r2zf228gvbAzfbtDB35ZPJZPvxeVpv8wR9FLrPwXpm9vScRkb9B4JW01BhqWD
         PRuRWaX4W9ykcX02JdKtkM26I1NIDqlQwr2NLsRX6Yw/lsvz0b0+Fnl+K3U5z9qAAaIi
         Z5ZrBtmhFct9AkYuYreUcQsPtKIHhrWfrntV76a0yf+3WbQqXRq3Um/5coNy1t5B/tMY
         e0gA==
X-Gm-Message-State: AOJu0YyGLoNV+m1I1lx4JxfV/sWWrNjeio34vISFkyTR4RkVN89BP+KY
	z61zMZNxe3v7N6ppH6z8O5QVlaB0
X-Google-Smtp-Source: AGHT+IF9zXp5z0tE5lsQ1/7sCJqanpRlZWKLVXEkWFZx1qC01p3Yj6O7U9t2aQzWy2kATFY9QwU5/g==
X-Received: by 2002:a05:600c:228e:b0:3fe:ef11:d79f with SMTP id 14-20020a05600c228e00b003feef11d79fmr4442477wmf.36.1693486854925;
        Thu, 31 Aug 2023 06:00:54 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.187.199.245])
        by smtp.gmail.com with ESMTPSA id p1-20020a05600c204100b003fedcd02e2asm1881333wmg.35.2023.08.31.06.00.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 31 Aug 2023 06:00:54 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-riscv@nongnu.org,
	qemu-block@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 41/41] tests/tcg/aarch64: Rename bti-crt.inc.c -> bti-crt.c.inc
Date: Thu, 31 Aug 2023 14:56:43 +0200
Message-ID: <20230831125646.67855-42-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230831125646.67855-1-philmd@linaro.org>
References: <20230831125646.67855-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: PEpU5E/rjbR5

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
Message-Id: <20230606141252.95032-6-philmd@linaro.org>
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
2.41.0
