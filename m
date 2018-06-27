Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp6012074wrq;
        Wed, 27 Jun 2018 02:58:02 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfo7+nwJyFj3VIagc6Lgz05GFhOG/v7/WJQbIQvnNEe+NDioMrOA6TeS2/pKWsvB7W3tb+1
X-Received: by 2002:ac8:5252:: with SMTP id y18-v6mr1027577qtn.11.1530093482429;
        Wed, 27 Jun 2018 02:58:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530093482; cv=none;
        d=google.com; s=arc-20160816;
        b=V0eOUvf0by8y58WSJvzVpHxsRDXncKktQmINKIPnGb15T3/ixdz9vsti2hMzu0qJGw
         N9QR+kU0f5r4k6wpdr6z0F+U33+YXoHVVkud3EOf8PjJN0GsJr+MwlHojpzo5rZjGi2w
         fmlMVVr9HKN3vcphd2ty+rf1OXGbS57Q3CGdcTpUdLnrcjY8iaIGKKIaL0Qt39dzkgD/
         FUv7C49MwONf9BH7tNkt6/MDmR8nosluJqeEyG00m3/lI0DoQMrO4NVFlbJCsd2jlR7o
         ilx+lI9i5eveiACT5Im00YbZH+27C4+iAkLO3j/Xdjzu321MzyKRm+ngj+wYXvgdqfb1
         mXtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=R/9LFDsTqWHbCq/8FXGeA+z/bKEdGKA649fttHQ3NZs=;
        b=PCyJXfgyC+AXfSWZzG9aNo3Yt+fSB52lRzRAmnRdXyEROJNNdJezS1HFSq1eVnkW1G
         l9bwl1kui/m+U0ir84EuwQ/28zyokp37crWWSsg3nSHOISu1rPrfuZS4DZP4zjkVqE6e
         0UzBNWWRZqQO+j0+G306waYSKbVi9W90qoIJLcyPlfSxKPDp4k2Y7KmuXMWS8OCsnmeC
         VWluRTohw0yo8vbtiDIkn80j2gz87jKwC5d3W/qv2WMxUpjYNOYcIe7EVt8qkwt0Abnt
         nM+G9MhSLRO4fNoKIBAg6kKt7LL/O5nuCGsw9JGvb+4iHY9YS3Bc6YTs6p5ZrtBDuMVZ
         b1ag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="RK9/yRai";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g187-v6si3623855qkc.55.2018.06.27.02.58.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 27 Jun 2018 02:58:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="RK9/yRai";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:57698 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fY7D7-0004aT-WC
	for alex.bennee@linaro.org; Wed, 27 Jun 2018 05:58:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32808)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1fY7Cz-0004ZM-5K
	for qemu-arm@nongnu.org; Wed, 27 Jun 2018 05:57:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1fY7Cy-0000ez-97
	for qemu-arm@nongnu.org; Wed, 27 Jun 2018 05:57:53 -0400
Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241]:51139)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1fY7Ct-0000Wh-Ps; Wed, 27 Jun 2018 05:57:47 -0400
Received: by mail-wm0-x241.google.com with SMTP id e16-v6so5060892wmd.0;
	Wed, 27 Jun 2018 02:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=R/9LFDsTqWHbCq/8FXGeA+z/bKEdGKA649fttHQ3NZs=;
	b=RK9/yRaiD2alHg9gA3tYLvoZIa9gAeZny8Giy0vpkN9aHLtq/Aed5Cg8EB0BR6qDvj
	LYFQCziwd9VA+a5AKpfpof0mbRurJ7Bqwmjmy3CZj69cf1s+AAuc3xDY6+Rjty2Of1pO
	EyZ5Lj55Eq0bFaNdQVogVr1Z4XJkUeaWxI2hdQt6qnJppaRRdGOM1vQW/6ZiLPBvz5vE
	qA/orJuhznxNiC6O8+81H0FMMvANxePsMCiNEqcB8IiQXs9rMZkJEHzv1b1yoHl1qEG5
	Uq+W0ZSTbSNdzIkpwtYVhsq9pr8GpenDaMRBVwD779tXTbEtcsECKxFmVafIOQ9ZUkMm
	4gDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=R/9LFDsTqWHbCq/8FXGeA+z/bKEdGKA649fttHQ3NZs=;
	b=iKo9VMt2O1pgNBcu2B45/it9o9LBGw4TRNNOZdqs86BbyfYEpxMj3Mtn5965GiOLGy
	FmA47TWdmpy0X/D1/8G2Jw/38b6go08DBAHHE5Bt51zAawkghD6qmxZ3xRo2sMPXz/99
	OTJO8x0LHhZSzDou9iufAVfsMChnnLqL6yopNcstkTxcrrUzdVG2yBVH1r+xDRQiWe2i
	PHnBBnrCCR1fKbnlghKEMZD631JNtOTC/0LEWoKgahSBf/BDowiZIF3To+1t+U+WX/lz
	V73MEubUipiW/zPMCXtd/soLWrW/sEgY7iCN2QP3V1ZUFRw/xzj3ObzikKAKfeKmVduz
	+LJw==
X-Gm-Message-State: APt69E0TWRC9jYKFSYYBrafitFxAcTZgMtJqULUwfa1fTrwbyI49UBtq
	/dNyOfaT85QIwblHqnQJLHs=
X-Received: by 2002:a1c:5409:: with SMTP id
	i9-v6mr4709842wmb.137.1530093466445; 
	Wed, 27 Jun 2018 02:57:46 -0700 (PDT)
Received: from localhost ([51.15.41.238]) by smtp.gmail.com with ESMTPSA id
	m3-v6sm3320257wro.27.2018.06.27.02.57.45
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 27 Jun 2018 02:57:45 -0700 (PDT)
Date: Wed, 27 Jun 2018 10:57:44 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Steffen =?iso-8859-1?Q?G=F6rtz?= <contrib@steffen-goertz.de>
Message-ID: <20180627095744.GE4325@stefanha-x1.localdomain>
References: <20180627073351.856-1-contrib@steffen-goertz.de>
	<20180627073351.856-7-contrib@steffen-goertz.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4Epv4kl9IRBfg3rk"
Content-Disposition: inline
In-Reply-To: <20180627073351.856-7-contrib@steffen-goertz.de>
User-Agent: Mutt/1.10.0 (2018-05-17)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::241
Subject: Re: [Qemu-arm] [RFC 6/8] arm: Add UICR/FICR handling to NRF51 SOC
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
	Jim Mussared <jim@groklearning.com>, qemu-devel@nongnu.org,
	"open list:ARM" <qemu-arm@nongnu.org>,
	Joel Stanley <joel@jms.id.au>, Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6bpwIpbYuyJe


--4Epv4kl9IRBfg3rk
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 27, 2018 at 09:33:49AM +0200, Steffen G=F6rtz wrote:
> This patch maps preallocated user/factory information
> configuration registers to the NRF51 SOC.
> See NRF51 reference manual section 7 and 8.
>=20
> Signed-off-by: Steffen G=F6rtz <contrib@steffen-goertz.de>
> ---
>  hw/arm/nrf51_soc.c         | 174 ++++++++++++++++++++++++++++++-------
>  include/hw/arm/nrf51_soc.h |   5 +-
>  2 files changed, 145 insertions(+), 34 deletions(-)
>=20
> diff --git a/hw/arm/nrf51_soc.c b/hw/arm/nrf51_soc.c
> index e93699a4b0..82e4c2d833 100644
> --- a/hw/arm/nrf51_soc.c
> +++ b/hw/arm/nrf51_soc.c
> @@ -19,7 +19,6 @@
>  #include "sysemu/sysemu.h"
>  #include "qemu/log.h"
>  #include "cpu.h"
> -#include "crypto/random.h"
> =20
>  #include "hw/arm/nrf51_soc.h"
> =20
> @@ -29,6 +28,9 @@
>  #define FICR_BASE       0x10000000
>  #define FICR_SIZE       0x100
> =20
> +#define UICR_BASE       0x10001000
> +#define UICR_SIZE       0x100

This definition is duplicated in your NVMC patch.  Please put it in the
nrf51_soc.h header file.

--4Epv4kl9IRBfg3rk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJbM1+YAAoJEJykq7OBq3PIk7cH/RJNX0RmF/0jm9YaHbpXiS+W
5P2K1EW58m/VgxpXlc64HHxbEz6IPniYca/lQT78vmWG3b6IMKDZdevPahAHF9iK
YjwDtmscMXarjoSRxAfum5WaThjpLcDQ6ni8VqKgRm/EjNn5q15YxY/rsLcXbr3A
WNOxxNvSfHDMZK8c3exoSR/HdJ0Ed/6KQnrpU9SIxs6wEadPc3/1h/PytjwT5eQ1
4By3HHPSjaAUqdpPJjBChmU6qNriasyLn0dcLJvgnj8MJJ3XDo9GE7H08A17OiDZ
ypdFUTGKqr8xeL2u5FtwAByQUwnnY4CUvqg4KcFubCdMqQNsZaBeXx8DG0oS/eY=
=OwKQ
-----END PGP SIGNATURE-----

--4Epv4kl9IRBfg3rk--
