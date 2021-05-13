Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp653817lfg;
        Thu, 13 May 2021 09:36:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyk9CwddRPqQmNiaQIxoGHINLhte2lKXZ6Y55PMwHumTOgpzLWp0te1Ac750hlaiqEoaj3h
X-Received: by 2002:a05:6808:83:: with SMTP id s3mr28736817oic.104.1620923781385;
        Thu, 13 May 2021 09:36:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620923781; cv=none;
        d=google.com; s=arc-20160816;
        b=K1yvtPWl5f0HWbtCwr50Z3nEaBAFy7lKjTTPM0DJ8H1FsJZZWzcpXrBCOCxed0cK6H
         UFdd6FuNAh3LO1qVV1ysoQ9zjmnsjQslIteZwbWoXJ1ZcqLw/LDe3p4kf7gg/XNoArBY
         KbhxMcJstwUt2CyrDrDB/o21yLWNcW9aAu9Qp6lY6OHXiUkGoS4wTOD42/QpTx2IrGf2
         h4tsOb2FRXcpu9O7PjkBsuhMbUYWNq9dNQS9885PJ5kWW2SBiNsl9qb5MK5lIuEkV8e2
         sE7Po9ijUMiaNWtpjvDF7Cw3XzX32MUcW9Sycy+jvrC/GBD/Xb4AABbrOWo1BSuv9Ve5
         WtHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=MboqiaAJrLsNnWeE9MOKqT5LScLhJx59Mx6/tvXu/QY=;
        b=lflcpFqU7+o0CpZ6WVUWv9Zxj2TsboykIwV++64MpdQUX8ShG9kwhGbqICYakhNPvH
         HeGZ4PXnjY5tDcHw7R9nkSafFTPFgzLF9s1WvQImv+u5zgh98EvQkSYhAB3hrI3O5wmA
         zZ1JcoQCXonOYld0hTJJo86+3/qg8EzxEpHzgZkxBAA7PtLal2Y3WxZ7x/UI7NxLEPs7
         sdeZJf8pmtqh2Hot3lamJyUhC9aIhQvTeRRnpOmv41KoaiQ/8gktOxbuDOeG1F1f3j9B
         IiLGJw7D04S7ITp3WXz12nvUu144j2rO7Ik3xTl6UI3QQkheFOYYOH1S7/imotshZCZT
         2mqw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of andrey.shinkevich@huawei.com designates 45.249.212.187 as permitted sender) smtp.mailfrom=andrey.shinkevich@huawei.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <andrey.shinkevich@huawei.com>
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com. [45.249.212.187])
        by mx.google.com with ESMTPS id j26si5016673ooj.70.2021.05.13.09.36.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 May 2021 09:36:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrey.shinkevich@huawei.com designates 45.249.212.187 as permitted sender) client-ip=45.249.212.187;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of andrey.shinkevich@huawei.com designates 45.249.212.187 as permitted sender) smtp.mailfrom=andrey.shinkevich@huawei.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from dggeml756-chm.china.huawei.com (unknown [172.30.72.57])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4FgxzZ5C9JzYhVN;
	Fri, 14 May 2021 00:33:14 +0800 (CST)
Received: from dggpemm500006.china.huawei.com (7.185.36.236) by
 dggeml756-chm.china.huawei.com (10.1.199.158) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Fri, 14 May 2021 00:35:43 +0800
Received: from dggpemm500011.china.huawei.com (7.185.36.110) by
 dggpemm500006.china.huawei.com (7.185.36.236) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 14 May 2021 00:35:43 +0800
Received: from dggpemm500011.china.huawei.com ([7.185.36.110]) by
 dggpemm500011.china.huawei.com ([7.185.36.110]) with mapi id 15.01.2176.012;
 Fri, 14 May 2021 00:35:43 +0800
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
Date: Thu, 13 May 2021 16:35:43 +0000
Message-ID: <7f8496377da246c38452d95bbbfc0ca7@huawei.com>
References: <1f157423cc544731beb743287a4be5cb@huawei.com>
 <87h7j8ez4t.fsf@linaro.org>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.227.155.55]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-TUID: umeHrPDeH/fN

Dear colleagues,=0A=
=0A=
Thank you all very much for your responses. Let me reply with one message.=
=0A=
=0A=
I configured QEMU for AARCH64 guest:=0A=
$ ./configure --target-list=3Daarch64-softmmu=0A=
=0A=
When I start QEMU with GICv3 on an x86 host:=0A=
qemu-system-aarch64 -machine virt-6.0,accel=3Dtcg,gic-version=3D3=0A=
=0A=
QEMU reports this error from hw/pci/msix.c:=0A=
error_setg(errp, "MSI-X is not supported by interrupt controller");=0A=
=0A=
Probably, the variable 'msi_nonbroken' would be initialized in=0A=
hw/intc/arm_gicv3_its_common.c:=0A=
gicv3_its_init_mmio(..)=0A=
=0A=
I guess that it works with KVM acceleration only rather than with TCG.=0A=
=0A=
The error persists after applying the series:=0A=
https://lists.gnu.org/archive/html/qemu-arm/2021-04/msg00944.html=0A=
"GICv3 LPI and ITS feature implementation"=0A=
(special thanks for referring me to that)=0A=
=0A=
Please, make me clear and advise ideas how that error can be fixed?=0A=
Should the MSI-X support be implemented with GICv3 extra?=0A=
=0A=
When successful, I would like to test QEMU for a maximum number of cores =
=0A=
to get the best MTTCG performance.=0A=
Probably, we will get just some percentage of performance enhancement =0A=
with the BQL series applied, won't we? I will test it as well.=0A=
=0A=
Best regards,=0A=
Andrey Shinkevich=0A=
=0A=
=0A=
On 5/12/21 6:43 PM, Alex Benn=E9e wrote:=0A=
> =0A=
> Andrey Shinkevich <andrey.shinkevich@huawei.com> writes:=0A=
> =0A=
>> Dear colleagues,=0A=
>>=0A=
>> I am looking for ways to accelerate the MTTCG for ARM guest on x86-64 ho=
st.=0A=
>> The maximum number of CPUs for MTTCG that uses GICv2 is limited by 8:=0A=
>>=0A=
>> include/hw/intc/arm_gic_common.h:#define GIC_NCPU 8=0A=
>>=0A=
>> The version 3 of the Generic Interrupt Controller (GICv3) is not=0A=
>> supported in QEMU for some reason unknown to me. It would allow to=0A=
>> increase the limit of CPUs and accelerate the MTTCG performance on a=0A=
>> multiple core hypervisor.=0A=
> =0A=
> It is supported, you just need to select it.=0A=
> =0A=
>> I have got an idea to implement the Interrupt Translation Service (ITS)=
=0A=
>> for using by MTTCG for ARM architecture.=0A=
> =0A=
> There is some work to support ITS under TCG already posted:=0A=
> =0A=
>    Subject: [PATCH v3 0/8] GICv3 LPI and ITS feature implementation=0A=
>    Date: Thu, 29 Apr 2021 19:41:53 -0400=0A=
>    Message-Id: <20210429234201.125565-1-shashi.mallela@linaro.org>=0A=
> =0A=
> please do review and test.=0A=
> =0A=
>> Do you find that idea useful and feasible?=0A=
>> If yes, how much time do you estimate for such a project to complete by=
=0A=
>> one developer?=0A=
>> If no, what are reasons for not implementing GICv3 for MTTCG in QEMU?=0A=
> =0A=
> As far as MTTCG performance is concerned there is a degree of=0A=
> diminishing returns to be expected as the synchronisation cost between=0A=
> threads will eventually outweigh the gains of additional threads.=0A=
> =0A=
> There are a number of parts that could improve this performance. The=0A=
> first would be picking up the BQL reduction series from your FutureWei=0A=
> colleges who worked on the problem when they were Linaro assignees:=0A=
> =0A=
>    Subject: [PATCH v2 0/7] accel/tcg: remove implied BQL from cpu_handle_=
interrupt/exception path=0A=
>    Date: Wed, 19 Aug 2020 14:28:49 -0400=0A=
>    Message-Id: <20200819182856.4893-1-robert.foley@linaro.org>=0A=
> =0A=
> There was also a longer series moving towards per-CPU locks:=0A=
> =0A=
>    Subject: [PATCH v10 00/73] per-CPU locks=0A=
>    Date: Wed, 17 Jun 2020 17:01:18 -0400=0A=
>    Message-Id: <20200617210231.4393-1-robert.foley@linaro.org>=0A=
> =0A=
> I believe the initial measurements showed that the BQL cost started to=0A=
> edge up with GIC interactions. We did discuss approaches for this and I=
=0A=
> think one idea was use non-BQL locking for the GIC. You would need to=0A=
> revert:=0A=
> =0A=
>    Subject: [PATCH-for-5.2] exec: Remove MemoryRegion::global_locking fie=
ld=0A=
>    Date: Thu,  6 Aug 2020 17:07:26 +0200=0A=
>    Message-Id: <20200806150726.962-1-philmd@redhat.com>=0A=
> =0A=
> and then implement a more fine tuned locking in the GIC emulation=0A=
> itself. However I think the BQL and per-CPU locks are lower hanging=0A=
> fruit to tackle first.=0A=
> =0A=
>>=0A=
>> Best regards,=0A=
>> Andrey Shinkevich=0A=
> =0A=
> =0A=
=0A=
