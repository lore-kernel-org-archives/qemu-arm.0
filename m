Received: by 10.182.158.201 with SMTP id ww9csp2250374obb;
        Tue, 1 Dec 2015 03:41:59 -0800 (PST)
X-Received: by 10.140.95.109 with SMTP id h100mr66813402qge.8.1448970119730;
        Tue, 01 Dec 2015 03:41:59 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p102si49856461qkp.116.2015.12.01.03.41.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 01 Dec 2015 03:41:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52009 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a3jJn-0005MS-F4
	for alex.bennee@linaro.org; Tue, 01 Dec 2015 06:41:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51278)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1a3jJR-00055R-SP
	for qemu-devel@nongnu.org; Tue, 01 Dec 2015 06:41:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1a3jJQ-0004Af-Vp
	for qemu-devel@nongnu.org; Tue, 01 Dec 2015 06:41:37 -0500
Received: from mx1.redhat.com ([209.132.183.28]:50667)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1a3jJM-00047V-ER; Tue, 01 Dec 2015 06:41:32 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id 5184A33FF00;
	Tue,  1 Dec 2015 11:41:31 +0000 (UTC)
Received: from nial.brq.redhat.com (dhcp-1-118.brq.redhat.com [10.34.1.118])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tB1BfSN5025340; Tue, 1 Dec 2015 06:41:29 -0500
Date: Tue, 1 Dec 2015 12:41:27 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: shannon.zhao@linaro.org
Message-ID: <20151201124127.1045c90c@nial.brq.redhat.com>
In-Reply-To: <1447680189-2128-4-git-send-email-shannon.zhao@linaro.org>
References: <1447680189-2128-1-git-send-email-shannon.zhao@linaro.org>
	<1447680189-2128-4-git-send-email-shannon.zhao@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: wei@redhat.com, peter.maydell@linaro.org, graeme.gregory@linaro.org,
	mst@redhat.com, qemu-devel@nongnu.org,
	peter.huangpeng@huawei.com, qemu-arm@nongnu.org, zhaoshenglong@huawei.com
Subject: Re: [Qemu-devel] [PATCH v3 3/8] hw/arm/virt-acpi-build: Add power
 button device in ACPI DSDT table
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 17m0z2jsPn+h

On Mon, 16 Nov 2015 21:23:04 +0800
shannon.zhao@linaro.org wrote:

> From: Shannon Zhao <shannon.zhao@linaro.org>
> 
> Add power button device in ACPI DSDT table.
> 
> Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
> Reviewed-by: Wei Huang <wei@redhat.com>
> Tested-by: Wei Huang <wei@redhat.com>
> ---
>  hw/arm/virt-acpi-build.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index bf6b934..b25c90b 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -340,6 +340,18 @@ static void acpi_dsdt_add_gpio(Aml *scope, const MemMapEntry *gpio_memmap,
>      aml_append(scope, dev);
>  }
>  
> +static void acpi_dsdt_add_power_button(Aml *scope)
> +{
> +    Aml *dev = aml_device("PWRB");
> +    aml_append(dev, aml_name_decl("_HID", aml_string("PNP0C0C")));
> +    aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
> +    aml_append(dev, aml_name_decl("_UID", aml_int(0)));
> +    Aml *method = aml_method("_STA", 0);
> +    aml_append(method, aml_return(aml_int(0x0F)));
> +    aml_append(dev, method);
since _STA always returns 0xF you can just drop it altogether,
as _STA == 0xF is implied if it's not present.

> +    aml_append(scope, dev);
> +}
> +
>  /* RSDP */
>  static GArray *
>  build_rsdp(GArray *rsdp_table, GArray *linker, unsigned rsdt)
> @@ -558,6 +570,7 @@ build_dsdt(GArray *table_data, GArray *linker, VirtGuestInfo *guest_info)
>                        guest_info->use_highmem);
>      acpi_dsdt_add_gpio(scope, &memmap[VIRT_GPIO],
>                         (irqmap[VIRT_GPIO] + ARM_SPI_BASE));
> +    acpi_dsdt_add_power_button(scope);
>  
>      aml_append(dsdt, scope);
>  

