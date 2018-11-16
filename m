Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp563407wrw;
        Fri, 16 Nov 2018 08:08:20 -0800 (PST)
X-Google-Smtp-Source: AJdET5d3N28J5fKa+dvCZZLFAV6rBU2g0Bi2ZZloeh7KLLyGDLlOR3I7ccFV5jhyudbFZfsgM38i
X-Received: by 2002:ac8:160b:: with SMTP id p11mr10671102qtj.113.1542384500572;
        Fri, 16 Nov 2018 08:08:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542384500; cv=none;
        d=google.com; s=arc-20160816;
        b=bA8JsMS9DWTRkqoI/2F8NCDReXJseosMMuKU4mX4oZhsmh80yZKx5e5HdqBMVksHy+
         qPqfPY1rzPEuC2+04TfLTvV0ocjwGyuU4cMlTFRpeH4749QdRyIQ2ypksjW68WeMjL6b
         46ALMQMjVLn2vTeUC56AbmgKqcDYWKLW3YLAlHl9BfmiKLnA5YGz0UCw+vxpDboMywTy
         0i9ShMiH8HOXT4wlbZ7CLhTA2Qg3k6SgMOFhmIryb8uN718rmJhm6LiNX+p9fhRSqFqU
         KAv57GCaubheQFu5qnCMF3sn3abDzvcfaq2lHgpdtIIqyVejnSW0Dr7mBhTCjIuIfNmL
         Onyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=SDdyHa4NLvOcUzhk/kWiu4bzX2R4Ogt8WjLS9bdNkVk=;
        b=UVAv/tJ0ZRwZFwItsOwJdxEIVQD6Buxi4Wd9IWsrJiKPrk7X1PP5RpkgotGo9YogEm
         7+3s3PGWCxzAUfJuIusCWYBiaFDsrZODC5O3v2zaMKDVM52t7IUs8krVaDBR9M85Qec9
         58POJLBcLZ3YYmtR02/QJdQgVvz/kSjmdT9Zp4tAOurgp/ZZfylzUNr/t+CWTJIpAUkU
         lwWkChW6svq2dsuBhjPrHlD09suysquc6iXFA9o5uT1PrzGFxekkURR+hGoWPK9daylg
         vrKkhQzSnBfKWz4D7J34m9NbwXv4ODD3YSkGTtCJ5ABN2/Oj8wm3l6F+hZZItgeG6yX6
         C5BA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h21si2077289qtn.354.2018.11.16.08.08.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Nov 2018 08:08:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45514 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gNgfL-00061G-Ua
	for alex.bennee@linaro.org; Fri, 16 Nov 2018 11:08:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57648)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gNgZr-0001cr-9n
	for qemu-arm@nongnu.org; Fri, 16 Nov 2018 11:02:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gNgZp-0005AI-Hw
	for qemu-arm@nongnu.org; Fri, 16 Nov 2018 11:02:39 -0500
Received: from mx1.redhat.com ([209.132.183.28]:58836)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gNgZp-00055g-91; Fri, 16 Nov 2018 11:02:37 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5CA34882EA;
	Fri, 16 Nov 2018 16:02:33 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6AAF5101962A;
	Fri, 16 Nov 2018 16:02:28 +0000 (UTC)
Date: Fri, 16 Nov 2018 17:02:26 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Samuel Ortiz <sameo@linux.intel.com>
Message-ID: <20181116170226.35385388@redhat.com>
In-Reply-To: <20181105014047.26447-21-sameo@linux.intel.com>
References: <20181105014047.26447-1-sameo@linux.intel.com>
	<20181105014047.26447-21-sameo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Fri, 16 Nov 2018 16:02:33 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 20/24] hw: acpi: Define ACPI
 tables builder interface
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
X-TUID: dRZYzw4KrBr6

On Mon,  5 Nov 2018 02:40:43 +0100
Samuel Ortiz <sameo@linux.intel.com> wrote:

> In order to decouple ACPI APIs from specific machine types, we are
> creating an ACPI builder interface that each ACPI platform can choose to
> implement.
> This way, a new machine type can re-use the high level ACPI APIs and
> define some custom table build methods, without having to duplicate most
> of the existing implementation only to add small variations to it.
I'm not sure about motivation behind so high APIs,
what obvious here is an extra level of indirection for not clear gain.

Yep using table callbacks, one can attempt to generalize
acpi_setup() and help boards to decide which tables do not build
(MCFG comes to the mind). But I'm not convinced that acpi_setup()
could be cleanly generalized as a whole (probably some parts but
not everything) so it's minor benefit for extra headache of
figuring out what callback will be actually called when reading code.

However if board needs a slightly different table, it will have to
duplicate an exiting one and then modify to suit its needs.

to me it pretty much looks the same as calling build_foo()
we use now but with an extra indirection level and then
duplicating the later for usage in another board in slightly
different manner.

I agree with Paolo's suggestion to use interfaces for generalization,
however I'd suggest a fine grained approach for providing board/target
specific items/actions for generic tables.

For example take a look at AcpiDeviceIfClass interface that is
implemented by GPE devices and its madt_cpu() method. That should
simplify generalizing cpu hotplug for arm/virt and also help
to generalize build_madt(). It's not cleanest impl. by far but
headed in the right generic direction. I have it on my TODO list to
do list to generalize acpi parts of build_fadt()/cpu hotplug
some day as part of the project that adds cpu hotplug to arm/virt board.

GPE/GED device might be not ideal place to implement that interface
(worked for pc/q35) and may be we should move it to machine level
as board has access to much more data for building ACPI tables.
For i386/virt, I'd extend/modify AcpiDeviceIfClass when/where it's
necessary instead of adding high level table hooks.
That way generic build_foo() API's would share much more code.

> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
> ---
>  include/hw/acpi/builder.h | 100 ++++++++++++++++++++++++++++++++++++++
>  hw/acpi/builder.c         |  97 ++++++++++++++++++++++++++++++++++++
>  hw/acpi/Makefile.objs     |   1 +
>  3 files changed, 198 insertions(+)
>  create mode 100644 include/hw/acpi/builder.h
>  create mode 100644 hw/acpi/builder.c
>=20
> diff --git a/include/hw/acpi/builder.h b/include/hw/acpi/builder.h
> new file mode 100644
> index 0000000000..a63b88ffe9
> --- /dev/null
> +++ b/include/hw/acpi/builder.h
> @@ -0,0 +1,100 @@
> +/*
> + *
> + * Copyright (c) 2018 Intel Corporation
> + *
> + * This program is free software; you can redistribute it and/or modify =
it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2 or later, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License=
 for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License alo=
ng with
> + * this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#ifndef ACPI_BUILDER_H
> +#define ACPI_BUILDER_H
> +
> +#include "qemu/osdep.h"
> +#include "hw/acpi/bios-linker-loader.h"
> +#include "qom/object.h"
> +
> +#define TYPE_ACPI_BUILDER "acpi-builder"
> +
> +#define ACPI_BUILDER_METHODS(klass) \
> +     OBJECT_CLASS_CHECK(AcpiBuilderMethods, (klass), TYPE_ACPI_BUILDER)
> +#define ACPI_BUILDER_GET_METHODS(obj) \
> +     OBJECT_GET_CLASS(AcpiBuilderMethods, (obj), TYPE_ACPI_BUILDER)
> +#define ACPI_BUILDER(obj)                                       \
> +     INTERFACE_CHECK(AcpiBuilder, (obj), TYPE_ACPI_BUILDER)
> +
> +typedef struct AcpiConfiguration AcpiConfiguration;
> +typedef struct AcpiBuildState AcpiBuildState;
> +typedef struct AcpiMcfgInfo AcpiMcfgInfo;
> +
> +typedef struct AcpiBuilder {
> +    /* <private> */
> +    Object Parent;
> +} AcpiBuilder;
> +
> +/**
> + * AcpiBuildMethods:
> + *
> + * Interface to be implemented by a machine type that needs to provide
> + * custom ACPI tables build method.
> + *
> + * @parent: Opaque parent interface.
> + * @rsdp: ACPI RSDP (Root System Description Pointer) table build callba=
ck.
> + * @madt: ACPI MADT (Multiple APIC Description Table) table build callba=
ck.
> + * @mcfg: ACPI MCFG table build callback.
> + * @srat: ACPI SRAT (System/Static Resource Affinity Table)
> + *        table build callback.
> + * @slit: ACPI SLIT (System Locality System Information Table)
> + *        table build callback.
> + * @configuration: ACPI configuration getter.
> + *                 This is used to query the machine instance for its
> + *                 AcpiConfiguration pointer.
> + */
> +typedef struct AcpiBuilderMethods {
> +    /* <private> */
> +    InterfaceClass parent;
> +
> +    /* <public> */
> +    void (*rsdp)(GArray *table_data, BIOSLinker *linker,
> +                 unsigned rsdt_tbl_offset);
> +    void (*madt)(GArray *table_data, BIOSLinker *linker,
> +                 MachineState *ms, AcpiConfiguration *conf);
> +    void (*mcfg)(GArray *table_data, BIOSLinker *linker,
> +                 AcpiMcfgInfo *info);
> +    void (*srat)(GArray *table_data, BIOSLinker *linker,
> +                 MachineState *machine, AcpiConfiguration *conf);
> +    void (*slit)(GArray *table_data, BIOSLinker *linker);
> +
> +    AcpiConfiguration *(*configuration)(AcpiBuilder *builder);
> +} AcpiBuilderMethods;
> +
> +void acpi_builder_rsdp(AcpiBuilder *builder,
> +                       GArray *table_data, BIOSLinker *linker,
> +                       unsigned rsdt_tbl_offset);
> +
> +void acpi_builder_madt(AcpiBuilder *builder,
> +                       GArray *table_data, BIOSLinker *linker,
> +                       MachineState *ms, AcpiConfiguration *conf);
> +
> +void acpi_builder_mcfg(AcpiBuilder *builder,
> +                       GArray *table_data, BIOSLinker *linker,
> +                       AcpiMcfgInfo *info);
> +
> +void acpi_builder_srat(AcpiBuilder *builder,
> +                       GArray *table_data, BIOSLinker *linker,
> +                       MachineState *machine, AcpiConfiguration *conf);
> +
> +void acpi_builder_slit(AcpiBuilder *builder,
> +                       GArray *table_data, BIOSLinker *linker);
> +
> +AcpiConfiguration *acpi_builder_configuration(AcpiBuilder *builder);
> +
> +#endif
> diff --git a/hw/acpi/builder.c b/hw/acpi/builder.c
> new file mode 100644
> index 0000000000..c29a614793
> --- /dev/null
> +++ b/hw/acpi/builder.c
> @@ -0,0 +1,97 @@
> +/*
> + *
> + * Copyright (c) 2018 Intel Corporation
> + *
> + * This program is free software; you can redistribute it and/or modify =
it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2 or later, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License=
 for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License alo=
ng with
> + * this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/module.h"
> +#include "qom/object.h"
> +#include "hw/acpi/builder.h"
> +
> +void acpi_builder_rsdp(AcpiBuilder *builder,
> +                       GArray *table_data, BIOSLinker *linker,
> +                       unsigned rsdt_tbl_offset)
> +{
> +    AcpiBuilderMethods *abm =3D ACPI_BUILDER_GET_METHODS(builder);
> +
> +    if (abm && abm->rsdp) {
> +        abm->rsdp(table_data, linker, rsdt_tbl_offset);
> +    }
> +}
> +
> +void acpi_builder_madt(AcpiBuilder *builder,
> +                       GArray *table_data, BIOSLinker *linker,
> +                       MachineState *ms, AcpiConfiguration *conf)
> +{
> +    AcpiBuilderMethods *abm =3D ACPI_BUILDER_GET_METHODS(builder);
> +
> +    if (abm && abm->madt) {
> +        abm->madt(table_data, linker, ms, conf);
> +    }
> +}
> +
> +void acpi_builder_mcfg(AcpiBuilder *builder,
> +                       GArray *table_data, BIOSLinker *linker,
> +                       AcpiMcfgInfo *info)
> +{
> +    AcpiBuilderMethods *abm =3D ACPI_BUILDER_GET_METHODS(builder);
> +
> +    if (abm && abm->mcfg) {
> +        abm->mcfg(table_data, linker, info);
> +    }
> +}
> +
> +void acpi_builder_srat(AcpiBuilder *builder,
> +                       GArray *table_data, BIOSLinker *linker,
> +                       MachineState *machine, AcpiConfiguration *conf)
> +{
> +    AcpiBuilderMethods *abm =3D ACPI_BUILDER_GET_METHODS(builder);
> +
> +    if (abm && abm->srat) {
> +        abm->srat(table_data, linker, machine, conf);
> +    }
> +}
> +
> +void acpi_builder_slit(AcpiBuilder *builder,
> +                       GArray *table_data, BIOSLinker *linker)
> +{
> +    AcpiBuilderMethods *abm =3D ACPI_BUILDER_GET_METHODS(builder);
> +
> +    if (abm && abm->slit) {
> +        abm->slit(table_data, linker);
> +    }
> +}
> +
> +AcpiConfiguration *acpi_builder_configuration(AcpiBuilder *builder)
> +{
> +    AcpiBuilderMethods *abm =3D ACPI_BUILDER_GET_METHODS(builder);
> +    if (abm && abm->configuration) {
> +        return abm->configuration(builder);
> +    }
> +    return NULL;
> +}
> +
> +static const TypeInfo acpi_builder_info =3D {
> +    .name          =3D TYPE_ACPI_BUILDER,
> +    .parent        =3D TYPE_INTERFACE,
> +    .class_size    =3D sizeof(AcpiBuilderMethods),
> +};
> +
> +static void acpi_builder_register_type(void)
> +{
> +    type_register_static(&acpi_builder_info);
> +}
> +
> +type_init(acpi_builder_register_type)
> diff --git a/hw/acpi/Makefile.objs b/hw/acpi/Makefile.objs
> index 11c35bcb44..2f383adc6f 100644
> --- a/hw/acpi/Makefile.objs
> +++ b/hw/acpi/Makefile.objs
> @@ -11,6 +11,7 @@ common-obj-$(call lnot,$(CONFIG_ACPI_X86)) +=3D acpi-st=
ub.o
>  common-obj-y +=3D acpi_interface.o
>  common-obj-y +=3D bios-linker-loader.o
>  common-obj-y +=3D aml-build.o
> +common-obj-y +=3D builder.o
> =20
>  common-obj-$(CONFIG_IPMI) +=3D ipmi.o
>  common-obj-$(call lnot,$(CONFIG_IPMI)) +=3D ipmi-stub.o

