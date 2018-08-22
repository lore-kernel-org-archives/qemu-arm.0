Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp2831355wrd;
        Wed, 22 Aug 2018 01:32:53 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPxIW2iC/dwBtBZT1fnt+U73LbRvJ5P0WtQsaoqeZY5S2kvQdOX7eI8tPbO++nmWPvYqFxfG
X-Received: by 2002:a0c:e74c:: with SMTP id g12-v6mr49735985qvn.118.1534926773112;
        Wed, 22 Aug 2018 01:32:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534926773; cv=none;
        d=google.com; s=arc-20160816;
        b=RVskSPkTccdA7ylX7sPMpskTV252Sz1yvNDlOVfB525QWCvr78M1In9hibrcIorZRs
         OEosuEU+lWLnD17FPxrguQV+a4yQ4Ah9nOLu4bwve6/apUgNPqrn2ZUHAOUeImA14wHH
         rsRi4PGpNYK6/E0ohswAkkj6TzzEZTMhjg7xH9FDvq8HqRAGqyUqKqT5TuncYjwMzV5h
         Igx2UbM0fnzBaV0FGu92g/vpG0Y22Zg7H5rb1/rQVHE22IFYn8dv48BKYaGOH3Pft/ey
         toPJHRQxSsym7a8H1cP2V6+7wfpxJUCOmMJoj+oHKRIrZ3xUnKdfvRoT4ikpQpEzLUZG
         kZtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:openpgp:from
         :references:to:dkim-signature:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=/IxmCFD70jDVqfjF3iGVcVAgT7YjKSO2K95b051L5A4=;
        b=EpNndV7QzxEP1QnpSG8nDSn5e1ioMBwL2u986OkT+OF8QmsuKuvB7FeFpFvIfEkmtd
         bZx0OjtQSbckPJrbAhc7kS2t9DSl0fLFD5k/7Oe0a5gaNF3H0W3/7+2J6XLU8H35qQZy
         +VK1MTTCvkCB4ynihONC/H837PI8aKweOygtgY1PPqZ91UodHZjNMKosD+tPijMra6oK
         OPDmpw41LTli5o4hfjl37zrraqrY6ZIbvXX8NQnzlKW+5jJNvsGlUdmpZspu33HZ1Wr0
         FVL99Q7RBO4r7M5upjIserC72jM6841d+3Xzh4JVE5yq6vK5i8npRyKVjX5KKr49/tkD
         OAfQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=VuMwvsuY;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=cZMEnffd;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=cZMEnffd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b88-v6si1098609qkj.67.2018.08.22.01.32.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 22 Aug 2018 01:32:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=VuMwvsuY;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=cZMEnffd;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=cZMEnffd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57571 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fsOZQ-0003g3-HE
	for alex.bennee@linaro.org; Wed, 22 Aug 2018 04:32:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41942)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fsOTw-0007Rz-U5
	for qemu-arm@nongnu.org; Wed, 22 Aug 2018 04:27:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fsOTr-0002Fe-So
	for qemu-arm@nongnu.org; Wed, 22 Aug 2018 04:27:11 -0400
Received: from greensocs.com ([193.104.36.180]:41026)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1fsOTm-0002Bd-RQ; Wed, 22 Aug 2018 04:27:05 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id A0CF6238729;
	Wed, 22 Aug 2018 10:27:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1534926421;
	bh=NWJ6YOZbeTnYhbObRQfEPSrTqUvDaX8Krr906gsA3DU=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=VuMwvsuYy46ipKVHE5AVJqStXB89TePNCprdjPFFwWDlIUhg6a1yUfkZtiIkS+sce
	5jS+xuYFNqBMmW3byQrgpWbkUNxsLox1lY/TUdArnmqJ+M5dZ5hZCc42f9Xb4nMCTq
	WIqL7H6xB1T6PCKeYX7QQe8LoE0H5M7POW/rOAvA=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=cZMEnffd;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=cZMEnffd
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id imuR_S8x_Umd; Wed, 22 Aug 2018 10:27:00 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id B54B323874A; Wed, 22 Aug 2018 10:27:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1534926420;
	bh=NWJ6YOZbeTnYhbObRQfEPSrTqUvDaX8Krr906gsA3DU=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=cZMEnffdCTr75tmrEXYQkBsSmw8oUlIve6hziD3smwJE7FekXp/3pLLq6f8TOCBoZ
	5ffRf0/9O06Xr9OLoZaKhY8/6syIqgH1pCRC9tW4UKj1swKs1ndx3Bsd5Qz8UHndB4
	CVYIATxM74N6PNphR8CDpXt1nAXOH/M1/4XwjPr8=
Received: from [192.168.61.102] (LFbn-LYO-1-488-36.w2-7.abo.wanadoo.fr
	[2.7.77.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 7A0C9238729;
	Wed, 22 Aug 2018 10:27:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1534926420;
	bh=NWJ6YOZbeTnYhbObRQfEPSrTqUvDaX8Krr906gsA3DU=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=cZMEnffdCTr75tmrEXYQkBsSmw8oUlIve6hziD3smwJE7FekXp/3pLLq6f8TOCBoZ
	5ffRf0/9O06Xr9OLoZaKhY8/6syIqgH1pCRC9tW4UKj1swKs1ndx3Bsd5Qz8UHndB4
	CVYIATxM74N6PNphR8CDpXt1nAXOH/M1/4XwjPr8=
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180821132811.17675-1-peter.maydell@linaro.org>
	<20180821132811.17675-8-peter.maydell@linaro.org>
From: Luc Michel <luc.michel@greensocs.com>
Openpgp: preference=signencrypt
Autocrypt: addr=luc.michel@greensocs.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <7d6caa58-618e-c082-5db4-6eabafd99797@greensocs.com>
Date: Wed, 22 Aug 2018 10:27:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20180821132811.17675-8-peter.maydell@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="W3Rsh7aAb63yOvbwnuB67x1rMzphAJFjR"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: Re: [Qemu-arm] [PATCH 7/9] hw/cpu/a15mpcore: If CPU has EL2,
 enable it on the GIC and wire it up
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RBf4KSrfh5zT

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--W3Rsh7aAb63yOvbwnuB67x1rMzphAJFjR
Content-Type: multipart/mixed; boundary="yc7DU0oldnu8VenU8vD9dj4LSbYTYLwjb";
 protected-headers="v1"
From: Luc Michel <luc.michel@greensocs.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: patches@linaro.org
Message-ID: <7d6caa58-618e-c082-5db4-6eabafd99797@greensocs.com>
Subject: Re: [PATCH 7/9] hw/cpu/a15mpcore: If CPU has EL2, enable it on the
 GIC and wire it up
References: <20180821132811.17675-1-peter.maydell@linaro.org>
 <20180821132811.17675-8-peter.maydell@linaro.org>
In-Reply-To: <20180821132811.17675-8-peter.maydell@linaro.org>

--yc7DU0oldnu8VenU8vD9dj4LSbYTYLwjb
Content-Type: text/plain; charset=utf-8
Content-Language: fr-classic
Content-Transfer-Encoding: quoted-printable



On 8/21/18 3:28 PM, Peter Maydell wrote:
> For the A15MPCore internal peripheral object, we handle GIC
> security extensions support by checking whether the CPUs
> have EL3 enabled; if so then we enable it also on the GIC.
> Handle the virtualization extensions in the same way: if the
> CPU has EL2 then enable it on the GIC and wire up the
> virtualization-specific memory regions and the maintenance
> interrupt.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Luc Michel <luc.michel@greensocs.com>

> ---
>  hw/cpu/a15mpcore.c | 31 ++++++++++++++++++++++++++++---
>  1 file changed, 28 insertions(+), 3 deletions(-)
>=20
> diff --git a/hw/cpu/a15mpcore.c b/hw/cpu/a15mpcore.c
> index 43c10794938..226ce8900f2 100644
> --- a/hw/cpu/a15mpcore.c
> +++ b/hw/cpu/a15mpcore.c
> @@ -53,6 +53,7 @@ static void a15mp_priv_realize(DeviceState *dev, Erro=
r **errp)
>      int i;
>      Error *err =3D NULL;
>      bool has_el3;
> +    bool has_el2;
>      Object *cpuobj;
> =20
>      gicdev =3D DEVICE(&s->gic);
> @@ -67,6 +68,10 @@ static void a15mp_priv_realize(DeviceState *dev, Err=
or **errp)
>          has_el3 =3D object_property_find(cpuobj, "has_el3", NULL) &&
>              object_property_get_bool(cpuobj, "has_el3", &error_abort);=

>          qdev_prop_set_bit(gicdev, "has-security-extensions", has_el3);=

> +        /* Similarly for virtualization support */
> +        has_el2 =3D object_property_find(cpuobj, "has_el2", NULL) &&
> +            object_property_get_bool(cpuobj, "has_el2", &error_abort);=

> +        qdev_prop_set_bit(gicdev, "has-virtualization-extensions", has=
_el2);
>      }
> =20
>      object_property_set_bool(OBJECT(&s->gic), true, "realized", &err);=

> @@ -103,20 +108,40 @@ static void a15mp_priv_realize(DeviceState *dev, =
Error **errp)
>                                    qdev_get_gpio_in(gicdev,
>                                                     ppibase + timer_irq=
[irq]));
>          }
> +        if (has_el2) {
> +            /* Connect the GIC maintenance interrupt to PPI ID 25 */
> +            sysbus_connect_irq(SYS_BUS_DEVICE(gicdev), i + 4 * s->num_=
cpu,
> +                               qdev_get_gpio_in(gicdev, ppibase + 25))=
;
> +        }
>      }
> =20
>      /* Memory map (addresses are offsets from PERIPHBASE):
>       *  0x0000-0x0fff -- reserved
>       *  0x1000-0x1fff -- GIC Distributor
>       *  0x2000-0x3fff -- GIC CPU interface
> -     *  0x4000-0x4fff -- GIC virtual interface control (not modelled)
> -     *  0x5000-0x5fff -- GIC virtual interface control (not modelled)
> -     *  0x6000-0x7fff -- GIC virtual CPU interface (not modelled)
> +     *  0x4000-0x4fff -- GIC virtual interface control for this CPU
> +     *  0x5000-0x51ff -- GIC virtual interface control for CPU 0
> +     *  0x5200-0x53ff -- GIC virtual interface control for CPU 1
> +     *  0x5400-0x55ff -- GIC virtual interface control for CPU 2
> +     *  0x5600-0x57ff -- GIC virtual interface control for CPU 3
> +     *  0x6000-0x7fff -- GIC virtual CPU interface
>       */
>      memory_region_add_subregion(&s->container, 0x1000,
>                                  sysbus_mmio_get_region(busdev, 0));
>      memory_region_add_subregion(&s->container, 0x2000,
>                                  sysbus_mmio_get_region(busdev, 1));
> +    if (has_el2) {
> +        memory_region_add_subregion(&s->container, 0x4000,
> +                                    sysbus_mmio_get_region(busdev, 2))=
;
> +        memory_region_add_subregion(&s->container, 0x6000,
> +                                    sysbus_mmio_get_region(busdev, 3))=
;
> +        for (i =3D 0; i < s->num_cpu; i++) {
> +            hwaddr base =3D 0x5000 + i * 0x200;
> +            MemoryRegion *mr =3D sysbus_mmio_get_region(busdev,
> +                                                      4 + s->num_cpu +=
 i);
> +            memory_region_add_subregion(&s->container, base, mr);
> +        }
> +    }
>  }
> =20
>  static Property a15mp_priv_properties[] =3D {
>=20


--yc7DU0oldnu8VenU8vD9dj4LSbYTYLwjb--

--W3Rsh7aAb63yOvbwnuB67x1rMzphAJFjR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEUvSC0Bi15mxw2PT5d8knW3QnTr4FAlt9HlQACgkQd8knW3Qn
Tr7tIRAAlC2FYWPfHwElKjZguCBS5pwga5JxdXmUT0ghyPMBKRqlsqmUFMtJXAzi
c5gjEmu8Y7MunRPPwua3cDCGinTzmFFamVkguFgYZnHcmgExhfPwlPQQ3h5iBfk3
Ho3aTjaaC12IuCOEFu9NxvS34Pyc8O3N4xpeegwM1zJ9KQPV2W5TwTtkP0S/4LRv
e5XIHzoaur/x+jIrVdmJ4dz7z6EIZgBONXVogbCcTzdjMa0FAOW3KF0xKAjHoZ19
GSzy/uFSed6Nt949ZlFjbvCNoHLE57DheWB6Wcpu6HLe2WgXwk3pYh/DZzyRr4dT
4Exx/8+XM4KLgpmj8FWUPkdE25bY/sxitIpaAigQn89tTKHuZjLLE6TkoJH78VbU
sF7stcmC3kjnSYmNfGOzZpmAvjhn2qQ6y18PuWqxncX9Y/yDDo/QGqFk1TtLmlC7
RMSox5xo18KW92wafxBWoir8JLAP8Eq4qTrNnmZHYkhuc7iPIkQ+d9bB8yw18f02
ZuvYWVIhgZQ0td7I9+vz6KF/SIT6W8opWVcK/S4puhA/7Cthid9/mbMP3c/huEBc
BssY6S6l0a5h3v67DmvaBrklfNBFJqX6ftwbAgx/c6HCkKAAOzMTB1EsrFLs3LAd
8RKT4EdIBPXc0lrs3ZicgX3mgcMxPhpXFvjoUFXESrI37Mde2mQ=
=r3el
-----END PGP SIGNATURE-----

--W3Rsh7aAb63yOvbwnuB67x1rMzphAJFjR--
