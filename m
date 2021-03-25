Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp836683lfg;
        Thu, 25 Mar 2021 16:01:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxh/C1/J/WKw6HDeoHbuF1QgmaCWt0RSn3uxTKN7+s1Sa57dIaM7V7NxuO4Egc8boPONXjn
X-Received: by 2002:a5d:8f90:: with SMTP id l16mr8291029iol.76.1616713262033;
        Thu, 25 Mar 2021 16:01:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616713262; cv=none;
        d=google.com; s=arc-20160816;
        b=AW1NjG3HsuVMPFeg6jscMs/QNdV720AHikknPjf+Y2+mpbIzM7gerAmWEkOgaXUfsP
         qE3BuisAbxQ0kZ0P1HXc5MmH4dO/HAH/TeFEPsidmhR5HanqujfKohktGPAiWfz2kClS
         68YiPXcfNEVHVuj/UZ0OFntefeHenJDbIC8ASNrpeEWLPPm99A46VZ2dE9g6FQiUZN2f
         fCspRlOXhgkrQZQbCxJyxzt8DKDOXdjP39e5JhiKapYM60B/KlZep1XNox9Ec9Z0flC3
         1VMxtNr6a4/BLOBrLiRJr+oI50+lUgtS6Sr/7AoEHcKmmW8TqN9hsqKfDKpAS6sO/sEr
         PXUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=ZWnyugIt2uAFo7BW201DNkoFB0gdGgG459412F79j1E=;
        b=FYxJJH3eE5kK0o/o2MbGgbVCtSMfCmUfbkrFIohwjiTqEJ9yRq6qBLkgq3JZkD1FUm
         VjgNxz6V8Hm3Oqz5XFMCrx8JMba48oH5nEmbRltVXHOWLU0Y85xmdyyvQvYkipmXdK0D
         tONJPOlt19G3YCjy2wXkwxGGw+Zl8sQ9+URul/p7pFNvIGu6V15Shkve3OMNHwiJVTi0
         9LUoZ5nSuBybgLi2D5Je19CyIq/qxgcdkA2QIg+OrDK/RBYlfKnnVNg1Z1fCKx5NMTq0
         owaRZKGa8tZq4p8a6yWw+RKKqrHNpKsMrM7Re6iQqafB50O8oWWewdbfcLvtSTOBZwzP
         w0ow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=fGCB92AO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z6si5527603ilb.14.2021.03.25.16.01.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Mar 2021 16:01:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=fGCB92AO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:38192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lPYyL-0002r6-9m
	for alex.bennee@linaro.org; Thu, 25 Mar 2021 19:01:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lPYy0-0002qr-34; Thu, 25 Mar 2021 19:00:40 -0400
Received: from ozlabs.org ([203.11.71.1]:53753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lPYxt-00051l-BS; Thu, 25 Mar 2021 19:00:36 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4F60tz1ml8z9sW1; Fri, 26 Mar 2021 10:00:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1616713227;
 bh=Lt4r8EbS7PeGT6I4qtuwivA+tancYxK0UPqLv2jEuX0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fGCB92AOG6SxliVzRmbPTNdJX7wZwUp0tk1dBqYAjTa2YgxzJq5LWvmovsT7Npp+L
 8ny6F4+qRCuAQEm5uhKxrVV07VbTDVtVWiisPZANAHEPaZC33XQkZmvJMmes+jICu8
 RQmVvRbP5Auq5lH9hyvXtjofddvCo9WA9hr6Tb+U=
Date: Fri, 26 Mar 2021 09:48:09 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH for-6.0 4/4] hw/ppc/e500plat: Only try to add valid
 dynamic sysbus devices to platform bus
Message-ID: <YF0TKRmG5FgxdZU5@yekko.fritz.box>
References: <20210325153310.9131-1-peter.maydell@linaro.org>
 <20210325153310.9131-5-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="nYKUghgsFZuhc+Vx"
Content-Disposition: inline
In-Reply-To: <20210325153310.9131-5-peter.maydell@linaro.org>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: inihO4ndgi3j


--nYKUghgsFZuhc+Vx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 25, 2021 at 03:33:10PM +0000, Peter Maydell wrote:
> The e500plat machine device plug callback currently calls
> platform_bus_link_device() for any sysbus device.  This is overly
> broad, because platform_bus_link_device() will unconditionally grab
> the IRQs and MMIOs of the device it is passed, whether it was
> intended for the platform bus or not.  Restrict hotpluggability of
> sysbus devices to only those devices on the dynamic sysbus whitelist.
>=20
> We were mostly getting away with this because the board creates the
> platform bus as the last device it creates, and so the hotplug
> callback did not do anything for all the sysbus devices created by
> the board itself.  However if the user plugged in a device which
> itself uses a sysbus device internally we would have mishandled this
> and probably asserted. An example of this is:
>  qemu-system-ppc64 -M ppce500 -device macio-oldworld
>=20
> This isn't a sensible command because the macio-oldworld device
> is really specific to the 'g3beige' machine, but we now fail
> with a reasonable error message rather than asserting:
> qemu-system-ppc64: Device heathrow is not supported by this machine yet.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/ppc/e500plat.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/ppc/e500plat.c b/hw/ppc/e500plat.c
> index bddd5e7c48f..fc911bbb7bd 100644
> --- a/hw/ppc/e500plat.c
> +++ b/hw/ppc/e500plat.c
> @@ -48,7 +48,9 @@ static void e500plat_machine_device_plug_cb(HotplugHand=
ler *hotplug_dev,
>      PPCE500MachineState *pms =3D PPCE500_MACHINE(hotplug_dev);
> =20
>      if (pms->pbus_dev) {
> -        if (object_dynamic_cast(OBJECT(dev), TYPE_SYS_BUS_DEVICE)) {
> +        MachineClass *mc =3D MACHINE_GET_CLASS(pms);
> +
> +        if (device_is_dynamic_sysbus(mc, dev)) {
>              platform_bus_link_device(pms->pbus_dev, SYS_BUS_DEVICE(dev));
>          }
>      }
> @@ -58,7 +60,9 @@ static
>  HotplugHandler *e500plat_machine_get_hotpug_handler(MachineState *machin=
e,
>                                                      DeviceState *dev)
>  {
> -    if (object_dynamic_cast(OBJECT(dev), TYPE_SYS_BUS_DEVICE)) {
> +    MachineClass *mc =3D MACHINE_GET_CLASS(machine);
> +
> +    if (device_is_dynamic_sysbus(mc, dev)) {
>          return HOTPLUG_HANDLER(machine);
>      }
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--nYKUghgsFZuhc+Vx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBdEycACgkQbDjKyiDZ
s5LAlg//Un57R9rRoIwo2i5MNA/bh0y6mBPZxT3c9Jv9cngshj4vsj+Tc8CBFiTe
hp1nMJi1rwk0ELiV1evncfWG2FpO/Y+TFFjtm98TLWKnZhAapU3NqkwMEcSRtOns
BOaG0N99kU9sowPJsAm/sTsDXBdteK8eOllqAwX2xrsCZGL2arWCJqRoxKWSGaQ4
55cGBCM9/Gy5SFtcn/mGfEpjHEoGgHKzVoFnjBrDZK8/lLNzxbX6LgtyPvGf7NiA
CEcLK2C3iuMONf5fCTZ+T6dl+hCMGkftScAxDNxbeGvET4JBFL1RbxzjzelAZ2Bj
muHbMAq/ZdNBp4OHmstO//atL2NsMXYFmqeBRzpkpsnAmZIHHGyTjZMN2TdL7f6H
L0sAcuQYQy/e485bVMnB9wJJ904A59uUm19fEOd9VytN+NQfG8hMZYMsVDxRNVCF
NtlVtTJWWq4+5DMq7jOQQveUGowFrCCJZGO4E3eheuBviNPEEWphvv5iRg75QBnj
AeJI2XaJbHKD1YnPNPAqwHOHHihdU0SF1bDT3Bs8uq0+/GjPDRXm7OCIpVJkj76G
pGzd9Fmzi0PgVcsJgt57VNePSBu7w+c5QmDoB5OJBriToBRnS0OY3DZbct4FDcZY
68y1b2JcD5YVS3P+bvAGhakFw/zOcDbciPNLkNy7CmT7QekR4YE=
=7F7o
-----END PGP SIGNATURE-----

--nYKUghgsFZuhc+Vx--
