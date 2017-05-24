Received: by 10.25.0.6 with SMTP id 6csp151797lfa;
        Tue, 23 May 2017 22:55:47 -0700 (PDT)
X-Received: by 10.237.58.227 with SMTP id o90mr33397202qte.134.1495605346887;
        Tue, 23 May 2017 22:55:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1495605346; cv=none;
        d=google.com; s=arc-20160816;
        b=jW136l87bKnguIu0JISJgDTXfUzQGDp4aWT/sQMyqXdhimgdBkweX9uTTgwUECdMLQ
         BvyKT1r00c2/AWw7vsEFlnT3Vik1NLnESJNEiAyBVBJBUffPidswQZnxIVB+92rc+DV8
         sllliQ3veVre7R2pS+uMe7k0jS86+eOQtxkrefHhcFnBDpuWhUWJ558WpVYQYPX3WMmT
         V2P0hwM7QeWk+EmZBe2dorBA9Edrp+x7OuXlsrtXLdk7fzF/oVCc6ShPV84KcZj7y+QH
         zfeNHtsZvUuPanqrW+xY//sB3flY7hZn18gSSPOG9VqI9lHRhVj+O75UsGW0kb4qKNPI
         gL5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:date:to:from:message-id:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=9ALKJjIaxDsGHLU4vej/qSp30dxC58Tcp9sGYraTqFs=;
        b=JBu9PigaPGNJL/0pg+vJmkXaPwkZdhEFuXMknaT0lB+lG85PBY0hV40T2bay4CocMN
         6jrtu2t60wKUslsZ2uplAWdD+7EL4ED3jQopUw5ThbBNjdOhmzogRYs/5ngzVC6gHuUl
         w01Sr76r64ANOHy55x3O34HblzaofcNp8jiI8oiRhRRlKgNjAsVO3mqrmRLsjIttEYVJ
         mq61LqzZWBIBjkckhVUvCyZBk7hr3wVMPUelTvR19cjocPajENQdsa4wufu/ruUi4uYa
         kMN1lHfuUQj49V9k5vF/kKzs5QHvycWofVuY4+sJE1YP5f6OW4sP2256lYmR835FkM0j
         LNWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@aj.id.au;
       dkim=fail header.i=@messagingengine.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 36si24274500qts.101.2017.05.23.22.55.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 May 2017 22:55:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au;
       dkim=fail header.i=@messagingengine.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52924 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dDPGs-0001aT-ET
	for alex.bennee@linaro.org; Wed, 24 May 2017 01:55:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60729)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1dDPGo-0001aL-Sd
	for qemu-arm@nongnu.org; Wed, 24 May 2017 01:55:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1dDPGl-0000Je-Qc
	for qemu-arm@nongnu.org; Wed, 24 May 2017 01:55:42 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:48867)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <andrew@aj.id.au>)
	id 1dDPGl-0000J6-7F; Wed, 24 May 2017 01:55:39 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 4D6A620A39;
	Wed, 24 May 2017 01:55:37 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
	by compute4.internal (MEProxy); Wed, 24 May 2017 01:55:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
	:x-sasl-enc; s=fm1; bh=9ALKJjIaxDsGHLU4vej/qSp30dxC58Tcp9sGYraTq
	Fs=; b=LcRIwd6vBCuZSxJtPYxBs8FRT5y5UAAknDnbo1gXmtUausdz+WjWHG3bl
	mJZ+nwqIKdQfgVJ5xiLXGs2qNdgvX0SVT8Fp2VV/t6zL41mVI3+fMooBbSAAcrdv
	yFd78gKdHnfbTh1Kv4DH8HcICmaMbxjVmEdST3zT42EYa09LWQAtvJQ7ZV1jtq9y
	09K/OrMKBblaBAtb9nTm/jivRKXf9g2k2osOWSEDpqRtCSQHgruXUaD/TDnNJhzt
	3AdfGcQh0pkGZUM5pmZOA0RZOL8VKnu9D+U6i6KjpvNOESdJGsPvYW7BHBrAMh3e
	gc2ldeyZ9rrvwkh20IrG0aWp+N8DQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-sender
	:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=9ALKJjIaxDsGHLU4ve
	j/qSp30dxC58Tcp9sGYraTqFs=; b=eJkNySBO9KnvcJeFAERfqvKYZbUuHM7IRr
	JcE/oKZR5Tf4Ej70M8kjXnF97gAQufmusOF3eEACEmbOniZarL8wVY7Czgn8rzhS
	d8D9HAkqKJVg5wPbYnv/CWTe2Sa9G5pyLmAoYYizajMQRrlp1mDnZH4opvu0dFJ9
	jSleab7dsFk+SSxYZAimgdZQNskoSU8Fu4Das4QzJhs5BY3NZ/o9zQB3GHgPYOU5
	qfFEEEe19adV0XK/ricagoxhwy0LyPkTRkgEcb9U9hhrj4SvOrb6RE9j4oqlLX7+
	ySPrbT9N86QroKwISOFOphtrHm6DNsh90Ee4mxtm00HGmDtYTlLw==
X-ME-Sender: <xms:WSAlWcZjH-WfUe68mzoOBj9CTq3Yit14rHTKJpX94BLNXrNmkIK_Fg>
X-Sasl-enc: 5Q9C9Pwf3sUlzL17HNBm3+4uuMZZt3q4niagNLDEs1kM 1495605336
Received: from keelia (unknown [202.81.18.29])
	by mail.messagingengine.com (Postfix) with ESMTPA id 9E7A57E070;
	Wed, 24 May 2017 01:55:33 -0400 (EDT)
Message-ID: <1495605328.7794.3.camel@aj.id.au>
From: Andrew Jeffery <andrew@aj.id.au>
To: Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>, 
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Peter Maydell
	<peter.maydell@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org
Date: Wed, 24 May 2017 15:55:28 +1000
In-Reply-To: <041887dc-c613-2bf3-e927-0381a7221b54@amsat.org>
References: <20170520002653.20213-1-andrew@aj.id.au>
	<20170520002653.20213-2-andrew@aj.id.au>
	<59538b3b-2936-cdc7-f582-9d473c72ce09@amsat.org>
	<1495412633.23485.3.camel@aj.id.au>
	<660ee5968bc04bc7a318835d53f331ba@TWMBX01.aspeed.com>
	<1495430041.22806.1.camel@aj.id.au>
	<041887dc-c613-2bf3-e927-0381a7221b54@amsat.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-hMJJ43Iy3/D2foi/+KiE"
X-Mailer: Evolution 3.22.6-1ubuntu1 
Mime-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.111.4.25
Subject: Re: [Qemu-arm] [PATCH 1/2] hw/adc: Add basic Aspeed ADC model
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
Cc: Alistair Francis <alistair@alistair23.me>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	=?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iFfkIwZJDHs2


--=-hMJJ43Iy3/D2foi/+KiE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2017-05-24 at 02:15 -0300, Philippe Mathieu-Daud=C3=A9 wrote:
> Hi Andrew,
>=20
> On 05/22/2017 02:14 AM, Andrew Jeffery wrote:
> > On Mon, 2017-05-22 at 03:15 +0000, Ryan Chen wrote:
> > > In ASPEED SoC chip, all register access have following rule.
> > > Most of controller write access is only support 32bit access.
> > > Read is support 8bits/16bits/32bits.
>=20
> This makes sens thinking about how a DMA controller can take advantage=C2=
=A0
> of the ADC.
>=20
> >=20
> > Thanks for clearing that up Ryan.
> >=20
> > Phil: I'll rework the model so the reads are 16-bits.
>=20
> This shouldn't be necessary, QEMU is supposed to supports different=C2=A0
> access size for different implemented size, so you can declare your=C2=A0
> implementation as 32-bit and valid accesses from 8 to 32:
>=20
> =C2=A0 static const MemoryRegionOps aspeed_adc_ops =3D {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.read =3D aspeed_adc_read,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.write =3D aspeed_adc_write,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.endianness =3D DEVICE_LITTLE_ENDIAN,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.valid.min_access_size =3D 1,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.valid.max_access_size =3D 4,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.valid.unaligned =3D false,
> +=C2=A0=C2=A0=C2=A0=C2=A0.impl.min_access_size =3D 4,
> +=C2=A0=C2=A0=C2=A0=C2=A0.impl.max_access_size =3D 4,
> =C2=A0 };
>=20
> This way an I/O access from the CPU or a DMA could use 8/16-bit while=C2=
=A0
> you keep a 32-bit implementation. The adjustment is done by=C2=A0
> access_with_adjusted_size() from memory.c.
>=20
> Afaik there is, however, no distinction between read/write different=C2=
=A0
> access size in current QEMU MemoryRegionOps model.

Yep, I realised all of the above when I went to implement it. Thanks
for pointing it out though!

Andrew
--=-hMJJ43Iy3/D2foi/+KiE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZJSBQAAoJEJ0dnzgO5LT5kgUP/2+e7qs/EkSOump7W5F45c1C
zP03FPzohgsAQ1n17QoWbaKahgGgFtE1zsHT8/5vZ7YRSH6lL68jYW0idYAF4aLL
Yw4D32qV7oPrfz0Y0hKNzmNN7brPsGxjseQIg0z0nSHp4yJCKyImEBD/ckVKBvB/
mS1T+3yT2Mxzd92YwbtIGe3+s4pfGH7FAPg7GxJAVsVwc27SM62LBEl3FOx0Y8bD
vcwT0AH1IgKulxmdyc8jfTq21JY7rcXdTaQzCpvwcK27ccQc2vCK0yi90/wnsx6q
vAiJP507qeKgPWDkbUmxXJvFAsYJR3ZS8PYgelw9pf5vM42Jp2DkMFFd5FDXnlMJ
zmS/WYHcdAiTqws10HhXXTq5dLXz12PFEFulhT93NodftkDZq3TQPKTZ4OX4AsWF
YDIgmjtuh1YGECm8nEU6tLpINXvRVCv+vv+digchu9KyZLYgo9BsbWqoPz+SRGdC
i9EA+X29L0Y84jKwB5mNbcWBqEMYppj4vAjSMgl9NK//Hm6txfDTQgBQtMIx8Fks
+rEc/VK0C8l3/HKAhkZaCKAENEldFLpM9gbmcKQlrG11Tlmkf1TEfBMYMAymdFuY
fN61wJwePnYsXUwy6+qDkTxxx8Pxr0aaxHuOFsYygqJ6qBTk8KuSQSndCejKFBP/
ebm4Sx3shiCn2t/5oE6j
=aMRW
-----END PGP SIGNATURE-----

--=-hMJJ43Iy3/D2foi/+KiE--

