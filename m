Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp491802ejo;
        Mon, 11 Dec 2023 13:20:10 -0800 (PST)
X-Received: by 2002:a17:906:6a27:b0:a1f:6551:6405 with SMTP id qw39-20020a1709066a2700b00a1f65516405mr6100020ejc.37.1702329610774;
        Mon, 11 Dec 2023 13:20:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702329610; cv=none;
        d=google.com; s=arc-20160816;
        b=ltTgAjErVxeihlrxu5URI8SYPbkZZPGdR1sqF0ySucf9Hsl7f1oV0urnAiEbhYThm6
         as6yWqwIyGO2RobF/GDp4Dj+cvwW8hXURrFeKTQQCvfLJWFxd60XPLc/aeVD9IOcdhW3
         Yi3uyeeC2u4z5mr0lIJQ9YF2cReEmSC6IUkMA81vM9XuOrLdDCjL4hQUjfbKNti/+/HR
         gQlu6LIeEAHXswFTRNCte7Uf4OuGpInDU/gPfcoK4HxEjwlLed/eMBKNnBrZopGgjI45
         QdbgjIndSuXxyrpQ70a8ta8pP/00BDZ1HWZgspkNYoNhu6ArwrxnFYfBbp+LhpAKRUG+
         5HHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=zyD776fcn4JziH1GJLbJJRuMyU18zRNqnHFMyBj+0TA=;
        fh=6uA3yvXeN55FEhLQ+7xhayEyGzy+Y3z2qOYV5oRrcR8=;
        b=q6YbKUeFra/Lm7eRbBGkpvg66DBCyvP34lWaczIsd97r5yawVjVmmk838TWgoKmgmZ
         KCQ6yjQLOJOtqORAZniQWDry5cAKAwwzjxKeQKiBqR3f1/8cnECyNrHEsfAwy2NH4Ozm
         r2WPJjXim4iPYUZa2qJBS9x5S4VvaFDECYirJbxwHnSji0sWJp8nv3zsJggvWbapGglG
         WsCbH9J94ekfFm8eREttuzIISGnwUFuLWwFfb85D0qoocTWb6Z91TDkcOqNbxOsWcNFn
         GaA74P9+CaZ8pf2qq8YbEsPbMtw9SERZJs9/O1nYVMkrrJEccdNotS1wkoExvz6GiKjh
         Ogqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Gg2rdFjc;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id jx6-20020a170907760600b00a1908ecc5e6sor3330254ejc.0.2023.12.11.13.20.10
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 11 Dec 2023 13:20:10 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Gg2rdFjc;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702329610; x=1702934410; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zyD776fcn4JziH1GJLbJJRuMyU18zRNqnHFMyBj+0TA=;
        b=Gg2rdFjcTWfL1psVBTAQYbUHLxrA+yZZCylKOiwJoF/sJFEDezHik2Dq/FYgs9L9TE
         PjHJDa29Z/ftXRgvr0dlg2zq8Ko2RXwjXjAf8nNFXJwvELPBoqOwWH1zJBPcGEmjVPAO
         tfNFNj+vHcaR/KyG1E4BlSj1XKznX+AbFt4JAUDZ5tk+DcpRbXsa4RjjsXB4TA0aSZiM
         7mop3DBszdmx3d1Es2oRsPCVtzXM83MbVLuBOCuF89owcMtVwnhdqOa/9c77LK8/zy4z
         3AGMGxiaH+NNQoVT4kcBfsp9jlFJpkc0EPfrqGhX9QW7akU2UxuqVb/Bq+mjedQQpD7S
         uXYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702329610; x=1702934410;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zyD776fcn4JziH1GJLbJJRuMyU18zRNqnHFMyBj+0TA=;
        b=BmN5vyeomIvAK4xOx6cbxRa2D0fTEStW/lY3DDA2as05fxB8AXoGUWjb7hl8G1OwF8
         LEKIFl+JLTZ1eXT5GO/QrHyNulrQhua7Dm4/N5JVEV3r53QO5K/qmB4SxnqpLlu20ule
         1T9ipsLParUSbFRCqf2hBnG/HkT6TBE2zWbu+gUjC1pYi2LnGpsVRQxueF9oMoGco4+I
         b7KyG/Ziu1hl2DdYRyyiDhbR6uTnGQ0esi91Yj3+sgJWV04gYxlEmh8B9M5xDx9gQdQR
         tu3YYp5kLjtRuM3w7oKcb53iwXAKVKxh0c/c8eW0DfsElpCHfssN3k8CRlj+ricjAjIO
         45ug==
X-Gm-Message-State: AOJu0Yw8qNYBpS9jpK9XhcgxRFsRfSs8NW3WZJyj2fE0RpGM0OdHXT5B
	yY5VB8i6LVYelgVUznBMvemGPbAt
X-Google-Smtp-Source: AGHT+IHeiRtafPqQMB1v6Lk/OrgDkhsDHVwqcnGopmK3HPUNpMBDgB7R0kuY1RJDNUkzKnKzGMRX9g==
X-Received: by 2002:a17:906:13:b0:9a9:f0e6:904e with SMTP id 19-20020a170906001300b009a9f0e6904emr3955274eja.16.1702329610416;
        Mon, 11 Dec 2023 13:20:10 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.175.193])
        by smtp.gmail.com with ESMTPSA id tm8-20020a170907c38800b00a1e30528af3sm5268706ejc.47.2023.12.11.13.20.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 11 Dec 2023 13:20:09 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>,
	Peter Xu <peterx@redhat.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Eduardo Habkost <eduardo@habkost.net>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	qemu-riscv@nongnu.org,
	David Hildenbrand <david@redhat.com>,
	Warner Losh <imp@bsdimp.com>,
	Claudio Fontana <cfontana@suse.de>,
	Brian Cain <bcain@quicinc.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 00/24] exec: Rework of various headers (user focused)
Date: Mon, 11 Dec 2023 22:19:37 +0100
Message-ID: <20231211212003.21686-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: gFM2D5Odvlze

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

Regards,

Phil.

Philippe Mathieu-Daudé (24):
  exec: Include 'cpu.h' before validating CPUArchState placement
  exec: Expose 'target_page.h' API to user emulation
  target: Define TCG_GUEST_DEFAULT_MO in 'cpu-param.h'
  accel: Include missing 'exec/cpu_ldst.h' header
  semihosting/uaccess: Avoid including 'cpu.h'
  semihosting/guestfd: Remove unused 'semihosting/uaccess.h' header
  host/load-extract: Include missing 'qemu/atomic.h' and 'qemu/int128.h'
  host/atomic128: Include missing 'qemu/atomic.h' header
  hw/ppc/spapr_hcall: Remove unused 'exec/exec-all.h' included header
  hw/misc/mips_itu: Remove unnecessary 'exec/exec-all.h' header
  hw/s390x/ipl: Remove unused 'exec/exec-all.h' included header
  target/i386: Include missing 'exec/exec-all.h' header
  accel/tcg: Include missing 'hw/core/cpu.h' header
  gdbstub: Include missing 'hw/core/cpu.h' header
  exec/cpu-all: Remove unused headers
  exec/cpu-all: Reduce 'qemu/rcu.h' header inclusion
  target/ppc/excp_helper: Avoid 'abi_ptr' in system emulation
  accel/tcg: Un-inline retaddr helpers to 'user-retaddr.h'
  exec/user: Do not include 'cpu.h' in 'abitypes.h'
  exec: Declare abi_ptr type in its own 'tcg/abi_ptr.h' header
  exec/cpu_ldst: Avoid including 'cpu.h'
  exec/cpu-all: Restrict inclusion of 'exec/user/guest-base.h'
  exec/cpu-all: Extract page-protection definitions to
    page-prot-common.h
  target: Restrict 'sysemu/reset.h' to system emulation

 meson.build                                   |  2 +-
 accel/tcg/user-retaddr.h                      | 28 ++++++++++
 bsd-user/bsd-mem.h                            |  1 +
 bsd-user/qemu.h                               |  1 +
 host/include/generic/host/atomic128-cas.h     |  2 +
 host/include/generic/host/atomic128-ldst.h    |  2 +
 .../generic/host/load-extract-al16-al8.h      |  3 ++
 include/exec/cpu-all.h                        | 50 +++---------------
 include/exec/cpu_ldst.h                       | 51 ++++---------------
 include/exec/exec-all.h                       |  1 +
 include/exec/page-prot-common.h               | 38 ++++++++++++++
 include/exec/ram_addr.h                       |  1 +
 include/exec/translator.h                     |  5 +-
 include/exec/user/abitypes.h                  |  9 +++-
 include/exec/user/guest-base.h                |  6 +++
 include/semihosting/uaccess.h                 |  3 +-
 include/tcg/abi_ptr.h                         | 32 ++++++++++++
 target/alpha/cpu-param.h                      |  3 ++
 target/alpha/cpu.h                            |  3 --
 target/arm/cpu-param.h                        |  8 +--
 target/arm/cpu.h                              |  4 +-
 target/avr/cpu-param.h                        |  2 +
 target/avr/cpu.h                              |  2 -
 target/hppa/cpu-param.h                       |  6 +++
 target/hppa/cpu.h                             |  6 ---
 target/i386/cpu-param.h                       |  3 ++
 target/i386/cpu.h                             |  3 --
 target/loongarch/cpu-param.h                  |  2 +
 target/loongarch/cpu.h                        |  2 -
 target/microblaze/cpu-param.h                 |  3 ++
 target/microblaze/cpu.h                       |  3 --
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
 target/s390x/cpu-param.h                      |  6 +++
 target/s390x/cpu.h                            |  3 --
 target/sparc/cpu-param.h                      | 23 +++++++++
 target/sparc/cpu.h                            | 23 ---------
 target/xtensa/cpu-param.h                     |  3 ++
 target/xtensa/cpu.h                           |  3 --
 accel/tcg/cpu-exec.c                          |  3 ++
 accel/tcg/cputlb.c                            |  2 +
 accel/tcg/tb-maint.c                          |  1 +
 accel/tcg/tcg-accel-ops.c                     |  2 +
 accel/tcg/translator.c                        |  1 +
 accel/tcg/user-exec.c                         |  2 +
 bsd-user/main.c                               |  1 +
 bsd-user/mmap.c                               |  1 +
 bsd-user/signal.c                             |  1 +
 cpu-target.c                                  |  1 +
 gdbstub/gdbstub.c                             |  1 +
 hw/misc/mips_itu.c                            |  3 +-
 hw/ppc/ppc440_bamboo.c                        |  1 +
 hw/ppc/sam460ex.c                             |  1 +
 hw/ppc/spapr_hcall.c                          |  1 -
 hw/ppc/virtex_ml507.c                         |  1 +
 hw/s390x/ipl.c                                |  1 -
 linux-user/arm/cpu_loop.c                     |  1 +
 linux-user/elfload.c                          |  2 +
 linux-user/main.c                             |  1 +
 linux-user/mmap.c                             |  1 +
 linux-user/nios2/cpu_loop.c                   |  1 +
 linux-user/signal.c                           |  1 +
 linux-user/syscall.c                          |  1 +
 page-target.c                                 | 43 ++++++++++++++++
 semihosting/guestfd.c                         |  1 -
 system/physmem.c                              | 36 +------------
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
 target/i386/cpu.c                             |  2 +-
 target/i386/tcg/fpu_helper.c                  |  1 +
 target/i386/tcg/sysemu/excp_helper.c          |  1 +
 target/loongarch/cpu.c                        |  2 +
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
 118 files changed, 332 insertions(+), 192 deletions(-)
 create mode 100644 accel/tcg/user-retaddr.h
 create mode 100644 include/exec/page-prot-common.h
 create mode 100644 include/tcg/abi_ptr.h
 create mode 100644 page-target.c

-- 
2.41.0
