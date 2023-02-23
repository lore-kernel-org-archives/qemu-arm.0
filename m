Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp709082ejc;
        Thu, 23 Feb 2023 05:10:47 -0800 (PST)
X-Google-Smtp-Source: AK7set/09YPX6PiK8Pu5LoTCoevtGwoSQylLbttu+WsAHhkP1v9RMuCOeWZ7QWzrPPe59w4oeIZf
X-Received: by 2002:adf:eb07:0:b0:2c7:46f:c410 with SMTP id s7-20020adfeb07000000b002c7046fc410mr7471065wrn.36.1677157847338;
        Thu, 23 Feb 2023 05:10:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677157847; cv=none;
        d=google.com; s=arc-20160816;
        b=gXiYo8j8dmU3gKJF4+YzieF2XErMcR2kBqtvytQPWOI8ErjWyIlOB24ULwJBn/wxE8
         RbFBWJDuXIifaThfHwOTE34NzHvEPFkqJ2gM/IF22JY+ASyDKdxvhAPQNDbctaRBLx2Y
         GQZi5h9wYSJk3fxXLfgOL2zJ8V1P3AmBH+i+TLCrLIBPFF07jcecX57omQ6ogzaY5eO3
         fcpMfB6zUSZSt5JUxWS3S3DwHM/5+9qcLokacE6AtL/RjJPUoKGekKVBT4wz40EMdeQp
         onIw8WPfe+HammSFXSDFV9KKr3sFqNcB9Wfqlvvv8sSxWOwi3AaCiRFdLrtlf9h/mWaS
         RJGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:dkim-signature;
        bh=xeb7GmzFOtNxshduRLRkAzP6xNHonX8j65wO62THt44=;
        b=D2aQ8OJU4bCqLLjTq1N+I64uxdLxyCKAmwDjWJVlUa6mNB3cTszRogWfkf7pkIBxtm
         85kICl0/QXqjdVGWdqnyWWpnBNU/DPjuwf4Tl1exG6L3/iD7xFSdb/mm7S6wQJAS+7rW
         U06gFIv6CC3FJJB8ke4ylu8dDujjlIyV/iXwlyXDpqKdmbyymJhcIQPY3dahN0RN+CIj
         zRg1Eyx64vWqtPlSsf7QHDtlW+Y/LHfgfFu432JIGfGPf2dbqpe1Gwxr+6bypAFSIB43
         UalDaRpNP75o7jOLf1pLZ1TckSlK25S2LVsM3Y3GYd5OQoAcC8CDa7o6YKrrzWsLdTxr
         gOKg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=F9PeoNS9;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [195.135.220.28])
        by mx.google.com with ESMTPS id z3-20020adfdf83000000b002c55bca6aaesi4318030wrl.79.2023.02.23.05.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Feb 2023 05:10:47 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) client-ip=195.135.220.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=F9PeoNS9;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E5A4033817;
	Thu, 23 Feb 2023 13:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1677157846; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xeb7GmzFOtNxshduRLRkAzP6xNHonX8j65wO62THt44=;
	b=F9PeoNS9+u/yhrX6z36PsqmQln/AJvjrmpb8/qC6HuCoS6gEYM1zco8a2u51jf+/I14n7T
	bM3U7gXyh3S1uld8tNBn8IfVbPNk89hfhA5bJADJYW5KWRS4Dpux/otnPwcQwNGbgJ/3L0
	1AXicjKIOU+PDzo5zV1hbMlSeFE1u2c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1677157846;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xeb7GmzFOtNxshduRLRkAzP6xNHonX8j65wO62THt44=;
	b=gZZ6JyNYachPLOKe2kexpI19m8ZVo0blBD4+fr6jQm7Cfj0Ch4FC++FUmP40MGa5AiecF3
	BPrgM15UFbpO4HCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F1C1A139B5;
	Thu, 23 Feb 2023 13:10:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 0SH8LdNl92MLawAAMHmgww
	(envelope-from <farosas@suse.de>); Thu, 23 Feb 2023 13:10:43 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Claudio Fontana <cfontana@suse.de>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Alexander Graf <agraf@csgraf.de>,
	Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH v7 00/20] target/arm: Allow CONFIG_TCG=n builds
Date: Thu, 23 Feb 2023 10:08:21 -0300
Message-Id: <20230223130841.25916-1-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 6CmuD82gsKfJ

Changes since v6:

Now using the same feature set for -cpu max for both qtests and
TCG. This requires a slightly awkward code movement to expose
aa32_max_features to non-tcg code, but we gain by not having a
different environment for the tests.

Also applied Richard's suggestion of creating a new cortex-regs.c
file.

CI run: https://gitlab.com/farosas/qemu/-/pipelines/786195517

v6:
https://lore.kernel.org/r/20230217201150.22032-1-farosas@suse.de

v5 resend:
https://lore.kernel.org/r/20230213202927.28992-1-farosas@suse.de

v5:
https://lore.kernel.org/r/20230120184825.31626-1-farosas@suse.de

v4:
https://lore.kernel.org/r/20230119135424.5417-1-farosas@suse.de

v3:
https://lore.kernel.org/r/20230113140419.4013-1-farosas@suse.de

v2:
https://lore.kernel.org/r/20230109224232.11661-1-farosas@suse.de

v1:
https://lore.kernel.org/r/20230104215835.24692-1-farosas@suse.de

Claudio Fontana (3):
  target/arm: move helpers to tcg/
  target/arm: Move psci.c into the tcg directory
  target/arm: move cpu_tcg to tcg/cpu32.c

Fabiano Rosas (16):
  target/arm: Wrap breakpoint/watchpoint updates with tcg_enabled
  target/arm: Wrap TCG-only code in debug_helper.c
  target/arm: move translate modules to tcg/
  target/arm: Wrap arm_rebuild_hflags calls with tcg_enabled
  target/arm: Move hflags code into the tcg directory
  target/arm: Move regime_using_lpae_format into internal.h
  target/arm: Don't access TCG code when debugging with KVM
  cpu-defs.h: Expose CPUTLBEntryFull to non-TCG code
  target/arm: Move cortex sysregs into a separate file
  target/arm: Move 64-bit TCG CPUs into tcg/
  target/arm: Move aa32_max_features out of cpu_tcg.c
  tests/avocado: Pass parameters to migration test
  tests/avocado: add machine:none tag to version.py
  arm/Kconfig: Always select SEMIHOSTING when TCG is present
  arm/Kconfig: Do not build TCG-only boards on a KVM-only build
  tests/qtest: Fix tests when no KVM or TCG are present

Philippe Mathieu-Daudé (1):
  gitlab-ci: Check building KVM-only aarch64 target

 .gitlab-ci.d/crossbuilds.yml                  |  11 +
 .../custom-runners/ubuntu-22.04-aarch64.yml   |   4 -
 MAINTAINERS                                   |   1 +
 configs/devices/aarch64-softmmu/default.mak   |   4 -
 configs/devices/arm-softmmu/default.mak       |  39 --
 hw/arm/Kconfig                                |  43 +-
 hw/arm/boot.c                                 |   6 +-
 hw/arm/virt.c                                 |   6 +-
 hw/intc/armv7m_nvic.c                         |  20 +-
 include/exec/cpu-defs.h                       |   6 +
 target/arm/Kconfig                            |   7 +
 target/arm/arm-powerctl.c                     |   7 +-
 target/arm/cortex-regs.c                      |  69 +++
 target/arm/cpregs.h                           |   6 +
 target/arm/cpu.c                              |  78 ++-
 target/arm/cpu64.c                            | 399 +-------------
 target/arm/debug_helper.c                     | 490 +++++++++---------
 target/arm/helper.c                           | 411 +--------------
 target/arm/internals.h                        |  30 +-
 target/arm/machine.c                          |  12 +-
 target/arm/meson.build                        |  48 +-
 target/arm/ptw.c                              |   4 +
 target/arm/tcg-stubs.c                        |  27 +
 target/arm/{ => tcg}/a32-uncond.decode        |   0
 target/arm/{ => tcg}/a32.decode               |   0
 target/arm/{cpu_tcg.c => tcg/cpu32.c}         | 141 +----
 target/arm/tcg/cpu64.c                        | 438 ++++++++++++++++
 target/arm/{ => tcg}/crypto_helper.c          |   0
 target/arm/{ => tcg}/helper-a64.c             |   0
 target/arm/tcg/hflags.c                       | 403 ++++++++++++++
 target/arm/{ => tcg}/iwmmxt_helper.c          |   0
 target/arm/{ => tcg}/m-nocp.decode            |   0
 target/arm/{ => tcg}/m_helper.c               |   0
 target/arm/tcg/meson.build                    |  52 ++
 target/arm/{ => tcg}/mte_helper.c             |   0
 target/arm/{ => tcg}/mve.decode               |   0
 target/arm/{ => tcg}/mve_helper.c             |   0
 target/arm/{ => tcg}/neon-dp.decode           |   0
 target/arm/{ => tcg}/neon-ls.decode           |   0
 target/arm/{ => tcg}/neon-shared.decode       |   0
 target/arm/{ => tcg}/neon_helper.c            |   0
 target/arm/{ => tcg}/op_helper.c              |   0
 target/arm/{ => tcg}/pauth_helper.c           |   0
 target/arm/{ => tcg}/psci.c                   |   0
 target/arm/{ => tcg}/sme-fa64.decode          |   0
 target/arm/{ => tcg}/sme.decode               |   0
 target/arm/{ => tcg}/sme_helper.c             |   0
 target/arm/{ => tcg}/sve.decode               |   0
 target/arm/{ => tcg}/sve_helper.c             |   0
 target/arm/{ => tcg}/t16.decode               |   0
 target/arm/{ => tcg}/t32.decode               |   0
 target/arm/{ => tcg}/tlb_helper.c             |  18 -
 target/arm/{ => tcg}/translate-a64.c          |   0
 target/arm/{ => tcg}/translate-a64.h          |   0
 target/arm/{ => tcg}/translate-m-nocp.c       |   0
 target/arm/{ => tcg}/translate-mve.c          |   0
 target/arm/{ => tcg}/translate-neon.c         |   0
 target/arm/{ => tcg}/translate-sme.c          |   0
 target/arm/{ => tcg}/translate-sve.c          |   0
 target/arm/{ => tcg}/translate-vfp.c          |   0
 target/arm/{ => tcg}/translate.c              |   0
 target/arm/{ => tcg}/translate.h              |   0
 target/arm/{ => tcg}/vec_helper.c             |   0
 target/arm/{ => tcg}/vec_internal.h           |   0
 target/arm/{ => tcg}/vfp-uncond.decode        |   0
 target/arm/{ => tcg}/vfp.decode               |   0
 tests/avocado/migration.py                    |  83 ++-
 tests/avocado/version.py                      |   1 +
 tests/qtest/arm-cpu-features.c                |  12 +-
 tests/qtest/bios-tables-test.c                |   4 +
 tests/qtest/boot-serial-test.c                |  10 +
 tests/qtest/migration-test.c                  |   5 +
 tests/qtest/pxe-test.c                        |   6 +
 tests/qtest/vmgenid-test.c                    |   6 +
 74 files changed, 1592 insertions(+), 1315 deletions(-)
 create mode 100644 target/arm/cortex-regs.c
 create mode 100644 target/arm/tcg-stubs.c
 rename target/arm/{ => tcg}/a32-uncond.decode (100%)
 rename target/arm/{ => tcg}/a32.decode (100%)
 rename target/arm/{cpu_tcg.c => tcg/cpu32.c} (87%)
 create mode 100644 target/arm/tcg/cpu64.c
 rename target/arm/{ => tcg}/crypto_helper.c (100%)
 rename target/arm/{ => tcg}/helper-a64.c (100%)
 create mode 100644 target/arm/tcg/hflags.c
 rename target/arm/{ => tcg}/iwmmxt_helper.c (100%)
 rename target/arm/{ => tcg}/m-nocp.decode (100%)
 rename target/arm/{ => tcg}/m_helper.c (100%)
 create mode 100644 target/arm/tcg/meson.build
 rename target/arm/{ => tcg}/mte_helper.c (100%)
 rename target/arm/{ => tcg}/mve.decode (100%)
 rename target/arm/{ => tcg}/mve_helper.c (100%)
 rename target/arm/{ => tcg}/neon-dp.decode (100%)
 rename target/arm/{ => tcg}/neon-ls.decode (100%)
 rename target/arm/{ => tcg}/neon-shared.decode (100%)
 rename target/arm/{ => tcg}/neon_helper.c (100%)
 rename target/arm/{ => tcg}/op_helper.c (100%)
 rename target/arm/{ => tcg}/pauth_helper.c (100%)
 rename target/arm/{ => tcg}/psci.c (100%)
 rename target/arm/{ => tcg}/sme-fa64.decode (100%)
 rename target/arm/{ => tcg}/sme.decode (100%)
 rename target/arm/{ => tcg}/sme_helper.c (100%)
 rename target/arm/{ => tcg}/sve.decode (100%)
 rename target/arm/{ => tcg}/sve_helper.c (100%)
 rename target/arm/{ => tcg}/t16.decode (100%)
 rename target/arm/{ => tcg}/t32.decode (100%)
 rename target/arm/{ => tcg}/tlb_helper.c (94%)
 rename target/arm/{ => tcg}/translate-a64.c (100%)
 rename target/arm/{ => tcg}/translate-a64.h (100%)
 rename target/arm/{ => tcg}/translate-m-nocp.c (100%)
 rename target/arm/{ => tcg}/translate-mve.c (100%)
 rename target/arm/{ => tcg}/translate-neon.c (100%)
 rename target/arm/{ => tcg}/translate-sme.c (100%)
 rename target/arm/{ => tcg}/translate-sve.c (100%)
 rename target/arm/{ => tcg}/translate-vfp.c (100%)
 rename target/arm/{ => tcg}/translate.c (100%)
 rename target/arm/{ => tcg}/translate.h (100%)
 rename target/arm/{ => tcg}/vec_helper.c (100%)
 rename target/arm/{ => tcg}/vec_internal.h (100%)
 rename target/arm/{ => tcg}/vfp-uncond.decode (100%)
 rename target/arm/{ => tcg}/vfp.decode (100%)

-- 
2.35.3
