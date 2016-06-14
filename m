Received: by 10.25.85.209 with SMTP id j200csp1480347lfb;
        Mon, 13 Jun 2016 18:36:02 -0700 (PDT)
X-Received: by 10.55.146.71 with SMTP id u68mr17224381qkd.30.1465868162647;
        Mon, 13 Jun 2016 18:36:02 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y128si14101399qhe.34.2016.06.13.18.36.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Jun 2016 18:36:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60368 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bCdGs-0002DA-3p
	for alex.bennee@linaro.org; Mon, 13 Jun 2016 21:36:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57196)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1bCdGo-0002BP-Ck
	for qemu-arm@nongnu.org; Mon, 13 Jun 2016 21:35:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1bCdGm-0007Dg-6p
	for qemu-arm@nongnu.org; Mon, 13 Jun 2016 21:35:57 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:36420)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>)
	id 1bCdGl-0007DZ-NG; Mon, 13 Jun 2016 21:35:56 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 3rTC090FtRz9t0Z; Tue, 14 Jun 2016 11:35:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1465868153;
	bh=R0849+9ADmrNdp8xSxurauf0UFkdfo31BMIXXo8p71g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oSzFLf3zc9kbicQ5bJYLSurQUPDuPy/iHq2NxbR+zEqYV29SZGt3F35RgSzmQN5IV
	MtGnwh/CShxPT5YghB0Ay6QfAonAZe0J3G+MwFfbjK9YEfo81xlilqC0R+EcKskifT
	PtvYSRE6TXOMNKIZZO7N897POWKHVDSM2TJ5Xbgs=
Date: Tue, 14 Jun 2016 11:30:37 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Andrew Jones <drjones@redhat.com>
Message-ID: <20160614013037.GG4882@voom.fritz.box>
References: <1465580427-13596-1-git-send-email-drjones@redhat.com>
	<1465580427-13596-5-git-send-email-drjones@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="L+ofChggJdETEG3Y"
Content-Disposition: inline
In-Reply-To: <1465580427-13596-5-git-send-email-drjones@redhat.com>
User-Agent: Mutt/1.6.1 (2016-04-27)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2401:3900:2:1::2
Subject: Re: [Qemu-arm] [PATCH RFC 04/16] hw/core/machine: Introduce pre_init
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, qemu-devel@nongnu.org,
	agraf@suse.de, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	pbonzini@redhat.com, imammedo@redhat.com, dgibson@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rBhWJB2c0OtB


--L+ofChggJdETEG3Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 10, 2016 at 07:40:15PM +0200, Andrew Jones wrote:
> From: Igor Mammedov <imammedo@redhat.com>
>=20
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Andrew Jones <drjones@redhat.com>

I think this needs some kind of rationale.

Since with this patch it is called immediately before ->init, I'm not
really seeing the point of this.

> ---
>  hw/core/machine.c   | 6 ++++++
>  include/hw/boards.h | 1 +
>  vl.c                | 1 +
>  3 files changed, 8 insertions(+)
>=20
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index ccdd5fa3e7728..3dce9020e510a 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -368,10 +368,16 @@ static void machine_init_notify(Notifier *notifier,=
 void *data)
>      foreach_dynamic_sysbus_device(error_on_sysbus_device, NULL);
>  }
> =20
> +static void machine_pre_init(MachineState *ms)
> +{
> +}
> +
>  static void machine_class_init(ObjectClass *oc, void *data)
>  {
>      MachineClass *mc =3D MACHINE_CLASS(oc);
> =20
> +    mc->pre_init =3D machine_pre_init;
> +
>      /* Default 128 MB as guest ram size */
>      mc->default_ram_size =3D 128 * M_BYTE;
>      mc->rom_file_has_mr =3D true;
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index d268bd00a9f7d..4e8dc68b07a24 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -92,6 +92,7 @@ struct MachineClass {
>      const char *alias;
>      const char *desc;
> =20
> +    void (*pre_init)(MachineState *state);
>      void (*init)(MachineState *state);
>      void (*reset)(void);
>      void (*hot_add_cpu)(const int64_t id, Error **errp);
> diff --git a/vl.c b/vl.c
> index 8d482cb1bf020..4849dd465d667 100644
> --- a/vl.c
> +++ b/vl.c
> @@ -4500,6 +4500,7 @@ int main(int argc, char **argv, char **envp)
>      current_machine->boot_order =3D boot_order;
>      current_machine->cpu_model =3D cpu_model;
> =20
> +    machine_class->pre_init(current_machine);
>      machine_class->init(current_machine);
> =20
>      realtime_init();

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--L+ofChggJdETEG3Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXX148AAoJEGw4ysog2bOS434P/iVmjG8WvQfaauxrKQ2qJFYw
wc6Vw/17uKner0roFMU1fwgic2gLrWxKsj90VDc0NO0zRWPjVcYO6J69aptNOzRr
2+myPILXUj8TtCGPlOYE7ynnWVRh4EG7E1yUwxhmt82OzqJDCkoluU4gqLHZpASl
vAmgg0+BjNDjJqptMgT3bA0cmQ3Ln6Jeabd2Ifp3oqCCWPxVO8FXjuyWcOqbYrpb
F3jrqNDpw+VKWHgJ88R1RhdBH784wt3bDKY/t08VdRveKEUBwvoMZoYK9DkJR1mL
gW2ZKO9DjyYltjSYDGkakKnpWCKgafFQB24PA8CU7S8alaXLXuOQw2ykdGxuQA9r
dtaRSFx2InAI+H2hKM05wO709ZMUgS/gXgERjeAs+jPpsYJL3xml9h9VSHZyT48b
JkNQiT9VChRVgMO9G0LXEKi/MF5bbagOTv2FfLQLbDfyJt05qQ80fZnFefLeCI1v
kcdihvdOziRH3q8UGFpPwzoZeq8eACCryF9FJwUujLzD/RlsV4hfbS2wTS+v+v8P
JNJI6rdFIdgKZIYGULikY1CTk+kDd2qHqf6tYcSPQTi2gQGmJBVwVuajc8OENlBr
LWFZ64uQXUiHJJheU3DVaawItMiaNMOFWmXfOhKNtgnuUeSgt2G8ZHt8eZldaGl5
dgx2R9/IJb7IjSeI9hSt
=mCMz
-----END PGP SIGNATURE-----

--L+ofChggJdETEG3Y--
