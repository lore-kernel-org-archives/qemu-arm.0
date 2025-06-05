Received: by 2002:a17:505:6015:b0:1be9:327d:8ee3 with SMTP id us21csp119033njc;
        Thu, 5 Jun 2025 02:41:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVviXNYoR7pjfweM5CVHoXXxttZ3wDJOEVpd84YoJVF1XCi6/2imOo415SB1y8zFshgvcIAT6VX+kJOYQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEnreGSvrA6i74Sn1RADuedFjfLWB9S55/5u/YBP+SupABQLsHKjMZ329NPa0jNQJwqprJt
X-Received: by 2002:a05:6214:1bc8:b0:6fa:bd17:338 with SMTP id 6a1803df08f44-6faf703078cmr79606896d6.41.1749116496810;
        Thu, 05 Jun 2025 02:41:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749116496; cv=none;
        d=google.com; s=arc-20240605;
        b=I8sS8X4nMYVpTGTiiiXXI6Wj913lG3gjbdjmEXBoxZo9T7eCln0jLocH3JdHLHQ7XG
         AFFNcPmocV2q202Cg7n9Z6kxG9/bZVaqnhPTlMXRzNUrnzgnDunOA97KDKXYbcQqOS6w
         BBh9ya0saR7n6vEWZsELjxDCnhsGooRIarhSEsXvRDF7FdT3lME7fJm9Nv0jwsWt4XEL
         CWLu4HZIKYd41XzOUa0+iWlBhXDBNpgRAaUHzFu6QnjW3YRJv8vtdErKW2+R4/3uUjM7
         iyUto7Og9dZK+AiL7Eqhl+6iDhlGds67cyc7DUUm3sxHJX32N7VBYrUV+zaG3m/2wbpK
         7p0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:date;
        bh=WQoZVknKzZHoShVDIjU2uvof15YTKPgD7h/3rWiewuU=;
        fh=YwBYsaHypxwrKhdDf2kZM2uQ8ERdBAWVIBgfscIqATo=;
        b=a2g8g7M7tRFDGY53S9kezY0rkm9bwu8XjlHhCgjaEu0on1RrugxMyMDyuMZbSyvnF3
         ZKguz89P/LJU81dJB30e2Tanp/SIfXitBkVgU5uOQOxVsDFbFXokaTqiAew1H0F1h410
         3xUqrlcH9+Zr+yrApPSkSJvvoYAl57h7RRfX/MkBoX9w32GWHU+82qN6koC8sw6+HleW
         Nmv0gmfqrIsO/00ei8UZeW5DeOT+UyBDJ750UIMr2ztBOEEHLJNW2IJ2gX/e6LVBoPHf
         SLREsw6y80EwEHo27mE2kxF3Aeeq/wAFMLf++Hsve5IuvARenyYUHq7Ircp6WCF889N6
         EVzA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fac6e8d69csi161377636d6.301.2025.06.05.02.41.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Jun 2025 02:41:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uN763-0001pL-Mz; Thu, 05 Jun 2025 05:41:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1uN762-0001p6-BI; Thu, 05 Jun 2025 05:41:14 -0400
Received: from [185.176.79.56] (helo=frasgout.his.huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1uN75z-0006vP-61; Thu, 05 Jun 2025 05:41:14 -0400
Received: from mail.maildlp.com (unknown [172.18.186.231])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bCfZd57Qdz6K9NX;
 Thu,  5 Jun 2025 17:40:41 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
 by mail.maildlp.com (Postfix) with ESMTPS id 292571402CB;
 Thu,  5 Jun 2025 17:40:56 +0800 (CST)
Received: from localhost (10.45.152.198) by frapeml500003.china.huawei.com
 (7.182.85.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 5 Jun
 2025 11:40:54 +0200
Date: Thu, 5 Jun 2025 10:40:48 +0100
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
Message-ID: <20250605104048.00000f00.alireza.sanaee@huawei.com>
In-Reply-To: <aEFnFI+wglkmLD5G@intel.com>
References: <20250604133439.1592-1-alireza.sanaee@huawei.com>
 <20250604133439.1592-3-alireza.sanaee@huawei.com>
 <aEFnFI+wglkmLD5G@intel.com>
Organization: Huawei
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.45.152.198]
X-ClientProxiedBy: lhrpeml500011.china.huawei.com (7.191.174.215) To
 frapeml500003.china.huawei.com (7.182.85.28)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 185.176.79.56 (deferred)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=alireza.sanaee@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: zCQnLRfu1Fy0

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

Hi Zhao,

Thanks for the feedback, I was actually unsure about the structure, and
was looking to get some feedback here, to see where to put what! I
will go over the suggestions, and take note. In the meantime,
let's see if we can get some more review here.

Alireza

