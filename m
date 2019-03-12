Received: by 2002:adf:fd4f:0:0:0:0:0 with SMTP id h15csp452122wrs;
        Tue, 12 Mar 2019 05:50:43 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx9cA3JqHZ0kY27ja6/vUGBee5wG/dY2AC2sCQ2HAMqAnyWhlu9IKh2MT9UQXJY5z7XjtQM
X-Received: by 2002:a25:ba90:: with SMTP id s16mr31046838ybg.336.1552395043218;
        Tue, 12 Mar 2019 05:50:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552395043; cv=none;
        d=google.com; s=arc-20160816;
        b=GC9stHiMg/E7JuuWtCmArcxfA2OPmP11/iOBaz//X4yLgPA20ih9M302kQ7vwDNyCT
         7sT5hLXwQtC5Rns6A1DcRIcFUNfsBEUilCoawZFJmepiIhRCsSL11RU3uHj90msLKXu4
         zRvX00kmco9NHxrsTk7BaAsyqcAo+qbTZ+gMfOpFr2M/oHVBISZUnDPTyjVoF78a+pJq
         IG4GyZ5NXvETsDaetgjPrpWrXOM0O1kCA7Sm0YXnALOCHWj6GfQBkX3swF5MZT+jBWZa
         xpHXr5yPsiNOmxHYGloHxotsfaGPkn6CnszXvoESVHeLf2aPJZo7isUQL7L+dVFOYntW
         H+UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=qqw6ImJgXp+nmLupzypAAKT8MdLqdX08H26sAEAk3o8=;
        b=zcrFWbwhuKesF2UMrY698hqMwA5vyg2jg5Tcw7GqIA575RORyxc98VDD+nu4G+dZi/
         i1zNPPUHChlveyBXufkH81lErLz9cooWh+3Rtzj4bK/HcJPShbXgRulv5A47nAqSlQne
         yL7NT0Ox/FQDrkSA6ANMygRCOpXWoj2+LyhMHYRrjUbu2X1JoxIHVOgGnvZaH/LfgblW
         ba5pO5qi28zMs72jpF4MENDNl7o/ywGekxhVjW/kti773oi6ay+6kjm/hoQMoCWGMSTC
         V2DZ04V8kEEPYvFh4TAvrT0dbFpFkQs3zZ969Qgys8OTuyQrGDVrb2jLe75CjlonSNy4
         9eIg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b2si3926623ywc.419.2019.03.12.05.50.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Mar 2019 05:50:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:51770 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h3gri-0005EY-L0
	for alex.bennee@linaro.org; Tue, 12 Mar 2019 08:50:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46505)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1h3grR-0005Cv-91
	for qemu-arm@nongnu.org; Tue, 12 Mar 2019 08:50:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1h3grQ-0001LL-5t
	for qemu-arm@nongnu.org; Tue, 12 Mar 2019 08:50:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42056)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1h3grP-0001KI-Qy; Tue, 12 Mar 2019 08:50:24 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 331A18762D;
	Tue, 12 Mar 2019 12:50:22 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6534166D22;
	Tue, 12 Mar 2019 12:50:17 +0000 (UTC)
Date: Tue, 12 Mar 2019 13:50:15 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
Message-ID: <20190312135015.75312342@redhat.com>
In-Reply-To: <5FC3163CFD30C246ABAA99954A238FA839305718@lhreml524-mbb.china.huawei.com>
References: <20190308114218.26692-1-shameerali.kolothum.thodi@huawei.com>
	<20190308114218.26692-8-shameerali.kolothum.thodi@huawei.com>
	<20190311155513.14320cd2@redhat.com>
	<5FC3163CFD30C246ABAA99954A238FA839305718@lhreml524-mbb.china.huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Tue, 12 Mar 2019 12:50:22 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v2 07/11] hw/arm/virt-acpi-build: Add PC-DIMM
 in SRAT
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"sameo@linux.intel.com" <sameo@linux.intel.com>,
	"shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Linuxarm <linuxarm@huawei.com>,
	"eric.auger@redhat.com" <eric.auger@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"xuwei \(O\)" <xuwei5@huawei.com>,
	"sebastien.boeuf@intel.com" <sebastien.boeuf@intel.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fFfjf/BMvODD

On Tue, 12 Mar 2019 09:57:58 +0000
Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com> wrote:

> > -----Original Message-----
> > From: Igor Mammedov [mailto:imammedo@redhat.com]
> > Sent: 11 March 2019 14:55
> > To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
> > Cc: qemu-devel@nongnu.org; qemu-arm@nongnu.org;
> > eric.auger@redhat.com; peter.maydell@linaro.org;
> > shannon.zhaosl@gmail.com; sameo@linux.intel.com;
> > sebastien.boeuf@intel.com; Linuxarm <linuxarm@huawei.com>; xuwei (O)
> > <xuwei5@huawei.com>
> > Subject: Re: [PATCH v2 07/11] hw/arm/virt-acpi-build: Add PC-DIMM in SRAT
> > 
> > On Fri, 8 Mar 2019 11:42:14 +0000
> > Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:
> >   
> > > Generate Memory Affinity Structures for PC-DIMM ranges.
> > >
> > > Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> > > Signed-off-by: Eric Auger <eric.auger@redhat.com>
> > > Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> > > ---
> > >  hw/arm/virt-acpi-build.c | 9 +++++++++
> > >  1 file changed, 9 insertions(+)
> > >
> > > diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> > > index 87d66da..6cb7263 100644
> > > --- a/hw/arm/virt-acpi-build.c
> > > +++ b/hw/arm/virt-acpi-build.c
> > > @@ -524,6 +524,7 @@ build_srat(GArray *table_data, BIOSLinker *linker,  
> > VirtMachineState *vms)  
> > >      int i, srat_start;
> > >      uint64_t mem_base;
> > >      MachineClass *mc = MACHINE_GET_CLASS(vms);
> > > +    MachineState *ms = MACHINE(vms);
> > >      const CPUArchIdList *cpu_list =  
> > mc->possible_cpu_arch_ids(MACHINE(vms));  
> > >
> > >      srat_start = table_data->len;
> > > @@ -549,6 +550,14 @@ build_srat(GArray *table_data, BIOSLinker *linker,  
> > VirtMachineState *vms)  
> > >          }
> > >      }
> > >
> > > +    if (ms->device_memory) {
> > > +        numamem = acpi_data_push(table_data, sizeof *numamem);
> > > +        build_srat_memory(numamem, ms->device_memory->base,
> > > +  
> > memory_region_size(&ms->device_memory->mr),  
> > > +                          nb_numa_nodes - 1,
> > > +                          MEM_AFFINITY_HOTPLUGGABLE |  
> > MEM_AFFINITY_ENABLED);  
> > > +    }
> > > +  
> > 
> > do we care about 'Windows' guests?
> > if yes then we should drop this patch,
> > see commit for reasoning dbb6da8ba7e  
> 
> If I understood that commit, that is reverting to use a single entry for whole
> hotplug area instead of splitting into multiple entries. ie, remove
> build_srat_hotpluggable_memory() and use build_srat_memory() instead,
> which is what this patch does.
> 
> May be I am missing something here. Please let me know.
Apologies it's my mistake :/, you are totally right.
This patch looks fine me.

> 
> Thanks,
> Shameer
> 
> > >      build_header(linker, table_data, (void *)(table_data->data +  
> > srat_start),  
> > >                   "SRAT", table_data->len - srat_start, 3, NULL, NULL);
> > >  }  
> 

