Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp546509ejb;
        Mon, 13 Feb 2023 12:31:34 -0800 (PST)
X-Google-Smtp-Source: AK7set/T4WxW0GNv/u3jM4tIjYCl8Dd19KBe/s2C+NevOMajCtFQkzHnM483z6UdbQwbp95AQfQk
X-Received: by 2002:a05:6402:515:b0:4ab:2553:c4c6 with SMTP id m21-20020a056402051500b004ab2553c4c6mr8802809edv.14.1676320294032;
        Mon, 13 Feb 2023 12:31:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676320294; cv=none;
        d=google.com; s=arc-20160816;
        b=oQpvFkA3R0JHNFCZ3K+HbUr1s5pT0c45OokBuDv4lkJyHwh0KXKE2m3klaTJsLB8RL
         idmm2LIXC7i6BUhZsxl1al6Db6kwOOIyjta5HufzbFKvtGLWChmQo6OoxCJi+VtCJqfJ
         6BvosDD9Hdly4APqENS9vTuK5d37oFLRo69XGHvEH1Hb7qvRYrbpsrzD9yF+FCJYK0lv
         KIfW5OvROwd7Yjf9RnvUaqQp1mdyQnFunZ5Z6hPvgDVYQ1IFTL9Ik1lA9oeC0eXXeaXo
         oKPxQp9AB0fGoEbEd0xpD5bfJYWIUySk3qeT4oPQRazZYWskFbdu10EZHk80sdDmj2tV
         vBCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:dkim-signature;
        bh=kW9k+OtxXx1mFKJQQLA8dwCou+CUOXdtX+p9IXIicp0=;
        b=aCKKrlFXrCEYFiS3WVKJ/Xsns4n5iZVzwkJKGbh6mgkg1QXsVTa5wB8866wm32qJoq
         CInI6eOYEOa7LUAJxQr41CDj/yHxoryeMLKRvP/bVuaFJIBYjkf06Jahi3xnbvMGhDAt
         1BYIiw7f+xfC3oIc4C6fjjiPyWAtOfj+FdD7ALyuaPFdVJF29IUb+bC+MkfaKEJSyOcL
         Vql9flaPSXESMJ87YWC4WRBSsjL8Iw3IUOuUwM8vK3BC4+isNpYmnGZa0MPSuRhJZ5ZH
         BtrhuJQO1/KNI3nq2AIquPjFqvvaPIH7LTLU0rPb9fncAF3106/42CQiCO8D2WSAfFit
         r7wQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=r5pzYxZv;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [195.135.220.28])
        by mx.google.com with ESMTPS id u24-20020a05640207d800b004ab9fed6acesi10143062edy.384.2023.02.13.12.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 12:31:34 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) client-ip=195.135.220.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=r5pzYxZv;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 700DD22339;
	Mon, 13 Feb 2023 20:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1676320293; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kW9k+OtxXx1mFKJQQLA8dwCou+CUOXdtX+p9IXIicp0=;
	b=r5pzYxZvV5VtEbU67124S+9XDqH3IDmngarVTViXxOvMPe3PmCDN74Oylz1qSHCdhyZwi/
	TJJvqC/L7gI5T3DuWu/sldq26/Zm0yGnaXRNLDdTZKapaddIiSfzr0WusPJwcwPYC/cg8v
	gz746geVJwjAxY3ejyMRCvJ+4z8bRbk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1676320293;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kW9k+OtxXx1mFKJQQLA8dwCou+CUOXdtX+p9IXIicp0=;
	b=JGwRypO/xYOJIX9l7wA8FoPP0FDU16bc43RvaD02UT7uKkKpSWv20Nrf1KSNOPSSnhr3r4
	FdbTydeP8wkOeMAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5B7701391B;
	Mon, 13 Feb 2023 20:31:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id S5pqCCKe6mOVMwAAMHmgww
	(envelope-from <farosas@suse.de>); Mon, 13 Feb 2023 20:31:30 +0000
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
Subject: [PATCH RESEND v5 00/28] target/arm: Allow CONFIG_TCG=n builds
Date: Mon, 13 Feb 2023 17:28:59 -0300
Message-Id: <20230213202927.28992-1-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: XNE1av4jcfSz

Hi, could someone take this?

I rebased and put the two series together to simplify. I'm keeping it
up-to-date and tested while it doesn't go in.

CI run here: https://gitlab.com/farosas/qemu/-/pipelines/776103500

Based on master.
Supersedes "target/arm: CONFIG_TCG=n part 1".

Thanks!

v5:
https://lore.kernel.org/r/20230120184825.31626-1-farosas@suse.de

This series makes the necessary changes to allow the use of
--disable-tcg for arm.

- Used "max" as the default CPU for KVM-only builds. This allows me to
  drop all the clunky qtest changes and it keeps disabling TCG
  separate from changing cpu defaults.

  I'm neutral towards removing the defaults for arm. We can do that in a
  separate series. It would be nice to make the TCG default equal to the
  non-TCG one. Otherwise we're bound to get reports that "this command
  line used to work" if users switch from: 'CONFIG_TCG=n -accel kvm' to
  'CONFIG_TCG=y -accel kvm' (the latter would try to use the cortex-a15
  as default).

- Move the ifdef around valid_cpus into the patches that move the
  respective cpus. Patches 1 & 2.

v5 was based on "target/arm: CONFIG_TCG=n part 1":
https://lore.kernel.org/r/20230118193518.26433-1-farosas@suse.de

v4:
https://lore.kernel.org/r/20230119135424.5417-1-farosas@suse.de

v3:
https://lore.kernel.org/r/20230113140419.4013-1-farosas@suse.de

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

Fabiano Rosas (21):
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
  tests/avocado: Skip tests that require a missing accelerator
  tests/avocado: Tag TCG tests with accel:tcg
  target/arm: Move 64-bit TCG CPUs into tcg/
  target/arm: Use "max" as default cpu for the virt machine with KVM
  tests/qtest: arm-cpu-features: Match tests to required accelerators
  tests/qtest: Restrict tpm-tis-devices-{swtpm}-test to CONFIG_TCG
  target/avocado: Pass parameters to migration test on aarch64
  arm/Kconfig: Always select SEMIHOSTING when TCG is present
  arm/Kconfig: Do not build TCG-only boards on a KVM-only build

Philippe Mathieu-Daudé (1):
  gitlab-ci: Check building KVM-only aarch64 target

 .gitlab-ci.d/crossbuilds.yml                  |    11 +
 .../custom-runners/ubuntu-22.04-aarch64.yml   |     4 -
 MAINTAINERS                                   |     1 +
 configs/devices/aarch64-softmmu/default.mak   |     4 -
 configs/devices/arm-softmmu/default.mak       |    39 -
 hw/arm/Kconfig                                |    43 +-
 hw/arm/boot.c                                 |     6 +-
 hw/arm/virt.c                                 |    10 +-
 hw/intc/armv7m_nvic.c                         |    20 +-
 include/exec/cpu-defs.h                       |     6 +
 target/arm/Kconfig                            |     7 +
 target/arm/arm-powerctl.c                     |     7 +-
 target/arm/cpregs.c                           |  9825 +++++++++++++++
 target/arm/cpregs.h                           |   104 +
 target/arm/cpu.c                              |     9 +-
 target/arm/cpu.h                              |    91 -
 target/arm/cpu64.c                            |   634 +-
 target/arm/helper.c                           | 10224 +---------------
 target/arm/internals.h                        |    42 +-
 target/arm/machine.c                          |    30 +-
 target/arm/meson.build                        |    49 +-
 target/arm/ptw.c                              |     4 +
 target/arm/tcg-stubs.c                        |    27 +
 target/arm/{ => tcg}/a32-uncond.decode        |     0
 target/arm/{ => tcg}/a32.decode               |     0
 target/arm/{cpu_tcg.c => tcg/cpu32.c}         |    72 +-
 target/arm/tcg/cpu64.c                        |   655 +
 target/arm/{ => tcg}/crypto_helper.c          |     0
 target/arm/{ => tcg}/debug_helper.c           |   459 -
 target/arm/{ => tcg}/helper-a64.c             |     0
 target/arm/tcg/hflags.c                       |   403 +
 target/arm/{ => tcg}/iwmmxt_helper.c          |     0
 target/arm/{ => tcg}/m-nocp.decode            |     0
 target/arm/{ => tcg}/m_helper.c               |     0
 target/arm/tcg/meson.build                    |    53 +
 target/arm/{ => tcg}/mte_helper.c             |     0
 target/arm/{ => tcg}/mve.decode               |     0
 target/arm/{ => tcg}/mve_helper.c             |     0
 target/arm/{ => tcg}/neon-dp.decode           |     0
 target/arm/{ => tcg}/neon-ls.decode           |     0
 target/arm/{ => tcg}/neon-shared.decode       |     0
 target/arm/{ => tcg}/neon_helper.c            |     0
 target/arm/{ => tcg}/op_helper.c              |     0
 target/arm/{ => tcg}/pauth_helper.c           |     0
 target/arm/{ => tcg}/psci.c                   |     0
 target/arm/{ => tcg}/sme-fa64.decode          |     0
 target/arm/{ => tcg}/sme.decode               |     0
 target/arm/{ => tcg}/sme_helper.c             |     0
 target/arm/{ => tcg}/sve.decode               |     0
 target/arm/{ => tcg}/sve_helper.c             |     0
 target/arm/{ => tcg}/t16.decode               |     0
 target/arm/{ => tcg}/t32.decode               |     0
 target/arm/{ => tcg}/tlb_helper.c             |    18 -
 target/arm/{ => tcg}/translate-a64.c          |     0
 target/arm/{ => tcg}/translate-a64.h          |     0
 target/arm/{ => tcg}/translate-m-nocp.c       |     0
 target/arm/{ => tcg}/translate-mve.c          |     0
 target/arm/{ => tcg}/translate-neon.c         |     0
 target/arm/{ => tcg}/translate-sme.c          |     0
 target/arm/{ => tcg}/translate-sve.c          |     0
 target/arm/{ => tcg}/translate-vfp.c          |     0
 target/arm/{ => tcg}/translate.c              |     0
 target/arm/{ => tcg}/translate.h              |     0
 target/arm/{ => tcg}/vec_helper.c             |     0
 target/arm/{ => tcg}/vec_internal.h           |     0
 target/arm/{ => tcg}/vfp-uncond.decode        |     0
 target/arm/{ => tcg}/vfp.decode               |     0
 target/arm/trace-events                       |     2 +-
 tests/avocado/avocado_qemu/__init__.py        |     4 +
 tests/avocado/boot_linux_console.py           |     1 +
 tests/avocado/migration.py                    |    10 +
 tests/avocado/reverse_debugging.py            |     8 +
 tests/qtest/arm-cpu-features.c                |    34 +-
 tests/qtest/meson.build                       |     4 +-
 74 files changed, 11576 insertions(+), 11344 deletions(-)
 create mode 100644 target/arm/cpregs.c
 create mode 100644 target/arm/tcg-stubs.c
 rename target/arm/{ => tcg}/a32-uncond.decode (100%)
 rename target/arm/{ => tcg}/a32.decode (100%)
 rename target/arm/{cpu_tcg.c => tcg/cpu32.c} (93%)
 create mode 100644 target/arm/tcg/cpu64.c
 rename target/arm/{ => tcg}/crypto_helper.c (100%)
 rename target/arm/{ => tcg}/debug_helper.c (57%)
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
