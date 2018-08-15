Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp739026wru;
        Wed, 15 Aug 2018 07:18:49 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPxokJf+CVs1YnFvAFB7JjLT9SiKxRHcCRDfRa5z70kTzzdbkA0HxyVB7T0mX+JpSgSqLtgy
X-Received: by 2002:ac8:7254:: with SMTP id l20-v6mr25553645qtp.108.1534342729107;
        Wed, 15 Aug 2018 07:18:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534342729; cv=none;
        d=google.com; s=arc-20160816;
        b=VC5+gU0jNutOxXJTmnUhIHspThxj6ZyoLOaFH+ENBkm6IL9Q2TUSznfSjFuic7ymQB
         fVHT8nxfMOh4AONFWN9hNK4JVWlX07yWE/4XLcR1n/tMvA6mrJRtx3f3EWDNM/KbVP63
         u8OpcAvYC2Ex/ZyEqp9AhRwTEQdF/dIf1uhVl6n/vVRuBz+i8z+cfprCggS8TuM0K5iJ
         PcONUtp7UeCT6sfUpyOHKblXdkzTQpgTM4CwXcRf13Azxkg176GyIONvjpyRdjKltHVp
         j1hN+36oIkPwV3tIYSLtB6CFiLpX82pCONiAayRS+LyrabTUfBcmtpFJFag2WPzDoyQh
         OXog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:openpgp:from
         :references:to:dkim-signature:arc-authentication-results;
        bh=jIV8TwOzNBF9j9m15pgjiwkg4raU5zjDSEiZzTfI33g=;
        b=BVLXSio3yV1+oa6tVV4qUZnd92v2OH0jxhv400wighwFs5iVw8fuk/10n67yi4xeo8
         8k23QKXvcCaIr+mvJ19z6dC0wbINGl3RJltvufMZeDlkdluRiUZbJEeNy9tBq2uWog8F
         CBnT5Xjvf2OVShceP7b4uxYDpJ5UQ82fgKh9MNUfnMbPE+Qof3q4YCV5IWf6M2yguIQf
         Kn8GCBhLlQ3VYMJBDdp0LZtO5ZOkjIXDyYkcviwXRGnBLxQdmkTuURjzDnY+Tin1/jlh
         VHqge7YmgAFknCXEvVb6yJB7LaGLQYmcgF7U5iLQnSza46AKKrj2CCPro64LG28xbidx
         cj1A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=PXSKt9Nh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l5-v6si1947268qvo.196.2018.08.15.07.18.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 15 Aug 2018 07:18:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=PXSKt9Nh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:49838 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fpwdM-0004Bf-DP
	for alex.bennee@linaro.org; Wed, 15 Aug 2018 10:18:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39070)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fpwdE-0004BW-RP
	for qemu-arm@nongnu.org; Wed, 15 Aug 2018 10:18:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fpwdB-0006bQ-Kc
	for qemu-arm@nongnu.org; Wed, 15 Aug 2018 10:18:40 -0400
Received: from mail-ua1-x944.google.com ([2607:f8b0:4864:20::944]:46854)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fpwdB-0006al-B5; Wed, 15 Aug 2018 10:18:37 -0400
Received: by mail-ua1-x944.google.com with SMTP id u11-v6so1355313uan.13;
	Wed, 15 Aug 2018 07:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to;
	bh=jIV8TwOzNBF9j9m15pgjiwkg4raU5zjDSEiZzTfI33g=;
	b=PXSKt9NhfyEnxQePQFEYDBJpmNE1qe+0GKfNGiufwy5YlVcZ/HtjTKVDYzZGZhnLc+
	0EjHFU8PfUmUcHe0htgBTYvfss1ZGEAc1W9yg93vbDUEQuRCk3vjg8c7JLU1O4T2d9MR
	SInGltDpQRTtPYqiylnOsV3S39R33oZHyO0D6R4WOo9mIE+zIez/ZGLMhBZRt2zE/3rI
	L4raaqvJpA+jZ7RFDrmzZ72KyVWcf0ZSfx/7w5h0DKnMvD7Q7fpJJCf6yHxl+aY15ExC
	Oon1uPxueLW8nP/66Pv+91qmmDb8e/msfe4DNraEAPYNtaykdIQA0lUaE/S7fIqREmAB
	UxpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to;
	bh=jIV8TwOzNBF9j9m15pgjiwkg4raU5zjDSEiZzTfI33g=;
	b=iBaWxaOEG2RgKXR4q8L7foofmPGqIJri3DZo1nGE1o9U2KpFrwPNmw9ce8Qp02s1GH
	T8em4MXG9RDyqANiJghJi+Y0LnnbSVN0yI6u1uMnpE8f8NxteL/THWvFWm8qYK6nohEe
	rdnktrFAMayHsVhF7qGBrSpSNTqVcrM68bt2+34OXSZadRZKD6D3a7XXubjerXaV7mjO
	lmDnDgbmGD2KDUHIxEELIDeLbmxBJE0NVvMbtShISqHRkgYNWBifwi9e37SoTYFkw4u7
	PvUsjHkwYlhtVIWO8VvjEpgzf3Vk95N/mfIizDFu8rrBOyqRZ1u02O4TWbr/O0iHnUjt
	6XeA==
X-Gm-Message-State: AOUpUlGkQZIirMtsfflIKwOvIIaaoPNBbpMma4U69pu1rY/0Z/ZThVK4
	D06cWL9qToZupVb4Pm2vSGQ=
X-Received: by 2002:a9f:2266:: with SMTP id
	93-v6mr16928696uad.40.1534342716214; 
	Wed, 15 Aug 2018 07:18:36 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	y1-v6sm3577460uap.14.2018.08.15.07.18.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 Aug 2018 07:18:35 -0700 (PDT)
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <20180803144721.17036-1-stefanha@redhat.com>
	<20180803144721.17036-6-stefanha@redhat.com>
	<1a84a9fc-93f8-3573-c27e-bb60d9c48a7a@amsat.org>
	<20180813155622.GA18429@stefanha-x1.localdomain>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Autocrypt: addr=f4bug@amsat.org; prefer-encrypt=mutual; keydata=
	mQINBDU8rLoBEADb5b5dyglKgWF9uDbIjFXU4gDtcwiga9wJ/wX6xdhBqU8tlQ4BroH7AeRl
	u4zXP0QnBDAG7EetxlQzcfYbPmxFISWjckDBFvDbFsojrZmwF2/LkFSzlvKiN5KLghzzJhLO
	HhjGlF8deEZz/d/G8qzO9mIw8GIBS8uuWh6SIcG/qq7+y+2+aifaj92EdwU79apZepT/U3vN
	YrfcAuo1Ycy7/u0hJ7rlaFUn2Fu5KIgV2O++hHYtCCQfdPBg/+ujTL+U+sCDawCyq+9M5+LJ
	ojCzP9rViLZDd/gS6jX8T48hhidtbtsFRj/e9QpdZgDZfowRMVsRx+TB9yzjFdMO0YaYybXp
	dg/wCUepX5xmDBrle6cZ8VEe00+UQCAU1TY5Hs7QFfBbjgR3k9pgJzVXNUKcJ9DYQP0OBH9P
	ZbZvM0Ut2Bk6bLBO5iCVDOco0alrPkX7iJul2QWBy3Iy9j02GnA5jZ1Xtjr9kpCqQT+sRXso
	Vpm5TPGWaWljIeLWy/qL8drX1eyJzwTB3A36Ck4r3YmjMjfmvltSZB1uAdo1elHTlFEULpU/
	HiwvvqXQ9koB15U154VCuguvx/Qnboz8GFb9Uw8VyawzVxYVNME7xw7CQF8FYxzj6eI7rBf2
	Dj/II6wxWPgDEy3oUzuNOxTB7sT3b/Ym76yOJzWX5BylXQIJ5wARAQABtDFQaGlsaXBwZSBN
	YXRoaWV1LURhdWTDqSAoRjRCVUcpIDxmNGJ1Z0BhbXNhdC5vcmc+iQI+BBMBAgAoBQI3aGSw
	AhsPBQkmUJgABgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRDj4yws3q3A3nS+EACxKosO
	3DZdwdVPXLVvSAA5y3Ohr2ByWN06RlVEkKWkOxm0lQ96LxBOZ03mDC+He/36DHaP+fujPBTz
	XjTXygWWZUtk0flDWR1w0a4yhX/JHfL5yloMZrxifCwouf2Sv9Yd6D46pzMeGsq8aCvbZYSf
	lDi3KXsVHc+jbmRwxtzJxz7366dsTC1tOJmjVSxc8bE55pHnPFOT1KKM9fxGWZFYx0UqAL/1
	NkrOKP5eXdJ51EhQa5pjivJw6dQlfWMQURG4o4e2+aLe4TkS2FI0r6nTgmoDmTT74u35NzZW
	Q3xjqcfqUX52+0drwlta22guNDbcJ4J+/I6FBF1C7CoSysBiIrldZQ6cJZ19st3jb7NHAoNk
	DcUt5I3gt4EpaiijWEEYAhw1/NSagm9bfn9veBqzVHNQrz76NZMiy2kP2vAxKOvo1XVlcEl0
	8MQ+IAUvYcLvU6yHRB4da7ts+ufqriNI5WBpvoLPRRa0wFDTj0nX/CfWFX9UkTwHA6/SWlhE
	hHau4xrpzFENwF5UDFtMkleo/u5Ipv7q8wYNs5JBpSXGmm4oSV9BbW0gp28D8fY4GGv1+6Dz
	BNDeuIdPf2NX0X55uyphpB0J4d70uNszAWXr7VqGOBbGrHcNHeT62BvoRd8bUQhaEyiJwOyC
	Ny4YIWW+I8W2wXkW+vSrZfEro2GZjQ==
Message-ID: <ba150247-7c07-b7fd-f1e8-0c07b5358999@amsat.org>
Date: Wed, 15 Aug 2018 11:18:25 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180813155622.GA18429@stefanha-x1.localdomain>
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="UuDcRjS7Zez0TYfEyWAZkHWkYt74ftEMM"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::944
Subject: Re: [Qemu-arm] [PATCH v4 5/6] loader: Implement .hex file loader
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
Cc: Peter Maydell <peter.maydell@linaro.org>, jim@groklearning.com,
	mail@steffen-goertz.de, ilg@livius.net,
	Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Steffen Gortz <qemu.ml@steffen-goertz.de>,
	Su Hang <suhang16@mails.ucas.ac.cn>,
	Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org, jusual@mail.ru
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KVz8kjUjqnVE

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--UuDcRjS7Zez0TYfEyWAZkHWkYt74ftEMM
Content-Type: multipart/mixed; boundary="c9gVQQOtawoQU0Oo0fMPpXbMhyNfx23bZ";
 protected-headers="v1"
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Su Hang <suhang16@mails.ucas.ac.cn>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, jim@groklearning.com,
 mail@steffen-goertz.de, ilg@livius.net,
 Alistair Francis <alistair@alistair23.me>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Steffen Gortz <qemu.ml@steffen-goertz.de>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, jusual@mail.ru
Message-ID: <ba150247-7c07-b7fd-f1e8-0c07b5358999@amsat.org>
Subject: Re: [Qemu-arm] [PATCH v4 5/6] loader: Implement .hex file loader
References: <20180803144721.17036-1-stefanha@redhat.com>
 <20180803144721.17036-6-stefanha@redhat.com>
 <1a84a9fc-93f8-3573-c27e-bb60d9c48a7a@amsat.org>
 <20180813155622.GA18429@stefanha-x1.localdomain>
In-Reply-To: <20180813155622.GA18429@stefanha-x1.localdomain>

--c9gVQQOtawoQU0Oo0fMPpXbMhyNfx23bZ
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 08/13/2018 12:56 PM, Stefan Hajnoczi wrote:
> On Fri, Aug 10, 2018 at 02:00:44AM -0300, Philippe Mathieu-Daud=E9 wrot=
e:
>> On 08/03/2018 11:47 AM, Stefan Hajnoczi wrote:
>>> +        parser->rom_start_address =3D parser->next_address_to_write;=

>>> +        parser->current_rom_index =3D 0;
>>> +        break;
>>> +
>>> +    case START_SEG_ADDR_RECORD:
>>> +        if (line->byte_count !=3D 4 && line->address !=3D 0) {
>>> +            return -1;
>>> +        }
>>> +
>>> +        /* x86 16-bit CS:IP segmented addressing */
>>> +        *(parser->start_addr) =3D (((line->data[0] << 8) | line->dat=
a[1]) << 4) |
>>> +                                (line->data[2] << 8) | line->data[3]=
;
>>
>> Can you add a qtest for this case?
>> For the HEX loader I understand the specs as this is the same parsing =
as
>> the START_LINEAR_ADDR_RECORD case; so I disagree with data[0] and
>> data[1] shifts.
>=20
> x86 real-mode CS:IP addressing means (CS << 4) + IP.  It produces 24-bi=
t
> addresses on 80286 and later.  This is not the same as
> START_LINEAR_ADDR_RECORD.

OK!

>=20
> GNU bfd implements it as follows:
>=20
>   abfd->start_address +=3D (HEX4 (buf) << 4) + HEX4 (buf + 4);

Hmm any idea why they use +4 ?

>=20
> https://sourceware.org/git/?p=3Dbinutils.git;a=3Dblob;f=3Dbfd/ihex.c;h=3D=
09f756a1c2c11e57c5da15a6ff96491275575b86;hb=3DHEAD#l415
>=20
> Thanks for commenting on this, I had written (CS << 4) | IP instead of
> (CS << 4) + IP.  This will be fixed in the next revision.
>=20
>> This is different for the consumer (i386 expects 2 16-bit registers bu=
t
>> HexParser->start_addr is a hwaddr, used as a single (at least) 32-bit
>> register.
>=20
> I think you're saying that on x86 the guest CS:IP registers should be
> set.  This loader is never called from hw/i386/ so it doesn't matter at=

> this time.

OK.

>=20
> GNU bfd uses START_SEG_ADDR_RECORD records on non-x86 architectures
> where there are no segment registers and that's where we've encountered=

> them.
>=20


--c9gVQQOtawoQU0Oo0fMPpXbMhyNfx23bZ--

--UuDcRjS7Zez0TYfEyWAZkHWkYt74ftEMM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE+qvnXhKRciHc/Wuy4+MsLN6twN4FAlt0NjIACgkQ4+MsLN6t
wN4F8A//SCak8dOCJ1TDvHVZwz8dbBSmkf1ag8MypGWL+3ytETg0Fs4fUydOqRty
rL7avDtYE7EQIz5aps/sOzeNtnNqbudNkgNkudzIaAywxIMF17PBta+0IueKQoWX
btgu+Gq/OdQeEWC4bz9Ez8BH0/I+9kJAjuzfSAR2yJXA8zc70qZ+lWC4iTfJ/+Wi
xqulS/C6PC9K68L+8Fxa2CyiA86BA+sc28cdwOuQogYVjS6a3wwZe3deYmWMvLxX
3cmqOTq+Twjp+A9bdbGyEVz15p+dA1xvNvJlxTYN+IaQ8Yg5PIbxUdB1tAOWivE2
mt7G7Qex+1vG8jGS5Ae+9ZLDhtQsv/uQGXFBLphopc8Q3S4Tjz2WHEyXmG6FYxFi
3fVsmxVwAGxjDusl6N0LWqvq/BhU/eAFBK0l+WPVhClI3gRpiW6YZd9XVx+4yX+n
SmV+hWpENDbUyLccfyrPVZ2fswkMxXT3o/F7kPw0JNIPQx2MDg1SuKiHBjWjCeeZ
HTaFf8UWSZ4lrLCAjjssnsQNIelvQiVxJzyP6WBXEUFAhlQH/xD0DEy6AJxWyrYn
+zFNHgb6ijNYX07MNJ0fq5z5ANb3fFtpA0GVumJezXxc780RBVonVBwIkAtEp169
b3oPTPCDxnbL4ZcGDZR79GUCT8EfBOq07z6GsVzeJnjDukPkEOM=
=z7DE
-----END PGP SIGNATURE-----

--UuDcRjS7Zez0TYfEyWAZkHWkYt74ftEMM--
