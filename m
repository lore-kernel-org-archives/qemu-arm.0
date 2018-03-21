Received: by 10.28.91.67 with SMTP id p64csp5069994wmb;
        Wed, 21 Mar 2018 06:30:53 -0700 (PDT)
X-Google-Smtp-Source: AG47ELuUjXiPtzdUCC7z9uo5aYc0hyte8wsINlC2JeQrh1HIv7L+X6ECfPUMn2ETfiQl6CKe3Ygb
X-Received: by 10.55.11.18 with SMTP id 18mr13095808qkl.169.1521639053288;
        Wed, 21 Mar 2018 06:30:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521639053; cv=none;
        d=google.com; s=arc-20160816;
        b=OcMU1UwLJdDHDuCE3kQBzZEDmg1HI6WFdI/5jTw+F9Xeo9yCzbqGL/+jvb2KdgAmWM
         M5I1SsiwUf3cuApLuTxA7084Z66/9O9N7a8ZADKukSZtMqf1nqz3eVvt6MogPj8vsHfO
         Mh81waKzyAWjOeBJCKzKWEOZOjUtpMKcSDNhSxoJHsfAPPjA7eChpUrEOcdc0AoDJLCj
         iDKBeQ1vq2F4TNmF1V1IdMdagC/3zRPCMO3A/NfJTVvgDQUcpMH3LepPc0r91E9muGXb
         6qHMXVWftGm/F4Q7Jp4i3VT1DR0UqsDPKvSn2kyKCA+2ZUdVP9yFoBY9wETOlQS0PI73
         pKHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=NXvKyS1kvxV3Qw7IlXwemKTGh6nMOgWAExzNjz1GZCA=;
        b=HSUe3WzMlq8gni6tsWUQJ2ze5IMx8Mw9XvPsmrJZ0q4trk2vcRHfs3VGOqY2gsfL1p
         cqZ45XYF4zNiAMgtYGcdNSe9vM1i8tBatuQa2d097Iq2RcnrgCsUGVxf0UUNJPsTCHgT
         wJNZH/XO4ngjNKlvt0B5oEc+TvmmVWZP4mStxVQWCzrvQa3+fSGAkTPaioxDjH77+n4e
         VGkE5p7eIWWTGlbRWy4v2+H0aGF3KplZGuDrgjfRISKbXE//VDw+Q8ffvHDcebfHxGY2
         vOCgOvH1rOM0mU9KEZVbh2a/uFT5dAoqAPostcKl9Ikz6L6r9dJXNfMHstzLOfcDrWIJ
         GRWw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o22si4519930qtb.90.2018.03.21.06.30.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 21 Mar 2018 06:30:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55071 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eydpM-0000lj-OY
	for alex.bennee@linaro.org; Wed, 21 Mar 2018 09:30:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47388)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1eydp9-0000iW-BI
	for qemu-arm@nongnu.org; Wed, 21 Mar 2018 09:30:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1eydp6-0001L6-4G
	for qemu-arm@nongnu.org; Wed, 21 Mar 2018 09:30:39 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:60650 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>)
	id 1eydp5-0001KJ-Ua; Wed, 21 Mar 2018 09:30:36 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 27C058190293;
	Wed, 21 Mar 2018 13:30:34 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9DAA7D7E1B;
	Wed, 21 Mar 2018 13:29:56 +0000 (UTC)
Date: Wed, 21 Mar 2018 13:29:53 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20180321132953.GK8551@redhat.com>
References: <1521510562-529051-1-git-send-email-mst@redhat.com>
	<8f06e1e3-4823-d8e8-43bd-c092c523849e@vivier.eu>
	<20180320135548-mutt-send-email-mst@kernel.org>
	<459fa95d-8f0a-22fa-80fb-4af22ccf49b3@redhat.com>
	<20180321150543-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20180321150543-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Wed, 21 Mar 2018 13:30:34 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Wed, 21 Mar 2018 13:30:34 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'berrange@redhat.com' RCPT:''
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
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
X-TUID: p6TwQ60O5pCT

On Wed, Mar 21, 2018 at 03:08:36PM +0200, Michael S. Tsirkin wrote:
> On Wed, Mar 21, 2018 at 08:16:00AM +0100, Thomas Huth wrote:
> > On 20.03.2018 13:05, Michael S. Tsirkin wrote:
> > > On Tue, Mar 20, 2018 at 09:58:23AM +0100, Laurent Vivier wrote:
> > >> Le 20/03/2018 =C3=A0 02:54, Michael S. Tsirkin a =C3=A9crit=C2=A0:
> > >>> QEMU coding style at the moment asks for all non-system
> > >>> include files to be used with #include "foo.h".
> > >>> However this rule actually does not make sense and
> > >>> creates issues for when the included file is generated.
> > >>
> > >> If you change that, we can have issue when a system include has th=
e same
> > >> name as our local include. With "<FILE>", system header are taken =
first.
> > >=20
> > > Are you sure? I just tested and that is not the case with
> > > either gcc or clang.
> > >=20
> > >>> In C, include "file" means look in current directory,
> > >>> then on include search path. Current directory here
> > >>> means the source file directory.
> > >>> By comparison include <file> means look on include search path.
> > >>
> > >> Not exactly, there is the notion of "system header" too.
> > >>
> > >> https://gcc.gnu.org/onlinedocs/cpp/Include-Syntax.html
> > >>
> > >> #include <file>
> > >> This variant is used for system header files. It searches for a fi=
le
> > >> named file in a standard list of system directories. You can prepe=
nd
> > >> directories to this list with the -I option (see Invocation).
> > >=20
> > > This is exactly what we do.
> > >=20
> > >> #include "file"
> > >> This variant is used for header files of your own program. It sear=
ches
> > >> for a file named file first in the directory containing the curren=
t
> > >> file, then in the quote directories and then the same directories =
used
> > >> for <file>. You can prepend directories to the list of quote direc=
tories
> > >> with the -iquote option.
> > >=20
> > > Since we do not use -iquote, "" just adds the current directory.
> >=20
> > So why don't we simply switch to use -iquote instead of -I for adding
> > search paths for our own headers? We then would get a clean separatio=
n
> > of QEMU headers from system headers.
> >=20
> >  Thomas
>=20
> It still leaves us with a host of problems e.g. the problem of stale
> headers in the source directory.

We have a patch on list which effectively solves the problem of stale
generated files in source directory, so that's largely a non-issue at
this point IMHO.

Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
|: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
