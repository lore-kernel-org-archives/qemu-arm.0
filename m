Received: by 10.28.4.212 with SMTP id 203csp450812wme;
        Thu, 19 Apr 2018 02:48:17 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZp/R8/L5EBdIsm7oH1HhOQMtjwlZmFdEPDz3UX01876r6t/nauDL+SPRYxhPebd4ywB+PD0
X-Received: by 10.55.31.220 with SMTP id n89mr5065118qkh.408.1524131297012;
        Thu, 19 Apr 2018 02:48:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524131297; cv=none;
        d=google.com; s=arc-20160816;
        b=bsVeEWBtjU6FLE+DonNMAq7U3xb3Tp1t7Vg0nIqo8LqeBFGTQSNvh/fQHAg5eu9j4r
         upzpy3roYvZZW0sEyY8uPzYnYNJj7Da4GtRXjI+/48iwmiFUp/v0ASPtMg1S7SIFHpYs
         QwiuDJxZM6X5H+qP3hyLJTU4ja65L8PbYDJ0a/qSkRrBpB/z+ie34vLKg5HuE+9XIQk/
         LR7mLj+ikVWIT5aQj7wMQBWchdQ4wL55XAcxZwQg5QTWDs4zLxznxf1HAQR7IGDI14He
         FEO4OMtfwMHSExccz9WZTBuUIVenEp3hmI38m3uBmPEVm3/5cR6LqtCW1bEhg0a7VERB
         UFNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=lyki/vr0YtsABMPvJkUmEp4SgKnO3ACJDAAEQx8Jxu8=;
        b=EX3dm+iv+ILX9m7FCAaUgQUBvYqH/QyWGi3I2Ixar7reR1UrzmbfGsyC6qzBulXOps
         l95qTYLym0ZlTeskx4Y14D7l/2wDiTj6+aSr7t9/K40+/1wiXvgIUYSMCidAxKhDUZOp
         7oHMPLtUgBfnJypqrKwmuXQMRuf/BmtsktVsWh/VeUzWBRyoCb2vlnSJZ3AHqwbAiXX9
         2HGubenh/3mfingk2I3axATdwqhdYCPivocBHjEqVeOL4ANsBqB6IsT76wj1ACj7U8lE
         Jr2ugKm9ovLep3PNfuO/xwtUPNdebx/Fy8uGbyygH2yGeechHjXtxtNWgVNu+l43aewq
         j5IQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=APFtKdbZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q36-v6si4216096qtf.211.2018.04.19.02.48.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 19 Apr 2018 02:48:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=APFtKdbZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34834 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f96Aq-0007GS-Fe
	for alex.bennee@linaro.org; Thu, 19 Apr 2018 05:48:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49104)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1f96Af-0007Fx-P3
	for qemu-arm@nongnu.org; Thu, 19 Apr 2018 05:48:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1f96Ac-0004ZL-Ly
	for qemu-arm@nongnu.org; Thu, 19 Apr 2018 05:48:05 -0400
Received: from ozlabs.org ([203.11.71.1]:55811)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1f96Ab-0004Xw-H6; Thu, 19 Apr 2018 05:48:02 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 40RZ0s2SKhz9s1v; Thu, 19 Apr 2018 19:47:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1524131277;
	bh=5w/9R5t1ostTe3erNpfZssuglAFHrCitMkT7/jj5XmE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=APFtKdbZnOT6HL8LqEpXZRFpqVv8V/uXA5M50wlagwLvYOlwiLdz7A548slooK9jY
	NKr33d31tjfO7S90EbfoCil+JTW7LclgagHJUe9+MWGtfPQqPlfPQ0WNngLCBG9pC/
	EQ1UhR6tXpOWjDrajX9jhKtNaPm4rHhlTyZ5Zhk0=
Date: Thu, 19 Apr 2018 19:47:45 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20180419094745.GL2317@umbus.fritz.box>
References: <1524061685-83305-1-git-send-email-imammedo@redhat.com>
	<1524061685-83305-3-git-send-email-imammedo@redhat.com>
	<20180419041520.GJ2317@umbus.fritz.box>
	<20180419103019.39f8850a@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DN8g+DOX2TxGxleI"
Content-Disposition: inline
In-Reply-To: <20180419103019.39f8850a@redhat.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 203.11.71.1
Subject: Re: [Qemu-arm] [PATCH for-2.13 v2 2/5] ppc: e500: switch E500 based
 machines to full machine definition
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
Cc: peter.maydell@linaro.org, Alexander Graf <agraf@suse.de>,
	qemu-devel@nongnu.org, eric.auger@redhat.com,
	qemu-arm@nongnu.org, "open list:e500" <qemu-ppc@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hbl/ZuCvWpSP


--DN8g+DOX2TxGxleI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 19, 2018 at 10:30:19AM +0200, Igor Mammedov wrote:
> On Thu, 19 Apr 2018 14:15:20 +1000
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> > On Wed, Apr 18, 2018 at 04:28:02PM +0200, Igor Mammedov wrote:
> > > Convert PPCE500Params to PCCE500MachineClass which it essentially is,
> > > and introduce PCCE500MachineState to keep track of E500 specific
> > > state instead of adding global variables or extra parameters to
> > > functions when we need to keep data beyond machine init
> > > (i.e. make it look like typical fully defined machine).
> > >=20
> > > It's pretty shallow conversion instead of currently used trivial
> > > DEFINE_MACHINE() macro. It adds extra 60LOC of boilerplate code
> > > of full machine definition.
> > >=20
> > > The patch on top[1] will use PCCE500MachineState to keep track of
> > > platform_bus device and add E500Plate specific machine class
> > > to use HOTPLUG_HANDLER for explicitly initializing dynamic
> > > sysbus devices at the time they are added instead of delaying
> > > it to machine done time by platform_bus_init_notify() which is
> > > being removed.
> > >=20
> > > 1)  <1523551221-11612-3-git-send-email-imammedo@redhat.com>
> > >=20
> > > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > > Suggested-by: David Gibson <david@gibson.dropbear.id.au> =20
> >=20
> > As noted elsewhere, I've already merged this into my ppc-for-2.13
> > tree.  However, don't let that stop you from posting and/or queueing
> > it elsewhere.  Whoever ends up merging first once 2.13 opens, it
> > should be easy to resolve.
> Yep, that's been intention, i.e. have whole series on list so
> reader won't have to hunt for queued dependencies in different trees.
> After all it's trivial to fix merge conflict when path is merged
> in several trees.

Right, I figured.  Just making sure it was clear that me merging it
didn't mean I wanted you to exclude it from your own queue.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--DN8g+DOX2TxGxleI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlrYZbsACgkQbDjKyiDZ
s5LFFRAA5Z8F1NFJOFnX/sfhoF79+ECjJubBvFOQV/xnzTwBeDqDcguyJIAx27bA
xbp5RFs7e2E7aaGf49vINGrdR6vVygoOEXfXtSDYkBzAK7e3gm3sldSTj/KFRlaP
h1FBzMme4tSmFYkEFD6xgNvY05VG27PEpv/9oEzTAPWwSpWRBorG0eFchsieySNu
IBPgEiDO3DFHZVfYLyEOzhPMoZBoHlnekpWllRhx00ARpY8twRXk8dma4qu5mt7+
0pHJrQ206Bi6xeHKYdYJovZfu+YhCogkvoXM+P7TKVq0AEAzy8ly9urDy2H4sscc
N9vPI87RDL0aKkKph8k6tn3pjg0DckGTI8iqWjvmlCV4GE8yHQyI4/9GClYbq2pC
bUdnPZe4O/RZfhW499bXfDJny89bun9JXv0rbLPbPYYm6o8/cQmEf7Q177eJGh2p
7/2mTJsLcSsK7FH8y47eHiO+XAGKw2v3CgOlnq6yol5Moyp9zayuIGvpj7bVjJdY
2IzeVsXMQDWslpBxRYh2JehDS57djygwKWwCFFeiUxUdKOOiHpSzrEDhr0f70Z9S
CpdPZ4639U7bhv4qbT5lp/0Vuszt1bOoh6XzmJwdOErh88aFeFxIXYYzq/v19nKt
VQ90KpEK6Ri6zpz04nJLNMS3RCQtFGwoCXKMcRFQbB6p301WSJk=
=yfHk
-----END PGP SIGNATURE-----

--DN8g+DOX2TxGxleI--
