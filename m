Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp8341011lff;
        Thu, 16 Jan 2020 05:06:53 -0800 (PST)
X-Google-Smtp-Source: APXvYqyzKP7a5VykXJFv9uq3NobLf0WbbNgTEyM+XDR3jdVx2hgiA5YonnoJ3KTrjTUjv5gPOa4V
X-Received: by 2002:a05:620a:992:: with SMTP id x18mr33059092qkx.327.1579180013008;
        Thu, 16 Jan 2020 05:06:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579180013; cv=none;
        d=google.com; s=arc-20160816;
        b=iqmKJ0pocwQf09UCX6RX08uV3HOBQrPJTlaJKTy15d8dv+xkXlQS4h9ehEmBfRZg0s
         2ivvT3hvRR+QvUXw0ViqGGbnTmuSZkUUj5Yt5jWrTW15FuPyxGvraiOSuKrp8k5HQxuy
         8Cibtm99c0PUuhXxi/ME9WMkoR7Jx/XY8L85kVlty8CgWjxLMb1lqEOauZNROEoz3h8M
         sh9zEUDCozqLLROksMZGbnK76pKHXut16MdMXHI+QjW/mEGCuqS+u53TkGL+2nOiQyt3
         3eO1chy8k/LS279QG/4zxn9+aoMnnTOcmgqtKt0E6TS40PVCQOfH6R0KJEv03rmxfLS7
         HD4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-disposition:content-transfer-encoding:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=tzM349piLanBIg0eCYJA/uoBwSBRKRRzfVlmnUZ1vh4=;
        b=Z0NMuqMtZUrnXombpjEJphBwsv+Zaz2QZ64W5Vdjc8tUVgtSM2zlyZ1AcFpb6XkSH0
         2w1ayeOsFUUHfAYFt8aZlFSwyefPHehO3VjaLL8V10qjLvSZFGFgFk2APXJibxo/f3Om
         4cf8oWaPHPjjllgmAykU1oyt6zGTNyqyQrHA3HrIkj3pKYbo/zwZNEWNoyq1DXfArSls
         tWbTa0Syynx1GynWSQQODrxYxz8uUKC9JZ24U13mi22NXNxUl9xuIvRuLKRJN+bgQZL8
         v4W/rQOuArWiZeUCTwIxfBrpMCHBec1yKvybaoaB+Mez4LG2AqJHPX66AAGuZz69kdNy
         7w9A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=aKEctoCQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a23si11910783qvf.173.2020.01.16.05.06.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Jan 2020 05:06:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=aKEctoCQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1is4rM-0002dn-FL
	for alex.bennee@linaro.org; Thu, 16 Jan 2020 08:06:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39489)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1is4rE-0002dJ-3Z
 for qemu-arm@nongnu.org; Thu, 16 Jan 2020 08:06:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1is4rC-0007ND-Om
 for qemu-arm@nongnu.org; Thu, 16 Jan 2020 08:06:44 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:28725
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1is4rC-0007Ml-LF
 for qemu-arm@nongnu.org; Thu, 16 Jan 2020 08:06:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579180002;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tzM349piLanBIg0eCYJA/uoBwSBRKRRzfVlmnUZ1vh4=;
 b=aKEctoCQM8n3VvRSo1xBLiQkIg7Rw0+xZoogVgasy5x5haWzwngiG+pmv9v4xVidTTH55z
 RDwdWDd83ZKmH88aliAigndIDxrHzFYkEwascSDGuTjx9z88XnSZ7hzZKbg1lI5QMUjncm
 c2yR4o0e/5ZVWn2Eif6nMK7cR1vxck4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-fjgL6zCbNeaqggc-xefzaw-1; Thu, 16 Jan 2020 08:06:38 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6EF05108C254;
 Thu, 16 Jan 2020 13:06:37 +0000 (UTC)
Received: from redhat.com (unknown [10.42.16.105])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A848610016DA;
 Thu, 16 Jan 2020 13:06:30 +0000 (UTC)
Date: Thu, 16 Jan 2020 13:06:28 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [libvirt] [PATCH v2 82/86] numa: forbid '-numa node, mem' for
 5.0 and newer machine types
Message-ID: <20200116130628.GG4611@redhat.com>
References: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
 <1579100861-73692-83-git-send-email-imammedo@redhat.com>
 <20200115153453.GL3243410@angien.pipo.sk>
 <20200115175237.325055f3@redhat.com>
 <8b9be103-d550-853a-86ff-1dc504daab64@redhat.com>
 <20200116133703.11248ead@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200116133703.11248ead@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: fjgL6zCbNeaqggc-xefzaw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: peter.maydell@linaro.org, Peter Krempa <pkrempa@redhat.com>,
 ehabkost@redhat.com, mst@redhat.com, libvir-list@redhat.com,
 Michal Privoznik <mprivozn@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, pbonzini@redhat.com,
 david@gibson.dropbear.id.au, rth@twiddle.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cK5EQjbOkQ22

On Thu, Jan 16, 2020 at 01:37:03PM +0100, Igor Mammedov wrote:
> On Thu, 16 Jan 2020 11:42:09 +0100
> Michal Privoznik <mprivozn@redhat.com> wrote:
>=20
> > On 1/15/20 5:52 PM, Igor Mammedov wrote:
> > > On Wed, 15 Jan 2020 16:34:53 +0100
> > > Peter Krempa <pkrempa@redhat.com> wrote:
> > >  =20
> > >> On Wed, Jan 15, 2020 at 16:07:37 +0100, Igor Mammedov wrote: =20
> > >>> Deprecation period is ran out and it's a time to flip the switch
> > >>> introduced by cd5ff8333a.
> > >>> Disable legacy option for new machine types and amend documentation=
.
> > >>>
> > >>> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > >>> ---
> > >>> CC: peter.maydell@linaro.org
> > >>> CC: ehabkost@redhat.com
> > >>> CC: marcel.apfelbaum@gmail.com
> > >>> CC: mst@redhat.com
> > >>> CC: pbonzini@redhat.com
> > >>> CC: rth@twiddle.net
> > >>> CC: david@gibson.dropbear.id.au
> > >>> CC: libvir-list@redhat.com
> > >>> CC: qemu-arm@nongnu.org
> > >>> CC: qemu-ppc@nongnu.org
> > >>> ---
> > >>>   hw/arm/virt.c        |  2 +-
> > >>>   hw/core/numa.c       |  6 ++++++
> > >>>   hw/i386/pc.c         |  1 -
> > >>>   hw/i386/pc_piix.c    |  1 +
> > >>>   hw/i386/pc_q35.c     |  1 +
> > >>>   hw/ppc/spapr.c       |  2 +-
> > >>>   qemu-deprecated.texi | 16 ----------------
> > >>>   qemu-options.hx      |  8 ++++----
> > >>>   8 files changed, 14 insertions(+), 23 deletions(-) =20
> > >>
> > >> I'm afraid nobody bothered to fix it yet:
> > >>
> > >> https://bugzilla.redhat.com/show_bug.cgi?id=3D1783355 =20
> > >=20
> > > It's time to start working on it :)
> > > (looks like just deprecating stuff isn't sufficient motivation,
> > > maybe actual switch flipping would work out better)
> > >  =20
> >=20
> > So how was the upgrade from older to newer version resolved? I mean, if=
=20
> > the old qemu used -numa node,mem=3DXXX and it is migrated to a host wit=
h=20
> > newer qemu, the cmd line can't be switched to -numa node,memdev=3Dnode0=
,=20
> > can it? I'm asking because I've just started working on this.
>=20
> see commit cd5ff8333a3c87 for detailed info.
> Short answer is it's not really resolved [*],
> -numa node,mem will keep working on newer QEMU but only for old machine t=
ypes
> new machine types will accept only -numa node,memdev.
>=20
> One can check if "mem=3D' is supported by using QAPI query-machines
> and checking numa-mem-supported field. That field is flipped to false
> for 5.0 and later machine types in this patch.

Since libvirt droppped the ball here, can we postpone this change
to machine types until a later release.=20


Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange=
 :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com=
 :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange=
 :|

