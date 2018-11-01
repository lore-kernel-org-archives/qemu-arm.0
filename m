Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp648762wro;
        Thu, 1 Nov 2018 03:57:26 -0700 (PDT)
X-Google-Smtp-Source: AJdET5ft1r869+qCNlIGboghIbvIpV77R21QClilW/Hz/sNPGUO/o3EYA3IU2OK8omN4CQD1prnh
X-Received: by 2002:a0c:d2f7:: with SMTP id x52mr6126633qvh.35.1541069846321;
        Thu, 01 Nov 2018 03:57:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1541069846; cv=none;
        d=google.com; s=arc-20160816;
        b=lrLcJcHoS8oI5NfmNd3yXfMnzpKbbnZkdZ+IiV0kbXxALauQodWmWjBJNYTv+qUOwD
         6qqi7liqq/7c7IkxxCAsSuCKVsKsomTpjE0fsBEB5o7AYCXqe4Q/pS7RBSPZksK4x18P
         GDEqOy4IwM+gMfUEGZNsKEXyfCKQapQv16oL5V7emVxAHt2mw/z1Os5HMTE7qGoZ6hPu
         /BBWtO2SmUEiSnfYPVCdf7GkQqT7ePo+Y5bfcbp1hecWzT+6r23tG/x3NUus7mYHjWQX
         ttJUckvKpAi57f+OgJfAEnm3DJ9apuJve+jtCfXzMPRoUZ/KV32VYKqftLWXypke5v9/
         xEmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature;
        bh=ooMLs+9uzHuKlqF+yfSvOCqXPNpVUWuN3xC54B5eKXc=;
        b=M5huYO8eORQjh45jTSvm4nXYivg6wO6w6MrbGyS82Wf/W1lnAShMT4rtbs5/jJcWjd
         mNf+Cig+VqLga0ueuOvNhZ9wDUvVwuIjPPzmK/7yKhX/lPQzWQGNXvd26kL+qzaJaOHV
         pHdvpqrWzYjdC8B8GQlUEegJlIZckIfBqbO1EGBWphcqzXUnLanuLJV/dwSF0Tgrd/UD
         KKIXH/X+/V5I2qRTW8PAy6laM3nwDo8Cnnr7YnaZfDCtZSVhjC81HxrCcfJUHrSqU+Xq
         QouJ0A+4Y9OOx4GztF/a5cFmmvFDRZRR4oXyXjgHovNYrNP8kb5iEuxq6UZyrLfgvSa5
         I4Pg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=tYySPNP+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h4si1541789qtm.381.2018.11.01.03.57.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 01 Nov 2018 03:57:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=tYySPNP+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41325 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gIAfF-0001UI-S2
	for alex.bennee@linaro.org; Thu, 01 Nov 2018 06:57:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39982)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1gIAf4-0001Sr-Ix
	for qemu-arm@nongnu.org; Thu, 01 Nov 2018 06:57:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1gIAf3-0006l8-Ib
	for qemu-arm@nongnu.org; Thu, 01 Nov 2018 06:57:14 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:34859)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1gIAes-0006YY-Is; Thu, 01 Nov 2018 06:57:04 -0400
Received: by mail-wr1-x442.google.com with SMTP id z16-v6so1740961wrv.2;
	Thu, 01 Nov 2018 03:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=ooMLs+9uzHuKlqF+yfSvOCqXPNpVUWuN3xC54B5eKXc=;
	b=tYySPNP+J8VUdv/HJpRDynL9vYP6EAvTMgxizYRMSgFJCKVf7j/kMAuZaiLVHtruVa
	GLRJ6uh/qWxdQ99ieKhAJbkkyE2oiKErpQlJRvfB2ymhlyLVDtqLYEiro4Y1Aislxmv2
	WkxLBJI1UCXbG8/blCYmN0OjGmmQG5en3yCRGhltAb9CUYdRcf9f9NoWlx+06FU5TV4w
	8OPXk+xUBS0CIad2bJgGcZSB9IKB6M8X57NHS/qzixzgLGjr2yB9Tnj4s+uWdywvobAC
	XaAjE09KIrcpJ6H8K8JQwjkWhYnaV7V5SEyICYNghTGn1qcEOyKi7S5suOua9sxD6KPS
	S36Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=ooMLs+9uzHuKlqF+yfSvOCqXPNpVUWuN3xC54B5eKXc=;
	b=OqwgFQpkpkFF9qhc2HWrW0SZ5yzFOrzKzAMH5uhbQy9YhHckiNUwZyP6d693OkHhZ6
	JbcuzNQm8vroDYSZHpQMGcWzBcSwbrYVRfxYKMbni7LgkMzUm/SUXNQto6XHKFl6Rsna
	rawM3rxdytYeKzrrBavMX/7S8WIWRrx3Ua6/SHfzpSfh3C+h3CLD0DNVh91xM2KBWZfZ
	JfwEYn1wveezsQP94+yzLbRykleY7hTC39Vk3pUtanITnrTY42Yc1Mqxt8qg3oWBg894
	bV8XzBwf3cWucXeOsh2dAf7UDhlEn4t0BeSggrUsMGe3cTeChrhFPRZ6nDyQ6rxLjA9o
	L/sg==
X-Gm-Message-State: AGRZ1gL68MRp/ijcBBGEe+b3OTjy2A5NkV0vAe1Pkuc+vEYmPHKsaYSS
	El3t6127h9lRHbeUrb1CVAA=
X-Received: by 2002:adf:ef04:: with SMTP id
	e4-v6mr6193479wro.292.1541069818339; 
	Thu, 01 Nov 2018 03:56:58 -0700 (PDT)
Received: from localhost ([51.15.41.238]) by smtp.gmail.com with ESMTPSA id
	7-v6sm12241061wrl.27.2018.11.01.03.56.57
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 01 Nov 2018 03:56:57 -0700 (PDT)
Date: Thu, 1 Nov 2018 10:56:56 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Steffen =?iso-8859-1?Q?G=F6rtz?= <contrib@steffen-goertz.de>
Message-ID: <20181101105656.GK24946@stefanha-x1.localdomain>
References: <20181031002526.14262-1-contrib@steffen-goertz.de>
	<20181031002526.14262-3-contrib@steffen-goertz.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LQ77YLfPrO/qF/pM"
Content-Disposition: inline
In-Reply-To: <20181031002526.14262-3-contrib@steffen-goertz.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::442
Subject: Re: [Qemu-arm] [PATCH v3 02/13] arm: Add header to host common
 definition for nRF51 SOC peripherals
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
X-TUID: KD5Y9/t8VV1d


--LQ77YLfPrO/qF/pM
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 30, 2018 at 08:25:16PM -0400, Steffen G=F6rtz wrote:
> Adds a header that provides definitions that are used
> across nRF51 peripherals
>=20
> Signed-off-by: Steffen G=F6rtz <contrib@steffen-goertz.de>
> ---
>  hw/arm/nrf51_soc.c           | 33 ++++++++++-----------------
>  include/hw/arm/nrf51.h       | 44 ++++++++++++++++++++++++++++++++++++
>  include/hw/char/nrf51_uart.h |  1 -
>  3 files changed, 56 insertions(+), 22 deletions(-)
>  create mode 100644 include/hw/arm/nrf51.h

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--LQ77YLfPrO/qF/pM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJb2tv4AAoJEJykq7OBq3PIQt0H/0Vpr11KB0rKIKgXmYwtfCGT
fRDyaMKTSMrw5qbccZMLwWzjicOZ3GziG9NUVOUIbWWUsnlUcaJTSlnwyKMCaVbD
BPxk6kBNoDCfGPWJO7Chmss1Z9I98CBgaGf6rgE4Is9R4bbCUAlEhSWfAyJRuA4/
vGYPRacUeOftJgKNZmVkaUJVWKXqcUi9cMYW7SdGOrm3jzn70pfHB8iSVrGs7YtD
OzHpQp3EULnORtz+c5EeN6Cv4s6oqPCTBfnD/oKWL5zNTP0C8j3wiWTAl9NXf6DY
4TFhYc670SMRUuimGohMCBsh9QPkM1FsPXlTST+7FXbj3CmxMX2ytryC92dgZzE=
=bAyz
-----END PGP SIGNATURE-----

--LQ77YLfPrO/qF/pM--
