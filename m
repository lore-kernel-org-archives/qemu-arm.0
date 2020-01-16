Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp8401220lff;
        Thu, 16 Jan 2020 05:58:55 -0800 (PST)
X-Google-Smtp-Source: APXvYqwcY5wMIecAuS/UJqGcuv4mZL9VOevjsQlc3EAPAzCwFG92NxZKoSLcZ8HA+dWLycrwtVTG
X-Received: by 2002:aa7:c656:: with SMTP id z22mr32297117edr.352.1579183135420;
        Thu, 16 Jan 2020 05:58:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579183135; cv=none;
        d=google.com; s=arc-20160816;
        b=RHg4USkTpXcu4Olvlkd8/7AP5A9qfKcKo8KQQjB2T1D94B22F5ZWYNtGBttXJU13kb
         4cNf9Jn/pN7A9OMQzO6xZvEOXhiYfb8MUgqTCw5wDsizjXlSq/whrAnI3n5R8Y6NjiIz
         BHDCXevT38OCHB/NJWMLCmbUd+erkM+L0EPzazYihBL1jbJMxJ8ovlorIut2cHl3oQQr
         ukmReZvvbOxjkj2nd+QdbhBfBhPGiBpG7AERmhf7CAgz3cMtCbaaf1cqG+N45m/TW3Bg
         pebZI3SvEOtBwaHvfFkoFVpdpaVhNNGIAVDrl1mkomU7MTJgtw95I0FYMeQEUKCQIJlE
         Iyeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=PeSOentjljhzRjdi7pvzGbsn7/hJfHM/qOL6BePZdCE=;
        b=wcD7jjCLaMyuYKckHkBCnf9spWvc6JJo5aKUn4HnyDDCokEPZtSzmSgVONIrDmDoBt
         HWDdTEgkoJ+yxxgXGtX6bQ/Px0Ra9eUiqDPvkx0tWUoqQnAYTsutyQmL+QuQk+n9w+ZX
         LOuS7CebcWirw3Dz0gQ7jC/EEig6AM3zbvJOnMUnqdLSKi2XxZWbtbIcfFAzgRsDKW3I
         ElnMjvBxQoPZl/+mPbMn2lQz6PJgbvmTyD75AStsrNpMDvi7bxPWkwS5BqpAkw50RW4/
         vcBsPhvQKIqsVdNDuyIW0A4HUMS4ceMEXrz2gfO3aipYckk4EAmdtOXXvBaUoG/m4E2Q
         TGEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=C50Bhi4N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cm23si14615396edb.452.2020.01.16.05.58.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Jan 2020 05:58:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=C50Bhi4N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1is5fi-0002F2-6r
	for alex.bennee@linaro.org; Thu, 16 Jan 2020 08:58:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46777)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1is5fS-0002DM-PI
 for qemu-arm@nongnu.org; Thu, 16 Jan 2020 08:58:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1is5fP-0003yp-CE
 for qemu-arm@nongnu.org; Thu, 16 Jan 2020 08:58:38 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:42144
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1is5fP-0003wT-92
 for qemu-arm@nongnu.org; Thu, 16 Jan 2020 08:58:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579183114;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PeSOentjljhzRjdi7pvzGbsn7/hJfHM/qOL6BePZdCE=;
 b=C50Bhi4NOKK70I+ixx013bP2GmBlkQ9siljtHoNxZEnx837ThmauxdOvx8jqNSfxZQgSWz
 ziA+U7QivaM1/KP6a+iwvAqagh6p9r9a1KDc+vPslJScqpBOX0NULiarHSiCRmiAdW7vwL
 gbL/oiT0r75MmClhnh9qSzJSua/gS34=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-318-B_2t5xvJO5KrEgZkVqZZQA-1; Thu, 16 Jan 2020 08:58:31 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DF7D918AA2B3;
 Thu, 16 Jan 2020 13:58:29 +0000 (UTC)
Received: from localhost (unknown [10.43.2.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2159A8BE08;
 Thu, 16 Jan 2020 13:58:16 +0000 (UTC)
Date: Thu, 16 Jan 2020 14:58:15 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>
Subject: Re: [libvirt] [PATCH v2 82/86] numa: forbid '-numa node, mem' for
 5.0 and newer machine types
Message-ID: <20200116145815.41ce8915@redhat.com>
In-Reply-To: <20200116130628.GG4611@redhat.com>
References: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
 <1579100861-73692-83-git-send-email-imammedo@redhat.com>
 <20200115153453.GL3243410@angien.pipo.sk>
 <20200115175237.325055f3@redhat.com>
 <8b9be103-d550-853a-86ff-1dc504daab64@redhat.com>
 <20200116133703.11248ead@redhat.com>
 <20200116130628.GG4611@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: B_2t5xvJO5KrEgZkVqZZQA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, Peter Krempa <pkrempa@redhat.com>,
 ehabkost@redhat.com, mst@redhat.com, libvir-list@redhat.com,
 Michal Privoznik <mprivozn@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, pbonzini@redhat.com,
 david@gibson.dropbear.id.au, rth@twiddle.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 06Ovt+fmXd/q

On Thu, 16 Jan 2020 13:06:28 +0000
Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:

> On Thu, Jan 16, 2020 at 01:37:03PM +0100, Igor Mammedov wrote:
> > On Thu, 16 Jan 2020 11:42:09 +0100
> > Michal Privoznik <mprivozn@redhat.com> wrote:
> >  =20
> > > On 1/15/20 5:52 PM, Igor Mammedov wrote: =20
> > > > On Wed, 15 Jan 2020 16:34:53 +0100
> > > > Peter Krempa <pkrempa@redhat.com> wrote:
> > > >    =20
> > > >> On Wed, Jan 15, 2020 at 16:07:37 +0100, Igor Mammedov wrote:   =20
> > > >>> Deprecation period is ran out and it's a time to flip the switch
> > > >>> introduced by cd5ff8333a.
> > > >>> Disable legacy option for new machine types and amend documentati=
on.
> > > >>>
> > > >>> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > > >>> ---
> > > >>> CC: peter.maydell@linaro.org
> > > >>> CC: ehabkost@redhat.com
> > > >>> CC: marcel.apfelbaum@gmail.com
> > > >>> CC: mst@redhat.com
> > > >>> CC: pbonzini@redhat.com
> > > >>> CC: rth@twiddle.net
> > > >>> CC: david@gibson.dropbear.id.au
> > > >>> CC: libvir-list@redhat.com
> > > >>> CC: qemu-arm@nongnu.org
> > > >>> CC: qemu-ppc@nongnu.org
> > > >>> ---
> > > >>>   hw/arm/virt.c        |  2 +-
> > > >>>   hw/core/numa.c       |  6 ++++++
> > > >>>   hw/i386/pc.c         |  1 -
> > > >>>   hw/i386/pc_piix.c    |  1 +
> > > >>>   hw/i386/pc_q35.c     |  1 +
> > > >>>   hw/ppc/spapr.c       |  2 +-
> > > >>>   qemu-deprecated.texi | 16 ----------------
> > > >>>   qemu-options.hx      |  8 ++++----
> > > >>>   8 files changed, 14 insertions(+), 23 deletions(-)   =20
> > > >>
> > > >> I'm afraid nobody bothered to fix it yet:
> > > >>
> > > >> https://bugzilla.redhat.com/show_bug.cgi?id=3D1783355   =20
> > > >=20
> > > > It's time to start working on it :)
> > > > (looks like just deprecating stuff isn't sufficient motivation,
> > > > maybe actual switch flipping would work out better)
> > > >    =20
> > >=20
> > > So how was the upgrade from older to newer version resolved? I mean, =
if=20
> > > the old qemu used -numa node,mem=3DXXX and it is migrated to a host w=
ith=20
> > > newer qemu, the cmd line can't be switched to -numa node,memdev=3Dnod=
e0,=20
> > > can it? I'm asking because I've just started working on this. =20
> >=20
> > see commit cd5ff8333a3c87 for detailed info.
> > Short answer is it's not really resolved [*],
> > -numa node,mem will keep working on newer QEMU but only for old machine=
 types
> > new machine types will accept only -numa node,memdev.
> >=20
> > One can check if "mem=3D' is supported by using QAPI query-machines
> > and checking numa-mem-supported field. That field is flipped to false
> > for 5.0 and later machine types in this patch. =20
>=20
> Since libvirt droppped the ball here, can we postpone this change
> to machine types until a later release.=20

Looks like we have to at this point.
We can do this for [82-86/86] patches which are mostly numa
related changes.

The rest could go in this release as it is in-depended of
numa, it mainly introduces memdev backend for main RAM
and consolidates twisted main RAM allocation logic.

>=20
> Regards,
> Daniel

