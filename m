Received: by 2002:a17:504:1bc1:b0:1be9:327d:8ee3 with SMTP id v1csp977788njg;
        Wed, 18 Sep 2024 12:23:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXZ83vda0mwRJ7NKi62JO/wt9sL3rjtxRWz28FxcIr4Y0x2aGWHtUhNYlwPfkTHLNIfpHemjakD3uWXAQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGhT5Y+yxdV/6jfpkEMNAlMS3coxHDnPqNgjRryLhd/fo8hbvYli/OA1PLwxcIOqGWZJtDF
X-Received: by 2002:a05:620a:3907:b0:7a9:c8f3:999c with SMTP id af79cd13be357-7ab30d0bbb9mr3629021485a.5.1726687403927;
        Wed, 18 Sep 2024 12:23:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726687403; cv=none;
        d=google.com; s=arc-20240605;
        b=ZeS8SorKCbM4GuBWpVH+3Dy+YXClf2xJ21G+AqrcL8lF261pZ1i7YScD33WpXwnMJR
         n66TDeDR/IXZFca1zTCRSXe/mE2bj031vvYRrdy7B8u3DbPJdgcwI9iSUXkevMgNoR8T
         QoM1mWXpdfhGdXN6UOa/i0TECxh4YXxLWw8EeoYz2Rt3oipDRvlSv862mK84soP9ua6c
         J765waCJV3EfxN4nuDuw5GPneyEDkwWiqxIYPWHTOLBxGd6RdG6ppS+qBwdeF5gYVED+
         e8f4bokmMV4OEotXHrep3nW4L+HORyK5AYVpGT+AQjbtAU6ozV4nRXjWoOyGu92iJyu8
         vozA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :mime-version:date:dkim-signature;
        bh=FtYln3sMZtCI6MtYf35A77hJSAn4zMFGlLH0jjiCAOY=;
        fh=2mssAqYKJuMcD/Ya5YUzhxP7uPixmdZ7O75Bi0gtEhM=;
        b=gFybeswn+odRvuC+9m20uNnaxsPDGloTdaoWFLfZ4bFMkWjqqAGix8WZ6IXEPs1tcg
         z4/sNQT//wk9RXbl37Qk8rhzc23fmmXOZMU4gwb6SW+Pwhu7jFRtcojuLPQ8Wq39V/th
         hqyyjX+vDzDkFD87g3hRUg2grGVBXXxyx6LiQ5SgInHbsNPLjWt8zxxgGCbuTdGDRE96
         YmpvBAemCFR3+IfY1+9IC5/agi6Bs6h7izxYMnXxT8s1hxbUhZXFebMcCIOycqRJHA1v
         ngIXuzfZRURGkDWoae5T4zG5+wHQmQ73sNVSi4Bdk4Z0rApJeGeVB/guBMqn25OJc2jD
         30tQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=Tvks1cEc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7acb081f98asi11084385a.222.2024.09.18.12.23.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Sep 2024 12:23:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=Tvks1cEc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sr0Gc-0004VU-4b; Wed, 18 Sep 2024 15:23:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3jyjrZgUKCMo9qBy5w44w1u.s426u2A-q72343w3A.47w@flex--tavip.bounces.google.com>)
 id 1sr0GT-0004S1-Qr
 for qemu-arm@nongnu.org; Wed, 18 Sep 2024 15:23:03 -0400
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3jyjrZgUKCMo9qBy5w44w1u.s426u2A-q72343w3A.47w@flex--tavip.bounces.google.com>)
 id 1sr0GQ-0007Hn-GH
 for qemu-arm@nongnu.org; Wed, 18 Sep 2024 15:23:00 -0400
Received: by mail-pf1-x44a.google.com with SMTP id
 d2e1a72fcca58-71930797560so35271b3a.1
 for <qemu-arm@nongnu.org>; Wed, 18 Sep 2024 12:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1726687376; x=1727292176; darn=nongnu.org;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=FtYln3sMZtCI6MtYf35A77hJSAn4zMFGlLH0jjiCAOY=;
 b=Tvks1cEcWdpcFf8Du4rJjI7XtcmPKzuuXV/7fyXUk56fajd/6XFW/RmHLiVjawZsQ1
 E6WcUyVz1QIG9czyxEvXEc43uYTHvMTYQp8AfHYyUEVk0MIgp6snum6N6PWo15ymUNtf
 Kj3WO0bPP1MnsYE5ZvQLwHs4rBQX/KgW8QvB4g5+/+6MrD7MSr0tRN9ZFUqb+jbBYI+P
 TY6J9wqnYLAoFQcNVRyw4TnLDerQqL5rz49szFivkr8AqXdjWPvL2lgBUkQg4+W8EMf2
 2FU3zUQfou32rOz2vf1MOxkvXqzYXsyQ7cRXqzvx8flXIMw/si0lAeJd3lapKanfEl2A
 PU8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726687376; x=1727292176;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FtYln3sMZtCI6MtYf35A77hJSAn4zMFGlLH0jjiCAOY=;
 b=J8jH8uEXA/Q3n500Cedm6p6NKV1yJW8g1vdbf5IGQtBfiyfehR66i+uvUdDdU5/4F2
 G0/fd8uMYGKEM7qTztJGyngblOjttDmJL4m16eEl0x8E4rXrjy1ZLIfjrWEiLRGFH1K/
 oeB3oQv/Dbpxvdx5fCTBar6uhuQaBMCDmLoSYdr6tZwVP6vXY8isJSdZAv/G2Jg0Ngj6
 i12WG83gbYwNualDXIYoHKbJBQIpFR4KK4UsiK3qn7ptMdtdGhe3WPTCtyB/ibgdzZoq
 jTCIoBSHbs6/KlIt2Pywi/Rbp5qiU2WJy4qhWBgwnqCJ4+RiEp5ehXmd86SHMaLKV5HL
 E1LQ==
X-Gm-Message-State: AOJu0YytFyBT/mC1jwGOfga60uyDVl9S0OXnAqldjygn/d2UKrO0ZyRY
 tunOwjihjhFjFy1I0/J0pm4KKZf0DwzJJBbT4P0Se4UQfPJ1n5/Ln5QkK2iXB5KtEvZwOMUBsw=
 =
X-Received: from warp10.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:750])
 (user=tavip job=sendgmr) by 2002:a05:6a00:6f09:b0:718:dfec:9570
 with SMTP id
 d2e1a72fcca58-719263748bbmr42608b3a.6.1726687375785; Wed, 18 Sep 2024
 12:22:55 -0700 (PDT)
Date: Wed, 18 Sep 2024 12:22:28 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.46.0.662.g92d0881bb0-goog
Message-ID: <20240918192254.3136903-1-tavip@google.com>
Subject: [PATCH 00/25] NXP i.MX RT595
From: Octavian Purdila <tavip@google.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, stefanst@google.com, pbonzini@redhat.com, 
 peter.maydell@linaro.org, marcandre.lureau@redhat.com, berrange@redhat.com, 
 eduardo@habkost.net, luc@lmichel.fr, damien.hedde@dahe.fr, 
 alistair@alistair23.me, thuth@redhat.com, philmd@linaro.org, jsnow@redhat.com, 
 crosa@redhat.com, lvivier@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::44a;
 envelope-from=3jyjrZgUKCMo9qBy5w44w1u.s426u2A-q72343w3A.47w@flex--tavip.bounces.google.com;
 helo=mail-pf1-x44a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ejx1455fci0v

This patch set adds support for NXP's RT500 MCU [1] and the RT595
EVK[2]. More RT500 device models will be submitted in future patch sets.

This is a minimal patch set that allows running the NXP MCU SDK hello
world example[4].

The patch set introduces a (python) tool that generates C header files
from ARM SVD files[3]. This significantly reduces the effort to write
a new device model by automatically generating: register definitions
and layout (including bit fields), register names for easier debugging
and tracing, reset register values, register write masks, etc.

The generated files are commited and not generated at compile
time. Build targets are created so that they can be easily regenerated
if needed.

Changes since RFC v3:
 * rewrite the flexcomm devices to take advantage of QEMU's object
   model / class inheritance and overlapped memory region and remove
   the adhoc flexcomm APIs
 * remove code duplication by using common fifo functions for USART
   and SPI
 * fix copyright in one of the headers
 * remove hw/registerfields.h from generated headers as hw/register.h
   is already included
 * fix signed off email address for the qtests API patches
 * fix description (tests/unit -> tests/qtest) for RT500 clock
   controller tests
 * convert devices to use the Resettable interfaces
 * add support for migration
 * rework the fifo32 tests on top of Mark's and Phillippe's work

Changes since RFC v2:
 * convert tests from unit to qtest
 * move i2c and spi testers from unit tests to hw/misc devices
 * switch to using RegisterAccessInfo to generate register information
   like register names, reset values, or read-only mask
 * use register_write instead of adding a new reg32_write API
 * remove reg32_aligned_access completly and rely on memops access
   constraints and size of access for alignment checks
 * add qtest APIs for checking memory access faulires
 * add qtest APIs for accessing the device clock frequency
 * fix bugs detected by address sanitizers

Changes since RFC v1:
 * setup scripts/git.orderfile
 * svd_gen_header: add support for multi line comments
 * svd_gen_header: use qemu register fields instead of bitfields
 * svd_gen_header: generate register write mask array
 * add mcux-soc-svd as a subproject instead of commiting the rt595 SVD
   file directly
 * svd generated headers: don't generate them at compile time, instead
   commit the generated headers and create compile targets so that it is
   easy to regenerate them
 * remove pysvd dependency; developers who need to (re)generate svd
   headers need to have it installed on the host machine
 * use DEFINE_TYPES where possible
 * use g_strdup_printf where possible
 * reduce iterator variables scopes
 * hard code rt500 to use the cortex-m33
 * use static for local arrays initializers
 * remove rt500 properties as they are not yet used
 * drop private/public comments
 * remove unused headers
 * free rt500 mem regions in rt500_unrealize() instead of
   rt500_finalize
 * use memops access constraints where possible instead of
   reg32_aligned_access
 * flexspi: use 64bit properties for mmap_size property
 * rstctl: use a generic abstract type and remove the  "num" property
 * flexspi: don't call get_system_memory() directly and remove
   mmap_base property

[1] https://www.nxp.com/docs/en/data-sheet/IMXRT500EC.pdf
[2] https://www.nxp.com/webapp/Download?colCode=MIMXRT595EVKHUG
[3] https://arm-software.github.io/CMSIS_5/SVD/html/index.html
[4] Building and running the NXP MCU SDK hello world example

    Clone the following git repos:

    https://github.com/nxp-mcuxpresso/cmsis.git,
    https://github.com/nxp-mcuxpresso/mcux-sdk.git
    https://github.com/nxp-mcuxpresso/mcux-sdk-examples.git

    in the following directories: CMSIS, core, examples.

    cd examples/evkmimxrt595/demo_apps/hello_world/armgcc

    ARMGCC_DIR=/usr CFLAGS=-I../../../../../CMSIS/CMSIS/Core/Include \
      sh build_flash_debug.sh

    qemu-system-arm --machine rt595-evk -kernel flash_debug/hello_world.elf \
      -global armv7m.init-nsvtor=0x08001000 -global armv7m.init-svtor=0x08001000 \
      -chardev stdio,id=flexcomm0

Octavian Purdila (22):
  fifo32: add peek function
  tests/unit: add fifo32 tests
  Add mcux-soc-svd subproject
  hw/misc: add support for flexcomm
  hw/misc/flexcomm.c: add common fifo functionality
  hw/char: add support for flexcomm usart
  hw/i2c: add support for flexcomm i2c
  hw/misc: add support for RT500's clock controller
  hw/ssi: add support for flexspi
  hw/misc: add support for RT500's reset controller
  hw/arm: add basic support for the RT500 SoC
  hw/arm: add RT595-EVK board
  tests/qtest: add register access macros and functions
  system/qtest: add APIS to check for memory access failures
  tests/qtest: add flexcomm tests
  tests/qtest: add flexcomm usart tests
  hw/misc: add i2c-tester
  tests/qtest: add tests for flexcomm i2c
  hw/ssi: allow NULL realize callbacks for peripherals
  hw/misc: add spi-tester
  systems/qtest: add device clock APIs
  tests/qtest: add tests for RT500's clock controller

Sebastian Ene (2):
  hw/ssi: add support for flexcomm spi
  tests/qtest: add tests for flexcomm spi

Stefan Stanacar (1):
  scripts: add script to generate C header files from SVD XML files

 meson.build                                   |    4 +
 include/hw/arm/rt500.h                        |   44 +
 include/hw/arm/svd/flexcomm.h                 |  112 +
 include/hw/arm/svd/flexcomm_i2c.h             | 1190 ++++++
 include/hw/arm/svd/flexcomm_spi.h             | 1036 +++++
 include/hw/arm/svd/flexcomm_usart.h           | 1021 +++++
 include/hw/arm/svd/flexspi.h                  | 2656 +++++++++++++
 include/hw/arm/svd/rt500.h                    |   63 +
 include/hw/arm/svd/rt500_clkctl0.h            | 2483 ++++++++++++
 include/hw/arm/svd/rt500_clkctl1.h            | 3396 +++++++++++++++++
 include/hw/arm/svd/rt500_rstctl0.h            |  858 +++++
 include/hw/arm/svd/rt500_rstctl1.h            | 1371 +++++++
 include/hw/char/flexcomm_usart.h              |   33 +
 include/hw/i2c/flexcomm_i2c.h                 |   40 +
 include/hw/misc/flexcomm.h                    |   57 +
 include/hw/misc/flexcomm_function.h           |   55 +
 include/hw/misc/i2c_tester.h                  |   30 +
 include/hw/misc/rt500_clk_freqs.h             |   18 +
 include/hw/misc/rt500_clkctl0.h               |   35 +
 include/hw/misc/rt500_clkctl1.h               |   36 +
 include/hw/misc/rt500_rstctl.h                |   32 +
 include/hw/misc/spi_tester.h                  |   32 +
 include/hw/qdev-clock.h                       |   10 +
 include/hw/ssi/flexcomm_spi.h                 |   36 +
 include/hw/ssi/flexspi.h                      |   31 +
 include/qemu/fifo32.h                         |   28 +
 tests/qtest/libqtest-single.h                 |  116 +
 tests/qtest/libqtest.h                        |   98 +
 tests/qtest/reg-utils.h                       |   70 +
 hw/arm/rt500.c                                |  329 ++
 hw/arm/rt595-evk.c                            |   64 +
 hw/char/flexcomm_usart.c                      |  288 ++
 hw/core/qdev-clock.c                          |    2 +-
 hw/i2c/flexcomm_i2c.c                         |  250 ++
 hw/misc/flexcomm.c                            |  411 ++
 hw/misc/i2c_tester.c                          |  109 +
 hw/misc/rt500_clkctl0.c                       |  253 ++
 hw/misc/rt500_clkctl1.c                       |  238 ++
 hw/misc/rt500_rstctl.c                        |  258 ++
 hw/misc/spi_tester.c                          |   67 +
 hw/ssi/flexcomm_spi.c                         |  422 ++
 hw/ssi/flexspi.c                              |  181 +
 hw/ssi/ssi.c                                  |    4 +-
 system/qtest.c                                |   95 +-
 tests/qtest/flexcomm-i2c-test.c               |  170 +
 tests/qtest/flexcomm-spi-test.c               |  145 +
 tests/qtest/flexcomm-test.c                   |   82 +
 tests/qtest/flexcomm-usart-test.c             |  316 ++
 tests/qtest/libqtest.c                        |  102 +-
 tests/qtest/rt500-clkctl-test.c               |  195 +
 tests/unit/test-fifo.c                        |   50 +
 hw/arm/Kconfig                                |   12 +
 hw/arm/meson.build                            |    4 +
 hw/arm/svd/meson.build                        |   35 +
 hw/char/meson.build                           |    1 +
 hw/char/trace-events                          |    8 +
 hw/i2c/meson.build                            |    1 +
 hw/i2c/trace-events                           |   10 +
 hw/misc/Kconfig                               |   21 +
 hw/misc/meson.build                           |    7 +
 hw/misc/trace-events                          |   18 +
 hw/ssi/Kconfig                                |    4 +
 hw/ssi/meson.build                            |    2 +
 hw/ssi/trace-events                           |    9 +
 meson_options.txt                             |    3 +
 scripts/meson-buildoptions.sh                 |    4 +
 scripts/svd-gen-header.py                     |  329 ++
 subprojects/.gitignore                        |    1 +
 subprojects/mcux-soc-svd.wrap                 |    5 +
 .../packagefiles/mcux-soc-svd/meson.build     |    5 +
 tests/qtest/meson.build                       |    3 +
 71 files changed, 19482 insertions(+), 22 deletions(-)
 create mode 100644 include/hw/arm/rt500.h
 create mode 100644 include/hw/arm/svd/flexcomm.h
 create mode 100644 include/hw/arm/svd/flexcomm_i2c.h
 create mode 100644 include/hw/arm/svd/flexcomm_spi.h
 create mode 100644 include/hw/arm/svd/flexcomm_usart.h
 create mode 100644 include/hw/arm/svd/flexspi.h
 create mode 100644 include/hw/arm/svd/rt500.h
 create mode 100644 include/hw/arm/svd/rt500_clkctl0.h
 create mode 100644 include/hw/arm/svd/rt500_clkctl1.h
 create mode 100644 include/hw/arm/svd/rt500_rstctl0.h
 create mode 100644 include/hw/arm/svd/rt500_rstctl1.h
 create mode 100644 include/hw/char/flexcomm_usart.h
 create mode 100644 include/hw/i2c/flexcomm_i2c.h
 create mode 100644 include/hw/misc/flexcomm.h
 create mode 100644 include/hw/misc/flexcomm_function.h
 create mode 100644 include/hw/misc/i2c_tester.h
 create mode 100644 include/hw/misc/rt500_clk_freqs.h
 create mode 100644 include/hw/misc/rt500_clkctl0.h
 create mode 100644 include/hw/misc/rt500_clkctl1.h
 create mode 100644 include/hw/misc/rt500_rstctl.h
 create mode 100644 include/hw/misc/spi_tester.h
 create mode 100644 include/hw/ssi/flexcomm_spi.h
 create mode 100644 include/hw/ssi/flexspi.h
 create mode 100644 tests/qtest/reg-utils.h
 create mode 100644 hw/arm/rt500.c
 create mode 100644 hw/arm/rt595-evk.c
 create mode 100644 hw/char/flexcomm_usart.c
 create mode 100644 hw/i2c/flexcomm_i2c.c
 create mode 100644 hw/misc/flexcomm.c
 create mode 100644 hw/misc/i2c_tester.c
 create mode 100644 hw/misc/rt500_clkctl0.c
 create mode 100644 hw/misc/rt500_clkctl1.c
 create mode 100644 hw/misc/rt500_rstctl.c
 create mode 100644 hw/misc/spi_tester.c
 create mode 100644 hw/ssi/flexcomm_spi.c
 create mode 100644 hw/ssi/flexspi.c
 create mode 100644 tests/qtest/flexcomm-i2c-test.c
 create mode 100644 tests/qtest/flexcomm-spi-test.c
 create mode 100644 tests/qtest/flexcomm-test.c
 create mode 100644 tests/qtest/flexcomm-usart-test.c
 create mode 100644 tests/qtest/rt500-clkctl-test.c
 create mode 100644 hw/arm/svd/meson.build
 create mode 100755 scripts/svd-gen-header.py
 create mode 100644 subprojects/mcux-soc-svd.wrap
 create mode 100644 subprojects/packagefiles/mcux-soc-svd/meson.build

-- 
2.46.0.662.g92d0881bb0-goog

