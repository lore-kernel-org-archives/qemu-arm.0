Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp115710lfb;
        Thu, 3 Dec 2020 15:49:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxeV396q9H455GRoh3RGGsY9zx0i1zmNJsOasnJUl8dLte78EhdIIzQ0rPVIwn1dtYvLPCT
X-Received: by 2002:a5b:c08:: with SMTP id f8mr2450498ybq.398.1607039362839;
        Thu, 03 Dec 2020 15:49:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607039362; cv=none;
        d=google.com; s=arc-20160816;
        b=Uw+P4GFiY6EtItVXhz7yO5bSyrSJZZUMG34dwABBfANbElRZIteFa5QzagofGDpdZK
         DjQ0r7TPk1xDspAwb+CRbhMVkCFXm6qRSJCT/6k1dyDKlyRr5zTVaACc2e+GYnSo+7La
         Vb9Xqe2ipcSF6I6/O1QyhnHwRTvK8Dxsd8XQIiSu7h72muek7eVybbmAsmIpuGLnCGi6
         IzICfqXJy+86lwPxd0NU6DkrbsURcrFUljI3pDIOinWHXp/BwryD6hYvoocnED7pQmpP
         Mdm4sjHqE6ncSojb/K5aND81LvgXB7Y2a+N+gwMr84x55G89XBlJVVPdxfevwjlTlkhO
         6QUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=FVVeDu1VJRfi9d0YAK4DgcBT4/90TKqU+HNEM73A4+4=;
        b=ZFQJhzscYPzkLLwdc2gSFXpgYfUiRLMJZgYdTn2csherm8w1origSJX3+JrC39eE7C
         ULP3kzYUNeAonjXAkUK332NqvoFJcQu23BbDgy64PzaPgC7RJDLNUzQ9mNLovzMpsX5S
         KTvXOGNZwz+TYQBaN2+7jKUsdchp1rUlfXf3Imq54sjr+RSw6ktIHW4XrmWmfJjqnaDO
         e3xWbOGdpjXHpP0s5B0D+6uwMZrnVqOOLkQG6oJTTvcRans8flGOCzzT669Lqhw1tLJj
         7NDcxi4cyCY/t+Rt6fZ98cg3EZeMnmDMPnrqurEhHuOjca44FSo1+Mr48uNOtonwJYbF
         Naaw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w9si354763ybe.424.2020.12.03.15.49.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Dec 2020 15:49:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kkyLi-0002We-6h
	for alex.bennee@linaro.org; Thu, 03 Dec 2020 18:49:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1kkyLT-0002W7-4d; Thu, 03 Dec 2020 18:49:07 -0500
Received: from mail.csgraf.de ([188.138.100.120]:57470
 helo=zulu616.server4you.de) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1kkyLQ-0003Lf-F5; Thu, 03 Dec 2020 18:49:06 -0500
Received: from localhost.localdomain
 (dynamic-077-002-092-143.77.2.pool.telefonica.de [77.2.92.143])
 by csgraf.de (Postfix) with ESMTPSA id 2459E39003C3;
 Fri,  4 Dec 2020 00:48:58 +0100 (CET)
From: Alexander Graf <agraf@csgraf.de>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 00/11] hvf: Implement Apple Silicon Support
Date: Fri,  4 Dec 2020 00:48:46 +0100
Message-Id: <20201203234857.21051-1-agraf@csgraf.de>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=188.138.100.120; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Collingbourne <pcc@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JhWsgLVZk1xQ

Now that Apple Silicon is widely available, people are obviously excited
to try and run virtualized workloads on them, such as Linux and Windows.

This patch set implements a fully functional version to get the ball
going on that. With this applied, I can successfully run both Linux and
Windows as guests. I am not aware of any limitations specific to
Hypervisor.framework apart from:

  - Live migration / savevm
  - gdbstub debugging (SP register)


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

Alexander Graf (10):
  hvf: Add hypervisor entitlement to output binaries
  hvf: x86: Remove unused definitions
  hvf: Move common code out
  hvf: Introduce hvf vcpu struct
  arm: Set PSCI to 0.2 for HVF
  hvf: Simplify post reset/init/loadvm hooks
  hvf: Add Apple Silicon support
  arm: Add Hypervisor.framework build target
  hvf: arm: Add support for GICv3
  hvf: arm: Implement -cpu host

Peter Collingbourne (1):
  arm/hvf: Add a WFI handler

 MAINTAINERS                  |  14 +-
 accel/hvf/entitlements.plist |   8 +
 accel/hvf/hvf-all.c          |  54 +++
 accel/hvf/hvf-cpus.c         | 466 +++++++++++++++++++
 accel/hvf/meson.build        |   7 +
 accel/meson.build            |   1 +
 include/hw/core/cpu.h        |   3 +-
 include/sysemu/hvf.h         |   2 +
 include/sysemu/hvf_int.h     |  66 +++
 meson.build                  |  40 +-
 scripts/entitlement.sh       |  13 +
 target/arm/cpu.c             |  13 +-
 target/arm/cpu.h             |   2 +
 target/arm/hvf/hvf.c         | 856 +++++++++++++++++++++++++++++++++++
 target/arm/hvf/meson.build   |   3 +
 target/arm/kvm_arm.h         |   2 -
 target/arm/meson.build       |   2 +
 target/i386/hvf/hvf-cpus.c   | 131 ------
 target/i386/hvf/hvf-cpus.h   |  25 -
 target/i386/hvf/hvf-i386.h   |  49 +-
 target/i386/hvf/hvf.c        | 462 +++----------------
 target/i386/hvf/meson.build  |   1 -
 target/i386/hvf/vmx.h        |  24 +-
 target/i386/hvf/x86.c        |  28 +-
 target/i386/hvf/x86_descr.c  |  26 +-
 target/i386/hvf/x86_emu.c    |  62 +--
 target/i386/hvf/x86_mmu.c    |   4 +-
 target/i386/hvf/x86_task.c   |  12 +-
 target/i386/hvf/x86hvf.c     | 224 ++++-----
 target/i386/hvf/x86hvf.h     |   2 -
 30 files changed, 1786 insertions(+), 816 deletions(-)
 create mode 100644 accel/hvf/entitlements.plist
 create mode 100644 accel/hvf/hvf-all.c
 create mode 100644 accel/hvf/hvf-cpus.c
 create mode 100644 accel/hvf/meson.build
 create mode 100644 include/sysemu/hvf_int.h
 create mode 100755 scripts/entitlement.sh
 create mode 100644 target/arm/hvf/hvf.c
 create mode 100644 target/arm/hvf/meson.build
 delete mode 100644 target/i386/hvf/hvf-cpus.c
 delete mode 100644 target/i386/hvf/hvf-cpus.h

-- 
2.24.3 (Apple Git-128)

