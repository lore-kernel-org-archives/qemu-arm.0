Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp192446wrw;
        Thu, 8 Nov 2018 06:25:00 -0800 (PST)
X-Google-Smtp-Source: AJdET5eMpVCf4H92UAf+pCr/9q7/+aVvP5oOWhR7nXtgaTrRnZEPa5kwWLf7CIfowcO01btS8HFD
X-Received: by 2002:ac8:6151:: with SMTP id d17mr1681918qtm.194.1541687100322;
        Thu, 08 Nov 2018 06:25:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541687100; cv=none;
        d=google.com; s=arc-20160816;
        b=g9L4dXaYckOpX5vgl2fUBUj6QMhmp91Z68jMzIX9qdthWbgg20uPh+sHtETj6kDXWl
         1GbmX0eA5eUKoLIw9HZHlRJ3em054McxyauH59zr5ltTvYIT0QjanvCWjfz+q075StDt
         Kr2Iv47o4zUKcDTg7sCzGQxehKLm/4wwLX+w+DtckC9DnDe4/5S3gP5drekolLFzcNjl
         ciLN/q3x3Pz7xQA41ku0ec3JwFK1NxUoJig8XwJ3BzVz3y6pdMv9cX6kENYAO69QIcIb
         k23UXlyLcl82dwCo1MajFd5udRPtuis4MAxT0uT2kZv3OsoZw/eUb2Pi/cIyQzAsIFY9
         LPfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=V6U1RscBoBFaeLmC3ONtxnFOmbJLn5nChQ/3sWmUGRM=;
        b=xiE3V1D8EWqcdeOKaIe2/IHqeCVR0m1zflF/WLTwPzqC4KmMTOSBvzVXqgTSC/SCXP
         xa2sKVL3A02TZuZXOOoGUiin+OCHe3Xb2axFYL2lbsgqgq6OzLl1xgMbqUuNml+dA5Hk
         nz95WxEpBodFc8v4Z6KT6B6IaC87KURPQmTKlawU6Xik1e4x0UGmwPjFaWhOrLMayajc
         dF7lKahJ4Z/CsMelJdjktRYVbtkWdbpkaTXZXu+s12PWINThXdhcbbWMUaaUellPbSTN
         AbaSXn5n+nm8ul1I7gyceZAIZuYTr70AFm4VJoswCw+Nszl2n1gsJZazJMO8mTe5p3lx
         gmlg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v190-v6si1586106qkc.168.2018.11.08.06.25.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 08 Nov 2018 06:25:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57077 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gKlEx-0001Cj-St
	for alex.bennee@linaro.org; Thu, 08 Nov 2018 09:24:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54613)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gKlEl-0001B8-Nr
	for qemu-arm@nongnu.org; Thu, 08 Nov 2018 09:24:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gKlEi-00033V-1s
	for qemu-arm@nongnu.org; Thu, 08 Nov 2018 09:24:47 -0500
Received: from mx1.redhat.com ([209.132.183.28]:43142)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gKlEg-00031l-48; Thu, 08 Nov 2018 09:24:43 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 24A2A3168ECD;
	Thu,  8 Nov 2018 14:24:41 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9D3A86606A;
	Thu,  8 Nov 2018 14:24:32 +0000 (UTC)
Date: Thu, 8 Nov 2018 15:24:31 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Samuel Ortiz <sameo@linux.intel.com>
Message-ID: <20181108152431.72bb2dae@redhat.com>
In-Reply-To: <20181105014047.26447-4-sameo@linux.intel.com>
References: <20181105014047.26447-1-sameo@linux.intel.com>
	<20181105014047.26447-4-sameo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Thu, 08 Nov 2018 14:24:41 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 03/24] hw: acpi: The RSDP
 build API can return void
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
	Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
	xen-devel@lists.xenproject.org, Anthony Perard <anthony.perard@citrix.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qet87QTAxY+/

On Mon,  5 Nov 2018 02:40:26 +0100
Samuel Ortiz <sameo@linux.intel.com> wrote:

> For both x86 and ARM architectures, the internal RSDP build API can
> return void as the current return value is unused.
> 
> Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/arm/virt-acpi-build.c | 4 +---
>  hw/i386/acpi-build.c     | 4 +---
>  2 files changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index f28a2faa53..fc59cce769 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -367,7 +367,7 @@ static void acpi_dsdt_add_power_button(Aml *scope)
>  }
>  
>  /* RSDP */
> -static GArray *
> +static void
>  build_rsdp(GArray *rsdp_table, BIOSLinker *linker, unsigned xsdt_tbl_offset)
>  {
>      AcpiRsdpDescriptor *rsdp = acpi_data_push(rsdp_table, sizeof *rsdp);
> @@ -392,8 +392,6 @@ build_rsdp(GArray *rsdp_table, BIOSLinker *linker, unsigned xsdt_tbl_offset)
>      bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE,
>          (char *)rsdp - rsdp_table->data, sizeof *rsdp,
>          (char *)&rsdp->checksum - rsdp_table->data);
> -
> -    return rsdp_table;
>  }
>  
>  static void
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 81d98fa34f..74419d0663 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -2513,7 +2513,7 @@ build_amd_iommu(GArray *table_data, BIOSLinker *linker)
>                   "IVRS", table_data->len - iommu_start, 1, NULL, NULL);
>  }
>  
> -static GArray *
> +static void
>  build_rsdp(GArray *rsdp_table, BIOSLinker *linker, unsigned rsdt_tbl_offset)
>  {
>      AcpiRsdpDescriptor *rsdp = acpi_data_push(rsdp_table, sizeof *rsdp);
> @@ -2535,8 +2535,6 @@ build_rsdp(GArray *rsdp_table, BIOSLinker *linker, unsigned rsdt_tbl_offset)
>      bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE,
>          (char *)rsdp - rsdp_table->data, sizeof *rsdp,
>          (char *)&rsdp->checksum - rsdp_table->data);
> -
> -    return rsdp_table;
>  }
>  
>  static bool acpi_get_mcfg(AcpiMcfgInfo *mcfg)

