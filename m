Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp749269wro;
        Thu, 1 Nov 2018 05:34:25 -0700 (PDT)
X-Google-Smtp-Source: AJdET5esG4ZkrxRtPnk0CWwBgcJI6o3oTN7UVRqi9urNdtp5R4I2XbNe6xKck/9GAR86pms8CNpO
X-Received: by 2002:ac8:7153:: with SMTP id h19mr6202462qtp.92.1541075665666;
        Thu, 01 Nov 2018 05:34:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1541075665; cv=none;
        d=google.com; s=arc-20160816;
        b=bKMtz+Oz2BeAiRUcLKb4m6Nqnx/tTJ7A7i0ytYWbuWDyJ7ubGEJK0Kf6F35he6HCtk
         b07ic3VBn3y4ml1YjTBJxtyzSB8c5qYhG0v4ApJSibYiP+XMlG3yzHBU6QhOAPRSFfu8
         mgfypKWVLW6Sf5bzoA+Z5FAuaYSQm757BzEnd3byDqb5rn2kHSQnKytkpN8mJrmLE05V
         mGnB0oskVll1EiVt1aF3nbzrrbo/jPUyuRp4eb0202qZtSXSadB3wQ1IU+z/pu6MUYME
         tB5xyhiQj8xiLLamcTjb7j5ghVN1Sw4wz569qGOUyIjO4T9RXyJQxxwgPj+X+HGxqJFM
         eQCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature;
        bh=xu/AUxL85zgUqn7RRo8v9g1iA22M8YFXFnoEQ+GTWo4=;
        b=YIsbRxKAvF4l1wRbUHERBAC+Js+pM30gpapU7UV9D4TpSsa/xvabZaokpDdujwPj9R
         17h9vYZZBwWyfSCff9KBA3Ur4iukorZsAW/EQ5/lE6px3znExKyUy9aHaZzGNK/otunN
         lNkS4sSjEnT6wNNIq4uVDxd3FDvhD0j09CtkWz9R/7KbMg3ciqAFINwJ9CKiW+kukjM4
         vQT1suABqy6Bw/bCEM/wNHp2qObC8GTaDuZfZ2wrRakkV0IBrJMzi6eNSn0vbJvFWGdZ
         1XJ9wjTwt1wkQAFd5BE/EloXTFb2ZGgE23uBAxtE11ACftMbikSng3thgg+mK09c8W17
         2NSg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=fF8o13kj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f9si3099607qtq.274.2018.11.01.05.34.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 01 Nov 2018 05:34:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=fF8o13kj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41883 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gICB7-0004RB-1t
	for alex.bennee@linaro.org; Thu, 01 Nov 2018 08:34:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35285)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1gIC8r-0002eX-Aq
	for qemu-arm@nongnu.org; Thu, 01 Nov 2018 08:32:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1gIC32-000518-7i
	for qemu-arm@nongnu.org; Thu, 01 Nov 2018 08:26:08 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:37943)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1gIC2u-0004tD-RY; Thu, 01 Nov 2018 08:25:57 -0400
Received: by mail-wm1-x343.google.com with SMTP id l2-v6so1181172wmh.3;
	Thu, 01 Nov 2018 05:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=xu/AUxL85zgUqn7RRo8v9g1iA22M8YFXFnoEQ+GTWo4=;
	b=fF8o13kjVZA7Y9vLozOQRwaXd2YLIOPwEI9z7prQgBJNmH3L/HUtCQS4wtC0Bqjo4C
	xkwyddoBKBcnhvH766YquznTX6+N4Nb9qI5qYLUOUljB+PVVtpfydgkP8S89ddr4EztL
	dofas8LUB1qIVu1LFomz29gxxsVwVfdeJHOLQf7VoAeEKj4cdZ2mn+Eukafa2NCUcnN5
	RZnVRochfE4vABnn0q6exGFZmNUVfBi9Qlf4c5ZI3dO3myYcmYiHKdHzn1j74ckz7PJP
	l1yHPm5PcHtoBMTSO6OOfVu23jVVD7wKVinTkEVvuSox1jzLgn/VOL9DqxY27CSpzq7s
	lVHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=xu/AUxL85zgUqn7RRo8v9g1iA22M8YFXFnoEQ+GTWo4=;
	b=f7E6GbIne7QUvGcu1Ee4QGs+0ZHmo0x901girMb+maoQoyq1iYXPeGolvgBvIahAT5
	PyYR1Tw3ACScLfQ7a6uW+Fp9as8cUgydfJBcttYPTZDKoqJEZi4mjDQSHAyxPhG2qrdL
	H8Huqqi81SU/1fCIBVYvPxv9jtahpdAa62leqnmB4Kg+jpkU6NWet8+8ixO9TO54BS9Y
	BE9ycEg5RhBXPAPnGpkGFPzCvvQAUVycFpgGRd29Uk+WJ1tpEO82MAGkGC4ZN6hjF+tf
	C2b+wTDT7tr/qvr4bzETnBlocxVvlQK3+xdQtuA69kCW5lSJqEWogK0vMKFIgSrAEKzk
	RM1g==
X-Gm-Message-State: AGRZ1gI8HH7OT5HGWeJcUeWIGFv7ETpDj0R2tjP/3ozNnka0Xs1JRAVZ
	xk34uvIPddX+WN0fBpDi2mk=
X-Received: by 2002:a1c:7d8e:: with SMTP id
	y136-v6mr5370938wmc.140.1541075155522; 
	Thu, 01 Nov 2018 05:25:55 -0700 (PDT)
Received: from localhost ([51.15.41.238]) by smtp.gmail.com with ESMTPSA id
	u15-v6sm7052144wrt.53.2018.11.01.05.25.54
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 01 Nov 2018 05:25:54 -0700 (PDT)
Date: Thu, 1 Nov 2018 12:25:53 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Steffen =?iso-8859-1?Q?G=F6rtz?= <contrib@steffen-goertz.de>
Message-ID: <20181101122553.GO24946@stefanha-x1.localdomain>
References: <20181031002526.14262-1-contrib@steffen-goertz.de>
	<20181031002526.14262-7-contrib@steffen-goertz.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GPOl6LAGMgeiWDic"
Content-Disposition: inline
In-Reply-To: <20181031002526.14262-7-contrib@steffen-goertz.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::343
Subject: Re: [Qemu-arm] [PATCH v3 06/13] arm: Instantiate NRF51 special
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Jim Mussared <jim@groklearning.com>, qemu-devel@nongnu.org,
	"open list:NRF51" <qemu-arm@nongnu.org>,
	Joel Stanley <joel@jms.id.au>, Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 37uJBXb+Dp/4


--GPOl6LAGMgeiWDic
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 30, 2018 at 08:25:20PM -0400, Steffen G=F6rtz wrote:
> Instantiates UICR, FICR and NVMC in nRF51 SOC.
>=20
> Signed-off-by: Steffen G=F6rtz <contrib@steffen-goertz.de>
> ---
>  hw/arm/nrf51_soc.c         | 37 ++++++++++++++++++++++++++++++++++---
>  include/hw/arm/nrf51_soc.h |  2 ++
>  2 files changed, 36 insertions(+), 3 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--GPOl6LAGMgeiWDic
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJb2vDRAAoJEJykq7OBq3PI8DwH/jLR2AGFJpwq/k31r4a97TTN
ephxWoWEm/ONkAsTBcW2tfvVONSwO7vQtZU5d3kG7y/oU2v7asPkJSokZ8rkXlC7
7tEDHJ1TOCrigzvFMM5NsFwp5vHaPw3XEnygx0xWIg93DpHroB+MKAVb+X4ws42z
7pKdMm5LVCe6DRbZe99x2u3NIe0Y4Qs6o/HGZog3GCs0BtqkOgIUSrQmmGNizFDm
pAeCmj7hY4T21L+ToSs79KxStkGHmtGKkYclDnTFp7aSgpymqlphQL8ilbYF8CGr
RKeG4d/NjPrY/fZp2KjyVPzcOUzNeccPclV28MZE4puJQ8LloGUhzffm6wvM4VM=
=dpsh
-----END PGP SIGNATURE-----

--GPOl6LAGMgeiWDic--
