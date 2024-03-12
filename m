Received: by 2002:a17:907:991a:b0:a45:b507:d90a with SMTP id ka26csp1988818ejc;
        Tue, 12 Mar 2024 11:00:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWrArKFDqFIhV5cThlrybw8TixLce1zln+vDDbgCZW8Ghed8haArEZtvv8vyjjnXUhxeVBascGAXEnVwfG33tSg43cnBpw4
X-Google-Smtp-Source: AGHT+IHitloUj/uQE8TrCUebxhdqJeA0jGVhKscV3i2ktk3nLLxF5/iLmlQQeF49HaYruRpIMGv0
X-Received: by 2002:a05:620a:24cf:b0:788:4022:b579 with SMTP id m15-20020a05620a24cf00b007884022b579mr1361223qkn.47.1710266418946;
        Tue, 12 Mar 2024 11:00:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710266418; cv=none;
        d=google.com; s=arc-20160816;
        b=zRl3UKHmco9kz4mFvh7NypirzxGmsKvsF2GRob+OOdtFg47KxmEu5UxkoZtEBNBPxW
         uLmWx/tFgBO+7kuWDx0ET08ay+1XLcKC3CLOwoT3mgG4ZtBU6Dx4u4AuN0D+bK34KMnB
         CXd8PbGCnBcYCc3yuzeNC62q9Deq7n/RwUvleJr7b85ffB6RY278H+XDk0QH/pWf10MG
         kUxStH9modRxFBI9bc8jOA/3kNQ8Z5j+K6W467yqytSP6iDg3yIT6QA2A7cK1igR+4Qi
         hFrfJgBunBX6gfYs/xoctTOv0U/vCictj00ij03ogyNXLCZ7d7thiei5i2ty+891dNUr
         pvbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=SO0EPgm7BqsnG8vdVPs/h99HjcNJP0V+y7vUnzFvtdU=;
        fh=rrqu06MQ9dipZLT/IzhCLpxWHKuMP4/sun3h+DJYsOg=;
        b=q2M4vk4agJqUMY4Fc7RubBtQD8mTmqAmHrp5SUNbvn7ZNk7RfV0cbNUL5Bp2Szj4Cy
         KYvdgRpJDzoDXGQdJzpHIpsbOA7olCrrVBHWIk/JrZogBgIF3/j4KbF++CA/Ek/wt2G+
         +Ov9Uhg7opFNbNHlBFYlbcjgs6EEBe67q38bNy29gc4RMQRJhu9/rGeN7QTUHIV0/uZP
         8Epv2eD/F/5Zj8l9EEvsq7vREUr1IJq6Bh+KN7YVJBZBfbUp47J2KnbkkoAjd5MRM4PX
         MbECWNm6wk486LfDGoDIS2OH0i5pOixTttqc5GEhlr85kiwQA8TRpjMfGLSrl3Zz/RCg
         XEBg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=S+PDEoKR;
       spf=pass (google.com: domain of mst@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=mst@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <mst@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id c13-20020a05620a0ced00b007887d6a5044si1404192qkj.277.2024.03.12.11.00.18
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 11:00:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of mst@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=S+PDEoKR;
       spf=pass (google.com: domain of mst@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=mst@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710266418;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SO0EPgm7BqsnG8vdVPs/h99HjcNJP0V+y7vUnzFvtdU=;
	b=S+PDEoKR2VAtrdt8t0gnjppPILCr/UCPqq2mjLqhleweUJ9+PIDg3LHSRcPZ+26/Og6/bF
	sTjkdqvjNTNkws14k7/rEkcpsNhU1mak1iBq8ZaaGyHTRiG9QL6yhTsc0/NcYpAyr7CO5E
	NzaSQGfAOSLkUrQJHeAnCpdCZXAhLR4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-502-82Lnv83nNI6khi5D0JFdfw-1; Tue, 12 Mar 2024 14:00:14 -0400
X-MC-Unique: 82Lnv83nNI6khi5D0JFdfw-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-412d1f1ee7cso970845e9.3
        for <alex.bennee@linaro.org>; Tue, 12 Mar 2024 11:00:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710266413; x=1710871213;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SO0EPgm7BqsnG8vdVPs/h99HjcNJP0V+y7vUnzFvtdU=;
        b=vxU9ow/3TU1ftStJvj2EANjHlvlAN3vU+K8xehO/VVpQmIIG+sViq1wnsWg/aouXc3
         eVHTq9TYirZwlCKajdBeT0Kxvqr9ZdtRMmp3mQJdXWTcF35G+Fsc+2Y5ifZs8jtYhpcC
         PM79RLOlNonpqWiUdXg68X3myU0dKZ+HGr85ykU5VQ4OhshHZa3pKXFumqRTuqFNBlne
         6jEAWCaKBU2u/FSTK5dj2s9fcuO2xoDN5SNv8T+H9hL5rIyaxryCmYhB3o5E9cU6df/c
         1f+YNGUbIm7CCCYpwyiUAhr03JfjB5av6xUvkLhttYd7bdG25Y6ranW5FN0hnLiKQ1Hp
         KTtA==
X-Forwarded-Encrypted: i=1; AJvYcCXkcaJjt76PU3ZzLEUz/+eLC6xDBvheZ+xmq5JrIPPgb/HpVgbifoD6Hd4Rd9y1BkNH42+h7kjns9zte9yQVuAtcvG6a2Yj
X-Gm-Message-State: AOJu0Yx/YITgMsL8rlClEJTHC1ar9RVAloee7TJbUr2GgoYNbwWupVBn
	5OALRWBJ1y2kg+Z4o58jjITKWgjnOSHDInqQMYSpETs34C1A7NitGePi9dCK7vJfTiop9P4hJyG
	JSz69+BL3ySxfqFV2CGoknmTh5G2y0gKrOg48fPrT58BHrbNFUw1tug==
X-Received: by 2002:a05:600c:4f09:b0:413:1dae:dcdd with SMTP id l9-20020a05600c4f0900b004131daedcddmr700835wmq.6.1710266412757;
        Tue, 12 Mar 2024 11:00:12 -0700 (PDT)
X-Received: by 2002:a05:600c:4f09:b0:413:1dae:dcdd with SMTP id l9-20020a05600c4f0900b004131daedcddmr700785wmq.6.1710266412041;
        Tue, 12 Mar 2024 11:00:12 -0700 (PDT)
Return-Path: <mst@redhat.com>
Received: from redhat.com ([2a02:14f:1f0:532c:5ae4:fce6:76e1:fa1a])
        by smtp.gmail.com with ESMTPSA id t10-20020a05600c450a00b004131388d948sm17546130wmo.0.2024.03.12.11.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 11:00:11 -0700 (PDT)
Date: Tue, 12 Mar 2024 14:00:02 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Salil Mehta <salil.mehta@huawei.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, maz@kernel.org,
	jean-philippe@linaro.org, jonathan.cameron@huawei.com,
	lpieralisi@kernel.org, peter.maydell@linaro.org,
	richard.henderson@linaro.org, imammedo@redhat.com,
	andrew.jones@linux.dev, david@redhat.com, philmd@linaro.org,
	eric.auger@redhat.com, oliver.upton@linux.dev, pbonzini@redhat.com,
	will@kernel.org, gshan@redhat.com, rafael@kernel.org,
	alex.bennee@linaro.org, linux@armlinux.org.uk,
	darren@os.amperecomputing.com, ilkka@os.amperecomputing.com,
	vishnu@os.amperecomputing.com, karl.heubaum@oracle.com,
	miguel.luis@oracle.com, salil.mehta@opnsrc.net,
	zhukeqian1@huawei.com, wangxiongfeng2@huawei.com,
	wangyanan55@huawei.com, jiakernel2@gmail.com, maobibo@loongson.cn,
	lixianglai@loongson.cn, linuxarm@huawei.com
Subject: Re: [PATCH V8 0/8] Add architecture agnostic code to support vCPU
 Hotplug
Message-ID: <20240312135802-mutt-send-email-mst@kernel.org>
References: <20240312020000.12992-1-salil.mehta@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20240312020000.12992-1-salil.mehta@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-TUID: JRCOLnFT5vvZ

On Tue, Mar 12, 2024 at 01:59:52AM +0000, Salil Mehta wrote:
> Virtual CPU hotplug support is being added across various architectures[1][3].
> This series adds various code bits common across all architectures:
> 
> 1. vCPU creation and Parking code refactor [Patch 1]
> 2. Update ACPI GED framework to support vCPU Hotplug [Patch 2,3]
> 3. ACPI CPUs AML code change [Patch 4,5]
> 4. Helper functions to support unrealization of CPU objects [Patch 6,7]
> 5. Docs [Patch 8]


I replied separately: patch 1 needs ack from KVM maintainers.

I suspect I could pick some bits I have no way to know
whether they were tested separately.
In any way looks like something best left to next release ...

> 
> Repository:
> 
> [*] https://github.com/salil-mehta/qemu.git virt-cpuhp-armv8/rfc-v2.common.v8
> 
> 
> Revision History:
> 
> Patch-set V7 -> V8
> 
> 1. Rebased and Fixed the conflicts
> 
> Patch-set  V6 -> V7
> 1. Addressed Alex Bennée's comments
>    - Updated the docs
> 2. Addressed Igor Mammedov's comments
>    - Merged patches [Patch V6 3/9] & [Patch V6 7/9] with [Patch V6 4/9]
>    - Updated commit-log of [Patch V6 1/9] and [Patch V6 5/9]     
> 3. Added Shaoqin Huang's Reviewed-by tags for whole series.
> Link: https://lore.kernel.org/qemu-devel/20231013105129.25648-1-salil.mehta@huawei.com/
> 
> Patch-set  V5 -> V6
> 1. Addressed Gavin Shan's comments
>    - Fixed the assert() ranges of address spaces
>    - Rebased the patch-set to latest changes in the qemu.git
>    - Added Reviewed-by tags for patches {8,9}
> 2. Addressed Jonathan Cameron's comments
>    - Updated commit-log for [Patch V5 1/9] with mention of trace events
>    - Added Reviewed-by tags for patches {1,5}
> 3. Added Tested-by tags from Xianglai Li
> 4. Fixed checkpatch.pl error "Qemu -> QEMU" in [Patch V5 1/9] 
> Link: https://lore.kernel.org/qemu-devel/20231011194355.15628-1-salil.mehta@huawei.com/
> 
> Patch-set  V4 -> V5
> 1. Addressed Gavin Shan's comments
>    - Fixed the trace events print string for kvm_{create,get,park,destroy}_vcpu
>    - Added Reviewed-by tag for patch {1}
> 2. Added Shaoqin Huang's Reviewed-by tags for Patches {2,3}
> 3. Added Tested-by Tag from Vishnu Pajjuri to the patch-set
> 4. Dropped the ARM specific [Patch V4 10/10]
> Link: https://lore.kernel.org/qemu-devel/20231009203601.17584-1-salil.mehta@huawei.com/
> 
> Patch-set  V3 -> V4
> 1. Addressed David Hilderbrand's comments
>    - Fixed the wrong doc comment of kvm_park_vcpu API prototype
>    - Added Reviewed-by tags for patches {2,4}
> Link: https://lore.kernel.org/qemu-devel/20231009112812.10612-1-salil.mehta@huawei.com/
> 
> Patch-set  V2 -> V3
> 1. Addressed Jonathan Cameron's comments
>    - Fixed 'vcpu-id' type wrongly changed from 'unsigned long' to 'integer'
>    - Removed unnecessary use of variable 'vcpu_id' in kvm_park_vcpu
>    - Updated [Patch V2 3/10] commit-log with details of ACPI_CPU_SCAN_METHOD macro
>    - Updated [Patch V2 5/10] commit-log with details of conditional event handler method
>    - Added Reviewed-by tags for patches {2,3,4,6,7}
> 2. Addressed Gavin Shan's comments
>    - Remove unnecessary use of variable 'vcpu_id' in kvm_par_vcpu
>    - Fixed return value in kvm_get_vcpu from -1 to -ENOENT
>    - Reset the value of 'gdb_num_g_regs' in gdb_unregister_coprocessor_all
>    - Fixed the kvm_{create,park}_vcpu prototypes docs
>    - Added Reviewed-by tags for patches {2,3,4,5,6,7,9,10}
> 3. Addressed one earlier missed comment by Alex Bennée in RFC V1
>    - Added traces instead of DPRINTF in the newly added and some existing functions
> Link: https://lore.kernel.org/qemu-devel/20230930001933.2660-1-salil.mehta@huawei.com/
> 
> Patch-set V1 -> V2
> 1. Addressed Alex Bennée's comments
>    - Refactored the kvm_create_vcpu logic to get rid of goto
>    - Added the docs for kvm_{create,park}_vcpu prototypes
>    - Splitted the gdbstub and AddressSpace destruction change into separate patches
>    - Added Reviewed-by tags for patches {2,10}
> Link: https://lore.kernel.org/qemu-devel/20230929124304.13672-1-salil.mehta@huawei.com/
> 
> References:
> 
> [1] https://lore.kernel.org/qemu-devel/20230926100436.28284-1-salil.mehta@huawei.com/
> [2] https://lore.kernel.org/all/20230913163823.7880-1-james.morse@arm.com/
> [3] https://lore.kernel.org/qemu-devel/cover.1695697701.git.lixianglai@loongson.cn/
> 
> 
> 
> Salil Mehta (8):
>   accel/kvm: Extract common KVM vCPU {creation,parking} code
>   hw/acpi: Move CPU ctrl-dev MMIO region len macro to common header file
>   hw/acpi: Update ACPI GED framework to support vCPU Hotplug
>   hw/acpi: Update GED _EVT method AML with CPU scan
>   hw/acpi: Update CPUs AML with cpu-(ctrl)dev change
>   physmem: Add helper function to destroy CPU AddressSpace
>   gdbstub: Add helper function to unregister GDB register space
>   docs/specs/acpi_hw_reduced_hotplug: Add the CPU Hotplug Event Bit
> 
>  accel/kvm/kvm-all.c                    | 64 ++++++++++++++++++++------
>  accel/kvm/trace-events                 |  5 +-
>  docs/specs/acpi_hw_reduced_hotplug.rst |  3 +-
>  gdbstub/gdbstub.c                      | 12 +++++
>  hw/acpi/acpi-cpu-hotplug-stub.c        |  6 +++
>  hw/acpi/cpu.c                          | 27 +++++++----
>  hw/acpi/generic_event_device.c         | 21 +++++++++
>  hw/i386/acpi-build.c                   |  3 +-
>  include/exec/cpu-common.h              |  8 ++++
>  include/exec/gdbstub.h                 |  6 +++
>  include/hw/acpi/cpu.h                  |  5 +-
>  include/hw/acpi/cpu_hotplug.h          |  4 ++
>  include/hw/acpi/generic_event_device.h |  4 ++
>  include/hw/core/cpu.h                  |  1 +
>  include/sysemu/kvm.h                   | 16 +++++++
>  system/physmem.c                       | 29 ++++++++++++
>  16 files changed, 185 insertions(+), 29 deletions(-)
> 
> -- 
> 2.34.1
