Received: by 10.28.91.67 with SMTP id p64csp5191000wmb;
        Wed, 21 Mar 2018 08:20:32 -0700 (PDT)
X-Google-Smtp-Source: AIpwx49B389L1muRvXpqRnf6mqJIFrn7utl6Cde/TvmYur1BvBKmeWts3wvg81XS2V4CWZRW7Z0G
X-Received: by 10.55.17.26 with SMTP id b26mr2870719qkh.64.1521645632772;
        Wed, 21 Mar 2018 08:20:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521645632; cv=none;
        d=google.com; s=arc-20160816;
        b=l+jjXEqoJTVnGrqb75FdqVx18JXBOqzZQAtXsXmf7XcjFsyg3WWr7t97cg3cD8g+Wq
         ybmkQRzPg4T5uUMQ6KODA5Wlv83q1/Wikal9LanMXblNJDOpbzTUhI+5SXyWO/f6HS1U
         /ZKzdUE2S7/7YOvcutjJTu04gj57unXQfltaV8gNqN8fMUh6rfp2SyTuHULqa+/YEip7
         99vtB/NgU++AEazWWdyf2MCTY7wuVsEbHjDhRY2ny13KL/6I6x9NmKCgi8zmDWvCi6vX
         bno+Aa+uQ3PrLpBqk1YiAnrB96UxZHM4MlShev8LeQDCuS9ZDNSS8YACi4vuX0ciMZim
         hf/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject:user-agent
         :in-reply-to:content-disposition:mime-version:references:message-id
         :to:from:date:arc-authentication-results;
        bh=3J+3LxFs4qw2i5RBS0fz0SPF7O7mBMVKsQfBl+FUMGA=;
        b=zwmn/NIsQw6ety0E2E7E/+AAPR8FzCL9Y2go7pLopgXwqFo/4WjcZLtnz3VBsHyKCV
         1fRGva4wv3EghGubbP5PnOFu7VdLL3YA3G71Hf/+Hmp2OVDsS/n/lgbBpwXWshzLhfv4
         giyHsPWOjQFcThvL9DavmNInRgckFt8SusrSw+L+N2u/XBSBtARu8tD+VBTW1J97cCkw
         lNNHeSM4vhfHvBsc4SaZkOdz6FJmhBkryAS4KPK3d9m/ZgOhexQgOm59t6yGeAtGdLtJ
         xAxRZyCCNxovc7kZI0H/Q9ZgSvfnC1+IwgI9HeWWUdzlFFOYr5jG19BglC29uDX/EK9T
         XFVA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i62si1139348qkf.319.2018.03.21.08.20.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 21 Mar 2018 08:20:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55717 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eyfXU-00078o-9V
	for alex.bennee@linaro.org; Wed, 21 Mar 2018 11:20:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47183)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1eyfWy-00076s-3D
	for qemu-devel@nongnu.org; Wed, 21 Mar 2018 11:20:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1eyfWw-00059J-8T
	for qemu-devel@nongnu.org; Wed, 21 Mar 2018 11:20:00 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:48006 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>)
	id 1eyfWf-0003ot-LZ; Wed, 21 Mar 2018 11:19:41 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3578640704A2;
	Wed, 21 Mar 2018 15:19:37 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E58F72022C08;
	Wed, 21 Mar 2018 15:19:24 +0000 (UTC)
Date: Wed, 21 Mar 2018 15:19:22 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20180321151922.GR8551@redhat.com>
References: <1521642402-197739-1-git-send-email-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1521642402-197739-1-git-send-email-mst@redhat.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Wed, 21 Mar 2018 15:19:37 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Wed, 21 Mar 2018 15:19:37 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'berrange@redhat.com' RCPT:''
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
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
	=?utf-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
	=?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
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
	John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
	Kevin Wolf <kwolf@redhat.com>, kvm@vger.kernel.org, qemu-block@nongnu.org,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Hitoshi Mitake <mitake.hitoshi@lab.ntt.co.jp>,
	Markus Armbruster <armbru@redhat.com>, qemu-s390x@nongnu.org,
	Marcelo Tosatti <mtosatti@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
	Juan Quintela <quintela@redhat.com>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Michael Walle <michael@walle.cc>,
	Igor Mammedov <imammedo@redhat.com>, qemu-ppc@nongnu.org,
	Wen Congyang <wencongyang2@huawei.com>, Cornelia Huck <cohuck@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yeY7jO+OMscD

On Wed, Mar 21, 2018 at 04:46:32PM +0200, Michael S. Tsirkin wrote:
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

If our local "trace.h" is in the current directory, then using ""
is right and you can still use <trace.h> to get the system version.

If our local trace.h is in include/ top level, then it is going to
block use of the system trace.h regardless of whether we use <> or ""

Fortunately our include/ tree uses sub-dirs, so we would typically
use  #include "$subdir/trace.h" and  #include <trace.h> would still
find the system header.

We just have to be careful we don't add stuff at the top level of
our include/ dir with names that are liable to clash. This might
suggest renaming  include/elf.h to include/qemu/elf.h, or just
moving elf.h to the qemu/ subdirectory. Likewise include/glib-compat.h
might be better moved to qemu/ subdirectory.


> As another example of problems, a header by the same name in the source
> directory will always be picked up first - before any headers in
> the include directory.

There's only a couple of headers in the top level of our include/
directory - everything else is pulled in with a named path
eg #include "block/block_int.h", so that would not conflict with
reference to a bare #include "block_int.h" from the current directory.

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

As stated before, I consider this a step backwards - it is a
good clear standard to use "" for project local includes and
<> for 3rd party / system includes IMHO. The change doesn't
do anything beneficial for the two scenarios described above
AFAICT.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
