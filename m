Received: by 10.223.134.117 with SMTP id 50csp4087035wrw;
        Wed, 27 Dec 2017 00:41:26 -0800 (PST)
X-Google-Smtp-Source: ACJfBosywH4DwXhQJfsAnKf8aAwbLu05PPPsmmct1882vUH7Xe2waNUL9xXmeUNwkznKHQ3IoF4S
X-Received: by 10.129.51.13 with SMTP id z13mr18789329ywz.492.1514364086537;
        Wed, 27 Dec 2017 00:41:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1514364086; cv=none;
        d=google.com; s=arc-20160816;
        b=Wy2X4BdYoFU2djUbip7su2wqlR6BOSj71IfwsPLNLh4iTlerKUHQOOm6FLWY9UoGfY
         8BBOZATYvuDsgcE5VyXXRfEn9Gyw3xVe1V7qMy+A6ivdc6rSUBBTf/JZdgyoSmMbYsI0
         Qfh8VjV3TubAYDqUexeSXqFdOfWcdDLzs7p15aKelp456TvIIwQKIgnOmjIhx+6u/v9Q
         tZINMGz64hX8SWmMmZinPPE4Ywu4x6S8JFOfRN6zCL7vrxggHaK5cw2+kIQ19Hpre5hB
         kM7/AZqfEORKpSvxz1XIMEr0iMPm7+5b8DVjfs7b3ixBmG3KEK2c6BsucCk6mxnp8d5a
         EvVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=792MJ4CWHi+XJfwoWfn6yg1LB+RB3nFZ2HQdDBR7hNY=;
        b=sYVR4MjV32G0J3UtLSWv3wQAM1MKwa6yFsU0lo+1PjJzbBmSso2VsGYdT5U0cVcmuT
         kyF2Cz8uF8w5MkZAZOv4RDZEHO1XHiKzUWRVH2kNt91BbvzPUJUxM0f5egA9vG5x0VR+
         XmsgZtmxEJ21xVOhNXzuI4YvUJN1DJekazEmNKF9XBkJMMshsCeFKl9LtffgNPs0o6QC
         iSjsjNuuLIKBLBMvMBAPBT/fq4GPAeGyGDdsuZoqt/pRNsQpWavdU+c9iYr7En8zAvtY
         G48aBODyNsYWMagTUVnVfpTr3qGq/jcJVUh++kvdQYEoq9/9UJPdtYtiy4/Y53IbgSNN
         oUXA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v28si687370ybd.562.2017.12.27.00.41.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 27 Dec 2017 00:41:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51806 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eU7HC-00050T-06
	for alex.bennee@linaro.org; Wed, 27 Dec 2017 03:41:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43926)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1eU7H4-000506-AX
	for qemu-arm@nongnu.org; Wed, 27 Dec 2017 03:41:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1eU7H1-0003Us-Mp
	for qemu-arm@nongnu.org; Wed, 27 Dec 2017 03:41:18 -0500
Received: from mx1.redhat.com ([209.132.183.28]:43744)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1eU7H1-0003TE-D4; Wed, 27 Dec 2017 03:41:15 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8BA7981DF5;
	Wed, 27 Dec 2017 08:41:13 +0000 (UTC)
Received: from hawk.localdomain (ovpn-204-62.brq.redhat.com [10.40.204.62])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F3ECB5C1A1;
	Wed, 27 Dec 2017 08:41:11 +0000 (UTC)
Date: Wed, 27 Dec 2017 09:41:09 +0100
From: Andrew Jones <drjones@redhat.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Message-ID: <20171227084109.ruylcg2dimvr6bbe@hawk.localdomain>
References: <1514362572-1624-1-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1514362572-1624-1-git-send-email-zhaoshenglong@huawei.com>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Wed, 27 Dec 2017 08:41:13 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2] Virt: ACPI: fix qemu assert
 due to re-assigned table data address
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, lersek@redhat.com,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 40DqpczhyHTy

On Wed, Dec 27, 2017 at 04:16:12PM +0800, Shannon Zhao wrote:
> From: Zhaoshenglong <zhaoshenglong@huawei.com>
> 
> acpi_data_push uses g_array_set_size to resize the memory size. If there
> is no enough contiguous memory, the address will be changed. If we use
> the old value, it will assert.
> qemu-kvm: hw/acpi/bios-linker-loader.c:214: bios_linker_loader_add_checksum:
> Assertion `start_offset < file->blob->len' failed.`
> 
> This issue only happens in building SRAT table now but here we unify the
> pattern for other tables as well to avoid possible issues in the future.
> 
> Signed-off-by: Zhaoshenglong <zhaoshenglong@huawei.com>
> ---
> v2: update the commit message according to Andrew's comments
> ---
>  hw/arm/virt-acpi-build.c | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 3d78ff6..5901142 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -453,6 +453,7 @@ build_spcr(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      AcpiSerialPortConsoleRedirection *spcr;
>      const MemMapEntry *uart_memmap = &vms->memmap[VIRT_UART];
>      int irq = vms->irqmap[VIRT_UART] + ARM_SPI_BASE;
> +    int spcr_start = table_data->len;
>  
>      spcr = acpi_data_push(table_data, sizeof(*spcr));
>  
> @@ -476,8 +477,8 @@ build_spcr(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      spcr->pci_device_id = 0xffff;  /* PCI Device ID: not a PCI device */
>      spcr->pci_vendor_id = 0xffff;  /* PCI Vendor ID: not a PCI device */
>  
> -    build_header(linker, table_data, (void *)spcr, "SPCR", sizeof(*spcr), 2,
> -                 NULL, NULL);
> +    build_header(linker, table_data, (void *)(table_data->data + spcr_start),
> +                 "SPCR", table_data->len - spcr_start, 2, NULL, NULL);
>  }
>  
>  static void
> @@ -512,8 +513,8 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>          mem_base += numa_info[i].node_mem;
>      }
>  
> -    build_header(linker, table_data, (void *)srat, "SRAT",
> -                 table_data->len - srat_start, 3, NULL, NULL);
> +    build_header(linker, table_data, (void *)(table_data->data + srat_start),
> +                 "SRAT", table_data->len - srat_start, 3, NULL, NULL);
>  }
>  
>  static void
> @@ -522,6 +523,7 @@ build_mcfg(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      AcpiTableMcfg *mcfg;
>      const MemMapEntry *memmap = vms->memmap;
>      int len = sizeof(*mcfg) + sizeof(mcfg->allocation[0]);
> +    int mcfg_start = table_data->len;
>  
>      mcfg = acpi_data_push(table_data, len);
>      mcfg->allocation[0].address = cpu_to_le64(memmap[VIRT_PCIE_ECAM].base);
> @@ -532,7 +534,8 @@ build_mcfg(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      mcfg->allocation[0].end_bus_number = (memmap[VIRT_PCIE_ECAM].size
>                                            / PCIE_MMCFG_SIZE_MIN) - 1;
>  
> -    build_header(linker, table_data, (void *)mcfg, "MCFG", len, 1, NULL, NULL);
> +    build_header(linker, table_data, (void *)(table_data->data + mcfg_start),
> +                 "MCFG", len, 1, NULL, NULL);

If we're going to change all of them for the new pattern, then len should
be changed here to table_data->len - mcfg_start

>  }
>  
>  /* GTDT */
> @@ -651,6 +654,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>  static void build_fadt(GArray *table_data, BIOSLinker *linker,
>                         VirtMachineState *vms, unsigned dsdt_tbl_offset)
>  {
> +    int fadt_start = table_data->len;
>      AcpiFadtDescriptorRev5_1 *fadt = acpi_data_push(table_data, sizeof(*fadt));
>      unsigned xdsdt_entry_offset = (char *)&fadt->x_dsdt - table_data->data;
>      uint16_t bootflags;
> @@ -681,8 +685,8 @@ static void build_fadt(GArray *table_data, BIOSLinker *linker,
>          ACPI_BUILD_TABLE_FILE, xdsdt_entry_offset, sizeof(fadt->x_dsdt),
>          ACPI_BUILD_TABLE_FILE, dsdt_tbl_offset);
>  
> -    build_header(linker, table_data,
> -                 (void *)fadt, "FACP", sizeof(*fadt), 5, NULL, NULL);
> +    build_header(linker, table_data, (void *)(table_data->data + fadt_start),
> +                 "FACP", table_data->len - fadt_start, 5, NULL, NULL);
>  }
>  
>  /* DSDT */
> -- 
> 2.0.4
> 
> 
>

Thanks,
drew 
