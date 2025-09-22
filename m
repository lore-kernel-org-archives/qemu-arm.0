Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A9A6CAC5AC
	for <qemu-arm@archiver.kernel.org>; Mon, 22 Sep 2025 09:41:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v0czX-0002Oo-9D; Mon, 22 Sep 2025 05:37:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1v0czD-00022e-3T
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 05:37:31 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1v0cz2-0000cF-CE
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 05:37:30 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3ecdf2b1751so2388983f8f.0
 for <qemu-arm@nongnu.org>; Mon, 22 Sep 2025 02:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758533834; x=1759138634; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DY0XmkUw/px6He2/QViLhoiKimIF9WS2BOzUGcig47M=;
 b=PRJhJXsQuRNVUX4enWK7NFbkSDSg0iemfSk5i549omoA0IaoiJNnV0MVuPyfBse8Pg
 Tov9TRIezI/UsJvSCq1S5ujaiIUfjr58Bzq3AitgEFizGBZU4NHnKqoajYvz36DMGITu
 8mHCiLFZC1AYpxUEy1tMVTWyvw2Za0houDPMRac7MenoHmiAIhQReXpQwuiw1sGghjns
 6bthUT/WIUU16q4FwLvrhCOdRBBxPB8MJftFMUouQQxkJkRuv6QkKVNlPH0saItxZA4T
 ANarUY00AuZ9gRRl8gtxoS61WX3PKbvR2mNsnUr21+NNozXeR+7KxJ0xqmXo0HBaC4P0
 u6Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758533834; x=1759138634;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DY0XmkUw/px6He2/QViLhoiKimIF9WS2BOzUGcig47M=;
 b=KemIZkTqsMwOjVSMpmFKZ0ewilbRd3wUtrmeRiblvtktoEUpVUKUjZQbk+J6yRAYzn
 ql6GCQbvcIgjDPf/SQJN3xLLJSZ9tOJzmVVsbhSzpXxgW4kpIy6dwco+UHEX/kCzZX5a
 vl5XK+ped0mbc1eDof4HfJHUe8EztRXfr1dJw4rJ8RGLLlvqo90vvYWW07vB3BZbaRk2
 Epwecbl+hzKemA8JrkxNCPwFtC0yFlTs1bmDIpa7VLfS9XjS+PGvAisCXAEwLEtG8kHc
 NZpJy1kx0CYYGplDqkJowH/CzDLArKU8uBQb3JhmB/oCxfW5H/58lnA0BFrx6XtGGNcA
 PlfA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVChjthPPhABImQNUpMHS+V/ZFuHNdHmOHOVurNP05yg3YXe4IJJz3jGtmXSaOOSyiUW1DM6rKGkQ==@nongnu.org
X-Gm-Message-State: AOJu0YycMNktC9cL4ABfJTiesdiuqUETKv5UjS4oYIAFKf1Xq73zOyab
 TuzX3WmP4nevLysqEHiJiLI7LnddTY/vzOKPqrR8Pd5+2O/9MwimXqHaeQ8VRR/V1vQ=
X-Gm-Gg: ASbGnctIfUabgCJMoIPELtZUXiWPFj0sRON9bHEOq1u5XCl1snkCYw1KyJ3i2inkhcX
 6kXvKpytOubuEYrM8T1pE6VLlTxRIfeogaAY2Dv86vUnIPA5Qzzzst+KNIqt3SgdmYmEHTJvmFq
 fgYGmRtIVtAqLvIGmVZnj1c82QNSsqUlK4dIYnqjF1L2WhewStqxbAQDqwZNDaSwpjqT++nh0RH
 gjim81Srzcpk5qFroyGoAyDujbzso85Dl8035il5obu56k3sRtaXbSMcPXO8kkvRPXpPDZWKAeZ
 a5a0/FodVfzkEcw/buKyBmNgiOwc4C00ZYSbWFnBYDg/TXJyhqqzRumDKWvtv2V9sWIEoeyCmup
 oOML9q9OkMFtjpa6zqUCNfwwzmkG1J9RT0A==
X-Google-Smtp-Source: AGHT+IHWrI4/43aheYywm2/WnfKmVmn8vZizXgUs4ZCZPfXuPbJzRHgAuqENnwGr/lbSzIRfsf+B8Q==
X-Received: by 2002:a05:6000:440a:b0:3f9:e348:f5c with SMTP id
 ffacd0b85a97d-3f9e34815b0mr2918240f8f.60.1758533834086; 
 Mon, 22 Sep 2025 02:37:14 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46d7a566a27sm27122065e9.20.2025.09.22.02.37.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 02:37:12 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 85B005F7B1;
 Mon, 22 Sep 2025 10:37:11 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH 00/25] September maintainer updates (docs, plugins,
 semihosting) pre-PR
Date: Mon, 22 Sep 2025 10:36:45 +0100
Message-ID: <20250922093711.2768983-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

These are all bits and pieces that have been mostly reviewed when
posted with a few minor additional patches. I plan to send the PR by
the end of the week.

Plugins

  - minor fix checking return values from Peter
  - Pierrick's nifty uftrace plugin

Semihosting

  - build the sub-system once (single binary work)

Misc

  - typo fix
  - tweak to checkpatch license checking
  - *new* gitlab-failure-analysis script

The following still need review:

  scripts/ci: add gitlab-failure-analysis script
  docs/devel: fix typo in code-provenance.rst

Alex.

Alex Bennée (2):
  docs/devel: fix typo in code-provenance.rst
  scripts/ci: add gitlab-failure-analysis script

Nabih Estefan (1):
  checkpatch: Ignore removed lines in license check

Peter Maydell (1):
  contrib/plugins/execlog: Explicitly check for
    qemu_plugin_read_register() failure

Pierrick Bouvier (21):
  semihosting/syscalls: compile once in system and per target for user
    mode
  semihosting/syscalls: replace uint64_t with vaddr where appropriate
  semihosting/guestfd: compile once for system/user
  semihosting/arm-compat-semi: change common_semi_sys_exit_extended
  target/riscv/common-semi-target: remove sizeof(target_ulong)
  target/{arm, riscv}/common-semi-target: eradicate target_ulong
  include/semihosting/common-semi: extract common_semi API
  semihosting/arm-compat-semi: eradicate sizeof(target_ulong)
  semihosting/arm-compat-semi: replace target_ulong with vaddr
  semihosting/arm-compat-semi: eradicate target_long
  semihosting/arm-compat-semi: remove dependency on cpu.h
  semihosting/arm-compat-semi: compile once in system and per target for
    user mode
  contrib/plugins/uftrace: skeleton file
  contrib/plugins/uftrace: define cpu operations and implement aarch64
  contrib/plugins/uftrace: track callstack
  contrib/plugins/uftrace: implement tracing
  contrib/plugins/uftrace: implement privilege level tracing
  contrib/plugins/uftrace: generate additional files for uftrace
  contrib/plugins/uftrace: implement x64 support
  contrib/plugins/uftrace_symbols.py
  contrib/plugins/uftrace: add documentation

 docs/about/emulation.rst                      | 199 ++++
 docs/devel/code-provenance.rst                |   2 +-
 include/semihosting/common-semi.h             |   6 +
 include/semihosting/guestfd.h                 |   7 -
 include/semihosting/semihost.h                |   2 +
 include/semihosting/syscalls.h                |  30 +-
 contrib/plugins/execlog.c                     |   1 +
 contrib/plugins/uftrace.c                     | 878 ++++++++++++++++++
 semihosting/arm-compat-semi-stub.c            |  19 +
 semihosting/arm-compat-semi.c                 |  63 +-
 semihosting/guestfd.c                         |  26 +-
 semihosting/syscalls.c                        | 109 ++-
 ...mon-semi-target.h => common-semi-target.c} |  22 +-
 ...mon-semi-target.h => common-semi-target.c} |  23 +-
 contrib/plugins/meson.build                   |   3 +-
 contrib/plugins/uftrace_symbols.py            | 152 +++
 scripts/checkpatch.pl                         |   3 +-
 scripts/ci/gitlab-failure-analysis            | 117 +++
 semihosting/meson.build                       |  18 +-
 target/arm/meson.build                        |   4 +
 target/riscv/meson.build                      |   4 +
 21 files changed, 1539 insertions(+), 149 deletions(-)
 create mode 100644 contrib/plugins/uftrace.c
 create mode 100644 semihosting/arm-compat-semi-stub.c
 rename target/arm/{common-semi-target.h => common-semi-target.c} (59%)
 rename target/riscv/{common-semi-target.h => common-semi-target.c} (53%)
 create mode 100755 contrib/plugins/uftrace_symbols.py
 create mode 100755 scripts/ci/gitlab-failure-analysis

-- 
2.47.3


