Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp257920lff;
        Tue, 7 Jan 2020 20:09:55 -0800 (PST)
X-Google-Smtp-Source: APXvYqx2UF7cZwuc7PQdlDvVN7J8h9TEyTsbpyB0p3TuXM77DJHmTYTO6ChjBqgnIq76mdX2/7mI
X-Received: by 2002:a50:ab5b:: with SMTP id t27mr3315957edc.229.1578456595641;
        Tue, 07 Jan 2020 20:09:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578456595; cv=none;
        d=google.com; s=arc-20160816;
        b=kEq6NrPWAPvQK0azKdkez/CAWcaX/W38fD5HX0CsVp856vTWOp9D/jze3vk7pRqWla
         D08ktMFGgLMb3q7fvtN2dzjDkfjh0pFyTjO95kXDVR7V4OIJrZDpQmmyRb302Y+zaMqX
         Wgb4WgZ28luEGI8JHNuP2RXiP4ErME9ABypgkUjPE8JnwD++sA46adKOqTRE67q8zAy3
         btog2e3SJFmNd6yzSkXi3iKFesiJ18Rm7xVn4iocPQOFu4/MgXHDYInMXjT97vAtfQGm
         H3VqWIGOGmHGuWDk1gyddiAKqKYrDFlL6NSI1H0SKZ2YMDvGLJRfQWOQagUB0nVhbOh0
         tGoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:to:from;
        bh=BDtniau4RqUmY9SRVVFusombe48a6wZEpBTEf9auUDc=;
        b=xwhflSfvBeDFcr4SmG0PhJVe6Yp2Y9231VT1Jn8M/mLWNDvv1slrYnG9E3Zf2uorkP
         VKjQ4SLLnN9bHddwtgc2QGLzeOnCI7KqGnqv76x7Gxmaykt9vYu+ReIzL1nX5WvBM91W
         X7T04Cm1b8V+OTgU+sfdiAbfwbO+SwRhvOjE8LuXg8Rz6qwAkfakUOrYmhP9ZEAeCia0
         8Jpan3srRBW5OvlwIoDSa2tS01Kx+rmZN1V+X1sU6fTjM5++KwLQTpKI8SnZu7CNbU2f
         NR2298SM0k7ieTVleOt/NXNnwPHiM8L9Gg/v3pLbNWstsYcMHiF7y/yB+rW6YurxwhHc
         LH0w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s17si1187589edr.387.2020.01.07.20.09.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jan 2020 20:09:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ip2fK-0004CF-E6
	for alex.bennee@linaro.org; Tue, 07 Jan 2020 23:09:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60111)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prime.zeng@hisilicon.com>) id 1ip2Y5-0001tQ-TB
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 23:02:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prime.zeng@hisilicon.com>) id 1ip2Y4-0008HF-Cf
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 23:02:25 -0500
Received: from szxga08-in.huawei.com ([45.249.212.255]:33406 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <prime.zeng@hisilicon.com>)
 id 1ip2Y0-00088w-QT; Tue, 07 Jan 2020 23:02:21 -0500
Received: from DGGEMM406-HUB.china.huawei.com (unknown [172.30.72.53])
 by Forcepoint Email with ESMTP id B23C8F73DEA1703FDE75;
 Wed,  8 Jan 2020 12:02:15 +0800 (CST)
Received: from DGGEMM526-MBX.china.huawei.com ([169.254.8.143]) by
 DGGEMM406-HUB.china.huawei.com ([10.3.20.214]) with mapi id 14.03.0439.000;
 Wed, 8 Jan 2020 12:02:11 +0800
From: "Zengtao (B)" <prime.zeng@hisilicon.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: RE: [PATCH] hw/arm/acpi: Pack the SRAT processors structure by
 node_id ascending order
Thread-Topic: [PATCH] hw/arm/acpi: Pack the SRAT processors structure by
 node_id ascending order
Thread-Index: AQHVxTwQeBqIZ8yXtEyanioq6c3U06feal4AgACT4nD//9VlAIABTx2w
Date: Wed, 8 Jan 2020 04:02:10 +0000
Message-ID: <678F3D1BB717D949B966B68EAEB446ED340B8B24@dggemm526-mbx.china.huawei.com>
References: <1578388729-55540-1-git-send-email-prime.zeng@hisilicon.com>
 <20200107042918-mutt-send-email-mst@kernel.org>
 <678F3D1BB717D949B966B68EAEB446ED340B608D@dggemm526-mbx.china.huawei.com>
 <20200107164958.7811777d@redhat.com>
In-Reply-To: <20200107164958.7811777d@redhat.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.74.221.187]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.255
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nGi1xsVO3gWE

> -----Original Message-----
> From: Igor Mammedov [mailto:imammedo@redhat.com]
> Sent: Tuesday, January 07, 2020 11:50 PM
> To: Zengtao (B)
> Cc: Michael S. Tsirkin; qemu-devel@nongnu.org; qemu-trivial@nongnu.org;
> Shannon Zhao; Peter Maydell; qemu-arm@nongnu.org
> Subject: Re: [PATCH] hw/arm/acpi: Pack the SRAT processors structure by
> node_id ascending order
>=20
> On Tue, 7 Jan 2020 10:29:22 +0000
> "Zengtao (B)" <prime.zeng@hisilicon.com> wrote:
>=20
> > > -----Original Message-----
> > > From: Michael S. Tsirkin [mailto:mst@redhat.com]
> > > Sent: Tuesday, January 07, 2020 5:33 PM
> > > To: Zengtao (B)
> > > Cc: qemu-devel@nongnu.org; qemu-trivial@nongnu.org; Shannon
> Zhao;
> > > Peter Maydell; Igor Mammedov; qemu-arm@nongnu.org
> > > Subject: Re: [PATCH] hw/arm/acpi: Pack the SRAT processors structure
> by
> > > node_id ascending order
> > >
> > > On Tue, Jan 07, 2020 at 05:18:49PM +0800, Zeng Tao wrote:
> > > > When booting the guest linux with the following numa configuration:
> > > > -numa node,node_id=3D1,cpus=3D0-3
> > > > -numa node,node_id=3D0,cpus=3D4-7
> > > > We can get the following numa topology in the guest system:
> > > > Architecture:          aarch64
> > > > Byte Order:            Little Endian
> > > > CPU(s):                8
> > > > On-line CPU(s) list:   0-7
> > > > Thread(s) per core:    1
> > > > Core(s) per socket:    8
> > > > Socket(s):             1
> > > > NUMA node(s):          2
> > > > L1d cache:             unknown size
> > > > L1i cache:             unknown size
> > > > L2 cache:              unknown size
> > > > NUMA node0 CPU(s):     0-3
> > > > NUMA node1 CPU(s):     4-7
> > > > The Cpus 0-3 is assigned with NUMA node 1 in QEMU while it get
> NUMA
> > > node
> > > > 0 in the guest.
> > > >
> > > > In fact, In the linux kernel, numa_node_id is allocated per the ACP=
I
> > > > SRAT processors structure order,so the cpu 0 will be the first one =
to
> > > > allocate its NUMA node id, so it gets the NUMA node 0.
> > > >
> > > > To fix this issue, we pack the SRAT processors structure in numa no=
de
> id
> > > > order but not the default cpu number order.
> > > >
> > > > Signed-off-by: Zeng Tao <prime.zeng@hisilicon.com>
> > >
> > >
> > > Does this matter? If yes fixing linux to take node id from proximity
> > > field in ACPI seems cleaner ...
> > >
> >
> > In fact, I just want to align the node_id concept in QEMU and Linux.
> > If we fix the kernel side, we need to align with all platforms.
> > i think maybe not a good idea.
> if linux makes up node ID's on it's own, it would be hard for it to
> map SRAT entries to other tables that use proximity id as well.
>=20
> So it would need to maintain map of [proximity id] -> [node id] (and reve=
rse)
> somewhere to resolve mappings on other tables.
> If it doesn't do this then it's broken and works just by accident,
> if it does the fix probably should be in that code and not in QEMU.
>=20

Hmm, the problem is how to understand the concept of node id.
1. In dts, there is node id. Both the QEMU and Linux can use it
directly, so no conflict.
2. In ACPI, there is only proximity domain, but no node id, there
 should be a mapping between them, while kernel and QEMU maintain
 their own rule, and unfortunately they conflict with each other=20
 sometimes.

There is no specification to indicate what we should do to maintain the
mapping, so it's hard to align the QEMU and Linux.

Any suggestion, or we just accept it as a rule since it don't affect much?

> >
> > > > ---
> > > >  hw/arm/virt-acpi-build.c | 23 +++++++++++++++--------
> > > >  1 file changed, 15 insertions(+), 8 deletions(-)
> > > >
> > > > diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> > > > index bd5f771..497192b 100644
> > > > --- a/hw/arm/virt-acpi-build.c
> > > > +++ b/hw/arm/virt-acpi-build.c
> > > > @@ -520,7 +520,8 @@ build_srat(GArray *table_data, BIOSLinker
> > > *linker, VirtMachineState *vms)
> > > >      AcpiSystemResourceAffinityTable *srat;
> > > >      AcpiSratProcessorGiccAffinity *core;
> > > >      AcpiSratMemoryAffinity *numamem;
> > > > -    int i, srat_start;
> > > > +    int i, j, srat_start;
> > > > +    uint32_t node_id;
> > > >      uint64_t mem_base;
> > > >      MachineClass *mc =3D MACHINE_GET_CLASS(vms);
> > > >      MachineState *ms =3D MACHINE(vms);
> > > > @@ -530,13 +531,19 @@ build_srat(GArray *table_data, BIOSLinker
> > > *linker, VirtMachineState *vms)
> > > >      srat =3D acpi_data_push(table_data, sizeof(*srat));
> > > >      srat->reserved1 =3D cpu_to_le32(1);
> > > >
> > > > -    for (i =3D 0; i < cpu_list->len; ++i) {
> > > > -        core =3D acpi_data_push(table_data, sizeof(*core));
> > > > -        core->type =3D ACPI_SRAT_PROCESSOR_GICC;
> > > > -        core->length =3D sizeof(*core);
> > > > -        core->proximity =3D
> > > cpu_to_le32(cpu_list->cpus[i].props.node_id);
> > > > -        core->acpi_processor_uid =3D cpu_to_le32(i);
> > > > -        core->flags =3D cpu_to_le32(1);
> > > > +    for (i =3D 0; i < ms->numa_state->num_nodes; ++i) {
> > > > +        for (j =3D 0; j < cpu_list->len; ++j) {
> > >
> > > Hmm O(n ^2) isn't great ...
> > Good suggestion, 3Q.
> > >
> > > > +            node_id =3D
> cpu_to_le32(cpu_list->cpus[j].props.node_id);
> > > > +            if (node_id !=3D i) {
> > > > +                continue;
> > > > +            }
> > > > +            core =3D acpi_data_push(table_data, sizeof(*core));
> > > > +            core->type =3D ACPI_SRAT_PROCESSOR_GICC;
> > > > +            core->length =3D sizeof(*core);
> > > > +            core->proximity =3D node_id;
> > > > +            core->acpi_processor_uid =3D cpu_to_le32(j);
> > > > +            core->flags =3D cpu_to_le32(1);
> > > > +        }
> > > >      }
> > >
> > > is the issue arm specific? wouldn't it affect x86 too?
> > >
> > Good question, I think it will affect x86, but I need to confirm.
> >
> > > >      mem_base =3D vms->memmap[VIRT_MEM].base;
> > > > --
> > > > 2.8.1
> >

