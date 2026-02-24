Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29048E9B259
	for <qemu-arm@archiver.kernel.org>; Tue, 24 Feb 2026 12:11:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vurFO-0005bm-S5; Tue, 24 Feb 2026 07:10:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vurF8-0005XN-JH
 for qemu-arm@nongnu.org; Tue, 24 Feb 2026 07:10:23 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vurF5-0005s7-7J
 for qemu-arm@nongnu.org; Tue, 24 Feb 2026 07:10:21 -0500
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-b79f8f7ea43so883033066b.2
 for <qemu-arm@nongnu.org>; Tue, 24 Feb 2026 04:10:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771935017; x=1772539817; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Dy+/3k/+giCiVkrl7wREedy6JTUvCtf6hW0/UGpetdM=;
 b=oQQXexsXVx6wRCeUSoNOYZfC22dBcP5dCRIjdGPD4BvDgJzAuJJ6881FYOHGFm+cyd
 e3eA82I2t5bzN+EgVe1cAlUnX4ITGldfUdoxlmbBQHWPvI5yp7brmKO4MDsdD4QYe45S
 Noviqagx1IuIeDMzh+qQcUFvj6TTZhERxDE0JE6C6hKlzuPfWy9dJ7qGjMJTAi56d+Zc
 arHzCiZq7REh98KEXp4izXaUSj2MW3glieKqB+VyFMl54G80w+DNZfYKs8WW9l7LvUc6
 1N3PZbP+7Bm73gVs9C9WgadX88+scpWhvHiKHx1jC0O8S9rUxA/egVW8WuLOiJbaG+1O
 r0tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771935017; x=1772539817;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Dy+/3k/+giCiVkrl7wREedy6JTUvCtf6hW0/UGpetdM=;
 b=nm4juZgDUEJ0qHamhZfNknnJPVAKU52hw3WG59VvwF8OGC7vN6kOVXgBN/9CQ4ZhEU
 twsUganSncRdAGBjPs8avCvhOCjBh3yIhSxbH3guDlvt7ZVzWgDJYlHl8LGwjU0FKIZa
 ZTdwLRHh5Gqtzqcr3KYfye8ryqsoHOZv/ro+BFYerH2lD24y3pe7sRMBtZg2V9hlMOn1
 OJ2CbUuPGaK7diPY3/sckPJeJrUjdHDzMCzClzwe0GJB5ACHfy84czJ8+tk8wwcVh1Qj
 Let0BTUL3wJbojxljKnjBARn2rcJRWHr6wqoV69UzNfRcfQJTO8qWMX4QwuDDLWYrK9w
 +LsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVcJJHFIMre2rXDC7epN8kGZppBle3UjUn7KKD4ijPaA4hUq1YemFOOGvHIWF20xM73CaWAwOTKjQ==@nongnu.org
X-Gm-Message-State: AOJu0YwEtiMUFOfhH9guSGvbmmZSLDBYgG0etB0p1QzVo794Fsw6w6S5
 wsyLE3tqI6vAnnsTxzn95+qAsPAx1bRQGfz25F0ijwPtq2wkVP80qR5MK+PI9mBhk3axhuq4Ocg
 Y22mU
X-Gm-Gg: ATEYQzzxptCRLCSG+/iJN56GeJ77KOTsOAYt/sR+AIccPT4Or1OLoJHv8/CRvSliHj6
 6+4Azd6LWOU7KcDpf/H3G1mHuNrpG7I3Fd+kE77+0Dl/tQdSzkOMf+jVeg1iROUSrg03Wu2R9bt
 2V0vwLh9D/O+PhZG+PASEHtKbAW87vb1Muc1mxG+NqCzuN0A38YG2MzgZOAcDvDcCH3SApCxwQS
 xPkEqPaJlsywYmZhPvZM2u7csS3OGqCXwpN6iB3yaHReEyP4xu/t+ujUTnVGk6meJ9vy+B+/eCJ
 qgSqOYTdsxLKDpTX7cCB2XskIDbbVscRTMYMGos7CsoX4hMWJ7G2rMvfQx8/AzFKt5fhceZhOlR
 0Gp2JFp7YdJUZtY+7af/HlRytccCCDqv2HMOrMZNp8hqvlr/JC8mVlzBfYEdJFBPP9XjdbVzY4s
 nVgGZjn+DebQxTwB5P2UqiREYT5ULmW1t0rQ==
X-Received: by 2002:a17:907:25cd:b0:b8d:bcea:438 with SMTP id
 a640c23a62f3a-b9081b9b91bmr826781966b.44.1771935017346; 
 Tue, 24 Feb 2026 04:10:17 -0800 (PST)
Received: from draig.lan ([185.124.0.126]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b9084e4bf43sm419441066b.42.2026.02.24.04.10.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Feb 2026 04:10:15 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id D3C315F8C1;
 Tue, 24 Feb 2026 12:10:14 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 3/8] AGENTS.md: add basic AGENTS.md for QEMU
Date: Tue, 24 Feb 2026 12:10:09 +0000
Message-ID: <20260224121014.279248-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260224121014.279248-1-alex.bennee@linaro.org>
References: <20260224121014.279248-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

This was written by ECA based on it's initial understanding of the
code base. It's mostly quick facts and pointers to common tasks.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
ajb:
  - I made a slight tweak to use pyenv to run single tests
---
 AGENTS.md | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 AGENTS.md

diff --git a/AGENTS.md b/AGENTS.md
new file mode 100644
index 00000000000..5b54763f4b1
--- /dev/null
+++ b/AGENTS.md
@@ -0,0 +1,18 @@
+# QEMU Agent Guide
+
+## Build & Test
+- **Build**: `ninja -C build` (from build directory) or `make`
+- **Test All**: `make check`
+- **Single Test**: `./pyvenv/bin/meson test <testname>` (e.g., `meson test qtest-x86_64/boot-serial-test`)
+- **Suites**: `make check-unit`, `make check-qtest`, `make check-functional`, `make check-rust`
+- **Debug**: Append `V=1` for verbose output or `DEBUG=1` for interactive test debugging.
+
+## Code Style
+- **Formatting**: 4-space indents, NO tabs, 80-char line limit (max 100).
+- **C Braces**: Mandatory for all blocks (if/while/for). Open brace on same line (except functions).
+- **C Includes**: `#include "qemu/osdep.h"` MUST be the first include in every `.c` file.
+- **C Comments**: Use `/* ... */` only. No `//` comments.
+- **Naming**: `snake_case` for variables and functions; `CamelCase` for types and enums.
+- **Memory**: Use GLib (`g_malloc`, `g_free`, `g_autofree`) or QEMU (`qemu_memalign`) APIs. No `malloc`.
+- **Errors**: Use `error_report()` or `error_setg()`. Avoid `printf` for errors.
+- **Lints**: Run `./scripts/checkpatch.pl` on C patches. Use `make clippy` and `make rustfmt` for Rust.
-- 
2.47.3


