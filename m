Received: by 10.182.158.201 with SMTP id ww9csp690943obb;
        Thu, 10 Dec 2015 11:16:33 -0800 (PST)
X-Received: by 10.129.12.215 with SMTP id 206mr3079857ywm.64.1449774993498;
        Thu, 10 Dec 2015 11:16:33 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n124si1235579ywn.353.2015.12.10.11.16.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 10 Dec 2015 11:16:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44027 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a76hd-00059L-2t
	for alex.bennee@linaro.org; Thu, 10 Dec 2015 14:16:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50325)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1a76ha-00059A-LB
	for qemu-arm@nongnu.org; Thu, 10 Dec 2015 14:16:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1a76hW-0004PG-JB
	for qemu-arm@nongnu.org; Thu, 10 Dec 2015 14:16:30 -0500
Received: from mx1.redhat.com ([209.132.183.28]:52544)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>)
	id 1a76hW-0004P2-Cc; Thu, 10 Dec 2015 14:16:26 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id 371618F26A;
	Thu, 10 Dec 2015 19:16:25 +0000 (UTC)
Received: from [10.10.51.227] (unused [10.10.51.227] (may be forged))
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tBAJGM9v010043
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 10 Dec 2015 14:16:23 -0500
To: Igor Mammedov <imammedo@redhat.com>,
	Shannon Zhao <zhaoshenglong@huawei.com>
References: <1449473992-11560-1-git-send-email-zhaoshenglong@huawei.com>
	<1449473992-11560-3-git-send-email-zhaoshenglong@huawei.com>
	<20151210142253.465ec214@igors-macbook-pro.local>
From: Wei Huang <wei@redhat.com>
Message-ID: <5669CF86.1080003@redhat.com>
Date: Thu, 10 Dec 2015 13:16:22 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <20151210142253.465ec214@igors-macbook-pro.local>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, graeme.gregory@linaro.org, mst@redhat.com,
	qemu-devel@nongnu.org, peter.huangpeng@huawei.com,
	qemu-arm@nongnu.org, shannon.zhao@linaro.org
Subject: Re: [Qemu-arm] [PATCH v4 2/8] ARM: ACPI: Add GPIO controller in
	ACPI DSDT table
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: dzYiHDIQ/OQY



On 12/10/2015 07:22 AM, Igor Mammedov wrote:
> On Mon, 7 Dec 2015 15:39:46 +0800
> Shannon Zhao <zhaoshenglong@huawei.com> wrote:
> 
>> From: Shannon Zhao <shannon.zhao@linaro.org>
>>
>> Add GPIO controller in ACPI DSDT table. It can be used for gpio event.
>>
>> Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
>> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
>> Tested-by: Wei Huang <wei@redhat.com>
>> ---
>>  hw/arm/virt-acpi-build.c | 19 +++++++++++++++++++
>>  1 file changed, 19 insertions(+)
>>
>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>> index 3c2c5d6..bf6b934 100644
>> --- a/hw/arm/virt-acpi-build.c
>> +++ b/hw/arm/virt-acpi-build.c
>> @@ -323,6 +323,23 @@ static void acpi_dsdt_add_pci(Aml *scope, const
>> MemMapEntry *memmap, int irq, aml_append(scope, dev);
>>  }
>>  
>> +static void acpi_dsdt_add_gpio(Aml *scope, const MemMapEntry
>> *gpio_memmap,
>> +                                           int gpio_irq)
> s/int/uint32_t/
> 
>> +{
>> +    Aml *dev = aml_device("GPO0");
>> +    aml_append(dev, aml_name_decl("_HID", aml_string("ARMH0061")));
> What spec "ARMH0061" comes from?
> Probably it should be mentioned in comment.

I tried to find the official source for this definition several weeks
ago, but failed. Later, in private, Al Stone confirmed with me that
ARMH0061 is the right one. Maybe ARM or Linaro should push this
definition into ACPI spec or somewhere else in a formal way.

> 
>> +    aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
>> +    aml_append(dev, aml_name_decl("_UID", aml_int(0)));
>> +
>> +    Aml *crs = aml_resource_template();
>> +    aml_append(crs, aml_memory32_fixed(gpio_memmap->base,
>> gpio_memmap->size,
>> +                                       AML_READ_WRITE));
>> +    aml_append(crs, aml_interrupt(AML_CONSUMER, AML_LEVEL,
>> AML_ACTIVE_HIGH,
>> +                                  AML_EXCLUSIVE, gpio_irq));
> that conflicts with
> https://github.com/imammedo/qemu/commit/acb34e533bc31fdf3eb6230c93654b0b0ae4e76e
> perhaps you could include it in your series and redo this hunk
> to take array instead of int.
> 
> 
>> +    aml_append(dev, aml_name_decl("_CRS", crs));
>> +    aml_append(scope, dev);
>> +}
>> +
>>  /* RSDP */
>>  static GArray *
>>  build_rsdp(GArray *rsdp_table, GArray *linker, unsigned rsdt)
>> @@ -539,6 +556,8 @@ build_dsdt(GArray *table_data, GArray *linker,
>> VirtGuestInfo *guest_info) (irqmap[VIRT_MMIO] + ARM_SPI_BASE),
>> NUM_VIRTIO_TRANSPORTS); acpi_dsdt_add_pci(scope, memmap,
>> (irqmap[VIRT_PCIE] + ARM_SPI_BASE), guest_info->use_highmem);
>> +    acpi_dsdt_add_gpio(scope, &memmap[VIRT_GPIO],
>> +                       (irqmap[VIRT_GPIO] + ARM_SPI_BASE));
>>  
>>      aml_append(dsdt, scope);
>>  
> 
