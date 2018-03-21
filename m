Received: by 10.28.91.67 with SMTP id p64csp5082704wmb;
        Wed, 21 Mar 2018 06:43:13 -0700 (PDT)
X-Google-Smtp-Source: AG47ELvo4O4DnbIBSvfni+jk17XnM0D5TZAYNolGRzxZok5K2McONmd+tiKpf1N4oqFOtLgWmtVg
X-Received: by 10.233.216.65 with SMTP id u62mr30199440qkf.133.1521639793397;
        Wed, 21 Mar 2018 06:43:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521639793; cv=none;
        d=google.com; s=arc-20160816;
        b=p0UFw+JKQpYn5kMmJoC1VwmCH/U6syjl+y1tnbWIbkBey6J2LX3w3HXI2dc44HGWxW
         n9+8ve2SeFF/+8htpz0mg0jBsiwVfMmtGB3Pt/ATxT0npX6ZD3hNtyKSBNoigpd5gABH
         A8deYCzKxtu1PXFj1kG1WgF+GBkSG2c2jApni+2lI9/zxdUFiUbeyveMOjMqhP5pRdc4
         c7RbpCpV2e7hsrMe8PjXxvJ0o37DPxxGq2ZRYo+CamVZJhL4TMjO/vooneaKxIYJYhLQ
         izGPFdc62q4xvDfohkf99nVUyTNpmx/X8FKhb9vjpgKjOI1CxwkPSzHnEibiJoWSwzH5
         FoZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:content-disposition
         :mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=9venW47e/Ax7tVcHEsrFJOGPm7KhMLsIjw+MEUpdrp0=;
        b=qke7XidV0ZmaDAeRYtEgPUazCvMn4mO540Mw+Rj1+bae3eR8HSD6BWl5fNohfCdM0g
         jKjTlj4kKkUfHeRhC1ZlqhXTAYwKA9gUQKEGU0D+/ppWnXb7lVRu2izAQTpGgt8XK8tf
         55h/TDWlY6AaLqCw+KBNlIM5QQwuHWvVGeby6G3Ng0KgZMmI/Xt0CxyG+fehHeRJQIdF
         a6kgoO3Dv9xfY2X/dPqdSd26/MBnym2R97RenDQJVNh6eSG/F1xb9Mp47PTUNw0dBdC0
         swUE4AZLClwX4aL8R2cqYXeTa7R6zwmpNFMNcRS8meGaURFIm6sL+N/oNwoxtyFzjiI8
         6ztw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p41si268100qta.315.2018.03.21.06.43.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 21 Mar 2018 06:43:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55193 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eye1I-0001ZE-TV
	for alex.bennee@linaro.org; Wed, 21 Mar 2018 09:43:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51368)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1eye14-0001XG-NW
	for qemu-arm@nongnu.org; Wed, 21 Mar 2018 09:43:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1eye13-0002Ud-Df
	for qemu-arm@nongnu.org; Wed, 21 Mar 2018 09:42:58 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:32994 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1eye13-0002U1-71; Wed, 21 Mar 2018 09:42:57 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B4E26813F73E;
	Wed, 21 Mar 2018 13:42:47 +0000 (UTC)
Received: from redhat.com (ovpn-124-179.rdu2.redhat.com [10.10.124.179])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4D70A10B009A;
	Wed, 21 Mar 2018 13:42:22 +0000 (UTC)
Date: Wed, 21 Mar 2018 15:42:22 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Message-ID: <20180321153510-mutt-send-email-mst@kernel.org>
References: <1521510562-529051-1-git-send-email-mst@redhat.com>
	<8f06e1e3-4823-d8e8-43bd-c092c523849e@vivier.eu>
	<20180320135548-mutt-send-email-mst@kernel.org>
	<459fa95d-8f0a-22fa-80fb-4af22ccf49b3@redhat.com>
	<20180321150543-mutt-send-email-mst@kernel.org>
	<20180321132953.GK8551@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20180321132953.GK8551@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Wed, 21 Mar 2018 13:42:48 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Wed, 21 Mar 2018 13:42:48 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'mst@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
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
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 74KOvaFrppMs

On Wed, Mar 21, 2018 at 01:29:53PM +0000, Daniel P. Berrang=E9 wrote:
> On Wed, Mar 21, 2018 at 03:08:36PM +0200, Michael S. Tsirkin wrote:
> > On Wed, Mar 21, 2018 at 08:16:00AM +0100, Thomas Huth wrote:
> > > On 20.03.2018 13:05, Michael S. Tsirkin wrote:
> > > > On Tue, Mar 20, 2018 at 09:58:23AM +0100, Laurent Vivier wrote:
> > > >> Le 20/03/2018 =E0 02:54, Michael S. Tsirkin a =E9crit=A0:
> > > >>> QEMU coding style at the moment asks for all non-system
> > > >>> include files to be used with #include "foo.h".
> > > >>> However this rule actually does not make sense and
> > > >>> creates issues for when the included file is generated.
> > > >>
> > > >> If you change that, we can have issue when a system include has =
the same
> > > >> name as our local include. With "<FILE>", system header are take=
n first.
> > > >=20
> > > > Are you sure? I just tested and that is not the case with
> > > > either gcc or clang.
> > > >=20
> > > >>> In C, include "file" means look in current directory,
> > > >>> then on include search path. Current directory here
> > > >>> means the source file directory.
> > > >>> By comparison include <file> means look on include search path.
> > > >>
> > > >> Not exactly, there is the notion of "system header" too.
> > > >>
> > > >> https://gcc.gnu.org/onlinedocs/cpp/Include-Syntax.html
> > > >>
> > > >> #include <file>
> > > >> This variant is used for system header files. It searches for a =
file
> > > >> named file in a standard list of system directories. You can pre=
pend
> > > >> directories to this list with the -I option (see Invocation).
> > > >=20
> > > > This is exactly what we do.
> > > >=20
> > > >> #include "file"
> > > >> This variant is used for header files of your own program. It se=
arches
> > > >> for a file named file first in the directory containing the curr=
ent
> > > >> file, then in the quote directories and then the same directorie=
s used
> > > >> for <file>. You can prepend directories to the list of quote dir=
ectories
> > > >> with the -iquote option.
> > > >=20
> > > > Since we do not use -iquote, "" just adds the current directory.
> > >=20
> > > So why don't we simply switch to use -iquote instead of -I for addi=
ng
> > > search paths for our own headers? We then would get a clean separat=
ion
> > > of QEMU headers from system headers.
> > >=20
> > >  Thomas
> >=20
> > It still leaves us with a host of problems e.g. the problem of stale
> > headers in the source directory.
>=20
> We have a patch on list which effectively solves the problem of stale
> generated files in source directory, so that's largely a non-issue at
> this point IMHO.
>=20
> Regards,
> Daniel

That was just one, and the solution is just to fail build.
I think we can strive to address at least some of the following:
- make sure that an incorrect use of a header fails to build
- make it easier for new developers to understand the codebase
- build correctly rather than fail in as many configurations as possible
- actually support a mix of in and out of tree builds

I think my patch under discussion does not address all issues here.
I'll post a new proposal now.

> --=20
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberr=
ange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange=
.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberr=
ange :|
