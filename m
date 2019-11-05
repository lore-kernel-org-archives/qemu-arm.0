Received: by 2002:adf:db01:0:0:0:0:0 with SMTP id s1csp454135wri;
        Tue, 5 Nov 2019 01:13:18 -0800 (PST)
X-Google-Smtp-Source: APXvYqwZWo65ZIugOa94y1vWRsCORZxyGAjdx/KIReUsP+OOUFNBWa3CnZHUYGeuoXZPCQhUwVLy
X-Received: by 2002:a37:a211:: with SMTP id l17mr16944071qke.139.1572945198326;
        Tue, 05 Nov 2019 01:13:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1572945198; cv=none;
        d=google.com; s=arc-20160816;
        b=b5kK5OO3xw+wtaKusQrf24AujdamKO4QfWji8qpjxO5YLNbKoOcUrNJZO/vtRBMC5q
         XP9bIbvdOFjkzEQ9zwuyghxyFrxxdLDqRHz9DxYb5ylchrf//gMsW2bJrOSnTdhkwpPq
         SkREPOTRNfB0XG2hKquVlxIFGw6Wi+qG3Zl4Y2iHPJLdegq+Zqb0C7eyzaZF0xcmlRM/
         HoQBSVoN0NAkQz6mjNnFM+d67YgMMAgzLXBErWJ/gpHRz2jf1oQCbNh/V7uhcWYfHPwU
         hw3191P3ekgDzerH4a+Wjbey8bXTaNmGEzSJeMzq1Ap3ae5w7ZavXN4JXBrVmcIOfqwK
         ypQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=AEXDeov55h67WYI4VlIFoABMpWw6fdKIYh3yWFI6CKM=;
        b=ayZJlq+RXdC0qeNVC4Oz0Wr8EBUTwx7Nrqo6GLdlAFmDcmxOWUc2A0Xb59SaiuCkZK
         h6MW/nSQlEypNjZlKntqeOnlAf2yxh++o3T1kkW2JlXZqNvpCr86z9B1NdrEXhjNo5zV
         XHYbK0ml9Zprgof2o+2FQj7S+sMt2rGA/Pib8p2CTIUM/PyZVAMNzhGyqyz4WxJhxHMU
         i10h57cmxvPbUp1MCpzVM70w9JY3FWHaOyEp+WUg3YaZjaHTOo78luvlRtRdbpZphtXf
         be8Ksn1vJqm8V59He2YnF7fvPfYWx22k1ON8TWUxHqCkPiinalsNaYBu9Kyj2yDmouZz
         Rqwg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e125si3798490qkd.120.2019.11.05.01.13.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Nov 2019 01:13:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iRutp-0005wW-DI
	for alex.bennee@linaro.org; Tue, 05 Nov 2019 04:13:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42949)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <guoheyi@huawei.com>) id 1iRusu-00051L-Rk
 for qemu-arm@nongnu.org; Tue, 05 Nov 2019 04:12:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <guoheyi@huawei.com>) id 1iRust-0007jq-At
 for qemu-arm@nongnu.org; Tue, 05 Nov 2019 04:12:20 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2189 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <guoheyi@huawei.com>)
 id 1iRuss-0007et-V5; Tue, 05 Nov 2019 04:12:19 -0500
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 3B6A5595E2CDC4A9135E;
 Tue,  5 Nov 2019 17:12:08 +0800 (CST)
Received: from linux-OtBuvb.huawei.com (10.175.104.212) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.439.0; Tue, 5 Nov 2019 17:12:01 +0800
From: Heyi Guo <guoheyi@huawei.com>
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [RFC v2 00/14] Add SDEI support for arm64
Date: Tue, 5 Nov 2019 17:10:42 +0800
Message-ID: <20191105091056.9541-1-guoheyi@huawei.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.104.212]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.190
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Marc Zyngier <marc.zyngier@arm.com>,
 Cornelia Huck <cohuck@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, James Morse <james.morse@arm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Heyi Guo <guoheyi@huawei.com>,
 wanghaibin.wang@huawei.com, Dave Martin <Dave.Martin@arm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mNPwcind4tcB

SDEI is for ARM "Software Delegated Exception Interface". AS ARM64 doesn'=
t have
native non-maskable interrupt (NMI), we rely on higher privileged (larger
exception level) software to change the execution flow of lower privilege=
d
(smaller exception level) software when certain events occur, to emulate =
NMI
mechanism, and SDEI is the standard interfaces between the two levels of
privileged software. It is based on SMC/HVC calls.

The higher privileged software implements an SDEI dispatcher to handle SD=
EI
related SMC/HVC calls and trigger SDEI events; the lower privileged softw=
are
implements an SDEI client to request SDEI services and handle SDEI events=
.

Core interfaces provided by SDEI include:

1. interrupt bind: client can request to bind an interrupt to an SDEI eve=
nt, so
the interrupt will be a non-maskable event and the event number will be r=
eturned
to the caller. Only PPI and SPI can be bound to SDEI events.

2. register: client can request to register a handler to an SDEI event, s=
o
dispatcher will change PC of lower privileged software to this handler wh=
en
certain event occurs.

3. complete: client notifies dispatcher that it has completed the event
handling, so dispatcher will restore the context of guest when it is
interrupted.=20

In virtualization situation, guest OS is the lower privileged software an=
d
hypervisor is the higher one.

KVM is supposed to pass SMC/HVC calls to qemu, and qemu will emulate an S=
DEI
dispatcher to serve the SDEI requests and trigger the events. If an inter=
rupt is
requested to be bound to an event, qemu should not inject the interrupt t=
o guest
any more; instead, it should save the context of VCPU and change the PC t=
o event
handler which is registered by guest, and then return to guest.

To make the conversion of interrupt to SDEI event transparent to other mo=
dules
in qemu, we used qemu_irq and qemu_irq_intercept_in() to override the def=
ault
irq handler with SDEI event trigger. I saw qemu_irq_intercept_in() should=
 be
only used in qemu MST, but it seemed fit to override interrupt injection =
with
event trigger after guest requests to bind interrupt to SDEI event.=20

This patchset is trying to implement the whole SDEI framework in qemu wit=
h KVM
enabled, including all SDEI v1.0 interfaces, as well as event trigger con=
duit
from other qemu devices after interrupt binding.=20

Key points:
- We propose to only support kvm enabled arm64 virtual machines, for
  non-kvm VMs can emulate EL3 and have Trusted Firmware run on it,
  which has a builtin SDEI dispatcher.
- New kvm capability KVM_CAP_FORWARD_HYPERCALL is added to probe if
  kvm supports forwarding hypercalls, and the capability should be
  enabled explicitly.
- We make the dispatcher as a logical device, to save the states
  during migration or save/restore operation; only one instance is
  allowed in one VM.
- We use qemu_irq as the bridge for other qemu modules to switch from
  irq injection to SDEI event trigger after VM binds the interrupt to
  SDEI event. We use qemu_irq_intercept_in() to override qemu_irq
  handler with SDEI event trigger, and a new interface
  qemu_irq_remove_intercept() is added to restore the handler to
  default one (i.e. ARM GIC).

More details are in the commit message of each patch.

Basic tests are done by emulating a watchdog timer and triggering SDEI
event in every 10s.

Please focus on the interfaces and framework first. We can refine the cod=
e for
several rounds after the big things have been determined.

Any comment or suggestion is welcome.

Thanks,

HG

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Dave Martin <Dave.Martin@arm.com>
Cc: Marc Zyngier <marc.zyngier@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: James Morse <james.morse@arm.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Cornelia Huck <cohuck@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
Cc: Igor Mammedov <imammedo@redhat.com>

v2:
- Import import linux/arm_sdei.h to standard-headers
- Drop SDEI table definition and add comments
- Some bugfix and code refinement

Heyi Guo (14):
  update-linux-headers.sh: import linux/arm_sdei.h to standard-headers
  standard-headers: import arm_sdei.h
  arm/sdei: add virtual device framework
  arm: add CONFIG_SDEI build flag
  arm/sdei: add support to handle SDEI requests from guest
  arm/sdei: add system reset callback
  arm/sdei: add support to trigger event by GIC interrupt ID
  core/irq: add qemu_irq_remove_intercept interface
  arm/sdei: override qemu_irq handler when binding interrupt
  arm/sdei: add support to register interrupt bind notifier
  linux-headers/kvm.h: add capability to forward hypercall
  arm/sdei: add stub to fix build failure when SDEI is not enabled
  arm/kvm: handle guest exit of hypercall
  virt/acpi: add SDEI table if SDEI is enabled

 default-configs/arm-softmmu.mak           |    1 +
 hw/arm/Kconfig                            |    4 +
 hw/arm/virt-acpi-build.c                  |   26 +
 hw/core/irq.c                             |   11 +
 include/hw/irq.h                          |    8 +-
 include/standard-headers/linux/arm_sdei.h |   73 +
 linux-headers/linux/kvm.h                 |    1 +
 scripts/update-linux-headers.sh           |    1 +
 target/arm/Makefile.objs                  |    4 +
 target/arm/kvm.c                          |   17 +
 target/arm/sdei-stub.c                    |   49 +
 target/arm/sdei.c                         | 1576 +++++++++++++++++++++
 target/arm/sdei.h                         |   60 +
 target/arm/sdei_int.h                     |  121 ++
 14 files changed, 1950 insertions(+), 2 deletions(-)
 create mode 100644 include/standard-headers/linux/arm_sdei.h
 create mode 100644 target/arm/sdei-stub.c
 create mode 100644 target/arm/sdei.c
 create mode 100644 target/arm/sdei.h
 create mode 100644 target/arm/sdei_int.h

--=20
2.19.1

