Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2178684njj;
        Sun, 4 May 2025 18:52:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUI3JQ1QZs+5GY/GdGUKzxigibDQGdAPpcrr+Eb45Pbbd5wB0c1UqnUGlDPptP3hNZdUqpPs2C+M8nsZQ==@linaro.org
X-Received: by 2002:a05:6a00:e8c:b0:736:48d1:57f7 with SMTP id d2e1a72fcca58-7406f09d0a5mr7399548b3a.7.1746409947497;
        Sun, 04 May 2025 18:52:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746409947; cv=none;
        d=google.com; s=arc-20240605;
        b=by/epW7GaCEMlnQ4udOkfZ8ZSPrecmOwM8jUVssrK7wgcdzdx7SegE2RgkhTYxMYyb
         az1ktUQ/LM8Or5a425NeDO07xUEwMjxv9ck27mCw+G5PRIYG3rYfjS9A16zp+9q1SVtQ
         I37cj84MIb6vUVODc+ViYCuBZp9Fvu9RrfPX8sbgWOMtRI3DekEutRneD+fXWz56/GIe
         XUdSvntfqPjfQ6UGDI9BDp/zqUvWq/a0EywonsPMMqyaPoV3BTSkXuEDXhQfrXAefrhE
         G1eW/Crp31d4JphieblmO5MXxaSMNQ4X+bopwVvTxp37EJjP4VWH11P4Y9HHieWUjDeS
         e08Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=ahgA2NICchATUWyUqONsVh9cLKvE33L09maAByMkPyk=;
        fh=Kgi0fUBOrjF4pId9VK834sXCakJlHzoiMpWt7BY+6nk=;
        b=ICJ4Erb4ZO+CKwW+FDsbqVQxISpfhZWlcwC7a0mCOGFnaEF/obPPd2T2E3R3WwYKKx
         2ZFAFp79+2yviROn9YqYaVTUIyAfqBJgYiGJ9g4U7XijClnqtM+7Zdtl+Zia+Jk7+YQy
         PWQfkLqjd0x8pUOEklBoq4qhHQ0mNzC7Qj0L6l9ogCjJwjJ4gpFmQuxUNtHMuWckhDfp
         dEMf9WjIhgfIb29BulbKn+1wQYDFs0jHrM2ciIg3lWd75JrKztehs42ju7Y0R7exFy31
         sLquT0e5D4KEBhn5liulviXsgVTBIAJ29iqYTTwEm9GVe9SZO/G2aGt3FjN9KhfyjRXl
         EXgw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SxsdLzDc;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404fa0d83asor6629477b3a.10.2025.05.04.18.52.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 04 May 2025 18:52:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SxsdLzDc;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746409947; x=1747014747; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ahgA2NICchATUWyUqONsVh9cLKvE33L09maAByMkPyk=;
        b=SxsdLzDcvT0vLtD0r/jETDqvMEkVjJpg7zXzFCx8kMJEJSQJRC9sAj57enaZ+95vlu
         ndGXxtgLUjsuH5EUfCI2eNNIWKZrct4xjOiymexcj4Lot/lOzYsnvy+8d7L4zqdIwO5v
         zl6FsvEa7VEjKHTkgeiF8pvFUoxf5MN5jOvmsFBTpf+7h5mePBxMQ+Lvs+17MeuOqVq4
         cZXxeNk2NVha1hsko8Jj14haEzBWwFpewpnKPn1Mt1Z1jYw4PiMqM3lYWuRK31r7OTKS
         pJNtTF8Q/JLWsmS6hUip0eryeO4HxA+upKy/jjyxTxzYeNpDKzvK/JoEMEzv1FqwBs1t
         58ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746409947; x=1747014747;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ahgA2NICchATUWyUqONsVh9cLKvE33L09maAByMkPyk=;
        b=Ak167/4QglzlU1AiSmCFqJD4tkrwlRFvt7qp3VZnlD8sbivdzxXBF5ViFchvOyI5mp
         CNG68Uwr5eyAclae+1LEl6Swtu7to8W3ph3jkrzauBYmYp/O60yYOqL6WZizGZiM0OKh
         M751j3K+bFVjkkZ8uthsQ4Guj8wmLa2D/PncC+cdzF+nRwNdIQWppO95tDC0IjQ8fKcB
         xr+I08cnQkYvN3l9c2MWtYu+wWK3SKBbuKJNh6PvJSA1726ub22VnubLzCuceWNJrDYj
         w/Vmquu6T+WqrKvsZ1BERJABVGmn9QEUHLAwqNCSeQXI2QkfsZ7UgxA6DzPLRQ+0IPBm
         avww==
X-Forwarded-Encrypted: i=1; AJvYcCWHjN+Zq8q+v1jEIGmIqxdt0mPbhx63s3rHo3t/Z/RpnrTWzfFuHcA0nwyIpX1N7QgRYkHrMzlJsN746g==@linaro.org
X-Gm-Message-State: AOJu0Ywt7qsx7ALXU3dKi8UbWqeOJuEQVnb9Xwb230hy+LsKVfRgSKZJ
	e8eASjAOnsbT599+QfSddeFJ2EIkv48RDmkEyh5kg1Ru5mZnyPskskmOP/S1rCbNZQ==
X-Gm-Gg: ASbGnctmH3Gc2p9zdnzDrEbqmfyUN0WxE4JC4WFxTz0g5s3aEqrGNu3IRrd5N6H52ku
	JhmoYPEUO7L9nxtvWmz98Yu2IY+Zoey3A8DYBVVia5Dgrkm8I1z+GpwzSl1EdoUWtuk8pkEQrEr
	SLCnJnA5HtPk7vcA5jHpcrQAoiatQbv4BUxCMCWiAvTPqcao3kMXSUnAUsNr3SEWnGtySQvNmEY
	RLGqfRD6ApKcsJb2hAhA7hs1V4ooq8xcdg5mDymfQXPqHnl/MEWQ1kWW8lozQFkm0dJSvm67ubP
	uz5kQnfr5OiaZW2DTz/aGrEQcG7PQDeiose5X6/d
X-Google-Smtp-Source: AGHT+IE1sKfZ34X1oQ8FA4uYE1kw3ZEBhackQfnDZGJTR9Ww8iIZHCriZQXJNLDmi+zkHeZosREfpQ==
X-Received: by 2002:a05:6a20:9f4d:b0:1f5:9d5d:bcdd with SMTP id adf61e73a8af0-20e96205cebmr7161534637.1.1746409946929;
        Sun, 04 May 2025 18:52:26 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3920074sm4462101a12.11.2025.05.04.18.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 18:52:26 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	richard.henderson@linaro.org,
	alex.bennee@linaro.org,
	kvm@vger.kernel.org,
	Peter Maydell <peter.maydell@linaro.org>,
	anjo@rev.ng,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v5 00/48] single-binary: compile target/arm twice
Date: Sun,  4 May 2025 18:51:35 -0700
Message-ID: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: TvL7NEj4qQ1X

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
  target/arm: Replace target_ulong -> uint64_t for HWBreakpoint

Pierrick Bouvier (47):
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
  target/arm/tcg/crypto_helper: compile file twice (system, user)
  target/arm/tcg/hflags: compile file twice (system, user)
  target/arm/tcg/iwmmxt_helper: compile file twice (system, user)
  target/arm/tcg/neon_helper: compile file twice (system, user)
  target/arm/tcg/tlb_helper: compile file twice (system, user)
  target/arm/tcg/tlb-insns: compile file twice (system, user)
  target/arm/tcg/arith_helper: compile file twice (system, user)
  target/arm/tcg/vfp_helper: compile file twice (system, user)

 meson.build                    |  104 ++-
 include/system/hvf.h           |   15 +-
 include/tcg/tcg-op-common.h    |    1 +
 include/tcg/tcg.h              |   14 +
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
 target/arm/tcg/arith_helper.c  |    4 +-
 target/arm/tcg/crypto_helper.c |    4 +-
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
 35 files changed, 1542 insertions(+), 1396 deletions(-)
 create mode 100644 target/arm/tcg/helper.h
 create mode 100644 accel/hvf/hvf-stub.c
 create mode 100644 target/arm/cpu32-stubs.c

-- 
2.47.2
