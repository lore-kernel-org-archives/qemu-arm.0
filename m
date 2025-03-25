Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp2396900njc;
        Mon, 24 Mar 2025 21:59:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWrJVplwm6ywX3MkB76aYdwn4+lcI7BN03OrgrF+LoSNTREO76lv0/rUpIIJDeus8TYy5d7hbYG8cYhhA==@linaro.org
X-Received: by 2002:a17:90b:2882:b0:2fa:1e56:5d82 with SMTP id 98e67ed59e1d1-3030f3f2e16mr24525881a91.17.1742878762694;
        Mon, 24 Mar 2025 21:59:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742878762; cv=none;
        d=google.com; s=arc-20240605;
        b=g0oYga3YlF4LLsyLSFi5WIxNNFQZTTxjyhFxTOT3dce+an2v1/0odwCiKehfByjaMo
         Ls3Wmqnwb2jdwznfQbnDlC4UWogEBzt1hRX1lA/FEWmjAtlOnMoslS/x8Jafbdyoq3lH
         HlRNedqQEmPepUztv5zftHRpTQ/HwSNpGb4oJUILLrxtlKn5nE2wpGHPAQBqiPnXbHcW
         uPTu0tcQlL37H9C7GUPjcEktpAqYJXj9yys3mek39if4/nhXVJBsJh/q7O2hQcMMY8Ev
         /pw3ilxBDwvJ5HmibSPW6iU/qJwUZREpPrtSOeradPQRF+XNwaYoI9PzA82xxPtTR2xE
         Ivzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=rajTAshyyuf+9dBkelCHSUjwpcojpUqSjWQK0047Uzc=;
        fh=iRs4+HClz7vDa7bXzAdV1kE2JkufE5dF/KgMjj5CFRo=;
        b=NRf336512fFexEzpfGPbyyq3meOk69asm9+460PP7OJZjoVuZ0e4YXuQNXIml3+rlI
         DcyrgEuZL3xw6vq1wP6YIK/mDMITT54MCxOFPzrkz59WkREnM6b/gPS1ZWfFcxzt7InI
         3AUgn36UZrRXHpNFkSTUpCKmUbpyRrnOv+fQPCUZESJpOgs5za5nXzIV6pyedfBco4ZW
         e7EsLX4TsRtWF7X5QfRrxfGuxfxE/f00/Flt5S1j//v8yJYYVx0jZ3zQRVProVGuTMNy
         91fBeJM01zp8+zx6xFSzTXDKPYjz9aTILcE/+CDhc2jA1Z53IZnMuj721BVHq2a/fduV
         0JNA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SMxojhVq;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-3030f5a0f6csor4514581a91.1.2025.03.24.21.59.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 24 Mar 2025 21:59:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SMxojhVq;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742878762; x=1743483562; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rajTAshyyuf+9dBkelCHSUjwpcojpUqSjWQK0047Uzc=;
        b=SMxojhVq+QYxTCFnswmQDE9u42lh63ug5nHkjDwRQeA6/cRNG29Fyd2gvDtS/WYkXO
         f6++z6tB1JNH0DR6C+vNMNQN3F+1bgdm/KOOZDltr4TAve5XxGbSA//G+oGlF4WspDeq
         BEXsaX10TyhbxQPuUg4AyE6PszXFlwlYcJf60NsegnK5pvS1Z1yL9JrFhOyzhIjX1NkC
         cfKfB+k9SGdd2nNDvBotBm0d6yIDyVeeu1bXLxhM8k4L0XVKQrbPeTpb/0i7xBUAs7xB
         maS4sD7S6hGTdeGn1kHjIB+0dcRe9mxp2TkYA44TOAfloDBwOiURrBOCYURFfH6TmULY
         mp8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742878762; x=1743483562;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rajTAshyyuf+9dBkelCHSUjwpcojpUqSjWQK0047Uzc=;
        b=NK429n+CvIv8DphU3mb9BpcJFcne9fd3hGBFIhWZ5zF/saJvEDDGh6KCprTOnOEnSo
         Fx0nU9YbzNrtRGq5pFQENr8vOuvDOeUuWSxrD3Fo81oJFojXO8nl1m1rxShkXrz+39Cv
         rH45TpfUQwELNGpN+HQFRaWQB6I9iQJ0/hPN8+vhF+iqbTdB4sPAM5qa3JI1A2TtcdLY
         NVjkkOwZSt4NdFZ+DEhkQbDfXSr8IhG8GIlhp5lwFGRN7T0ddlVd9ltkSKPRRprqzZty
         yw7Z5rLe9ffGCBMaIq1rzEXJ5CC2sPowM0pSoZakrsHatk/JCu615sKnhmTYuWmi42pT
         B/5w==
X-Forwarded-Encrypted: i=1; AJvYcCWdUHzpbR7jm9y8e1aZQqMgz2xMQNhisCdpymGtm8l8FGyp3OlYGLJD2xw52jpxUIUVbIj7qZ4SySAqww==@linaro.org
X-Gm-Message-State: AOJu0Yw0j4tZgADICg9A7xVa65K8faL2muJRqWA7evpiQ+t88y1GGxbr
	wd3IuD9NNJQyd79KTtp7v67xmYDXZ5fX4SS+3DpCg65GTkvdJ0rlQ0GAo8n6ynXp5A==
X-Gm-Gg: ASbGncv9CJlrs4l5Rfu32EufbE1hVebj7AcLTsVwiglvH3qYwnrkcOp1RwzMrXUyAPe
	K72Q4xhJr9UkQ0Mf0h6JKD6ZnB3cILyAqsPcd/lHYoPUXzr/3OomCYjgwCiJEBY9rt3RV4TATy5
	b+rg5ZOOx8cG2nYeM6N1snPIRqHy3eMxbQxgCBwzmtfSTZmC9Npq5Ou/DmmAZtzv9Yg/OYk+9Ge
	7wGYchfZafb3KWTN6qAlPJYljbjr3oW10DoBQBgKUBuUtR16pCATDxfY89fkClk1FoXVm0ChuVU
	V9rqdkvQFB6lT5eJi3MQRXBY6xSl55m9anI39eaDcZtb
X-Google-Smtp-Source: AGHT+IEuyoNLVrmTssAXxfIaajKKAVuUdLb1GQFc5Uc47d6bqWDu7TeJ4gC61YmsDCrDsik7egiLGw==
X-Received: by 2002:a17:90a:e7c7:b0:302:fc48:4f0a with SMTP id 98e67ed59e1d1-3030e148d42mr22800129a91.0.1742878761922;
        Mon, 24 Mar 2025 21:59:21 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301bf58b413sm14595120a91.13.2025.03.24.21.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 21:59:21 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	kvm@vger.kernel.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 00/29] single-binary: start make hw/arm/ common
Date: Mon, 24 Mar 2025 21:58:45 -0700
Message-Id: <20250325045915.994760-1-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: /YiOrpvRTo7s

This series focuses on removing compilation units duplication in hw/arm. We
start with this architecture because it should not be too hard to transform it,
and should give us some good hints on the difficulties we'll meet later.

We first start by making changes in global headers to be able to not rely on
specific target defines. In particular, we completely remove cpu-all.h.
We then focus on removing those defines from target/arm/cpu.h.

From there, we modify build system to create a new hw common library (per base
architecture, "arm" in this case), instead of compiling the same files for every
target.

Finally, we can declare hw/arm/boot.c, and most of the boards as common as a
first step for this part.

- Based-on: 20250317183417.285700-1-pierrick.bouvier@linaro.org
("[PATCH v6 00/18] make system memory API available for common code")
https://lore.kernel.org/qemu-devel/20250317183417.285700-1-pierrick.bouvier@linaro.org/
- Based-on: 20250318213209.2579218-1-richard.henderson@linaro.org
("[PATCH v2 00/42] accel/tcg, codebase: Build once patches")
https://lore.kernel.org/qemu-devel/20250318213209.2579218-1-richard.henderson@linaro.org

v2:
- rebase on top of Richard series
- add target include in hw_common lib
- hw_common_lib uses -DCOMPILE_SYSTEM_VS_USER introduced by Richard series
- remove cpu-all header
- remove BSWAP_NEEDED define
- new tlb-flags header
- Cleanup i386 KVM_HAVE_MCE_INJECTION definition + move KVM_HAVE_MCE_INJECTION
- remove comment about cs_base in target/arm/cpu.h
- updated commit message about registers visibility between aarch32/aarch64
- tried remove ifdefs in target/arm/helper.c but this resulted in more a ugly
  result. So just comment calls for now, as we'll clean this file later.
- make most of the boards in hw/arm common

v3:
- rebase on top of Richard series and master
- BSWAP_NEEDED commit was already merged
- Update description for commits removing kvm related headers

Pierrick Bouvier (29):
  exec/cpu-all: extract tlb flags defines to exec/tlb-flags.h
  exec/cpu-all: move cpu_copy to linux-user/qemu.h
  include/exec/cpu-all: move compile time check for CPUArchState to
    cpu-target.c
  exec/cpu-all: remove system/memory include
  exec/cpu-all: remove exec/page-protection include
  exec/cpu-all: remove tswap include
  exec/cpu-all: remove exec/cpu-interrupt include
  exec/cpu-all: remove exec/cpu-defs include
  exec/cpu-all: remove exec/target_page include
  exec/cpu-all: remove hw/core/cpu.h include
  accel/tcg: fix missing includes for TCG_GUEST_DEFAULT_MO
  accel/tcg: fix missing includes for TARGET_HAS_PRECISE_SMC
  exec/cpu-all: remove cpu include
  exec/cpu-all: transfer exec/cpu-common include to cpu.h headers
  exec/cpu-all: remove this header
  exec/target_page: runtime defintion for TARGET_PAGE_BITS_MIN
  accel/kvm: move KVM_HAVE_MCE_INJECTION define to kvm-all.c
  exec/poison: KVM_HAVE_MCE_INJECTION can now be poisoned
  target/arm/cpu: always define kvm related registers
  target/arm/cpu: flags2 is always uint64_t
  target/arm/cpu: define same set of registers for aarch32 and aarch64
  target/arm/cpu: remove inline stubs for aarch32 emulation
  meson: add common hw files
  hw/arm/boot: make compilation unit hw common
  hw/arm/armv7m: prepare compilation unit to be common
  hw/arm/digic_boards: prepare compilation unit to be common
  hw/arm/xlnx-zynqmp: prepare compilation unit to be common
  hw/arm/xlnx-versal: prepare compilation unit to be common
  hw/arm: make most of the compilation units common

 meson.build                             |  37 +++++++-
 accel/tcg/internal-target.h             |   1 +
 accel/tcg/tb-internal.h                 |   1 -
 hw/s390x/ipl.h                          |   2 +
 include/exec/cpu_ldst.h                 |   1 +
 include/exec/exec-all.h                 |   1 +
 include/exec/poison.h                   |   4 +
 include/exec/target_page.h              |   3 +
 include/exec/{cpu-all.h => tlb-flags.h} |  26 +-----
 include/hw/core/cpu.h                   |   2 +-
 include/qemu/bswap.h                    |   2 +-
 include/system/kvm.h                    |   2 -
 linux-user/qemu.h                       |   3 +
 linux-user/sparc/target_syscall.h       |   2 +
 target/alpha/cpu.h                      |   4 +-
 target/arm/cpu.h                        |  40 ++------
 target/arm/internals.h                  |   1 +
 target/avr/cpu.h                        |   4 +-
 target/hexagon/cpu.h                    |   3 +-
 target/hppa/cpu.h                       |   5 +-
 target/i386/cpu.h                       |   5 +-
 target/i386/hvf/vmx.h                   |   1 +
 target/loongarch/cpu.h                  |   4 +-
 target/m68k/cpu.h                       |   4 +-
 target/microblaze/cpu.h                 |   4 +-
 target/mips/cpu.h                       |   4 +-
 target/openrisc/cpu.h                   |   4 +-
 target/ppc/cpu.h                        |   4 +-
 target/ppc/mmu-hash32.h                 |   2 +
 target/ppc/mmu-hash64.h                 |   2 +
 target/riscv/cpu.h                      |   4 +-
 target/rx/cpu.h                         |   4 +-
 target/s390x/cpu.h                      |   4 +-
 target/sh4/cpu.h                        |   4 +-
 target/sparc/cpu.h                      |   4 +-
 target/tricore/cpu.h                    |   3 +-
 target/xtensa/cpu.h                     |   4 +-
 accel/kvm/kvm-all.c                     |   5 +
 accel/tcg/cpu-exec.c                    |   3 +-
 accel/tcg/cputlb.c                      |   1 +
 accel/tcg/tb-maint.c                    |   1 +
 accel/tcg/translate-all.c               |   1 +
 accel/tcg/user-exec.c                   |   2 +
 cpu-target.c                            |   5 +
 hw/alpha/dp264.c                        |   1 +
 hw/alpha/typhoon.c                      |   1 +
 hw/arm/armv7m.c                         |   8 +-
 hw/arm/boot.c                           |   2 +
 hw/arm/digic_boards.c                   |   2 +-
 hw/arm/smmuv3.c                         |   1 +
 hw/arm/xlnx-versal.c                    |   2 -
 hw/arm/xlnx-zynqmp.c                    |   2 -
 hw/hppa/machine.c                       |   1 +
 hw/i386/multiboot.c                     |   1 +
 hw/i386/pc.c                            |   1 +
 hw/i386/pc_sysfw_ovmf.c                 |   1 +
 hw/i386/vapic.c                         |   1 +
 hw/loongarch/virt.c                     |   1 +
 hw/m68k/next-cube.c                     |   1 +
 hw/m68k/q800.c                          |   1 +
 hw/m68k/virt.c                          |   1 +
 hw/openrisc/boot.c                      |   1 +
 hw/pci-host/astro.c                     |   1 +
 hw/ppc/e500.c                           |   1 +
 hw/ppc/mac_newworld.c                   |   1 +
 hw/ppc/mac_oldworld.c                   |   1 +
 hw/ppc/ppc.c                            |   1 +
 hw/ppc/ppc_booke.c                      |   1 +
 hw/ppc/prep.c                           |   1 +
 hw/ppc/spapr_hcall.c                    |   1 +
 hw/ppc/spapr_ovec.c                     |   1 +
 hw/riscv/riscv-iommu-pci.c              |   1 +
 hw/riscv/riscv-iommu.c                  |   1 +
 hw/s390x/s390-pci-bus.c                 |   1 +
 hw/s390x/s390-pci-inst.c                |   1 +
 hw/s390x/s390-skeys.c                   |   1 +
 hw/sparc/sun4m.c                        |   1 +
 hw/sparc64/sun4u.c                      |   1 +
 hw/xtensa/pic_cpu.c                     |   1 +
 monitor/hmp-cmds-target.c               |   1 +
 semihosting/uaccess.c                   |   2 +-
 target/alpha/helper.c                   |   2 +
 target/arm/gdbstub64.c                  |   1 +
 target/arm/helper.c                     |   6 ++
 target/arm/hvf/hvf.c                    |   1 +
 target/arm/ptw.c                        |   1 +
 target/arm/tcg/helper-a64.c             |   1 +
 target/arm/tcg/hflags.c                 |   4 +-
 target/arm/tcg/mte_helper.c             |   1 +
 target/arm/tcg/sve_helper.c             |   1 +
 target/arm/tcg/tlb-insns.c              |   1 +
 target/avr/helper.c                     |   2 +
 target/hexagon/translate.c              |   1 +
 target/i386/arch_memory_mapping.c       |   1 +
 target/i386/helper.c                    |   2 +
 target/i386/hvf/hvf.c                   |   1 +
 target/i386/kvm/hyperv.c                |   1 +
 target/i386/kvm/kvm.c                   |   1 +
 target/i386/kvm/xen-emu.c               |   1 +
 target/i386/sev.c                       |   1 +
 target/i386/tcg/system/excp_helper.c    |   2 +
 target/i386/tcg/system/misc_helper.c    |   1 +
 target/i386/tcg/system/tcg-cpu.c        |   1 +
 target/i386/xsave_helper.c              |   1 +
 target/loongarch/cpu_helper.c           |   1 +
 target/loongarch/tcg/translate.c        |   1 +
 target/m68k/helper.c                    |   1 +
 target/microblaze/helper.c              |   1 +
 target/microblaze/mmu.c                 |   1 +
 target/mips/tcg/system/cp0_helper.c     |   1 +
 target/mips/tcg/translate.c             |   1 +
 target/openrisc/mmu.c                   |   1 +
 target/ppc/excp_helper.c                |   1 +
 target/ppc/mmu-book3s-v3.c              |   1 +
 target/ppc/mmu-hash64.c                 |   1 +
 target/ppc/mmu-radix64.c                |   1 +
 target/riscv/cpu_helper.c               |   1 +
 target/riscv/op_helper.c                |   1 +
 target/riscv/pmp.c                      |   1 +
 target/riscv/vector_helper.c            |   2 +
 target/rx/cpu.c                         |   1 +
 target/s390x/helper.c                   |   1 +
 target/s390x/ioinst.c                   |   1 +
 target/s390x/tcg/mem_helper.c           |   1 +
 target/sparc/ldst_helper.c              |   1 +
 target/sparc/mmu_helper.c               |   2 +
 target/tricore/helper.c                 |   1 +
 target/xtensa/helper.c                  |   1 +
 target/xtensa/mmu_helper.c              |   1 +
 target/xtensa/op_helper.c               |   1 +
 target/xtensa/xtensa-semi.c             |   1 +
 tcg/tcg-op-ldst.c                       |   2 +-
 hw/arm/meson.build                      | 117 ++++++++++++------------
 133 files changed, 286 insertions(+), 169 deletions(-)
 rename include/exec/{cpu-all.h => tlb-flags.h} (84%)

-- 
2.39.5
