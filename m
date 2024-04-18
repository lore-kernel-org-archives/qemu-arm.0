Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp1952091ejd;
        Thu, 18 Apr 2024 12:25:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXNDgKL8vr0SMF3KEiSUs14vGRx2FVk1E1JZkfcP0oP9+rH1NmiIq62xwv+uTMAG/5S69kme/U/3DTharSkRwxzo2SjY69X
X-Received: by 2002:a05:6402:35c5:b0:571:bc64:f8bf with SMTP id z5-20020a05640235c500b00571bc64f8bfmr2699726edc.14.1713468329353;
        Thu, 18 Apr 2024 12:25:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713468329; cv=none;
        d=google.com; s=arc-20160816;
        b=ftzPtHqs5d76Vhb4xEzKymcXoX+NzQ3W+8ELL+9dkoouRDoemT2IsD6EGHTfR6jPLw
         NRpFnuOeLTCNpAdBrsZrmc9D5NPhfXE2+K7M4meWgf28wPHF5eedQ/KAKONIzCqWp0qK
         DWna1kdl0oOIjXiPMc6kk7x5FRFKDBWUUT7hzcm0Gj8H5VEIz+dHeRFz0w9krjyqRzMY
         Rg1dRVPAI14pXi1oSDybwvJmOB5yG5QzbkGyaVFnjRHmacVZniRklgH+SggAdMtwaPMn
         fvJXoAYE7AuhXs7plLM/pjKbaZuL+uVgpxwti9XzfVtmFiNO6oVn8SvWBQGb5/3Rf4Ub
         moWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=UatYjw6LkKqMQcEs0xLI/ll8in5w62RsbSuNUqaD+hU=;
        fh=NvieTHu3K02VN3cT8xlPkDqPjwY7UDY/RCL1nwFtsJ0=;
        b=tO+9Nt3wFBcpsG5wCmH14l0VaSe8+bJrur2nSm0vhf7/8goD+cenJcmQyuR2t9XtOs
         j1HEAHWnKfcHlNWQjhUlDkkCdDVj28GkFcILa+WnseXsXn8nTheT2m4loKhVu6gHlVL6
         V/mJzoVnTkqA8W+idkjFe7UVLh2+uivVJVN9z+tPf8ceUmzwGEEnR2YpNUHq2X1Man2b
         74YrZKD362X5ledny2BNwzf9DZQB3oH6t0D1RToLtyvl3PkJhwwwn6c1FKNJdjQk1jmJ
         pMlo9cnN3cK1SFD0ebwu2g6rSVZLJFhLOKsdO+Ya8Ctj0R4Z5xIko9jkzsNTclrwMao9
         mZuw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eS7RE077;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 22-20020a508e16000000b0056e0a927af0sor1134452edw.3.2024.04.18.12.25.29
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 18 Apr 2024 12:25:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eS7RE077;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713468329; x=1714073129; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UatYjw6LkKqMQcEs0xLI/ll8in5w62RsbSuNUqaD+hU=;
        b=eS7RE077jEoIo9nwxAwxYvpj+Yr8+jIrSCK+FaQELynScZDtAuZV488T8U96pHE0Xj
         fp1F0XV9ob5QHNOKwC9QLgCfDoQCRGq2DGfLlbZmPMlwMVfJgACx+GiQFSzNt9218BTP
         qs0DAaQlKhyaPFMwIelFv8psf/K5rzJmTDk5Dr9D52O/c2dJlpQSt+E0Etk3vRYsihiO
         A1rHyOMhykx+5yqjc8iHIANcK0hOc1D/bjG0vGKzwq0u4ArBmTOxr4RkKqpd46Bb8/PA
         E3gBWP/TKbriwMdRd/mS9zWbGkj6KZqrIwDGCMGW+O41lOFU10ZmuqptZbev39pAl3wV
         yDEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713468329; x=1714073129;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UatYjw6LkKqMQcEs0xLI/ll8in5w62RsbSuNUqaD+hU=;
        b=sIs6vrV7TjaT3ByKQ/wAF1uh60QQz8JCJ71iutJHSCSwroH1/FB3wzAS5uFGUmQqgS
         N48ze3AcFhT7LkUBMhzC/KvEtXANhIEYhfN/xJMXOhPoPny4v0nDHpgN4fzotf+YrKHe
         QAsk+IvenWFn3aO1ql2cbIrY5I0AWBmExG04l0aBw2vfkhbJJARFzRAk27ICMg1idRH8
         c0fGxKxP0YmEZEGzlR4yZe08MHmAzuSCLieflc2ejyzvmiswGeXVVymVFWYH1xbLutTK
         HSNXdLSvVB/Cp7NSS078AswzjrzrTI5vdvDuuVgc+V9M/gb+4kDMjPum4nrakoiKX9ye
         ZztQ==
X-Forwarded-Encrypted: i=1; AJvYcCXq0jyhS2QLgi+KgsKAfOOIqB/mrkJmEcgmjlg/hQKaMhh7GG2in2bMIx9rhC84YWJd7IfkEUnTG5Vfb6yk98FYY8YuIHXU
X-Gm-Message-State: AOJu0YxvseF/Kg7GhEbD5mylR20RUbPdlOcwBrQCR910RGaniYYLIyzw
	2SmUVSDCEUqK/Ax6xhjpLKpBY2bo33Y4zeXJ/+gvjCNyEfJ8vU9Y6EEcpk+IfgS9dA==
X-Google-Smtp-Source: AGHT+IG6mbo7Ujao5nYsEjpEqJP1F0wz9b6JL8jKjwrBHCw0/6R9oQcHVTB20tlAD3rgevO7qdU+6w==
X-Received: by 2002:a05:6402:35c5:b0:571:bc64:f8bf with SMTP id z5-20020a05640235c500b00571bc64f8bfmr2699703edc.14.1713468328813;
        Thu, 18 Apr 2024 12:25:28 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.151.213])
        by smtp.gmail.com with ESMTPSA id b10-20020aa7dc0a000000b0056fe755f1e6sm1202106edu.91.2024.04.18.12.25.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 18 Apr 2024 12:25:28 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-riscv@nongnu.org,
	David Hildenbrand <david@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Anton Johansson <anjo@rev.ng>,
	Philippe =?unknown-8bit?q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 00/24] include/exec: Rework (part 2)
Date: Thu, 18 Apr 2024 21:24:59 +0200
Message-ID: <20240418192525.97451-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: XWiHJ0s1zhsL

Reordering exec/, second round. Mostly splitting:
- TCG LDST API (to "exec/cpu_ldst.h")
- CPU TLB APIs (to "exec/cputlb.h")
from "exec/cpu-all.h" and "exec/exec-all.h", and
reducing inclusions of "hw/core/cpu.h".

Based-on: <20240417182806.69446-1-philmd@linaro.org>
or https://gitlab.com/philmd/qemu/-/commits/exec-next

Philippe Mathieu-Daudé (24):
  exec: Declare MMUAccessType type in 'mmu-access-type.h' header
  exec: Declare CPUBreakpoint/CPUWatchpoint type in 'breakpoint.h'
    header
  hw/core: Avoid including the full 'hw/core/cpu.h' in 'tcg-cpu-ops.h'
  exec: Restrict TCG specific declarations of 'cputlb.h'
  exec: Restrict 'cpu_ldst.h' to TCG accelerator
  exec: Have guest_addr_valid() methods take abi_ptr/size_t arguments
  exec: Un-inline tlb_vaddr_to_host() and declare it in 'exec/cputlb.h'
  physmem: Move TCG CPU IOTLB methods around
  physmem: Restrict TCG CPU IOTLB code to TCG accel
  exec: Reduce tlb_set_dirty() declaration scope
  exec: Move tlb_reset_dirty*() declarations to 'exec/cputlb.h'
  exec: Move CPUTLBEntry helpers to cputlb.c
  target/sparc: Replace abi_ulong by uint32_t for TARGET_ABI32
  exec: Rename 'exec/user/guest-base.h' as 'user/guest-base.h'
  exec: Restrict inclusion of 'user/guest-base.h'
  exec: Move GUEST_ADDR_MAX definition to 'cpu_ldst.h'
  exec: Include missing 'qemu/log-for-trace.h' header in 'exec/log.h'
  plugins: Include missing 'qemu/bitmap.h' header
  gdbstub: Avoid including 'cpu.h' in 'gdbstub/helpers.h'
  hw/xtensa: Include missing 'exec/cpu-common.h' in 'bootparam.h'
  plugins: Un-inline qemu_plugin_disable_mem_helpers()
  exec: Remove 'exec/tswap.h' from 'exec/cpu-all.h'
  exec: Remove 'disas/disas.h' from 'exec/log.h'
  exec: Remove unnecessary inclusions of 'hw/core/cpu.h'

 hw/xtensa/bootparam.h            |   3 +
 include/exec/breakpoint.h        |  23 ++++++
 include/exec/cpu-all.h           |  39 +---------
 include/exec/cpu-defs.h          |   1 -
 include/exec/cpu_ldst.h          | 122 ++++++++++---------------------
 include/exec/cputlb.h            |  58 ++++++++++++++-
 include/exec/exec-all.h          |  26 +------
 include/exec/log.h               |   2 +-
 include/exec/mmu-access-type.h   |  18 +++++
 include/exec/ram_addr.h          |   1 +
 include/exec/user/guest-base.h   |  12 ---
 include/gdbstub/helpers.h        |   3 +-
 include/hw/boards.h              |   1 -
 include/hw/core/cpu.h            |  24 +-----
 include/hw/core/tcg-cpu-ops.h    |   6 +-
 include/hw/ppc/openpic.h         |   1 -
 include/qemu/plugin.h            |   7 +-
 include/sysemu/hw_accel.h        |   1 -
 include/user/guest-base.h        |  18 +++++
 target/arm/internals.h           |   1 +
 target/ppc/internal.h            |   1 +
 target/riscv/debug.h             |   2 +
 accel/stubs/tcg-stub.c           |   4 -
 accel/tcg/cpu-exec.c             |   1 -
 accel/tcg/cputlb.c               |  53 +++++++++++++-
 accel/tcg/translator.c           |   1 +
 accel/tcg/user-exec.c            |   7 ++
 bsd-user/main.c                  |   1 +
 hw/arm/boot.c                    |   1 +
 hw/arm/npcm7xx.c                 |   1 +
 hw/mips/fuloong2e.c              |   1 +
 hw/mips/malta.c                  |   1 +
 hw/ppc/sam460ex.c                |   1 +
 hw/ppc/spapr.c                   |   1 +
 hw/ppc/virtex_ml507.c            |   1 +
 hw/sh4/r2d.c                     |   1 +
 linux-user/elfload.c             |   1 +
 linux-user/main.c                |   1 +
 plugins/core.c                   |   5 ++
 system/physmem.c                 |  58 ++++++++-------
 target/arm/gdbstub.c             |   1 +
 target/arm/tcg/helper-a64.c      |   1 +
 target/avr/gdbstub.c             |   1 +
 target/avr/translate.c           |   1 +
 target/hexagon/translate.c       |   1 +
 target/loongarch/tcg/translate.c |   1 +
 target/riscv/vector_helper.c     |   1 +
 target/rx/translate.c            |   1 +
 target/sparc/gdbstub.c           |   2 +-
 target/sparc/mmu_helper.c        |   1 +
 target/tricore/gdbstub.c         |   1 +
 target/xtensa/xtensa-semi.c      |   1 +
 tcg/tcg.c                        |   3 +-
 53 files changed, 300 insertions(+), 226 deletions(-)
 create mode 100644 include/exec/breakpoint.h
 create mode 100644 include/exec/mmu-access-type.h
 delete mode 100644 include/exec/user/guest-base.h
 create mode 100644 include/user/guest-base.h

-- 
2.41.0
