Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp569657wrq;
        Fri, 8 Jun 2018 00:58:58 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKqmMXwECDzrnuxGfhp+kqLpy1UJFCpPFhQBOCS3A3KLXwhbs1vmA+HB5lLixq7aSnKQ/vz
X-Received: by 2002:a0c:9361:: with SMTP id e30-v6mr4731107qve.92.1528444738800;
        Fri, 08 Jun 2018 00:58:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528444738; cv=none;
        d=google.com; s=arc-20160816;
        b=rG8NDw8uxNuj9oRu/LfAvE3sRGIYeCMD6hu0PxGt3UIqZiPg1ng91lS9heKwWk5oCh
         NISQ85GM/9xjUJ30i8HxtDNFvTruaFwfB/cCoUm9w67HKtSA8zeXVCq81w2mepZp0+xg
         67+OZObV1b8a9iqBK0DdM+Ne+N4xhath5H/zNepTwh/kLhkNyCxQ8HAYAxWdmSPeQxEd
         /H6n45jHrNoxkKlrli5tBgvulGBOfu0ITTmL/kfZikKVldkCdl2hhfdEgG7L4XLdg3//
         QuVjM68RMASAgGZXNdCw7+dwrjD3UDtpXoyIDGOrFzgX6Ki9TzJmd68cgn8Aahcjth+O
         ptCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=M4eQH75hLHEXtxDkwUvCgcDa5SfWOqtAEWV2FDEHxXk=;
        b=dfu+xjZnP9y0vnWZ1MPy+bohKUPEKgLAOem8tv4f8LAX1mSmMHCSeb7qItBZH8gK6s
         d48BY6lSHKh+J987kdxrcsamN8ByDbKqeKI8MZckILCpckWo0yqMPPPzdKoqqx9qSYYa
         Yq4N2l4slrcl82/ZK0KD6KyaSNUkpb0SkB8Lt2/2zrr+iKcw1Q8XRRdC90RWQ1/QhGAt
         9G8jnElJay+5HzHblm7WiT9oDS8j4TtkmgkDBLmXCHYcishIn1dEv5l9BicqWH896Stz
         qsaDMdVpbvDINE7YVVNyA21FLHS0L2vz7zWZ3C2ZV732friPgNvi+fF90GvBdWebO0Jo
         6Ecw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=B2byBT+d;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t41-v6si8790396qtg.143.2018.06.08.00.58.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Jun 2018 00:58:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=B2byBT+d;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:33819 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fRCIU-0001h1-Bd
	for alex.bennee@linaro.org; Fri, 08 Jun 2018 03:58:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37716)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1fRCI8-0001fq-AW
	for qemu-devel@nongnu.org; Fri, 08 Jun 2018 03:58:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1fRCI5-0001gP-7u
	for qemu-devel@nongnu.org; Fri, 08 Jun 2018 03:58:36 -0400
Received: from mail-wr0-x22d.google.com ([2a00:1450:400c:c0c::22d]:43917)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1fRCI5-0001da-0z; Fri, 08 Jun 2018 03:58:33 -0400
Received: by mail-wr0-x22d.google.com with SMTP id d2-v6so12344982wrm.10;
	Fri, 08 Jun 2018 00:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=M4eQH75hLHEXtxDkwUvCgcDa5SfWOqtAEWV2FDEHxXk=;
	b=B2byBT+dmIxCCRAvF6QNZ0cruduBpE1bf6KjqrKAEiCAYuC5eGvtaWpglyEzZNSyMJ
	mp3thBGhFVARgyRaMFsup6BAy7BI8RLe6MhSSwCYz60hNKgCyRBd1MhTN2nuy6GuacrN
	5tfzFY5YeKUDL+j10Xao2OvNRmmz2pZjzfcVeh2UGdjuq1NJQCUytaf6E4umqwdlY/MF
	kn8fcHeEmzsGJe4QhRFC5dq+OkiNLrZSqBmszDMxP0fIVj4mn5w/wfSKM/pclp4LIemf
	tdOWio7Z0Xs77+DdDbksv31i13ZgzSoxw2zNEFIc+GTrcsovQJfeOJb4by2amC79hFHx
	l+kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=M4eQH75hLHEXtxDkwUvCgcDa5SfWOqtAEWV2FDEHxXk=;
	b=EVYDqNHMAn1qX643knInaLE8TsII5y6Qf8ZFSHfC+iDDvEt3Sbjdt67cm0+rTi2G8E
	PBNDjrfBa0X93ZS4Pe8n8J4xn65NUKtkBC12BG7jTFm8klAcuY97lzvihKBtDZ4KA/bA
	dhRX6wk8amjWRkGrlDzG4+OChPcTI5ySbdhFJHKSL15hSZKS9+ymDXKdJn2nezQZECwK
	Pcyb4upDZ532ytlfzU6Roae3PXIs7UjwHKQivmIzIv7d5qOhjLwUSyGvVg9yDi9Xb8nQ
	y+ay5GtpovOEwrk2k/0xyMN0laypPLnwjgnukQfEsArmwMY1/Ub0F2ObBQSxwKXlD5Rg
	bT5g==
X-Gm-Message-State: APt69E3de/wrCzlNd19gqQ1VbMda8OoAgx7gKx09+fZNHsN048H87W69
	HuNcMCVQ0R51OQDyEzocXH4=
X-Received: by 2002:adf:982d:: with SMTP id
	v42-v6mr4297684wrb.93.1528444711925; 
	Fri, 08 Jun 2018 00:58:31 -0700 (PDT)
Received: from localhost ([51.15.41.238]) by smtp.gmail.com with ESMTPSA id
	u108-v6sm76636177wrc.40.2018.06.08.00.58.30
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 08 Jun 2018 00:58:31 -0700 (PDT)
Date: Fri, 8 Jun 2018 08:58:30 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Message-ID: <20180608075830.GF29183@stefanha-x1.localdomain>
References: <20180603203412.11033-1-contrib@steffen-goertz.de>
	<20180604092008.GA13674@stefanha-x1.localdomain>
	<CAFEAcA9kdvxa61HNxv-cDhcv07E_NUpwVcSJVYNw4weS3k7nUw@mail.gmail.com>
	<20180604101221.nhvjum467ier3txx@sirius.home.kraxel.org>
	<20180607102455.GD19032@stefanha-x1.localdomain>
	<20180607103307.GI28827@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Bqc0IY4JZZt50bUr"
Content-Disposition: inline
In-Reply-To: <20180607103307.GI28827@redhat.com>
User-Agent: Mutt/1.9.5 (2018-04-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::22d
Subject: Re: [Qemu-devel] [RFC v3] qapi: command category to stimulate
 high-level machine devices
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Jim Mussared <jim@groklearning.com>,
	Steffen =?iso-8859-1?Q?G=F6rtz?= <contrib@steffen-goertz.de>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>,
	"open list:ARM" <qemu-arm@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
	Julia Suvorova <jusual@mail.ru>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zawpwvLgCOOP


--Bqc0IY4JZZt50bUr
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 07, 2018 at 11:33:07AM +0100, Daniel P. Berrang=E9 wrote:
> On Thu, Jun 07, 2018 at 11:24:55AM +0100, Stefan Hajnoczi wrote:
> > On Mon, Jun 04, 2018 at 12:12:21PM +0200, Gerd Hoffmann wrote:
> > > On Mon, Jun 04, 2018 at 10:29:40AM +0100, Peter Maydell wrote:
> > > > On 4 June 2018 at 10:20, Stefan Hajnoczi <stefanha@gmail.com> wrote:
> > > > > Many of these inputs/outputs can be tied to an external UI.  A de=
gree of
> > > > > timing precision is required so that the UI is responsive, althou=
gh
> > > > > cycle-accurate timing is not what I'd expect from QMP.
> > > >=20
> > > > Would we also be able to tie them to an internal UI, ie
> > > > something that appears as another view in the GTK/etc
> > > > UI frontends we have?
> > >=20
> > > Should be doable too.  Basically a display device, which isn't a *rea=
l*
> > > display but the UI.  Could show a rendering of the board, simliar to =
how
> > > web emulation environments are doing it.  LED status could be rendered
> > > directly to the board.  A virtual mouse could map mouse clicks to but=
ton
> > > presses.
> > >=20
> > > Doing more complex input that way (say a slider for the temperature
> > > sensor) isn't going to work very well though ...
> > >=20
> > > Sensor input in general is pretty much unsupported in qemu.
> >=20
> > For the micro:bit we've been thinking of a WebSocket monitor interface.
> > This way a web UI can work with both local and remote QEMU instances.
> >=20
> > For security reasons, the WebSocket cannot be the regular QMP monitor.
>=20
> FWIW, add ability to use websockets protocol over chardevs is fairly
> easy. We already have a QIOChannelWebsock for the VNC server, so it
> is just a little work to wire it into the chardev.

Cool, good to know.

> If the -monitor / -qmp arg took a filename containing a whitelist of
> allowed monitor commands, you could indeed use the regular QMP monitor
> instead of writing something new.

Yes, this is exactly what we need.

> > A slimmed down monitor is required with a subset of QMP commands and
> > events.  For example, users must not be able to migrate to an exec:
> > destination so we need to ban that command on the UI monitor :-).
>=20
> FWIW, you could  use the "-sandbox spawn=3Doff,elevateprivileges=3Doff"
> arg to prevent ability of QEMU to fork/exec/setuid. Even if the
> monitor still allows it, it thus get blocked, albeit by immediately
> terminating the process.

True, but that's just one example of many.  Another one is "pmemsave",
which writes to the host file system.

I think a whitelist is the way to go.  It will allow us to secure the
monitor and expose it to untrusted UIs.

Stefan

--Bqc0IY4JZZt50bUr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJbGjcmAAoJEJykq7OBq3PIi34H/idlvdlDyp2jvOgj+2SFwkZ8
4lWTcAcPb1SifThGOcKhpSAXEs2e0mZtmdOyLiCZmAor4XV7TC7HGWvpxcEe41H+
lmqowY0hinj1ojO1Lk/qStVnbFxxTx0p9cF5cTqPTs3k4pMDeWvLgUdFsDbWvUEg
8lUtOnx7pGgVwSj+K3PmyfV/D8C7pM4v6PiasIYsjO0ssqszFpMoUpL3vo1M/hfn
VEPYh9QHDsBxNDgGW0J9XHJqLT2dmSrWGYcn0JDjYd4M2kEnoV28ysqLzYkNTOv0
JIo5WKpNBhd7I1JGY6F9CprGBsqpxFknRGpoxqTMQ/A6IxnEFLFbxA5QRkW51KY=
=ByDc
-----END PGP SIGNATURE-----

--Bqc0IY4JZZt50bUr--
