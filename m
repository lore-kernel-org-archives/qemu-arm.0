Received: by 10.28.91.67 with SMTP id p64csp3867753wmb;
        Tue, 20 Mar 2018 06:59:25 -0700 (PDT)
X-Google-Smtp-Source: AG47ELvI7uY+DHmZjxPbP4ap+ENXEkvrNio1Oe50jGdGRJmnDBWYVUIPpUNYc79t1m7T8/uBg5CE
X-Received: by 10.55.160.139 with SMTP id j133mr24138658qke.18.1521554365412;
        Tue, 20 Mar 2018 06:59:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521554365; cv=none;
        d=google.com; s=arc-20160816;
        b=zqv55gNDQ9mgnhPGp32SEJAy1nPwHlUS8raot7pjMl11o1qyaIKKVHu76bXVhok+0L
         FwhqBF2VjTuuHrg8ZxfoRDBRg+frzSSTmY8HM5dnNgN8OL/p7ZLcWrO5tX/OELmUpYq0
         Tn1qcBTj+OaTFaCXNkq6RM7+hZcRHpeeEI47Uu/glYgjnOWWziu6A1KFr5ygCfGNGZlp
         bmQQpQZeQsVThZJDnfHtByYLC6Pbg2IWKUtWT7uz7MNddNnWjJ1uJQTL9PHap0jvcrtv
         dsjrLA9cfolFAFXCODC60iAc+eQhTMvzseu31ZWJWS5ngA70g1bk9twcghsu4TVFfrwV
         VtSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=xpOLX7Y9nt5fMo5JCT1kcVugp/f7fCn7F7ZK3KB8Gwo=;
        b=IRjfoA+C/HirmRUmUL3vL7tdE/tiHgoVZ3pu6een/QzamoMmqlwnpbbipP4VjBTX5i
         UEDWGasJPUCJcEqJcVjWneW94OWRgSYAtkyRhaQ8FTK2TNZr+p461GkKP621MUc1FGLe
         O5uRCDaYLMALtp63daFvIeSQLG1VTYItQZe5HMvHZpATf7mvagI5rx+G1NPkFVTEfCXE
         PoMoA169ANAhZ4vA9zi0Fp2378MLu7YD5s8VK5jJQMHTLTflHCiwtraR2ZjPx5wh2T+6
         uPAAt3KPDfKlU9ErHtrykaF+35exn+SjAMWzQHNKC5v4q+l1+GOgFtVpUX+Thp5+bbjt
         iTEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m124si2891393qkc.56.2018.03.20.06.59.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Mar 2018 06:59:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48938 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eyHnQ-0006Vy-PY
	for alex.bennee@linaro.org; Tue, 20 Mar 2018 09:59:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57267)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1eyHLQ-0002bE-HQ
	for qemu-arm@nongnu.org; Tue, 20 Mar 2018 09:30:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1eyHLP-00026w-EM
	for qemu-arm@nongnu.org; Tue, 20 Mar 2018 09:30:28 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:40926 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1eyHLP-00026a-7h; Tue, 20 Mar 2018 09:30:27 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DAE584079F2B;
	Tue, 20 Mar 2018 13:30:22 +0000 (UTC)
Received: from redhat.com (ovpn-121-0.rdu2.redhat.com [10.10.121.0])
	by smtp.corp.redhat.com (Postfix) with SMTP id BF0A0202322F;
	Tue, 20 Mar 2018 13:30:15 +0000 (UTC)
Date: Tue, 20 Mar 2018 15:30:15 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Message-ID: <20180320152446-mutt-send-email-mst@kernel.org>
References: <1521510562-529051-1-git-send-email-mst@redhat.com>
	<20180320131041.GB24329@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180320131041.GB24329@stefanha-x1.localdomain>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Tue, 20 Mar 2018 13:30:23 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Tue, 20 Mar 2018 13:30:23 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'mst@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
X-Mailman-Approved-At: Tue, 20 Mar 2018 09:59:16 -0400
Subject: Re: [Qemu-arm] [Qemu-block] [PATCH] qemu: include generated files
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
	David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-devel@nongnu.org, Alexander Graf <agraf@suse.de>,
	BALATON Zoltan <balaton@eik.bme.hu>, Keith Busch <keith.busch@intel.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Gerd Hoffmann <kraxel@redhat.com>, Max Reitz <mreitz@redhat.com>,
	Yongbok Kim <yongbok.kim@mips.com>, Hannes Reinecke <hare@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	zhanghailiang <zhang.zhanghailiang@huawei.com>,
	Ben Warren <ben@skyportsystems.com>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Michael Roth <mdroth@linux.vnet.ibm.com>,
	"Richard W.M. Jones" <rjones@redhat.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	=?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
	=?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Marcel Apfelbaum <marcel@redhat.com>, Liu Yuan <namei.unix@gmail.com>,
	Richard Henderson <rth@twiddle.net>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Juan Quintela <quintela@redhat.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Alistair Francis <alistair@alistair23.me>, Jiri Pirko <jiri@resnulli.us>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Corey Minyard <minyard@acm.org>, Amit Shah <amit@kernel.org>,
	Stefan Weil <sw@weilnetz.de>, Xie Changlong <xiechanglong.d@gmail.com>,
	Riku Voipio <riku.voipio@iki.fi>, Peter Lieven <pl@kamp.de>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Fabien Chouteau <chouteau@adacore.com>, Greg Kurz <groug@kaod.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm@nongnu.org, Peter Chubb <peter.chubb@nicta.com.au>,
	Yuval Shaia <yuval.shaia@oracle.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Zhang Chen <zhangckid@gmail.com>, xen-devel@lists.xenproject.org,
	Fam Zheng <famz@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
	Kevin Wolf <kwolf@redhat.com>, kvm@vger.kernel.org,
	Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	qemu-block@nongnu.org, Hitoshi Mitake <mitake.hitoshi@lab.ntt.co.jp>,
	Markus Armbruster <armbru@redhat.com>, qemu-s390x@nongnu.org,
	Marcelo Tosatti <mtosatti@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Michael Walle <michael@walle.cc>,
	Igor Mammedov <imammedo@redhat.com>, qemu-ppc@nongnu.org,
	Wen Congyang <wencongyang2@huawei.com>, Cornelia Huck <cohuck@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iG0AtiX8B2GE

On Tue, Mar 20, 2018 at 01:10:41PM +0000, Stefan Hajnoczi wrote:
> On Tue, Mar 20, 2018 at 03:54:36AM +0200, Michael S. Tsirkin wrote:
> > QEMU coding style at the moment asks for all non-system
> > include files to be used with #include "foo.h".
> > However this rule actually does not make sense and
> > creates issues for when the included file is generated.
> > 
> > In C, include "file" means look in current directory,
> > then on include search path. Current directory here
> > means the source file directory.
> > By comparison include <file> means look on include search path.
> > 
> > As generated files are not in the search directory (unless the build
> > directory happens to match the source directory), it does not make sense
> > to include them with "" - doing so is merely more work for preprocessor
> > and a source or errors if a stale file happens to exist in the source
> > directory.
> > 
> > This changes include directives for all generated files, across the
> > tree. The idea is to avoid sending a huge amount of email.  But when
> > merging, the changes will be split with one commit per file, e.g. for
> > ease of bisect in case of build failures, and to ease merging.
> > 
> > Note that should some generated files be missed by this tree-wide
> > refactoring, it isn't a big deal - this merely maintains the status quo,
> > and this can be addressed by a separate patch on top.
> 
> Stale header files are a pain.  I often do make distclean before
> checking out a radically different QEMU version to avoid the problem.
> 
> This patch trades off the stale header file issue for a new approach to
> using <> vs "", which will be hard to use consistently

The proposed rule is to use <> everywhere except if the file is in the
source directory.  It will be very easy to use consistently for the
simple reason that compiler will enforce it.  If you use <> for a header
in the current directory build fails. So you are forced to use "".

> in the future
> since it is unconventional.

All compilers I know without exception implement
include <> meaning look in -I search path, and
include "" meaning look in current directory then
in -I search path.

Looks conventional to me.

> Is the build time improvement worth it (please post numbers)?
> 
> Stefan

Haven't tested it frankly. Will it convince anyone if it's marginally
faster?

-- 
MST
