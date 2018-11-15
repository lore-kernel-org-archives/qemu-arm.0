Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp7053549wrw;
        Thu, 15 Nov 2018 06:12:50 -0800 (PST)
X-Google-Smtp-Source: AJdET5fXnKMaLj7IS47W/sQHNn/xaX71yyj3MwMI+YgnBWCMSbQCamS3VYfs+SfNfo8a3yhHZ6j/
X-Received: by 2002:a37:1a20:: with SMTP id a32mr6159077qka.182.1542291170244;
        Thu, 15 Nov 2018 06:12:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542291170; cv=none;
        d=google.com; s=arc-20160816;
        b=zjb7oBjgprzAFbyg/pKceRpwuufNbil4RGeFgIDS9CUVcu7+iVggnkcS5b9C0Qjtsa
         AWEdRP55p/CkhfA0GxeVL8vsgucZfk4UZfo0VIl1CajAfMySYNNcdbSXYRDP44JjVllW
         Op/6Xx9A432fsEBSeVxBprGGh2cpSTpMqMSR/ClfmfRz40/RiZfd+StfwACYIirG8K61
         n3dZQrIRovqzbIcWHmkZ8nXzieuqc8LWKsqB7h3W/oDngf/q4/P67g730ozNz834VzhU
         LFfa23UQ80bcjvIJobDGGm4vyRb8nIMiClACfO9eb0L/acsUqbCcAXCyBxLVJPOzjmlO
         E7rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=eknonlTZuJUCO/VNM5tSnl5kM16PPx8y6NJikRJOMuI=;
        b=UbOxvHr9g41A1lHSQWaam3lGVSc2S1cD1Amxfp8ouOQpVBypoKfyrSoZTGtfUG7DPo
         aL64beA+MtctZDjitAPjQLp/hWB+VsCHPJnOX0+qnglcRvVYEWPws9KuEbGi18gal0Ty
         /Mtm8UJ+9Q7cvm5eaUf/J7/g1CKuPg/Jwz0KkwEWkfxrPdGyj+P9RCH/fS1evGEmt2uB
         nvc76LlnkWkY8Rudg22CGPKcqppnze3tWKDNeCKF4osQJBZCp6qbdGlMFppMAh/R1rPW
         4NSMpiIh1FKk3NAxSeaiwVgIx6Oe9Z4iow8khyB4F3FfhVv8hhJhWjJXlnVGBhAUlcDd
         YLxg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h2si5746047qkc.249.2018.11.15.06.12.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 15 Nov 2018 06:12:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39025 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gNIO1-00038J-Jh
	for alex.bennee@linaro.org; Thu, 15 Nov 2018 09:12:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54761)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1gNIMH-0001nO-6Q
	for qemu-arm@nongnu.org; Thu, 15 Nov 2018 09:11:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1gNIMD-0007Xb-9Q
	for qemu-arm@nongnu.org; Thu, 15 Nov 2018 09:11:01 -0500
Received: from mx1.redhat.com ([209.132.183.28]:44822)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1gNIMD-0007Wg-2R; Thu, 15 Nov 2018 09:10:57 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DF1AFC0495A7;
	Thu, 15 Nov 2018 14:10:54 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 33A5D5C26E;
	Thu, 15 Nov 2018 14:10:06 +0000 (UTC)
Date: Thu, 15 Nov 2018 15:10:03 +0100
From: Andrew Jones <drjones@redhat.com>
To: Peng Hao <peng.hao2@zte.com.cn>
Message-ID: <20181115141003.r6imovu25ymatm4w@kamzik.brq.redhat.com>
References: <1542022940-46849-1-git-send-email-peng.hao2@zte.com.cn>
	<1542022940-46849-6-git-send-email-peng.hao2@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1542022940-46849-6-git-send-email-peng.hao2@zte.com.cn>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Thu, 15 Nov 2018 14:10:55 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH V6 5/6] hw/arm/virt: add pvpanic
 device in virt acpi table
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, philmd@redhat.com,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Q71P95Fy+Eq+

On Mon, Nov 12, 2018 at 07:42:19PM +0800, Peng Hao wrote:
> add pvpanic device in virt acpi table, so when kenrel command line uses
> acpi=force, kernel can get info from acpi table in aarch64.
> 
> Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
> ---
>  hw/arm/virt-acpi-build.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 5785fb6..d126cee 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -61,6 +61,21 @@ static void acpi_dsdt_add_cpus(Aml *scope, int smp_cpus)
>      }
>  }
>  
> +static void acpi_dsdt_add_pvpanic(Aml *scope, const MemMapEntry *pvpanic_memmap)
> +{
> +    Aml *dev = aml_device("PANC");

Shouldn't this be "PEVT" ("panic event"), like it is for x86?

> +    aml_append(dev, aml_name_decl("_HID", aml_string("QEMU0001")));
> +    aml_append(dev, aml_name_decl("_UID", aml_int(0)));

Why add _UID? Also, I see x86 had some issues with not having _STA and
then having a _STA without the UI flag. It now has _STA=0xf
(PRESENT|ENABLED|UI|FUNCTIONING). I'm not saying we need to do that to,
but I'd like to know if it was considered and decided we don't need to.

> +
> +    Aml *crs = aml_resource_template();
> +    aml_append(crs, aml_memory32_fixed(pvpanic_memmap->base,
> +                                       pvpanic_memmap->size, AML_READ_WRITE));
> +
> +    aml_append(dev, aml_name_decl("_CRS", crs));
> +
> +    aml_append(scope, dev);
> +}
> +
>  static void acpi_dsdt_add_uart(Aml *scope, const MemMapEntry *uart_memmap,
>                                             uint32_t uart_irq)
>  {
> @@ -770,6 +785,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      acpi_dsdt_add_cpus(scope, vms->smp_cpus);
>      acpi_dsdt_add_uart(scope, &memmap[VIRT_UART],
>                         (irqmap[VIRT_UART] + ARM_SPI_BASE));
> +    acpi_dsdt_add_pvpanic(scope, &memmap[VIRT_PVPANIC]);
>      acpi_dsdt_add_flash(scope, &memmap[VIRT_FLASH]);
>      acpi_dsdt_add_fw_cfg(scope, &memmap[VIRT_FW_CFG]);
>      acpi_dsdt_add_virtio(scope, &memmap[VIRT_MMIO],
> -- 
> 1.8.3.1
> 
> 

Thanks,
drew
