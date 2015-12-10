Received: by 10.182.158.201 with SMTP id ww9csp719972obb;
        Thu, 10 Dec 2015 12:13:36 -0800 (PST)
X-Received: by 10.140.101.233 with SMTP id u96mr18042538qge.70.1449778416880;
        Thu, 10 Dec 2015 12:13:36 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e127si784763qkb.26.2015.12.10.12.13.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 10 Dec 2015 12:13:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44277 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a77aq-0006FY-Gc
	for alex.bennee@linaro.org; Thu, 10 Dec 2015 15:13:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37122)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1a77ap-0006FN-1g
	for qemu-arm@nongnu.org; Thu, 10 Dec 2015 15:13:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1a77al-0003JB-Pr
	for qemu-arm@nongnu.org; Thu, 10 Dec 2015 15:13:34 -0500
Received: from mx1.redhat.com ([209.132.183.28]:46475)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1a77al-0003J6-IB; Thu, 10 Dec 2015 15:13:31 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 98A8B5D;
	Thu, 10 Dec 2015 20:13:30 +0000 (UTC)
Received: from igors-macbook-pro.local (ovpn-204-86.brq.redhat.com
	[10.40.204.86])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tBAKDRIO012272; Thu, 10 Dec 2015 15:13:28 -0500
Date: Thu, 10 Dec 2015 21:13:23 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Wei Huang <wei@redhat.com>
Message-ID: <20151210211323.31eb2a6a@igors-macbook-pro.local>
In-Reply-To: <5669CF86.1080003@redhat.com>
References: <1449473992-11560-1-git-send-email-zhaoshenglong@huawei.com>
	<1449473992-11560-3-git-send-email-zhaoshenglong@huawei.com>
	<20151210142253.465ec214@igors-macbook-pro.local>
	<5669CF86.1080003@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, graeme.gregory@linaro.org, mst@redhat.com,
	qemu-devel@nongnu.org, peter.huangpeng@huawei.com,
	qemu-arm@nongnu.org, shannon.zhao@linaro.org,
	Shannon Zhao <zhaoshenglong@huawei.com>
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
X-TUID: AhftGjVpfksA

On Thu, 10 Dec 2015 13:16:22 -0600
Wei Huang <wei@redhat.com> wrote:

> 
> 
> On 12/10/2015 07:22 AM, Igor Mammedov wrote:
> > On Mon, 7 Dec 2015 15:39:46 +0800
> > Shannon Zhao <zhaoshenglong@huawei.com> wrote:
> > 
> >> From: Shannon Zhao <shannon.zhao@linaro.org>
> >>
> >> Add GPIO controller in ACPI DSDT table. It can be used for gpio
> >> event.
> >>
> >> Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
> >> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
> >> Tested-by: Wei Huang <wei@redhat.com>
> >> ---
> >>  hw/arm/virt-acpi-build.c | 19 +++++++++++++++++++
> >>  1 file changed, 19 insertions(+)
> >>
> >> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> >> index 3c2c5d6..bf6b934 100644
> >> --- a/hw/arm/virt-acpi-build.c
> >> +++ b/hw/arm/virt-acpi-build.c
> >> @@ -323,6 +323,23 @@ static void acpi_dsdt_add_pci(Aml *scope,
> >> const MemMapEntry *memmap, int irq, aml_append(scope, dev);
> >>  }
> >>  
> >> +static void acpi_dsdt_add_gpio(Aml *scope, const MemMapEntry
> >> *gpio_memmap,
> >> +                                           int gpio_irq)
> > s/int/uint32_t/
> > 
> >> +{
> >> +    Aml *dev = aml_device("GPO0");
> >> +    aml_append(dev, aml_name_decl("_HID",
> >> aml_string("ARMH0061")));
> > What spec "ARMH0061" comes from?
> > Probably it should be mentioned in comment.
> 
> I tried to find the official source for this definition several weeks
> ago, but failed. Later, in private, Al Stone confirmed with me that
> ARMH0061 is the right one. Maybe ARM or Linaro should push this
> definition into ACPI spec or somewhere else in a formal way.
I've also tried and only saw it on lkml in mentioned patchset,
which wasn't warmly met.
Given that and lack of spec where it's allocated perhaps we should wait
on it till ARM puts in in some their spec formally.

> 
> > 
> >> +    aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
> >> +    aml_append(dev, aml_name_decl("_UID", aml_int(0)));
> >> +
> >> +    Aml *crs = aml_resource_template();
> >> +    aml_append(crs, aml_memory32_fixed(gpio_memmap->base,
> >> gpio_memmap->size,
> >> +                                       AML_READ_WRITE));
> >> +    aml_append(crs, aml_interrupt(AML_CONSUMER, AML_LEVEL,
> >> AML_ACTIVE_HIGH,
> >> +                                  AML_EXCLUSIVE, gpio_irq));
> > that conflicts with
> > https://github.com/imammedo/qemu/commit/acb34e533bc31fdf3eb6230c93654b0b0ae4e76e
> > perhaps you could include it in your series and redo this hunk
> > to take array instead of int.
> > 
> > 
> >> +    aml_append(dev, aml_name_decl("_CRS", crs));
> >> +    aml_append(scope, dev);
> >> +}
> >> +
> >>  /* RSDP */
> >>  static GArray *
> >>  build_rsdp(GArray *rsdp_table, GArray *linker, unsigned rsdt)
> >> @@ -539,6 +556,8 @@ build_dsdt(GArray *table_data, GArray *linker,
> >> VirtGuestInfo *guest_info) (irqmap[VIRT_MMIO] + ARM_SPI_BASE),
> >> NUM_VIRTIO_TRANSPORTS); acpi_dsdt_add_pci(scope, memmap,
> >> (irqmap[VIRT_PCIE] + ARM_SPI_BASE), guest_info->use_highmem);
> >> +    acpi_dsdt_add_gpio(scope, &memmap[VIRT_GPIO],
> >> +                       (irqmap[VIRT_GPIO] + ARM_SPI_BASE));
> >>  
> >>      aml_append(dsdt, scope);
> >>  
> > 

