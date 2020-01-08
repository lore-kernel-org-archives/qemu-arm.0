Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp965558lff;
        Wed, 8 Jan 2020 08:39:02 -0800 (PST)
X-Google-Smtp-Source: APXvYqxccRR4g2MXhB1QEOveF3mSCic3EQUFVZWcvl8PZcDPJqBY2fNhfO5GWGmEmPzPSpxuHoid
X-Received: by 2002:ae9:e704:: with SMTP id m4mr4948359qka.153.1578501542785;
        Wed, 08 Jan 2020 08:39:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578501542; cv=none;
        d=google.com; s=arc-20160816;
        b=MYZa6jT6+O8fFJFNB5rBZOWnS1Pa4n+FZm49H2XobnL0WH+kiivbOTej2kBUuaL3dk
         2XzWw4yj5617++9hzAmF5/9KLlPLo4v3H/e3U4t4I7b8ZlatdsM3btxgqMCf3s/il9R8
         3WXc4IWWTFulgh5CuEgwASbCfZ26IpaIMmyAh+v4HzC12fcfkNSfIwt0BwQMdRZGG953
         ZEMQAbhdnysOoDilMQsURAinRVMxmjqhFP2FXy72BG8qmdCk5nr2s3yMufHb189EcvxS
         zOIbmJKjMEOpd1E0q4AGkV/rouH1KFDicHn70X3phhs80XlmUM1KhA+swXYoB2Bl5zie
         9u1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=zdkzu0UidID5/t1DGhSXQ8YpsFXnbs28okomtn7Gcnk=;
        b=MUugFcc5Gc9gfr1Wfr9RRVpjUEX51TcnwZb6oOxL9dkjfFAY1Nxd1vaBPBa5jHlCod
         Hs10rMKp2ugQDCZ418X5X8anoFKLtn9mXb7Nqi0rRjkh54keXek4wYmSEQe0nYX/R9Tr
         Ku46mOcYTTUbqlHVUkcRBfRtLIWw3r/MxdXH6Uv7qsb8PU2jtt98hEk3EkgAvvYbcecc
         lmgiT0rcbI6R3hAuiyvux7cjZddAwRQAK0sgBO+r2d39dMHxw/3HDOvf70f3BAhKutC4
         7m9liGJsdJYzjNTMjiPmPzXFKmOTzTRVFX/lutez5dqR3H+Ic7YylwmltIfWgWO9ySqc
         Q7aQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=OSrbBRuB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s54si1850519qtc.294.2020.01.08.08.39.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Jan 2020 08:39:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=OSrbBRuB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ipEMI-0007Nz-49
	for alex.bennee@linaro.org; Wed, 08 Jan 2020 11:39:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60619)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1ipEM3-0007Ne-QN
 for qemu-arm@nongnu.org; Wed, 08 Jan 2020 11:38:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1ipEM1-00024X-MI
 for qemu-arm@nongnu.org; Wed, 08 Jan 2020 11:38:47 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:59987
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1ipEM1-000238-Is
 for qemu-arm@nongnu.org; Wed, 08 Jan 2020 11:38:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578501524;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zdkzu0UidID5/t1DGhSXQ8YpsFXnbs28okomtn7Gcnk=;
 b=OSrbBRuBr5OZ9G8M31x/7DnHyXfJErmV81u8JX6J42UwVy3xOli1Yg6Ym9YcGJHVQ5/5MK
 6zv4Og+WrAoEHthDt0Le1qWl7hZ89QJcTdoJUFMXFq+GwWrdAFrXkMTvlndgauC1dlIQJX
 P8Z5K4HNxarQbpUk4Unm36rpjpxOJN4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-28-9Ri7Z8H2NF6OuTtRB4JF8w-1; Wed, 08 Jan 2020 11:38:41 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E2B3EDB8F;
 Wed,  8 Jan 2020 16:38:39 +0000 (UTC)
Received: from localhost (unknown [10.43.2.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A763C10027A6;
 Wed,  8 Jan 2020 16:38:34 +0000 (UTC)
Date: Wed, 8 Jan 2020 17:38:32 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: "Zengtao (B)" <prime.zeng@hisilicon.com>
Subject: Re: [PATCH] hw/arm/acpi: Pack the SRAT processors structure by
 node_id ascending order
Message-ID: <20200108173832.61508f8b@redhat.com>
In-Reply-To: <678F3D1BB717D949B966B68EAEB446ED340B8B24@dggemm526-mbx.china.huawei.com>
References: <1578388729-55540-1-git-send-email-prime.zeng@hisilicon.com>
 <20200107042918-mutt-send-email-mst@kernel.org>
 <678F3D1BB717D949B966B68EAEB446ED340B608D@dggemm526-mbx.china.huawei.com>
 <20200107164958.7811777d@redhat.com>
 <678F3D1BB717D949B966B68EAEB446ED340B8B24@dggemm526-mbx.china.huawei.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: 9Ri7Z8H2NF6OuTtRB4JF8w-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AnyuumWg7s1o

On Wed, 8 Jan 2020 04:02:10 +0000
"Zengtao (B)" <prime.zeng@hisilicon.com> wrote:

> > -----Original Message-----
> > From: Igor Mammedov [mailto:imammedo@redhat.com]
> > Sent: Tuesday, January 07, 2020 11:50 PM
> > To: Zengtao (B)
> > Cc: Michael S. Tsirkin; qemu-devel@nongnu.org; qemu-trivial@nongnu.org;
> > Shannon Zhao; Peter Maydell; qemu-arm@nongnu.org
> > Subject: Re: [PATCH] hw/arm/acpi: Pack the SRAT processors structure by
> > node_id ascending order
> > 
> > On Tue, 7 Jan 2020 10:29:22 +0000
> > "Zengtao (B)" <prime.zeng@hisilicon.com> wrote:
> >   
> > > > -----Original Message-----
> > > > From: Michael S. Tsirkin [mailto:mst@redhat.com]
> > > > Sent: Tuesday, January 07, 2020 5:33 PM
> > > > To: Zengtao (B)
> > > > Cc: qemu-devel@nongnu.org; qemu-trivial@nongnu.org; Shannon  
> > Zhao;  
> > > > Peter Maydell; Igor Mammedov; qemu-arm@nongnu.org
> > > > Subject: Re: [PATCH] hw/arm/acpi: Pack the SRAT processors structure  
> > by  
> > > > node_id ascending order
> > > >
> > > > On Tue, Jan 07, 2020 at 05:18:49PM +0800, Zeng Tao wrote:  
> > > > > When booting the guest linux with the following numa configuration:
> > > > > -numa node,node_id=1,cpus=0-3
> > > > > -numa node,node_id=0,cpus=4-7
> > > > > We can get the following numa topology in the guest system:
> > > > > Architecture:          aarch64
> > > > > Byte Order:            Little Endian
> > > > > CPU(s):                8
> > > > > On-line CPU(s) list:   0-7
> > > > > Thread(s) per core:    1
> > > > > Core(s) per socket:    8
> > > > > Socket(s):             1
> > > > > NUMA node(s):          2
> > > > > L1d cache:             unknown size
> > > > > L1i cache:             unknown size
> > > > > L2 cache:              unknown size
> > > > > NUMA node0 CPU(s):     0-3
> > > > > NUMA node1 CPU(s):     4-7
> > > > > The Cpus 0-3 is assigned with NUMA node 1 in QEMU while it get  
> > NUMA  
> > > > node  
> > > > > 0 in the guest.
> > > > >
> > > > > In fact, In the linux kernel, numa_node_id is allocated per the ACPI
> > > > > SRAT processors structure order,so the cpu 0 will be the first one to
> > > > > allocate its NUMA node id, so it gets the NUMA node 0.
> > > > >
> > > > > To fix this issue, we pack the SRAT processors structure in numa node  
> > id  
> > > > > order but not the default cpu number order.
> > > > >
> > > > > Signed-off-by: Zeng Tao <prime.zeng@hisilicon.com>  
> > > >
> > > >
> > > > Does this matter? If yes fixing linux to take node id from proximity
> > > > field in ACPI seems cleaner ...
> > > >  
> > >
> > > In fact, I just want to align the node_id concept in QEMU and Linux.
> > > If we fix the kernel side, we need to align with all platforms.
> > > i think maybe not a good idea.  
> > if linux makes up node ID's on it's own, it would be hard for it to
> > map SRAT entries to other tables that use proximity id as well.
> > 
> > So it would need to maintain map of [proximity id] -> [node id] (and reverse)
> > somewhere to resolve mappings on other tables.
> > If it doesn't do this then it's broken and works just by accident,
> > if it does the fix probably should be in that code and not in QEMU.
> >   
> 
> Hmm, the problem is how to understand the concept of node id.
> 1. In dts, there is node id. Both the QEMU and Linux can use it
> directly, so no conflict.
> 2. In ACPI, there is only proximity domain, but no node id, there
>  should be a mapping between them, while kernel and QEMU maintain
>  their own rule, and unfortunately they conflict with each other 
>  sometimes.
> 
> There is no specification to indicate what we should do to maintain the
> mapping, so it's hard to align the QEMU and Linux.
>
> Any suggestion, or we just accept it as a rule since it don't affect much?

If node id generation is driven by SRAT content, it might be reasonable to
ask for SRAT parser in kernel to create node ids using proximity value
instead of the order ACPI_SRAT_PROCESSOR_GICC structures are enumerated.
That way node id would match ACPI spec.

But even with that I'd wouldn't expect cpu ids match as its basically
arbitrary numbers on both sided. One would need to use arch specific ids
to reliably match cpus on both sides (MPIDR in ARM case or APICID in x86).

> > >  
> > > > > ---
> > > > >  hw/arm/virt-acpi-build.c | 23 +++++++++++++++--------
> > > > >  1 file changed, 15 insertions(+), 8 deletions(-)
> > > > >
> > > > > diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> > > > > index bd5f771..497192b 100644
> > > > > --- a/hw/arm/virt-acpi-build.c
> > > > > +++ b/hw/arm/virt-acpi-build.c
> > > > > @@ -520,7 +520,8 @@ build_srat(GArray *table_data, BIOSLinker  
> > > > *linker, VirtMachineState *vms)  
> > > > >      AcpiSystemResourceAffinityTable *srat;
> > > > >      AcpiSratProcessorGiccAffinity *core;
> > > > >      AcpiSratMemoryAffinity *numamem;
> > > > > -    int i, srat_start;
> > > > > +    int i, j, srat_start;
> > > > > +    uint32_t node_id;
> > > > >      uint64_t mem_base;
> > > > >      MachineClass *mc = MACHINE_GET_CLASS(vms);
> > > > >      MachineState *ms = MACHINE(vms);
> > > > > @@ -530,13 +531,19 @@ build_srat(GArray *table_data, BIOSLinker  
> > > > *linker, VirtMachineState *vms)  
> > > > >      srat = acpi_data_push(table_data, sizeof(*srat));
> > > > >      srat->reserved1 = cpu_to_le32(1);
> > > > >
> > > > > -    for (i = 0; i < cpu_list->len; ++i) {
> > > > > -        core = acpi_data_push(table_data, sizeof(*core));
> > > > > -        core->type = ACPI_SRAT_PROCESSOR_GICC;
> > > > > -        core->length = sizeof(*core);
> > > > > -        core->proximity =  
> > > > cpu_to_le32(cpu_list->cpus[i].props.node_id);  
> > > > > -        core->acpi_processor_uid = cpu_to_le32(i);
> > > > > -        core->flags = cpu_to_le32(1);
> > > > > +    for (i = 0; i < ms->numa_state->num_nodes; ++i) {
> > > > > +        for (j = 0; j < cpu_list->len; ++j) {  
> > > >
> > > > Hmm O(n ^2) isn't great ...  
> > > Good suggestion, 3Q.  
> > > >  
> > > > > +            node_id =  
> > cpu_to_le32(cpu_list->cpus[j].props.node_id);  
> > > > > +            if (node_id != i) {
> > > > > +                continue;
> > > > > +            }
> > > > > +            core = acpi_data_push(table_data, sizeof(*core));
> > > > > +            core->type = ACPI_SRAT_PROCESSOR_GICC;
> > > > > +            core->length = sizeof(*core);
> > > > > +            core->proximity = node_id;
> > > > > +            core->acpi_processor_uid = cpu_to_le32(j);
> > > > > +            core->flags = cpu_to_le32(1);
> > > > > +        }
> > > > >      }  
> > > >
> > > > is the issue arm specific? wouldn't it affect x86 too?
> > > >  
> > > Good question, I think it will affect x86, but I need to confirm.
> > >  
> > > > >      mem_base = vms->memmap[VIRT_MEM].base;
> > > > > --
> > > > > 2.8.1  
> > >  
> 

