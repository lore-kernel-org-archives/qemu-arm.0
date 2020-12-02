Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp1421785lfb;
        Wed, 2 Dec 2020 11:04:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzdfB1hgzexkH4pKiQ2/gYDiEMZFw81IzXsNkYctYtYr3LyAX7i/rJSK2wCqPso4ztSWOMY
X-Received: by 2002:a25:f204:: with SMTP id i4mr5599552ybe.304.1606935873365;
        Wed, 02 Dec 2020 11:04:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606935873; cv=none;
        d=google.com; s=arc-20160816;
        b=i3iz8gAcbeUVSOsyiuT8ra2outMfuHs13Z8z9f5+mxFItQkNroDbexhoMmiUshGGAC
         zIds/Rbd4omEMOMY/t19OvvsRlzw934oAgevTGNLvhyGDYQiHW8W1HmpwSDKS8yehQlk
         js8cL1SYiAwFC8k7gT5UQU1gGwk4gjzsR0Oouxpg7zX0AMlX6A2l0sVSImoFDiiNu3p/
         7jZQDz4a8OnddOFVavdeLdTiMuCVHWzNgz5oLJBHiyDSgkJmTXQwQv4H3nb2+INL4CCj
         B2tYsLENHhEEk3m/w9zTlSDRi/A6JdXjAbBQumJvWDgROSykatQ4cBZ3pFcAPj/O3f3j
         vIcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=XalknWf02/7FiZDcS6avKLnfNc2i3aTZwhWsESokxco=;
        b=rwtg2xILBzoskKISkA1vPnkZq/+UageIfrdfDdyD9/uvfvV+M13fieuO5WRIm48Gv6
         XeaBqUQp55iJOtszFLf213C/Lil4waYBfAuUI10XtPVORQFB5LfyxCPBVr0CkD/k4oTi
         DHsKlgb9/9urGRvytSOIzBCQ9mEkTrW5P0Q7/+9gEeJYbSu36fyTdH8IAeEz/zIXNojV
         bsLnLZSP65jO+9zeWDF8C2y405JZfA/54o1C+oqZb//tYJLvAnhUDtYRevaO0uAhypBB
         8mx6eUEFojsdPKL7/C5RiGnh7BDXdoZXumQFNnTCKrw7nq/uDjx+D1Co3ZweQ9U7no+0
         sXwA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m137si2611518ybf.467.2020.12.02.11.04.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Dec 2020 11:04:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kkXQW-00032I-Ks
	for alex.bennee@linaro.org; Wed, 02 Dec 2020 14:04:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1kkXQH-00031s-8L; Wed, 02 Dec 2020 14:04:17 -0500
Received: from mail.csgraf.de ([188.138.100.120]:56392
 helo=zulu616.server4you.de) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1kkXQD-0005Do-LJ; Wed, 02 Dec 2020 14:04:15 -0500
Received: from localhost.localdomain
 (dynamic-077-007-031-140.77.7.pool.telefonica.de [77.7.31.140])
 by csgraf.de (Postfix) with ESMTPSA id 39567390036D;
 Wed,  2 Dec 2020 20:04:10 +0100 (CET)
From: Alexander Graf <agraf@csgraf.de>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 00/10] hvf: Implement Apple Silicon Support
Date: Wed,  2 Dec 2020 20:03:58 +0100
Message-Id: <20201202190408.2041-1-agraf@csgraf.de>
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
X-TUID: XeU00tq8Jphh

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

Alexander Graf (9):
  hvf: Add hypervisor entitlement to output binaries
  hvf: Move common code out
  hvf: Introduce hvf vcpu struct
  arm: Set PSCI to 0.2 for HVF
  hvf: arm: Mark CPU as dirty on reset
  hvf: Add Apple Silicon support
  arm: Add Hypervisor.framework build target
  hvf: arm: Add support for GICv3
  hvf: arm: Implement -cpu host

Peter Collingbourne (1):
  arm/hvf: Add a WFI handler

 MAINTAINERS                  |  14 +-
 accel/hvf/entitlements.plist |   8 +
 accel/hvf/hvf-all.c          |  56 +++
 accel/hvf/hvf-cpus.c         | 481 ++++++++++++++++++++
 accel/hvf/meson.build        |   7 +
 accel/meson.build            |   1 +
 include/hw/core/cpu.h        |   3 +-
 include/sysemu/hvf.h         |   2 +
 include/sysemu/hvf_int.h     |  77 ++++
 meson.build                  |  41 +-
 scripts/entitlement.sh       |  13 +
 target/arm/arm-powerctl.c    |   1 +
 target/arm/cpu.c             |  15 +-
 target/arm/cpu.h             |   2 +
 target/arm/hvf/hvf.c         | 857 +++++++++++++++++++++++++++++++++++
 target/arm/hvf/meson.build   |   3 +
 target/arm/kvm_arm.h         |   2 -
 target/arm/meson.build       |   2 +
 target/i386/hvf/hvf-cpus.c   | 131 ------
 target/i386/hvf/hvf-cpus.h   |  25 -
 target/i386/hvf/hvf-i386.h   |  48 +-
 target/i386/hvf/hvf.c        | 462 +++----------------
 target/i386/hvf/meson.build  |   1 -
 target/i386/hvf/vmx.h        |  24 +-
 target/i386/hvf/x86.c        |  28 +-
 target/i386/hvf/x86_descr.c  |  26 +-
 target/i386/hvf/x86_emu.c    |  62 +--
 target/i386/hvf/x86_mmu.c    |   4 +-
 target/i386/hvf/x86_task.c   |  12 +-
 target/i386/hvf/x86hvf.c     | 221 ++++-----
 target/i386/hvf/x86hvf.h     |   2 -
 31 files changed, 1818 insertions(+), 813 deletions(-)
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

