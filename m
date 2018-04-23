Received: by 10.28.4.212 with SMTP id 203csp3721720wme;
        Mon, 23 Apr 2018 03:46:45 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZqfzViADiXZjVtOWHGMiX1W5X7aqpGyD78PpDNFZCCkN29p2wATMRPy5y7QHw5h3dAcgCRO
X-Received: by 2002:ac8:684:: with SMTP id f4-v6mr21851560qth.306.1524480405199;
        Mon, 23 Apr 2018 03:46:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524480405; cv=none;
        d=google.com; s=arc-20160816;
        b=z2Jgh0joKpAwYs3xapqPoMsWTKLqxbCyXeXUqB/o7zo+CY9qcrZZKAbi5/V9mhvtqF
         92qQuNgdOsHD9/JjNQCH2hsCNH4DIOpugXxG2kM8nWInN7lpVZp+RwuQwLMp0y4F67mT
         3Rm2xVay+8+RMRhMjx2p5/sw9fYPfpHg1L9YVPQa8Ux98aWOkeGU/po8ffifSpPwL+O0
         6VMO+0CMGMh634wjmeG4AO/y4SO+kVTeJqhgbq9sSM+PyHTZ+sgEh923XPtmgsoFfVar
         EBZ3ePCwBixxdXDVeSv2WNbNIqzDxaLXiXEDcZ2UUlNQQaLYzN1ao2Yjf+PaORxZ8Gdz
         SQXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=nrrmShPpMW8Gp64QVae2ZMS3gWxP5gWi+LbwPAbOo7Q=;
        b=mLFmV7kIOOEB4yodgrId2MLOSslw3Oq20iAtjCe8xxnU1TvYKRVJREYYFGKGT4Bdd8
         iP2oyArXSkeMR6XRBgR42sBfxYAhFl+uYIB4F8w9NNhEIxdxgbskc3ZD4KNF1LtZn3Vn
         1cGQLIrmj+6obfQ2ScKMEu+hQvklBGBVRge59o84xTkNpNOLmRWMwba01caawzxaMkhB
         6uVuC6u2nIWteyZ81phHEO+UN24RKRiM/wHH1b4M+msOR5YZ8Ded00BKYd6xCiiiMh0Y
         I45ZI61e/TX2itVW/JJ2rfTBUV45KD1Nzdu/bMZTcpGiWQ6T8NEro7obc460y0pqbXDB
         X4TQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m4-v6si13429706qtf.368.2018.04.23.03.46.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 23 Apr 2018 03:46:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35497 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fAYzc-0006mT-Mf
	for alex.bennee@linaro.org; Mon, 23 Apr 2018 06:46:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51368)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1fAYzM-0006km-H5
	for qemu-arm@nongnu.org; Mon, 23 Apr 2018 06:46:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1fAYzL-0002VU-LE
	for qemu-arm@nongnu.org; Mon, 23 Apr 2018 06:46:28 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:60698 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgilbert@redhat.com>)
	id 1fAYzL-0002Uc-Fk; Mon, 23 Apr 2018 06:46:27 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5CC9E4077EEE;
	Mon, 23 Apr 2018 10:46:26 +0000 (UTC)
Received: from work-vm (ovpn-117-231.ams2.redhat.com [10.36.117.231])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3C22B1208F6D;
	Mon, 23 Apr 2018 10:46:25 +0000 (UTC)
Date: Mon, 23 Apr 2018 11:46:23 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Message-ID: <20180423104622.GG2518@work-vm>
References: <20180423064020.25434-1-clg@kaod.org>
	<CAFEAcA-LtNpGTV08jvK4i5C5i64WjM5gMB4zGr8P4fkVSkNH7g@mail.gmail.com>
	<53691cbf-08bf-e3f7-22d3-601a279aa08a@kaod.org>
	<CAFEAcA9XBHE5YxN27M1ugprmSf=o5iiNakO2omrY+HBgCszV5Q@mail.gmail.com>
	<a5ca89ac-7c8f-c565-30d0-357bacb1f61e@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <a5ca89ac-7c8f-c565-30d0-357bacb1f61e@kaod.org>
User-Agent: Mutt/1.9.5 (2018-04-13)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Mon, 23 Apr 2018 10:46:26 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Mon, 23 Apr 2018 10:46:26 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'dgilbert@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [PATCH] timer/aspeed: fix vmstate version id
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +EmYJeN6eeLA

* C=E9dric Le Goater (clg@kaod.org) wrote:
> On 04/23/2018 11:34 AM, Peter Maydell wrote:
> > On 23 April 2018 at 10:28, C=E9dric Le Goater <clg@kaod.org> wrote:
> >> On 04/23/2018 11:12 AM, Peter Maydell wrote:
> >>>> diff --git a/hw/timer/aspeed_timer.c b/hw/timer/aspeed_timer.c
> >>>> index 50acbf530a3a..7df19bd9df91 100644
> >>>> --- a/hw/timer/aspeed_timer.c
> >>>> +++ b/hw/timer/aspeed_timer.c
> >>>> @@ -498,8 +498,8 @@ static const VMStateDescription vmstate_aspeed=
_timer =3D {
> >>>>
> >>>>  static const VMStateDescription vmstate_aspeed_timer_state =3D {
> >>>>      .name =3D "aspeed.timerctrl",
> >>>> -    .version_id =3D 1,
> >>>> -    .minimum_version_id =3D 1,
> >>>> +    .version_id =3D 2,
> >>>> +    .minimum_version_id =3D 2,
> >>>>      .fields =3D (VMStateField[]) {
> >>>>          VMSTATE_UINT32(ctrl, AspeedTimerCtrlState),
> >>>>          VMSTATE_UINT32(ctrl2, AspeedTimerCtrlState),
> >>> Wouldn't it be simpler to just fix the incorrect value in
> >>> the VMSTATE_STRUCT_ARRAY(timers, AspeedTimerCtrlState,
> >>> line ?
> >>
> >> Yes. Also.
> >>
> >> Or bring back all the version ids to 1, as we never supported
> >> migration before.
> >=20
> > I think it's nice to at least do the "bump version" thing, so you
> > get a (hopefully comprehensible) error rather than just wrong
> > data if you do try a cross version migration,=20
>=20
> On that topic, the error message was :
>=20
> 	Missing section footer for aspeed.timerctrl
>=20
> which is not very comprehensible for a version mismatch issue.

Was that before your patch?

The VMSTATE fields in the structure have no metadata stored
for them to be parsed with; if you send a different number
of array entries to the number the destination receives you end
up with a corrupt stream. Section footers are just a canary
that tells you something went wrong in that devices data.
It has no more information to give you a more detailed error.

Dave

> Thanks,
>=20
> C.=20
>=20
> > so I would
> > vote for just fixing the one thing that was wrong: the
> > number in VMSTATE_STRUCT_ARRAY is the version to be used of
> > the substruct, so it didn't need to be bumped in commit
> > 1d3e65aa7a; the main version numbers for vmstate_aspeed_timer
> > did need to be bumped because part of the main struct changed.
> >=20
> > thanks
> > -- PMM
> >=20
>=20
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
