Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp2506681wru;
        Thu, 2 Aug 2018 14:44:40 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeNB2aHb/On7buvdUod6kSHTlXYeolyNc6HtwocjfJybjNGHU2jIuq4at2r+H9EaAk3z1bV
X-Received: by 2002:a37:7045:: with SMTP id l66-v6mr1218573qkc.232.1533246280036;
        Thu, 02 Aug 2018 14:44:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533246280; cv=none;
        d=google.com; s=arc-20160816;
        b=VqmtT1uFOAKkC760c8F2L3Bv8hIqlfrHWc6GQtQFxkudhmz1GYyZ/4XpJondgNibIb
         TXZO1obMix5GdY8/FVcXRaLIcVWQhRs2ac0pe/+dV+hU9u3+0UkCKrq9bRMCif1DLXod
         817gbXaWfZsArJq153S4HpDHGq+kji5VuIHjAI+SZQpUj+FxHDuXzakJtyQV8QljyRpN
         pK8PxhUP+haIq6EcSAUp26Leboay5izZB4EhDBwp+Wb8YjhwyaAcxIxybRlvxG91RCse
         0Pk9gjpWW9Sw+gmAkfwKCKSvsuP7d1F8ZmZpDOCzzSOaVbiw8mV7iN3+I/EZcq9C3v/r
         xFYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=YOCkoeIYQS4ibYvG58sZOB8FZFe/ooncrmh1vh0k+78=;
        b=Ytz9ThsVk4hA/0U35qQOfzNjxViijGjEsP6ZoxMmSOQ0uBH37aAMrQXi9NOimrFzo/
         7Td5g2AOsANfZygIwHaPmZflPEWYvMiMt+5xEH9kxEUDwbtyE69PI9CbbEdKGBZ6viQe
         8gpLkdvCLpNXNXhr8JQ4slPV7QPNezQqWG4g+OvQrCW1YEI2JH3rYe/f717eLCWonq0m
         N1JjhfT+QiziKPQ0ppRs3lP4woMDU+J7jDOfRNAULe4x57AEJQNcIf9QVzCMZqDcIoeY
         36Bop0rPxi4aNYUbpzi6J7bIn5F4dg3P4suVPio7JIrX3oSn9ZFk5A3KlTbwnS5fkK/a
         JHyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=teNezeDN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m7-v6si2596246qvi.101.2018.08.02.14.44.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 02 Aug 2018 14:44:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=teNezeDN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:47804 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1flLOh-0006bw-Ji
	for alex.bennee@linaro.org; Thu, 02 Aug 2018 17:44:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48989)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1flLOR-0006bf-79
	for qemu-devel@nongnu.org; Thu, 02 Aug 2018 17:44:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1flLOM-0005Uu-C6
	for qemu-devel@nongnu.org; Thu, 02 Aug 2018 17:44:23 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:41228)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1flLOM-0005Ub-47; Thu, 02 Aug 2018 17:44:18 -0400
Received: by mail-wr1-x442.google.com with SMTP id j5-v6so3513843wrr.8;
	Thu, 02 Aug 2018 14:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=YOCkoeIYQS4ibYvG58sZOB8FZFe/ooncrmh1vh0k+78=;
	b=teNezeDNIPVhw1oj0DXzyQRLNRbeGbGxB4FGdaj4htxD8694rD2K2Ie73n9n7qaxjm
	COssaM5tLwm3HTsDuCIscmvyX9Q9lBcLPiLsvwAkyl3Wesj4rgtBfhwSZVU9Cvms5S6O
	GDLuR6fvyP3kT/lQH4/wb/OmXTO0+Li2GsLyvE13jvUziQkScu3LlzhJkXqodc66xBo7
	Ot1XumFe55njYbSNjwxaclAShDT2X/QTkWvARYPA86RzPV87H9bLCHm0Kt6lzpjEfbHy
	vZDnGIDj4XOTLrL9SR8jxZigU1xKLXsISSRyKthoR/zjym01GR573Bhj8izmoSwmqWpS
	6UHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=YOCkoeIYQS4ibYvG58sZOB8FZFe/ooncrmh1vh0k+78=;
	b=Jez3n1iq2Dm1H7SMhW+B8qqw/1n43Og/RjR1YioGQGqyPcL5ZwboGSV8YHVcPc6OXA
	F6821lNzb1OrfQPKmztTeFdrXEEAjWnBCO8T2xuPkbwq9UKkxTPBTuzn01KtOe0zJ6wc
	JicWEz4TpuXrnAXu7qs9ecanCz35VhY+OSmsBZwMQP+g2NzMNaEbbncgYrKJgfeUUvrd
	XcO0KvMQMsWRo65h5/FAulV/MuFoxe13XOo6tvO5MDeAC75vp8/8x88pDzt/luBBawp3
	XAVq5AAVdlx6dmGiJzvCvk0dTnfJqDzcsFt1YXmTPmx1xPZ1L59yDJyXreMA2YO+nCBX
	7dbg==
X-Gm-Message-State: AOUpUlFIS0AFG/IcmVaG36UJ4kOpa6Pwq11oX7Bsyt4zvbmOX8d9wZmK
	FYqt4ZksuNy81r9Mq/goxQQ=
X-Received: by 2002:a5d:4643:: with SMTP id j3-v6mr769093wrs.52.1533246257021; 
	Thu, 02 Aug 2018 14:44:17 -0700 (PDT)
Received: from localhost ([51.15.41.238]) by smtp.gmail.com with ESMTPSA id
	r140-v6sm6591999wmd.7.2018.08.02.14.44.15
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 02 Aug 2018 14:44:15 -0700 (PDT)
Date: Thu, 2 Aug 2018 13:43:45 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20180802124345.GA25289@stefanha-x1.localdomain>
References: <20180725085944.11856-1-stefanha@redhat.com>
	<20180725085944.11856-7-stefanha@redhat.com>
	<CAFEAcA8m2f-DRiDNF0ry4nMH9bzZ1gODV4MTgtLwR5jTNdgeJA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fUYQa+Pmc3FrFX/N"
Content-Disposition: inline
In-Reply-To: <CAFEAcA8m2f-DRiDNF0ry4nMH9bzZ1gODV4MTgtLwR5jTNdgeJA@mail.gmail.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::442
Subject: Re: [Qemu-devel] [PATCH v3 6/7] loader: Implement .hex file loader
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
Cc: Jim Mussared <jim@groklearning.com>,
	Steffen =?iso-8859-1?Q?G=F6rtz?= <mail@steffen-goertz.de>,
	Liviu Ionescu <ilg@livius.net>, Alistair Francis <alistair@alistair23.me>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Steffen Gortz <qemu.ml@steffen-goertz.de>,
	Su Hang <suhang16@mails.ucas.ac.cn>, Joel Stanley <joel@jms.id.au>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Julia Suvorova <jusual@mail.ru>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ckP1l3sPzFd/


--fUYQa+Pmc3FrFX/N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 30, 2018 at 07:01:53PM +0100, Peter Maydell wrote:
> On 25 July 2018 at 09:59, Stefan Hajnoczi <stefanha@redhat.com> wrote:
> > From: Su Hang <suhang16@mails.ucas.ac.cn>
> >
> > This patch adds Intel Hexadecimal Object File format support to the
> > loader.  The file format specification is available here:
> > http://www.piclist.com/techref/fileext/hex/intel.htm
> >
> > This file format is often used with microcontrollers such as the
> > micro:bit, Arduino, STM32, etc.  Users expect to be able to run them
> > directly with qemu -kernel program.hex instead of converting to ELF or
> > binary.
>=20
> I'm still not convinced we want to add another random
> special case only-works-on-one-architecture-and-some-boards
> feature to the -kernel command line option.
>=20
> Adding it to the "generic loader" device might be more plausible?

I'm not sure I understand the purpose of the generic loader.

As a user -kernel <myfile> is easier than -device
loader,file=3D<myfile>,cpu-num=3D1.

Can you explain the advantage to moving hex file loading to the generic
loader?

Stefan

--fUYQa+Pmc3FrFX/N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJbYvyBAAoJEJykq7OBq3PIHOsH/0NIl2L/Bj0r1WKdxLUFCWP7
lMsdYvs6cXmRo6UfgtjR6QIuAG54YSQn0lzVlHlH1Hxp76yT0Tql5XJOatRUp0A8
Rc83O0mdwT9CsxAzD3PTHjXH0kfYo/D6AHSfUsCzuO0h3V5GTz0S+WwSD69wRxmg
ICif0rwO92TQfQkyYoofEy0VtesofE6o/1vIXDZSJyzWwKMW5BMVFLct5FoO4UqO
uUP6pu/gHTHqwd3gAmr6KQ5e61EVYwaPfvAl5Ga3PclovQ0K8H18ngte8XT4lonB
L8I9e2+yp0sti/PwT2dUJE0zj0XsD4K5gDYLwrY3KlLj2Q+DiNhp7izBDleh6K8=
=bq7k
-----END PGP SIGNATURE-----

--fUYQa+Pmc3FrFX/N--
