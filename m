Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2446084wrt;
        Thu, 29 Nov 2018 07:05:18 -0800 (PST)
X-Google-Smtp-Source: AFSGD/XJX7UN0RzUhlgrHyfCr6jsVyM7ocXRdOIWTDa1xV+y58CjwTLo2PdJSxejngD4/k5svLkQ
X-Received: by 2002:ac8:35b1:: with SMTP id k46mr1755651qtb.141.1543503918895;
        Thu, 29 Nov 2018 07:05:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543503918; cv=none;
        d=google.com; s=arc-20160816;
        b=oYzHw811gSNfrOgSM1aqZaMJ+VkAhdDf9uhVnr2m+E2YkTpmbG2VJs8D9B2+EIrGft
         l7xn+6zYho58hLcifYnNq2gUkQPDaa1VzKugvO5DfnAmVjPrQs+c98YJx1H+shbf9B4Z
         0PU8/K9LrHAXtsWfv6p8yvv645mLpRxl6FbtO2hRHpMIcU0exCcfeGX8URi3zqIel77g
         64qrzumjde8KWYxN3aY2KmGD7DR/dDV5Rs6GaE79DK4B5lON8wOOhjnLxueu5RMfZ3bA
         oRHz/kJEzV1V1jP/5jD9/ngpPSFRdjRMmyO+szGMBAuNhOJRnJK8olv8j7ocd86oV+N0
         5OcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=t7B6pojK3iA/vDR+2hyfCLtGJqIFPE3GYPJKbG6MLsc=;
        b=nAvVkpfp88oT4ZUKdllqztF+iGQst0LT7lwBZdJaxGoKqMK77eMEavlQcFkpt8Zw72
         jA5a5htk7/35SceNgCm7NzVla2J38YZEY6tdqmwhwpEZesXe1Pvx/+StPUcbxFK/8DI0
         JgC6P5fRXt/yT74JKqm1umrtY12b0Bk6npR1POZ6SqgSgQxw18WPHjcjb03y99f2NPrE
         7z5do9tPcjQsPGK7Dd2Qtk9/n00g7MQDyDrT1dziufrEpISrnwlLGjwyG/txMgxOvuIE
         4b+gPO3xk2Our6TRO+xGWmByKRE5AQP4LKn4RI8q8bsPN7t16zmme+XpfOShiXb8Rr5L
         S0IQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f4si1453240qtk.237.2018.11.29.07.05.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 29 Nov 2018 07:05:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54668 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gSNsU-0006vH-B5
	for alex.bennee@linaro.org; Thu, 29 Nov 2018 10:05:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34247)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1gSNmL-0000g4-To
	for qemu-devel@nongnu.org; Thu, 29 Nov 2018 09:59:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1gSNWp-0005un-V3
	for qemu-devel@nongnu.org; Thu, 29 Nov 2018 09:42:56 -0500
Received: from mx1.redhat.com ([209.132.183.28]:57806)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1gSNWm-0005rC-A3; Thu, 29 Nov 2018 09:42:52 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 796CE3082B10;
	Thu, 29 Nov 2018 14:42:51 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DD97A61520;
	Thu, 29 Nov 2018 14:42:45 +0000 (UTC)
Date: Thu, 29 Nov 2018 15:42:43 +0100
From: Andrew Jones <drjones@redhat.com>
To: Samuel Ortiz <sameo@linux.intel.com>
Message-ID: <20181129144243.so22d2igis7a24xp@kamzik.brq.redhat.com>
References: <20181129132428.333-1-sameo@linux.intel.com>
	<20181129132428.333-7-sameo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181129132428.333-7-sameo@linux.intel.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Thu, 29 Nov 2018 14:42:51 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 6/8] hw: arm: Support both legacy and
 current RSDP build
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, Ben Warren <ben@skyportsystems.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
	Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MtkIhlc5THCV

On Thu, Nov 29, 2018 at 02:24:26PM +0100, Samuel Ortiz wrote:
> We add the ability to build legacy or current RSDP tables, based on the
> AcpiRsdpData revision field passed to build_rsdp().
> Although arm/virt only uses RSDP v2, adding that capability to
> build_rsdp will allow us to share the RSDP build code between ARM and x86.
> 
> Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
> ---
>  hw/arm/virt-acpi-build.c | 37 ++++++++++++++++++++++++++-----------
>  1 file changed, 26 insertions(+), 11 deletions(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 4782aea4fe..e1338b6f5a 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -378,23 +378,38 @@ build_rsdp(GArray *tbl, BIOSLinker *linker, AcpiRsdpData *rsdp_data)
>      g_array_append_vals(tbl, rsdp_data->oem_id, 6); /* OEMID */
>      build_append_int_noprefix(tbl, rsdp_data->revision, 1); /* Revision */
>      build_append_int_noprefix(tbl, 0, 4); /* RsdtAddress */
> -    build_append_int_noprefix(tbl, 36, 4); /* Length */
> -
> -    /* XSDT address to be filled by guest linker */
> -    build_append_int_noprefix(tbl, 0, 8); /* XsdtAddress */
> -    bios_linker_loader_add_pointer(linker, ACPI_BUILD_RSDP_FILE,
> -                                   24, 8,
> -                                   ACPI_BUILD_TABLE_FILE,
> -                                   *rsdp_data->xsdt_tbl_offset);
> -
> -    build_append_int_noprefix(tbl, 0, 1); /* Extended Checksum */
> -    build_append_int_noprefix(tbl, 0, 3); /* Reserved */
> +    if (rsdp_data->rsdt_tbl_offset) {

I see why a pointer was used now. Using a pointer ensures a zero
offset won't fail this test. However the test could be replaced with
rsdp_data->revision == 0.

> +        /* RSDT address to be filled by guest linker */
> +        bios_linker_loader_add_pointer(linker,
> +                                       ACPI_BUILD_RSDP_FILE, 16, 4,
> +                                       ACPI_BUILD_TABLE_FILE,
> +                                       *rsdp_data->rsdt_tbl_offset);
> +    }
>  
>      /* Checksum to be filled by guest linker */
>      bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE,
>                                      0, 20, /* ACPI rev 1.0 RSDP size */
>                                      8);
>  
> +    if (rsdp_data->revision == 0) {
> +        /* ACPI 1.0 RSDP, we're done */
> +        return;
> +    }
> +
> +    /* The RSDP revision is 2 and later, we must have an XSDT pointer */
> +    g_assert(rsdp_data->xsdt_tbl_offset != NULL);

So here's the justification for the pointers. We sanity check the callers.
We're missing the (rsdp_data->revision == 0 && rsdp_data->rsdt_tbl_offset)
sanity check though.

> +
> +    build_append_int_noprefix(tbl, 36, 4); /* Length */
> +
> +    /* XSDT address to be filled by guest linker */
> +    build_append_int_noprefix(tbl, 0, 8); /* XsdtAddress */
> +    bios_linker_loader_add_pointer(linker, ACPI_BUILD_RSDP_FILE, 24, 8,
> +                                   ACPI_BUILD_TABLE_FILE,
> +                                   *rsdp_data->xsdt_tbl_offset);
> +
> +    build_append_int_noprefix(tbl, 0, 1); /* Extended Checksum */
> +    build_append_int_noprefix(tbl, 0, 3); /* Reserved */
> +
>      /* Extended checksum to be filled by Guest linker */
>      bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE,
>                                      0, 36, /* ACPI rev 2.0 RSDP size */
> -- 
> 2.19.2
> 
>

Thanks,
drew
