Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp372628ejb;
        Thu, 19 Oct 2023 02:04:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1A6Cm0vLBnfFdnQBMtzwyqfwmkxjQZ5HOiy4kAaC5s64yxDlG2qs5Q4wt+x2DcyOM+IHM
X-Received: by 2002:a05:620a:45a9:b0:767:923:48e7 with SMTP id bp41-20020a05620a45a900b00767092348e7mr1640389qkb.5.1697706295644;
        Thu, 19 Oct 2023 02:04:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697706295; cv=none;
        d=google.com; s=arc-20160816;
        b=y815b0xTjt39m2TwxKFSGOm+GyX0stlNp47GAZufa8ONlNb29xFLOoaiBZHCQh3x5x
         l0UuYMVOz0+mqhdTQOlzpZ9gsF0gesD/TK/rsqbaMLCEvi24bWu/oeJ59pKvn0299JqH
         M8XM16KDBadLVGSEGgeKfIEEcfcP+R7SGnQJNFost2ufteMgE7Yrgk4RULRTjc2JTYyG
         /gk7ed2kq0Z1RsqgvSq2KzboflZ8NFrUz3qGYTG7510AQBFQQ3ldvQy9GnjsLdPrMJWV
         ShPveEfdXSQieL2KhDgUYU+Q+8x8xYr8RbIeknrEydKNBNWzn4s6ixOJwUi9ApLosbKo
         Me4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=rGPyu2oyb6K1VJTFIEw7kMpYSIo1edfld6pQEvAngzc=;
        fh=HQu76LFN0DbKXHr60vGnzTmi359RrU+EPC8eBDHkPTc=;
        b=KTSuhdGzXZ5KfUTib9he0sSbVvIcsy4S4FoUpckSr6XgkTW/qEG4y06vweE9iK4SPP
         6ydkrvsixwxPKRZxzNVjbSGkIY4klFAWPSOeqRUwk+F/QIR9/R0HuLsHd9HwrXI+DB3O
         Nx7FoQ+mmulfxdkWlNuhu+W6XYRheFii5P8uVzp90bXTsTTESJ3AcuGMbYIGTrQW6nzS
         jjFRoTE8tT8Wtt0wZOEERwAqEzJto/2AkTJWMvI7nChHUyS6dH7gkocpyPdUMK2hkDsR
         2XuPp6G9l1O2XUpis2XXNG9WxsFScuiLHz17jdKn+C0Nquz5CVRSfbHS2tjlO3i8JbG1
         C7DA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VumxcHLC;
       spf=pass (google.com: domain of shahuang@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=shahuang@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <shahuang@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id s16-20020a05620a29d000b007682117be3csi1231199qkp.62.2023.10.19.02.04.55
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 02:04:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of shahuang@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VumxcHLC;
       spf=pass (google.com: domain of shahuang@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=shahuang@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697706295;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rGPyu2oyb6K1VJTFIEw7kMpYSIo1edfld6pQEvAngzc=;
	b=VumxcHLCSlqt+ko8yFWJXTAMndqKth6VQMaSnfpzYPqkJerOjbpEGBxaWsrw0tDxEM9Eev
	MMvWaNXzSzQeXqsKg6hCOOR/iTJbtZCbWkHclDzBfvsz5YkjxHfRucYyF+qTdgMqpZGQMc
	P6PEesABP+xXWuRCY36Lmp7lM4jsPnA=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-187-whRgtkraNKaOddlkmdwd7Q-1; Thu, 19 Oct 2023 05:04:53 -0400
X-MC-Unique: whRgtkraNKaOddlkmdwd7Q-1
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-6b2df09dcdcso1877513b3a.0
        for <alex.bennee@linaro.org>; Thu, 19 Oct 2023 02:04:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697706293; x=1698311093;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rGPyu2oyb6K1VJTFIEw7kMpYSIo1edfld6pQEvAngzc=;
        b=tnad2E9kyM3g0kViz51d04eL6m4VTJ6aS3h7f4eeQKSjiKzWYYnXLwgXvAoZDRfcSC
         rktbNKTy4h5oDJrdvc79zmCxzL0WoDgz7CynGSp1hM893EDYXtq+sniBdy+/sOahYMn4
         hSlL6QvuWq1cSTYvs6kJVhJvH5N8eBtQ6IaG2wymznms0qqo4cmog7FyZqHBSiBglRpx
         RkGzxSw+wMJVdHD0E/NjGOM2t31bgaI0h+5VY46oaIkWd+sre0oOqKn3odySHh8AzoDP
         hlzJO6as/P+p0BThwaAGN3Wfm3Li4ts6kVt8LX7G9gR2m978icmYPQRNPg8AL86eIsN/
         QJ0g==
X-Gm-Message-State: AOJu0YyMnFMtBuKmxveH4+OIhtJr0R4+HIDo4/JzDaDEpGqDxocNRmJI
	tFSzj43YVL1vyEEb0LVAmqr+VLFrpl9bPU//eCVLYztI51NeglBuB7fX5L0qOgOFqi2rg1Jyuw8
	CpGT7+HWlzADoGxvP
X-Received: by 2002:a05:6a20:4401:b0:13d:fff1:c672 with SMTP id ce1-20020a056a20440100b0013dfff1c672mr1960415pzb.4.1697706292718;
        Thu, 19 Oct 2023 02:04:52 -0700 (PDT)
X-Received: by 2002:a05:6a20:4401:b0:13d:fff1:c672 with SMTP id ce1-20020a056a20440100b0013dfff1c672mr1960361pzb.4.1697706292374;
        Thu, 19 Oct 2023 02:04:52 -0700 (PDT)
Return-Path: <shahuang@redhat.com>
Received: from [10.66.61.39] ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id mz24-20020a17090b379800b00256799877ffsm1133812pjb.47.2023.10.19.02.04.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Oct 2023 02:04:51 -0700 (PDT)
Message-ID: <d1278ad1-cb78-90f1-64a6-c3e8711bacd7@redhat.com>
Date: Thu, 19 Oct 2023 17:04:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH V6 0/9] Add architecture agnostic code to support vCPU
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
 maobibo@loongson.cn, lixianglai@loongson.cn, linuxarm@huawei.com
References: <20231013105129.25648-1-salil.mehta@huawei.com>
From: Shaoqin Huang <shahuang@redhat.com>
In-Reply-To: <20231013105129.25648-1-salil.mehta@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: sulWpKiJ4h4/



On 10/13/23 18:51, Salil Mehta via wrote:
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
> [*] https://github.com/salil-mehta/qemu.git virt-cpuhp-armv8/rfc-v2.common.v6
> 
> 
> Revision History:
> 
> Patch-set  V5 -> V6
> 1. Addressed Gavin Shan's comments
>     - Fixed the assert() ranges of address spaces
>     - Rebased the patch-set to latest changes in the qemu.git
>     - Added Reviewed-by tags for patches {8,9}
> 2. Addressed Jonathan Cameron's comments
>     - Updated commit-log for [Patch V5 1/9] with mention of trace events
>     - Added Reviewed-by tags for patches {1,5}
> 3. Added Tested-by tags from Xianglai Li
> 4. Fixed checkpatch.pl error "Qemu -> QEMU" in [Patch V5 1/9]
> Link: https://lore.kernel.org/qemu-devel/20231011194355.15628-1-salil.mehta@huawei.com/
> 
> Patch-set  V4 -> V5
> 1. Addressed Gavin Shan's comments
>     - Fixed the trace events print string for kvm_{create,get,park,destroy}_vcpu
>     - Added Reviewed-by tag for patch {1}
> 2. Added Shaoqin Huang's Reviewed-by tags for Patches {2,3}
> 3. Added Tested-by Tag from Vishnu Pajjuri to the patch-set
> 4. Dropped the ARM specific [Patch V4 10/10]
> Link: https://lore.kernel.org/qemu-devel/20231009203601.17584-1-salil.mehta@huawei.com/
> 
> Patch-set  V3 -> V4
> 1. Addressed David Hilderbrand's comments
>     - Fixed the wrong doc comment of kvm_park_vcpu API prototype
>     - Added Reviewed-by tags for patches {2,4}
> Link: https://lore.kernel.org/qemu-devel/20231009112812.10612-1-salil.mehta@huawei.com/
> 
> Patch-set  V2 -> V3
> 1. Addressed Jonathan Cameron's comments
>     - Fixed 'vcpu-id' type wrongly changed from 'unsigned long' to 'integer'
>     - Removed unnecessary use of variable 'vcpu_id' in kvm_park_vcpu
>     - Updated [Patch V2 3/10] commit-log with details of ACPI_CPU_SCAN_METHOD macro
>     - Updated [Patch V2 5/10] commit-log with details of conditional event handler method
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
> Patch-set V1 -> V2
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
>   gdbstub/gdbstub.c                      | 12 +++++
>   hw/acpi/acpi-cpu-hotplug-stub.c        |  6 +++
>   hw/acpi/cpu.c                          | 27 +++++++----
>   hw/acpi/generic_event_device.c         | 22 +++++++++
>   hw/i386/acpi-build.c                   |  3 +-
>   include/exec/cpu-common.h              |  8 ++++
>   include/exec/gdbstub.h                 |  5 ++
>   include/hw/acpi/cpu.h                  |  5 +-
>   include/hw/acpi/cpu_hotplug.h          |  4 ++
>   include/hw/acpi/generic_event_device.h |  5 ++
>   include/hw/core/cpu.h                  |  1 +
>   include/sysemu/kvm.h                   | 16 +++++++
>   system/physmem.c                       | 29 ++++++++++++
>   15 files changed, 184 insertions(+), 27 deletions(-)
> 

Hi salil,

All patches looks good to me. Thanks for you effort to update it so 
actively. No issues being found by simply testing and several daily use.

Reviewed-by: Shaoqin Huang <shahuang@redhat.com>

Thanks,
Shaoqin

-- 
Shaoqin
