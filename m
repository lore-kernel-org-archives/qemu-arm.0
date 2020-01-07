Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp24479231lff;
        Tue, 7 Jan 2020 02:47:29 -0800 (PST)
X-Google-Smtp-Source: APXvYqwHSHLKux+pGr0qAaMeNHBrS7vfsW0nFzp4dS1UbQa4Tj96CAaBpgeNzbkQORHUH/v1vEkw
X-Received: by 2002:aa7:cf86:: with SMTP id z6mr111871052edx.85.1578394048986;
        Tue, 07 Jan 2020 02:47:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578394048; cv=none;
        d=google.com; s=arc-20160816;
        b=RUErfQsI0WMwRAUA+5zyETa9kLDfHx1zzSMmZ75PryXEjOaqzc4b9bDJBuvo4CBH7c
         jcqwD9Y5h1lrc/bQA1IBu9F9VafW28exRxpzIer/kiNHGOpakPto9oIHqINPUwYsjaor
         yzSKXDYYivP0fNlScXgVUIPcYpK3F7DFT/ll9qL/5QmxV4vKsovE44KNYJxV1YIX5UGQ
         hAuZlt+P5q+P+WvA7B53+7h6t00CKx+R3yG1dKDQ6iLg5WFDX3VlKKr52kK4Ac1K66vN
         M70kgyE6eNO1phQZGm1O5pMMtzB88ttGLa6SeuFXfx+6aUm1wkzyVACjDccuKersQj8B
         D+7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:to:from;
        bh=tsvf/sZAdX9MFTc6PaeTt9PWSdC5fZkdYVMMbF5JedQ=;
        b=RACNiCjn7sc3YylU4Th4SqTsF6awoN52xn+b8gAg/SEgqFNnlaNRhK+SOyYq8R0tCn
         nebfQIVJRF8CDpH2JveuI+HD4572a1nysmHal+b5aDFpQ2WVUEZzQVSxPRzvVXYn3/yt
         X8uf05539DahF6xNQGWLTqxkW2jxD8pR95oKsX3aJPpmE+S1KurYjqUsGSvanarz/Ugz
         CNG9bZ2Jg8Vf9HEAiG2rZwizddsBo+HvH/VRK7gKyUuTP4e1qcJOEpn3WsZ4VkSDRo15
         8z/ClCULT9jnwgGOlmLtT/a961kQ1Sdz7Yx3MmUkt+5OFNSDu4cmgk9Csy+dT4h0eqA1
         dj5w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x20si46016423eju.208.2020.01.07.02.47.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jan 2020 02:47:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iomOU-00044C-Hd
	for alex.bennee@linaro.org; Tue, 07 Jan 2020 05:47:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55200)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prime.zeng@hisilicon.com>) id 1iom7I-0002gv-81
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 05:29:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prime.zeng@hisilicon.com>) id 1iom7G-0002Cl-Q5
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 05:29:39 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:2426 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <prime.zeng@hisilicon.com>)
 id 1iom7A-00029I-H7; Tue, 07 Jan 2020 05:29:32 -0500
Received: from DGGEMM402-HUB.china.huawei.com (unknown [172.30.72.54])
 by Forcepoint Email with ESMTP id 39AA7985251B38707C0B;
 Tue,  7 Jan 2020 18:29:27 +0800 (CST)
Received: from DGGEMM526-MBX.china.huawei.com ([169.254.8.143]) by
 DGGEMM402-HUB.china.huawei.com ([10.3.20.210]) with mapi id 14.03.0439.000;
 Tue, 7 Jan 2020 18:29:23 +0800
From: "Zengtao (B)" <prime.zeng@hisilicon.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: RE: [PATCH] hw/arm/acpi: Pack the SRAT processors structure by
 node_id ascending order
Thread-Topic: [PATCH] hw/arm/acpi: Pack the SRAT processors structure by
 node_id ascending order
Thread-Index: AQHVxTwQeBqIZ8yXtEyanioq6c3U06feal4AgACT4nA=
Date: Tue, 7 Jan 2020 10:29:22 +0000
Message-ID: <678F3D1BB717D949B966B68EAEB446ED340B608D@dggemm526-mbx.china.huawei.com>
References: <1578388729-55540-1-git-send-email-prime.zeng@hisilicon.com>
 <20200107042918-mutt-send-email-mst@kernel.org>
In-Reply-To: <20200107042918-mutt-send-email-mst@kernel.org>
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
X-Received-From: 45.249.212.187
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
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: z2Zf7zgZyPQa

> -----Original Message-----
> From: Michael S. Tsirkin [mailto:mst@redhat.com]
> Sent: Tuesday, January 07, 2020 5:33 PM
> To: Zengtao (B)
> Cc: qemu-devel@nongnu.org; qemu-trivial@nongnu.org; Shannon Zhao;
> Peter Maydell; Igor Mammedov; qemu-arm@nongnu.org
> Subject: Re: [PATCH] hw/arm/acpi: Pack the SRAT processors structure by
> node_id ascending order
>=20
> On Tue, Jan 07, 2020 at 05:18:49PM +0800, Zeng Tao wrote:
> > When booting the guest linux with the following numa configuration:
> > -numa node,node_id=3D1,cpus=3D0-3
> > -numa node,node_id=3D0,cpus=3D4-7
> > We can get the following numa topology in the guest system:
> > Architecture:          aarch64
> > Byte Order:            Little Endian
> > CPU(s):                8
> > On-line CPU(s) list:   0-7
> > Thread(s) per core:    1
> > Core(s) per socket:    8
> > Socket(s):             1
> > NUMA node(s):          2
> > L1d cache:             unknown size
> > L1i cache:             unknown size
> > L2 cache:              unknown size
> > NUMA node0 CPU(s):     0-3
> > NUMA node1 CPU(s):     4-7
> > The Cpus 0-3 is assigned with NUMA node 1 in QEMU while it get NUMA
> node
> > 0 in the guest.
> >
> > In fact, In the linux kernel, numa_node_id is allocated per the ACPI
> > SRAT processors structure order,so the cpu 0 will be the first one to
> > allocate its NUMA node id, so it gets the NUMA node 0.
> >
> > To fix this issue, we pack the SRAT processors structure in numa node i=
d
> > order but not the default cpu number order.
> >
> > Signed-off-by: Zeng Tao <prime.zeng@hisilicon.com>
>=20
>=20
> Does this matter? If yes fixing linux to take node id from proximity
> field in ACPI seems cleaner ...
>

In fact, I just want to align the node_id concept in QEMU and Linux.
If we fix the kernel side, we need to align with all platforms.
i think maybe not a good idea.
=20
> > ---
> >  hw/arm/virt-acpi-build.c | 23 +++++++++++++++--------
> >  1 file changed, 15 insertions(+), 8 deletions(-)
> >
> > diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> > index bd5f771..497192b 100644
> > --- a/hw/arm/virt-acpi-build.c
> > +++ b/hw/arm/virt-acpi-build.c
> > @@ -520,7 +520,8 @@ build_srat(GArray *table_data, BIOSLinker
> *linker, VirtMachineState *vms)
> >      AcpiSystemResourceAffinityTable *srat;
> >      AcpiSratProcessorGiccAffinity *core;
> >      AcpiSratMemoryAffinity *numamem;
> > -    int i, srat_start;
> > +    int i, j, srat_start;
> > +    uint32_t node_id;
> >      uint64_t mem_base;
> >      MachineClass *mc =3D MACHINE_GET_CLASS(vms);
> >      MachineState *ms =3D MACHINE(vms);
> > @@ -530,13 +531,19 @@ build_srat(GArray *table_data, BIOSLinker
> *linker, VirtMachineState *vms)
> >      srat =3D acpi_data_push(table_data, sizeof(*srat));
> >      srat->reserved1 =3D cpu_to_le32(1);
> >
> > -    for (i =3D 0; i < cpu_list->len; ++i) {
> > -        core =3D acpi_data_push(table_data, sizeof(*core));
> > -        core->type =3D ACPI_SRAT_PROCESSOR_GICC;
> > -        core->length =3D sizeof(*core);
> > -        core->proximity =3D
> cpu_to_le32(cpu_list->cpus[i].props.node_id);
> > -        core->acpi_processor_uid =3D cpu_to_le32(i);
> > -        core->flags =3D cpu_to_le32(1);
> > +    for (i =3D 0; i < ms->numa_state->num_nodes; ++i) {
> > +        for (j =3D 0; j < cpu_list->len; ++j) {
>=20
> Hmm O(n ^2) isn't great ...
Good suggestion, 3Q.
>=20
> > +            node_id =3D cpu_to_le32(cpu_list->cpus[j].props.node_id);
> > +            if (node_id !=3D i) {
> > +                continue;
> > +            }
> > +            core =3D acpi_data_push(table_data, sizeof(*core));
> > +            core->type =3D ACPI_SRAT_PROCESSOR_GICC;
> > +            core->length =3D sizeof(*core);
> > +            core->proximity =3D node_id;
> > +            core->acpi_processor_uid =3D cpu_to_le32(j);
> > +            core->flags =3D cpu_to_le32(1);
> > +        }
> >      }
>=20
> is the issue arm specific? wouldn't it affect x86 too?
>=20
Good question, I think it will affect x86, but I need to confirm.

> >      mem_base =3D vms->memmap[VIRT_MEM].base;
> > --
> > 2.8.1

