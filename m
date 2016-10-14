Received: by 10.80.166.35 with SMTP id d32csp258711edc;
        Fri, 14 Oct 2016 05:41:44 -0700 (PDT)
X-Received: by 10.200.52.151 with SMTP id w23mr12392942qtb.115.1476448904452;
        Fri, 14 Oct 2016 05:41:44 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 134si9584677qkl.51.2016.10.14.05.41.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 14 Oct 2016 05:41:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47120 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bv1nz-0007mt-W6
	for alex.bennee@linaro.org; Fri, 14 Oct 2016 08:41:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40792)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1bv1nv-0007mQ-QM
	for qemu-arm@nongnu.org; Fri, 14 Oct 2016 08:41:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1bv1nq-0005d3-J5
	for qemu-arm@nongnu.org; Fri, 14 Oct 2016 08:41:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46182)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1bv1nq-0005cq-Bt; Fri, 14 Oct 2016 08:41:34 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7AC9AC05A283;
	Fri, 14 Oct 2016 12:41:32 +0000 (UTC)
Received: from nial.brq.redhat.com (dhcp-1-118.brq.redhat.com [10.34.1.118])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9ECfTnZ002565; Fri, 14 Oct 2016 08:41:30 -0400
Date: Fri, 14 Oct 2016 14:41:29 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Message-ID: <20161014144129.7826bfc8@nial.brq.redhat.com>
In-Reply-To: <1476435295-21885-3-git-send-email-eric.auger@redhat.com>
References: <1476435295-21885-1-git-send-email-eric.auger@redhat.com>
	<1476435295-21885-3-git-send-email-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Fri, 14 Oct 2016 12:41:33 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 2/2] ARM: Virt: ACPI: Build
 an IORT table with RC and ITS nodes
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, tn@semihalf.com,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	shannon.zhao@linaro.org, prem.mallappa@broadcom.com,
	christoffer.dall@linaro.org, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Z/9zulBafGEK

On Fri, 14 Oct 2016 10:54:55 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> From: Prem Mallappa <prem.mallappa@broadcom.com>
> 
> This patch builds an IORT table that features a root complex node and
> an ITS node. This complements the ITS description in the ACPI MADT
> table and allows vhost-net on ACPI guest.
> 
> Signed-off-by: Prem Mallappa <prem.mallappa@broadcom.com>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> 
> ---
> 
> v1 -> v2:
> - its_class_name() || !guest_info->no_its now wraps acpi_add_table
>   and build_iort
> - add cpu_to_le*
> - CCA = CPM = DACS = 1
> - cleanup according to Drew's comments
> - remove comments listing tables and spec revisions
> ---
>  hw/arm/virt-acpi-build.c | 73 ++++++++++++++++++++++++++++++++++++++++--------
>  1 file changed, 62 insertions(+), 11 deletions(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index fa0655a..5fc0fd7 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
[...]

> +static void
>  build_spcr(GArray *table_data, BIOSLinker *linker, VirtGuestInfo *guest_info)
>  {
>      AcpiSerialPortConsoleRedirection *spcr;
> @@ -667,17 +724,6 @@ void virt_acpi_build(VirtGuestInfo *guest_info, AcpiBuildTables *tables)
>                               ACPI_BUILD_TABLE_FILE, tables_blob,
>                               64, false /* high memory */);
>  
> -    /*
> -     * The ACPI v5.1 tables for Hardware-reduced ACPI platform are:
> -     * RSDP
> -     * RSDT
> -     * FADT
> -     * GTDT
> -     * MADT
> -     * MCFG
> -     * DSDT
> -     */
deleting unrelated hunk?

> -
>      /* DSDT is pointed to by FADT */
>      dsdt = tables_blob->len;
>      build_dsdt(tables_blob, tables->linker, guest_info);
> @@ -703,6 +749,11 @@ void virt_acpi_build(VirtGuestInfo *guest_info, AcpiBuildTables *tables)
>          build_srat(tables_blob, tables->linker, guest_info);
>      }
>  
> +    if (its_class_name() && !guest_info->no_its) {
> +        acpi_add_table(table_offsets, tables_blob);
> +        build_iort(tables_blob, tables->linker, guest_info);
> +    }
> +
>      /* RSDT is pointed to by RSDP */
>      rsdt = tables_blob->len;
>      build_rsdt(tables_blob, tables->linker, table_offsets, NULL, NULL);

