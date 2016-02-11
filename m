Received: by 10.25.159.19 with SMTP id i19csp272414lfe;
        Thu, 11 Feb 2016 07:20:34 -0800 (PST)
X-Received: by 10.140.152.78 with SMTP id 75mr45341787qhy.22.1455204034372;
        Thu, 11 Feb 2016 07:20:34 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z205si10013092qhc.12.2016.02.11.07.20.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Feb 2016 07:20:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50930 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aTt2n-0006OV-Ot
	for alex.bennee@linaro.org; Thu, 11 Feb 2016 10:20:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52959)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1aTt2O-0005iS-J0
	for qemu-arm@nongnu.org; Thu, 11 Feb 2016 10:20:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1aTt2L-0005hf-Cr
	for qemu-arm@nongnu.org; Thu, 11 Feb 2016 10:20:08 -0500
Received: from mx1.redhat.com ([209.132.183.28]:51406)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1aTt2L-0005hH-8O; Thu, 11 Feb 2016 10:20:05 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id C6BC48F28D;
	Thu, 11 Feb 2016 15:20:04 +0000 (UTC)
Received: from nial.brq.redhat.com (dhcp-1-118.brq.redhat.com [10.34.1.118])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u1BFK0wP021212; Thu, 11 Feb 2016 10:20:01 -0500
Date: Thu, 11 Feb 2016 16:19:59 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: "Gabriel L. Somlo" <somlo@cmu.edu>
Message-ID: <20160211161959.7d939e7e@nial.brq.redhat.com>
In-Reply-To: <1455136900-22334-4-git-send-email-somlo@cmu.edu>
References: <1455136900-22334-1-git-send-email-somlo@cmu.edu>
	<1455136900-22334-4-git-send-email-somlo@cmu.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
	matt@codeblueprint.co.uk, stefanha@gmail.com,
	ard.biesheuvel@linaro.org, qemu-devel@nongnu.org,
	leif.lindholm@linaro.org, luto@amacapital.net,
	qemu-arm@nongnu.org, kraxel@redhat.com, pbonzini@redhat.com,
	lersek@redhat.com, rth@twiddle.net
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v7 3/5] acpi: pc: add fw_cfg
 device node to ssdt
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: qVCLX823pFA5

On Wed, 10 Feb 2016 15:41:38 -0500
"Gabriel L. Somlo" <somlo@cmu.edu> wrote:

> Add a fw_cfg device node to the ACPI SSDT. While the guest-side
> firmware can't utilize this information (since it has to access
> the hard-coded fw_cfg device to extract ACPI tables to begin with),
> having fw_cfg listed in ACPI will help the guest kernel keep a more
> accurate inventory of in-use IO port regions.
subj and commit msg:
s/SSDT/DSDT/

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
Will that unconditionally make all Windows guests ask for driver for unknow=
n device?


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
> +
> +        /* device present, functioning, decoding, not shown in UI */
> +        aml_append(dev, aml_name_decl("_STA", aml_int(0xB)));
> +
> +        crs =3D aml_resource_template();
> +        aml_append(crs,
> +            aml_io(AML_DECODE16, FW_CFG_IO_BASE, FW_CFG_IO_BASE, 0x01, i=
o_size)
> +        );
> +        aml_append(dev, aml_name_decl("_CRS", crs));
> +
> +        aml_append(scope, dev);
> +        aml_append(dsdt, scope);
> +    }
> +
>      if (misc->applesmc_io_base) {
>          scope =3D aml_scope("\\_SB.PCI0.ISA");
>          dev =3D aml_device("SMC");

