Received: by 10.28.71.27 with SMTP id u27csp4160644wma;
        Tue, 23 Jan 2018 07:12:04 -0800 (PST)
X-Google-Smtp-Source: AH8x226aJde4LWBn0fK5RL98gZTyjvKmruiAbHu7fJjU/YiCt/kYjzwJVp+t7CX+zakkkcBZlECD
X-Received: by 10.129.145.20 with SMTP id i20mr2678097ywg.258.1516720324057;
        Tue, 23 Jan 2018 07:12:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516720324; cv=none;
        d=google.com; s=arc-20160816;
        b=EMjoJNZurbFxLc5qLQDBAWmGHCwVTRvzilFbEwfl2C0Z38kNP71UaiKJX0IXlRnUE5
         ywdGDOWAzmnqkM0j0fScq6Yawj4acBPxWvdjW4r829y7DrQtwhmwbp02xnqXQvUfP1rq
         cpaiE1gGIBVZG+ZId2XuLYNwDhhntzfASSot2SGQKUtNsLewbVPFusgbbjL+3vJDYDSk
         ZJzisc7G6C8OwfZ7F88WT52I5UfumUvnejEAOh4fuKL5GTGL/6FudTuMZZyj79pBQ+pC
         HG56av3ZwnHk2DTjXUIuEDHlluV3pklvETOs7y295eMmWn0Q71gn+Rf4PGKS2j5dNHFw
         Lr7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=QaNLOgxhIDhxfcEswqhrdmR3nRGwaQ4NdiMLCKy0aO0=;
        b=WGEKDj6wNbOlzj+8X7EByP9sKdXGxsMziHSZFrPxaGlIWIsiEJw9RJsvOVqV63bLvF
         rF/qjfA+Hou36DEEVZPe8TlRzA/cva/kImVJYHOet9rfjvKhcwR1IbbnFXFFIXfQydAb
         bLT0wYc3QHP8zI3XV3YTsOQcXna7Rf9Hl7qsXH2ENkH/efP1Bx3iETe20EM/SsfoBIFA
         ZGhOGYNpNfjiZIh66u054fq03jpFDdOXpoyrMIwuEW5uluWTdg0c8Hc2452PzrnrF2Oa
         G86XkeA/1+tMcb2CvPqq1MwsHvQcn2aicPPkyHON1FmGRigri5RCD/4HaFlTKanH/hu2
         YDTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d129si2119664ywf.154.2018.01.23.07.12.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Jan 2018 07:12:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34733 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ee0F1-0007yC-HH
	for alex.bennee@linaro.org; Tue, 23 Jan 2018 10:12:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53831)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1ee0E8-0007a9-B8
	for qemu-arm@nongnu.org; Tue, 23 Jan 2018 10:11:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1ee0E5-0006S5-4f
	for qemu-arm@nongnu.org; Tue, 23 Jan 2018 10:11:08 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:60842)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>) id 1ee0E4-0006RQ-Py
	for qemu-arm@nongnu.org; Tue, 23 Jan 2018 10:11:05 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue103 [212.227.15.183]) with ESMTPSA (Nemesis) id
	0Lurx3-1emdC00yC9-0102P5; Tue, 23 Jan 2018 16:11:01 +0100
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	=?UTF-8?Q?Guido_G=c3=bcnther?= <agx@sigxcpu.org>, qemu-arm@nongnu.org, 
	Peter Maydell <peter.maydell@linaro.org>
References: <20180123120541.GA14216@bogon.m.sigxcpu.org>
	<2dcba347-3e1c-01bb-32c6-b5b243002c52@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <6df0d07c-55fd-3ed4-cc07-440bde0407fa@vivier.eu>
Date: Tue, 23 Jan 2018 16:10:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <2dcba347-3e1c-01bb-32c6-b5b243002c52@amsat.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="Wa6FHifxjYuwInoX5YNnYEMyEtWslf1uW"
X-Provags-ID: V03:K0:Cm1AV7QC7xCrjRVoPtm3LnvGu1zwFJPg3wNWc0KBrwy5CpGpGvR
	kNZF4C5ZnoQVRJs7B6k496sb6A769Oae4UAGacn9kyTY/KYy9lyeFTYkN8Wpwjwx3BwAxQY
	INaVAabBENxAcYdyvPAnwr9xRntJemuJPvGjwDWUATl+fjHeUeFaVWXuQDSUk/87tPzF6RL
	xSH/TAdA6nlEtIwurMgxg==
X-UI-Out-Filterresults: notjunk:1;V01:K0:Ab2IzKYHI/o=:azRVKx9ShjsQcemwYdBq9p
	W//nuXQ8ofHoOb56V04V9CnANsutxp75gJGhTwzVUkyea21oPrPgsHDwvrQJ7JracbNsYX3IV
	gNdYdsYjbNX02C6kT1Ca+xLdXLs1i4643B3Xo3DKZvP7PGCV4bHwm7Qkzy35T2NfXyE4f1K0H
	2zURd1sWPYCurIXWjNVELG7J/RAXamvyfoUqVlzGYjj/lqE8wlOwQGEQFSvq7g2oBskVjznYs
	XGXYGp8knb00Gdh0xDCY+KYTTsDN3d/U51DZQ7DQKumbRqEC0X/Iu3xGFqesoG4UszlV+qi7o
	Uk2F9v4QU2l7OH33kug1Kjno9pRZYuzmo/UFDOR7Fg+Q42MzlKlWE4U4bkaXv2gMPiY16Gvkm
	qG/vmSA0nZT9+qUjMewK3CRvyyrySfYXecoSMVlhxEWmhTjid+Yu0I6saLvYG2RKkNWoa1IvK
	RMt0WWEO6PhFYKO1ZGhfAHIz2UKUBoP0OYouTQJ9q89dQUxfSR4xyvU+zH4+Nc9BRR0DAeODE
	uQQyD3u8+hQ+7P6Hr3QXXCyTzW6tA5hYTRlcgUmWNZi3vkH8oVUXsW53e8o/vmIXxMJEpghRp
	0/kdh2D4RimDdmpKrsIZTWfevzkTwm59J+oB5WG/ewdC7T12UJmPfpI4umvZ3eVy1yniBE5Tf
	5iti1vi8QSIRcfIMknMSRgAzYvKid5J3KzaLqGuxNnkyXDhc/eRdZRnPcZxmc5K7t1dPbM4CL
	NmWgfJnQeniMlqdtgBcHAt07RpDLboL1FNCNKw==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 217.72.192.75
Subject: Re: [Qemu-arm] recvfrom error with linux-user emulating armhf on
 aarch64
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: y0tJNwJoRvur

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Wa6FHifxjYuwInoX5YNnYEMyEtWslf1uW
Content-Type: multipart/mixed; boundary="OUyAQJH5m6QBpGxJH1TggmIWfvRNqSsot";
 protected-headers="v1"
From: Laurent Vivier <laurent@vivier.eu>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 =?UTF-8?Q?Guido_G=c3=bcnther?= <agx@sigxcpu.org>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Message-ID: <6df0d07c-55fd-3ed4-cc07-440bde0407fa@vivier.eu>
Subject: Re: [Qemu-arm] recvfrom error with linux-user emulating armhf on
 aarch64
References: <20180123120541.GA14216@bogon.m.sigxcpu.org>
 <2dcba347-3e1c-01bb-32c6-b5b243002c52@amsat.org>
In-Reply-To: <2dcba347-3e1c-01bb-32c6-b5b243002c52@amsat.org>

--OUyAQJH5m6QBpGxJH1TggmIWfvRNqSsot
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Le 23/01/2018 =C3=A0 15:42, Philippe Mathieu-Daud=C3=A9 a =C3=A9crit=C2=A0=
:
=2E..
> Laurent, in do_syscall() should we swap the pid back?
>=20
> @@ -10628,4 +10628,5 @@ abi_long do_syscall(...
>          target_header->version =3D tswap32(header.version);
> +        target_header->pid =3D tswap32(header.pid);
>          unlock_user_struct(target_header, arg1, 1);
>=20

The kernel doesn't change it, so we don't need to update it.

(CC: Peter as he wrote the capget/capset code)

Thanks,
Laurent


--OUyAQJH5m6QBpGxJH1TggmIWfvRNqSsot--

--Wa6FHifxjYuwInoX5YNnYEMyEtWslf1uW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEzS913cjjpNwuT1Fz8ww4vT8vvjwFAlpnUIMACgkQ8ww4vT8v
vjx2rw/7Byi19XoNihtg3tb0nQwc+K1Ufr/5gbL0PPv1sYycrRVq7WZmXmP7O2yE
EK0/QFPy9d65MvjAgG0uve8VwpT0RH+RFFLHziz8EdBc18uLzLHfVQAZwA27Vvty
yUqurGZHY0Iaikx5fjk4WPPJM7eVbFXHEJ8K/OZ13pTU5qJLMGKAfr+XPDYkPXBY
fV4MOt0JE1S9TlJPiwwJskbigu+raSxkFQI4+zTtmbnEb/MzxvGF+j4la9zbXLjL
nQnaIW6YZmbERlQ6NIeL0M35P5NHq4XMOKVfmU0MhBwP6ZWQRc75PBz5J6bwtWqm
/y1oK9DEuNSMm7V+QJWqnhO/N+BWhKdrvrczriGyw+WQksgDoDXSOEvgatj6pdNf
V/U4z8AL4odSHJNV8WRR6q/ffd/jtwG2I3W8FIT1KGwcf43pm35Wg6ShA/ZimW7a
qI4WQ2mxQWu+st5yK5BQPHAY0WzQbySZzdqIaZwWk3pQ+jvzT5iLNV7ZbaBbgbra
LHtTrEWDDqjoFZG7No4gMp02UvmQjWc8uL05L0ycm3mjtfHj/y3+Mx2jzN7NlG2o
tYpg9OKTFtz521jIpILfEKn/Mlplv6Zy3iN869Gzey/V7vQKiI/qIlsNH35hAQmo
bJAo77MUsXu7sJw7gvSwEFdvfbQCCwvQEUVxYvMBxnbbvo7zsq0=
=IZqs
-----END PGP SIGNATURE-----

--Wa6FHifxjYuwInoX5YNnYEMyEtWslf1uW--
