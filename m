Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp4713685wrt;
        Tue, 23 Oct 2018 08:57:57 -0700 (PDT)
X-Google-Smtp-Source: AJdET5f6hbW43LzfxFs+W2QU+FfiMg1npsD8Kckq1YJrKHYFJoRtnRnbAtmCoFwtQ7k8hQ2RVoTC
X-Received: by 2002:a37:dd84:: with SMTP id u4mr6512335qku.56.1540310277529;
        Tue, 23 Oct 2018 08:57:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540310277; cv=none;
        d=google.com; s=arc-20160816;
        b=P//N0AfNyJDU5FepM2+P0EU4XaBlUsrOo8XTTQyWi1XzV89YNoPFd83huS88Kn0xFK
         4qhhW9kM0PB7bi6q+qrgO6/vO2AD5AQF+3fohLUYW5MX5ZwMISrj59NVyDTmQ++x1tlX
         zUZ2qvqEjU4wKMQPOcDXBzEBDa5Ehohh0giNDqpMiNCoYTuOzB1IPyhUrH9jwszCe/5z
         c6/DawCJTJ4X0LBAEro12DkSeUr2sQbJhXrLmYwfAWHO/5psfGI9ZRlFYdGDYWDaQvbK
         Ptz7Szw786mIw4EGUSN/DAyP8Gi1hUksn0hw/IG3w9Ad4nPugDmyZJNu5NFXwrCPCfKI
         lkuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature;
        bh=hRtVJl6xLG9V5DUMgnzdS2T16krcbTilL5DMpNN3lZw=;
        b=wM9jVMQ0lz9Xnwu+EJ6TpWBxUHz81ffGUiJwuHDySJY4Tf1cKFSoy1LmzrZNZZkUES
         wGonXP1fDqZgxFAsiNBTJqci8nih9TWwlOpku2gbcSA+pn472JYX3qcct40Zp5meOMIE
         099UJ2Daq75VxLo3O5hZNrIaQ2d1K+2J4ypPLNKB2i3t0YsD8mk4dyKm2V7/gT2Dob5f
         wG1W4XoYsQjojue0VWh4DNpnCi+8fxu/lqjmxiadM18n8BUyLt1XpUUPVu9ZCwZEzK7P
         rVK/tIqtbobUsyxd7RGSpTMjlW4YL6d46JIsJMdY1h0N3ImQjMFGyxyKd7p42feNs3M7
         ouyg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=J59O0DjD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y129-v6si1211979qkc.149.2018.10.23.08.57.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Oct 2018 08:57:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=J59O0DjD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42852 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gEz48-0002iG-Br
	for alex.bennee@linaro.org; Tue, 23 Oct 2018 11:57:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37363)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1gEyhc-0007I5-KL
	for qemu-devel@nongnu.org; Tue, 23 Oct 2018 11:34:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1gEybh-0006q9-Br
	for qemu-devel@nongnu.org; Tue, 23 Oct 2018 11:28:37 -0400
Received: from ozlabs.org ([203.11.71.1]:37239)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1gEybP-0006c3-1v; Tue, 23 Oct 2018 11:28:16 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 42fcj62fGMz9sD3; Wed, 24 Oct 2018 02:28:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1540308490;
	bh=bjepnm2LFkXOeaU9CKRbzN058pSHRQr2LkCxWNHlHLs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J59O0DjD/RkcLBP0SFojl/cBrABWaJrNKAdnu06SHM+UeqWRSjn0gIu+YtMlOKsj+
	Ll166MWK7nopFAp0jQww0K3SmGWsMRCTCOYoK7jKQI4m4JAf1vpPpAcpebjxPTek4P
	J03qlLL1Vv+s4lw4tiyB7/I1hnNjD9zPyBPyKbN8=
Date: Tue, 23 Oct 2018 16:06:24 +0100
From: David Gibson <david@gibson.dropbear.id.au>
To: Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20181023150624.GB12127@umbus.hotspot.internet-for-guests.com>
References: <20181018200422.4358-1-ehabkost@redhat.com>
	<20181018200422.4358-4-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IiVenqGWf+H9Y6IX"
Content-Disposition: inline
In-Reply-To: <20181018200422.4358-4-ehabkost@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 203.11.71.1
Subject: Re: [Qemu-devel] [PULL 03/45] vl:c: make sure that sockets are
 calculated correctly in '-smp X' case
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>, libvir-list@redhat.com,
	Jason Wang <jasowang@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-devel@nongnu.org, Alexander Graf <agraf@suse.de>,
	Max Filippov <jcmvbkbc@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Rob Herring <robh@kernel.org>, Markus Armbruster <armbru@redhat.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QLl7ocTgQPeJ


--IiVenqGWf+H9Y6IX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 18, 2018 at 05:03:40PM -0300, Eduardo Habkost wrote:
> From: Igor Mammedov <imammedo@redhat.com>
>=20
> commit
>   (5cdc9b76e3 vl.c: Remove dead assignment)
> removed sockets calculation when 'sockets' weren't provided on CLI
> since there wasn't any users for it back then. Exiting checks
> are neither reachable
>    } else if (sockets * cores * threads < cpus) {
> or nor triggerable
>    if (sockets * cores * threads > max_cpus)
> so we weren't noticing wrong topology since then, since users
> recalculate sockets adhoc on their own.
>=20
> However with deprecation check it becomes noticable, for example
>   -smp 2
> will start printing warning:
>   "warning: Invalid CPU topology deprecated: sockets (1) * cores (1) * th=
reads (1) !=3D maxcpus (2)"
> calculating sockets if they weren't specified.
>=20
> Fix it by returning back sockets calculation if it's omitted on CLI.
>=20
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> Reviewed-by: Andrew Jones <drjones@redhat.com>
> Message-Id: <1536836762-273036-3-git-send-email-imammedo@redhat.com>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  vl.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/vl.c b/vl.c
> index 027d04c7ca..2324321d91 100644
> --- a/vl.c
> +++ b/vl.c
> @@ -1199,11 +1199,14 @@ static void smp_parse(QemuOpts *opts)
> =20
>          /* compute missing values, prefer sockets over cores over thread=
s */
>          if (cpus =3D=3D 0 || sockets =3D=3D 0) {
> -            sockets =3D sockets > 0 ? sockets : 1;
>              cores =3D cores > 0 ? cores : 1;
>              threads =3D threads > 0 ? threads : 1;
>              if (cpus =3D=3D 0) {
> +                sockets =3D sockets > 0 ? sockets : 1;
>                  cpus =3D cores * threads * sockets;
> +            } else {
> +                max_cpus =3D qemu_opt_get_number(opts, "maxcpus", cpus);
> +                sockets =3D max_cpus / (cores * threads);
>              }
>          } else if (cores =3D=3D 0) {
>              threads =3D threads > 0 ? threads : 1;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--IiVenqGWf+H9Y6IX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlvPOO4ACgkQbDjKyiDZ
s5IiUw//VhezYLeCt4lAvdb30JLSMMOaZBavHbln1mK/xMpu+ky/d1zCo80z9Fyy
Lm+yZONfiHHw15XReRIHIJ7dILPvXkpC7hYPLgOAE6/6LxqrQhg4T2dbObDy4W7R
R30GnpV52BWP74QVdkCuU95Jn/R/jqknJPWJnYnvsyrktIWA3JoY6zQIJUYRfw32
s3Q4SgC5Id4PNsj4f3LTj2WujnKRcKdIWgy/Zwv47ol8toh4NpF7PA5+QTE7ZbKE
vT6r84IUGlW2JQ7q5Bi3N3+jrKSkb5rKLoW8SLvnE3fIfV7vTcN0dNimuIbUXUXk
ECiVQT5VWihdPpgB5mmqztSTxIHiajCgL9KiAiSpZC/zbfsBlEyKKqriiyILNTLM
2DMtJeXEAxi5FUoAcc6aHoHPps0uhkOEVoGHq5uhTR9yfvYJU7ufMninFoCtMNQD
uYOq5BYjuot2phjR3/xjJGvxFHSQk3+s7UW37fCs0eIQeeHwBb1PqV7VBn8+cHfN
S76O3F3yG3EZ5/Y9f9hmuG2c716COIKXtgAgmUEN4WT490aumClhirfE/Ck4919h
C8/2tKcF91k4Z1e2dXuXeuPn6B/ljnC63dVIK5ucwzh+qSfzdGmrEADDp6xqgH/T
3irqqT14TL9rha8ywoTt0tfurr87juq7Dcson1BPcrZl9669FWQ=
=Sbi6
-----END PGP SIGNATURE-----

--IiVenqGWf+H9Y6IX--
