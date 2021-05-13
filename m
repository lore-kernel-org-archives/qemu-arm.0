Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id n10sm3367183wrw.37.2021.05.13.10.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 May 2021 10:20:09 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 2BF421FF7E;
	Thu, 13 May 2021 18:20:09 +0100 (BST)
References: <1f157423cc544731beb743287a4be5cb@huawei.com>
 <87h7j8ez4t.fsf@linaro.org> <7f8496377da246c38452d95bbbfc0ca7@huawei.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Andrey Shinkevich <andrey.shinkevich@huawei.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "Chengen (William,
 FixNet)" <chengen@huawei.com>, "peter.maydell@linaro.org"
 <peter.maydell@linaro.org>, "drjones@redhat.com" <drjones@redhat.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "Cota@braap.org"
 <Cota@braap.org>, yuzenghui <yuzenghui@huawei.com>, "Wanghaibin (D)"
 <wanghaibin.wang@huawei.com>, "shashi.mallela@linaro.org"
 <shashi.mallela@linaro.org>
Subject: Re: GICv3 for MTTCG
Date: Thu, 13 May 2021 18:19:28 +0100
In-reply-to: <7f8496377da246c38452d95bbbfc0ca7@huawei.com>
Message-ID: <877dk2lfee.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: gonk0Mf4VVqj


Andrey Shinkevich <andrey.shinkevich@huawei.com> writes:

> Dear colleagues,
>
> Thank you all very much for your responses. Let me reply with one message.
>
> I configured QEMU for AARCH64 guest:
> $ ./configure --target-list=3Daarch64-softmmu
>
> When I start QEMU with GICv3 on an x86 host:
> qemu-system-aarch64 -machine virt-6.0,accel=3Dtcg,gic-version=3D3

Hmm are you sure you are running your built QEMU? For me the following
works fine:

  ./aarch64-softmmu/qemu-system-aarch64 -machine virt-6.0,gic-version=3D3,a=
ccel=3Dtcg -cpu max -serial mon:stdio -nic user,model=3Dvirtio-net-pci,host=
fwd=3Dtcp::2222-:22 -device virtio-scsi-pci -device scsi-hd,drive=3Dhd0 -bl=
ockdev driver=3Draw,node-name=3Dhd0,discard=3Dunmap,file.driver=3Dhost_devi=
ce,file.filename=3D/dev/zvol/hackpool-0/debian-buster-arm64 -kernel
~/lsrc/linux.git/builds/arm64.nopreempt/arch/arm64/boot/Image -append "cons=
ole=3DttyAMA0 root=3D/dev/sda2" -display none -m 8G,maxmem=3D8G -smp 12


>
> QEMU reports this error from hw/pci/msix.c:
> error_setg(errp, "MSI-X is not supported by interrupt controller");
>
> Probably, the variable 'msi_nonbroken' would be initialized in
> hw/intc/arm_gicv3_its_common.c:
> gicv3_its_init_mmio(..)
>
> I guess that it works with KVM acceleration only rather than with TCG.
>
> The error persists after applying the series:
> https://lists.gnu.org/archive/html/qemu-arm/2021-04/msg00944.html
> "GICv3 LPI and ITS feature implementation"
> (special thanks for referring me to that)
>
> Please, make me clear and advise ideas how that error can be fixed?
> Should the MSI-X support be implemented with GICv3 extra?
>
> When successful, I would like to test QEMU for a maximum number of cores=
=20
> to get the best MTTCG performance.
> Probably, we will get just some percentage of performance enhancement=20
> with the BQL series applied, won't we? I will test it as well.
>
> Best regards,
> Andrey Shinkevich
>
>
> On 5/12/21 6:43 PM, Alex Benn=C3=A9e wrote:
>>=20
>> Andrey Shinkevich <andrey.shinkevich@huawei.com> writes:
>>=20
>>> Dear colleagues,
>>>
>>> I am looking for ways to accelerate the MTTCG for ARM guest on x86-64 h=
ost.
>>> The maximum number of CPUs for MTTCG that uses GICv2 is limited by 8:
>>>
>>> include/hw/intc/arm_gic_common.h:#define GIC_NCPU 8
>>>
>>> The version 3 of the Generic Interrupt Controller (GICv3) is not
>>> supported in QEMU for some reason unknown to me. It would allow to
>>> increase the limit of CPUs and accelerate the MTTCG performance on a
>>> multiple core hypervisor.
>>=20
>> It is supported, you just need to select it.
>>=20
>>> I have got an idea to implement the Interrupt Translation Service (ITS)
>>> for using by MTTCG for ARM architecture.
>>=20
>> There is some work to support ITS under TCG already posted:
>>=20
>>    Subject: [PATCH v3 0/8] GICv3 LPI and ITS feature implementation
>>    Date: Thu, 29 Apr 2021 19:41:53 -0400
>>    Message-Id: <20210429234201.125565-1-shashi.mallela@linaro.org>
>>=20
>> please do review and test.
>>=20
>>> Do you find that idea useful and feasible?
>>> If yes, how much time do you estimate for such a project to complete by
>>> one developer?
>>> If no, what are reasons for not implementing GICv3 for MTTCG in QEMU?
>>=20
>> As far as MTTCG performance is concerned there is a degree of
>> diminishing returns to be expected as the synchronisation cost between
>> threads will eventually outweigh the gains of additional threads.
>>=20
>> There are a number of parts that could improve this performance. The
>> first would be picking up the BQL reduction series from your FutureWei
>> colleges who worked on the problem when they were Linaro assignees:
>>=20
>>    Subject: [PATCH v2 0/7] accel/tcg: remove implied BQL from cpu_handle=
_interrupt/exception path
>>    Date: Wed, 19 Aug 2020 14:28:49 -0400
>>    Message-Id: <20200819182856.4893-1-robert.foley@linaro.org>
>>=20
>> There was also a longer series moving towards per-CPU locks:
>>=20
>>    Subject: [PATCH v10 00/73] per-CPU locks
>>    Date: Wed, 17 Jun 2020 17:01:18 -0400
>>    Message-Id: <20200617210231.4393-1-robert.foley@linaro.org>
>>=20
>> I believe the initial measurements showed that the BQL cost started to
>> edge up with GIC interactions. We did discuss approaches for this and I
>> think one idea was use non-BQL locking for the GIC. You would need to
>> revert:
>>=20
>>    Subject: [PATCH-for-5.2] exec: Remove MemoryRegion::global_locking fi=
eld
>>    Date: Thu,  6 Aug 2020 17:07:26 +0200
>>    Message-Id: <20200806150726.962-1-philmd@redhat.com>
>>=20
>> and then implement a more fine tuned locking in the GIC emulation
>> itself. However I think the BQL and per-CPU locks are lower hanging
>> fruit to tackle first.
>>=20
>>>
>>> Best regards,
>>> Andrey Shinkevich
>>=20
>>=20


--=20
Alex Benn=C3=A9e
