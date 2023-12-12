Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp864330ejo;
        Tue, 12 Dec 2023 04:34:06 -0800 (PST)
X-Received: by 2002:a17:907:3a07:b0:a1e:6ae7:6e14 with SMTP id fb7-20020a1709073a0700b00a1e6ae76e14mr3013681ejc.7.1702384445962;
        Tue, 12 Dec 2023 04:34:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702384445; cv=none;
        d=google.com; s=arc-20160816;
        b=lHoX3b6zOLst7TKHn7xFdhJ9W7qbMP4sc+MbAT5fiGk0wKuFDEOYrUjGaMsL4A5EXu
         bV/+eiAMozrPzt197HhE4WO/ZOxltKuks5EIn5ATDrqCIWFzFBVbJVbijXtojOqZmegQ
         zDYx3dIreqoMOHfY8H/dnj4gDOTNlAN8DpEnfVkwnEHv7H4raqyGZ726k2oSAskUxFn2
         OnxUgyad+5eCYimGXOt6rFju9MJYM1Dlbf2QmP202u5RXQIJmrU4kvQKfnIf51VOzgLC
         3MrCMYO9VaFE1ad5lR9tBcGDkq6rgG/aoUjuJ9Zg5dR4+ZKQHo4fmUW4tBZ9k+Bze1yq
         zxHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=d9ApWyO7EhxgbNyFRXWeJAkAzhLur71apbGlg0VtMVw=;
        fh=vlFEGdij83GYetLrOUaCnR04sbYRvtckD5L7fw5192c=;
        b=qlxiX6mClIFkfrviMgI02D7qCnxZI0M3u+/6Hfvv5AkKTSlQev1p19ocqf7IuEKqht
         bCIF2X27qr30QNn4cxDXxnS8a8rkfKzxdObQDYv9kxERIaQG2XmRzmXrX0mZ1Y/14nR2
         OE9gpO76alTTeQyhOXbGpsClftsPOoKuCUQdPy+CAuX2HvHqbmfxgrlEuZpfI7Yyj2+l
         tR4VmJYJHZ8qWHD2hfOpbjqyBXQjn28UfMyt0tfEAghGJvBQNG3RNLwr9X/t+jrT71l8
         U1N70S3yYykLRYcOJutcexlMxCTCueA3OB9SYlO2Ed/blXGhQGYe8odH3+PmH/CYOmdI
         isqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uiD9kv8b;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id gx22-20020a1709068a5600b00a1dda251ad6sor2296095ejc.10.2023.12.12.04.34.05
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 12 Dec 2023 04:34:05 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uiD9kv8b;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702384445; x=1702989245; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d9ApWyO7EhxgbNyFRXWeJAkAzhLur71apbGlg0VtMVw=;
        b=uiD9kv8bjQRHB5ewnsQI0exFOP3YCfJzAAKADuqUTT3olFbGWvjiVbh5/TikYxe0Ed
         xwBpZjflaKw+9Y0l8sPwgfwf45ZK+fnrFtyPANTxZRp1wvn3s3r8lHjft8PIs7FGq2Y8
         MqOxoCCKIkbspoj5gVMRdvlSnyVhcw7JuMiw5NEWyzvzm692s8VGzHT2JhPsg4ux5FV/
         /DWkIcHafwycd5H3+TVCsgSX4nYhg2ZdDMdyFN9n6yjXcK+7Z8HClvDRFtSh5lSWVZB3
         8JDcvfsDU0payk3bLBqynXXumQhqD0H32Vhn349kE/4wVDBwaEZsfer2FuHkmGpR6IlV
         q1HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702384445; x=1702989245;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d9ApWyO7EhxgbNyFRXWeJAkAzhLur71apbGlg0VtMVw=;
        b=qxh/0Pz/G/50MZRhro8kVzdWSF8QsieGY5hBro9XbMSGClMlpw1FljvqewKoT37qWn
         9OHpAjx1omakz5z+tSF2Fit+J68QIaGiaz0wt2IFbyamPKTQDyFY2tPmetgXuL3wDdEG
         d27Ofc59jiFg2Kd6s/i2cbDGb97Sxz1QOkP8kGbzPjr8Np4xJajAqjX+djT9HRr2gCiQ
         GTRjeN9Tfxd8AGVOqLliGhOLb+LRUYPMWCLvdqaY6uK0fgC3OHgixT5ZpqCSsIuqcM7P
         CX4ajB4d5jTAFAFo9mT1KUdMl56/rzX6KtEJqIQEeFpntiXN4jHsgEdByg62yY4cwN1/
         Jx6g==
X-Gm-Message-State: AOJu0Yze5sUk/yYflx4xRvriCXWcHOBFurYndvVp6y5G8i/wJp7agk35
	kCl6Gf6AjHQNaTP0+6CUZQOSaosW
X-Google-Smtp-Source: AGHT+IEX3TKxES/s8Fqshp5qZHHYjhMiqh1QW2pIMhu8bEDpGj5/3abCpUKZqgThz7RocA+rCG55WA==
X-Received: by 2002:a17:906:9c47:b0:9e0:5dab:a0f1 with SMTP id fg7-20020a1709069c4700b009e05daba0f1mr2377595ejc.36.1702384445562;
        Tue, 12 Dec 2023 04:34:05 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.175.193])
        by smtp.gmail.com with ESMTPSA id tq14-20020a170907c50e00b00a1f83646eb6sm4767092ejc.149.2023.12.12.04.34.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 12 Dec 2023 04:34:05 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Claudio Fontana <cfontana@suse.de>,
	qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-riscv@nongnu.org,
	Brian Cain <bcain@quicinc.com>,
	Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Anton Johansson <anjo@rev.ng>,
	Warner Losh <imp@bsdimp.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 00/23] exec: Rework of various headers (user focused)
Date: Tue, 12 Dec 2023 13:33:36 +0100
Message-ID: <20231212123401.37493-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: JIqoDAEtvc1G

Hi,

These patches are extracted from a bigger work where
"exec/{exec,cpu,translate}-all.h" are split in various
specific APIs. This helped:
  - differenciate/build:
      . user VS system
      . target-specific VS generic
    which is necessary for heterogeneous build
  - reduced header pressure
  - clarify APIs

This series is focused on user (vs system) cleanups.
More useful changes will come after.

Since v1:
- Addressed Richard comments
- Added R-b tags

Regards,

Phil.

Philippe Mathieu-Daudé (23):
  exec: Include 'cpu.h' before validating CPUArchState placement
  exec: Expose 'target_page.h' API to user emulation
  target: Define TCG_GUEST_DEFAULT_MO in 'cpu-param.h'
  accel: Include missing 'exec/cpu_ldst.h' header
  gdbstub: Include missing 'hw/core/cpu.h' header
  semihosting/uaccess: Avoid including 'cpu.h'
  semihosting/guestfd: Remove unused 'semihosting/uaccess.h' header
  host/load-extract: Include missing 'qemu/atomic.h' and 'qemu/int128.h'
  host/atomic128: Include missing 'qemu/atomic.h' header
  target/i386: Include missing 'exec/exec-all.h' header
  accel/tcg: Include missing 'hw/core/cpu.h' header
  exec/cpu-all: Remove unused 'qemu/thread.h' header
  exec/cpu-all: Reduce 'qemu/rcu.h' header inclusion
  exec/cpu-all: Remove unused tswapls() definitions
  exec: Declare target_words_bigendian() in 'exec/tswap.h'
  exec: Move [b]tswapl() declarations to 'exec/user/tswap-target.h'
  target/ppc/excp_helper: Avoid 'abi_ptr' in system emulation
  accel/tcg: Un-inline retaddr helpers to 'user-retaddr.h'
  exec/user: Do not include 'cpu.h' in 'abitypes.h'
  exec: Declare abi_ptr type in its own 'abi_ptr.h' header
  exec/cpu-all: Restrict inclusion of 'exec/user/guest-base.h'
  exec/cpu-all: Extract page-protection definitions to
    page-prot-common.h
  exec/cpu_ldst: Avoid including 'cpu.h'

 meson.build                                   |  2 +-
 accel/tcg/user-retaddr.h                      | 28 +++++++++
 bsd-user/bsd-mem.h                            |  1 +
 bsd-user/freebsd/target_os_elf.h              |  1 +
 bsd-user/freebsd/target_os_stack.h            |  1 +
 bsd-user/netbsd/target_os_elf.h               |  1 +
 bsd-user/openbsd/target_os_elf.h              |  1 +
 bsd-user/qemu.h                               |  1 +
 host/include/generic/host/atomic128-cas.h     |  2 +
 host/include/generic/host/atomic128-ldst.h    |  2 +
 .../generic/host/load-extract-al16-al8.h      |  3 +
 include/exec/abi_ptr.h                        | 33 +++++++++++
 include/exec/cpu-all.h                        | 59 ++-----------------
 include/exec/cpu_ldst.h                       | 52 ++++------------
 include/exec/exec-all.h                       |  1 +
 include/exec/page-prot-common.h               | 38 ++++++++++++
 include/exec/ram_addr.h                       |  1 +
 include/exec/translator.h                     |  5 +-
 include/exec/tswap.h                          | 12 +++-
 include/exec/user/abitypes.h                  |  8 ++-
 include/exec/user/guest-base.h                |  6 ++
 include/exec/user/tswap-target.h              | 22 +++++++
 include/hw/core/cpu.h                         | 11 ----
 include/semihosting/uaccess.h                 |  3 +-
 target/alpha/cpu-param.h                      |  3 +
 target/alpha/cpu.h                            |  3 -
 target/arm/cpu-param.h                        |  8 ++-
 target/arm/cpu.h                              |  4 +-
 target/avr/cpu-param.h                        |  2 +
 target/avr/cpu.h                              |  2 -
 target/hppa/cpu-param.h                       |  8 +++
 target/hppa/cpu.h                             |  6 --
 target/i386/cpu-param.h                       |  3 +
 target/i386/cpu.h                             |  3 -
 target/loongarch/cpu-param.h                  |  2 +
 target/loongarch/cpu.h                        |  2 -
 target/microblaze/cpu-param.h                 |  3 +
 target/microblaze/cpu.h                       |  3 -
 target/mips/cpu-param.h                       |  2 +
 target/mips/cpu.h                             |  2 -
 target/openrisc/cpu-param.h                   |  2 +
 target/openrisc/cpu.h                         |  2 -
 target/ppc/cpu-param.h                        |  2 +
 target/ppc/cpu.h                              |  2 -
 target/ppc/internal.h                         |  1 +
 target/ppc/mmu-radix64.h                      |  2 +
 target/riscv/cpu-param.h                      |  2 +
 target/riscv/cpu.h                            |  2 -
 target/s390x/cpu-param.h                      |  6 ++
 target/s390x/cpu.h                            |  3 -
 target/sparc/cpu-param.h                      | 23 ++++++++
 target/sparc/cpu.h                            | 23 --------
 target/xtensa/cpu-param.h                     |  3 +
 target/xtensa/cpu.h                           |  3 -
 accel/tcg/cpu-exec.c                          |  3 +
 accel/tcg/cputlb.c                            |  2 +
 accel/tcg/tb-maint.c                          |  1 +
 accel/tcg/tcg-accel-ops.c                     |  2 +
 accel/tcg/translator.c                        |  1 +
 accel/tcg/user-exec.c                         |  2 +
 bsd-user/main.c                               |  1 +
 bsd-user/mmap.c                               |  1 +
 bsd-user/signal.c                             |  2 +
 bsd-user/strace.c                             |  1 +
 cpu-target.c                                  |  2 +
 disas/disas.c                                 |  1 +
 gdbstub/gdbstub.c                             |  1 +
 hw/audio/virtio-snd.c                         |  2 +-
 hw/core/cpu-sysemu.c                          |  2 +-
 hw/core/generic-loader.c                      |  2 +-
 hw/display/vga.c                              |  2 +-
 hw/ppc/ppc440_bamboo.c                        |  1 +
 hw/ppc/sam460ex.c                             |  1 +
 hw/ppc/virtex_ml507.c                         |  1 +
 hw/virtio/virtio.c                            |  1 +
 linux-user/arm/cpu_loop.c                     |  1 +
 linux-user/elfload.c                          |  3 +
 linux-user/i386/signal.c                      |  1 +
 linux-user/main.c                             |  1 +
 linux-user/mmap.c                             |  1 +
 linux-user/nios2/cpu_loop.c                   |  1 +
 linux-user/ppc/signal.c                       |  1 +
 linux-user/signal.c                           |  1 +
 linux-user/syscall.c                          |  1 +
 page-target.c                                 | 43 ++++++++++++++
 semihosting/guestfd.c                         |  5 +-
 system/physmem.c                              | 36 +----------
 target/alpha/helper.c                         |  1 +
 target/arm/ptw.c                              |  1 +
 target/arm/tcg/m_helper.c                     |  1 +
 target/arm/tcg/mte_helper.c                   |  1 +
 target/arm/tcg/sve_helper.c                   |  1 +
 target/avr/helper.c                           |  1 +
 target/cris/mmu.c                             |  1 +
 target/hexagon/translate.c                    |  1 +
 target/hppa/mem_helper.c                      |  1 +
 target/hppa/translate.c                       |  1 +
 target/i386/tcg/fpu_helper.c                  |  1 +
 target/i386/tcg/sysemu/excp_helper.c          |  1 +
 target/loongarch/tlb_helper.c                 |  1 +
 target/m68k/helper.c                          |  1 +
 target/microblaze/cpu.c                       |  1 +
 target/microblaze/helper.c                    |  1 +
 target/microblaze/mmu.c                       |  1 +
 target/microblaze/translate.c                 |  1 +
 target/mips/sysemu/physaddr.c                 |  1 +
 target/mips/tcg/sysemu/tlb_helper.c           |  1 +
 target/nios2/helper.c                         |  1 +
 target/nios2/mmu.c                            |  1 +
 target/nios2/translate.c                      |  1 +
 target/openrisc/mmu.c                         |  1 +
 target/ppc/excp_helper.c                      |  2 +-
 target/ppc/mmu-hash32.c                       |  1 +
 target/ppc/mmu-hash64.c                       |  1 +
 target/ppc/mmu-radix64.c                      |  1 +
 target/ppc/mmu_common.c                       |  1 +
 target/ppc/mmu_helper.c                       |  1 +
 target/riscv/cpu_helper.c                     |  1 +
 target/riscv/pmp.c                            |  1 +
 target/riscv/vector_helper.c                  |  1 +
 target/rx/cpu.c                               |  1 +
 target/s390x/mmu_helper.c                     |  1 +
 target/s390x/tcg/mem_helper.c                 |  1 +
 target/sh4/helper.c                           |  1 +
 target/sparc/ldst_helper.c                    |  1 +
 target/sparc/mmu_helper.c                     |  1 +
 target/tricore/helper.c                       |  1 +
 target/xtensa/mmu_helper.c                    |  1 +
 target/xtensa/op_helper.c                     |  1 +
 129 files changed, 380 insertions(+), 216 deletions(-)
 create mode 100644 accel/tcg/user-retaddr.h
 create mode 100644 include/exec/abi_ptr.h
 create mode 100644 include/exec/page-prot-common.h
 create mode 100644 include/exec/user/tswap-target.h
 create mode 100644 page-target.c

-- 
2.41.0
