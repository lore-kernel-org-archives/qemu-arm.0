Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp3593849wrq;
        Mon, 2 Jul 2018 05:29:57 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdmWfdMtJYRZp10zKikGaNqcDcfIJReMznvzRIGAxrQ97w42mowjnSk5FZCAr3vHxvbxEsr
X-Received: by 2002:aed:39a1:: with SMTP id m30-v6mr7789520qte.328.1530534597817;
        Mon, 02 Jul 2018 05:29:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530534597; cv=none;
        d=google.com; s=arc-20160816;
        b=G+A/gq5t+0bDFNg4b/K1alpOC4XoOKJtgL6PM0mu4bACK3JO2fxrKm9U9arzNJkyk6
         asYglHJlEtEZUh6R5fz1tyI0LeVcWGlgp+zVPzCVmJV9rD9P0b04Oe9oK0bwl5egZ0c5
         Zu6XSKAGhSiz78/5V9se4AlEuAmGhtBKpTSqJgP/z2X1z9+pn8B/EOXccoRjVu0MOzXL
         NoSq9hYQCR35giRIxY2MRqi+il/7OSdCxzuYvzkdP/icHbzgsXpJn+X+l32fC6m6ERhQ
         gbyqmxHABc/PWlTOvnv+nYQVhGhbrG/dnv5ENvZd86syLxMmuGX4TG0IaM2eevytv7vS
         8ZYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=mue/75Gqn1X+OOY/4W3A/+Qyho4m5R9t9gMVWVv5Q0s=;
        b=P6nSlGH5zceTT7E71ZrKqnQMXrAUlQ3QvW0jt5GgF+guEkemEI+Kphf+ThLJeB3tw8
         0xt/L61llFR82Z0sUatxz1xo8avPl0wY5ng1a6+FyrDdOoPseQjAjvcad31wf1B1h7WJ
         FpkyRSx+rAV/fbL941lD54iDFv3VF6Ua16humtuMWw8YIGqdtXguCF7qQHBULnVs9pAJ
         hObFiHBeY9vrQWjIB7RmnMGpU03kIvjuSjR2xmhmPYFTMEyr1sHyd6RF7+gUkUYRnIGB
         j093iVS3p3CmkiOwd+i/aIm4TcdE5E7W84K0hQPU4ywBXDpDE6LRpe4VB/FNPifKSCgV
         i4Pw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=rl9xxvhY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q76-v6si3778939qki.332.2018.07.02.05.29.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 02 Jul 2018 05:29:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=rl9xxvhY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:60746 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fZxxt-00062d-Dx
	for alex.bennee@linaro.org; Mon, 02 Jul 2018 08:29:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58036)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1fZxwM-0004yk-4i
	for qemu-devel@nongnu.org; Mon, 02 Jul 2018 08:28:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1fZxwH-0004wS-73
	for qemu-devel@nongnu.org; Mon, 02 Jul 2018 08:28:22 -0400
Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243]:50298)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1fZxwG-0004vu-Vn; Mon, 02 Jul 2018 08:28:17 -0400
Received: by mail-wm0-x243.google.com with SMTP id v25-v6so7889173wmc.0;
	Mon, 02 Jul 2018 05:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=mue/75Gqn1X+OOY/4W3A/+Qyho4m5R9t9gMVWVv5Q0s=;
	b=rl9xxvhYblAJURnWbO2KwFAAF6aZ4z35rhW6SlaZZB8iVLVIOWE9vEkTK6eaTtaRGz
	zV6dFNxijb3P36gIJrcjgJ9W3Qxlk2+a8M4RUwY73y8hyTkVFfkx1ORFZLHWTW6QHSlv
	xusSUAFdBwTgklGrSq2YeWYrmYvglMJW1GPf0Q4QxISwRAIv3fNoouHnJ8FTjpmwedCu
	0OmZPK/ITX/q+clkWEnHTfujPHH20kFZZBzebvIR+1zR5I8nSM4i/WrOQIjAdaFl9ys2
	NRW2XjR7yv0djieqyMN8pGgSyDBqe+WA4VDhsfHgo/fZ/lIzFLW2nxkDK/rJV3djxRya
	bzgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=mue/75Gqn1X+OOY/4W3A/+Qyho4m5R9t9gMVWVv5Q0s=;
	b=AnGjIq9KJwYHnha8KSin1GYl1Xk9MYuPtJtihcX2aIgeSM1R4olUH6/5odKYzkMLw1
	tIFqnkUIDbx9sHcMqp6KMbemj9pn0gS65ayj7zmOQGn1Y9NEG6vMYRGq3OlTmZ9L0DwM
	CFHhw+HhCHl0wREn8E1/M4DLufQfMYPJRHnYaq2CXQ+IlBT9jcgUtFuLBckadrYVVFi8
	fMWPy+QYaHTQrXTS9ADeYPW261vVlSqZRWwxLFrgaOh/VyRAMuJszKjL48GKiSIMuUIs
	+BS6puSZAjlOxpH/YErCy/o/lWte6qNYtiC9i9S7UwoBpE+y2AjZ+KbCvpA1bQNYNRbj
	mygw==
X-Gm-Message-State: APt69E2PE5Arkg51KxzwMDFj3m+V5ZO7NnHk2x+a3eNa5kNCel8CB1tN
	mSxCmYR7sNp+TPCSVIyJeQQ=
X-Received: by 2002:a1c:acc1:: with SMTP id
	v184-v6mr2815238wme.114.1530534496008; 
	Mon, 02 Jul 2018 05:28:16 -0700 (PDT)
Received: from localhost ([51.15.41.238]) by smtp.gmail.com with ESMTPSA id
	o42-v6sm15750975wrc.50.2018.07.02.05.28.14
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 02 Jul 2018 05:28:15 -0700 (PDT)
Date: Mon, 2 Jul 2018 13:28:14 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Joel Stanley <joel@jms.id.au>
Message-ID: <20180702122814.GD2155@stefanha-x1.localdomain>
References: <20180627143815.1829-1-joel@jms.id.au>
	<20180627143815.1829-4-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+B+y8wtTXqdUj1xM"
Content-Disposition: inline
In-Reply-To: <20180627143815.1829-4-joel@jms.id.au>
User-Agent: Mutt/1.10.0 (2018-05-17)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::243
Subject: Re: [Qemu-devel] [PATCH v2 3/3] MAINTAINERS: Add NRF51 entry
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Steffen =?iso-8859-1?Q?G=F6rtz?= <contrib@steffen-goertz.de>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	Jim Mussared <jim.mussared@gmail.com>, Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: u24jeWlqs0iO


--+B+y8wtTXqdUj1xM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 28, 2018 at 12:08:15AM +0930, Joel Stanley wrote:
> This contains the NRF51, and the machine that uses it, the BBC
> micro:bit.
>=20
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  MAINTAINERS | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8c626f6a079e..fef3d71dbef7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -656,6 +656,14 @@ F: include/hw/*/*aspeed*
>  F: hw/net/ftgmac100.c
>  F: include/hw/net/ftgmac100.h
> =20
> +NRF51
> +M: Joel Stanley <joel@jms.id.au>
> +L: qemu-arm@nognu.org

s/nognu/nongnu/

Aside from that:
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--+B+y8wtTXqdUj1xM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJbOhpeAAoJEJykq7OBq3PI724H/35xM0f3PMkg50f8sE2POCgY
R4rl7eZW858ODZCEazHRuGVca4Oa+Y7fryvWbw/SHCvxyxH5feeal+KSLlcLx+0i
J4u/OyOCq3l8xcGbsmp15Gec84j/rXpPSrh7f+npD2c2+vdw8VxKux8QvLYLzGIp
SLu6ZKIdA34MUg2DZCAof92lW7cGHXLV4jH01+4rPZIWmcBLNhkqznSjdPvyZDwg
O0V47GHgZHuSJlWICmwIo0KTZQ5pqJU3K+UtognzlCmZ464vYq+pPei9J1uLqoAa
zF8RZAn/kEMw5wMUj42zPKf5XCyc2EuuTZWZJX0buD7yfU1GeHdV60iDhAo/xY8=
=tKSU
-----END PGP SIGNATURE-----

--+B+y8wtTXqdUj1xM--
