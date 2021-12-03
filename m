Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp387482lfk;
        Fri, 3 Dec 2021 08:21:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwBxrqSnsQqk5b0Sr/DG8tACvPiPoS67FiUcTloG9ZlYPKYILbV4QdxTyf4QvmgvMz4KbrS
X-Received: by 2002:aca:6243:: with SMTP id w64mr10623519oib.167.1638548502782;
        Fri, 03 Dec 2021 08:21:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1638548502; cv=none;
        d=google.com; s=arc-20160816;
        b=xI8L+YNbQurwx/0SjmIkuBhV8hAFHoBJ+WPc6AOifScIis/oJQj0efJ9EJDLuym9zD
         6lJJPTH5HAF7feaSACEO4r1w29W9cf67DtBgpYavILcdjA524qrCSqOdpwoI5ZCwhT/t
         gbQfaZrtoTSBOcZe0fQt6knYFpdFizcfmjKjqRywYRDImEV0DxO5qsVwfjYlCrkws8hE
         9FKMPZBIIkZHZaZeiSQJ/JlXmWqlNZLG6vTRcu4+Zb5nbh/XrrzTxr9LHQz7fcON+SWM
         2kDNojZdq50Rm4eIAfiPBuwPa+ppy270XaTDzINFHQRvOYg4hMwzYiqoOloZHj1meE+N
         3Qlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=Qyi2eOB1Za/39Kklj/Pz9bZKVkx6QOmzN+KrU7rIf0c=;
        b=UQMJCwjSoyn+WcK1Jy3zUaKswxnBFUg9z3jVHP+pWSAO+LdNXd/qgwp9v4WOALzejX
         ouim4TCp6Hz0oDMUyh9rvKsiB0N8+Lc34aXV71jM53aZEN2Dq66IdIdKnHdUa5K7TtUh
         MHotyy+XyBS9wwtEfI2lYhSCEbhlGuwAnwF0MJTk98T3uMi6fnErY6E3b69BbtVkjusx
         85p/2UmeHCLVvqm4cGMaJsbSHweMpZvD+GccAyQM7j0LcOemfRG5IvKjdi/tl8FR7k6a
         S6dGUTSDml5PY5XoCZQlwoUNkXOf+Zun/s1b8kGezSwKM0ZY10PYKH3l8qgieUp68aqS
         x9kQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of vasilev.oleg@huawei.com designates 45.249.212.187 as permitted sender) smtp.mailfrom=vasilev.oleg@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <vasilev.oleg@huawei.com>
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com. [45.249.212.187])
        by mx.google.com with ESMTPS id y9si4825871otu.262.2021.12.03.08.21.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Dec 2021 08:21:42 -0800 (PST)
Received-SPF: pass (google.com: domain of vasilev.oleg@huawei.com designates 45.249.212.187 as permitted sender) client-ip=45.249.212.187;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of vasilev.oleg@huawei.com designates 45.249.212.187 as permitted sender) smtp.mailfrom=vasilev.oleg@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.54])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4J5J3J4JbGzcbbv;
	Sat,  4 Dec 2021 00:21:00 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Sat, 4 Dec 2021 00:21:09 +0800
Received: from dggpeml500023.china.huawei.com (7.185.36.114) by
 dggpemm500007.china.huawei.com (7.185.36.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Sat, 4 Dec 2021 00:21:09 +0800
Received: from dggpeml500023.china.huawei.com ([7.185.36.114]) by
 dggpeml500023.china.huawei.com ([7.185.36.114]) with mapi id 15.01.2308.020;
 Sat, 4 Dec 2021 00:21:09 +0800
From: Vasilev Oleg <vasilev.oleg@huawei.com>
To: =?iso-8859-1?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Richard Henderson
	<richard.henderson@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, "Emilio
 G. Cota" <cota@braap.org>, "peter.maydell@linaro.org"
	<peter.maydell@linaro.org>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Plotnik Nikolay <plotnik.nikolay@huawei.com>, Andrey Shinkevich
	<andrey.shinkevich@huawei.com>, Konobeev Vladimir
	<konobeev.vladimir@huawei.com>, "Chengen (William, FixNet)"
	<chengen@huawei.com>
Subject: Re: Suggestions for TCG performance improvements
Thread-Topic: Suggestions for TCG performance improvements
Thread-Index: AQHX52GV5RpBCy0TxkCBqrK5dfMw1Q==
Date: Fri, 3 Dec 2021 16:21:08 +0000
Message-ID: <7d137a2403be43b7a1c5857e96866403@huawei.com>
References: <c76bde31-8f3b-2d03-b7c7-9e026d4b5873@huawei.com>
 <87bl1zxaeu.fsf@linaro.org>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.47.173.106]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-TUID: 4h2VY9hfewA2

On 12/2/2021 7:02 PM, Alex Benn=E9e wrote:=0A=
=0A=
> Vasilev Oleg <vasilev.oleg@huawei.com> writes:=0A=
>=0A=
>> I've discovered some MMU-related suggestions in the 2018 letter[2], and=
=0A=
>> those seem to be still not implemented (flush still uses memset[3]).=0A=
>> Do you think we should go forward with implementing those?=0A=
> I doubt you can do better than memset which should be the most optimised=
=0A=
> memory clear for the platform. We could consider a separate thread to=0A=
> proactively allocate and clear new TLBs so we don't have to do it at=0A=
> flush time. However we wouldn't have complete information about what=0A=
> size we want the new table to be.=0A=
>=0A=
> When a TLB flush is performed it could be that the majority of the old=0A=
> table is still perfectly valid. =0A=
=0A=
In that case, do you think it would be possible instead of flushing TLBs, s=
tore it somewhere and bring it back when the address space changes back? =
=0A=
=0A=
> However we would need a reliable mechanism to work out which entries in t=
he table could be kept. =0A=
=0A=
We could invalidate entries in those stored TLBs the same way we invalidate=
 the active TLB. If we are going to have new thread to manage TLB allocatio=
n, invalidation could also be offloaded to those.=0A=
=0A=
> I did ponder a debug mode which would keep the last N tables dropped by=
=0A=
> tlb_mmu_resize_locked and then measure the differences in the entries=0A=
> before submitting the free to an rcu tasks.=0A=
>> The mentioned paper[4] also describes other possible improvements.=0A=
>> Some of those are already implemented (such as victim TLB and dynamic=0A=
>> size for TLB), but others are not (e.g. TLB lookup uninlining and=0A=
>> set-associative TLB layer). Do you think those improvements=0A=
>> worth trying?=0A=
> Anything is worth trying but you would need hard numbers. Also its all=0A=
> too easy to target micro benchmarks which might not show much difference=
=0A=
> in real world use. =0A=
=0A=
The  mentioned paper presents some benchmarking, e. g. linux kernel compila=
tion and some other stuff. Do you think those shouldn't be trusted?=0A=
=0A=
> The best thing you can do at the moment is give the=0A=
> guest plenty of RAM so page updates are limited because the guest OS=0A=
> doesn't have to swap RAM around.=0A=
>=0A=
> Another optimisation would be looking at bigger page sizes. For example=
=0A=
> the kernel (in a Linux setup) usually has a contiguous flat map for=0A=
> kernel space. If we could represent that at a larger granularity then=0A=
> not only could we make the page lookup tighter for kernel mode we could=
=0A=
> also achieve things like cross-page TB chaining for kernel functions.=0A=
=0A=
Do I understand correctly that currently softmmu doesn't treat hugepages an=
y special, and you are suggesting we add such support, so that a particular=
 region of memory occupies less TLBentries? This probably means TLB lookup =
would become quite a bit more complex.=0A=
=0A=
>> Another idea for decreasing occurence of TLB refills is to make TBs key=
=0A=
>> in htable independent of physical address. I assume it is only needed=0A=
>> to distinguish different processes where VAs can be the same.=0A=
>> Is that assumption correct?=0A=
=0A=
This one, what do you think? Can we replace physical address as part of a k=
ey in TB htable with some sort of address space identifier?=0A=
=0A=
>> Do you have any other ideas which parts of TCG could require our=0A=
>> attention w.r.t the flamegraph I attached?=0A=
> It's been done before but not via upstream patches but improving code=0A=
> generation for hot loops would be a potential performance win. =0A=
=0A=
I am not sure optimizing the code generation itself would help much, at lea=
st in our case. The flamegraph I attached to previous letter shows that onl=
y about 10% of time qemu spends in generated code. The rest is helpers, sea=
rching for next block, TLB-related stuff and so on.=0A=
=0A=
> That would require some changes to the translation model to allow for=0A=
> multiple exit points and probably introducing a new code generator=0A=
> (gccjit or llvm) to generate highly optimised code.=0A=
=0A=
This, however, could bring a lot of performance gain, translation blocks wo=
uld become bigger, and we would spend less time searching for the next bloc=
k.=0A=
=0A=
>> I am also CCing my teammates. We are eager to improve the QEMU TCG=0A=
>> performance for our needs and to contribute our patches to upstream.=0A=
> Do you have any particular goal in mind or just "better"? The current=0A=
> MTTCG scaling tends to drop off as we go above 10-12 vCPUs due to the=0A=
> cost of synchronous flushing across all those vCPUs.=0A=
=0A=
We have some internal ways to measure performance, but we are looking for a=
lternative metric, that we could share and you could reproduce. Sysbench in=
 threads mode is the closed we have found so far by comparing flamegraphs, =
but we are testing more benchmarking software.=0A=
=0A=
>> [1]: https://github.com/akopytov/sysbench=0A=
>> [2]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg562103.html=
=0A=
>> [3]: =0A=
>> https://github.com/qemu/qemu/blob/14d02cfbe4adaeebe7cb833a8cc71191352cf0=
3b/accel/tcg/cputlb.c#L239=0A=
>> [4]: https://dl.acm.org/doi/pdf/10.1145/2686034=0A=
>>=0A=
>> [2. flamegraph.svg --- image/svg+xml; flamegraph.svg]...=0A=
>>=0A=
>> [3. callgraph.svg --- image/svg+xml; callgraph.svg]...=0A=
>>=0A=
Thanks,=0A=
Oleg=0A=
=0A=
