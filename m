Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77A96C87FCA
	for <qemu-arm@archiver.kernel.org>; Fri,  1 Aug 2025 23:33:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhzC1-00041B-Lr; Fri, 01 Aug 2025 19:29:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhz8m-0007HB-CM
 for qemu-arm@nongnu.org; Fri, 01 Aug 2025 19:26:20 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhz8k-0005tX-BT
 for qemu-arm@nongnu.org; Fri, 01 Aug 2025 19:26:20 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-313154270bbso2144003a91.2
 for <qemu-arm@nongnu.org>; Fri, 01 Aug 2025 16:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754090776; x=1754695576; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ds5bOf1mClv1Yo1P8ZbOERyGLq4Dww231skfWEq4G6E=;
 b=cxqF+ESnQjq+q2VTfJJgyXgwLtguhUYu8SFI0HtMnRqlWtTaaYZ7MlFwobLWAi9TCw
 mqIUd5+fHjwcWiBZp9L1aaMmIPFDj2y/DqHTHgvBYq/KtqMTo1/SEV0P2lkmCAWpXais
 RCUYOfc9shz5I4bkRhxlOwq9bYtXxKh5rLcd8QU/fH3GPovoHfT2lGCK4ZX5kzndJoHf
 KMKkqS4bxi+5DGyR9GWMJU98hjFGU2FRy3IJJoNLV+dLwqAulPIHalwRO3K3/j838Gac
 huZuAiKjUVK/T76rUrlT/oRahwCITKGcZkEYe8JlGKEqd1bHCBX6OvhkIPEA38B5YFJI
 c/KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754090776; x=1754695576;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ds5bOf1mClv1Yo1P8ZbOERyGLq4Dww231skfWEq4G6E=;
 b=PksagR/B0f/JsJOx3+4LIJ7HcKSz7J82r4nx7Xep99sBS+siA6M7pFugBVL9cXqId7
 gOP1I5sGJNMFDe0QS9vGjKvHOP5BDK/db+AbAn/d8g/QyVhaI79+F6Qw1AXSB3zCHGyX
 KGCwjX0I444MtGf1rpDI3azrozi8MdiXaxyZ/ZTj50DH4YoN6k6rY2Z2mn/IIfsbGZRY
 NWuMZ7tGa2hyHsG+HSHXc3Rd94Ddk0OScVccAw8TwiYymEGZjzzOR+yXQtk7gHEGPXkA
 ILQj3JhYpRhPFkhA737PL2WzSpC1+XlpDwEMS9nEK2bk4AZqGS1c5WoBSMfWiQ43OqLm
 qdWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+TmI0xHCpLm1ITG7+JBVXllD7qk/D32BFZ1pwWWq/PXRnKO5XkjqJlvV8qknPZL831RajU3fbZw==@nongnu.org
X-Gm-Message-State: AOJu0YyotSUYVpEluqEx4rkt3cRt/i1aHafzykG8K3w3ZOfq+xvYFUW7
 N46wQ3Wt7Gb8goqE+H0phhBWCvlYUgn5pAWFmTCHm4jARGNZJ9VAvjbYC6bZYcbIlA0=
X-Gm-Gg: ASbGncvkn0uiOKdzgckcjkW48vB3HbrVwU5gPWxxoaWz8NmxpSxyxMVZ7GMrjQNhfAa
 XkKJQpGTLyM1qUhpKV/CmYoywEfMe/evdxH8s+ILbCC/3NJ31wR5uHrerbSbMsP0C2s/ruuZhIw
 ask3nn7I0OY7li7UiGeoSYxWUhXV/xGukGGY59/536Mwrah7qJ07FNLBiS6fBwTAfc29dzXAlZz
 7gZWtPpW9JiwAkDpUdeKARqQBFLAnK5gKzo0ku0quT6OtXLI1urO5sJifK2xKvgVJkB2Z7SQPNo
 y8EEwGhegVggLrAB5EjI3hAsY7uwqHp7qA+IC3HMM/0Bo3aSs5POLImaEMEfz50M0a/1DI/JgEv
 Zxl5PmX31DBAUAsQXRfGlAw==
X-Google-Smtp-Source: AGHT+IENC82BTZ555cc+T5OafpKrVdspfqtcV4W2B0s2E56Lh6j8y9icgu4D5409e0rm2T2fc+bkJQ==
X-Received: by 2002:a17:90b:3c04:b0:31f:69fd:a72b with SMTP id
 98e67ed59e1d1-321162b7285mr1956430a91.29.1754090776239; 
 Fri, 01 Aug 2025 16:26:16 -0700 (PDT)
Received: from pc.. ([38.41.223.211]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3207eca6d3asm5628217a91.23.2025.08.01.16.26.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Aug 2025 16:26:15 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, richard.henderson@linaro.org,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Weiwei Li <liwei1518@gmail.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, philmd@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 00/11] single-binary: compile once semihosting
Date: Fri,  1 Aug 2025 16:25:58 -0700
Message-ID: <20250801232609.2744557-1-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

This series compiles once semihosting files in system mode.
The most complicated file was semihosting/arm-compat-semi.c, which was carefully
cleaned in easy to understand steps.

v2
--

- use vaddr for syscalls.c/.h
- static qualifier for console_{in,out}_gf
- use vaddr for arm-compat-semi.c
- semihosting/arm-compat-semi: fix cast for common_semi_set_ret

Pierrick Bouvier (11):
  semihosting/syscalls: compile once in system and per target for user
    mode
  semihosting/syscall: replace uint64_t with vaddr where appropriate
  semihosting/guestfd: compile once for system/user
  semihosting/arm-compat-semi: remove common_semi_sys_exit_extended
  target/{arm,riscv}/common-semi-target: eradicate target_ulong
  include/semihosting/common-semi: extract common_semi API
  semihosting/arm-compat-semi: eradicate sizeof(target_ulong)
  semihosting/arm-compat-semi: replace target_ulong with uint64_t
  semihosting/arm-compat-semi: replace target_long with int64_t
  semihosting/arm-compat-semi: remove dependency on cpu.h
  semihosting/arm-compat-semi: compile once in system and per target for
    user mode

 include/semihosting/common-semi.h             |   5 +
 include/semihosting/guestfd.h                 |   7 --
 include/semihosting/semihost.h                |   2 +
 include/semihosting/syscalls.h                |  30 ++---
 semihosting/arm-compat-semi-stub.c            |  19 +++
 semihosting/arm-compat-semi.c                 |  66 ++++++++---
 semihosting/guestfd.c                         |  26 +----
 semihosting/syscalls.c                        | 109 +++++++++---------
 ...mon-semi-target.h => common-semi-target.c} |  23 ++--
 ...mon-semi-target.h => common-semi-target.c} |  22 ++--
 semihosting/meson.build                       |  18 +--
 target/arm/meson.build                        |   4 +
 target/riscv/meson.build                      |   4 +
 13 files changed, 183 insertions(+), 152 deletions(-)
 create mode 100644 semihosting/arm-compat-semi-stub.c
 rename target/arm/{common-semi-target.h => common-semi-target.c} (58%)
 rename target/riscv/{common-semi-target.h => common-semi-target.c} (52%)

-- 
2.47.2


