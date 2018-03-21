Received: by 10.28.91.67 with SMTP id p64csp5208164wmb;
        Wed, 21 Mar 2018 08:36:50 -0700 (PDT)
X-Google-Smtp-Source: AG47ELsxKPsubfjkhA+2VITFOalNInTPjkIvGTQX+/Dcr0GB47XwIJXO9+tsoRn9g8Qsq+le9sbb
X-Received: by 10.237.55.193 with SMTP id j59mr8203598qtb.110.1521646610093;
        Wed, 21 Mar 2018 08:36:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521646610; cv=none;
        d=google.com; s=arc-20160816;
        b=PyIOOfSKSHZcYW/X8u8W41y/202OnO9GH/mNX8bPBqmIFMqj2kiwQ78X0g4lKKb+tP
         UuDPJ6et4CmrjH8xwCf2ZuhbjRy9bKsb7Ff/Cdz7152i++n+ENuu3KhUEHBHuzbFMs0X
         fSJ00Cp3gNF5x6PSp5fA4SjktcT3nf5qJ+j/RgH6NHX0214VZtyUoXCrmtPBmPZaKLhm
         hmhgsrVc6TknO4OfUr3XdvwJZhJMlGBydX8m0pQ8UpAXhail84fITikMQwwb5scO5ZY3
         lI40JjTZs15Q6yxVZDo9IBUoFSYFB+zboIEFrRuvhQgFxR8lvfhhNrvr+ZGonOBE44Jn
         TH7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=rMI+0AHao3TXiOzMNOa7qwbt142WvSF0OMpWUvWT4pE=;
        b=m+jpX07+byWuG+nUS2+UH01u5Q84RMxaFj4slODtevMXQw271b+c4BHWj0/GzqUCSD
         /ssdFlpjSbEElHY4ujTts5YbymbZv8CUW7b2vOHAByr0SuSHv/X6tR3zx9MnGn0pEo0z
         UF1Rp1JtUN5DFpMuMVtbU9m5n/ImRs3KM7vEz2u6N2mAi5MBCO72J9WgQ0V35JMHxPkm
         zRiRWf7geNwyW7satqNsxsztT4/EXAhG+9Odhd6YmHPSZ/FZ5aA2ISM2t1QLewEkG03G
         2bXpdB5LvvCEsGNKIGLYNXrDbIuJ4E907a7mq5GZqiuBCQMevOl++Kui+k0vbFHxSpbr
         lEhw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c84si5985954qkh.117.2018.03.21.08.36.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 21 Mar 2018 08:36:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55819 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eyfnF-0003g6-Ij
	for alex.bennee@linaro.org; Wed, 21 Mar 2018 11:36:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52544)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1eyflU-0002QH-Vr
	for qemu-devel@nongnu.org; Wed, 21 Mar 2018 11:35:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1eyflT-0001Sa-Vp
	for qemu-devel@nongnu.org; Wed, 21 Mar 2018 11:35:01 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:42866 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kwolf@redhat.com>)
	id 1eyflN-0001OB-4A; Wed, 21 Mar 2018 11:34:53 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EFFABEAEB3;
	Wed, 21 Mar 2018 15:34:51 +0000 (UTC)
Received: from localhost.localdomain (ovpn-117-20.ams2.redhat.com
	[10.36.117.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B43272166BDA;
	Wed, 21 Mar 2018 15:34:40 +0000 (UTC)
Date: Wed, 21 Mar 2018 16:34:39 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20180321153439.GC3898@localhost.localdomain>
References: <1521642402-197739-1-git-send-email-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1521642402-197739-1-git-send-email-mst@redhat.com>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Wed, 21 Mar 2018 15:34:52 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Wed, 21 Mar 2018 15:34:52 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'kwolf@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-devel] [PATCH v2] qemu: replace "" with <> in headers
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Dmitry Fleytman <dmitry.fleytman@gmail.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Li Zhijian <lizhijian@cn.fujitsu.com>,
	David Hildenbrand <david@redhat.com>, Jeff Cody <jcody@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
	Keith Busch <keith.busch@intel.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Hannes Reinecke <hare@suse.com>,
	Gerd Hoffmann <kraxel@redhat.com>, Fam Zheng <famz@redhat.com>,
	Max Reitz <mreitz@redhat.com>, Josh Durgin <jdurgin@redhat.com>,
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
	Richard Henderson <rth@twiddle.net>, Jason Wang <jasowang@redhat.com>,
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
	qemu-block@nongnu.org, Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Hitoshi Mitake <mitake.hitoshi@lab.ntt.co.jp>,
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FBXAO01Vnqmj

Am 21.03.2018 um 15:46 hat Michael S. Tsirkin geschrieben:
> Our current scheme is to use
>  #include ""
> for internal headers, and
>  #include <>
> for external ones.
> 
> Unfortunately this is not based on compiler support: from C point of
> view, the "" form merely looks up headers in the current directory
> and then falls back on <> directories.
> 
> Thus, for example, a system header trace.h - should it be present - will
> conflict with our local trace.h

You're right that there is a conflict, even though only in one
direction: "trace.h" is unambiguously the local trace.h in our source
tree, but <trace.h> refers to the same local header rather than the
system header as you would expect.

An easy way to resolve this conflict would be using -iquote rather than
-I for directories in the source tree, so that <trace.h> unambiguously
refers to the system header and "trace.h" unambiguously refers to the
QEMU header.

> As another example of problems, a header by the same name in the source
> directory will always be picked up first - before any headers in
> the include directory.
> 
> Let's change the scheme: make sure all headers that are not
> in the source directory are included through a path
> starting with qemu/ , thus:
> 
>  #include <>
> 
> headers in the same directory as source are included with
> 
>  #include ""
> 
> as per standard.
> 
> This (untested) patch is just to start the discussion and does not
> change all of the codebase. If there's agreement, this will be
> run on all code to converting code to this scheme.

Renaming files is always painful. If that's the fix, the cure might be
worse than the disease. As far as I know, the conflict is only
theoretical, so in that case I'd say: If it ain't broke, don't fix it.

Kevin
