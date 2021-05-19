Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp1829184lfm;
        Wed, 19 May 2021 13:26:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzw6RFsEUyM0bX9EozrhFsh6hcfP4PS0zEp7ZMnELiy0SkNke/hK/BhCdPn+culoD4tvV5t
X-Received: by 2002:a92:d60e:: with SMTP id w14mr958287ilm.0.1621455961230;
        Wed, 19 May 2021 13:26:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621455961; cv=none;
        d=google.com; s=arc-20160816;
        b=TbOMou7uiHfyk3R5+BIZc/rlnLHlVAlpHIMkftdcLT+PYqGfWQjSA42KQFR2i3+AIh
         OjhVIzQAmKE+dTIdQ4Ss+P7MLHePDS6roZDQ//B5JLFuBxeOejDoeNs4XE7tjh19bbWj
         vKThcrVTj1//9/OQLcx3coiJlRoCU86u1qlVg45sjckNLypCPOTO6pSwGiarWnhN0xdn
         6tL5aNnzQ4ZsqYyd4q9kiRlrE4U6oq4BhuDjmKtaSgHtzbG2d60XqBAl6kB0kt7or8Qy
         7FeEPMgaBnZuUrDeGzCi+DMZA+gbXjjnkTS42Eg/UAJuVMOnJGpU+mRh79tfEijKeEe9
         WiLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=auH0wWAjMcbrVYgtHkVbr4T/1ujobcxQtOT2mYdGZyQ=;
        b=e/rsBWFsLh3emFIiClP3rO4Vdkr6B440Iy7BgIlklb4zPnAVRw7bXbGDjaA3QYfkgE
         SrPGU2ldQ2WRk9PBchilh0JIc4aIKPjmc7OZNTh0ZeS9HouWVRdSxiHaABU9ccBQn9aX
         ePRugiaO5l2sC0kbBPnRXdQuOYt8/zZ8oGjVh22G7tVeLZZuj7fZxTQzTF0Q7yoN4tDX
         SCxg8JA8NwInKNZthblASSMz45QztYArhLHWW/TBv0emXfaPwDzmmLUPVMPACTMS9981
         hNwY4/RslF5TncGXYKo6bKMSoZI0HR97SXMbQWH7MetqxHI8jM4SMPAZmQnj4YTc7qDe
         x95A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a8si698354ild.38.2021.05.19.13.26.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 May 2021 13:26:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ljSlU-0002Dp-Dz
	for alex.bennee@linaro.org; Wed, 19 May 2021 16:26:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1ljSiu-0004gT-8v; Wed, 19 May 2021 16:23:20 -0400
Received: from mail.csgraf.de ([85.25.223.15]:48086 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1ljSic-0003CS-PH; Wed, 19 May 2021 16:23:20 -0400
Received: from localhost.localdomain
 (dynamic-095-114-039-201.95.114.pool.telefonica.de [95.114.39.201])
 by csgraf.de (Postfix) with ESMTPSA id 9BA0C6080055;
 Wed, 19 May 2021 22:22:54 +0200 (CEST)
From: Alexander Graf <agraf@csgraf.de>
To: QEMU Developers <qemu-devel@nongnu.org>
Subject: [PATCH v8 00/19] hvf: Implement Apple Silicon Support
Date: Wed, 19 May 2021 22:22:34 +0200
Message-Id: <20210519202253.76782-1-agraf@csgraf.de>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm <qemu-arm@nongnu.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Collingbourne <pcc@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3i8xzN6/7HR5

Now that Apple Silicon is widely available, people are obviously excited
to try and run virtualized workloads on them, such as Linux and Windows.

This patch set implements a fully functional version to get the ball
going on that. With this applied, I can successfully run both Linux and
Windows as guests. I am not aware of any limitations specific to
Hypervisor.framework apart from:

  - Live migration / savevm
  - gdbstub debugging (SP register)
  - missing GICv3 support


Enjoy!

Alex

v1 -> v2:

  - New patch: hvf: Actually set SIG_IPI mask
  - New patch: hvf: Introduce hvf vcpu struct
  - New patch: hvf: arm: Mark CPU as dirty on reset
  - Removed patch: hw/arm/virt: Disable highmem when on hypervisor.framework
  - Removed patch: arm: Synchronize CPU on PSCI on
  - Fix build on 32bit arm
  - Merge vcpu kick function patch into ARM enablement
  - Implement WFI handling (allows vCPUs to sleep)
  - Synchronize system registers (fixes OVMF crashes and reboot)
  - Don't always call cpu_synchronize_state()
  - Use more fine grained iothread locking
  - Populate aa64mmfr0 from hardware
  - Make safe to ctrl-C entitlement application

v2 -> v3:

  - Removed patch: hvf: Actually set SIG_IPI mask
  - New patch: hvf: arm: Add support for GICv3
  - New patch: hvf: arm: Implement -cpu host
  - Advance PC on SMC
  - Use cp list interface for sysreg syncs
  - Do not set current_cpu
  - Fix sysreg isread mask
  - Move sysreg handling to functions
  - Remove WFI logic again
  - Revert to global iothread locking

v3 -> v4:

  - Removed patch: hvf: arm: Mark CPU as dirty on reset
  - New patch: hvf: Simplify post reset/init/loadvm hooks
  - Remove i386-softmmu target (meson.build for hvf target)
  - Combine both if statements (PSCI)
  - Use hv.h instead of Hypervisor.h for 10.15 compat
  - Remove manual inclusion of Hypervisor.h in common .c files
  - No longer include Hypervisor.h in arm hvf .c files
  - Remove unused exe_full variable
  - Reuse exe_name variable

v4 -> v5:

  - Use g_free() on destroy

v5 -> v6:

  - Switch SYSREG() macro order to the same as asm intrinsics

v6 -> v7:

  - Already merged: hvf: Add hypervisor entitlement to output binaries
  - Already merged: hvf: x86: Remove unused definitions
  - Patch split: hvf: Move common code out
    -> hvf: Move assert_hvf_ok() into common directory
    -> hvf: Move vcpu thread functions into common directory
    -> hvf: Move cpu functions into common directory
    -> hvf: Move hvf internal definitions into common header
    -> hvf: Make hvf_set_phys_mem() static
    -> hvf: Remove use of hv_uvaddr_t and hv_gpaddr_t
    -> hvf: Split out common code on vcpu init and destroy
    -> hvf: Use cpu_synchronize_state()
    -> hvf: Make synchronize functions static
    -> hvf: Remove hvf-accel-ops.h
  - New patch: hvf: arm: Implement PSCI handling
  - New patch: arm: Enable Windows 10 trusted SMCCC boot call
  - New patch: hvf: arm: Handle Windows 10 SMC call
  - Removed patch: "arm: Set PSCI to 0.2 for HVF" (included above)
  - Removed patch: "hvf: arm: Add support for GICv3" (deferred to later)
  - Remove osdep.h include from hvf_int.h
  - Synchronize SIMD registers as well
  - Prepend 0x for hex values
  - Convert DPRINTF to trace points
  - Use main event loop (fixes gdbstub issues)
  - Remove PSCI support, inject UDEF on HVC/SMC
  - Change vtimer logic to look at ctl.istatus for vtimer mask sync
  - Add kick callback again (fixes remote CPU notification)
  - Move function define to own header
  - Do not propagate SVE features for HVF
  - Remove stray whitespace change
  - Verify that EL0 and EL1 do not allow AArch32 mode
  - Only probe host CPU features once
  - Move WFI into function
  - Improve comment wording
  - Simplify HVF matching logic in meson build file

v7 -> v8:

  - checkpatch fixes
  - Do not advance for HVC, PC is already updated by hvf
    (fixes Linux boot)

Alexander Graf (18):
  hvf: Move assert_hvf_ok() into common directory
  hvf: Move vcpu thread functions into common directory
  hvf: Move cpu functions into common directory
  hvf: Move hvf internal definitions into common header
  hvf: Make hvf_set_phys_mem() static
  hvf: Remove use of hv_uvaddr_t and hv_gpaddr_t
  hvf: Split out common code on vcpu init and destroy
  hvf: Use cpu_synchronize_state()
  hvf: Make synchronize functions static
  hvf: Remove hvf-accel-ops.h
  hvf: Introduce hvf vcpu struct
  hvf: Simplify post reset/init/loadvm hooks
  hvf: Add Apple Silicon support
  hvf: arm: Implement -cpu host
  hvf: arm: Implement PSCI handling
  arm: Add Hypervisor.framework build target
  arm: Enable Windows 10 trusted SMCCC boot call
  hvf: arm: Handle Windows 10 SMC call

Peter Collingbourne (1):
  arm/hvf: Add a WFI handler

 MAINTAINERS                     |  13 +
 accel/hvf/hvf-accel-ops.c       | 484 ++++++++++++++++
 accel/hvf/hvf-all.c             |  47 ++
 accel/hvf/meson.build           |   7 +
 accel/meson.build               |   1 +
 include/hw/core/cpu.h           |   3 +-
 include/sysemu/hvf_int.h        |  66 +++
 meson.build                     |   8 +
 target/arm/cpu.c                |  13 +-
 target/arm/cpu.h                |   2 +
 target/arm/hvf/hvf.c            | 962 ++++++++++++++++++++++++++++++++
 target/arm/hvf/meson.build      |   3 +
 target/arm/hvf/trace-events     |  11 +
 target/arm/hvf_arm.h            |  19 +
 target/arm/kvm-consts.h         |   2 +
 target/arm/kvm_arm.h            |   2 -
 target/arm/meson.build          |   2 +
 target/arm/psci.c               |   2 +
 target/i386/hvf/hvf-accel-ops.c | 146 -----
 target/i386/hvf/hvf-accel-ops.h |  23 -
 target/i386/hvf/hvf-i386.h      |  33 +-
 target/i386/hvf/hvf.c           | 464 ++-------------
 target/i386/hvf/meson.build     |   1 -
 target/i386/hvf/vmx.h           |  24 +-
 target/i386/hvf/x86.c           |  28 +-
 target/i386/hvf/x86_descr.c     |  26 +-
 target/i386/hvf/x86_emu.c       |  62 +-
 target/i386/hvf/x86_mmu.c       |   4 +-
 target/i386/hvf/x86_task.c      |  12 +-
 target/i386/hvf/x86hvf.c        | 222 ++++----
 target/i386/hvf/x86hvf.h        |   2 -
 31 files changed, 1887 insertions(+), 807 deletions(-)
 create mode 100644 accel/hvf/hvf-accel-ops.c
 create mode 100644 accel/hvf/hvf-all.c
 create mode 100644 accel/hvf/meson.build
 create mode 100644 include/sysemu/hvf_int.h
 create mode 100644 target/arm/hvf/hvf.c
 create mode 100644 target/arm/hvf/meson.build
 create mode 100644 target/arm/hvf/trace-events
 create mode 100644 target/arm/hvf_arm.h
 delete mode 100644 target/i386/hvf/hvf-accel-ops.c
 delete mode 100644 target/i386/hvf/hvf-accel-ops.h

-- 
2.30.1 (Apple Git-130)

