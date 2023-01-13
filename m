Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp413757ejc;
        Fri, 13 Jan 2023 06:06:26 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuTy15zmKBNuyWptRnOXBYdCEM48hncIsq0Gfvc6EmyrPw/Q2Kfz2wQhZ6oeood/9dgXqG3
X-Received: by 2002:a5d:668e:0:b0:2bd:def5:4356 with SMTP id l14-20020a5d668e000000b002bddef54356mr1571797wru.39.1673618785972;
        Fri, 13 Jan 2023 06:06:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673618785; cv=none;
        d=google.com; s=arc-20160816;
        b=PgGZpuzWxzLitwo/iMto4dCx47MYyX5YAp7yDdSC70Ye1oZ9Rp1c7Gem1Jkk1K9SiL
         7iz5yieNZQrgzJlMlXI0a+Ojga82m+5gN+rwcSjnigI7S8zn+ulmm/HMG1z+nMTnaekp
         nVtdpA86tmmfV/NjetZMgi6ZDOzMS+aJtXKCULvbY1uTu4flC5ilO0/sJ4m63ZoNwSzw
         BZ5F3XH1uxP6dSFJpqSziVhVVMCDcqwBhN+siiqIvPPj6OkGGn5cDMFZJlIXhmjSghkl
         lpQMfNtd0izWAnVfc7Fvs7ZWkHnoqGlbSPWGfBT+RxHe1cUgPujUazAL1XfWVp5/pZJm
         OqBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:dkim-signature;
        bh=/FEGpcFg9zbN6etlRXuk3dPtqAHUqZy1fKVQrdmJkJg=;
        b=hzN2yle7QzExAqfzS8xmkY/25uyI0RUAa2n53/aLldXK642eKHh02ggL/4Qr+hoG2w
         oMqLvHYzEO4gBRsgYJo8V3a1BBOIa078z6iYd0DE/cYHGe6kgdehZzVJTERYW9jYhcWN
         ZwRkaQIDqDBfh9Fx3Lf0deddi+XGW/dVa1RC/wlRHeztvisgGEGsM3PRAy0vkjq1eLkl
         Msg1PTM/6nAH7B9VVKoDXexyhSHvrZ4ngA2YVAqdmaeWtbFvncnw7SWLMBL+TkLJ+B2C
         azK33N5pjmpR+o2ByrlZUb7U8i7LNzEBAKgvCHdAUum7X0be8WcksNabUDUayHmnc6bB
         gdAg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=JcTZUSGQ;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [2001:67c:2178:6::1d])
        by mx.google.com with ESMTPS id bs14-20020a056000070e00b002bc7d108b61si10386246wrb.966.2023.01.13.06.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 06:06:25 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) client-ip=2001:67c:2178:6::1d;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=JcTZUSGQ;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 229AD256BA;
	Fri, 13 Jan 2023 14:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1673618785; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/FEGpcFg9zbN6etlRXuk3dPtqAHUqZy1fKVQrdmJkJg=;
	b=JcTZUSGQNwSWfFnWA5NXTvV2L5M3cAOFkZy/k4WTkyey38xhySGfHv0KSRh+5Gu41Jj6WZ
	Y1/3IbAA7+BMhCQlxfFOAMiQeJHEYC4euuQVTErWvqEM12DJKMZ4bUNcoaIdnlvwu0jLB7
	7mEWwIpXccBz5MUZpsKH2/Qeu+46WAM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1673618785;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/FEGpcFg9zbN6etlRXuk3dPtqAHUqZy1fKVQrdmJkJg=;
	b=2yWvJPFo1n/BQA8XOVTIJLA6B4dRk1NSg5BApLFqdO0lfwgEBBTAA87mu3DhNSZVpJKA82
	EyA0GDfsNAWwEUAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 80AC61358A;
	Fri, 13 Jan 2023 14:06:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id UkuUEl5lwWP8DQAAMHmgww
	(envelope-from <farosas@suse.de>); Fri, 13 Jan 2023 14:06:22 +0000
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
	Alexander Graf <agraf@csgraf.de>
Subject: [RFC PATCH v3 00/28] target/arm: Allow CONFIG_TCG=n builds
Date: Fri, 13 Jan 2023 11:03:51 -0300
Message-Id: <20230113140419.4013-1-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: x0T79uI7Aws5

This series makes the necessary changes to allow the use of
--disable-tcg for arm.

Based on Richard's "target/arm: Introduce aarch64_set_svcr":
https://lore.kernel.org/r/20230112004322.161330-1-richard.henderson@linaro.org

branch here: https://github.com/farosas/qemu/tree/arm-disable-tcg

Since v2:

patch 5: removed extraneous include statements
patch 6: removed extraneous tcg_enabled
patch 7: dropped in favor of "target/arm: Introduce aarch64_set_svcr"
patch 12: removed inline
patch 13-15: dropped, not needed due to Kconfig changes

new:

- cpregs.h changes I had forgotten to include in v2
- moved CPUs initialization into tcg/
- skipped tests that require TCG
- fixed the migration tests for aarch64
- Kconfig changes, left only the 'virt' machine set by default with KVM

NOTE: current master shows errors in make check when using
--without-default-devices. This series does not touch the implicitly
added devices, only the ones in devices.mak, so this shouldn't affect
it. I'll take a look at the errors on master in the meantime.

v2:
https://lore.kernel.org/r/20230109224232.11661-1-farosas@suse.de

v1:
https://lore.kernel.org/r/20230104215835.24692-1-farosas@suse.de

Claudio Fontana (6):
  target/arm: rename handle_semihosting to tcg_handle_semihosting
  target/arm: wrap psci call with tcg_enabled
  target/arm: wrap call to aarch64_sve_change_el in tcg_enabled()
  target/arm: move helpers to tcg/
  target/arm: Move psci.c into the tcg directory
  target/arm: move cpu_tcg to tcg/cpu32.c

Fabiano Rosas (22):
  target/arm: Move PC alignment check
  target/arm: Move cpregs code out of cpu.h
  target/arm: Move cpregs code into cpregs.c
  target/arm: Move define_debug_regs() to cpregs.c
  target/arm: Wrap breakpoint/watchpoint updates with tcg_enabled
  target/arm: move translate modules to tcg/
  target/arm: Wrap arm_rebuild_hflags calls with tcg_enabled
  target/arm: Move hflags code into the tcg directory
  target/arm: Move regime_using_lpae_format into internal.h
  target/arm: Don't access TCG code when debugging with KVM
  cpu-defs.h: Expose CPUTLBEntryFull to non-TCG code
  target/arm: Move cortex sysregs into cpregs.c
  target/arm: Move common cpu code into cpu.c
  target/arm: Set cortex-a57 as default cpu for KVM-only build
  tests/qtest: Skip tests that depend on TCG when CONFIG_TCG=n
  tests/qtest: Restrict bcm2835-dma-test to CONFIG_RASPI
  tests/tcg: Do not build/run TCG tests if TCG is disabled
  tests/avocado: Skip tests that require a missing accelerator
  tests/avocado: Tag TCG tests with accel:tcg
  target/avocado: Pass parameters to migration test on aarch64
  arm/Kconfig: Always select SEMIHOSTING when TCG is present
  arm/Kconfig: Do not build TCG-only boards on a KVM-only build

 MAINTAINERS                                 |    1 +
 configs/devices/aarch64-softmmu/default.mak |    4 -
 configs/devices/arm-softmmu/default.mak     |   38 -
 configure                                   |    4 +
 hw/arm/Kconfig                              |   40 +-
 hw/arm/boot.c                               |    6 +-
 hw/arm/virt.c                               |    6 +
 hw/intc/armv7m_nvic.c                       |   20 +-
 include/exec/cpu-defs.h                     |    6 +
 target/arm/Kconfig                          |    7 +
 target/arm/arm-powerctl.c                   |    7 +-
 target/arm/cpregs.c                         | 9530 +++++++++++++++++++
 target/arm/cpregs.h                         |  104 +
 target/arm/cpu.c                            |   85 +-
 target/arm/cpu.h                            |   91 -
 target/arm/cpu64.c                          |    1 +
 target/arm/helper.c                         | 9457 +-----------------
 target/arm/internals.h                      |   38 +-
 target/arm/machine.c                        |   30 +-
 target/arm/meson.build                      |   49 +-
 target/arm/ptw.c                            |    4 +
 target/arm/tcg-stubs.c                      |   27 +
 target/arm/{ => tcg}/a32-uncond.decode      |    0
 target/arm/{ => tcg}/a32.decode             |    0
 target/arm/{cpu_tcg.c => tcg/cpu32.c}       |  149 +-
 target/arm/{ => tcg}/crypto_helper.c        |    0
 target/arm/{ => tcg}/debug_helper.c         |  367 -
 target/arm/{ => tcg}/helper-a64.c           |    0
 target/arm/tcg/hflags.c                     |  370 +
 target/arm/{ => tcg}/iwmmxt_helper.c        |    0
 target/arm/{ => tcg}/m-nocp.decode          |    0
 target/arm/{ => tcg}/m_helper.c             |    0
 target/arm/tcg/meson.build                  |   52 +
 target/arm/{ => tcg}/mte_helper.c           |    0
 target/arm/{ => tcg}/mve.decode             |    0
 target/arm/{ => tcg}/mve_helper.c           |    0
 target/arm/{ => tcg}/neon-dp.decode         |    0
 target/arm/{ => tcg}/neon-ls.decode         |    0
 target/arm/{ => tcg}/neon-shared.decode     |    0
 target/arm/{ => tcg}/neon_helper.c          |    0
 target/arm/{ => tcg}/op_helper.c            |    0
 target/arm/{ => tcg}/pauth_helper.c         |    0
 target/arm/{ => tcg}/psci.c                 |    0
 target/arm/{ => tcg}/sme-fa64.decode        |    0
 target/arm/{ => tcg}/sme.decode             |    0
 target/arm/{ => tcg}/sme_helper.c           |    0
 target/arm/{ => tcg}/sve.decode             |    0
 target/arm/{ => tcg}/sve_helper.c           |    0
 target/arm/{ => tcg}/t16.decode             |    0
 target/arm/{ => tcg}/t32.decode             |    0
 target/arm/{ => tcg}/tlb_helper.c           |   18 -
 target/arm/{ => tcg}/translate-a64.c        |    0
 target/arm/{ => tcg}/translate-a64.h        |    0
 target/arm/{ => tcg}/translate-m-nocp.c     |    0
 target/arm/{ => tcg}/translate-mve.c        |    0
 target/arm/{ => tcg}/translate-neon.c       |    0
 target/arm/{ => tcg}/translate-sme.c        |    0
 target/arm/{ => tcg}/translate-sve.c        |    0
 target/arm/{ => tcg}/translate-vfp.c        |    0
 target/arm/{ => tcg}/translate.c            |    0
 target/arm/{ => tcg}/translate.h            |    0
 target/arm/{ => tcg}/vec_helper.c           |    0
 target/arm/{ => tcg}/vec_internal.h         |    0
 target/arm/{ => tcg}/vfp-uncond.decode      |    0
 target/arm/{ => tcg}/vfp.decode             |    0
 target/arm/trace-events                     |    2 +-
 tests/Makefile.include                      |   10 +
 tests/avocado/avocado_qemu/__init__.py      |    4 +
 tests/avocado/boot_linux_console.py         |    1 +
 tests/avocado/migration.py                  |   11 +-
 tests/avocado/reverse_debugging.py          |    8 +
 tests/qtest/arm-cpu-features.c              |   27 +-
 tests/qtest/meson.build                     |    4 +-
 73 files changed, 10388 insertions(+), 10190 deletions(-)
 create mode 100644 target/arm/cpregs.c
 create mode 100644 target/arm/tcg-stubs.c
 rename target/arm/{ => tcg}/a32-uncond.decode (100%)
 rename target/arm/{ => tcg}/a32.decode (100%)
 rename target/arm/{cpu_tcg.c => tcg/cpu32.c} (86%)
 rename target/arm/{ => tcg}/crypto_helper.c (100%)
 rename target/arm/{ => tcg}/debug_helper.c (63%)
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
