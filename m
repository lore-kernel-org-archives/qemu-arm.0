Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp3724809wrq;
        Mon, 25 Jun 2018 05:04:17 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJ/gRGCEI0EUW0pwkDPXtFUFHvM92I6+W2MlsKurNHrJirwzVBuWyfonyPlwJr6/xGoAGxM
X-Received: by 2002:ac8:17eb:: with SMTP id r40-v6mr10500354qtk.75.1529928257806;
        Mon, 25 Jun 2018 05:04:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529928257; cv=none;
        d=google.com; s=arc-20160816;
        b=jomi7oTS6p4MuiugwKvwSvcdn4nskSog4zy0JBS97hFBdmAW2HiCNL7qftExi1qSQB
         Zj3cx1D40JfZwPwn2shKjih8cHDLBmzNFnCQ0FUtujO5VdVZ1VNX4VbJzFsGNeQWC+CH
         ZOYBAlYZ7qDP06wBLyWF/Kk2hi2FxvMX51AV85XTNDMRGylw/bJROR8qGk6BbblkMJkI
         9IzAInUEvUNjPvKyEvC53/7BGZmUHW7ttXaK7J7+lBnu8MqzlyEZDPFocH0cJnjoYoO9
         VlnT18O1l4CZJclnENLHFM6J4eIafi5p1+h9kqUjuXN0jKLjpCvxFEpVLd+A79wOkKFR
         eBHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to:date
         :references:content-transfer-encoding:mime-version:to:from
         :message-id:dkim-signature:dkim-signature:arc-authentication-results;
        bh=/Ashk32UMsu/aGVZRp6ZDcoso/PLZaC17xPK4ayrGT8=;
        b=wDsLZUw4Lw8We/Dec4WiXx77Y9f0pHk6zPgzdHq2sSSKVR3t5PgAuqa+01g32CFMYo
         ZHSeF/TpC1D0vtBlFjD7dsWOQDPJ1F0PsSJ+xW2i8SHZlkfzUnNV7Zyd9MCGHl+0bgg5
         41Bafu+V8wRn0xFOF0+C6oKmQsLza0EUx0v+C50fiDKDd5fHwcOZmVRNQgz7wsIqXl0h
         qDz/761s/3Umi1CtMr6KH7p95Hf3rfsfdADOfzE25lfdtVhTbPpTJknEU5OLIITWpW0g
         UxvuBtfQRkd1OmiSGYkKTwFwWP4VkAUN8v3m7MMNBGW65atkACGFEBKMlvkmT38ySiw7
         b48g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@aj.id.au header.s=fm3 header.b=CH2HxSpq;
       dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=SMJZmxL3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z2-v6si2504845qvj.225.2018.06.25.05.04.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Jun 2018 05:04:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@aj.id.au header.s=fm3 header.b=CH2HxSpq;
       dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=SMJZmxL3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46001 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fXQED-0007N0-CZ
	for alex.bennee@linaro.org; Mon, 25 Jun 2018 08:04:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40895)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1fXQ9d-0004Bp-8Q
	for qemu-devel@nongnu.org; Mon, 25 Jun 2018 07:59:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1fXQ9c-00046Q-D6
	for qemu-devel@nongnu.org; Mon, 25 Jun 2018 07:59:33 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:50785)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <andrew@aj.id.au>)
	id 1fXQ9X-00044n-2x; Mon, 25 Jun 2018 07:59:27 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 635F921CCD;
	Mon, 25 Jun 2018 07:59:26 -0400 (EDT)
Received: from web4 ([10.202.2.214])
	by compute4.internal (MEProxy); Mon, 25 Jun 2018 07:59:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; bh=/Ashk32UMsu/aGVZRp6ZDcoso/PLZ
	aC17xPK4ayrGT8=; b=CH2HxSpq9E7s1XIg5tGjpQpAuffkpXiTJD+8Eo+sevKqe
	poHUw38b0mSSsVCLasVFSx2mCjpkwZgS6cP8eQpeGJqm8ZDpMOSFazmThTtFTjtV
	rUQ8P6vQnFVTRddjhXKpgIbknQVU09DPb3e4+e2cr+SuntWkpCF94e02e/Yauynt
	q0WiZ87IZfOhgMIt+prXLFUvYRtcVAcgyfFTP6NcRHxQL+vScQnsMF/x+OoNTVdz
	GpugjIVfk92CAJqnnyg4R3tZYngttHqhV/AHjy7ZMv1tMun/pilckHblIubsL13I
	CJjWGc7b1WvGuhZOLDWZnejdZ+9JNhI3iGWmgK7+A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=/Ashk3
	2UMsu/aGVZRp6ZDcoso/PLZaC17xPK4ayrGT8=; b=SMJZmxL3iUd9fc9YHs4vi2
	PjE63CcyI0HOMQChaRN/YWj1xktjtizgS+A79K6wTWQMs44dn7PQp4nXXyCermWC
	KuAIRyNyowVJ9ctcfPjGPg1Yy8kdnvxcazEuB5ZzmLTpH/yj31/F270LLL7CmL+d
	LAS8lWMqhY9OIV31MTN88JrHTxqsqME5ShhBAs9kvUVaXtKvAoF3IucITFQp5IWB
	sqaJiIPsi86V0RPO8eho9W38WAnwg7I/ov2j6/DsV0uNEALl+n09xIBNqp14I7aP
	j6KlirnE5ZlViqZNkV1H3rCjB5jHWad63yV4NXFAR2DUaMatD0VEt+uyLT1FnBgw
	==
X-ME-Proxy: <xmx:HtkwWwSMBIvxJOFUkefXPEapaWIgFgi1XNI66cZuXuo_PiI7BN4sCw>
	<xmx:HtkwW1N1qh4LmBC8aBnUj45BlKeGd-02tNseKgouqcxTHwGr0a2JxQ>
	<xmx:HtkwW7akW_MsKI8d-3a_XdaFqVxS4W9Vis8F02MZHsXxE8-Mna0u0g>
	<xmx:HtkwW8wOMmFGPGLSoLl40aRhozW2DML8-n5YTnDVMZFF28wlNoKcrA>
	<xmx:HtkwW4IiYkm52J93BzAVBdUKoSbiy8pq5jZPRRSPkhU9zxd8l7cwWQ>
	<xmx:HtkwWzAopqPZOGG6C61jDzjjlwjp-0fL1ABKrK91oJLH0kMDEHk_sg>
X-ME-Sender: <xms:HtkwW9KH6fggr-5YjboMYFAmObs8oNYO-JXhSRzC97m-EGT0TajWhQ>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
	id 04B39BA4CF; Mon, 25 Jun 2018 07:59:25 -0400 (EDT)
Message-Id: <1529927965.3221404.1419429536.7B0D907A@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: =?utf-8?Q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-0d8ea36c
References: <20180625110721.22485-1-joel@jms.id.au>
	<0627e87c-6d3c-a64a-6d6d-2a632c73ebf7@amsat.org>
Date: Mon, 25 Jun 2018 21:29:25 +0930
In-Reply-To: <0627e87c-6d3c-a64a-6d6d-2a632c73ebf7@amsat.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.111.4.26
Subject: Re: [Qemu-devel] [PATCH] MAINTAINERS: Add ASPEED BMCs
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
Cc: =?utf-8?Q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: t/3k+E2KQMm1

On Mon, 25 Jun 2018, at 20:43, Philippe Mathieu-Daud=C3=A9 wrote:
> Hi Joel,
>=20
> On 06/25/2018 08:07 AM, Joel Stanley wrote:
> > This adds Cedric as the maintainer, with Andrew and I as reviewers, for
> > the ASPEED boards and the peripherals we use.
>=20
> Good idea, this should speed up ASPEED reviews.
>=20
> >=20
> > Signed-off-by: Joel Stanley <joel@jms.id.au>
> > ---
> >  MAINTAINERS | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >=20
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 2874ddce6097..14bcf2ed3e3d 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -644,6 +644,17 @@ M: Subbaraya Sundeep <sundeep.lkml@gmail.com>
> >  S: Maintained
> >  F: hw/arm/msf2-som.c
> >=20=20
> > +ASPEED BMCs
> > +M: C=C3=A9dric Le Goater <clg@kaod.org>
> > +R: Andrew Jeffery <andrew@aj.id.au>
> > +R: Joel Stanley <joel@jms.id.au>
> > +L: qemu-arm@nongnu.org
> > +S: Maintained
> > +F: hw/*/*aspeed*
> > +F: include/*/*aspeed*
>=20
> This line does not match, however include/hw/*/*aspeed* does.
>=20
> With that fixed:
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Similarly:

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

>=20
> > +F: hw/net/ftgmac100.c
> > +F: include/hw/net/ftgmac100.h
> > +
> >  CRIS Machines
> >  -------------
> >  Axis Dev88
> >=20
