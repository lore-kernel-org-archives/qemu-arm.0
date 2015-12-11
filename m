Received: by 10.182.158.201 with SMTP id ww9csp865939obb;
        Thu, 10 Dec 2015 17:41:50 -0800 (PST)
X-Received: by 10.140.253.66 with SMTP id y63mr11352603qhc.39.1449798110761;
        Thu, 10 Dec 2015 17:41:50 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d201si17866109qkb.37.2015.12.10.17.41.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 10 Dec 2015 17:41:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45367 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a7CiU-0003D7-Fi
	for alex.bennee@linaro.org; Thu, 10 Dec 2015 20:41:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50788)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1a7CiR-000387-Hb
	for qemu-arm@nongnu.org; Thu, 10 Dec 2015 20:41:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1a7CiP-0001XI-O3
	for qemu-arm@nongnu.org; Thu, 10 Dec 2015 20:41:47 -0500
Received: from szxga03-in.huawei.com ([119.145.14.66]:7325)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1a7CiJ-0001UC-G7; Thu, 10 Dec 2015 20:41:40 -0500
Received: from 172.24.1.50 (EHLO szxeml431-hub.china.huawei.com)
	([172.24.1.50])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id BSN79716; Fri, 11 Dec 2015 09:35:16 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by szxeml431-hub.china.huawei.com
	(10.82.67.208) with Microsoft SMTP Server id 14.3.235.1;
	Fri, 11 Dec 2015 09:35:07 +0800
Message-ID: <566A2849.8030608@huawei.com>
Date: Fri, 11 Dec 2015 09:35:05 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Igor Mammedov <imammedo@redhat.com>, Wei Huang <wei@redhat.com>
References: <1449473992-11560-1-git-send-email-zhaoshenglong@huawei.com>	<1449473992-11560-3-git-send-email-zhaoshenglong@huawei.com>	<20151210142253.465ec214@igors-macbook-pro.local>	<5669CF86.1080003@redhat.com>
	<20151210211323.31eb2a6a@igors-macbook-pro.local>
In-Reply-To: <20151210211323.31eb2a6a@igors-macbook-pro.local>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020204.566A2856.00F6, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: ad40ac7b1581e2900b7b7c43cafdb2e1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: peter.maydell@linaro.org, graeme.gregory@linaro.org, mst@redhat.com,
	peter.huangpeng@huawei.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, shannon.zhao@linaro.org
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v4 2/8] ARM: ACPI: Add GPIO
 controller in ACPI DSDT table
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
X-TUID: UWvlroU3Nz3z

Hi,

On 2015/12/11 4:13, Igor Mammedov wrote:
> On Thu, 10 Dec 2015 13:16:22 -0600
> Wei Huang <wei@redhat.com> wrote:
> 
>> > 
>> > 
>> > On 12/10/2015 07:22 AM, Igor Mammedov wrote:
>>> > > On Mon, 7 Dec 2015 15:39:46 +0800
>>> > > Shannon Zhao <zhaoshenglong@huawei.com> wrote:
>>> > > 
>>>> > >> From: Shannon Zhao <shannon.zhao@linaro.org>
>>>> > >>
>>>> > >> Add GPIO controller in ACPI DSDT table. It can be used for gpio
>>>> > >> event.
>>>> > >>
>>>> > >> Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
>>>> > >> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
>>>> > >> Tested-by: Wei Huang <wei@redhat.com>
>>>> > >> ---
>>>> > >>  hw/arm/virt-acpi-build.c | 19 +++++++++++++++++++
>>>> > >>  1 file changed, 19 insertions(+)
>>>> > >>
>>>> > >> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>>>> > >> index 3c2c5d6..bf6b934 100644
>>>> > >> --- a/hw/arm/virt-acpi-build.c
>>>> > >> +++ b/hw/arm/virt-acpi-build.c
>>>> > >> @@ -323,6 +323,23 @@ static void acpi_dsdt_add_pci(Aml *scope,
>>>> > >> const MemMapEntry *memmap, int irq, aml_append(scope, dev);
>>>> > >>  }
>>>> > >>  
>>>> > >> +static void acpi_dsdt_add_gpio(Aml *scope, const MemMapEntry
>>>> > >> *gpio_memmap,
>>>> > >> +                                           int gpio_irq)
>>> > > s/int/uint32_t/
>>> > > 
>>>> > >> +{
>>>> > >> +    Aml *dev = aml_device("GPO0");
>>>> > >> +    aml_append(dev, aml_name_decl("_HID",
>>>> > >> aml_string("ARMH0061")));
>>> > > What spec "ARMH0061" comes from?
>>> > > Probably it should be mentioned in comment.
>> > 
>> > I tried to find the official source for this definition several weeks
>> > ago, but failed. Later, in private, Al Stone confirmed with me that
>> > ARMH0061 is the right one. Maybe ARM or Linaro should push this
>> > definition into ACPI spec or somewhere else in a formal way.
> I've also tried and only saw it on lkml in mentioned patchset,
> which wasn't warmly met.
> Given that and lack of spec where it's allocated perhaps we should wait
> on it till ARM puts in in some their spec formally.
> 
We discussed this at previous patchset with Peter Maydell and Al Stone.
I think ARM should publish a list of ACPI ID for its own devices. Al
also confirmed the _HID of PL061 is ARMH0061.

>> > 
>>> > > 
>>>> > >> +    aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
>>>> > >> +    aml_append(dev, aml_name_decl("_UID", aml_int(0)));
>>>> > >> +
>>>> > >> +    Aml *crs = aml_resource_template();
>>>> > >> +    aml_append(crs, aml_memory32_fixed(gpio_memmap->base,
>>>> > >> gpio_memmap->size,
>>>> > >> +                                       AML_READ_WRITE));
>>>> > >> +    aml_append(crs, aml_interrupt(AML_CONSUMER, AML_LEVEL,
>>>> > >> AML_ACTIVE_HIGH,
>>>> > >> +                                  AML_EXCLUSIVE, gpio_irq));
>>> > > that conflicts with
>>> > > https://github.com/imammedo/qemu/commit/acb34e533bc31fdf3eb6230c93654b0b0ae4e76e
>>> > > perhaps you could include it in your series and redo this hunk
>>> > > to take array instead of int.
>>> > > 
sure

>>> > > 
>>>> > >> +    aml_append(dev, aml_name_decl("_CRS", crs));
>>>> > >> +    aml_append(scope, dev);
>>>> > >> +}
>>>> > >> +
>>>> > >>  /* RSDP */
>>>> > >>  static GArray *
>>>> > >>  build_rsdp(GArray *rsdp_table, GArray *linker, unsigned rsdt)
>>>> > >> @@ -539,6 +556,8 @@ build_dsdt(GArray *table_data, GArray *linker,
>>>> > >> VirtGuestInfo *guest_info) (irqmap[VIRT_MMIO] + ARM_SPI_BASE),
>>>> > >> NUM_VIRTIO_TRANSPORTS); acpi_dsdt_add_pci(scope, memmap,
>>>> > >> (irqmap[VIRT_PCIE] + ARM_SPI_BASE), guest_info->use_highmem);
>>>> > >> +    acpi_dsdt_add_gpio(scope, &memmap[VIRT_GPIO],
>>>> > >> +                       (irqmap[VIRT_GPIO] + ARM_SPI_BASE));
>>>> > >>  
>>>> > >>      aml_append(dsdt, scope);
>>>> > >>  
>>> > > 

-- 
Shannon

