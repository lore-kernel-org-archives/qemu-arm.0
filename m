Received: by 10.182.158.201 with SMTP id ww9csp3253091obb;
        Wed, 16 Dec 2015 07:48:14 -0800 (PST)
X-Received: by 10.140.141.210 with SMTP id 201mr13711972qhn.74.1450280894148;
        Wed, 16 Dec 2015 07:48:14 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e8si6996556qga.128.2015.12.16.07.48.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 16 Dec 2015 07:48:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47961 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a9EJJ-0000YA-Qk
	for alex.bennee@linaro.org; Wed, 16 Dec 2015 10:48:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50512)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1a9EJI-0000Y1-8N
	for qemu-arm@nongnu.org; Wed, 16 Dec 2015 10:48:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1a9EJE-0005yI-Po
	for qemu-arm@nongnu.org; Wed, 16 Dec 2015 10:48:12 -0500
Received: from mx1.redhat.com ([209.132.183.28]:58612)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1a9EJE-0005yD-KJ; Wed, 16 Dec 2015 10:48:08 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 07613744;
	Wed, 16 Dec 2015 15:48:08 +0000 (UTC)
Received: from igors-macbook-pro.local (ovpn-204-58.brq.redhat.com
	[10.40.204.58])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tBGFm4Ig024336; Wed, 16 Dec 2015 10:48:05 -0500
Date: Wed, 16 Dec 2015 16:48:02 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Message-ID: <20151216164802.5be7f324@igors-macbook-pro.local>
In-Reply-To: <1449804086-3464-5-git-send-email-zhaoshenglong@huawei.com>
References: <1449804086-3464-1-git-send-email-zhaoshenglong@huawei.com>
	<1449804086-3464-5-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, graeme.gregory@linaro.org, mst@redhat.com,
	qemu-devel@nongnu.org, peter.huangpeng@huawei.com,
	qemu-arm@nongnu.org, shannon.zhao@linaro.org
Subject: Re: [Qemu-arm] [PATCH v5 04/10] ARM: ACPI: Add GPIO controller in
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
X-TUID: SpwBHy6wipJh

On Fri, 11 Dec 2015 11:21:20 +0800
Shannon Zhao <zhaoshenglong@huawei.com> wrote:

> From: Shannon Zhao <shannon.zhao@linaro.org>
> 
> Add GPIO controller in ACPI DSDT table. It can be used for gpio event.
> 
> Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
> Tested-by: Wei Huang <wei@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/arm/virt-acpi-build.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 1deebfe..fcc08f7 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -324,6 +324,23 @@ static void acpi_dsdt_add_pci(Aml *scope, const
> MemMapEntry *memmap, aml_append(scope, dev);
>  }
>  
> +static void acpi_dsdt_add_gpio(Aml *scope, const MemMapEntry
> *gpio_memmap,
> +                                           uint32_t gpio_irq)
> +{
> +    Aml *dev = aml_device("GPO0");
> +    aml_append(dev, aml_name_decl("_HID", aml_string("ARMH0061")));
> +    aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
> +    aml_append(dev, aml_name_decl("_UID", aml_int(0)));
> +
> +    Aml *crs = aml_resource_template();
> +    aml_append(crs, aml_memory32_fixed(gpio_memmap->base,
> gpio_memmap->size,
> +                                       AML_READ_WRITE));
> +    aml_append(crs, aml_interrupt(AML_CONSUMER, AML_LEVEL,
> AML_ACTIVE_HIGH,
> +                                  AML_EXCLUSIVE, &gpio_irq, 1));
> +    aml_append(dev, aml_name_decl("_CRS", crs));
> +    aml_append(scope, dev);
> +}
> +
>  /* RSDP */
>  static GArray *
>  build_rsdp(GArray *rsdp_table, GArray *linker, unsigned rsdt)
> @@ -540,6 +557,8 @@ build_dsdt(GArray *table_data, GArray *linker,
> VirtGuestInfo *guest_info) (irqmap[VIRT_MMIO] + ARM_SPI_BASE),
> NUM_VIRTIO_TRANSPORTS); acpi_dsdt_add_pci(scope, memmap,
> (irqmap[VIRT_PCIE] + ARM_SPI_BASE), guest_info->use_highmem);
> +    acpi_dsdt_add_gpio(scope, &memmap[VIRT_GPIO],
> +                       (irqmap[VIRT_GPIO] + ARM_SPI_BASE));
>  
>      aml_append(dsdt, scope);
>  

