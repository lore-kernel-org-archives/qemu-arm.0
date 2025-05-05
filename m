Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2179871njj;
        Sun, 4 May 2025 18:56:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWjQBNqXDtQOOdJsloFKYHAzdTIF486sV6M3xFbRzec55Wn0b5CqL07mb1pE4djq0twsrjtXJVZDuhjzQ==@linaro.org
X-Received: by 2002:a17:90b:1dc7:b0:308:5273:4df8 with SMTP id 98e67ed59e1d1-30a4e5a57e5mr20478126a91.10.1746410186418;
        Sun, 04 May 2025 18:56:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746410186; cv=none;
        d=google.com; s=arc-20240605;
        b=CfgoOaV3tOI07JlBfTtd07i3DBf9XovHsZj4AjO6nP/nYdC7BqWqqVk6h+pVBqQEUe
         TIT4YCxAa5aOpX6rAohIWfkyGF8xWSmJuWNNy2kklgc2ECoGGUl0KeUDkhmhDl1Lo2In
         n1Omw6SnHhRcDjXKnQkz1kOgDXx0q0U8cRaeD15J0igpJUx4ZitlC1NSNGG0yAWBeZAC
         um/j/kFx0qPSo0IzAuhI/cnNyaEF6o33TWyn/iovz7w7VWZCwy/8c6/Ze1ONB8PQgGpK
         8NvvfSsi1vcXbyLqtWu8mqbWmHkR4/uXe9JwIJhQPN8NFzSaHzyZSldrpzusAfxa5N96
         E/xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=nwtW3h2lhmGSEKiIMjkXffP91aavJQ5GIexA+kWESbY=;
        fh=6giRc2kCEw3EIOnQf/FTnS1wwQnQcN1Faz06y4QfHDc=;
        b=M0UBmEKa8Ddk4aT2h18MmZbq/mRzekHnRkcjC97TyZUmbjw5t5hkx+UdjWjCeDRw9b
         A5USjUBp/9RAk4Z5WapyWO7l4g9xAveUy62SQW/EvqFrIvB10Mx+qGW2/2dczhSpzQ/c
         qAwk4G9IFXSi+1LOnJ3h/C0VU7i/VZVtCjuy9XxP33ci6WL9VFoKeJqZE6oWGQAOAgQu
         nCqs7h/qk0DwgWR1tV+WSNiwZTCp3+orvIsLtbrYxUIY1+zfFNgzsJMTAyFhC7y8JbpR
         NZtR6vF8r2+zb4jqQVEbCwCAIk/8J+zDXivThhfJJSpBxIzfjBowefnxFZJkA/YYuZ9H
         tF/g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tPt2Kidd;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-30a47462c44sor5018873a91.1.2025.05.04.18.56.26
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 04 May 2025 18:56:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tPt2Kidd;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746410186; x=1747014986; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nwtW3h2lhmGSEKiIMjkXffP91aavJQ5GIexA+kWESbY=;
        b=tPt2Kidd7Jn86Bq25wjCVcEZZVDWDjFGC9VLcws3p8WUzFnJKE7ZA6fowwHk3WVFUk
         MfHjQshqGpSB5zMVzraQr+YA4Pzn0jcw/5qHKRty9cvCqUjE6yEh3QCWgG1UiFFMD526
         XmVNoajg9QyqFb8werDkrr545ujJD+weCHdQeE7A/ykTHFo2HW5/gHCgG1Sqatpxv8Wu
         /CA9Jw19VUAoIZc7Pp2TW7Ofl3MCEDBcVbP2gCtBmzyztBkbGTIwGb6DFcXca9rt+uuz
         WFuMKlxG2GkzuHAOCUuv2Up223feVD7/+nnGMXo4A3SlipB26y9q7hMb4eKaVV6R4gyv
         R9gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746410186; x=1747014986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nwtW3h2lhmGSEKiIMjkXffP91aavJQ5GIexA+kWESbY=;
        b=Qbx/Y9gk9qb+9TPNu5VTbHOf6mHZ63/MU+HgPpl9sTXZezG4r9+9JbIND71h+8c4rv
         Z5M3I21HjxHKjZI5AaMVf8HqCwJgUSLDH2DtEmmos77JTXhMVmpa5vhkzDM6ZIsxAIm0
         PrD5nT4l5YIszpyM7zKlxHJzjfzgnjxNcm4TIUTDvIZoonbW+hW+M227qWM70BN7wwXz
         wrw+jGbg7TEUSjOFSrcj48jTC+vaOQKQr+31zM6vI8saMmJOI1egmZkbP+pnFDBdMu13
         fc9SCXJGBOmZgqVmBnFlgthFbprAebx1XU3Paz5VbtaFeTP+xvKm3CkZQmwUg9nw/OKc
         hYMQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1WmXDtPjourX5WDOqO2BASCkn5ZTqKZQccYwuxJR8aw+MVJ8hOH3PsoCrNPZ5wKJ7tf3a1zaloFfxCQ==@linaro.org
X-Gm-Message-State: AOJu0YwU3sXxpqQA3+vYM96WvBxwVxLHPQvlXcQtK7UcL7Iwb7BOcsjl
	mCOWU+dPcsNSHmwoweJNjutZMdM72fbpBQCXp1Xf2CWxGj4BEbtiJNGjT8dD+qbYnw==
X-Gm-Gg: ASbGncv7UnWOAbITMPYbBm+RK3ntM2LQzWWYmRbCPege0Nce3WvZm9EifQzWd/oNyu+
	kolzQU83D+AnFvnd1dzwptk/BBP0hZKTg2Yq5M9hwoKN8SRIX8nnWbCfQuu/6LMdDZ9YQUCUNc4
	NjCFhD/YL1YrHxZ4YoFPt6jgKZaP3KaqAjiDJfbu9gxHpuauPafi2bKm5QUg5I6+MgSrrRK5hMn
	KvGIdCc0XX8am1aGEmlXN065mXLfVEXaXDaYB04ivWvZ7MqOGX/bKgKdUedvsQxQ++UJ9DAhgFi
	5vtnDfT5sGSpK5seMFoyAYaWv9MOBiBQfEiyrv/y
X-Google-Smtp-Source: AGHT+IHKR+PswofdfKp0nxf06Jv71gPjzeL8y5qHvCFV+VW1IoKs729cDWlWpUQeBdcpCI9oplKMUw==
X-Received: by 2002:a17:90b:270b:b0:2fe:8a84:e033 with SMTP id 98e67ed59e1d1-30a4e5626f4mr18713516a91.2.1746410186079;
        Sun, 04 May 2025 18:56:26 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a47640279sm7516495a91.44.2025.05.04.18.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 18:56:25 -0700 (PDT)
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
Subject: [PATCH v5 42/48] target/arm/tcg/hflags: compile file twice (system, user)
Date: Sun,  4 May 2025 18:52:17 -0700
Message-ID: <20250505015223.3895275-43-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
References: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: j1VstwMf+m6J

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/tcg/hflags.c    | 4 +++-
 target/arm/tcg/meson.build | 3 ++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/target/arm/tcg/hflags.c b/target/arm/tcg/hflags.c
index e51d9f7b159..9fdc18d5ccb 100644
--- a/target/arm/tcg/hflags.c
+++ b/target/arm/tcg/hflags.c
@@ -9,9 +9,11 @@
 #include "cpu.h"
 #include "internals.h"
 #include "cpu-features.h"
-#include "exec/helper-proto.h"
 #include "cpregs.h"
 
+#define HELPER_H "tcg/helper.h"
+#include "exec/helper-proto.h.inc"
+
 static inline bool fgt_svc(CPUARMState *env, int el)
 {
     /*
diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
index e3be0eb22b2..8623152a645 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -30,7 +30,6 @@ arm_ss.add(files(
   'translate-mve.c',
   'translate-neon.c',
   'translate-vfp.c',
-  'hflags.c',
   'iwmmxt_helper.c',
   'm_helper.c',
   'mve_helper.c',
@@ -65,7 +64,9 @@ arm_user_ss.add(when: 'TARGET_AARCH64', if_false: files('cpu-v7m.c'))
 
 arm_common_system_ss.add(files(
   'crypto_helper.c',
+  'hflags.c',
 ))
 arm_user_ss.add(files(
   'crypto_helper.c',
+  'hflags.c',
 ))
-- 
2.47.2
