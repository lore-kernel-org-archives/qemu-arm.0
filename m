Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp4357296lfb;
        Mon, 26 Apr 2021 18:59:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz6jpDfrgqDuEhHr9qUodbDCovl0YOVNPxAnXJY/vt38CzZILRMPpK4fUCbp8X6pBVV3Mp+
X-Received: by 2002:a05:6602:17dd:: with SMTP id z29mr16233935iox.190.1619488768742;
        Mon, 26 Apr 2021 18:59:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619488768; cv=none;
        d=google.com; s=arc-20160816;
        b=o5Urv4nnJMZQA/zcKiEbA1WyD8u7oc0vW6mh4qgAgDYfGX5sG0TtcKYWFgRmuPx8S/
         4d6JrhzDzSZw3KnFYQNLgoNoVbMPj+XnH+eP6Ot/OgrBIDec+IOpDyIUe3l+aH5RM/BS
         eKi4rr8Wg3jsNV44NGNC1DrLRHNmOZkpkFJqcUe8hR8NSi4DQPTvW6BrU8cWpVOIOGqF
         k/GuMIXrmruafGhxOKSBW4XObKPnBhCCS/rpntG6GN8wOaokOM76Q8NvSldc3J25RH+1
         QfF2zT9ZFcSWSfQ4coskKaLatO2RAF/8DeLp6xUC+C1ePhxKf9kHU6ekwiGlLLEoK3Zw
         P85A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=a3DwAbmIu/ROlFYJVuAL9HVo83x9oaxckEfCUU8Hdqw=;
        b=r1Q/5mwh+EWJF1alg3KyaeH1A/YJU/qDw8cX2SB2f5RjtKG9oMoeQz50926NWR/CQV
         t3Cvc+oYIEXElsd9aE2mQADr9Hxjd1NRvtm1HNif4qmux/x2kbzK3gpFWHakbjE6V3gZ
         QuQzxQEqjtO18vWlYKjiCNBE0IRZzkA6PppwcyROespWooB+tdijNNH+J6ZJsHt4xudr
         fzGix8LW0KBZBTBDggBskGYxFGY/tOHmkRu0+piZ/LJPv6dKbSUjF1nVZbUUYWs4WLAS
         a4ojdBspO42MMVqhskqZKq0fRIfl3QFyxRAIJFDqILFEs6aqmuq2Zya0OXuq7/T46ZwJ
         DPcw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=JShgQYiT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l11si1945644ilo.63.2021.04.26.18.59.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Apr 2021 18:59:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=JShgQYiT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lbD0Y-0007gJ-7F
	for alex.bennee@linaro.org; Mon, 26 Apr 2021 21:59:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lbCy8-0003pr-8n; Mon, 26 Apr 2021 21:56:56 -0400
Received: from ozlabs.org ([203.11.71.1]:56589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lbCy4-0000hk-35; Mon, 26 Apr 2021 21:56:55 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FTlHV5HRsz9sXH; Tue, 27 Apr 2021 11:56:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1619488598;
 bh=Iii/84a2pR/rVK3P0gkdjfgu2Afo5IimUeSW22Hx/aM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JShgQYiTbTRd+HDorE7K54KRVddpE4o8JZfNJRBvhufwigH522LL6BkgAonFKzbbf
 Zuz3u0pTCYDFx5OwdA9xY5N2i89KTR5BetYBHXQ36CYmiWgcGtcvmC5/RD5Kr06yyQ
 1tyr7/b1gakG6rg3dU2UlYUo3ur/iX5f23Piu9jY=
Date: Tue, 27 Apr 2021 11:47:12 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH 4/5] hw/pci-host/raven: Manually reset the OR_IRQ device
Message-ID: <YIdtIJhxfyZ65eQO@yekko.fritz.box>
References: <20210424162229.3312116-1-f4bug@amsat.org>
 <20210424162229.3312116-5-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="slZAFVVySyo6FErL"
Content-Disposition: inline
In-Reply-To: <20210424162229.3312116-5-f4bug@amsat.org>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 =?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
 qemu-ppc@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JHRyP2W2GNkv


--slZAFVVySyo6FErL
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 24, 2021 at 06:22:28PM +0200, Philippe Mathieu-Daud=E9 wrote:
> The OR_IRQ device is bus-less, thus isn't reset automatically.
> Add the raven_pcihost_reset() handler to manually reset the OR IRQ.
>=20
> Fixes: f40b83a4e31 ("40p: use OR gate to wire up raven PCI interrupts")
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>

Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/pci-host/prep.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/hw/pci-host/prep.c b/hw/pci-host/prep.c
> index 0a9162fba97..275379e4c78 100644
> --- a/hw/pci-host/prep.c
> +++ b/hw/pci-host/prep.c
> @@ -230,6 +230,15 @@ static void raven_change_gpio(void *opaque, int n, i=
nt level)
>      s->contiguous_map =3D level;
>  }
> =20
> +static void raven_pcihost_reset(DeviceState *dev)
> +{
> +    PREPPCIState *s =3D RAVEN_PCI_HOST_BRIDGE(dev);
> +
> +    if (!s->is_legacy_prep) {
> +        device_legacy_reset(DEVICE(&s->or_irq));
> +    }
> +}
> +
>  static void raven_pcihost_realizefn(DeviceState *d, Error **errp)
>  {
>      SysBusDevice *dev =3D SYS_BUS_DEVICE(d);
> @@ -422,6 +431,7 @@ static void raven_pcihost_class_init(ObjectClass *kla=
ss, void *data)
> =20
>      set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
>      dc->realize =3D raven_pcihost_realizefn;
> +    dc->reset =3D raven_pcihost_reset;
>      device_class_set_props(dc, raven_pcihost_properties);
>      dc->fw_name =3D "pci";
>  }

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--slZAFVVySyo6FErL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCHbR8ACgkQbDjKyiDZ
s5KOBhAA1A6h+9Kjkw7EFf2sy3H28brCunWuCVF1K67Q+r4u3FDuJRfjDL2+Lcrr
pubP1QY7uyVtAky5VZUPGNDde8120AMZq3vwO8LPRIRpWzmrjplPY+Zs9CqASrsq
UEddVVHW/wEVBGCLVT0R9MKd1cALhCqs2GHDuaL5DkCKtzQ+7HF8qEhWr3zI5J7z
SJRR+x+wAie1PBybI+UJa59cEscIkEsPZaLuXb2MMw7g8AVsVLBKNCttEusPCqzs
/+K+S8HVPD+h0t15b16ikN6mefpQyNCC03mgERBBJpxxqXOrDwPvRA3OdBNytfsE
8Knig6K7cPn6miEOEw+4g7uo5MVcAD5C1vyqR64SWwVkQZbfZPAlsBRzp2tJg7jC
stTBdqhwRE+UDiuxvIqKyoLShRFcdvATf6SFT+yRHtYgXdwtdtAKqqRRvn1ih9Y/
vSo1rlJK5vtL1zGbXU/V0B7tR6m1KxBIkykq3g58VgM3u1Mmt8+b/22uT6hiUeUH
yMmhZzWClZC5byCIU9mAWHx7pEp68hwHB7mD+ZqSXmQptjI/cFC7ol3SJ/UgGx4D
cUp5Ep4qd0ohI73cZuWHgLhxskSHD1qkc9Xkl4BtrRWuC1gQsh9B3j3yOllh+Mwi
ByIL2CD/WiygYv9+7S0e9FpNW+S7iCcv5rKG0WzBrJts9QfUkFA=
=hKM0
-----END PGP SIGNATURE-----

--slZAFVVySyo6FErL--
