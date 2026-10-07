Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D31F4CA5FF1
	for <qemu-arm@archiver.kernel.org>; Wed,  7 Oct 2026 11:53:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xEQCv-0008NK-Jg; Wed, 07 Oct 2026 07:53:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xEQCr-0008MJ-R8
 for qemu-arm@nongnu.org; Wed, 07 Oct 2026 07:53:10 -0400
Received: from mail-dl1-x1232.google.com ([2607:f8b0:4864:20::1232])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xEQCp-0007wF-Sw
 for qemu-arm@nongnu.org; Wed, 07 Oct 2026 07:53:09 -0400
Received: by mail-dl1-x1232.google.com with SMTP id
 a92af1059eb24-15943c9c005so929925c88.1
 for <qemu-arm@nongnu.org>; Wed, 07 Oct 2026 04:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791373986; x=1791978786; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:content-type:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=7/q6Wydyq6ByBHA2vflN7wGxaGPkcoKXKzgE2z17CTQ=;
 b=XefxkZkbRWPJUuVXXsiW/76ibDhxc1wANkpe49u5ofiWTgNz2+Jy8bbt5G4wDzRceN
 afMXt9/nobE7Cz51Pue8Agkh4ER2AAJIwm1U5de9OQPdlFYMKUHQOwHCF248WeXEYD+U
 2Hb+mKoSRWUDDewFu3e32P5EBAZ0wAB0A1Nmn7lV5mOZud2pMGUBp88ILBoNkqcfWA8p
 js9IVN8LordafkZI/v5EhnLlPm2xcXQDIDRSBM2yUTFlckzu16IFfPIHtnDgImfruSCp
 agGVo74L896YvTcopcoAJdAN1sJgNNfPzgMb8w6+eivfn0fDtyU3w17yLjKpGBhqlFjJ
 mDCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791373986; x=1791978786;
 h=content-transfer-encoding:mime-version:content-type:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=7/q6Wydyq6ByBHA2vflN7wGxaGPkcoKXKzgE2z17CTQ=;
 b=0QNjJCHqwMVzF3p13Wa3SxBnVVN+NW+R0zIuteKGnZDKzR3pdvvLdBcasIi6bUnlnn
 YcrVDAPZuNK8z8sp8LSFNL2TiHSthsyLJVSmB7t2g1uD5Xd61cf3tLVKHGjGTdsvVvCk
 1Msfh+KNr5fe/3LbPnKFNEVMo2H/kXWuKGpke/IZrmC9I6ZKmz4BTNOPoJYWNkWmXdJh
 L+Lyqi8RfgdZEiN1xhlHOVCcrdTgQaQRlyvms0i2eJ8HiobeV9D7kPcEnSkSuDl4NHX7
 TqOcHi3/uw01Nj/48/cL0Z9xpgDA2XYDrKANUoQ22TiwaObgajzwesHVbNnt7+nMHVvo
 COcA==
X-Forwarded-Encrypted: i=1;
 AKwUvBzA4SiVVNXlOULoR+M41UXPPg7PZ93FgNH4rrZRq02FT+SSd/9L41Fu0zai8Js+TgMQHqjyqP866A==@nongnu.org
X-Gm-Message-State: AFuF++laa6UKbwmtWUh7rQXMcJ2OlgOhwDzGIMWRR/WsUhZSwEbqWAzn
 vMk6hxJIDZLqvoochaK1DusLGt81/pRCJbViUPDE5S5s9bRph/X+0ENP
X-Gm-Gg: AYBFou1XO//BUzKt1cUSvIOd/Z/1bF8bMVz4qn7gcmp5ELPGAroAM6oQVJDj3YiQpvU
 Krxq2nSaCJZF1bU7syn86h487zLKBNLGawONW4RPNHCd2xff0upGQTrTA7kr5X/pA7J2kKb3LOX
 GHhZOYLFBgdjqR5+neXvuTu4T3sZhwgisVo3zJFvhoJtDTw66g0DsypmjS4JWHQkYAEi7Svb037
 2k0fKJniatulL308jHDbp4BoGJz4k4iGt0voOBqYqOrH3GfEhgPzrECHbFe1hVF+ZHTYxstOxdP
 7L6mjHfTmkp1Udb5NSUQWqP8TIfoqiuRThOjf6ZV+J5g93tlDeLt1uD35EuFw7op9Ivl9lqS42o
 E8MTmnMJ9YM1XpxAJ8b7RewllKVOJDE7INx8z9kvcVBKA+3iaHCrQQhAnMBtYrHLvOx2VfOwgpm
 2/SF8wEX4C+UxdBhxZS5J/IY7hxgbfadazKv0x6m9sKDVB8NWEkIt6/qcXyTUU8cM+XuZ3mHGCQ
 UQroL4F1YOBSaKq5Xyrghwz5KGB
X-Received: by 2002:a05:7022:29b:b0:143:6080:668f with SMTP id
 a92af1059eb24-162047a17d1mr2442151c88.7.1791373985998; 
 Wed, 07 Oct 2026 04:53:05 -0700 (PDT)
Received: from DESKTOP-Q716RM7 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-1616980c3b7sm6429520c88.16.2026.10.07.04.53.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2026 04:53:05 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Laurent Vivier <lvivier@redhat.com>, Zhao Liu <zhao1.liu@intel.com>,
 John Snow <jsnow@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Fabiano Rosas <farosas@suse.de>,
 Kane Chen <kane_chen@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>, Stafford Horne <shorne@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-arm@nongnu.org,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Steven Lee <steven_lee@aspeedtech.com>, Alexander Bulekov <alxndr@bu.edu>,
 Darren Kenny <darren.kenny@oracle.com>
Subject: [PATCH 0/8] qom: pass TargetInfo to the is_available callback
Date: Wed,  7 Oct 2026 19:47:57 +0800
Message-ID: <20261007115253.328-1-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1232;
 envelope-from=luoyonggang@gmail.com; helo=mail-dl1-x1232.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

This allows a combined binary to register machine types from all its targets.
Consequently, QMP `query-machines` can return machine entries from every
target, even when `none` is selected. For example, a client can query the
combined machine list with:

```json
{ "execute": "query-machines" }
```

The returned list includes the registered machine classes from all linked
targets. This is separate from selecting a machine: with `-target none`,
`-M virt` reports the targets that provide `virt` instead of choosing one
arbitrarily:

```text
qemu-system -target none -M virt
unsupported machine type: "virt" for target "none"
Available for targets:
  aarch64
  arm
```

It moves target_info() to a shared location so object.c can call it when
checking machine availability. The series also replaces QOM-based target-info
registration with a constructor list and passes TargetInfo to the
is_available callback.

Target metadata and architecture checks are generated from the configured
targets, there is too much arch to write biiolperate code. doing this for easier
Add TargetInfo* to is_available

The target-info API and implementation are shared, rather than compiled
separately for every target.

This series removes the per-target source files "configs/targets/*.c".
Their target-specific parameters are collected in a generated
target-info-def.c for each softmmu target. This lays the groundwork for
QEMU system builds in which target-info-def.c is the only target-specific
source file compiled for each target. Using the same filename lets
meson.build handle these definitions uniformly.

The series adds unit-test coverage for target info and multi-target builds.

Pierrick Bouvier (2):
  configs/targets: remove target info definitions
  target-info: rename target-info-stub.c in target-info-def.c

Yonggang Luo (6):
  target-info: rename target-info-impl.h to target-info-def.h
  target-info: replace QOM registration with a constructor list
  tests/unit: add target-info coverage for multi-target builds
  meson: load all target .mak files into target_mak_all
  target-info: Replace handwritten architecture checks with generated
    code
  qom: pass TargetInfo to is_available for later use

 MAINTAINERS                             |   2 +-
 configs/targets/aarch64-softmmu.c       |  25 ------
 configs/targets/arm-softmmu.c           |  25 ------
 configs/targets/meson.build             |   6 --
 configs/targets/riscv32-softmmu.c       |  24 -----
 configs/targets/riscv64-softmmu.c       |  24 -----
 hw/arm/aspeed_ast27x0-fc.c              |   2 +-
 hw/arm/aspeed_ast27x0_evb.c             |   4 +-
 hw/arm/raspi.c                          |   4 +-
 hw/arm/raspi4b.c                        |   2 +-
 hw/arm/virt.c                           |   4 +-
 hw/m68k/virt.c                          |   4 +-
 hw/or1k/virt.c                          |   2 +-
 include/hw/core/cpu.h                   |   2 +-
 include/qemu/module.h                   |   1 -
 include/qemu/target-info-def.h          |  88 ++++++++++++++++++
 include/qemu/target-info-impl.h         |  42 ---------
 include/qemu/target-info-init.h         |  53 -----------
 include/qemu/target-info-qom.h          |  31 -------
 include/qemu/target-info.h              |  87 ++++--------------
 include/qom/object.h                    |  12 ++-
 meson.build                             |  52 ++++++++---
 page-vary-common.c                      |   2 +-
 page-vary-system.c                      |   2 +-
 qom/object.c                            |   3 +-
 scripts/gen-target-info.py              |  99 ++++++++++++++++++++
 system/vl.c                             |   4 -
 target-info-stub.c => target-info-def.c |   3 +-
 target-info-qom.c                       |  60 -------------
 target-info.c                           | 115 ++++++++++++------------
 tests/qtest/fuzz/fuzz.c                 |   3 -
 tests/unit/meson.build                  |   4 +
 tests/unit/test-multi-target.c          |  12 +--
 tests/unit/test-target-info.c           |  38 ++++++++
 34 files changed, 379 insertions(+), 462 deletions(-)
 delete mode 100644 configs/targets/aarch64-softmmu.c
 delete mode 100644 configs/targets/arm-softmmu.c
 delete mode 100644 configs/targets/meson.build
 delete mode 100644 configs/targets/riscv32-softmmu.c
 delete mode 100644 configs/targets/riscv64-softmmu.c
 create mode 100644 include/qemu/target-info-def.h
 delete mode 100644 include/qemu/target-info-impl.h
 delete mode 100644 include/qemu/target-info-init.h
 delete mode 100644 include/qemu/target-info-qom.h
 create mode 100644 scripts/gen-target-info.py
 rename target-info-stub.c => target-info-def.c (94%)
 delete mode 100644 target-info-qom.c
 create mode 100644 tests/unit/test-target-info.c

-- 
2.55.0.windows.3


