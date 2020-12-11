Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp177775lfq;
        Fri, 11 Dec 2020 07:20:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxJLXmm8IXF/loalUPgoHq6utejsnIF2b++MCVHH5p2vZhxNXb2wYpggP4eNgB91qzTbnMS
X-Received: by 2002:a25:db91:: with SMTP id g139mr19090511ybf.48.1607700002609;
        Fri, 11 Dec 2020 07:20:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607700002; cv=none;
        d=google.com; s=arc-20160816;
        b=lQ0fU3Q5Rnn4jtRgLaE3ifHyxzsx9A8ek6X/YXLJ3i1Epfc6VzS+5yLtzKvIYFiJ9B
         gusNJ7iG+H5dxP1wTOBCLVFSTQ7yZE8e2lw+5JkHPr3NGkpodkikG3bUhU5j7w+J01Ss
         7z96+VQtILFf1snsVAaouCpq2Xpc7tP0U291q77zn/vwpoXi6xDdzqssNg+4ya/lY9da
         3jmdmQZEt6V2FMS/lbLCo4zxO0jgHcSiM+WOmQ0A0yldgIzwp9Q0OdaIMf5PBbHKEgEf
         Q4P1q6p8c8zt2OgDZpnXvPO+IG+G22jB70QHUUg8rZanDe1ATlihYpNqbpmvLo0w/DjY
         0+OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=aryZoovaDY3s9psFzCrdhACV/7ILUaY4QxLd8oVgMW4=;
        b=tbTqQdXCkJZQOygKbXPhi1e0vYu/DUKIvOKbT3X3ha5NWMjK/N6nmJy8jtwybxf1wP
         3wVzz4mFOhqykX6VV8YyyWpzMlfdWM5xViaMIwLasyaJZKEOOEBGieZGVZM40tdCBfo2
         0dDPM4MVJ+uKAlnaG97ne8mwAvf5y8+Vzupbo/op/o+BmNW2LfnQ4EqC8y1xBo97HotJ
         cB4voOxN08DGe7OzkoveTorU61l90T6GTbLQXWi/oFqq8qoF8EmrFjs3Y7NYuJKwlASw
         il4QOrjYyfboEPrS4f+Ikkfls1WzeglsI+i9baxQ++gSB7RR+C0P8HkUOcdXHDV9ATNq
         gl/A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y17si9890499ybk.378.2020.12.11.07.20.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Dec 2020 07:20:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1knkDB-00070m-Td
	for alex.bennee@linaro.org; Fri, 11 Dec 2020 10:20:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1knk6a-0007ZF-7W; Fri, 11 Dec 2020 10:13:12 -0500
Received: from mail.csgraf.de ([188.138.100.120]:36476
 helo=zulu616.server4you.de) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1knk6S-0001sW-Uv; Fri, 11 Dec 2020 10:13:11 -0500
Received: from localhost.localdomain
 (dynamic-077-007-081-179.77.7.pool.telefonica.de [77.7.81.179])
 by csgraf.de (Postfix) with ESMTPSA id B855539001AD;
 Fri, 11 Dec 2020 16:13:01 +0100 (CET)
From: Alexander Graf <agraf@csgraf.de>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 00/11] hvf: Implement Apple Silicon Support
Date: Fri, 11 Dec 2020 16:12:49 +0100
Message-Id: <20201211151300.85322-1-agraf@csgraf.de>
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
X-TUID: vuYSoER0w/xw

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

v4 -> v5:

  - Use g_free() on destroy

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

