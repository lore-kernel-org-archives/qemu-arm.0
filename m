Received: by 10.80.166.35 with SMTP id d32csp67402edc;
        Mon, 10 Oct 2016 11:54:55 -0700 (PDT)
X-Received: by 10.200.57.98 with SMTP id t31mr31549159qtb.80.1476125695544;
        Mon, 10 Oct 2016 11:54:55 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 128si15016942qkd.320.2016.10.10.11.54.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 10 Oct 2016 11:54:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52036 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1btfix-0002X7-22
	for alex.bennee@linaro.org; Mon, 10 Oct 2016 14:54:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39799)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1btfis-0002X1-GR
	for qemu-arm@nongnu.org; Mon, 10 Oct 2016 14:54:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1btfin-00024w-IS
	for qemu-arm@nongnu.org; Mon, 10 Oct 2016 14:54:50 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40496)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>)
	id 1btfin-00024a-BY; Mon, 10 Oct 2016 14:54:45 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 30028E072C;
	Mon, 10 Oct 2016 18:54:44 +0000 (UTC)
Received: from localhost.localdomain (vpn1-7-214.ams2.redhat.com [10.36.7.214])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9AIsdo7018259
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 10 Oct 2016 14:54:41 -0400
To: Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
References: <1476117341-32690-1-git-send-email-drjones@redhat.com>
	<1476117341-32690-2-git-send-email-drjones@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <fc59251d-fde9-851f-94b0-56cf39962b9c@redhat.com>
Date: Mon, 10 Oct 2016 20:54:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <1476117341-32690-2-git-send-email-drjones@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Mon, 10 Oct 2016 18:54:44 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/2] hw/arm/virt-acpi-build: fix
 MADT generation
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0TtFeroc5/13

Hi Drew,
On 10/10/2016 18:35, Andrew Jones wrote:
> We can't return early from build_* functions, as build_header is
> only called at the end.
> 
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  hw/arm/virt-acpi-build.c | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 7b39b1d2d676..c31349561c95 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -556,15 +556,13 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtGuestInfo *guest_info)
>          gicr->base_address = cpu_to_le64(memmap[VIRT_GIC_REDIST].base);
>          gicr->range_length = cpu_to_le32(memmap[VIRT_GIC_REDIST].size);
>  
> -        if (!its_class_name()) {
> -            return;
> +        if (its_class_name()) {
> +            gic_its = acpi_data_push(table_data, sizeof *gic_its);
> +            gic_its->type = ACPI_APIC_GENERIC_TRANSLATOR;
> +            gic_its->length = sizeof(*gic_its);
> +            gic_its->translation_id = 0;
> +            gic_its->base_address = cpu_to_le64(memmap[VIRT_GIC_ITS].base);
>          }
> -
> -        gic_its = acpi_data_push(table_data, sizeof *gic_its);
> -        gic_its->type = ACPI_APIC_GENERIC_TRANSLATOR;
> -        gic_its->length = sizeof(*gic_its);
> -        gic_its->translation_id = 0;
> -        gic_its->base_address = cpu_to_le64(memmap[VIRT_GIC_ITS].base);
>      } else {
>          gic_msi = acpi_data_push(table_data, sizeof *gic_msi);
>          gic_msi->type = ACPI_APIC_GENERIC_MSI_FRAME;
> 
Thanks for spotting the issue

Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
