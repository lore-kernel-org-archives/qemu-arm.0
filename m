Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp172969wrq;
        Wed, 11 Jul 2018 05:51:35 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfGlP4y6/0yF8/gfHEaxURGsLJbpPzmARyybgJPObkmOjgWnXZrnuUlqt/Y54Qw6Jq4AKMM
X-Received: by 2002:a37:1fdf:: with SMTP id n92-v6mr26688345qkh.333.1531313495234;
        Wed, 11 Jul 2018 05:51:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531313495; cv=none;
        d=google.com; s=arc-20160816;
        b=0k1MKnd6rv1rux03A+R8aAjbsGULO6ZzPT9YJxCEfMU0WiU1G13tvLPV5rUEc1B9A2
         h2DNLwPZwx1SJxN1DXccSWsm/WjXQHYXVioib/brXvZxcut7jj6U2yovAfvSGm7Intgu
         TSYW/pq+OZnvjms54P+Pj32vNo5nLToQQa8fdN5F8dQ8DBQfF3heXvGULFhR/3tSeE9f
         lStedxdLnEFmDCNpa/WZW9nLTex+hcdaE3/j7pBG2fCvy+J7/fPC/OU+3WptVIPkEC+M
         Upb4ym04//ztaCv5ifzOIqeRSRqeS/7FLmfS7h4wHGSD8S2v7ahm5JjQyOUcdC578Fjv
         8d2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=ilT5RQYhZiRKVlTqTAKlbXVYP+VgKrhL4FR/2/8DV7I=;
        b=jprcXFG+faWMBsHIBsWqB5HM25lASr8+AUKPCtqga7WX1HHbwbbHTrrQAXccCYP8Zi
         WHuDzorf4fjVxogiJ6vvdgClW0yO5vGJsq/Jiae4buByFlmXeMyppstAsP9qFjcg8wYY
         1wWoL2LV/M/W/5M1/oVu+79IIqP07jvj9v7V5SR3cwVfR+U3pT60BJkFJzisjHgjSMDj
         AwrQQQi99K9oci0030KkiUVtS4CJ+pHxAsXuCQgANlx3IO59Zzgxlw6HEMlFg0Qp8ppZ
         ennDhH/4FeppF4nBskpyk1W/zzj0SwYzEze+HqdjqLOXu1ZtDg4VD0B0PmYYJZn+RVvi
         TUYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=cqjMxj+q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z5-v6si7563174qkl.2.2018.07.11.05.51.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 11 Jul 2018 05:51:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=cqjMxj+q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:53596 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fdEak-0004WX-OF
	for alex.bennee@linaro.org; Wed, 11 Jul 2018 08:51:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44378)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1fdEaV-0004VA-2B
	for qemu-arm@nongnu.org; Wed, 11 Jul 2018 08:51:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1fdEaU-0007dG-4i
	for qemu-arm@nongnu.org; Wed, 11 Jul 2018 08:51:19 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:43824)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1fdEaR-0007ca-No; Wed, 11 Jul 2018 08:51:15 -0400
Received: by mail-wr1-x442.google.com with SMTP id b15-v6so18082726wrv.10;
	Wed, 11 Jul 2018 05:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=ilT5RQYhZiRKVlTqTAKlbXVYP+VgKrhL4FR/2/8DV7I=;
	b=cqjMxj+qRwqXevaFBLlvjP9g1P8RHrQ2j7GKQrh8dSe7AzrCAlZm8OPV3xMmrP7r1W
	PAghYmDfNJqreFjlmuUKvWT5c2cze1pclHbeuVX8tKcjXSLqvoytn8uIcmhCmemXm0AL
	tTWziepBZcQN5GSWJ5SRRI6DZXoTlX5ajKQO+t7iKVdqM/CmKmDm5kJpitJmhAYilZIS
	LDdj5aW0QxMbt9J7PPoX4To14K6yn9GNVm5E1tUc3SGAsbjjQI4Mp0PzIldEkzMVTtOi
	JOP41iPezXw93GoV0qu/JwF25z2HvAyli+V0iNwL/Qk8FzovDaRgxfIgESevP5+bJlbw
	ohEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=ilT5RQYhZiRKVlTqTAKlbXVYP+VgKrhL4FR/2/8DV7I=;
	b=BAeuSYsUzyScIqw0y0dzq8D6Oae2lywzSuhmEwcnHMNC764s/qabvF9ZrtpAzPZe0o
	aJxOmTs9NrDs7by9EETj9AE/DO5dXW/xr/BoYjv7UI1OFbtoebbv6fg2RIRXw/Xnhjlw
	Df945Vz7H+naWWhXmS2X9gzV0vaHVo/ylwVBQOus9f3/WeoNQLNB3lzQmPYN8vPsR37c
	wsqu84WlT5NQ7uhdFifoE1mFwltGMS2tZ1gBFGVud5JKQdETwNJmksprXFsAV6I2EGy5
	QzsMFKkY9/lMpEnc39JxzwQEpK6S8R8UVoApY93+nVMX7V3iBWcgQcmoPlEJIJ75nNjp
	Mjdw==
X-Gm-Message-State: APt69E1Nvi7SnQyKcZmglqV7VuNue8PtEDWzl+hQtxCXVcxBGWdGp5xB
	rU1iY2/qFsPMsfQCTCBseaw=
X-Received: by 2002:a5d:428a:: with SMTP id
	k10-v6mr21226614wrq.225.1531313474271; 
	Wed, 11 Jul 2018 05:51:14 -0700 (PDT)
Received: from localhost ([51.15.41.238]) by smtp.gmail.com with ESMTPSA id
	q8-v6sm3632752wmb.3.2018.07.11.05.51.13
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 11 Jul 2018 05:51:13 -0700 (PDT)
Date: Wed, 11 Jul 2018 13:51:12 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20180711125112.GF31228@stefanha-x1.localdomain>
References: <20180630091343.14391-1-stefanha@redhat.com>
	<20180630091343.14391-2-stefanha@redhat.com>
	<CAFEAcA-boywojdasSCZ5EnnGMtETMH7JZw30fOR7fepMQaqctQ@mail.gmail.com>
	<CAFEAcA8AzjD3f44U+He1Y10p8iNR8EaWODdv3XRUQtQiDdCotg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fwqqG+mf3f7vyBCB"
Content-Disposition: inline
In-Reply-To: <CAFEAcA8AzjD3f44U+He1Y10p8iNR8EaWODdv3XRUQtQiDdCotg@mail.gmail.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::442
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 1/3] hw/arm: extract ARM M
 Profile base class from ARMv7-M
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
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
	Stefan Hajnoczi <stefanha@redhat.com>, Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: atIkmtGu9gy2


--fwqqG+mf3f7vyBCB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 05, 2018 at 04:49:22PM +0100, Peter Maydell wrote:
> On 5 July 2018 at 16:45, Peter Maydell <peter.maydell@linaro.org> wrote:
> > On 30 June 2018 at 10:13, Stefan Hajnoczi <stefanha@redhat.com> wrote:
> >> The ARMv7-M code is largely similar to what other M Profile CPUs need.
> >> Extract the common M Profile aspects into the ARMMProfileState base
> >> class.  ARMv6-M will inherit from this class in the following patch.
> >>
> >> It might be possible to make ARMv6-M the base class of ARMv7-M, but it
> >> seems cleaner to have an M Profile base class instead of saying an
> >> "ARMv7-M is an ARMv6-M".
> >>
> >> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> >
> > This makes sense, I guess (though it currently leaves us in the
> > odd position that we have separate a object for v6m, but the v7m
> > object handles both v7m and v8m...)
>=20
> ...though I guess the counter-argument is that the only thing that
> the v7m object is doing that v6m doesn't want is creating
> the bitbanding device, and in fact bitbanding is optional in v7m
> (you can configure a Cortex-M3 without it). So maybe we should
> instead just have a QOM property to let you turn off the
> bitbanding ?

Okay, we can do that.  So how about a single ARMMProfileState class for
v6, v7, and v8?

Stefan

--fwqqG+mf3f7vyBCB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJbRf1AAAoJEJykq7OBq3PI45MIALDNi9sqZmezhnoluWeZUJZd
4IArjNNhqOpcKHO6gz86WZfBVdkqtIX6EdniBM6uHwNcbhUntFALq5+J1N0QcgF2
CpTDiiecMMsKO+9yqtnfJSvRv78hMCUkwy71TkWIgljR/ai6k6zxyM1WfkxBiA5H
LZoOIUPxpU3x6GeQVaw3QRlZ2+72Z99OcTb8UUrJMR7ZWBUPdxA3AtnirebtD9dc
nukh+e9B1RMgu0juyN3r93LH039zjRJcNecmylac7IeRgzs2wC/h/+sVQGwBHHA2
SLmVLbgy7WB/vcVe/+71eyptqawEGny2AFIeExfT9LrKuJLi8Q7eq9r8jxIVVbU=
=w5i6
-----END PGP SIGNATURE-----

--fwqqG+mf3f7vyBCB--
