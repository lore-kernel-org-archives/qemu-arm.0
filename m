Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp586947wrs;
        Mon, 12 Aug 2019 06:55:00 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz4lcoWZEnef9bdMDTkD+mbKQ5/7gpIO53roxXIQwIhbEmHlactTcd0QyehWjISJKVKhxdB
X-Received: by 2002:ac8:1b92:: with SMTP id z18mr30703361qtj.348.1565618100508;
        Mon, 12 Aug 2019 06:55:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565618100; cv=none;
        d=google.com; s=arc-20160816;
        b=xyz1yCVRCC1HIH46pEWUk4+rvH4+8nw+4Nq2bm1X3KN9cPf3/2UC+q0mgZJUtLp4uG
         +d3HJcoL9kca+JY1pVR9GJladOwCqXwIcD/lx0xRJdD8xzKbcExc+KZQYg0jXBgCZ1AR
         wgkqVKH6BsB7l4dWcwjyn2aKpBttRfsqkoRg7KQwRaLt4SiSlch6I05bFR0zHXdaCnoX
         b0qLC8imMfI2YFpI7G/ERBFJ6dTuIRaB0wbPd+VsqY2qYdAPfVVoOywEKMuiuBmPQEtn
         xKiWpzdukv1JsSLNI8E4Sn0P1VBLP217sC5KLCb21Q6jrIvUoZxnmrKfAZwlSJqMWhoN
         VZng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature;
        bh=QiUrHP37B01J1fHlym4i9WI8LY8PFlJLT/XqdTuopcU=;
        b=VPwuHf6TjhwfhSdwYQ/gZL/WyXQBNWBOnu6cXH2d5vpcBUaeTBbm/sltSRZageBsLe
         E2p7aeg9dzih9PoY1mtTQFivwe/QMKqiwzOvTzrSdi9+TcLA5IUIqjUZznyuJwbj6qys
         7igMHg8FmyuUzXapxYw7JWkJCeT9dLPd179e4DWN+9SgFvqd0D7azTC5G7kjIDynool4
         5VxZbD9Eyf1mQYaXBvBG86wWnoqV8vobcaHlTRq6JR+Vo1QZ/mHtulDMAqmqQ7dzoqKo
         GlD8ntTo1JSE4vPkQe7xUZ2X8gldiKjQYYhE11FlsGiAPe6OvDdroM5mPNPzsGszbcEf
         xWtw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=g73BN22O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h51si66493124qte.161.2019.08.12.06.55.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Aug 2019 06:55:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=g73BN22O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hxAmq-0006cE-30
	for alex.bennee@linaro.org; Mon, 12 Aug 2019 09:55:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57705)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgibson@ozlabs.org>) id 1hxAmK-0006MQ-2G
 for qemu-arm@nongnu.org; Mon, 12 Aug 2019 09:54:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1hxAmI-0008QQ-Gm
 for qemu-arm@nongnu.org; Mon, 12 Aug 2019 09:54:28 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:53787 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1hxAmH-0008N0-5x; Mon, 12 Aug 2019 09:54:26 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 466cld2C58z9sP7; Mon, 12 Aug 2019 23:54:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1565618061;
 bh=4k4hvjkmZHk4WtP1cxZ2q5n1dzMmJDYwv/GdxZUpKs0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=g73BN22OvzS5/OqWjmP04XXqe/09ddPBm5uaIQNEPlLlHo2ZQwQ7NlkIBd4fZ5B04
 +LA/Dogf4tXA5whowIyFshJJR/3xDjV3JtWK36Hor+vsX+EmhkBcDC1dsYAAgyXxLN
 qWm3R2edfb0FAU5caWIWWV0B3kE3XLhm8NpRxljM=
Date: Mon, 12 Aug 2019 20:28:39 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Damien Hedde <damien.hedde@greensocs.com>
Message-ID: <20190812102839.GI3947@umbus.fritz.box>
References: <20190729145654.14644-1-damien.hedde@greensocs.com>
 <20190729145654.14644-5-damien.hedde@greensocs.com>
 <20190731055640.GC2032@umbus.fritz.box>
 <98250dc3-c2db-844d-f9f5-46a27488e94f@greensocs.com>
 <20190806003504.GC14494@umbus.fritz.box>
 <5da257a8-6d35-8618-2fa2-38cb2ed19fb4@greensocs.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="svExV93C05KqedWb"
Content-Disposition: inline
In-Reply-To: <5da257a8-6d35-8618-2fa2-38cb2ed19fb4@greensocs.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 203.11.71.1
Subject: Re: [Qemu-arm] [PATCH v3 04/33] make Device and Bus Resettable
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
 borntraeger@de.ibm.com, marcel.apfelbaum@gmail.com,
 marcandre.lureau@redhat.com, thuth@redhat.com, ehabkost@redhat.com,
 alistair@alistair23.me, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 clg@kaod.org, jsnow@redhat.com, rth@twiddle.net, berrange@redhat.com,
 cohuck@redhat.com, mark.burton@greensocs.com, qemu-ppc@nongnu.org,
 pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8CsyHcGZM8li


--svExV93C05KqedWb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 07, 2019 at 09:55:13AM +0200, Damien Hedde wrote:
>=20
>=20
> On 8/6/19 2:35 AM, David Gibson wrote:
> > On Wed, Jul 31, 2019 at 11:09:05AM +0200, Damien Hedde wrote:
> >>
> >>
> >> On 7/31/19 7:56 AM, David Gibson wrote:
> >>> On Mon, Jul 29, 2019 at 04:56:25PM +0200, Damien Hedde wrote:
> >>>> This add Resettable interface implementation for both Bus and Device.
> >>>>
> >>>> *resetting* counter and *reset_is_cold* flag are added in DeviceState
> >>>> and BusState.
> >>>>
> >>>> Compatibility with existing code base is ensured.
> >>>> The legacy bus or device reset method is called in the new exit phase
> >>>> and the other 2 phases are let empty. Using the exit phase guarantee=
 that
> >>>> legacy resets are called in the "post" order (ie: children then pare=
nt)
> >>>> in hierarchical reset. That is the same order as legacy qdev_reset_a=
ll
> >>>> or qbus_reset_all were using.
> >>>>
> >>>> New *device_reset* and *bus_reset* function are proposed with an
> >>>> additional boolean argument telling whether the reset is cold or war=
m.
> >>>> Helper functions *device_reset_[warm|cold]* and *bus_reset_[warm|col=
d]*
> >>>> are defined also as helpers.
> >>>>
> >>>> Also add a [device|bus]_is_resetting and [device|bus]_is_reset_cold
> >>>> functions telling respectively whether the object is currently under=
 reset and
> >>>> if the current reset is cold or not.
> >>>>
> >>>> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> >>>> ---
> >>>>  hw/core/bus.c          | 85 +++++++++++++++++++++++++++++++++++++++=
+++
> >>>>  hw/core/qdev.c         | 82 ++++++++++++++++++++++++++++++++++++++++
> >>>>  include/hw/qdev-core.h | 84 ++++++++++++++++++++++++++++++++++++++-=
--
> >>>>  tests/Makefile.include |  1 +
> >>>>  4 files changed, 247 insertions(+), 5 deletions(-)
> >>>>
> >>>> diff --git a/hw/core/bus.c b/hw/core/bus.c
> >>>> index 17bc1edcde..08a97addb6 100644
> >>>> --- a/hw/core/bus.c
> >>>> +++ b/hw/core/bus.c
> >>>> @@ -22,6 +22,7 @@
> >>>>  #include "qemu/module.h"
> >>>>  #include "hw/qdev.h"
> >>>>  #include "qapi/error.h"
> >>>> +#include "hw/resettable.h"
> >>>> =20
> >>>>  void qbus_set_hotplug_handler(BusState *bus, Object *handler, Error=
 **errp)
> >>>>  {
> >>>> @@ -68,6 +69,75 @@ int qbus_walk_children(BusState *bus,
> >>>>      return 0;
> >>>>  }
> >>>> =20
> >>>> +void bus_reset(BusState *bus, bool cold)
> >>>> +{
> >>>> +    resettable_reset(OBJECT(bus), cold);
> >>>> +}
> >>>> +
> >>>> +bool bus_is_resetting(BusState *bus)
> >>>> +{
> >>>> +    return (bus->resetting !=3D 0);
> >>>> +}
> >>>> +
> >>>> +bool bus_is_reset_cold(BusState *bus)
> >>>> +{
> >>>> +    return bus->reset_is_cold;
> >>>> +}
> >>>> +
> >>>> +static uint32_t bus_get_reset_count(Object *obj)
> >>>> +{
> >>>> +    BusState *bus =3D BUS(obj);
> >>>> +    return bus->resetting;
> >>>> +}
> >>>> +
> >>>> +static uint32_t bus_increment_reset_count(Object *obj)
> >>>> +{
> >>>> +    BusState *bus =3D BUS(obj);
> >>>> +    return ++bus->resetting;
> >>>> +}
> >>>> +
> >>>> +static uint32_t bus_decrement_reset_count(Object *obj)
> >>>> +{
> >>>> +    BusState *bus =3D BUS(obj);
> >>>> +    return --bus->resetting;
> >>>> +}
> >>>> +
> >>>> +static bool bus_set_reset_cold(Object *obj, bool cold)
> >>>> +{
> >>>> +    BusState *bus =3D BUS(obj);
> >>>> +    bool old =3D bus->reset_is_cold;
> >>>> +    bus->reset_is_cold =3D cold;
> >>>> +    return old;
> >>>> +}
> >>>> +
> >>>> +static bool bus_set_hold_needed(Object *obj, bool hold_needed)
> >>>> +{
> >>>> +    BusState *bus =3D BUS(obj);
> >>>> +    bool old =3D bus->reset_hold_needed;
> >>>> +    bus->reset_hold_needed =3D hold_needed;
> >>>> +    return old;
> >>>> +}
> >>>> +
> >>>> +static void bus_foreach_reset_child(Object *obj, void (*func)(Objec=
t *))
> >>>> +{
> >>>> +    BusState *bus =3D BUS(obj);
> >>>> +    BusChild *kid;
> >>>> +
> >>>> +    QTAILQ_FOREACH(kid, &bus->children, sibling) {
> >>>> +        func(OBJECT(kid->child));
> >>>> +    }
> >>>> +}
> >>>
> >>> IIUC, every resettable class would need more or less identical
> >>> implementations of the above.  That seems like an awful lot of
> >>> boilerplate.
> >>
> >> Do you mean the get/increment_count/decrement_count, set_cold/hold par=
t ?
> >> True, but it's limited to the base classes.
> >> Since Resettable is an interface, we have no state there to store what
> >> we need. Only alternative is to have some kind of single
> >> get_resettable_state method returning a pointer to the state (allowing
> >> us to keep the functions in the interface code).
> >> Beyond Device and Bus, which are done here, there is probably not so
> >> many class candidates for the Resettable interface.
> >=20
> > Right.  I can't immediately see a better way to handle this, but it
> > still seems like a mild code smell.
> >=20
>=20
> Only definitive solution to this would be to make DeviceClass and
> BusClass inherit from a common Resettable object.
>=20
> Would it be better if I use a common struct (eg: ResettableState)
> holding the different fields ?

Maybe, yeah.

> Then I can have a single implementation of the method and do for example:
> static uint32_t bus_decrement_reset_count(Object *obj)
> {
>      return decrement_reset_count(&(BUS(obj))->reset_state);
> }
> static uint32_t device_decrement_reset_count(Object *obj)
> {
>      return decrement_reset_count(&(DEV(dev))->reset_state);
> }
>=20
> I can also merge the 3 count related method into one if it helps.



--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--svExV93C05KqedWb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl1RP1cACgkQbDjKyiDZ
s5LyWRAAgOMxJ1nkwXnM5sY5I27dD2Rtr2DgTU/QLUfFhdaCBKUCbAD7cPlsXO6D
HbeUz/ZGF1AoxDsdLd6xOXUnrhs7kSdmoEHfowbS0pzRx9XzIWflsP/nU2sRdGA8
7GeMUN43B/3Q1r66PIP96KDnNaB3QQz1jiwBDV7ARcsoxRMAHOEeLittTO+S8kw+
yrRX77/21L0ve3SK75s2clLUfAKMIYB1FNCUNiE88yQjBCKCm50ySu6gt1n46aBN
8XHE2w/ljIgc/waX08JV+DIyPJq2IrkR9C3JmnNkOUGxHIt7VMJeMypoQY/q0S94
b39L5yNPA5w6+4i+5crb4tmywM5SeTVjknbW7DDA27qhhV7tnYRgWKx7E9JhcE2M
ZQoWBGqCXFRyEPq4cUDrb48+s0bg3XiiMvEHCc7y6bzxqt1xmv6I7F14zoDYIl8J
c/893K5maejq+AMUMLM977UTFjUSZqY9ItmGaNyohIh/qc7uxLmHtuV8+kGl3SZR
qaxWG+NK54XMuD5WvSDAmRwmmKfPDLtFqPR0BZ7Mv44xCSNLGoM13EnFF11LFutE
KLBBAPV0gyrWst/0ZgOLdJU0zLkV1USyPZK1bBk492sBWATHHCHRnLdLl+JbIDPh
3SIN0JvzrgP+mAQ30e0Dv0bB73A9F+ySAzxQbfDJOMmlAyJS4pk=
=hB0x
-----END PGP SIGNATURE-----

--svExV93C05KqedWb--
