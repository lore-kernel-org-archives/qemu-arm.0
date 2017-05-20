Received: by 10.103.124.15 with SMTP id x15csp530841vsc;
        Fri, 19 May 2017 18:01:15 -0700 (PDT)
X-Received: by 10.237.57.41 with SMTP id l38mr11586622qte.5.1495242075371;
        Fri, 19 May 2017 18:01:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1495242075; cv=none;
        d=google.com; s=arc-20160816;
        b=YXr0cmE6iIbOaGbg4W+8IL3fb14VO/HefXTYcuZs+tNwG3HYEvj1qUY7IEalBfPQfJ
         D0ZAqSD6vuLgj3Ta5tS0Q5aLfKDiXHrZcLwwZK5Lyz10YjoXHozsqkIfLnFyCUCbTVFe
         2gLxRqNok7twa/mMCXDmkJ3jFpnLvM2xeBl5Ynw0otuu0wctDYjbzMTy5uG3WBuoGRCG
         iC+kABqhhjCJVktFTOsaLBuQj0Mddf9OuOWipjZ7s21A+0+1HlNiZqM/ENuvSzVsxBjK
         Z1e/+qpQ45PFBnGENdRXCYlFoVMX+nHatQnxG9NNituP8HrzwMu6q5kp3Nny8O9XyprU
         gCOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:date:to:from:message-id:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=NhzDZce+6EWCDisDk+Twro9TfUwCm59khFfmT9UnZ8g=;
        b=WE+06ygkXyxO/+zB46/QHMks3/Palwhoj6YO5dFGCFM5YTqfxc+QnKpbdVXFm65kxV
         46bbE5cRuYs+eh3w8PzIJN9qEPAYReopaQXEhiNKHWKn952VeExr/2/EMLBpb8Wr/wYU
         uWnMKXFJEsggoTX1JD4RHvQ6sb/66tltPQTlof+TnQSWJ6A2JvxvkT/oDpEGJPDHfI8F
         McLfzpb2uqUkndBL2k1ZP+oHdOo5gi/71eDuJr3r6oTj1GfVkHrbGMcOjbnhvMeFisH/
         RQt1gyMAJD5n7eg2Oe42g1ViG7izw7FgbwY96sagj+dQLsxO8hSQZ9SXadFIGfWxjYCY
         2XYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@aj.id.au;
       dkim=fail header.i=@messagingengine.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s31si10554259qts.234.2017.05.19.18.01.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 May 2017 18:01:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au;
       dkim=fail header.i=@messagingengine.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60791 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dBslf-0001yR-0o
	for alex.bennee@linaro.org; Fri, 19 May 2017 21:01:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34486)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1dBslZ-0001yA-6t
	for qemu-arm@nongnu.org; Fri, 19 May 2017 21:01:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1dBslU-0002TZ-DD
	for qemu-arm@nongnu.org; Fri, 19 May 2017 21:01:09 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:50095)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <andrew@aj.id.au>)
	id 1dBslU-0002TL-2J; Fri, 19 May 2017 21:01:04 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 4D37E20861;
	Fri, 19 May 2017 21:01:03 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
	by compute4.internal (MEProxy); Fri, 19 May 2017 21:01:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
	:x-sasl-enc; s=fm1; bh=NhzDZce+6EWCDisDk+Twro9TfUwCm59khFfmT9UnZ
	8g=; b=VbWU/CnHjEWUuhZAqWKGU8/7N+F4bXpjf1zv07Lufe5WKawBrnsmHlDB8
	VEZCKaFFsGYcS6V2cXptzlVHncDnHMGM0AUikPi3R0qE1kIxUzaAIKpXnWGK2Um/
	uWsbXMWgbx3FBdVp5Fxn4lhg0iwQr+4NE0jrSaC+DnF9ua2KyY7X5TD9l/WnEGq4
	Xz+HM9mEGOvIb8eCf7ldRpXoGUzhYTcrLyaLNGzohPQNARfVYVCU3/L0TNIioqGs
	fkTpEy5tn8zHkqmeuSEN8kF2RPFdlEHnszYarn+yWzARe7C7JjVdc7eupKTB3QxX
	HOhX7Ehxg1JguWKSFNO7HCsWkqS6Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-sender
	:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=NhzDZce+6EWCDisDk+
	Twro9TfUwCm59khFfmT9UnZ8g=; b=rlgghYOh6Sn2cxnwQwrL7qMkrVXxQxdtXf
	ezv3ZcntNSTVdAvyRDZd+Eo5mTKH0z4gtglEokIQwdpLa/u15GleSvXd1Wwgi1x8
	blpOu/nm3JcnU8xJ6gvkOTt48uZs8RPElcMsXbhVh/8EpX5zy20qww3bFT5ClecI
	g1dnddz8r3fnOos9Hc7QLa1QVp1vdJaoHNMubExDYdhjhtY6lqoD3cXPV6lCISur
	DDUmqaDES0fcE0lrJZIAZ7BOMLM5WhtY03RvtJ5Rx1OsLUZM+a6GnASwqzWcP1gX
	mLmb7/L6Fe9eU6iveeqnaJGFUs29Soe6TcVzZtH6WfeG6T1XSG6g==
X-ME-Sender: <xms:T5UfWSOqrFv_5DbPxBxhvRddfvew4WQBIwpSoFg17gCanw1czhdw9Q>
X-Sasl-enc: DZbLyEWu0FNDFxG1od90mXtGMeE9qrU9hUPsijPkdmH7 1495242062
Received: from [10.4.67.151] (unknown [202.90.207.97])
	by mail.messagingengine.com (Postfix) with ESMTPA id 988687E266;
	Fri, 19 May 2017 21:00:57 -0400 (EDT)
Message-ID: <1495242020.23485.1.camel@aj.id.au>
From: Andrew Jeffery <andrew@aj.id.au>
To: qemu-devel@nongnu.org
Date: Sat, 20 May 2017 11:00:20 +1000
In-Reply-To: <149524146010.732.16986967949772245903@c05f1edc8ed1>
References: <149524146010.732.16986967949772245903@c05f1edc8ed1>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-EoSPiC5TjTfuXvClmuX9"
X-Mailer: Evolution 3.22.6-0ubuntu0.1 
Mime-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.111.4.25
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 0/2] hw/adc: Implement a basic
 Aspeed ADC model
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
Cc: peter.maydell@linaro.org, famz@redhat.com, alistair@alistair23.me,
	qemu-arm@nongnu.org, clg@kaod.org, ryan_chen@aspeedtech.com, joel@jms.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CVB0ji1Ybtgc


--=-EoSPiC5TjTfuXvClmuX9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2017-05-19 at 17:51 -0700, no-reply@patchew.org wrote:
> In file included from /tmp/qemu-test/src/hw/adc/aspeed_adc.c:15:0:
> /tmp/qemu-test/src/hw/adc/aspeed_adc.c: In function 'aspeed_adc_read':
> /tmp/qemu-test/src/hw/adc/aspeed_adc.c:106:34: error: format '%lx' expect=
s argument of type 'long unsigned int', but argument 3 has type 'hwaddr {ak=
a long long unsigned int}' [-Werror=3Dformat=3D]
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qemu_log_mask(LOG_UNIMP,=
 "%s: addr: 0x%lx, size: %u\n", __func__, addr,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^
> /tmp/qemu-test/src/include/qemu/log.h:94:22: note: in definition of macro=
 'qemu_log_mask'
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
qemu_log(FMT, ## __VA_ARGS__);=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~
> /tmp/qemu-test/src/hw/adc/aspeed_adc.c: In function 'aspeed_adc_write':
> /tmp/qemu-test/src/hw/adc/aspeed_adc.c:162:34: error: format '%lu' expect=
s argument of type 'long unsigned int', but argument 3 has type 'hwaddr {ak=
a long long unsigned int}' [-Werror=3Dformat=3D]
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qemu_log_mask(LOG_UNIMP,=
 "%s: %lu\n", __func__, addr);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^
> /tmp/qemu-test/src/include/qemu/log.h:94:22: note: in definition of macro=
 'qemu_log_mask'
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
qemu_log(FMT, ## __VA_ARGS__);=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~
> cc1: all warnings being treated as errors
> /tmp/qemu-test/src/rules.mak:69: recipe for target 'hw/adc/aspeed_adc.o' =
failed
> make[1]: *** [hw/adc/aspeed_adc.o] Error 1
> make[1]: *** Waiting for unfinished jobs....
> =C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 aarch64-softmmu/hw/scsi/virtio-sc=
si-dataplane.o
> Makefile:327: recipe for target 'subdir-aarch64-softmmu' failed
> make: *** [subdir-aarch64-softmmu] Error 2
> make: *** Waiting for unfinished jobs....
> =C2=A0 GEN=C2=A0=C2=A0=C2=A0=C2=A0 x86_64-softmmu/qemu-system-x86_64.exe
> tests/docker/Makefile.include:118: recipe for target 'docker-run' failed
> make[1]: *** [docker-run] Error 2
> make[1]: Leaving directory '/var/tmp/patchew-tester-tmp-i73ef6w0/src'
> tests/docker/Makefile.include:149: recipe for target 'docker-run-test-min=
gw@fedora' failed
> > make: *** [docker-run-test-mingw@fedora] Error 2
> =3D=3D=3D OUTPUT END =3D=3D=3D
>=20
> Test command exited with code: 2

I'll fix the format string issues in v2 along with any other issues
identified in review.

Separately, is it necessary for the bot to send the entirety of the
build output? Can we make it a bit smarter to send just the error with
some small amount of context? Maybe send the full log as an attachment?
Or host it and link to it from the email? It's a bit tedious having to
scroll through all that output to find the error at the bottom.

Cheers,

Andrew
--=-EoSPiC5TjTfuXvClmuX9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZH5UkAAoJEJ0dnzgO5LT5fyUP/3n//wnVmanOFJBHWjWxDsj9
2Il0+mcQsWZpWpGLoW6BF9wDGUuDkeOgX89AMNl43RQZGhRZMwm5mGBqOAuSi+OM
GwG5A6vvHIN+HbEI3SZoC5krB3jtB13/x2utQW+NgiehSJ6d+cuUxbDy1Heeassh
hbawGQm6Zr16lLhtu9fdJJK4e4CWMu7PEFdNZEvgq762uS8DtFACqOSQ8xE8QIme
tBk2hSN6t0gKI2eevjUyoR8XlcPcSRTyNxV+9EKNpE+O3UqPqZZzS6TvF+nVpf3s
CSlE6pBURYKSg+fJuI4DRkWhPn1L1X2RhQmXqCe3a8nJnrgSQVV67+eh1Fpi52Uc
LehKcKWHV1JAQPw/ryZFKf4UCNiRO4KF1+D9xOC8WfiMmnDYrV07Y3moQjy/Wiys
dicwSJDxAELIMZ/LzYG8nT1IumYntT8QUQixmP4pO1dd2V5e1eWhj/6KgiHLlQKv
mW8TLb5ZORX8n/gZk9Rezl0VQ1X+i+LnY6sNBaS4l55dmwngK9/2/haZbBLSeouh
VW3Bo/5y83bqcauOAQEsNsvgq+zyR8YlJBJ6hELwRPvkXHPDbvrU4VLms0s+rVPj
k8eLyf3wQOny4ZaEbVrYFT9NsvGggE6LqVj1rzMeigT5TdvVXPTfcpfmJgBja95F
GKCv9GJS72MFYyP3ZJ24
=fu8k
-----END PGP SIGNATURE-----

--=-EoSPiC5TjTfuXvClmuX9--

