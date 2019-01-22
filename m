Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp7036827wrt;
        Tue, 22 Jan 2019 02:05:26 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4ZNB/KUukQ5z8++GiQrT1A5gscMwYh6iR+7aT4ZiOsZosWvtaPdD7rD2f06ymrTrgQnCco
X-Received: by 2002:a5d:628a:: with SMTP id k10mr31275670wru.254.1548151526060;
        Tue, 22 Jan 2019 02:05:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548151526; cv=none;
        d=google.com; s=arc-20160816;
        b=g06CUJHWBo9sEM4g6poVkIE63H4XII/Pc8UHfD1OYNgDB6L8YUloiQcqCt6j3n1dHZ
         mM4O2yhGd+zjbFpzR97OJ3I2YSDUOLYMYhCnRCxjo0FuAl7QadCnw1EhMJH6PO9MdFV9
         q1g4eK48T4Hke5fxfwcHiaZdbvvoO0YUcIqsWZddzCMe7/XSndTG2XkIf2LWA1DXqq4F
         83PM0AzVPROvz+ufM9hyuRonID6DdBJFttaqbq/8MvkNJgtmRcW3C77g4/GZZNOL37MX
         B/CaKAaWGGTUS3NNocsqM6fWymwRiV0li/NWlXRE6qf+M9/2BrEsjrryLdxeokcUmBhh
         ledg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature;
        bh=R44cpBsVj6/9CFDyox+CuZhB9j8jyVuRGgSIptMVyNQ=;
        b=N7HIL/jxNYss+5SzfcoEPCbemDF2O8two90DXdG4Bsw5Z8Nz/lKnek85EgVV7jDWUF
         XRMr+VzdB0wmuVOGMK+O0Nlsf5Fh5cOUMh/0fmvEJnexMoeMb60KAZMVlA+9WVUdhiI6
         LQD74FyMc1OgSt8WB+7JcOYgy2qSIdAUHQpBPFJU5Qmy4qYS1SpslmLqIV5o3Hfr5Fb4
         3gnJYq+Po9TexZqsn+0EUJCvul6+VgyvAazHlQjyxWjzv8DzMHrKW8gKNbUToS2Ci1oc
         Kfkaf6ZSJWNzsMipADBgRlpX9tPTnFDSRGA0FkO2qY69kr5h4FQte3R4f0JbivxQq3Ds
         XsXw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=UKlcAFa8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q9si10268023wrv.174.2019.01.22.02.05.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 Jan 2019 02:05:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=UKlcAFa8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:41966 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1glsvt-0002Py-5c
	for alex.bennee@linaro.org; Tue, 22 Jan 2019 05:05:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59106)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1glsW0-0006AI-GN
	for qemu-devel@nongnu.org; Tue, 22 Jan 2019 04:38:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1glsKk-0002k7-3O
	for qemu-devel@nongnu.org; Tue, 22 Jan 2019 04:27:07 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:38426)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1glsKj-0002hL-Mt; Tue, 22 Jan 2019 04:27:02 -0500
Received: by mail-wr1-x444.google.com with SMTP id v13so26456963wrw.5;
	Tue, 22 Jan 2019 01:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=R44cpBsVj6/9CFDyox+CuZhB9j8jyVuRGgSIptMVyNQ=;
	b=UKlcAFa8RMva6b2V2F8euoaY5+e6Nwn5KWGPNE3x6R7GFqY23c/WPRfPkvBKDvEhI5
	K5DCzB5AGkF/ZPUFTX6XZtQzEp6C4AP+wPFdV+c2j3CeHceQqqV9VSR+z2J8wLCIGrfh
	9ryno6meKsnthMxhcnE3gQTo0FCmmH7AEOrwNhqu7HWmFkbkAOGmsf3JctdljU0kI0KN
	Uox67AWIZfNYJGTTjrBo526ltkzBv0IVZuAlvyXimhGLwHET3zfNdy0EHu5jT2Pdm1Dx
	OsXhDCsWTv8hmy1ZmHnx5vKLDbjiJQqWChpsrUbMCZS+4l7amdaJ1Ej2LJhNuU1fRDzu
	6VmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=R44cpBsVj6/9CFDyox+CuZhB9j8jyVuRGgSIptMVyNQ=;
	b=HyKgmabQWFJKcAGOqT3jm5tBr6p4loc0hTl6A/7TKodOPPcCYGeRKYmf6TDAAX5HEs
	LzuSwSA0fFYQX3Q6RsXFeKVUcDek9AT7dzBh0EgzfsAUeAvhqCUT+xRkG+CJvvLCa8qx
	kkouaFb42nls5YNLnfGIfRtrJqJ5U3eaZ/yOHk0AoWqXJjbZCXoyPPw952OADAD2dCCw
	CB8UmNu+nNkmsZ8l/QUWqh8DQv8yxQ3oQNGHTAIQqOEEQP6LqskQgoxQeO5ReDvE6J9u
	aT85r/59vp1lvjbo8qYJTecgoi18pqJXYwLNv4mi3Q+ds1QEjkRSNLNSPhGQXeIhOibl
	FAOA==
X-Gm-Message-State: AJcUukesYo1YeJ36LpXLhGlos2zSJLvsZicLLqoE5Kg9VciDavUM5mbB
	CeTGZIeymcOh5fcF+aQa+/E=
X-Received: by 2002:a5d:68c3:: with SMTP id p3mr32791161wrw.34.1548149219551; 
	Tue, 22 Jan 2019 01:26:59 -0800 (PST)
Received: from localhost ([51.15.41.238]) by smtp.gmail.com with ESMTPSA id
	v6sm75052357wrd.88.2019.01.22.01.26.58
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 22 Jan 2019 01:26:58 -0800 (PST)
Date: Tue, 22 Jan 2019 09:26:57 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20190122092657.GA17452@stefanha-x1.localdomain>
References: <20190110094020.18354-1-stefanha@redhat.com>
	<CAFEAcA8bz7ViuZeZqCBZHy49=dbYxW7Q04MbuVKapEfT5K56ug@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RnlQjJ0d97Da+TV1"
Content-Disposition: inline
In-Reply-To: <CAFEAcA8bz7ViuZeZqCBZHy49=dbYxW7Q04MbuVKapEfT5K56ug@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: Re: [Qemu-devel] [PATCH v2 0/2] arm: Stub out NRF51 TWI
 magnetometer/accelerometer detection
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
Cc: Laurent Vivier <lvivier@redhat.com>, Jim Mussared <jim@groklearning.com>,
	Steffen =?iso-8859-1?Q?G=F6rtz?= <contrib@steffen-goertz.de>,
	QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
	Stefan Hajnoczi <stefanha@redhat.com>, Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lB+7aYLgqQIT


--RnlQjJ0d97Da+TV1
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 21, 2019 at 04:21:03PM +0000, Peter Maydell wrote:
> On Thu, 10 Jan 2019 at 09:40, Stefan Hajnoczi <stefanha@redhat.com> wrote:
> >
> > v2:
> >  * Move stub code into a separate device [Peter]
> >  * Instantiate stub from microbit board instead of nRF51 SoC since this=
 is
> >    microbit-specific.  Other boards using the nRF51 wouldn't necessaril=
y want
> >    to see these TWI/I2C devices.
> >  * Add test case
> >
> > This series stubs out the microbit's TWI/I2C devices so the microbit-dal
> > firmware boots successfully.  The accelerometer and magnetometer are pr=
obed at
> > startup.  If they are not found the firmware panics.
> >
> > Stefan Hajnoczi (1):
> >   tests/microbit-test: add TWI stub device test
> >
> > Steffen G=F6rtz (1):
> >   arm: Stub out NRF51 TWI magnetometer/accelerometer detection
> >
> >  hw/i2c/Makefile.objs          |   1 +
> >  include/hw/arm/nrf51.h        |   2 +
> >  include/hw/arm/nrf51_soc.h    |   1 +
> >  include/hw/i2c/microbit_i2c.h |  42 +++++++++++
> >  hw/arm/microbit.c             |  15 ++++
> >  hw/i2c/microbit_i2c.c         | 127 ++++++++++++++++++++++++++++++++++
> >  tests/microbit-test.c         |  44 ++++++++++++
> >  7 files changed, 232 insertions(+)
> >  create mode 100644 include/hw/i2c/microbit_i2c.h
> >  create mode 100644 hw/i2c/microbit_i2c.c
>=20
> Applied to target-arm.next, thanks. Can you provide a
> MAINTAINERS file update for the new files, please?
> (You can send that separately or stick it in another
> nrf51 series if you're sending one.)

Sure, will do.

Stefan

--RnlQjJ0d97Da+TV1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJcRuHhAAoJEJykq7OBq3PIoXYH/2kCnoguR7EO1X7TnB+GAArT
BdAJYlGbXTLepUjO9IQ2Q8B4CMC2/jg9YopD9zJGJJJRFUckHCZkL6bHZDNloKfr
y33j3g5g5estByYfYBz8X0zm1xbpd/3FF2KwRFDDbCg87cOGr7CLfRl1Pq92kn0F
Lr0Wc3VSDtVBdLNSgBcAaicZL1CUOJtdrLCTtauQuedAUg61uPdjvqXT0b4impfT
2LUXVZO/En5AgbGwxdk2q3vgNWXa5gxqKw9IzkGcJIoHBIbS6IKTsL7sAB+A1Oob
ic+AYhPR7U8qZHI13DGEFLuIB6LyFkBMidVsvnP1PZAqsNM86sGFSMPmYnMMaFw=
=jj9T
-----END PGP SIGNATURE-----

--RnlQjJ0d97Da+TV1--
