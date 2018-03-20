Received: by 10.28.91.67 with SMTP id p64csp3867847wmb;
        Tue, 20 Mar 2018 06:59:30 -0700 (PDT)
X-Google-Smtp-Source: AG47ELsh/Voy392WLW/SRbjaEcuRbo1i08iC6havWyaLhxcN1nX/Lwgupec696E+YK8G/bG3ZtJq
X-Received: by 10.55.107.65 with SMTP id g62mr24137578qkc.102.1521554370600;
        Tue, 20 Mar 2018 06:59:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521554370; cv=none;
        d=google.com; s=arc-20160816;
        b=u0xnEzWSfKADiz3lSgItaviM4Wbyp8kmKCC97eQaA0dFgul4snvlUI+6YJB44CuhWO
         pHfYHYBnZxuPAgZxMk+R3+MNy+r5uOvhMv3ZtW0F25WobBYeuwzHpysxZDdgpqHy7pXk
         8ajkZx5MFAaZqf4zNIzmH7kWu5xArEh5XATJP5CkbfSuT15n77GKFMp7YArwkGTR7PiF
         CdF4KoG8BnR7Ak66mZPOZXnfeOSOImMQCKwJbmIIgX0TisbcRDpSVHAt85ByUtPO6fk8
         x2ajmtUgsKLQhWBNJZywlgSBOhNnrHezXQSfFdxPS16Dqelv1wMUGBxBz7oNRPgIoZlw
         7RHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=DSKqFDK0Xbow7EH4ertxCT9aKQ7ZVSeLylCT80zK7LQ=;
        b=hX3wjursVTRyKPi6p3c3KyzLg+G+AEpl4Uueg1UMi4rzBxhBTDpadJcVRcAXFq3EJk
         YqpnUReRUkI3bLBTr6kBB7i9MEzsrc0oeQSSvI2lHKY28yZjQQG1CvnqUTZ3y6DN8DrY
         RwaZgT2lxIp7FOvBJyJwaUMudjJFB17DiAPGoXExHXyzas7eeXInXz2YKQNYW2b889aZ
         Zo0OYLfCCBYqudURhLBtYFowNrwrFgRz5FN9s0E9JeZciS6w0QdzD+Msuwzo1pbmMdt6
         Bbkk8BWMGrN+ey9+gL5wdg0mXPG6u7zG18TuOoJDeBlnHEcYCyRK+pDFkKGFaUSqRlGD
         IHAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w36si2058578qta.192.2018.03.20.06.59.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Mar 2018 06:59:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48939 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eyHnW-0006YM-44
	for alex.bennee@linaro.org; Tue, 20 Mar 2018 09:59:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37467)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1eyHic-0004Vr-IB
	for qemu-arm@nongnu.org; Tue, 20 Mar 2018 09:54:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1eyHiZ-0003tj-CN
	for qemu-arm@nongnu.org; Tue, 20 Mar 2018 09:54:26 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:59310 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1eyHiZ-0003sy-6R; Tue, 20 Mar 2018 09:54:23 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CE9F6406F8BE;
	Tue, 20 Mar 2018 13:54:18 +0000 (UTC)
Received: from redhat.com (ovpn-125-54.rdu2.redhat.com [10.10.125.54])
	by smtp.corp.redhat.com (Postfix) with SMTP id 6C0F210AF9E7;
	Tue, 20 Mar 2018 13:53:51 +0000 (UTC)
Date: Tue, 20 Mar 2018 15:53:51 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Message-ID: <20180320155042-mutt-send-email-mst@kernel.org>
References: <1521510562-529051-1-git-send-email-mst@redhat.com>
	<8f06e1e3-4823-d8e8-43bd-c092c523849e@vivier.eu>
	<20180320094406.GD4530@redhat.com>
	<20180320141107-mutt-send-email-mst@kernel.org>
	<20180320121841.GN4530@redhat.com>
	<20180320142756-mutt-send-email-mst@kernel.org>
	<20180320123900.GO4530@redhat.com>
	<20180320133216.u4hdijttdnyjbfpu@sirius.home.kraxel.org>
	<6061af99-0c27-e02b-e185-fe1dfca1a96a@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6061af99-0c27-e02b-e185-fe1dfca1a96a@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Tue, 20 Mar 2018 13:54:19 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Tue, 20 Mar 2018 13:54:19 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'mst@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
X-Mailman-Approved-At: Tue, 20 Mar 2018 09:59:16 -0400
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Dmitry Fleytman <dmitry.fleytman@gmail.com>, sheepdog@lists.wpkg.org,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Li Zhijian <lizhijian@cn.fujitsu.com>,
	David Hildenbrand <david@redhat.com>,
	Jeff Cody <jcody@redhat.com>, Zhang Chen <zhangckid@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-devel@nongnu.org, "Richard W.M. Jones" <rjones@redhat.com>,
	Keith Busch <keith.busch@intel.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Gerd Hoffmann <kraxel@redhat.com>, Jiri Pirko <jiri@resnulli.us>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>, Eric Blake <eblake@redhat.com>,
	Michael Roth <mdroth@linux.vnet.ibm.com>,
	Marcelo Tosatti <mtosatti@redhat.com>, Josh Durgin <jdurgin@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Alberto Garcia <berto@igalia.com>,
	zhanghailiang <zhang.zhanghailiang@huawei.com>,
	Ben Warren <ben@skyportsystems.com>, Marcel Apfelbaum <marcel@redhat.com>,
	Yongbok Kim <yongbok.kim@mips.com>, Markus Armbruster <armbru@redhat.com>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>, kvm@vger.kernel.org,
	=?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
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
	=?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm@nongnu.org, Peter Chubb <peter.chubb@nicta.com.au>,
	Yuval Shaia <yuval.shaia@oracle.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	xen-devel@lists.xenproject.org, BALATON Zoltan <balaton@eik.bme.hu>,
	John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Kevin Wolf <kwolf@redhat.com>, Alexander Graf <agraf@suse.de>,
	Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	qemu-block@nongnu.org, Hitoshi Mitake <mitake.hitoshi@lab.ntt.co.jp>,
	Wen Congyang <wencongyang2@huawei.com>, qemu-s390x@nongnu.org,
	Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
	Juan Quintela <quintela@redhat.com>,
	Max Reitz <mreitz@redhat.com>, Michael Walle <michael@walle.cc>,
	qemu-ppc@nongnu.org, Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Igor Mammedov <imammedo@redhat.com>, Hannes Reinecke <hare@suse.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9/oOKG5zq68F

On Tue, Mar 20, 2018 at 02:46:46PM +0100, Thomas Huth wrote:
> On 20.03.2018 14:32, Gerd Hoffmann wrote:
> >   Hi,
> > 
> >>> So for these, we should use "".  None of these are generated files though.
> >>
> >> That leads to crazy inconsistent message for developers where 50% of QEMU
> >> header files must use <> and the other 50% of header files must use "".
> > 
> > The rules are pretty simple though:
> > 
> >    (1) Headers which are generated use <>.
> >    (2) Headers which are in include/ use <>.
> >    (3) Headers sitting in the same directory as the source files use "".
> 
> Ugh, no. Please don't. The normal way of including header files in QEMU

Stress on "in QEMU".

> is to use "" - also for headers that are not in the same directory. For
> example just do a
> 
>  grep -r '^#include.*hw/' hw/
> 
> from the top directory and you'll see what I mean. Changing that rule is
> crazy.
> So please, let's just fix the configure script to detect some
> more stale files in the source tree, and we're done.
> 
>  Thomas

The rule probably served a useful purpose when all
headers where in the same directory as the source.
we moved them out so that is no longer the case.

-- 
MST
