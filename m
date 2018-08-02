Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1639023wru;
        Wed, 1 Aug 2018 23:51:44 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpe3IRKAJmn1X+j2NO3u1b8bf3/4nTW7Kf1Sb1wiT08fMXaldYS05J13eNLvZbjto5uxmtU7
X-Received: by 2002:ac8:8f0:: with SMTP id y45-v6mr1438302qth.408.1533192704096;
        Wed, 01 Aug 2018 23:51:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533192704; cv=none;
        d=google.com; s=arc-20160816;
        b=sVbG7QTwZ5CEqjPWs/X73lLkmbZhwP5KGP/yYeeVP9ol4JVlT2Vj3ka2Ks4rLJDOf/
         x2u+fYSmhh/XnY6FwceiaPtO6GLrwoTCZlhN9xQr3YrAcHA77KQy+bF/WOb9Jv5TBhuv
         rZEZaZXHY5MNbqtMhy+Lc2YqoZvHZTIrTmVfOpLWltShHJZGTOHrhMRfR97I3xqIwPi9
         N2Fgxc++EEhe5cRf3MvN9kceTMZOcUqV45eJbS1o0d09lkKn53LqWjHfa6UmZQmA2mtP
         lZrAIR/qMIelmjoQMvM7YBtJxOY2RVLHjcpus4JkWshcFuloRtKm4ySDqfeJAyXlQkio
         aGvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=Cq+PgbWx4Tac2/sxy8Lk475G5HsuRCBIi/RL7+7sF7o=;
        b=VaKJYN4bb7KpZo2l70nAJoDkf/+J03rKm2lM5EwH3VS7c47k5rADGYqFQR9JKQG1yI
         jKmss4vK1VyIs9/2g4Yj8GSDSIeRmJXoo242dVShaFzhXVK02LJI+Q1MCr6LdC0fbN3x
         +ggvj2oVSz4AG/xAZNvLAtTQx/NWrkXRscFFGNlbBLTDSkrSx1AAnsmLvR7w7MG6PLMz
         4suSpsMAwlcZy17c1GYOTTb0kzEDy9gHepL+WU7PW9u/30LB3lq0MQNHnH40ay7Bc7AM
         Q7YrOBa0nVKtVr/3IyQDXQuMuD5PbrcPWk99zIvumPCe8PBevM+72HsM0ZGvv2YfFhrf
         jxJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="XN/IDYYX";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d5-v6si276097qkf.371.2018.08.01.23.51.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 01 Aug 2018 23:51:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="XN/IDYYX";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:44288 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fl7SZ-0007sK-L5
	for alex.bennee@linaro.org; Thu, 02 Aug 2018 02:51:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47942)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1fl7SQ-0007r1-GG
	for qemu-arm@nongnu.org; Thu, 02 Aug 2018 02:51:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1fl7SP-00045V-GV
	for qemu-arm@nongnu.org; Thu, 02 Aug 2018 02:51:34 -0400
Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242]:51147)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1fl7SK-00042C-Fw; Thu, 02 Aug 2018 02:51:28 -0400
Received: by mail-wm0-x242.google.com with SMTP id s12-v6so1191191wmc.0;
	Wed, 01 Aug 2018 23:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=Cq+PgbWx4Tac2/sxy8Lk475G5HsuRCBIi/RL7+7sF7o=;
	b=XN/IDYYXXYJ/ijs6YZbAY6YGhQbf7iiRtUf3S7HJtQJX3/mIwIm0lPq5WE2jpObT5c
	+SVvwcf9OgRHrPZSiEymE24NGRp8cbPOTR6NjAx9aSqFeBLeXSOGvDCzCwuhTyDCZjND
	HV+xHTbREXxhw3oaTmJwQQQJvaeg1DmL+KDoVN44smMvIo/xvesgXbM70soBFdR1UnzG
	NJ+eX1oS8psc4zahmoFt6Hgyl2f34P/WdTydEk2S1uIspgxiiSOONrRLeWos6LVIoVC6
	3IuzzapRpvJp94aCwe53zs+Aluf2oNfBZIzLwazuAv26gdfNHFPxpkM8xFqNfNfwF2so
	YQ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=Cq+PgbWx4Tac2/sxy8Lk475G5HsuRCBIi/RL7+7sF7o=;
	b=JvYF2itdZV9jiCpwQ5+Dfjm3DbrZzPqRwsb2EwZMYvq6zerenq2F3uznn/l477b71Y
	lN+W7mbHd8iOTssb1BKs/pxxZna/XHxXzUuKaFZ9JOCbIR2iMYogTxMQwrZRGh5Q8m8l
	AyO6k3OtY7WQJzY/dhUrwDmJrn05X+VMtlPSTmtBHYKZp/3UlfEBop3E2DGl5SzFtR4L
	1kGOjHliVNhJak8GXHluPTpMpQxt7e63E8NctF0irs39JPd/JiVc/L06P0GUqbHH8AY5
	cz+FkHoLc2rMdqmDDBz50S9+HV8MJcKtLrXbai5+MICr7W/3WyDv3Op69hx8ogSNueqg
	mpzw==
X-Gm-Message-State: AOUpUlGxlXaJfyYvgdqTblWnk7NFukLIVw/S0mPCLFhninlD3MFstiZl
	ak5XxjUHeYOr2DUtfH8VoaE=
X-Received: by 2002:a1c:af0c:: with SMTP id y12-v6mr928395wme.87.1533192687393;
	Wed, 01 Aug 2018 23:51:27 -0700 (PDT)
Received: from localhost ([51.15.41.238]) by smtp.gmail.com with ESMTPSA id
	n17-v6sm741058wmc.13.2018.08.01.23.51.26
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 01 Aug 2018 23:51:26 -0700 (PDT)
Date: Thu, 2 Aug 2018 07:51:25 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20180802065125.GB13481@stefanha-x1.localdomain>
References: <20180725085944.11856-1-stefanha@redhat.com>
	<20180725085944.11856-7-stefanha@redhat.com>
	<CAFEAcA8m2f-DRiDNF0ry4nMH9bzZ1gODV4MTgtLwR5jTNdgeJA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ADZbWkCsHQ7r3kzd"
Content-Disposition: inline
In-Reply-To: <CAFEAcA8m2f-DRiDNF0ry4nMH9bzZ1gODV4MTgtLwR5jTNdgeJA@mail.gmail.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 6/7] loader: Implement .hex
 file loader
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
Cc: Jim Mussared <jim@groklearning.com>,
	Steffen =?iso-8859-1?Q?G=F6rtz?= <mail@steffen-goertz.de>,
	Liviu Ionescu <ilg@livius.net>, Alistair Francis <alistair@alistair23.me>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Steffen Gortz <qemu.ml@steffen-goertz.de>,
	Su Hang <suhang16@mails.ucas.ac.cn>, Joel Stanley <joel@jms.id.au>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Julia Suvorova <jusual@mail.ru>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VBsCFEeTspO8


--ADZbWkCsHQ7r3kzd
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

I'll look into this and let you know what I find.

> Or just get the user to create ELF files or plain binary files,
> both of which we already handle.

Plain binary definitely won't work because the .hex files contain sparse
(discontiguous) data.

But even using ELF would be very inconvenient to users since .hex is
*the* format that micro:bit IDEs and toolchains use.  Our goal is for
less technical users (even kids learning to program) to use QEMU has a
micro:bit simulator, so the ability to directly use .hex files is very
important.

Stefan

--ADZbWkCsHQ7r3kzd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJbYqntAAoJEJykq7OBq3PIdiEH/jy1o2ThFcTcodswmRHfDola
11bsGUd7lpfi1BB02D96OCFpJfG6Jt7GoquvacYExSS2kGs4QLL9RWsTnbP2RHWL
xJ7mG/5gOmLoj+BJSqWwgGtgrbJpK4veViuV+ZN/so9FXEch0fm7eN8TWK3tPU0b
kijUqEKWT7/49Y2/xbu8+CVnZ1J3SxZMr93IjTQffiRBsjqAnybCycfehWbxpH+C
hbcaXulAs1Mwni67eUJybIRwf8TSSmILs5isTeWyR6W3Mg3AGV7UF59xl1aTMSvz
LO99EasIM1tAx8O2QpOvy8UiwbaSyP5FkNhCyFrWSa/TLch35FvA96CWOOkrb7A=
=h5Ss
-----END PGP SIGNATURE-----

--ADZbWkCsHQ7r3kzd--
