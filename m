Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp64568wrt;
        Mon, 26 Nov 2018 09:43:29 -0800 (PST)
X-Google-Smtp-Source: AFSGD/XrGV65IwMVS8EPmYGathJp1FtcosA9bGfSyoTW5wFkEx//07O0nvo2xim6PEDzLQP8Hdc0
X-Received: by 2002:a37:4892:: with SMTP id v140mr25842196qka.71.1543254209446;
        Mon, 26 Nov 2018 09:43:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543254209; cv=none;
        d=google.com; s=arc-20160816;
        b=vLWxATokczSpqrmjdv1ZGmPlIC3d0MoJ1YCwC+UHdM2Ixv3dyeWLCREOOotygDTg/b
         50aaCiFf6hi37DLb/g/KNm73gmQ0zxGAkp+CsjqzRj8JspuEzPjjJAo4B+mzjyegPL9M
         oiYCdWF6GFpQwlkUvtA5gXqicggROv1U4YpL64g0+SGbwQLcX5m2pKOMxOyhAUAf8eBp
         FuPwR6ILyUeW758+Nne4frz//WEntARmM6p7zPdSnKq9AxgAZ8bJQaX1Vhx91QFzpm3W
         guOoTAsfX4KZQLN7I3W35VytMony3X6PyoK9Gx3mJ+b/zJ1frU/ZD7am/kCAkQUYP2FC
         DDHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=GSdZTfU0T2WwVsWfb+8N3kYu/6UO11ZPdnBxIKSDIJM=;
        b=isKf/U1nSy4azA5uXTWqynrPDvfF6Em7LZkbOyx2t6uutJY5jmnppwvTotBRN4GuOy
         u89svwqzjd83MbqzW4WcZxu8iAnTagghlhAT4GBwXYuT4kWrnifEKDdNzHOwSTVZN6T4
         K/JXruhlJRsMZgB/V/xURFEIBGQItnCQ4osy2lr100ZIV0u8KW9+E3BiD3he4YIpSdZN
         Ge7znQipKxrCsi/3hypITNhpUkLCjBmWpfPkNIUnGoq2wDIZIl8zZ69R8lWcJ/uMporv
         n88jOM+rSCwqVMjhe37/X5QwcviyVNjWasXxnUY2YcUWeEdBaldKgXqMDZ8MZwo21GgT
         57Hw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f196si852045qka.61.2018.11.26.09.43.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 26 Nov 2018 09:43:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38025 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gRKuu-00087I-OV
	for alex.bennee@linaro.org; Mon, 26 Nov 2018 12:43:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34394)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gRKum-000878-1y
	for qemu-arm@nongnu.org; Mon, 26 Nov 2018 12:43:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gRKui-0006cR-Tb
	for qemu-arm@nongnu.org; Mon, 26 Nov 2018 12:43:20 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:39486)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gRKui-0006cD-Ni
	for qemu-arm@nongnu.org; Mon, 26 Nov 2018 12:43:16 -0500
Received: by mail-wr1-f67.google.com with SMTP id t27so11905779wra.6
	for <qemu-arm@nongnu.org>; Mon, 26 Nov 2018 09:43:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=GSdZTfU0T2WwVsWfb+8N3kYu/6UO11ZPdnBxIKSDIJM=;
	b=l7S3ETxuhlKWQVryY+Nwi5IwS4jEWx0y5x6WEZ1Pl+Sj+/VBsARqRf+FBjJGC9BIcH
	VPsVlM2wJHRVGAuyQpb/jFtQ5xOrOR6gIcBOG+KuprC7khT19pCQDdLLKl9ZukBldWXv
	DoJHAQ1iFgJ7jE9ruHauaMjezowasAhjjCTEjkGG80uON46lqiZNV8Mev+myLHD4kFMx
	kWy/TURhzxJjJ85B3F6ZwT+TodLGWmILUkyPgBBqHhLs/VsMT0GFaDfe/FbevjzhDCh9
	i9CB71QI3NBQOIqoh6VwvsqSllkue/Ps9sljlLRNlhsM2ay5DXewMEXP6jtcXjWeGL9A
	O5PQ==
X-Gm-Message-State: AA+aEWYNzgfSiVEUcSs3hn26qH+l+FL6k1dJ/aHNgsZ4p35nkKU+gOCb
	jGkdo1LvVmZrl7MVoUwW3lDwcg==
X-Received: by 2002:a5d:684b:: with SMTP id o11mr23359416wrw.316.1543254195107;
	Mon, 26 Nov 2018 09:43:15 -0800 (PST)
Received: from ?IPv6:2a01:e35:8a1f:dc10:bc9e:f614:2d6b:7cc9?
	([2a01:e35:8a1f:dc10:bc9e:f614:2d6b:7cc9])
	by smtp.gmail.com with ESMTPSA id
	x186sm1879988wmg.41.2018.11.26.09.42.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Nov 2018 09:42:52 -0800 (PST)
To: Samuel Ortiz <sameo@linux.intel.com>, qemu-devel@nongnu.org
References: <20181126162942.21258-1-sameo@linux.intel.com>
	<20181126162942.21258-5-sameo@linux.intel.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <bf544e63-764d-6c80-35fa-3813480edb25@redhat.com>
Date: Mon, 26 Nov 2018 18:42:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <20181126162942.21258-5-sameo@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.67
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 4/8] hw: arm: Carry RSDP
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
	"Michael S. Tsirkin" <mst@redhat.com>,
	Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Cmv6lVa1r9ij

On 26/11/18 17:29, Samuel Ortiz wrote:
> That will allow us to generalize the ARM build_rsdp() routine to support
> both legacy RSDP (The current i386 implementation) and extended RSDP
> (The ARM implementation).
> 
> Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  include/hw/acpi/acpi-defs.h | 11 +++++++++++
>  hw/arm/virt-acpi-build.c    | 27 ++++++++++++++++++++++-----
>  2 files changed, 33 insertions(+), 5 deletions(-)
> 
> diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
> index af8e023968..e7fd24c6c5 100644
> --- a/include/hw/acpi/acpi-defs.h
> +++ b/include/hw/acpi/acpi-defs.h
> @@ -53,6 +53,17 @@ struct AcpiRsdpDescriptor {        /* Root System Descriptor Pointer */
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
> +#define ACPI_RSDP_REV_1 0
> +#define ACPI_RSDP_REV_2 2
> +
>  /* Table structure from Linux kernel (the ACPI tables are under the
>     BSD license) */
>  
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 0835900052..2dad465ecf 100644
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
> @@ -399,6 +399,20 @@ build_rsdp(GArray *rsdp_table, BIOSLinker *linker, unsigned xsdt_tbl_offset)
>          (char *)&rsdp->extended_checksum - rsdp_table->data);
>  }
>  
> +static void
> +init_rsdp_data(AcpiRsdpData *data, const char *oem_id, uint8_t revision,
> +               unsigned *rsdt_offset, unsigned *xsdt_offset)
> +{
> +    /* Caller must provide an OEM ID */
> +    g_assert(oem_id);
> +    g_assert(strlen(oem_id) >= 6);
> +
> +    memcpy(data->oem_id, oem_id, 6);
> +    data->revision = revision;
> +    data->rsdt_tbl_offset = rsdt_offset;
> +    data->xsdt_tbl_offset = xsdt_offset;
> +}
> +
>  static void
>  build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>  {
> @@ -810,6 +824,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>      GArray *table_offsets;
>      unsigned dsdt, xsdt;
>      GArray *tables_blob = tables->table_data;
> +    AcpiRsdpData rsdp;
>  
>      table_offsets = g_array_new(false, true /* clear */,
>                                          sizeof(uint32_t));
> @@ -857,7 +872,9 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>      build_xsdt(tables_blob, tables->linker, table_offsets, NULL, NULL);
>  
>      /* RSDP is in FSEG memory, so allocate it separately */
> -    build_rsdp(tables->rsdp, tables->linker, xsdt);
> +    init_rsdp_data(&rsdp, ACPI_BUILD_APPNAME6, ACPI_RSDP_REV_2,
> +                   NULL, &xsdt);
> +    build_rsdp(tables->rsdp, tables->linker, &rsdp);
>  
>      /* Cleanup memory that's no longer used. */
>      g_array_free(table_offsets, true);
> 
