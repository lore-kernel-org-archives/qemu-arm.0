Received: by 10.25.150.194 with SMTP id y185csp1026722lfd;
        Mon, 14 Nov 2016 06:32:11 -0800 (PST)
X-Received: by 10.99.185.78 with SMTP id v14mr23581976pgo.179.1479133931679;
        Mon, 14 Nov 2016 06:32:11 -0800 (PST)
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id hv11si8498399pac.203.2016.11.14.06.32.11;
        Mon, 14 Nov 2016 06:32:11 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752190AbcKNOcJ (ORCPT <rfc822;xinliang.liu@linaro.org>
        + 7 others); Mon, 14 Nov 2016 09:32:09 -0500
Received: from mx2.suse.de ([195.135.220.15]:57071 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751443AbcKNOcI (ORCPT <rfc822;kvm@vger.kernel.org>);
        Mon, 14 Nov 2016 09:32:08 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay1.suse.de (charybdis-ext.suse.de [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id CA700AAD1;
        Mon, 14 Nov 2016 14:32:06 +0000 (UTC)
From:   Alexander Graf <agraf@suse.de>
To:     QEMU Developers <qemu-devel@nongnu.org>
Cc:     Peter Maydell <peter.maydell@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        kvm-devel <kvm@vger.kernel.org>, qemu-arm <qemu-arm@nongnu.org>
Subject: [PATCH RFC v2 0/2] Enable cp15 timers with user space gic & kvm
Date:   Mon, 14 Nov 2016 15:32:13 +0100
Message-Id: <1479133935-63848-1-git-send-email-agraf@suse.de>
X-Mailer: git-send-email 1.8.5.6
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: 1TbXajguVPEM

When running with KVM enabled, you can choose between emulating the
gic in kernel or user space. If the kernel supports in-kernel virtualization
of the interrupt controller, it will default to that. If not, if will
default to user space emulation.

Unfortunately when running in user mode gic emulation, we miss out on
timer events which are only available from kernel space.

This patch set leverages the new kernel/user space pending line synchronization
for those timer events.

rfc1 -> rfc2:

  - use local variable for ARM_CPU
  - remove bear trap
  - move timer warning to gic device

Alexander Graf (2):
  linux-headers: update
  ARM: KVM: Enable in-kernel timers with user space gic

 hw/intc/arm_gic.c             |  7 +++++++
 include/sysemu/kvm.h          | 11 +++++++++++
 kvm-all.c                     |  5 +++++
 kvm-stub.c                    |  5 +++++
 linux-headers/asm-arm/kvm.h   |  1 +
 linux-headers/asm-arm64/kvm.h |  1 +
 linux-headers/linux/kvm.h     |  6 ++++++
 target-arm/cpu.h              |  3 +++
 target-arm/kvm.c              | 20 ++++++++++++++++++++
 9 files changed, 59 insertions(+)

-- 
1.8.5.6

