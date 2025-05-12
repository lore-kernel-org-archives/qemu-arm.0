Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp42743njb;
        Mon, 12 May 2025 11:05:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVR53c6OBfe15VTG6GjVMbG6K9x4RxyYJq11D97LjxVF9hfkKdpcAfqB6Bp8pLiKWNqj4pBP7J34rgx2Q==@linaro.org
X-Received: by 2002:a17:903:3bc7:b0:224:1935:d9a3 with SMTP id d9443c01a7336-22fc8b33531mr200592505ad.21.1747073129446;
        Mon, 12 May 2025 11:05:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747073129; cv=none;
        d=google.com; s=arc-20240605;
        b=b2O+3+um8AVtcnW7kcbu4yXnbZOuCAEAoFDrw+meJGz6u4hKgHyDxsTDeSwvJk5dyi
         AiZeuFfDTyCURTmg4aTOCTsq8n3dJEB5r2vTgJd4i1Iqv8rcgLvXj1kmIU2/nEc01Swf
         abZcj5pvaZ265cX++5Ktxrb62UvsBCoJYXSnaq5LvPGMMxcHSCq7EKjn7J9JUl4pML37
         30iUC3w4yFQrh7d+VzqIDLb22dmoWSDYHonzmOwjmlsQlbiQD/931sHAA1L/1+VO+FNQ
         GGShOmlMBfheTZDWAcrvluhq94JC/giVQeRh/JDaSBy6ia2WUXacVgFpNj3ehEAG2qQ6
         MouQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=oL0UJx+tg40cChK3kdl5R9FcbD/FZXeuaJQlLcp8OEc=;
        fh=ZrgHA7nZcpTYjxNHvPw0nsDKwJ5v0b2pmdXlkuPyvFI=;
        b=VXo0m0Pii5D8Xh3EzffPVqSytn61i/Xo+GNcooIQTA3VAztqZ4M2hYBywPyztxA+ez
         sLrsPeSi6TXJijqDjT9oUOTEqZdZGZKzb/vuZ53dWhkgYBYXwIErRyu5mhwb+VEaCJIN
         V5FjgWJLwe9SRRmy0XoAQy5MK57h6VnOgwK31QaaZPzoQHk6jOPaJ4/fPn6vP74rLyH4
         Sfnv0IqbtoSeXi1yxV4fUCUxOF+WiFWRKhBiMpmU4OXAyF1c9kSEwxOFOeErGsDF7H7A
         tU19zXdPPBWq2R7F82WU4iNsQATz3lnaLBqDhx/84DCb9VeWQE2fAIMsnfot0C018nzy
         tQ+A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vR0cCTQq;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22fc6cfa36csor84541575ad.15.2025.05.12.11.05.29
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 12 May 2025 11:05:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vR0cCTQq;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747073129; x=1747677929; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oL0UJx+tg40cChK3kdl5R9FcbD/FZXeuaJQlLcp8OEc=;
        b=vR0cCTQqjTtNfNmzqJGkjZEmHeQMLjGZSZ4vWMbLA2pWn58p+I//EA525E+rf9R/Aw
         yOO3FhLfZv3e6bsC0dmX7/yrG913ZiAcvulHbuw6/sOaBzA6/hWY51u9Lt1K6T8shogM
         G6hUqjIt4zKhPuOhBNjBYl5IkrloCJhC1H+BA+EMRTGsQtd+kxWNe1krx+0TbYhxiU4Y
         P5yDV0VDBhtjpzRtn9+W9HKzlkfjpmfUoPFPcKPT6Bsi5YcuikWVUfq5Ez+i75mOU1/+
         PxsSrha9dVZ28bttpfQ7kVJmzlVHWGYBrg3Wo8ullYOguixseum1HL5RrgwZBfIyeHq0
         bVZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747073129; x=1747677929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oL0UJx+tg40cChK3kdl5R9FcbD/FZXeuaJQlLcp8OEc=;
        b=W2pftMpEV9yXn25PiTs5U5EQ2CecS/SGLuo5h38NCDhL5ylk79kBJkR/wiDzvYq1T2
         0WyQPPKB6mJCG+/A0S1VQnjeyxChE6vKDAtD/yXop4OmrcHYYX84KMz1CnVmW39I9Qmc
         DhZk0T/Kzzp0F+g2L7sYW+pZTiloJ/dDurICAgjQF0c0RYtR/JLI4ww8iwyPcBKglXdr
         L9kDt0QjJzOYbT52zSdKEw40ajT5UWRQguzU7TDzCiXOMAJCrQWCkyCBWkSj60GKj+ip
         3qr0HaXB/ZlmhCjcpVP9TZkYknF1M7+wnbus5yVRRG3WU7HTUWWD9PpgbqywZGsPeaYE
         Rx9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXWGm29EyAgjV60W1P8DqNN9XZazeBQ6+n+X5EHBip7vwkB0I+d9TIkDM71H8f1bVcIePBkLa97+vFYVA==@linaro.org
X-Gm-Message-State: AOJu0Yx9Cih8B8Axn+OSe4Ot7FkXwAtEvz3YyylPqXX7WqVjaEsNPWne
	xCJaSoJ08FzCLzFJF6nz2g0muf0Be6onoQZW1nEKBVspiAy7ocI7LG+rQyD0BrzXxg==
X-Gm-Gg: ASbGnctVkE/IElDT56jIKyMfxh+Pt3PYrfjPV4COn6wcBfc7ybaEeKMJcR50SjkQ8Xd
	atqZImKnNXmwgrWq46cPQ6HBiKEPMASjBbYpgrmgyVrzs7u0+6rEqIbw9q2BtKVD9/cGM0aH6ka
	q4LCsqS2HbGGh0E+4e+aMVYPXJiINmdJuZTw+A1uFO7CfPWG/pDNgogPmQex+AusbRoWsFRjC3N
	XqKdkqMTQ4QqtcEiA3H1Z3TJKG2rbFqEn/wl0qMT7FiVr0e722klMRhZGCejWwZSrMmBP/ZEL+J
	ylQUAwq1gbX+Duaua1VY+VW9jcXvilsWrEwekiSvCMCAO+B2sxk=
X-Google-Smtp-Source: AGHT+IH7qLvgpx/Cb/Pp3+k1HYQ0qX7j8tIRYiuCyLgrVakJqFp3QIBAFvYBptkwZOaClTHq6p5RBw==
X-Received: by 2002:a17:903:244b:b0:22c:336f:cb54 with SMTP id d9443c01a7336-22fc8b5976amr194066245ad.29.1747073128951;
        Mon, 12 May 2025 11:05:28 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc82a2e4fsm65792005ad.232.2025.05.12.11.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 11:05:28 -0700 (PDT)
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
Subject: [PATCH v8 19/48] target/arm/helper: restrict include to common helpers
Date: Mon, 12 May 2025 11:04:33 -0700
Message-ID: <20250512180502.2395029-20-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
References: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: /golCmXGHtXU

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/helper.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 4a2d1ecbfee..3795dccd16b 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -12,7 +12,6 @@
 #include "cpu.h"
 #include "internals.h"
 #include "cpu-features.h"
-#include "exec/helper-proto.h"
 #include "exec/page-protection.h"
 #include "exec/mmap-lock.h"
 #include "qemu/main-loop.h"
@@ -35,6 +34,9 @@
 #include "cpregs.h"
 #include "target/arm/gtimer.h"
 
+#define HELPER_H "tcg/helper.h"
+#include "exec/helper-proto.h.inc"
+
 #define ARM_CPU_FREQ 1000000000 /* FIXME: 1 GHz, should be configurable */
 
 static void switch_mode(CPUARMState *env, int mode);
-- 
2.47.2
