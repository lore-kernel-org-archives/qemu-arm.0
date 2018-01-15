Received: by 10.28.173.206 with SMTP id w197csp2145650wme;
        Sun, 14 Jan 2018 17:43:00 -0800 (PST)
X-Google-Smtp-Source: ACJfBovVK8+EzxasCEcIyDbonmY6mC0rJ6g1pp85WmiW5Gxu9IDjssqRGCqod+GM5kERzSwBEUbO
X-Received: by 10.13.237.69 with SMTP id w66mr13974213ywe.313.1515980580364;
        Sun, 14 Jan 2018 17:43:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515980580; cv=none;
        d=google.com; s=arc-20160816;
        b=MkHvshCIDbi+r03ujopj0ZWajuHqan4egWOmyPcSmcsKQPa7In46Z53yGFzZZvJBe2
         nY7NSQMBn3mtOMnOMdUOOzdN+5ZIJP3e5xT+TjQRK1CIkq7ftbgx6BuFsF0qjDAfEpRJ
         ZnGlg1ho/Gc5jmu1ymtZCc9Az0E6U9DsVmcz53MZbQCW8WMQDRhvHUCyGwiV49ejFDfy
         uPlBQ7rPX3EjE0YN7FSZqSWCQ/AOFHuC+riiC1PpXvapn4JtEAMky0t6PJICFmJDT0WK
         6oTmwI4WKSYs4yIjD1ECexfrZLbkesXucMg9y4lA07L/ruodukfQfIgC0z2iV7J7vgSv
         2T+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=U2KmXwpfm4OnRibb7ONrIJ514UuqozvkRLwqkmUkACQ=;
        b=YhYZB5xnejm8vCs7k0Fo16w+91Thd7Za1pa6PMkubKOQrt3Xqt1cXByCZ6eHnb3ZM+
         IeGhpYRtcQ8v8HacE72CObZj66IkwXFSHx3q8hiEst1bLwvFN7xQBJxBbwWgbZm1ZSz8
         /HbNc1m8ozqkoOX7sDLD5Fh2q9Tt5xA6kGC2TTK8KWQ9OzgHH6xlBfytXC9HjO/tQa8M
         r3LGTkBGksLPBjH3pvIhWReeXfUIjVJ0FzF/AyiR4+AjmEJBYbv4QEfPd1NSF74Wdgzs
         rBXAYzUFs7QR5MOnE/TfZVRaVy0dgxYagm6Aea8o/LXu5kOKxuu5TFg8qEVRSYwKR8zh
         +Q/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=btyUGE+B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w68si5795588ybc.47.2018.01.14.17.43.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 14 Jan 2018 17:43:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=btyUGE+B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53983 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eatnf-0007l8-OQ
	for alex.bennee@linaro.org; Sun, 14 Jan 2018 20:42:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41240)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1eatnT-0007jy-9h
	for qemu-arm@nongnu.org; Sun, 14 Jan 2018 20:42:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1eatnP-000348-9q
	for qemu-arm@nongnu.org; Sun, 14 Jan 2018 20:42:47 -0500
Received: from ozlabs.org ([103.22.144.67]:52121)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1eatnO-00032K-6b; Sun, 14 Jan 2018 20:42:43 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
	id 3zKbhB3YlJz9sBd; Mon, 15 Jan 2018 12:42:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1515980554;
	bh=9KHagcIt/jXWN83KZ6iaI6m5sty79dHk3eDmpOb4jVE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=btyUGE+BVEPVbJO/xpXf2nZTrvPJ/WzjCJ+Rz5TvqI0vgfCqMtHT8JsThg3fTmsuf
	8MlK029G6p4UCc5LWGFrKp3/zkaOvCCOMEHUdfrK8++iKll4a1BpQV7K5NpxJU68Ig
	qw/GvMnm7ydikQ7HZSeU/3SJ3UiZilq+YIFQ4hys=
Date: Mon, 15 Jan 2018 12:42:24 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Message-ID: <20180115014224.GA2027@umbus.fritz.box>
References: <20180114020412.26160-1-f4bug@amsat.org>
	<20180114020412.26160-4-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ibTvN161/egqYuK8"
Content-Disposition: inline
In-Reply-To: <20180114020412.26160-4-f4bug@amsat.org>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 103.22.144.67
Subject: Re: [Qemu-arm] [RFC PATCH 3/3] qdev: use
 device_class_set_parent_realize/unrealize/reset()
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
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-devel@nongnu.org, Michael Roth <mdroth@linux.vnet.ibm.com>,
	Max Filippov <jcmvbkbc@gmail.com>, Dmitry Fleytman <dmitry@daynix.com>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>,
	Yongbok Kim <yongbok.kim@mips.com>, Marek Vasut <marex@denx.de>,
	Markus Armbruster <armbru@redhat.com>,
	Marcel Apfelbaum <marcel@redhat.com>, Anthony Green <green@moxielogic.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>, Fam Zheng <famz@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	"open list:ARM cores" <qemu-arm@nongnu.org>,
	Stafford Horne <shorne@gmail.com>, Richard Henderson <rth@twiddle.net>,
	Alexander Graf <agraf@suse.de>, "open list:S390" <qemu-s390x@nongnu.org>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
	Michael Walle <michael@walle.cc>,
	"open list:PowerPC" <qemu-ppc@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DxTz3JdsXQWC


--ibTvN161/egqYuK8
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 13, 2018 at 11:04:12PM -0300, Philippe Mathieu-Daud=E9 wrote:
1;5002;0c> changes generated using the following Coccinelle patch:
>=20
>   @@
>   type DeviceParentClass;
>   DeviceParentClass *pc;
>   DeviceClass *dc;
>   identifier parent_fn;
>   identifier child_fn;
>   @@
>   (
>   +device_class_set_parent_realize(dc, child_fn, &pc->parent_fn);
>   -pc->parent_fn =3D dc->realize;
>   ...
>   -dc->realize =3D child_fn;
>   |
>   +device_class_set_parent_unrealize(dc, child_fn, &pc->parent_fn);
>   -pc->parent_fn =3D dc->unrealize;
>   ...
>   -dc->unrealize =3D child_fn;
>   |
>   +device_class_set_parent_reset(dc, child_fn, &pc->parent_fn);
>   -pc->parent_fn =3D dc->reset;
>   ...
>   -dc->reset =3D child_fn;
>   )
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>

PPC parts

Acked-by: David Gibson <david@gibson.dropbear.id.au>

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--ibTvN161/egqYuK8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlpcBv8ACgkQbDjKyiDZ
s5KIMBAA2VsQYLz6EUa9ZuCCIlcqDnDfO3iNowUMMIlrJg+Bip5NTLPUb62PgJwi
5BMlEUjaQVD9trevqqQj7oaFMXZQqHEtiXADbvxIiumC+0pQTVlFzztElEAF2Hqd
lZ8TjKnoH5aQwKiU9ukggro6RDKF/S6I5uXGDTNVf41PVld0/gNLlvm5y+wCLIpf
1CcRimM7BMBqsaIfRW1lX+s+9dMJkmcA0eVPz0m0VYSCRSVX+3dW3MbCCsQiw6A8
8iinmSCyTqkLRZv9xtGjYu/riIZIgn91qLCWgmWn5/VnfpfHWReErwz/KQxmaVl/
maeoOjqtX7tlPjMwJIYLl2fz8ip0fU2LP6+HH1w7x5jKuD8AMtaBsKOIksHzCjJE
whfTEo6D3RA/ueBW+3FKMK3XW70a42wHiENy+UagKxXwHRpGae1KshpgFubb/gpw
BFnBeapExqCVZyZnRkdcgbUpEmae0VoOI5BNZbE8/swZKgAp7zzDMFDs5+I/EEEA
gzgcS+7Gz0R8n4N7mr/DCJ1ZFP09k82yIOjxo/VcSWfR4bj28eObJmzfGk21pMsK
4FWXj3msSye6f+mpa6GIPLxuaTVqLtQ565DqQgB2CO5AYDlkzPHCGMfxbT6a7kWe
QqVW/JDI3RM89N4TCPrgFChseb9UMV26Yo9kKWvCAV4CKjkXmeQ=
=QhOf
-----END PGP SIGNATURE-----

--ibTvN161/egqYuK8--
