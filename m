Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp89932lfg;
        Thu, 13 May 2021 22:21:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxMT/i8rO0cC103aovi4KfgqoM5Uvz5F0FaUltQ55wVKbLTEgoTDnIjbbwmzYYmyRXt6HPX
X-Received: by 2002:a62:c504:0:b029:28e:b070:db71 with SMTP id j4-20020a62c5040000b029028eb070db71mr43329023pfg.55.1620969665986;
        Thu, 13 May 2021 22:21:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620969665; cv=none;
        d=google.com; s=arc-20160816;
        b=nX2flPbFHbTuNduvVLpR7nTe23m3CVTn7MuLN2IPubGmS9yUT8+rw+xyGDBl62ZL64
         WyrZeYXzTnWowdLXlFHjf2M+ijF/e4KI253INomINPP1miXxNlE7fWGXTZUN4XXcQDZe
         EfZnqmtFWt/pY2vE9NAqU/b210Z4u0mDE4RZ8rxmappVJmZbkMLAtpaa7HwSbqKTMV9q
         k7D26SooAG3KpuSH3kScmkKFNVR3XZay4Dym3WNv8PbbM8pB34sWHc2PsMDuKEQjWI0c
         hUkkuFAEJSZPfcQOkwR+rOU4PJDHvaetqVxqgLKLolh1hWHOJPklwNbjE/FcD2ddYIn+
         7mLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=PL8TnkkTvREC8dckUmkJyqfXg1GnJMnj6f0urfGCeBs=;
        b=S/jxlJHoSt1mrJJuzWsmG+orGzFXLulUFDBQW0EENmnSvMPw2oLOMjSUiawCk9Rqd+
         wOel8xTseM8oCXpmYVlZ1HEGzTui/MZhBkI+qxu1wnO+BBN9fDxLl+diSHKVHKlg0uDx
         HyH8MMZp0/17VQeiB/53U8B1ygHKj8kL2DCJBvZUWwydnMo1Re4P+F3avh2j+4kzCMwG
         E6Fl5dn9nQBYQeQ5Bt5GFR37qJ0Vx+Eo6ZnyHdgBEigUZT6tlEXl6SIczT7pb3h45krr
         O2l/ebJU1K9fsEO1Q5JyMgY4U3mllFtWhGC+RkNDDHIh5Ncuym3niR2HhgaNJr9QsXNf
         Jriw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of andrey.shinkevich@huawei.com designates 45.249.212.191 as permitted sender) smtp.mailfrom=andrey.shinkevich@huawei.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <andrey.shinkevich@huawei.com>
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com. [45.249.212.191])
        by mx.google.com with ESMTPS id k22si6009529pjq.63.2021.05.13.22.21.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 May 2021 22:21:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrey.shinkevich@huawei.com designates 45.249.212.191 as permitted sender) client-ip=45.249.212.191;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of andrey.shinkevich@huawei.com designates 45.249.212.191 as permitted sender) smtp.mailfrom=andrey.shinkevich@huawei.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from dggems703-chm.china.huawei.com (unknown [172.30.72.58])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FhGxb0H6PzQn4p;
	Fri, 14 May 2021 13:17:39 +0800 (CST)
Received: from dggpemm100006.china.huawei.com (7.185.36.196) by
 dggems703-chm.china.huawei.com (10.3.19.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 14 May 2021 13:21:03 +0800
Received: from dggpemm500011.china.huawei.com (7.185.36.110) by
 dggpemm100006.china.huawei.com (7.185.36.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 14 May 2021 13:21:03 +0800
Received: from dggpemm500011.china.huawei.com ([7.185.36.110]) by
 dggpemm500011.china.huawei.com ([7.185.36.110]) with mapi id 15.01.2176.012;
 Fri, 14 May 2021 13:21:03 +0800
From: Andrey Shinkevich <andrey.shinkevich@huawei.com>
To: =?iso-8859-1?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "Chengen (William,
 FixNet)" <chengen@huawei.com>, "peter.maydell@linaro.org"
	<peter.maydell@linaro.org>, "drjones@redhat.com" <drjones@redhat.com>,
	"richard.henderson@linaro.org" <richard.henderson@linaro.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "Cota@braap.org"
	<Cota@braap.org>, yuzenghui <yuzenghui@huawei.com>, "Wanghaibin (D)"
	<wanghaibin.wang@huawei.com>, "shashi.mallela@linaro.org"
	<shashi.mallela@linaro.org>
Subject: Re: GICv3 for MTTCG
Thread-Topic: GICv3 for MTTCG
Thread-Index: AQHXRo49QQoDTg/5kkqOfm/tGkugzg==
Date: Fri, 14 May 2021 05:21:03 +0000
Message-ID: <229ce1b3699c499b90533d669deed745@huawei.com>
References: <1f157423cc544731beb743287a4be5cb@huawei.com>
 <87h7j8ez4t.fsf@linaro.org> <7f8496377da246c38452d95bbbfc0ca7@huawei.com>
 <877dk2lfee.fsf@linaro.org>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.227.155.55]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-TUID: atNIQMfBl+ss

On 5/13/21 8:20 PM, Alex Benn=E9e wrote:=0A=
> =0A=
> Andrey Shinkevich <andrey.shinkevich@huawei.com> writes:=0A=
> =0A=
>> Dear colleagues,=0A=
>>=0A=
>> Thank you all very much for your responses. Let me reply with one messag=
e.=0A=
>>=0A=
>> I configured QEMU for AARCH64 guest:=0A=
>> $ ./configure --target-list=3Daarch64-softmmu=0A=
>>=0A=
>> When I start QEMU with GICv3 on an x86 host:=0A=
>> qemu-system-aarch64 -machine virt-6.0,accel=3Dtcg,gic-version=3D3=0A=
> =0A=
> Hmm are you sure you are running your built QEMU? For me the following=0A=
> works fine:=0A=
=0A=
No doubt I run my built QEMU because I am debugging it and watching the =0A=
run of it with gcc.=0A=
=0A=
> =0A=
>    ./aarch64-softmmu/qemu-system-aarch64 -machine virt-6.0,gic-version=3D=
3,accel=3Dtcg -cpu max -serial mon:stdio -nic user,model=3Dvirtio-net-pci,h=
ostfwd=3Dtcp::2222-:22 -device virtio-scsi-pci -device scsi-hd,drive=3Dhd0 =
-blockdev driver=3Draw,node-name=3Dhd0,discard=3Dunmap,file.driver=3Dhost_d=
evice,file.filename=3D/dev/zvol/hackpool-0/debian-buster-arm64 -kernel=0A=
> ~/lsrc/linux.git/builds/arm64.nopreempt/arch/arm64/boot/Image -append "co=
nsole=3DttyAMA0 root=3D/dev/sda2" -display none -m 8G,maxmem=3D8G -smp 12=
=0A=
> =0A=
> =0A=
=0A=
Which source code are you using for building your QEMU? Would you please =
=0A=
send me the link if it is a source other than github.com/qemu/qemu?=0A=
I downloaded and pulled the latest commit 3e9f48bcdabe57f8f and applied =0A=
the series "[PATCH v3 0/8] GICv3 LPI and ITS feature implementation" =0A=
ONLY. Did you do the same?=0A=
=0A=
I have NOT applied the series "[PATCH v2 0/7] accel/tcg: remove implied =0A=
BQL from cpu_handle_interrupt/exception path" yet because it is old and =0A=
the manual applying takes more time (will do it later). Is it a possible =
=0A=
reason that my guest hangs with locks at start?=0A=
=0A=
Andrey=0A=
=0A=
>>=0A=
>> QEMU reports this error from hw/pci/msix.c:=0A=
>> error_setg(errp, "MSI-X is not supported by interrupt controller");=0A=
>>=0A=
>> Probably, the variable 'msi_nonbroken' would be initialized in=0A=
>> hw/intc/arm_gicv3_its_common.c:=0A=
>> gicv3_its_init_mmio(..)=0A=
>>=0A=
>> I guess that it works with KVM acceleration only rather than with TCG.=
=0A=
>>=0A=
>> The error persists after applying the series:=0A=
>> https://lists.gnu.org/archive/html/qemu-arm/2021-04/msg00944.html=0A=
>> "GICv3 LPI and ITS feature implementation"=0A=
>> (special thanks for referring me to that)=0A=
>>=0A=
>> Please, make me clear and advise ideas how that error can be fixed?=0A=
>> Should the MSI-X support be implemented with GICv3 extra?=0A=
>>=0A=
>> When successful, I would like to test QEMU for a maximum number of cores=
=0A=
>> to get the best MTTCG performance.=0A=
>> Probably, we will get just some percentage of performance enhancement=0A=
>> with the BQL series applied, won't we? I will test it as well.=0A=
>>=0A=
>> Best regards,=0A=
>> Andrey Shinkevich=0A=
>>=0A=
>>=0A=
>> On 5/12/21 6:43 PM, Alex Benn=E9e wrote:=0A=
>>>=0A=
>>> Andrey Shinkevich <andrey.shinkevich@huawei.com> writes:=0A=
>>>=0A=
>>>> Dear colleagues,=0A=
>>>>=0A=
>>>> I am looking for ways to accelerate the MTTCG for ARM guest on x86-64 =
host.=0A=
>>>> The maximum number of CPUs for MTTCG that uses GICv2 is limited by 8:=
=0A=
>>>>=0A=
>>>> include/hw/intc/arm_gic_common.h:#define GIC_NCPU 8=0A=
>>>>=0A=
>>>> The version 3 of the Generic Interrupt Controller (GICv3) is not=0A=
>>>> supported in QEMU for some reason unknown to me. It would allow to=0A=
>>>> increase the limit of CPUs and accelerate the MTTCG performance on a=
=0A=
>>>> multiple core hypervisor.=0A=
>>>=0A=
>>> It is supported, you just need to select it.=0A=
>>>=0A=
>>>> I have got an idea to implement the Interrupt Translation Service (ITS=
)=0A=
>>>> for using by MTTCG for ARM architecture.=0A=
>>>=0A=
>>> There is some work to support ITS under TCG already posted:=0A=
>>>=0A=
>>>     Subject: [PATCH v3 0/8] GICv3 LPI and ITS feature implementation=0A=
>>>     Date: Thu, 29 Apr 2021 19:41:53 -0400=0A=
>>>     Message-Id: <20210429234201.125565-1-shashi.mallela@linaro.org>=0A=
>>>=0A=
>>> please do review and test.=0A=
>>>=0A=
>>>> Do you find that idea useful and feasible?=0A=
>>>> If yes, how much time do you estimate for such a project to complete b=
y=0A=
>>>> one developer?=0A=
>>>> If no, what are reasons for not implementing GICv3 for MTTCG in QEMU?=
=0A=
>>>=0A=
>>> As far as MTTCG performance is concerned there is a degree of=0A=
>>> diminishing returns to be expected as the synchronisation cost between=
=0A=
>>> threads will eventually outweigh the gains of additional threads.=0A=
>>>=0A=
>>> There are a number of parts that could improve this performance. The=0A=
>>> first would be picking up the BQL reduction series from your FutureWei=
=0A=
>>> colleges who worked on the problem when they were Linaro assignees:=0A=
>>>=0A=
>>>     Subject: [PATCH v2 0/7] accel/tcg: remove implied BQL from cpu_hand=
le_interrupt/exception path=0A=
>>>     Date: Wed, 19 Aug 2020 14:28:49 -0400=0A=
>>>     Message-Id: <20200819182856.4893-1-robert.foley@linaro.org>=0A=
>>>=0A=
>>> There was also a longer series moving towards per-CPU locks:=0A=
>>>=0A=
>>>     Subject: [PATCH v10 00/73] per-CPU locks=0A=
>>>     Date: Wed, 17 Jun 2020 17:01:18 -0400=0A=
>>>     Message-Id: <20200617210231.4393-1-robert.foley@linaro.org>=0A=
>>>=0A=
>>> I believe the initial measurements showed that the BQL cost started to=
=0A=
>>> edge up with GIC interactions. We did discuss approaches for this and I=
=0A=
>>> think one idea was use non-BQL locking for the GIC. You would need to=
=0A=
>>> revert:=0A=
>>>=0A=
>>>     Subject: [PATCH-for-5.2] exec: Remove MemoryRegion::global_locking =
field=0A=
>>>     Date: Thu,  6 Aug 2020 17:07:26 +0200=0A=
>>>     Message-Id: <20200806150726.962-1-philmd@redhat.com>=0A=
>>>=0A=
>>> and then implement a more fine tuned locking in the GIC emulation=0A=
>>> itself. However I think the BQL and per-CPU locks are lower hanging=0A=
>>> fruit to tackle first.=0A=
>>>=0A=
>>>>=0A=
>>>> Best regards,=0A=
>>>> Andrey Shinkevich=0A=
>>>=0A=
>>>=0A=
> =0A=
> =0A=
=0A=
