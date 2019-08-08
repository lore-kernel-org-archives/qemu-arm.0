Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp8520137wrv;
        Thu, 8 Aug 2019 17:13:04 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwrmIRe+pQATghNTgcGYcUwiGPbicAOphzb/Xr6Djw90GPljzjEr+DEiieJiXXCcnfcSvqE
X-Received: by 2002:a37:6146:: with SMTP id v67mr15824335qkb.493.1565309584404;
        Thu, 08 Aug 2019 17:13:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565309584; cv=none;
        d=google.com; s=arc-20160816;
        b=03loDwelooovPzwiq9YmnDBFliyEf+P99IHGd18gBnzCPN3G7ulN6/hxvBKnuJq9Rb
         YCw2JCl37dfcw93DSwD+3o0ZMiuXbXzy740XxzJwG8cnIBy0p6mHaYGHtRw2o9O2Zx6W
         +SBXvDmqgc2i3nqHqoFunPCjKN5pnMApPMi9jciIutbP9icxDeXdHa17Ts7meIF6iSr8
         417FVyA2xNV1rQj842zUJnkyE0sqPUqcchMpHNWHaYQLymL4/WG2YldQKHVSG80yUXBF
         63EmOEGMTgd74OncHHRgt4233NULNh/ZLFncfCWLFYpqB77xnG6/aibyiv6HU30XJGDV
         UexQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature;
        bh=FjdqgWsLXygNTJNjQi45Jz8MwC2UYxUe+12ZlMROkXI=;
        b=Q3kizeIQSIg1YIKdk8HJY24LIdcSPtEGms5cM4dbJjyLMrZtDBFslKNEXZkjif+RPr
         zY2cdqhVtQHqpKhWGZ7IMgN6xDTgM4V/fWquZ4UR5QmcPOSYq/eqhkyUfkM9Jzy8Fmze
         Ax9UnoDOmJoIltyMUuPty2y7fyhoks2kV5WxqBpbz/J+a7EVMHGVluCCk7wipe5O7Q9o
         +qRKA3aavBQH7fKF6yzRjMezrcvHoOgdmMhkXJq9hS/O0+NZhkJwM6ZWqiFPYwckjlVV
         qWFoQZ0kgLetFDwv7X3kKbIhDq8mnmAantBXvndKJvcS1dlRPZ7JAWzsT5TYHNxF/oGY
         EdVA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=Nd1getES;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v20si3701119qtk.88.2019.08.08.17.13.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Aug 2019 17:13:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=Nd1getES;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hvsWl-0001kq-VW
	for alex.bennee@linaro.org; Thu, 08 Aug 2019 20:13:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56596)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgibson@ozlabs.org>) id 1hvsUj-0005W7-Vz
 for qemu-devel@nongnu.org; Thu, 08 Aug 2019 20:10:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1hvsUj-0004p9-5t
 for qemu-devel@nongnu.org; Thu, 08 Aug 2019 20:10:57 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:53875 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1hvsUe-0004kF-8Z; Thu, 08 Aug 2019 20:10:53 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 464Qcl0YNtz9sND; Fri,  9 Aug 2019 10:10:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1565309447;
 bh=KtXmz4IYJ3+XqNaZdl9jHL1w1VOiuY+sMi9L/IYw0PE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Nd1getESQFGwndwJBCcNnM0nCtOeR2lc9G3RcZlS8Pa1Cc+xgu3eQ6JMro+2MbYRr
 UYy8aITePj4A76R7fcAKw9E9RGupxJmWXnBl3wauDkBCJTCmyGplY3CW/B8X01spGc
 N2fvCa5qKoSZHEu+n6wWtF1a1fD1bSmTQVqzBM9w=
Date: Thu, 8 Aug 2019 16:48:10 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Damien Hedde <damien.hedde@greensocs.com>
Message-ID: <20190808064810.GE5465@umbus.fritz.box>
References: <20190729145654.14644-1-damien.hedde@greensocs.com>
 <20190729145654.14644-6-damien.hedde@greensocs.com>
 <20190731060533.GD2032@umbus.fritz.box>
 <51aa7e6d-3568-8485-4b67-a598a24a1f3d@greensocs.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ZInfyf7laFu/Kiw7"
Content-Disposition: inline
In-Reply-To: <51aa7e6d-3568-8485-4b67-a598a24a1f3d@greensocs.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 203.11.71.1
Subject: Re: [Qemu-devel] [PATCH v3 05/33] Switch to new api in qdev/bus
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: fam@euphon.net, peter.maydell@linaro.org, walling@linux.ibm.com,
 dmitry.fleytman@gmail.com, mst@redhat.com, mark.cave-ayland@ilande.co.uk,
 qemu-devel@nongnu.org, kraxel@redhat.com, edgar.iglesias@xilinx.com,
 hare@suse.com, qemu-block@nongnu.org, david@redhat.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, marcandre.lureau@redhat.com, thuth@redhat.com,
 ehabkost@redhat.com, alistair@alistair23.me, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, clg@kaod.org, jsnow@redhat.com, rth@twiddle.net,
 berrange@redhat.com, cohuck@redhat.com, mark.burton@greensocs.com,
 qemu-ppc@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: E2mcnhhZi0F4


--ZInfyf7laFu/Kiw7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 31, 2019 at 11:29:36AM +0200, Damien Hedde wrote:
>=20
>=20
> On 7/31/19 8:05 AM, David Gibson wrote:
> > On Mon, Jul 29, 2019 at 04:56:26PM +0200, Damien Hedde wrote:
> >> Deprecate old reset apis and make them use the new one while they
> >> are still used somewhere.
> >>
> >> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> >> ---
> >>  hw/core/qdev.c         | 22 +++-------------------
> >>  include/hw/qdev-core.h | 28 ++++++++++++++++++++++------
> >>  2 files changed, 25 insertions(+), 25 deletions(-)
> >>
> >> diff --git a/hw/core/qdev.c b/hw/core/qdev.c
> >> index 559ced070d..e9e5f2d5f9 100644
> >> --- a/hw/core/qdev.c
> >> +++ b/hw/core/qdev.c
> >> @@ -312,25 +312,9 @@ static void device_foreach_reset_child(Object *ob=
j, void (*func)(Object *))
> >>      }
> >>  }
> >> =20
> >> -static int qdev_reset_one(DeviceState *dev, void *opaque)
> >> -{
> >> -    device_legacy_reset(dev);
> >> -
> >> -    return 0;
> >> -}
> >> -
> >> -static int qbus_reset_one(BusState *bus, void *opaque)
> >> -{
> >> -    BusClass *bc =3D BUS_GET_CLASS(bus);
> >> -    if (bc->reset) {
> >> -        bc->reset(bus);
> >> -    }
> >> -    return 0;
> >> -}
> >> -
> >>  void qdev_reset_all(DeviceState *dev)
> >>  {
> >> -    qdev_walk_children(dev, NULL, NULL, qdev_reset_one, qbus_reset_on=
e, NULL);
> >> +    device_reset(dev, false);
> >>  }
> >> =20
> >>  void qdev_reset_all_fn(void *opaque)
> >> @@ -340,7 +324,7 @@ void qdev_reset_all_fn(void *opaque)
> >> =20
> >>  void qbus_reset_all(BusState *bus)
> >>  {
> >> -    qbus_walk_children(bus, NULL, NULL, qdev_reset_one, qbus_reset_on=
e, NULL);
> >> +    bus_reset(bus, false);
> >>  }
> >> =20
> >>  void qbus_reset_all_fn(void *opaque)
> >> @@ -922,7 +906,7 @@ static void device_set_realized(Object *obj, bool =
value, Error **errp)
> >>              }
> >>          }
> >>          if (dev->hotplugged) {
> >> -            device_legacy_reset(dev);
> >> +            device_reset(dev, true);
> >=20
> > So.. is this change in the device_reset() signature really necessary?
> > Even if there are compelling reasons to handle warm reset in the new
> > API, that doesn't been you need to change device_reset() itself from
> > its established meaning of a cold (i.e. as per power cycle) reset.
> > Warm resets are generally called in rather more specific circumstances
> > (often under guest software direction) so it seems likely that users
> > would want to engage with the new reset API directly.  Or we could
> > just create a device_warm_reset() wrapper.  That would also avoid the
> > bare boolean parameter, which is not great for readability (you have
> > to look up the signature to have any idea what it means).
>=20
> I've added device_reset_cold/warm wrapper functions to avoid having to
> pass the boolean parameter. it seems I forgot to use them in qdev.c
> I suppose, like you said, we could live with
> + no function with the boolean parameter
> + device_reset doing cold reset
> + device_reset_warm (or device_warm_reset) for the warm version

Ok, good.

I'm afraid the whole series still makes me pretty uncomfortable,
though, since the whole "warm reset" concept still seems way to vague
to me.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--ZInfyf7laFu/Kiw7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl1LxaoACgkQbDjKyiDZ
s5LvXxAAwXnl73bl68b4Lmgt0Bw16kNIKHsIAv/Lp6RnpjIV1j4qDW/8hky3adKM
uqFMCAZJshIXddlkab6Ga/qZt05ymPbJK/JUQHCXbg5sTn9LX0ae5QkOlFcCg5FY
Pr47tAsAXfVOMyA04kre7gnS9ocgYhtCd3tVanbP+Guc8mBc2tfr/FdpyFwC2y0N
JNZRqjEP9Aa5aER7GHw5sRlc1FcfrLBYJp9lo2QAWLld+glmOkjQ6U7gDpDDauAc
ofFH7uAhvhnBYwqqnfEAXAQrQqDljwvVICuDMF2vFApuaXhCQga6tLIhV4We4XHY
KDnum0Vbp6707x5nilF2CL1fcRWeEJeeyuGuOwjrFabRnVIhY9dUfAPadlRx9GgF
rcOo5Tf4LXY/C43BlkVg6NvOC9EF4/E19UQkWJYfQLvvBGfpD3KtZuxcmL74ogLz
eb0m+DKg9uWxynux43YGVIyg7Gjk5dtSimHTXLCidqBwMP+G3IrulFbjtgrgOg6N
x6KXqqfa+1wYD9sg6kKIq90U5K+Zd/BEHkh367VIHY8usSuXFp5DExVSr2GijpT1
H8do/Dkeflov6uxD3CkkOKgMDNOZQVtLXLmpK17AM9SjNzRMFvBKYdrNx3VhSkJD
SC7cpFOCC/GEbtDE7RPto6KfMJW2uZaBMdq5OffPcN5fp1cTFY4=
=mxkY
-----END PGP SIGNATURE-----

--ZInfyf7laFu/Kiw7--
