Received: by 10.28.91.67 with SMTP id p64csp5226750wmb;
        Wed, 21 Mar 2018 08:55:09 -0700 (PDT)
X-Google-Smtp-Source: AG47ELu58cHYvvzmaYYDcwyC5Fxt3GYXPQdbwgFMSBXcKBmHuenzaubEPiwNA1FxIh+TI+fGZqjH
X-Received: by 10.55.168.206 with SMTP id r197mr29218672qke.311.1521647709423;
        Wed, 21 Mar 2018 08:55:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521647709; cv=none;
        d=google.com; s=arc-20160816;
        b=mLDWJpgfNctONQEDxI8Caii9clhX6c4ZfqlITEuny6Bt605K+o+EpnlO+whXDtvw7P
         ZHVZDlAS6mfkCFjsaizAsfB6RsmQBpNa9qrUUjPAWsCLOVhOhGW6P227oWSw++nKUYKx
         TbF8tPu/vX34psUiEqeQHNii0ozxWFClLO6De5p2EZq/dOk6j77zCIYJMiVXVymfG6Sn
         6kPgMo6FH/IEB6/l+s+yTNsInc3rqsuy4yR4zJDRqQjUAsKNo7gNK9/1X7aMm7gDyQnj
         s0fAPXuI3Ui1CcBjmjx2wGpMLKfbq+7kCR8NWBh+4WrOg4yUi1gRGycYyMmRqYzyYgpJ
         ui2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=54tSlGKeNBSKHuAeYaGSONFBLEfYxBPoZvkzjHVt5Ws=;
        b=MISG3KKU8/w69ioPYN+qi/Y8mQgjLEyFs/oAjpnoYV3vT++KdPh3WnOIqLZG0QnZem
         et268o4h4g9VG6jcvJU/W23aZiUFM9GLWOoRRVkWzIIxpackG+h2RFSQugITTgppBwFc
         UaBmOelRMBemNrtMvBQEUttl/EIaPBI3Ae5asbiKIUM/BlFWTVZyIXJOqNt9m5ONbetb
         k9PyeX5C8hSyleZ6zfB7KP2jvx1Wg+ilQ3NIowecSKJENJlkY8Ge7dzC0LUoEAOaCgRS
         Cp7LMBwrmJ0MggvsEI8Y3fxKVD8ifcW7XB24nZwLSsWBTZizWiCcPSIeUBKJyeoOYROG
         qt6A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 28si4072383qtq.477.2018.03.21.08.55.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 21 Mar 2018 08:55:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55920 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eyg4z-0000Nd-0A
	for alex.bennee@linaro.org; Wed, 21 Mar 2018 11:55:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58367)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1eyg4l-0000NC-FY
	for qemu-arm@nongnu.org; Wed, 21 Mar 2018 11:54:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1eyg4h-0001r9-If
	for qemu-arm@nongnu.org; Wed, 21 Mar 2018 11:54:55 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:60560 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>)
	id 1eyg4h-0001pP-CY; Wed, 21 Mar 2018 11:54:51 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 16B54406805D;
	Wed, 21 Mar 2018 15:54:46 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 474422166BDA;
	Wed, 21 Mar 2018 15:54:26 +0000 (UTC)
Date: Wed, 21 Mar 2018 15:54:24 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20180321155424.GV8551@redhat.com>
References: <1521642402-197739-1-git-send-email-mst@redhat.com>
	<20180321151922.GR8551@redhat.com>
	<20180321173309-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20180321173309-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Wed, 21 Mar 2018 15:54:46 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Wed, 21 Mar 2018 15:54:46 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'berrange@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
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
	=?utf-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
	=?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
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
	John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
	Kevin Wolf <kwolf@redhat.com>, kvm@vger.kernel.org, qemu-block@nongnu.org,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SPlv2dsLu6bw

On Wed, Mar 21, 2018 at 05:39:48PM +0200, Michael S. Tsirkin wrote:
> On Wed, Mar 21, 2018 at 03:19:22PM +0000, Daniel P. Berrang=C3=A9 wrote=
:
> > On Wed, Mar 21, 2018 at 04:46:32PM +0200, Michael S. Tsirkin wrote:
> > > Our current scheme is to use
> > >  #include ""
> > > for internal headers, and
> > >  #include <>
> > > for external ones.
> > >=20
> > > Unfortunately this is not based on compiler support: from C point o=
f
> > > view, the "" form merely looks up headers in the current directory
> > > and then falls back on <> directories.
> > >=20
> > > Thus, for example, a system header trace.h - should it be present -=
 will
> > > conflict with our local trace.h
> >=20
> > If our local "trace.h" is in the current directory, then using ""
> > is right and you can still use <trace.h> to get the system version.
> >=20
> > If our local trace.h is in include/ top level, then it is going to
> > block use of the system trace.h regardless of whether we use <> or ""
> >=20
> > Fortunately our include/ tree uses sub-dirs, so we would typically
> > use  #include "$subdir/trace.h" and  #include <trace.h> would still
> > find the system header.
> > We just have to be careful we don't add stuff at the top level of
> > our include/ dir with names that are liable to clash. This might
> > suggest renaming  include/elf.h to include/qemu/elf.h, or just
> > moving elf.h to the qemu/ subdirectory. Likewise include/glib-compat.=
h
> > might be better moved to qemu/ subdirectory.
> >=20
>=20
> This is exactly what this patch proposes, with a uniform scheme:
> start everything with qemu/.
>=20
> >=20
> > > As another example of problems, a header by the same name in the so=
urce
> > > directory will always be picked up first - before any headers in
> > > the include directory.
> >=20
> > There's only a couple of headers in the top level of our include/
> > directory - everything else is pulled in with a named path
> > eg #include "block/block_int.h", so that would not conflict with
> > reference to a bare #include "block_int.h" from the current directory=
.
>=20
> We can not know that there are no system headers that start with block/=
 on
> any current or future systems.

Ah true, good point.  I guess that's where the benefit of -iquote
comes into play.


Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
|: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
