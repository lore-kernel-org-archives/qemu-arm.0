Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp581993wrx;
        Thu, 18 Apr 2019 05:30:25 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw3JmjIJD9MeYye4naCD8W1XZclqcpWGaTwXRRv1htbRBijtvGvqamJ+wTL6AGK6BzH3MY2
X-Received: by 2002:a5d:46c8:: with SMTP id g8mr3027346wrs.134.1555590625775;
        Thu, 18 Apr 2019 05:30:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555590625; cv=none;
        d=google.com; s=arc-20160816;
        b=zTwnkO7zu4d0+F7uTgMnYm6C8g+bt12br94GHiv6BHbsLfYgSgl5dP1b/oozuJFPNy
         MCYW/K96RH579EuhRzz4ZaKwyHpHudz3XFjsIjI+7Zq1spEGJYL9eAC1q5NEdLRrTeQb
         BYivu2zNPU2HsMLu0TFkUv7fKgdOBuX3GJLQpj/Pt1vk20nYu/UVsv2gDfmu/Krsjwmk
         g2uVC6AJeotv8lPsEooxUXT10fJe7Zv9H12spoKtDES+WjnqDvOoUb/xlQkQxEp90i4V
         U4jJlQRtR492Fp1acfwgtfS1BK12Qrbe06BFBsYZvoQ5h3djUtfWzNi7SWllUSYdIXof
         8nqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=Ig2LvWykN6ZD97/sREGGIKZnghPcjvbydVqaXU/nJgM=;
        b=Ba6M/FbTQoXgYxnCkicWvnlH2uoSp7N8BF8iOPcDSxGCXfwzTYarjJzxnBPdirgkc1
         k0d0u7TzDep0BBLYEkDBCjmIPPGPfAd5fOMKHq8FAZfj9C498zvW4Zs4WBuG5KGE10cT
         QbtuI8kbJtaJ/O73sGk1b0Y+gDXOZM+PLIcqogqdOhabRbxGZzrS7JAsHzzHN5V7DAuO
         9GdSyhwjl5TMWyxu2LauRkU4C0WOPA+lk/LJLG/0ct9HYY2GwCYFa5hzkvIq9FagwCpo
         /N2JpDHvfk4s7Gwv0dE//AfGbX5LlQlM/MKOUZzc+fu2K03o1J8azz5uzhEKlAB3upD/
         cFEw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x81si1409601wmg.167.2019.04.18.05.30.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Apr 2019 05:30:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:40873 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hH6BM-000258-TL
	for alex.bennee@linaro.org; Thu, 18 Apr 2019 08:30:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34075)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hH6BC-00024y-8Q
	for qemu-arm@nongnu.org; Thu, 18 Apr 2019 08:30:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hH6BB-0002DD-1R
	for qemu-arm@nongnu.org; Thu, 18 Apr 2019 08:30:14 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:51857)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hH6BA-0002C5-Qg
	for qemu-arm@nongnu.org; Thu, 18 Apr 2019 08:30:12 -0400
Received: by mail-wm1-f65.google.com with SMTP id 4so2574371wmf.1
	for <qemu-arm@nongnu.org>; Thu, 18 Apr 2019 05:30:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Ig2LvWykN6ZD97/sREGGIKZnghPcjvbydVqaXU/nJgM=;
	b=rQTQgLtaS9MzPiM7SkDvJl4Njqm6MmSpr2J52O/QN2ghp3lXeKk4z0P/9lLdsREJN3
	qXiJOioN8rnDzVkwKopIS0hTa25MkOWvUDz2IB9HMWC4TBbVjStDgTipNzx97La1GYZw
	KVDr0GaqZvM9rDnFcaxBkavgKIcUvs1tiVjEVRfImqWbeqHNeziClWYtPx7y8XqxXdXz
	nP1DHUAw61gYf6ddYAGJQeqHJX4HiO6/iznRxN7G8MWrY7nhSbsI1RSNoWsqDFsVGosO
	gTB2mTHQWUmyKPyMcn19Z52j5ZKP+QQEvUclbjzwm6+igruNVIUCWpUjJCtSO9uzWE8a
	7Grw==
X-Gm-Message-State: APjAAAWLhw7o4R5LWuxcLmAe+WqPO5nfcQgKD0S23fySabsyzPdkiOJ7
	bqAP4sXQ7xns0BOqsM1wJqba4UG1ALM=
X-Received: by 2002:a05:600c:2055:: with SMTP id
	p21mr3069508wmg.118.1555590611790; 
	Thu, 18 Apr 2019 05:30:11 -0700 (PDT)
Received: from [192.168.1.33] (193.red-88-21-103.staticip.rima-tde.net.
	[88.21.103.193]) by smtp.gmail.com with ESMTPSA id
	z140sm3063601wmc.27.2019.04.18.05.30.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 18 Apr 2019 05:30:11 -0700 (PDT)
To: Igor Mammedov <imammedo@redhat.com>,
	Wei Yang <richardw.yang@linux.intel.com>
References: <20190417014038.26018-1-richardw.yang@linux.intel.com>
	<20190417014038.26018-7-richardw.yang@linux.intel.com>
	<20190418130241.635b2e97@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <fb85c756-d3ba-2244-478c-814aaea436af@redhat.com>
Date: Thu, 18 Apr 2019 14:30:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190418130241.635b2e97@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.65
Subject: Re: [Qemu-arm] [PATCH v3 6/6] acpi: pci: use build_append_foo() API
 to construct MCFG
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
Cc: yang.zhong@intel.com, peter.maydell@linaro.org, mst@redhat.com,
	qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
	qemu-arm@nongnu.org, marcel.apfelbaum@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: n6zVNPQC4brS

On 4/18/19 1:02 PM, Igor Mammedov wrote:
> On Wed, 17 Apr 2019 09:40:38 +0800
> Wei Yang <richardw.yang@linux.intel.com> wrote:
> 
>> build_append_foo() API doesn't need explicit endianness conversions
>> which eliminates a source of errors and it makes build_mcfg() look like
>> declarative definition of MCFG table in ACPI spec, which makes it easy
>> to review.
>>
>> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
>> Suggested-by: Igor Mammedov <imammedo@redhat.com>
> Thanks for nice cleanup!
> 
> with comment fixed up:
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> 
>> ---
>>  hw/acpi/pci.c               | 30 ++++++++++++++++++------------
>>  include/hw/acpi/acpi-defs.h | 18 ------------------
>>  2 files changed, 18 insertions(+), 30 deletions(-)
>>
>> diff --git a/hw/acpi/pci.c b/hw/acpi/pci.c
>> index fa0fa30bb9..05050fa087 100644
>> --- a/hw/acpi/pci.c
>> +++ b/hw/acpi/pci.c
>> @@ -30,17 +30,23 @@
>>  
>>  void build_mcfg(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info)
>>  {
>> -    AcpiTableMcfg *mcfg;
>> -    int len = sizeof(*mcfg) + sizeof(mcfg->allocation[0]);
>> -
>> -    mcfg = acpi_data_push(table_data, len);
>> -    mcfg->allocation[0].address = cpu_to_le64(info->base);
>> -
>> -    /* Only a single allocation so no need to play with segments */
>> -    mcfg->allocation[0].pci_segment = cpu_to_le16(0);
>> -    mcfg->allocation[0].start_bus_number = 0;
>> -    mcfg->allocation[0].end_bus_number = PCIE_MMCFG_BUS(info->size - 1);
>> -
>> -    build_header(linker, table_data, (void *)mcfg, "MCFG", len, 1, NULL, NULL);
>> +    int mcfg_start = table_data->len;
>> +
>> +    acpi_data_push(table_data, sizeof(AcpiTableHeader));
>> +
>> +    /* PCI fw r3.0 MCFG table. */
> It would be better to put spec name as is here so simple search
> could immediately point to it.
> 
> like: PCI Firmware Specification, Revision 3.0
>       4.1.2 MCFG Table Description

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

>> +    /* Base address, processor-relative */
>> +    build_append_int_noprefix(table_data, info->base, 8);
>> +    /* PCI segment group number */
>> +    build_append_int_noprefix(table_data, 0, 2);
>> +    /* Starting PCI Bus number */
>> +    build_append_int_noprefix(table_data, 0, 1);
>> +    /* Final PCI Bus number */
>> +    build_append_int_noprefix(table_data, PCIE_MMCFG_BUS(info->size - 1), 1);
>> +    /* Reserved */
>> +    build_append_int_noprefix(table_data, 0, 4);
>> +
>> +    build_header(linker, table_data, (void *)(table_data->data + mcfg_start),
>> +                 "MCFG", table_data->len - mcfg_start, 1, NULL, NULL);
>>  }
>>  
>> diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
>> index f9aa4bd398..57a3f58b0c 100644
>> --- a/include/hw/acpi/acpi-defs.h
>> +++ b/include/hw/acpi/acpi-defs.h
>> @@ -449,24 +449,6 @@ struct AcpiSratProcessorGiccAffinity {
>>  
>>  typedef struct AcpiSratProcessorGiccAffinity AcpiSratProcessorGiccAffinity;
>>  
>> -/* PCI fw r3.0 MCFG table. */
>> -/* Subtable */
>> -struct AcpiMcfgAllocation {
>> -    uint64_t address;                /* Base address, processor-relative */
>> -    uint16_t pci_segment;            /* PCI segment group number */
>> -    uint8_t start_bus_number;       /* Starting PCI Bus number */
>> -    uint8_t end_bus_number;         /* Final PCI Bus number */
>> -    uint32_t reserved;
>> -} QEMU_PACKED;
>> -typedef struct AcpiMcfgAllocation AcpiMcfgAllocation;
>> -
>> -struct AcpiTableMcfg {
>> -    ACPI_TABLE_HEADER_DEF;
>> -    uint8_t reserved[8];
>> -    AcpiMcfgAllocation allocation[0];
>> -} QEMU_PACKED;
>> -typedef struct AcpiTableMcfg AcpiTableMcfg;
>> -
>>  /*
>>   * TCPA Description Table
>>   *
> 
