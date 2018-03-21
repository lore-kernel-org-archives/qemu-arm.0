Received: by 10.28.91.67 with SMTP id p64csp5064728wmb;
        Wed, 21 Mar 2018 06:26:09 -0700 (PDT)
X-Google-Smtp-Source: AG47ELu58lyis/XuAqH8TaAcRSYPNO0P59uYQvKUqpEm1iP7N1ym2ONz8m4YqFpOzllnsCR2raR8
X-Received: by 10.55.74.195 with SMTP id x186mr13270235qka.201.1521638769551;
        Wed, 21 Mar 2018 06:26:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521638769; cv=none;
        d=google.com; s=arc-20160816;
        b=nDDEzM/tALAPvFRvEJ6omU98jWO11Q70/6KnRnGeuE4p/eLE6ZWJxGsS49dySjZL+7
         AvJaikiX2tCTHIZ32nsBs7oCfbLIPen0it1jFDDKPKfC7wgrb24qEvkgBoMXcnuT6/rO
         e38rUREvDLnyNG1hhnhhf8GIFLVqp8L6LQxOhXvUGkWwtnvqJl7T1UunfxbVuaC+GPAK
         Z9bFBIwtdfL/mw99frYHUeoe2QAcxhoj5iHG8bWDkf6T3WiITYp4tI561zfMXXSkxqCu
         O0jobsioKy8yVTAPjSnS4wvRoNy2YGWOng5VadzB3LIvOtMmQOVzxwNV+ptMmDxl6t1U
         oUJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=hzAtrzaRwNZRzj68J56MPupgvRQZ328MciO9tU7xIwU=;
        b=kBX81q6b/2bstu4oQwRqmeHQHbqArlJrLgsHTwVFGNIab/8E4cylR1Qwla0GSg7rrl
         GJocQ8nPB/Yl8UZapA9SvGW08z2PtyMnhuXseNRH2m+CHgC1TJgZcjTyYg20/nX+LCEQ
         00guS+WljvVHL8LHHjeA0XwMkg1HGpIOKS8Ineimez89a6i4HWrGJMdLjBkn7AzYMWYg
         +5KdZ0G+0K/eh9YayPIfstDRw3KjgMJQwJmOeQzWmcEdhGca5iD9wfPxZJibZF37XX1b
         Mm7oxYdBMrkETNnxRF7NAuDAQRhVkJBU1ESwqBplrmAAoUCNcjAwWHV5bi8syEBmm48/
         iH0g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h12si4478915qte.21.2018.03.21.06.26.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 21 Mar 2018 06:26:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55025 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eydkn-0005Fz-2k
	for alex.bennee@linaro.org; Wed, 21 Mar 2018 09:26:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45402)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1eydjT-0004GQ-1z
	for qemu-arm@nongnu.org; Wed, 21 Mar 2018 09:24:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1eydjS-0005y0-5R
	for qemu-arm@nongnu.org; Wed, 21 Mar 2018 09:24:47 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:54290 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1eydjS-0005xf-04; Wed, 21 Mar 2018 09:24:46 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AD666402678E;
	Wed, 21 Mar 2018 13:24:41 +0000 (UTC)
Received: from redhat.com (ovpn-124-179.rdu2.redhat.com [10.10.124.179])
	by smtp.corp.redhat.com (Postfix) with SMTP id D275C2166BDA;
	Wed, 21 Mar 2018 13:24:37 +0000 (UTC)
Date: Wed, 21 Mar 2018 15:24:37 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20180321152306-mutt-send-email-mst@kernel.org>
References: <1521510562-529051-1-git-send-email-mst@redhat.com>
	<8f06e1e3-4823-d8e8-43bd-c092c523849e@vivier.eu>
	<20180320135548-mutt-send-email-mst@kernel.org>
	<459fa95d-8f0a-22fa-80fb-4af22ccf49b3@redhat.com>
	<20180321150543-mutt-send-email-mst@kernel.org>
	<7890493f-cbda-f56a-54a1-448cde871a14@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7890493f-cbda-f56a-54a1-448cde871a14@weilnetz.de>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Wed, 21 Mar 2018 13:24:42 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Wed, 21 Mar 2018 13:24:42 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'mst@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-ppc] [PATCH] qemu: include generated files
 with <> and not ""
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
	Dmitry Fleytman <dmitry.fleytman@gmail.com>, sheepdog@lists.wpkg.org,
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
	Xie Changlong <xiechanglong.d@gmail.com>,
	Riku Voipio <riku.voipio@iki.fi>, Peter Lieven <pl@kamp.de>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Yuval Shaia <yuval.shaia@oracle.com>, Greg Kurz <groug@kaod.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm@nongnu.org, Peter Chubb <peter.chubb@nicta.com.au>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Zhang Chen <zhangckid@gmail.com>, xen-devel@lists.xenproject.org,
	John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
	Kevin Wolf <kwolf@redhat.com>, kvm@vger.kernel.org,
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
X-TUID: McOWu1KKhXra

On Wed, Mar 21, 2018 at 02:15:20PM +0100, Stefan Weil wrote:
> Am 21.03.2018 um 14:08 schrieb Michael S. Tsirkin:
> > It still leaves us with a host of problems e.g. the problem of stale
> > headers in the source directory.
> 
> There have already been suggestions in the past to forbid in-tree
> builds. Would it help if configure would refuse to run from the root
> source directory? At least .gitignore could be much smaller then.
> 
> Stefan

I think I have a better idea, not relying on external tools.
Will post a proposal shortly.

-- 
MST
