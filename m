Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3357425wrt;
        Fri, 30 Nov 2018 01:26:11 -0800 (PST)
X-Google-Smtp-Source: AFSGD/VotETwW4cktYDPGqqprdUimmDYW/2PaZLX/+T3b58vvZQGgScTAsImQZ2J5/v3S8fHB90D
X-Received: by 2002:a25:27ca:: with SMTP id n193-v6mr4589345ybn.494.1543569971158;
        Fri, 30 Nov 2018 01:26:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543569971; cv=none;
        d=google.com; s=arc-20160816;
        b=T1dN91lH+kzroaxc21+Mi6dTITFRmGjDbeHm0kNmDaVymnPwAhO02H64LQwQwawOVK
         v9euQIz1w3irTSFFpzRtKbLIHKINGIZTeuVWYWhGweflpZ8YO7MEmrMvcaqB7/i65Hj1
         7t+oqmEU1v1b+6pavqvbF1oQ9FjDYmTwFzWPkhN1dk9qRSRAQO8gS71YgifW/JlIdnaW
         Qk1euE2/UpV9VGJW9St1y0cDnShnB5W8e/9ve4up5ORv/7I+eYN8pQr8hRSAvWSPMBEo
         xto0fGyrhRFhnBId1DoGvy0ueXBX9NswKaCs9vwKYdTqx/eeaKuoMcqUnPcYbeYIGRrY
         Q3Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=vRp+ZZfHoLzeZbHco80Zi+B2T9DSRlDDrsqEpoZygPI=;
        b=HPmSsGukx055IIXEY+8mZLm+ts7xRmTNFQmN7HoVM0WsUz3Xbttl5FKcLQgSXruBnO
         /y4QRVgfF1c3NYhqXejzgb+WGp5Tufycg19CElwqoUrDXoPqBXYiDPS5W+btW1AuuRHr
         VdtAltdfDHzCe/Ijsfrr7i/4Oo25lvR+SsvpBDZSR44e8/vmx4BdDzGMhJQ2Eggk0nir
         6hv+vScjDpfPGNZGrT2T3TFiC+jSVQgcXXGF00P5x1iY+5ksH223pPaq86FxL6/VmF7f
         iG1YILj0ajs2Lfa/E2a6+Uhgvv+xwv4QOLuGB4rwLV/C9DVodDebc8KoJeicYtV+zusK
         BbPA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r66-v6si2686134ywd.310.2018.11.30.01.26.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 30 Nov 2018 01:26:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58916 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gSf3q-0005tE-Ku
	for alex.bennee@linaro.org; Fri, 30 Nov 2018 04:26:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35254)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gSf3h-0005t4-AO
	for qemu-arm@nongnu.org; Fri, 30 Nov 2018 04:26:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gSf3d-0002NG-8n
	for qemu-arm@nongnu.org; Fri, 30 Nov 2018 04:26:01 -0500
Received: from mx1.redhat.com ([209.132.183.28]:52714)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gSf3b-0002Kx-6G; Fri, 30 Nov 2018 04:25:57 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6E714308A94F;
	Fri, 30 Nov 2018 09:25:53 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3069E60CD1;
	Fri, 30 Nov 2018 09:25:48 +0000 (UTC)
Date: Fri, 30 Nov 2018 10:25:46 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Samuel Ortiz <sameo@linux.intel.com>
Message-ID: <20181130102546.42c1f0f2@redhat.com>
In-Reply-To: <20181129132428.333-6-sameo@linux.intel.com>
References: <20181129132428.333-1-sameo@linux.intel.com>
	<20181129132428.333-6-sameo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Fri, 30 Nov 2018 09:25:53 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 5/8] hw: arm: Convert the
 RSDP build to the buid_append_foo() API
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
X-TUID: bKe8E5iptej7

On Thu, 29 Nov 2018 14:24:25 +0100
Samuel Ortiz <sameo@linux.intel.com> wrote:

> Instead of filling a mapped and packed C structure field in random order
> and being careful about endianness and sizes, build_rsdp() now uses
> build_append_int_noprefix() to compose RSDP table.
> 
> This makes for an easier to review and maintain code that is almost
> matching 1:1 the ACPI spec itself.
nit if you happen to respin:
 This makes review and maintaining code easier and ..

> Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
> ---
>  hw/arm/virt-acpi-build.c | 42 +++++++++++++++++++++-------------------
>  1 file changed, 22 insertions(+), 20 deletions(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index ce8bfa5a37..4782aea4fe 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -368,35 +368,37 @@ static void acpi_dsdt_add_power_button(Aml *scope)
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
> -
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
> +                                   24, 8,
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
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
this is always 0 with all current users and you a replacing it with 0
constant. That's fine but that assumes that above condition stays always true.
I'd add assert at the beginning of function to make sure that
tbl length is 0
or as an alternative
 build_rsdp(...)
 {
   start_off = tbl->len;
   ...
   bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE, start_off, 20 ...

so it won't explode even if RSDP isn't at the beginning of file.
If you go for the later than bios_linker_loader_add_pointer() will also need similar treatment

> -        (char *)&rsdp->checksum - rsdp_table->data);
> +                                    0, 20, /* ACPI rev 1.0 RSDP size */
> +                                    8);
>  
>      /* Extended checksum to be filled by Guest linker */
>      bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE,
> -        (char *)rsdp - rsdp_table->data, 36 /* ACPI rev 2.0 RSDP size */,
> -        (char *)&rsdp->extended_checksum - rsdp_table->data);
> +                                    0, 36, /* ACPI rev 2.0 RSDP size */
> +                                    32);
>  }
>  
>  static void

