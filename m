Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp2593487wro;
        Mon, 5 Nov 2018 05:43:02 -0800 (PST)
X-Google-Smtp-Source: AJdET5d24kN1LxftIxouTvoGwiZHOUB+8C/67qQuSp0tVoGXH9qGniH9HZ/A6uS1su/LmnjlKfFz
X-Received: by 2002:ac8:67d6:: with SMTP id r22-v6mr21451403qtp.356.1541425382302;
        Mon, 05 Nov 2018 05:43:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541425382; cv=none;
        d=google.com; s=arc-20160816;
        b=S/4wF9bRaNRWEwJvBOzedrpYKRI3PKR5Nz+KgpT9YLr0poMsuLHKa2psiT/XszCT5f
         dZNgZs1IZUOO47orQWna2OQF+l5PgsQ4EFHEKw8KnXdNRbxMowPnUIsgt0o2YORcfZvd
         YoNLApkON2eBKTH47lNB+eVrVxSFMasTg7J/qJ4/ANv8Drfu5klBe8h7zarGt6MkB7zt
         JOedr1hGe2xjfV0k6Biczwocj03b7v0Vb+LDuBWkI9Z1RdFtiRPdjv4lZBaFrA7jJNH4
         Eg/rAYgPLXf8A3KAo0s10L5VnbkFLvM04H2sdZ1eIHrnOXgcEmMQdyPpP5jeejRKE/lo
         zpOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=194LeU6TZ6SDNRb94Ld0dWY0zc0BVdRPxmSOXwzfV7o=;
        b=jZoGNvej5JpKDEZeZpLnhDVR0obvw/A0UaEMuCx9moTz87SCI4Q+BGzoRzyfWJYDr7
         8HiuuRAKuQD3LPOf/q3KAbdRq18FZZ9vb+RqLEQZKpyRRVMwe2oG/rCYTnnfPETL+QDh
         AZWQI1MlZHaRoLFJ7SNWi+0BNlA4gfKRg4RvKY+cMkAJ4/Wrzsx4k1CjzN54o2F/CHqb
         4yMBIX4bJn8PhOjfGqYlyIQ39gH+DEJhzSUPShVYWShpOsHHCFe1Q3niCz3S0DDROsVZ
         5x32CxwGGdIuyqQlDmjUGPDkPYXRGgF0GOJyRLE5MzWqz2V+NbwMfeuOVgQTlBHigBsi
         WPTg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j66si822267qka.149.2018.11.05.05.43.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 05 Nov 2018 05:43:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35322 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gJf9h-000708-Ni
	for alex.bennee@linaro.org; Mon, 05 Nov 2018 08:43:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49913)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gJf9O-00062B-LY
	for qemu-arm@nongnu.org; Mon, 05 Nov 2018 08:42:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gJeuy-0004S3-Dl
	for qemu-arm@nongnu.org; Mon, 05 Nov 2018 08:27:51 -0500
Received: from mx1.redhat.com ([209.132.183.28]:57968)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gJeuy-0004QV-7O; Mon, 05 Nov 2018 08:27:48 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6F30C83F3E;
	Mon,  5 Nov 2018 13:27:47 +0000 (UTC)
Received: from [10.36.116.55] (ovpn-116-55.ams2.redhat.com [10.36.116.55])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AEF9A1949F;
	Mon,  5 Nov 2018 13:27:41 +0000 (UTC)
To: Igor Mammedov <imammedo@redhat.com>
References: <20181018143042.29588-1-eric.auger@redhat.com>
	<20181018143042.29588-13-eric.auger@redhat.com>
	<20181022144026.3171d287@igors-macbook-pro.local>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <249aec02-24a7-a401-8236-638f54352fc2@redhat.com>
Date: Mon, 5 Nov 2018 14:27:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181022144026.3171d287@igors-macbook-pro.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Mon, 05 Nov 2018 13:27:47 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC v4 12/16] hw/arm/virt-acpi-build:
 Add PC-DIMM in SRAT
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, Suzuki.Poulose@arm.com,
	david@redhat.com, qemu-devel@nongnu.org,
	shameerali.kolothum.thodi@huawei.com, dgilbert@redhat.com,
	qemu-arm@nongnu.org, kwangwoo.lee@sk.com, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WNoNDDs2WAjb

Hi Igor,

On 10/22/18 3:40 PM, Igor Mammedov wrote:
> On Thu, 18 Oct 2018 16:30:38 +0200
> Eric Auger <eric.auger@redhat.com> wrote:
> 
>> From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
>>
>> Generate Memory Affinity Structures for PC-DIMM ranges.
>>
>> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>
>> ---
>> v3 -> v4:
>> - do not use vms->bootinfo.device_memory_start/device_memory_size anymore
>>
>> v1 -> v2:
>> - build_srat_hotpluggable_memory movedc to aml-build
>> ---
>>  hw/arm/virt-acpi-build.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>> index 5785fb697c..8818bbf5ec 100644
>> --- a/hw/arm/virt-acpi-build.c
>> +++ b/hw/arm/virt-acpi-build.c
>> @@ -545,6 +545,7 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>      int i, srat_start;
>>      uint64_t mem_base;
>>      MachineClass *mc = MACHINE_GET_CLASS(vms);
>> +    MachineState *ms = MACHINE(vms);
>>      const CPUArchIdList *cpu_list = mc->possible_cpu_arch_ids(MACHINE(vms));
>>  
>>      srat_start = table_data->len;
>> @@ -570,6 +571,9 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>          }
>>      }
>>  
>> +    build_srat_hotpluggable_memory(table_data, ms->device_memory->base,
>> +                                   ms->device_memory->mr.size, 0);
> on x86, we use the last node here to make windows happy. I'd use the same value here.
OK thank you for the information.

Regards

Eric
> 
>> +
>>      build_header(linker, table_data, (void *)(table_data->data + srat_start),
>>                   "SRAT", table_data->len - srat_start, 3, NULL, NULL);
>>  }
> 
> 
