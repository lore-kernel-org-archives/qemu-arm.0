Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp42507njb;
        Mon, 12 May 2025 11:05:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUcp6uAPHDIczoKI8M266AeuCraAXZ2b0LOJuAgzLsKQpMdM/OuEY9XRIyRGLbZuO3r6TgOVOs6vbQmCw==@linaro.org
X-Received: by 2002:a17:902:ec89:b0:224:ab0:9b00 with SMTP id d9443c01a7336-22fc8b5fa14mr186960945ad.27.1747073112408;
        Mon, 12 May 2025 11:05:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747073112; cv=none;
        d=google.com; s=arc-20240605;
        b=G1Bd7F69LvjZ4qE3rSx1rNa6j8M1RdAFW0IoKhQCng+b/WtkxhLoJJ/588UgQXn62u
         /cDcgRj2PXqgWXaLfFeUr/Pf8M/DaI5xdzU9NZ4ygqBHtEYyb7kHsHvPu8TNtkh0GJd7
         veC0NgEgqnFkncyIpEaXlcOIW1AqVmu3I7G+Plts56VlAZLFgPlGab7WNvsmSG5edZ9l
         q1OC0BQk7+ARCVqyOdW939hvKxXwexVdO2jJmw/0YV5dTg10PIFdSwC5J0hS9r/vJRDN
         MD1vDOstKZE7+iJxXG6R34XY4x/zuTTFdfsIW50VnJ2rXe+Nca4GmHJB/s2Sg4BNTL0p
         weeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=4MW56a2N9JGW8XiFvlXolamnMWHQl+hL453c6R1PReI=;
        fh=K/vDRUDBbYB7kcc6sDoOgCtFT/RHCehkY96d8usZxZE=;
        b=Nxb2MAW8h3kKGRV4BegkhOYBtaPNV8ZE7CDPBIo57dIL+2I4kXF47fsqI5gLZpgjmz
         iEvWmnyoeYKyFpzrHeJrW+iTISmVNwdO9ue338bJyEO4rnU2Z2s10sN3h6zBhxmKKE7K
         FEk6Omy0y2V5bvmTciUv9vGiCQFWW+A19GGyIgxHam863+M5Ve/9FOOEUjM/OrM/eO/N
         1Ni/Po/uHATF9u5h+msCKsbSi7n56hPp9hoXaIP9s7inplQoGTNNKf0eiV+zmbvfyAk0
         u648VM/r6KR3u+T5FfgrJBa09dmx6wFXrrfRGisla9Nlgbd5VvPMrl3UI9CZd8DDLI6g
         LLMA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YcWAnYOP;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22fc6a03675sor49648595ad.11.2025.05.12.11.05.12
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 12 May 2025 11:05:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YcWAnYOP;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747073112; x=1747677912; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4MW56a2N9JGW8XiFvlXolamnMWHQl+hL453c6R1PReI=;
        b=YcWAnYOP6GN3PW5hxojD6Hb2XpHJwvLgqyFjR7S60DPvKl/7+goxByAqlIOhma4NpI
         JtluIqqt11nE9abnFBMBYiWTtSLZdH/mF0xXuWpU+yiuG4NDRDkLSejcvx3M5SPZanQW
         fagZgM3gxpudgjqs67+bSZzaixdlQErvu3ZOjUUV5czJkj+PKlDo/5WG9zvbTcHwKBcw
         3+6pHWxnskN+BkY25Hq9Xd/8i7Qu3IzvE+c8xrGOSfpgU9lplWXBqhvwjaP4KzIMrMTr
         VXr9CoUPxR9NkwKhjTx9xaIZEC9DkCApZHuaPKY/mleg9V+ClPLU69Gyh+nL5g/32zMM
         3M6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747073112; x=1747677912;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4MW56a2N9JGW8XiFvlXolamnMWHQl+hL453c6R1PReI=;
        b=Mo6McIVfi3/sAiH/VApEpvW49IigCP77KacS9od7KU+FP7mN+LRRjDKTDavDNf4CXC
         Lo/iw9fbf/Al5XnJT5I1Zo7fiAED1KmfYiHRhS+fta109aIjT4ZzpGBcGEfgS10a8eji
         mV5Y9Z1DK7eFftAWY6AwItowF+nWDA7+d2+5bOr1yEv+hB7/DWA+HK3GcNy0wTD7mQnc
         VTF9yytiKNu9vIhnxolghHPgk4a/Y4YP9v0FAvOa02F+8cBpZnOql+L8Cx9OQ1AG9miB
         ORHygIs4LOaqMemTY3E6JnrXfhaYoPj5lnCRbD+gQrqA2iIjG2GNeZuaDiw8oIUM3aJ7
         c54A==
X-Forwarded-Encrypted: i=1; AJvYcCXF8azGJuNiEXiSvg3j3U4Rsz3oaYhrNx8pVFIb4Ne/O47RZieZt0u+JyMpsiN/9ZxYpH8ybPaXWFHDtA==@linaro.org
X-Gm-Message-State: AOJu0YxLb0ZVra6h3M2d+nYsJDPltY1Yf6z+C6hKoKkymRoi7vC/t/3X
	5KNqDm6nCf3dbBtx/OLjEwZ3wgY7qCIRmiUa5LV40qhrLQa++18GmUWRHjW0gN+aCA==
X-Gm-Gg: ASbGncsfoG67kLK1S00hwYd4iERo+C8AgNcr6djg3NYZzUYPKCbXCcNoNZlMRi39L5s
	SLdH+Zvz/6L5IrrS4fhrCJDHUx77NZ4fp6RcVwHV6UrU71k+GPqR0aAD0w00BDK/ObdF1QlFWAw
	nG1IlE+rhrsTOp1FzmpOqftzs/sh1YGnTISQ4J3Qnqti4Wvn3fpaMpqmthy4XFnTSvQDSY4+Ask
	Ni0l9YvTtCkUFoeSIbH+cuQSt/zpqn2UXBjNm/+eHngIp//iYxcS+jVi4Qv/F23ZLb0ou54P1NK
	ji0MY/eJUVHaR7wggfkuF9IyO9EaKw039DNw2C4L2KiY/n2abwo=
X-Google-Smtp-Source: AGHT+IHn+seSlUHxe/d++qBkY4dNL7LDRkrQjITqXqKQ+r5hF6/emBo0ZXMFZkXSOu8uzP134zkiFQ==
X-Received: by 2002:a17:902:f68f:b0:223:66a1:4503 with SMTP id d9443c01a7336-22fc8b73d0emr172327945ad.30.1747073111863;
        Mon, 12 May 2025 11:05:11 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc82a2e4fsm65792005ad.232.2025.05.12.11.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 11:05:11 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	kvm@vger.kernel.org,
	alex.bennee@linaro.org,
	anjo@rev.ng,
	qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v8 00/48] single-binary: compile target/arm twice
Date: Mon, 12 May 2025 11:04:14 -0700
Message-ID: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: 0/pnE3DqHkJO

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

v8
--

- rebase on top of master

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

Pierrick Bouvier (47):
  include/system/hvf: missing vaddr include
  meson: add common libs for target and target_system
  target/arm: move kvm stubs and remove CONFIG_KVM from kvm_arm.h
  target/arm/kvm-stub: add kvm_arm_reset_vcpu stub
  target/arm/cpu: move arm_cpu_kvm_set_irq to kvm.c
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
 include/system/hvf.h           |    1 +
 include/tcg/tcg-op-common.h    |    1 +
 include/tcg/tcg.h              |   14 +
 target/arm/helper.h            | 1152 +------------------------------
 target/arm/internals.h         |    6 +-
 target/arm/kvm_arm.h           |   87 +--
 target/arm/tcg/helper.h        | 1153 ++++++++++++++++++++++++++++++++
 target/arm/tcg/vec_internal.h  |    2 +
 include/exec/helper-head.h.inc |   11 +
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
 target/arm/meson.build         |   41 +-
 target/arm/tcg/meson.build     |   29 +-
 34 files changed, 1519 insertions(+), 1381 deletions(-)
 create mode 100644 target/arm/tcg/helper.h
 create mode 100644 target/arm/cpu32-stubs.c

-- 
2.47.2
