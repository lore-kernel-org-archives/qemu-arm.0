Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp587376wrs;
        Mon, 12 Aug 2019 06:55:23 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyjPZHyWKgUeAksQkEw85aShfa+VjeCTfx8toOfTnN88npBVxW7doDiE0b0VOXGN9IQn87T
X-Received: by 2002:a0c:d851:: with SMTP id i17mr30275199qvj.243.1565618123036;
        Mon, 12 Aug 2019 06:55:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565618123; cv=none;
        d=google.com; s=arc-20160816;
        b=Q4UPhW6Gp/AFidM8pL5g8Qog6QvP1X8L8xfJnQlj2Yedgsl479R9VjbSY5j1dmxvcf
         HFnKHkBcOyEI8RnsuoYmg1jmXBVqgeuKW2ZBIX3G7hHRrqeKSpKGWB+oZwVD24n3J3i1
         Ioi2rTguPBGnN27Z0KSrhTQITURoSF8iFyLxhSqgdwNyNT4DR9pfebNKUkpkZEVyrVxg
         6NPvwukebwuBa+TB9bjZjewiOPNbBRVBZJ6Wyqdo13oTOJTBzTz9hCLUqlhuuW5e8Lj7
         f84HwTRg4y6Fu2q+tc5P0SAMn8DBJEk5uWiq3aXqCGlzh7wkKXzPNezWqc3DqlX9uuGr
         6slQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature;
        bh=IVxEPIYAxWE8MpGQEy/KAZsOrYSXwBmIaNM01FAtPVk=;
        b=LqGrey99czcNl7309VPlszC21JjpXFqDLwSKVfu7WQwtDNjcBfroiZUmA9LyYihpoz
         g8GaYlYRmjfeVGhdD89673l/z9A1bwW5Oa3BzUK94aeAX1ijMYXcdJKGx9YHhYnwFZ5X
         SKrnh6vUjay3jdqmA/Ye9YknLHQJdlEPf2Odfs9xWRAGuRyk8hseLTQDxiw9/VIiFj0b
         H5v2T6Ypdb76mpsWB9JZPBO1rmpV9DHjCt81ZhbZiA1ISkBwJnb6eMLZz6pKIkZAGIaK
         BMnvT37qRjw4ntQsll4LbixaT02VWr78fTzn9iTFs0By2SSbaQJAu+EFxZB2pAJnQGNQ
         JXcw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=mnb59zpw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d45si22581406qtc.29.2019.08.12.06.55.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Aug 2019 06:55:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=mnb59zpw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hxAnC-0007Pf-I4
	for alex.bennee@linaro.org; Mon, 12 Aug 2019 09:55:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57784)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgibson@ozlabs.org>) id 1hxAmN-0006OH-Aa
 for qemu-arm@nongnu.org; Mon, 12 Aug 2019 09:54:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1hxAmL-0008Sd-QN
 for qemu-arm@nongnu.org; Mon, 12 Aug 2019 09:54:31 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:53605 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1hxAmL-0008N4-40; Mon, 12 Aug 2019 09:54:29 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 466cld0gM0z9sNC; Mon, 12 Aug 2019 23:54:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1565618061;
 bh=zVrGQfrCusMEUgGiMyIBZus2dtg+PPa8r7mC6nWLRFg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mnb59zpwLqSWGH4HHAoH6rR53pgWwpNrrJcjB2K1aju3XMzQvfHYw+QCpMujzEMjF
 n1ZD0zRrUtmQvSbgLI6ZdTCRTcXPTj4Iju5vKC1d54UyLN3tK3Q/TjtInwRZnH0M0F
 AWcaoXpyy1GVGAfeEuCmHJuERlxf172yb/rR4NJA=
Date: Mon, 12 Aug 2019 20:27:24 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Damien Hedde <damien.hedde@greensocs.com>
Message-ID: <20190812102724.GH3947@umbus.fritz.box>
References: <20190729145654.14644-1-damien.hedde@greensocs.com>
 <20190729145654.14644-2-damien.hedde@greensocs.com>
 <20190730154209.2049f10a.cohuck@redhat.com>
 <CAFEAcA-rwBiXkDEDuT-=KQVJ2A2ob16=P0obbZBPUfZeYXy+dQ@mail.gmail.com>
 <20190730155547.7b201f5e.cohuck@redhat.com>
 <CAFEAcA_BU3DECLVv2QD_RshR0OL3=GqGwsm0YAmEAE6_SpW=HA@mail.gmail.com>
 <34a216b0-0067-8627-599c-6a67622c4bd2@greensocs.com>
 <20190731054612.GA2032@umbus.fritz.box>
 <1ed75cda-805e-af0b-77f5-62b9bc489e95@greensocs.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="BXr400anF0jyguTS"
Content-Disposition: inline
In-Reply-To: <1ed75cda-805e-af0b-77f5-62b9bc489e95@greensocs.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2401:3900:2:1::2
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 01/33] Create Resettable QOM
 interface
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Collin Walling <walling@linux.ibm.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Edgar Iglesias <edgar.iglesias@xilinx.com>, Hannes Reinecke <hare@suse.com>,
 Qemu-block <qemu-block@nongnu.org>, David Hildenbrand <david@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-s390x <qemu-s390x@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>,
 "Daniel P. Berrange" <berrange@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Mark Burton <mark.burton@greensocs.com>, qemu-ppc <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: e96osBFGrtb1


--BXr400anF0jyguTS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 01, 2019 at 11:35:20AM +0200, Damien Hedde wrote:
>=20
>=20
> On 7/31/19 7:46 AM, David Gibson wrote:
> > On Tue, Jul 30, 2019 at 04:08:59PM +0200, Damien Hedde wrote:
> >>
> >> On 7/30/19 3:59 PM, Peter Maydell wrote:
> >>> On Tue, 30 Jul 2019 at 14:56, Cornelia Huck <cohuck@redhat.com> wrote:
> >>>>
> >>>> On Tue, 30 Jul 2019 14:44:21 +0100
> >>>> Peter Maydell <peter.maydell@linaro.org> wrote:
> >>>>
> >>>>> On Tue, 30 Jul 2019 at 14:42, Cornelia Huck <cohuck@redhat.com> wro=
te:
> >>>>>> I'm having a hard time figuring out what a 'cold' or a 'warm' rese=
t is
> >>>>>> supposed to be... can you add a definition/guideline somewhere?
> >>>>>
> >>>>> Generally "cold" reset is "power on" and "warm" is "we were already
> >>>>> powered-on, but somebody flipped a reset line somewhere".
> >>>>
> >>>> Ok, that makes sense... my main concern is to distinguish that in a
> >>>> generic way, as it is a generic interface. What about adding somethi=
ng
> >>>> like:
> >>>>
> >>>> "A 'cold' reset means that the object to be reset is initially reset=
; a 'warm'
> >>>> reset means that the object to be reset has already been initialized=
=2E"
> >>>>
> >>>> Or is that again too generic?
> >>>
> >>> I think it doesn't quite capture the idea -- an object can have alrea=
dy
> >>> been reset and then get a 'cold' reset: this is like having a powered=
-on
> >>> machine and then power-cycling it.
> >>>
> >>> The 'warm' reset is the vaguer one, because the specific behaviour
> >>> is somewhat device-dependent (many devices might not have any
> >>> difference from 'cold' reset, for those that do the exact detail
> >>> of what doesn't get reset on warm-reset will vary). But every
> >>> device should have some kind of "as if you power-cycled it" (or
> >>> for QEMU, "go back to the same state as if you just started QEMU on t=
he
> >>> command line"). Our current "reset" method is really cold-reset.
> >>>
> >>
> >> Exactly. In the following patches, I've tried to replace existing reset
> >> calls by cold or warm reset depending on whether:
> >> + it is called through the main system reset -> cold
> >> + it is called during normal life-time       -> warm
> >>
> >> But I definitely can add some docs/comments to better explain that.
> >=20
> > Hrm, that helps, but it still seems pretty vague to me.
> >=20
> > It's not really my call, but building the concept of warm versus cold
> > resets into such a generic interface seems pretty dubios to me.  While
> > it's moderately common for things to have a notion of warm versus cold
> > reset it's certainly not universal.  There are many devices where
> > there's no meaningful difference between the two.  There are some
> > devices where there are > 2 different types of reset suitable for
> > various different situations.
> >=20
> > Is there any way this could work with it usually just presenting the
> > cold reset (which is the closest to a universal concept), and any warm
> > or additional resets are handled buy a different instance of the
> > Resettable interface?
> >=20
>=20
> In my current implementation, cold/warm is only a question of setting a
> flag before calling the reset methods. I rely and the reset methods to
> check that flag if necessary. The feature can be added/removed without
> pain (if we stick with device_reset to do a cold one). So if it's
> better, I can put it aside for now.
>=20
> IMO handling warm reset with another interface is probably not a good
> idea because it will need another load of methods.

I was thinking of a different instance of the same interface, not a
new interface.  But on consideration that probably means dummy objects
so that's also ugly.


Here's another way to look at things though: I can see why a common
interface for cold resets is useful; we use it during system resets
and bus resets and so forth.  But AIUI, in order to do a warm reset
whatever is initiating it is going to need to know what a warm reset
means for this device - in which case it doesn't really need a uniform
interface for it.

So, would we be better off with helper functions to make implementing
a multi-phase reset easy for devices that do have one or more notions
of a warm reset.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--BXr400anF0jyguTS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl1RPwUACgkQbDjKyiDZ
s5IgqA//UNXUdn3882RBsc4XyGEVSeOa0Jpu3ByS7yP8vKpwnzAL8uDhGTzZ8b+n
MdZFdH5DKx5BnEh6g6a6SSvYXF7Yx43MfR4SyLJDO2hC87Xg0yAdgYFQ5fWCltzH
iEF1RDZDqY3RPazdJrnPifTcEnCAuPRcob1hFsZX9w2YJXvmJDzI/P+NLNg7aymT
CPGhsRSJTMQwL+6cabDnYsSJwxYNtyPsocsU+Sj4VvB9zYNGSDWaB8JDKE7RtAg9
87TE8HIymCbTTDM3I0hl6HiDQcoi4U2Q3ItUHjgiZ5SoYX32uFpE85k9PDuYnmVU
Zxf/KwBT4twlgEWbMgWvlqx0akTzouUbwNRAHXtINtkdI00tI9ttsEfJDrJrR0v/
xcaE2QJEs0EhKRUCLrezDr57wfRUbRgsYHfOOnJZUzCEBJuhwlzZzSrm6VuffgBo
z0gJqrW5rrpemzZJr2eP5StYOCpwsdTn5gw9FbTMrntzdXbaw2ySDDuDm7sHdZjU
j2qxtBc7VIYs0oqmYc119Cy/OiXJDiHwHxizN1PlU6kwpKHfknW529N7h0G/KWvz
JEtbvMcJs69H3RKWjMNkhIxd4v8wX2tYAJNKEXNb6AczTJ0Id7mRQJC7OzopJV8r
Ul+BtxGVo6usa7WWBuLXDkGfV0/hZlE3/m9c2Hr9TH9abS88qlg=
=HdH0
-----END PGP SIGNATURE-----

--BXr400anF0jyguTS--
