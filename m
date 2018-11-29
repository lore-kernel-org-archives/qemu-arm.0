Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2373636wrt;
        Thu, 29 Nov 2018 06:04:13 -0800 (PST)
X-Google-Smtp-Source: AFSGD/Vd8XVm2kHwH7D5tlicNK776nB9r7vJXbupoXl4oMiyHRnVamzSGV5cPQJpN3iKqezxCzaZ
X-Received: by 2002:a81:b649:: with SMTP id h9mr1451029ywk.57.1543500253046;
        Thu, 29 Nov 2018 06:04:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543500253; cv=none;
        d=google.com; s=arc-20160816;
        b=0wxhIndFsIekl8D8oBqQG9G0dCLewdO/M7CVzymxrvJ0LgtJaYVYbjnyT5UcNVtbVe
         XU4rgIgeBJSpIWALgzeLtmx7Pt//dnfvbZ3W1uLq0o3QauvGgV91NKUgc7Vj8aS1qOR2
         45XxJ5C0XzKbBd50l+SpnPPk91rqaIQkDccm9XMW2jHAwhVMfAQlNCxAGWyH8/0vLEEz
         phh7NeVe2VX8WzBBV1Mi9UEE+bAst5t1IBS+Macf4qs9dLGpfF16uJsfYoCkncjotGgP
         c4VAEhUe11rM9q5FhKFJcQyNgOou8iJe/KazSLQd7fWeZnk2qGeCkx4psvIoS6Pe8OAj
         XGTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=+t2YKwEqqTc5OAUbRX7VHQm4twtZEbKmcBkr8BD814U=;
        b=fA4ZWcqsFwELDwLvBfz70u+sdgbTifRytqg3vrmuIzaRYhJExZ2a64gXvSymOrSvqE
         /Z2qLjtYHImPLs4BVknpxTe+HNtKLL8iIPVpnRWrOFoOl39oExbKFYAkaXm5J9Y+h5MO
         K+aTGhvEbr5ZqktYwWCdCYafql4JxertXu5sVAvOi2n74QbFr1Cc5dKAzVcPvtQ6NCUQ
         CzZyRAsajqznvlA4p+Epm1Lo+xLqiy6u9R76n+R+sfKqV6VFjXta5hVZovc5boaDlcXs
         jQKUoEsjRVA2gj6n0l8HKfHU9wGkfuu7pS+c9Zz9YIvP4zukM9r6R1S9hpldY08Css0c
         G5UQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p15-v6si1107734ybg.427.2018.11.29.06.04.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 29 Nov 2018 06:04:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54349 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gSMvL-0004X2-Vs
	for alex.bennee@linaro.org; Thu, 29 Nov 2018 09:04:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42261)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1gSMua-0004W5-ML
	for qemu-devel@nongnu.org; Thu, 29 Nov 2018 09:03:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1gSMuW-0005Iq-Bv
	for qemu-devel@nongnu.org; Thu, 29 Nov 2018 09:03:23 -0500
Received: from mx1.redhat.com ([209.132.183.28]:22318)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1gSMuH-0005AI-LM; Thu, 29 Nov 2018 09:03:07 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 51123308FBAC;
	Thu, 29 Nov 2018 14:03:01 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BDA5362A82;
	Thu, 29 Nov 2018 14:02:57 +0000 (UTC)
Date: Thu, 29 Nov 2018 15:02:46 +0100
From: Andrew Jones <drjones@redhat.com>
To: Samuel Ortiz <sameo@linux.intel.com>
Message-ID: <20181129135301.l5dyvmjtpsrfjhdw@kamzik.brq.redhat.com>
References: <20181129132428.333-1-sameo@linux.intel.com>
	<20181129132428.333-3-sameo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181129132428.333-3-sameo@linux.intel.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Thu, 29 Nov 2018 14:03:01 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 2/8] hw: arm: acpi: Fix incorrect
 checksums in RSDP
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
	"Michael S. Tsirkin" <mst@redhat.com>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	qemu-devel@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>,
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BTquibAgDEG4

On Thu, Nov 29, 2018 at 02:24:22PM +0100, Samuel Ortiz wrote:
> From: Igor Mammedov <imammedo@redhat.com>
> 
> When RSDP table was introduced (d4bec5d87), we calculated only legacy
> checksum, and that was incorrect as it
>  - specified rev=2 and forgot about extended checksum.
>  - legacy checksum calculated on full table instead of the 1st 20 bytes
> 
> Fix it by adding extended checksum calculation and using correct
> size for legacy checksum.
> 
> While at it use explicit constants to specify sub/full tables
> sizes instead of relying on AcpiRsdpDescriptor size and fields offsets.
> The follow up commits will convert this table to build_append_int_noprefix() API,
> will use constants anyway and remove unused AcpiRsdpDescriptor structure.
> 
> Based on "[PATCH v5 05/24] hw: acpi: Implement XSDT support for  RSDP"
> by Samuel Ortiz, who did it right in his impl.
> 
> Fixes: d4bec5d87 (hw/arm/virt-acpi-build: Generate RSDP table)
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> CC: Ard Biesheuvel <ard.biesheuvel@linaro.org>
> CC: Shannon Zhao <shannon.zhaosl@gmail.com>
> Reviewed-by: Samuel Ortiz <sameo@linux.intel.com>
> Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>

I don't see my R-b here, but this patch doesn't appear to have changed
since I reviewed it. Here it is again

Reviewed-by: Andrew Jones <drjones@redhat.com>

> ---
>  hw/arm/virt-acpi-build.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index fcaa350892..0835900052 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -390,8 +390,13 @@ build_rsdp(GArray *rsdp_table, BIOSLinker *linker, unsigned xsdt_tbl_offset)
>  
>      /* Checksum to be filled by Guest linker */
>      bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE,
> -        (char *)rsdp - rsdp_table->data, sizeof *rsdp,
> +        (char *)rsdp - rsdp_table->data, 20 /* ACPI rev 1.0 RSDP size */,
>          (char *)&rsdp->checksum - rsdp_table->data);
> +
> +    /* Extended checksum to be filled by Guest linker */
> +    bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE,
> +        (char *)rsdp - rsdp_table->data, 36 /* ACPI rev 2.0 RSDP size */,
> +        (char *)&rsdp->extended_checksum - rsdp_table->data);
>  }
>  
>  static void
> -- 
> 2.19.2
> 
>

