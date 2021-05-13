Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp737540lfg;
        Thu, 13 May 2021 11:29:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxcCMBnSSdziS7NSQ5HEGUl09INveT6MOZIkMgMGf5/6w3FDeq9KkIAFsPQzRBxdxJwVG+/
X-Received: by 2002:a63:b94b:: with SMTP id v11mr42264829pgo.76.1620930546034;
        Thu, 13 May 2021 11:29:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620930546; cv=none;
        d=google.com; s=arc-20160816;
        b=vC6ftfIIlDClulc6/13bjJTSNfHUFeFLFq+WWMJwMU/vx7njPY+kkT4QCB/IdrzgNB
         B6xBiNmZp9wi6lGh4a42HCozcyJL2xftE5dUtyx76Nq+HClVbOCjjGkvYfzXU4hwLzpz
         3XvQwKVT8MdSJF7CAle62uivwlqKbKCRAWGz06Zl7fxpy8x6uWn7IStE07mfTxONcQZQ
         RoKlPdkOj4JaH7GtCCrPxXkLQy1NuQ2yQn+QVK5TC/vppcUItDfVxQiX8imhfISCgG/Q
         JwMsTijPjSs+NA1d7KgbiIl/qr2BV6++R1zF4VZcdMmGWREDWZ//43+/p90WwMvP+U1Y
         Psxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=vLNIhCXONnhGEn4/ahCs6jC6o0S6ErnD3areM2Vd6Zg=;
        b=fpuWWxsWMIikjawBHnvkEBA7cOoln6Ukb/l/UUUv/ZIT31BKObm/JhpICqjM9wujTW
         NGl79Jb92u18f+v38mQ2/9B/lREnaIiiwfi4Ioz4tf+/jE3QNq27Mu3nP5sDVedz/Nk1
         /tYzMk7CfkAQqbY+XbeLJHispT82WXBZUYAFVP5lTUxLQr4VZn2jGofudv5UF795TD4/
         2euEB46DiaJ1rLeiYlsalCU1kuyYUFQ0yQx2XP84ZnxN1a39+oB5dU+pRCQq8iWPU1EH
         8QllNejtmhvypSNlBeQ4W9PYmzYnEDSwmxWd0x7is5Q1RpAFzIr2V2d0Xot5SGeg8oD3
         lDfA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of andrey.shinkevich@huawei.com designates 45.249.212.187 as permitted sender) smtp.mailfrom=andrey.shinkevich@huawei.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <andrey.shinkevich@huawei.com>
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com. [45.249.212.187])
        by mx.google.com with ESMTPS id f6si4723245pjp.159.2021.05.13.11.29.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 May 2021 11:29:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrey.shinkevich@huawei.com designates 45.249.212.187 as permitted sender) client-ip=45.249.212.187;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of andrey.shinkevich@huawei.com designates 45.249.212.187 as permitted sender) smtp.mailfrom=andrey.shinkevich@huawei.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from dggeml714-chm.china.huawei.com (unknown [172.30.72.55])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Fh0SF4jPvzWgKj;
	Fri, 14 May 2021 02:24:45 +0800 (CST)
Received: from dggpemm100007.china.huawei.com (7.185.36.116) by
 dggeml714-chm.china.huawei.com (10.3.17.125) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Fri, 14 May 2021 02:29:02 +0800
Received: from dggpemm500011.china.huawei.com (7.185.36.110) by
 dggpemm100007.china.huawei.com (7.185.36.116) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 14 May 2021 02:29:02 +0800
Received: from dggpemm500011.china.huawei.com ([7.185.36.110]) by
 dggpemm500011.china.huawei.com ([7.185.36.110]) with mapi id 15.01.2176.012;
 Fri, 14 May 2021 02:29:02 +0800
From: Andrey Shinkevich <andrey.shinkevich@huawei.com>
To: Shashi Mallela <shashi.mallela@linaro.org>
CC: =?iso-8859-1?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "Chengen (William, FixNet)"
	<chengen@huawei.com>, "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"drjones@redhat.com" <drjones@redhat.com>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"Cota@braap.org" <Cota@braap.org>, yuzenghui <yuzenghui@huawei.com>,
	"Wanghaibin (D)" <wanghaibin.wang@huawei.com>
Subject: Re: GICv3 for MTTCG
Thread-Topic: GICv3 for MTTCG
Thread-Index: AQHXRo49QQoDTg/5kkqOfm/tGkugzg==
Date: Thu, 13 May 2021 18:29:02 +0000
Message-ID: <03a3068db05744b7bbda45d6c651f0a9@huawei.com>
References: <7f8496377da246c38452d95bbbfc0ca7@huawei.com>
 <41839E15-50DF-4EFB-AF54-6CDB089859BD@getmailspring.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.227.155.55]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-TUID: fpcPmaVt/vvO

Hi Shashi,=0A=
=0A=
Thank you very much for letting me know.=0A=
I changed virt machine to the version 6.1 and the error disappeared.=0A=
But the guest OS is experiencing severe delays while booting and =0A=
starting. The delays take minutes mostly here:=0A=
=0A=
#0  0x00007f1d0932554d in __lll_lock_wait () at /lib64/libpthread.so.0=0A=
#1  0x00007f1d09320e9b in _L_lock_883 () at /lib64/libpthread.so.0=0A=
#2  0x00007f1d09320d68 in pthread_mutex_lock () at /lib64/libpthread.so.0=
=0A=
#3  0x0000560bf51637b3 in qemu_mutex_lock_impl (mutex=3D0x560bf5e05820 =0A=
<qemu_global_mutex>, file=3D0x560bf56db84b "../util/main-loop.c", =0A=
line=3D252) at ../util/qemu-thread-posix.c:79=0A=
#4  0x0000560bf4d65403 in qemu_mutex_lock_iothread_impl =0A=
(file=3D0x560bf56db84b "../util/main-loop.c", line=3D252) at =0A=
../softmmu/cpus.c:491=0A=
#5  0x0000560bf516faa5 in os_host_main_loop_wait (timeout=3D2367975) at =0A=
../util/main-loop.c:252=0A=
#6  0x0000560bf516fbb0 in main_loop_wait (nonblocking=3D0) at =0A=
../util/main-loop.c:530=0A=
#7  0x0000560bf4ddc186 in qemu_main_loop () at ../softmmu/runstate.c:725=0A=
#8  0x0000560bf473ae42 in main (argc=3D63, argv=3D0x7ffc5920eba8, =0A=
envp=3D0x7ffc5920eda8) at ../softmmu/main.c:50=0A=
=0A=
and here:=0A=
=0A=
#0  0x00007f1d0903cd8f in ppoll () at /lib64/libc.so.6=0A=
#1  0x0000560bf512e2d0 in qemu_poll_ns (fds=3D0x560bf70f12b0, nfds=3D5, =0A=
timeout=3D350259000000) at ../util/qemu-timer.c:348=0A=
#2  0x0000560bf516fa8c in os_host_main_loop_wait (timeout=3D350259000000) =
=0A=
at ../util/main-loop.c:249=0A=
#3  0x0000560bf516fbb0 in main_loop_wait (nonblocking=3D0) at =0A=
../util/main-loop.c:530=0A=
#4  0x0000560bf4ddc186 in qemu_main_loop () at ../softmmu/runstate.c:725=0A=
#5  0x0000560bf473ae42 in main (argc=3D63, argv=3D0x7ffc5920eba8, =0A=
envp=3D0x7ffc5920eda8) at ../softmmu/main.c:50=0A=
=0A=
Eventually, the guest hangs at the second back trace above.=0A=
=0A=
Best regards,=0A=
Andrey=0A=
=0A=
=0A=
On 5/13/21 7:45 PM, Shashi Mallela wrote:=0A=
> Hi Andrey,=0A=
> =0A=
> To clarify, the patch series=0A=
> =0A=
>     https://lists.gnu.org/archive/html/qemu-arm/2021-04/msg00944.html=0A=
>     "GICv3 LPI and ITS feature implementation"=0A=
> =0A=
> is applicable for virt machine 6.1 onwards,i.e ITS TCG functionality is =
=0A=
> not available for version 6.0 that is being tried=0A=
> here.=0A=
> =0A=
> Thanks=0A=
> Shashi=0A=
> =0A=
> On May 13 2021, at 12:35 pm, Andrey Shinkevich =0A=
> <andrey.shinkevich@huawei.com> wrote:=0A=
> =0A=
>     Dear colleagues,=0A=
> =0A=
>     Thank you all very much for your responses. Let me reply with one=0A=
>     message.=0A=
> =0A=
>     I configured QEMU for AARCH64 guest:=0A=
>     $ ./configure --target-list=3Daarch64-softmmu=0A=
> =0A=
>     When I start QEMU with GICv3 on an x86 host:=0A=
>     qemu-system-aarch64 -machine virt-6.0,accel=3Dtcg,gic-version=3D3=0A=
> =0A=
>     QEMU reports this error from hw/pci/msix.c:=0A=
>     error_setg(errp, "MSI-X is not supported by interrupt controller");=
=0A=
> =0A=
>     Probably, the variable 'msi_nonbroken' would be initialized in=0A=
>     hw/intc/arm_gicv3_its_common.c:=0A=
>     gicv3_its_init_mmio(..)=0A=
> =0A=
>     I guess that it works with KVM acceleration only rather than with TCG=
.=0A=
> =0A=
>     The error persists after applying the series:=0A=
>     https://lists.gnu.org/archive/html/qemu-arm/2021-04/msg00944.html=0A=
>     "GICv3 LPI and ITS feature implementation"=0A=
>     (special thanks for referring me to that)=0A=
> =0A=
>     Please, make me clear and advise ideas how that error can be fixed?=
=0A=
>     Should the MSI-X support be implemented with GICv3 extra?=0A=
> =0A=
>     When successful, I would like to test QEMU for a maximum number of co=
res=0A=
>     to get the best MTTCG performance.=0A=
>     Probably, we will get just some percentage of performance enhancement=
=0A=
>     with the BQL series applied, won't we? I will test it as well.=0A=
> =0A=
>     Best regards,=0A=
>     Andrey Shinkevich=0A=
> =0A=
> =0A=
>     On 5/12/21 6:43 PM, Alex Benn=E9e wrote:=0A=
>      >=0A=
>      > Andrey Shinkevich <andrey.shinkevich@huawei.com> writes:=0A=
>      >=0A=
>      >> Dear colleagues,=0A=
>      >>=0A=
>      >> I am looking for ways to accelerate the MTTCG for ARM guest on=0A=
>     x86-64 host.=0A=
>      >> The maximum number of CPUs for MTTCG that uses GICv2 is limited=
=0A=
>     by 8:=0A=
>      >>=0A=
>      >> include/hw/intc/arm_gic_common.h:#define GIC_NCPU 8=0A=
>      >>=0A=
>      >> The version 3 of the Generic Interrupt Controller (GICv3) is not=
=0A=
>      >> supported in QEMU for some reason unknown to me. It would allow t=
o=0A=
>      >> increase the limit of CPUs and accelerate the MTTCG performance o=
n a=0A=
>      >> multiple core hypervisor.=0A=
>      >=0A=
>      > It is supported, you just need to select it.=0A=
>      >=0A=
>      >> I have got an idea to implement the Interrupt Translation=0A=
>     Service (ITS)=0A=
>      >> for using by MTTCG for ARM architecture.=0A=
>      >=0A=
>      > There is some work to support ITS under TCG already posted:=0A=
>      >=0A=
>      > Subject: [PATCH v3 0/8] GICv3 LPI and ITS feature implementation=
=0A=
>      > Date: Thu, 29 Apr 2021 19:41:53 -0400=0A=
>      > Message-Id: <20210429234201.125565-1-shashi.mallela@linaro.org>=0A=
>      >=0A=
>      > please do review and test.=0A=
>      >=0A=
>      >> Do you find that idea useful and feasible?=0A=
>      >> If yes, how much time do you estimate for such a project to=0A=
>     complete by=0A=
>      >> one developer?=0A=
>      >> If no, what are reasons for not implementing GICv3 for MTTCG in=
=0A=
>     QEMU?=0A=
>      >=0A=
>      > As far as MTTCG performance is concerned there is a degree of=0A=
>      > diminishing returns to be expected as the synchronisation cost=0A=
>     between=0A=
>      > threads will eventually outweigh the gains of additional threads.=
=0A=
>      >=0A=
>      > There are a number of parts that could improve this performance. T=
he=0A=
>      > first would be picking up the BQL reduction series from your=0A=
>     FutureWei=0A=
>      > colleges who worked on the problem when they were Linaro assignees=
:=0A=
>      >=0A=
>      > Subject: [PATCH v2 0/7] accel/tcg: remove implied BQL from=0A=
>     cpu_handle_interrupt/exception path=0A=
>      > Date: Wed, 19 Aug 2020 14:28:49 -0400=0A=
>      > Message-Id: <20200819182856.4893-1-robert.foley@linaro.org>=0A=
>      >=0A=
>      > There was also a longer series moving towards per-CPU locks:=0A=
>      >=0A=
>      > Subject: [PATCH v10 00/73] per-CPU locks=0A=
>      > Date: Wed, 17 Jun 2020 17:01:18 -0400=0A=
>      > Message-Id: <20200617210231.4393-1-robert.foley@linaro.org>=0A=
>      >=0A=
>      > I believe the initial measurements showed that the BQL cost=0A=
>     started to=0A=
>      > edge up with GIC interactions. We did discuss approaches for this=
=0A=
>     and I=0A=
>      > think one idea was use non-BQL locking for the GIC. You would need=
 to=0A=
>      > revert:=0A=
>      >=0A=
>      > Subject: [PATCH-for-5.2] exec: Remove=0A=
>     MemoryRegion::global_locking field=0A=
>      > Date: Thu, 6 Aug 2020 17:07:26 +0200=0A=
>      > Message-Id: <20200806150726.962-1-philmd@redhat.com>=0A=
>      >=0A=
>      > and then implement a more fine tuned locking in the GIC emulation=
=0A=
>      > itself. However I think the BQL and per-CPU locks are lower hangin=
g=0A=
>      > fruit to tackle first.=0A=
>      >=0A=
>      >>=0A=
>      >> Best regards,=0A=
>      >> Andrey Shinkevich=0A=
>      >=0A=
>      >=0A=
> =0A=
> Sent from Mailspring=0A=
=0A=
