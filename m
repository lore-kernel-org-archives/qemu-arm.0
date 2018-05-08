Received: by 10.28.4.212 with SMTP id 203csp4085378wme;
        Tue, 8 May 2018 05:09:07 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZoWSUiueRukLNHdoTlx/UcIlNBE1ya6o6Ei2oAkLkoWVXiQNUe/CyfMg3Qtgh5ybqDJfmBg
X-Received: by 2002:ac8:364d:: with SMTP id n13-v6mr35002026qtb.174.1525781347283;
        Tue, 08 May 2018 05:09:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525781347; cv=none;
        d=google.com; s=arc-20160816;
        b=ekXwwQ+FqwMwuxbPrWl3nw2zWxoe58ZLE9azKlRbB5XhxzwgH3i807chjuFHPQ2WNS
         yx0AFRlu3yv+wpteUXeR4LWEA95u5U4nD2Kgo8jYWX0t/ZGDlVS7ef7hY45d8MCyNf9N
         0eZMfjcKVMln5cdxTt+/5loY5hGv4rLWj1VAOcw/c2VXD5+0KX46ZSaHuy6Zb+1HQVAH
         oCdjRQIDhODMgj4flSQU7F764TLF7jd05CmWG37bVRL2WglUrQMdrmzq/ZQNA+TWtSfP
         Wpi72R5gV/FaL1p/traF4XIEZKmMpZEXFg93tZ0XO5b6AtQItD9nPf0+lBJNYKzco9Ym
         y9CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=JlesEEkl2apF0Vgehu4sGXp5PvKuQlJUnNfMhYlLPbA=;
        b=XfIYgiQziO2ecVqc6qBOdie8iioYFdkCPVOiKE8+YpDup6fynKYN2rhZiYLh/LghVP
         Ltb3o3gfUGdZzGqDbxE9Fz0QJjfX0tzzHBu8zg2G1EObXNRcfT3nF3v/6BkS3BrW51Ej
         xtvzw34AxaJe6YqBxGHqv6bQTcXgciW8QlSaE9rosFpfEni4cOHletdSO/i2rKjwBn+6
         PB48OOy5KSJpf4iJ7XBNNA/JmNqlykGbhWEh/fdsiFnJmm3OUFHWmrZ9GRXl2H2RpafX
         9lRq7QW69hXBvJ2S/uj5vBICWJ0cbQ43xQy6aP9GcFzz9lG68bdyfUG9F7PyCus1iV7Y
         EVDA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=cOe5lyGZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w26-v6si815706qto.58.2018.05.08.05.09.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 08 May 2018 05:09:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=cOe5lyGZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:50839 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fG1QY-00069t-In
	for alex.bennee@linaro.org; Tue, 08 May 2018 08:09:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35300)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1fG1QJ-00069n-4R
	for qemu-devel@nongnu.org; Tue, 08 May 2018 08:08:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1fG1QF-0000bN-4t
	for qemu-devel@nongnu.org; Tue, 08 May 2018 08:08:51 -0400
Received: from mail-wr0-x241.google.com ([2a00:1450:400c:c0c::241]:34735)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1fG1QE-0000bE-TC; Tue, 08 May 2018 08:08:47 -0400
Received: by mail-wr0-x241.google.com with SMTP id p18-v6so32085412wrm.1;
	Tue, 08 May 2018 05:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=JlesEEkl2apF0Vgehu4sGXp5PvKuQlJUnNfMhYlLPbA=;
	b=cOe5lyGZqnYlSaOPOHHN8ihDU86b/m2DK6My7KeTe/VK/borxvenx1dHsaSOOfv3i9
	9X51yX5KOWXVoUaJzpQwk3csjrLHW8Wvk/5MZj0EDvi4Ca0uVgfp58j/fm/4n4HjjVYL
	bv88BkpTdY76sYvt7VqHQoEVeY/dggJLRthkCF0ima9WmU8CB/SE1XPlphk6oqvekIUc
	iuVJR8QVnU5NDVoysDK1sx2yNoRb4WQxpLEBAdZvKXJjO5cNhm3liyBKznm43tsiO0wG
	DJ39emhQw58ibLOQI+l/4iHbEN/8qfi5Mf2JkCR+rzDKOApCs1XZIGq15JXtZP2NkYMm
	ROdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=JlesEEkl2apF0Vgehu4sGXp5PvKuQlJUnNfMhYlLPbA=;
	b=fRVu8nlweU04g4Y5wbWpJduRKYYcDPHr5F9wS98sFb2b5clmLD09yM9QdunYLPq6aH
	wJ0dnywDYPERmOc050sv9QuaKhI8+kRcmWCuogJVAlBYOo2cUl/z43U8EYyGXR1ra0sS
	CI4DMwHoONA+sN1kK400SB/hepa1X8ig6fbnUwvL0yZDC8/GrkLaWPvDuUvlGU1QtDVE
	zL0UYszS8iUK3uRe5siXdZR5eUl3ERCLRUgFCiXfIDHyRyvZ11rGvXM5slhOHW9cRhTZ
	lo6CEwfxu6iShmGwtlCXdRQ8oPC53VPDpEIBpJZ634BQnYM6m1ieBSGYe0l02W5sGvP6
	4b0A==
X-Gm-Message-State: ALQs6tAnOXmiF0Mgc0A5Nsfw/sPOcBm3XVJUfi6rrvsRYnwMzmoRIigE
	CjGhuQxICxGwbu31pwc+BzM=
X-Received: by 2002:adf:b11a:: with SMTP id
	l26-v6mr20911242wra.258.1525781326009; 
	Tue, 08 May 2018 05:08:46 -0700 (PDT)
Received: from localhost ([51.15.41.238]) by smtp.gmail.com with ESMTPSA id
	b57-v6sm39412470wra.9.2018.05.08.05.08.44
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 08 May 2018 05:08:45 -0700 (PDT)
Date: Tue, 8 May 2018 13:08:44 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Joel Stanley <joel@jms.id.au>
Message-ID: <20180508120844.GL19710@stefanha-x1.localdomain>
References: <20180503090532.3113-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VBq/nvTu32OVLBUP"
Content-Disposition: inline
In-Reply-To: <20180503090532.3113-1-joel@jms.id.au>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::241
Subject: Re: [Qemu-devel] [PATCH 0/2] arm: Add nRF51 SoC and micro:bit
 machine
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	Jim Mussared <jim.mussared@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: a1uFAUT5mGSW


--VBq/nvTu32OVLBUP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 03, 2018 at 06:35:30PM +0930, Joel Stanley wrote:
> Hello,
>=20
> This short series implements a minimal definition of the Nordic
> Semiconductor nRF51, a Cortex-M0 ARM SoC, and the BBC micro:bit, a
> machine that will use this SoC.
>=20
> This work will serve as the base for our Google Summer of Code and
> Outreachy interns who will work on implementing a number of features on
> top of this base.
>=20
> I've tested this with a microbit micropython firmware, and checked that
> it starts running by looking at it with gdb.
>=20
> I chose to keep the nrf51 and the microbit seperate, to not confuse the
> peripherals that are on the microbit but are not part of the nrf51, and
> vice versa.
>=20
> Please review!
>=20
> Joel Stanley (2):
>   arm: Add Nordic Semiconductor nRF51 SoC
>   arm: Add BBC micro:bit machine
>=20
>  default-configs/arm-softmmu.mak |   1 +
>  hw/arm/Makefile.objs            |   1 +
>  hw/arm/microbit.c               |  33 +++++++++++
>  hw/arm/nrf51_soc.c              | 101 ++++++++++++++++++++++++++++++++
>  include/hw/arm/nrf51_soc.h      |  31 ++++++++++
>  5 files changed, 167 insertions(+)
>  create mode 100644 hw/arm/microbit.c
>  create mode 100644 hw/arm/nrf51_soc.c
>  create mode 100644 include/hw/arm/nrf51_soc.h

Thanks for sending this!

Please add a MAINTAINERS file entry.  If you're up for it, I suggest
adding yourself for now.  Julia and Steffen could add themselves later,
depending on their willingness to stay involved after GSoC and Outreachy
end.

Stefan

--VBq/nvTu32OVLBUP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJa8ZNMAAoJEJykq7OBq3PIVogIAKW2xJTXgbP80Y1UooZpb2pk
yipmYonwAFp3MrGx0wGFgnkemvcO9kpKlU5CfthHyHejhSkwM64NEtSSXLPqjtDL
UbVrWNlKoWIx+7UXzy6V2ujLHQtd6l1USe3NyaiaekQllk/UPr58RPZVfIchecaP
DZXPyyFsIzACyXN4zvkrgQMTv9qIkmW5goFhiXAu9z+y1vZUkic4OjGoTDGNg9ar
J+lEHxgQ34UWwHAk1dgvF76Yopi/9OIms4Cfgl6fa2lvXfytbxifquW3m5sf6y8N
+BAI/YEIVBXFMiirEJIZdfw1vdMCak3E7fVcg16k+wSQmgLnd6WAky5LSn52Dsw=
=YQh7
-----END PGP SIGNATURE-----

--VBq/nvTu32OVLBUP--
