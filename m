Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp5380902lff;
        Tue, 14 Jan 2020 03:27:01 -0800 (PST)
X-Google-Smtp-Source: APXvYqxo4od98U/V2BtOM8N+ApvZkb4Y1PolTN/MJo3exRHEdugqp45rSdBN9SmCHzQiG7SJHamy
X-Received: by 2002:aa7:c2d3:: with SMTP id m19mr23283267edp.136.1579001221172;
        Tue, 14 Jan 2020 03:27:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579001221; cv=none;
        d=google.com; s=arc-20160816;
        b=NWzGkUGnObIWFJxbilXjB94rDEstfuIOH1Kf1g9AZeoN83HAAocUSOcv7xTwE65Nnq
         hLtp+jPbG3KokfUj8aV/I42XYLSfdKaPnrqRpfzOSlkA16tPqOIQW/BNSB3XststtlCe
         dHuGwjYx8RpULpEJizn98HhYzqW73qoKq3HqSY01WNcztahRKuXtWLZvshyTj874PH9x
         uGsSwzH4Kk8SQlMs2hOSAg5OXhvyj3qFvALL+ABBdSGcNTa09/nfQR+KLqfWZr5TXnc8
         D1frMNcbwk4oOup7jwyyRFNJ9aVM5SZZL0m/TzbOcwDWwuyc5natxzO+BsKgPo91aWPU
         IxHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-disposition:content-transfer-encoding:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=lzblGynO8njBoY9XqYLz5uI14FqX8lgrqCV7DzZofeY=;
        b=aH0l8YOUpykEnwyjquTrH2PwGAgArVARRPHUYkoKfoAKFksK0nrWXNms5bsmfd1oZd
         u4IxiEwJNhA8wMfGtnEVCqwQL7heOBhTQ+NJFtkIeSHqqN8T+48j3JMncnvENNFlwoG1
         yZR+I94l0mSOy2iZCpr/i1phxcRQIluRELrl2B7mqErBkKuS0XKEHeLRTPa3bVQ7EIAM
         Z1Ne1wZYvpCVdfNw2sNKdIny2Z2GyWwRoWS6NeQA8E/DUOOrXIo0hFNB9mfG7uzEGY+U
         7K8SxKIa9x4aG1a3KC9Mwk3fT8xKaBnL5IFHPFAr+YjXV3lzrarFX4Wzs7zEmWwp97Hs
         QRIw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=b0bqt0Ti;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dj27si10417696edb.81.2020.01.14.03.27.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Jan 2020 03:27:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=b0bqt0Ti;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1irKLb-0005U1-JZ
	for alex.bennee@linaro.org; Tue, 14 Jan 2020 06:26:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52838)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1irKLE-0005Nc-7O
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 06:26:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1irKLA-0006Qh-RH
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 06:26:36 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:56694
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1irKLA-0006Qb-N6
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 06:26:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579001192;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lzblGynO8njBoY9XqYLz5uI14FqX8lgrqCV7DzZofeY=;
 b=b0bqt0Ti3WpXyq8/OLuAcAcOQnxRLjSQE0e6QfF9wMHGVaSZQR/6o+C4COJ9vQYwjNUfKy
 9C5EgEVWeUss25dfnubUDd5v2rXQ0n0Qkhh2ir3+N9H5+wKxRf4IrfqbZ/Jlgc3JG9GXvS
 Xw49tPlrnIICRIsrwurLWHNALfTIY74=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-38-93XbAf2FNtWL1Gj61S6BSQ-1; Tue, 14 Jan 2020 06:26:17 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3693C801E6C;
 Tue, 14 Jan 2020 11:26:15 +0000 (UTC)
Received: from redhat.com (ovpn-112-42.ams2.redhat.com [10.36.112.42])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DACED5DA32;
 Tue, 14 Jan 2020 11:26:05 +0000 (UTC)
Date: Tue, 14 Jan 2020 11:26:02 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Subject: Re: [PULL 00/29] Migration pull patches (second try)
Message-ID: <20200114112602.GJ4071034@redhat.com>
References: <20200114092606.1761-1-quintela@redhat.com>
 <CAFEAcA-7aLrp4n9gtD=0MzmMDpzNyJCUpOmY2XPxNOun5MKeGA@mail.gmail.com>
 <875zhewae5.fsf@secure.laptop>
MIME-Version: 1.0
In-Reply-To: <875zhewae5.fsf@secure.laptop>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: 93XbAf2FNtWL1Gj61S6BSQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Corey Minyard <cminyard@mvista.com>,
 Stefan Weil <sw@weilnetz.de>, Jason Wang <jasowang@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 qemu-ppc <qemu-ppc@nongnu.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Andrzej Zaborowski <balrogg@gmail.com>, Richard Henderson <rth@twiddle.net>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MzOybT26JI3Y

On Tue, Jan 14, 2020 at 12:22:10PM +0100, Juan Quintela wrote:
> Peter Maydell <peter.maydell@linaro.org> wrote:
> > On Tue, 14 Jan 2020 at 09:26, Juan Quintela <quintela@redhat.com> wrote=
:
> >>
> >> The following changes since commit 3c8a6575985b1652b45bfa670b5e1907d64=
2cfa0:
> >>
> >>   Merge remote-tracking branch
> >> 'remotes/kraxel/tags/usb-20200113-pull-request' into staging
> >> (2020-01-13 14:19:57 +0000)
> >>
> >> are available in the Git repository at:
> >>
> >>   https://github.com/juanquintela/qemu.git tags/migration-pull-pull-re=
quest
> >>
> >> for you to fetch changes up to 4eafab585c091050b5ae63130f46fe46ac919c3=
a:
> >>
> >>   migration: Support QLIST migration (2020-01-14 10:17:12 +0100)
> >>
> >> ----------------------------------------------------------------
> >> Migration pull request
> >> - updated QList patch
> >> - initialize local msg variable
> >>
> >> ----------------------------------------------------------------
> >
> > Still fails on hosts where ram_addr_t is 32 bits.
> > Looks like you still haven't got the fix for the problem
> > Dan pointed out where multifd_save_setup() is using the
> > wrong type when it calculates p->packetlen to allocate the
> > data structure.
>=20
> Ouch.  Then there is "yet" another different problem. I fixed the one
> that daniel pointed.

Err, no you only fixed one of the two bugs I pointed out (for a second
time)

Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange=
 :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com=
 :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange=
 :|

