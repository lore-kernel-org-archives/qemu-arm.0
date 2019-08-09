Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp8784236wrv;
        Thu, 8 Aug 2019 23:09:21 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxezRKZx0xwhxb5bqU1J/m2wCdM2LQEyJ+5zWOc4IzwSB34NU+W+QhH6SBSN9SB949rnMlI
X-Received: by 2002:a50:f4b6:: with SMTP id s51mr8329359edm.204.1565330961669;
        Thu, 08 Aug 2019 23:09:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565330961; cv=none;
        d=google.com; s=arc-20160816;
        b=OU8F5Fz+L9HnRjkjY2OYh7zBYZiwH4nOGVtKib99eO+IcPSRo6B8/hsX9y78HhY2vL
         xsk9XQ6pdAQn24HKuekDECU5P2pw11/iMU/EyD3bCBhZGpIxWfo0EkX4C/0pE+P/OxnX
         rK93A6uB1C8iUZPJs14NivOcU3J0U7XS2fAgB/Wwi0VgHEzXaAnghOmrrCmV7F/IlwdO
         81rG8jbINikCpz1PnbvX16a2WcBZqgodT8NyHXJvV/D1n9fBBZEc1k5f+gJX5fFPihvk
         q24g5m8x7HWKwCtOBZ8oHHtDisDySz6Ij6RUFuNgKx+EJyiwqiWmkPWmdHfcxX09t2zd
         iUaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature;
        bh=JLyIlnbXxeKYP1oan7i361QQ1LhGrGkBDNohrzOrYZo=;
        b=Ab8R4HUkvm2Nyl8+WJ+jyUxl/8m4JUrt2Db1BRrUPYKNqC4ZL9dnEjUksVbWNRadQX
         OnI77QL+VZyyRPXtlrq3CrEhKVUt0F4ipEu16Btl40ix8TlYXxtV2yTqOvSd6KjF1Xq8
         I2H90eOq72zV0w8V1F7gbf396uRC+Kv2zm/OuXaHnWThNu20KeLNEl/Liaft4DhjZw7p
         0y7zNVCrtELCxeiBY5iHS2LUslzDEMitGsRf2pBjULYi6TxljJyPJvwxU0WSZhH1DXaQ
         /Qu7YF7OKOHmIQS75sHqkiQTMl1taqASlPs0WDh6CEBFafwluivvsVChj0LJObCaFTEP
         xXAg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=QiGJa6ET;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p7si31145751ejj.70.2019.08.08.23.09.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Aug 2019 23:09:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=QiGJa6ET;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hvy5Y-0002Ee-PX
	for alex.bennee@linaro.org; Fri, 09 Aug 2019 02:09:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39720)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgibson@ozlabs.org>) id 1hvy5S-0002EX-U4
 for qemu-arm@nongnu.org; Fri, 09 Aug 2019 02:09:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1hvy5R-00049X-Q6
 for qemu-arm@nongnu.org; Fri, 09 Aug 2019 02:09:14 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:58483 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1hvy5Q-00045H-Lg; Fri, 09 Aug 2019 02:09:13 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 464ZZD0P3Cz9sBF; Fri,  9 Aug 2019 16:09:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1565330948;
 bh=BJnhFgwWjf7MPkKsmVjfo3l7uUOX+9Duc5sGDkStrDA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QiGJa6ETG8j/OljNoX8SgJkVVEq+KDaCpXxezE+wcpPhODb2yPYm8ZV1v8dY9Reul
 nr7HymWW0uNPUoGnYl+IDpPRXB7N0CzKQZpy265hCbxdAz4DJpxjNNvH6LYJdZk3GH
 xtOxfwRZ0WxUekAB/ZLf7ehb1ZO4I0N371h+rj74=
Date: Fri, 9 Aug 2019 15:51:32 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20190809055132.GT5465@umbus.fritz.box>
References: <20190729145654.14644-1-damien.hedde@greensocs.com>
 <20190729145654.14644-9-damien.hedde@greensocs.com>
 <20190731061108.GF2032@umbus.fritz.box>
 <CAFEAcA-dSBpAVfjn7VnCRgnZabBP226ZVuSJYW1bwzEr5mNktw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="nDmTXYS4kVhtHHfR"
Content-Disposition: inline
In-Reply-To: <CAFEAcA-dSBpAVfjn7VnCRgnZabBP226ZVuSJYW1bwzEr5mNktw@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 203.11.71.1
Subject: Re: [Qemu-arm] [PATCH v3 08/33] Add function to control reset with
 gpio inputs
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, Collin Walling <walling@linux.ibm.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Edgar Iglesias <edgar.iglesias@xilinx.com>, Hannes Reinecke <hare@suse.com>,
 Qemu-block <qemu-block@nongnu.org>, David Hildenbrand <david@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-s390x <qemu-s390x@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Damien Hedde <damien.hedde@greensocs.com>,
 "Daniel P. Berrange" <berrange@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Mark Burton <mark.burton@greensocs.com>, qemu-ppc <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iW51apvn1KlN


--nDmTXYS4kVhtHHfR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 07, 2019 at 11:37:51AM +0100, Peter Maydell wrote:
> On Wed, 31 Jul 2019 at 07:33, David Gibson <david@gibson.dropbear.id.au> =
wrote:
> >
> > On Mon, Jul 29, 2019 at 04:56:29PM +0200, Damien Hedde wrote:
> > > It adds the possibility to add 2 gpios to control the warm and cold r=
eset.
> > > With theses ios, the reset can be maintained during some time.
> > > Each io is associated with a state to detect level changes.
> > >
> > > Vmstate subsections are also added to the existsing device_reset
> > > subsection.
> >
> > This doesn't seem like a thing that should be present on every single
> > DeviceState.
>=20
> It's a facility that's going to be useful to multiple different
> subclasses of DeviceState, so it seems to me cleaner to
> have base class support for the common feature rather than
> to reimplement it entirely from scratch in every subclass
> that wants it.

Hm, I suppose so.  Would it really have to be from scratch, though?
Couldn't some suitable helper functions make adding such GPIOs to a
device pretty straightforward?

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--nDmTXYS4kVhtHHfR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl1NCeQACgkQbDjKyiDZ
s5LALQ/9GC9HcolEmg7IRCZUguKfriab9vtzEkNKxO/k00LBjcGWnMp/hdA1kVBS
a/gexj5zW4F+/7CmGVkau4YMKXw9t5RFlCHAlTy4zjk3ayTBsU65E9M7T9Wl0hcW
uHG4MO2/5VVedLmC3PJ1+jtXl70e+eVUXzNixH2gYjijfIzCRCWIPuP1YSH8nFLW
o/7VvsIpI42BOgGwfLowGH6m30Yi+C6Mj9rdJHMxKSnECqHj7e80k3EzfHf1qtA7
4KJEgs6oFn1aHnlBbquT2MZKD60cXyFXWhXz62bZmK80B7sVGe0kRYZn1AGqGm9b
XZdso+pOinz8X+/RxR/8/WYCx3Waeh5+pgc3xJ7XnCMabIOUAEvtj/IFOMRDzCiS
Fzlh0YIbGprNuO/tXXFMNJ3cbOzZvLH3rENl9H66AeZf6Jt/R56dlLhfpAJAOy4L
CpX0nqIgvnezS7kyjvnOLzbilKonDbv/95Wp6GZ9smwC+F73/laSc8WXoM990tfo
1/0z5ZaB7d1Dchiw2lAiqTxShLAKLzWupvOWO0vzqOhi4nW82Eni4cpysxGFOu9u
8KXmZsmlttIVIbK1BgXHmF+4b22AN27f8Up9oPioJO96jfXoSP3ICGM0SNGSssLE
gMGH5wwNGkpR5HP0B1Z86pezpu1/NvxaNqtJ8MS9h/Cil/f5l64=
=/2DK
-----END PGP SIGNATURE-----

--nDmTXYS4kVhtHHfR--
