Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FA3BCA1009
	for <qemu-arm@archiver.kernel.org>; Wed,  3 Sep 2025 10:08:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1utkP9-0007z1-0n; Wed, 03 Sep 2025 06:07:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1utkP6-0007tz-LI
 for qemu-arm@nongnu.org; Wed, 03 Sep 2025 06:07:48 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1utkP4-00087D-59
 for qemu-arm@nongnu.org; Wed, 03 Sep 2025 06:07:47 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-45b7c01a708so22787265e9.3
 for <qemu-arm@nongnu.org>; Wed, 03 Sep 2025 03:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756894062; x=1757498862; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=L/isQ/voCCrlwxjSgIKFU1t8iMBeSGrxTXbkNGx8ieU=;
 b=cM0zi/GJNKwcVIFg7B1wdIFhNKSVg0p+LGVIgBGyru1TBTz7JqxeVP8opZSlKxIDpl
 iDBihyBYJR6QSWMTdSrDbqIkb3lVBZ+C5Xgdgl2+s4Mvnvf8E4f+sCa7oqLvAj1YRFog
 GouDKpBXErLRPww54pVGxN8D2dvU5fd08CmXyUvFSCqXu/SF5Otlr4OhQSPYEplUkkpZ
 Jg46FrbHHdDUhDKWtAOtDPw2BgJrjkoun4Ruc/WaRo08y1GRmPwtkDSBA0t9mP4Ld7f1
 eovcx3CGypX3MZAoA3QXM6/nQTafm+B7+nr0APABTauCHTjQVr0Eyq3Wv3vM+m2o1Oju
 YZvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756894062; x=1757498862;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=L/isQ/voCCrlwxjSgIKFU1t8iMBeSGrxTXbkNGx8ieU=;
 b=XbY+Iz5W2u2ySPHxNEi9UUznGGXOwvxI1CKjSk6efdY17vheMYVaRsL6yNFBrDnOXH
 ReLxwO1xW0t0hZbdZWmt3UoUsF+2JoosUbZVUicFIm0gKQeldHCUIcuYL2p8OBkvPYhz
 W+AoZBR5GPW+Fu2H0tjlG3DJQ3wQdeDgsqYHLr7amKz3tnvI/kIQo2XNw+/LbihVhY1I
 1hogc5UCzK+X8UYLPix+Pv07hWR90ic+FhOEuTySPO8Cv72Jk8WT0sXqxBCnyE0NZoH/
 1zGtFeFYBJMq96qKjR/ztDUe52zfoUhuRGo4jiXa2dWlNzKuMirz/yi+iqyXvjdAE9NC
 KcQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6Dtziqni0nSxn7A8fKZXuY6u6nzhlXBwd+zmTI9acFUkJmtDAFlxzJEMJRkQDjMMg4kDJ1NnHNQ==@nongnu.org
X-Gm-Message-State: AOJu0YwLOG7yyzUMVkag+VeAHD94RWWquA1io7hpJhDDfoq5U4yxGoSD
 sR/MJguxhb2iGtv61Z36vcpCZo/saWcRr2QCODagPNw6SSLmvYQ2IQU4VCukKTpDv/s=
X-Gm-Gg: ASbGncsySmQMvNyPmA7MuN2QEpsz9ZzZDqENc2FApnylyLmZ8l4OOZEq6BVoJNVJhez
 4pCRwI3s8RTMhKx4UxflhHxLXIyaxPr8S1B+TYJBWD4QnRtLQsXy91Ez9zdBN1c4brQWyzb/RiW
 fsqys2e8Dw9eR4avbXnFcRfzG87oEv3qLmlhnzWGptoyEu6vxEmECKN+aB6tODLLNRiY0Jd7HYF
 v6/4VwJU0bj/uazlr/xeQRgpkatuq0Be6BFNz+MfiECEhr6dXV5LsYsQuKkqEk3SK3gw6W08y0/
 Ha9iSMkep55b6JdFRW4mWgb4sYC4OA7w9MjhF3lzX4AjbSkcKzHgxUXD7A49C84v6GqWuSuXZe1
 GSOwXXRTxEqwIkR4phHrF8sXBD7jOTJCuK3uQ06VxUVU3TP/tvAx7he7lnvSY7qh8JM+abQqqDn
 Nz6EyPgQ==
X-Google-Smtp-Source: AGHT+IE7xuuV6mXckXtucMGEJxPJpZlNxD1lvEByfXQc0ZZYKNjBf/pFEGH9NAS5gtbYeSloiUVanw==
X-Received: by 2002:a05:600c:3153:b0:458:a559:a693 with SMTP id
 5b1f17b1804b1-45b8557047amr122900305e9.18.1756894062008; 
 Wed, 03 Sep 2025 03:07:42 -0700 (PDT)
Received: from localhost.localdomain (98.red-88-29-180.dynamicip.rima-tde.net.
 [88.29.180.98]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b661d87a7sm188551125e9.2.2025.09.03.03.07.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 03 Sep 2025 03:07:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alexander Graf <agraf@csgraf.de>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Maydell <peter.maydell@linaro.org>, Mads Ynddal <mads@ynddal.dk>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <rbolshakov@ddn.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 00/24] target/arm/hvf: Consolidate
Date: Wed,  3 Sep 2025 12:06:36 +0200
Message-ID: <20250903100702.16726-1-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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

- Fix a pair of memory leak
- Check a pair of return values
- Mention calls which must be run on vCPU thread
- Force MIDR
- Use hv_vcpu_config_create/hv_vcpu_config_get_feature_reg
  when not running on vCPU thread
- Factor hvf_handle_vmexit() / hvf_handle_exception(() out
- Call hv_vcpu_run() in loop
- Guard hv_vcpu_run() between cpu_exec_start/end()
- Restrict ARM specific in AccelCPUState

Based-on: <20250829152909.1589668-14-pbonzini@redhat.com>

Mohamed Mediouni (2):
  target/arm/hvf: Hardcode Apple MIDR
  target/arm/hvf: switch hvf_arm_get_host_cpu_features to not create a
    vCPU

Philippe Mathieu-Daudé (22):
  target/arm/hvf: Release memory allocated by hv_vcpu_config_create()
  target/arm/hvf: Check hv_vcpus_exit() returned value
  target/arm/hvf: Check hv_vcpu_set_vtimer_mask() returned value
  accel/hvf: Rename hvf_vcpu_exec() -> hvf_arch_vcpu_exec()
  accel/hvf: Rename hvf_put|get_registers -> hvf_arch_put|get_registers
  target/arm/hvf: Mention flush_cpu_state() must run on vCPU thread
  accel/hvf: Mention hvf_arch_init_vcpu() must run on vCPU thread
  target/arm/hvf: Mention hvf_wfi() must run on vCPU thread
  target/arm/hvf: Mention hvf_sync_vtimer() must run on vCPU thread
  target/arm/hvf: Mention hvf_arch_set_traps() must run on vCPU thread
  accel/hvf: Mention hvf_arch_update_guest_debug() must run on vCPU
  target/arm/hvf: Mention hvf_inject_interrupts() must run on vCPU
    thread
  accel/hvf: Implement hvf_arch_vcpu_destroy()
  target/arm/hvf: Factor hvf_handle_exception() out
  target/arm/hvf: Factor hvf_handle_vmexit() out
  target/arm/hvf: Keep calling hv_vcpu_run() in loop
  cpus: Trace cpu_exec_start() and cpu_exec_end() calls
  accel/hvf: Guard hv_vcpu_run() between cpu_exec_start/end() calls
  target/arm: Call aarch64_add_pauth_properties() once in host_initfn()
  accel/hvf: Restrict ARM specific fields of AccelCPUState
  target/arm: Rename init_cpreg_list() -> arm_init_cpreg_list()
  target/arm: Add arm_destroy_cpreg_list() helper

 include/system/hvf_int.h    |  23 ++--
 target/arm/internals.h      |   4 +-
 accel/hvf/hvf-accel-ops.c   |   4 +-
 cpu-common.c                |   3 +
 target/arm/cpu.c            |   2 +-
 target/arm/cpu64.c          |   8 +-
 target/arm/helper.c         |  10 +-
 target/arm/hvf/hvf.c        | 206 ++++++++++++++++++++++--------------
 target/i386/hvf/hvf.c       |   8 +-
 target/i386/hvf/x86hvf.c    |   4 +-
 target/arm/hvf/trace-events |   1 +
 trace-events                |   2 +
 12 files changed, 173 insertions(+), 102 deletions(-)

-- 
2.51.0


