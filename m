Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp189876wrx;
        Thu, 11 Apr 2019 23:34:41 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzFJ5vDH9soxFbk0zv2hc+gqJjhaMScPXOqMHCm5m4PufWxMfA/zsSGing9W4jC5SSonuZC
X-Received: by 2002:a1c:a70f:: with SMTP id q15mr9380008wme.28.1555050881541;
        Thu, 11 Apr 2019 23:34:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555050881; cv=none;
        d=google.com; s=arc-20160816;
        b=Ot1Z0up7gOgchE0tLBA21iKo6um+QjlPCHMrNrtr27dVFwYnd5JVTJjEPLtSJ2JqqE
         pDBChPTODxSFkIkcHGaVdWP3SPJvCQyxlB+braSj+i7piROh1SK6Z/ONKPd4K0ECVfc1
         QZpBrt7LvHHor1+KIHdz1Tu1wq3lRaudHhIdgULVWes6Oczw3x+WvicsAzdQW+m3iihz
         7mzXD5p4R5FDBkfRTq1EOgMGB3YtOTOu9AzhUgHfnxizAZHGAKGnEfZzkSBngzISoGuB
         9JgtTj3VOsnzKnvwG/ztLKM9TT56tWaS/CrROGjL4hEqNZsEc8aqRs0a5NZrIf303Y/v
         lSqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature;
        bh=Az/O1VciHvuXtDPrpsT0/UYWk5JBskazYDPMD9ntF1Y=;
        b=pgsxA+MBHpUiRfxkNpRv8pXUm8uxlHk0YenHOju0n9spqwQP2NxzFc8fhttvUyhZmk
         fTrXTm/LwNNzLejkATmNITCo2Cw0asVZpFkk/CZ+5QOJ5yUrPhU/gzStbeGn9EX4Z+Qh
         Z/JTtyyoVxM4Ge71snPVkVhPE0mw7eXhe4dqAmx98NTFTmt5ieOrB1rf5pKW6U4UJH9L
         BZoRe82OfUuT/krKDYSndxXeHL1RuXnRozsh7JDsTUb2c1L+GKPQGeAw8JKWka/Q7ZNT
         pF5w1Si3iDkhq8tzsAZybI1rgDVRw2xO4AEKpSna0H77yJ/Acbnqt9li/9f05TtuI1n+
         2/pg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=junQKRsh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q15si26592547wro.242.2019.04.11.23.34.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Apr 2019 23:34:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=junQKRsh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:59714 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hEplo-0005KE-GZ
	for alex.bennee@linaro.org; Fri, 12 Apr 2019 02:34:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53058)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hEplY-0005Jp-33
	for qemu-arm@nongnu.org; Fri, 12 Apr 2019 02:34:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hEplV-0000p9-Eb
	for qemu-arm@nongnu.org; Fri, 12 Apr 2019 02:34:23 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:52289 helo=ozlabs.org)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1hEplS-0000lD-61; Fri, 12 Apr 2019 02:34:20 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 44gSm42RdMz9s8m; Fri, 12 Apr 2019 16:34:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1555050852;
	bh=z0SKgYzTI48+gmzI8uC02nuE/l9BEyyG8hRh3uaCg9Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=junQKRshADYHnhJgX0wZlnxmrXksNU2/HpRsEqz26x5FfQWrT0eTHCAMFouCHXOM6
	UKOb85QJVzhLXvBw620JsqCQ3mNI3ekETO0VTW9WfSctbobVfcQAmxLAlbZfawpWmd
	rrA+jOWs1W4e6iYjhWzMHf0a24cFF3KWVo/aqhNk=
Date: Fri, 12 Apr 2019 15:55:12 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Greg Kurz <groug@kaod.org>
Message-ID: <20190412055512.GB8005@umbus.fritz.box>
References: <20190411102025.22559-1-cohuck@redhat.com>
	<20190411212405.407918b8@bahia.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gatW/ieO32f1wygP"
Content-Disposition: inline
In-Reply-To: <20190411212405.407918b8@bahia.lan>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2401:3900:2:1::2
Subject: Re: [Qemu-arm] [Qemu-ppc] [PATCH for-4.1] hw: add compat machines
 for 4.1
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
	"Michael S . Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
	David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
	Halil Pasic <pasic@linux.ibm.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ve2GC2Ey3NCy


--gatW/ieO32f1wygP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 11, 2019 at 09:24:05PM +0200, Greg Kurz wrote:
> On Thu, 11 Apr 2019 12:20:25 +0200
> Cornelia Huck <cohuck@redhat.com> wrote:
>=20
> > Add 4.1 machine types for arm/i440fx/q35/s390x/spapr.
> >=20
> > Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> > ---
> >=20
>=20
> For spapr part:
>=20
> Acked-by: Greg Kurz <groug@kaod.org>

and

Acked-by: David Gibson <david@gibson.dropbear.id.au>

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--gatW/ieO32f1wygP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlywKD4ACgkQbDjKyiDZ
s5IC8Q/+MMOIOiDJkyqN1x+qrWTjqUigmYmOrDKEZQYUmjpqTMQWn328JHBhYU/c
BCC2mrGljioeOo4vzkF+2J+aJuy5eeX/+JIH4AUnuuEUT+kG5DnUvVWO5PVoW4vG
fTAZ8vQs6LIJ9enqTbqepkNwfC58u0LwmUPO5pjYZKMrLNgL+x035r3FNX8gkNOj
0xlUm541BDxxYfznTNEePvgHYaA8sI0PbCzu8PTcOO/4TUTzTFQTu2ZBbYBL5qCI
S6MGs3aCdehGHda4B/0OnsyTDhgjLFhE37bRpqd4Us9Oicsy18WXEok9GkiD7/CS
unjL3wkTyiHVCtVLpPASm8MmnIdE4zIBGho2NBzADB4K5Tm+uJTrTmf2Vj+7BpYF
VdoLyZvyP6vjOpQSia8ixLnx3zgL914/3XInKo9Nr8RIi5C7WNbCx41PF9dwUWJ8
1PDaPXiud0YZV+6bd7A8OHmZab6AXKxCJXTZQLsGW9gCFIkopVG02Bz8FqOgjOGl
eW5v/VDNPBSPgkGWxn88fekHdrgckZs3IQpBYfGMtKQJASQnulEGjOKthIDwEWqJ
eb60nA1ExQMyDj7z0ds3v1bVrsHdhJCJG0U1eE2xruSj7yEku6O16AH/S+QzXA6y
X9yZN6nWZSBAkz0pNqRX0Vp3zf4i6d2UWrk1x96Ue+X/gYC2Vew=
=3SX5
-----END PGP SIGNATURE-----

--gatW/ieO32f1wygP--
