Received: by 2002:a17:504:1dd4:b0:1be9:327d:8ee3 with SMTP id b20csp2263734nji;
        Mon, 15 Jul 2024 06:54:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXVVqGPruUvqOXRN7SG+w9uHv4GzNmX2oHwR6g4M6+1Uq4MYVGD2CriqT7Na53fhE7H1ePx25LyDYni90+z7uhoQH6F3sAH
X-Google-Smtp-Source: AGHT+IF/lJ74yYlq+whxFk/5vuCb5MUnXD7W3kQfFTR3V0irlAczTjCdhzlAR899uqkVmwkT0K0i
X-Received: by 2002:a05:620a:5802:b0:79f:b60:bc28 with SMTP id af79cd13be357-79f19a6ebfbmr1835429885a.23.1721051684396;
        Mon, 15 Jul 2024 06:54:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721051684; cv=none;
        d=google.com; s=arc-20160816;
        b=a+8k+n6/B3AbMmQAKudxu8sn4YbrtnRv8GLWrDHlf/LeTy/FW85XXoE9hlCbJf9KWm
         PB675s1Gm9u7i5+8dFQyJNw6ZTm+koU5ah9npcIaD6R99v1B5Ymm2HRBKlqSStjtJFta
         VouTsFVUhW2eQ4tbcg06jkf0GMDko7x1YXeHj6QkKrgeCqGAmiilX39HO/KWTl045WrC
         uq2FtkOGlCEvqYWjC4O8DQG+6hjKtX0BDMhBBDZXXqahfEvzue3kqlhtuR3MNz8vboz3
         5Ug+ZQrejoQPV4e0fTDusReiHyg6TeWCLod0/FgnAhOYX/w7HwJULcGoXBAdSoGG0Uin
         h8kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=IEBCmgVoWlFc9zrCTlnEfZMoV65B5+owEAxveMQzsXc=;
        fh=yBqNK3g3gq8IDX+xWwf+9UdaSFVT3J5quoOvEmB1iMk=;
        b=oa760zO8A0Qh/R2EdtOYPCa0ANwOG5r1DYPZG3n1r2PbGugl6HREag2TmjcJfvSlHe
         X5jxObwOYfUsNg2hUpfIkPklwdqr0XcrfkrJocl5IhgpAtHalN5MoLfPEvEU1CYotHZg
         hPwrgriX8QdkXqW5sFIDE7ZxIRfwBC0dFFjmy4YnaBGeLLPKLSPF9TsoH3amBFDj8msN
         BrXWdQaJB5ScbPztZ2A+VA9qk8Oe22AS7exxIdtfPuBC4woTOfsdYfd7lp3jMCnUrytq
         DE7+fXkpZx1066SA1uUvha/8CK6F0XLXlHHK5H2r3z2ta1dNrp0FLshh66NGrmiZATR+
         OfcA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=H9spHrOU;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7a160c7db9csi518017985a.606.2024.07.15.06.54.44
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 06:54:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=H9spHrOU;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721051684;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IEBCmgVoWlFc9zrCTlnEfZMoV65B5+owEAxveMQzsXc=;
	b=H9spHrOUJTTNR1Acy87+iS8Lp18p3eTDG6WDEV+eI1U/xvObXTyfPTGPplclRCrwrfNRhH
	VlXeU3sDHbKz7xTXfppHDpN4FsDFpyCOtniacH828mhMoV3oTLyIvEVev2s69J7EHaWVnh
	K7d+eC3NYkcu0kq3OtwgRFcdP1b9mks=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-327-8L_0DimhPteGANG_dlJK4A-1; Mon, 15 Jul 2024 09:54:40 -0400
X-MC-Unique: 8L_0DimhPteGANG_dlJK4A-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-42667cc80e8so30960175e9.2
        for <alex.bennee@linaro.org>; Mon, 15 Jul 2024 06:54:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721051679; x=1721656479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O+1TcXPMJZRHAMo8zpPLaVS6N5uxXxVW7oE+ZXwvL+Q=;
        b=GvidgocLWPIkQXU9rTMHOygX70FZeZH9lS5STqxMG9fgFKMrGvGGBjHl21LVmU7R41
         Q0+26vYGXdqIwUD8bJ6M6kntnCaM7/2Ay2oOl+yK4MmRy4VYMEYnR8G/MDILqlRQcZOP
         3K3mt5C+aHSxR6YCdVHn4zTQv52DB2VGaHXlNTPFZZ+RujQVpjDCPF4BkFi8aKpQD6nI
         fitE8mjp3JJicz4IekoP5QHt3/QgckVi5+nWHUtqG/w+BhAngGCYTRPNyDAGb6anTc6C
         EIeWrxnhz0yU6ab8b54BX1TlKE2SN2xh7gJNkCsHHFZ8tzwvEbSJ0k0Gue8sQmy90I99
         11rw==
X-Forwarded-Encrypted: i=1; AJvYcCWutR7Wqry+0EF6u4lc5fKuCOv68CKpA5/HZ2/+D+Q7auEE98pEGhmj0mqAeh5YAE/SxPNS4kRaTGCA6dlcxbfShmwH1kan
X-Gm-Message-State: AOJu0Yz9s2C7ttuXqS48LQebSNcwiimB76COVTYKqDUIgYsOrrWqpKrG
	BXnXPzLJlo1UclVDFZj+cEAgNXQEHIxODTDiyy8s44QJQ7fnJFmhW4p66YJohNlL8PE64fjrT6i
	O/zPVcqQz+4E38Qu0JL1GddHNMguFfqiWRgt3Lc1NxrQJO8e33cO29w==
X-Received: by 2002:adf:f64f:0:b0:367:97fd:1d75 with SMTP id ffacd0b85a97d-367cea7cde6mr11483859f8f.27.1721051679443;
        Mon, 15 Jul 2024 06:54:39 -0700 (PDT)
X-Received: by 2002:adf:f64f:0:b0:367:97fd:1d75 with SMTP id ffacd0b85a97d-367cea7cde6mr11483834f8f.27.1721051679017;
        Mon, 15 Jul 2024 06:54:39 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427a5e77488sm89467615e9.9.2024.07.15.06.54.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 06:54:38 -0700 (PDT)
Date: Mon, 15 Jul 2024 15:54:36 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Salil Mehta <salil.mehta@huawei.com>
Cc: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <maz@kernel.org>,
 <jean-philippe@linaro.org>, <jonathan.cameron@huawei.com>,
 <lpieralisi@kernel.org>, <peter.maydell@linaro.org>,
 <richard.henderson@linaro.org>, <andrew.jones@linux.dev>,
 <david@redhat.com>, <philmd@linaro.org>, <eric.auger@redhat.com>,
 <oliver.upton@linux.dev>, <pbonzini@redhat.com>, <mst@redhat.com>,
 <will@kernel.org>, <gshan@redhat.com>, <rafael@kernel.org>,
 <alex.bennee@linaro.org>, <linux@armlinux.org.uk>,
 <darren@os.amperecomputing.com>, <ilkka@os.amperecomputing.com>,
 <vishnu@os.amperecomputing.com>, <karl.heubaum@oracle.com>,
 <miguel.luis@oracle.com>, <salil.mehta@opnsrc.net>,
 <zhukeqian1@huawei.com>, <wangxiongfeng2@huawei.com>,
 <wangyanan55@huawei.com>, <jiakernel2@gmail.com>, <maobibo@loongson.cn>,
 <lixianglai@loongson.cn>, <npiggin@gmail.com>, <harshpb@linux.ibm.com>,
 <linuxarm@huawei.com>
Subject: Re: [PATCH V15 0/7] Add architecture agnostic code to support vCPU
 Hotplug
Message-ID: <20240715155436.577d34c5@imammedo.users.ipa.redhat.com>
In-Reply-To: <20240713182516.1457-1-salil.mehta@huawei.com>
References: <20240713182516.1457-1-salil.mehta@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: XzMJ0CRRaZsW

On Sat, 13 Jul 2024 19:25:09 +0100
Salil Mehta <salil.mehta@huawei.com> wrote:

> [Note: References are present at the last after the revision history]
>=20
> Virtual CPU hotplug support is being added across various architectures [=
1][3].
> This series adds various code bits common across all architectures:
>=20
> 1. vCPU creation and Parking code refactor [Patch 1]
> 2. Update ACPI GED framework to support vCPU Hotplug [Patch 2,3]
> 3. ACPI CPUs AML code change [Patch 4,5]
> 4. Helper functions to support unrealization of CPU objects [Patch 6,7]

with patch 1 and 3 fixed should be good to go.

Salil,
Can you remind me what happened to migration part of this?
Ideally it should be a part of of this series as it should be common
for everything that uses GED and should be a conditional part
of GED's VMSTATE.

If this series is just a common base and no actual hotplug
on top of it is merged in this release (provided patch 13 is fixed),
I'm fine with migration bits being a separate series on top.

However if some machine would be introducing cpu hotplug in
the same release, then the migration part should be merged before
it or be a part that cpu hotplug series.=20
=20
> Repository:
>=20
> [*] Architecture *Agnostic* Patch-set (This series)
>    V14: https://github.com/salil-mehta/qemu.git virt-cpuhp-armv8/rfc-v3.a=
rch.agnostic.v15
>=20
>    NOTE: This series is meant to work in conjunction with the architectur=
e-specific
>    patch-set. For ARM, a combined patch-set (architecture agnostic + spec=
ific) was
>    earlier pushed as RFC V2 [1]. Later, RFC V2 was split into the ARM Arc=
hitecture
>    specific patch-set RFC V3 [4] (a subset of RFC V2) and the architectur=
e agnostic
>    patch-set. Patch-set V14 is the latest version in that series. This se=
ries
>    works in conjunction with RFC V4-rc2, present at the following link.
>=20
> [*] ARM Architecture *Specific* Patch-set
>    RFC V3 [4]: https://github.com/salil-mehta/qemu.git virt-cpuhp-armv8/r=
fc-v3
>    RFC V4-rc2: https://github.com/salil-mehta/qemu.git virt-cpuhp-armv8/r=
fc-v4-rc2 (combined)
>=20
>=20
> Revision History:
>=20
> Patch-set V14 -> V15
> 1. Addressed commnet from Igor Mammedov's on [PATCH V14 4/7]
>    - Removed ACPI_CPU_SCAN_METHOD
>    - Introduced AML_GED_EVT_CPU_SCAN_METHOD ("\\_SB.GED.CPSCN") macro
> 2. Fix the stray change of "assert (" in "PATCH V14 3/7"
> Link: https://lore.kernel.org/qemu-devel/20240712134201.214699-4-salil.me=
hta@huawei.com/
>=20
> Patch-set V13 -> V14
> 1. Addressed Igor Mammedov's following review comments
>    - Mentioned abput new external APIs in the header note of [PATCH 1/7]
>    - Merged Doc [PATCH V13 8/8] with [PATCH V14 3/7]
>    - Introduced GED realize function for various CPU Hotplug regions init=
ializations
>    - Added back event handler method to indirectly expose \\_SB.CPUS.CSCN=
 to GED
>      _EVT. Like for ARM, it would be through \\_SB.GED.CSCN event handler=
 method
>    - Collected the Ack given for [Patch V13 6/8]
>    - Added back the gfree'ing of GDB regs in common finalize and made it =
conditional
>    - Updated the header notes of [PATCH V13 3/8,4/8,5/8] to reflect the c=
hanges
>=20
> Patch-set  V12 -> V13
> 1. Added Reviewed-by Tag of Harsh Prateek Bora's (IBM) [PATCH V12 1/8]
> 2. Moved the kvm_{create,park,unpark}_vcpu prototypes from accel/kvm/kvm-=
cpus.h
>    to include/sysemu/kvm.h. These can later be exported through AccelOps.
> Link: https://lore.kernel.org/qemu-devel/62f55169-1796-4d8e-a35d-7f003a17=
2750@linux.ibm.com/
>=20
> Patch-set  V11 -> V12
> 1. Addressed Harsh Prateek Bora's (IBM) comment
>    - Changed @cpu to @vcpu_id in the kvm_unpark_vcpu protoype header/
> 2. Added Zhao Liu's (Intel) Tested-by for whole series
>    - Qtest does not breaks on Intel platforms now.
> 3. Added Zhao Liu's (Intel) Reviewed-by for [PATCH V11 {1/8 - 3/8}]
> Link: https://lore.kernel.org/qemu-devel/ZlRSPuJGBgyEUW6w@intel.com/
> Link: https://lore.kernel.org/qemu-devel/a5f3d78e-cfed-441f-9c56-e3e78fa5=
edee@linux.ibm.com/
>=20
> Patch-set  V10 -> V11
> 1. Addressed Nicholas Piggin's (IBM) comment
>    - moved the traces in kvm_unpark_vcpu and kvm_create_vcpu at the end
>    - Added the Reviewed-by Tag for [PATCH V10 1/8]
> 2.  Addressed Alex Benn=C3=A9e's (Linaro) comments
>    - Added a note explaining dependency of the [PATCH V10 7/8] on Arch sp=
ecific patch-set
> Link: https://lore.kernel.org/qemu-devel/D1FS5GOOFWWK.2PNRIVL0V6DBL@gmail=
.com/=20
> Link: https://lore.kernel.org/qemu-devel/87frubi402.fsf@draig.linaro.org/
>=20
> Patch-set  V9 -> V10
> 1. Addressed Nicholas Piggin's (IBM) & Philippe Mathieu-Daud=C3=A9 (Linar=
o) comments
>    - carved out kvm_unpark_vcpu and added its trace
>    - Widened the scope of the kvm_unpark_vcpu so that it can be used by g=
eneric framework
>      being thought out
> Link: https://lore.kernel.org/qemu-devel/20240519210620.228342-1-salil.me=
hta@huawei.com/
> Link: https://lore.kernel.org/qemu-devel/e94b0e14-efee-4050-9c9f-08382a36=
b63a@linaro.org/
>=20
> Patch-set  V8 -> V9
> 1. Addressed Vishnu Pajjuri's (Ampere) comments
>    - Added kvm_fd to trace in kvm_create_vcpu
>    - Some clean ups: arch vcpu-id and sbd variable
>    - Added the missed initialization of cpu->gdb_num_regs
> 2. Addressed the commnet from Zhao Liu (Intel)
>    - Make initialization of CPU Hotplug state conditional (possible_cpu_a=
rch_ids!=3DNULL)
> Link: https://lore.kernel.org/qemu-devel/20240312020000.12992-1-salil.meh=
ta@huawei.com/
>=20
> Patch-set V7 -> V8
> 1. Rebased and Fixed the conflicts
>=20
> Patch-set  V6 -> V7
> 1. Addressed Alex Benn=C3=A9e's comments
>    - Updated the docs
> 2. Addressed Igor Mammedov's comments
>    - Merged patches [Patch V6 3/9] & [Patch V6 7/9] with [Patch V6 4/9]
>    - Updated commit-log of [Patch V6 1/9] and [Patch V6 5/9]    =20
> 3. Added Shaoqin Huang's Reviewed-by tags for whole series.
> Link: https://lore.kernel.org/qemu-devel/20231013105129.25648-1-salil.meh=
ta@huawei.com/
>=20
> Patch-set  V5 -> V6
> 1. Addressed Gavin Shan's comments
>    - Fixed the assert() ranges of address spaces
>    - Rebased the patch-set to latest changes in the qemu.git
>    - Added Reviewed-by tags for patches {8,9}
> 2. Addressed Jonathan Cameron's comments
>    - Updated commit-log for [Patch V5 1/9] with mention of trace events
>    - Added Reviewed-by tags for patches {1,5}
> 3. Added Tested-by tags from Xianglai Li
> 4. Fixed checkpatch.pl error "Qemu -> QEMU" in [Patch V5 1/9]=20
> Link: https://lore.kernel.org/qemu-devel/20231011194355.15628-1-salil.meh=
ta@huawei.com/
>=20
> Patch-set  V4 -> V5
> 1. Addressed Gavin Shan's comments
>    - Fixed the trace events print string for kvm_{create,get,park,destroy=
}_vcpu
>    - Added Reviewed-by tag for patch {1}
> 2. Added Shaoqin Huang's Reviewed-by tags for Patches {2,3}
> 3. Added Tested-by Tag from Vishnu Pajjuri to the patch-set
> 4. Dropped the ARM specific [Patch V4 10/10]
> Link: https://lore.kernel.org/qemu-devel/20231009203601.17584-1-salil.meh=
ta@huawei.com/
>=20
> Patch-set  V3 -> V4
> 1. Addressed David Hilderbrand's comments
>    - Fixed the wrong doc comment of kvm_park_vcpu API prototype
>    - Added Reviewed-by tags for patches {2,4}
> Link: https://lore.kernel.org/qemu-devel/20231009112812.10612-1-salil.meh=
ta@huawei.com/
>=20
> Patch-set  V2 -> V3
> 1. Addressed Jonathan Cameron's comments
>    - Fixed 'vcpu-id' type wrongly changed from 'unsigned long' to 'intege=
r'
>    - Removed unnecessary use of variable 'vcpu_id' in kvm_park_vcpu
>    - Updated [Patch V2 3/10] commit-log with details of ACPI_CPU_SCAN_MET=
HOD macro
>    - Updated [Patch V2 5/10] commit-log with details of conditional event=
 handler method
>    - Added Reviewed-by tags for patches {2,3,4,6,7}
> 2. Addressed Gavin Shan's comments
>    - Remove unnecessary use of variable 'vcpu_id' in kvm_par_vcpu
>    - Fixed return value in kvm_get_vcpu from -1 to -ENOENT
>    - Reset the value of 'gdb_num_g_regs' in gdb_unregister_coprocessor_al=
l
>    - Fixed the kvm_{create,park}_vcpu prototypes docs
>    - Added Reviewed-by tags for patches {2,3,4,5,6,7,9,10}
> 3. Addressed one earlier missed comment by Alex Benn=C3=A9e in RFC V1
>    - Added traces instead of DPRINTF in the newly added and some existing=
 functions
> Link: https://lore.kernel.org/qemu-devel/20230930001933.2660-1-salil.meht=
a@huawei.com/
>=20
> Patch-set V1 -> V2
> 1. Addressed Alex Benn=C3=A9e's comments
>    - Refactored the kvm_create_vcpu logic to get rid of goto
>    - Added the docs for kvm_{create,park}_vcpu prototypes
>    - Splitted the gdbstub and AddressSpace destruction change into separa=
te patches
>    - Added Reviewed-by tags for patches {2,10}
> Link: https://lore.kernel.org/qemu-devel/20230929124304.13672-1-salil.meh=
ta@huawei.com/
>=20
> References:
>=20
> [1] https://lore.kernel.org/qemu-devel/20230926100436.28284-1-salil.mehta=
@huawei.com/
> [2] https://lore.kernel.org/all/20230913163823.7880-1-james.morse@arm.com=
/
> [3] https://lore.kernel.org/qemu-devel/cover.1695697701.git.lixianglai@lo=
ongson.cn/
> [4] https://lore.kernel.org/qemu-devel/20240613233639.202896-2-salil.meht=
a@huawei.com/
>=20
> Salil Mehta (7):
>   accel/kvm: Extract common KVM vCPU {creation,parking} code
>   hw/acpi: Move CPU ctrl-dev MMIO region len macro to common header file
>   hw/acpi: Update ACPI GED framework to support vCPU Hotplug
>   hw/acpi: Update GED _EVT method AML with CPU scan
>   hw/acpi: Update CPUs AML with cpu-(ctrl)dev change
>   physmem: Add helper function to destroy CPU AddressSpace
>   gdbstub: Add helper function to unregister GDB register space
>=20
>  accel/kvm/kvm-all.c                    | 95 +++++++++++++++++---------
>  accel/kvm/kvm-cpus.h                   |  1 -
>  accel/kvm/trace-events                 |  5 +-
>  docs/specs/acpi_hw_reduced_hotplug.rst |  3 +-
>  gdbstub/gdbstub.c                      | 13 ++++
>  hw/acpi/acpi-cpu-hotplug-stub.c        |  6 ++
>  hw/acpi/cpu.c                          | 18 +++--
>  hw/acpi/generic_event_device.c         | 27 ++++++++
>  hw/core/cpu-common.c                   |  4 +-
>  hw/i386/acpi-build.c                   |  3 +-
>  include/exec/cpu-common.h              |  8 +++
>  include/exec/gdbstub.h                 |  6 ++
>  include/hw/acpi/cpu.h                  |  7 +-
>  include/hw/acpi/generic_event_device.h |  5 ++
>  include/hw/core/cpu.h                  |  1 +
>  include/sysemu/kvm.h                   | 25 +++++++
>  system/physmem.c                       | 29 ++++++++
>  17 files changed, 212 insertions(+), 44 deletions(-)
>=20
