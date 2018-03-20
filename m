Received: by 10.28.91.67 with SMTP id p64csp4049427wmb;
        Tue, 20 Mar 2018 09:41:58 -0700 (PDT)
X-Google-Smtp-Source: AG47ELtfs3tt6biPttu1OlbrmJad8cxPGUUOTOV4ehtRuBOnHdsJLq6ckZCl5dL3N4ZlNulvNW/m
X-Received: by 10.55.87.6 with SMTP id l6mr22594987qkb.261.1521564117886;
        Tue, 20 Mar 2018 09:41:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521564117; cv=none;
        d=google.com; s=arc-20160816;
        b=QyuRrisS6QOl5IFNmreP+AsS33VaONqEKi1Y7Js4qVqSxxOZkGxwo/m2ZFJ4NBxtgz
         qAdXdX4uojBsPbqHWUDbr0ZTEtD4AqrL+HQtB0s11zYQPNrKrFfo5wEQIeEADH8qjpgn
         i+zHtb54mYLm/f/DJ0m7iiuBBY5tl1Z1NBzB1NQXc9h6eu4SotBD5TR9yIorbBWgHvhY
         QWpzYuurb00w4PzISKGPRhE0cw5xGuMxkI3B7lXmpgY+sWMr+E75jaJRZ6/zX2qXWwmM
         ycScoC3E8hWotqCldh3W1NtfP/taHsT5MKim/Adtq3xkVKcyAhxcijwrCWHqO2tBN2hq
         I/CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject:user-agent
         :in-reply-to:content-disposition:mime-version:references:message-id
         :to:from:date:arc-authentication-results;
        bh=YFMYElx04pML2nfUEVFHFgbYtVmnqf2kgXAVTTc6I9U=;
        b=EY4C4MKGxvPNtBYZGp0jEOTn05MCBlXI3xd9i3kAQ5Np4FV+hvzWvpWKd9gjo8Iu5M
         Uv8ir2A6ma9NOUDQpDxu33EjbRgU5dZL6Y0lZ1DJGXItnVY9mvoOdp1sp3hkkvDM2OKp
         xN4HM5BCCifgH6XIlcZJgWYKxEF1AdUwFpUy6IX04epshtwMBWGJqEgyh/FaL8OI4Ulb
         NIcDAQhQfbphCspLZqTO1+CyJe12EVZ3c2uIF1lh2PXvxl3pOQJ+mua6Q5lZpJZyfCfO
         so46TA6/k8Qef1rJNvS9ufpygFW3GUKQka2o5EK11F2j78bWlBClwQAruEW7kIR30AXk
         S5xQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 63si534029qth.453.2018.03.20.09.41.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Mar 2018 09:41:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50611 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eyKKj-00073m-AJ
	for alex.bennee@linaro.org; Tue, 20 Mar 2018 12:41:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36695)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1eyKKY-00071w-6A
	for qemu-arm@nongnu.org; Tue, 20 Mar 2018 12:41:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1eyKKU-0006h6-CO
	for qemu-arm@nongnu.org; Tue, 20 Mar 2018 12:41:46 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:37942 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>)
	id 1eyKKU-0006fh-5Y; Tue, 20 Mar 2018 12:41:42 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C0FA44075392;
	Tue, 20 Mar 2018 16:41:30 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F292710B0F4D;
	Tue, 20 Mar 2018 16:40:50 +0000 (UTC)
Date: Tue, 20 Mar 2018 16:40:48 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Eric Blake <eblake@redhat.com>
Message-ID: <20180320164048.GB4530@redhat.com>
References: <1521510562-529051-1-git-send-email-mst@redhat.com>
	<da3457a0-7f24-4759-7d98-9b2fdc87e87c@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <da3457a0-7f24-4759-7d98-9b2fdc87e87c@redhat.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Tue, 20 Mar 2018 16:41:31 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Tue, 20 Mar 2018 16:41:31 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'berrange@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [PATCH] qemu: include generated files with <> and
 not ""
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Dmitry Fleytman <dmitry.fleytman@gmail.com>, sheepdog@lists.wpkg.org,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Li Zhijian <lizhijian@cn.fujitsu.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jeff Cody <jcody@redhat.com>, Zhang Chen <zhangckid@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-devel@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>,
	Keith Busch <keith.busch@intel.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Gerd Hoffmann <kraxel@redhat.com>, Jiri Pirko <jiri@resnulli.us>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Yongbok Kim <yongbok.kim@mips.com>,
	Michael Roth <mdroth@linux.vnet.ibm.com>,
	Marcelo Tosatti <mtosatti@redhat.com>, Josh Durgin <jdurgin@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Alberto Garcia <berto@igalia.com>,
	zhanghailiang <zhang.zhanghailiang@huawei.com>,
	Ben Warren <ben@skyportsystems.com>, Marcel Apfelbaum <marcel@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>, kvm@vger.kernel.org,
	=?utf-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Liu Yuan <namei.unix@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Andrzej Zaborowski <balrogg@gmail.com>, Jason Wang <jasowang@redhat.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Riku Voipio <riku.voipio@iki.fi>, Fam Zheng <famz@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Corey Minyard <minyard@acm.org>, Amit Shah <amit@kernel.org>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Stefan Weil <sw@weilnetz.de>,
	Xie Changlong <xiechanglong.d@gmail.com>,
	Alistair Francis <alistair@alistair23.me>, Peter Lieven <pl@kamp.de>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Fabien Chouteau <chouteau@adacore.com>, Greg Kurz <groug@kaod.org>,
	=?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm@nongnu.org, Peter Chubb <peter.chubb@nicta.com.au>,
	Yuval Shaia <yuval.shaia@oracle.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	xen-devel@lists.xenproject.org, John Snow <jsnow@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	Kevin Wolf <kwolf@redhat.com>, Alexander Graf <agraf@suse.de>,
	qemu-block@nongnu.org, Hitoshi Mitake <mitake.hitoshi@lab.ntt.co.jp>,
	Wen Congyang <wencongyang2@huawei.com>, qemu-s390x@nongnu.org,
	Cornelia Huck <cohuck@redhat.com>,
	"Richard W.M. Jones" <rjones@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	Max Reitz <mreitz@redhat.com>, Michael Walle <michael@walle.cc>,
	qemu-ppc@nongnu.org, Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
	Igor Mammedov <imammedo@redhat.com>, Hannes Reinecke <hare@suse.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NUgwwcmIDIcK

On Tue, Mar 20, 2018 at 11:12:00AM -0500, Eric Blake wrote:
> On 03/19/2018 08:54 PM, Michael S. Tsirkin wrote:
> > QEMU coding style at the moment asks for all non-system
> > include files to be used with #include "foo.h".
> 
> [I'm replying without having read the rest of the thread, so bear with me if
> I repeat some of the other comments that have already been made]
> 
> And Markus even just did a cleanup along those lines.
> 
> > However this rule actually does not make sense and
> > creates issues for when the included file is generated.
> > 
> > In C, include "file" means look in current directory,
> > then on include search path. Current directory here
> > means the source file directory.
> > By comparison include <file> means look on include search path.
> 
> It's also nice when "file" means file belonging to our project, and <file>
> means 3rd-party file.  So we have to choose which semantics are easier;
> perhaps better Makefile rules that prevent us from seeing stale files is a
> better solution than figuring out which files are generated.

That's what I've attempted here:

  https://lists.gnu.org/archive/html/qemu-devel/2018-03/msg05421.html


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
