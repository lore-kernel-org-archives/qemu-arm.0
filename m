Received: by 10.28.71.155 with SMTP id m27csp785568wmi;
        Fri, 13 Apr 2018 06:55:50 -0700 (PDT)
X-Google-Smtp-Source: AIpwx49G8jGk3fyw5ZDhR/UY1EB7A2AggEQac2Qh+Fmdj1k49qlKkx7lIE1W+Cop/61XGuWYrmOt
X-Received: by 2002:a25:9b03:: with SMTP id y3-v6mr4850529ybn.481.1523627750227;
        Fri, 13 Apr 2018 06:55:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523627750; cv=none;
        d=google.com; s=arc-20160816;
        b=CpEGfBCpe6RWrI5E9+ZsSX7/Phd1xEEmv26dOmvA+GJViV+JEAe+P/9xsEn2yUr26H
         FdAqUqoA432HJxgZPhSv76XlrBHIa+FOf23W+VDDRz5uzh6KK7x86sPKMRasaH1UCDZC
         /carL0UpZ2DjLVYsOk+pFZktS8bzzhaeRr1uCWEihD1H1XPDNuNH5PtBNbLvWItNH0Z/
         2TfQ3uXcogqu4tsEkt93VnnQTdylFnZ1qPuxVVcVddfFMgOpML60PY2zgYy6dkqne9kk
         fUVN45B5NN1S+ZWjDRNbRJhQ8vHCO6lp+sM2AlVhUqmdJlkS+1oA+m9888BHuPFBCuCl
         dHQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=Xb26Qp3mjOdeSZHYOb9zlU1QmEaNEl5hKp16fFBN10w=;
        b=bnWaXeBs9m6oU3zVh9F/DC494semN4wiXox2D/oQNvdj/1cE42+jhxNbVGnnFzM7t9
         tf3FJ8zi2CET7O00nzmMf2oz6b3kzqvdM84A+/lLq3sCx6L8HWSFE4XY+dUirLvcBCnj
         tfBRVmrsHIU3dzRZhuOWtHKTBrGuAm1+BCzVAKCqATPc3+JQRVCpW7WfTGjUQozF8Hpx
         2Isvp5U0t0FI1NNS3CeRQSz3AIGHLkrSePFtHOGer/Snp/+p5AdVPPiWaGa7Rg5kdrU3
         WBthghEozsTHKdRbIea5vCnDKTw2wJkrzBIeBkEK6tI0O66l5dz5yR7jG1VCs8nchdB8
         wBCg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a12si4481530qtm.331.2018.04.13.06.55.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 13 Apr 2018 06:55:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55419 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f6zB7-0005av-Pf
	for alex.bennee@linaro.org; Fri, 13 Apr 2018 09:55:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40583)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1f6zB0-0005aW-1s
	for qemu-arm@nongnu.org; Fri, 13 Apr 2018 09:55:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1f6zAw-0003AH-5e
	for qemu-arm@nongnu.org; Fri, 13 Apr 2018 09:55:42 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:34314 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1f6zAw-0003A1-0Q; Fri, 13 Apr 2018 09:55:38 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3BE38818B10B;
	Fri, 13 Apr 2018 13:55:34 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-192.ams2.redhat.com
	[10.36.116.192])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 53E6F2166BB2;
	Fri, 13 Apr 2018 13:55:28 +0000 (UTC)
To: Andrew Jones <drjones@redhat.com>
References: <1522160122-10744-1-git-send-email-eric.auger@redhat.com>
	<1522160122-10744-8-git-send-email-eric.auger@redhat.com>
	<20180413134734.ooeu36abnlafglwi@hawk.localdomain>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <ae74ebeb-b447-e640-2e48-926114b92823@redhat.com>
Date: Fri, 13 Apr 2018 15:55:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20180413134734.ooeu36abnlafglwi@hawk.localdomain>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Fri, 13 Apr 2018 13:55:34 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Fri, 13 Apr 2018 13:55:34 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC 7/8] hw/arm/virt-acpi-build:
 Handle multiple GICR structures
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
Cc: peter.maydell@linaro.org, cdall@kernel.org, marc.zyngier@arm.com,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	zhaoshenglong@huawei.com, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NTJXLbEnYw9K

Hi Drew,

On 13/04/18 15:47, Andrew Jones wrote:
> On Tue, Mar 27, 2018 at 04:15:21PM +0200, Eric Auger wrote:
>> In case multiple redistributor regions were registered,
>> let's add the corresponding GICR structures in the MADT
>> ACPI table.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> ---
>>  hw/arm/virt-acpi-build.c | 21 +++++++++++++++------
>>  1 file changed, 15 insertions(+), 6 deletions(-)
>>
>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>> index c7c6a57..aefc1b4 100644
>> --- a/hw/arm/virt-acpi-build.c
>> +++ b/hw/arm/virt-acpi-build.c
>> @@ -43,6 +43,7 @@
>>  #include "hw/pci/pcie_host.h"
>>  #include "hw/pci/pci.h"
>>  #include "hw/arm/virt.h"
>> +#include "hw/intc/arm_gicv3.h"
>>  #include "sysemu/numa.h"
>>  #include "kvm_arm.h"
>>  
>> @@ -618,14 +619,22 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>      }
>>  
>>      if (vms->gic_version == 3) {
>> +        GICv3State *s = (GICv3State *)vms->gic;
>> +        int r;
>> +
>>          AcpiMadtGenericTranslator *gic_its;
>> -        AcpiMadtGenericRedistributor *gicr = acpi_data_push(table_data,
>> -                                                         sizeof *gicr);
>>  
>> -        gicr->type = ACPI_APIC_GENERIC_REDISTRIBUTOR;
>> -        gicr->length = sizeof(*gicr);
>> -        gicr->base_address = cpu_to_le64(memmap[VIRT_GIC_REDIST].base);
>> -        gicr->range_length = cpu_to_le32(memmap[VIRT_GIC_REDIST].size);
>> +        for (r = 0; r <  s->nb_redist_regions; r++) {
>                            ^ extra space
>> +            AcpiMadtGenericRedistributor *gicr = acpi_data_push(table_data,
>> +                                                                sizeof *gicr);
>> +
>> +            gicr->type = ACPI_APIC_GENERIC_REDISTRIBUTOR;
>> +            gicr->length = sizeof(*gicr);
> 
> This file has inconsistent use of () with sizeof. If you want to start
> it on its path to using ()'s, like the majority of QEMU code, then you
> could add them to the acpi_data_push() above.
I will align with the rest of the code
> 
>> +            gicr->base_address = cpu_to_le64(s->redist_region[r].base);
>> +            /* count redistributors of 2 x 64kB pages */
>> +            gicr->range_length =
>> +                cpu_to_le64((uint64_t)s->redist_region[r].count << 17);
>                             ^^ range_length is only 4 bytes.
> 
> It might be nice to have a define of some sort for the 2*64K to avoid it
> getting scattered everywhere. 
sure

Thanks

Eric
> 
>> +        }
>>  
>>          if (its_class_name() && !vmc->no_its) {
>>              gic_its = acpi_data_push(table_data, sizeof *gic_its);
>> -- 
>> 2.5.5
>>
>>
> 
> Thanks,
> drew 
> 
