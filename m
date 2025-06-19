Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp252390njc;
        Thu, 19 Jun 2025 06:13:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV0787abSMGW294Vu+9OlKZKbTe2IpHrZEAfMKBbDE1/zuM5kAiFCeJTQY5YcPVgo3LG/kAuDWgnlSlEw==@linaro.org
X-Received: by 2002:a05:600c:1c87:b0:440:69f5:f179 with SMTP id 5b1f17b1804b1-4535ec3875bmr33900815e9.7.1750338803934;
        Thu, 19 Jun 2025 06:13:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750338803; cv=none;
        d=google.com; s=arc-20240605;
        b=de6wo3+lzbdl7KpJj3fAiSARkr18GKiJ/OaHiQtp5GZ4yAYPDtierF4bPqHuBhn6Oo
         kDy09QGAmqSEidA6uN+bpR5Wvc/aXJj4k5rgihevzhwfsPGZDtWOoB79/a5syoDtmHDN
         AhCna9dg+TOgKzOT5gjDVnnWyQk3EcDonX/OK1ppaF0zS7UaZJtZtEwm+8V30OKWJbFW
         eM6F8H2w05w4SWOcFflassMhNTGAyW6sA+YlvKKMw2dblq1PxcIeCtKjxPjZUKkM80hz
         yXXJyOjQvlLQf31xnpzOf7ctvNgLY55gZapySVBfyO1Nm9J9159EjJmHew1LSMpMeivE
         cF4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=jLfE9fOJifGBcyKWvwZ9c2lJf+BVklJMs4lfWx36NIY=;
        fh=gMoFvofJeuaoiYUiNkzF7JN+sJDkIiG7Cw2yuyZZOxk=;
        b=Ce9aRapL6pDdGoL9V3Ze8QK1jem+zZW6mQ6iRtNWwoRFIKxXty4sPn3WEWPB2jE+n9
         mgcilUqAgqlU1U3gxyLDMnZRe1pWHDLOVJuDOg2za4IXCOWfVqFDWQJMb/DPe33yj7y3
         eNiLqKVXd7SKpUKcTPMW86x4hMTbg7gXmDrEPM4VmTb2ThC9+7JjGVgqvyc3FeaPxc9g
         DdbOtVfrvO8ZIhah9icB/xgpkOVC5Fd5RijbU/lPbT4rtpahgE359b2tWapLdPcbZDAR
         PXymgqT4AR+xHEbYW3jiwk3ym/r8XksIKipgcmFHvy32O7BkPSbv+rACamIOC/Yx2laS
         Mp8A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gtxmNk1j;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4535e984105sor6632375e9.2.2025.06.19.06.13.23
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 19 Jun 2025 06:13:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gtxmNk1j;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750338803; x=1750943603; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jLfE9fOJifGBcyKWvwZ9c2lJf+BVklJMs4lfWx36NIY=;
        b=gtxmNk1jqjqRWndN4cneotOTVlwSRBlyEBtIHQVgTOEpWm1iN9wocYaB5RtQshFnz6
         n9jm+VpoF6oHZZLFna8vqyv0qecieSQF6Oc4nFOcYwq0af0QmRBkGrJMwZ7ystcxB4gI
         wG0Qa1cJdag3IHsT1MlH9PL3kDZ/K/GkfYzRv5XIHt5cIVhfbPFARZ79cDETs0WQQmeG
         R7spV6WJ284ORS2jfk+NXSPuSRzaTiuuiJ2XUCTj2pAcf3uhuA7p2EdIQeNQeaus+iK/
         I2B1h7n+KBhh4BghbLrV63uimDPn/7LtNFnNPwqPVpITcqxKifM6eqlRbJMCaBZHEt+a
         JpzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750338803; x=1750943603;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jLfE9fOJifGBcyKWvwZ9c2lJf+BVklJMs4lfWx36NIY=;
        b=vR0wOZwNq4dNKrZ8fJXP5mgVZ9zojCCYsqIPjqMkYqP54isCJb1iYIuQ8eFN3EfMOo
         GGO7SGXrDVnd6jCADVTMM/exi5CCtdrtGgA5GVd/uG+qN+9St/voJqP36f32pPAThfA1
         FR7D7TCfUj21gP7gZqArWmqZo6IkaFPhdAuyw7NjwEj88OK31N/0qtvtlDV9EfFKoqA9
         Ex1TrEW8W/13r7DVhazJLEvNWcvTQ8lNcGb6JghghAEXBAz0QDw03MymvRd3RcB5SS9c
         8W8ls2Y8yuDFM84cwl5EowzdEjPrqjWaq73O58zk3pjR6Y8iRwkx5gzPrB6Gjsd4T9bB
         dK2g==
X-Forwarded-Encrypted: i=1; AJvYcCXyhnslY9qe6YhDLWfSc4pYaMt+fzZUiqyKijINIJust1Q6v6zg4XCj+CGfpV/Cc9Ebvb9OiJQjBErCAw==@linaro.org
X-Gm-Message-State: AOJu0Yy4CEMC8c+9OB37qV0j8B5Sb4utyYUN6Qb4CE4rA/XjiLbphDsq
	RMhe/QCYhqaKLbO7GzJVAD/OZZ2gOustuS2Ei60RUlwhPTLJhABdmfSXnCMhwOE9VTTw+A==
X-Gm-Gg: ASbGncuVdh9h9rPzTnW9f+J8HuBUMG2/kuiF41Zt65elGTKJqcs1L43FbNG94DHEkYz
	5yGVOO7S4nUp05PyTToK+AXWe5zZ+NNGIDUP8jlJTxcceWylw8MH74QuoanCv34q8aZN4qSB/an
	T5XbaKXvHmWlrkc0+4ebNXe7uguDHD7I2lisNZzORyDnF19rBYuKWB8Y5qtCnPeL2OxEijRxgmJ
	MDTZzSDCkz+Lwq9NWM7nENAvxAHJXvWIwAFDtG9RWyHyy1te9FLPuxzKmqYYRC+Vv6yqRhuje17
	wwO1ZpErXYVKgG72OtFVKbgSE5qO5PdHAXGjm3Ru4mr7DvKfZ5ThVja7PBVqU739DzhF0xVIage
	yKprHQntw4xS7U3Xo9+LLen77g3vVT3MBfkur
X-Google-Smtp-Source: AGHT+IFZta5PRVvj+E2GJ5o/dtJ2nlRFJisiMQh02QL8783nK8vqZBU6kAfypQFE9/oYtUYHjFX88A==
X-Received: by 2002:a05:600c:83c3:b0:442:f4a3:a2c0 with SMTP id 5b1f17b1804b1-4535ec8d13dmr38863525e9.13.1750338803340;
        Thu, 19 Jun 2025 06:13:23 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535ead2449sm28200915e9.30.2025.06.19.06.13.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 19 Jun 2025 06:13:22 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Cameron Esfahani <dirty@apple.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Julian Armistead <julian.armistead@linaro.org>,
	Radoslaw Biernacki <rad@semihalf.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Phil Dennis-Jordan <phil@philjordan.eu>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-arm@nongnu.org,
	Roman Bolshakov <rbolshakov@ddn.com>,
	Alexander Graf <agraf@csgraf.de>
Subject: [PATCH 00/20] arm: Fixes and preparatory cleanups for split-accel
Date: Thu, 19 Jun 2025 15:12:59 +0200
Message-ID: <20250619131319.47301-1-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: b02IO3x7mYkL

Omnibus series of ARM-related patches (noticed during the
"split accel" PoC work).

- Usual prototypes cleanups
- Check TCG for EL2/EL3 features (and not !KVM or !HVF)
- Improve HVF debugging
- Correct HVF 'dtb_compatible' value for Linux
- Fix HVF GTimer frequency (My M1 hardware has 24 MHz)
  (this implies accel/ rework w.r.t. QDev vCPU REALIZE)

Regards,

Phil.

Philippe Mathieu-Daudé (20):
  target/arm: Remove arm_handle_psci_call() stub
  target/arm: Reduce arm_cpu_post_init() declaration scope
  target/arm: Unify gen_exception_internal()
  target/arm/hvf: Simplify GIC hvf_arch_init_vcpu()
  target/arm/hvf: Directly re-lock BQL after hv_vcpu_run()
  target/arm/hvf: Trace hv_vcpu_run() failures
  accel/hvf: Trace VM memory mapping
  target/arm/hvf: Log $pc in hvf_unknown_hvc() trace event
  target/arm/hvf: Correct dtb_compatible value
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
  tests/functional/sbsa-ref: Move where machine type is set

 meson.build                              |  1 +
 accel/hvf/trace.h                        |  2 +
 include/qemu/accel.h                     |  3 +
 include/system/accel-ops.h               |  4 +-
 include/system/hvf.h                     |  3 +
 target/arm/cpu.h                         |  2 -
 target/arm/internals.h                   |  6 +-
 target/arm/tcg/translate.h               |  1 +
 accel/accel-common.c                     |  4 ++
 accel/accel-system.c                     |  3 +-
 accel/hvf/hvf-accel-ops.c                |  8 +++
 accel/tcg/tcg-accel-ops.c                |  4 +-
 hw/arm/sbsa-ref.c                        |  8 ++-
 hw/arm/virt.c                            |  9 +--
 target/arm/cpu.c                         | 71 ++++++++++++------------
 target/arm/hvf/hvf.c                     | 46 +++++++++++----
 target/arm/tcg/translate-a64.c           |  6 --
 target/arm/tcg/translate.c               |  2 +-
 target/i386/hvf/hvf.c                    |  5 ++
 accel/hvf/trace-events                   |  7 +++
 target/arm/hvf/trace-events              |  3 +-
 tests/functional/test_aarch64_sbsaref.py |  2 +-
 22 files changed, 129 insertions(+), 71 deletions(-)
 create mode 100644 accel/hvf/trace.h
 create mode 100644 accel/hvf/trace-events

-- 
2.49.0
