Received: by 2002:a17:504:1dd4:b0:1be9:327d:8ee3 with SMTP id b20csp57277nji;
        Thu, 11 Jul 2024 02:52:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW+FybMlw9xJxQWkNnY5bQXSzz/0JwTEJi/AhP1mSMwpim9ffeQtnYXHT6qXjQFtwHhcUUy1otJBY1GkLpnwRquzyFctjou
X-Google-Smtp-Source: AGHT+IEomNnoKtNIwdooPFdtJY4HDpOQQoVUplF4pbdFrmiZodU9eDeBP2RwDtvjh4khtW3cQFI2
X-Received: by 2002:a9d:5c11:0:b0:703:5b46:1c3f with SMTP id 46e09a7af769-70375a45c66mr8187703a34.24.1720691543256;
        Thu, 11 Jul 2024 02:52:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720691543; cv=none;
        d=google.com; s=arc-20160816;
        b=fvZLgBYHmvsonGL6Htm6+UOILaiUqL54M1yb/PdCawrGTuUCquXUchOCcWFqZBl9jj
         08VmuJ9TgymHa4tXpIi78bggzzOxCN0IP6ZAEDXZS5ivo01LSUilfN6OFfP2dwE/g/SX
         0Voq+Gr7FA3hgRHZ4o9pBlXrkfyZSD/i4jTNjzjE2CKzOnxGspg+hvErPl1woW1MSx7t
         2QYzDKmfzHVzOwOyc/ACCyWoAsSF9U8S5d/Q40wQqH8uDRpU+kwrWAwxoDreaS/EnPWl
         V1D9iVqACCNLTXaAHKTXrV/W53G86HtVKmSEewo14cYeFvETz4YGJxAhbR4JGEEViC5q
         JGcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:content-transfer-encoding:mime-version:message-id:date
         :subject:cc:list-id:to:from:dkim-signature;
        bh=8mq61Tlrac6x6q8Wk8hO0hpzS0zf+p63kwfxoI+VwgQ=;
        fh=n1zwXdn4M2Gb7wbp8Ju5DYsePyZg6/RLxxtehCXdteA=;
        b=PiAnRAswQ88gMLGdFjRCWQE8FEClyT+kJE8isf3CjjzfCuxy2BFSEHil954To40bA7
         WEZBD1SwEjQAPNDRjfokfXUFw6SIBLfNf2uzVJRDm6iNcI6+73qevyZxGiod9xIAihpQ
         8Xa50qXVLkggFZ4Pg4POjOXwtN9IGqqpL3m/mYRINj1bKG7LSGJuTXVE6EDwsA880+r0
         kAbQBYdMlmz1aekIA/wn1rIRnsr7lbegvXv/NJ86JsFRyv/ImIFtCyxRv6KIFJTD4iQ3
         OQCMnJnLYCHAP3BfINHVys75/Jt3bhdKfAyEI2X/0R1r5/KcO26nU4H3MKr3Krr1C0Nv
         IJcQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=lqMgy44P;
       spf=pass (google.com: domain of mchehab@kernel.org designates 2604:1380:40e1:4800::1 as permitted sender) smtp.mailfrom=mchehab@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <mchehab@kernel.org>
Received: from sin.source.kernel.org (sin.source.kernel.org. [2604:1380:40e1:4800::1])
        by mx.google.com with ESMTPS id d2e1a72fcca58-70b438db8f4si5736050b3a.272.2024.07.11.02.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 02:52:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of mchehab@kernel.org designates 2604:1380:40e1:4800::1 as permitted sender) client-ip=2604:1380:40e1:4800::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=lqMgy44P;
       spf=pass (google.com: domain of mchehab@kernel.org designates 2604:1380:40e1:4800::1 as permitted sender) smtp.mailfrom=mchehab@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A0446CE17FC;
	Thu, 11 Jul 2024 09:52:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91A16C4AF10;
	Thu, 11 Jul 2024 09:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720691540;
	bh=+MFQegYc0MFqIbwGv1GYU+PW0bPnkvQcflKaB/drRsU=;
	h=From:To:List-Id:Cc:Subject:Date:From;
	b=lqMgy44PMtQX/rtYdF+SeM6VgelkmNgRURcEqawpGaB5r8ZX8i5Yn9W8obQL/K4V+
	 gSnA4axOyUlky+nkyglo9VgXFxbBgBB/3/G2G1edvqOh/LkrPR7ZKEYq79Bp0Ueahx
	 Y7sGOVZllCbpRWUg/9KiEzMpXY1z/0TLKNFS7NCyBRddGwmU21ljqR6umRUo/Xk0q5
	 5IifpLBiGV8y+419qH7ryC6XsbIiXZJn4CxYkBcBbrCbVVwabFZEc7ppubTPS1Y3kT
	 Vo+RkhBHO65T51bxPwvXskQ16OFVNmhi6rI4snSfpOFWrepuc9hZawhklE0rZ+Suln
	 03DRvsS4b/i6Q==
Received: from mchehab by mail.kernel.org with local (Exim 4.97.1)
	(envelope-from <mchehab@kernel.org>)
	id 1sRqTK-00000002jZa-2JaY;
	Thu, 11 Jul 2024 11:52:18 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
List-Id: <linux-edac.lore.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-edac@kernel.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Ani Sinha <anisinha@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Dongjiu Geng <gengdongjiu1@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Shannon Zhao <shannon.zhaosl@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/6] Add ACPI CPER firmware first error injection for Arm Processor
Date: Thu, 11 Jul 2024 11:52:02 +0200
Message-ID: <cover.1720690278.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
X-TUID: lbsmKTPx7AVB

Testing OS kernel ACPI APEI CPER support is tricky, as one depends on
having hardware with special-purpose BIOS and/or hardware.

With QEMU, it becomes a lot easier, as it can be done via QMP.

This series add support for ARM Processor CPER error injection,
according with ACPI 6.x and UEFI 2.9A/2.10 specs.

This series consists of:

- three patches from Jonathan with basic EINJ features, already
  submitted as RFC (but not merged yet) at:
    https://lore.kernel.org/qemu-devel/20240628090605.529-1-shiju.jose@huawei.com/
- three patches from me extending it to optionally allow to
  generate all sorts of possible valid combinations for
  ARM Processor CPER record.

I've been using it to test a Linux Kernel patch series fixing
UEFI 2.9A errata and ARM processor trace event:
   https://lore.kernel.org/linux-edac/3853853f820a666253ca8ed6c7c724dc3d50044a.1720679234.git.mchehab+huawei@kernel.org/T/#t

I also wrote some Wiki pages for rasdaemon (a Linux daemon
widely used to monitor and react to RAS events):
   https://github.com/mchehab/rasdaemon/wiki/error-injection

Being really helpful to test the Linux Kernel behavior when
firmware-first RAS events for ARM processor arrives there,
helping to validate how CPER and GHES driver handles them
(and further testing userspace apps like rasdaemon):

Sending this command to QMP:
    { "execute": "qmp_capabilities" } 
    { "execute": "arm-inject-error", "arguments": {"error": [{"type": ["cache-error"]}]} }

Produces a simple CPER register, properly handled by the Linux
Kernel:

[  839.952678] {4}[Hardware Error]: Hardware error from APEI Generic Hardware Error Source: 1
[  839.953145] {4}[Hardware Error]: event severity: recoverable
[  839.953451] {4}[Hardware Error]:  Error 0, type: recoverable
[  839.953763] {4}[Hardware Error]:   section_type: ARM processor error
[  839.954094] {4}[Hardware Error]:   MIDR: 0x0000000000000000
[  839.954383] {4}[Hardware Error]:   Multiprocessor Affinity Register (MPIDR): 0x0000000080000000
[  839.954802] {4}[Hardware Error]:   running state: 0x0
[  839.955066] {4}[Hardware Error]:   Power State Coordination Interface state: 0
[  839.955424] {4}[Hardware Error]:   Error info structure 0:
[  839.955712] {4}[Hardware Error]:   num errors: 1
[  839.955983] {4}[Hardware Error]:    first error captured
[  839.956260] {4}[Hardware Error]:    propagated error captured
[  839.956561] {4}[Hardware Error]:    error_type: 0x02: cache error
[  839.956882] {4}[Hardware Error]:    error_info: 0x000000000054007f
[  839.957192] {4}[Hardware Error]:     transaction type: Instruction
[  839.957495] {4}[Hardware Error]:     cache error, operation type: Instruction fetch
[  839.957888] {4}[Hardware Error]:     cache level: 1
[  839.958166] {4}[Hardware Error]:     processor context not corrupted
[  839.958459] {4}[Hardware Error]:     the error has not been corrected
[  839.958771] {4}[Hardware Error]:     PC is imprecise
[  839.959074] [Firmware Warn]: GHES: Unhandled processor error type 0x02: cache error

rasdaemon output (rasdaemon still needs to be patched for
UEFI 2.9A errata):

           <...>-211   [002] d..1.     0.000129 arm_event 2024-07-11 09:50:45 +0000 affinity: -1 MPIDR: 0x80000000 MIDR: 0x0 running_state: 0 psci_state: 0 ARM Processor Err Info data len: 32
<CANT FIND FIELD buf>cpu: 0; error: 2; affinity level: 255; MPIDR: 0000000080000000; MIDR: 0000000000000000; running state: 0; PSCI state: 0; ARM Processor Err Info data len: 32; ARM Processor Err Info raw data: 00 20 06 00 02 00 00 05 7f 00 54 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00; ARM Processor Err Context Info data len: 0; ARM Processor Err Context Info raw data: ; Vendor Specific Err Info data len: 0; Vendor Specific Err Info raw data: 

More complex events with multiple Processor Error Information structures
can be produced like:

    { "execute": "arm-inject-error", "arguments":  {
        "validation": ["mpidr-valid", "affinity-valid", "running-state-valid", "vendor-specific-valid"],
        "running-state": [], "psci-state": 1229279264, 
        "error": [{
            "validation": ["multiple-error-valid", "flags-valid"], 
	"type": ["tlb-error", "bus-error", "micro-arch-error"], 
                               "multiple-error": 3, "phy-addr": 57005, "virt-addr": 48879},
                 {"type": ["micro-arch-error"]}, 
                 {"type": ["tlb-error"]}, 
                 {"type": ["bus-error"]},
                 {"type": ["cache-error"]}],
                 "context": [{"register": [57005, 48879, 43962, 47787]}],
                 "vendor-specific": [12, 23, 53, 52, 3, 123, 243, 255]} }

[  925.340284] {5}[Hardware Error]: Hardware error from APEI Generic Hardware Error Source: 1
[  925.340662] {5}[Hardware Error]: event severity: recoverable
[  925.340924] {5}[Hardware Error]:  Error 0, type: recoverable
[  925.341280] {5}[Hardware Error]:   section_type: ARM processor error
[  925.341631] {5}[Hardware Error]:   MIDR: 0x0000000000000000
[  925.341893] {5}[Hardware Error]:   Multiprocessor Affinity Register (MPIDR): 0x0000000080000000
[  925.342278] {5}[Hardware Error]:   error affinity level: 0
[  925.342571] {5}[Hardware Error]:   running state: 0x0
[  925.342835] {5}[Hardware Error]:   Power State Coordination Interface state: 1229279264
[  925.343157] {5}[Hardware Error]:   Error info structure 0:
[  925.343388] {5}[Hardware Error]:   num errors: 4
[  925.343602] {5}[Hardware Error]:    error_type: 0x1c: TLB error|bus error|micro-architectural error
[  925.343960] {5}[Hardware Error]:    virtual fault address: 0x000000000000beef
[  925.344241] {5}[Hardware Error]:    physical fault address: 0x000000000000dead
[  925.344526] {5}[Hardware Error]:   Error info structure 1:
[  925.344757] {5}[Hardware Error]:   num errors: 1
[  925.344965] {5}[Hardware Error]:    first error captured
[  925.345183] {5}[Hardware Error]:    propagated error captured
[  925.345416] {5}[Hardware Error]:    error_type: 0x10: micro-architectural error
[  925.345714] {5}[Hardware Error]:   Error info structure 2:
[  925.345946] {5}[Hardware Error]:   num errors: 1
[  925.346148] {5}[Hardware Error]:    first error captured
[  925.346413] {5}[Hardware Error]:    propagated error captured
[  925.346719] {5}[Hardware Error]:    error_type: 0x04: TLB error
[  925.346988] {5}[Hardware Error]:    error_info: 0x00000080d6460fff
[  925.347248] {5}[Hardware Error]:     transaction type: Generic
[  925.347492] {5}[Hardware Error]:     TLB error, operation type: Generic read (type of instruction or data request cannot be determined)
[  925.347945] {5}[Hardware Error]:     TLB level: 1
[  925.348153] {5}[Hardware Error]:     processor context corrupted
[  925.348392] {5}[Hardware Error]:     the error has been corrected
[  925.348635] {5}[Hardware Error]:     PC is imprecise
[  925.348848] {5}[Hardware Error]:     Program execution can be restarted reliably at the PC associated with the error.
[  925.349232] {5}[Hardware Error]:   Error info structure 3:
[  925.349459] {5}[Hardware Error]:   num errors: 1
[  925.349662] {5}[Hardware Error]:    first error captured
[  925.349884] {5}[Hardware Error]:    propagated error captured
[  925.350115] {5}[Hardware Error]:    error_type: 0x08: bus error
[  925.350371] {5}[Hardware Error]:    error_info: 0x0000000078da03ff
[  925.350629] {5}[Hardware Error]:     transaction type: Generic
[  925.350878] {5}[Hardware Error]:     bus error, operation type: Prefetch
[  925.351144] {5}[Hardware Error]:     affinity level at which the bus error occurred: 3
[  925.351451] {5}[Hardware Error]:     processor context not corrupted
[  925.351702] {5}[Hardware Error]:     the error has not been corrected
[  925.351960] {5}[Hardware Error]:     PC is precise
[  925.352164] {5}[Hardware Error]:     Program execution can be restarted reliably at the PC associated with the error.
[  925.352546] {5}[Hardware Error]:     participation type: Generic
[  925.352801] {5}[Hardware Error]:     address space: External Memory Access
[  925.353071] {5}[Hardware Error]:   Error info structure 4:
[  925.353299] {5}[Hardware Error]:   num errors: 1
[  925.353502] {5}[Hardware Error]:    first error captured
[  925.353720] {5}[Hardware Error]:    propagated error captured
[  925.353963] {5}[Hardware Error]:    error_type: 0x02: cache error
[  925.354222] {5}[Hardware Error]:    error_info: 0x000000000054007f
[  925.354478] {5}[Hardware Error]:     transaction type: Instruction
[  925.354782] {5}[Hardware Error]:     cache error, operation type: Instruction fetch
[  925.355203] {5}[Hardware Error]:     cache level: 1
[  925.355495] {5}[Hardware Error]:     processor context not corrupted
[  925.355848] {5}[Hardware Error]:     the error has not been corrected
[  925.356206] {5}[Hardware Error]:     PC is imprecise
[  925.356493] {5}[Hardware Error]:   Context info structure 0:
[  925.356809] {5}[Hardware Error]:    register context type: AArch64 EL1 context registers
[  925.357282] {5}[Hardware Error]:    00000000: 0000dead 00000000 0000beef 00000000
[  925.357800] {5}[Hardware Error]:    00000010: 0000abba 00000000 0000baab 00000000
[  925.358267] {5}[Hardware Error]:    00000020: 00000000 00000000
[  925.358523] {5}[Hardware Error]:   Vendor specific error info has 8 bytes:
[  925.358822] {5}[Hardware Error]:    00000000: 3435170c fff37b03                    ..54.{..
[  925.359192] [Firmware Warn]: GHES: Unhandled processor error type 0x1c: TLB error|bus error|micro-architectural error
[  925.359590] [Firmware Warn]: GHES: Unhandled processor error type 0x10: micro-architectural error
[  925.359935] [Firmware Warn]: GHES: Unhandled processor error type 0x04: TLB error
[  925.360235] [Firmware Warn]: GHES: Unhandled processor error type 0x08: bus error
[  925.360534] [Firmware Warn]: GHES: Unhandled processor error type 0x02: cache error



Jonathan Cameron (3):
  arm/virt: Wire up GPIO error source for ACPI / GHES
  acpi/ghes: Support GPIO error source.
  acpi/ghes: Add a logic to handle block addresses and FW first ARM
    processor error injection

Mauro Carvalho Chehab (3):
  target/arm: preserve mpidr value
  acpi/ghes: update comments to point to newer ACPI specs
  acpi/ghes: extend arm error injection logic

 configs/targets/aarch64-softmmu.mak |   1 +
 hw/acpi/ghes.c                      | 324 ++++++++++++++++++---
 hw/arm/Kconfig                      |   4 +
 hw/arm/arm_error_inject.c           | 420 ++++++++++++++++++++++++++++
 hw/arm/arm_error_inject_stubs.c     |  34 +++
 hw/arm/meson.build                  |   3 +
 hw/arm/virt-acpi-build.c            |  29 +-
 hw/arm/virt.c                       |  12 +-
 include/hw/acpi/ghes.h              |  41 +++
 include/hw/boards.h                 |   1 +
 qapi/arm-error-inject.json          | 277 ++++++++++++++++++
 qapi/meson.build                    |   1 +
 qapi/qapi-schema.json               |   1 +
 target/arm/cpu.h                    |   1 +
 target/arm/helper.c                 |  10 +-
 tests/lcitool/libvirt-ci            |   2 +-
 16 files changed, 1120 insertions(+), 41 deletions(-)
 create mode 100644 hw/arm/arm_error_inject.c
 create mode 100644 hw/arm/arm_error_inject_stubs.c
 create mode 100644 qapi/arm-error-inject.json

-- 
2.45.2

