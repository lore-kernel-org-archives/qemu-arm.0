Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6BC1C531C9
	for <qemu-arm@archiver.kernel.org>; Sun, 26 Jul 2026 14:52:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wo0Cj-0005sj-7i; Sun, 26 Jul 2026 10:51:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <163wangjack@gmail.com>)
 id 1wo0Cf-0005s1-6b
 for qemu-arm@nongnu.org; Sun, 26 Jul 2026 10:51:45 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <163wangjack@gmail.com>)
 id 1wo0Cc-0005zN-1g
 for qemu-arm@nongnu.org; Sun, 26 Jul 2026 10:51:44 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-2cc7ef7ec27so23927405ad.1
 for <qemu-arm@nongnu.org>; Sun, 26 Jul 2026 07:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1785077498; x=1785682298; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=gMvRGC+W81P7nB/Cv+wkkm/hmnFBdzMzFGZ00e08Edw=;
 b=FmPWmU1OLVqpxqSXIG0uRwusPzkhle8901WOdYCE3Hmdm0rSsT+SWE1MXqB5AhfYjT
 jA9+6EzXmqHrOLi3ZRYQiGYyJkICzemUm9jZK2bscDU3YG7+a20X2saUFsMEx50V+Af5
 t4jPajp+vpbwqpHajgUoiWYjhAg4X7JrgRcT5ZgcWgMFZ9BIeEURU86gV/nDo2NxandH
 gYWWvCmqIWGdPn6L9vYYrVnopSZ+pEAfO+EnFhHYpWSNs+h7XgRalfjA0d4FadtIFmg4
 SObczchLGdfvb0rXPm8tZj8/iLeliCzgh8OUfjBSB3MFroyyq2rLdFL2JdrZFwsDSnwc
 j+IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785077498; x=1785682298;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=gMvRGC+W81P7nB/Cv+wkkm/hmnFBdzMzFGZ00e08Edw=;
 b=rhHI8ukwlwG7hH7s0icrMC9s0Qmbf3PVzU5dCVlrtnR0m30Ew4dHPP0EzE2Nc9tW1n
 lprv+mtT7oP4ENyfCPcHpr2iDWJV7V8zZHvP/ARTtQT+abDRhV2LLshulBZHRkWxmcia
 QEt+IHTO1M3SnXWtOjY45G5Fw24AyT2Nek6kqlmFHh4EK8bY0HyKzjU1uxJ7OGP+QC9o
 W29KFp6TKD6Esvsrps8JnWgTQgWdtorCLWbNXeTJWJIdbiOFdBVMPlkiV8EWn0gC4E+P
 70K+taLxZ7YN/vsZQNkR27mDxTTX0Ca0u537qNryX5biZL6URz0pVb/bgrJdYVynw7VH
 UaFg==
X-Forwarded-Encrypted: i=1;
 AHgh+RogKmMPy3PjicI3I9L+zK5uzGNE+/LTVOTEUIed+ax6FaN1pQhtMCNBhrjJ88BcYkN0Rz2a8YM7hg==@nongnu.org
X-Gm-Message-State: AOJu0YxVw9mydYvQ/q6xRmvpL4N8X0zYbl+90ubR91D5xL0Iczbjk1oU
 TLRshC3UfevtdyAcI3F45Y6uMqt+X0Utf5SO/eBgplkkGzm8u11mjbXQ
X-Gm-Gg: AR+sD10oXSisuUZOiOPI0l9kArI02KiH3ODmaRoKmQLYLWfHwSlR2uYc7SVwrMf+39A
 kyynayXbZyJBidF/VEXg55pO1dd0I+eWvPxrJu6pXFnjY1h1j5zaaPCywtYfBVizMNqWrYYobN1
 bLMLEaEcJ7sgc7XaWulICb5wlOwjnly/d+209k04zdZtZiQsxFDNmEf8HbLwVe2gLTf/2xyN0eo
 OjjAMbzmeRtUApZml4/dFIGcXwFUkjHL43guITEy3hmIkrL9ft212IiYmRr+N+JKPa/340trwBa
 t6TNz2F0zBk9/lYmXRyWRDyZplm0KXLzMD5h8Q2j/pPHjmm1qDXyAMVocMcvvaUIcKFugxx9FS+
 FxOmU6hPQ8hRXwKQBqiM8PYUO4LQxAI5Vs/apqYLTbESO3odyn+xQhQ94lYBdZzjRuDfLzaQha5
 nvTP4SzDuHU8JWKQ==
X-Received: by 2002:a17:903:32d0:b0:2cf:4504:feb5 with SMTP id
 d9443c01a7336-2cfde85f6acmr57490745ad.31.1785077498488; 
 Sun, 26 Jul 2026 07:51:38 -0700 (PDT)
Received: from localhost.localdomain ([82.40.42.115])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2cfde81d7f5sm20934195ad.83.2026.07.26.07.51.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 26 Jul 2026 07:51:36 -0700 (PDT)
From: Jack Wang <163wangjack@gmail.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, Fabiano Rosas <farosas@suse.de>,
 Laurent Vivier <lvivier@redhat.com>, qemu-arm@nongnu.org,
 qemu-rust@nongnu.org, caojunze424@gmail.com,
 Jack Wang <163wangjack@gmail.com>
Subject: [RFC PATCH v1 0/5] hw/gpio: STM32F1xx GPIO controller in Rust
Date: Sun, 26 Jul 2026 22:51:14 +0800
Message-ID: <20260726145119.19881-1-163wangjack@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=163wangjack@gmail.com; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_STARTS_WITH_NUMS=0.738, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Hi all,

This RFC adds an STM32F1xx GPIO controller modelled in Rust, following the
existing rust/hw/char/pl011 device as a template. The register logic (CRL/CRH
mode+config decode and the IDR update algorithm) is a direct port of the C
model in hw/gpio/stm32l4x5_gpio.c; the STM32F1xx GPIO block (RM0008) is the
same IP used by the upstream stm32f100_soc.

This series is currently stacked on an out-of-tree STM32F103 SoC and board
that are not yet upstream which is https://github.com/shandianchengzi/qemu
But the commit(the initialize logic and gpio architecture) is both capable 
for stm32f100.This is the reason that struct name is  stm32f1xx. Patch 3 
("hw/arm/stm32f103: instantiate and mapGPIO ports") therefore touches files 
that do not exist in mainline and willnot apply cleanly on its own. 
I am sending this as an RFC to get feedback onthe Rust device model and 
its integration now, before the SoC lands, rather than as an apply-ready series
. Once the SoC is upstream (or if you I
can retarget the device at the existing stm32f100_soc), I will resend a
non-RFC series.

checkpatch reports SPDX warnings on Kconfig/trace-events/Cargo.toml/
meson.build and "MAINTAINERS need updating" on the new files. These are
false positives: matching rust/hw/char/pl011, these file types carry no SPDX
header in-tree, and MAINTAINERS already gains an entry covering rust/hw/gpio/
and the qtest in this series.

Anyway this is my first time to generate rust model build so sorry for some
mistakes. And any help or tip are welcomed

Jack Wang (5):
  hw/gpio: add stm32f1xx GPIO device model (Rust)
  rust: add hw/gpio crate to the workspace
  hw/arm/stm32f103: instantiate and map GPIO ports
  tests/qtest: add stm32f103 GPIO test
  rust/hw/gpio: add native unit tests

 MAINTAINERS                       |   7 +
 hw/arm/Kconfig                    |   1 +
 hw/arm/stm32f103_board.c          |   2 +-
 hw/arm/stm32f103_soc.c            |  54 ++-
 hw/gpio/Kconfig                   |   5 +
 hw/gpio/trace-events              |   7 +
 include/hw/arm/stm32f103_soc.h    |   9 +
 rust/Cargo.lock                   |  17 +-
 rust/Cargo.toml                   |  18 +
 rust/hw/Kconfig                   |   1 +
 rust/hw/gpio/Cargo.toml           |  28 ++
 rust/hw/gpio/Kconfig              |   2 +
 rust/hw/gpio/meson.build          |  54 +++
 rust/hw/gpio/src/bindings.rs      |  19 ++
 rust/hw/gpio/src/gpio.rs          | 539 ++++++++++++++++++++++++++++++
 rust/hw/gpio/src/lib.rs           |   3 +
 rust/hw/gpio/tests/tests.rs       | 191 +++++++++++
 rust/hw/meson.build               |   1 +
 tests/qtest/meson.build           |   4 +
 tests/qtest/stm32f103_gpio-test.c | 328 ++++++++++++++++++
 20 files changed, 1281 insertions(+), 9 deletions(-)
 create mode 100644 rust/hw/gpio/Cargo.toml
 create mode 100644 rust/hw/gpio/Kconfig
 create mode 100644 rust/hw/gpio/meson.build
 create mode 100644 rust/hw/gpio/src/bindings.rs
 create mode 100644 rust/hw/gpio/src/gpio.rs
 create mode 100644 rust/hw/gpio/src/lib.rs
 create mode 100644 rust/hw/gpio/tests/tests.rs
 create mode 100644 tests/qtest/stm32f103_gpio-test.c

-- 
2.53.0


