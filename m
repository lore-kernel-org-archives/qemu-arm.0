Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp6954426wrw;
        Thu, 15 Nov 2018 04:37:26 -0800 (PST)
X-Google-Smtp-Source: AJdET5cwA9pen480BNvylxJXwbMO9DbdEvx9MpbgdREwFP+sCXRpbukx5+C7RsUeu5KiMtCUZXCD
X-Received: by 2002:ac8:4611:: with SMTP id p17mr5842224qtn.263.1542285446667;
        Thu, 15 Nov 2018 04:37:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542285446; cv=none;
        d=google.com; s=arc-20160816;
        b=o6WCM0HQFatGyqSq7+IRmtDUWAeLN51+Ar+OSG6XCBJ/qFx+lUktuXS3lIuIXJXmGe
         MNiqTPKOK183YUk5RBz3mYs7d31u8JBi+oolI2TPVw0TChdxEa4dmhzrf0f3JIV6yagx
         MiqVGAi8U4/K/fE07dnAd69mWtwrYVGqEKkk3RQ0nqKIFZj+IkKuo4gu2Oy491byQoVb
         WhCUD+oI8KVhk8iY90sDdKSHAiUOZJs9gpU7jvE+nTW3BT4vaFaBJbpoNJaHrRUvq9WX
         leAsh5rJ+BQomupWwcQzONFSnaU1TXKi9smVMftmkvSYvysMvOVQbdlni3wy2tGaQ/gI
         FWTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=lNY/SdxT2O9hhqsMF2dzEtFJEXpKk8KvfbwtKDIpsTY=;
        b=gBgbOvGxcPyN4LBmZvs63yMlhlHUKSjRiib9gtvnnaFm4oCzYey89KWrsmfmVIoPVO
         zYY12+Z/z05VsDI8qJYl0ZfwvuAAZiOY/j+YbH9M9S/Cu7O6KMUZO3EjVhKu8zgriezI
         y9oUCTLU04ERecK/dUtf0g4U1DRQ4hvCLPNp1F5gRJC0sjxIeZ2ac73etGpqBSYUPNje
         9NCpFTomGJYYyzyvAJmW7TUHtow1fQRGQjhz2R4627TcQD9t8Bwln5FNu8TfwXN3itld
         bxWjyCD+E5LK9E7llIl/nmLUV+gOmfGzzg2gHeF8cxE5OWqBbVVVrZfroCYNlveKalCH
         VgLw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m23si5298597qtn.236.2018.11.15.04.37.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 15 Nov 2018 04:37:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38418 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gNGti-00084E-0z
	for alex.bennee@linaro.org; Thu, 15 Nov 2018 07:37:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57591)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gNGtU-00082E-4R
	for qemu-arm@nongnu.org; Thu, 15 Nov 2018 07:37:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gNGtQ-0007pk-Qc
	for qemu-arm@nongnu.org; Thu, 15 Nov 2018 07:37:12 -0500
Received: from mx1.redhat.com ([209.132.183.28]:50544)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gNGtQ-0007p6-I5; Thu, 15 Nov 2018 07:37:08 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8B238308AA0F;
	Thu, 15 Nov 2018 12:37:06 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3D6765D9D1;
	Thu, 15 Nov 2018 12:37:00 +0000 (UTC)
Date: Thu, 15 Nov 2018 13:36:58 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Samuel Ortiz <sameo@linux.intel.com>
Message-ID: <20181115133658.2cdbd918@redhat.com>
In-Reply-To: <20181105014047.26447-13-sameo@linux.intel.com>
References: <20181105014047.26447-1-sameo@linux.intel.com>
	<20181105014047.26447-13-sameo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Thu, 15 Nov 2018 12:37:06 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v5 12/24] hw: acpi: Export the MCFG getter
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
Cc: Yang Zhong <yang.zhong@intel.com>, Peter Maydell <peter.maydell@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
	Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GMCLZUPJ+00C

On Mon,  5 Nov 2018 02:40:35 +0100
Samuel Ortiz <sameo@linux.intel.com> wrote:

> From: Yang Zhong <yang.zhong@intel.com>
>=20
> The ACPI MCFG getter is not x86 specific and could be called from
> anywhere within generic ACPI API, so let's export it.
So far it's x86 or more exactly q35 specific thing,
for example it won't work with arm/virt without refactoring
the later.

We probably over-engineered it and could get by without
properties here at all, but that's not related to this series.

So for now I'd suggest to move it to x86/acpi-pci.c for now
and we can generalize the way we get address/size later,
but if you feel like replacing all this property complications
and making it simpler go ahead.


=20
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Signed-off-by: Yang Zhong <yang.zhong@intel.com>
> ---
>  include/hw/acpi/aml-build.h |  1 +
>  hw/acpi/aml-build.c         | 24 ++++++++++++++++++++++++
>  hw/i386/acpi-build.c        | 22 ----------------------
>  3 files changed, 25 insertions(+), 22 deletions(-)
>=20
> diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
> index 1861e37ebf..64ea371656 100644
> --- a/include/hw/acpi/aml-build.h
> +++ b/include/hw/acpi/aml-build.h
> @@ -408,6 +408,7 @@ void *acpi_data_push(GArray *table_data, unsigned siz=
e);
>  unsigned acpi_data_len(GArray *table);
>  Object *acpi_get_pci_host(void);
>  void acpi_get_pci_holes(Range *hole, Range *hole64);
> +bool acpi_get_mcfg(AcpiMcfgInfo *mcfg);
>  /* Align AML blob size to a multiple of 'align' */
>  void acpi_align_size(GArray *blob, unsigned align);
>  void acpi_add_table(GArray *table_offsets, GArray *table_data);
> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> index 869ed70db3..2c5446ab23 100644
> --- a/hw/acpi/aml-build.c
> +++ b/hw/acpi/aml-build.c
> @@ -32,6 +32,8 @@
>  #include "hw/i386/pc.h"
>  #include "sysemu/tpm.h"
>  #include "hw/acpi/tpm.h"
> +#include "qom/qom-qobject.h"
> +#include "qapi/qmp/qnum.h"
> =20
>  #define PCI_HOST_BRIDGE_CONFIG_ADDR        0xcf8
>  #define PCI_HOST_BRIDGE_IO_0_MIN_ADDR      0x0000
> @@ -1657,6 +1659,28 @@ void acpi_get_pci_holes(Range *hole, Range *hole64)
>                                                 NULL));
>  }
> =20
> +bool acpi_get_mcfg(AcpiMcfgInfo *mcfg)
> +{
> +    Object *pci_host;
> +    QObject *o;
> +
> +    pci_host =3D acpi_get_pci_host();

it would be better to get bus from struct AcpiPciBus
instead of doing lookup again. (that's a separate patch from moving functio=
n around)

> +    g_assert(pci_host);
> +
> +    o =3D object_property_get_qobject(pci_host, PCIE_HOST_MCFG_BASE, NUL=
L);
> +    if (!o) {
> +        return false;
> +    }
> +    mcfg->mcfg_base =3D qnum_get_uint(qobject_to(QNum, o));
> +    qobject_unref(o);
> +
> +    o =3D object_property_get_qobject(pci_host, PCIE_HOST_MCFG_SIZE, NUL=
L);
> +    assert(o);
> +    mcfg->mcfg_size =3D qnum_get_uint(qobject_to(QNum, o));
> +    qobject_unref(o);
> +    return true;
> +}
> +
>  static void crs_range_insert(GPtrArray *ranges, uint64_t base, uint64_t =
limit)
>  {
>      CrsRangeEntry *entry;
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 14e2624d14..d8bba16776 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -1856,28 +1856,6 @@ build_amd_iommu(GArray *table_data, BIOSLinker *li=
nker)
>                   "IVRS", table_data->len - iommu_start, 1, NULL, NULL);
>  }
> =20
> -static bool acpi_get_mcfg(AcpiMcfgInfo *mcfg)
> -{
> -    Object *pci_host;
> -    QObject *o;
> -
> -    pci_host =3D acpi_get_pci_host();
> -    g_assert(pci_host);
> -
> -    o =3D object_property_get_qobject(pci_host, PCIE_HOST_MCFG_BASE, NUL=
L);
> -    if (!o) {
> -        return false;
> -    }
> -    mcfg->mcfg_base =3D qnum_get_uint(qobject_to(QNum, o));
> -    qobject_unref(o);
> -
> -    o =3D object_property_get_qobject(pci_host, PCIE_HOST_MCFG_SIZE, NUL=
L);
> -    assert(o);
> -    mcfg->mcfg_size =3D qnum_get_uint(qobject_to(QNum, o));
> -    qobject_unref(o);
> -    return true;
> -}
> -
>  static
>  void acpi_build(AcpiBuildTables *tables,
>                  MachineState *machine, AcpiConfiguration *acpi_conf)

