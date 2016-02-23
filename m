Received: by 10.25.208.211 with SMTP id h202csp1629435lfg;
        Tue, 23 Feb 2016 01:51:27 -0800 (PST)
X-Received: by 10.140.97.202 with SMTP id m68mr39919560qge.102.1456221087702;
        Tue, 23 Feb 2016 01:51:27 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l66si22261465qgd.128.2016.02.23.01.51.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Feb 2016 01:51:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55346 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aY9cs-0003yN-Uz
	for alex.bennee@linaro.org; Tue, 23 Feb 2016 04:51:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34732)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1aY9cr-0003y7-02
	for qemu-arm@nongnu.org; Tue, 23 Feb 2016 04:51:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1aY9cm-0000qJ-ON
	for qemu-arm@nongnu.org; Tue, 23 Feb 2016 04:51:24 -0500
Received: from mx1.redhat.com ([209.132.183.28]:46559)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>)
	id 1aY9cm-0000q1-Ia; Tue, 23 Feb 2016 04:51:20 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id D1722BBB50;
	Tue, 23 Feb 2016 09:51:19 +0000 (UTC)
Received: from redhat.com (vpn1-6-142.ams2.redhat.com [10.36.6.142])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u1N9pFE8026692; Tue, 23 Feb 2016 04:51:15 -0500
Date: Tue, 23 Feb 2016 11:51:14 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Gabriel L. Somlo" <somlo@cmu.edu>
Message-ID: <20160223115107-mutt-send-email-mst@redhat.com>
References: <1455906029-25565-1-git-send-email-somlo@cmu.edu>
	<1455906029-25565-4-git-send-email-somlo@cmu.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <1455906029-25565-4-git-send-email-somlo@cmu.edu>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, ard.biesheuvel@linaro.org,
	matt@codeblueprint.co.uk, stefanha@gmail.com,
	qemu-devel@nongnu.org, leif.lindholm@linaro.org,
	luto@amacapital.net, qemu-arm@nongnu.org, kraxel@redhat.com,
	pbonzini@redhat.com, imammedo@redhat.com, lersek@redhat.com,
	rth@twiddle.net
Subject: Re: [Qemu-arm] [PATCH v9 3/5] acpi: pc: add fw_cfg device node to
	dsdt
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
X-TUID: 3g1sKy5/5PPl

On Fri, Feb 19, 2016 at 01:20:27PM -0500, Gabriel L. Somlo wrote:
> Add a fw_cfg device node to the ACPI DSDT. While the guest-side
> firmware can't utilize this information (since it has to access
> the hard-coded fw_cfg device to extract ACPI tables to begin with),
> having fw_cfg listed in ACPI will help the guest kernel keep a more
> accurate inventory of in-use IO port regions.
>=20
> Signed-off-by: Gabriel Somlo <somlo@cmu.edu>
> Reviewed-by: Laszlo Ersek <lersek@redhat.com>
> Reviewed-by: Marc Mar=ED <markmb@redhat.com>

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

> ---
>  hw/i386/acpi-build.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>=20
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 4554eb8..915fddd 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -2190,6 +2190,35 @@ build_dsdt(GArray *table_data, GArray *linker,
>      aml_append(scope, aml_name_decl("_S5", pkg));
>      aml_append(dsdt, scope);
> =20
> +    /* create fw_cfg node, unconditionally */
> +    {
> +        /* when using port i/o, the 8-bit data register *always* overl=
aps
> +         * with half of the 16-bit control register. Hence, the total =
size
> +         * of the i/o region used is FW_CFG_CTL_SIZE; when using DMA, =
the
> +         * DMA control register is located at FW_CFG_DMA_IO_BASE + 4 *=
/
> +        uint8_t io_size =3D object_property_get_bool(OBJECT(pcms->fw_c=
fg),
> +                                                   "dma_enabled", NULL=
) ?
> +                          ROUND_UP(FW_CFG_CTL_SIZE, 4) + sizeof(dma_ad=
dr_t) :
> +                          FW_CFG_CTL_SIZE;
> +
> +        scope =3D aml_scope("\\_SB.PCI0");
> +        dev =3D aml_device("FWCF");
> +
> +        aml_append(dev, aml_name_decl("_HID", aml_string("QEMU0002")))=
;
> +
> +        /* device present, functioning, decoding, not shown in UI */
> +        aml_append(dev, aml_name_decl("_STA", aml_int(0xB)));
> +
> +        crs =3D aml_resource_template();
> +        aml_append(crs,
> +            aml_io(AML_DECODE16, FW_CFG_IO_BASE, FW_CFG_IO_BASE, 0x01,=
 io_size)
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
> --=20
> 2.4.3
