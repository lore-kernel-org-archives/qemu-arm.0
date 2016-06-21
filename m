Received: by 10.25.21.96 with SMTP id l93csp1740570lfi;
        Mon, 20 Jun 2016 20:50:08 -0700 (PDT)
X-Received: by 10.55.13.11 with SMTP id 11mr2712320qkn.150.1466481008028;
        Mon, 20 Jun 2016 20:50:08 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p18si3571607qtp.80.2016.06.20.20.50.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 Jun 2016 20:50:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail (test mode) header.i=@aj.id.au;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47777 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bFChT-0004vv-8S
	for alex.bennee@linaro.org; Mon, 20 Jun 2016 23:50:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55855)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1bFChP-0004vW-7P
	for qemu-arm@nongnu.org; Mon, 20 Jun 2016 23:50:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1bFChL-0004zE-13
	for qemu-arm@nongnu.org; Mon, 20 Jun 2016 23:50:02 -0400
Received: from sub3.mail.dreamhost.com ([69.163.253.7]:50734
	helo=homiemail-a20.g.dreamhost.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>)
	id 1bFChK-0004ye-Nw; Mon, 20 Jun 2016 23:49:58 -0400
Received: from homiemail-a20.g.dreamhost.com (localhost [127.0.0.1])
	by homiemail-a20.g.dreamhost.com (Postfix) with ESMTP id 7D5CB7EC069;
	Mon, 20 Jun 2016 20:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
	:subject:from:reply-to:to:cc:date:in-reply-to:references
	:content-type:mime-version; s=aj.id.au; bh=QPJQ6rYszmtjb0uA8mZDA
	BASzho=; b=gQ2NeXrWId7lG9oiZshtOjonuLXlvp+/wgFGBdekXHMIfGV09T3+L
	qv3RDprTAyVKyFkDINL5JXE5cyLjn1xdh2oJHlEdbpt1KH1b6iCMQGTsIKDsK8pr
	+z+vEGlBZwYgDgq6GH2LlDn9LWLzdLv6goEPxx9Fv81vWCDfDkCyQI=
Received: from keelia (unknown [203.0.153.9])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: andrew@aj.id.au)
	by homiemail-a20.g.dreamhost.com (Postfix) with ESMTPSA id 1FD4F7EC061; 
	Mon, 20 Jun 2016 20:49:51 -0700 (PDT)
Message-ID: <1466480985.4344.50.camel@aj.id.au>
From: Andrew Jeffery <andrew@aj.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Jun 2016 13:19:45 +0930
In-Reply-To: <CAFEAcA_=5Dvg9R1o67b-5MuMZWtWbobywA+XzKuR-TeTCWfN0Q@mail.gmail.com>
References: <1466063287-19350-1-git-send-email-andrew@aj.id.au>
	<1466063287-19350-2-git-send-email-andrew@aj.id.au>
	<CAFEAcA_-+nWvAsCLE71d4qb_3eFkF80L-JgZSxwF5L3CH+W_Aw@mail.gmail.com>
	<1466394273.4344.25.camel@aj.id.au>
	<CAFEAcA_=5Dvg9R1o67b-5MuMZWtWbobywA+XzKuR-TeTCWfN0Q@mail.gmail.com>
Organization: IBM OzLabs
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-E1+5SghAKMXqEqQi+45D"
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 69.163.253.7
Subject: Re: [Qemu-arm] [PATCH 1/2] hw/misc: Add a model for the ASPEED
 System Control Unit
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
Reply-To: andrew@aj.id.au
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	=?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rd776TJu263S


--=-E1+5SghAKMXqEqQi+45D
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2016-06-20 at 14:57 +0100, Peter Maydell wrote:
> On 20 June 2016 at 04:44, Andrew Jeffery <andrew@aj.id.au> wrote:
> >=20
> > On Fri, 2016-06-17 at 15:22 +0100, Peter Maydell wrote:
> > >=20
> > > +static Property aspeed_scu_properties[] =3D {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0DEFINE_PROP_ARRAY("reset", AspeedSCUState, n=
um_resets, reset,
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0qdev_prop=
_uint32, uint32_t),
> > > +=C2=A0=C2=A0=C2=A0=C2=A0DEFINE_PROP_END_OF_LIST(),
> > > +};
> > > +
> > > +#define ASPEED_SCU_NR_REGS (0x1A8 >> 2)
> > > This seems like a very unwieldy way of specifying the reset values
> > > for this device. Are they really all fully configurable in the
> > > hardware? It seems unlikely. I'd much rather see something that
> > > looks more like what you might plausibly be configuring when wiring
> > > up the SoC, which might be some version/revision numbers and/or
> > > some particular tweakable parameters.
> > Right. I left out some context which may clear things up: We are
> > working with two SoCs at the moment, the AST2400 and AST2500 (hopefully
> > the AST2500 patches will be sent to the list soon). I wanted to
> > abstract the configuration to cater for the differences in register
> > values between the SoCs, less so for wiring the one SoC up in a
> > different fashion. For what it's worth, out of 86 registers defined in
> > the IO space between the two SoCs, 37 take the same value and 49
> > differ.
> I think there are a couple of plausible ways you might model this:
>=20
> (a) just have a single property for "revision" which corresponds
> to the revision of this bit of silicon IP within the SoC; the
> model of the device itself then knows what the reset state is
> for this revision of the device.
> (b) ditto, but also have some configurable flags where relevant
> (ie approximately where it's the same IP rev within the SoC
> but it's been configured by tying down different config lines;
> for instance hw/dma/pl330.c has a collection of properties
> which match the configurable knobs for the hardware.)

Okay. I think (b) is the most appropriate. The board-controllable bits
are primarily in the hardware strapping register. The register is
composed of fields of mostly unrelated bits, so we could go two ways
here:

(1) expose the register through a single 32bit property
(2) break out a property for each bitfield

Do you have a preference? grepping the tree suggests there isn't a
precedent for "large" numbers of properties* so maybe (2) is overkill,
but (1) feels like it might fit into the overly-general-interface
problem that we're trying to eliminate.

* Seems the microblaze CPU defines the most with 9 properties? Approach
(2) will leave us with 21 properties for the SCU.

    $ git grep -c DEFINE_PROP | sort -t: -k2 -r | head -n1
    target-microblaze/cpu.c:9

>=20
> You might or might not have enough visibility into the thing to
> know which of these is closest to what the real hardware is doing;
> if not then it's a matter of taste, looking at what is varying
> between the two and what isn't, etc. But "board level specifies
> all the register reset values" is definitely far too broad
> and generalised an API, I think.
>=20
> >=20
> > Separately, the qdev array approach was lifted from your commit
> > 9c7d489379c2 hw/vexpress: Set reset values for daughterboard
> > oscillators.
> You'll notice that we only configure the specific things
> that need configuring with interfaces specific to those things
> (eg "daughterboard clocks" and "daughterboard voltages" are
> separate), not a single "have a complete set of register values" API.

Yes, I appreciate that now. Thanks.

Andrew
--=-E1+5SghAKMXqEqQi+45D
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXaLlZAAoJEJ0dnzgO5LT5lcAP/28KXy/BtenMkzsff4l33TwC
hz7PVF7Ld/iozyvCNkpXqJ44VJ6EzOjEtWM5xCsH95lUOt0X39hicPjRrzdI2DTr
0YAH0ypIkaYQJHLmw38NzDaIfug7E9BsOFkuJGXLw6eMef8B4WKuTmffYR9WbnEU
CGqjgJESLmtgdF2i1okHSHCYs9V7JCcHZeDMpK4iunkMf9kMfa4fu23gzN28uQ9+
ryIrSkerJGdrhw0fnT4tnwLFur3QQg5Uv+4ffSg7ngHjiPxtfvE2mkgcKLW3NFTF
4yAJ5PNz1hHcqHy8tRAtw+N0Dsd2F0/Sl9s/UJUbRU9bVtsRSSATJG34QXzt7DRq
rDZpviz/GhFaZSdU1fpZvhYhicGZZlj15s9dAeqOIMNaYxaSBEWp0lAiqRmbbqX1
tDd06+vjK3Trd1bITHAEuOojYHH/YspfrCNxe5tCSPGTY7f8uYFowq+z5BtGZDnQ
XT8ZGk45VbVQ5zLjgJGFrhK+x4TNAet3v+GEgirbaTpkJpK4LN+O6tPI3PZJEGUY
pgQtqd08hKHXqPxZh6N74MxuqSkdVrAmD7Adb1qkuNL+/fZy8kFXr8A41PzcTmcy
JkHbfrOuXEIIWmxKaMw1Rn8q26oNdN9fcXTDwRru7kVzAR5aq3+zPbWbe9RZVj6A
VYnXxRBdEVau8sZtc2nz
=GUcL
-----END PGP SIGNATURE-----

--=-E1+5SghAKMXqEqQi+45D--

