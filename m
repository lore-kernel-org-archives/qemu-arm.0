Received: by 10.182.158.201 with SMTP id ww9csp473913obb;
        Thu, 10 Dec 2015 05:23:10 -0800 (PST)
X-Received: by 10.140.31.73 with SMTP id e67mr15721448qge.46.1449753790071;
        Thu, 10 Dec 2015 05:23:10 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s79si14806702qgs.31.2015.12.10.05.23.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 10 Dec 2015 05:23:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41257 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a71Bd-00021n-Pw
	for alex.bennee@linaro.org; Thu, 10 Dec 2015 08:23:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37375)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1a71BY-00021e-Gn
	for qemu-arm@nongnu.org; Thu, 10 Dec 2015 08:23:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1a71BU-0007TM-Ry
	for qemu-arm@nongnu.org; Thu, 10 Dec 2015 08:23:04 -0500
Received: from mx1.redhat.com ([209.132.183.28]:46272)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1a71BU-0007TI-MV; Thu, 10 Dec 2015 08:23:00 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 51ED5A91;
	Thu, 10 Dec 2015 13:23:00 +0000 (UTC)
Received: from igors-macbook-pro.local (ovpn-204-86.brq.redhat.com
	[10.40.204.86])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tBADMu1b019985; Thu, 10 Dec 2015 08:22:57 -0500
Date: Thu, 10 Dec 2015 14:22:53 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Message-ID: <20151210142253.465ec214@igors-macbook-pro.local>
In-Reply-To: <1449473992-11560-3-git-send-email-zhaoshenglong@huawei.com>
References: <1449473992-11560-1-git-send-email-zhaoshenglong@huawei.com>
	<1449473992-11560-3-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
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
X-TUID: 2ykuEUkRrv1M

On Mon, 7 Dec 2015 15:39:46 +0800
Shannon Zhao <zhaoshenglong@huawei.com> wrote:

> From: Shannon Zhao <shannon.zhao@linaro.org>
> 
> Add GPIO controller in ACPI DSDT table. It can be used for gpio event.
> 
> Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
> Tested-by: Wei Huang <wei@redhat.com>
> ---
>  hw/arm/virt-acpi-build.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 3c2c5d6..bf6b934 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -323,6 +323,23 @@ static void acpi_dsdt_add_pci(Aml *scope, const
> MemMapEntry *memmap, int irq, aml_append(scope, dev);
>  }
>  
> +static void acpi_dsdt_add_gpio(Aml *scope, const MemMapEntry
> *gpio_memmap,
> +                                           int gpio_irq)
s/int/uint32_t/

> +{
> +    Aml *dev = aml_device("GPO0");
> +    aml_append(dev, aml_name_decl("_HID", aml_string("ARMH0061")));
What spec "ARMH0061" comes from?
Probably it should be mentioned in comment.

> +    aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
> +    aml_append(dev, aml_name_decl("_UID", aml_int(0)));
> +
> +    Aml *crs = aml_resource_template();
> +    aml_append(crs, aml_memory32_fixed(gpio_memmap->base,
> gpio_memmap->size,
> +                                       AML_READ_WRITE));
> +    aml_append(crs, aml_interrupt(AML_CONSUMER, AML_LEVEL,
> AML_ACTIVE_HIGH,
> +                                  AML_EXCLUSIVE, gpio_irq));
that conflicts with
https://github.com/imammedo/qemu/commit/acb34e533bc31fdf3eb6230c93654b0b0ae4e76e
perhaps you could include it in your series and redo this hunk
to take array instead of int.


> +    aml_append(dev, aml_name_decl("_CRS", crs));
> +    aml_append(scope, dev);
> +}
> +
>  /* RSDP */
>  static GArray *
>  build_rsdp(GArray *rsdp_table, GArray *linker, unsigned rsdt)
> @@ -539,6 +556,8 @@ build_dsdt(GArray *table_data, GArray *linker,
> VirtGuestInfo *guest_info) (irqmap[VIRT_MMIO] + ARM_SPI_BASE),
> NUM_VIRTIO_TRANSPORTS); acpi_dsdt_add_pci(scope, memmap,
> (irqmap[VIRT_PCIE] + ARM_SPI_BASE), guest_info->use_highmem);
> +    acpi_dsdt_add_gpio(scope, &memmap[VIRT_GPIO],
> +                       (irqmap[VIRT_GPIO] + ARM_SPI_BASE));
>  
>      aml_append(dsdt, scope);
>  

