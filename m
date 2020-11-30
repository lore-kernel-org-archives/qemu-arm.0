Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp4709533lfb;
        Sun, 29 Nov 2020 19:07:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyXzGjFUT3pR1T+tIVa7ZOjVI7owFP7wzBTMNX/MNuuvSKNvNzqyHZVFiptkO2WStlt9vAe
X-Received: by 2002:a25:8809:: with SMTP id c9mr23052180ybl.521.1606705660250;
        Sun, 29 Nov 2020 19:07:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606705660; cv=none;
        d=google.com; s=arc-20160816;
        b=VS9PHnXjRAy5aESMEY+TUtS1uEGO9xKINYUOvoeZ7iy8eP6USN1mQRF0kJUICfjGgZ
         /9/dsGGnGuVXC/2iXm/kMLgImIa+IYdQp8P43vUpqCjhJMCJDuZLPGwq5L0sqHlfrRGl
         uThLjaFdi48DoKxJFV86kchG1HyY0yVLzKlc2sOzUY02rYdh4jrukJOiYuW0hqGQe7Br
         j043RKyPf0kiT26yAPD+RyKPRhC1/jGNvy/JpepKN4x1XFTsDdTW56R4hyhHbDHBuWWu
         C7jDvcdiwo66LHhhpTI8QOWTmqyatRrkD6QDvWM58Vo5Yr2xxUQCRn8olrkBU4AzS77K
         7oBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=QQG6qbsdcSvnzeWSo80C5r5VIAZwTrwIdSdOR21OZfI=;
        b=bpl35pMDxMCZp+2On0ZKzjQkhkbOb2JdNp7Bmno7S1iFdgVBkd/2FHHMRIyEjLYIr5
         MmRv99cZbhlNiELqYRGwTzSu1OEhjLCPiyGojCd6bz3Sb9yJ0JlOhjB635vP485YbCoS
         shxvlqhQseAQmvB4ptWrXiN90aZzm2hqFqGZhMV8CnxBOcnjO3Hl82/QL8LoDLvbHSQm
         ya7/rVCyli1RLdKTL1pTYABEjltWlPA6733CaV/8U+2I6wu45GnSQivDuAy3fRk8RykQ
         ayNqKqlF3gJlS9RdpWTxWlM95iGnDBRKxVM9kLkXAct3q60r1hqGG8tp5/RAu3Kms30C
         YfsA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p190si16840811yba.358.2020.11.29.19.07.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 29 Nov 2020 19:07:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:60570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kjZXP-00084x-HZ
	for alex.bennee@linaro.org; Sun, 29 Nov 2020 22:07:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1kjZXF-00084Z-Kv; Sun, 29 Nov 2020 22:07:29 -0500
Received: from mail.csgraf.de ([188.138.100.120]:35282
 helo=zulu616.server4you.de) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1kjZXD-00076c-KX; Sun, 29 Nov 2020 22:07:29 -0500
Received: from localhost.localdomain
 (dynamic-077-009-091-089.77.9.pool.telefonica.de [77.9.91.89])
 by csgraf.de (Postfix) with ESMTPSA id 8924E39001C1;
 Mon, 30 Nov 2020 04:07:24 +0100 (CET)
From: Alexander Graf <agraf@csgraf.de>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/8] hvf: Implement Apple Silicon Support
Date: Mon, 30 Nov 2020 04:07:15 +0100
Message-Id: <20201130030723.78326-1-agraf@csgraf.de>
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
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MA3XblnZMwuU

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

Alexander Graf (8):
  hvf: Add hypervisor entitlement to output binaries
  hvf: Move common code out
  hvf: Actually set SIG_IPI mask
  hvf: Introduce hvf vcpu struct
  arm: Set PSCI to 0.2 for HVF
  hvf: arm: Mark CPU as dirty on reset
  hvf: Add Apple Silicon support
  arm: Add Hypervisor.framework build target

 MAINTAINERS                  |  14 +-
 accel/hvf/entitlements.plist |   8 +
 accel/hvf/hvf-all.c          |  56 ++++
 accel/hvf/hvf-cpus.c         | 483 ++++++++++++++++++++++++++++
 accel/hvf/meson.build        |   7 +
 accel/meson.build            |   1 +
 include/hw/core/cpu.h        |   3 +-
 include/sysemu/hvf_int.h     |  78 +++++
 meson.build                  |  41 ++-
 scripts/entitlement.sh       |  13 +
 target/arm/arm-powerctl.c    |   1 +
 target/arm/cpu.c             |   6 +
 target/arm/hvf/hvf.c         | 603 +++++++++++++++++++++++++++++++++++
 target/arm/hvf/meson.build   |   3 +
 target/arm/meson.build       |   2 +
 target/i386/hvf/hvf-cpus.c   | 131 --------
 target/i386/hvf/hvf-cpus.h   |  25 --
 target/i386/hvf/hvf-i386.h   |  48 +--
 target/i386/hvf/hvf.c        | 462 ++++-----------------------
 target/i386/hvf/meson.build  |   1 -
 target/i386/hvf/vmx.h        |  24 +-
 target/i386/hvf/x86.c        |  28 +-
 target/i386/hvf/x86_descr.c  |  26 +-
 target/i386/hvf/x86_emu.c    |  62 ++--
 target/i386/hvf/x86_mmu.c    |   4 +-
 target/i386/hvf/x86_task.c   |  12 +-
 target/i386/hvf/x86hvf.c     | 221 ++++++-------
 target/i386/hvf/x86hvf.h     |   2 -
 28 files changed, 1557 insertions(+), 808 deletions(-)
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

