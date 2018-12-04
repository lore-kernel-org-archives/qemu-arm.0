Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp8087001wrt;
        Tue, 4 Dec 2018 05:47:39 -0800 (PST)
X-Google-Smtp-Source: AFSGD/VQxFRm8TU17jy5ych5qASwVUCvhcPw7LMbGBn1laEEx1RHQOSAveWR+6uXsSADXfTijSo3
X-Received: by 2002:ac8:3d51:: with SMTP id u17mr19785255qtf.127.1543931259250;
        Tue, 04 Dec 2018 05:47:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543931259; cv=none;
        d=google.com; s=arc-20160816;
        b=aQi3yiAeGKxKcp4A3GJv3AZNm+KJPF8w//EQk0L3qX3P66U8C2LEijYF9EjyfxJC7O
         RwsKehw8VvzCZ9qlj5eTRNeQoygpuSIwIG/nvJYqZk0+Iy+B3ig0JC7exQYDHCUIc2e5
         WQbgHQVzO5TRYtLmez5MRcjakRdqSSGOx+XEnRjP8NryyWtIB4ie9R+QMfDnR+mJLVQW
         ies2ctGPIS//eptrPoAPEK3s70mdZLkBDaNjXC5XvdfxFCne3c7KuMPXGBUV7+8CRu82
         jTjkE/6xDSj6G276bNa/ZFx6V0MgHQ3aphdLOQzDPDnfMCiwcLOeliXDBTpC9FAaVaEJ
         X/vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=cOYMMs4mGkDO1kxtsfUwDt3afaM2rt/Wl7zMcSRldNk=;
        b=ibRwAFAiEKThbQfwPmvS8VNd0OdB1BWqUjTwZ+e/nhKlVp+ECTKlhnPykMqNSWNBfr
         4Mrrc2GexVD+OMTEGkHWVU53CCkfs6EbKiT9tJvgTl2zHGGPW4YXYGHkmy47sVnD0TIb
         zaA62PZMgKm6ZoSzcfAV8JfkARwD0OgKsqPbU1TdCb6mkdDqcPoo4f9vfHwTTDfX78be
         LNvUWQvCix/NHR9AK1vSHjhLh/a5nrBGSlQIWP15PN4UC6tDj4E58RTpPuTk0DxD9qrx
         crOzij5lwZLrnrNU19hv2YcR/XIc+ZwYDeboApcY46820eed62qcq8SG58Sn7lMrXMdL
         Cisw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q3si3751883qtd.95.2018.12.04.05.47.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 04 Dec 2018 05:47:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56866 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gUB34-0005NB-Q6
	for alex.bennee@linaro.org; Tue, 04 Dec 2018 08:47:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35997)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gUB2o-0005N1-RP
	for qemu-arm@nongnu.org; Tue, 04 Dec 2018 08:47:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gUB2k-0008R3-SJ
	for qemu-arm@nongnu.org; Tue, 04 Dec 2018 08:47:22 -0500
Received: from mx1.redhat.com ([209.132.183.28]:33594)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gUB2k-0008QL-Ki; Tue, 04 Dec 2018 08:47:18 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9264D3002E12;
	Tue,  4 Dec 2018 13:47:17 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 12CBB1054FC9;
	Tue,  4 Dec 2018 13:47:04 +0000 (UTC)
Date: Tue, 4 Dec 2018 14:47:03 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Samuel Ortiz <sameo@linux.intel.com>
Message-ID: <20181204144703.4bc52d9c@redhat.com>
In-Reply-To: <20181130130032.11835-7-sameo@linux.intel.com>
References: <20181130130032.11835-1-sameo@linux.intel.com>
	<20181130130032.11835-7-sameo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Tue, 04 Dec 2018 13:47:17 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v3 6/8] hw: arm: Support both legacy and
 current RSDP build
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
X-TUID: QW3Cr9XY/B4H

On Fri, 30 Nov 2018 14:00:30 +0100
Samuel Ortiz <sameo@linux.intel.com> wrote:

> We add the ability to build legacy or current RSDP tables, based on the
> AcpiRsdpData revision field passed to build_rsdp().
> Although arm/virt only uses RSDP v2, adding that capability to
> build_rsdp will allow us to share the RSDP build code between ARM and x86.
> 
> Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> ---
>  hw/arm/virt-acpi-build.c | 39 ++++++++++++++++++++++++++++++++++-----
>  1 file changed, 34 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 4a6b53fbfc..4b212fa44c 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -370,8 +370,23 @@ static void acpi_dsdt_add_power_button(Aml *scope)
>  static void
>  build_rsdp(GArray *tbl, BIOSLinker *linker, AcpiRsdpData *rsdp_data)
>  {
> +
unrelated white space change
 (you can do v4 of this patch as reply to this patch and add changelog below ---
  so it would be clear what's changed)

>      int tbl_off = tbl->len; /* Table offset in the RSDP file */
>  
> +    switch (rsdp_data->revision) {
> +    case 0:
> +        /* With ACPI 1.0, we must have an RSDT pointer */
> +        g_assert(rsdp_data->rsdt_tbl_offset);
> +        break;
> +    case 2:
> +        /* With ACPI 2.0+, we must have an XSDT pointer */
> +        g_assert(rsdp_data->xsdt_tbl_offset);
> +        break;
> +    default:
> +        /* Only revisions 0 (ACPI 1.0) and 2 (ACPI 2.0+) are valid for RSDP */
> +        g_assert_not_reached();
> +    }
> +
>      bios_linker_loader_alloc(linker, ACPI_BUILD_RSDP_FILE, tbl, 16,
>                               true /* fseg memory */);
>  
> @@ -380,10 +395,29 @@ build_rsdp(GArray *tbl, BIOSLinker *linker, AcpiRsdpData *rsdp_data)
>      g_array_append_vals(tbl, rsdp_data->oem_id, 6); /* OEMID */
>      build_append_int_noprefix(tbl, rsdp_data->revision, 1); /* Revision */
>      build_append_int_noprefix(tbl, 0, 4); /* RsdtAddress */
> +    if (rsdp_data->rsdt_tbl_offset) {
> +        /* RSDT address to be filled by guest linker */
> +        bios_linker_loader_add_pointer(linker, ACPI_BUILD_RSDP_FILE,
> +                                       tbl_off + 16, 4,
> +                                       ACPI_BUILD_TABLE_FILE,
> +                                       *rsdp_data->rsdt_tbl_offset);
> +    }
> +
> +    /* Checksum to be filled by guest linker */
> +    bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE,
> +                                    tbl_off, 20, /* ACPI rev 1.0 RSDP size */
> +                                    8);
> +
> +    if (rsdp_data->revision == 0) {
> +        /* ACPI 1.0 RSDP, we're done */
> +        return;
> +    }
> +
>      build_append_int_noprefix(tbl, 36, 4); /* Length */
>  
>      /* XSDT address to be filled by guest linker */
>      build_append_int_noprefix(tbl, 0, 8); /* XsdtAddress */
> +    /* We already validated our xsdt pointer */
>      bios_linker_loader_add_pointer(linker, ACPI_BUILD_RSDP_FILE,
>                                     tbl_off + 24, 8,
>                                     ACPI_BUILD_TABLE_FILE,
> @@ -392,11 +426,6 @@ build_rsdp(GArray *tbl, BIOSLinker *linker, AcpiRsdpData *rsdp_data)
>      build_append_int_noprefix(tbl, 0, 1); /* Extended Checksum */
>      build_append_int_noprefix(tbl, 0, 3); /* Reserved */
>  
> -    /* Checksum to be filled by guest linker */
> -    bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE,
> -                                    tbl_off, 20, /* ACPI rev 1.0 RSDP size */
> -                                    8);
> -
>      /* Extended checksum to be filled by Guest linker */
>      bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE,
>                                      tbl_off, 36, /* ACPI rev 2.0 RSDP size */

