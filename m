Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp8518565wrv;
        Thu, 8 Aug 2019 17:11:04 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz2njJxv4YO/eMeL/jm9QZ1e5aToqNdSMM9vYTwINU3rGfxJBY8sk9uPYX8IJBWU5GCRYFw
X-Received: by 2002:a50:8d48:: with SMTP id t8mr6112307edt.200.1565309464167;
        Thu, 08 Aug 2019 17:11:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565309464; cv=none;
        d=google.com; s=arc-20160816;
        b=KUCpLU8HW42HNdjvJdBQENRUZlWyhaS6LBHApJxq7Iovz5UQvw1KvvVDDiam0ST4NE
         AH3ogNc+Qcl42KQr4Z1jkTBl/5s6ZTexF/q8ksts1klHzxXS74ZPxaTtCrhQhFV73aBt
         Z9gAreHVa2O3VFanAZPyxiTuLKZE/pRwN3VwMrG8GECIFnBCkcp+PPKQb1uRrWTgOKqa
         6+eaY9f2NmFt67M2V5WHFYNcB4uVk8NOqlPbVdJLAEEKkLHJRTbcGter5H+r3Mb0OvGw
         YrwgZdrwz7CcviFWSoVxW+ZW4LXBAX8sJQeFtYL8s6e0MfxNkAqrxSQEuTIHNYGwbhwr
         +/pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature;
        bh=oWhgwh+OiQo1pYcLeBgqb/qYXF/2emk412WEuqQwmZc=;
        b=PGIqpkgBJun3f6S5dD6YD18al9qjsRnb2ChZADQSIkAub41TV8Bw0p4GO9pT3rSxJ5
         w6tB9nHtUb75BIP4FjvUUHcUHlQdQCkqLT465ws6NSMfx8v7qM3qHCzJTAukxm10go8x
         jiPyuKgQdXSFNKNsfSpO4RbDrhV75ZlS8Q7WzT0DQAyOHUuxaqDGIUXNzBsXhtEeXt1+
         7ZFGBSVs4dq/tkwoH0PCXQnLd0r7zBQb+JBWTi6cgPGSA9LRJByC+YVntO+NceqFdwcr
         J+adEcGujd82K9ah1opyVZDarl4jD7Pd0aSFfBVMtijvRjAk/gWV5lWhyV91c4hp6ntf
         My9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=EbHsC4RQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s28si36370224edm.230.2019.08.08.17.11.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Aug 2019 17:11:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=EbHsC4RQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hvsUp-0005Tt-9h
	for alex.bennee@linaro.org; Thu, 08 Aug 2019 20:11:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56516)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgibson@ozlabs.org>) id 1hvsUg-0005Ph-2D
 for qemu-arm@nongnu.org; Thu, 08 Aug 2019 20:10:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1hvsUf-0004lr-7O
 for qemu-arm@nongnu.org; Thu, 08 Aug 2019 20:10:54 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:46525 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1hvsUe-0004kC-D3; Thu, 08 Aug 2019 20:10:53 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 464Qck63dtz9sBF; Fri,  9 Aug 2019 10:10:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1565309446;
 bh=AN94QMwsieMhIsnCFXfNJtGDm7IVYYOGo4Ng0rCno5g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EbHsC4RQSES79jjCvDvd+K5j/MyZfLaBHkJEUVz3/yvNcDtVlJPPo2u/9UPlgqNlB
 WmG4gp8pFUUJaSSZ3iqtCOI3V0JWZqoRgrSEYjFSyx5fS0TFu14HpKwTlOnfdPWjCt
 QaeIYX14rK1ZLzP4h924b4laNmah7QEJO/YJwVWA=
Date: Thu, 8 Aug 2019 16:47:12 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Message-ID: <20190808064712.GD5465@umbus.fritz.box>
References: <20190729145654.14644-1-damien.hedde@greensocs.com>
 <20190729145654.14644-6-damien.hedde@greensocs.com>
 <20190731060533.GD2032@umbus.fritz.box>
 <51aa7e6d-3568-8485-4b67-a598a24a1f3d@greensocs.com>
 <e7b05c24-ecd1-a437-7d97-07d69ab759ec@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="KdquIMZPjGJQvRdI"
Content-Disposition: inline
In-Reply-To: <e7b05c24-ecd1-a437-7d97-07d69ab759ec@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2401:3900:2:1::2
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 05/33] Switch to new api in
 qdev/bus
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
Cc: fam@euphon.net, peter.maydell@linaro.org, walling@linux.ibm.com,
 dmitry.fleytman@gmail.com, mst@redhat.com, mark.cave-ayland@ilande.co.uk,
 qemu-devel@nongnu.org, kraxel@redhat.com, edgar.iglesias@xilinx.com,
 hare@suse.com, qemu-block@nongnu.org, david@redhat.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, marcandre.lureau@redhat.com, thuth@redhat.com,
 ehabkost@redhat.com, alistair@alistair23.me, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, clg@kaod.org, jsnow@redhat.com, rth@twiddle.net,
 Damien Hedde <damien.hedde@greensocs.com>, berrange@redhat.com,
 cohuck@redhat.com, mark.burton@greensocs.com, qemu-ppc@nongnu.org,
 pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WSWQrLMF2/B4


--KdquIMZPjGJQvRdI
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 31, 2019 at 01:31:28PM +0200, Philippe Mathieu-Daud=E9 wrote:
> On 7/31/19 11:29 AM, Damien Hedde wrote:
> > On 7/31/19 8:05 AM, David Gibson wrote:
> >> On Mon, Jul 29, 2019 at 04:56:26PM +0200, Damien Hedde wrote:
> >>> Deprecate old reset apis and make them use the new one while they
> >>> are still used somewhere.
> >>>
> >>> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> >>> ---
> >>>  hw/core/qdev.c         | 22 +++-------------------
> >>>  include/hw/qdev-core.h | 28 ++++++++++++++++++++++------
> >>>  2 files changed, 25 insertions(+), 25 deletions(-)
> >>>
> >>> diff --git a/hw/core/qdev.c b/hw/core/qdev.c
> >>> index 559ced070d..e9e5f2d5f9 100644
> >>> --- a/hw/core/qdev.c
> >>> +++ b/hw/core/qdev.c
> >>> @@ -312,25 +312,9 @@ static void device_foreach_reset_child(Object *o=
bj, void (*func)(Object *))
> >>>      }
> >>>  }
> >>> =20
> >>> -static int qdev_reset_one(DeviceState *dev, void *opaque)
> >>> -{
> >>> -    device_legacy_reset(dev);
> >>> -
> >>> -    return 0;
> >>> -}
> >>> -
> >>> -static int qbus_reset_one(BusState *bus, void *opaque)
> >>> -{
> >>> -    BusClass *bc =3D BUS_GET_CLASS(bus);
> >>> -    if (bc->reset) {
> >>> -        bc->reset(bus);
> >>> -    }
> >>> -    return 0;
> >>> -}
> >>> -
> >>>  void qdev_reset_all(DeviceState *dev)
> >>>  {
> >>> -    qdev_walk_children(dev, NULL, NULL, qdev_reset_one, qbus_reset_o=
ne, NULL);
> >>> +    device_reset(dev, false);
> >>>  }
> >>> =20
> >>>  void qdev_reset_all_fn(void *opaque)
> >>> @@ -340,7 +324,7 @@ void qdev_reset_all_fn(void *opaque)
> >>> =20
> >>>  void qbus_reset_all(BusState *bus)
> >>>  {
> >>> -    qbus_walk_children(bus, NULL, NULL, qdev_reset_one, qbus_reset_o=
ne, NULL);
> >>> +    bus_reset(bus, false);
> >>>  }
> >>> =20
> >>>  void qbus_reset_all_fn(void *opaque)
> >>> @@ -922,7 +906,7 @@ static void device_set_realized(Object *obj, bool=
 value, Error **errp)
> >>>              }
> >>>          }
> >>>          if (dev->hotplugged) {
> >>> -            device_legacy_reset(dev);
> >>> +            device_reset(dev, true);
> >>
> >> So.. is this change in the device_reset() signature really necessary?
> >> Even if there are compelling reasons to handle warm reset in the new
> >> API, that doesn't been you need to change device_reset() itself from
> >> its established meaning of a cold (i.e. as per power cycle) reset.
> >> Warm resets are generally called in rather more specific circumstances
> >> (often under guest software direction) so it seems likely that users
> >> would want to engage with the new reset API directly.  Or we could
> >> just create a device_warm_reset() wrapper.  That would also avoid the
> >> bare boolean parameter, which is not great for readability (you have
> >> to look up the signature to have any idea what it means).
>=20
> If the boolean is not meaningful, we can use an enum...

That's certainly better, but I'm not seeing a compelling reason not to
have separate function names.  It's just as clear and means less churn.

>=20
> > I've added device_reset_cold/warm wrapper functions to avoid having to
> > pass the boolean parameter. it seems I forgot to use them in qdev.c
> > I suppose, like you said, we could live with
> > + no function with the boolean parameter
> > + device_reset doing cold reset
> > + device_reset_warm (or device_warm_reset) for the warm version
> >=20
> > Damien
> >=20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--KdquIMZPjGJQvRdI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl1LxW0ACgkQbDjKyiDZ
s5Jxfw//WtrJvoUNYAdiXZaOZxpcyKgroiTlPM+S9ursS8mv4OIeIl1MkJiNfw7F
ODFJENo9pbSsq9mDKvowt6O1kmuzRBIsaM3vo0ClFDMl49bYEWkP3W6m+YUDnteD
FLJmJeIXyOAlYmURmvslDWB4fXB1JWDCPKGYU/qjrWe/kP3PKMbsyrSML4GtWyZg
rk9sx/7evi8xTmQpjBqy/Kkbr5eKvSZrd+2gNJpmK9/pBbKxBXeZubIs2yGC9TU0
6e+VxkZYq2TOHoPgWHktU8aj/71oyc0W/IWSKfMqeLdekB1zVW47qEnqz9l4Hg9w
Cz/y6S94habmB/Xi4RERzw4VgYQhNZksyjqgAV5XYTODeDxoELk/hXJMqwtKE/FS
lxU1eyvaU2KPhf5lKmTd2ZaZb8AXYY1wiTvOO5xK7Pq0afISIWzCT3IXutV3HRaZ
pi6dggaAgORM7CbcgB4AAI+woHr8gQXhJn2cnv6fivIK/BrGJ7mPfbHi0r7C9AM3
kdLXDoOQ2hl4vuM49ywREtxCywxzIPt4cht+yVUF+rVkvZIv1RmaFkxJLxtIcsmC
f6cH0Vqdp0JvFmTZ0RVUzjEkK9j53Kd1FUDtWrqNHMAGpXG/ePQqAGgifprm1aE1
Eqw7sTaca+/3n8arKRo+x62y7knpAv/7pzRVKzj+WVS0kUyW6yA=
=wzJJ
-----END PGP SIGNATURE-----

--KdquIMZPjGJQvRdI--
