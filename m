Received: by 2002:a17:504:3c0d:b0:1be9:327d:8ee3 with SMTP id y13csp471008nji;
        Tue, 15 Oct 2024 23:00:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVhxJW1pG0/x52e8gY2rvemGLFht+H3TYYPGC+MCeH91UYqZ9ak9CexVF8lRTEwOFH5lXizzmE73r42Vw==@linaro.org
X-Google-Smtp-Source: AGHT+IGi/7J2hQoNQJ0KtCNhlYLwfOOmMc0/8Ule2p7NnRj1RQu5ttySKXBJ5GE3yIL65GDEed5e
X-Received: by 2002:a05:6602:3c8:b0:832:480d:6fe1 with SMTP id ca18e2360f4ac-83a942f964dmr320492539f.0.1729058444605;
        Tue, 15 Oct 2024 23:00:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729058444; cv=none;
        d=google.com; s=arc-20240605;
        b=dAbgDNGZYUd2LFxI+uYf/Tzu2KoJ5YeIU1wPGzx0ZvxH5vyqxUN9JXDMP1cQdwZVCD
         KK6ALGrJ+YBqUZQKBWgVJPB+SDGmTt3qx4Fosifg3nbCMryy3TgnMbjipWFFhI+PxHCg
         5PZPk5n2c/4MATyjdJN7lCvZZ+E7OyZnR+4G1y/+Ev8uFuCyZY+uh6rqSbpKfdPWnSBz
         E6pXfOIpSuxsLcOYyqQzB9n/qXxlvz0JAupc6Xvn3xbDAk7YeySRboM3Z5+CtQqADia7
         dELPmQhyGpNM0o6eMSYE8EfHBVaE6HirJBYYalel7ljNCNvu9MM9X8rbPoOBvbsIbDzN
         aH7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=eDO7DzGD/qTbB7QzlfJ/BnoiMDqTDgrPIlANkqvvd/c=;
        fh=cQUxCuXA6U241L7Ss+ItWhoEUX4xnNYUR2Sbsh/stek=;
        b=U/Co3BcB3iVtfzx3mJ9+4DIYD+byFrUh/aEJsQVHDrYgyjgZyLS1WcNKJnh08t4BK3
         WEfnWax/LhFhzk75lcIvWsrCjrAcOH7OyLWXjwsErnoQGJ52xptOXUKyuctgMeQGiRuO
         V7+30r/idm4jjGKeOg/orG9GqsTX+XS1q566EWT2OcSAKSqmn5FjTgXQNDVGluVpn0a7
         haGkmadhD4IZo4O1yaLyweY5Yutnvjvwag3gHLkpdxJ15kdNnLW5TY8dOtDuLh/UzENt
         u18x+ha5zw4Nui629fZ9bGcuJFaQ/4bf2oSAhgzharILyJtoG5WoMH4Gmcmy/12cfNWV
         94Ow==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of maobibo@loongson.cn designates 114.242.206.163 as permitted sender) smtp.mailfrom=maobibo@loongson.cn
Return-Path: <maobibo@loongson.cn>
Received: from mail.loongson.cn (mail.loongson.cn. [114.242.206.163])
        by mx.google.com with ESMTP id 8926c6da1cb9f-4dbecb3819esi1573038173.18.2024.10.15.23.00.40;
        Tue, 15 Oct 2024 23:00:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of maobibo@loongson.cn designates 114.242.206.163 as permitted sender) client-ip=114.242.206.163;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of maobibo@loongson.cn designates 114.242.206.163 as permitted sender) smtp.mailfrom=maobibo@loongson.cn
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8AxjmuFVg9ncYIfAA--.45329S3;
	Wed, 16 Oct 2024 14:00:37 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front1 (Coremail) with SMTP id qMiowMAx_9V7Vg9njjwsAA--.28300S3;
	Wed, 16 Oct 2024 14:00:27 +0800 (CST)
Subject: Re: [PATCH V1 0/4] Arch agnostic ACPI changes to support vCPU Hotplug
 (on Archs like ARM)
To: Salil Mehta <salil.mehta@huawei.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "mst@redhat.com"
 <mst@redhat.com>
Cc: "maz@kernel.org" <maz@kernel.org>,
 "jean-philippe@linaro.org" <jean-philippe@linaro.org>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "imammedo@redhat.com" <imammedo@redhat.com>,
 "andrew.jones@linux.dev" <andrew.jones@linux.dev>,
 "david@redhat.com" <david@redhat.com>, "philmd@linaro.org"
 <philmd@linaro.org>, "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "will@kernel.org" <will@kernel.org>, "ardb@kernel.org" <ardb@kernel.org>,
 "oliver.upton@linux.dev" <oliver.upton@linux.dev>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "gshan@redhat.com" <gshan@redhat.com>, "rafael@kernel.org"
 <rafael@kernel.org>, "borntraeger@linux.ibm.com"
 <borntraeger@linux.ibm.com>, "alex.bennee@linaro.org"
 <alex.bennee@linaro.org>, "npiggin@gmail.com" <npiggin@gmail.com>,
 "harshpb@linux.ibm.com" <harshpb@linux.ibm.com>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 "darren@os.amperecomputing.com" <darren@os.amperecomputing.com>,
 "ilkka@os.amperecomputing.com" <ilkka@os.amperecomputing.com>,
 "vishnu@os.amperecomputing.com" <vishnu@os.amperecomputing.com>,
 "karl.heubaum@oracle.com" <karl.heubaum@oracle.com>,
 "miguel.luis@oracle.com" <miguel.luis@oracle.com>,
 "salil.mehta@opnsrc.net" <salil.mehta@opnsrc.net>,
 zhukeqian <zhukeqian1@huawei.com>,
 "wangxiongfeng (C)" <wangxiongfeng2@huawei.com>,
 "wangyanan (Y)" <wangyanan55@huawei.com>,
 "jiakernel2@gmail.com" <jiakernel2@gmail.com>,
 "lixianglai@loongson.cn" <lixianglai@loongson.cn>,
 "shahuang@redhat.com" <shahuang@redhat.com>,
 "zhao1.liu@intel.com" <zhao1.liu@intel.com>, Linuxarm <linuxarm@huawei.com>,
 "gustavo.romero@linaro.org" <gustavo.romero@linaro.org>
References: <20241014192205.253479-1-salil.mehta@huawei.com>
 <3b0b1033-36eb-6180-1363-f76083a32ce0@loongson.cn>
 <a00e18f4324b40a0b54de4bfbc6d67c2@huawei.com>
From: maobibo <maobibo@loongson.cn>
Message-ID: <78882f54-8efe-024f-f328-43a2b3ba4d91@loongson.cn>
Date: Wed, 16 Oct 2024 14:00:08 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <a00e18f4324b40a0b54de4bfbc6d67c2@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMAx_9V7Vg9njjwsAA--.28300S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoW3Jw48Cr45GFW5ZF1rAry3WrX_yoW7uF18pF
	WIka1YgrWDJr1fAa1Sqr13ur1Y93yrGrWUXrnxCr1xu3Z0yF1vyF18Kr45uFy3Zr97KF17
	ZF1Yv347u34rAFXCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Pc02F40EFcxC0VAKzVAqx4xG6I80ewCIccxYrVCIc48FwI0_Gr0_XrUv
	73VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUO37kC6x804xWl14x267AKxVW8JVW5Jw
	AFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUXVWUAwA2ocxC64kI
	II0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7
	xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28E
	F7xvwVC2z280aVCY1x0267AKxVW8JVW8Jr1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07
	x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xf
	McIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7
	v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzVAYIcxG8wCY1x0262kKe7AKxVWU
	tVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxV
	WUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF
	67kF1VAFwI0_Wrv_Gr1UMIIYY7kG6IIYr7AKxVW8JVW5JwCIc40Y0x0EwIxGrwCI42IY6x
	IIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAI
	w20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x
	0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU84mh5UUUUU==
X-TUID: TDVSekCOQvcC



On 2024/10/15 下午10:31, Salil Mehta wrote:
> HI Bibo,
> 
>>   From: maobibo <maobibo@loongson.cn>
>>   Sent: Tuesday, October 15, 2024 4:31 AM
>>   To: Salil Mehta <salil.mehta@huawei.com>; qemu-devel@nongnu.org;
>>   qemu-arm@nongnu.org; mst@redhat.com
>>   
>>   With cpu-add/cpu-del command tested on LoongArch system, no migration
>>   tested. There is no negative influence with LoongArch cpu hotplug.
> 
> Thanks for the confirmation.
> 
> Just curious are guys still using cpu-{add,del} interface for vCPU hotplug?
> I thought it was deprecated for device_{add,del}?
I use the device_add/del hmp command, such as
   # device_add 
la464-loongarch-cpu,socket-id=0,core-id=1,thread-id=0,id=cpu-1
   # device_del cpu-1

Tested-by: Bibo Mao <maobibo@loongson.cn>

Regards
Bibo Mao
> 
> https://wiki.qemu.org/Features/CPUHotplug
> https://www.qemu.org/docs/master/system/cpu-hotplug.html
> 
> 
> Thanks
> Salil.
> 
>>   
>>   Regards
>>   Bibo Mao
>>   
>>   On 2024/10/15 上午3:22, Salil Mehta via wrote:
>>   > Certain CPU architecture specifications [1][2][3] prohibit changes to
>>   > the CPUs
>>   > *presence* after the kernel has booted. This is because many system
>>   > initializations depend on the exact CPU count at boot time and do not
>>   > expect it to change afterward. For example, components like interrupt
>>   > controllers that are closely coupled with CPUs, or various per-CPU
>>   > features, may not support configuration changes once the kernel has
>>   been initialized.
>>   >
>>   > This requirement poses a challenge for virtualization features like
>>   > vCPU hotplug. To address this, changes to the ACPI AML are necessary
>>   > to update the `_STA.PRES` (presence) and `_STA.ENA` (enabled) bits
>>   > accordingly during guest initialization, as well as when vCPUs are
>>   > hot-plugged or hot-unplugged. The presence of unplugged vCPUs may
>>   need
>>   > to be deliberately *simulated* at the ACPI level to maintain a *persistent*
>>   view of vCPUs for the guest kernel.
>>   >
>>   > This patch set introduces the following features:
>>   >
>>   > 1. ACPI Interface with Explicit PRESENT and ENABLED CPU States: It allows
>>   the
>>   >     guest kernel to evaluate these states using the `_STA` ACPI method.
>>   >
>>   > 2. Initialization of ACPI CPU States: These states are initialized during
>>   >     `machvirt_init` and when vCPUs are hot-(un)plugged. This enables
>>   hotpluggable
>>   >     vCPUs to be exposed to the guest kernel via ACPI.
>>   >
>>   > 3. Support for Migrating ACPI CPU States: The patch set ensures the
>>   migration of
>>   >     the newly introduced `is_{present,enabled}` ACPI CPU states to the
>>   >     destination VM.
>>   >
>>   > The approach is flexible enough to accommodate ARM-like architectures
>>   > that intend to implement vCPU hotplug functionality. It is suitable
>>   > for architectures facing similar constraints to ARM or those that plan
>>   > to implement vCPU hotplugging independently of hardware support (if
>>   available).
>>   >
>>   > This patch set is derived from the ARM-specific vCPU hotplug
>>   > implementation [4] and includes migration components adaptable to
>>   > other architectures, following suggestions [5] made by Igor Mammedov
>>   <imammedo@redhat.com>.
>>   >
>>   > It can be applied independently, ensuring compatibility with existing
>>   > hotplug support in other architectures. I have tested this patch set
>>   > in conjunction with the ARM-specific vCPU hotplug changes (included in
>>   > the upcoming RFC V5 [6]), and everything worked as expected. I kindly
>>   > request maintainers of other architectures to provide a "Tested-by"
>>   > after running their respective regression tests.
>>   >
>>   > Many thanks!
>>   >
>>   >
>>   > References:
>>   > [1] KVMForum 2023 Presentation: Challenges Revisited in Supporting Virt
>>   CPU Hotplug on
>>   >      architectures that don’t Support CPU Hotplug (like ARM64)
>>   >      a. Kernel Link: https://kvm-forum.qemu.org/2023/KVM-forum-cpu-
>>   hotplug_7OJ1YyJ.pdf
>>   >      b. Qemu Link:
>>   > https://kvm-
>>   forum.qemu.org/2023/Challenges_Revisited_in_Supporting_Vir
>>   > t_CPU_Hotplug_-__ii0iNb3.pdf [2] KVMForum 2020 Presentation:
>>   > Challenges in Supporting Virtual CPU Hotplug on
>>   >      SoC Based Systems (like ARM64)
>>   >      Link: https://kvmforum2020.sched.com/event/eE4m
>>   > [3] Check comment 5 in the bugzilla entry
>>   >      Link: https://bugzilla.tianocore.org/show_bug.cgi?id=4481#c5
>>   > [4] [PATCH RFC V4 00/33] Support of Virtual CPU Hotplug for ARMv8 Arch
>>   >      Link:
>>   > https://lore.kernel.org/qemu-devel/20241009031815.250096-1-salil.mehta
>>   > @huawei.com/T/#mf32be203baa568a871dc625b732f666a4c4f1e68
>>   > [5] Architecture agnostic ACPI VMSD state migration (Discussion)
>>   >      Link:
>>   > https://lore.kernel.org/qemu-
>>   devel/20240715155436.577d34c5@imammedo.us
>>   > ers.ipa.redhat.com/ [6] Upcoming RFC V5, Support of Virtual CPU
>>   > Hotplug for ARMv8 Arch
>>   >      Link:
>>   > https://github.com/salil-mehta/qemu/commits/virt-cpuhp-armv8/rfc-v5
>>   >
>>   > Salil Mehta (4):
>>   >    hw/acpi: Initialize ACPI Hotplug CPU Status with Support for vCPU
>>   >      `Persistence`
>>   >    hw/acpi: Update ACPI CPU Status `is_{present, enabled}` during vCPU
>>   >      hot(un)plug
>>   >    hw/acpi: Reflect ACPI vCPU {present,enabled} states in ACPI
>>   >      _STA.{PRES,ENA} Bits
>>   >    hw/acpi: Populate vCPU Hotplug VMSD to migrate
>>   `is_{present,enabled}`
>>   >      states
>>   >
>>   >   cpu-target.c         patches.vcpuhp.rfc-v5.arch.agnostic.acpi          |  1 +
>>   >   hw/acpi/cpu.c                  | 70 +++++++++++++++++++++++++++++++---
>>   >   hw/acpi/generic_event_device.c | 11 ++++++
>>   >   include/hw/acpi/cpu.h          | 21 ++++++++++
>>   >   include/hw/core/cpu.h          | 21 ++++++++++
>>   >   5 files changed, 119 insertions(+), 5 deletions(-)
>>   >
> 
