Received: by 2002:a17:505:3501:b0:1be9:327d:8ee3 with SMTP id mc1csp2217062njb;
        Mon, 14 Oct 2024 20:31:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWh7Hb8/I/ZfI23+/woxnTI6cPIwAE4q/vy0HQzdB0sV3arvw0NEYc6goQvISu02ajVz82BIoRV7Asvww==@linaro.org
X-Google-Smtp-Source: AGHT+IFyPl2qM9aoRvchZ0anua9XuYkdx4IdaJlNo/F5vLnw5/G6jnfDMp2dqLC3259G//sIzJmb
X-Received: by 2002:a05:690c:7684:b0:6e3:2c7c:3739 with SMTP id 00721157ae682-6e3479c144fmr70646927b3.18.1728963075568;
        Mon, 14 Oct 2024 20:31:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728963075; cv=none;
        d=google.com; s=arc-20240605;
        b=Q8txf0GEQ5ZYZvwJFQbzZWNujROa5tuu08am7PuYW+ftN7eMdpWvKOiHMTNS2h8q8/
         K6po1AvHRDMsyJ2+4yACn5EDcv8d9o2eftVXBk51pRnfsqyoBAigyPRDSuUQSy17Iw7u
         DEeiDVSaZ8Y5jYbiFDmKHNz6lbBof+GbMpPHYJuG+vgp7RK36t2w0e8dv2Hzd0NcnRx+
         LdNl84qgZj1yUHHhSxiumlQ+qOBDPsN87qiXHx3+G0aHxjbkS7HDMquWXvdUGS5Q2XWV
         mHyiEa/L8oeiShCF5Cbwfft6tpKXbqYh105KexOrJaYTOdbS7VR0YCyYXMkF3X93rj29
         20EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=H4ET501x6ollKe2MyUu1nZBA0eZeMYDXyf+hK5cQBfk=;
        fh=qY+DLYss26WcVNq9IFyAgTctqmq4isjsl8aHNcuauI0=;
        b=NBRuj+fzZ/O3RLE4S02KdBEn58rTFD12q4d9anQZQ8s454SZKMecp4IGM5TtTnTnbm
         UQz83U/o4/1i0OHZS+AO4iU1PHb660Q4hqsKgqwKQpEXqZY2tMfrgsZlUjVZi08hRVHA
         VGKI2gXPa1xypmSlL5FGpSRMqNd2W06Hg6cHAPQJFzDnY5L431RmmUwKyHSnSTm71/8N
         aBotbuETyF+KiNnHPfupUEGk1iOvX082RI9lgRZX/k2HBfAIZTprsM0iDLjQFNN1tpBQ
         oWeN56jmVgN3VhBWThabmr5VQ154BO8s5TWWw8qjoGKrjCgCnjI7ZPRoR+4Orkju1mk4
         MyOg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of maobibo@loongson.cn designates 114.242.206.163 as permitted sender) smtp.mailfrom=maobibo@loongson.cn
Return-Path: <maobibo@loongson.cn>
Received: from mail.loongson.cn (mail.loongson.cn. [114.242.206.163])
        by mx.google.com with ESMTP id 00721157ae682-6e3c5d2ff4dsi3003807b3.336.2024.10.14.20.31.12;
        Mon, 14 Oct 2024 20:31:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of maobibo@loongson.cn designates 114.242.206.163 as permitted sender) client-ip=114.242.206.163;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of maobibo@loongson.cn designates 114.242.206.163 as permitted sender) smtp.mailfrom=maobibo@loongson.cn
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8Bxkuj14Q1nKJscAA--.41500S3;
	Tue, 15 Oct 2024 11:31:01 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front1 (Coremail) with SMTP id qMiowMBxXuTs4Q1nYVwqAA--.8786S3;
	Tue, 15 Oct 2024 11:30:53 +0800 (CST)
Subject: Re: [PATCH V1 0/4] Arch agnostic ACPI changes to support vCPU Hotplug
 (on Archs like ARM)
To: Salil Mehta <salil.mehta@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, mst@redhat.com
Cc: maz@kernel.org, jean-philippe@linaro.org, jonathan.cameron@huawei.com,
 lpieralisi@kernel.org, peter.maydell@linaro.org,
 richard.henderson@linaro.org, imammedo@redhat.com, andrew.jones@linux.dev,
 david@redhat.com, philmd@linaro.org, eric.auger@redhat.com, will@kernel.org,
 ardb@kernel.org, oliver.upton@linux.dev, pbonzini@redhat.com,
 gshan@redhat.com, rafael@kernel.org, borntraeger@linux.ibm.com,
 alex.bennee@linaro.org, npiggin@gmail.com, harshpb@linux.ibm.com,
 linux@armlinux.org.uk, darren@os.amperecomputing.com,
 ilkka@os.amperecomputing.com, vishnu@os.amperecomputing.com,
 karl.heubaum@oracle.com, miguel.luis@oracle.com, salil.mehta@opnsrc.net,
 zhukeqian1@huawei.com, wangxiongfeng2@huawei.com, wangyanan55@huawei.com,
 jiakernel2@gmail.com, lixianglai@loongson.cn, shahuang@redhat.com,
 zhao1.liu@intel.com, linuxarm@huawei.com, gustavo.romero@linaro.org
References: <20241014192205.253479-1-salil.mehta@huawei.com>
From: maobibo <maobibo@loongson.cn>
Message-ID: <3b0b1033-36eb-6180-1363-f76083a32ce0@loongson.cn>
Date: Tue, 15 Oct 2024 11:30:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20241014192205.253479-1-salil.mehta@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMBxXuTs4Q1nYVwqAA--.8786S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoWxWryxur1DWrW3ZF43WF48uFX_yoWrtFyrpF
	WIka1FqrWDtr1xGw4ftwnxWw1Y9a4rGF43Grn3ur18u3Z8tF1vyF1Skr4UXF13AF9a9F1x
	ZFn0vr1Uu34DZFXCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUPab4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
	xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r12
	6r1DMcIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr4
	1lc7I2V7IY0VAS07AlzVAYIcxG8wCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxG
	rwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Wrv_Gr1UMIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWx
	JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUcsjjDU
	UUU
X-TUID: Emq7y9FiZ0/3

With cpu-add/cpu-del command tested on LoongArch system, no migration 
tested. There is no negative influence with LoongArch cpu hotplug.

Regards
Bibo Mao

On 2024/10/15 上午3:22, Salil Mehta via wrote:
> Certain CPU architecture specifications [1][2][3] prohibit changes to the CPUs
> *presence* after the kernel has booted. This is because many system
> initializations depend on the exact CPU count at boot time and do not expect it
> to change afterward. For example, components like interrupt controllers that are
> closely coupled with CPUs, or various per-CPU features, may not support
> configuration changes once the kernel has been initialized.
> 
> This requirement poses a challenge for virtualization features like vCPU
> hotplug. To address this, changes to the ACPI AML are necessary to update the
> `_STA.PRES` (presence) and `_STA.ENA` (enabled) bits accordingly during guest
> initialization, as well as when vCPUs are hot-plugged or hot-unplugged. The
> presence of unplugged vCPUs may need to be deliberately *simulated* at the ACPI
> level to maintain a *persistent* view of vCPUs for the guest kernel.
> 
> This patch set introduces the following features:
> 
> 1. ACPI Interface with Explicit PRESENT and ENABLED CPU States: It allows the
>     guest kernel to evaluate these states using the `_STA` ACPI method.
>     
> 2. Initialization of ACPI CPU States: These states are initialized during
>     `machvirt_init` and when vCPUs are hot-(un)plugged. This enables hotpluggable
>     vCPUs to be exposed to the guest kernel via ACPI.
> 
> 3. Support for Migrating ACPI CPU States: The patch set ensures the migration of
>     the newly introduced `is_{present,enabled}` ACPI CPU states to the
>     destination VM.
> 
> The approach is flexible enough to accommodate ARM-like architectures that
> intend to implement vCPU hotplug functionality. It is suitable for architectures
> facing similar constraints to ARM or those that plan to implement vCPU
> hotplugging independently of hardware support (if available).
> 
> This patch set is derived from the ARM-specific vCPU hotplug implementation [4]
> and includes migration components adaptable to other architectures, following
> suggestions [5] made by Igor Mammedov <imammedo@redhat.com>.
> 
> It can be applied independently, ensuring compatibility with existing hotplug
> support in other architectures. I have tested this patch set in conjunction with
> the ARM-specific vCPU hotplug changes (included in the upcoming RFC V5 [6]), and
> everything worked as expected. I kindly request maintainers of other
> architectures to provide a "Tested-by" after running their respective regression
> tests.
> 
> Many thanks!
> 
> 
> References:
> [1] KVMForum 2023 Presentation: Challenges Revisited in Supporting Virt CPU Hotplug on
>      architectures that don’t Support CPU Hotplug (like ARM64)
>      a. Kernel Link: https://kvm-forum.qemu.org/2023/KVM-forum-cpu-hotplug_7OJ1YyJ.pdf
>      b. Qemu Link:  https://kvm-forum.qemu.org/2023/Challenges_Revisited_in_Supporting_Virt_CPU_Hotplug_-__ii0iNb3.pdf
> [2] KVMForum 2020 Presentation: Challenges in Supporting Virtual CPU Hotplug on
>      SoC Based Systems (like ARM64)
>      Link: https://kvmforum2020.sched.com/event/eE4m
> [3] Check comment 5 in the bugzilla entry
>      Link: https://bugzilla.tianocore.org/show_bug.cgi?id=4481#c5
> [4] [PATCH RFC V4 00/33] Support of Virtual CPU Hotplug for ARMv8 Arch
>      Link: https://lore.kernel.org/qemu-devel/20241009031815.250096-1-salil.mehta@huawei.com/T/#mf32be203baa568a871dc625b732f666a4c4f1e68
> [5] Architecture agnostic ACPI VMSD state migration (Discussion)
>      Link: https://lore.kernel.org/qemu-devel/20240715155436.577d34c5@imammedo.users.ipa.redhat.com/
> [6] Upcoming RFC V5, Support of Virtual CPU Hotplug for ARMv8 Arch
>      Link: https://github.com/salil-mehta/qemu/commits/virt-cpuhp-armv8/rfc-v5
> 
> Salil Mehta (4):
>    hw/acpi: Initialize ACPI Hotplug CPU Status with Support for vCPU
>      `Persistence`
>    hw/acpi: Update ACPI CPU Status `is_{present, enabled}` during vCPU
>      hot(un)plug
>    hw/acpi: Reflect ACPI vCPU {present,enabled} states in ACPI
>      _STA.{PRES,ENA} Bits
>    hw/acpi: Populate vCPU Hotplug VMSD to migrate `is_{present,enabled}`
>      states
> 
>   cpu-target.c         patches.vcpuhp.rfc-v5.arch.agnostic.acpi          |  1 +
>   hw/acpi/cpu.c                  | 70 +++++++++++++++++++++++++++++++---
>   hw/acpi/generic_event_device.c | 11 ++++++
>   include/hw/acpi/cpu.h          | 21 ++++++++++
>   include/hw/core/cpu.h          | 21 ++++++++++
>   5 files changed, 119 insertions(+), 5 deletions(-)
> 
