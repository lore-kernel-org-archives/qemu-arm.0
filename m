Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp945703wro;
        Thu, 1 Nov 2018 08:26:10 -0700 (PDT)
X-Google-Smtp-Source: AJdET5em2Ovu1IC/qZen+H+uuWrJOZI16tj28d+X1MySs1LghSm1qQvYL6t2lKQc+h4yIHtoxZGK
X-Received: by 2002:ac8:8ea:: with SMTP id y39-v6mr7162428qth.3.1541085970308;
        Thu, 01 Nov 2018 08:26:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1541085970; cv=none;
        d=google.com; s=arc-20160816;
        b=hwLI6sGqbUzMSdLBUXEQ3rh+pB4HHF7O3D/iShQS2vMS6LAlk0SeUa8BMk3sLdmlp6
         dAFaoYDq9YHxbWMKpXdi0Pa6aFoGZXc7yleqno6vz76OvGNTrw5Hi5KsKG+16724iu9O
         CNcEsy5m5PPHYpN6a+JCqlg4w/TOsn6NrnaR9vWTW3NbYsZ7//8wlb7l4c6cu+zSgpg4
         KrO/R0LVxDKf4wLxJUKzjwpwMnJ1nwGHchKK4T48xGAl4DmZDxxi3u1ua7LwOhNPjQ4T
         oB/qnxoMnc1VJPxR5BEjPMXTeiW7QpFi6MlB6v+f3Zxne0fUGGqtJ+PUfdRF54Zv+fnv
         OA1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:to:from;
        bh=gFt1648mA2aujnevTP7gNCCtw3iu0Sb6bOmyRqdOebQ=;
        b=klBus1VF4ITwlbPG2SqAEFy11rGvtdQirVZxxTmZ0ktIJrxRjFZa/SdfUge7tWG0pQ
         U5c2Deupd2HyfPbOmNBLSPeWLMN6vY/1+BuHCE9j6PO5hXSsn/TDmJ3018FV/6gn9qk/
         K0cynNZIvNvZCbXd3oDlrI49b3nqrQSpcvXJNBL+aGjxk+kpkxwCLQeaAl0KiBJlFCXy
         QiZDjReyPvntEmUBfbglb5oKcFNL8/2pHq498rHLWiFaDd5ksRfPlilk5P1cq7PBwAje
         4af1nvU7O8rC37M9RNuyopxhoKh0b0+6ob+31nHrrtYfiN+uAErSOAuveh20EELrcf0p
         Xqqg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 7-v6si575350qto.215.2018.11.01.08.26.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 01 Nov 2018 08:26:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42615 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gIErJ-0000DM-P8
	for alex.bennee@linaro.org; Thu, 01 Nov 2018 11:26:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60085)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gIEq4-0007uQ-4M
	for qemu-devel@nongnu.org; Thu, 01 Nov 2018 11:24:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gIEq0-0005Si-Sg
	for qemu-devel@nongnu.org; Thu, 01 Nov 2018 11:24:52 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:38927)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gIEpy-0005Rj-RG
	for qemu-devel@nongnu.org; Thu, 01 Nov 2018 11:24:46 -0400
Received: by mail-wm1-f67.google.com with SMTP id u13-v6so1655297wmc.4
	for <qemu-devel@nongnu.org>; Thu, 01 Nov 2018 08:24:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:from:to:cc:references:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=gFt1648mA2aujnevTP7gNCCtw3iu0Sb6bOmyRqdOebQ=;
	b=aQhGzUA686ld7X06WhzZXDiISq/UFYVuvBwC2GuSigAgk/6fFIhEREHd1nM7REELMh
	Hz7Lwd6RyrlbS38eH5hfBbJce47YlS9ZK953vgxwMLnWnnriB9Cvzxr0N2H0+QDqHNZb
	n47W/vEOjSPLXlPET+FOsnBsyb2KYueUo41ACD3s/FDAmIElTEGoyhehGgy06qyvkJTX
	xteE+1Nfk6GrbM1FoSAa8Lg98FP3gBW6LRBJ1uGZBUJvO+L9WmXiZpkIAjJIwDIapjHR
	8hmNfXnNGvAEdouo6Lw4LtxXMoH77wcQUOu2I1jOudCRiU3luPJDJdKWUOlaF+Kq8Ca1
	MQcw==
X-Gm-Message-State: AGRZ1gKwgv98l+CkKF73xefnvhLGzhlb5pM+1h9LdHEd0nFkh9Afuxz7
	3QfozylUVwtUbDyyA/Aa7+U7eg==
X-Received: by 2002:a1c:ab0a:: with SMTP id
	u10-v6mr5875126wme.55.1541085885327; 
	Thu, 01 Nov 2018 08:24:45 -0700 (PDT)
Received: from [192.168.1.130] ([139.47.31.199])
	by smtp.gmail.com with ESMTPSA id
	x18-v6sm5876185wrs.50.2018.11.01.08.24.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Nov 2018 08:24:44 -0700 (PDT)
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Samuel Ortiz <sameo@linux.intel.com>, qemu-devel@nongnu.org
References: <20181101102303.16439-1-sameo@linux.intel.com>
	<20181101102303.16439-18-sameo@linux.intel.com>
	<68eae1f8-ca6a-d096-c9ac-d492e4523c7c@redhat.com>
Message-ID: <a090a6f5-62a9-c187-775b-3b485eaabbc2@redhat.com>
Date: Thu, 1 Nov 2018 16:24:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <68eae1f8-ca6a-d096-c9ac-d492e4523c7c@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.67
Subject: Re: [Qemu-devel] [PATCH v4 17/23] hw: i386: Export the MADT build
 method
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	"open list:ARM ACPI Subsystem" <qemu-arm@nongnu.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ovWQHQSSdD+x

On 1/11/18 16:12, Philippe Mathieu-Daudé wrote:
> Hi Samuel,
> 
> On 1/11/18 11:22, Samuel Ortiz wrote:
>> It is going to be used by the PC machine type as the MADT table builder
>> method and thus needs to be exported outside of acpi-build.c
>>
>> Also, now that the generic build_madt() API is exported, we have to
>> rename the ARM static one in order to avoid build time conflicts.
>>
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
>> ---
>>   hw/arm/virt-acpi-build.c |  4 ++--
>>   hw/i386/acpi-build.c     |  3 ++-
>>   include/hw/i386/acpi.h   | 27 +++++++++++++++++++++++++++
>>   3 files changed, 31 insertions(+), 3 deletions(-)
>>   create mode 100644 include/hw/i386/acpi.h
>>
>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>> index f9a60907f1..4a37c5997c 100644
>> --- a/hw/arm/virt-acpi-build.c
>> +++ b/hw/arm/virt-acpi-build.c
>> @@ -565,7 +565,7 @@ build_gtdt(GArray *table_data, BIOSLinker *linker, 
>> VirtMachineState *vms)
>>   /* MADT */
>>   static void
>> -build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState 
>> *vms)
>> +virt_build_madt(GArray *table_data, BIOSLinker *linker, 
>> VirtMachineState *vms)
>>   {
>>       VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
>>       int madt_start = table_data->len;
>> @@ -746,7 +746,7 @@ void virt_acpi_build(VirtMachineState *vms, 
>> AcpiBuildTables *tables)
>>       build_fadt_rev5(tables_blob, tables->linker, vms, dsdt);
>>       acpi_add_table(table_offsets, tables_blob);
>> -    build_madt(tables_blob, tables->linker, vms);
>> +    virt_build_madt(tables_blob, tables->linker, vms);
>>       acpi_add_table(table_offsets, tables_blob);
>>       build_gtdt(tables_blob, tables->linker, vms);
>> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
>> index 6c9b61cea2..f4afdbcd1a 100644
>> --- a/hw/i386/acpi-build.c
>> +++ b/hw/i386/acpi-build.c
>> @@ -60,6 +60,7 @@
>>   #include "qom/qom-qobject.h"
>>   #include "hw/i386/amd_iommu.h"
>>   #include "hw/i386/intel_iommu.h"
>> +#include "hw/i386/acpi.h"
>>   #include "hw/acpi/ipmi.h"
>> @@ -279,7 +280,7 @@ void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
>>       }
>>   }
>> -static void
>> +void
>>   build_madt(GArray *table_data, BIOSLinker *linker,
>>              MachineState *ms, AcpiConfiguration *acpi_conf)
>>   {
>> diff --git a/include/hw/i386/acpi.h b/include/hw/i386/acpi.h
>> new file mode 100644
>> index 0000000000..ee1203914a
>> --- /dev/null
>> +++ b/include/hw/i386/acpi.h
>> @@ -0,0 +1,27 @@
>> +/*
>> + *
>> + * Copyright (c) 2018 Intel Corportation
>> + *
>> + * This program is free software; you can redistribute it and/or 
>> modify it
>> + * under the terms and conditions of the GNU General Public License,
>> + * version 2 or later, as published by the Free Software Foundation.
>> + *
>> + * This program is distributed in the hope it will be useful, but 
>> WITHOUT
>> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
>> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public 
>> License for
>> + * more details.
>> + *
>> + * You should have received a copy of the GNU General Public License 
>> along with
>> + * this program.  If not, see <http://www.gnu.org/licenses/>.
>> + */
>> +
>> +#ifndef HW_I386_ACPI_H
>> +#define HW_I386_ACPI_H
>> +
>> +#include "hw/acpi/acpi.h"
> 
> You forgot the following header:
> 
> #include "hw/acpi/bios-linker-loader.h"

You can also remove it from hw/i386/acpi-build.c.

> 
> The BIOSLinker is not provided by "acpi/acpi.h", which results in a 
> failure when trying to precompile this header.
> 
>> +
>> +/* ACPI MADT (Multiple APIC Description Table) build method */
>> +void build_madt(GArray *table_data, BIOSLinker *linker,
>> +                MachineState *ms, AcpiConfiguration *conf);
>> +
>> +#endif
>>
