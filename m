Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14887CAC5AE
	for <qemu-arm@archiver.kernel.org>; Thu, 25 Sep 2025 02:57:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v1c8x-0001wM-4M; Wed, 24 Sep 2025 22:55:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v1c8t-0001sa-Ty
 for qemu-arm@nongnu.org; Wed, 24 Sep 2025 22:55:36 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v1c8r-0002TZ-5L
 for qemu-arm@nongnu.org; Wed, 24 Sep 2025 22:55:35 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3ed20bdfdffso376594f8f.2
 for <qemu-arm@nongnu.org>; Wed, 24 Sep 2025 19:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758768922; x=1759373722; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1YxsdJ/dwXQf54qmhwO23pjL//EyDJ2Jun+bGdlFb3w=;
 b=Z8NXHxq7Qncp1UhQiOPQCDH3p9bc7lq1+VdsE2YNWHmuqzDCXp8kYZQm8IU8RDfyTb
 Dxeqi3mWrLnWVZANYEnTg/Jpu3t0Tb8PiG0ES3zsyz6ZOpLATxOAMviaTFnz/bh4FUAP
 ncPu8BCES5i5QPSImoqqHnIzfTslZkv6j5iZuZyCVqgGGXLCea63WvjII9aYQzP1veWY
 jqjEwy8aTZQ6asf48zxO4OyPJjpuUAo8kBPQUjg4iEuDT9YWSLU+ceOs5hsfD09SdLn4
 4MZtOQ1zayqDK77dLnFeeHNS2ITkCw3hHbnPIqTcdMhezJuAMJOfcRJBk+8QqFNhYaYr
 4uTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758768922; x=1759373722;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1YxsdJ/dwXQf54qmhwO23pjL//EyDJ2Jun+bGdlFb3w=;
 b=RCoi55stZMdZOhSYJKT4bLnEkDDh6V0fc6QeWr+d//5g6PuWQcFUhG+WHcY7OT9FbR
 aqJpz33LcYTR4Q2M03c1eJz6r5fIqydgtJ3wIq13Sr59De5d9HfY7qjaJHjfiEFWsAYr
 S0Nwv16txUIcXlWtl5LFyaqSmyipxdcsim2Z9wZjHfy/D4pHyEeq5zXhg3Y01e+EIICz
 t7ttm2+m0tbNQas+1KSAG3g5QHuKbuHa+EPdxOJvNKZ2jxE4YiM9KeVG+5YjGmKQlO1z
 Hx1Rl9fFC3FYxRLsVfMDObLp8xXLStCbH1ILaoCVQECl9P4LD4zUsb3BqQ9uSMwQg12F
 Lmhw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDHCdJYUni/uUvO3NHNA8l8r741ufz+Z3JttidesLcDxB1WoFihMIUV7GES84DKVKaRePhYPk3Bg==@nongnu.org
X-Gm-Message-State: AOJu0Yyn5IBFPDv9bmMG6micyPOVaxzo5BnUodLZZ5zM+ZzbegN5YMuW
 5Lb+D8oaep+3L5Q1wEQdw2rbBcO6P1xtbUpaOYluSWUhb0Q0/812f66wuHxTP2hJXJw=
X-Gm-Gg: ASbGncsFzAcrQVw06ZBWgsG8YwJ1c7ArHx+8vxNc6SyTniXu0dh7K2BWev17ORbvXpv
 nXC+LhEpXf8sVBYdt+jJ/5AWZIGiRFkGM20DIuLmljH+ekfDY5dpV30nLDAz0T69Tero+1JMdAS
 8YoLY7YFW0ZmIvf+Dcpwbs8B6JQ1yZnh+nOrNLNOV23i1+FLVXZGaMcTVe8INENhmeSJKhlCh2W
 c1s//SNprAks3zX515aM0leuDbzMeX5UOmX9jVjBXSwBTrcmFAeAPzJl3PocojcUxV3ftw2gEjQ
 cptrQxCoGa3Pnr29mySI4Kq/TqkSaiBAF4vS8oun6Cm7csNU8smTXZwAmRKboSh4fPwgYkEcpK7
 N2XicUqlpIiCHXhtH5S0xEl5aakdINeDrQSPtcG3IU+gci9SU64AjYdkd4+76MYT3TvNZU0qq
X-Google-Smtp-Source: AGHT+IHi9KmpGUp4F9i+ushm8citrvWXcxaj1RbbwdJ9nVk9DfBxJDnMe1IcKO0bY0LOVzs9xhmbfg==
X-Received: by 2002:a05:6000:2304:b0:3e3:e7a0:1fee with SMTP id
 ffacd0b85a97d-40e46514dfdmr1666905f8f.5.1758768922292; 
 Wed, 24 Sep 2025 19:55:22 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e330dcb82sm7784185e9.4.2025.09.24.19.55.21
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 24 Sep 2025 19:55:21 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Phil Dennis-Jordan <phil@philjordan.eu>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mads Ynddal <mads@ynddal.dk>, Alexander Graf <agraf@csgraf.de>,
 Cameron Esfahani <dirty@apple.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Subject: [PATCH 0/4] cpus: Cleanups around cpu running state changes
Date: Thu, 25 Sep 2025 04:55:15 +0200
Message-ID: <20250925025520.71805-1-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
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

Few cleanups following Paolo's recent "accel, cpus: clean up
cpu->exit_request" work (now merged), extracted from my
"split-accel" work.

Philippe Mathieu-Daudé (4):
  cpus: Only resume halted CPUs
  cpus: Access CPUState::thread_kicked atomically
  accel/hvf: Make async_safe_run_on_cpu() safe
  accel/tcg: Use cpu_is_stopped() helper to access CPUState::stopped

 accel/tcg/tcg-accel-ops-rr.c | 2 +-
 system/cpus.c                | 8 +++++---
 target/arm/hvf/hvf.c         | 2 ++
 target/i386/hvf/hvf.c        | 2 ++
 4 files changed, 10 insertions(+), 4 deletions(-)

-- 
2.51.0


