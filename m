Received: by 10.103.86.15 with SMTP id k15csp762867vsb;
        Thu, 15 Dec 2016 07:09:46 -0800 (PST)
X-Received: by 10.55.101.151 with SMTP id z145mr1454575qkb.35.1481814586573;
        Thu, 15 Dec 2016 07:09:46 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id i203si1169729qke.67.2016.12.15.07.09.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 15 Dec 2016 07:09:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55152 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cHXfD-0007uM-Kg
	for alex.bennee@linaro.org; Thu, 15 Dec 2016 10:09:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38872)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1cHXe8-0007nA-T4
	for qemu-devel@nongnu.org; Thu, 15 Dec 2016 10:08:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1cHXe8-0007D0-1t
	for qemu-devel@nongnu.org; Thu, 15 Dec 2016 10:08:36 -0500
Received: from mx1.redhat.com ([209.132.183.28]:54796)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1cHXdy-00079P-Ny; Thu, 15 Dec 2016 10:08:26 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F31C38DF03;
	Thu, 15 Dec 2016 15:08:25 +0000 (UTC)
Received: from nial.brq.redhat.com (dhcp-1-118.brq.redhat.com [10.34.1.118])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uBFF8Ne4020443; Thu, 15 Dec 2016 10:08:24 -0500
Date: Thu, 15 Dec 2016 16:08:22 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Andrew Jones <drjones@redhat.com>
Message-ID: <20161215160822.79151aec@nial.brq.redhat.com>
In-Reply-To: <20161213214522.25548-10-drjones@redhat.com>
References: <20161213214522.25548-1-drjones@redhat.com>
	<20161213214522.25548-10-drjones@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Thu, 15 Dec 2016 15:08:26 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 09/11] hw/arm/virt-acpi-build: don't save
 VirtGuestInfo on AcpiBuildState
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, zhaoshenglong@huawei.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: R/FNIzNyx1pN

On Tue, 13 Dec 2016 22:45:20 +0100
Andrew Jones <drjones@redhat.com> wrote:

> We can get to VirtMachineState without the need for saving a pointer
> on AcpiBuildState. This is the mach-virt equivalent to "acpi: Don't save
> PcGuestInfo on AcpiBuildState"
> 
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  hw/arm/virt-acpi-build.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 7a1efd0dc538..137781646bec 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -706,7 +706,6 @@ struct AcpiBuildState {
>      MemoryRegion *linker_mr;
>      /* Is table patched? */
>      bool patched;
> -    VirtGuestInfo *guest_info;
>  } AcpiBuildState;
>  
>  static
> @@ -779,6 +778,8 @@ static void acpi_ram_update(MemoryRegion *mr, GArray *data)
>  
>  static void virt_acpi_build_update(void *build_opaque)
>  {
> +    MachineState *machine = MACHINE(qdev_get_machine());
> +    VirtMachineState *vms = VIRT_MACHINE(machine);
>      AcpiBuildState *build_state = build_opaque;
>      AcpiBuildTables tables;
>  
> @@ -790,8 +791,7 @@ static void virt_acpi_build_update(void *build_opaque)
>  
>      acpi_build_tables_init(&tables);
>  
> -    virt_acpi_build(container_of(build_state->guest_info,
> -                                 VirtMachineState, acpi_guest_info), &tables);
> +    virt_acpi_build(vms, &tables);

virt_acpi_build(VIRT_MACHINE(qdev_get_machine()), &tables);

or even better do it inside of virt_acpi_build(&tables);


>  
>      acpi_ram_update(build_state->table_mr, tables.table_data);
>      acpi_ram_update(build_state->rsdp_mr, tables.rsdp);
> @@ -841,7 +841,6 @@ void virt_acpi_setup(VirtMachineState *vms)
>      }
>  
>      build_state = g_malloc0(sizeof *build_state);
> -    build_state->guest_info = guest_info;
>  
>      acpi_build_tables_init(&tables);
>      virt_acpi_build(vms, &tables);

