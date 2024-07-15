Received: by 2002:a17:504:1dd4:b0:1be9:327d:8ee3 with SMTP id b20csp2174075nji;
        Mon, 15 Jul 2024 04:07:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXUVV7gSRaZpoUKhAQdUlHXUduKRrnp3Rqh6dATtEQ4yQ5Dk+VSYNON/lQ0BnJu4A8OwgzBh2rpI6+9AUAoYyOq25zCiNqy
X-Received: by 2002:a17:906:40e:b0:a77:c824:b4c5 with SMTP id a640c23a62f3a-a780b6b18ccmr1245631166b.18.1721041641586;
        Mon, 15 Jul 2024 04:07:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721041641; cv=none;
        d=google.com; s=arc-20160816;
        b=IXxffmeCsvB6pnY/X3JGztmaiwtm8gLWZX5oNCNoCAUAKgnUOgiyl6uW3IaScBAvWO
         5dpYHCAKDoEkbf7/CkP2e28Nl3kSEDf2WiD++kZw5DAvOw/lCpisnoZ6Eah8EoNW7WkI
         se11z2d0uJaiyUagaUXSyvEEuTcapaBwF8Alf1YeohAaC0Qs/mcP3bY0pRLagPA9ZWza
         IPKS37eRS9Eh6um6WSbQFpG3gP+I1rtReCKV6RT8LzWy/O/MF6YoeAeYwamDCdNQt4MI
         U9itrWgfjkQsUEvY4E88e/5oR/T/5yRoaYY7ry7moa2FFUMkMGCkwRykBNz2W8HCxDae
         0NWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3l2h4+P4Id7+V34blJn3iCh971Ax0sXXzOlphneNOXg=;
        fh=4ldv/Ho15EguvzrlhNMTS61Y+ocBzqgwAvU9ROuP0PQ=;
        b=tQpgMvvfUZCyqDwB5JUYgrhhDKwmfE3XyH+KkMLstY1xcXH3nboeQFtlzJIRY0Fc+8
         uo7UMWHm/ZHcsoTNd1lmr8awQb4oZ4zbT99XKjj1jiKbQFnLG9J15AXE+/oO39RhxmG3
         y2Y0/lzy28DySLutRKbOCerI8zEaBuokmDx2DOkvtTj7qxuf4XHmcPYbMNLJUZ2IGkz7
         C/0/m+lsYKHr1l3tcisDix3U7ejuPkmq/A9yAeaGt7m1NTjBvZ/f5wtAYoWUiaxybTOs
         jTdpl3PA4IBIpUrzN+pa6YaxeuNdqyLzsrHWtWW845fJkOf+82BKQSJm/TOvOWCzVbfh
         t7Eg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@opnsrc.net header.s=google header.b=URCvlylZ;
       spf=pass (google.com: domain of salil.mehta@opnsrc.net designates 209.85.220.41 as permitted sender) smtp.mailfrom=salil.mehta@opnsrc.net;
       dara=neutral header.i=@linaro.org
Return-Path: <salil.mehta@opnsrc.net>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a640c23a62f3a-a79bc5a360bsor87540266b.6.2024.07.15.04.07.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 15 Jul 2024 04:07:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@opnsrc.net designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@opnsrc.net header.s=google header.b=URCvlylZ;
       spf=pass (google.com: domain of salil.mehta@opnsrc.net designates 209.85.220.41 as permitted sender) smtp.mailfrom=salil.mehta@opnsrc.net;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=opnsrc.net; s=google; t=1721041641; x=1721646441; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3l2h4+P4Id7+V34blJn3iCh971Ax0sXXzOlphneNOXg=;
        b=URCvlylZliDsPOhBkIAjnOXbDwZZK0oBSq/hqk3R/Do/ht/p1GPlRONP9qVhWiZHfZ
         BM/djZ+kUpuvOvX4fOHAjsj4HJdyNEkZGMRCueAUaYjXCsOEZCDgZ6TdzftPu6AoUNcj
         82GRBFXjkd+uXQo3X+qrPm6FOMIcekeEgkB0Hhq4ScHLoE2TAQDajX2GziN/o5YQceTA
         0Ryw238DuCY7M3RxB1YEwRWm3UrtnWrt55AKNw32H2f1TBljBrNQrL4s57aaYjya5nyg
         wOzA8A3I0Q/yJrPBqFJzwk4BKR6JGLeHC7ZyInPwp8cIC62LnDsXbAyH/LLWISlIcAZZ
         v4sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721041641; x=1721646441;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3l2h4+P4Id7+V34blJn3iCh971Ax0sXXzOlphneNOXg=;
        b=OgFRBl3epFnys7WMyhSSehn2A/ill7HOUqrstwVvIh0dldW6OixuWnn4lsGB4fdJol
         OSmfmeWHs5TWd5+4/CBVvIpem1Nvf4mID1wwFsnyfmw/4iuEi5h79qp2yjqNzMVrIS2v
         /fufnNqTkXKaYu8UeRwuING4XWW9Jjo5O4owBX2PTebDGKOOGkDZ7AWqOsVrTcniUskw
         rA2Qi3tlyLEls1nQS7Z4J9zFvMSmT2bNduGxbUbsTFDb81IpA7UBYy9woD7hkAiQpyLk
         vjZDzhzNntqWGe3hYv/jIxmiRfIUeSBmXlHoh3wUNO4M9+LS8B3wwFCF7TexcfVDaUKs
         er3A==
X-Forwarded-Encrypted: i=1; AJvYcCWa4EImIYykfWjYiykj7za8rnYXZQdHCOCiEyxfGWAGgRkG2gnLQDdokqUMwgl8xEkaCC01TF3AnVKUBii/h82bdJXmZANe
X-Gm-Message-State: AOJu0YxTGrZQFp7a3SvIXhR4pPSJ2eacM5/GJx+mPmeiEitDqKDE/fE+
	HH1sDFuBQLejd2tbMzRsOZEM8yYEAIzJOciomfCaea8i+6DvBFWNEvKs3J8pfNzjJOIvxi71aCi
	OSyNy9uCIazZjn6QtnXkYXTsUF8QTFGA3wQd9Fw==
X-Google-Smtp-Source: AGHT+IH6QKYmK5GaxQNLMIA9nOMLOAm8TavBeufuiZ/+n0LAnjyP+FMYFg3hkGStK/wOMfwbuHNpE9amLVjOG9ZxEOE=
X-Received: by 2002:a17:906:5ad9:b0:a6f:e758:f0bf with SMTP id
 a640c23a62f3a-a780b8802b9mr1180913466b.53.1721041640777; Mon, 15 Jul 2024
 04:07:20 -0700 (PDT)
MIME-Version: 1.0
References: <20240713182516.1457-1-salil.mehta@huawei.com> <e17e28ac-28c7-496f-b212-2c9b552dbf63@amperemail.onmicrosoft.com>
In-Reply-To: <e17e28ac-28c7-496f-b212-2c9b552dbf63@amperemail.onmicrosoft.com>
From: Salil Mehta <salil.mehta@opnsrc.net>
Date: Mon, 15 Jul 2024 12:07:08 +0100
Message-ID: <CAJ7pxea2_i8ZZBm0J8e_VJ4=ggyR4MTVbM5w69SofoqMiMgqRQ@mail.gmail.com>
Subject: Re: [PATCH V15 0/7] Add architecture agnostic code to support vCPU Hotplug
To: Vishnu Pajjuri <vishnu@amperemail.onmicrosoft.com>
Cc: Salil Mehta <salil.mehta@huawei.com>, alex.bennee@linaro.org, andrew.jones@linux.dev, 
	darren@os.amperecomputing.com, david@redhat.com, eric.auger@redhat.com, 
	gshan@redhat.com, harshpb@linux.ibm.com, ilkka@os.amperecomputing.com, 
	imammedo@redhat.com, jean-philippe@linaro.org, jiakernel2@gmail.com, 
	jonathan.cameron@huawei.com, karl.heubaum@oracle.com, linux@armlinux.org.uk, 
	linuxarm@huawei.com, lixianglai@loongson.cn, lpieralisi@kernel.org, 
	maobibo@loongson.cn, maz@kernel.org, miguel.luis@oracle.com, mst@redhat.com, 
	npiggin@gmail.com, oliver.upton@linux.dev, pbonzini@redhat.com, 
	peter.maydell@linaro.org, philmd@linaro.org, qemu-arm@nongnu.org, 
	qemu-devel@nongnu.org, rafael@kernel.org, richard.henderson@linaro.org, 
	vishnu@os.amperecomputing.com, wangxiongfeng2@huawei.com, 
	wangyanan55@huawei.com, will@kernel.org, zhukeqian1@huawei.com
Content-Type: multipart/alternative; boundary="000000000000a4878e061d473b3e"
X-TUID: RwjWzwwLx4KY

--000000000000a4878e061d473b3e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Vishnu,

On Mon, 15 Jul 2024 at 12:04, Vishnu Pajjuri <
vishnu@amperemail.onmicrosoft.com> wrote:

> Hi Salil,
> On 13-07-2024 23:55, Salil Mehta wrote:
>
> [Note: References are present at the last after the revision history]
>
> Virtual CPU hotplug support is being added across various architectures [=
1][3].
> This series adds various code bits common across all architectures:
>
> 1. vCPU creation and Parking code refactor [Patch 1]
> 2. Update ACPI GED framework to support vCPU Hotplug [Patch 2,3]
> 3. ACPI CPUs AML code change [Patch 4,5]
> 4. Helper functions to support unrealization of CPU objects [Patch 6,7]
>
> Repository:
>
> [*] Architecture *Agnostic* Patch-set (This series)
>    V14: https://github.com/salil-mehta/qemu.git virt-cpuhp-armv8/rfc-v3.a=
rch.agnostic.v15
>
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
>
> [*] ARM Architecture *Specific* Patch-set
>    RFC V3 [4]: https://github.com/salil-mehta/qemu.git virt-cpuhp-armv8/r=
fc-v3
>    RFC V4-rc2: https://github.com/salil-mehta/qemu.git virt-cpuhp-armv8/r=
fc-v4-rc2 (combined)
>
>
> Revision History:
>
> Patch-set V14 -> V15
> 1. Addressed commnet from Igor Mammedov's on [PATCH V14 4/7]
>    - Removed ACPI_CPU_SCAN_METHOD
>    - Introduced AML_GED_EVT_CPU_SCAN_METHOD ("\\_SB.GED.CPSCN") macro
> 2. Fix the stray change of "assert (" in "PATCH V14 3/7"
> Link: https://lore.kernel.org/qemu-devel/20240712134201.214699-4-salil.me=
hta@huawei.com/
>
> I tried following test cases with rfc-v4-rc2 and kernel patches v10, and
> it looks good on Ampere platforms.
>
>    - Regular hotplug and hot unplug tests
>    - Save/restore  VM, suspend/resume VM with and with out hot-plugging
>    vcpus tests
>    - Live migration with and with out hot-plugging vcpus tests
>
> Please feel free to add,
> Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
> <vishnu@os.amperecomputing.com>
>

Many thanks for confirming this.

Best wishes
Salil.


<vishnu@os.amperecomputing.com>
>
> *Regards*,
> -Vishnu.
>
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
>
> Patch-set  V12 -> V13
> 1. Added Reviewed-by Tag of Harsh Prateek Bora's (IBM) [PATCH V12 1/8]
> 2. Moved the kvm_{create,park,unpark}_vcpu prototypes from accel/kvm/kvm-=
cpus.h
>    to include/sysemu/kvm.h. These can later be exported through AccelOps.
> Link: https://lore.kernel.org/qemu-devel/62f55169-1796-4d8e-a35d-7f003a17=
2750@linux.ibm.com/
>
> Patch-set  V11 -> V12
> 1. Addressed Harsh Prateek Bora's (IBM) comment
>    - Changed @cpu to @vcpu_id in the kvm_unpark_vcpu protoype header/
> 2. Added Zhao Liu's (Intel) Tested-by for whole series
>    - Qtest does not breaks on Intel platforms now.
> 3. Added Zhao Liu's (Intel) Reviewed-by for [PATCH V11 {1/8 - 3/8}]
> Link: https://lore.kernel.org/qemu-devel/ZlRSPuJGBgyEUW6w@intel.com/
> Link: https://lore.kernel.org/qemu-devel/a5f3d78e-cfed-441f-9c56-e3e78fa5=
edee@linux.ibm.com/
>
> Patch-set  V10 -> V11
> 1. Addressed Nicholas Piggin's (IBM) comment
>    - moved the traces in kvm_unpark_vcpu and kvm_create_vcpu at the end
>    - Added the Reviewed-by Tag for [PATCH V10 1/8]
> 2.  Addressed Alex Benn=C3=A9e's (Linaro) comments
>    - Added a note explaining dependency of the [PATCH V10 7/8] on Arch sp=
ecific patch-set
> Link: https://lore.kernel.org/qemu-devel/D1FS5GOOFWWK.2PNRIVL0V6DBL@gmail=
.com/
> Link: https://lore.kernel.org/qemu-devel/87frubi402.fsf@draig.linaro.org/
>
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
>
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
>
> Patch-set V7 -> V8
> 1. Rebased and Fixed the conflicts
>
> Patch-set  V6 -> V7
> 1. Addressed Alex Benn=C3=A9e's comments
>    - Updated the docs
> 2. Addressed Igor Mammedov's comments
>    - Merged patches [Patch V6 3/9] & [Patch V6 7/9] with [Patch V6 4/9]
>    - Updated commit-log of [Patch V6 1/9] and [Patch V6 5/9]
> 3. Added Shaoqin Huang's Reviewed-by tags for whole series.
> Link: https://lore.kernel.org/qemu-devel/20231013105129.25648-1-salil.meh=
ta@huawei.com/
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
> Link: https://lore.kernel.org/qemu-devel/20231011194355.15628-1-salil.meh=
ta@huawei.com/
>
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
>
> Patch-set  V3 -> V4
> 1. Addressed David Hilderbrand's comments
>    - Fixed the wrong doc comment of kvm_park_vcpu API prototype
>    - Added Reviewed-by tags for patches {2,4}
> Link: https://lore.kernel.org/qemu-devel/20231009112812.10612-1-salil.meh=
ta@huawei.com/
>
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
>
> Patch-set V1 -> V2
> 1. Addressed Alex Benn=C3=A9e's comments
>    - Refactored the kvm_create_vcpu logic to get rid of goto
>    - Added the docs for kvm_{create,park}_vcpu prototypes
>    - Splitted the gdbstub and AddressSpace destruction change into separa=
te patches
>    - Added Reviewed-by tags for patches {2,10}
> Link: https://lore.kernel.org/qemu-devel/20230929124304.13672-1-salil.meh=
ta@huawei.com/
>
> References:
>
> [1] https://lore.kernel.org/qemu-devel/20230926100436.28284-1-salil.mehta=
@huawei.com/
> [2] https://lore.kernel.org/all/20230913163823.7880-1-james.morse@arm.com=
/
> [3] https://lore.kernel.org/qemu-devel/cover.1695697701.git.lixianglai@lo=
ongson.cn/
> [4] https://lore.kernel.org/qemu-devel/20240613233639.202896-2-salil.meht=
a@huawei.com/
>
> Salil Mehta (7):
>   accel/kvm: Extract common KVM vCPU {creation,parking} code
>   hw/acpi: Move CPU ctrl-dev MMIO region len macro to common header file
>   hw/acpi: Update ACPI GED framework to support vCPU Hotplug
>   hw/acpi: Update GED _EVT method AML with CPU scan
>   hw/acpi: Update CPUs AML with cpu-(ctrl)dev change
>   physmem: Add helper function to destroy CPU AddressSpace
>   gdbstub: Add helper function to unregister GDB register space
>
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
>
>
>

--000000000000a4878e061d473b3e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi=C2=A0Vishnu,</div><div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, 15 Jul 2024 at 12:04, Vishnu =
Pajjuri &lt;<a href=3D"mailto:vishnu@amperemail.onmicrosoft.com">vishnu@amp=
eremail.onmicrosoft.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex"><u></u>

 =20
  <div>
    <p>Hi Salil,<br>
    </p></div><div>
    <div>On 13-07-2024 23:55, Salil Mehta wrote:<br>
    </div>
    <blockquote type=3D"cite">
      <pre>[Note: References are present at the last after the revision his=
tory]

Virtual CPU hotplug support is being added across various architectures [1]=
[3].
This series adds various code bits common across all architectures:

1. vCPU creation and Parking code refactor [Patch 1]
2. Update ACPI GED framework to support vCPU Hotplug [Patch 2,3]
3. ACPI CPUs AML code change [Patch 4,5]
4. Helper functions to support unrealization of CPU objects [Patch 6,7]

Repository:

[*] Architecture *Agnostic* Patch-set (This series)
   V14: <a href=3D"https://github.com/salil-mehta/qemu.git" target=3D"_blan=
k">https://github.com/salil-mehta/qemu.git</a> virt-cpuhp-armv8/rfc-v3.arch=
.agnostic.v15

   NOTE: This series is meant to work in conjunction with the architecture-=
specific
   patch-set. For ARM, a combined patch-set (architecture agnostic + specif=
ic) was
   earlier pushed as RFC V2 [1]. Later, RFC V2 was split into the ARM Archi=
tecture
   specific patch-set RFC V3 [4] (a subset of RFC V2) and the architecture =
agnostic
   patch-set. Patch-set V14 is the latest version in that series. This seri=
es
   works in conjunction with RFC V4-rc2, present at the following link.

[*] ARM Architecture *Specific* Patch-set
   RFC V3 [4]: <a href=3D"https://github.com/salil-mehta/qemu.git" target=
=3D"_blank">https://github.com/salil-mehta/qemu.git</a> virt-cpuhp-armv8/rf=
c-v3
   RFC V4-rc2: <a href=3D"https://github.com/salil-mehta/qemu.git" target=
=3D"_blank">https://github.com/salil-mehta/qemu.git</a> virt-cpuhp-armv8/rf=
c-v4-rc2 (combined)


Revision History:

Patch-set V14 -&gt; V15
1. Addressed commnet from Igor Mammedov&#39;s on [PATCH V14 4/7]
   - Removed ACPI_CPU_SCAN_METHOD
   - Introduced AML_GED_EVT_CPU_SCAN_METHOD (&quot;\\_SB.GED.CPSCN&quot;) m=
acro
2. Fix the stray change of &quot;assert (&quot; in &quot;PATCH V14 3/7&quot=
;
Link: <a href=3D"https://lore.kernel.org/qemu-devel/20240712134201.214699-4=
-salil.mehta@huawei.com/" target=3D"_blank">https://lore.kernel.org/qemu-de=
vel/20240712134201.214699-4-salil.mehta@huawei.com/</a>
</pre>
    </blockquote>
    </div><div><p>I tried following test cases with rfc-v4-rc2 and kernel p=
atches
      v10, and it looks good on Ampere platforms.</p>
    <ul>
      <li>Regular hotplug and hot unplug tests</li>
      <li>Save/restore=C2=A0 VM, suspend/resume VM with and with out
        hot-plugging vcpus tests</li>
      <li>Live migration with and with out hot-plugging vcpus tests</li>
    </ul>
    <p> Please feel free to add,<br>
      Tested-by: Vishnu Pajjuri <a href=3D"mailto:vishnu@os.amperecomputing=
.com" target=3D"_blank">&lt;vishnu@os.amperecomputing.com&gt;</a></p></div>=
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Many thanks for =
confirming this.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Best wi=
shes</div><div dir=3D"auto">Salil.</div><div dir=3D"auto"><br></div><div di=
r=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div><p dir=3D"auto"><a=
 href=3D"mailto:vishnu@os.amperecomputing.com" target=3D"_blank"></a><br>
    </p>
    <p><u>Regards</u>,</p>
    -Vishnu.
    </div><div><blockquote type=3D"cite">
      <pre>Patch-set V13 -&gt; V14
1. Addressed Igor Mammedov&#39;s following review comments
   - Mentioned abput new external APIs in the header note of [PATCH 1/7]
   - Merged Doc [PATCH V13 8/8] with [PATCH V14 3/7]
   - Introduced GED realize function for various CPU Hotplug regions initia=
lizations
   - Added back event handler method to indirectly expose \\_SB.CPUS.CSCN t=
o GED
     _EVT. Like for ARM, it would be through \\_SB.GED.CSCN event handler m=
ethod
   - Collected the Ack given for [Patch V13 6/8]
   - Added back the gfree&#39;ing of GDB regs in common finalize and made i=
t conditional
   - Updated the header notes of [PATCH V13 3/8,4/8,5/8] to reflect the cha=
nges

Patch-set  V12 -&gt; V13
1. Added Reviewed-by Tag of Harsh Prateek Bora&#39;s (IBM) [PATCH V12 1/8]
2. Moved the kvm_{create,park,unpark}_vcpu prototypes from accel/kvm/kvm-cp=
us.h
   to include/sysemu/kvm.h. These can later be exported through AccelOps.
Link: <a href=3D"https://lore.kernel.org/qemu-devel/62f55169-1796-4d8e-a35d=
-7f003a172750@linux.ibm.com/" target=3D"_blank">https://lore.kernel.org/qem=
u-devel/62f55169-1796-4d8e-a35d-7f003a172750@linux.ibm.com/</a>

Patch-set  V11 -&gt; V12
1. Addressed Harsh Prateek Bora&#39;s (IBM) comment
   - Changed @cpu to @vcpu_id in the kvm_unpark_vcpu protoype header/
2. Added Zhao Liu&#39;s (Intel) Tested-by for whole series
   - Qtest does not breaks on Intel platforms now.
3. Added Zhao Liu&#39;s (Intel) Reviewed-by for [PATCH V11 {1/8 - 3/8}]
Link: <a href=3D"https://lore.kernel.org/qemu-devel/ZlRSPuJGBgyEUW6w@intel.=
com/" target=3D"_blank">https://lore.kernel.org/qemu-devel/ZlRSPuJGBgyEUW6w=
@intel.com/</a>
Link: <a href=3D"https://lore.kernel.org/qemu-devel/a5f3d78e-cfed-441f-9c56=
-e3e78fa5edee@linux.ibm.com/" target=3D"_blank">https://lore.kernel.org/qem=
u-devel/a5f3d78e-cfed-441f-9c56-e3e78fa5edee@linux.ibm.com/</a>

Patch-set  V10 -&gt; V11
1. Addressed Nicholas Piggin&#39;s (IBM) comment
   - moved the traces in kvm_unpark_vcpu and kvm_create_vcpu at the end
   - Added the Reviewed-by Tag for [PATCH V10 1/8]
2.  Addressed Alex Benn=C3=A9e&#39;s (Linaro) comments
   - Added a note explaining dependency of the [PATCH V10 7/8] on Arch spec=
ific patch-set
Link: <a href=3D"https://lore.kernel.org/qemu-devel/D1FS5GOOFWWK.2PNRIVL0V6=
DBL@gmail.com/" target=3D"_blank">https://lore.kernel.org/qemu-devel/D1FS5G=
OOFWWK.2PNRIVL0V6DBL@gmail.com/</a>=20
Link: <a href=3D"https://lore.kernel.org/qemu-devel/87frubi402.fsf@draig.li=
naro.org/" target=3D"_blank">https://lore.kernel.org/qemu-devel/87frubi402.=
fsf@draig.linaro.org/</a>

Patch-set  V9 -&gt; V10
1. Addressed Nicholas Piggin&#39;s (IBM) &amp; Philippe Mathieu-Daud=C3=A9 =
(Linaro) comments
   - carved out kvm_unpark_vcpu and added its trace
   - Widened the scope of the kvm_unpark_vcpu so that it can be used by gen=
eric framework
     being thought out
Link: <a href=3D"https://lore.kernel.org/qemu-devel/20240519210620.228342-1=
-salil.mehta@huawei.com/" target=3D"_blank">https://lore.kernel.org/qemu-de=
vel/20240519210620.228342-1-salil.mehta@huawei.com/</a>
Link: <a href=3D"https://lore.kernel.org/qemu-devel/e94b0e14-efee-4050-9c9f=
-08382a36b63a@linaro.org/" target=3D"_blank">https://lore.kernel.org/qemu-d=
evel/e94b0e14-efee-4050-9c9f-08382a36b63a@linaro.org/</a>

Patch-set  V8 -&gt; V9
1. Addressed Vishnu Pajjuri&#39;s (Ampere) comments
   - Added kvm_fd to trace in kvm_create_vcpu
   - Some clean ups: arch vcpu-id and sbd variable
   - Added the missed initialization of cpu-&gt;gdb_num_regs
2. Addressed the commnet from Zhao Liu (Intel)
   - Make initialization of CPU Hotplug state conditional (possible_cpu_arc=
h_ids!=3DNULL)
Link: <a href=3D"https://lore.kernel.org/qemu-devel/20240312020000.12992-1-=
salil.mehta@huawei.com/" target=3D"_blank">https://lore.kernel.org/qemu-dev=
el/20240312020000.12992-1-salil.mehta@huawei.com/</a>

Patch-set V7 -&gt; V8
1. Rebased and Fixed the conflicts

Patch-set  V6 -&gt; V7
1. Addressed Alex Benn=C3=A9e&#39;s comments
   - Updated the docs
2. Addressed Igor Mammedov&#39;s comments
   - Merged patches [Patch V6 3/9] &amp; [Patch V6 7/9] with [Patch V6 4/9]
   - Updated commit-log of [Patch V6 1/9] and [Patch V6 5/9]    =20
3. Added Shaoqin Huang&#39;s Reviewed-by tags for whole series.
Link: <a href=3D"https://lore.kernel.org/qemu-devel/20231013105129.25648-1-=
salil.mehta@huawei.com/" target=3D"_blank">https://lore.kernel.org/qemu-dev=
el/20231013105129.25648-1-salil.mehta@huawei.com/</a>

Patch-set  V5 -&gt; V6
1. Addressed Gavin Shan&#39;s comments
   - Fixed the assert() ranges of address spaces
   - Rebased the patch-set to latest changes in the qemu.git
   - Added Reviewed-by tags for patches {8,9}
2. Addressed Jonathan Cameron&#39;s comments
   - Updated commit-log for [Patch V5 1/9] with mention of trace events
   - Added Reviewed-by tags for patches {1,5}
3. Added Tested-by tags from Xianglai Li
4. Fixed <a href=3D"http://checkpatch.pl" target=3D"_blank">checkpatch.pl</=
a> error &quot;Qemu -&gt; QEMU&quot; in [Patch V5 1/9]=20
Link: <a href=3D"https://lore.kernel.org/qemu-devel/20231011194355.15628-1-=
salil.mehta@huawei.com/" target=3D"_blank">https://lore.kernel.org/qemu-dev=
el/20231011194355.15628-1-salil.mehta@huawei.com/</a>

Patch-set  V4 -&gt; V5
1. Addressed Gavin Shan&#39;s comments
   - Fixed the trace events print string for kvm_{create,get,park,destroy}_=
vcpu
   - Added Reviewed-by tag for patch {1}
2. Added Shaoqin Huang&#39;s Reviewed-by tags for Patches {2,3}
3. Added Tested-by Tag from Vishnu Pajjuri to the patch-set
4. Dropped the ARM specific [Patch V4 10/10]
Link: <a href=3D"https://lore.kernel.org/qemu-devel/20231009203601.17584-1-=
salil.mehta@huawei.com/" target=3D"_blank">https://lore.kernel.org/qemu-dev=
el/20231009203601.17584-1-salil.mehta@huawei.com/</a>

Patch-set  V3 -&gt; V4
1. Addressed David Hilderbrand&#39;s comments
   - Fixed the wrong doc comment of kvm_park_vcpu API prototype
   - Added Reviewed-by tags for patches {2,4}
Link: <a href=3D"https://lore.kernel.org/qemu-devel/20231009112812.10612-1-=
salil.mehta@huawei.com/" target=3D"_blank">https://lore.kernel.org/qemu-dev=
el/20231009112812.10612-1-salil.mehta@huawei.com/</a>

Patch-set  V2 -&gt; V3
1. Addressed Jonathan Cameron&#39;s comments
   - Fixed &#39;vcpu-id&#39; type wrongly changed from &#39;unsigned long&#=
39; to &#39;integer&#39;
   - Removed unnecessary use of variable &#39;vcpu_id&#39; in kvm_park_vcpu
   - Updated [Patch V2 3/10] commit-log with details of ACPI_CPU_SCAN_METHO=
D macro
   - Updated [Patch V2 5/10] commit-log with details of conditional event h=
andler method
   - Added Reviewed-by tags for patches {2,3,4,6,7}
2. Addressed Gavin Shan&#39;s comments
   - Remove unnecessary use of variable &#39;vcpu_id&#39; in kvm_par_vcpu
   - Fixed return value in kvm_get_vcpu from -1 to -ENOENT
   - Reset the value of &#39;gdb_num_g_regs&#39; in gdb_unregister_coproces=
sor_all
   - Fixed the kvm_{create,park}_vcpu prototypes docs
   - Added Reviewed-by tags for patches {2,3,4,5,6,7,9,10}
3. Addressed one earlier missed comment by Alex Benn=C3=A9e in RFC V1
   - Added traces instead of DPRINTF in the newly added and some existing f=
unctions
Link: <a href=3D"https://lore.kernel.org/qemu-devel/20230930001933.2660-1-s=
alil.mehta@huawei.com/" target=3D"_blank">https://lore.kernel.org/qemu-deve=
l/20230930001933.2660-1-salil.mehta@huawei.com/</a>

Patch-set V1 -&gt; V2
1. Addressed Alex Benn=C3=A9e&#39;s comments
   - Refactored the kvm_create_vcpu logic to get rid of goto
   - Added the docs for kvm_{create,park}_vcpu prototypes
   - Splitted the gdbstub and AddressSpace destruction change into separate=
 patches
   - Added Reviewed-by tags for patches {2,10}
Link: <a href=3D"https://lore.kernel.org/qemu-devel/20230929124304.13672-1-=
salil.mehta@huawei.com/" target=3D"_blank">https://lore.kernel.org/qemu-dev=
el/20230929124304.13672-1-salil.mehta@huawei.com/</a>

References:

[1] <a href=3D"https://lore.kernel.org/qemu-devel/20230926100436.28284-1-sa=
lil.mehta@huawei.com/" target=3D"_blank">https://lore.kernel.org/qemu-devel=
/20230926100436.28284-1-salil.mehta@huawei.com/</a>
[2] <a href=3D"https://lore.kernel.org/all/20230913163823.7880-1-james.mors=
e@arm.com/" target=3D"_blank">https://lore.kernel.org/all/20230913163823.78=
80-1-james.morse@arm.com/</a>
[3] <a href=3D"https://lore.kernel.org/qemu-devel/cover.1695697701.git.lixi=
anglai@loongson.cn/" target=3D"_blank">https://lore.kernel.org/qemu-devel/c=
over.1695697701.git.lixianglai@loongson.cn/</a>
[4] <a href=3D"https://lore.kernel.org/qemu-devel/20240613233639.202896-2-s=
alil.mehta@huawei.com/" target=3D"_blank">https://lore.kernel.org/qemu-deve=
l/20240613233639.202896-2-salil.mehta@huawei.com/</a>

Salil Mehta (7):
  accel/kvm: Extract common KVM vCPU {creation,parking} code
  hw/acpi: Move CPU ctrl-dev MMIO region len macro to common header file
  hw/acpi: Update ACPI GED framework to support vCPU Hotplug
  hw/acpi: Update GED _EVT method AML with CPU scan
  hw/acpi: Update CPUs AML with cpu-(ctrl)dev change
  physmem: Add helper function to destroy CPU AddressSpace
  gdbstub: Add helper function to unregister GDB register space

 accel/kvm/kvm-all.c                    | 95 +++++++++++++++++---------
 accel/kvm/kvm-cpus.h                   |  1 -
 accel/kvm/trace-events                 |  5 +-
 docs/specs/acpi_hw_reduced_hotplug.rst |  3 +-
 gdbstub/gdbstub.c                      | 13 ++++
 hw/acpi/acpi-cpu-hotplug-stub.c        |  6 ++
 hw/acpi/cpu.c                          | 18 +++--
 hw/acpi/generic_event_device.c         | 27 ++++++++
 hw/core/cpu-common.c                   |  4 +-
 hw/i386/acpi-build.c                   |  3 +-
 include/exec/cpu-common.h              |  8 +++
 include/exec/gdbstub.h                 |  6 ++
 include/hw/acpi/cpu.h                  |  7 +-
 include/hw/acpi/generic_event_device.h |  5 ++
 include/hw/core/cpu.h                  |  1 +
 include/sysemu/kvm.h                   | 25 +++++++
 system/physmem.c                       | 29 ++++++++
 17 files changed, 212 insertions(+), 44 deletions(-)

</pre>
    </blockquote>
  </div>

</blockquote></div></div>

--000000000000a4878e061d473b3e--
