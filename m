Received: by 2002:a05:7301:19ab:b0:175:694b:cb76 with SMTP id mc43csp2509184dyb;
        Mon, 23 Jun 2025 05:18:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUoaOmXwU0lvw/3Z8TQ/g8KoGfW/rOFguUNWV7/qgeegFNkJvRscaW0KDC4xn1wjrDnHgbQ1ZjNsCQiYw==@linaro.org
X-Received: by 2002:a05:6000:4188:b0:3a4:dbac:2dc1 with SMTP id ffacd0b85a97d-3a6d1313c09mr7265321f8f.54.1750681128798;
        Mon, 23 Jun 2025 05:18:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750681128; cv=none;
        d=google.com; s=arc-20240605;
        b=hntuZ9BBackxShkr3hNFm4G6i5khcJiB+0Kvsr64mHn9SfZD9qLSjev0eIk213l3xu
         DBGRzL8MK26SSgFQ5k+UhV7UOzKwOjEjdv08ES0eUcbGGbunv+wNJybzykuVXzIXO3Jb
         VXuCdoOpMOnzbgFckNymba9qP+z/7KmNfPpUpc+gzrPlL0kkjTzdww5DrFOHGgj+Sv/o
         3sbyqQh1GXJR+SMntC+aPTOnTggnAL3MztobCkJKa/z4dpib+7tIEM77lOvHI2Oo7hAn
         xLk7ux8Mhp9DQUf5JszkskgcMMeOgJ+OhdpKtJir6s72Z6VAVJTZ2Drj3w4tOSb6TNZh
         /dEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=7t8GepafkJeMN/Zl0RDAcmDhcsq3WRAaImUu4o56bag=;
        fh=8XCwp/UQrkdFnZc62ELVVgRqZ68KzWMwSKZHu1163FI=;
        b=WZ0UPXAi8uKnCqVMbrZl+hb4tRbZXnjA29U/oor2/j5MULOTS+Qttroov+qZN21xSd
         OUd8xda5+6ZlSM6LzeN7XIgkuZHANJY0+w+25LWGuRNxDo3CZdj11YlVl9RRAIcwhFbT
         FY2DmHeL60/Zszf0UMa+84nmn0M9a4aIGxYcQ+aj2LVQWjQYsEW5Qnfgtto5XJlWPstN
         EhL9mzOStpbe5MSbI/J0HsMUkCfixXkcrHxJvP3v2xzGc6dAg2SYdCkHNdepKxPz/9oy
         Cyq2Hy9reDgyz6PZNzUfJqcHM3qBXkZOXbrDmPEJyJSJHJJzirh2Gw22+UXZovWRQbzg
         2NsA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="iSePic/T";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-3a6d0f0f9a2sor2213306f8f.1.2025.06.23.05.18.48
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 23 Jun 2025 05:18:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="iSePic/T";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750681128; x=1751285928; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7t8GepafkJeMN/Zl0RDAcmDhcsq3WRAaImUu4o56bag=;
        b=iSePic/Tjfd1jUV+YGIgUuXzwJjKQ8WYFcbTRa5mPHVE5cDxEsJKzVBrnLrM/ZYzt0
         ZKiIh9F2EBJBtGJc2jSXMIXHsWJgvf5i/6ZELbMoKQS2+ZpW0CcVOkmvdIkaQtpPEzzl
         bae1o/Co+232e2xs1ImmIGGuAMpCyy//YuomPDj6S/NdcPEk4PXMdfCljNId9fFN2MK/
         Ve37ka3nwbfrPAiD5MA0VCTEm017HXQn1/uL6Wt0vV3XVXQjsH7+j4xAnMHuN3iWvE4b
         ATsWZkGSeOnjKcHdoD0dRXmgtOughXceRuKB6Fj0I49O2gKdmDFHkcbuUrA1P1m+de3C
         BAHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750681128; x=1751285928;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7t8GepafkJeMN/Zl0RDAcmDhcsq3WRAaImUu4o56bag=;
        b=UzQMrkgGcua+uIcxr9bz5x6RVzPfeaNn829j1YwC5JloyOxs7MfHGjHHjS3D52R6A2
         ym3D2pDM4s11PnjKXdcl/He5QK7FtJ1sy/9QT21zNDaYtrkvBzmLjZRTVbOafsczMO7Q
         qW9loOieoznKjcUdQkUWiPsXpVV67V7zWsBXu3hmw1CCpOTaV00JNFrPf9AMF4ca1o9S
         tm/COt7/NQ1REtAK8aJKPZOlBeB0n4rtSISqVwJHKAcYvKxc2nJGLpqva0lkidGeDf1Z
         AqcJW9Di5Ce1ps+2Qrjx+hcR9krTwHzmKjFtr6zgrvu5eg5a1DbmjSQoHmYmDjo8HnrL
         qm9A==
X-Forwarded-Encrypted: i=1; AJvYcCUD+kMad0iM8GSKOKXKqixNyrUvx09XTaHUgnhbZvXKqxlx5UWQAE3rcO0rbGTJidSeuE8FaaB2zdfYsA==@linaro.org
X-Gm-Message-State: AOJu0YykuEqYphZ5EbgXBxTRrjEg/v3y6NXQyaisx6bcbpArJO3Mi1iD
	vH0t0p/q8rdZcEuAhs1JtJREN2tyQDgrtQdPf8I2ZZ+g0QQ6oBsWYSSwP3z6awdLpbHpkw==
X-Gm-Gg: ASbGnctUpPOYd3PvfMka4H1TPViZd1ILbbYlW7qjKlvzPKC2kQPPcTUQnC0C0SL/kR4
	fYblwgdYVd4GfkeepZ4Hh8S/QsdXflAxg8fOVy1OgEbMRbhUcbEwqKcCWbXQtzwRSJLMFgVHpLU
	cqfaw7TsAcYEfaLfRh9MrAdydZLTY742N63vlL+UhegulXF9RtX/0oNcUY6bS6RSv4P/7PUrW8s
	wkAysav9X90brxuQAIqYsvHvDuT3j1RSPSFYYxrFy3Ca1/KrMkUC82Q4rT4+93VFfISnksUvZ8J
	bsL+OZH8Qydh7gqbyEJCGe0o2g5HbqeX7M/pIsok+apbJB+mxgn4QDoO0toJWwWWTH5zqMH30ta
	YR7jh+gs5x1w+KiiOzIeDLxXJ6nW+NlvCFGbr
X-Google-Smtp-Source: AGHT+IFM1NS/tC9WBk7I3nX53LY2i9vYAhCY9oXhCQwhmOzZQ3Cjx1W2PBOvVDeh1+H7KqoU9pMS+Q==
X-Received: by 2002:a05:6000:248a:b0:3a5:2fae:1348 with SMTP id ffacd0b85a97d-3a6d13129c6mr9113300f8f.51.1750681128074;
        Mon, 23 Jun 2025 05:18:48 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d117c66esm9121303f8f.47.2025.06.23.05.18.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Jun 2025 05:18:47 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Roman Bolshakov <rbolshakov@ddn.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alexander Graf <agraf@csgraf.de>,
	Bernhard Beschow <shentey@gmail.com>,
	John Snow <jsnow@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	kvm@vger.kernel.org,
	Eric Auger <eric.auger@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Cameron Esfahani <dirty@apple.com>,
	Cleber Rosa <crosa@redhat.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Phil Dennis-Jordan <phil@philjordan.eu>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 00/26] arm: Fixes and preparatory cleanups for split-accel
Date: Mon, 23 Jun 2025 14:18:19 +0200
Message-ID: <20250623121845.7214-1-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: Dh13JCdnd79O

Only the last patch is missing review (#26)

Since v2:
- Addressed thuth review comments

Since v1:
- Addressed rth's review comments

Omnibus series of ARM-related patches (noticed during the
"split accel" PoC work).

- Usual prototypes cleanups
- Check TCG for EL2/EL3 features (and not !KVM or !HVF)
- Improve HVF debugging
- Correct HVF 'dtb_compatible' value for Linux
- Fix HVF GTimer frequency (My M1 hardware has 24 MHz)
  (this implies accel/ rework w.r.t. QDev vCPU REALIZE)
- Expand functional tests w.r.t. HVF

Regards,

Phil.

Philippe Mathieu-Daudé (26):
  target/arm: Remove arm_handle_psci_call() stub
  target/arm: Reduce arm_cpu_post_init() declaration scope
  target/arm: Unify gen_exception_internal()
  target/arm/hvf: Simplify GIC hvf_arch_init_vcpu()
  target/arm/hvf: Directly re-lock BQL after hv_vcpu_run()
  target/arm/hvf: Trace hv_vcpu_run() failures
  accel/hvf: Trace VM memory mapping
  target/arm/hvf: Log $pc in hvf_unknown_hvc() trace event
  target/arm: Correct KVM & HVF dtb_compatible value
  accel/hvf: Model PhysTimer register
  target/arm/hvf: Pass @target_el argument to hvf_raise_exception()
  target/arm: Restrict system register properties to system binary
  target/arm: Create GTimers *after* features finalized / accel realized
  accel: Keep reference to AccelOpsClass in AccelClass
  accel: Introduce AccelOpsClass::cpu_target_realize() hook
  accel/hvf: Add hvf_arch_cpu_realize() stubs
  target/arm/hvf: Really set Generic Timer counter frequency
  hw/arm/virt: Only require TCG || QTest to use TrustZone
  hw/arm/virt: Only require TCG || QTest to use virtualization extension
  hw/arm/virt: Rename cpu_post_init() -> post_cpus_gic_realized()
  hw/arm/sbsa-ref: Tidy up use of RAMLIMIT_GB definition
  tests/functional: Set sbsa-ref machine type in each test function
  tests/functional: Restrict nested Aarch64 Xen test to TCG
  tests/functional: Require TCG to run Aarch64 imx8mp-evk test
  tests/functional: Add hvf_available() helper
  tests/functional: Expand Aarch64 SMMU tests to run on HVF accelerator

 meson.build                                   |  1 +
 accel/hvf/trace.h                             |  2 +
 include/qemu/accel.h                          |  3 +
 include/system/accel-ops.h                    |  4 +-
 include/system/hvf.h                          |  3 +
 target/arm/cpu.h                              |  2 -
 target/arm/internals.h                        |  6 +-
 target/arm/tcg/translate.h                    |  1 +
 accel/accel-common.c                          |  4 +
 accel/accel-system.c                          |  3 +-
 accel/hvf/hvf-accel-ops.c                     |  8 ++
 accel/tcg/tcg-accel-ops.c                     |  4 +-
 hw/arm/sbsa-ref.c                             |  8 +-
 hw/arm/virt.c                                 |  9 +-
 target/arm/cpu.c                              | 78 +++++++++--------
 target/arm/hvf/hvf.c                          | 86 ++++++++++++-------
 target/arm/kvm.c                              |  2 +-
 target/arm/tcg/translate-a64.c                |  6 --
 target/arm/tcg/translate.c                    |  2 +-
 target/i386/hvf/hvf.c                         |  5 ++
 accel/hvf/trace-events                        |  7 ++
 python/qemu/utils/__init__.py                 |  2 +-
 python/qemu/utils/accel.py                    |  8 ++
 target/arm/hvf/trace-events                   |  5 +-
 tests/functional/qemu_test/testcase.py        |  6 +-
 tests/functional/test_aarch64_imx8mp_evk.py   |  1 +
 tests/functional/test_aarch64_sbsaref.py      |  5 +-
 .../functional/test_aarch64_sbsaref_alpine.py |  3 +-
 .../test_aarch64_sbsaref_freebsd.py           |  3 +-
 tests/functional/test_aarch64_smmu.py         | 12 ++-
 tests/functional/test_aarch64_xen.py          |  1 +
 31 files changed, 186 insertions(+), 104 deletions(-)
 create mode 100644 accel/hvf/trace.h
 create mode 100644 accel/hvf/trace-events

-- 
2.49.0
