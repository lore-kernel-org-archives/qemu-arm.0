Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp877037njc;
        Fri, 20 Jun 2025 06:07:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVj5XCQmObWOxg8KeJVDuw8TOGIFpMwXRE+Ya01OmQHhklRCzl9TZYSfbsXqTz0zwWgr26p8bjkuFLFnQ==@linaro.org
X-Received: by 2002:a5d:5f8c:0:b0:3a4:eda1:6c39 with SMTP id ffacd0b85a97d-3a6d12db6dbmr2607301f8f.13.1750424832683;
        Fri, 20 Jun 2025 06:07:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750424832; cv=none;
        d=google.com; s=arc-20240605;
        b=HI/n9qhwNt5bjK0NnzRS8dtiGU8aMJRmDjAND7LhEYpEhsvU9465iFz2E5BWUv0S4h
         2X2hJY/UJhMZbnIIJHivvOz+u/flZFXZs72H7oRqoiw1uekoh3F6yQo7qLoDgYTzYLu9
         c2fVEAnQ3qnbllBHnHX5SeVebSGwaJ96qCPxGOsJGjda6RG4eASb9vPcht2sc37VUWTK
         4m0pUdQYK5exWhDBjaJJxqoZoqKGALnTGBIK3Z5GmqXEuYXeBGghVlzuzl5nfSL+nAdL
         Dm62tb9c3dOjkUTFDjMrsoGmDiO3FlXAxYJVrs33PDzZFAPbaiQaGXRGGp3zwCzTm5OL
         y7kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=+QJmU5PBg2tZeWfZeXKYOSoau8zVaAF0qlZsb030HdQ=;
        fh=wu5+9JO2SzPtWfNw113IM1cmoZ9XvmF3XQFv234CDPU=;
        b=Es8WXOIsypZMnVD5DoEFN91bJRLfhptIsZxBN6djbvNX+PHUacwrDVuQ24UpBHzxYo
         wXnHdoCNIRBtTUqPzN84L5rMFs1xczBfH5XDH66KquFhAPT7Yg3yh4eoJL0aLLjhfSdk
         9JoY7BznhvSEnyVYWOClnoHx9R8vPmOwTaMy6Pov9TV0fUz3Z/Fm94jV4w8iTaP4GgPr
         O0HdKygbf8dYC6wbQHZzj43rzk2Umox24/u34pIEnFq8ernO6OQRh2FWZ16B4++UIz6x
         vPTZREKomWAm76AD8+IGEMvAyTEqu12aEhnJORE5XyPOecUfnjC0oYr8t59mZNYF1akl
         zE1w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jSpcC1T8;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-3a6d0eed829sor564115f8f.1.2025.06.20.06.07.12
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 20 Jun 2025 06:07:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jSpcC1T8;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750424832; x=1751029632; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+QJmU5PBg2tZeWfZeXKYOSoau8zVaAF0qlZsb030HdQ=;
        b=jSpcC1T8c3riF4h1dd/NBG9s7MuEriQeVFVTdGq84/xYVevSpakXRKjRL0gZoS9HUK
         jsNU64LUwSiJe541t9nOzLyhRh9Tpv0sUwVBcd5pi7KjgQCUc3qz4Plcgu2v94kh1+fF
         yvpOgVJEhZIdVXn+yFXjU+82JsXgUnHAgQJI1VTyxlFmxc8XwXFPBIojixA72gm1oOE4
         Yl79f0OnYeLaH7rKteR89iOgPZJlFUTL2OVPuAHEo57m662XJ2zTiAp7RBNpCccm4ej3
         0UhYKmhRGt68aCIZhM52MSbVTvg3fhxZOdIIV3fazcUrrd9fslG8vYAsFKlY2a513A0R
         Rkeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750424832; x=1751029632;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+QJmU5PBg2tZeWfZeXKYOSoau8zVaAF0qlZsb030HdQ=;
        b=MzK6NWmyvHVu0vUbRVcvuOvGUbPnP7bkjc97l8vDfB/cT0klKbnbjlon+OlSSBMDGt
         21LDJADmMjbzdw3KHqtoMzTb2X3EjC1eKV4kIIiHjocwjhs/mqn4JcpTnGaBH9VQlo7Z
         yxUe5wyK8yoniyqd0qJDi9Dc2vmzgU16obY54lGUSFbssFyOWDhb6cIeEQF6+96fcc2C
         gNjJrfGfz1tBlOWL4PExtd0qBzq2rzr3ilmAYHFrZ3MmAHIHNVJyGiShGyDHXBbnvmCC
         6WJ7FOePZDE2xyulvNl651PJ2Qva8NqVwMvfNVLPq2b93pjvOKGzuJtJu/BxI1ydazkk
         JWPA==
X-Forwarded-Encrypted: i=1; AJvYcCW7punofGwFpADJZ5L1S+YMlMfYRglNVjcDJ5iSrq8DRrPVLvNkvscsH/qt8jgoQ9DLiAcS7PX7M+n1DA==@linaro.org
X-Gm-Message-State: AOJu0YwRShqOdFzjN2Kn5k134rUCC1Q5j2FiyWNeHwm9NxNTSUcet/PY
	vffcTtGkF3vXXTxdr7tywnPnnHcPUg0ib34pDBg8Ug6865SK4IF4X5nEzJ9cXIXXdTAp6A==
X-Gm-Gg: ASbGncvlW41K3oMY6LfiIBSOHdcFkSkzcSR69jn99xrbzFvvprWjhbKfigGleNu9149
	7KeptMg7ScPummMvvdUmiy4q/BmYfEUUgmXdCxbR+GCrJ9Gr+2sAX43UGOHNQIs0lFFEuv0iwfx
	fV73WapEIsyoVb6hstJQIVm3nuN1wFhISBO6cKnIqWNqPRzhk+CXISqtziSRdrqAEa8x2sI0ns2
	uyUmZMoeqeBFXIVB+h/c1+zegUeN/4ylhVkQdrctJrG3r2gxTcWi5CJoB5DpBrI0h5zk8IetH+a
	Qk4zCbct8LW9wSu9I9gO7yFOeSbJzhpOwQL/mKHp+QaAqVeCOG+dz66zAxt3Sd49a4RtWn5JoHX
	b4AwvfOHoGsJw0ewaMSvzpV9/GWeiV3exb4J0
X-Google-Smtp-Source: AGHT+IEJ9h5ss6DQ9nbsYss8UAzQAQ33xR7PMaeHXiIi1steBknP4WF0eD2p4PDUPBMV6vbuu4kWIQ==
X-Received: by 2002:a05:6000:23c3:b0:3a4:f744:e00c with SMTP id ffacd0b85a97d-3a6d130452fmr1797673f8f.29.1750424831952;
        Fri, 20 Jun 2025 06:07:11 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453646dc66fsm24751975e9.18.2025.06.20.06.07.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Jun 2025 06:07:11 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Alexander Graf <agraf@csgraf.de>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Phil Dennis-Jordan <phil@philjordan.eu>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Bernhard Beschow <shentey@gmail.com>,
	Cleber Rosa <crosa@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Cameron Esfahani <dirty@apple.com>,
	kvm@vger.kernel.org,
	qemu-arm@nongnu.org,
	Eric Auger <eric.auger@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Roman Bolshakov <rbolshakov@ddn.com>,
	John Snow <jsnow@redhat.com>
Subject: [PATCH v2 00/26] arm: Fixes and preparatory cleanups for split-accel
Date: Fri, 20 Jun 2025 15:06:43 +0200
Message-ID: <20250620130709.31073-1-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: 7fy5Pc9VDE1B

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
  target/arm/hvf: Trace host processor features
  hw/arm/virt: Only require TCG || QTest to use TrustZone
  hw/arm/virt: Only require TCG || QTest to use virtualization extension
  hw/arm/virt: Rename cpu_post_init() -> post_cpus_gic_realized()
  hw/arm/sbsa-ref: Tidy up use of RAMLIMIT_GB definition
  tests/functional: Restrict nexted Aarch64 Xen test to TCG
  tests/functional: Require TCG to run Aarch64 imx8mp-evk test
  tests/functional: Add hvf_available() helper
  tests/functional: Expand Aarch64 SMMU tests to run on HVF accelerator

 meson.build                                 |   1 +
 accel/hvf/trace.h                           |   2 +
 include/qemu/accel.h                        |   3 +
 include/system/accel-ops.h                  |   4 +-
 include/system/hvf.h                        |   3 +
 target/arm/cpu.h                            |   2 -
 target/arm/internals.h                      |   6 +-
 target/arm/tcg/translate.h                  |   1 +
 accel/accel-common.c                        |   4 +
 accel/accel-system.c                        |   3 +-
 accel/hvf/hvf-accel-ops.c                   |   8 ++
 accel/tcg/tcg-accel-ops.c                   |   4 +-
 hw/arm/sbsa-ref.c                           |   8 +-
 hw/arm/virt.c                               |   9 +-
 target/arm/cpu.c                            |  78 ++++++------
 target/arm/hvf/hvf.c                        | 129 +++++++++++++++-----
 target/arm/kvm.c                            |   2 +-
 target/arm/tcg/translate-a64.c              |   6 -
 target/arm/tcg/translate.c                  |   2 +-
 target/i386/hvf/hvf.c                       |   5 +
 accel/hvf/trace-events                      |   7 ++
 python/qemu/utils/__init__.py               |   2 +-
 python/qemu/utils/accel.py                  |   8 ++
 target/arm/hvf/trace-events                 |   6 +-
 tests/functional/qemu_test/testcase.py      |   6 +-
 tests/functional/test_aarch64_imx8mp_evk.py |   1 +
 tests/functional/test_aarch64_smmu.py       |   9 +-
 tests/functional/test_aarch64_xen.py        |   1 +
 28 files changed, 221 insertions(+), 99 deletions(-)
 create mode 100644 accel/hvf/trace.h
 create mode 100644 accel/hvf/trace-events

-- 
2.49.0
