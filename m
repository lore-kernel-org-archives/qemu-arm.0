Received: by 10.25.85.209 with SMTP id j200csp1469798lfb;
        Mon, 13 Jun 2016 17:55:49 -0700 (PDT)
X-Received: by 10.141.0.133 with SMTP id b127mr17942364qhd.9.1465865749870;
        Mon, 13 Jun 2016 17:55:49 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h52si16882126qgf.10.2016.06.13.17.55.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Jun 2016 17:55:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60281 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bCcdx-0006ET-Aq
	for alex.bennee@linaro.org; Mon, 13 Jun 2016 20:55:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52424)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1bCcdo-0006Cv-62
	for qemu-arm@nongnu.org; Mon, 13 Jun 2016 20:55:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1bCcdj-0000AK-GD
	for qemu-arm@nongnu.org; Mon, 13 Jun 2016 20:55:39 -0400
Received: from ozlabs.org ([103.22.144.67]:46411)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>)
	id 1bCcdi-00009i-8E; Mon, 13 Jun 2016 20:55:35 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 3rTB5W0ccLz9sBM; Tue, 14 Jun 2016 10:55:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1465865727;
	bh=l6TwoEk86MCsl5XDRnOowOYVHZcAQB+4sCiRHzZ9B7M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bORGqJq26CXnqNMWgrC+1XqHNM/mFbINGCwC0YlKqv2TOi7LwyADswpuXZbueJDDk
	9yNbi0kyWVH7Rd9GCn1F/6M0Vt53S57EQW7t2mOSTEUb9k1Q9k8SO8z49he3qtJHRT
	mA1zjp55qFyyyuozKKTWHAfI9hB3nKYQYBpn1jS8=
Date: Tue, 14 Jun 2016 10:39:13 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Gerd Hoffmann <kraxel@redhat.com>
Message-ID: <20160614003913.GB4882@voom.fritz.box>
References: <1465823429-24403-1-git-send-email-kraxel@redhat.com>
	<1465823429-24403-5-git-send-email-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hQiwHBbRI9kgIhsi"
Content-Disposition: inline
In-Reply-To: <1465823429-24403-5-git-send-email-kraxel@redhat.com>
User-Agent: Mutt/1.6.1 (2016-04-27)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 103.22.144.67
Subject: Re: [Qemu-arm] [PULL 4/4] vl: Eliminate usb_enabled()
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
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Alexander Graf <agraf@suse.de>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andrzej Zaborowski <balrogg@gmail.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /Yv4CAUvnbBw


--hQiwHBbRI9kgIhsi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 13, 2016 at 03:10:29PM +0200, Gerd Hoffmann wrote:
> From: Eduardo Habkost <ehabkost@redhat.com>
>=20
> This wrapper for machine_usb(current_machine) is not necessary,
> replace all usages of usb_enabled() with machine_usb().
>=20
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Alexander Graf <agraf@suse.de>
> Cc: qemu-arm@nongnu.org
> Cc: qemu-ppc@nongnu.org
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> Reviewed-by: Marcel Apfelbaum <marcel@redhat.com>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Message-id: 1465419025-21519-3-git-send-email-ehabkost@redhat.com
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>

ppc portions

Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/arm/nseries.c        |  2 +-
>  hw/arm/realview.c       |  2 +-
>  hw/arm/versatilepb.c    |  2 +-
>  hw/i386/pc_piix.c       |  2 +-
>  hw/i386/pc_q35.c        |  2 +-
>  hw/ppc/mac_oldworld.c   |  2 +-
>  hw/ppc/prep.c           |  2 +-
>  include/sysemu/sysemu.h |  1 -
>  vl.c                    | 11 +++--------
>  9 files changed, 10 insertions(+), 16 deletions(-)
>=20
> diff --git a/hw/arm/nseries.c b/hw/arm/nseries.c
> index d4eb141..fea911e 100644
> --- a/hw/arm/nseries.c
> +++ b/hw/arm/nseries.c
> @@ -1351,7 +1351,7 @@ static void n8x0_init(MachineState *machine,
>      n8x0_dss_setup(s);
>      n8x0_cbus_setup(s);
>      n8x0_uart_setup(s);
> -    if (usb_enabled()) {
> +    if (machine_usb(machine)) {
>          n8x0_usb_setup(s);
>      }
> =20
> diff --git a/hw/arm/realview.c b/hw/arm/realview.c
> index 7d0aa6f..8eafcca 100644
> --- a/hw/arm/realview.c
> +++ b/hw/arm/realview.c
> @@ -254,7 +254,7 @@ static void realview_init(MachineState *machine,
>          sysbus_connect_irq(busdev, 2, pic[50]);
>          sysbus_connect_irq(busdev, 3, pic[51]);
>          pci_bus =3D (PCIBus *)qdev_get_child_bus(dev, "pci");
> -        if (usb_enabled()) {
> +        if (machine_usb(machine)) {
>              pci_create_simple(pci_bus, -1, "pci-ohci");
>          }
>          n =3D drive_get_max_bus(IF_SCSI);
> diff --git a/hw/arm/versatilepb.c b/hw/arm/versatilepb.c
> index 20dd356..8ae5392 100644
> --- a/hw/arm/versatilepb.c
> +++ b/hw/arm/versatilepb.c
> @@ -276,7 +276,7 @@ static void versatile_init(MachineState *machine, int=
 board_id)
>              pci_nic_init_nofail(nd, pci_bus, "rtl8139", NULL);
>          }
>      }
> -    if (usb_enabled()) {
> +    if (machine_usb(machine)) {
>          pci_create_simple(pci_bus, -1, "pci-ohci");
>      }
>      n =3D drive_get_max_bus(IF_SCSI);
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index 14dd0cc..82c7c0a 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -262,7 +262,7 @@ static void pc_init1(MachineState *machine,
> =20
>      pc_cmos_init(pcms, idebus[0], idebus[1], rtc_state);
> =20
> -    if (pcmc->pci_enabled && usb_enabled()) {
> +    if (pcmc->pci_enabled && machine_usb(machine)) {
>          pci_create_simple(pci_bus, piix3_devfn + 2, "piix3-usb-uhci");
>      }
> =20
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index 04aae89..31a6a59 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -234,7 +234,7 @@ static void pc_q35_init(MachineState *machine)
>      ide_drive_get(hd, ICH_AHCI(ahci)->ahci.ports);
>      ahci_ide_create_devs(ahci, hd);
> =20
> -    if (usb_enabled()) {
> +    if (machine_usb(machine)) {
>          /* Should we create 6 UHCI according to ich9 spec? */
>          ehci_create_ich9_with_companions(host_bus, 0x1d);
>      }
> diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
> index a9bb1c2..4479487 100644
> --- a/hw/ppc/mac_oldworld.c
> +++ b/hw/ppc/mac_oldworld.c
> @@ -309,7 +309,7 @@ static void ppc_heathrow_init(MachineState *machine)
>      dev =3D qdev_create(adb_bus, TYPE_ADB_MOUSE);
>      qdev_init_nofail(dev);
> =20
> -    if (usb_enabled()) {
> +    if (machine_usb(machine)) {
>          pci_create_simple(pci_bus, -1, "pci-ohci");
>      }
> =20
> diff --git a/hw/ppc/prep.c b/hw/ppc/prep.c
> index 07ffe72..054af1e 100644
> --- a/hw/ppc/prep.c
> +++ b/hw/ppc/prep.c
> @@ -649,7 +649,7 @@ static void ppc_prep_init(MachineState *machine)
>      memory_region_add_subregion(sysmem, 0xFEFF0000, xcsr);
>  #endif
> =20
> -    if (usb_enabled()) {
> +    if (machine_usb(machine)) {
>          pci_create_simple(pci_bus, -1, "pci-ohci");
>      }
> =20
> diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
> index 9428141..7313673 100644
> --- a/include/sysemu/sysemu.h
> +++ b/include/sysemu/sysemu.h
> @@ -233,7 +233,6 @@ void qemu_boot_set(const char *boot_order, Error **er=
rp);
>  QemuOpts *qemu_get_machine_opts(void);
> =20
>  bool defaults_enabled(void);
> -bool usb_enabled(void);
> =20
>  extern QemuOptsList qemu_legacy_drive_opts;
>  extern QemuOptsList qemu_common_drive_opts;
> diff --git a/vl.c b/vl.c
> index b0bcc25..45eff56 100644
> --- a/vl.c
> +++ b/vl.c
> @@ -1072,11 +1072,6 @@ bool defaults_enabled(void)
>      return has_defaults;
>  }
> =20
> -bool usb_enabled(void)
> -{
> -    return machine_usb(current_machine);
> -}
> -
>  #ifndef _WIN32
>  static int parse_add_fd(void *opaque, QemuOpts *opts, Error **errp)
>  {
> @@ -1393,7 +1388,7 @@ static int usb_device_add(const char *devname)
>      const char *p;
>  #endif
> =20
> -    if (!usb_enabled()) {
> +    if (!machine_usb(current_machine)) {
>          return -1;
>      }
> =20
> @@ -1425,7 +1420,7 @@ static int usb_device_del(const char *devname)
>          return -1;
>      }
> =20
> -    if (!usb_enabled()) {
> +    if (!machine_usb(current_machine)) {
>          return -1;
>      }
> =20
> @@ -4501,7 +4496,7 @@ int main(int argc, char **argv, char **envp)
>      }
> =20
>      /* init USB devices */
> -    if (usb_enabled()) {
> +    if (machine_usb(current_machine)) {
>          if (foreach_device_config(DEV_USB, usb_parse) < 0)
>              exit(1);
>      }

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--hQiwHBbRI9kgIhsi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXX1IxAAoJEGw4ysog2bOS25QQANxDi2DdYbmOihOzxoBJ30Us
5oKFLl7WIiWwBUrRNEu0HsWYMoxvCvPPQfr2XUldUdlKtQBubP9v+VcvQzjukKHJ
wTE4xkndftFFrsz1oJgHqIyP0RYO6eYsulww9bGV/+nzeyDWF8/BK6beJteAt1/q
RnZIpSJYtuIBCRWaxO7ZeOSkcft2d2WE14MrowOwUUFrB7a6YTHET12SUiW8XJ9h
Tjj6dwDXxSzp0hbVAcyfPaJG+hBEZ3/a389SBEJn1onBhE8vaTiUaLhig3GxgXyr
5nEAgH0L70cKTzMTvs70o0mJEcvnSetoqQ2hHDQi5ks2jBVChidBuRz3mqMlKRKd
/J3tiArsGLGD43kLV5/yFs4LrTvODhs4maRRQRfjdKsLBV4MjPLmffTI6Qb9sKWX
GbMArphOQclnG1iItP3JCVL6r46Qecxpjunc4ON7yU7xeGZvs+2aBit6g19A/1R2
UgMfO1Zk0aPjo9I+om02IHRd2iI881E/mycbGcTJ0dmUatBDpHlxvorH0zKNE4Mi
xJ663ZOE6kOXqLNf96Zc6lEmiXQxDgjInEfgmf3j2VPI4VUw4LZWvDmp7JTwj2Y+
Q9rJKkwHirAcp7aKkDV+53BL34Z5ZGVgOUXAYwW41lr+FKpJboodfVvsEuiVyeNc
Z3+kguXvyoVP0SqJbrU/
=bim9
-----END PGP SIGNATURE-----

--hQiwHBbRI9kgIhsi--
