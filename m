Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp4699084wrt;
        Tue, 23 Oct 2018 08:45:39 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63KuzZUgyhKBsCVC74SrS+iny/S02TnuHCXWmlnqNXyMWGCQD7Rwqfi2J7JO4SzjB1cHKTv
X-Received: by 2002:a37:31cf:: with SMTP id x198-v6mr47332831qkx.206.1540309539563;
        Tue, 23 Oct 2018 08:45:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540309539; cv=none;
        d=google.com; s=arc-20160816;
        b=wnxxYSiBc6wu/Yv70OjIkW6XvDFeKv530UIe6EsZ+MxTUF5yqpK9W6JeKKCBVEtOSl
         JN+PYsPOp03Nj7z88LnG/tdYiB5o2othJ+Bp6sjIlGkRjseDgXaLFqNSQJIwxYMyC2Cz
         LaO/3PX8HHTBcInyPU72CbE9SqmomduP0FIuPCAbB0Uy3gtId5Lf9ggvU+8yljWd23/C
         XoPws7q1yEBHGE9un4Gv0OY7Log76wrMSsR3YxVzu1fOPaYocfzu0QTF7H8ugBItCdeF
         C0D6fQ7UxSV2lXt+3FZUxfWurdEF6tL7fJwNWkKJOBZx3Wrc2Fj9SV0py0+T935GniBO
         i7Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature;
        bh=UyxQAghf8elermQLh8lKcDH5217fysEt4RPxMP2iyYM=;
        b=eUq3K80cRUZioJY8P4xI7d1OlaTZ7fhb9gt2zhNs6zGHGLnrwQwIy0rs+/Kfu9tVIT
         QVWH76P7Uf1Zh2dCPZ8lYsDwxfwFXmzggkxNanSPDxNoSy1RQHlgBjA4kFOKVDNYUpPe
         FP8mFGtw7Ot4WGyxhQf+rSvOZ7KfsWGBuyDEy4ZlKSrtI4O1Dho9OoA1CrmnOjJSvmeX
         SQ+WsnN4zQTwan0brtn+3BKoDz2ybcJGEK8C8sBwpdOsgq1469fye9ydvKkN68YB7Uo4
         hcjo1f6RveFB6muaMbtXW2QPDwi9HD7np3LPAp9P3JLlWv4EHUROekNFz5GLF0EX3TRA
         TioA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=MuQ2XP9I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 17-v6si1422906qkn.31.2018.10.23.08.45.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Oct 2018 08:45:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=MuQ2XP9I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42774 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gEysE-0001FA-U4
	for alex.bennee@linaro.org; Tue, 23 Oct 2018 11:45:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37363)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1gEyhV-0007I5-AA
	for qemu-arm@nongnu.org; Tue, 23 Oct 2018 11:34:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1gEybs-0006y0-Dr
	for qemu-arm@nongnu.org; Tue, 23 Oct 2018 11:28:46 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:47447)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1gEybr-0006fT-EH; Tue, 23 Oct 2018 11:28:44 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 42fcj673TFz9sNF; Wed, 24 Oct 2018 02:28:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1540308491;
	bh=u1LlR78+UtVKQRmczBrnpThlyjZBgzA3ufNGrLO0NVM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MuQ2XP9IVvWr6/NU1whf64DJElp4QbvIf2aiwW714rwd+HaYReQ23ITgLbK6xY4du
	F5BgEgLFyV7RkDbE+SMcCsR8uQbvHnHVmc+fZkubCZtrdZmJ1F+p6qkyRd12eS7EVB
	mHG2O2VWVAmEmlclWqhCbq8jcVFi91rQ5y0xzBvc=
Date: Tue, 23 Oct 2018 16:16:23 +0100
From: David Gibson <david@gibson.dropbear.id.au>
To: Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20181023151623.GJ12127@umbus.hotspot.internet-for-guests.com>
References: <20181018200422.4358-1-ehabkost@redhat.com>
	<20181018200422.4358-13-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Z8yxTSU1mh2gsre7"
Content-Disposition: inline
In-Reply-To: <20181018200422.4358-13-ehabkost@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2401:3900:2:1::2
Subject: Re: [Qemu-arm] [PULL 12/45] hw/mips/gt64xxx_pci: Mark as bridge
 device
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>, libvir-list@redhat.com,
	Jason Wang <jasowang@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-devel@nongnu.org, Alexander Graf <agraf@suse.de>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Eric Blake <eblake@redhat.com>, Rob Herring <robh@kernel.org>,
	Markus Armbruster <armbru@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yFfFq1NRUSQL


--Z8yxTSU1mh2gsre7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 18, 2018 at 05:03:49PM -0300, Eduardo Habkost wrote:
> From: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
>=20
> The gt64120 is currently listed as uncategorized device.
> Mark it as bridge device.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: C=E9dric Le Goater <clg@kaod.org>
> Message-Id: <20181002212522.23303-9-f4bug@amsat.org>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/mips/gt64xxx_pci.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/hw/mips/gt64xxx_pci.c b/hw/mips/gt64xxx_pci.c
> index dcd1a66329..1cd8aac658 100644
> --- a/hw/mips/gt64xxx_pci.c
> +++ b/hw/mips/gt64xxx_pci.c
> @@ -1232,6 +1232,7 @@ static void gt64120_class_init(ObjectClass *klass, =
void *data)
>  {
>      DeviceClass *dc =3D DEVICE_CLASS(klass);
> =20
> +    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
>      dc->reset =3D gt64120_reset;
>      dc->vmsd =3D &vmstate_gt64120;
>  }

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Z8yxTSU1mh2gsre7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlvPO0cACgkQbDjKyiDZ
s5KDexAAgqzYYh+7ZBK4y1kdR2vMkSOrWlAcUwaoMcFmBP1gow1WYIjcOrFV/mZW
9/gqh3gf6BRaUu9M8YWbUVglbb7gaOi9cx5DoTVGA2/sGDrM9NN6b5K7wwJ4fDvh
sYpxRqyoVushPUgLtyUgFFylATZG7aNP0cH/MBcda2RBs/+XU0rl/13vNbFdGrHl
GvS+n2To2ZOxX6XY70aRdTIZlbZLKM8GYeIoD1VkBnAdGnRFuTBEau9TzJWTPi1K
/m1yfy93mWXeXflEjCNamYNtbYv4NwctQn9JHQrUu/yqi8bwooij0oNUT55x+KXb
MP8deUawNgqDn33QC1EGvz7yObpBibLmZ9RHyGT9UH1+VvFC534o7Oygu+l/vAG3
axAOc39oHby+pr9AgVxHNV243trIch6kv/eG93yNSLJO0UfHAicHKjd1f9V+nIn3
dWZMCohxDJn0zglnVvWME41kR50gtFuzVNmVVA9VIOg+0dJB4lCIWBLW+gXBm9C9
IPwV9DlT0YAo0/8hrsk7kXnRVlwD2QcYuQcpH+rLpav7WDUFJYR8IrpZG5O1StlJ
1Y1gr1mIeZJPQr6y4rL9++9wXC8js2+JRn30hHMep9rgj2irNKX+/PjhX6Zf+VyH
Zdu6FXcvO48D637gkvQ2sf48j7RAxcj9LIMGP4dLdAu5nrDTcWc=
=Kzj5
-----END PGP SIGNATURE-----

--Z8yxTSU1mh2gsre7--
