Received: by 2002:a17:504:8616:b0:1be9:327d:8ee3 with SMTP id o22csp22881njm;
        Mon, 28 Apr 2025 22:00:17 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU8aCkRJQwhMv1hM4yMm5zbTpqvGZNHayq48iLrFpuhK8Oed88csammO8uHsiu1ftoFfZyaHq6WiyW65w==@linaro.org
X-Received: by 2002:a17:903:947:b0:227:eb61:34b8 with SMTP id d9443c01a7336-22dc6a096b1mr175944775ad.25.1745902816963;
        Mon, 28 Apr 2025 22:00:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745902816; cv=none;
        d=google.com; s=arc-20240605;
        b=dzu79cu2MvF7gudd1GOIl0sewq67qzVzp+3VYRh/idflO9TihOlfDI5IEPoY4Nmixh
         SX3Eyt4yUHXGtmk5OwTY962gmHo37Ehy6AIsIaWvPGwmu6hTEiMJ52sFMbNT+xsXrKby
         Imv5qIkwI6i38rQbg4eOBevA7D2AOaoYtNwzMFeBi18ydbHqOqVGfrlLLAvahfBZuCx6
         WiIXk5oOB6N8GE34M+e+IHyNoP/5IfsEd3ZwtlrIX2ugjCAM4kflYSYyIXqGp+1jBKlv
         f56RR4L2fMt1zqp2h3XvxjfotBUo572Ceyven+RWuwyfNOn5sDOXTCuyKk4ebPoMDKsG
         36qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=E7e6flwrW0Xr7srdLRTYqMhF0r9DLRZRxyW/leVX1gE=;
        fh=HB/p3V7tJIeIet+LAAaLjHHp4I+QwIt06bUk5Ri2bvU=;
        b=OY99EKjBYyMUxJ1Cy/Bo2p8B8nyMmee8+T9MZtkpQ7MjLqIlXfpW84GwAMiFkLY43G
         5AEI4lqfo5WWgFwDQ/mMAESr2diqpwdCnwrT6DYjcLxZK2WWoj8WDBgZwJnR/lnReguF
         Ri1tCMRo5VR6u5IlnXp2X9mI1DSLzPnb3ZwK0cOXzr1MXEWTFdR3uqzyfwQYY17TdPJa
         8PyI7BYx33XEszKLthD78Nt0KDuZLUpfjeYiJOkgH+2aI78AaLVqxrBiOpkbjKK1+O4O
         IWcGtd0pIdRtscxETMEoOgF90bBIumzkS3N5cVX0YVGw5A9V1pENdTAcGEsDQgnp+FVX
         zgDg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=G+q0ORwk;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22db4dc7912sor67226785ad.8.2025.04.28.22.00.16
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 28 Apr 2025 22:00:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=G+q0ORwk;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745902816; x=1746507616; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E7e6flwrW0Xr7srdLRTYqMhF0r9DLRZRxyW/leVX1gE=;
        b=G+q0ORwk+TcMfxRfXRda0kRAMlDIksXtqjWvK5g2aVpVZ4MKATJHnyrrD7668XkhSB
         CqwMo3DVfXJqnIJ5iUFNV5jTH4ukbvhWWZC3EUZ6/Gbtsrvf6MXnm+0PfqQ/U1TfZ6xM
         bNP0zftuUITvwskZfBEFtmjcE3VaxrXSNLdEHDQMsnilP7FxDPoyKv9Ma3LeKkIwtFbp
         aTIopwqyXdZvtl05NQFxAmBmPY2fcQB0kpGI8xUYfkXTzzOeL/a4hT2voagApzURUuPd
         jaSKiJgqMN/Ywk83Jb+coXLZdgMxSoWDLMKVYa0l94HpYV8byQrnn87bIU10bqWI8Lra
         HkNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745902816; x=1746507616;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E7e6flwrW0Xr7srdLRTYqMhF0r9DLRZRxyW/leVX1gE=;
        b=xBcHnEh93PCRcZTC8AxT6xIatpF1RgSkb/lwjAumAxuR4ryUvheBxrS/0NoZhtle7W
         JT4U+yHmF2GBLrwtgLwxoWY8JfnN5J/bRJlnyl9hqYVLnT7lA6DpxdQsCqSJBm3m3VnM
         LU5u/drPD5rspqjhzSH+9ewi6yzYyFsGE+j1nR/vvZx7O1cxC5vHuRNuhy2QIaaysujm
         l7WoTUSgpcVUPhVAaKtgRbQplW69BZz3HiMUhuh5uSxHFa1h3lV4/OoyMkr8GVcL8ZBe
         k9d+BVjkgh5gioX6W2sVYJV3ISukWdvoIDBD0ZAE+6i726tiW8Bz0yQ+o0hymdR5aS70
         FRTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWb4Lf1x0ctiuk9lf4ra//eEL6TF1dVCm4ZpLzftNQJggrdxvnGiyZUHRnviqs6y7hZHskVh8um2ZaNA==@linaro.org
X-Gm-Message-State: AOJu0Yyrs/3qLCXp7gYG+6Ne7p5iOmIz2DbjjIQAKKneJmZI8CmUGFEw
	pqdC7D8h4MBR5UmBkLX9hV1Lpa0G/FsC6ya6QzMI5NoezSvNvLvWEgG2ofWEVtEn7A==
X-Gm-Gg: ASbGnctEwg8we7nIWQR2bUL1YigyC4BKRjeuOI/CaCQfZta4UEUBuRnhd+Xdf4Nmrpv
	tDgjJOqMqHVYYWAFJdia6TTLHbXuALZ5cWFOWdFZsAOZYfQU7LHUkS1LAIkr4LUFwC6K+nljvVk
	qmmXAhgxI/uougzsR2amxRbpxf3YhKeBI2+30be5yrKkp9hTtrpz03fI+1VRGOqM7kDnDlWwqa9
	Nz1xHDrKDjbaiwN3Qo58zYbOE2Wg0Q7I6VrMlrhDKCWBMJWP4c2HL4uGdgbHWRURQaIg+QP51tk
	KyH+q2UR24hJeZ4IuxGzvSLs8IikamkZEzuUMHJc
X-Google-Smtp-Source: AGHT+IGtTYums0vJIYUAxvrHOiwYyUcioYLnqAFsCGQIOBOAUh+3sHRwCcQhNBYfSH9HQfYcsvlOJQ==
X-Received: by 2002:a17:903:2ec8:b0:216:6901:d588 with SMTP id d9443c01a7336-22dc69ffb69mr175276195ad.15.1745902816496;
        Mon, 28 Apr 2025 22:00:16 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dbd6f7sm93004015ad.76.2025.04.28.22.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 22:00:16 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	kvm@vger.kernel.org,
	alex.bennee@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	qemu-arm@nongnu.org,
	anjo@rev.ng,
	richard.henderson@linaro.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 00/13] single-binary: compile target/arm twice
Date: Mon, 28 Apr 2025 21:59:57 -0700
Message-ID: <20250429050010.971128-1-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: t3UhBV+Rx6cA

More work toward single-binary.
This series convert target/arm/cpu.c.

Built on {linux, windows, macos} x {x86_64, aarch64}
Fully tested on linux-x86_64
https://github.com/pbo-linaro/qemu/actions/runs/14722101993

Philippe Mathieu-Daudé (1):
  target/arm: Replace target_ulong -> uint64_t for HWBreakpoint

Pierrick Bouvier (12):
  include/system/hvf: missing vaddr include
  meson: add common libs for target and target_system
  target/arm: move kvm stubs and remove CONFIG_KVM from kvm_arm.h
  target/arm/kvm_arm: copy definitions from kvm headers
  target/arm/kvm-stub: add missing stubs
  target/arm/cpu: remove CONFIG_KVM from arm_cpu_kvm_set_irq
  accel/hvf: add hvf_enabled() for common code
  target/arm/cpu: get endianness from cpu state
  target/arm/cpu: remove TARGET_AARCH64 around aarch64_cpu_dump_state
    common
  target/arm/cpu: remove TARGET_AARCH64 in arm_cpu_finalize_features
  target/arm/cpu: compile file twice (user, system) only
  target/arm/cpu32-stubs.c: compile file twice (user, system)

 meson.build              | 78 ++++++++++++++++++++++++-------
 include/system/hvf.h     | 15 ++++--
 target/arm/internals.h   |  6 +--
 target/arm/kvm_arm.h     | 99 +++++++---------------------------------
 accel/hvf/hvf-stub.c     |  3 ++
 target/arm/cpu.c         | 37 +++++----------
 target/arm/cpu32-stubs.c | 24 ++++++++++
 target/arm/hyp_gdbstub.c |  6 +--
 target/arm/kvm-stub.c    | 87 +++++++++++++++++++++++++++++++++++
 accel/hvf/meson.build    |  1 +
 target/arm/meson.build   | 15 ++++--
 11 files changed, 233 insertions(+), 138 deletions(-)
 create mode 100644 accel/hvf/hvf-stub.c
 create mode 100644 target/arm/cpu32-stubs.c

-- 
2.47.2
