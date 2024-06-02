Received: by 2002:a17:906:7fcb:b0:a66:557b:2f6e with SMTP id r11csp1852906ejs;
        Sun, 2 Jun 2024 15:03:20 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWtfIGJ8sA7tCwsELcDoXLlWwCv4MAQy7jrHBZqeiZ51si0179gulEbJTI5h//pw42NKiYjdEFp5JuFjpEIvnLsxfeHNEjm
X-Google-Smtp-Source: AGHT+IFWJei+ITtCz35VTsKxk7lgttrG+GMPtlJIiqy4FUV6I07l4rIp63DkWGtstsXcYVLT8e8C
X-Received: by 2002:a05:620a:2953:b0:792:8c59:f56d with SMTP id af79cd13be357-794f4fd312amr1554367485a.30.1717365800664;
        Sun, 02 Jun 2024 15:03:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717365800; cv=none;
        d=google.com; s=arc-20160816;
        b=bgvexpR2heN4VYRiqw6RjZqRajoPpo47kHPhbSgbY9yBQFnwuf0F16Cdm02oQG1RU0
         YJXpxOxZSQPcpvW1UG/GYiD84KS9AU2Fb9UlPxPHRLY++Vs1IZ106czaw4oXhwGxU5iQ
         UyeXuXYZEo4TyHkCrzW3AIr2bC9XLn93DfAzbl5UTm7+ZIF2wf+Ipoi3clVsnB8l+iwI
         6DK15dkFGQkKG8Qe7NPXIrjrHIu6mvpSyQzUeQG21pZXZwPJpthjwxC8mZHUbPKRHmXC
         V4R7Jb82ZOIlGaxqCMPHCBkKRcH9PuDowJgKXAKxj0D6hurLspmnmjAH4PPuM8ZIASA4
         gWgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=+jq37LH30l2H7Ddx9L6ulHhQCtHKTxeeYK+jHiOAmYY=;
        fh=eSBzNr9kZFD7jy0tJUPNrJkUKd2hr3zqTrUGSvKJogo=;
        b=dC2oyFCqzOPPCDjC0iJlul37STKXUy40R8LjiKutnby20PRsuvbA+XSWIb9dZe6++3
         VHDI90zqV0ikjbn4INjmBYlMOx5COvvzuQzceYNbCwv9Q0JLfugJXQVwDmefsfDPYgkL
         HX37TtykqQCxpyq/0AF5fCXVc6SMveV6LswoaqejK0obm/dwr3AV2JDb3Qx+ER49qHAr
         kiFTjjWBHsUbjjDHSzhEtc5HmaqNNy+nncfMLoBykVlQInw5OiwTFjS67R+VuOoy7cSk
         vwOalHMyZQous/KWiIm/3Sn9SWMduI7cJMb6vq1NpHYPvW+ccGK2gLhYAhp0RrOd/Oqm
         ZUtg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dqsEshbw;
       spf=pass (google.com: domain of mst@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=mst@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <mst@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-794f32b8d90si785328885a.707.2024.06.02.15.03.20
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jun 2024 15:03:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of mst@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dqsEshbw;
       spf=pass (google.com: domain of mst@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=mst@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717365800;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+jq37LH30l2H7Ddx9L6ulHhQCtHKTxeeYK+jHiOAmYY=;
	b=dqsEshbwXMOV+GeO1sYwRY5fwgV0sCflNeD8oTkEr+nElA6vi5CvDobFNNOxIjXw1ji876
	v1+zduikJGFY+/jXH9EFmk4v99JO8fKiTub2lddyUFOwS72A44tu/pD9FgIoo5SCvT+WTh
	4V+5eh6xOgU1CJLpIXa35PuQAFDo3ng=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-649-r2_U-8eMPIy9CC5W7m2Iiw-1; Sun, 02 Jun 2024 18:03:15 -0400
X-MC-Unique: r2_U-8eMPIy9CC5W7m2Iiw-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4212e2a3a1bso15631905e9.3
        for <alex.bennee@linaro.org>; Sun, 02 Jun 2024 15:03:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717365794; x=1717970594;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+jq37LH30l2H7Ddx9L6ulHhQCtHKTxeeYK+jHiOAmYY=;
        b=MRYvvp3YBwiedWtutdpe6w7UxlNISWQ/z2lY3lGDa5j/7+fVW+UROOAYtqsNSS9lh1
         yWjDAZ8UM0LXjeXUjEdLIauJ2AFw+s6Ep0YIl9U+wyFju0HZJlB2FleVGALkoZ8CU55+
         qgYohybVk39Ojoa3rgHFLmZegi70uQmdTWNqXeblP1lj+e0QrcGoeyEDRVvDsbp82NUP
         iktE56a+2u6zxn8tPHIEnzRii5Sh4ATko/eV0ywuCniC8EhoU54jY/0e2VReDd3vHNVZ
         2zrAutrPJa5NgNmcgsiKfjpLquYqlmZiHW0oN4S44bIQz0rUY9kXx+YBBQ8oQEEDSRvj
         vqNA==
X-Forwarded-Encrypted: i=1; AJvYcCX6Js3x8pEcLlrTtQ6eXKZh7nlNtcLHGtXAAgNGXoWRxwM43cOO3FB0sQwQd/depSm1gsSQVeCxckEmNu/fBxKM2whD79ey
X-Gm-Message-State: AOJu0YyZG3mAXcdQJ1tPi18CdWEBzzmcZtV8oOWi3QNfNx35oLmCWXp6
	kDdnaNzjAO9WeIqBdf7aqx94LDd/HeS1sRAilvULKmqDkAw+tKZyXI4OTvVKxur4fOyhyxi2iQy
	9KCMbR8bYGLnMFtVSNBIMzWOb7EB0KzjdQqC8mbn5b4z4DpTuw0tCCg==
X-Received: by 2002:a05:600c:190b:b0:421:29f4:4f33 with SMTP id 5b1f17b1804b1-4212e047540mr57034575e9.1.1717365794048;
        Sun, 02 Jun 2024 15:03:14 -0700 (PDT)
X-Received: by 2002:a05:600c:190b:b0:421:29f4:4f33 with SMTP id 5b1f17b1804b1-4212e047540mr57034025e9.1.1717365793399;
        Sun, 02 Jun 2024 15:03:13 -0700 (PDT)
Return-Path: <mst@redhat.com>
Received: from redhat.com ([2a0d:6fc7:440:950b:d4e:f17a:17d8:5699])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35dd04d9c89sm7041692f8f.60.2024.06.02.15.03.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jun 2024 15:03:12 -0700 (PDT)
Date: Sun, 2 Jun 2024 18:03:05 -0400
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
	lixianglai@loongson.cn, npiggin@gmail.com, harshpb@linux.ibm.com,
	linuxarm@huawei.com
Subject: Re: [PATCH V12 0/8] Add architecture agnostic code to support vCPU
 Hotplug
Message-ID: <20240602180241-mutt-send-email-mst@kernel.org>
References: <20240529234241.205053-1-salil.mehta@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20240529234241.205053-1-salil.mehta@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-TUID: MI0D0z5Q7kN/

On Thu, May 30, 2024 at 12:42:33AM +0100, Salil Mehta wrote:
> Virtual CPU hotplug support is being added across various architectures[1][3].
> This series adds various code bits common across all architectures:
> 
> 1. vCPU creation and Parking code refactor [Patch 1]
> 2. Update ACPI GED framework to support vCPU Hotplug [Patch 2,3]
> 3. ACPI CPUs AML code change [Patch 4,5]
> 4. Helper functions to support unrealization of CPU objects [Patch 6,7]
> 5. Docs [Patch 8]
> 
> 
> Repository:
> 
> [*] https://github.com/salil-mehta/qemu.git virt-cpuhp-armv8/rfc-v3.arch.agnostic.v12
> 
> NOTE: This series is meant to work in conjunction with Architecture specific patch-set.
> For ARM, this will work in combination of the architecture specific part based on
> RFC V2 [1]. This architecture specific patch-set RFC V3 shall be floated soon and is
> present at below location
> 
> [*] https://github.com/salil-mehta/qemu/tree/virt-cpuhp-armv8/rfc-v3-rc1
> 


Igor plan to take a look?

> Revision History:
> 
> Patch-set  V11 -> V12
> 1. Addressed Harsh Prateek Bora's (IBM) comment
>    - Changed @cpu to @vcpu_id in the kvm_unpark_vcpu protoype header/
> 2. Added Zhao Liu's (Intel) Tested-by for whole series
>    - Qtest does not breaks on Intel platforms now.
> 3. Added Zhao Liu's (Intel) Reviewed-by for [PATCH V11 {1/8 - 3/8}]
> Link: https://lore.kernel.org/qemu-devel/ZlRSPuJGBgyEUW6w@intel.com/
> Link: https://lore.kernel.org/qemu-devel/a5f3d78e-cfed-441f-9c56-e3e78fa5edee@linux.ibm.com/
> 
> Patch-set  V10 -> V11
> 1. Addressed Nicholas Piggin's (IBM) comment
>    - moved the traces in kvm_unpark_vcpu and kvm_create_vcpu at the end
>    - Added the Reviewed-by Tag for [PATCH V10 1/8]
> 2.  Addressed Alex Bennée's (Linaro) comments
>    - Added a note explaining dependency of the [PATCH V10 7/8] on Arch specific patch-set
> Link: https://lore.kernel.org/qemu-devel/D1FS5GOOFWWK.2PNRIVL0V6DBL@gmail.com/ 
> Link: https://lore.kernel.org/qemu-devel/87frubi402.fsf@draig.linaro.org/
> 
> Patch-set  V9 -> V10
> 1. Addressed Nicholas Piggin's (IBM) & Philippe Mathieu-Daudé (Linaro) comments
>    - carved out kvm_unpark_vcpu and added its trace
>    - Widened the scope of the kvm_unpark_vcpu so that it can be used by generic framework
>      being thought out
> Link: https://lore.kernel.org/qemu-devel/20240519210620.228342-1-salil.mehta@huawei.com/
> Link: https://lore.kernel.org/qemu-devel/e94b0e14-efee-4050-9c9f-08382a36b63a@linaro.org/
> 
> Patch-set  V8 -> V9
> 1. Addressed Vishnu Pajjuri's (Ampere) comments
>    - Added kvm_fd to trace in kvm_create_vcpu
>    - Some clean ups: arch vcpu-id and sbd variable
>    - Added the missed initialization of cpu->gdb_num_regs
> 2. Addressed the commnet from Zhao Liu (Intel)
>    - Make initialization of CPU Hotplug state conditional (possible_cpu_arch_ids!=NULL)
> Link: https://lore.kernel.org/qemu-devel/20240312020000.12992-1-salil.mehta@huawei.com/
> 
> Patch-set V7 -> V8
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
>  accel/kvm/kvm-all.c                    | 95 +++++++++++++++++---------
>  accel/kvm/kvm-cpus.h                   | 23 +++++++
>  accel/kvm/trace-events                 |  5 +-
>  docs/specs/acpi_hw_reduced_hotplug.rst |  3 +-
>  gdbstub/gdbstub.c                      | 13 ++++
>  hw/acpi/acpi-cpu-hotplug-stub.c        |  6 ++
>  hw/acpi/cpu.c                          | 33 ++++++---
>  hw/acpi/generic_event_device.c         | 21 ++++++
>  hw/core/cpu-common.c                   |  1 -
>  hw/i386/acpi-build.c                   |  3 +-
>  include/exec/cpu-common.h              |  8 +++
>  include/exec/gdbstub.h                 |  6 ++
>  include/hw/acpi/cpu.h                  |  5 +-
>  include/hw/acpi/cpu_hotplug.h          |  4 ++
>  include/hw/acpi/generic_event_device.h |  4 ++
>  include/hw/core/cpu.h                  |  1 +
>  system/physmem.c                       | 29 ++++++++
>  17 files changed, 212 insertions(+), 48 deletions(-)
> 
> -- 
> 2.34.1
