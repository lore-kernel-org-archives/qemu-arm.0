Received: by 10.25.208.194 with SMTP id h185csp1506254lfg;
        Tue, 26 Apr 2016 06:18:15 -0700 (PDT)
X-Received: by 10.55.94.7 with SMTP id s7mr2139507qkb.181.1461676695657;
        Tue, 26 Apr 2016 06:18:15 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o68si13494533qki.116.2016.04.26.06.18.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Apr 2016 06:18:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37904 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1av2sY-0004rn-2n
	for alex.bennee@linaro.org; Tue, 26 Apr 2016 09:18:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36555)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1av2sO-0004Yw-Fw
	for qemu-arm@nongnu.org; Tue, 26 Apr 2016 09:18:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1av2sL-0002e9-9q
	for qemu-arm@nongnu.org; Tue, 26 Apr 2016 09:18:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52200)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>)
	id 1av2sL-0002e0-4N; Tue, 26 Apr 2016 09:18:01 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 264127F6A6;
	Tue, 26 Apr 2016 13:18:00 +0000 (UTC)
Received: from localhost (ovpn-112-68.ams2.redhat.com [10.36.112.68])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u3QDHwOM016313; Tue, 26 Apr 2016 09:17:59 -0400
Date: Tue, 26 Apr 2016 11:20:08 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Hollis Blanchard <hollis_blanchard@mentor.com>
Message-ID: <20160426102008.GJ10650@stefanha-x1.localdomain>
References: <1461252281-22399-1-git-send-email-hollis_blanchard@mentor.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AXxEqdD4tcVTjWte"
Content-Disposition: inline
In-Reply-To: <1461252281-22399-1-git-send-email-hollis_blanchard@mentor.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH] hw/intc/arm_gic: add tracepoints
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ATh5Lm9BzDVF


--AXxEqdD4tcVTjWte
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 21, 2016 at 08:24:41AM -0700, Hollis Blanchard wrote:
> These are obviously critical to understanding interrupt delivery:
> gic_enable_irq
> gic_disable_irq
> gic_set_irq (inbound irq from device models)
> gic_update_set_irq (outbound irq to CPU)
> gic_acknowledge_irq
>=20
> The only one that I think might raise eyebrows is gic_update_bestirq, but=
 I've
> (sadly) debugged problems that ended up being caused by unexpected priori=
ties.
> Knowing that the GIC has an irq ready, but doesn't deliver to the CPU due=
 to
> priority, has also proven important.
>=20
> Signed-off-by: Hollis Blanchard <hollis_blanchard@mentor.com>
> ---
>  hw/intc/arm_gic.c | 12 ++++++++++++
>  trace-events      |  8 ++++++++
>  2 files changed, 20 insertions(+)

Thanks, applied to my tracing tree (for QEMU 2.7):
https://github.com/stefanha/qemu/commits/tracing

Stefan

--AXxEqdD4tcVTjWte
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJXH0DYAAoJEJykq7OBq3PIBbAH/1337bIdfm9bH7cTkSzNS8LD
+9wYr64WkrjwQfOvaxk6Bk9Nv3k0XOrRIjcCTIY528Zd+h/bI6TuRbeNkcYEQtAk
Rq0pUTrw2FrbwICWu1edOWyOsHJcUoL5vDDpHf7H6zL8zvtThNXHAUXO6W3piDfr
J/1m3Yzbm33LcP3JjJvWRWRAGNDUouQLZCC+M3GUhTuf2m5LBVV6ITNYlCdPDkqF
Fkvwu3//Oll3X3+Ogs1n2tcwkUSUBvJgu6qKyM/PFfv5X5MPEbdEjJgdbLarSZs7
ANG8EsP6gAzOsvM1WTcGcdnyBFJrpyLwVWdIlgfoRL8oilolwYAs6pc1KwOJHI4=
=ZTHr
-----END PGP SIGNATURE-----

--AXxEqdD4tcVTjWte--
