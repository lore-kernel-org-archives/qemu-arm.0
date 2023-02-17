Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp127456ejb;
        Fri, 17 Feb 2023 12:13:56 -0800 (PST)
X-Google-Smtp-Source: AK7set9anvJiuZroNblNBOdBGlHrR95Oiv/AcMpCDJxcrsNZywnINVatzYIeOs1syB87xaFG2yZI
X-Received: by 2002:a5d:4945:0:b0:2c5:9599:6ef6 with SMTP id r5-20020a5d4945000000b002c595996ef6mr4556003wrs.58.1676664836335;
        Fri, 17 Feb 2023 12:13:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676664836; cv=none;
        d=google.com; s=arc-20160816;
        b=BW8pgHis/OhaYC8ViQToNGdLIXAjqWEB6Nw0W/K0rD0fEXcOIYU+sKrX4kmQGVCeD4
         oa51oNOBMx1KvybLWBJebf6T6VvM8LpiJxMi/8JwRdgRo1/XhzU9BtaNQKWTVFfswLfd
         zPxka3HOhcjyy3YYttO+CdbY7bzP7afY9oQWvHcTToKF87xfiiT5biurmpBp+sM0WVkI
         4t4rJez3GrJ/NAn6tpQtWHe/cqgfioaHopz0EkctTPj82/bDZlkNFav7YsAwpxNqM9BP
         97TNHkK87dx77oTA3BFSe605E1WQJNeSKWnw7EEus7yFZ+n4symA5L68pAYwau5sC2fy
         ET7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:dkim-signature;
        bh=CUnkFs6ZZHikdqJXlbnqHuzgRuMNhocLYh99enkg1eE=;
        b=fU400s8USnlqoN7QIjMKm/Rmkl0FqoeiwIW8TwWYsk+lCPaLsmizNoO8XEMxbjzxK3
         rievYbqGDS11/OjVeC+jB5g79XxnZXGQevFaTN5sHLH1L7vUKMNxg4hyIN2FmngjT1no
         LzePHBIT/3HZoXvEGu2EnXQf+l9bDt6Lb1gowxTjhhkgt65EbDiKt16vYWiZXAkqYhts
         GrKbIADbnHxF+BdIfaa3ZWwtiuSUifPJp4p0l1wFiuBIc5DcDVvv5YDSq+ne9A9E3QVX
         rwtGre73xVcDrFn1MhkkX1D2QEjw/IoKv9F+ZruaIu8oHkxvTIayZ2X/eMXpVe4ZwpVv
         zi7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=G7Ruh2CM;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=BAHDipwr;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [2001:67c:2178:6::1d])
        by mx.google.com with ESMTPS id n17-20020a5d4c51000000b002c548f18314si5343380wrt.214.2023.02.17.12.13.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Feb 2023 12:13:56 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) client-ip=2001:67c:2178:6::1d;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=G7Ruh2CM;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=BAHDipwr;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id AD24F20FAA;
	Fri, 17 Feb 2023 20:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1676664835; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=CUnkFs6ZZHikdqJXlbnqHuzgRuMNhocLYh99enkg1eE=;
	b=G7Ruh2CMeY+Sc8EbcEFcDho1S1bOt+EkO8bl0M0DCnIk1Ez//Ba9KoSofJ41Ehno6GDaTw
	QxYgjBHsfnX8cK7yDzmYhgJNg6b4eZceV2xnr9oZ3jxIo+dMRK0A83d2ZzSsPbouKuXKnI
	PUCjOHA9+XINj950prN7mBblnSL7dqs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1676664835;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=CUnkFs6ZZHikdqJXlbnqHuzgRuMNhocLYh99enkg1eE=;
	b=BAHDipwre2ghYVKvfzK4gnZQ0i6n9fQ59Pr31Mwzu9Hh0vDxqKaYYNIuNcOXAGLbM3a3mN
	dD+z0JJDaRxZxdAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BB1E7138E3;
	Fri, 17 Feb 2023 20:13:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 1tmVIADg72MwIAAAMHmgww
	(envelope-from <farosas@suse.de>); Fri, 17 Feb 2023 20:13:52 +0000
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
Subject: [PATCH v6 00/29] target/arm: Allow CONFIG_TCG=n builds
Date: Fri, 17 Feb 2023 17:11:21 -0300
Message-Id: <20230217201150.22032-1-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Ne5maV345SjN

Addressed Peter's comments and dropped the cpregs change which is not
related to fixing the --disable-tcg build. This unblocks the xenpvh
series and I can tackle the regs split without holding up the build
work.

changes:
- debug regs: I left debug_helper.c out of the movement to tcg/ along
  with the other files that still are somewhat coupled to tcg. We
  don't need to do this right now, but I propose that after the cpregs
  split we define something like:

  target/arm/
    cpregs.c - generic code and uncategorized registers
    debug_regs.c - debug registers
    pmu_regs.c - PMU registers
    gtimer_regs.c - Generic Timer registers
    *_regs.c - <other groups of registers>

    tcg/helper.c - generic helpers
    tcg/debug_helper.c - TCG helpers
    tcg/*_helper.c - <other TCG helpers>

- cortex regs: these were _not_ related to the 32-bit cpus in
  cpu_tcg.c, they were related to 64-bit cpus in cpu64.c and only used
  to borrow some registers for the 32-bit "max" cpu. I moved them into
  cpu64.c.

- avocado migration test: rewrote it in a more generic fashion and
  stopped using defaults for the major (by some definition of major)
  architectures (let me know if I missed any).

- new avocado patch that fixes version.py for aarch64. This was lost
  in the ml.

- new patch to fix the tests that break due to Xen pulling in
  non-native QEMU targets

Thanks!

v5 resend:
https://lore.kernel.org/r/20230213202927.28992-1-farosas@suse.de

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

Fabiano Rosas (22):
  target/arm: Move PC alignment check
  target/arm: Move cpregs code out of cpu.h
  target/arm: Wrap breakpoint/watchpoint updates with tcg_enabled
  target/arm: Wrap TCG-only code in debug_helper.c
  target/arm: move translate modules to tcg/
  target/arm: Wrap arm_rebuild_hflags calls with tcg_enabled
  target/arm: Move hflags code into the tcg directory
  target/arm: Move regime_using_lpae_format into internal.h
  target/arm: Don't access TCG code when debugging with KVM
  cpu-defs.h: Expose CPUTLBEntryFull to non-TCG code
  target/arm: Move cortex sysregs into cpu64.c
  tests/avocado: Skip tests that require a missing accelerator
  tests/avocado: Tag TCG tests with accel:tcg
  target/arm: Move 64-bit TCG CPUs into tcg/
  target/arm: Use "max" as default cpu for the virt machine with KVM
  tests/qtest: arm-cpu-features: Match tests to required accelerators
  tests/qtest: Restrict tpm-tis-devices-{swtpm}-test to CONFIG_TCG
  target/avocado: Pass parameters to migration test
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
 configs/devices/arm-softmmu/default.mak       |  39 -
 hw/arm/Kconfig                                |  43 +-
 hw/arm/boot.c                                 |   6 +-
 hw/arm/virt.c                                 |  10 +-
 hw/intc/armv7m_nvic.c                         |  20 +-
 include/exec/cpu-defs.h                       |   6 +
 target/arm/Kconfig                            |   7 +
 target/arm/arm-powerctl.c                     |   7 +-
 target/arm/cpregs.h                           | 104 +++
 target/arm/cpu.c                              |   9 +-
 target/arm/cpu.h                              |  91 ---
 target/arm/cpu64.c                            | 686 ++----------------
 target/arm/debug_helper.c                     | 490 +++++++------
 target/arm/helper.c                           | 430 +----------
 target/arm/internals.h                        |  33 +-
 target/arm/machine.c                          |  30 +-
 target/arm/meson.build                        |  49 +-
 target/arm/ptw.c                              |   4 +
 target/arm/tcg-stubs.c                        |  27 +
 target/arm/{ => tcg}/a32-uncond.decode        |   0
 target/arm/{ => tcg}/a32.decode               |   0
 target/arm/{cpu_tcg.c => tcg/cpu32.c}         |  72 +-
 target/arm/tcg/cpu64.c                        | 655 +++++++++++++++++
 target/arm/{ => tcg}/crypto_helper.c          |   0
 target/arm/{ => tcg}/helper-a64.c             |   0
 target/arm/tcg/hflags.c                       | 403 ++++++++++
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
 tests/avocado/avocado_qemu/__init__.py        |   4 +
 tests/avocado/boot_linux_console.py           |   1 +
 tests/avocado/migration.py                    |  83 ++-
 tests/avocado/reverse_debugging.py            |   8 +
 tests/avocado/version.py                      |   1 +
 tests/qtest/arm-cpu-features.c                |  34 +-
 tests/qtest/bios-tables-test.c                |   4 +
 tests/qtest/boot-serial-test.c                |  10 +
 tests/qtest/meson.build                       |   4 +-
 tests/qtest/migration-test.c                  |   5 +
 tests/qtest/pxe-test.c                        |   6 +
 tests/qtest/vmgenid-test.c                    |   6 +
 78 files changed, 1894 insertions(+), 1583 deletions(-)
 create mode 100644 target/arm/tcg-stubs.c
 rename target/arm/{ => tcg}/a32-uncond.decode (100%)
 rename target/arm/{ => tcg}/a32.decode (100%)
 rename target/arm/{cpu_tcg.c => tcg/cpu32.c} (93%)
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
