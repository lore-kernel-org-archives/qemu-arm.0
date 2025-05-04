Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp1756059njj;
        Sat, 3 May 2025 22:29:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVqevPvCs+J9HkkShr++4W45l/3tfLq9amXZ7V+CWusvMWRhIhVVpYDKxIqZ7Ld5ja1V2iGy9ZijZygiQ==@linaro.org
X-Received: by 2002:a17:902:ef43:b0:221:7eae:163b with SMTP id d9443c01a7336-22e1037ecb5mr130698005ad.46.1746336561074;
        Sat, 03 May 2025 22:29:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746336561; cv=none;
        d=google.com; s=arc-20240605;
        b=HMhpcX3mEeyZfwUxw4DYwZY6DZahChR6buqnVUMKNyzDNYfCNR+vVujlwsExr6jZi7
         xjgBDNLc09rmdeFCs4ioSlKDGJ5t6RZIQku7OTaXxlxKzipZFFtJukoqO/JTWwhvOzzb
         7zyLS40AhAgyXnNM1VGBTnONzTPoOpmK8zojPUev5vxvCL5D3NBIFeyknF2X0x2drNCc
         Pnjmo+DOi3LRfs3OZrAOKqUIx73a7CdbytS3Zc0paYUj0i3PeMe/MqCqdFGvGMVF7ZmI
         EyjGonKnqKiKVZoZz3mii3+rIzLFMNzfYeH0O3WMCEeI044X9M7WU4uAeUVGlwo9Tzt7
         JLYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=irSEhIVJB8mOBUgNyh7cPK4XpLIapKVpALnmORMTl0E=;
        fh=utcU5z1C9CDLfUFaKfbi/re3klW8b0vRxpapTOLkytw=;
        b=kLAQPyoXiRSi5nn9kHgkdyHppsv6tD4sbt1/vfMXH7EPs4OqycNKV125DKT2nyXYzI
         OF8D+vqmzCkMb0PN05pv9dkW+T8jm+Mejmj+hqPRqczsUySEwlDYk6Ln3R0QD6QJO1bv
         XkChSEiMHfpGrdFxBZIBYMRWJ5cWZJObXCDXuwcp04dfZyiiYO5+Yrvr+AbSMQX/8WI2
         IXNo6gouo+tEQgDALAupPaJkC8/yu9BDOinpqAAicheAkICLnjWW1zxLnHWBKkGupQSW
         HK1a55D3X5huVineeMHZIl+s9Hz7WOROSC83iuzkq8eX/Aqrp+ej6gfLv0cU9zY9A/QV
         qKEw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=adfO0Hah;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0be7ade0sor41756525ad.16.2025.05.03.22.29.20
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 03 May 2025 22:29:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=adfO0Hah;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746336560; x=1746941360; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=irSEhIVJB8mOBUgNyh7cPK4XpLIapKVpALnmORMTl0E=;
        b=adfO0HahItwrYBV+QsqsM1q3qfnswpF4twUUjCYUeGsar7JqRSaTVoO4rN/TaaxMHD
         PCCdgb4kqcUQS0N45qirpQUMmhE86/wa6ayy6Du/nHNOwe0VJZl8UGAh3Hh8f57Idjnp
         q2XU1cd2tAlILHSY/9fSgFRK1nkb1qRiy04jFVlOQKBxfHcOsqslXIbn+UChVvXjCd15
         bptqmF9ZN5tEdzG895goBEpQnap5UUPevwiuUyAAmJ8d+/23t+RbRIsaY1RJcwZVX+K+
         DHugXUBskMTZT4/gGimOKCpwogY1ct2Pa8WQsZ6EFJ3DJ6SOhaoZxIBdS9SsUWAeSI4S
         KWUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746336560; x=1746941360;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=irSEhIVJB8mOBUgNyh7cPK4XpLIapKVpALnmORMTl0E=;
        b=SpVTeHcbOeDEl6epOIH6oO8dk6gm75vhAmjrp+yPDDO61Wh+CzEG+N2McNM6HJG8Qt
         HrtR4JOkJ+gTt+lmyUMs3aK9oS9X315/1syl5T2S7SLpD5vfnye5TzfySdULdKIen6Ei
         LTTYcgx1Lq/SeKDG50YNOOKM6lWRBMhv7mMiI38RG5KCABSbc3U3ra7I6V21RMWcVQRi
         e02VHqLpVA3W5smyFO5T3+DQX43ClgnztfryjSUioWfGOqpN4UPIAQLbFuEzcANoiaem
         LCvnVWQETsa29CvmWAhiAlQwBRe893lZBFAiWYTr1mL8QbG90nm2bj522Nedkpc7ujLL
         83gA==
X-Forwarded-Encrypted: i=1; AJvYcCWny3/S0CDfJE6+pCPUQJhK+jt3zH3G6ZYCBkbkZF+DXvMB09cMFXNvWrRZ9jc3MvKVTs3AQVrUny2/UA==@linaro.org
X-Gm-Message-State: AOJu0YygbUoUVgQjZM4ggwrJtllUFgffo3pgezrRmNwJDuLxNKUISVgV
	FRQo0jZ6+N2JY/T1gEXeYeJFYw/B69XIcHh8PSyQqa+tYPqGyID6JHOpNUEcnj4W1Q==
X-Gm-Gg: ASbGncsx4nUJ+pynsr3lsxe9exUUpsyHeTt4DmzTADilY36TJrz1WLCrGvRJ7lyrOFH
	1HxIi7nMll4zBagynn6DtUx7s5wtdzdrltSnG2NfOoZfPnLCAhPXrDEdMLyFMwKbLW3Sae+1jOg
	mHFxgQ0fSLGoCB/QiiIkhVKT4hTEuAhA477ubi0laKU9oWs4AFItBu4ggtLMAGSXwkahpSnxFet
	DDuTk2HXWsByDs0W+JZ3MEh8yqm/0Oor1TBuV7c+o4RTXriVuIVAyPA/Ao0ZV5oCmm5r8neQspn
	UNbSK1+CjdYj4YFzKlIfAVSlUMa841IHZ6HmCMKO
X-Google-Smtp-Source: AGHT+IFTj45voNnhxORlgg/0h6D+fYSNfPoo0K7iespbQCHfkUHz4mUcGMgWDjbFTX/fPSN9MeBCEQ==
X-Received: by 2002:a17:903:1aa3:b0:224:76f:9e4a with SMTP id d9443c01a7336-22e102d01ebmr143378185ad.14.1746336560539;
        Sat, 03 May 2025 22:29:20 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-740590207e3sm4400511b3a.94.2025.05.03.22.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 22:29:20 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	anjo@rev.ng,
	kvm@vger.kernel.org,
	richard.henderson@linaro.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	alex.bennee@linaro.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 00/40] single-binary: compile target/arm twice
Date: Sat,  3 May 2025 22:28:34 -0700
Message-ID: <20250504052914.3525365-1-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: yew4qcvdR2gA

More work toward single-binary.

Some files have external dependencies for the single-binary:
- target/arm/gdbstub.c: gdbhelpers
- target/arm/arm-qmp-cmds.c: qapi
They will not be ported in this series.

Built on {linux, windows, macos} x {x86_64, aarch64}
Fully tested on linux-x86_64

v1
--

- target/arm/cpu.c

v2
--

- Remove duplication of kvm struct and constant (Alex)
- Use target_big_endian() (Anton)

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

Philippe Mathieu-Daudé (1):
  target/arm: Replace target_ulong -> uint64_t for HWBreakpoint

Pierrick Bouvier (39):
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

 meson.build                    |  104 ++-
 include/system/hvf.h           |   15 +-
 include/tcg/tcg-op-common.h    |    1 +
 include/tcg/tcg.h              |   17 +
 target/arm/helper.h            | 1152 +------------------------------
 target/arm/internals.h         |    6 +-
 target/arm/kvm_arm.h           |   87 +--
 target/arm/tcg/helper.h        | 1153 ++++++++++++++++++++++++++++++++
 include/exec/helper-head.h.inc |   11 +
 accel/hvf/hvf-stub.c           |    5 +
 target/arm/arch_dump.c         |    6 -
 target/arm/cpu.c               |   47 +-
 target/arm/cpu32-stubs.c       |   26 +
 target/arm/debug_helper.c      |    6 +-
 target/arm/helper.c            |   21 +-
 target/arm/hyp_gdbstub.c       |    6 +-
 target/arm/kvm-stub.c          |   97 +++
 target/arm/kvm.c               |   42 +-
 target/arm/machine.c           |   15 +-
 target/arm/ptw.c               |    6 +-
 target/arm/tcg/op_helper.c     |    2 +-
 target/arm/tcg/tlb_helper.c    |    2 +-
 target/arm/tcg/translate-a64.c |    4 +-
 target/arm/tcg/translate.c     |    2 +-
 tcg/tcg.c                      |    6 +
 accel/hvf/meson.build          |    1 +
 target/arm/meson.build         |   41 +-
 27 files changed, 1506 insertions(+), 1375 deletions(-)
 create mode 100644 target/arm/tcg/helper.h
 create mode 100644 accel/hvf/hvf-stub.c
 create mode 100644 target/arm/cpu32-stubs.c

-- 
2.47.2
