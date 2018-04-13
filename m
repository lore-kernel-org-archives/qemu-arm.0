Received: by 10.28.71.155 with SMTP id m27csp778654wmi;
        Fri, 13 Apr 2018 06:48:37 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4/DMf1F7stCWGhhzvTP3399qjeFS9zKTs9DBRVjqBC6UQzobrMpBkUeliDQqs2oCAKJ4Mgo
X-Received: by 2002:a25:42cc:: with SMTP id p195-v6mr4671528yba.405.1523627316957;
        Fri, 13 Apr 2018 06:48:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523627316; cv=none;
        d=google.com; s=arc-20160816;
        b=vlWAHTJkokWilmMGusNrfKyiQysry2R2LJPX870AtQQGYwYk6iR0wUR8PT03crXm9F
         68A/c/aW3MeP+yP4NcWp8YczM4pPSJL/EPcuNaOMWVa6u2DjyqkKdknoyjjTkVZq/PKF
         L+jFELv7Lk34MB3CN3DyOw0vLUJ7Z8z1Gyr9jSUNxOJ4N8DpswtpsA3IUhAGR3hyjhmA
         gwSVqTc9wOkyL2Emv/0Wabry+hqVndXLWIKPG99znvVxe4j7S9GQ73ZNEWff/R+ChAYh
         SRzEVP2LYz8f+2x3DUsSc9YpXrJno/El76b/n8M6CnU0AwCArWyYMMeqC5XgvHhGxjao
         S+PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=RBfC5Ug02m/ZX7mFp+Q+ibli4NPlk9pUnMA6DrRyayo=;
        b=mUTqbm4/fiQfTMGKXM1wY4uFd7JgzPLi3mQI97Fq0p+FTxwYfWxiQOzD3B1GD0hXOV
         d/0ZevFKe3I1nZDCFaPeAkS6vpQl1bgjN4JjnbaWC4DAuu93z7R9KE5mGmqBMOs3KzWW
         8bG9X8l33Sj+8+7A9AOFr9I7heG5hYe78ndpbk9PCbHOZ33owy2uKOasnoCDlbMe/pOK
         WqzJ9ZkQqJlKtoI82A5tVEwfAn7sR2bF+N2wG6lSaTmzdwy0JbvJkST4Y4heMrLVSfS6
         5ZpYKa3dCkobJ7TgDrkjyVgvIzefLNC1UnTr62hGPZjBlYN6xQEASzRxyr0/mvRX05lr
         2BlQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k16si6282782qtm.54.2018.04.13.06.48.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 13 Apr 2018 06:48:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54947 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f6z48-00010L-Fl
	for alex.bennee@linaro.org; Fri, 13 Apr 2018 09:48:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34822)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1f6z3P-0000cc-J9
	for qemu-arm@nongnu.org; Fri, 13 Apr 2018 09:47:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1f6z3K-00081A-NS
	for qemu-arm@nongnu.org; Fri, 13 Apr 2018 09:47:51 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:60636 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1f6z3K-00080I-Hq; Fri, 13 Apr 2018 09:47:46 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3D39A4075A6E;
	Fri, 13 Apr 2018 13:47:42 +0000 (UTC)
Received: from hawk.localdomain (ovpn-204-157.brq.redhat.com [10.40.204.157])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 709FF2026DFD;
	Fri, 13 Apr 2018 13:47:36 +0000 (UTC)
Date: Fri, 13 Apr 2018 15:47:34 +0200
From: Andrew Jones <drjones@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Message-ID: <20180413134734.ooeu36abnlafglwi@hawk.localdomain>
References: <1522160122-10744-1-git-send-email-eric.auger@redhat.com>
	<1522160122-10744-8-git-send-email-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1522160122-10744-8-git-send-email-eric.auger@redhat.com>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Fri, 13 Apr 2018 13:47:42 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Fri, 13 Apr 2018 13:47:42 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'drjones@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC 7/8] hw/arm/virt-acpi-build:
 Handle multiple GICR structures
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
Cc: peter.maydell@linaro.org, cdall@kernel.org, marc.zyngier@arm.com,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	zhaoshenglong@huawei.com, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0k+GQ65WzD7N

On Tue, Mar 27, 2018 at 04:15:21PM +0200, Eric Auger wrote:
> In case multiple redistributor regions were registered,
> let's add the corresponding GICR structures in the MADT
> ACPI table.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  hw/arm/virt-acpi-build.c | 21 +++++++++++++++------
>  1 file changed, 15 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index c7c6a57..aefc1b4 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -43,6 +43,7 @@
>  #include "hw/pci/pcie_host.h"
>  #include "hw/pci/pci.h"
>  #include "hw/arm/virt.h"
> +#include "hw/intc/arm_gicv3.h"
>  #include "sysemu/numa.h"
>  #include "kvm_arm.h"
>  
> @@ -618,14 +619,22 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      }
>  
>      if (vms->gic_version == 3) {
> +        GICv3State *s = (GICv3State *)vms->gic;
> +        int r;
> +
>          AcpiMadtGenericTranslator *gic_its;
> -        AcpiMadtGenericRedistributor *gicr = acpi_data_push(table_data,
> -                                                         sizeof *gicr);
>  
> -        gicr->type = ACPI_APIC_GENERIC_REDISTRIBUTOR;
> -        gicr->length = sizeof(*gicr);
> -        gicr->base_address = cpu_to_le64(memmap[VIRT_GIC_REDIST].base);
> -        gicr->range_length = cpu_to_le32(memmap[VIRT_GIC_REDIST].size);
> +        for (r = 0; r <  s->nb_redist_regions; r++) {
                           ^ extra space
> +            AcpiMadtGenericRedistributor *gicr = acpi_data_push(table_data,
> +                                                                sizeof *gicr);
> +
> +            gicr->type = ACPI_APIC_GENERIC_REDISTRIBUTOR;
> +            gicr->length = sizeof(*gicr);

This file has inconsistent use of () with sizeof. If you want to start
it on its path to using ()'s, like the majority of QEMU code, then you
could add them to the acpi_data_push() above.

> +            gicr->base_address = cpu_to_le64(s->redist_region[r].base);
> +            /* count redistributors of 2 x 64kB pages */
> +            gicr->range_length =
> +                cpu_to_le64((uint64_t)s->redist_region[r].count << 17);
                            ^^ range_length is only 4 bytes.

It might be nice to have a define of some sort for the 2*64K to avoid it
getting scattered everywhere. 

> +        }
>  
>          if (its_class_name() && !vmc->no_its) {
>              gic_its = acpi_data_push(table_data, sizeof *gic_its);
> -- 
> 2.5.5
> 
>

Thanks,
drew 
