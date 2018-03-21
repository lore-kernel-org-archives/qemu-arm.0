Received: by 10.28.91.67 with SMTP id p64csp5258630wmb;
        Wed, 21 Mar 2018 09:22:35 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4/a0e61FXX3nF0/DbDU9Ig5OePY88ZxO3BXvEABHzxWK7B3zd512cXm3Dd9YX5V9OYEOKox
X-Received: by 10.55.19.154 with SMTP id 26mr401641qkt.172.1521649355408;
        Wed, 21 Mar 2018 09:22:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521649355; cv=none;
        d=google.com; s=arc-20160816;
        b=SG/jUkCoEE9KybH6mG/kvEQNZVdyI7qMymdyH2DKipRiHjP+0Wn4TrPwfCnWr9EE2w
         X9bE9KZ5a4NWr1PwRoMH4qBsdw2LMuVbU4tiZyxklzawR8nTzIhVigyIjJjawLc7yGBr
         WVE4hkVolYLfOm8j730U5pNYNMVeMvgNJsXBA3r/kv0iZGri2W27twLS5KHy4xHTsnnY
         WEQ7QDNysUz5oEkNAkp57/LwR5glEZQ28eq39vwcx+E1aPcC5lpZlv8bqG0V+I3sE5FU
         J7B5YPJZG7qPmilYwSJFsSbAv581o49hZv6k6Urg251JFd3L+do4wgXuE3dlNogHrK6h
         awhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=trBvevQbQFnVf3i+yCv12OIkO/vyXhDH5a/4HtnXeQc=;
        b=bqxBt7j8cm7Kvz16jXzACcbajXEBkwHQRv8D+H7oQy30VLUCx0D58yu4cOvtO4Hfcr
         dH2ZnjOmi9L9Xx6LQI7sCcLLV2EcpUU+cz1htSV+UOzL0OHb5ICduzIQkDs6BBVt3HMt
         mv/rZ/nA9wpsZ8JQkKba1TouF3k3r02HvMV0O8CQ3xZGtKUHvGpJ87vBynEFRAxt32zI
         DupxEaR4Zxg4d7g8cvFtux0pbrtFRJubZdss6shpTFkxiO+gao+QwhVwac+FQWKH4wLG
         slqfykiFLrWDyAob2kPyTzY9KtgJ+NNKeWvjasH8Q7seOSg6biq/24gRNq04vI0+1caB
         h8aQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u40si3566765qth.72.2018.03.21.09.22.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 21 Mar 2018 09:22:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56155 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eygVW-0000UO-RD
	for alex.bennee@linaro.org; Wed, 21 Mar 2018 12:22:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39144)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1eygVJ-0000TA-Ek
	for qemu-arm@nongnu.org; Wed, 21 Mar 2018 12:22:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1eygVG-0007h4-6l
	for qemu-arm@nongnu.org; Wed, 21 Mar 2018 12:22:21 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:55790 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kwolf@redhat.com>)
	id 1eygVG-0007gv-0x; Wed, 21 Mar 2018 12:22:18 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id ED98D6166F;
	Wed, 21 Mar 2018 16:22:16 +0000 (UTC)
Received: from localhost.localdomain (ovpn-117-20.ams2.redhat.com
	[10.36.117.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A194D215CDA7;
	Wed, 21 Mar 2018 16:22:04 +0000 (UTC)
Date: Wed, 21 Mar 2018 17:22:03 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20180321162203.GE3898@localhost.localdomain>
References: <1521642402-197739-1-git-send-email-mst@redhat.com>
	<20180321153439.GC3898@localhost.localdomain>
	<20180321175452-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180321175452-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Wed, 21 Mar 2018 16:22:17 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Wed, 21 Mar 2018 16:22:17 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'kwolf@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [PATCH v2] qemu: replace "" with <> in headers
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Dmitry Fleytman <dmitry.fleytman@gmail.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Li Zhijian <lizhijian@cn.fujitsu.com>,
	David Hildenbrand <david@redhat.com>, Jeff Cody <jcody@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
	BALATON Zoltan <balaton@eik.bme.hu>, Keith Busch <keith.busch@intel.com>,
	Max Filippov <jcmvbkbc@gmail.com>, Hannes Reinecke <hare@suse.com>,
	Gerd Hoffmann <kraxel@redhat.com>, Fam Zheng <famz@redhat.com>,
	Max Reitz <mreitz@redhat.com>, Eric Blake <eblake@redhat.com>,
	Josh Durgin <jdurgin@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Alberto Garcia <berto@igalia.com>,
	zhanghailiang <zhang.zhanghailiang@huawei.com>,
	Ben Warren <ben@skyportsystems.com>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Yongbok Kim <yongbok.kim@mips.com>,
	Michael Roth <mdroth@linux.vnet.ibm.com>,
	"Richard W.M. Jones" <rjones@redhat.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	=?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
	=?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Marcel Apfelbaum <marcel@redhat.com>, Liu Yuan <namei.unix@gmail.com>,
	Richard Henderson <rth@twiddle.net>,
	Andrzej Zaborowski <balrogg@gmail.com>, Jason Wang <jasowang@redhat.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>, Thomas Huth <thuth@redhat.com>,
	Alistair Francis <alistair@alistair23.me>, Jiri Pirko <jiri@resnulli.us>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Corey Minyard <minyard@acm.org>, Amit Shah <amit@kernel.org>,
	Stefan Weil <sw@weilnetz.de>, Xie Changlong <xiechanglong.d@gmail.com>,
	Riku Voipio <riku.voipio@iki.fi>, Peter Lieven <pl@kamp.de>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Yuval Shaia <yuval.shaia@oracle.com>, Greg Kurz <groug@kaod.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm@nongnu.org, Peter Chubb <peter.chubb@nicta.com.au>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Zhang Chen <zhangckid@gmail.com>, xen-devel@lists.xenproject.org,
	John Snow <jsnow@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>, kvm@vger.kernel.org,
	Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	qemu-block@nongnu.org, Hitoshi Mitake <mitake.hitoshi@lab.ntt.co.jp>,
	Markus Armbruster <armbru@redhat.com>, qemu-s390x@nongnu.org,
	Marcelo Tosatti <mtosatti@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
	Juan Quintela <quintela@redhat.com>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Michael Walle <michael@walle.cc>,
	Igor Mammedov <imammedo@redhat.com>, qemu-ppc@nongnu.org,
	Wen Congyang <wencongyang2@huawei.com>, Cornelia Huck <cohuck@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rnunkNZPoNc4

Am 21.03.2018 um 16:58 hat Michael S. Tsirkin geschrieben:
> On Wed, Mar 21, 2018 at 04:34:39PM +0100, Kevin Wolf wrote:
> > Am 21.03.2018 um 15:46 hat Michael S. Tsirkin geschrieben:
> > > Our current scheme is to use
> > >  #include ""
> > > for internal headers, and
> > >  #include <>
> > > for external ones.
> > > 
> > > Unfortunately this is not based on compiler support: from C point of
> > > view, the "" form merely looks up headers in the current directory
> > > and then falls back on <> directories.
> > > 
> > > Thus, for example, a system header trace.h - should it be present - will
> > > conflict with our local trace.h
> > 
> > You're right that there is a conflict, even though only in one
> > direction: "trace.h" is unambiguously the local trace.h in our source
> > tree, but <trace.h> refers to the same local header rather than the
> > system header as you would expect.
> > 
> > An easy way to resolve this conflict would be using -iquote rather than
> > -I for directories in the source tree, so that <trace.h> unambiguously
> > refers to the system header and "trace.h" unambiguously refers to the
> > QEMU header.
> 
> I posted patches to that effect for 2.12.

Ah, I missed those. That's good (and imho enough).

> It's all still very much a non-standard convention and so less robust
> than prefixing file name with a project-specifix prefix.

I've always had the impression that it's by far the most common
convention, to the point that I'd blindly assume it when joining a new
project.

> > > As another example of problems, a header by the same name in the source
> > > directory will always be picked up first - before any headers in
> > > the include directory.
> > > 
> > > Let's change the scheme: make sure all headers that are not
> > > in the source directory are included through a path
> > > starting with qemu/ , thus:
> > > 
> > >  #include <>
> > > 
> > > headers in the same directory as source are included with
> > > 
> > >  #include ""
> > > 
> > > as per standard.
> > > 
> > > This (untested) patch is just to start the discussion and does not
> > > change all of the codebase. If there's agreement, this will be
> > > run on all code to converting code to this scheme.
> > 
> > Renaming files is always painful. If that's the fix, the cure might be
> > worse than the disease. As far as I know, the conflict is only
> > theoretical, so in that case I'd say: If it ain't broke, don't fix it.
> > 
> > Kevin
> 
> It's broke I think, it's very hard for new people to contribute to QEMU.
> Look e.g. at rdma which all has messed up includes - and that's from an
> experienced conributor who just isn't an experienced maintainer.

I don't think the problem is that the convention is hard to apply (it's
definitely not). It's knowing about the convention. This problem isn't
going away by switching to a different, less common convention. We're
only going to see more offenders then.

> Amount of time spent on teaching new people trivia about our
> conventions just isn't funny. They should be self-documenting
> and violations should cause the build to fail.

Yes, but your proposal doesn't achieve this. You can still use
"qemu/foo.h" instead of <qemu/foo.h> and it will build successfully.
That's something we can't change, as far as I know, because the include
path for "foo.h" is always a superset of <foo.h>.

If anything, this means that we should prefer "foo.h" for local headers
(i.e. the way it currently is) because we can let the compiler enforce
it: <foo.h> for "foo.h" can become a build error, and does so with your
-iquote patch, but the other way round doesn't work.

Then it's only system headers that you can possibly get wrong, but for
those everyone should be used to using <foo.h> anyway.

Kevin
