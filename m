Received: by 10.25.208.211 with SMTP id h202csp1629518lfg;
        Tue, 23 Feb 2016 01:51:42 -0800 (PST)
X-Received: by 10.140.16.225 with SMTP id 88mr41029961qgb.96.1456221102134;
        Tue, 23 Feb 2016 01:51:42 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z69si33122338qhb.82.2016.02.23.01.51.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Feb 2016 01:51:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55351 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aY9d7-0004EO-0K
	for alex.bennee@linaro.org; Tue, 23 Feb 2016 04:51:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34863)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1aY9d4-0004Bw-Rt
	for qemu-arm@nongnu.org; Tue, 23 Feb 2016 04:51:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1aY9d0-0000v3-Jn
	for qemu-arm@nongnu.org; Tue, 23 Feb 2016 04:51:38 -0500
Received: from mx1.redhat.com ([209.132.183.28]:57046)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>)
	id 1aY9d0-0000ux-Eo; Tue, 23 Feb 2016 04:51:34 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id E8C55128290;
	Tue, 23 Feb 2016 09:51:33 +0000 (UTC)
Received: from redhat.com (vpn1-6-142.ams2.redhat.com [10.36.6.142])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u1N9pTrF024323; Tue, 23 Feb 2016 04:51:30 -0500
Date: Tue, 23 Feb 2016 11:51:29 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Gabriel L. Somlo" <somlo@cmu.edu>
Message-ID: <20160223115123-mutt-send-email-mst@redhat.com>
References: <1455906029-25565-1-git-send-email-somlo@cmu.edu>
	<1455906029-25565-5-git-send-email-somlo@cmu.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <1455906029-25565-5-git-send-email-somlo@cmu.edu>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Tue, 23 Feb 2016 09:51:34 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, ard.biesheuvel@linaro.org,
	matt@codeblueprint.co.uk, stefanha@gmail.com,
	qemu-devel@nongnu.org, leif.lindholm@linaro.org,
	luto@amacapital.net, qemu-arm@nongnu.org, kraxel@redhat.com,
	pbonzini@redhat.com, imammedo@redhat.com, lersek@redhat.com,
	rth@twiddle.net
Subject: Re: [Qemu-arm] [PATCH v9 4/5] acpi: arm: add fw_cfg device node to
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
X-TUID: rg/C4HYfKlkF

On Fri, Feb 19, 2016 at 01:20:28PM -0500, Gabriel L. Somlo wrote:
> Add a fw_cfg device node to the ACPI DSDT. This is mostly
> informational, as the authoritative fw_cfg MMIO region(s)
> are listed in the Device Tree. However, since we are building
> ACPI tables, we might as well be thorough while at it...
>=20
> Signed-off-by: Gabriel Somlo <somlo@cmu.edu>
> Reviewed-by: Laszlo Ersek <lersek@redhat.com>
> Tested-by: Laszlo Ersek <lersek@redhat.com>
> Reviewed-by: Marc Mar=ED <markmb@redhat.com>

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

> ---
>  hw/arm/virt-acpi-build.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>=20
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 8cf9a21..7d7998b 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -81,6 +81,20 @@ static void acpi_dsdt_add_uart(Aml *scope, const Mem=
MapEntry *uart_memmap,
>      aml_append(scope, dev);
>  }
> =20
> +static void acpi_dsdt_add_fw_cfg(Aml *scope, const MemMapEntry *fw_cfg=
_memmap)
> +{
> +    Aml *dev =3D aml_device("FWCF");
> +    aml_append(dev, aml_name_decl("_HID", aml_string("QEMU0002")));
> +    /* device present, functioning, decoding, not shown in UI */
> +    aml_append(dev, aml_name_decl("_STA", aml_int(0xB)));
> +
> +    Aml *crs =3D aml_resource_template();
> +    aml_append(crs, aml_memory32_fixed(fw_cfg_memmap->base,
> +                                       fw_cfg_memmap->size, AML_READ_W=
RITE));
> +    aml_append(dev, aml_name_decl("_CRS", crs));
> +    aml_append(scope, dev);
> +}
> +
>  static void acpi_dsdt_add_flash(Aml *scope, const MemMapEntry *flash_m=
emmap)
>  {
>      Aml *dev, *crs;
> @@ -548,6 +562,7 @@ build_dsdt(GArray *table_data, GArray *linker, Virt=
GuestInfo *guest_info)
>      acpi_dsdt_add_uart(scope, &memmap[VIRT_UART],
>                         (irqmap[VIRT_UART] + ARM_SPI_BASE));
>      acpi_dsdt_add_flash(scope, &memmap[VIRT_FLASH]);
> +    acpi_dsdt_add_fw_cfg(scope, &memmap[VIRT_FW_CFG]);
>      acpi_dsdt_add_virtio(scope, &memmap[VIRT_MMIO],
>                      (irqmap[VIRT_MMIO] + ARM_SPI_BASE), NUM_VIRTIO_TRA=
NSPORTS);
>      acpi_dsdt_add_pci(scope, memmap, (irqmap[VIRT_PCIE] + ARM_SPI_BASE=
),
> --=20
> 2.4.3
