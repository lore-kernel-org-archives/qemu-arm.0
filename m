Received: by 10.103.86.15 with SMTP id k15csp803375vsb;
        Thu, 15 Dec 2016 08:25:27 -0800 (PST)
X-Received: by 10.200.57.54 with SMTP id s51mr1570267qtb.68.1481819127016;
        Thu, 15 Dec 2016 08:25:27 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id s63si1228707qkh.26.2016.12.15.08.25.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 15 Dec 2016 08:25:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55591 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cHYqS-000148-Ht
	for alex.bennee@linaro.org; Thu, 15 Dec 2016 11:25:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60607)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1cHYqG-0000aq-OG
	for qemu-arm@nongnu.org; Thu, 15 Dec 2016 11:25:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1cHYqC-0002SG-RM
	for qemu-arm@nongnu.org; Thu, 15 Dec 2016 11:25:12 -0500
Received: from mx1.redhat.com ([209.132.183.28]:52942)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1cHYqC-0002QU-L0; Thu, 15 Dec 2016 11:25:08 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CA55767EB0;
	Thu, 15 Dec 2016 16:25:07 +0000 (UTC)
Received: from kamzik.brq.redhat.com (kamzik.brq.redhat.com [10.34.1.143])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uBFGP4Xe001993
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 15 Dec 2016 11:25:06 -0500
Date: Thu, 15 Dec 2016 17:25:03 +0100
From: Andrew Jones <drjones@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20161215162503.35p4px2laz3gkkzg@kamzik.brq.redhat.com>
References: <20161213214522.25548-1-drjones@redhat.com>
	<20161213214522.25548-10-drjones@redhat.com>
	<20161215160822.79151aec@nial.brq.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20161215160822.79151aec@nial.brq.redhat.com>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Thu, 15 Dec 2016 16:25:07 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH 09/11] hw/arm/virt-acpi-build: don't save
 VirtGuestInfo on AcpiBuildState
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, zhaoshenglong@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5PO1zjhP+Thr

On Thu, Dec 15, 2016 at 04:08:22PM +0100, Igor Mammedov wrote:
> On Tue, 13 Dec 2016 22:45:20 +0100
> Andrew Jones <drjones@redhat.com> wrote:
> 
> > We can get to VirtMachineState without the need for saving a pointer
> > on AcpiBuildState. This is the mach-virt equivalent to "acpi: Don't save
> > PcGuestInfo on AcpiBuildState"
> > 
> > Signed-off-by: Andrew Jones <drjones@redhat.com>
> > ---
> >  hw/arm/virt-acpi-build.c | 7 +++----
> >  1 file changed, 3 insertions(+), 4 deletions(-)
> > 
> > diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> > index 7a1efd0dc538..137781646bec 100644
> > --- a/hw/arm/virt-acpi-build.c
> > +++ b/hw/arm/virt-acpi-build.c
> > @@ -706,7 +706,6 @@ struct AcpiBuildState {
> >      MemoryRegion *linker_mr;
> >      /* Is table patched? */
> >      bool patched;
> > -    VirtGuestInfo *guest_info;
> >  } AcpiBuildState;
> >  
> >  static
> > @@ -779,6 +778,8 @@ static void acpi_ram_update(MemoryRegion *mr, GArray *data)
> >  
> >  static void virt_acpi_build_update(void *build_opaque)
> >  {
> > +    MachineState *machine = MACHINE(qdev_get_machine());
> > +    VirtMachineState *vms = VIRT_MACHINE(machine);
> >      AcpiBuildState *build_state = build_opaque;
> >      AcpiBuildTables tables;
> >  
> > @@ -790,8 +791,7 @@ static void virt_acpi_build_update(void *build_opaque)
> >  
> >      acpi_build_tables_init(&tables);
> >  
> > -    virt_acpi_build(container_of(build_state->guest_info,
> > -                                 VirtMachineState, acpi_guest_info), &tables);
> > +    virt_acpi_build(vms, &tables);
> 
> virt_acpi_build(VIRT_MACHINE(qdev_get_machine()), &tables);
> 
> or even better do it inside of virt_acpi_build(&tables);

Sounds good.

Thanks,
drew

> 
> 
> >  
> >      acpi_ram_update(build_state->table_mr, tables.table_data);
> >      acpi_ram_update(build_state->rsdp_mr, tables.rsdp);
> > @@ -841,7 +841,6 @@ void virt_acpi_setup(VirtMachineState *vms)
> >      }
> >  
> >      build_state = g_malloc0(sizeof *build_state);
> > -    build_state->guest_info = guest_info;
> >  
> >      acpi_build_tables_init(&tables);
> >      virt_acpi_build(vms, &tables);
> 
