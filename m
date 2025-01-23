Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp484938njk;
        Thu, 23 Jan 2025 15:44:17 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVKJwao4PsKkkFCrAjlm88GLMK1xhlWoBBoV0X/pOvyeZsY1ihLHvtnMmwasloRziAAh32g9pwiG2Fn4w==@linaro.org
X-Received: by 2002:a05:600c:1d14:b0:436:46f9:4fc6 with SMTP id 5b1f17b1804b1-438913d63cfmr256531455e9.8.1737675857724;
        Thu, 23 Jan 2025 15:44:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737675857; cv=none;
        d=google.com; s=arc-20240605;
        b=CEd6Yxzcs63CcLPxGrpWcf7d8xuFpuxyyS9G6lKaKIY0xN2P3cXDNbFxlTdHEJlkl+
         tA3gyxfC+Wk6/3SlTnkb19AFAu/Q2Hz4n+QkkWE1Lp73+VeqnYhjG7i5BQK97Q1eMVcA
         50/UqbHD6oXh8zj+O81uNUlqoYDDW4i1GMOWhueT9Exm81A+++sxuowUbSx+el7oJdIl
         Sb66epyE0LUezR4AmsjS87bIA0RIMoD+vG+Ne70jL3WPQsQActfIjRUiEaKD29Jdubp+
         7UbzmNKFjw/YPudbQwOpi/WFJdeVotXYV0+RJXABG218WXM2P8dFbMiaV8Kshs+BSzTs
         dXBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=SrJqTercMM7Oiv7TI6NgScSjNQ/Q43/m4EWNljCwQJg=;
        fh=DHFKAsyf5io0wrO7pwGQ0pZb3rj5or7NDjEkGmkt6YI=;
        b=bVxj00301QFE6spLGFiE6ieFLVmEXZo2xP2rHtHDudkjAu18nbAdqkZVgFSFGf9LtD
         7xdNrMZfGbCG4x0tmvIed2g3kv2fChzOhyjuxiRO8b1TtrBufceFIL1sD+TaxGNovpJf
         mzJA6kEzBgux2ht3XP/mYsVJQsrUQ1IdtZG2LxDFw5t2gdCoLh+3ZKOd63N2OBdNeijM
         hzC7nClMfWw9PjdmDNaDWlcGAaMww4V0N5lAD5D7tt4ob5Fl0W5Bj5iDyWdlTzhCz6yE
         78auQbAt9esvQ22rsnn0ASF0KCMu5huQ2hTtk9w0QdJq1CEUaYhAUFYPO4WRBdXfAqrn
         oBrg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BAanAu+z;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-438bd4b768fsor1952875e9.1.2025.01.23.15.44.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 23 Jan 2025 15:44:17 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BAanAu+z;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737675857; x=1738280657; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SrJqTercMM7Oiv7TI6NgScSjNQ/Q43/m4EWNljCwQJg=;
        b=BAanAu+z2KDxLfGKeNb3KUTDVTFAU5oUhUj7JAV7nfxpNCE3Klhzb4iFYC7ljsbmjd
         YfxjLb4lZgPpi6NVHbbHIamjEiE5SBHUZHbvvdp1BuX2KS1tVmS00MQHwi9suvd22XmL
         LAjRxqgkFHuMs0M8tSF37ybrvO3lNdB4DixkQM0Dsh3tA7ODUGzZAOJovI9lGGTlXj8Y
         TQcZeTh8MRoTlGAfQXKWmf1G6liCX7TaKt37rpPsdIb3V37bB0cDuHjbWHh6AaOdfFNv
         5xH7OrELRr8xlcUx0/VHt97D9qTMLsmJmBVms5K4dJnhINDVxs33vPyiaaBYoWt82uza
         w6Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737675857; x=1738280657;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SrJqTercMM7Oiv7TI6NgScSjNQ/Q43/m4EWNljCwQJg=;
        b=V/bTR/kZxRaJxY4+PljxqVyg88eVpAywB8EQ06iUMz/NyVvRI9m4d5bzgSrHDQk3V5
         Jovyr+tYXEsDjd0fdqJLBOP5C+wClbfw6x/QsBL1pviaF/rAr3KD+pYCpJCiS9amhHuy
         WeeBdgkMZ5CGRMlTEl516evQ0YaQ9rIcTTcJUnEHvLeWjbjrl4gO+Kvmb/YV+u0mfmdO
         D8irG82pw8BYW0OZLUrTUz4J1eVmxNJEHkVHrxeHi33tCmFYCTHRSZj0RVnCs+hoqbYB
         AwtoN27OCn8yy82AWjfO+Lo6jEO+wOID9fTpopPlYclXhBWN03AOHnN7O+uZI9YkF1ik
         BRXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzKiDGyEWy0ZlSSfaX48DKfBhbXFpu5HfSgQg/92oHyjSo/DUudKxlb5QytEhUgqKrRmcAUWx1MqxZ8g==@linaro.org
X-Gm-Message-State: AOJu0YzX/Bs+vgNGlmhziEId+XoKN0B7h+nPN4HINOby8uKjhODw41bG
	oYtNx6jK4e07ebgqav2QPOO3QzlTMRiiOdE44UP0u1NNkQWmHFrNl9SnsWxnt8g1/g==
X-Gm-Gg: ASbGncte3nYikg/4IHavJFFsC1fwDXy306kOGXdhpzc0+kwnkW83Njxn/GGLFFHAKwo
	UKVuwoSFtbd0emc3HZ39oGqpYWIXmtM/ltAqICVaWiCXQQCgScqX9H4QjAbZBOTy4B5IO5Vpct/
	Xbz4nbqTpcVSfxJhVbYnTGKTfDtB5L4Zv9PFK9yX4rxrWgCPwDck+FlnJ55EKsMA7dybhhOfZCE
	6b3N3r8QZp0qCE20alyOeZ6nhbDh8c1zoBpyTR/qCSmm/vWvrATG4vvZNG7V4P9lxkn58P5Dy4Y
	OpKhuF/zB7XFZnQqX978m+RT4pw+N5qxfCaR861ITEuWV8ERa9UHdzrf5YUnIrGFzA==
X-Google-Smtp-Source: AGHT+IGBiB8E0eTSoI28+V9cp1gWnvQIF0NcnM5MrTMqS5rNZ7M1PFDJt5j8Or2lR2bn/A8RFfyqaQ==
X-Received: by 2002:a05:600c:a09:b0:435:9ed3:5688 with SMTP id 5b1f17b1804b1-438913f86dcmr267594425e9.18.1737675857123;
        Thu, 23 Jan 2025 15:44:17 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd54c098sm6544235e9.31.2025.01.23.15.44.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 23 Jan 2025 15:44:16 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	kvm@vger.kernel.org,
	qemu-ppc@nongnu.org,
	qemu-riscv@nongnu.org,
	David Hildenbrand <david@redhat.com>,
	qemu-s390x@nongnu.org,
	xen-devel@lists.xenproject.org,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 00/20] accel: Simplify cpu-target.c (omnibus)
Date: Fri, 24 Jan 2025 00:43:54 +0100
Message-ID: <20250123234415.59850-1-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: PAcjerHsYWw0

Yet another cleanup series before respining the "extract TCG
fields from CPUState" series. Before that, we try to clarify
a bit the code around CPU creation. Target specific code is
reduced further. Some intermixed User/System is separated,
making maintenance simpler IMHO. Since my local branch is
quite big, I tried to group here all the generic patches.

Regards,

Phil.

Based-on: <20250123215609.30432-1-philmd@linaro.org>
  "target/ppc: Move TCG code from excp_helper.c to tcg-excp_helper.c"

Philippe Mathieu-Daudé (20):
  qemu/compiler: Absorb 'clang-tsa.h'
  user: Extract common MMAP API to 'user/mmap.h'
  gdbstub: Check for TCG before calling tb_flush()
  cpus: Cache CPUClass early in instance_init() handler
  cpus: Keep default fields initialization in cpu_common_initfn()
  accel/kvm: Remove unused 'system/cpus.h' header in kvm-cpus.h
  accel/tcg: Build tcg_flags helpers as common code
  accel/tcg: Restrict tlb_init() / destroy() to TCG
  accel/tcg: Restrict 'icount_align_option' global to TCG
  accel/tcg: Rename 'hw/core/tcg-cpu-ops.h' -> 'accel/tcg/cpu-ops.h'
  accel: Rename 'hw/core/accel-cpu.h' -> 'accel/accel-cpu-target.h'
  accel/accel-cpu-target.h: Include missing 'cpu.h' header
  accel: Forward-declare AccelOpsClass in 'qemu/typedefs.h'
  accel/tcg: Move cpu_memory_rw_debug() user implementation to
    user-exec.c
  cpus: Fix style in cpu-target.c
  cpus: Restrict cpu_common_post_load() code to TCG
  cpus: Have cpu_class_init_props() per user / system emulation
  cpus: Have cpu_exec_initfn() per user / system emulation
  cpus: Register VMState per user / system emulation
  cpus: Build cpu_exec_[un]realizefn() methods once

 MAINTAINERS                                   |   4 +-
 accel/kvm/kvm-cpus.h                          |   2 -
 accel/tcg/internal-common.h                   |  13 +
 bsd-user/qemu.h                               |  13 +-
 .../accel-cpu.h => accel/accel-cpu-target.h}  |   7 +-
 .../tcg-cpu-ops.h => accel/tcg/cpu-ops.h}     |   0
 include/block/block_int-common.h              |   1 -
 include/block/graph-lock.h                    |   2 -
 include/exec/exec-all.h                       |  16 -
 include/exec/page-protection.h                |   2 -
 include/hw/core/cpu.h                         |   2 +
 include/qemu/clang-tsa.h                      | 114 -------
 include/qemu/compiler.h                       |  87 +++++
 include/qemu/thread.h                         |   1 -
 include/qemu/typedefs.h                       |   1 +
 include/system/accel-ops.h                    |   1 -
 include/system/cpus.h                         |   4 -
 include/user/mmap.h                           |  32 ++
 linux-user/user-mmap.h                        |  19 +-
 accel/accel-system.c                          |   1 +
 accel/accel-target.c                          |   2 +-
 accel/hvf/hvf-accel-ops.c                     |   1 +
 accel/kvm/kvm-accel-ops.c                     |   1 +
 accel/qtest/qtest.c                           |   1 +
 accel/stubs/tcg-stub.c                        |   4 -
 accel/tcg/cpu-exec-common.c                   |  34 +-
 accel/tcg/cpu-exec.c                          |  37 +--
 accel/tcg/cputlb.c                            |   2 +-
 accel/tcg/icount-common.c                     |   2 +
 accel/tcg/monitor.c                           |   1 -
 accel/tcg/tcg-accel-ops.c                     |   1 +
 accel/tcg/translate-all.c                     |   3 +-
 accel/tcg/user-exec-stub.c                    |  11 +
 accel/tcg/user-exec.c                         |  94 +++++-
 accel/tcg/watchpoint.c                        |   2 +-
 accel/xen/xen-all.c                           |   1 +
 block/create.c                                |   1 -
 bsd-user/signal.c                             |   2 +-
 cpu-common.c                                  |   1 -
 cpu-target.c                                  | 314 +-----------------
 gdbstub/system.c                              |   6 +-
 hw/core/cpu-common.c                          |  31 ++
 hw/core/cpu-system.c                          | 170 ++++++++++
 hw/core/cpu-user.c                            |  44 +++
 hw/mips/jazz.c                                |   2 +-
 linux-user/signal.c                           |   2 +-
 system/cpus.c                                 |   1 +
 system/globals.c                              |   1 -
 system/physmem.c                              |   2 +-
 target/alpha/cpu.c                            |   2 +-
 target/arm/cpu.c                              |   2 +-
 target/arm/tcg/cpu-v7m.c                      |   2 +-
 target/arm/tcg/cpu32.c                        |   2 +-
 target/arm/tcg/mte_helper.c                   |   2 +-
 target/arm/tcg/sve_helper.c                   |   2 +-
 target/avr/cpu.c                              |   2 +-
 target/avr/helper.c                           |   2 +-
 target/hexagon/cpu.c                          |   2 +-
 target/hppa/cpu.c                             |   2 +-
 target/i386/hvf/hvf-cpu.c                     |   2 +-
 target/i386/kvm/kvm-cpu.c                     |   2 +-
 target/i386/nvmm/nvmm-accel-ops.c             |   1 +
 target/i386/tcg/tcg-cpu.c                     |   4 +-
 target/i386/whpx/whpx-accel-ops.c             |   1 +
 target/loongarch/cpu.c                        |   2 +-
 target/m68k/cpu.c                             |   2 +-
 target/microblaze/cpu.c                       |   2 +-
 target/mips/cpu.c                             |   2 +-
 target/openrisc/cpu.c                         |   2 +-
 target/ppc/cpu_init.c                         |   2 +-
 target/ppc/kvm.c                              |   2 +-
 target/riscv/kvm/kvm-cpu.c                    |   2 +-
 target/riscv/tcg/tcg-cpu.c                    |   4 +-
 target/rx/cpu.c                               |   2 +-
 target/s390x/cpu.c                            |   2 +-
 target/s390x/tcg/mem_helper.c                 |   2 +-
 target/sh4/cpu.c                              |   2 +-
 target/sparc/cpu.c                            |   2 +-
 target/tricore/cpu.c                          |   2 +-
 target/xtensa/cpu.c                           |   2 +-
 tests/unit/test-bdrv-drain.c                  |   1 -
 tests/unit/test-block-iothread.c              |   1 -
 util/qemu-thread-posix.c                      |   1 -
 hw/core/meson.build                           |   5 +-
 84 files changed, 590 insertions(+), 578 deletions(-)
 rename include/{hw/core/accel-cpu.h => accel/accel-cpu-target.h} (92%)
 rename include/{hw/core/tcg-cpu-ops.h => accel/tcg/cpu-ops.h} (100%)
 delete mode 100644 include/qemu/clang-tsa.h
 create mode 100644 include/user/mmap.h
 create mode 100644 hw/core/cpu-user.c

-- 
2.47.1
