Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp94219njb;
        Wed, 7 May 2025 16:42:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVfRATEyDgkedZAbUSut8dZb2pnPYOW8t/okQguZCZVJbcR18jC4Wnz5KfjMNcCu/dWt4Q8GuOGzIAOOw==@linaro.org
X-Received: by 2002:a17:903:244c:b0:22e:17ee:aa69 with SMTP id d9443c01a7336-22e5ee1d428mr75240115ad.50.1746661364113;
        Wed, 07 May 2025 16:42:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746661364; cv=none;
        d=google.com; s=arc-20240605;
        b=Wp9Wu6v1ekO0gJ4HhXkeqPTmGSYohGXJG9SxPnFQJc2p3NPXPfb0G+dJKiDtNvoRBk
         m4buVDPim8B/WyaGbwMtwmkuruDGCMi+WDcyf/buT7ygcZhri5UySuCfxqRPM5BVVmKJ
         Z5qzWtQ/zSzMtlgKym50+Q/E/Gfx7ZG11IOdEZnHj8Q1RZkpk4r7VClbGcDRRYW8SpfJ
         Zbwy+2Ppvz8lV/8Oer8KW/YXzQARpHbbIUhN2dgfU0LFDSVm5NSsO4/MMXUjfcDuhoqB
         sgcY8WAjgznpmHax+jN2Ue61DDf+A3F0Bt9jNuijKfKvlx97pNNp54djwb7cxKTrU05v
         ffKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=JehyW8M8VpKFuaI6YYMmr2hRWJI92AYFHrbysHYIqEM=;
        fh=FNzj98S4YaNVpJWO2uBq2oOqY+uuOl/Y5yLanghqWWQ=;
        b=ZPMTPi6RIwA+Baag0yi/hG7eI5nJ9e2CDaFfYwftbaxEPFSK4m/YLC9i0DGe5X7tDM
         sg07RODkjg+nNKiQnc1xHLpKzeoG4pIRvSbzgtKXl19oawDkFIyPZEAJxvtOExoWTWAb
         b8zWsXc4zM5zl5D4FYu3KjsNyb60ANv9+X+w1lsrsYE+DmBkmG1QUSpxW10Dns3X7NfV
         6uDI1f+5vFvj21307ChxzsCWIDdEMERns6K6oyLsXlXiwD887IYgG2/2chMkSms7Ecai
         8S0S9pHh1Ohm5CvylOUtd9oyiYTjhyF/SuteYdY8FBZNlEbAz8jmvIvH76FNYrxITb+y
         L9Nw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=K6VGyiKl;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0bc7f9fesor82396495ad.14.2025.05.07.16.42.43
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 07 May 2025 16:42:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=K6VGyiKl;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746661363; x=1747266163; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JehyW8M8VpKFuaI6YYMmr2hRWJI92AYFHrbysHYIqEM=;
        b=K6VGyiKldIO+LH/ShDNHohUlzXGvzZIiYbMLRZlG9h7Tvwp3KovMXp/jZ4UE+abULL
         PF7kzTRc5p/9v9npV8oNNNOVnn6Z8/eb52vBuHDm/P90x6ZO6cL6iYcyM1G6Qd7/+Fo1
         ijWuaw67y/lsDwkXq5y8a4Q4mwGCrL//dJVqiJKs94j6aFiN1AUu0LoJunPMRc2QkDul
         2wdeaXlQl65naIUq2V6IjI0zsRu49uZh6/9ajCN0/lG5f8r8x44kL7IO6zTjKdXn2069
         cI/F3UAx9Ic/0y9qByfbJlEBvujR+0S2yXg5Grg+gZlmPHDZDIWTq7cfY5udxi4B78Iz
         eo2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746661363; x=1747266163;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JehyW8M8VpKFuaI6YYMmr2hRWJI92AYFHrbysHYIqEM=;
        b=WARqQuB6k/rUA5PIdP1skh8U9z9QrPvAbbGoi66NVmuA4HZVwd2+ZPNZNIJtUqFYPO
         UTLl8etl1yKqJ7ctvyQ6oVggAUSCbUe7guOCKqal6QmQoylq+LyuvlfLobMst2I4HYml
         oBiUkhcWUR6ImJotZsyGijlWPiu1FptZy4JD+uq3jPCDc1QoZvyZ3wYVjeYmZzM90/WY
         oW0qZDSq9nCoe4cMmJhOv/sECIRq+4Duyyd9+KF8IPzMIH+h8h9DYbOvAMYMiXLSt8h9
         KnH2f7td0SBRLArURG2gFQ6m+8rHeDFsUZyH5kaqf90wwhPr7k0nTsh5Vn7IkT7tWnzZ
         8Png==
X-Forwarded-Encrypted: i=1; AJvYcCVUhwsU93h23uvXLadB9k1aKMrRDatVOcIIuo2+/wrJCdaJcxZY8MPqYLf2w1o4UiqJCOaAx7k0pipW/Q==@linaro.org
X-Gm-Message-State: AOJu0YychUhSANtHj+6Scw1VMn4/fN8gFm6qbu2tnm2XNCXCMD7nvARj
	S+vHS8d/FSUwAkfwNET2X4sOmmxGAOCbFhAMUHEqTbZCS60h1aLR492BksAfMbg5U1sef5I6LGV
	IyLF226ol
X-Gm-Gg: ASbGnctEtjSIxPEuZfwsSzBwdZH6C1k/na6Gpy4SNuPPFMBv8NIMOk4pygGioMDvgIi
	h7CN97U7/HGGQXZH80CW6lmUekcwfi1Tu2rzP84r+BCzbJg3d8QMm/g4E8wbiinBumBcuRr55m+
	zDxfGxO8dpHMw2mUlMXhkv2uspbOKHAjaxPyu85jMifVYYeJGPyEWaJFcIjBgDc4lLV8JznkK3y
	SHe/5EPbE08FXC5oO2WQBlN9XcqI2+4SFOVbGklxeXCjxg7xzctuOBOACx0fDfTcAqJvzobKBPQ
	8EAHB/uHpJr9URnukmVyFI/F8R0rePsbZph5pWSm
X-Google-Smtp-Source: AGHT+IEb8/jS6XFLZwBXKGo2JRaGqzWwUaCf2+23h6WBJFHtJioR8urxC77q0Op0VwdLUAEl1smgUg==
X-Received: by 2002:a17:903:166e:b0:224:c47:cbd with SMTP id d9443c01a7336-22e5e98947fmr80611175ad.0.1746661363604;
        Wed, 07 May 2025 16:42:43 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e815806fdsm6491325ad.17.2025.05.07.16.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 16:42:43 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	anjo@rev.ng,
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	alex.bennee@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v7 00/49] single-binary: compile target/arm twice
Date: Wed,  7 May 2025 16:41:51 -0700
Message-ID: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: PXm1m60sXTgp

More work toward single-binary.

Some files have external dependencies for the single-binary:
- target/arm/gdbstub.c: gdbhelpers
- target/arm/arm-qmp-cmds.c: qapi
- target/arm/tcg/translate*: need deep cleanup in include/tcg
- target/arm/tcg/cpu*: need TargetInfo implemented for arm/aarch64
- target/arm/tcg/*-helper*: need deeper split between aarch64 and arm code
They will not be ported in this series.

Built on {linux, windows, macos} x {x86_64, aarch64}
Fully tested on linux x {x86_64, aarch64}

Series is now tested and fully reviewed. Thanks for pulling it.

v7
--

- rebase on top of master
- removed patch to apply target config for picking files in libsystem/libuser,
  since it was the only one not reviewed.

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

Pierrick Bouvier (48):
  include/system/hvf: missing vaddr include
  meson: add common libs for target and target_system
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

 meson.build                    |   78 ++-
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
 target/arm/helper.c            |   24 +-
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
 36 files changed, 1534 insertions(+), 1386 deletions(-)
 create mode 100644 target/arm/tcg/helper.h
 create mode 100644 accel/hvf/hvf-stub.c
 create mode 100644 target/arm/cpu32-stubs.c

-- 
2.47.2
