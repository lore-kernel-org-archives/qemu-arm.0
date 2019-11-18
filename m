Received: by 2002:a05:6512:48d:0:0:0:0 with SMTP id v13csp2481534lfq;
        Sun, 17 Nov 2019 22:55:46 -0800 (PST)
X-Google-Smtp-Source: APXvYqwfFvvN9kafckBjIT50FborzA0H22vO7zpiXZXnTKI0YWGkJ+zWAcJL97sSk3dPoGspqBQR
X-Received: by 2002:ac8:3358:: with SMTP id u24mr25748122qta.63.1574060146444;
        Sun, 17 Nov 2019 22:55:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574060146; cv=none;
        d=google.com; s=arc-20160816;
        b=sEGxlsJtpgRIkdMx6T/ULAZzgHnPUs563DqD6cyopReuscLq+u7jnk+HkUWKMkMpVp
         6cWjOYfP7ACj+sUnPnYx2+TciVt1f5Z0nCkNAh24W3gL5NGYoiVPLUmAbI6f0jQCVpsq
         jE70JRADYYiwz6Ob8Md/FQ7SdNHZ9ZO6kCGEpznE1b3m6JhDWdAAalx8Lsl9wt004bkV
         3G+j7lZ18BiIsuajSrl1jRZ2FNv/yNaFBMhanpn7JoEQbBByKLNN/wyX9CNqtxCnbec+
         VFUztXqb15/bnKuUtOzRDQyFOAIouMSzKZG4LmeKQs/jA6JjH6ihIY9sFBFYQXCEMA2r
         1J2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :to:subject;
        bh=xrElkY9FhGU8wXd5/HvARPwOx+iaOQHKWl0X7/HKFfk=;
        b=ILY44nIjwyDUgHsrwmKz++4EoWxEgq41JpDbK/1IbUIGrdL4A+NhB9aGNFCi+n8Pbu
         2k8wje4MuIFtImOOVGl0et5UhnAXt8leE1x4ow8XHkjVQrLSfLNYTmqM/0jL9W1kSjqd
         BB48VPGHNPjK8TejzoX3o2+7eY6BU+L8JKZuc2pMCUdW9g3FKvgYDGk/yOo9AXUl+YMk
         NAtKuvC+Ybz7EWMZCPm1MYJ4OKoXUo47rqt8MJyRUrcIqvH9rD0P5SROAkD2geJ7ficq
         jHOs3vbp88NM3dF9vfMMKorUjwkXMPt7nRGLDdwlFpsQFxt0MIxMN0BZrvXzekbOtXwD
         DcTg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g34si11165760qtg.293.2019.11.17.22.55.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 17 Nov 2019 22:55:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iWawr-00051h-Rh
	for alex.bennee@linaro.org; Mon, 18 Nov 2019 01:55:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39884)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <guoheyi@huawei.com>) id 1iWawj-00051P-Bp
 for qemu-arm@nongnu.org; Mon, 18 Nov 2019 01:55:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <guoheyi@huawei.com>) id 1iWawh-0001RV-Ln
 for qemu-arm@nongnu.org; Mon, 18 Nov 2019 01:55:37 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:36528 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <guoheyi@huawei.com>)
 id 1iWawh-0001Or-AU; Mon, 18 Nov 2019 01:55:35 -0500
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id C2AAD672B27508F4C875;
 Mon, 18 Nov 2019 14:55:29 +0800 (CST)
Received: from [127.0.0.1] (10.133.216.73) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.439.0; Mon, 18 Nov 2019
 14:55:21 +0800
Subject: Re: [RFC v2 00/14] Add SDEI support for arm64
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>, Peter Maydell
 <peter.maydell@linaro.org>
References: <20191105091056.9541-1-guoheyi@huawei.com>
From: Guoheyi <guoheyi@huawei.com>
Message-ID: <9d7a2c5d-df78-ef67-87af-3860fcb7aee8@huawei.com>
Date: Mon, 18 Nov 2019 14:55:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20191105091056.9541-1-guoheyi@huawei.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.133.216.73]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.32
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
Cc: Mark Rutland <mark.rutland@arm.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marc Zyngier <marc.zyngier@arm.com>, Cornelia Huck <cohuck@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Igor Mammedov <imammedo@redhat.com>,
 James Morse <james.morse@arm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 wanghaibin.wang@huawei.com, Dave Martin <Dave.Martin@arm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Lyom2Pre0pMv

Hi Peter,

Could you spare some time to review the framework and provide comments 
and advice?

Thanks,

HG


On 2019/11/5 17:10, Heyi Guo wrote:
> SDEI is for ARM "Software Delegated Exception Interface". AS ARM64 doesn't have
> native non-maskable interrupt (NMI), we rely on higher privileged (larger
> exception level) software to change the execution flow of lower privileged
> (smaller exception level) software when certain events occur, to emulate NMI
> mechanism, and SDEI is the standard interfaces between the two levels of
> privileged software. It is based on SMC/HVC calls.
>
> The higher privileged software implements an SDEI dispatcher to handle SDEI
> related SMC/HVC calls and trigger SDEI events; the lower privileged software
> implements an SDEI client to request SDEI services and handle SDEI events.
>
> Core interfaces provided by SDEI include:
>
> 1. interrupt bind: client can request to bind an interrupt to an SDEI event, so
> the interrupt will be a non-maskable event and the event number will be returned
> to the caller. Only PPI and SPI can be bound to SDEI events.
>
> 2. register: client can request to register a handler to an SDEI event, so
> dispatcher will change PC of lower privileged software to this handler when
> certain event occurs.
>
> 3. complete: client notifies dispatcher that it has completed the event
> handling, so dispatcher will restore the context of guest when it is
> interrupted.
>
> In virtualization situation, guest OS is the lower privileged software and
> hypervisor is the higher one.
>
> KVM is supposed to pass SMC/HVC calls to qemu, and qemu will emulate an SDEI
> dispatcher to serve the SDEI requests and trigger the events. If an interrupt is
> requested to be bound to an event, qemu should not inject the interrupt to guest
> any more; instead, it should save the context of VCPU and change the PC to event
> handler which is registered by guest, and then return to guest.
>
> To make the conversion of interrupt to SDEI event transparent to other modules
> in qemu, we used qemu_irq and qemu_irq_intercept_in() to override the default
> irq handler with SDEI event trigger. I saw qemu_irq_intercept_in() should be
> only used in qemu MST, but it seemed fit to override interrupt injection with
> event trigger after guest requests to bind interrupt to SDEI event.
>
> This patchset is trying to implement the whole SDEI framework in qemu with KVM
> enabled, including all SDEI v1.0 interfaces, as well as event trigger conduit
> from other qemu devices after interrupt binding.
>
> Key points:
> - We propose to only support kvm enabled arm64 virtual machines, for
>    non-kvm VMs can emulate EL3 and have Trusted Firmware run on it,
>    which has a builtin SDEI dispatcher.
> - New kvm capability KVM_CAP_FORWARD_HYPERCALL is added to probe if
>    kvm supports forwarding hypercalls, and the capability should be
>    enabled explicitly.
> - We make the dispatcher as a logical device, to save the states
>    during migration or save/restore operation; only one instance is
>    allowed in one VM.
> - We use qemu_irq as the bridge for other qemu modules to switch from
>    irq injection to SDEI event trigger after VM binds the interrupt to
>    SDEI event. We use qemu_irq_intercept_in() to override qemu_irq
>    handler with SDEI event trigger, and a new interface
>    qemu_irq_remove_intercept() is added to restore the handler to
>    default one (i.e. ARM GIC).
>
> More details are in the commit message of each patch.
>
> Basic tests are done by emulating a watchdog timer and triggering SDEI
> event in every 10s.
>
> Please focus on the interfaces and framework first. We can refine the code for
> several rounds after the big things have been determined.
>
> Any comment or suggestion is welcome.
>
> Thanks,
>
> HG
>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Dave Martin <Dave.Martin@arm.com>
> Cc: Marc Zyngier <marc.zyngier@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: James Morse <james.morse@arm.com>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Cornelia Huck <cohuck@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
>
> v2:
> - Import import linux/arm_sdei.h to standard-headers
> - Drop SDEI table definition and add comments
> - Some bugfix and code refinement
>
> Heyi Guo (14):
>    update-linux-headers.sh: import linux/arm_sdei.h to standard-headers
>    standard-headers: import arm_sdei.h
>    arm/sdei: add virtual device framework
>    arm: add CONFIG_SDEI build flag
>    arm/sdei: add support to handle SDEI requests from guest
>    arm/sdei: add system reset callback
>    arm/sdei: add support to trigger event by GIC interrupt ID
>    core/irq: add qemu_irq_remove_intercept interface
>    arm/sdei: override qemu_irq handler when binding interrupt
>    arm/sdei: add support to register interrupt bind notifier
>    linux-headers/kvm.h: add capability to forward hypercall
>    arm/sdei: add stub to fix build failure when SDEI is not enabled
>    arm/kvm: handle guest exit of hypercall
>    virt/acpi: add SDEI table if SDEI is enabled
>
>   default-configs/arm-softmmu.mak           |    1 +
>   hw/arm/Kconfig                            |    4 +
>   hw/arm/virt-acpi-build.c                  |   26 +
>   hw/core/irq.c                             |   11 +
>   include/hw/irq.h                          |    8 +-
>   include/standard-headers/linux/arm_sdei.h |   73 +
>   linux-headers/linux/kvm.h                 |    1 +
>   scripts/update-linux-headers.sh           |    1 +
>   target/arm/Makefile.objs                  |    4 +
>   target/arm/kvm.c                          |   17 +
>   target/arm/sdei-stub.c                    |   49 +
>   target/arm/sdei.c                         | 1576 +++++++++++++++++++++
>   target/arm/sdei.h                         |   60 +
>   target/arm/sdei_int.h                     |  121 ++
>   14 files changed, 1950 insertions(+), 2 deletions(-)
>   create mode 100644 include/standard-headers/linux/arm_sdei.h
>   create mode 100644 target/arm/sdei-stub.c
>   create mode 100644 target/arm/sdei.c
>   create mode 100644 target/arm/sdei.h
>   create mode 100644 target/arm/sdei_int.h
>


