Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp485137njk;
        Thu, 23 Jan 2025 15:44:56 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVbsLuOaZNN/aI1q08tVYtUUz9jj+pQCREalbYP2e1pVoPuok3fDTqi39hk8lqFh8mDtYUfaHxpTVHY5A==@linaro.org
X-Received: by 2002:a5d:588f:0:b0:385:f220:f798 with SMTP id ffacd0b85a97d-38bf5655b12mr24360648f8f.6.1737675896146;
        Thu, 23 Jan 2025 15:44:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737675896; cv=none;
        d=google.com; s=arc-20240605;
        b=lpTgswD867uL1ApxO/ythITITuKmf5qxLpod9fK//hZnEmToaOuLA9jY12dX1SZw4U
         syCP4AObxhuzIJUZxbXA8KZ3Zt1q4e5Px3q1kjX5zkzRUoGXC9OoiVb0URpa9nFSBehQ
         3m+lRlV/kOkTRXXnWawvcS5COwqEtPaC2KiyOH4Ch0OFie+5v7bT55DsTWEJJc2AIXr9
         Lnd8nSzQQ4JLQe+dmivc1PSv0Qm3j24KUu1zwoF6r3TfRAiF93NEZTpCR57eukOuXt92
         gbbEoDpx39GaX+luRRdH+X+tJhEyGoLL1493vzFR5jGx37uHtdIuIjvasZVBeQJG+3bW
         v+ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=zgM0qO1a7TmnAaVr92PdlZQNV8dbDE9Lo8CXyhKvg/4=;
        fh=oPT8ytaFj9XVz/G1TQ+861vwv7YcN8bzzng//wjWyew=;
        b=ds9FbrWv7wf9o8FfbMpkjWlvkoGf6xXN5xDJ2e/DwBMUT9TFmz0ZWPdkL9/35Kk4f3
         STFjY/Q24f/eGrVKlJgpgrgUZGXUWiTU+M334NBogyo4d34HV9KrjTNiwh7ipDZv/lQy
         ol7hSiLM8rYsCoEn/4h3kNHCDiMJCU6Y31BYxZa9I1a9rRY44Sd4VaQBKdqC2/aPp94y
         Liu9FUtDcjnfV+HT5/n10GilEH8XtF72vtNc0S1FN3jP2ytLBf70BLm+K6llOkUykgW1
         NC/8grUht6dDDhLn8tFVLcmH+wBjHGYQg9OzHb44B1bkh+MxKYZCCQ8p0auNkgILjck2
         u6bA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LGbYGvwz;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-38c2a17da58sor275858f8f.3.2025.01.23.15.44.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 23 Jan 2025 15:44:56 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LGbYGvwz;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737675895; x=1738280695; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zgM0qO1a7TmnAaVr92PdlZQNV8dbDE9Lo8CXyhKvg/4=;
        b=LGbYGvwzPeG/PLW/vf9kCpLOqSBsJFQd1qKYQ4TPpbQZU2NoUVs98xuOaE2UkGKEwi
         reiS/fKQUiWttqGP8Dt92nQ6IlWMr0IwTHmBttIIat/y2v3lj+LoZ/Mqe5WSIz6TYHVk
         /96jQ9cDi9J6I0mo/oBmRoggDC57dEnVF4ShTS2AhLQJOfiogwjB90FQ7Y8RcSwaCNVx
         sg9Ku7Ylmk/YX+S2GHxBNL2HLgvU6AXSJ+7SIOXO1SJ5PumCYWVDUv6toop7A3Bhdx/t
         kNqfUZcJDcy6d8FtndJFFVJyB+eQmjUKAdGY7WHVJyN/TfXkNaera5y43nvgcNpm32Jg
         7zZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737675895; x=1738280695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zgM0qO1a7TmnAaVr92PdlZQNV8dbDE9Lo8CXyhKvg/4=;
        b=kAWXSVm+W8TVkSAYq/lB3b4WWUZaNZ+qSjJ9Yr0LgdQe771bOmJQhGX6ONL7KfAs40
         1MTV7lPwsA3LD2fI93+S5U2bMlAD8J6LaC7o9aArkR/cxCdBEJCdHnV+aiIq3XnQ+GLQ
         SIWohJ5xRF+Iiut8iBrLyQXimCcemUmmTnMLbYT2vpbCIKaJgcxkv3Rpe8EqUpI54KGB
         bxFTAtnJuZciZUpwyxrooBNbubxxc7+x4PwpLSFnmJmJOr+Y6GjI3GdzyUa7unvLNjWa
         LcO6g6BSBzK6LDPeqRSSg2/RgaurxVutKn9n6DWHkmWpdebswLTwTCY3422A4yCWnwrV
         RGtA==
X-Forwarded-Encrypted: i=1; AJvYcCUq1/dJzeFxUN7kwfGv+jjcqr1XvF1mzgVvBdVzYXB7/9biTSpug94/B+x5vnZqbNx8HxB9NjbpacvRBQ==@linaro.org
X-Gm-Message-State: AOJu0YwcjCB20HaWUpJ2GkR0twn9AQllJ5HojSreAX3k7agIumhHXUHk
	8Q5DxeYXGwYdjIHqnUy6dHqcKmamja+CgzrqvRrpTb2LH8KhSxiGj3btghQP2VWS6Q==
X-Gm-Gg: ASbGnctheEovaw1PygVEQp4BL1gqEQ2QqEwD2uw+5zICn28Ch9f/l40ldeedEGO8W+K
	TYLquFvgRrkuHWYn6pFqA+XaBp0sVmEtVV8/JZw8HJDpf+70fz801eYcCiVcU7Bk31GG6Il2bun
	YKw3nFYFmtg+p8BjRJAR8NnVgMYHkfGSswKKBR6VX6W6ZqTZEy/JY7WSAaRLQqONPONTxwGo+fV
	zXXv+vaih3T2U1A2Pu5fTE7srA6dIQM+AMnvr8nevA3AZ759zIUSzKtsUfB2wFvQ0LqMl0K4jqy
	1XEL+vPVbGD24WGvzxX8ER2uVpS8HCheDE8atyFvVVoJjmm21zazWv8=
X-Google-Smtp-Source: AGHT+IFu3bGh+dR4gXvA0Xd23GoBCnM+yfw+G3EPNj4Vc2jg+fj1VnlHOFgKCDXygKj5XAozIyeBjA==
X-Received: by 2002:a05:600c:a09:b0:435:9ed3:5688 with SMTP id 5b1f17b1804b1-438913f86dcmr267603485e9.18.1737675895459;
        Thu, 23 Jan 2025 15:44:55 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd48a94asm7141855e9.23.2025.01.23.15.44.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 23 Jan 2025 15:44:54 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	kvm@vger.kernel.org,
	qemu-ppc@nongnu.org,
	qemu-riscv@nongnu.org,
	David Hildenbrand <david@redhat.com>,
	qemu-s390x@nongnu.org,
	xen-devel@lists.xenproject.org,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 07/20] accel/tcg: Build tcg_flags helpers as common code
Date: Fri, 24 Jan 2025 00:44:01 +0100
Message-ID: <20250123234415.59850-8-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250123234415.59850-1-philmd@linaro.org>
References: <20250123234415.59850-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Q3x0i+YXuIV3

While cpu-exec.c is build for each target,tcg_flags helpers
aren't target specific. Move them to cpu-exec-common.c to
build them once.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 accel/tcg/cpu-exec-common.c | 33 +++++++++++++++++++++++++++++++++
 accel/tcg/cpu-exec.c        | 32 --------------------------------
 2 files changed, 33 insertions(+), 32 deletions(-)

diff --git a/accel/tcg/cpu-exec-common.c b/accel/tcg/cpu-exec-common.c
index 6ecfc4e7c21..100746d555a 100644
--- a/accel/tcg/cpu-exec-common.c
+++ b/accel/tcg/cpu-exec-common.c
@@ -18,6 +18,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "exec/log.h"
 #include "system/cpus.h"
 #include "system/tcg.h"
 #include "qemu/plugin.h"
@@ -25,6 +26,38 @@
 
 bool tcg_allowed;
 
+bool tcg_cflags_has(CPUState *cpu, uint32_t flags)
+{
+    return cpu->tcg_cflags & flags;
+}
+
+void tcg_cflags_set(CPUState *cpu, uint32_t flags)
+{
+    cpu->tcg_cflags |= flags;
+}
+
+uint32_t curr_cflags(CPUState *cpu)
+{
+    uint32_t cflags = cpu->tcg_cflags;
+
+    /*
+     * Record gdb single-step.  We should be exiting the TB by raising
+     * EXCP_DEBUG, but to simplify other tests, disable chaining too.
+     *
+     * For singlestep and -d nochain, suppress goto_tb so that
+     * we can log -d cpu,exec after every TB.
+     */
+    if (unlikely(cpu->singlestep_enabled)) {
+        cflags |= CF_NO_GOTO_TB | CF_NO_GOTO_PTR | CF_SINGLE_STEP | 1;
+    } else if (qatomic_read(&one_insn_per_tb)) {
+        cflags |= CF_NO_GOTO_TB | 1;
+    } else if (qemu_loglevel_mask(CPU_LOG_TB_NOCHAIN)) {
+        cflags |= CF_NO_GOTO_TB;
+    }
+
+    return cflags;
+}
+
 /* exit the current TB, but without causing any exception to be raised */
 void cpu_loop_exit_noexc(CPUState *cpu)
 {
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 8b773d88478..be2ba199d3d 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -148,38 +148,6 @@ static void init_delay_params(SyncClocks *sc, const CPUState *cpu)
 }
 #endif /* CONFIG USER ONLY */
 
-bool tcg_cflags_has(CPUState *cpu, uint32_t flags)
-{
-    return cpu->tcg_cflags & flags;
-}
-
-void tcg_cflags_set(CPUState *cpu, uint32_t flags)
-{
-    cpu->tcg_cflags |= flags;
-}
-
-uint32_t curr_cflags(CPUState *cpu)
-{
-    uint32_t cflags = cpu->tcg_cflags;
-
-    /*
-     * Record gdb single-step.  We should be exiting the TB by raising
-     * EXCP_DEBUG, but to simplify other tests, disable chaining too.
-     *
-     * For singlestep and -d nochain, suppress goto_tb so that
-     * we can log -d cpu,exec after every TB.
-     */
-    if (unlikely(cpu->singlestep_enabled)) {
-        cflags |= CF_NO_GOTO_TB | CF_NO_GOTO_PTR | CF_SINGLE_STEP | 1;
-    } else if (qatomic_read(&one_insn_per_tb)) {
-        cflags |= CF_NO_GOTO_TB | 1;
-    } else if (qemu_loglevel_mask(CPU_LOG_TB_NOCHAIN)) {
-        cflags |= CF_NO_GOTO_TB;
-    }
-
-    return cflags;
-}
-
 struct tb_desc {
     vaddr pc;
     uint64_t cs_base;
-- 
2.47.1
