Received: by 10.182.158.201 with SMTP id ww9csp3525480obb;
        Tue, 22 Dec 2015 08:19:14 -0800 (PST)
X-Received: by 10.140.92.194 with SMTP id b60mr33719113qge.85.1450801154433;
        Tue, 22 Dec 2015 08:19:14 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f125si30979663qkb.95.2015.12.22.08.19.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 Dec 2015 08:19:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51419 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aBPec-000405-2c
	for alex.bennee@linaro.org; Tue, 22 Dec 2015 11:19:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48349)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1aBPeV-0003qv-MX
	for qemu-arm@nongnu.org; Tue, 22 Dec 2015 11:19:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1aBPeU-0006yT-2m
	for qemu-arm@nongnu.org; Tue, 22 Dec 2015 11:19:07 -0500
Received: from mx1.redhat.com ([209.132.183.28]:36626)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1aBPeT-0006yO-PB; Tue, 22 Dec 2015 11:19:06 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id 71EABA3B61;
	Tue, 22 Dec 2015 16:19:05 +0000 (UTC)
Received: from nial.brq.redhat.com (dhcp-1-118.brq.redhat.com [10.34.1.118])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tBMGJ3cC005808; Tue, 22 Dec 2015 11:19:04 -0500
Date: Tue, 22 Dec 2015 17:19:02 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20151222171902.00e3c146@nial.brq.redhat.com>
In-Reply-To: <20151222174855-mutt-send-email-mst@redhat.com>
References: <1449704528-289297-1-git-send-email-imammedo@redhat.com>
	<1449704528-289297-25-git-send-email-imammedo@redhat.com>
	<20151222171313-mutt-send-email-mst@redhat.com>
	<20151222163711.313eeca6@nial.brq.redhat.com>
	<20151222174855-mutt-send-email-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, zhaoshenglong@huawei.com
Subject: Re: [Qemu-arm] [PATCH 24/74] acpi: extend aml_interrupt() to
 support multiple irqs
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
X-TUID: 0aAWOFpLz7Ls

On Tue, 22 Dec 2015 17:58:41 +0200
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Tue, Dec 22, 2015 at 04:37:11PM +0100, Igor Mammedov wrote:
> > On Tue, 22 Dec 2015 17:17:33 +0200
> > "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > 
> > > On Thu, Dec 10, 2015 at 12:41:18AM +0100, Igor Mammedov wrote:
> > > > ASL Interrupt() macro translates to Extended Interrupt Descriptor
> > > > which supports variable number of IRQs. It will be used for
> > > > conversion of ASL code for pc/q35 machines that use it for
> > > > returning several IRQs in _PSR object.
> > > > 
> > > > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > > > ---
> > > > CC: zhaoshenglong@huawei.com
> > > > CC: qemu-arm@nongnu.org
> > > > ---
> > > >  hw/acpi/aml-build.c         | 22 +++++++++++++---------
> > > >  hw/arm/virt-acpi-build.c    | 23 ++++++++++++-----------
> > > >  include/hw/acpi/aml-build.h |  2 +-
> > > >  3 files changed, 26 insertions(+), 21 deletions(-)
> > > > 
> > > > diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> > > > index 2ca9207..ee64d12 100644
> > > > --- a/hw/acpi/aml-build.c
> > > > +++ b/hw/acpi/aml-build.c
> > > > @@ -667,23 +667,27 @@ Aml *aml_memory32_fixed(uint32_t addr, uint32_t size,
> > > >  Aml *aml_interrupt(AmlConsumerAndProducer con_and_pro,
> > > >                     AmlLevelAndEdge level_and_edge,
> > > >                     AmlActiveHighAndLow high_and_low, AmlShared shared,
> > > > -                   uint32_t irq)
> > > > +                   uint32_t *irq_list, uint8_t irq_count)
> > > 
> > > const uint32_t *irq_list?
> > will do it on top as it's in master by now.
> > 
> > > 
> > > >  {
> > > > +    int i;
> > > >      Aml *var = aml_alloc();
> > > >      uint8_t irq_flags = con_and_pro | (level_and_edge << 1)
> > > >                          | (high_and_low << 2) | (shared << 3);
> > > > +    const int header_bytes_in_len = 2;
> > > > +    uint16_t len = header_bytes_in_len + irq_count * sizeof(uint32_t);
> > > > +
> > > > +    assert(irq_count > 0);
> > > >  
> > > >      build_append_byte(var->buf, 0x89); /* Extended irq descriptor */
> > > > -    build_append_byte(var->buf, 6); /* Length, bits[7:0] minimum value = 6 */
> > > > -    build_append_byte(var->buf, 0); /* Length, bits[15:8] minimum value = 0 */
> > > > +    build_append_byte(var->buf, len & 0xFF); /* Length, bits[7:0] */
> > > > +    build_append_byte(var->buf, len >> 8); /* Length, bits[15:8] */
> > > 
> > > build_append_int_noprefix ?
> > it will do job to, though I'd prefer it by byte as it exactly matches
> > table description in spec.
> 
> ok then, it's not a big deal.
> 
> > > 
> > > Which really needs a better name btw.
> > I'd like to get rid of long build_append_ prefix but would like to
> > keep aml_ one only for ASL constructs.
> > How about 'acpi_int(Aml*, val, sz)' replacing both 'build_append_int[_noprefix]()'
> > where if sz == 0 do what build_append_int() does.
> 
> We can't drop GArray things yet - I want acpi tables to be
> built like this and get rid of structs.
it doesn't have to be Aml* it could be Garray*
the point were to have single build_append_int() which does prefix/noprefix job
but that might be confusing and easy to misuse, so scratch that off.

> 
> > same name suggestion goes for byte:
> >   s/build_append_byte/acpi_byte/
> 
> I prefer append in there. byte implies it returns byte.
> 
> build_append_bytes?
'bytes' doesn't imply any encoding rules, while build_append_int_noprefix
implies ACPI integer encoding and that was whole point of adding it
so user whon't have to care about endianness.

> 
> > > 
> > > 
> > > 
> > > >      build_append_byte(var->buf, irq_flags); /* Interrupt Vector Information. */
> > > > -    build_append_byte(var->buf, 0x01);      /* Interrupt table length = 1 */
> > > > +    build_append_byte(var->buf, irq_count);   /* Interrupt table length */
> > > >  
> > > > -    /* Interrupt Number */
> > > > -    build_append_byte(var->buf, extract32(irq, 0, 8));  /* bits[7:0] */
> > > > -    build_append_byte(var->buf, extract32(irq, 8, 8));  /* bits[15:8] */
> > > > -    build_append_byte(var->buf, extract32(irq, 16, 8)); /* bits[23:16] */
> > > > -    build_append_byte(var->buf, extract32(irq, 24, 8)); /* bits[31:24] */
> > > > +    /* Interrupt Number List */
> > > > +    for (i = 0; i < irq_count; i++) {
> > > > +        build_append_int_noprefix(var->buf, irq_list[i], 4);
> > > > +    }
> > > >      return var;
> > > >  }
> > > >  
> > > > diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> > > > index 698b5f2..02ba822 100644
> > > > --- a/hw/arm/virt-acpi-build.c
> > > > +++ b/hw/arm/virt-acpi-build.c
> > > > @@ -71,7 +71,7 @@ static void acpi_dsdt_add_cpus(Aml *scope, int smp_cpus)
> > > >  }
> > > >  
> > > >  static void acpi_dsdt_add_uart(Aml *scope, const MemMapEntry *uart_memmap,
> > > > -                                           int uart_irq)
> > > > +                                           uint32_t uart_irq)
> > > >  {
> > > >      Aml *dev = aml_device("COM0");
> > > >      aml_append(dev, aml_name_decl("_HID", aml_string("ARMH0011")));
> > > > @@ -82,7 +82,7 @@ static void acpi_dsdt_add_uart(Aml *scope, const MemMapEntry *uart_memmap,
> > > >                                         uart_memmap->size, AML_READ_WRITE));
> > > >      aml_append(crs,
> > > >                 aml_interrupt(AML_CONSUMER, AML_LEVEL, AML_ACTIVE_HIGH,
> > > > -                             AML_EXCLUSIVE, uart_irq));
> > > > +                             AML_EXCLUSIVE, &uart_irq, 1));
> > > >      aml_append(dev, aml_name_decl("_CRS", crs));
> > > >  
> > > >      /* The _ADR entry is used to link this device to the UART described
> > > > @@ -94,7 +94,7 @@ static void acpi_dsdt_add_uart(Aml *scope, const MemMapEntry *uart_memmap,
> > > >  }
> > > >  
> > > >  static void acpi_dsdt_add_rtc(Aml *scope, const MemMapEntry *rtc_memmap,
> > > > -                                          int rtc_irq)
> > > > +                                          uint32_t rtc_irq)
> > > >  {
> > > >      Aml *dev = aml_device("RTC0");
> > > >      aml_append(dev, aml_name_decl("_HID", aml_string("LNRO0013")));
> > > > @@ -105,7 +105,7 @@ static void acpi_dsdt_add_rtc(Aml *scope, const MemMapEntry *rtc_memmap,
> > > >                                         rtc_memmap->size, AML_READ_WRITE));
> > > >      aml_append(crs,
> > > >                 aml_interrupt(AML_CONSUMER, AML_LEVEL, AML_ACTIVE_HIGH,
> > > > -                             AML_EXCLUSIVE, rtc_irq));
> > > > +                             AML_EXCLUSIVE, &rtc_irq, 1));
> > > >      aml_append(dev, aml_name_decl("_CRS", crs));
> > > >      aml_append(scope, dev);
> > > >  }
> > > > @@ -136,11 +136,11 @@ static void acpi_dsdt_add_flash(Aml *scope, const MemMapEntry *flash_memmap)
> > > >  
> > > >  static void acpi_dsdt_add_virtio(Aml *scope,
> > > >                                   const MemMapEntry *virtio_mmio_memmap,
> > > > -                                 int mmio_irq, int num)
> > > > +                                 uint32_t mmio_irq, int num)
> > > >  {
> > > >      hwaddr base = virtio_mmio_memmap->base;
> > > >      hwaddr size = virtio_mmio_memmap->size;
> > > > -    int irq = mmio_irq;
> > > > +    uint32_t irq = mmio_irq;
> > > >      int i;
> > > >  
> > > >      for (i = 0; i < num; i++) {
> > > > @@ -152,15 +152,15 @@ static void acpi_dsdt_add_virtio(Aml *scope,
> > > >          aml_append(crs, aml_memory32_fixed(base, size, AML_READ_WRITE));
> > > >          aml_append(crs,
> > > >                     aml_interrupt(AML_CONSUMER, AML_LEVEL, AML_ACTIVE_HIGH,
> > > > -                                 AML_EXCLUSIVE, irq + i));
> > > > +                                 AML_EXCLUSIVE, &irq, 1));
> > > >          aml_append(dev, aml_name_decl("_CRS", crs));
> > > >          aml_append(scope, dev);
> > > >          base += size;
> > > >      }
> > > >  }
> > > >  
> > > > -static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap, int irq,
> > > > -                              bool use_highmem)
> > > > +static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap,
> > > > +                              uint32_t irq, bool use_highmem)
> > > >  {
> > > >      Aml *method, *crs, *ifctx, *UUID, *ifctx1, *elsectx, *buf;
> > > >      int i, bus_no;
> > > > @@ -199,18 +199,19 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap, int irq,
> > > >  
> > > >      /* Create GSI link device */
> > > >      for (i = 0; i < PCI_NUM_PINS; i++) {
> > > > +        uint32_t irqs =  irq + i;
> > > >          Aml *dev_gsi = aml_device("GSI%d", i);
> > > >          aml_append(dev_gsi, aml_name_decl("_HID", aml_string("PNP0C0F")));
> > > >          aml_append(dev_gsi, aml_name_decl("_UID", aml_int(0)));
> > > >          crs = aml_resource_template();
> > > >          aml_append(crs,
> > > >                     aml_interrupt(AML_CONSUMER, AML_LEVEL, AML_ACTIVE_HIGH,
> > > > -                                 AML_EXCLUSIVE, irq + i));
> > > > +                                 AML_EXCLUSIVE, &irqs, 1));
> > > >          aml_append(dev_gsi, aml_name_decl("_PRS", crs));
> > > >          crs = aml_resource_template();
> > > >          aml_append(crs,
> > > >                     aml_interrupt(AML_CONSUMER, AML_LEVEL, AML_ACTIVE_HIGH,
> > > > -                                 AML_EXCLUSIVE, irq + i));
> > > > +                                 AML_EXCLUSIVE, &irqs, 1));
> > > >          aml_append(dev_gsi, aml_name_decl("_CRS", crs));
> > > >          method = aml_method("_SRS", 1, AML_NOTSERIALIZED);
> > > >          aml_append(dev_gsi, method);
> > > > diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
> > > > index ca365c9..a3a058f 100644
> > > > --- a/include/hw/acpi/aml-build.h
> > > > +++ b/include/hw/acpi/aml-build.h
> > > > @@ -253,7 +253,7 @@ Aml *aml_memory32_fixed(uint32_t addr, uint32_t size,
> > > >  Aml *aml_interrupt(AmlConsumerAndProducer con_and_pro,
> > > >                     AmlLevelAndEdge level_and_edge,
> > > >                     AmlActiveHighAndLow high_and_low, AmlShared shared,
> > > > -                   uint32_t irq);
> > > > +                   uint32_t *irq_list, uint8_t irq_count);
> > > >  Aml *aml_io(AmlIODecode dec, uint16_t min_base, uint16_t max_base,
> > > >              uint8_t aln, uint8_t len);
> > > >  Aml *aml_operation_region(const char *name, AmlRegionSpace rs,
> > > > -- 
> > > > 1.8.3.1
> > > > 

