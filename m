Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp952239ejb;
        Thu, 19 Oct 2023 20:31:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHrPSuVobRTDa1UXPPs94qPklAgq8ZWdiQgPdmLyEskzM8Iux48kPSPfhV4OaYfvyrfKWER
X-Received: by 2002:a05:6214:f2c:b0:66d:63b3:690d with SMTP id iw12-20020a0562140f2c00b0066d63b3690dmr793566qvb.52.1697772670147;
        Thu, 19 Oct 2023 20:31:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697772670; cv=none;
        d=google.com; s=arc-20160816;
        b=HckiGt554BUX2xqAI4RA9SntAFy48jXtmMmgtky5h9qFHpowjphlogV2+E0YMKhhWE
         FL7wz6JaPB5VO9VM3jrdZNBggC1qqq/9csxQKb3ld9Zo5VUqGVEO9l8O9kVvBi8c9pcI
         42pr68yZNesfXeQ5ZpOa8anQseZr03f7ANt6R9+xCZzhQ33KketbG9VqnGI3riX3idD3
         rPtSn9MM+OQKiOi8yxb5LJEQyZ6cE6ULw4x07SwlikqLdjthak0gGW35DVCYlc+aX4O9
         aM0Mecn02WZ+yOK4gpgN/U+RaqFj3h986LaiU2l8Dibw8XkZOIumUXhz5OJsRzxbVR9a
         xV4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=NwkfzHSmZLcc0o3kmcFFCOXnHCgsl8JobHXWPtCKYUg=;
        fh=B1qcZi8DEZQOa4gEPUo2S31DxTnUpSx5/qCXEeUXX9M=;
        b=B7paYssYSPqWt2Bn8HWnMc7t1Gvy6x0rVdj9XuHyucGggJvqXYGHDXpcuiarCWvmjw
         XgQ/Oz0hlW7rNnlHK/pCKVpijJapbBd5nDjGcnfPhLUVNoEUG1b/D0hQ4Sg7aPrlY/lo
         H66WyYMeYtoBL/1+EDaNNYviTWDbSxF1s58hy4GGaeSYvBXSqLu4ZtIujQvFwIRHXZ5I
         gYfASwH5+WOoXdYVg1B0HZ+rHLgQ+j5RPvxYFUfaCs1zNXHcSz2ESzPXX2RJUDxb7hz3
         lYmt5wQZLyf4GJXfqza0F6A8XgAf/3JNXgToedArETlMnfH/ABLkBw97HrcU0mP5AqwX
         /WYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZjvkyZC0;
       spf=pass (google.com: domain of shahuang@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=shahuang@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <shahuang@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id v12-20020a05622a144c00b00403df34987asi676746qtx.376.2023.10.19.20.31.09
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 20:31:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of shahuang@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZjvkyZC0;
       spf=pass (google.com: domain of shahuang@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=shahuang@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697772669;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NwkfzHSmZLcc0o3kmcFFCOXnHCgsl8JobHXWPtCKYUg=;
	b=ZjvkyZC0vOr8sLbyV9Ns9YfKSJTos8nYR5VFZLi4Lrxh6IaD/9iFEIxqUSvnYaqYevsgKo
	7lytTobzYp4B86bPa+VS3ZJAxaXJfQgrCKegeIwjFT0d3FHGuU6cHOOd9X1zK2KMuFZV7L
	VYB7fME3F5ONAhg4uIHs0JAsQmTMSyQ=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-686-i-1DnrWxMrOQt1kAblXqGg-1; Thu, 19 Oct 2023 23:30:53 -0400
X-MC-Unique: i-1DnrWxMrOQt1kAblXqGg-1
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-6c461fc0abcso92077a34.1
        for <alex.bennee@linaro.org>; Thu, 19 Oct 2023 20:30:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697772653; x=1698377453;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NwkfzHSmZLcc0o3kmcFFCOXnHCgsl8JobHXWPtCKYUg=;
        b=UQCNLa3OPRaPL/Hg/+ygF5cbpn2b6/woIZQzY0JZlghfrjy4rzbkTBiPqi8nIde4df
         EzXX7K68qD9UNJVvKnQgQ0BFPQnPFF2gThiMQD9zg6FDXMB/ij5ifyMECnwIF1APZCz6
         7GbtD2INx/w7hI4UERKucpkpXVGvotqqTNj22FXaiPZms5Uc0cvzWd5X9/R46xKxs3kr
         cNO/OuI6uxqBrLPGoPT+mHXmFURMmAkz/EsvoQffZS3UQM2DGD3GSvFdc0SRwjpv6JbZ
         cPCknGDrbedAgRiwXo5w/ub0n4B1Jrw7w4Q9ZKTbnJCWVhM+X9//8myL3YAKivLg3zfV
         Mx7w==
X-Gm-Message-State: AOJu0YxTLniu1Hpvk7lHLzj4j9fNdr3JoiiGCLrTkBjbh7hCQFbm155V
	kn8xEktY4g52HGOgyjl3ZypWbGzHwwGd38hv39hMkOiXjWWeGvpSPoy9xtfvUObCiGywY2q/7xs
	4C9TYJLT7TW4fNf2D
X-Received: by 2002:a05:6830:16c9:b0:6b1:9646:2ea0 with SMTP id l9-20020a05683016c900b006b196462ea0mr841450otr.1.1697772652932;
        Thu, 19 Oct 2023 20:30:52 -0700 (PDT)
X-Received: by 2002:a05:6830:16c9:b0:6b1:9646:2ea0 with SMTP id l9-20020a05683016c900b006b196462ea0mr841439otr.1.1697772652653;
        Thu, 19 Oct 2023 20:30:52 -0700 (PDT)
Return-Path: <shahuang@redhat.com>
Received: from [10.66.61.39] ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id x190-20020a6263c7000000b006b5b46e4098sm521768pfb.169.2023.10.19.20.30.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Oct 2023 20:30:52 -0700 (PDT)
Message-ID: <bfc928bb-70fc-c2bd-9649-d722c4627d3a@redhat.com>
Date: Fri, 20 Oct 2023 11:30:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH V6 0/9] Add architecture agnostic code to support vCPU
 Hotplug
To: Salil Mehta <salil.mehta@huawei.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
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
 "oliver.upton@linux.dev" <oliver.upton@linux.dev>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>, "mst@redhat.com"
 <mst@redhat.com>, "will@kernel.org" <will@kernel.org>,
 "gshan@redhat.com" <gshan@redhat.com>, "rafael@kernel.org"
 <rafael@kernel.org>, "alex.bennee@linaro.org" <alex.bennee@linaro.org>,
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
 "maobibo@loongson.cn" <maobibo@loongson.cn>,
 "lixianglai@loongson.cn" <lixianglai@loongson.cn>,
 Linuxarm <linuxarm@huawei.com>
References: <20231013105129.25648-1-salil.mehta@huawei.com>
 <d1278ad1-cb78-90f1-64a6-c3e8711bacd7@redhat.com>
 <262138951966462dbc7f05a5efa146d6@huawei.com>
From: Shaoqin Huang <shahuang@redhat.com>
In-Reply-To: <262138951966462dbc7f05a5efa146d6@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: ZmRg7BGyBKjH



On 10/19/23 17:34, Salil Mehta wrote:
> Hi Shaoqin,
> 
>> From: Shaoqin Huang <shahuang@redhat.com>
>> Sent: Thursday, October 19, 2023 10:05 AM
>> To: Salil Mehta <salil.mehta@huawei.com>; qemu-devel@nongnu.org; qemu-
>> arm@nongnu.org
>> Cc: maz@kernel.org; jean-philippe@linaro.org; Jonathan Cameron
>> <jonathan.cameron@huawei.com>; lpieralisi@kernel.org;
>> peter.maydell@linaro.org; richard.henderson@linaro.org;
>> imammedo@redhat.com; andrew.jones@linux.dev; david@redhat.com;
>> philmd@linaro.org; eric.auger@redhat.com; oliver.upton@linux.dev;
>> pbonzini@redhat.com; mst@redhat.com; will@kernel.org; gshan@redhat.com;
>> rafael@kernel.org; alex.bennee@linaro.org; linux@armlinux.org.uk;
>> darren@os.amperecomputing.com; ilkka@os.amperecomputing.com;
>> vishnu@os.amperecomputing.com; karl.heubaum@oracle.com;
>> miguel.luis@oracle.com; salil.mehta@opnsrc.net; zhukeqian
>> <zhukeqian1@huawei.com>; wangxiongfeng (C) <wangxiongfeng2@huawei.com>;
>> wangyanan (Y) <wangyanan55@huawei.com>; jiakernel2@gmail.com;
>> maobibo@loongson.cn; lixianglai@loongson.cn; Linuxarm <linuxarm@huawei.com>
>> Subject: Re: [PATCH V6 0/9] Add architecture agnostic code to support vCPU
>> Hotplug
>>
>>
>>
>> On 10/13/23 18:51, Salil Mehta via wrote:
>>> Virtual CPU hotplug support is being added across various
>> architectures[1][3].
>>> This series adds various code bits common across all architectures:
>>>
>>> 1. vCPU creation and Parking code refactor [Patch 1]
>>> 2. Update ACPI GED framework to support vCPU Hotplug [Patch 4,6,7]
>>> 3. ACPI CPUs AML code change [Patch 5]
>>> 4. Helper functions to support unrealization of CPU objects [Patch 8,9]
>>> 5. Misc [Patch 2,3]
>>>
>>>
>>> Repository:
>>>
>>> [*] https://github.com/salil-mehta/qemu.git virt-cpuhp-armv8/rfc-
>> v2.common.v6
>>>
>>>
>>> Revision History:
>>>
>>> Patch-set  V5 -> V6
>>> 1. Addressed Gavin Shan's comments
>>>      - Fixed the assert() ranges of address spaces
>>>      - Rebased the patch-set to latest changes in the qemu.git
>>>      - Added Reviewed-by tags for patches {8,9}
>>> 2. Addressed Jonathan Cameron's comments
>>>      - Updated commit-log for [Patch V5 1/9] with mention of trace events
>>>      - Added Reviewed-by tags for patches {1,5}
>>> 3. Added Tested-by tags from Xianglai Li
>>> 4. Fixed checkpatch.pl error "Qemu -> QEMU" in [Patch V5 1/9]
>>> Link: https://lore.kernel.org/qemu-devel/20231011194355.15628-1-
>> salil.mehta@huawei.com/
>>>
>>> Patch-set  V4 -> V5
>>> 1. Addressed Gavin Shan's comments
>>>      - Fixed the trace events print string for
>> kvm_{create,get,park,destroy}_vcpu
>>>      - Added Reviewed-by tag for patch {1}
>>> 2. Added Shaoqin Huang's Reviewed-by tags for Patches {2,3}
>>> 3. Added Tested-by Tag from Vishnu Pajjuri to the patch-set
>>> 4. Dropped the ARM specific [Patch V4 10/10]
>>> Link: https://lore.kernel.org/qemu-devel/20231009203601.17584-1-
>> salil.mehta@huawei.com/
>>>
>>> Patch-set  V3 -> V4
>>> 1. Addressed David Hilderbrand's comments
>>>      - Fixed the wrong doc comment of kvm_park_vcpu API prototype
>>>      - Added Reviewed-by tags for patches {2,4}
>>> Link: https://lore.kernel.org/qemu-devel/20231009112812.10612-1-
>> salil.mehta@huawei.com/
>>>
>>> Patch-set  V2 -> V3
>>> 1. Addressed Jonathan Cameron's comments
>>>      - Fixed 'vcpu-id' type wrongly changed from 'unsigned long' to
>> 'integer'
>>>      - Removed unnecessary use of variable 'vcpu_id' in kvm_park_vcpu
>>>      - Updated [Patch V2 3/10] commit-log with details of
>> ACPI_CPU_SCAN_METHOD macro
>>>      - Updated [Patch V2 5/10] commit-log with details of conditional
>> event handler method
>>>      - Added Reviewed-by tags for patches {2,3,4,6,7}
>>> 2. Addressed Gavin Shan's comments
>>>      - Remove unnecessary use of variable 'vcpu_id' in kvm_par_vcpu
>>>      - Fixed return value in kvm_get_vcpu from -1 to -ENOENT
>>>      - Reset the value of 'gdb_num_g_regs' in
>> gdb_unregister_coprocessor_all
>>>      - Fixed the kvm_{create,park}_vcpu prototypes docs
>>>      - Added Reviewed-by tags for patches {2,3,4,5,6,7,9,10}
>>> 3. Addressed one earlier missed comment by Alex Bennée in RFC V1
>>>      - Added traces instead of DPRINTF in the newly added and some
>> existing functions
>>> Link: https://lore.kernel.org/qemu-devel/20230930001933.2660-1-
>> salil.mehta@huawei.com/
>>>
>>> Patch-set V1 -> V2
>>> 1. Addressed Alex Bennée's comments
>>>      - Refactored the kvm_create_vcpu logic to get rid of goto
>>>      - Added the docs for kvm_{create,park}_vcpu prototypes
>>>      - Splitted the gdbstub and AddressSpace destruction change into
>> separate patches
>>>      - Added Reviewed-by tags for patches {2,10}
>>> Link: https://lore.kernel.org/qemu-devel/20230929124304.13672-1-
>> salil.mehta@huawei.com/
>>>
>>> References:
>>>
>>> [1] https://lore.kernel.org/qemu-devel/20230926100436.28284-1-
>> salil.mehta@huawei.com/
>>> [2] https://lore.kernel.org/all/20230913163823.7880-1-
>> james.morse@arm.com/
>>> [3] https://lore.kernel.org/qemu-
>> devel/cover.1695697701.git.lixianglai@loongson.cn/
>>>
>>>
>>> Salil Mehta (9):
>>>     accel/kvm: Extract common KVM vCPU {creation,parking} code
>>>     hw/acpi: Move CPU ctrl-dev MMIO region len macro to common header file
>>>     hw/acpi: Add ACPI CPU hotplug init stub
>>>     hw/acpi: Init GED framework with CPU hotplug events
>>>     hw/acpi: Update CPUs AML with cpu-(ctrl)dev change
>>>     hw/acpi: Update GED _EVT method AML with CPU scan
>>>     hw/acpi: Update ACPI GED framework to support vCPU Hotplug
>>>     physmem: Add helper function to destroy CPU AddressSpace
>>>     gdbstub: Add helper function to unregister GDB register space
>>>
>>>    accel/kvm/kvm-all.c                    | 64 ++++++++++++++++++++------
>>>    accel/kvm/trace-events                 |  4 ++
>>>    gdbstub/gdbstub.c                      | 12 +++++
>>>    hw/acpi/acpi-cpu-hotplug-stub.c        |  6 +++
>>>    hw/acpi/cpu.c                          | 27 +++++++----
>>>    hw/acpi/generic_event_device.c         | 22 +++++++++
>>>    hw/i386/acpi-build.c                   |  3 +-
>>>    include/exec/cpu-common.h              |  8 ++++
>>>    include/exec/gdbstub.h                 |  5 ++
>>>    include/hw/acpi/cpu.h                  |  5 +-
>>>    include/hw/acpi/cpu_hotplug.h          |  4 ++
>>>    include/hw/acpi/generic_event_device.h |  5 ++
>>>    include/hw/core/cpu.h                  |  1 +
>>>    include/sysemu/kvm.h                   | 16 +++++++
>>>    system/physmem.c                       | 29 ++++++++++++
>>>    15 files changed, 184 insertions(+), 27 deletions(-)
>>>
>>
>> Hi salil,
>>
>> All patches looks good to me. Thanks for you effort to update it so
>> actively. No issues being found by simply testing and several daily use.
>>
>> Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
> 
> Many thanks! Just wanted to confirm if you have tested this patch over
> x86 platform as well?

Hi Salil,

I used it on Ampere One Machine, so didn't test it on x86 platform.

Thanks,
Shaoqin

> 
> 
> Cheers
> Salil.

-- 
Shaoqin
