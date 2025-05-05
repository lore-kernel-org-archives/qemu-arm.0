Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2778117njj;
        Mon, 5 May 2025 16:20:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXH1+L6nLEI3hnspYiRsG94uJnhC1zYVwJnFaSANTy2SbiiYTkbKFRLCyBuEMFA1/QePhCUVmHQl+h4lA==@linaro.org
X-Received: by 2002:a17:90b:5684:b0:30a:2173:9f0b with SMTP id 98e67ed59e1d1-30a7c0c8bfcmr1737083a91.28.1746487221207;
        Mon, 05 May 2025 16:20:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746487221; cv=none;
        d=google.com; s=arc-20240605;
        b=Onbnvgb2884lR4t6rUWZMRX+y5y6eTHVJduX2yjEMI4RfIf1a0us/+9KQieIbrFNfZ
         a+Q4QgbqZjEhE2uK92TEv8mkrL1zeSY6/pRaINUf3jZB7NPzSLOPm1FC4RyX5Q3V9ZXb
         p8NxaN7tIbOgp/VjAG+9XzdhQ4J0PYfdVhJiDKm7u1lpl8GhVMD4Tw+oxuECdcSiRcNt
         5HEq0ytxVp1dMAWsjeDg1/y2AD/3a/LAshoWibpV8pIu10vTOXhuBR46sJP9ZA+xDzLA
         L8BZ5jQAheZiHRkWhXVsiAHGE+dd0h0Ko52QQuc9hMb/HhD9RmhfSR0Kd1g2CUdN8rx3
         sAAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=04Ix3M4tuJXhEIQ9AeSHf28aqJlTNZ3AOq6Hx3kur6A=;
        fh=T9SE+GW6633cIi7Y8C3ruqn26o45SRPQdwRZzXuEDdc=;
        b=OOKm1mZ7h0W0TPcNsKMX8skCAD4gUWZIO+mhJnDpNq1WCU+iWSNWRem+KK8huEjdDM
         a9HtUcnnc6HpRjobSL5u6pTlVb0phQBOD79H2Hy2qJafV/J27XuTSE+CM6HeGJ9ACTnN
         non22GxiXnU/TenDTlWBJCNWxFXOSTWpIqTAUZeb48NVeMahn8mNrOsxfqLOjP5Z8AyZ
         6GCzHz3dwQsfdzpWaO8GxnlHEiv/LFZlhFEMzTvgzyIIeOgDPiZPoyQEdf7nKE+ZEGs8
         4uZ5HqRx4iylJP9pDZjCnjJ+Mf+QW0MJL0JwfRPNitT4CvvZIem3J3zxOoUGpwvDuEeI
         flzg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Na/G4UJx";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0bb28f90sor83591355ad.6.2025.05.05.16.20.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 May 2025 16:20:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Na/G4UJx";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746487221; x=1747092021; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=04Ix3M4tuJXhEIQ9AeSHf28aqJlTNZ3AOq6Hx3kur6A=;
        b=Na/G4UJx17Gf12yFtWl2hyC/lMWENZqn5HiQonbBbVAVrhqOGiRFpieUF6mp268ZxM
         wuNqV4+rRGvNd7romoZLzFIdH3ihdAmAiNEbVq//iMOJmlHtdDLpwbs0ClZ3VtaGPs7d
         Q9/Fo0VZN80wkjyYiMMzMV7pDzzxAcYcsjGlWfcfB9KpxYKF4b6mGDsKCsowDPKMguql
         lzEsSfjLuHIVB4py9ZI//sl+fT3q8WxvRr9dmUkr8hPVGNXy7sgSJ4S/ytS9eew6NNwt
         R/pK0WzzQ0nX+7w0E3Fnf16EGk2+ewSpHXqv+rISv0TAn9t/zxK+n6z+ePvsXqO1h6UX
         C7zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746487221; x=1747092021;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=04Ix3M4tuJXhEIQ9AeSHf28aqJlTNZ3AOq6Hx3kur6A=;
        b=fWKnCkOvWnZSsTl7vtMs3pneS8MMgC8g7wtiyn8VRHDrX0/YZb0EELJ/nvICfLoGJx
         WaSGufzoIX0qc8fB/hG8+f4hZc/sVblw5i+IkK8+Gv3Fv69mVDb0rJFl8lo79yCxlHLL
         U7hj5I46GIarmReI38ZVApvBhcJHB5sQzUd6equNCT5e6qA3etHP46HIhQaPaOWW7b+W
         TBMQqNY5Z+QVLw0X5KetdvM471ncJhTKBVvhpd+dM3uH40FNJoiMZddoxX2eaJm/UJKf
         POVPgXz1uwT4Eifcv8MFDkcxtN2C9lcKRFQKZUoCXdLqn9EszUZ9QVs6Uw38gFj0Aic4
         ONDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVn9Ji/cF+coiLtHKRFNDt1DBiePpUC7DUSlibr5TPa0T1UQFVvlS0mk+DNREF1vZe+YmaJXS7JOQUgWA==@linaro.org
X-Gm-Message-State: AOJu0YyAZ65WMLjcNretEa07NjN9hqz6x7e6oXMClBt97ZgxVpdVmNva
	Vzy0crR+wiSdnsPF8oCvfpvintfcTEJed+z4HPrjxzYKzczcIl0cdQuu1hYri8VjdYa9JkzSU+4
	AUP3y+A==
X-Gm-Gg: ASbGncvSMT1Fjhw/000lryDMUdlpsfzqklxMHuQbkI2tXVLbpbHjj2kFxdPzh0z7WCi
	SbWWOu3MPfJkp9SXjTozl7Z20yVNXWYsPPbYyHIwp//WexN3B1FjrRSx/puJY9CxKpFoH3vzpsz
	LuZIYtGCcBHoXlaJyBTmb5w336N0J5chfDkOBYClmurNDhYu/GtE6taHMwQiBgIstxXQ5QJ//mP
	v+MuGeOv2J3Xj1Dzq1P7wM4DG6F4vc/ThC0JEGc0tDvIqg2QsgcbYP9crMWxD0KUxHbyV9E+9eq
	7XkQW3pZf4H+VjKSYdUo6Cu0KK90R936crUDrXxQ
X-Google-Smtp-Source: AGHT+IHfCgAA4+D90CVu2oz49y29SXm3HfgqMa52LdxN54WvvmDw5NiqsMm2gDuMWZrsbaNGyWXGVA==
X-Received: by 2002:a17:903:41cb:b0:220:e1e6:4472 with SMTP id d9443c01a7336-22e328cf92emr16217105ad.13.1746487220678;
        Mon, 05 May 2025 16:20:20 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1522917asm60981715ad.201.2025.05.05.16.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 16:20:20 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	anjo@rev.ng,
	Peter Maydell <peter.maydell@linaro.org>,
	alex.bennee@linaro.org,
	kvm@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v6 00/50] single-binary: compile target/arm twice
Date: Mon,  5 May 2025 16:19:25 -0700
Message-ID: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: /yS6tQ1MJRWV

More work toward single-binary.

Some files have external dependencies for the single-binary:
- target/arm/gdbstub.c: gdbhelpers
- target/arm/arm-qmp-cmds.c: qapi
- target/arm/tcg/translate*: need deep cleanup in include/tcg
- target/arm/tcg/cpu*: need TargetInfo implemented for arm/aarch64
- target/arm/tcg/*-helper*: need deeper split between aarch64 and arm code
They will not be ported in this series.

Built on {linux, windows, macos} x {x86_64, aarch64}
Fully tested on linux-x86_64

v6
--

CI: https://github.com/pbo-linaro/qemu/actions/runs/14844742069/job/41675865456
- Replace target_ulong -> vaddr for HWBreakpoint (Philippe)
- build target/arm/tcg/crypto_helper.c once (Richard)
- build target/arm/tcg/tlb-insns for system only (Richard)
- build target/arm/tcg/arith_helper once (Richard)

v5
--

CI: https://github.com/pbo-linaro/qemu/actions/runs/14825451208/job/41617949501
- Do not define a separate vaddr type in tcg, simply alias to i32/i64 (Richard)
- target/arm/tcg/crypto_helper.c
- target/arm/tcg/hflags.c
- target/arm/tcg/iwmmxt_helper.c
- target/arm/tcg/neon_helper.c
- target/arm/tcg/tlb_helper.c
- target/arm/tcg/tlb-insns.c
- target/arm/tcg/arith_helper.c
- target/arm/tcg/vfp_helper.c

v4
--

CI: https://github.com/pbo-linaro/qemu/actions/runs/14816460393/job/41597560792
- add patch to apply target config for picking files in libsystem/libuser
  Useful for Philippe series for semihosting:
  https://lore.kernel.org/qemu-devel/20250502220524.81548-1-philmd@linaro.org/T/#me750bbaeeba4d16791121fe98b44202afaec4068
- update some patches description (Philippe & Richard)
- tcg: introduce vaddr type (Richard)
- modify concerned helpers to use vaddr instead of i64 (Richard)
- use int64_t instead of uint64_t for top_bits in ptw.c (Philippe)
- arm_casq_ptw: use CONFIG_ATOMIC64 instead of TARGET_AARCH64 and comment why
  (Richard)
- target/arm/machine.c

v3
--

CI: https://github.com/pbo-linaro/qemu/actions/runs/14765763846/job/41456754153
- Add missing license for new files (Richard)
- target/arm/debug_helper.c
- target/arm/helper.c
- target/arm/vfp_fpscr.c
- target/arm/arch_dump.c
- target/arm/arm-powerctl.c
- target/arm/cortex-regs.c
- target/arm/ptw.c
- target/arm/kvm-stub.c

v2
--

- Remove duplication of kvm struct and constant (Alex)
- Use target_big_endian() (Anton)

v1
--

- target/arm/cpu.c

Philippe Mathieu-Daudé (1):
  target/arm: Replace target_ulong -> vaddr for HWBreakpoint

Pierrick Bouvier (49):
  include/system/hvf: missing vaddr include
  meson: add common libs for target and target_system
  meson: apply target config for picking files from libsystem and
    libuser
  target/arm: move kvm stubs and remove CONFIG_KVM from kvm_arm.h
  target/arm/kvm-stub: add kvm_arm_reset_vcpu stub
  target/arm/cpu: move arm_cpu_kvm_set_irq to kvm.c
  accel/hvf: add hvf_enabled() for common code
  target/arm/cpu: remove TARGET_BIG_ENDIAN dependency
  target/arm/cpu: remove TARGET_AARCH64 around aarch64_cpu_dump_state
    common
  target/arm/cpu: remove TARGET_AARCH64 in arm_cpu_finalize_features
  target/arm/cpu: compile file twice (user, system) only
  target/arm/cpu32-stubs.c: compile file twice (user, system)
  tcg: add vaddr type for helpers
  target/arm/helper: use vaddr instead of target_ulong for
    exception_pc_alignment
  target/arm/helper: use vaddr instead of target_ulong for probe_access
  target/arm/helper: extract common helpers
  target/arm/debug_helper: only include common helpers
  target/arm/debug_helper: remove target_ulong
  target/arm/debug_helper: compile file twice (user, system)
  target/arm/helper: restrict include to common helpers
  target/arm/helper: replace target_ulong by vaddr
  target/arm/helper: expose aarch64 cpu registration
  target/arm/helper: remove remaining TARGET_AARCH64
  target/arm/helper: compile file twice (user, system)
  target/arm/vfp_fpscr: compile file twice (user, system)
  target/arm/arch_dump: remove TARGET_AARCH64 conditionals
  target/arm/arch_dump: compile file once (system)
  target/arm/arm-powerctl: compile file once (system)
  target/arm/cortex-regs: compile file once (system)
  target/arm/ptw: replace target_ulong with int64_t
  target/arm/ptw: replace TARGET_AARCH64 by CONFIG_ATOMIC64 from
    arm_casq_ptw
  target/arm/ptw: compile file once (system)
  target/arm/meson: accelerator files are not needed in user mode
  target/arm/kvm-stub: compile file once (system)
  target/arm/machine: reduce migration include to avoid target specific
    definitions
  target/arm/machine: remove TARGET_AARCH64 from migration state
  target/arm/machine: move cpu_post_load kvm bits to
    kvm_arm_cpu_post_load function
  target/arm/kvm-stub: add missing stubs
  target/arm/machine: compile file once (system)
  target/arm/tcg/vec_internal: use forward declaration for CPUARMState
  target/arm/tcg/crypto_helper: compile file once
  target/arm/tcg/hflags: compile file twice (system, user)
  target/arm/tcg/iwmmxt_helper: compile file twice (system, user)
  target/arm/tcg/neon_helper: compile file twice (system, user)
  target/arm/tcg/tlb_helper: compile file twice (system, user)
  target/arm/helper: restrict define_tlb_insn_regs to system target
  target/arm/tcg/tlb-insns: compile file once (system)
  target/arm/tcg/arith_helper: compile file once
  target/arm/tcg/vfp_helper: compile file twice (system, user)

 meson.build                    |  104 ++-
 include/system/hvf.h           |   15 +-
 include/tcg/tcg-op-common.h    |    1 +
 include/tcg/tcg.h              |   14 +
 target/arm/helper.h            | 1152 +------------------------------
 target/arm/internals.h         |    6 +-
 target/arm/kvm_arm.h           |   87 +--
 target/arm/tcg/helper.h        | 1153 ++++++++++++++++++++++++++++++++
 target/arm/tcg/vec_internal.h  |    2 +
 include/exec/helper-head.h.inc |   11 +
 accel/hvf/hvf-stub.c           |    5 +
 target/arm/arch_dump.c         |    6 -
 target/arm/cpu.c               |   47 +-
 target/arm/cpu32-stubs.c       |   26 +
 target/arm/debug_helper.c      |    6 +-
 target/arm/helper.c            |   23 +-
 target/arm/hyp_gdbstub.c       |    6 +-
 target/arm/kvm-stub.c          |   97 +++
 target/arm/kvm.c               |   42 +-
 target/arm/machine.c           |   15 +-
 target/arm/ptw.c               |    6 +-
 target/arm/tcg/arith_helper.c  |    5 +-
 target/arm/tcg/crypto_helper.c |    6 +-
 target/arm/tcg/hflags.c        |    4 +-
 target/arm/tcg/iwmmxt_helper.c |    4 +-
 target/arm/tcg/neon_helper.c   |    4 +-
 target/arm/tcg/op_helper.c     |    2 +-
 target/arm/tcg/tlb-insns.c     |    7 -
 target/arm/tcg/tlb_helper.c    |    5 +-
 target/arm/tcg/translate-a64.c |    2 +-
 target/arm/tcg/translate.c     |    2 +-
 target/arm/tcg/vfp_helper.c    |    4 +-
 tcg/tcg.c                      |    5 +
 accel/hvf/meson.build          |    1 +
 target/arm/meson.build         |   41 +-
 target/arm/tcg/meson.build     |   29 +-
 36 files changed, 1547 insertions(+), 1398 deletions(-)
 create mode 100644 target/arm/tcg/helper.h
 create mode 100644 accel/hvf/hvf-stub.c
 create mode 100644 target/arm/cpu32-stubs.c

-- 
2.47.2
