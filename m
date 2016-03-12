Received: by 10.25.208.211 with SMTP id h202csp1342186lfg;
        Fri, 11 Mar 2016 19:24:39 -0800 (PST)
X-Received: by 10.140.91.106 with SMTP id y97mr16226195qgd.20.1457753079722;
        Fri, 11 Mar 2016 19:24:39 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 18si2602520qho.50.2016.03.11.19.24.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 11 Mar 2016 19:24:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail (test mode) header.i=@aj.id.au
Received: from localhost ([::1]:58770 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aeaAR-000207-8Q
	for alex.bennee@linaro.org; Fri, 11 Mar 2016 22:24:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40777)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1aeaAO-0001zn-D6
	for qemu-arm@nongnu.org; Fri, 11 Mar 2016 22:24:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1aeaAK-0001ax-CJ
	for qemu-arm@nongnu.org; Fri, 11 Mar 2016 22:24:36 -0500
Received: from sub3.mail.dreamhost.com ([69.163.253.7]:40487
	helo=homiemail-a19.g.dreamhost.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>)
	id 1aeaAK-0001aY-1K; Fri, 11 Mar 2016 22:24:32 -0500
Received: from homiemail-a19.g.dreamhost.com (localhost [127.0.0.1])
	by homiemail-a19.g.dreamhost.com (Postfix) with ESMTP id 4D92B604069;
	Fri, 11 Mar 2016 19:24:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
	:subject:from:reply-to:to:cc:date:in-reply-to:references
	:content-type:mime-version; s=aj.id.au; bh=jdg8Qu2cty9a0vY4C22RW
	u4R78U=; b=XQ//cYQKz7W6cPJU/uEVIqpjXpPAMKgqzfcOWjCFmDskSv+6yt29Z
	S20bttRdsKMXBg9lEW/Kortgk/MNRPCGwyJbYoE2e6qKNX99Tp5od9GnPl1L9SIW
	xiSyOJyoeVHCgswnS92zUy7lHgt+t30TpsENfAveLLKQCIO2TJjyY8=
Received: from keelia (ppp203-122-213-247.static.internode.on.net
	[203.122.213.247])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: andrew@aj.id.au)
	by homiemail-a19.g.dreamhost.com (Postfix) with ESMTPSA id AE927604061; 
	Fri, 11 Mar 2016 19:24:29 -0800 (PST)
Message-ID: <1457753065.29435.16.camel@aj.id.au>
From: Andrew Jeffery <andrew@aj.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 12 Mar 2016 13:54:25 +1030
In-Reply-To: <CAFEAcA-sdB7cb=APLcFYKtDyfGjsk-3zYZq_=-9bRQ+s1JscEQ@mail.gmail.com>
References: <1457152177-19550-1-git-send-email-andrew@aj.id.au>
	<1457152177-19550-3-git-send-email-andrew@aj.id.au>
	<CAFEAcA-sdB7cb=APLcFYKtDyfGjsk-3zYZq_=-9bRQ+s1JscEQ@mail.gmail.com>
Organization: IBM OzLabs
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-n53AUrpFhnOoxvliNoQz"
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 69.163.253.7
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-arm <qemu-arm@nongnu.org>,
	=?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH v3 2/3] hw/intc: Add (new) ASPEED VIC device
	model
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
Reply-To: andrew@aj.id.au
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 0IUirM5GvTlV


--=-n53AUrpFhnOoxvliNoQz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2016-03-11 at 16:03 +0700, Peter Maydell wrote:
> On 5 March 2016 at 11:29, Andrew Jeffery <andrew@aj.id.au> wrote:
> > Implement a basic ASPEED VIC device model, enough to boot a Linux kerne=
l
> > configured with aspeed_defconfig. The model implements the 'new'
> > (revised) register set and while the hardware exposes both the new and
> > legacy register sets, accesses to the legacy register set will not
> > be serviced (though the access will be logged).
> >=20
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>=20
> > +static void aspeed_vic_write(void *opaque, hwaddr offset, uint64_t dat=
a,
> > +                             unsigned size)
> > +{
> > +    const bool high =3D !!(offset & 0x4);
> > +    hwaddr n_offset =3D (offset & ~0x4);
> > +    AspeedVICState *s =3D (AspeedVICState *)opaque;
> > +
> > +    if (offset < AVIC_NEW_BASE_OFFSET) {
> > +        qemu_log_mask(LOG_UNIMP,
> > +                      "%s: Ignoring write to legacy registers at 0x%"
> > +                      HWADDR_PRIx "[%u] <- 0x%" PRIx64 "\n", __func__,=
 offset,
> > +                      size, data);
> > +        return;
> > +    }
> > +
> > +    n_offset -=3D AVIC_NEW_BASE_OFFSET;
> > +    trace_aspeed_vic_write(offset, size, data);
> > +
> > +    /* Given we have members using separate enable/clear registers, de=
posit64()
> > +     * isn't quite the tool for the job. Instead, relocate the incomin=
g bits to
> > +     * the required bit offset based on the provided access address
> > +     */
> > +    if (high) {
> > +        data &=3D AVIC_H_MASK;
> > +        data <<=3D 32;
> > +    } else {
> > +        data &=3D AVIC_L_MASK;
> > +    }
> > +
> > +    switch (n_offset) {
> > +    case 0x18: /* Interrupt Selection */
> > +        /* Register has deposit64() semantics - overwrite requested 32=
 bits */
> > +        if (high) {
> > +            s->select &=3D AVIC_L_MASK;
> > +        } else {
> > +            s->select &=3D ((uint64_t) AVIC_H_MASK) << 32;
> > +        }
> > +        s->select |=3D data;
> > +        break;
> > +    case 0x20: /* Interrupt Enable */
> > +        s->enable |=3D data;
> > +        break;
> > +    case 0x28: /* Interrupt Enable Clear */
> > +        s->enable &=3D ~data;
> > +        break;
> > +    case 0x30: /* Software Interrupt */
> > +        qemu_log_mask(LOG_UNIMP, "%s: Software interrupts unavailable.=
 "
> > +                "IRQs requested: 0x%016" PRIx64 "\n", __func__, data);
> > +        break;
> > +    case 0x38: /* Software Interrupt Clear */
> > +        qemu_log_mask(LOG_UNIMP, "%s: Software interrupts unavailable.=
 "
> > +                "IRQs to be cleared: 0x%016" PRIx64 "\n", __func__, da=
ta);
> > +        break;
> > +    case 0x50: /* Interrupt Event */
> > +        /* Register has deposit64() semantics - overwrite the top four=
 valid
> > +         * IRQ bits, as only the top four IRQs (GPIOs) can change thei=
r event
> > +         * type */
> > +        g_assert(high);
>=20
> Don't assert on conditions that can be triggered by a guest.

Good point, I'll change it to qemu_log_mask(LOG_GUEST_ERROR, ...)

>=20
> > +        s->event &=3D ~AVIC_EVENT_W_MASK;
> > +        s->event |=3D (data & AVIC_EVENT_W_MASK);
> > +        break;
> > +    case 0x58: /* Edge Triggered Interrupt Clear */
> > +        s->raw &=3D ~(data & ~s->sense);
> > +        break;
> > +    case 0x00: /* IRQ Status */
> > +    case 0x08: /* FIQ Status */
> > +    case 0x10: /* Raw Interrupt Status */
> > +    case 0x40: /* Interrupt Sensitivity */
> > +    case 0x48: /* Interrupt Both Edge Trigger Control */
> > +    case 0x60: /* Edge Triggered Interrupt Status */
> > +        qemu_log_mask(LOG_GUEST_ERROR,
> > +                      "%s: Write of read-only register with offset 0x%=
"
> > +                      HWADDR_PRIx "\n", __func__, offset);
> > +        break;
> > +
> > +    default:
> > +        qemu_log_mask(LOG_GUEST_ERROR,
> > +                      "%s: Bad register at offset 0x%" HWADDR_PRIx "\n=
",
> > +                      __func__, offset);
> > +        break;
> > +    }
> > +    aspeed_vic_update(s);
> > +}
>=20
> Otherwise
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Thanks,

Andrew
>=20
> thanks
> -- PMM
--=-n53AUrpFhnOoxvliNoQz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAABCgAGBQJW44vpAAoJEJ0dnzgO5LT5xmcP/0DVz/YhVcUOT3TSHrOPE/eP
98gLb8DxJ3iZm80hRRVkk6Xu6bw2GlpCKXW4mpL2hy+3ZQDDw+UAy7atbHJ+QCeb
TgOhulOfVS/VcctsDIqTdMaA9vohsijRHgpomcCaw6NDQfAkK4FRqKagZAvSlOsh
ICs1ULfZClIrAxlSoYhoy+vc402w9qXtsvdrWVu+nbRBagKILDzQl+mYsnmdjdeW
3LzXXvw8E5mmVBy1LGBgF8QBX5rEMkyO9yCsWufzqpsWCIGlfPei70M330Bes9S5
pbFILW+7hGz6SgFfJfblv1b3O26zomSoerwNDZXZMWiMElIJU5RRdjfaAMoJ++DW
LhZU9JOGd5j8GqjyPQsHWngrl5AIhrgAMCBgIe3PstCESMdzPEZKHvv4IIunrQVk
mheRiehlzf7YuQy9vJWkxSSqRQCll3Md02P2flrtTdlJodlZSD8p7Y4PnkYn58Ek
navjeTYlzp5WDHQxn5HintcUc03ktHNo6jm/wGazJhgreb1v0xKNyuwLJSEb1Whc
G83mqYonIKst0eFbFlQYJ0Rl18SPJBaUCau2GhKrKv75+Cqg2MsKCMSPO7trGfys
BHH0ZWcDV/RFlWkDJMALGb3Dw5zY8iu/zsq8XEVKKn20uyXa/E2Zk+mSakcPb5XZ
YTc4vs7xa3D3fMwm7kFS
=GxxF
-----END PGP SIGNATURE-----

--=-n53AUrpFhnOoxvliNoQz--

