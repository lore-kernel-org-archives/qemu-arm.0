Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp1928838wrd;
        Thu, 20 Sep 2018 06:43:14 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdbiJeFneBdss3rVUA9uj22uBJOTS/Grc1oBogVoDrcRjQWVTgd4J6ivrZVhvFX7EP+jtey5
X-Received: by 2002:a0c:89c5:: with SMTP id 5-v6mr28758103qvs.46.1537450994605;
        Thu, 20 Sep 2018 06:43:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537450994; cv=none;
        d=google.com; s=arc-20160816;
        b=p6lYhkNEMBL9SxwhQBGC3LKauUpj4zK0ZpBLmaLh4/F67KlRXfTdgJLZcGwDoIflgz
         6t1/Q8nhGLwIOnccZsHMjp9fUucHBCJ1Up2LNhOTVJP5cDF1+2viX+vKuVPzYEde/n89
         fCep0ALUOBQ9uZVfQ06RwrHbnoAke6DJkOK2Bp68kZpyt28t/033NRIWZRsC2Jl4MlUr
         jW2tFlTtPNPtIc7mV+YhM4tCgemvBu4+bO28GGsH/otvs/AyvgPb0j0lRyfkLXHnQuba
         IH4fLLg0u2DI2xEC9mqplZ3fuW9bf6cnX5IESpRcGp64uZ4EheMGHUKEXD8cObSB7sgU
         inlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:date:references
         :in-reply-to:content-transfer-encoding:mime-version:to:from
         :message-id:dkim-signature:dkim-signature;
        bh=oywLCAtNaa6BnLpBOVkQyv0aACqCLlJNNyi4lPZb4Js=;
        b=ZACD8nSHxU+HdjBt7NbVU3HWdeXvFu4lNj6wwymmWezRj2LUKsuFho3PC153uwIQo6
         UJXRj4kF9u8XZSgTpUWqS9FeSYmsLqsg4SnN268J5/hJ0GSgNFaZ1i3sD+HjevAFkaYU
         N5Nyow85+h7PUpe5eH1dlCo393/YylIwKGNo2nK3aP8LgwB0IFiPsKiTo5AR8Jtu0184
         6z8RVlCki28mwyrOd2dKgkwbYyYBjc6pYK/1PaXgsWImxJf7GsKbRh2p0NYV9USeI87s
         lnLWPMUzW3yIn8fMKKt54wcF5A/bGFrl4AnB041NHSc0PwXviP2BIce1Aacei+QgfaXJ
         EU4w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm3 header.b=DqC9U2NV;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=PnKZvvZx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m67-v6si3554724qkf.278.2018.09.20.06.43.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 20 Sep 2018 06:43:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm3 header.b=DqC9U2NV;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=PnKZvvZx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:50553 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g2zEg-0004zj-4I
	for alex.bennee@linaro.org; Thu, 20 Sep 2018 09:43:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41126)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1g2zEV-0004zd-1b
	for qemu-arm@nongnu.org; Thu, 20 Sep 2018 09:43:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1g2zES-0004R1-7L
	for qemu-arm@nongnu.org; Thu, 20 Sep 2018 09:43:02 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:49143)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <andrew@aj.id.au>)
	id 1g2zER-0004Ma-V6; Thu, 20 Sep 2018 09:43:00 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 1504321F58;
	Thu, 20 Sep 2018 09:42:58 -0400 (EDT)
Received: from web2 ([10.202.2.212])
	by compute4.internal (MEProxy); Thu, 20 Sep 2018 09:42:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; bh=oywLCAtNaa6BnLpBOVkQyv0aACqCL
	lJNNyi4lPZb4Js=; b=DqC9U2NVOBd2zn3ualyfDsfoAeGmauZQYuQ/V6csA/ceT
	d1OSDD4K0a/pgepZp8O0+cO+2RkOh1icWUnBQkL26kdTe5mgblTzcEteC7JVuB9j
	1yaKuFVrQfzz3pNFiKvAcO3WjiueetGsU9wfN/9NvA+xBzW4gs+3M9EDIOATFuwL
	rzzhqyKgBzh5XSOE0VEqHtkHt0D8dFFRMivz9t6JKlN9M7diS5qJFLgXANLNgr9u
	iXd3/jks4tbUU3JvVBgP/EVFWNlz/6Me7Y1El2i5m0vV7PkMMXW5In9WiIfG6yv9
	9KYpfvOW0ZSbodpJan5vH64ee6cTHSh2GaRYYJ4BQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=oywLCA
	tNaa6BnLpBOVkQyv0aACqCLlJNNyi4lPZb4Js=; b=PnKZvvZxY/C5prvga6Yl/r
	mvKLbkSUpyadc6r/BIvTJeEqeRLTRRnVVZF3PFYJfWLxLAge55HuIZbLNNsLeP/B
	6LyEZbx0ka2Z4Rms694faHcIKL5iAimbFX5hCF12WRr/Tyhdi9WcIkpKio5A3wxI
	+O+XkWRhOHwGnGb0XXcoz+FBgpN95xJ/Ypf0c7IMGRoA7Q2ssOYwIwdssFCy8wCL
	S7EYFx5BwGNgfsR/qV4PHtflJU2nvaoRvshnLjx9ibRjJ271FFkyLPNvjoQpmALl
	3Z+4V97TfvAFlpUttLIVvslJkdj/BuMriPI2Jc5KRpAgCPqucVKlSUnpInevnQeA
	==
X-ME-Proxy: <xmx:4aOjW-FfQ3DWBzAFLqx5MZgHqDyEAjVjxDriBYusJ_h748J6z8YG1A>
	<xmx:4aOjWyCCXH3t43UwwXQVusKDXMQzGkSJ5_0mpZNZ1ySXWE2T5PP-Ow>
	<xmx:4aOjWz8L8GVsjcg9_6Y0OpoJwxj0keFMK0zUgEvXnkZ1-fxzLxZWHQ>
	<xmx:4aOjW-hvKmOq55qXqRh8P1mLy_1iuIhwMujFkUtupjbnIcRUzZ_QNA>
	<xmx:4aOjW7uQbyByml61yn9WbHBccO_FmTxDI5sJVbouK-doOnfB9aH5xg>
	<xmx:4qOjW-gwEIvbMz05841KDesEoPG-uQIC1d3C-4YmnM1G4N0J5X9nZQ>
X-ME-Sender: <xms:4aOjW4R6Ebspz4jDrvTZTcpB0axzU5Y2wXIASbEgQd4j9A9hNcY9kA>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
	id 13A0162225; Thu, 20 Sep 2018 09:42:57 -0400 (EDT)
Message-Id: <1537450976.2248409.1514771776.746FD971@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: =?utf-8?Q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-e556cd15
In-Reply-To: <78bb2ac4-f315-b0b9-7e99-b87bfed46eaf@kaod.org>
References: <20170630030058.28943-1-andrew@aj.id.au>
	<cd1aba90-176f-9ec6-3e2b-d1135156a96d@redhat.com>
	<1500013222.7221.1.camel@aj.id.au>
	<78bb2ac4-f315-b0b9-7e99-b87bfed46eaf@kaod.org>
Date: Thu, 20 Sep 2018 23:12:56 +0930
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.111.4.25
Subject: Re: [Qemu-arm] [RFC PATCH 1/1] memory: Support unaligned accesses
 on aligned-only models
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
Cc: qemu-arm@nongnu.org, joel@jms.id.au, f4bug@amsat.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yU1arr5CFICT

On Thu, 20 Sep 2018, at 21:43, C=C3=A9dric Le Goater wrote:
> Andrew,
>=20
> On 07/14/2017 08:20 AM, Andrew Jeffery wrote:
> > Hi Paolo,
> >=20
> > Thanks for taking a look!
> >=20
> > On Thu, 2017-07-13 at 14:05 +0200, Paolo Bonzini wrote:
> >> On 30/06/2017 05:00, Andrew Jeffery wrote:
> >>> This RFC patch stems from a discussion on a patch for an ADC model[1]=
 where it
> >>> was pointed out that I should be able to use the .impl member of
> >>> MemoryRegionOps to constrain how my read() and write() callbacks wher=
e invoked.
> >>>
> >>> I tried Phil's suggested approach and found I got reads of size 4, bu=
t with an
> >>> address that was not 4-byte aligned.
> >>>
> >>> Looking at the source for access_with_adjusted_size() lead to the com=
ment
> >>>
> >>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* FIXME: support unaligned access? */
> >>>
> >>> which at least suggests that the implementation isn't complete.
> >>>
> >>> So, this patch is a quick and incomplete attempt at resolving the iss=
ue to see
> >>> whether I'm on the right track or way off in the weeds.
> >>>
> >>> I've lightly tested it with the ADC model mentioned above, and it app=
ears to do
> >>> the right thing (I changed the values generated by the ADC to disting=
uish
> >>> between the lower and upper 16 bits).
> >>
> >> I think the idea is okay.
> >>
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0access_addr[0] =3D align_down(addr, access_s=
ize);
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0access_addr[1] =3D align_up(addr + size, acc=
ess_size);
> >>> +
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0for (cur =3D access_=
addr[0]; cur < access_addr[1]; cur +=3D access_size) {
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0uint64_t mask_bounds[2];
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0mask_bounds[0] =3D MAX(addr, cur) - cur;
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0mask_bounds[1] =3D
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0MIN(addr + size, align_up(cur + 1, access_siz=
e)) - cur;
> >>> +
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0access_mask =3D (-1ULL << mask_bounds[0] * 8) &
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(-1ULL >> (64 - mask_bounds[1] * 8));
> >>
> >> Please use MAKE_64BIT_MASK.
> >=20
> > Okay.
> >=20
> >>
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0r |=3D access(mr, cur, &access_value, access_size,
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(MAX(addr, cur) - addr), access_m=
ask, attrs);
> >>> +
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0/* XXX: Can't do this hack for writes */
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0access_value >>=3D mask_bounds[0] * 8;
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> >>
> >> Can you subtract access_addr[0] from mask_bounds[0] and mask_bounds[1]
> >> (instead of cur) to remove the need for this right shift?
> >=20
> > I haven't looked at the patch since I sent it. Given you think the idea
> > of the patch is okay I'll get back to working on it and think about
> > this.
>=20
> We have been using successfully this patch for over a year now and it=20
> would be nice to get it merged along with the ADC model. Do you have=20
> a new version addressing Paolo's remarks ?

Aggh, no :( I've been meaning to get to it, but have been significantly dis=
tracted
for quite some time now. I'm not sure when I'll be able to look at it. I'm =
happy for
someone else to have a crack at fixing it in the mean time :)

Thanks for the reminder.

Andrew
