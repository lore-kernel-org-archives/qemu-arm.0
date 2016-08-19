Received: by 10.25.21.156 with SMTP id 28csp360670lfv;
        Fri, 19 Aug 2016 07:19:45 -0700 (PDT)
X-Received: by 10.55.48.145 with SMTP id w139mr9134431qkw.142.1471616385452;
        Fri, 19 Aug 2016 07:19:45 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u65si4688776qkl.88.2016.08.19.07.19.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 Aug 2016 07:19:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57510 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bake8-0002T3-S8
	for alex.bennee@linaro.org; Fri, 19 Aug 2016 10:19:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41943)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1bake4-0002Sy-OQ
	for qemu-arm@nongnu.org; Fri, 19 Aug 2016 10:19:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1bake0-0007k6-GG
	for qemu-arm@nongnu.org; Fri, 19 Aug 2016 10:19:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55318)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>)
	id 1bake0-0007jw-Al; Fri, 19 Aug 2016 10:19:36 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9FD14C056819;
	Fri, 19 Aug 2016 14:19:35 +0000 (UTC)
Received: from work-vm (ovpn-116-88.ams2.redhat.com [10.36.116.88])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u7JEJVTA030826
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Fri, 19 Aug 2016 10:19:33 -0400
Date: Fri, 19 Aug 2016 15:19:30 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20160819141930.GE2004@work-vm>
References: <1471609852-23250-1-git-send-email-marcin.krzeminski@nokia.com>
	<CAFEAcA-m6B_S7zYRE0iqbL+sR8ieJweeVDHqxgx1JB+mGywo3w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA-m6B_S7zYRE0iqbL+sR8ieJweeVDHqxgx1JB+mGywo3w@mail.gmail.com>
User-Agent: Mutt/1.6.2 (2016-07-01)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Fri, 19 Aug 2016 14:19:35 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH] block: m25p80c Fix vmstate structure name
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
Cc: Andrew Jones <drjones@redhat.com>, "Krzeminski,
	Marcin \(Nokia - PL/Wroclaw\)" <marcin.krzeminski@nokia.com>,
	Juan Quintela <quintela@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, Amit Shah <amit.shah@redhat.com>,
	rfsw-patches@mlist.nokia.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BZDOCbydoFaY

* Peter Maydell (peter.maydell@linaro.org) wrote:
> On 19 August 2016 at 13:30,  <marcin.krzeminski@nokia.com> wrote:
> > From: Marcin Krzeminski <marcin.krzeminski@nokia.com>
> >
> > Change wrong name of the vmstate structure. Since this breaks
> > compatibility update version and fields to 0.
> >
> > Signed-off-by: Marcin Krzeminski <marcin.krzeminski@nokia.com>
> > ---
> >
> > This patch assumes that none migrates m25p80 flash devices.
> >
> >  hw/block/m25p80.c | 29 ++++++++++++++---------------
> >  1 file changed, 14 insertions(+), 15 deletions(-)
> >
> > diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> > index 9828ee6..d29ff4c 100644
> > --- a/hw/block/m25p80.c
> > +++ b/hw/block/m25p80.c
> > @@ -1189,9 +1189,9 @@ static Property m25p80_properties[] = {
> >  };
> >
> >  static const VMStateDescription vmstate_m25p80 = {
> > -    .name = "xilinx_spi",
> > -    .version_id = 3,
> > -    .minimum_version_id = 1,
> > +    .name = "m25p80",
> > +    .version_id = 0,
> > +    .minimum_version_id = 0,
> >      .pre_save = m25p80_pre_save,
> 
> Are you sure that the name is part of the on-the-wire state?
> I thought it wasn't, in which case this doesn't even need a
> version bump, much less a version-reset-to-zero. But I could
> be wrong. David, Juan, Amit?
> 

Yep, it does:

000a9000: 00 1c 04 00 00 00 1d 0a 78 69 6c 69 6e 78 5f 73  ........xilinx_s
000a9010: 70 69 00 00 00 00 00 00 00 03 00 00 00 00 00 00  pi..............

that's from:
./arm-softmmu/qemu-system-arm -M tosa -device at26f004 -S -nographic
QEMU 2.6.90 monitor - type 'help' for more information
(qemu) migrate "exec:xxd -g 1 > tosa.mig"

it's not essential to redo the version_id's, but it's as good a time as any
to get rid of the old version code if you've just broken the compatibility
anyway.

Dave

> thanks
> -- PMM
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
