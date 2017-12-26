Received: by 10.223.134.117 with SMTP id 50csp3063030wrw;
        Tue, 26 Dec 2017 03:48:47 -0800 (PST)
X-Google-Smtp-Source: ACJfBotpEFqD7luT/Pyc3OZz6BJ0vOHkZwPgNy8XVIGg0OYB4+CQV8/q76LR+7z79w4mFbC3rJCz
X-Received: by 10.129.75.8 with SMTP id y8mr14863882ywa.100.1514288927066;
        Tue, 26 Dec 2017 03:48:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1514288927; cv=none;
        d=google.com; s=arc-20160816;
        b=pU8eH69Og+3JQB0yxTXkV3E/JvAkp+wPpqbqbhkoH59VXBLmFv0WhBn9hPRnltJowK
         rTUFOQ0Yyjc6YUAe4UFJ0M1LlSiKNm5YRCuXB0RAA9eLwSgN6yZpl4NBQgkC5Jkfc4hM
         9ACW84X0Sxsohk4mLMDk0dL6TCPG99t9JnWble8vyeWdLliV6VYlx81dN1lUTYCIgWX+
         3xkbUxF1HByI3pcXq1XrypSW+qZXbn+ga9VYTmolY2h5+84Utt2kRt93w70o7b8uVO/Q
         ElWCrH0wiBDe0pbmX/PwOd5ES20YwJn23UQhoAO48oYAs1M7Q7mOXgZZjxvkS0MTqWpb
         GjjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=GiV/Mu6InlcbImw1Nl9eCbvx54je2eihRcGCOtssRR8=;
        b=s98roSsZ7WCVe7SBTP5mrhwnKb7U7aZX7WIaykMb76651XF4sialaxjuIRhg79U5lr
         LwsuuWj1K9JnP9KE9J8JS5eMBbGaHN9qcDWyVmHbsqAkydF5dCeLay3VFeTAQvdzB8Hy
         YF3baS1UBv6Jqta9goVXtqkm0Lg3p3ix7dOM6yJac1WQeAXf90i20OmGL/bx8DX7Y2aT
         1ikI7LnkBXqTx5mvF45xJ5GZ5uOPvbdi9H/nknkt6cWqhWj/jUGVuguf2v2h7enrp5oF
         vNoiyL25Owxn6NFqETOZYpL9JZJcORomZu4Xh0PjKPAhhSAN5AJFyN/VFctJnaoS6tya
         2sQg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 186si4095236yba.303.2017.12.26.03.48.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Dec 2017 03:48:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37661 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eTniw-00068Y-Js
	for alex.bennee@linaro.org; Tue, 26 Dec 2017 06:48:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42919)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1eTnip-00067x-QV
	for qemu-arm@nongnu.org; Tue, 26 Dec 2017 06:48:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1eTnil-0006QL-5G
	for qemu-arm@nongnu.org; Tue, 26 Dec 2017 06:48:39 -0500
Received: from mx1.redhat.com ([209.132.183.28]:48940)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1eTnik-0006Oq-Rl; Tue, 26 Dec 2017 06:48:35 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DD66B693CC;
	Tue, 26 Dec 2017 11:48:32 +0000 (UTC)
Received: from hawk.localdomain (ovpn-204-56.brq.redhat.com [10.40.204.56])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 77D935D964;
	Tue, 26 Dec 2017 11:48:31 +0000 (UTC)
Date: Tue, 26 Dec 2017 12:48:28 +0100
From: Andrew Jones <drjones@redhat.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Message-ID: <20171226114828.lz3s5qztk6rcm2vi@hawk.localdomain>
References: <1513925567-5184-1-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1513925567-5184-1-git-send-email-zhaoshenglong@huawei.com>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Tue, 26 Dec 2017 11:48:33 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH] Virt: ACPI: fix qemu assert due to
 re-assigned table data address
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
X-TUID: 16kFbWTSn3T2

On Fri, Dec 22, 2017 at 02:52:47PM +0800, Shannon Zhao wrote:
> acpi_data_push uses g_array_set_size to resize the memory size. If there is no
> enough contiguous memory, the address will be changed. If we use the old value,
> it will assert.
> qemu-kvm: hw/acpi/bios-linker-loader.c:214: bios_linker_loader_add_checksum:
> Assertion `start_offset < file->blob->len' failed.`
> 
> Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
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

We don't need to change build_spcr(), as acpi_data_push() is only called
once, so spcr == new table_data->data + old table_data->len and new
table_data->len - spcr == sizeof(*spcr) (the size used in the only
acpi_data_push() call)

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

Yes, we need this fix, as there are many acpi_data_push() calls in this
function. I guess this was the table that triggered the assert.

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
>  }

No need to change this one.

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

No need to change this one either.

>  
>  /* DSDT */
> -- 
> 2.0.4
> 
>

Please respin only changing the one that needs the fix.

Thanks,
drew 
