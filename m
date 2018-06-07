Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp1918347wrq;
        Thu, 7 Jun 2018 03:26:48 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJl1oqZ0i06hI6Q6/xuN5BbjKVS4mL4TTqEdFJokrV4kBIuqa7fJknv7wdFacRFXwRRGo48
X-Received: by 2002:a37:1fd0:: with SMTP id n77-v6mr876106qkh.391.1528367208442;
        Thu, 07 Jun 2018 03:26:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528367208; cv=none;
        d=google.com; s=arc-20160816;
        b=N1/WIXDK+wuW2SonTciY98McgT4VchbprSisJZLeGECUJcPKXqBzU8sfeBHzJe95Mv
         AMXHLJ6erxK3eh+fsRhtY+EKWhlePC7sTy1DD+xMbY38ZiewPXzv8peZvaZJXZMiRqDH
         1cbR9/ZnLSHKIIq1rzoQMpk7py0OE1KozIqY9Gc+wSUrKXwRS1rUCtx/lb//a5PNn+JG
         AKvCy5+sUUlCONcQlXlosd7Yn7nEFbfcq/yBdnFTpf9dtb1icCJgxnwMcHWKE+vzfsgR
         51AVtFNhqxleRS9Lw2Y5jyLm4ce0lJIcv3MR20SMUKDEppP5mxNSqGzrOBB5JBVP5Ojp
         a3ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=mEAWbT2EFF3P7nIQ7pZdisUKMJ16YTS1xz3guWtIfVY=;
        b=HPAmJydj1bsc2R5/e/7JNriPQ4hpiJBzt7f6IRWHCHjABettQzOlB7PCFU3fSWNZuu
         WLb/Fxkq/noFYZSFWG/+98aODZiMKUHCm61STrg33UeskvZ73d6WLSMyx2P3AL1qVzmR
         axBkcJJ9S/TMlZQyl5lsRbl8lSbfFkaE3E7pdOpzNyT7UulCTndnwAn+XgTE8Y4troD3
         AjZ1n/hVjUGo9tXyDiCRecTYvELVLFqg9SshC10rCz77ftHXVJR6+1CU3hEeJYjsKDkP
         +UE135VxVoxwvCuNmz6yt14pLr1X867ELForibhB/pu/PDAIysxccnagmwcrwPPBhj/q
         83xQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=kczYDB56;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j126-v6si560679qkc.31.2018.06.07.03.26.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Jun 2018 03:26:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=kczYDB56;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:56723 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fQs7z-00045Q-KA
	for alex.bennee@linaro.org; Thu, 07 Jun 2018 06:26:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39851)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1fQs6I-0002y7-4K
	for qemu-devel@nongnu.org; Thu, 07 Jun 2018 06:25:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1fQs6E-0006On-W5
	for qemu-devel@nongnu.org; Thu, 07 Jun 2018 06:25:02 -0400
Received: from mail-wm0-x234.google.com ([2a00:1450:400c:c09::234]:52879)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1fQs6E-0006MO-NZ; Thu, 07 Jun 2018 06:24:58 -0400
Received: by mail-wm0-x234.google.com with SMTP id p126-v6so16916657wmb.2;
	Thu, 07 Jun 2018 03:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=mEAWbT2EFF3P7nIQ7pZdisUKMJ16YTS1xz3guWtIfVY=;
	b=kczYDB56F7QO+fTAWGOaRwiPiMTjXP1FuV1mYT+otb3PsUenJw6WkMMF4QpVNGCHkV
	bLXf2NeTstIpZqnhHeQafnjpHWcVtrzQ0zhkpGfJj6zZPSVI3TBdbOwwRazX4gR63bX0
	sWu6ds6TCYQTvytY4CoZja4rEyvL3hEEsj4klN622wFuRKwJ4YQ4EMYLAEs13RDi8cli
	4t/yajns1CZS2HNMI+o5THZVHo/HDfUzu8Rtnl1nfmO5A9p5Egj8mA1sW6FLyz1mS/HK
	pHwtuCuSdaqEawAIk/tmLRoVg8cKj8AVqWQaJUXkTvK6qVRGegsmj8qCXmQI8140JfuS
	m/MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=mEAWbT2EFF3P7nIQ7pZdisUKMJ16YTS1xz3guWtIfVY=;
	b=XEGyX5Pz3tpzufJW1hj472tcSqKxfs7gpF0C9vnSfawTGGP7t9RpMcVbnvlA155uFc
	DJWuxoBYHzJhz+K2OsPDhiBO9hFXuQqSbgSNkhlhEGs6edNbfBsdrNzCppkkxj/+OuN1
	WSToXj6z+i7Y0JA1T3ZcDpVFDdvnlRuaIUAB0bER/O7uJ1sJeoBy1U/iWPqVNf+HRELa
	vSn6UCC9BOONxCgncM6/9mwbRB5uJzgTeSJ0awf6QQUD6HzTaO5//SEJDZqaqi0+S2LU
	ZjqRpd3YInzs/AT1fWxv0QS4NCj8bmbhf6zI9Y5jXYLZsbcn4zmpbLyyKK91Ftb2age6
	bdvg==
X-Gm-Message-State: APt69E2RnwXQ2d9ZXmFftouThHnD9DwLqpBE1WU3FJQGySMovbg5v/Pg
	piVyVD0A0EU3EdWxb5z5MLM=
X-Received: by 2002:a1c:700d:: with SMTP id
	l13-v6mr1088367wmc.81.1528367097690; 
	Thu, 07 Jun 2018 03:24:57 -0700 (PDT)
Received: from localhost ([51.15.41.238]) by smtp.gmail.com with ESMTPSA id
	a1-v6sm28565046wrq.54.2018.06.07.03.24.56
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 07 Jun 2018 03:24:56 -0700 (PDT)
Date: Thu, 7 Jun 2018 11:24:55 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Message-ID: <20180607102455.GD19032@stefanha-x1.localdomain>
References: <20180603203412.11033-1-contrib@steffen-goertz.de>
	<20180604092008.GA13674@stefanha-x1.localdomain>
	<CAFEAcA9kdvxa61HNxv-cDhcv07E_NUpwVcSJVYNw4weS3k7nUw@mail.gmail.com>
	<20180604101221.nhvjum467ier3txx@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wLAMOaPNJ0fu1fTG"
Content-Disposition: inline
In-Reply-To: <20180604101221.nhvjum467ier3txx@sirius.home.kraxel.org>
User-Agent: Mutt/1.9.5 (2018-04-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::234
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
	"open list:ARM" <qemu-arm@nongnu.org>,
	Joel Stanley <joel@jms.id.au>, Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MLCg75PaCQRP


--wLAMOaPNJ0fu1fTG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 04, 2018 at 12:12:21PM +0200, Gerd Hoffmann wrote:
> On Mon, Jun 04, 2018 at 10:29:40AM +0100, Peter Maydell wrote:
> > On 4 June 2018 at 10:20, Stefan Hajnoczi <stefanha@gmail.com> wrote:
> > > Many of these inputs/outputs can be tied to an external UI.  A degree=
 of
> > > timing precision is required so that the UI is responsive, although
> > > cycle-accurate timing is not what I'd expect from QMP.
> >=20
> > Would we also be able to tie them to an internal UI, ie
> > something that appears as another view in the GTK/etc
> > UI frontends we have?
>=20
> Should be doable too.  Basically a display device, which isn't a *real*
> display but the UI.  Could show a rendering of the board, simliar to how
> web emulation environments are doing it.  LED status could be rendered
> directly to the board.  A virtual mouse could map mouse clicks to button
> presses.
>=20
> Doing more complex input that way (say a slider for the temperature
> sensor) isn't going to work very well though ...
>=20
> Sensor input in general is pretty much unsupported in qemu.

For the micro:bit we've been thinking of a WebSocket monitor interface.
This way a web UI can work with both local and remote QEMU instances.

For security reasons, the WebSocket cannot be the regular QMP monitor.
A slimmed down monitor is required with a subset of QMP commands and
events.  For example, users must not be able to migrate to an exec:
destination so we need to ban that command on the UI monitor :-).

Pros:
 + Remote control is possible over sockets
   (Important for hosting QEMU on a server.  Nowadays this is becoming a
   popular way to deliver emulation to users.  They don't need to
   install software locally.)
 + UI is cleanly isolated from QEMU process
Cons:
 - Binary or high-frequency I/O is a bad fit for a JSON WebSocket
   interface

I prefer the WebSocket route over creating a fake display that will not
be able to implement complex widgets well.

Gerd: What is your preference?  Do you want board-specific fake displays
inside the QEMU process as the long-term direction for UIs?

Stefan

--wLAMOaPNJ0fu1fTG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJbGQf3AAoJEJykq7OBq3PINoYH+wQeFaTA29kp934I6W3zeHof
0J/eKiigJqbt4VMkKhCwjnH8YxmijxymHi0lK9PcOJZnRY8oVavXFKmr7fE8KDri
f+a53pkcrF39ftqtmKnIsmTKfRmy7ikdnYQdmlb5eZcpVDrESpwZs+mNb2FKlFDB
6B8YhLOvLWYdeyg3CqdUHbgeAY6II9m6rJUOAaWEsLue/WmamdqeJYoedvBKAZL1
2CdJR+5rng8F3PASqhx1KQtIDUEdCxG3tV17OeD4UoediCdcImPrPQYJ0MDn4LI9
ak6hDtBKPBfII1n5GUwzDsdNegAmTO1LeUc5nQDmsx0kPVtsGP47DA4P8721Jv8=
=5lCM
-----END PGP SIGNATURE-----

--wLAMOaPNJ0fu1fTG--
