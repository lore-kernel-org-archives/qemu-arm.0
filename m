Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp566140wrq;
        Mon, 4 Jun 2018 05:47:29 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKK2suhCDSrA96gYwL6EHawghXI56ozSm+ua0+xU8ekCBFPOcPgIVROWod0WIoo2tQKglL3y
X-Received: by 2002:a0c:95c1:: with SMTP id t1-v6mr15146054qvt.240.1528116449659;
        Mon, 04 Jun 2018 05:47:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528116449; cv=none;
        d=google.com; s=arc-20160816;
        b=fp8WZv7EWwDQ1FYbuzWuMygzVg7La957DRWX1EMA3VG8k1T8aqVzAcexx2KwHumvPH
         mzTXS3fcTd/+yd1J68yuAhpZqJzyLS1UQXqFEeU9Htj3BY/nktuWULg7YeRLQfWRg6FA
         VXbfLdwcpdrT/N5gTQHZzjXhbYBJ8OymwaBPVzKF8QRtlXQMlp/1c3Uoobv+7m9oKq9u
         T2Q0d6J3oGVqWeQnl53Q8tcSPTYEGfuWNrHR5Qkdls/a6Ls51WMxgMKZihVkqWXC0cOo
         z9zAijkc2r+ylaA910A9ntjh4xC+DhIwA9gHa5N4wYDQLVo0U24Hv5SEIh3gNhDTh+Ud
         6Igg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=oryNzDi+Ate9AfXfpHRy+8aeVwG/v1d7DTXgNO1ZLbY=;
        b=HjX92nxlgjO2v+vDe20wtMcvuTtZvihpsuzbABGmSiZS9zNUUfbuOxe7mirntWAjvx
         aLdsOo3Kds7BGGtHpoX7h+GuqP0I+RwnoxoRkNQCcESnB9+QmTWb29eTbAkaUt94Ezrs
         ufijbBagL9gNRw1Dfo4HxMyMQR+BaGRcipdUZMh07R4HZ4+FM7dBW3fme/ZOhijjS0QU
         7f6xcD5u4YgYpQUIq6M9gLjsn71T/mtwFQibysMCLumGx9KhlSCHoA8hF8lzEXJrk7eI
         8JXHgkIT9PW4WgRKR9as/IGKgWrUhlGFElu+XXcO84c96fKihHg+b6Ldss4hE2RTbDxP
         eKOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=VhPV9Y9P;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j125-v6si958612qkf.275.2018.06.04.05.47.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Jun 2018 05:47:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=VhPV9Y9P;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:39608 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fPotV-00019l-2c
	for alex.bennee@linaro.org; Mon, 04 Jun 2018 08:47:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56262)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1fPos4-0000WB-Qk
	for qemu-devel@nongnu.org; Mon, 04 Jun 2018 08:46:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1fPos0-0007uO-Pv
	for qemu-devel@nongnu.org; Mon, 04 Jun 2018 08:46:00 -0400
Received: from mail-wr0-x242.google.com ([2a00:1450:400c:c0c::242]:46681)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1fPos0-0007ss-HG; Mon, 04 Jun 2018 08:45:56 -0400
Received: by mail-wr0-x242.google.com with SMTP id v13-v6so31443142wrp.13;
	Mon, 04 Jun 2018 05:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=oryNzDi+Ate9AfXfpHRy+8aeVwG/v1d7DTXgNO1ZLbY=;
	b=VhPV9Y9PaZwjmgvLl7DkP+gCj+hhnDV7gUAV8ZUybODKnwvQKV08UJDOQCgFOKPd9S
	0eEwsSbiduMI2Q5v+QT98og/orEGy4nNiqfHccU/P1VRGo12IZ3A/j2hyyvCMQuLVI9y
	LW5XMik+RG6Y/Yjs/T+OYh7mh5MVfELmJT0BCtVBRX6Q/xCwnHmqAVfAkSucDMSt3nao
	FdkEzJbyROddH/JhV0kxp9bzr0RnyGfkdja7wTTTytfejc0WNsWrlv5/byM0ffQIm4/N
	8RrhZLvv9VcxDuc6UZL1+c1+yOBRPP9SZpUNDBH5nl63K3vXr7V3Az2JliXWs/lYgEyv
	C/vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=oryNzDi+Ate9AfXfpHRy+8aeVwG/v1d7DTXgNO1ZLbY=;
	b=hpfEqgUOMl9MUx8rr1eBGYumU/4yLKDbT8OmhcHB+3aop5mnTcWvlnxuc81kMYb5EC
	77+YRefLbhmdFZqJbviYzbJ9t1CwEx+ue2Xr5964xQ2WaQD0HUWKw1h/+KlLZlq6Admi
	1mGUpcOkZB4WaYeWvWfWTwksnZTOPOPS0HJcJTf0oamgHm+ycD0hyYjJa5s5wRRfQiWy
	9do6fDn4J261oAldhXqs6PGnm3GpaoRx46CY0L9mER4OaOwyFJcQZBAm+3I+nEIWyUVi
	4kNvJOB0lAeN1F5MTJyrvAT0IFO1W/lEnfM2tpixSUFc+10tEzCYUsTkriC2nf6wE5i2
	MulQ==
X-Gm-Message-State: ALKqPwdoBP6A421wSnwrLyYSElit5NiBKIn8vOx/3CM9/AUUgw4069pR
	OhTJE8sqAPitx1+6POVjl5k=
X-Received: by 2002:adf:ad2f:: with SMTP id
	p44-v6mr16719867wrc.164.1528116355305; 
	Mon, 04 Jun 2018 05:45:55 -0700 (PDT)
Received: from localhost ([51.15.41.238]) by smtp.gmail.com with ESMTPSA id
	h12-v6sm76108wmb.3.2018.06.04.05.45.53
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 04 Jun 2018 05:45:54 -0700 (PDT)
Date: Mon, 4 Jun 2018 13:45:53 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20180604124553.GG13674@stefanha-x1.localdomain>
References: <20180602141446.29982-1-stefanha@redhat.com>
	<20180602141446.29982-3-stefanha@redhat.com>
	<CAFEAcA9cnV6fyc4AMO--jvvycrHPdy1Syvrqxy3J=OyM3cqGpg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EDJsL2R9iCFAt7IV"
Content-Disposition: inline
In-Reply-To: <CAFEAcA9cnV6fyc4AMO--jvvycrHPdy1Syvrqxy3J=OyM3cqGpg@mail.gmail.com>
User-Agent: Mutt/1.9.5 (2018-04-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::242
Subject: Re: [Qemu-devel] [RFC 2/2] arm: add ARMv6-M device container
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
	QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
	Stefan Hajnoczi <stefanha@redhat.com>, Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mP6WjPqPmr+j


--EDJsL2R9iCFAt7IV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 02, 2018 at 05:16:00PM +0100, Peter Maydell wrote:
> On 2 June 2018 at 15:14, Stefan Hajnoczi <stefanha@redhat.com> wrote:
> > --- /dev/null
> > +++ b/hw/arm/armv6m.c
> > @@ -0,0 +1,190 @@
> > +/*
> > + * ARMV6M System emulation.
> > + *
> > + * Copyright (C) 2018 Red Hat, Inc.
> > + *
> > + * Based on hw/arm/armv7m.c (written by Paul Brook),
> > + * Copyright (c) 2006-2007 CodeSourcery.
> > + *
> > + * This code is licensed under the GPL.
> > + */
>=20
> There's a lot of code duplication here with the armv7m object;
> can't we avoid that? What (if anything) needs to be done
> differently from armv7m/armv8m (which both share the same
> code)? Can we handle it by parameterizing or a shared base
> class or something instead?
>=20
> (This code will break if the "check we actually have an
> NVIC for M profile cores" patchset I sent the other day
> is applied, because changes made there to armv7m would
> need to be propagated across to this copied code. It would
> be nice not to have to change multiple places for that
> sort of thing.)

Okay, will rebase on qemu.git/master in a few days and work out how to
share the armv7m code.

Stefan

--EDJsL2R9iCFAt7IV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJbFTSBAAoJEJykq7OBq3PIWo8H/i/LoHUQzBN4t/7++5weBVBG
mVNF3YFsiHNIVQj+SAO4Z+9HAKJpM9TzOjc8HqmUHU/RXT/tB8U68JbuMhgS3oje
VcODkibXxR/6qfjMGNzai71XUT7uxUMUsl+Iysx/8TPyWPxOe4/7e/4oIGFG1OQe
Wy4hLTDwIDelAMjT5KJDdw6Qos9xSGOfl4I8s93pmzRjSWW0o1+BU/9WZ9Hgd2a2
zHHr5tXrwrl+1XC9igYOKzzww7WnDe2OPXxloA0N510DU+UP534GzZjNUa2HbgXt
nK/HFlHUHt0XR2lEzjceU9baHB8vr/CDYbeqSh1gIN48A/o+cccxCN2rKr7giLM=
=hP4n
-----END PGP SIGNATURE-----

--EDJsL2R9iCFAt7IV--
