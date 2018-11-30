Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3271386wrt;
        Thu, 29 Nov 2018 23:28:02 -0800 (PST)
X-Google-Smtp-Source: AFSGD/VlFVh2TIvFDXgMAVSRM4JbAYjtIfPaN7CvYzxMbihOowVwK/HzEUslH+KRgz4a45VpFXKC
X-Received: by 2002:a25:6ec1:: with SMTP id j184-v6mr4330061ybc.190.1543562882378;
        Thu, 29 Nov 2018 23:28:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543562882; cv=none;
        d=google.com; s=arc-20160816;
        b=Eis0fEtbC4tt//qHZFqJpvIdGL95XZ4wMQXpNX6N+/8vB9dbf9YcGFNG1YA5+NFubO
         PdFz/ZKOrTQBkwWGA5IIJgAA8czsR0CBthlVKBCo76UigfBcwrKLGZqLjVJDAkFfk1cG
         /bL9FSL7wT5MyU6nb53nLi6E9S4E3VxQYKAkp62nrrvfsS7M7oRJEyKCZKVNaRMTzWED
         mBpZrz+cXsTsjAHVm4Y/pcjfGQS06gcvzvbohTq7sfEkj3gZ1bsANHyipShIJWV35BYS
         PaDEZJVKzLv6MafP8FM1D4I+GdzRE7rdf5jsElLpMPEqEX3GauU2bEN6Vrjlfw/c3Raj
         DTAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=SuwpkUejfnJ1xgz/ybxFrKaaIAkvL1Nw4oyErY6bBCI=;
        b=RlxwCgufILFZK3iEDSC+ijoHq5Isxq9v+CHFR6tK5LL6ISs8ZeW/ZI3YYLbsXlmyPV
         vbDch98qvVxK4iLcx/6+qUufF2I8VMVkm+6QIDMNSYGp9oof8exXfv365PNQbBnM9yB9
         Tw7CKSzY2G685UfvWYUVude1b5OQzJ5TYcMbjk59Gr6fc9+zJ8XYwI7G4QJpXFSonK/W
         LX6P15que8+dLzvymSJKOhBNIimR6bc4yBP4cJ18coQFefsIiTReieznDmHNdeoqZbYV
         XZUWtmEwoP4cTO6t75faUvoG50Q9y60wc8ay5U88q2C6okHX2sIUIkxM1gxpVJigQlIv
         f/og==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l82-v6si2670289ywl.258.2018.11.29.23.28.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 29 Nov 2018 23:28:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58455 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gSdDV-0006sx-OJ
	for alex.bennee@linaro.org; Fri, 30 Nov 2018 02:28:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55494)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gSdDK-0006qz-0i
	for qemu-arm@nongnu.org; Fri, 30 Nov 2018 02:27:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gSdDG-0005rP-NJ
	for qemu-arm@nongnu.org; Fri, 30 Nov 2018 02:27:49 -0500
Received: from mx1.redhat.com ([209.132.183.28]:60186)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gSdDG-0005qr-DY; Fri, 30 Nov 2018 02:27:46 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A796E30A3AF0;
	Fri, 30 Nov 2018 07:27:45 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DD1E55D6A6;
	Fri, 30 Nov 2018 07:27:40 +0000 (UTC)
Date: Fri, 30 Nov 2018 08:27:39 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Samuel Ortiz <sameo@linux.intel.com>
Message-ID: <20181130082739.0cb6a8d0@redhat.com>
In-Reply-To: <20181129132428.333-5-sameo@linux.intel.com>
References: <20181129132428.333-1-sameo@linux.intel.com>
	<20181129132428.333-5-sameo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Fri, 30 Nov 2018 07:27:45 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 4/8] hw: arm: Carry RSDP
 specific data through AcpiRsdpData
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
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5DlUPMHBiIPK

On Thu, 29 Nov 2018 14:24:24 +0100
Samuel Ortiz <sameo@linux.intel.com> wrote:

> That will allow us to generalize the ARM build_rsdp() routine to support
> both legacy RSDP (The current i386 implementation) and extended RSDP
> (The ARM implementation).
> 
> Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  include/hw/acpi/acpi-defs.h |  8 ++++++++
>  hw/arm/virt-acpi-build.c    | 18 +++++++++++++-----
>  2 files changed, 21 insertions(+), 5 deletions(-)
> 
> diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
> index af8e023968..8425ecb8c6 100644
> --- a/include/hw/acpi/acpi-defs.h
> +++ b/include/hw/acpi/acpi-defs.h
> @@ -53,6 +53,14 @@ struct AcpiRsdpDescriptor {        /* Root System Descriptor Pointer */
>  } QEMU_PACKED;
>  typedef struct AcpiRsdpDescriptor AcpiRsdpDescriptor;
>  
> +typedef struct AcpiRsdpData {
> +    uint8_t oem_id[6]; /* OEM identification */
> +    uint8_t revision;  /* Must be 0 for 1.0, 2 for 2.0 */
> +
> +    unsigned *rsdt_tbl_offset;
> +    unsigned *xsdt_tbl_offset;
> +} AcpiRsdpData;
> +
>  /* Table structure from Linux kernel (the ACPI tables are under the
>     BSD license) */
>  
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 0835900052..ce8bfa5a37 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -368,7 +368,7 @@ static void acpi_dsdt_add_power_button(Aml *scope)
>  
>  /* RSDP */
>  static void
> -build_rsdp(GArray *rsdp_table, BIOSLinker *linker, unsigned xsdt_tbl_offset)
> +build_rsdp(GArray *rsdp_table, BIOSLinker *linker, AcpiRsdpData *rsdp_data)
>  {
>      AcpiRsdpDescriptor *rsdp = acpi_data_push(rsdp_table, sizeof *rsdp);
>      unsigned xsdt_pa_size = sizeof(rsdp->xsdt_physical_address);
> @@ -379,14 +379,14 @@ build_rsdp(GArray *rsdp_table, BIOSLinker *linker, unsigned xsdt_tbl_offset)
>                               true /* fseg memory */);
>  
>      memcpy(&rsdp->signature, "RSD PTR ", sizeof(rsdp->signature));
> -    memcpy(rsdp->oem_id, ACPI_BUILD_APPNAME6, sizeof(rsdp->oem_id));
> +    memcpy(rsdp->oem_id, rsdp_data->oem_id, sizeof(rsdp->oem_id));
>      rsdp->length = cpu_to_le32(sizeof(*rsdp));
> -    rsdp->revision = 0x02;
> +    rsdp->revision = rsdp_data->revision;
>  
>      /* Address to be filled by Guest linker */
>      bios_linker_loader_add_pointer(linker,
>          ACPI_BUILD_RSDP_FILE, xsdt_pa_offset, xsdt_pa_size,
> -        ACPI_BUILD_TABLE_FILE, xsdt_tbl_offset);
> +        ACPI_BUILD_TABLE_FILE, *rsdp_data->xsdt_tbl_offset);
>  
>      /* Checksum to be filled by Guest linker */
>      bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE,
> @@ -857,7 +857,15 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>      build_xsdt(tables_blob, tables->linker, table_offsets, NULL, NULL);
>  
>      /* RSDP is in FSEG memory, so allocate it separately */
> -    build_rsdp(tables->rsdp, tables->linker, xsdt);
> +    {
> +        AcpiRsdpData rsdp_data = {
> +            .revision = 2,
> +            .oem_id = ACPI_BUILD_APPNAME6,
> +            .xsdt_tbl_offset = &xsdt,
> +            .rsdt_tbl_offset = NULL,
> +        };
> +        build_rsdp(tables->rsdp, tables->linker, &rsdp_data);
> +    }
>  
>      /* Cleanup memory that's no longer used. */
>      g_array_free(table_offsets, true);

