Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp25563njc;
        Wed, 13 Nov 2024 17:13:30 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX07NB0Jkl9KsFIfQUYcTIMMpdPLTVxdDqsJlhceF5txyVJ1bZOIuc6N97H/TMczKlUZ6MaT9gblCWj9w==@linaro.org
X-Received: by 2002:a05:600c:3514:b0:42f:4f6:f8f3 with SMTP id 5b1f17b1804b1-432b74fde60mr187571415e9.7.1731546810130;
        Wed, 13 Nov 2024 17:13:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731546810; cv=none;
        d=google.com; s=arc-20240605;
        b=b7rqHXmV1YbdXhy19WF8OW9pKsQauqAwss6Sds5fWg1gTmLP3oWrrk0/RYXd5ru/Gn
         m2JFdhAR3c1nPsYWKFxthKmASZ7o2WYkAgu6r1pZssvPHoPzQwL2SdxmMpcPeFUIpelX
         vNyh1RQfQHTAy0d6Kh9HQXsmDOBHpFdreEna6sXdqhOEktvYWRnfog/+ZwoR6RjBCioZ
         g+xgHKjTj0IkgDDwDPpTB718/OoEKaA5P/qxfInhUY7VvNgMxO2u0GKOwDQyd1pao9Qk
         0+ZCmP6KVtd8MYBZfhrQ/KSm9a82I22Sh/r96IRripc15LOjcPefFCLQNMRSCPEXyoTI
         8MpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=1EwqjnIRPctj4Nq1APqJi9S66/euonofsINQc3qIQuI=;
        fh=zd4Ivf9xndtNhofX8IDPNIWQ0Zi/rwWYHK/xTUmTOy0=;
        b=M7wOYvq5FZYNZgbdV8HYRoaOSPNwhx7Ylrr31E3QLff9NCXTSeurgmStgkKjeQDUHX
         kzaCr1jgKfRIIRwZRsGeHc7tcz2YnWfl14HvBoL1arT9j065X5M02SohOAwEtC48TzuN
         2nVdQfIXxBVRvUBlJ+QVhG7iXhArLO/H5PbxDkyJ1D2JSlig2kBpk9iPeSDYG2QqxfNh
         j3+nVKxPBX+KvYg65pSct9RD/w60VbqiQLnzvhqNy7jxyyIGdXhnpIzGcDa3A9/gdDqc
         SvbgIObIN1Sag+FOq4qwTPZUdMaPqOdYLV3ZXc/as6wjLfktPTApccJk0wDalsGG9UBE
         o0LA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BiPNzCo4;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-432b0b156c6sor59949605e9.3.2024.11.13.17.13.29
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 13 Nov 2024 17:13:30 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BiPNzCo4;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731546809; x=1732151609; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1EwqjnIRPctj4Nq1APqJi9S66/euonofsINQc3qIQuI=;
        b=BiPNzCo4wZ5c6UM3xTGjGuOflmVdLi2vM71t9ZEaxBIA6bWoM+/63K73ohfnlQpLSu
         YukNdpZhPrN68JvQGWWJ3cF4/V/6M7Dr3d+JPBUvAWrc1aKNwCeDQZLTQ/I3RPYk9CHo
         9nLAXZIMCZh7C/qgLGLnd0UpJo9S63Mzs6MA8hy73fyg4SnxcVEii5cHUnczaUUwUMf1
         yb/pRPkhuaqNESeORZdjMZHiNmqPv3F6PfgMRKY1qEbHx3tHVL/SVEY0ZH0sl2xnjtxW
         5QEI+hzsLeCddnlbyySo7gIvkc/6NdZgqcVBYz+R7amLrnxOYoEC8+Xho0p1EtGdFT6O
         pBFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731546809; x=1732151609;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1EwqjnIRPctj4Nq1APqJi9S66/euonofsINQc3qIQuI=;
        b=iap6Ik2l7cwb2t/0SkQccQ2fFqCdJEoBA9aNZZTHddISRRlh3iu2XTdPixhDU+t32E
         DAxzgGYof+SWOUTw719bbxZ+++NdqMjhIAe29AmTpuEdMnMvW2utcxkMGnCJL+MazJJv
         /sLZk2xIt83F5NSesaeXIuJYfntf53qfYebfXqxMoeFR43p7c9ZV/rj1yFiRVmI0wCEX
         c5mqNt6IvEXDC8/rjbOakfIcjmoE80uhA9hLOoorzlKWv+nRteaz7yyAl8n2AzH2V5M2
         MSnqtDWmkABCwsjebDUol4SplWoS3LjudHm1VrMyIk1hvuZQ/+TkTEqchOri1Pr9xwVq
         MQTw==
X-Forwarded-Encrypted: i=1; AJvYcCWX0bBH2FWyMngN9SR2ltUYZIQouiTRUG29ANvJh16v+NVTwqEW+J26NO7MIzRHMYeXTP+1ATtwY285lg==@linaro.org
X-Gm-Message-State: AOJu0YyePGJupN7+GEgysK8mNVacKydFBXENClml+hOAf9MWpmX5XvEU
	wOhSPWye3ohJiGmCMrSsGSKCeoeBShA6harGiFt+n2mvFHRYWhLTAuGiTyHlhrnRmA==
X-Google-Smtp-Source: AGHT+IGZ4mtQztDulS9O9dxe4sHklabKWPOdh+RwHBXIF1ImFkUSMTktTv3L7h4tm6Iw0lzhApxUAQ==
X-Received: by 2002:a05:6000:70d:b0:37d:3e6d:3c2f with SMTP id ffacd0b85a97d-381f1883bc1mr18783646f8f.47.1731546809627;
        Wed, 13 Nov 2024 17:13:29 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain ([176.187.209.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381eda13780sm19409085f8f.109.2024.11.13.17.13.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 13 Nov 2024 17:13:28 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Anton Johansson <anjo@rev.ng>,
	qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	qemu-arm@nongnu.org,
	Peter Xu <peterx@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	qemu-riscv@nongnu.org,
	David Hildenbrand <david@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-s390x@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 00/24] exec: Build up 'cputlb.h' and 'ram_addr.h' headers
Date: Thu, 14 Nov 2024 02:12:45 +0100
Message-ID: <20241114011310.3615-1-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: v/zEd2a6aL/6

Hi,

"exec/exec-all.h" and "exec/cpu-all.h" both contains a mess
of unrelated APIs. More importantly, they contain target
specific declarations, making any file including them to
become target specific, thus not buildable in common meson
sets.

This series first extract the CPU TLB API scattered in various
headers, then similarly strengthen the ram_addr_t API. Doing
so we figured extracting "user/guest-host.h" was necessary.

Before we have to include various missing headers to avoid
compilation breakage when refactoring.

The relevant part of the diff-stat is:

 include/exec/cpu-all.h        |  59 +-------------------
 include/exec/cpu-common.h     |  56 +------------------
 include/exec/cpu_ldst.h       |  73 +------------------------
 include/exec/exec-all.h       | 259 ------------------------------------------
 include/exec/ram_addr.h       | 56 ++-----------------
 include/sysemu/ram_addr.h     | 129 ++++++++++++++++++++++++++++++++++++++
 include/exec/cputlb.h         | 310 ++++++++++++++++++++++++++++++++++++++++++
 include/user/guest-host.h     |  87 +++++++++++++++++++++++++++++

Hoping it makes sense!

Please review,

Phil.

Philippe Mathieu-Daudé (24):
  exec/cpu-all: Include missing 'exec/cpu-defs.h' header
  exec/cpu-defs: Remove unnecessary headers
  exec/translation-block: Include missing 'exec/vaddr.h' header
  accel/tcg: Include missing 'exec/translation-block.h' header
  target/i386/helper: Include missing 'exec/translation-block.h' header
  target/rx/cpu: Include missing 'exec/translation-block.h' header
  system/watchpoint: Include missing 'exec/cpu-all.h' header
  linux-user/aarch64/mte: Include missing 'user/abitypes.h' header
  target/arm/mte: Restrict 'exec/ram_addr.h' to system emulation
  target/arm/cpu: Restrict cpu_untagged_addr() to user emulation
  exec: Introduce 'user/guest-host.h' header
  accel/tcg: Have tlb_vaddr_to_host() use vaddr type
  exec: Declare tlb_reset_dirty*() in 'exec/cputlb.h'
  exec: Declare tlb_init/destroy() in 'exec/cputlb.h'
  exec: Declare tlb_set_page_full() in 'exec/cputlb.h'
  exec: Declare tlb_set_page_with_attrs() in 'exec/cputlb.h'
  exec: Declare tlb_set_page() in 'exec/cputlb.h'
  exec: Declare tlb_flush*() in 'exec/cputlb.h'
  exec: Declare tlb_hit*() in 'exec/cputlb.h'
  exec: Declare tlb_vaddr_to_host() in 'exec/cputlb.h'
  exec: Extract CPU physical memory API to 'sysemu/physmem-target.h'
  exec/cpu-common: Move ram_addr_t related methods to 'exec/ram_addr.h'
  exec/memory: Move qemu_map_ram_ptr() declaration to 'exec/ram_addr.h'
  exec: Move 'ram_addr.h' header under sysemu/ namespace

 MAINTAINERS                                   |   3 +-
 include/exec/cpu-all.h                        |  59 +---
 include/exec/cpu-common.h                     |  56 +---
 include/exec/cpu-defs.h                       |   8 -
 include/exec/cpu_ldst.h                       |  73 +----
 include/exec/cputlb.h                         | 310 +++++++++++++++++-
 include/exec/exec-all.h                       | 259 ---------------
 include/exec/memory.h                         |   2 +-
 include/exec/translation-block.h              |   3 +-
 .../ram_addr.h => sysemu/physmem-target.h}    |  56 +---
 include/sysemu/ram_addr.h                     | 129 ++++++++
 include/user/guest-host.h                     |  87 +++++
 linux-user/aarch64/mte_user_helper.h          |   2 +
 target/arm/cpu.h                              |   5 +-
 accel/kvm/kvm-all.c                           |   3 +-
 accel/tcg/cpu-exec.c                          |   1 +
 accel/tcg/cputlb.c                            |  28 +-
 accel/tcg/tcg-accel-ops.c                     |   2 +
 accel/tcg/translate-all.c                     |   3 +-
 cpu-target.c                                  |   1 +
 hw/intc/armv7m_nvic.c                         |   2 +-
 hw/ppc/spapr.c                                |   3 +-
 hw/ppc/spapr_caps.c                           |   3 +-
 hw/ppc/spapr_nested.c                         |   1 +
 hw/ppc/spapr_pci.c                            |   3 +-
 hw/remote/memory.c                            |   3 +-
 hw/remote/proxy-memory-listener.c             |   3 +-
 hw/s390x/s390-stattrib-kvm.c                  |   3 +-
 hw/s390x/s390-stattrib.c                      |   3 +-
 hw/s390x/s390-virtio-ccw.c                    |   3 +-
 hw/sh4/sh7750.c                               |   1 +
 hw/vfio/common.c                              |   3 +-
 hw/vfio/container.c                           |   3 +-
 hw/vfio/iommufd.c                             |   3 +-
 hw/vfio/migration.c                           |   3 +-
 hw/vfio/spapr.c                               |   3 +-
 hw/virtio/virtio-mem.c                        |   3 +-
 migration/ram.c                               |   3 +-
 plugins/api.c                                 |   3 +-
 system/memory.c                               |   3 +-
 system/physmem.c                              |   4 +-
 system/watchpoint.c                           |   3 +-
 target/alpha/helper.c                         |   2 +-
 target/alpha/sys_helper.c                     |   2 +-
 target/arm/helper.c                           |   1 +
 target/arm/tcg/helper-a64.c                   |   1 +
 target/arm/tcg/mte_helper.c                   |   5 +-
 target/avr/helper.c                           |   2 +-
 target/hppa/mem_helper.c                      |   1 +
 target/i386/helper.c                          |   2 +
 target/i386/machine.c                         |   2 +-
 target/i386/tcg/fpu_helper.c                  |   2 +-
 target/i386/tcg/misc_helper.c                 |   2 +-
 target/i386/tcg/sysemu/excp_helper.c          |   2 +-
 target/i386/tcg/sysemu/misc_helper.c          |   2 +-
 target/i386/tcg/sysemu/svm_helper.c           |   2 +-
 target/loongarch/tcg/csr_helper.c             |   2 +-
 target/loongarch/tcg/tlb_helper.c             |   2 +-
 target/m68k/helper.c                          |   2 +-
 target/microblaze/helper.c                    |   2 +-
 target/microblaze/mmu.c                       |   2 +-
 target/mips/sysemu/cp0.c                      |   2 +-
 target/mips/tcg/sysemu/cp0_helper.c           |   2 +-
 target/mips/tcg/sysemu/tlb_helper.c           |   2 +-
 target/openrisc/mmu.c                         |   2 +-
 target/openrisc/sys_helper.c                  |   1 +
 target/ppc/helper_regs.c                      |   2 +-
 target/ppc/kvm.c                              |   3 +-
 target/ppc/mem_helper.c                       |   1 +
 target/ppc/misc_helper.c                      |   1 +
 target/ppc/mmu_helper.c                       |   1 +
 target/riscv/cpu_helper.c                     |   2 +-
 target/riscv/csr.c                            |   1 +
 target/riscv/op_helper.c                      |   1 +
 target/riscv/pmp.c                            |   2 +-
 target/rx/cpu.c                               |   3 +-
 target/s390x/gdbstub.c                        |   2 +-
 target/s390x/kvm/kvm.c                        |   3 +-
 target/s390x/sigp.c                           |   2 +-
 target/s390x/tcg/excp_helper.c                |   1 +
 target/s390x/tcg/mem_helper.c                 |   1 +
 target/s390x/tcg/misc_helper.c                |   1 +
 target/sh4/helper.c                           |   2 +-
 target/sparc/ldst_helper.c                    |   1 +
 target/sparc/mmu_helper.c                     |   2 +-
 target/tricore/helper.c                       |   2 +-
 target/xtensa/helper.c                        |   2 +-
 target/xtensa/mmu_helper.c                    |   1 +
 88 files changed, 670 insertions(+), 566 deletions(-)
 rename include/{exec/ram_addr.h => sysemu/physmem-target.h} (88%)
 create mode 100644 include/sysemu/ram_addr.h
 create mode 100644 include/user/guest-host.h

-- 
2.45.2
