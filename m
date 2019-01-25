Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp476023wrt;
        Fri, 25 Jan 2019 08:00:35 -0800 (PST)
X-Google-Smtp-Source: ALg8bN42ImZG3zZCZFmRHnKMbOugCduRRo5idXz1uDBxeDovJ3Np/BS87Qg5xyadjPJIfzF1STO8
X-Received: by 2002:adf:e54a:: with SMTP id z10mr11782543wrm.238.1548432035910;
        Fri, 25 Jan 2019 08:00:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548432035; cv=none;
        d=google.com; s=arc-20160816;
        b=nHI7YmgmSXzVWol9MG1c3PdthIOyswf/DwQKqD9mVqefjSq8Smmvkg24HvFsh6UFK0
         p1HnSUkYtdR2cAE6GQsZ2hFND/B5Et85NA1R+LNvaxl3NPgcrMeoFJYL+atVIwlNV/oe
         2l0YaHTbbMIjilS6yKMPsIXN/7f0NzBSjUy6MQTUEy12uXhHQ8UhiWoaXht9BU9AHZBa
         RK+yYR7C5C6fCOhZ0cKTvYPLBXg0cWQm+DmScdq8Dkg+8nDFBLHRVvnwIe71QgWS/b+k
         YivBex2b36wwXRsclqr7o8akF2jiYlJqxCqqYy6wVl0mBn0m3dS/5ROgdgJ3hjX9TYSx
         7xtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :mime-version:user-agent:date:message-id:openpgp:from:references:to;
        bh=UR7X0sAfcZeMtOvjwvTVDM87FH1E2x1bTkDXA1L7Sn0=;
        b=bukr2cu2nodwv7po7NqZYK9AHqoupoRX8ljThJsoi419Ta/WoA1BCNiD1ov4smWhA/
         fgHmOmwqjoOTmaiGRmWwPTS0MDb5sQ71hQVSWuaGnu1FptBPoFMNm2m2k8WX5E9hV9aJ
         JLhFDgvVrwzGymQJzMWwxS0l4J/2pTwqBGVpj79uVOUJcO+jLtnr5tzOSgLbVDHZCUPT
         mO1YiWjk9esBpoQzqCyzuble9CC7Hffv6pMx91cqhtM7GsmSJpW0E613p8fDxyHVO1Hb
         NZz3ln+eiDQAb78E+uBfqMKTQoDVf0EQR34XVmJ/iUC1RB5oK6JFgK9fv/EfIM6RSZq6
         eURA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v10si75853974wro.316.2019.01.25.08.00.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 25 Jan 2019 08:00:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:46635 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gn3uE-0001rX-TL
	for alex.bennee@linaro.org; Fri, 25 Jan 2019 11:00:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46876)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gn3u1-0001pI-I1
	for qemu-arm@nongnu.org; Fri, 25 Jan 2019 11:00:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gn3tx-0000b6-18
	for qemu-arm@nongnu.org; Fri, 25 Jan 2019 11:00:19 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:40237)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gn3tu-0000V6-Pm
	for qemu-arm@nongnu.org; Fri, 25 Jan 2019 11:00:16 -0500
Received: by mail-wr1-f65.google.com with SMTP id p4so10841110wrt.7
	for <qemu-arm@nongnu.org>; Fri, 25 Jan 2019 08:00:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to;
	bh=UR7X0sAfcZeMtOvjwvTVDM87FH1E2x1bTkDXA1L7Sn0=;
	b=GByD2AmCRFsuz+yo7WKeRFvfGLPVChRC9K5dqvEvwj7dN0Fh/Hw3qRj8HF3csJ2TUP
	v771FnnYlAW+M0RwEf8JE2YSSAxm6BzSm32MH/DoDNGcU+sw7tAa5zl4wWChRUs0zIDK
	M5STfYuZDQhPVJqkbgs84I0bkksjiBlVKG2eFNirlxL2iCmFDgxfva7efzEExdBVBYUb
	fyHX+2wX3h5kddWMHUsbhJMPJkpr9PM/GGhgqRz/exr9j/53nAC/w2Uwu7ZLkyzGGJC1
	ycbMVW0All8WCbXj7Zjtcl2C6aTnC322PdCktoRSFqrRLoKCHkv8PfrLQ+KPelKJNujY
	uGoQ==
X-Gm-Message-State: AJcUukfUaKirK54aBx/aiZPpBw927HiD+vOegs88Ybwt1Y+jfB6hI2rO
	fS2ei9bQL6assyCCVE8ho0Og+Q==
X-Received: by 2002:adf:e983:: with SMTP id h3mr11632373wrm.232.1548432009686; 
	Fri, 25 Jan 2019 08:00:09 -0800 (PST)
Received: from [192.168.1.39] (110.red-83-51-161.dynamicip.rima-tde.net.
	[83.51.161.110]) by smtp.gmail.com with ESMTPSA id
	y13sm88678771wrn.73.2019.01.25.08.00.08
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Jan 2019 08:00:08 -0800 (PST)
To: Stefan Hajnoczi <stefanha@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
References: <20190123212234.32068-1-stefanha@redhat.com>
	<20190123212234.32068-3-stefanha@redhat.com>
	<f58f9085-c895-1fa5-9fae-afe4ac8de39a@redhat.com>
	<20190125102842.GB28305@stefanha-x1.localdomain>
	<CAFEAcA-Dy0B-qCdojx9j49vF_p7OcAyQAiXYMv-_EZq7CCgT1A@mail.gmail.com>
	<20190125153714.GB305@stefanha-x1.localdomain>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <7261eadc-367a-cb1a-be0d-fb16a3ac9822@redhat.com>
Date: Fri, 25 Jan 2019 17:00:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190125153714.GB305@stefanha-x1.localdomain>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="C4RbCEKSiWTwT1ZtfmsdU7tudqXriDKp2"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.65
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 2/5] pflash: flush rom device
 memory region
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
Cc: Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
	Thomas Huth <thuth@redhat.com>, Julia Suvorova <jusual@mail.ru>,
	Qemu-block <qemu-block@nongnu.org>, Stefan Hajnoczi <stefanha@gmail.com>,
	=?UTF-8?Q?Steffen_G=c3=b6rtz?= <contrib@steffen-goertz.de>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Max Reitz <mreitz@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	Joel Stanley <joel@jms.id.au>, Paolo Bonzini <pbonzini@redhat.com>,
	Jim Mussared <jim@groklearning.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OpImMzbLdEWI

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--C4RbCEKSiWTwT1ZtfmsdU7tudqXriDKp2
Content-Type: multipart/mixed; boundary="HmI8BrNpYwwoJvc01Wh5PBLLZZ4YKA7Zj";
 protected-headers="v1"
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Stefan Hajnoczi <stefanha@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier
 <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>,
 Peter Crosthwaite <crosthwaite.peter@gmail.com>,
 =?UTF-8?Q?Steffen_G=c3=b6rtz?= <contrib@steffen-goertz.de>,
 Jim Mussared <jim@groklearning.com>, Max Reitz <mreitz@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Julia Suvorova <jusual@mail.ru>, Richard Henderson <rth@twiddle.net>
Message-ID: <7261eadc-367a-cb1a-be0d-fb16a3ac9822@redhat.com>
Subject: Re: [Qemu-devel] [PATCH v2 2/5] pflash: flush rom device memory
 region
References: <20190123212234.32068-1-stefanha@redhat.com>
 <20190123212234.32068-3-stefanha@redhat.com>
 <f58f9085-c895-1fa5-9fae-afe4ac8de39a@redhat.com>
 <20190125102842.GB28305@stefanha-x1.localdomain>
 <CAFEAcA-Dy0B-qCdojx9j49vF_p7OcAyQAiXYMv-_EZq7CCgT1A@mail.gmail.com>
 <20190125153714.GB305@stefanha-x1.localdomain>
In-Reply-To: <20190125153714.GB305@stefanha-x1.localdomain>

--HmI8BrNpYwwoJvc01Wh5PBLLZZ4YKA7Zj
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 1/25/19 4:37 PM, Stefan Hajnoczi wrote:
> On Fri, Jan 25, 2019 at 10:36:17AM +0000, Peter Maydell wrote:
>> On Fri, 25 Jan 2019 at 10:28, Stefan Hajnoczi <stefanha@gmail.com> wro=
te:
>>>
>>> On Thu, Jan 24, 2019 at 12:11:55PM +0100, Philippe Mathieu-Daud=E9 wr=
ote:
>>>> The device realize() is also executed before the guest is started, i=
s
>>>> this call really necessary?
>>>
>>> My rationale was that machine init only happens before the guest is
>>> started while ->realize() is called by hotplug too.
>>
>> Yes, but before realize the flash memory can't actually be
>> visible to the guest, so there's no need to invalidate anything.
>>
>>> That said, can pflash devices be hotplugged?
>>
>> I guess you could have one inside a hotplugged device in theory;
>> they can't be directly hotpluggged. (I bet that in practice
>> there are leaks though if you did do that, and we don't have
>> any devices that do so today.)

Can we assume pflash aren't hotpluggable until someone find an use case
and is willing to work on it? I can't find any practical example.

>>> If you guys prefer not flushing from pflash ->realize() then I'll dro=
p
>>> it.
>>
>> I think it makes more sense not to do a flush in the realize method.
>=20
> Okay, I'll resend this patch.

Thanks!

Phil.


--HmI8BrNpYwwoJvc01Wh5PBLLZZ4YKA7Zj--

--C4RbCEKSiWTwT1ZtfmsdU7tudqXriDKp2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEicHnj2Ae6GyGdJXLoqP9bt6twN4FAlxLMocACgkQoqP9bt6t
wN4DCg/9Gg8/LJuARsnzUyQLIbqV4TZPQN5IiwBUh71hOeuYtsB/SNUXU0wE2nSM
w30agRvsT62mdc+0sLZiHA+ve/8Iq5VedlLTlk+VU0H2ed7EkKF8W2ovfQC/wbEF
AWfCewELiQCzOxefYLASlwzTInRk1AxhNwz2/I3iVTR8qbRvaFM6+96SZuD0igpr
pkuF3rshM6L2UORVHhMyh8kwZZLaU7nNJV3Bb/s5/Y+zRUmFcB2bfDRakUSeu/EX
uussqgi6h0eESWFOJ45s1g6yclxDDQzcYGlIE5VSXvfG9DXcKrWstvetey3aHJ4p
8Q6/WRtjjHrHunUiWqEsMu/LqiJC7Gz6qvvaFrhQGQk1jcTdU15hQXoeiOg9dy2K
Cg6AqFL9jT6vaoCODYLhf7jh2jSigGbMq8NCvjNU4dxWYuUdc8h0ptooe80gCmA+
Yo8nBjht9EaVpluzvWhAC/MKkvaixInaKxPJV7Z7ruOf7ADuYNTALZ9xvB+AJQVA
WnWYiMSG5Etk1T7SJjPbYOfaTpz0KijuC1bCL260dDmwfblQCvlvP/rsRC/IkyLd
8CZkWIKfm6ZZR8dnANi57f9VCLc/8RjWEHfIdsANb1+n0gcNGoKHgr6k/4tvsjsE
qxCCpa042UwYVl+788M2S2jyFrvPwnNn15YXJed0fvjST0Wf/kk=
=qxBW
-----END PGP SIGNATURE-----

--C4RbCEKSiWTwT1ZtfmsdU7tudqXriDKp2--
