Received: by 2002:a17:906:bc9a:b0:a66:557b:2f6e with SMTP id lv26csp267889ejb;
        Wed, 5 Jun 2024 07:03:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUZAFJlKdzIKnBVaBMGr/WrLfAxP8VWk3QqciipLQFgIEvwAFL2LD6iHR2xp7r+cJ1/iwHIsRW7BaoQNVPYDCzU4r7eJ/X5
X-Google-Smtp-Source: AGHT+IEqBFKkgTD8np09KUE9ZeGZPhpjRo2wI7cY7DlR2gnkV4S1swj7M5XO0u/gTbwpICBApJsI
X-Received: by 2002:a05:6122:1899:b0:4eb:50b:a0d1 with SMTP id 71dfb90a1353d-4eb3a3fa2femr2207407e0c.4.1717596220450;
        Wed, 05 Jun 2024 07:03:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717596220; cv=none;
        d=google.com; s=arc-20160816;
        b=sc3Be1VNvADoXmJqQmtZGOuLG6+Sd52inkxnoTkG7ljh9MJDonT/1ieukeELwjfWtD
         li2NXqzMk4pWq4zQmavzNi5kC/6H2ft92gBDYIDZCL39fhT8fPhcEx0o14BTZXs51Jkz
         fTs+TieESQas3xKhjBRG9vtvqwD0NNlIubXiSlhMUVGLhSZ7siD31XNaJRLpdxUooQQ0
         DcSDchoQzCzK1zn0BEmdD9BQVAebmmzBIboJI5Cr3vuN+BVR64GGUy5BhsycqebsaNci
         KKi9u6Q4c76nU3Sqj/3tqCyu0XXFMnFgimL0RKC+cmbIAbjbYDuPWXvfaKOy8ctnNopy
         lQXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=moZSiVmkO8pYe0nu67lrtuA9zEeA4IWu4yrV7ISM53k=;
        fh=o4qkIT0Z6KBKmFZYcJ+cLPvd2P7FOTwGDop6pXowDIw=;
        b=dN7QJOK6YKQzPvp3frvZ2ABnqCvelvn7xtAe9ZstiEwrz4z8L/1amA1CWMMwdFTIXP
         KAD3IgH2ZNXA95Rh7qS57VVsOvu7KGO6EN/2+h7Gyjb8/aLJ9fmH0c0M0eWMiN2FkYgB
         lN2QoR7ZNqp3O1tzFgyc6gKehO/ZEMxWkOV6daO1HkzS1EdoGsbIF1kEzpumsufWgBvM
         x5/UsmZZ07XiTXu4Z9NJVRTvePVYdXLxRG4PTy3U8Rr8pXa8gVI/aZ2rLsQfMn61Kol1
         fecB/gdtHN3ZWSpOlvA81cMhCchWumtA3yHWqBR7Pyg5wDPtcgkPcoNencxOr/NtePe5
         CMaQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=er42az1p;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 71dfb90a1353d-4eb046935d3si1899637e0c.228.2024.06.05.07.03.40
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 07:03:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=er42az1p;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717596216;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=moZSiVmkO8pYe0nu67lrtuA9zEeA4IWu4yrV7ISM53k=;
	b=er42az1pRMWE5iGYvN2ouhpN94IX43X8ZrS2C3enDnVdFnY1ZNZNi1/fn3JCXBiM75yJfJ
	NGmdtLNHhrJhIknlvGqxzyQe6mJAmnmtf/rwg5j8P1rOhFRGWGz4QoEiq98RLvJj+iVikg
	7ODnOGB7gdzS7cAY8VCFlgaHzxpcwDM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-635-ox1RValZPLGXIUMtHOK0DQ-1; Wed, 05 Jun 2024 10:03:33 -0400
X-MC-Unique: ox1RValZPLGXIUMtHOK0DQ-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-35858762c31so370150f8f.0
        for <alex.bennee@linaro.org>; Wed, 05 Jun 2024 07:03:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717596210; x=1718201010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y7PR6GhNAef0DuVtjtWgjtfLtJjuA5O3jhHy8g7gxVM=;
        b=IjVl0651dinOCrwPQdGqcs5NEhStYdRupcGxD1EbjsoPq2M3dDwjVJubk+KsU+EcBE
         je5VeCwd686lgG5MlCgJfULyzk6C8z6urGs3dMKxNfrIyBAAXip26sT9t0X85OOcYmpW
         JV27cvTJ2Nt4DVj8w/cYHKBQjLVO5ymu7FGgL3DPPaX0ha9yuZsSskkCWoNtSOmj3kQc
         5nSY7ia/3af44sYviriSCPUSQTeBvTbwAo0s4yEoiCsRhp2l2zRTjJCqNTJrDQ5oPPJL
         VykexQksyDcqDKSQagsXnpMjxo7aV7S8myiLth58/QsDEd/8BQB0mbPfuFTTdraOc9CD
         M2vA==
X-Forwarded-Encrypted: i=1; AJvYcCU8B3uPMq2ovxmCcj+dWmWEAWKq6DQ1CblkwkjEM1JnsTNTHHqCF0E1qZ1nT+TNFoPgCrRxoq8X9WwwiU/2ueIcVD8Guoh8
X-Gm-Message-State: AOJu0YwWqe4lclKxcONMqqv+6/qBljuptvPYLnBaKsFynmvk/i3Npdtb
	D2qISUn8UEH6PLKpW8XggMLLrl+Ndb8UiP1D59GiChm9cgoHHV9wn6GpjSGRyjPQ5DdfdYb8OoJ
	ZL39PmSt56aiXBd9LugVp/ZsHAd6ObE6hAgzNDi1+b2tYCv0GFjCgNzsWvItFJkIP
X-Received: by 2002:adf:ec0e:0:b0:34d:9604:3500 with SMTP id ffacd0b85a97d-35e7c519cfcmr5101204f8f.4.1717596209993;
        Wed, 05 Jun 2024 07:03:29 -0700 (PDT)
X-Received: by 2002:adf:ec0e:0:b0:34d:9604:3500 with SMTP id ffacd0b85a97d-35e7c519cfcmr5101167f8f.4.1717596209519;
        Wed, 05 Jun 2024 07:03:29 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35dd062fe96sm14623887f8f.67.2024.06.05.07.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 07:03:29 -0700 (PDT)
Date: Wed, 5 Jun 2024 16:03:27 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Salil Mehta <salil.mehta@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, maz@kernel.org, jean-philippe@linaro.org,
 jonathan.cameron@huawei.com, lpieralisi@kernel.org,
 peter.maydell@linaro.org, richard.henderson@linaro.org,
 andrew.jones@linux.dev, david@redhat.com, philmd@linaro.org,
 eric.auger@redhat.com, oliver.upton@linux.dev, pbonzini@redhat.com,
 will@kernel.org, gshan@redhat.com, rafael@kernel.org,
 alex.bennee@linaro.org, linux@armlinux.org.uk,
 darren@os.amperecomputing.com, ilkka@os.amperecomputing.com,
 vishnu@os.amperecomputing.com, karl.heubaum@oracle.com,
 miguel.luis@oracle.com, salil.mehta@opnsrc.net, zhukeqian1@huawei.com,
 wangxiongfeng2@huawei.com, wangyanan55@huawei.com, jiakernel2@gmail.com,
 maobibo@loongson.cn, lixianglai@loongson.cn, npiggin@gmail.com,
 harshpb@linux.ibm.com, linuxarm@huawei.com
Subject: Re: [PATCH V12 0/8] Add architecture agnostic code to support vCPU
 Hotplug
Message-ID: <20240605160327.3c71f4ab@imammedo.users.ipa.redhat.com>
In-Reply-To: <20240602180241-mutt-send-email-mst@kernel.org>
References: <20240529234241.205053-1-salil.mehta@huawei.com>
	<20240602180241-mutt-send-email-mst@kernel.org>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.42; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 05P/JI/23l65

On Sun, 2 Jun 2024 18:03:05 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Thu, May 30, 2024 at 12:42:33AM +0100, Salil Mehta wrote:
> > Virtual CPU hotplug support is being added across various architectures=
[1][3].
> > This series adds various code bits common across all architectures:
> >=20
> > 1. vCPU creation and Parking code refactor [Patch 1]
> > 2. Update ACPI GED framework to support vCPU Hotplug [Patch 2,3]
> > 3. ACPI CPUs AML code change [Patch 4,5]
> > 4. Helper functions to support unrealization of CPU objects [Patch 6,7]
> > 5. Docs [Patch 8]
> >=20
> >=20
> > Repository:
> >=20
> > [*] https://github.com/salil-mehta/qemu.git virt-cpuhp-armv8/rfc-v3.arc=
h.agnostic.v12
> >=20
> > NOTE: This series is meant to work in conjunction with Architecture spe=
cific patch-set.
> > For ARM, this will work in combination of the architecture specific par=
t based on
> > RFC V2 [1]. This architecture specific patch-set RFC V3 shall be floate=
d soon and is
> > present at below location
> >=20
> > [*] https://github.com/salil-mehta/qemu/tree/virt-cpuhp-armv8/rfc-v3-rc=
1
> >  =20
>=20
>=20
> Igor plan to take a look?

Yep, I plan to review it

>=20
> > Revision History:
> >=20
> > Patch-set  V11 -> V12
> > 1. Addressed Harsh Prateek Bora's (IBM) comment
> >    - Changed @cpu to @vcpu_id in the kvm_unpark_vcpu protoype header/
> > 2. Added Zhao Liu's (Intel) Tested-by for whole series
> >    - Qtest does not breaks on Intel platforms now.
> > 3. Added Zhao Liu's (Intel) Reviewed-by for [PATCH V11 {1/8 - 3/8}]
> > Link: https://lore.kernel.org/qemu-devel/ZlRSPuJGBgyEUW6w@intel.com/
> > Link: https://lore.kernel.org/qemu-devel/a5f3d78e-cfed-441f-9c56-e3e78f=
a5edee@linux.ibm.com/
> >=20
> > Patch-set  V10 -> V11
> > 1. Addressed Nicholas Piggin's (IBM) comment
> >    - moved the traces in kvm_unpark_vcpu and kvm_create_vcpu at the end
> >    - Added the Reviewed-by Tag for [PATCH V10 1/8]
> > 2.  Addressed Alex Benn=C3=A9e's (Linaro) comments
> >    - Added a note explaining dependency of the [PATCH V10 7/8] on Arch =
specific patch-set
> > Link: https://lore.kernel.org/qemu-devel/D1FS5GOOFWWK.2PNRIVL0V6DBL@gma=
il.com/=20
> > Link: https://lore.kernel.org/qemu-devel/87frubi402.fsf@draig.linaro.or=
g/
> >=20
> > Patch-set  V9 -> V10
> > 1. Addressed Nicholas Piggin's (IBM) & Philippe Mathieu-Daud=C3=A9 (Lin=
aro) comments
> >    - carved out kvm_unpark_vcpu and added its trace
> >    - Widened the scope of the kvm_unpark_vcpu so that it can be used by=
 generic framework
> >      being thought out
> > Link: https://lore.kernel.org/qemu-devel/20240519210620.228342-1-salil.=
mehta@huawei.com/
> > Link: https://lore.kernel.org/qemu-devel/e94b0e14-efee-4050-9c9f-08382a=
36b63a@linaro.org/
> >=20
> > Patch-set  V8 -> V9
> > 1. Addressed Vishnu Pajjuri's (Ampere) comments
> >    - Added kvm_fd to trace in kvm_create_vcpu
> >    - Some clean ups: arch vcpu-id and sbd variable
> >    - Added the missed initialization of cpu->gdb_num_regs
> > 2. Addressed the commnet from Zhao Liu (Intel)
> >    - Make initialization of CPU Hotplug state conditional (possible_cpu=
_arch_ids!=3DNULL)
> > Link: https://lore.kernel.org/qemu-devel/20240312020000.12992-1-salil.m=
ehta@huawei.com/
> >=20
> > Patch-set V7 -> V8
> > 1. Rebased and Fixed the conflicts
> >=20
> > Patch-set  V6 -> V7
> > 1. Addressed Alex Benn=C3=A9e's comments
> >    - Updated the docs
> > 2. Addressed Igor Mammedov's comments
> >    - Merged patches [Patch V6 3/9] & [Patch V6 7/9] with [Patch V6 4/9]
> >    - Updated commit-log of [Patch V6 1/9] and [Patch V6 5/9]    =20
> > 3. Added Shaoqin Huang's Reviewed-by tags for whole series.
> > Link: https://lore.kernel.org/qemu-devel/20231013105129.25648-1-salil.m=
ehta@huawei.com/
> >=20
> > Patch-set  V5 -> V6
> > 1. Addressed Gavin Shan's comments
> >    - Fixed the assert() ranges of address spaces
> >    - Rebased the patch-set to latest changes in the qemu.git
> >    - Added Reviewed-by tags for patches {8,9}
> > 2. Addressed Jonathan Cameron's comments
> >    - Updated commit-log for [Patch V5 1/9] with mention of trace events
> >    - Added Reviewed-by tags for patches {1,5}
> > 3. Added Tested-by tags from Xianglai Li
> > 4. Fixed checkpatch.pl error "Qemu -> QEMU" in [Patch V5 1/9]=20
> > Link: https://lore.kernel.org/qemu-devel/20231011194355.15628-1-salil.m=
ehta@huawei.com/
> >=20
> > Patch-set  V4 -> V5
> > 1. Addressed Gavin Shan's comments
> >    - Fixed the trace events print string for kvm_{create,get,park,destr=
oy}_vcpu
> >    - Added Reviewed-by tag for patch {1}
> > 2. Added Shaoqin Huang's Reviewed-by tags for Patches {2,3}
> > 3. Added Tested-by Tag from Vishnu Pajjuri to the patch-set
> > 4. Dropped the ARM specific [Patch V4 10/10]
> > Link: https://lore.kernel.org/qemu-devel/20231009203601.17584-1-salil.m=
ehta@huawei.com/
> >=20
> > Patch-set  V3 -> V4
> > 1. Addressed David Hilderbrand's comments
> >    - Fixed the wrong doc comment of kvm_park_vcpu API prototype
> >    - Added Reviewed-by tags for patches {2,4}
> > Link: https://lore.kernel.org/qemu-devel/20231009112812.10612-1-salil.m=
ehta@huawei.com/
> >=20
> > Patch-set  V2 -> V3
> > 1. Addressed Jonathan Cameron's comments
> >    - Fixed 'vcpu-id' type wrongly changed from 'unsigned long' to 'inte=
ger'
> >    - Removed unnecessary use of variable 'vcpu_id' in kvm_park_vcpu
> >    - Updated [Patch V2 3/10] commit-log with details of ACPI_CPU_SCAN_M=
ETHOD macro
> >    - Updated [Patch V2 5/10] commit-log with details of conditional eve=
nt handler method
> >    - Added Reviewed-by tags for patches {2,3,4,6,7}
> > 2. Addressed Gavin Shan's comments
> >    - Remove unnecessary use of variable 'vcpu_id' in kvm_par_vcpu
> >    - Fixed return value in kvm_get_vcpu from -1 to -ENOENT
> >    - Reset the value of 'gdb_num_g_regs' in gdb_unregister_coprocessor_=
all
> >    - Fixed the kvm_{create,park}_vcpu prototypes docs
> >    - Added Reviewed-by tags for patches {2,3,4,5,6,7,9,10}
> > 3. Addressed one earlier missed comment by Alex Benn=C3=A9e in RFC V1
> >    - Added traces instead of DPRINTF in the newly added and some existi=
ng functions
> > Link: https://lore.kernel.org/qemu-devel/20230930001933.2660-1-salil.me=
hta@huawei.com/
> >=20
> > Patch-set V1 -> V2
> > 1. Addressed Alex Benn=C3=A9e's comments
> >    - Refactored the kvm_create_vcpu logic to get rid of goto
> >    - Added the docs for kvm_{create,park}_vcpu prototypes
> >    - Splitted the gdbstub and AddressSpace destruction change into sepa=
rate patches
> >    - Added Reviewed-by tags for patches {2,10}
> > Link: https://lore.kernel.org/qemu-devel/20230929124304.13672-1-salil.m=
ehta@huawei.com/
> >=20
> > References:
> >=20
> > [1] https://lore.kernel.org/qemu-devel/20230926100436.28284-1-salil.meh=
ta@huawei.com/
> > [2] https://lore.kernel.org/all/20230913163823.7880-1-james.morse@arm.c=
om/
> > [3] https://lore.kernel.org/qemu-devel/cover.1695697701.git.lixianglai@=
loongson.cn/
> >=20
> >=20
> >=20
> > Salil Mehta (8):
> >   accel/kvm: Extract common KVM vCPU {creation,parking} code
> >   hw/acpi: Move CPU ctrl-dev MMIO region len macro to common header fil=
e
> >   hw/acpi: Update ACPI GED framework to support vCPU Hotplug
> >   hw/acpi: Update GED _EVT method AML with CPU scan
> >   hw/acpi: Update CPUs AML with cpu-(ctrl)dev change
> >   physmem: Add helper function to destroy CPU AddressSpace
> >   gdbstub: Add helper function to unregister GDB register space
> >   docs/specs/acpi_hw_reduced_hotplug: Add the CPU Hotplug Event Bit
> >=20
> >  accel/kvm/kvm-all.c                    | 95 +++++++++++++++++---------
> >  accel/kvm/kvm-cpus.h                   | 23 +++++++
> >  accel/kvm/trace-events                 |  5 +-
> >  docs/specs/acpi_hw_reduced_hotplug.rst |  3 +-
> >  gdbstub/gdbstub.c                      | 13 ++++
> >  hw/acpi/acpi-cpu-hotplug-stub.c        |  6 ++
> >  hw/acpi/cpu.c                          | 33 ++++++---
> >  hw/acpi/generic_event_device.c         | 21 ++++++
> >  hw/core/cpu-common.c                   |  1 -
> >  hw/i386/acpi-build.c                   |  3 +-
> >  include/exec/cpu-common.h              |  8 +++
> >  include/exec/gdbstub.h                 |  6 ++
> >  include/hw/acpi/cpu.h                  |  5 +-
> >  include/hw/acpi/cpu_hotplug.h          |  4 ++
> >  include/hw/acpi/generic_event_device.h |  4 ++
> >  include/hw/core/cpu.h                  |  1 +
> >  system/physmem.c                       | 29 ++++++++
> >  17 files changed, 212 insertions(+), 48 deletions(-)
> >=20
> > --=20
> > 2.34.1 =20
>=20
