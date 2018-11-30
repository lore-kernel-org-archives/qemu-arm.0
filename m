Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3368425wrt;
        Fri, 30 Nov 2018 01:40:25 -0800 (PST)
X-Google-Smtp-Source: AFSGD/X2gFZeUl/hx4+3R2t9COjfaYhUW+rtXGZuaQEzfKH5tcMxKc47TQoqq+py0ElRswCOVC8I
X-Received: by 2002:a25:8710:: with SMTP id a16-v6mr4731656ybl.253.1543570825566;
        Fri, 30 Nov 2018 01:40:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543570825; cv=none;
        d=google.com; s=arc-20160816;
        b=aVrye4erbiEdDQ1Fw1mbqYpRVwzSWACnfwW07rSd1b8Oy8F64INwOGhMKN7cDfv2/c
         qhdQW8DnxA/Plf/0Q1UCF61Vj2CxZS1es25Tq6a7WkOvaLovFUFGyAKVwCVb3Ubqfrmm
         AEMC2Z/e2aKlKFxkNPey3638xI2g7TslsArizuddj0M5CRi5FOiFobe5FWrWgMZRQPv6
         43P1QSYKfIsip3BV7HoKtPIzppLS61f8NWAvVEk+we1EBa1pMMK98EbhgVuPZMb0bt62
         gmVwVFvC+QSx0QD+RrqmFVNgVWRspYOXD5L5r9jPpmSmW7/MSUSEIe88Vg20m1CxLnz4
         oF/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=cNwt0kmwUrA8irwgDm5nQzNp40NsgfYQNOoweYaMykY=;
        b=HNGsBZ2DC8KoGepQN7WHyumAfScmjQ2GXTNqWtAVrdRfNARj6HT9/8RQlx8+zUs3+k
         TJX8/y/siEd9vjUQRNhFuO0NZFkXHJ2PTssPH83o3FhyZiC6LWJZpbsUK1ElBNwRejd9
         z5FN3YQ8gWxlbs7/ZWqQ8Ppjm0lDrAnk2vM0zN9gEjdY1FIlYSfWJbtx+3nSJQV24arG
         MWT3K1T+lAARXzaoYw2UBbSKvr55FEcizPGQGx0RDqgbDa2m+3n1wM5vhyIkoExUejpQ
         sMZjM16GCwOJmRUQGNAVcvSCGZFEqn+RtPUhjTS3P/Rk5XC4131FVp1/8WLhQuwzjmVN
         M0xQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q81-v6si2775512ybc.394.2018.11.30.01.40.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 30 Nov 2018 01:40:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58969 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gSfHc-0006oT-VB
	for alex.bennee@linaro.org; Fri, 30 Nov 2018 04:40:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37852)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gSfFq-0005fB-8P
	for qemu-arm@nongnu.org; Fri, 30 Nov 2018 04:38:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gSfFm-0001vy-Rf
	for qemu-arm@nongnu.org; Fri, 30 Nov 2018 04:38:34 -0500
Received: from mx1.redhat.com ([209.132.183.28]:38140)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gSfFm-0001v2-EX; Fri, 30 Nov 2018 04:38:30 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F3B6C88E63;
	Fri, 30 Nov 2018 09:38:28 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BD6531019637;
	Fri, 30 Nov 2018 09:38:23 +0000 (UTC)
Date: Fri, 30 Nov 2018 10:38:22 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Samuel Ortiz <sameo@linux.intel.com>
Message-ID: <20181130103822.6b9a6919@redhat.com>
In-Reply-To: <20181129132428.333-7-sameo@linux.intel.com>
References: <20181129132428.333-1-sameo@linux.intel.com>
	<20181129132428.333-7-sameo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Fri, 30 Nov 2018 09:38:29 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v2 6/8] hw: arm: Support both legacy and
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
X-TUID: Uz2i+wCu4t2X

On Thu, 29 Nov 2018 14:24:26 +0100
Samuel Ortiz <sameo@linux.intel.com> wrote:

> We add the ability to build legacy or current RSDP tables, based on the
> AcpiRsdpData revision field passed to build_rsdp().
> Although arm/virt only uses RSDP v2, adding that capability to
> build_rsdp will allow us to share the RSDP build code between ARM and x86.
> 
> Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

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

