Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp692024wrw;
        Fri, 16 Nov 2018 10:04:26 -0800 (PST)
X-Google-Smtp-Source: AJdET5dYD2yBw+PTBinv6gidv+7S+Wk4kiL+ittXWgbMs70H6fnBXYsIj0wZNoJaV7Zl9+8Rdsg2
X-Received: by 2002:ac8:5053:: with SMTP id h19mr10847257qtm.280.1542391466703;
        Fri, 16 Nov 2018 10:04:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542391466; cv=none;
        d=google.com; s=arc-20160816;
        b=oAG7bgmw9+CrhwJO8C4Q+P4lYkYKZdXvTUqFI11PnrliJPdWivgZ5egR2k4m1x+X0A
         g0qy8/GejeHTP+0h+HrYpRvGdSokD2RXUexZQyY0W1oqU9j3Wdi1SI3bIfgbL2hVaoOw
         QEkMGWdOSYyPCWkT2MSm8b2Ff9xze8jycFjOainiJzMDbpY24I4u7ZLKwqA0xJWm+fzi
         1ap3csigTvyf7yuF/rt7BrasEYI7W3iAxL707D7r9qRNZhNjNQAKvRZnwewdUBLHfAE/
         U6sa7MYDh2fkB7LDDCsdnnhhYS9GKsDxfsrnRek1S1ow8wzVRyX1O+DBRBMpLEA7RUlS
         qf3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature;
        bh=am5vsMgGqQ5v48Z1zdVay6vwtHQY7P1VJNLhS1yrWp0=;
        b=LQ8s+EkfyceH61r3SXbX8kGAMX3rUVV3DFW2yJnV00ClWwQBw4ZroMwrdCmGoom2vN
         2ndqEL140K9LTbNNoqdQodcfi27xgTIi1FeP5vrP6+VNdVKdq7RQirkQOs77ra8X71AD
         9DUI1HthFQODc5TYyHNSQBjV5G0ABWasqvOziu6VZVflCo8vy5/0Kw1ntkKZbt18jgZy
         s+E7ZHG1Uz1JLdkdroHD0JoI1hoYVikHbR7uiqs/tWk2AceZk6wxpx3m11B6lmH7hXyP
         yVTnvLm9vhaMm6Ew6TrT6JY88kO29fKfzSGkD1p6KSebKVvPmR21tvB8leBb6ij5EmcE
         cdsw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=BjH3WfsI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z1si1015802qtd.368.2018.11.16.10.04.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Nov 2018 10:04:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=BjH3WfsI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:46173 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gNiTi-0008Bm-2z
	for alex.bennee@linaro.org; Fri, 16 Nov 2018 13:04:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36573)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1gNiTX-0008Bg-BD
	for qemu-arm@nongnu.org; Fri, 16 Nov 2018 13:04:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1gNiTW-0001zw-PT
	for qemu-arm@nongnu.org; Fri, 16 Nov 2018 13:04:15 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:52413)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1gNiTS-0001yZ-NR; Fri, 16 Nov 2018 13:04:10 -0500
Received: by mail-wm1-x342.google.com with SMTP id r11-v6so22894470wmb.2;
	Fri, 16 Nov 2018 10:04:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=am5vsMgGqQ5v48Z1zdVay6vwtHQY7P1VJNLhS1yrWp0=;
	b=BjH3WfsI7ZVPHObYGhRBtSirt8lfVyvD9K1sFNqgDazPjTXhlV87U1GAQUL194QDt+
	GcB/ZIyCxvDSVWVEv7vPNvT3+1L066TlLzrHuCkYAWenhmzZYrX7ni3fXbR4M4ejrZUd
	pYCzur0SEFDZIUnPNs7Hbh8KOSc68DSjMH7YY1vXeyt5meyu59ks0o8rXSnclM137Et5
	E+ECpuKxeofQ/7QB/6F7ppKzewYZaNJ7UX945MAofSf+9JxuUEnHUbqTSXLvF5OitG/v
	PUKggViImv7e1lOEoWNYZ3eKOtigD1aANAGHAMDBN2y5094iBaWmrTwcdW31dG06m9CK
	XAgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=am5vsMgGqQ5v48Z1zdVay6vwtHQY7P1VJNLhS1yrWp0=;
	b=Qv6Qn+DZbx2QQA2jk0z+wddrYlZORiqONV0ltrxtXNP7uQ3Hr64a2tUmf2kW8Qk5xj
	U7z4p16K7Btfw7pcukXf3g9pBijLGdeEbe5mKRUGHr1g+4NHnMfSjfgeJOlBqPe3e1LA
	VBR4g19CxLLK5/xjBUm694PcOhapkbUs1u0hPosZ24dnS4rxjvSe9AkJ/Uk/rijM2srI
	TX2wdP1HHU5VCYcWv5VbVruDUQLVxJA1gZoSqQeslX82KHkWQmrBcwtDklTZCrthj2s/
	sRW7+LWX6azgfVur088gCAW1Wgu+uDnk/Vdi5OLN8ShugcdNAtBjH8gvSnp0stvKEe2g
	sFYA==
X-Gm-Message-State: AGRZ1gI0PWaZPUw0mDVAzM7rFYPAL0OVR2RR3D2q505VM5uuC1PvaQU2
	PWVL66JDUku1ArvhbKhGbi8=
X-Received: by 2002:a1c:7a03:: with SMTP id
	v3-v6mr9378412wmc.108.1542391449573; 
	Fri, 16 Nov 2018 10:04:09 -0800 (PST)
Received: from localhost ([51.15.41.238])
	by smtp.gmail.com with ESMTPSA id t4sm8971371wrm.6.2018.11.16.10.04.07
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 16 Nov 2018 10:04:08 -0800 (PST)
Date: Fri, 16 Nov 2018 18:04:06 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Steffen =?iso-8859-1?Q?G=F6rtz?= <contrib@steffen-goertz.de>
Message-ID: <20181116180406.GA24933@stefanha-x1.localdomain>
References: <20181112214224.31560-1-contrib@steffen-goertz.de>
	<20181112214224.31560-7-contrib@steffen-goertz.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bp/iNruPH9dso1Pn"
Content-Disposition: inline
In-Reply-To: <20181112214224.31560-7-contrib@steffen-goertz.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::342
Subject: Re: [Qemu-arm] [PATCH v5 06/14] arm: Instantiate NRF51 special
 NVM's and NVMC
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
Cc: Laurent Vivier <lvivier@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Jim Mussared <jim@groklearning.com>, qemu-devel@nongnu.org,
	"open list:NRF51" <qemu-arm@nongnu.org>,
	Joel Stanley <joel@jms.id.au>, Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xeui3Zvn2uOk


--bp/iNruPH9dso1Pn
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 12, 2018 at 04:42:16PM -0500, Steffen G=F6rtz wrote:
> Instantiates UICR, FICR, FLASH and NVMC in nRF51 SOC.
>=20
> Signed-off-by: Steffen G=F6rtz <contrib@steffen-goertz.de>
> ---
>  hw/arm/nrf51_soc.c         | 43 +++++++++++++++++++++++++++-----------
>  include/hw/arm/nrf51_soc.h |  2 ++
>  2 files changed, 33 insertions(+), 12 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--bp/iNruPH9dso1Pn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJb7waWAAoJEJykq7OBq3PIPH8IAJEDeZgHnPZEGPGe4nzYT/e6
bCEAOOx5UaIZYWRgTi9oF0PnZ4gZQo55rEA/1wcJA6+UapoYJIcA03z3C1NvjsK/
EP4noubPa9Sr2Is3hy2AVfDndOLGUyKVNaG/1rBLRYajmYotc9IhO+5U8QGzPDAk
5JqdE6ZNkAv4oCWniOxPxdlTD68y3Jp3GT/Cu8vy83hDRz1N4OPmS7RcffYu9Hux
p/Vn+nPT1SWsm2a1g7bKiKHSVRRtUjehURr07CdvqxX8qwgdAQLV5+lqGrkd0nB9
WYd+5v8+FRNT9ppweQnVvOVP6bFWK5fUvSCvWALG4sr/fYsVE6XBWFr3sN/VDB8=
=LLjC
-----END PGP SIGNATURE-----

--bp/iNruPH9dso1Pn--
