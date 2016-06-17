Received: by 10.25.21.96 with SMTP id l93csp326251lfi;
        Fri, 17 Jun 2016 08:39:59 -0700 (PDT)
X-Received: by 10.55.24.20 with SMTP id j20mr2971188qkh.168.1466177999806;
        Fri, 17 Jun 2016 08:39:59 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n28si31895036qkh.29.2016.06.17.08.39.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 17 Jun 2016 08:39:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58454 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bDvsF-0007F2-6a
	for alex.bennee@linaro.org; Fri, 17 Jun 2016 11:39:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44334)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1bDve0-0001On-T1
	for qemu-arm@nongnu.org; Fri, 17 Jun 2016 11:25:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1bDvdv-0001Ss-1u
	for qemu-arm@nongnu.org; Fri, 17 Jun 2016 11:25:15 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33532)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>)
	id 1bDvdu-0001Sl-SE; Fri, 17 Jun 2016 11:25:10 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BCAC5C00355F;
	Fri, 17 Jun 2016 15:25:09 +0000 (UTC)
Received: from localhost (ovpn-112-65.ams2.redhat.com [10.36.112.65])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5HFP76l025164; Fri, 17 Jun 2016 11:25:08 -0400
Date: Fri, 17 Jun 2016 16:25:06 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: =?iso-8859-1?Q?Llu=EDs?= Vilanova <vilanova@ac.upc.edu>
Message-ID: <20160617152506.GA20432@stefanha-x1.localdomain>
References: <146590985033.16561.16324808287190305042.stgit@fimbulvetr.bsc.es>
	<146590986119.16561.848653586742206135.stgit@fimbulvetr.bsc.es>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="h31gzZEtNLTqOjlF"
Content-Disposition: inline
In-Reply-To: <146590986119.16561.848653586742206135.stgit@fimbulvetr.bsc.es>
User-Agent: Mutt/1.6.1 (2016-04-27)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Fri, 17 Jun 2016 15:25:10 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v4 2/6] disas: Remove unused macro '_'
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
	"open list:PowerPC" <qemu-ppc@nongnu.org>, Eric Blake <eblake@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-devel@nongnu.org, Alexander Graf <agraf@suse.de>,
	Blue Swirl <blauwirbel@gmail.com>, Leon Alrae <leon.alrae@imgtec.com>,
	"Vassili Karpov \(malc\)" <av1474@comtv.ru>,
	"open list:ARM target" <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZnGEHwJrCwEX


--h31gzZEtNLTqOjlF
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 14, 2016 at 03:11:01PM +0200, Llu=EDs Vilanova wrote:
> Eliminates a future compilation error when UI code includes the tracing
> headers (indirectly pulling "disas/bfd.h" through "qom/cpu.h") and
> GLib's i18n '_' macro.
>=20
> Signed-off-by: Llu=EDs Vilanova <vilanova@ac.upc.edu>
> ---
>  disas/alpha.c       |    6 +++---
>  disas/arm.c         |    2 +-
>  disas/i386.c        |    2 +-
>  disas/m68k.c        |    4 ++--
>  disas/mips.c        |   50 +++++++++++++++++++++++++--------------------=
-----
>  disas/ppc.c         |   22 +++++++++++-----------
>  disas/sparc.c       |    6 +++---
>  include/disas/bfd.h |    1 -
>  8 files changed, 46 insertions(+), 47 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--h31gzZEtNLTqOjlF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJXZBZSAAoJEJykq7OBq3PIDNQH/1Icizyad597h9SnT1b5TCp0
ktH9tQMhQ+Px3yLFmwRJUR6LlL4/l4XBA5C4dJt7PtYj9hAM9vHcccOS4BU6KE3u
Q0Kl+U93YOifJkAMOgdJTXYo3ZzUeF8y05a64IsMIY0Zk9FWt7r5BLkUuv/E5jA1
Bi844JQN78/IZq/Y3mI0FN4oG+upeIvZajXIeMfqiGWCI2Gsyzd1z7OEnHaNccpI
t8HSop5ANwbAyWaEVDPJyE6eIUHeFtNYZqOFoFmR/QMIb/rwVsZdW1AS+EwJ1T5S
ogaPsTn2dxm9+7YlbZjMoZ/JFLvpe4lhqDP0n5jn+AzsJHN4qxZX6dj7oADJDMM=
=4tI2
-----END PGP SIGNATURE-----

--h31gzZEtNLTqOjlF--
