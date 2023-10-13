Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp1244837ejc;
        Thu, 12 Oct 2023 20:58:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFv2weJB00RrUwm5AsKyMUzjrCr8zDC9cvTnlnvrsOfFfrMNeqMMJo+2DwNZMAPtIO+s5/e
X-Received: by 2002:a9d:62d4:0:b0:6be:ea3e:367 with SMTP id z20-20020a9d62d4000000b006beea3e0367mr26152527otk.23.1697169514766;
        Thu, 12 Oct 2023 20:58:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697169514; cv=none;
        d=google.com; s=arc-20160816;
        b=LvXrpSVH2IvD9YFCQwmgWGQxZLWw/g+j7/nco6KAKsS1dcLyxWwiRe8WsIzZkMKTw0
         yeooDnWdOJWJugVVbKiFOts9OCJii8ou0YqQm6mJoAc/4eVlN4iiuolYGqWyEG++8+fX
         ynTgWKIJYLCNuoa7NQZYlHZC30+9fiJbotWBGS8+LcAOBuTNcPWGgPOx2EJnVxEoQGZ+
         RMCNeXRctsq09qqufFFQEWWNIkVRL5FaLMRmNzuyxSBMqNBLbI7ynQRoixtepYOGuHSL
         O50pYNCWhwj94YymVnKrRhJOXOz2wKRZm1xtA6rDJenmTpv0y5dw7PZLk0K51/KY4HCy
         1lMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-language:content-transfer-encoding:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=pDQ/PuCkXr9NDWvK/SdEWXjiIEedsRaC/C0QWgCKolY=;
        fh=K5/ZBjxhABP5Ag55WD2stUTK3i0n4MiytjoGDoYe8Y0=;
        b=qWEMpvKPhyfYw4NlLqHdSmJJtbaXJfeOj9NN05eSXCkV//yUxfOeToC4CMhGreZ/tN
         G0Z8b8EgwOcUwKoQdS+UjN73KekRGlSJaEeqYZ721o4/Wy99+4wfzbopkYMxjJdtx+4M
         sYgdWuQyHnxTdZRiTB1AkoFKgy6akgyWLB8gdVVCoVW1B+e8zWBs2HL7gjGN6IycUVEK
         3xpJq+ZorqJHikqt1UPh8xov+Kp95bhkPqDOLCQuTmlrZCcxgJiR+V8+42FQqv0EKpfK
         FcY/W0ZFbRv0dFTjl+SWCjeH8IqoWo54Wsu1WczalEG6OyGy+uaYlIgp+X+Ivgdda8aq
         NXtQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of lixianglai@loongson.cn designates 114.242.206.163 as permitted sender) smtp.mailfrom=lixianglai@loongson.cn
Return-Path: <lixianglai@loongson.cn>
Received: from mail.loongson.cn (mail.loongson.cn. [114.242.206.163])
        by mx.google.com with ESMTP id g48-20020a05683030b000b006bf5bea1fa0si1298536ots.285.2023.10.12.20.58.31;
        Thu, 12 Oct 2023 20:58:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of lixianglai@loongson.cn designates 114.242.206.163 as permitted sender) client-ip=114.242.206.163;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of lixianglai@loongson.cn designates 114.242.206.163 as permitted sender) smtp.mailfrom=lixianglai@loongson.cn
Received: from loongson.cn (unknown [10.20.42.32])
	by gateway (Coremail) with SMTP id _____8BxHOtlwChlepQxAA--.25441S3;
	Fri, 13 Oct 2023 11:58:29 +0800 (CST)
Received: from [10.20.42.32] (unknown [10.20.42.32])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Dx3t5hwChlzn0iAA--.3543S2;
	Fri, 13 Oct 2023 11:58:27 +0800 (CST)
Subject: Re: [PATCH V5 0/9] Add architecture agnostic code to support vCPU
 Hotplug
To: Salil Mehta <salil.mehta@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: maz@kernel.org, jean-philippe@linaro.org, jonathan.cameron@huawei.com,
 lpieralisi@kernel.org, peter.maydell@linaro.org,
 richard.henderson@linaro.org, imammedo@redhat.com, andrew.jones@linux.dev,
 david@redhat.com, philmd@linaro.org, eric.auger@redhat.com,
 oliver.upton@linux.dev, pbonzini@redhat.com, mst@redhat.com,
 will@kernel.org, gshan@redhat.com, rafael@kernel.org,
 alex.bennee@linaro.org, linux@armlinux.org.uk,
 darren@os.amperecomputing.com, ilkka@os.amperecomputing.com,
 vishnu@os.amperecomputing.com, karl.heubaum@oracle.com,
 miguel.luis@oracle.com, salil.mehta@opnsrc.net, zhukeqian1@huawei.com,
 wangxiongfeng2@huawei.com, wangyanan55@huawei.com, jiakernel2@gmail.com,
 maobibo@loongson.cn, linuxarm@huawei.com
References: <20231011194355.15628-1-salil.mehta@huawei.com>
From: lixianglai <lixianglai@loongson.cn>
Message-ID: <34927805-a968-271f-16c2-17c8d90693d9@loongson.cn>
Date: Fri, 13 Oct 2023 11:58:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20231011194355.15628-1-salil.mehta@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID:AQAAf8Dx3t5hwChlzn0iAA--.3543S2
X-CM-SenderInfo: 5ol0xt5qjotxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxWr48Wr4kuFy3tFy3JF48Zrc_yoWrZF4kpa
	nY93WYgw45Kr47ur4fXryrZ345Wa1kGw4IqrsF934rZas0gw1kZrW0g3yjqFyUJrZ7KFyx
	XFnIqF1kGw1jywcCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9qb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07
	AlzVAYIcxG8wCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE
	7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI
	8E67AF67kF1VAFwI0_Wrv_Gr1UMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_
	JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJV
	WUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIY
	CTnIWIevJa73UjIFyTuYvjxU7iiSDUUUU
X-TUID: waBz99BtOYZp

Hi Salil Mehta via:

> Virtual CPU hotplug support is being added across various architectures[1][3].
> This series adds various code bits common across all architectures:
>
> 1. vCPU creation and Parking code refactor [Patch 1]
> 2. Update ACPI GED framework to support vCPU Hotplug [Patch 4,6,7]
> 3. ACPI CPUs AML code change [Patch 5]
> 4. Helper functions to support unrealization of CPU objects [Patch 8,9]
> 5. Misc [Patch 2,3]
>
>
> Repository:
>
> [*] https://github.com/salil-mehta/qemu.git virt-cpuhp-armv8/rfc-v2.common.v5
>
>
> Revision History:
>
> RFC V4 -> RFC V5
> 1. Addressed Gavin Shan's comments
>     - Fixed the trace events print string for kvm_{create,get,park,destroy}_vcpu
>     - Added Reviewed-by tag for patch {1}
> 2. Added Shaoqin Huang's Reviewed-by tags for Patches {2,3}
> 3. Added Tested-by Tag from Vishnu Pajjuri to the patch-set
> 4. Dropped the ARM specific Patch-10 from V4
> Link: https://lore.kernel.org/qemu-devel/20231009203601.17584-1-salil.mehta@huawei.com/
>
> RFC V3 -> RFC V4
> 1. Addressed David Hilderbrand's comments
>     - Fixed the wrong doc comment of kvm_park_vcpu API prototype
>     - Added Reviewed-by tags for patches {2,4}
> Link: https://lore.kernel.org/qemu-devel/20231009112812.10612-1-salil.mehta@huawei.com/
>
> RFC V2 -> RFC V3
> 1. Addressed Jonathan Cameron's comments
>     - Fixed 'vcpu-id' type wrongly changed from 'unsigned long' to 'integer'
>     - Removed unnecessary use of variable 'vcpu_id' in kvm_park_vcpu
>     - Updated [Patch V2 03/10] commit-log with details of ACPI_CPU_SCAN_METHOD macro
>     - Updated [Patch V2 05/10] commit-log with details of conditional event handler method
>     - Added Reviewed-by tags for patches {2,3,4,6,7}
> 2. Addressed Gavin Shan's comments
>     - Remove unnecessary use of variable 'vcpu_id' in kvm_par_vcpu
>     - Fixed return value in kvm_get_vcpu from -1 to -ENOENT
>     - Reset the value of 'gdb_num_g_regs' in gdb_unregister_coprocessor_all
>     - Fixed the kvm_{create,park}_vcpu prototypes docs
>     - Added Reviewed-by tags for patches {2,3,4,5,6,7,9,10}
> 3. Addressed one earlier missed comment by Alex Bennée in RFC V1
>     - Added traces instead of DPRINTF in the newly added and some existing functions
> Link: https://lore.kernel.org/qemu-devel/20230930001933.2660-1-salil.mehta@huawei.com/
>
> RFC V1 -> RFC V2
> 1. Addressed Alex Bennée's comments
>     - Refactored the kvm_create_vcpu logic to get rid of goto
>     - Added the docs for kvm_{create,park}_vcpu prototypes
>     - Splitted the gdbstub and AddressSpace destruction change into separate patches
>     - Added Reviewed-by tags for patches {2,10}
> Link: https://lore.kernel.org/qemu-devel/20230929124304.13672-1-salil.mehta@huawei.com/
>
> References:
>
> [1] https://lore.kernel.org/qemu-devel/20230926100436.28284-1-salil.mehta@huawei.com/
> [2] https://lore.kernel.org/all/20230913163823.7880-1-james.morse@arm.com/
> [3] https://lore.kernel.org/qemu-devel/cover.1695697701.git.lixianglai@loongson.cn/
>
>
> Salil Mehta (9):
>    accel/kvm: Extract common KVM vCPU {creation,parking} code
>    hw/acpi: Move CPU ctrl-dev MMIO region len macro to common header file
>    hw/acpi: Add ACPI CPU hotplug init stub
>    hw/acpi: Init GED framework with CPU hotplug events
>    hw/acpi: Update CPUs AML with cpu-(ctrl)dev change
>    hw/acpi: Update GED _EVT method AML with CPU scan
>    hw/acpi: Update ACPI GED framework to support vCPU Hotplug
>    physmem: Add helper function to destroy CPU AddressSpace
>    gdbstub: Add helper function to unregister GDB register space
>
>   accel/kvm/kvm-all.c                    | 64 ++++++++++++++++++++------
>   accel/kvm/trace-events                 |  4 ++
>   gdbstub/gdbstub.c                      | 15 ++++++
>   hw/acpi/acpi-cpu-hotplug-stub.c        |  6 +++
>   hw/acpi/cpu.c                          | 27 +++++++----
>   hw/acpi/generic_event_device.c         | 22 +++++++++
>   hw/i386/acpi-build.c                   |  2 +-
>   include/exec/cpu-common.h              |  8 ++++
>   include/exec/gdbstub.h                 |  5 ++
>   include/hw/acpi/cpu.h                  |  5 +-
>   include/hw/acpi/cpu_hotplug.h          |  4 ++
>   include/hw/acpi/generic_event_device.h |  5 ++
>   include/hw/core/cpu.h                  |  1 +
>   include/sysemu/kvm.h                   | 16 +++++++
>   softmmu/physmem.c                      | 25 ++++++++++
>   15 files changed, 182 insertions(+), 27 deletions(-)


I rebase your patch v5 on loongarch tcg, there is no problem with cpu
hotplug/unplug.

Thank you so much for your contribution to the community.

Thanks,
Xianglai.
