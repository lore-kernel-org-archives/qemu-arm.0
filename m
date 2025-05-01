Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp19465njj;
        Wed, 30 Apr 2025 23:23:52 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVFdzLHdaLCsmSCSX4a0p0bwdaHUrBom5PC1Zg8eYHnFIPJbpInJggKz63AbSF8VKOGo39VDUUZpXaIMQ==@linaro.org
X-Received: by 2002:a05:6a00:2e84:b0:739:4a30:b900 with SMTP id d2e1a72fcca58-74038992d45mr9307194b3a.7.1746080632006;
        Wed, 30 Apr 2025 23:23:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746080631; cv=none;
        d=google.com; s=arc-20240605;
        b=iCnlw7ATTJSMvpnvatrAiM6bdqBiVs4JckXx+J4EKFZbaUnxBUSZO7I74Yqnqf01Or
         6tgWlWAN7J5u3bR7FMpmnmm390qwpnaa3vaBFbi324l6J4Y3/1ukBAW8fmnfuDt2OXO9
         o2Q5DDhQKUmxso/EF8YVfYTqzajz0Pw+l1n2gyBYMhPJhGW/WMYWqJrxNTdh5ghSFV9+
         kZdJbEWbHgNq/Bs6iVrAgT8UwwJfg0jNQ0A9F9xbMNeXeksBAI+UGT2dYPy7e7oZcmhc
         i1tgc/yEgmXtYX+lS47y7LpC2tZQUn4DHchXuHauSeDuyW3b55oo9Q1J9HbapBkkCCnf
         lKKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=rkK6B1xUwpIIGqtDFIUiUmTkZGBt+hJWF4dMkT/mNuo=;
        fh=5KyzodZzi2VV9D2W5atNRsWq9IVU9baQm162IJY72ko=;
        b=hjavuk4GG318PLxguIXtQRhJVgtYSzgch0T4QFUsyhv9NSpCf794LFf3X4F44mvbMB
         eNzIVA6kst/1gf0a8djVPK2tF08ebP2ln3ucZxhn4SUvQYeq5guPr1x9e7pyReu0z/KF
         RvkSFgNvXJO0usBju6+GHSJV0xzc0vLHGg0NWuUKHcQ8ZY7Kl20aB6+VLb8Cab2PrLdo
         ha7CKnH71UX/NUfihgsJQo+ApVWwGyKkO0tXg6tUbKMuv+sF2rQ5ib4wKNsO3GdARird
         1YR6drHBwcihltRrsZ5YTPiUUVMYxENI4OAkM7/PfYdnbLF9UiVmPsB8lzC/Tc/Nwu7q
         FUfw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RB28Q8+O;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404eeb4fcesor63267b3a.1.2025.04.30.23.23.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 30 Apr 2025 23:23:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RB28Q8+O;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746080631; x=1746685431; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rkK6B1xUwpIIGqtDFIUiUmTkZGBt+hJWF4dMkT/mNuo=;
        b=RB28Q8+OUiF+66Wr29Xc2A6MGWUdDB2SGRzw4J7JA1cdmovF/kP8YzUq2xdsnxi1gq
         J/VchKhprJsIoNa8/DrKdJB9moJs865ykEWA5UhKZz0XuKvet+cAVYC8oTA32JC2xsQa
         bDiuMl/iv5+W8VjKzj+Up+Ugd+gOpxoB2q95drIhs/380u5Qr9k1nAeUQZ5zBAzMR0Eq
         lHPoXRKFyt8uScOQmwS9z0Av2s8H52Hklh8Z2S1YrybjAssv+LzLPGzAW4lF+0Tn5+BV
         XNFhY/if7XBvIYCOM4F4T4IqPZgQPnh6ZYI6k+d2BpEqnIok+uzlYPbXJRTCkokcaFCY
         d8fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746080631; x=1746685431;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rkK6B1xUwpIIGqtDFIUiUmTkZGBt+hJWF4dMkT/mNuo=;
        b=N6ytjAmZg7p00TKrTIw5fbricgyT607s0RWjB9Q9eostyEXoIzdqo2KSrX9V+6BXQu
         T5DMtSVHCFmvTcc/EbYAQTYAy1Md33w+ohuBsDEGPJyVw4SpMse+Gr2VLvjm4A8ob/wR
         +SgG4ZwOKUkd1wY2xik4B/6pMq3uh2PwQ2FAQSoqVLOXLfiIwfLoPPB8UkLLcWJ3r6qs
         Hz0hOoYUmFE/oorLz/p6VwZFlUTMG4LWqc00M7Llm6K2e6j3eVgwNEH77jIvaaRWiD61
         +SEclLssQG/wsqdtOeI0mRWiW262hTkICRZcPlVyEEYqx+DWjXh10CRQ8JzPSJUKkMim
         EGfQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0HXNjBaJXWYhLuClk8CqxdqX+AUjgY6uK0fLGNHPJfP2jpP63+lVva5GzaKWi2TsDfmAKNERxfGF7yg==@linaro.org
X-Gm-Message-State: AOJu0YxrFYZIX+1SoGpwCxy9vugPhJ3M/upCA79EEx2vXmQncvrmiGpF
	vn1yHCC5Bo7JlWa6FnE7Bx0gIlErpiEyUONBwAeRnh500x24DVdPZn06s5OYzf6S0w==
X-Gm-Gg: ASbGncuYKU7ty8rfsKWMH+b3OkJ2OYW5crGeK9C5cSGgaS5d9AC6yBCcA3mTjtxaNDN
	Ix15JcSfWf1GkYfB7D5pPihOcgGYCk2zXc/nSZOPxLd5RS1W7zneiSvgIxXWbtX8DhvToo5z7gS
	p2SMb41cLwaRnl0YAfFWqh5S4QduwbempcOHvys69nM3wnMVP/8cKkz6gNpakYehsUDXekcYWTN
	WG/ghqvOfx3NxIhYCkOCtP/gZMlWF0kGDbHsXdePtOCILDl8bxIhp6oOOO8/Vl9rMqnHrlId/Ce
	w0aCAhd+M0YzGqKvEfU7GoYPU1kOIlOZ0o6bCvld
X-Google-Smtp-Source: AGHT+IE+QE3VdhRxsOSZO494VE5KFtC0CSO9PmXREhijoNUJXdUHnZkCg1m0jSY9sHBEloCWq/dRiA==
X-Received: by 2002:a05:6a00:2450:b0:73e:30af:f479 with SMTP id d2e1a72fcca58-74038a834fcmr8492876b3a.19.1746080631530;
        Wed, 30 Apr 2025 23:23:51 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7404f9fed21sm108134b3a.93.2025.04.30.23.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 23:23:51 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	richard.henderson@linaro.org,
	alex.bennee@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	anjo@rev.ng,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	kvm@vger.kernel.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 00/33] single-binary: compile target/arm twice
Date: Wed, 30 Apr 2025 23:23:11 -0700
Message-ID: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: u+YMwMD7+93I

More work toward single-binary.

Some files have external dependencies for the single-binary:
- target/arm/machine.c: migration
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

Philippe Mathieu-Daudé (1):
  target/arm: Replace target_ulong -> uint64_t for HWBreakpoint

Pierrick Bouvier (32):
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
  target/arm/helper: use i64 for exception_pc_alignment
  target/arm/helper: user i64 for probe_access
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
  target/arm/ptw: replace target_ulong with uint64_t
  target/arm/ptw: remove TARGET_AARCH64 from arm_casq_ptw
  target/arm/ptw: compile file once (system)
  target/arm/meson: accelerator files are not needed in user mode
  target/arm/kvm-stub: compile file once (system)

 meson.build                    |   78 ++-
 include/system/hvf.h           |   15 +-
 target/arm/helper.h            | 1152 +------------------------------
 target/arm/internals.h         |    6 +-
 target/arm/kvm_arm.h           |   83 +--
 target/arm/tcg/helper.h        | 1153 ++++++++++++++++++++++++++++++++
 accel/hvf/hvf-stub.c           |    5 +
 target/arm/arch_dump.c         |    6 -
 target/arm/cpu.c               |   47 +-
 target/arm/cpu32-stubs.c       |   26 +
 target/arm/debug_helper.c      |    6 +-
 target/arm/helper.c            |   21 +-
 target/arm/hyp_gdbstub.c       |    6 +-
 target/arm/kvm-stub.c          |   87 +++
 target/arm/kvm.c               |   29 +
 target/arm/ptw.c               |   17 +-
 target/arm/tcg/op_helper.c     |    2 +-
 target/arm/tcg/tlb_helper.c    |    2 +-
 target/arm/tcg/translate-a64.c |    2 +-
 target/arm/tcg/translate.c     |    2 +-
 accel/hvf/meson.build          |    1 +
 target/arm/meson.build         |   43 +-
 22 files changed, 1436 insertions(+), 1353 deletions(-)
 create mode 100644 target/arm/tcg/helper.h
 create mode 100644 accel/hvf/hvf-stub.c
 create mode 100644 target/arm/cpu32-stubs.c

-- 
2.47.2
