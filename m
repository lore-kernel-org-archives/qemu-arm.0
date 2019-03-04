Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp3701355wrx;
        Mon, 4 Mar 2019 07:03:40 -0800 (PST)
X-Google-Smtp-Source: APXvYqzDwU6R2FqO2TENFB3uc3uq2S/gT2c/S+fxIfJsSgasuspEkFj9O/jHJZqQPmdyZ5UFS2tm
X-Received: by 2002:a0c:98c9:: with SMTP id g9mr14403797qvd.150.1551711820495;
        Mon, 04 Mar 2019 07:03:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551711820; cv=none;
        d=google.com; s=arc-20160816;
        b=trDMvCsSZBQNvcGEpbrX/yD9QW3+QJjJ7tQ+1LOXXREdcgh1mSa0hxLEwHZtaA6dhD
         5hthuWj7s7ebMumdfRC5vx/WjBgsnut2BgwHxm9Wx7TnCd53dM+4p+lm+2D6n57KAqd4
         tbpLBM0hVJrZEK26SYSGyBRhUPvSIqNugY5GUTRH7mgiZCY3rcg+gCW4/tPtUuMUGemi
         H/m3uCVvnr3Yh8HQCF/6Jd0p1wCNDxOO13VFyl0YEfuT99rUCc1qC+BuyLbSKFWyGKdG
         ldjBit75wyKnuo994KChku1atzGkGBdJ5dpv1Tx+Tk5QWgNM4XQCpvNuF1DL796gNXJm
         bHYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=hLH+Ue0nm9iu6UDw7m8rsuzQBsFk7l6xqViEuoA2Scc=;
        b=C3KyY3yE/UtYp9Y8GNq1Of/vmGEvpdQ9j08AiKEQ9Rv+/khL1kfq2RzYo5wbh4fltL
         MhKwcZi2lvxNQn64/k5a8Q9uxaUimEIgJ5yFzdjVvxAEREdOUFBeqCHUAeASKdL+VAB0
         ppx3VVKaenZwTS2+6XAYrZB17fz8U2ITZdGUetcWMncBKhAx9ZioyJwDEfE7XYYafFFk
         767/KjSxSgZoShvI+MWeeaCcDtYYWliW46swCuh77CbVoy8xsSFhH/ft9zJ3/nZxago0
         NykzbOGrxKQAcjJqJa63+cPHnytJzlfusOzj/RAOQGTYsw7DuDdm+xP40J1unuAv2Pmg
         pO4w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k30si2565107qte.185.2019.03.04.07.03.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Mar 2019 07:03:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:55384 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h0p7z-0007m1-Ud
	for alex.bennee@linaro.org; Mon, 04 Mar 2019 10:03:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54704)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1h0p7i-0007lF-VW
	for qemu-arm@nongnu.org; Mon, 04 Mar 2019 10:03:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1h0p7g-0005Rs-T6
	for qemu-arm@nongnu.org; Mon, 04 Mar 2019 10:03:22 -0500
Received: from mx1.redhat.com ([209.132.183.28]:51596)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1h0p7g-0005Ql-K9; Mon, 04 Mar 2019 10:03:20 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D1D4C85545;
	Mon,  4 Mar 2019 15:03:19 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8C4696013A;
	Mon,  4 Mar 2019 15:03:14 +0000 (UTC)
Date: Mon, 4 Mar 2019 16:03:13 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Michal Privoznik <mprivozn@redhat.com>
Message-ID: <20190304160313.5a639a9e@redhat.com>
In-Reply-To: <96d58188-65f8-6a39-4ce2-9fe88b89f228@redhat.com>
References: <1551454936-205218-1-git-send-email-imammedo@redhat.com>
	<1551454936-205218-2-git-send-email-imammedo@redhat.com>
	<20190301154947.GJ21251@redhat.com>
	<20190301183328.20b63e23@redhat.com>
	<20190301174806.GN21251@redhat.com>
	<87va0zcdse.fsf@dusky.pond.sub.org>
	<20190304101911.GE4239@redhat.com>
	<96d58188-65f8-6a39-4ce2-9fe88b89f228@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Mon, 04 Mar 2019 15:03:19 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [libvirt] [Qemu-devel] [PATCH 1/2] numa: deprecate
 'mem' parameter of '-numa node' option
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
Cc: peter.maydell@linaro.org,
	"Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
	ehabkost@redhat.com, libvir-list@redhat.com,
	qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org, pbonzini@redhat.com, "Dr.
	David Alan Gilbert" <dgilbert@redhat.com>, david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rRM/3BtTnQOT

On Mon, 4 Mar 2019 15:24:28 +0100
Michal Privoznik <mprivozn@redhat.com> wrote:

> [Thanks Igor for bringing this onto my radar. I don't follow qemu-devel=20
> that close]
>=20
> On 3/4/19 11:19 AM, Daniel P. Berrang=C3=A9 wrote:
> > On Mon, Mar 04, 2019 at 08:13:53AM +0100, Markus Armbruster wrote: =20
> >> Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:
> >> =20
> >>> On Fri, Mar 01, 2019 at 06:33:28PM +0100, Igor Mammedov wrote: =20
> >>>> On Fri, 1 Mar 2019 15:49:47 +0000
> >>>> Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
> >>>> =20
> >>>>> On Fri, Mar 01, 2019 at 04:42:15PM +0100, Igor Mammedov wrote: =20
> >>>>>> The parameter allows to configure fake NUMA topology where guest
> >>>>>> VM simulates NUMA topology but not actually getting a performance
> >>>>>> benefits from it. The same or better results could be achieved
> >>>>>> using 'memdev' parameter. In light of that any VM that uses NUMA
> >>>>>> to get its benefits should use 'memdev' and to allow transition
> >>>>>> initial RAM to device based model, deprecate 'mem' parameter as
> >>>>>> its ad-hoc partitioning of initial RAM MemoryRegion can't be
> >>>>>> translated to memdev based backend transparently to users and in
> >>>>>> compatible manner (migration wise).
> >>>>>>
> >>>>>> That will also allow to clean up a bit our numa code, leaving only
> >>>>>> 'memdev' impl. in place and several boards that use node_mem
> >>>>>> to generate FDT/ACPI description from it. =20
> >>>>>
> >>>>> Can you confirm that the  'mem' and 'memdev' parameters to -numa
> >>>>> are 100% live migration compatible in both directions ?  Libvirt
> >>>>> would need this to be the case in order to use the 'memdev' syntax
> >>>>> instead. =20
> >>>> Unfortunately they are not migration compatible in any direction,
> >>>> if it where possible to translate them to each other I'd alias 'mem'
> >>>> to 'memdev' without deprecation. The former sends over only one
> >>>> MemoryRegion to target, while the later sends over several (one per
> >>>> memdev). =20
> >>>
> >>> If we can't migration from one to the other, then we can not deprecate
> >>> the existing 'mem' syntax. Even if libvirt were to provide a config
> >>> option to let apps opt-in to the new syntax, we need to be able to
> >>> support live migration of existing running VMs indefinitely. Effectiv=
ely
> >>> this means we need the to keep 'mem' support forever, or at least such
> >>> a long time that it effectively means forever. =20
>=20
> I'm with Daniel on this. The reason why libvirt still defaults to '-numa=
=20
> node,mem=3D' is exactly because of backward compatibility. Since a machin=
e=20
> can't be migrated from '-numa node,mem=3D' to '-numa node,memdev=3D +=20
> -object memory-backend-*' libvirt hast to play it safe and chose a=20
> combination that is acessible the widest.
>=20
> If you remove this, how would you expect older machines to migrate to=20
> newer cmd line?
>=20
> I'm all for deprecating old stuff. In fact, I've suggested that in=20
> libvirt(!) here and there, but I'm afraid we can't just remove=20
> functionatlity unless we give users a way to migrate to the one we=20
> prefer now.
Agreed, it's clear now that I can't remove just 'mem' for OLD machine
types (even if this safe variant is broken and doesn't actually do
what it should). Libvirt should use 'memdev' for new VMs for them
to actually benefit from NUMA configuration.

Currently we are talking about disabling 'mem' for new machine types
only (pity that I have to keep around legacy code but at least we would
be able to move on to normal device modeling for initial memory on
new machines).

> And if libvirt doesn't follow qemu's warnings then it definitely should.=
=20
> It's a libvirt bug if it doesn't follow the best practicies (well, if can=
).
>=20
> Michal

