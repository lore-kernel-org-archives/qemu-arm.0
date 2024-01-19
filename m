Received: by 2002:a17:906:2b99:b0:a2e:1324:ea5c with SMTP id m25csp878973ejg;
        Fri, 19 Jan 2024 03:37:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGaB1oVFqVtUjzBwwvIiVDDfop+sdP8/WfujWU4kd1Jpn6DA8TfsqAG6LiTVb7eDzlSuW1O
X-Received: by 2002:ad4:5f0d:0:b0:67f:78e9:4698 with SMTP id fo13-20020ad45f0d000000b0067f78e94698mr2816165qvb.64.1705664240571;
        Fri, 19 Jan 2024 03:37:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705664240; cv=none;
        d=google.com; s=arc-20160816;
        b=Xo6Bp9QTJVEWl4RmJi3ZeLlPwonSUHG/+Nb02qMm5qo7vaya8Eu5+HRQA0ML+PLAOJ
         GHT2TAeh2kx/SysNkqU2a5k1evt6xst7JSxNngLP+p4ScPpqrL/i2oxdwi5OxU2QrQsD
         4vbD3auxprrCxwIyXdR65z9xUC+uV53G7zk5IVpaS7/Cs+K77DfJAbAnJvBuvPnz2nKQ
         ez7oj3FbmoCxvfU+JWt19krf1t2jDdJV9D4xxYXBPGcUkjuRd7gB8zCft7TpoRo2wezk
         Q2E8C5ZxYW70FngfJ4XhyE8dcf/wQuwpH03cmQ9FqNmuF24zvJmIjDgkhwY9rQeqaZNz
         L/yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=FiTFj1k6iws3Fa/IOpt1AOvFogP9Al8X3pBEue7+AFk=;
        fh=xtYdCS4v4YGdEaSFrHu4PG3cea4ikl8VINuvi+0t+rg=;
        b=rNkDcnAZCLdq0w9btMMIcWqv0D6QzBGcpdQ8F8Z7GF4y0ka16EaacxKxN0Px0jE6zv
         c4g6oo/hwhkjZXDa6A0T2qe+98phZUkDaQvOEuAkFK1AXKZWkiP5QSCrw+7hwQiEk8TR
         HdYnSAvSmRbM3/NJYfhU4jXQLoSOQtnbXxYsdA2v0KGw2DoqXTMWUb4AsK+nKIrP/hcM
         KusQO/6UH6OAEh8wRKK+OjBG89WjzmG6VxBZBBy7qdwhF+2K8llsbRGGMvIBnFTN3+/N
         BIu9NVW3T5/F05GZJedK1foJNMKaO2AZl802f848vpJ+8rqU4sFZVgxhy3R7NxibPtbJ
         GTww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ToZNhl91;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t2-20020a0cb702000000b00681954c319asi3163943qvd.6.2024.01.19.03.37.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Jan 2024 03:37:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ToZNhl91;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rQn9V-0001KR-MV; Fri, 19 Jan 2024 06:35:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQn9U-0001KC-SO
 for qemu-arm@nongnu.org; Fri, 19 Jan 2024 06:35:12 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQn9S-0007Pc-QB
 for qemu-arm@nongnu.org; Fri, 19 Jan 2024 06:35:12 -0500
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-337d58942c9so659451f8f.0
 for <qemu-arm@nongnu.org>; Fri, 19 Jan 2024 03:35:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705664109; x=1706268909; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FiTFj1k6iws3Fa/IOpt1AOvFogP9Al8X3pBEue7+AFk=;
 b=ToZNhl91hD/r2AYQF2OvcKd/0mbNaIGfcHEQFyl5WmF3z+baPR6DDxJmGTnRVPzeu7
 kBmt5UsIeVMZ7ZZR/eHPUzkeZyrh/40kVo/v3uRssN5v76jb68UxXnMWyad1L6L5BjLP
 fERvnZYYRdf7yMW5YrO/P7Wg972aD2gcl/i59RMhjgUHwJjn11ITMb/YEX15oMkchVLz
 pqj59UtjZBMbxxJnzrkpFmvJYMIUUlB94DTUh61VkRtI2RKO59cx9gyW6qYHsTck4JwQ
 HiyHoA65HoYSD2v/0u3EFsZk+9bvXclgDkbcbv5kspjUPADyg3hCYsiKzTi8CDBAecw1
 bdSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705664109; x=1706268909;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FiTFj1k6iws3Fa/IOpt1AOvFogP9Al8X3pBEue7+AFk=;
 b=q08oGg9jOu4XZf0ffccnt55jije0I/Lw/23PLsYOf63F6tvX3tzN3NuXvI93zejFyd
 HThhr7KXaQcn4hrwFjIHt+A18O9eCSYsqY8Z7siDmlppY1f3yvWhbZgUzMcnsbZBxicC
 fwDY9eXYLTWC7B/+r+HWTWdmMC62Ae/BphpLfRscMOR8uWA2fzx+jRbo866mWOJS0l/F
 YgW0wtRf7K1mUHJiuv79hKFZPMfCO9v0jk85KyKclxkV3T3YkdDK2aZ65Ps2OT7vvzSN
 eI8PpCcODcGCnSFYYfVBf7e5ovKV0FuxzOakMChkORnEeHdUvaoWU/IdA/9QeOEaMnrT
 cQrg==
X-Gm-Message-State: AOJu0Yxiv1dqPpBa2qYocHfvESWmzg6dblkUfNgq2GroMlfow00RYmJL
 Lo7+N8jqvdbob8BLKb5Z6AICVTyDY23sY3Sv1GjnwU626o4divCt3TyMSN4rDzE=
X-Received: by 2002:a5d:64cf:0:b0:336:e369:cef with SMTP id
 f15-20020a5d64cf000000b00336e3690cefmr1860158wri.130.1705664109128; 
 Fri, 19 Jan 2024 03:35:09 -0800 (PST)
Received: from localhost.localdomain (91-163-26-170.subs.proxad.net.
 [91.163.26.170]) by smtp.gmail.com with ESMTPSA id
 h2-20020a5d5042000000b00337d941604bsm2070554wrt.98.2024.01.19.03.35.08
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 19 Jan 2024 03:35:08 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 00/36] HW core patches for 2024-01-19
Date: Fri, 19 Jan 2024 12:34:29 +0100
Message-ID: <20240119113507.31951-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, SUSPICIOUS_RECIPS=2.51,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: ix5RI0RRLbZW

The following changes since commit 88cf5fec91e50cd34bc002b633b4116228db0bc8:

  Merge tag 'pull-target-arm-20240118' of https://git.linaro.org/people/pmaydell/qemu-arm into staging (2024-01-18 12:48:17 +0000)

are available in the Git repository at:

  https://github.com/philmd/qemu.git tags/hw-cpus-20240119

for you to fetch changes up to 7ec5d7d91215815e885d2b38e62256e8fd8e2bce:

  configure: Add linux header compile support for LoongArch (2024-01-19 12:28:59 +0100)

----------------------------------------------------------------
HW core patch queue

. Deprecate unmaintained SH-4 models (Samuel)
. HPET: Convert DPRINTF calls to trace events (Daniel)
. Implement buffered block writes in Intel PFlash (Gerd)
. Ignore ELF loadable segments with zero size (Bin)
. ESP/NCR53C9x: PCI DMA fixes (Mark)
. PIIX: Simplify Xen PCI IRQ routing (Bernhard)
. Restrict CPU 'start-powered-off' property to sysemu (Phil)

. target/alpha: Only build sys_helper.c on system emulation (Phil)
. target/xtensa: Use generic instruction breakpoint API & add test (Max)
. Restrict icount to system emulation (Phil)
. Do not set CPUState TCG-specific flags in non-TCG accels (Phil)
. Cleanup TCG tb_invalidate API (Phil)
. Correct LoongArch/KVM include path (Bibo)
. Do not ignore throttle errors in crypto backends (Phil)

. MAINTAINERS updates (Raphael, Zhao)

Note the following checkpatch error is deliberately ignored:

  ERROR: space prohibited after that '&&' (ctx:ExW)
  #143: FILE: accel/tcg/watchpoint.c:119:
  +                && cc->tcg_ops->debug_check_watchpoint
                   ^
----------------------------------------------------------------

Bernhard Beschow (1):
  hw/i386/pc_piix: Make piix_intx_routing_notifier_xen() more device
    independent

Bibo Mao (1):
  configure: Add linux header compile support for LoongArch

Bin Meng (1):
  hw/elf_ops: Ignore loadable segments with zero size

Daniel Hoffman (1):
  hw/timer/hpet: Convert DPRINTF to trace events

Gerd Hoffmann (3):
  hw/pflash: refactor pflash_data_write()
  hw/pflash: use ldn_{be,le}_p and stn_{be,le}_p
  hw/pflash: implement update buffer for block writes

Mark Cave-Ayland (4):
  hw/scsi/esp-pci: use correct address register for PCI DMA transfers
  hw/scsi/esp-pci: generate PCI interrupt from separate ESP and PCI
    sources
  hw/scsi/esp-pci: synchronise setting of DMA_STAT_DONE with ESP
    completion interrupt
  hw/scsi/esp-pci: set DMA_STAT_BCMBLT when BLAST command issued

Max Filippov (2):
  target/xtensa: use generic instruction breakpoint infrastructure
  tests/tcg/xtensa: add icount/ibreak priority test

Philippe Mathieu-Daudé (19):
  backends/cryptodev: Do not ignore throttle/backends Errors
  accel: Do not set CPUState::tcg_cflags in non-TCG accels
  accel: Do not set CPUState::can_do_io in non-TCG accels
  accel/tcg: Remove unused tb_invalidate_phys_addr()
  accel/tcg: Remove tb_invalidate_phys_page() from system emulation
  target/alpha: Extract clk_helper.c from sys_helper.c
  target/alpha: Only build sys_helper.c on system emulation
  system/cpu-timers: Have icount_configure() return a boolean
  system/cpu-timers: Introduce ICountMode enumerator
  target/arm: Ensure icount is enabled when emulating INST_RETIRED
  util/async: Only call icount_notify_exit() if icount is enabled
  system/replay: Restrict icount to system emulation
  system/watchpoint: Move TCG specific code to accel/tcg/
  cpus: Restrict 'start-powered-off' property to system emulation
  accel: Rename accel_init_ops_interfaces() to include 'system'
  hw/core/cpu: Rename cpu_class_init() to include 'common'
  hw/s390x: Rename cpu_class_init() to include 'sclp'
  target/i386: Rename tcg_cpu_FOO() to include 'x86'
  target/riscv: Rename tcg_cpu_FOO() to include 'riscv'

Raphael Norwitz (1):
  MAINTAINERS: Update Raphael Norwitz email

Samuel Tardieu (2):
  target/sh4: Deprecate the shix machine
  hw/block: Deprecate the TC58128 block device

Zhao Liu (1):
  MAINTAINERS: Update hw/core/cpu.c entry

 MAINTAINERS                   |   5 +-
 docs/about/deprecated.rst     |   5 +
 configure                     |   1 +
 accel/accel-system.h          |   2 +-
 include/exec/exec-all.h       |   5 -
 include/exec/translate-all.h  |   1 -
 include/hw/elf_ops.h          |  71 +++++++-------
 include/sysemu/cpu-timers.h   |  32 +++++--
 include/sysemu/replay.h       |  11 ++-
 target/xtensa/cpu.h           |   4 +
 accel/accel-system.c          |   2 +-
 accel/accel-target.c          |   2 +-
 accel/dummy-cpus.c            |   1 -
 accel/hvf/hvf-accel-ops.c     |   1 -
 accel/kvm/kvm-accel-ops.c     |   1 -
 accel/tcg/icount-common.c     |  36 +++----
 accel/tcg/tb-maint.c          |  24 +----
 accel/tcg/watchpoint.c        | 143 ++++++++++++++++++++++++++++
 backends/cryptodev.c          |  10 ++
 cpu-target.c                  |  36 ++-----
 hw/block/pflash_cfi01.c       | 171 ++++++++++++++++++----------------
 hw/block/pflash_cfi02.c       |   2 +-
 hw/block/tc58128.c            |   1 +
 hw/core/cpu-common.c          |   4 +-
 hw/i386/pc_piix.c             |   9 +-
 hw/s390x/sclpcpu.c            |   4 +-
 hw/scsi/esp-pci.c             |  61 ++++++++----
 hw/sh4/shix.c                 |   1 +
 hw/timer/hpet.c               |  55 +++++------
 stubs/icount.c                |  27 +-----
 system/cpu-timers.c           |   2 +-
 system/vl.c                   |   3 +-
 system/watchpoint.c           | 124 ------------------------
 target/alpha/clk_helper.c     |  32 +++++++
 target/alpha/sys_helper.c     |  18 ----
 target/arm/cpu.c              |   2 +-
 target/arm/helper.c           |   5 +-
 target/i386/cpu.c             |   2 +-
 target/i386/tcg/tcg-cpu.c     |  32 +++----
 target/riscv/tcg/tcg-cpu.c    |  28 +++---
 target/xtensa/cpu.c           |   1 +
 target/xtensa/dbg_helper.c    |  46 +++++----
 target/xtensa/helper.c        |  12 +++
 target/xtensa/translate.c     |  17 ----
 util/async.c                  |  16 ++--
 accel/tcg/meson.build         |   1 +
 hw/block/trace-events         |   7 +-
 hw/timer/trace-events         |  15 +++
 target/alpha/meson.build      |   7 +-
 tests/tcg/xtensa/test_break.S |  25 ++++-
 50 files changed, 603 insertions(+), 520 deletions(-)
 create mode 100644 accel/tcg/watchpoint.c
 create mode 100644 target/alpha/clk_helper.c

-- 
2.41.0

