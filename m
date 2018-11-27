Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1500824wrt;
        Tue, 27 Nov 2018 08:39:06 -0800 (PST)
X-Google-Smtp-Source: AFSGD/VDCUQXI+b2+HNCxVXFNxqi/MJtbFVLiN/KcMLm/iwlAC+pAiJca5/IQ7dMOQ5erRZd8mrI
X-Received: by 2002:a81:5791:: with SMTP id l139mr20321679ywb.413.1543336746310;
        Tue, 27 Nov 2018 08:39:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543336746; cv=none;
        d=google.com; s=arc-20160816;
        b=bWaFZFzhZC78qGUPEwCdHH74ixWgRbDumLQQcTfnfVACuPcpFRoRIt4JbUGJ2Fy46f
         ts4MlgcKzY9ZvHj7Bsb10TASx1gDvKK7Rm6KQkOxy94k4ICPZzTestQ0fLZJN2jYiNvo
         fC7z9kJSM01n/kz8q3gWx1n1F0KRHTKf8i6iRHvOcn7l5GTGCmJ69zuAWCQmZSz3Kdgk
         aKo0uXPJ06wzuMMs7R99AhkQnBvu1+ONJPluKU18R66RD7cVr/ju9Eey+CrDsXmZbMbV
         VOy2sORT4S5sr94y9zL39Pibk2ZJuYOU/a2LJR9BZTuER05rtdZTjdYZTqC/z+bKxPLc
         4Hng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=e7c7oB3co4zIQcCxdC8IXwzVTG1OHXm4q2qY7d4f2C0=;
        b=Lkmv+bP757aDzpSy9iOPVw/ZGMyjSOLK1VOUJHnhL+RA61DYHLxYD3YB2UKCtiB/gO
         2csJ9U+gGYlgUDPGHc7gmYUayX+XkEjQV5xQFzVVBbKRKE2bPQCWSjM++8BZAwcNjz4N
         OYNgtfE3ZFngz/tDO4oH9LqNIeOnWZ5CjIxYPyIjIH2ax4yDctjqQWJZUqDOpyBrDJEB
         SNnXTZz7jaWh1jA8SAmolM1Wy50cOUQrx3szK1rOyzdc4fpT7iMbEAIhtxKP8e66iSiu
         ZyopkiPMHtCFhLRkD9W7vSa3sY/s90xwDRhghXFfv9ItGyp3A/84JqVMLqR06TwSN5YV
         Gp1g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c124si2984872ywf.270.2018.11.27.08.39.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Nov 2018 08:39:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43444 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gRgO9-0003Tk-PC
	for alex.bennee@linaro.org; Tue, 27 Nov 2018 11:39:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45710)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gRgO1-0003Tf-CU
	for qemu-arm@nongnu.org; Tue, 27 Nov 2018 11:38:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gRgNy-0005rE-A4
	for qemu-arm@nongnu.org; Tue, 27 Nov 2018 11:38:57 -0500
Received: from mx1.redhat.com ([209.132.183.28]:56580)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gRgNy-0005qZ-15; Tue, 27 Nov 2018 11:38:54 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0D0F62D809;
	Tue, 27 Nov 2018 16:38:53 +0000 (UTC)
Received: from localhost (ovpn-204-51.brq.redhat.com [10.40.204.51])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7E6DF26DF3;
	Tue, 27 Nov 2018 16:38:50 +0000 (UTC)
Date: Tue, 27 Nov 2018 17:38:48 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Samuel Ortiz <sameo@linux.intel.com>
Message-ID: <20181127173848.0ea2b18a@redhat.com>
In-Reply-To: <20181126162942.21258-7-sameo@linux.intel.com>
References: <20181126162942.21258-1-sameo@linux.intel.com>
	<20181126162942.21258-7-sameo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Tue, 27 Nov 2018 16:38:53 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH 6/8] hw: arm: Support both legacy and current
 RSDP build
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
X-TUID: ERYN5d3yR5mT

On Mon, 26 Nov 2018 17:29:39 +0100
Samuel Ortiz <sameo@linux.intel.com> wrote:

> We add the ability to build legacy or current RSDP tables, based on the
> AcpiRsdpData revision field passed to build_rsdp().
> Although arm/virt only uses RSDP v2, adding that capability to
> build_rsdp will allow us to share the RSDP build code between ARM and x86.
> 
> Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
> ---
>  hw/arm/virt-acpi-build.c | 26 +++++++++++++++++++++-----
>  1 file changed, 21 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index d47978a55e..10f8388b63 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -389,6 +389,27 @@ build_rsdp(GArray *tbl, BIOSLinker *linker, AcpiRsdpData *rsdp_data)
>      /* Space for the RSDT address (32 bit) */
>      build_append_int_noprefix(tbl, 0, 4);
>  
> +    if (rsdp_data->rsdt_tbl_offset) {
> +        /* RSDT address to be filled by guest linker */
> +        bios_linker_loader_add_pointer(linker,
> +                                       ACPI_BUILD_RSDP_FILE, 16, 4,
> +                                       ACPI_BUILD_TABLE_FILE,
> +                                       *rsdp_data->rsdt_tbl_offset);
> +    }
> +
> +    /* Checksum to be filled by guest linker */
> +    bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE, 0,
> +                                    ACPI_RSDP_REV_1_LEN,
> +                                    ACPI_RSDP_CHECKSUM_OFFSET);
> +
> +    if (rsdp_data->revision == ACPI_RSDP_REV_1) {
> +        /* Legacy RSDP, we're done */
> +        return;
> +    }
> +
> +    /* The RSDP revision is 2 and later, we must have an XSDT pointer */
> +    g_assert(rsdp_data->xsdt_tbl_offset != NULL);
> +
>      /* Length */
>      build_append_int_noprefix(tbl, ACPI_RSDP_REV_2_LEN, ACPI_RSDP_LEN_LEN);
>  
> @@ -406,11 +427,6 @@ build_rsdp(GArray *tbl, BIOSLinker *linker, AcpiRsdpData *rsdp_data)
>      /* Space for the reserved bytes */
>      build_append_int_noprefix(tbl, 0, ACPI_RSDP_RESERVED_LEN);
>  
> -    /* Checksum to be filled by guest linker */
> -    bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE, 0,
> -                                    ACPI_RSDP_REV_1_LEN,
> -                                    ACPI_RSDP_CHECKSUM_OFFSET);
> -
maybe put this hunk in 5/8 at the place where are you moving it here, so you don't have to touch it twice
(I'll leave it up to you)
otherwise looks good 


>      /* Extended checksum to be filled by Guest linker */
>      bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE, 0,
>                                      ACPI_RSDP_REV_2_LEN,

