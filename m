Received: by 2002:a17:505:790d:b0:1cc9:4ad0:aa2 with SMTP id xu13csp2753687njc;
        Wed, 11 Jun 2025 04:42:20 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXPd1cDTyPyip2Noo18aLWNIVHX8Sow2RGjfvc+jwHOO2Ul3uyZD0ybiOsp4nc/z6pF9Z44/mFrg1gPRQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGWOYqtdIs06+BdMFBMpKw/YMUnZtXtqN5APoXgAwYkknVt3JElL9qwOm1zXNrKF79aFT7T
X-Received: by 2002:a05:622a:988:b0:4a6:ef77:3deb with SMTP id d75a77b69052e-4a713c5eb2bmr47772051cf.40.1749642140202;
        Wed, 11 Jun 2025 04:42:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749642140; cv=none;
        d=google.com; s=arc-20240605;
        b=GtI4uAIDywzv6ZGdrx0pcES1QXQ+cYzYYoZaCy8QAeM0XjOeUMw70ijEawN14QLpXx
         qhGixywqNNejyno87fsV8sTp/8TNwsgS3fDm63UEBO4X8RT0VFl1WcYI2xE47dc970em
         SgHAo/61CL3RDCkhvgvjKssVJakfLZEmT7J7SsXeoGdoNCcesTkKCeACnr+Nn89KurSu
         2nue9IqcAXno0pq6FTV0SqNsGxLYzVZprRuTWzjifTWT217ATZ2FHklINP8GdqEGZ9Hb
         mxofMkTEXDQtjb4uq2SEmo/r8iH0mHin/XWFOA129wb8nXgoxrFeEKSRvMZgx68roYlI
         ba4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:date;
        bh=MRQLF/EYYOjINjURi6CAojtP2dyodY3ukZld3rwi6KA=;
        fh=YwBYsaHypxwrKhdDf2kZM2uQ8ERdBAWVIBgfscIqATo=;
        b=FcTXFtyR2GWNeyy2wwnAu1Q0yi/Ijv0aWs8C/w7WJWFUT03WXt182kQsSzwT38KYzw
         YrDuNiMmU2hVBahGl+qh21Snh3OhnHaqroR56sFiWuPqAtQxQ/Pte0vXKOtAL0Og3+V9
         y0RB3Doniy5TRKuy9P8Zk93W5Cj74Awx9oa/p9/Um4VBmjBkMjRPbxRPja5bVDXUzNZg
         6R+mxE0e+jtg0738wO0gJtQKUM+/0bOPfwguqeKlw2TMvK+FJFThwZ7fT6Wh06P7LrYU
         0UrhCw1pc5S6V5Kwo7aUq3IqV1CTy1Nsm5rmk8ljVU1U4ydZpH/PerPrTUzTcQh1nALE
         0niQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a611169a52si132851761cf.41.2025.06.11.04.42.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Jun 2025 04:42:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uPJpO-0005dN-VV; Wed, 11 Jun 2025 07:41:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1uPJpM-0005cd-PC; Wed, 11 Jun 2025 07:41:08 -0400
Received: from [185.176.79.56] (helo=frasgout.his.huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1uPJot-0001N1-LL; Wed, 11 Jun 2025 07:41:08 -0400
Received: from mail.maildlp.com (unknown [172.18.186.231])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bHNpW1L7fz6L616;
 Wed, 11 Jun 2025 19:33:55 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
 by mail.maildlp.com (Postfix) with ESMTPS id 5C67A140275;
 Wed, 11 Jun 2025 19:38:13 +0800 (CST)
Received: from localhost (10.203.177.99) by frapeml500003.china.huawei.com
 (7.182.85.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 11 Jun
 2025 13:38:12 +0200
Date: Wed, 11 Jun 2025 12:38:06 +0100
To: Zhao Liu <zhao1.liu@intel.com>
CC: <mst@redhat.com>, <anisinha@redhat.com>, <armbru@redhat.com>,
 <berrange@redhat.com>, <dapeng1.mi@linux.intel.com>, <eric.auger@redhat.com>, 
 <farman@linux.ibm.com>, <gustavo.romero@linaro.org>, <imammedo@redhat.com>,
 <jiangkunkun@huawei.com>, <jonathan.cameron@huawei.com>,
 <linuxarm@huawei.com>, <mtosatti@redhat.com>, <peter.maydell@linaro.org>,
 <philmd@linaro.org>, <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>,
 <richard.henderson@linaro.org>, <shameerali.kolothum.thodi@huawei.com>,
 <shannon.zhaosl@gmail.com>, <yangyicong@hisilicon.com>, <maobibo@loongson.cn>
Subject: Re: [PATCH v12 2/6] arm/virt.c: add cache hierarchy to device tree
Message-ID: <20250611123806.00002a09.alireza.sanaee@huawei.com>
In-Reply-To: <aEFnFI+wglkmLD5G@intel.com>
References: <20250604133439.1592-1-alireza.sanaee@huawei.com>
 <20250604133439.1592-3-alireza.sanaee@huawei.com>
 <aEFnFI+wglkmLD5G@intel.com>
Organization: Huawei
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.99]
X-ClientProxiedBy: lhrpeml500001.china.huawei.com (7.191.163.213) To
 frapeml500003.china.huawei.com (7.182.85.28)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 185.176.79.56 (deferred)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=alireza.sanaee@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Alireza Sanaee <alireza.sanaee@huawei.com>
From:  Alireza Sanaee via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: zvJKcIDERuyk

On Thu, 5 Jun 2025 17:44:52 +0800
Zhao Liu <zhao1.liu@intel.com> wrote:

> Hi Ali,
> 
> I'm very sorry to bother you with some comments after so many
> versions.
> 
> > diff --git a/hw/cpu/core.c b/hw/cpu/core.c
> > index 5cb2e9a7f5..7339782663 100644
> > --- a/hw/cpu/core.c
> > +++ b/hw/cpu/core.c  
> 
> core.c is not the right place. It just contains the "cpu-core"
> abstraction. So we need to move the following functions to other
> files.
> 
> > @@ -102,4 +102,96 @@ static void cpu_core_register_types(void)
> >      type_register_static(&cpu_core_type_info);
> >  }
> >  
> > +bool cache_described_at(const MachineState *ms, CpuTopologyLevel
> > level)  
> 
> It's better to add the comment about what this function did. (its name
> doesn't reflect it wants to check the coresponding CPU topology
> level.)
> 
> I also feel it's not a good name, what about
> "machine_check_cache_at_topo_level"?
> 
> Furthermore, we can move this one to hw/core/machine-smp.c, as it is
> about with machine's smp_cache.
> 
> > +{
> > +    if (machine_get_cache_topo_level(ms, CACHE_LEVEL_AND_TYPE_L3)
> > == level ||
> > +        machine_get_cache_topo_level(ms, CACHE_LEVEL_AND_TYPE_L2)
> > == level ||
> > +        machine_get_cache_topo_level(ms, CACHE_LEVEL_AND_TYPE_L1I)
> > == level ||
> > +        machine_get_cache_topo_level(ms, CACHE_LEVEL_AND_TYPE_L1D)
> > == level) {
> > +        return true;
> > +    }
> > +    return false;
> > +}
> > +
> > +int partial_cache_description(const MachineState *ms,
> > CPUCorePPTTCaches *caches,
> > +                              int num_caches)  
> 
> Because I'll suggest to move CPUCorePPTTCaches to
> include/hw/acpi/cpu.h later, and this function accepts
> CPUCorePPTTCaches as the argument, so I think we could move this
> function to hw/acpi/cpu.c (if Michael and Igor don't object).

Hi Zhao

partial_cache_description function has been used in both hw/arm/virt.c
and hw/acpi/aml-build.c it feels like it neither for arm nor acpi.
Where do you think it is better to be placed at? does it go to core
maybe?

Thanks
Alirez
> 
> > +{
> > +    int level, c;
> > +
> > +    for (level = 1; level < num_caches; level++) {
> > +        for (c = 0; c < num_caches; c++) {
> > +            if (caches[c].level != level) {
> > +                continue;
> > +            }
> > +
> > +            switch (level) {
> > +            case 1:
> > +                /*
> > +                 * L1 cache is assumed to have both L1I and L1D
> > available.
> > +                 * Technically both need to be checked.
> > +                 */
> > +                if (machine_get_cache_topo_level(ms,
> > +
> > CACHE_LEVEL_AND_TYPE_L1I) ==
> > +                    CPU_TOPOLOGY_LEVEL_DEFAULT) {
> > +                    return level;
> > +                }
> > +                break;
> > +            case 2:
> > +                if (machine_get_cache_topo_level(ms,
> > CACHE_LEVEL_AND_TYPE_L2) ==
> > +                    CPU_TOPOLOGY_LEVEL_DEFAULT) {
> > +                    return level;
> > +                }
> > +                break;
> > +            case 3:
> > +                if (machine_get_cache_topo_level(ms,
> > CACHE_LEVEL_AND_TYPE_L3) ==
> > +                    CPU_TOPOLOGY_LEVEL_DEFAULT) {
> > +                    return level;
> > +                }
> > +                break;
> > +            }
> > +        }
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> > +/*
> > + * This function assumes l3 and l2 have unified cache and l1 is
> > split l1d
> > + * and l1i, and further prepares the lowest cache level for a
> > topology
> > + * level.  The info will be fed to build_caches to create caches
> > at the
> > + * right level.
> > + */
> > +bool find_the_lowest_level_cache_defined_at_level(const
> > MachineState *ms,
> > +                                                  int *level_found,
> > +                                                  CpuTopologyLevel
> > topo_level) {  
> 
> This is a very long name :-).
> 
> Maybe we can rename it like:
> 
> machine_find_lowest_level_cache_at_topo_level,
> 
> (sorry this name doesn't shorten the length but align the naming style
> in machine-smp.c)
> 
> and explain the arguments in the comment.
> 
> Furthermore, we can move this one to hw/core/machine-smp.c, too.
> 
> > +    CpuTopologyLevel level;
> > +
> > +    level = machine_get_cache_topo_level(ms,
> > CACHE_LEVEL_AND_TYPE_L1I);
> > +    if (level == topo_level) {
> > +        *level_found = 1;
> > +        return true;
> > +    }
> > +
> > +    level = machine_get_cache_topo_level(ms,
> > CACHE_LEVEL_AND_TYPE_L1D);
> > +    if (level == topo_level) {
> > +        *level_found = 1;
> > +        return true;
> > +    }
> > +
> > +    level = machine_get_cache_topo_level(ms,
> > CACHE_LEVEL_AND_TYPE_L2);
> > +    if (level == topo_level) {
> > +        *level_found = 2;
> > +        return true;
> > +    }
> > +
> > +    level = machine_get_cache_topo_level(ms,
> > CACHE_LEVEL_AND_TYPE_L3);
> > +    if (level == topo_level) {
> > +        *level_found = 3;
> > +        return true;
> > +    }
> > +
> > +    return false;
> > +}
> > +
> >  type_init(cpu_core_register_types)  
> 
> ...
> 
> > diff --git a/include/hw/cpu/core.h b/include/hw/cpu/core.h
> > index 98ab91647e..0f7bf8bc28 100644
> > --- a/include/hw/cpu/core.h
> > +++ b/include/hw/cpu/core.h
> > @@ -11,6 +11,7 @@
> >  
> >  #include "hw/qdev-core.h"
> >  #include "qom/object.h"
> > +#include "qapi/qapi-types-machine-common.h"
> >  
> >  #define TYPE_CPU_CORE "cpu-core"
> >  
> > @@ -25,6 +26,32 @@ struct CPUCore {
> >      int nr_threads;
> >  };
> >  
> > +typedef enum CPUCacheType {
> > +    CPU_CORE_DATA,
> > +    CPU_CORE_INSTRUCTION,
> > +    CPU_CORE_UNIFIED,
> > +} CPUCoreCacheType;  
> 
> This is a complete duplicate of the x86's CPUCaches
> (target/i386/cpu.h).
> 
> I think we can move x86's CPUCaches to include/hw/core/cpu.h.
> 
> > +typedef struct CPUPPTTCaches {
> > +    CPUCoreCacheType type;
> > +    uint32_t pptt_id;
> > +    uint32_t sets;
> > +    uint32_t size;
> > +    uint32_t level;
> > +    uint16_t linesize;
> > +    uint8_t attributes; /* write policy: 0x0 write back, 0x1 write
> > through */
> > +    uint8_t associativity;
> > +} CPUCorePPTTCaches;  
> 
> x86 doesn't use PPTT to describe cache so it's not necessary to reuse
> CPUCacheInfo (target/i386/cpu.h) for PPTT.
> 
> But I understand it's better to place this sturct in
> include/hw/acpi/cpu.h, since it is part of the ACPI PPTT table.
> 
> > +int partial_cache_description(const MachineState *ms,
> > CPUCorePPTTCaches *caches,
> > +                              int num_caches);  
> 
> Could move to include/hw/acpi/cpu.h, too.
> 
> > +bool cache_described_at(const MachineState *ms, CpuTopologyLevel
> > level); +
> > +bool find_the_lowest_level_cache_defined_at_level(const
> > MachineState *ms,
> > +                                                  int *level_found,
> > +                                                  CpuTopologyLevel
> > topo_level);
> > +  
> 
> Because these 2 functions' definitions would be moved to
> hw/core/machine-smp.c, then we need to move their declarations to
> include/hw/boards.h.
> 
> 
> Except the above nits, the general part is fine for me.
> 
> Thanks,
> Zhao
> 
> 
> 

