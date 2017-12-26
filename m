Received: by 10.223.134.117 with SMTP id 50csp3133036wrw;
        Tue, 26 Dec 2017 05:02:52 -0800 (PST)
X-Google-Smtp-Source: ACJfBouGc0+pNbxl/FaoR4rbPFkKpXPrFcTHiID+TguDuBt/gdQp6649K+Iqie1iizcFuBip3ni7
X-Received: by 10.129.39.74 with SMTP id n71mr17129856ywn.22.1514293372802;
        Tue, 26 Dec 2017 05:02:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1514293372; cv=none;
        d=google.com; s=arc-20160816;
        b=eRbTom9HXdXv6hZFRNvLqWHuBjpa9CjU9aDWr8qiOMrR1l8uZXYgL8+74PDFjIB1RS
         NYPi5JOjmAaOT8wfNLQHmvfVyPC4qAz1Q2pcUweB4Dfm4OlXuInU/j4NOm+y9Ca9nlyn
         Qpsk5PlKE4HAim9xBXxkRVZ+B6aiM+v0EUpxmMz9+RDhqQ8MrFrvcrTL7DlPoUbiDmEZ
         6BPj6gfD/ZCVtnNC9CuKSt7pd1WtACSxb7EHBtfkAc4HXJ/HnQFGQT4EhjAnDi5pIYEP
         qZ6Z1V9NIDLn9vs2KFyxcaLIye7O4dU9tkRetAZLMRHNLcYsmy6NqkOL93qppe2RF52b
         Hh5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=Z5H1K0juXOWOOpwLV2XQlzq7h+2AJYwrBK2ojNcVArw=;
        b=zvDZ21l4CFNa1K5/lTCbTSgFzJVmhiwyWfUTKTtYbnazFRxVSNXbkH8kXeGYI4Zw7l
         ygZw6sKEMeqmA1wjsIQhVLsdp6JGXKhSlmfe7mXUDHm2hYGHNlRvH5Ls6twmxqQV8FFs
         bP4MgKeTZeBXfyBGUAejC0+NCdXLbbnpMiH4tSe/eNBAYeh2SBDHmWQu3Kl3D+UPPHRp
         4gf42CPj/JuTZHq3QIB/V8CeIOs8QgsIFzEtmqS4mdD557CA9MBwoGr1tXo34tcB4NTX
         +Pup/Cdjw63l5pnTgxbitDaWx0/Z+eDotH9D2QDcXv4gw92EmAoPixOLsdMpw7P87XyO
         Djlw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e9si4242829ybh.52.2017.12.26.05.02.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Dec 2017 05:02:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40837 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eTose-0007mM-8Z
	for alex.bennee@linaro.org; Tue, 26 Dec 2017 08:02:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42334)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1eTosX-0007m3-6K
	for qemu-arm@nongnu.org; Tue, 26 Dec 2017 08:02:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1eTosT-00048m-Uz
	for qemu-arm@nongnu.org; Tue, 26 Dec 2017 08:02:45 -0500
Received: from mx1.redhat.com ([209.132.183.28]:52618)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1eTosT-00048N-Mg; Tue, 26 Dec 2017 08:02:41 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C75C27EA9A;
	Tue, 26 Dec 2017 13:02:40 +0000 (UTC)
Received: from hawk.localdomain (ovpn-204-56.brq.redhat.com [10.40.204.56])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CD307605D8;
	Tue, 26 Dec 2017 13:02:36 +0000 (UTC)
Date: Tue, 26 Dec 2017 14:02:27 +0100
From: Andrew Jones <drjones@redhat.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Message-ID: <20171226130227.3bdva5rxynpltsss@hawk.localdomain>
References: <1513925567-5184-1-git-send-email-zhaoshenglong@huawei.com>
	<20171226114828.lz3s5qztk6rcm2vi@hawk.localdomain>
	<5A423867.203@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5A423867.203@huawei.com>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Tue, 26 Dec 2017 13:02:40 +0000 (UTC)
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
X-TUID: waiQgTJ77huq

On Tue, Dec 26, 2017 at 07:54:15PM +0800, Shannon Zhao wrote:
> 
> 
> On 2017/12/26 19:48, Andrew Jones wrote:
> > On Fri, Dec 22, 2017 at 02:52:47PM +0800, Shannon Zhao wrote:
> >> acpi_data_push uses g_array_set_size to resize the memory size. If there is no
> >> enough contiguous memory, the address will be changed. If we use the old value,
> >> it will assert.
> >> qemu-kvm: hw/acpi/bios-linker-loader.c:214: bios_linker_loader_add_checksum:
> >> Assertion `start_offset < file->blob->len' failed.`
> >>
> >> Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
> >> ---
> >>  hw/arm/virt-acpi-build.c | 18 +++++++++++-------
> >>  1 file changed, 11 insertions(+), 7 deletions(-)
> >>
> >> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> >> index 3d78ff6..5901142 100644
> >> --- a/hw/arm/virt-acpi-build.c
> >> +++ b/hw/arm/virt-acpi-build.c
> >> @@ -453,6 +453,7 @@ build_spcr(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> >>      AcpiSerialPortConsoleRedirection *spcr;
> >>      const MemMapEntry *uart_memmap = &vms->memmap[VIRT_UART];
> >>      int irq = vms->irqmap[VIRT_UART] + ARM_SPI_BASE;
> >> +    int spcr_start = table_data->len;
> >>  
> >>      spcr = acpi_data_push(table_data, sizeof(*spcr));
> >>  
> >> @@ -476,8 +477,8 @@ build_spcr(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> >>      spcr->pci_device_id = 0xffff;  /* PCI Device ID: not a PCI device */
> >>      spcr->pci_vendor_id = 0xffff;  /* PCI Vendor ID: not a PCI device */
> >>  
> >> -    build_header(linker, table_data, (void *)spcr, "SPCR", sizeof(*spcr), 2,
> >> -                 NULL, NULL);
> >> +    build_header(linker, table_data, (void *)(table_data->data + spcr_start),
> >> +                 "SPCR", table_data->len - spcr_start, 2, NULL, NULL);
> >>  }
> > 
> > We don't need to change build_spcr(), as acpi_data_push() is only called
> > once, so spcr == new table_data->data + old table_data->len and new
> > table_data->len - spcr == sizeof(*spcr) (the size used in the only
> > acpi_data_push() call)
> > 
> >>  
> >>  static void
> >> @@ -512,8 +513,8 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> >>          mem_base += numa_info[i].node_mem;
> >>      }
> >>  
> >> -    build_header(linker, table_data, (void *)srat, "SRAT",
> >> -                 table_data->len - srat_start, 3, NULL, NULL);
> >> +    build_header(linker, table_data, (void *)(table_data->data + srat_start),
> >> +                 "SRAT", table_data->len - srat_start, 3, NULL, NULL);
> > 
> > Yes, we need this fix, as there are many acpi_data_push() calls in this
> > function. I guess this was the table that triggered the assert.
> > 
> >>  }
> >>  
> >>  static void
> >> @@ -522,6 +523,7 @@ build_mcfg(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> >>      AcpiTableMcfg *mcfg;
> >>      const MemMapEntry *memmap = vms->memmap;
> >>      int len = sizeof(*mcfg) + sizeof(mcfg->allocation[0]);
> >> +    int mcfg_start = table_data->len;
> >>  
> >>      mcfg = acpi_data_push(table_data, len);
> >>      mcfg->allocation[0].address = cpu_to_le64(memmap[VIRT_PCIE_ECAM].base);
> >> @@ -532,7 +534,8 @@ build_mcfg(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> >>      mcfg->allocation[0].end_bus_number = (memmap[VIRT_PCIE_ECAM].size
> >>                                            / PCIE_MMCFG_SIZE_MIN) - 1;
> >>  
> >> -    build_header(linker, table_data, (void *)mcfg, "MCFG", len, 1, NULL, NULL);
> >> +    build_header(linker, table_data, (void *)(table_data->data + mcfg_start),
> >> +                 "MCFG", len, 1, NULL, NULL);
> >>  }
> > 
> > No need to change this one.
> > 
> >>  
> >>  /* GTDT */
> >> @@ -651,6 +654,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> >>  static void build_fadt(GArray *table_data, BIOSLinker *linker,
> >>                         VirtMachineState *vms, unsigned dsdt_tbl_offset)
> >>  {
> >> +    int fadt_start = table_data->len;
> >>      AcpiFadtDescriptorRev5_1 *fadt = acpi_data_push(table_data, sizeof(*fadt));
> >>      unsigned xdsdt_entry_offset = (char *)&fadt->x_dsdt - table_data->data;
> >>      uint16_t bootflags;
> >> @@ -681,8 +685,8 @@ static void build_fadt(GArray *table_data, BIOSLinker *linker,
> >>          ACPI_BUILD_TABLE_FILE, xdsdt_entry_offset, sizeof(fadt->x_dsdt),
> >>          ACPI_BUILD_TABLE_FILE, dsdt_tbl_offset);
> >>  
> >> -    build_header(linker, table_data,
> >> -                 (void *)fadt, "FACP", sizeof(*fadt), 5, NULL, NULL);
> >> +    build_header(linker, table_data, (void *)(table_data->data + fadt_start),
> >> +                 "FACP", table_data->len - fadt_start, 5, NULL, NULL);
> >>  }
> > 
> > No need to change this one either.
> > 
> >>  
> >>  /* DSDT */
> >> -- 
> >> 2.0.4
> >>
> >>
> > 
> > Please respin only changing the one that needs the fix.
> > 
> Hi Andrew,
> 
> Thanks for your comments. What you said is right that only the
> build_srat needs to be fixed but I thought we need to unify the style
> and avoid new issues if add some acpi_data_push in other functions in
> the future.

Our style is unified with the x86 style which doesn't bother with the
_start offsets when only one push is used. I agree it's a bit error
prone, though, so I won't insist on not changing the ones that don't
need it. However if you choose to keep them, then I think the commit
message should be updated to explain that only SRAT needs the change,
and the other changes are for future-proofing and pattern consistency.

Thanks,
drew
