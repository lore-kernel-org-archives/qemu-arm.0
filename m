Received: by 10.25.208.211 with SMTP id h202csp1166900lfg;
        Fri, 19 Feb 2016 05:51:18 -0800 (PST)
X-Received: by 10.140.102.11 with SMTP id v11mr15974903qge.39.1455889878446;
        Fri, 19 Feb 2016 05:51:18 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o206si14401924qho.27.2016.02.19.05.51.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 Feb 2016 05:51:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52478 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aWlSo-0006UH-05
	for alex.bennee@linaro.org; Fri, 19 Feb 2016 08:51:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33469)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1aWlRh-00053S-QD
	for qemu-devel@nongnu.org; Fri, 19 Feb 2016 08:50:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1aWlRd-0005yx-KH
	for qemu-devel@nongnu.org; Fri, 19 Feb 2016 08:50:09 -0500
Received: from mx1.redhat.com ([209.132.183.28]:58053)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1aWlRX-0005vq-Vk; Fri, 19 Feb 2016 08:50:00 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id 4D886552E7;
	Fri, 19 Feb 2016 13:49:59 +0000 (UTC)
Received: from nial.brq.redhat.com (dhcp-1-118.brq.redhat.com [10.34.1.118])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u1JDntEd003723; Fri, 19 Feb 2016 08:49:56 -0500
Date: Fri, 19 Feb 2016 14:49:53 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: "Gabriel L. Somlo" <somlo@cmu.edu>
Message-ID: <20160219144953.03aff7eb@nial.brq.redhat.com>
In-Reply-To: <1455228365-13666-4-git-send-email-somlo@cmu.edu>
References: <1455228365-13666-1-git-send-email-somlo@cmu.edu>
	<1455228365-13666-4-git-send-email-somlo@cmu.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
	matt@codeblueprint.co.uk, stefanha@gmail.com,
	ard.biesheuvel@linaro.org, qemu-devel@nongnu.org,
	leif.lindholm@linaro.org, luto@amacapital.net,
	qemu-arm@nongnu.org, kraxel@redhat.com, pbonzini@redhat.com,
	lersek@redhat.com, rth@twiddle.net
Subject: Re: [Qemu-devel] [PATCH v8 3/5] acpi: pc: add fw_cfg device node to
 dsdt
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: G7nlecVi3mEI

On Thu, 11 Feb 2016 17:06:03 -0500
"Gabriel L. Somlo" <somlo@cmu.edu> wrote:

> Add a fw_cfg device node to the ACPI DSDT. While the guest-side
> firmware can't utilize this information (since it has to access
> the hard-coded fw_cfg device to extract ACPI tables to begin with),
> having fw_cfg listed in ACPI will help the guest kernel keep a more
> accurate inventory of in-use IO port regions.
>=20
> Signed-off-by: Gabriel Somlo <somlo@cmu.edu>
> Reviewed-by: Laszlo Ersek <lersek@redhat.com>
> Reviewed-by: Marc Mar=C3=AD <markmb@redhat.com>
> ---
>  hw/i386/acpi-build.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>=20
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 4554eb8..4762fd2 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -2190,6 +2190,35 @@ build_dsdt(GArray *table_data, GArray *linker,
>      aml_append(scope, aml_name_decl("_S5", pkg));
>      aml_append(dsdt, scope);
> =20
> +    /* create fw_cfg node, unconditionally */
> +    {
> +        /* when using port i/o, the 8-bit data register *always* overlaps
> +         * with half of the 16-bit control register. Hence, the total si=
ze
> +         * of the i/o region used is FW_CFG_CTL_SIZE; when using DMA, the
> +         * DMA control register is located at FW_CFG_DMA_IO_BASE + 4 */
> +        uint8_t io_size =3D object_property_get_bool(OBJECT(pcms->fw_cfg=
),
> +                                                   "dma_enabled", NULL) ?
> +                          ROUND_UP(FW_CFG_CTL_SIZE, 4) + sizeof(dma_addr=
_t) :
> +                          FW_CFG_CTL_SIZE;
> +
> +        scope =3D aml_scope("\\_SB");
> +        dev =3D aml_device("FWCF");
> +
> +        aml_append(dev, aml_name_decl("_HID", aml_string("QEMU0002")));
=46rom my tests with different Windows versions, it doesn't prevent
WS2003 and WS2008 from showing a prompt for unknown device that asks for a =
driver.

One however could shut it up by allowing OS look for a driver
which is not found and then tell  not to ask for it anymore.

So existing users will have to perform this action once
they have migrated to newer QEMU regardless of machine version.

> +
> +        /* device present, functioning, decoding, not shown in UI */
> +        aml_append(dev, aml_name_decl("_STA", aml_int(0xB)));
> +
> +        crs =3D aml_resource_template();
> +        aml_append(crs,
> +            aml_io(AML_DECODE16, FW_CFG_IO_BASE, FW_CFG_IO_BASE, 0x01, i=
o_size)
> +        );
that creates \_SB.FWCF._CRS=20
+            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Set=
tings
+            {
+                IO (Decode16,
+                    0x0510,             // Range Minimum
+                    0x0510,             // Range Maximum
+                    0x01,               // Alignment
+                    0x0C,               // Length
+                    )
+            })

which collides with \_SB.PCI0._CRS
            WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, Entire=
Range,
                0x0000,             // Granularity
                0x0000,             // Range Minimum
                0x0CF7,             // Range Maximum
                0x0000,             // Translation Offset
                0x0CF8,

that shouldn't happen, and solution for this is to put
FWCF device descriptor in \_SB.PCI0 scope so FWCF would consume
from PCI0 IO range.

That won't help Windows to notice a conflict, if there is any,
as there aren't any drivers for QEMU0002 device but at least
when Windows gets a driver it won't crash due above conflict.

> +        aml_append(dev, aml_name_decl("_CRS", crs));
> +
> +        aml_append(scope, dev);
> +        aml_append(dsdt, scope);
> +    }
> +
>      if (misc->applesmc_io_base) {
>          scope =3D aml_scope("\\_SB.PCI0.ISA");
>          dev =3D aml_device("SMC");

