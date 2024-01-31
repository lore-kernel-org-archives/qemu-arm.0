Received: by 2002:a17:906:724b:b0:a35:eedd:80b0 with SMTP id n11csp1566113ejk;
        Wed, 31 Jan 2024 07:56:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEVXjtPqdEC9ENDBDepTgq52mfoAdJYGhD0KfBFlm629tz3LJoFX/+vX6ICfRmBSvYcEIYd
X-Received: by 2002:a05:6214:20cd:b0:68c:675b:c83a with SMTP id 13-20020a05621420cd00b0068c675bc83amr2528674qve.60.1706716601737;
        Wed, 31 Jan 2024 07:56:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706716601; cv=none;
        d=google.com; s=arc-20160816;
        b=Kj7YQeZmLECPRvacQy/eisOpkpFuM/x99KeSaLF7/q/nfzl6ZtDoJ4b04r1RrTC3dP
         0NpQKkR36KS5ymlFx+ZgHo9kQB0N4pCpo1KNF/+L7dHi44aH5RT/gAiEb+leXIbQFpbJ
         iSODcR9QtXlCM29dkHILm1rHAspieN2yEilIYPMQo4v1VLXCtOYSTqRXu3BvwyvsSwX1
         xGk0GY5D3v9qLeoSuQkm/W8CV1b7343jZLRDQHh//n/jdopi7bh4/iF+lMz5mQ6NpH9G
         t7wzane3Cqx5nK/UXX+DaKFxiCuq3MtugmQuvX/YrodSjXpuqyMG4MNgWj4O7SpLzuC4
         ME8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:date;
        bh=O7kObV90UP+kUJgU5V4IAOgDDaNrnhmUC3BVDChUXDY=;
        fh=dbDMc68wM8treOIYnE6MOd1zB8lsInCdSWW4ZqNcZQM=;
        b=OW1bc0ra9NKirwLNrCYKWctHVP8gEZbnaodLRrF6YORDmmnThIz4ch8HBWDh6ONlZu
         ZAzFClBw3q3VyRuhbC9xp2GqfYv0qurjvgo0BdrRPLHhbvCmoDrtauODib6yhs1yRZTa
         nCHVdqpsyjoh0dclsuF85OuBQ1hfGIyzuFTLLN69Kxi4/LXKs/NPpWInZd1WFcSuUe0q
         EUexBHYZxJA2HBwlmkiNjpzQYtXGuwVgERcFQFhtH9CPgChz0tTt8twSLY+yP3Aj8LZz
         NSOcOWR+ExgB907I8wG2DyoXzECjgCRyt9uM/gjLdjFcylsXLSIgympZB+nHVOKFnIvn
         jxlQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jz14-20020a0562140e6e00b0068c4839f6a3si7793557qvb.329.2024.01.31.07.56.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 Jan 2024 07:56:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rVCwz-0006Db-I1; Wed, 31 Jan 2024 10:56:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1rVCwu-00068p-1s; Wed, 31 Jan 2024 10:56:29 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1rVCwr-0008Tk-He; Wed, 31 Jan 2024 10:56:27 -0500
Received: from mail.maildlp.com (unknown [172.18.186.231])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4TQ64v0Yf9z6JB0F;
 Wed, 31 Jan 2024 23:53:03 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
 by mail.maildlp.com (Postfix) with ESMTPS id 27C1D1408FF;
 Wed, 31 Jan 2024 23:56:23 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 31 Jan
 2024 15:56:22 +0000
Date: Wed, 31 Jan 2024 15:56:21 +0000
To: JeeHeng Sia <jeeheng.sia@starfivetech.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org"
 <qemu-arm@nongnu.org>, "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>,
 "mst@redhat.com" <mst@redhat.com>, "imammedo@redhat.com"
 <imammedo@redhat.com>, "anisinha@redhat.com" <anisinha@redhat.com>,
 "shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "sunilvl@ventanamicro.com" <sunilvl@ventanamicro.com>, "palmer@dabbelt.com"
 <palmer@dabbelt.com>, "alistair.francis@wdc.com" <alistair.francis@wdc.com>,
 "bin.meng@windriver.com" <bin.meng@windriver.com>, "liwei1518@gmail.com"
 <liwei1518@gmail.com>, "dbarboza@ventanamicro.com"
 <dbarboza@ventanamicro.com>, "zhiwei_liu@linux.alibaba.com"
 <zhiwei_liu@linux.alibaba.com>
Subject: Re: [RFC v1 3/3] hw/arm/virt-acpi-build.c: Enable CPU cache topology
Message-ID: <20240131155621.000015d1@Huawei.com>
In-Reply-To: <BJSPR01MB056164DC332463349ACD6F3A9C7DA@BJSPR01MB0561.CHNPR01.prod.partner.outlook.cn>
References: <20240129081423.116615-1-jeeheng.sia@starfivetech.com>
 <20240129081423.116615-4-jeeheng.sia@starfivetech.com>
 <20240129110823.000076df@Huawei.com>
 <BJSPR01MB056164DC332463349ACD6F3A9C7DA@BJSPR01MB0561.CHNPR01.prod.partner.outlook.cn>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml100002.china.huawei.com (7.191.160.241) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-to:  Jonathan Cameron <Jonathan.Cameron@Huawei.com>
From:  Jonathan Cameron via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: +salE6Cn/P8k

On Tue, 30 Jan 2024 05:03:15 +0000
JeeHeng Sia <jeeheng.sia@starfivetech.com> wrote:

> > -----Original Message-----
> > From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
> > Sent: Monday, January 29, 2024 7:08 PM
> > To: JeeHeng Sia <jeeheng.sia@starfivetech.com>
> > Cc: qemu-devel@nongnu.org; qemu-arm@nongnu.org; qemu-riscv@nongnu.org; mst@redhat.com; imammedo@redhat.com;
> > anisinha@redhat.com; shannon.zhaosl@gmail.com; peter.maydell@linaro.org; sunilvl@ventanamicro.com; palmer@dabbelt.com;
> > alistair.francis@wdc.com; bin.meng@windriver.com; liwei1518@gmail.com; dbarboza@ventanamicro.com;
> > zhiwei_liu@linux.alibaba.com
> > Subject: Re: [RFC v1 3/3] hw/arm/virt-acpi-build.c: Enable CPU cache topology
> > 
> > On Mon, 29 Jan 2024 00:14:23 -0800
> > Sia Jee Heng <jeeheng.sia@starfivetech.com> wrote:
> >   
> > > Introduced a 3-layer cache for the ARM virtual machine.
> > >
> > > Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>  
> > 
> > There are a bunch of CPU registers that also need updating to reflect the
> > described cache.
> > https://lore.kernel.org/qemu-devel/20230808115713.2613-3-Jonathan.Cameron@huawei.com/
> > It's called HACK for a reason ;)
> > But there is some discussion about this issue in the thread.
> > 
> > The l1 etc also needs to reflect the CPU model.  This stuff needs to match.
> > Wrong information being passed to a VM is probably worse than no information.
> > 
> > Whilst I plan to circle back to the MPAM support (perhaps next month) there
> > is a lot more to be done here before we have useful cache descriptions for
> > guests.  
> Thanks for the info. I will spend time to look into.
> > 
> > Jonathan
> >   
> > > ---
> > >  hw/arm/virt-acpi-build.c | 44 +++++++++++++++++++++++++++++++++++++++-
> > >  1 file changed, 43 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> > > index 17aeec7a6f..c57067cd63 100644
> > > --- a/hw/arm/virt-acpi-build.c
> > > +++ b/hw/arm/virt-acpi-build.c
> > > @@ -426,6 +426,48 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> > >      g_array_free(its_idmaps, true);
> > >  }
> > >
> > > +static void pptt_setup(GArray *table_data, BIOSLinker *linker, MachineState *ms,
> > > +                       const char *oem_id, const char *oem_table_id)
> > > +{
> > > +    CPUCaches default_cache_info = {
> > > +        .l1d_cache = &(CPUCacheInfo) {
> > > +            .type = DATA_CACHE,
> > > +            .size = 64 * KiB,
> > > +            .line_size = 64,
> > > +            .associativity = 4,
> > > +            .sets = 256,
> > > +            .attributes = 0x02,
> > > +        },
> > > +        .l1i_cache = &(CPUCacheInfo) {
> > > +            .type = INSTRUCTION_CACHE,
> > > +            .size = 64 * KiB,
> > > +            .line_size = 64,
> > > +            .associativity = 4,
> > > +            .sets = 256,
> > > +            .attributes = 0x04,  
> > 
> > This is the duplication I commented on in patch 1.
> > The bit set there is the one to indicate it's an instruction
> > cache and we have type doing that as well.  
> But this gives a great readability, no?

Not really no. If .type and attributes end up out of agreement with each
other it will be non obvious.

You could do 
		.attributes {
			.type = INSTRUCTION_CACHE,
			.other things ...
		}

if you want to list the type clearly and still maintain the info that
this ends up in attributes.


> > 
> >   
> > > +        },
> > > +        .l2_cache = &(CPUCacheInfo) {
> > > +            .type = UNIFIED_CACHE,
> > > +            .size = 2048 * KiB,
> > > +            .line_size = 64,
> > > +            .associativity = 8,
> > > +            .sets = 4096,
> > > +            .attributes = 0x0a,
> > > +        },
> > > +        .l3_cache = &(CPUCacheInfo) {
> > > +            .type = UNIFIED_CACHE,
> > > +            .size = 4096 * KiB,
> > > +            .line_size = 64,
> > > +            .associativity = 8,
> > > +            .sets = 8192,
> > > +            .attributes = 0x0a,
> > > +        },
> > > +    };
> > > +
> > > +    build_pptt(table_data, linker, ms, oem_id, oem_table_id,
> > > +               &default_cache_info);
> > > +}
> > > +
> > >  /*
> > >   * Serial Port Console Redirection Table (SPCR)
> > >   * Rev: 1.07
> > > @@ -912,7 +954,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
> > >
> > >      if (!vmc->no_cpu_topology) {
> > >          acpi_add_table(table_offsets, tables_blob);
> > > -        build_pptt(tables_blob, tables->linker, ms,
> > > +        pptt_setup(tables_blob, tables->linker, ms,
> > >                     vms->oem_id, vms->oem_table_id);
> > >      }
> > >  
> 

