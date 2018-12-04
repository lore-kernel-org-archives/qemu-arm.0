Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp8082045wrt;
        Tue, 4 Dec 2018 05:42:28 -0800 (PST)
X-Google-Smtp-Source: AFSGD/VqyVXou40hFkIZde7QVzEBg5tMd7AT3RNLyBRWOIBi3Tut8C0trlNOy2/GBZ6Jg/KNsTBh
X-Received: by 2002:ac8:181c:: with SMTP id q28mr19919742qtj.223.1543930948095;
        Tue, 04 Dec 2018 05:42:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543930948; cv=none;
        d=google.com; s=arc-20160816;
        b=gfOc1JfniT4f32/Ymj30sH6ScxSMooFtZQJdZT1jozXN6fYlU+64AXC6KjJRHdxHXj
         pT4saOL0PfD7+G7d7aSx5Q3mqorFsCgm2hYR/Xk1PLMxnCJxnSF3YZa8tf1+rvF5C27G
         vJuYVPoRKYnKyr7Hm4jAgEnODlWDmDGkupTdraB+OoJSJXoxUrdVm0JfvHwsGV2DCkje
         IRw5D+b7pjVlsZ/+EmGCWbm7+Qacw6L8n/No+3uXxRr0Wsa3cqHMok9n0j1NEgVBTNtc
         iP1d/1TQPMobhilHz3hA7JtPyR/IwNHUwByFlFqmTJ6KGTm4rx1HuUqoJMc07EzSw+Tc
         2d6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=Y/vnnqx1tz5JTX4lT9rlTAjbou4WAQ/kQAbfj2kNlOA=;
        b=lOyVic/p0Mh1BmreCmk2FNXN9yUAPHsi0KTZoJN7NaG3mjdQoSP/8Ql93qMLh39iQj
         k2uP7Cw57A1bf6YQVZ5RdRM/bmkqjXHoN3Pr8cpU3/PV1U8W52/MhjTnj5+2uFMxnw2R
         el6sFg79qHLIjbQcrXzRQRIrPmBSIAm9+XvRfeA9KRcr8gPWC7Uz64Vo+w6kJGGtD1pe
         Ar307aXjDikQuV1FFSu8oTqD7giKUn2T7loLzSNF1ryV2VzbAmmytB1S0Z/J4O/1aoLN
         DggRnabPPbUOoRSY71K/XDg7C9AXxiTi39FQ+Jlt7PdcfUReZud5QYJWCCe2Rqin8Dac
         qPiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k124si1724742qkd.2.2018.12.04.05.42.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 04 Dec 2018 05:42:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56838 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gUAy3-0002JJ-LH
	for alex.bennee@linaro.org; Tue, 04 Dec 2018 08:42:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34236)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gUAxc-000291-Es
	for qemu-arm@nongnu.org; Tue, 04 Dec 2018 08:42:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gUAxY-0001pU-EX
	for qemu-arm@nongnu.org; Tue, 04 Dec 2018 08:42:00 -0500
Received: from mx1.redhat.com ([209.132.183.28]:54176)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gUAxY-0001oN-3Z; Tue, 04 Dec 2018 08:41:56 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E6CB63086263;
	Tue,  4 Dec 2018 13:41:54 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D23607F1AA;
	Tue,  4 Dec 2018 13:41:46 +0000 (UTC)
Date: Tue, 4 Dec 2018 14:41:45 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Samuel Ortiz <sameo@linux.intel.com>
Message-ID: <20181204144145.4828d30f@redhat.com>
In-Reply-To: <20181130130032.11835-6-sameo@linux.intel.com>
References: <20181130130032.11835-1-sameo@linux.intel.com>
	<20181130130032.11835-6-sameo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Tue, 04 Dec 2018 13:41:55 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v3 5/8] hw: arm: Convert the RSDP build to
 the buid_append_foo() API
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
Cc: Laurent Vivier <lvivier@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, Ben Warren <ben@skyportsystems.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
	Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SVGmiICuuRfi

On Fri, 30 Nov 2018 14:00:29 +0100
Samuel Ortiz <sameo@linux.intel.com> wrote:

> Instead of filling a mapped and packed C structure field in random order
> and being careful about endianness and sizes, build_rsdp() now uses
> build_append_int_noprefix() to compose RSDP table.
> 
> This makes reviewing and maintaining code easier as this is almost
> matching 1:1 the ACPI spec itself.
> 
> Reviewed-by: Andrew Jones <drjones@redhat.com>
> Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/arm/virt-acpi-build.c | 42 ++++++++++++++++++++++------------------
>  1 file changed, 23 insertions(+), 19 deletions(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index ce8bfa5a37..4a6b53fbfc 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -368,35 +368,39 @@ static void acpi_dsdt_add_power_button(Aml *scope)
>  
>  /* RSDP */
>  static void
> -build_rsdp(GArray *rsdp_table, BIOSLinker *linker, AcpiRsdpData *rsdp_data)
> +build_rsdp(GArray *tbl, BIOSLinker *linker, AcpiRsdpData *rsdp_data)
>  {
> -    AcpiRsdpDescriptor *rsdp = acpi_data_push(rsdp_table, sizeof *rsdp);
> -    unsigned xsdt_pa_size = sizeof(rsdp->xsdt_physical_address);
> -    unsigned xsdt_pa_offset =
> -        (char *)&rsdp->xsdt_physical_address - rsdp_table->data;
> +    int tbl_off = tbl->len; /* Table offset in the RSDP file */
>  
> -    bios_linker_loader_alloc(linker, ACPI_BUILD_RSDP_FILE, rsdp_table, 16,
> +    bios_linker_loader_alloc(linker, ACPI_BUILD_RSDP_FILE, tbl, 16,
>                               true /* fseg memory */);
>  
> -    memcpy(&rsdp->signature, "RSD PTR ", sizeof(rsdp->signature));
> -    memcpy(rsdp->oem_id, rsdp_data->oem_id, sizeof(rsdp->oem_id));
> -    rsdp->length = cpu_to_le32(sizeof(*rsdp));
> -    rsdp->revision = rsdp_data->revision;
> +    g_array_append_vals(tbl, "RSD PTR ", 8); /* Signature */
> +    build_append_int_noprefix(tbl, 0, 1); /* Checksum */
> +    g_array_append_vals(tbl, rsdp_data->oem_id, 6); /* OEMID */
> +    build_append_int_noprefix(tbl, rsdp_data->revision, 1); /* Revision */
> +    build_append_int_noprefix(tbl, 0, 4); /* RsdtAddress */
> +    build_append_int_noprefix(tbl, 36, 4); /* Length */
>  
> -    /* Address to be filled by Guest linker */
> -    bios_linker_loader_add_pointer(linker,
> -        ACPI_BUILD_RSDP_FILE, xsdt_pa_offset, xsdt_pa_size,
> -        ACPI_BUILD_TABLE_FILE, *rsdp_data->xsdt_tbl_offset);
> +    /* XSDT address to be filled by guest linker */
> +    build_append_int_noprefix(tbl, 0, 8); /* XsdtAddress */
> +    bios_linker_loader_add_pointer(linker, ACPI_BUILD_RSDP_FILE,
> +                                   tbl_off + 24, 8,
> +                                   ACPI_BUILD_TABLE_FILE,
> +                                   *rsdp_data->xsdt_tbl_offset);
>  
> -    /* Checksum to be filled by Guest linker */
> +    build_append_int_noprefix(tbl, 0, 1); /* Extended Checksum */
> +    build_append_int_noprefix(tbl, 0, 3); /* Reserved */
> +
> +    /* Checksum to be filled by guest linker */
>      bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE,
> -        (char *)rsdp - rsdp_table->data, 20 /* ACPI rev 1.0 RSDP size */,
> -        (char *)&rsdp->checksum - rsdp_table->data);
> +                                    tbl_off, 20, /* ACPI rev 1.0 RSDP size */
> +                                    8);
>  
>      /* Extended checksum to be filled by Guest linker */
>      bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE,
> -        (char *)rsdp - rsdp_table->data, 36 /* ACPI rev 2.0 RSDP size */,
> -        (char *)&rsdp->extended_checksum - rsdp_table->data);
> +                                    tbl_off, 36, /* ACPI rev 2.0 RSDP size */
> +                                    32);
>  }
>  
>  static void

