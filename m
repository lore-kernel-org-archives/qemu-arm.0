Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1640601wru;
        Wed, 1 Aug 2018 23:54:01 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpf+qL0trahyirgnknL1io7YLYtcDy2dTNTqh8QMop3NYMtijcaj4Dk6uyzyU8MPq8KtgIER
X-Received: by 2002:a0c:e011:: with SMTP id j17-v6mr1446876qvk.0.1533192841450;
        Wed, 01 Aug 2018 23:54:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533192841; cv=none;
        d=google.com; s=arc-20160816;
        b=NWApwBHgb1dUIWkNrMoG/CaH9waBXbFzlyEHjlTwP3yOw45+5Bh3UJsMz340v4/t1V
         67ALN/zKKom/5Ftnv3wHWK6QYmGBPwecfAHjLzanfpzs+YWSNaHuaTKxCi8q2yBP7IJj
         7R1qru4ERzBkFNcFJPJoNjsyDlxmtnjo7nKQ4DCoZ3f/dGBEuA8XwEIeQEvEgWh1Orih
         GFD95bDIUTTCzt+QaNgX7Tuw8KA7794eoqY0QC3ktz8gjjmO0+X+ScWUhT+uz/v5LA7d
         yOaatBH7elc+8KbnXG+Nl+9QYAWwKizfey9Fb1PGKYDF03KBUQ/X9WB8bnkFXeZP3qyt
         zmzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=eSdZHa8dByRQ0vWjE2FTcx3kiVNbcHULx3E/w+PehDU=;
        b=ne0XUYpJugtmqpDqdLLZQF6+E+DgdlKPgwg4Coa94rBU3D2Hfh6FW3sphix95q2PiF
         LRD0Irdg4IBrNBSxfvV0o5lKl362kMpKvEcTLid2Ds6o7ITyaMzopRXbn+kD+k6PDZ6h
         2s6ShPPVX7WDqxNGQjPRPiVtE6gGH9Y95rMbRXrKSuWMdBUcxotG9LPLp/YX2oLS/we9
         swonPratD4MuxO/bM70iCyRaqo3p6NeCiDI4m5qa4oyrra3ju8Z8Fv1GPg+mcIXX3pGo
         kF9OW6PQitikgCKNyR1Ot6CpNEZydu+jIOZb9ih1OehT8PCSeqxVrM+SNh5QHtGGzJvk
         ZfIg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=PLtVC46x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c66-v6si1011427qkb.392.2018.08.01.23.54.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 01 Aug 2018 23:54:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=PLtVC46x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:44293 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fl7Um-00008J-Vd
	for alex.bennee@linaro.org; Thu, 02 Aug 2018 02:54:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48372)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1fl7Ua-00006x-1V
	for qemu-arm@nongnu.org; Thu, 02 Aug 2018 02:53:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1fl7UZ-0005Rw-1Q
	for qemu-arm@nongnu.org; Thu, 02 Aug 2018 02:53:48 -0400
Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241]:35509)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1fl7UU-0005Ow-Cn; Thu, 02 Aug 2018 02:53:42 -0400
Received: by mail-wm0-x241.google.com with SMTP id o18-v6so1209959wmc.0;
	Wed, 01 Aug 2018 23:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=eSdZHa8dByRQ0vWjE2FTcx3kiVNbcHULx3E/w+PehDU=;
	b=PLtVC46xrxx+tFG1XM0W4lfQmsTYc7iArnI3J1eKOXp3eRr5FiTPYuJS345GiNnouz
	/jGPchCwoY5bI9Ai1Kvro626VMx9fBaFRe6CNRbGFAGPxiQ8FWHTYl6p22B+omAX6vlq
	QJVslBrBqchoZOAvXYVBVA4HHkuRqYmNmC0C3XDujmFmm8MrdshnK26ruh8oVuEVtm1g
	LxbLtrGHgpVfvomiR+H5lZH3ji108Wv4puuLUO0z2a4unOjq1Hp3fMGAKHk17WnZhGKq
	WmzGOI6N/FZBQEuQUP7YWr7AlTgHLvb0czy3WSQ6bQOb/OamxhOPyJ2CxNwp1uC4Otzh
	4lpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=eSdZHa8dByRQ0vWjE2FTcx3kiVNbcHULx3E/w+PehDU=;
	b=h+G9TFu2bAxrbf/xDNTN8aM5FSiReAgs7YTsi2SlYnpIoFBVJspOxcyr9PrBMJ1Tow
	kI5sGgs22yeRTAe5Z8enwhRVUc56bIT5y7bNY22NqQ0+aBj1bEG3yg+AeYo6gvI5MCW9
	4yKQ113XmGtjGkkTqb5UKBrBvz2PTQ6w653YVgSfFCGi7/j+gzEw+KAIzktgjpqy0DcH
	qmp6+Z4IsssxWQapGiewWmUdhfCQu3+8o5BU+YuFZzM6QM21JiHvP12/dXAZccQo258e
	8ZZhszfaq1SBJG5mag1s4RL1m1XjbAiQBQVMRk1kXJIIyKV7B1RpELqtWozs/nOplwIV
	PVog==
X-Gm-Message-State: AOUpUlGpjaPAL5xr23pfOvfFh18v3PrdlkRm+8sAaED4osg3KvYOZ8Bl
	3yB98RaCj+pCWBR3coWdbto=
X-Received: by 2002:a1c:6546:: with SMTP id
	z67-v6mr917129wmb.130.1533192821186; 
	Wed, 01 Aug 2018 23:53:41 -0700 (PDT)
Received: from localhost ([51.15.41.238]) by smtp.gmail.com with ESMTPSA id
	i125-v6sm1270637wmd.23.2018.08.01.23.53.39
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 01 Aug 2018 23:53:40 -0700 (PDT)
Date: Thu, 2 Aug 2018 07:53:39 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Su Hang <suhang16@mails.ucas.ac.cn>
Message-ID: <20180802065339.GC13481@stefanha-x1.localdomain>
References: <20180725085944.11856-1-stefanha@redhat.com>
	<20180725085944.11856-8-stefanha@redhat.com>
	<0c2c23f3-5ec9-5446-17ca-683d267d0f4c@amsat.org>
	<6c1020b8.17461.164de2dc109.Coremail.suhang16@mails.ucas.ac.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YD3LsXFS42OYHhNZ"
Content-Disposition: inline
In-Reply-To: <6c1020b8.17461.164de2dc109.Coremail.suhang16@mails.ucas.ac.cn>
User-Agent: Mutt/1.10.0 (2018-05-17)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 7/7] Add QTest testcase for
 the Intel Hexadecimal
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
Cc: peter.maydell@linaro.org, jim@groklearning.com, mail@steffen-goertz.de,
	ilg@livius.net, alistair@alistair23.me,
	philippe =?iso-8859-1?Q?mathieu-daud=E9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu.ml@steffen-goertz.de,
	qemu-arm@nongnu.org, joel@jms.id.au, stefanha@redhat.com,
	sundeep.lkml@gmail.com, jusual@mail.ru
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 28GHQ2Hq1iS7


--YD3LsXFS42OYHhNZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 28, 2018 at 07:58:17AM +0800, Su Hang wrote:
> > > +#define BIN_SIZE 146
> > > +
> > > +static unsigned char pre_store[BIN_SIZE] =3D {
> > > +    4,   208, 159, 229, 22,  0,   0,   235, 254, 255, 255, 234, 152,=
 16,  1,
> > > +    0,   4,   176, 45,  229, 0,   176, 141, 226, 12,  208, 77,  226,=
 8,   0,
> > > +    11,  229, 6,   0,   0,   234, 8,   48,  27,  229, 0,   32,  211,=
 229, 44,
> > > +    48,  159, 229, 0,   32,  131, 229, 8,   48,  27,  229, 1,   48, =
 131, 226,
> > > +    8,   48,  11,  229, 8,   48,  27,  229, 0,   48,  211, 229, 0,  =
 0,   83,
> > > +    227, 244, 255, 255, 26,  0,   0,   160, 225, 0,   208, 139, 226,=
 4,   176,
> > > +    157, 228, 30,  255, 47,  225, 0,   16,  31,  16,  0,   72,  45, =
 233, 4,
> > > +    176, 141, 226, 8,   0,   159, 229, 230, 255, 255, 235, 0,   0,  =
 160, 225,
> > > +    0,   136, 189, 232, 132, 0,   1,   0,   0,   16,  31,  16,  72, =
 101, 108,
> > > +    108, 111, 32,  119, 111, 114, 108, 100, 33,  10,  0};
> >=20
> > Can this be:
> >=20
> >   0x04, 0xd0, 0x9f, 0xe5,   0x16, 0x00, 0x00, 0xeb,   0xfe, 0xff, 0xff,
> > 0xea,
> >   0x98, 0x10, 0x01, 0x00,   0x04, 0xb0, 0x2d, 0xe5,   0x00, 0xb0, 0x8d,
> > 0xe2,
> >   0x0c, 0xd0, 0x4d, 0xe2,   0x08, 0x00, 0x0b, 0xe5,   0x06, 0x00, 0x00,
> > 0xea,
> >   0x08, 0x30, 0x1b, 0xe5,   0x00, 0x20, 0xd3, 0xe5,   0x2c, 0x30, 0x9f,
> > 0xe5,
> >   0x00, 0x20, 0x83, 0xe5,   0x08, 0x30, 0x1b, 0xe5,   0x01, 0x30, 0x83,
> > 0xe2,
> >   0x08, 0x30, 0x0b, 0xe5,   0x08, 0x30, 0x1b, 0xe5,   0x00, 0x30, 0xd3,
> > 0xe5,
> >   0x00, 0x00, 0x53, 0xe3,   0xf4, 0xff, 0xff, 0x1a,   0x00, 0x00, 0xa0,
> > 0xe1,
> >   0x00, 0xd0, 0x8b, 0xe2,   0x04, 0xb0, 0x9d, 0xe4,   0x1e, 0xff, 0x2f,
> > 0xe1,
> >   0x00, 0x10, 0x1f, 0x10,   0x00, 0x48, 0x2d, 0xe9,   0x04, 0xb0, 0x8d,
> > 0xe2,
> >   0x08, 0x00, 0x9f, 0xe5,   0xe6, 0xff, 0xff, 0xeb,   0x00, 0x00, 0xa0,
> > 0xe1,
> >   0x00, 0x88, 0xbd, 0xe8,   0x84, 0x00, 0x01, 0x00,   0x00, 0x10, 0x1f,
> > 0x10,
> >   'H',  'e',  'l',  'l',    'o',  ' ',  'w',  'o',    'r',  'l',  'd', =
 '!',
> >   '\n', '\0'
> > };
> >=20
> > ?
>=20
> Yes, good suggestion. Your version is clearer and more readable for human=
s.

Okay, I will make the change in v4.

Stefan

--YD3LsXFS42OYHhNZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJbYqpzAAoJEJykq7OBq3PIucsH/i/6nbBSxRUzHrEqowxUtaIC
SILGnmKDnPlxA26G427khVm8q7YFM3A5C3NZfaw79c8Atf3PlPIpTNUeBT0LlwkE
sldce5/f0wJK6nsH7W8jfozuqWIX5e0PTj01TgD76Qmf12j7e5OCsQ+4fGIwSdml
HQz3/dr714sv5fKP2hUoCEcMFY3A+YywUFuXLkIlF3/D6XnQ4qwD6sryVEdPZtdD
XQBpjwNK0+bzR/nBHtVpAmKh/O6SzSbIb62B7bJgsvvOEu4RgmPbhh6oakuPsGaj
kML5dLwbMBLenUSjWIMgsdGVtmXZWSyH6ChFpl9Xu8Ye3zBiQiiEtqRILouAj4M=
=npAU
-----END PGP SIGNATURE-----

--YD3LsXFS42OYHhNZ--
