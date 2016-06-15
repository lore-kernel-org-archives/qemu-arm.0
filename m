Received: by 10.25.21.96 with SMTP id l93csp443332lfi;
        Wed, 15 Jun 2016 01:53:04 -0700 (PDT)
X-Received: by 10.55.170.75 with SMTP id t72mr24895881qke.100.1465980784180;
        Wed, 15 Jun 2016 01:53:04 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b69si21485061qga.1.2016.06.15.01.53.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 15 Jun 2016 01:53:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40767 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bD6ZL-0005s9-Kc
	for alex.bennee@linaro.org; Wed, 15 Jun 2016 04:53:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49478)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bD6YU-0004Z0-Ms
	for qemu-arm@nongnu.org; Wed, 15 Jun 2016 04:52:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bD6YQ-0005o5-Mb
	for qemu-arm@nongnu.org; Wed, 15 Jun 2016 04:52:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:29546)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1bD6YQ-0005nQ-Gm; Wed, 15 Jun 2016 04:52:06 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AC36D80084;
	Wed, 15 Jun 2016 08:52:05 +0000 (UTC)
Received: from hawk.localdomain (ovpn-204-58.brq.redhat.com [10.40.204.58])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5F8q1N7027756
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 15 Jun 2016 04:52:03 -0400
Date: Wed, 15 Jun 2016 10:52:00 +0200
From: Andrew Jones <drjones@redhat.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Message-ID: <20160615085200.hcqq3nkzug5eicus@hawk.localdomain>
References: <1465960955-17388-1-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1465960955-17388-1-git-send-email-zhaoshenglong@huawei.com>
User-Agent: Mutt/1.5.23.1 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Wed, 15 Jun 2016 08:52:05 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] ACPI: ARM: Present GIC version
 in MADT table
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, peter.huangpeng@huawei.com,
	qemu-arm@nongnu.org, shannon.zhao@linaro.org, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: izQ/MNBN+OdL

On Wed, Jun 15, 2016 at 11:22:35AM +0800, Shannon Zhao wrote:
> From: Shannon Zhao <shannon.zhao@linaro.org>
> 
> In ACPI 5.1 Errata, it adds GIC version in GIC distributor structure.
> This is useful for guest kernel to identify which version GIC hardware
> is. Update GIC distributor structure and present GIC version in MADT
> table.
> 
> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
> ---
>  hw/arm/virt-acpi-build.c    | 1 +
>  include/hw/acpi/acpi-defs.h | 4 +++-
>  2 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 1fa0581..28fc59c 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -523,6 +523,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtGuestInfo *guest_info)
>      gicd->type = ACPI_APIC_GENERIC_DISTRIBUTOR;
>      gicd->length = sizeof(*gicd);
>      gicd->base_address = memmap[VIRT_GIC_DIST].base;
> +    gicd->version = guest_info->gic_version;
>  
>      for (i = 0; i < guest_info->smp_cpus; i++) {
>          AcpiMadtGenericInterrupt *gicc = acpi_data_push(table_data,
> diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
> index 850a962..ea9be0b 100644
> --- a/include/hw/acpi/acpi-defs.h
> +++ b/include/hw/acpi/acpi-defs.h
> @@ -367,7 +367,9 @@ struct AcpiMadtGenericDistributor {
>      uint32_t gic_id;
>      uint64_t base_address;
>      uint32_t global_irq_base;
> -    uint32_t reserved2;
> +    /* ACPI 5.1 Errata 1228 Present GIC version in MADT table */
> +    uint8_t version;
> +    uint8_t reserved2[3];
>  } QEMU_PACKED;
>  
>  typedef struct AcpiMadtGenericDistributor AcpiMadtGenericDistributor;
> -- 
> 2.0.4

AFAICT, Linux is actually fine with version=0 (as before this patch).
One way or another it has already determined that the gic is either v3
or v4, and then just proceeds. That said, it does seem like the right
thing to do to set it

Reviewed-by: Andrew Jones <drjones@redhat.com>
