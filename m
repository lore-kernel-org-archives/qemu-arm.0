Received: by 10.182.158.201 with SMTP id ww9csp725520obb;
        Thu, 10 Dec 2015 12:24:05 -0800 (PST)
X-Received: by 10.140.172.3 with SMTP id s3mr9556293qhs.6.1449779045157;
        Thu, 10 Dec 2015 12:24:05 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 106si16473249qgk.88.2015.12.10.12.24.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 10 Dec 2015 12:24:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44342 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a77ky-00058K-M4
	for alex.bennee@linaro.org; Thu, 10 Dec 2015 15:24:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40229)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1a77kw-00058C-C9
	for qemu-arm@nongnu.org; Thu, 10 Dec 2015 15:24:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1a77kt-0006Vo-5H
	for qemu-arm@nongnu.org; Thu, 10 Dec 2015 15:24:02 -0500
Received: from mx1.redhat.com ([209.132.183.28]:49134)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1a77ks-0006Vf-Vm; Thu, 10 Dec 2015 15:23:59 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id 1CBAE8E23B;
	Thu, 10 Dec 2015 20:23:57 +0000 (UTC)
Received: from igors-macbook-pro.local (ovpn-204-86.brq.redhat.com
	[10.40.204.86])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tBAKNrdv026567; Thu, 10 Dec 2015 15:23:54 -0500
Date: Thu, 10 Dec 2015 21:23:50 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Message-ID: <20151210212350.47f1a85c@igors-macbook-pro.local>
In-Reply-To: <1449473992-11560-4-git-send-email-zhaoshenglong@huawei.com>
References: <1449473992-11560-1-git-send-email-zhaoshenglong@huawei.com>
	<1449473992-11560-4-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, graeme.gregory@linaro.org, mst@redhat.com,
	qemu-devel@nongnu.org, peter.huangpeng@huawei.com,
	qemu-arm@nongnu.org, shannon.zhao@linaro.org
Subject: Re: [Qemu-arm] [PATCH v4 3/8] ARM: ACPI: Add power button device in
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
X-TUID: AX1/Q5L8fI9y

On Mon, 7 Dec 2015 15:39:47 +0800
Shannon Zhao <zhaoshenglong@huawei.com> wrote:

> From: Shannon Zhao <shannon.zhao@linaro.org>
> 
> Add power button device in ACPI DSDT table.
> 
> Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
> Reviewed-by: Wei Huang <wei@redhat.com>
> Tested-by: Wei Huang <wei@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/arm/virt-acpi-build.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index bf6b934..1424672 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -43,6 +43,7 @@
>  #include "hw/pci/pci.h"
>  
>  #define ARM_SPI_BASE 32
> +#define ACPI_POWER_BUTTON_DEVICE "PWRB"
>  
>  typedef struct VirtAcpiCpuInfo {
>      DECLARE_BITMAP(found_cpus, VIRT_ACPI_CPU_ID_LIMIT);
> @@ -340,6 +341,15 @@ static void acpi_dsdt_add_gpio(Aml *scope, const
> MemMapEntry *gpio_memmap, aml_append(scope, dev);
>  }
>  
> +static void acpi_dsdt_add_power_button(Aml *scope)
> +{
> +    Aml *dev = aml_device(ACPI_POWER_BUTTON_DEVICE);
> +    aml_append(dev, aml_name_decl("_HID", aml_string("PNP0C0C")));
> +    aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
> +    aml_append(dev, aml_name_decl("_UID", aml_int(0)));
> +    aml_append(scope, dev);
> +}
> +
>  /* RSDP */
>  static GArray *
>  build_rsdp(GArray *rsdp_table, GArray *linker, unsigned rsdt)
> @@ -558,6 +568,7 @@ build_dsdt(GArray *table_data, GArray *linker,
> VirtGuestInfo *guest_info) guest_info->use_highmem);
>      acpi_dsdt_add_gpio(scope, &memmap[VIRT_GPIO],
>                         (irqmap[VIRT_GPIO] + ARM_SPI_BASE));
> +    acpi_dsdt_add_power_button(scope);
>  
>      aml_append(dsdt, scope);
>  

