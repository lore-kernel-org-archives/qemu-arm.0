Received: by 10.28.71.155 with SMTP id m27csp341725wmi;
        Fri, 23 Mar 2018 04:22:45 -0700 (PDT)
X-Google-Smtp-Source: AG47ELt6oDw0uSvjTvi7zqwgo8YKCJEROm/+BZxnpdzqUf+l460levGafvFEXEoPc8K8+nbjh6VW
X-Received: by 10.55.112.133 with SMTP id l127mr41718397qkc.224.1521804165523;
        Fri, 23 Mar 2018 04:22:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521804165; cv=none;
        d=google.com; s=arc-20160816;
        b=s7PTcQ0+thtjDEvNxR4AlkNSjvTBii33Y5NNl5cVmbhW9Zs0mulnzUryyjfdwnX7XT
         /6zpL/Rke8bjldKfXgPKcH36MvKeWZatW6cIyt+PBdw7EvE0vCIqb0IHPGOgpwZb7uja
         FSuZ2usdleAL5QIoL0PBQTUdqxNTJnjfwofppDkI7lGyLSYmlnulKyPjGKfU2ssQsH6U
         jaIz8JrA0Sl7ZVIFGr/32KEviZOR5r+s7cjizXbjNkJIq+vs/2gxBaM2UHjfQwMWbvid
         niX0qcPykAva3wLwqpXf3riOwFumaUdsHoi3sYyV7iK9z08xOczTqSYJ6mmcCHO9oqoS
         uHiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=WrHQCAWSEDiaau3MVfIjGZpxSiOCNus14NzwHFx91G4=;
        b=T7o17/H5sSej0/SSHR4NwT9sDB96IMmUCDSnvxEBWfOENkmhKyiv+/HeefC4SIkswc
         wOCR25/GAw6uJctq01PxZZ/UwgvUbojICO162EaQq4fQ9cykSocKNCf5fZf1Inukc5hs
         2F3ILR7JM9saq/AW/7pVmc6O4pO80BpswKGnvlqb5Ay+dbhIw5JxuMbRXQkO/GfGjuF0
         EjDoiLXFQJCFjaQorh0qofEOq+JMll3Dox1KOMNPOBSlXnxhqeGnVYx2napULEQJvY+f
         qXWJwGpHH9isvG2h9BQfIVXTcdXbw5A9HNOaw1tWBM/hDkAeRcXgHCNfI8elJM9HFo8s
         aGPg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d64si5239589qkf.416.2018.03.23.04.22.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Mar 2018 04:22:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37217 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ezKmT-0003S4-3B
	for alex.bennee@linaro.org; Fri, 23 Mar 2018 07:22:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40234)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1ezKmL-0003Rc-OE
	for qemu-arm@nongnu.org; Fri, 23 Mar 2018 07:22:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1ezKmI-0007kH-Ku
	for qemu-arm@nongnu.org; Fri, 23 Mar 2018 07:22:37 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:35954 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kwolf@redhat.com>)
	id 1ezKmI-0007jh-Ev; Fri, 23 Mar 2018 07:22:34 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 666FF406E8A4;
	Fri, 23 Mar 2018 11:22:22 +0000 (UTC)
Received: from localhost.localdomain (ovpn-117-65.ams2.redhat.com
	[10.36.117.65])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 714B41C71C;
	Fri, 23 Mar 2018 11:21:44 +0000 (UTC)
Date: Fri, 23 Mar 2018 12:21:43 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Message-ID: <20180323112143.GC5025@localhost.localdomain>
References: <1521746188-496856-1-git-send-email-mst@redhat.com>
	<20180323102227.GF16270@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20180323102227.GF16270@redhat.com>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Fri, 23 Mar 2018 11:22:23 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Fri, 23 Mar 2018 11:22:23 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'kwolf@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [PATCH v2 1/2] make: move generated headers to
 qemu-build/
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
	"Michael S. Tsirkin" <mst@redhat.com>, Jeff Cody <jcody@redhat.com>,
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
	Yongbok Kim <yongbok.kim@mips.com>, David Hildenbrand <david@redhat.com>,
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
X-TUID: WYTb816Xg8Qe

Am 23.03.2018 um 11:22 hat Daniel P. Berrang=E9 geschrieben:
> On Thu, Mar 22, 2018 at 09:27:55PM +0200, Michael S. Tsirkin wrote:
> > Make sure all generated files go into qemu-build subdirectory.
> > We can then include them like this:
> >  #include "qemu-build/trace.h"
> >=20
> > This serves two purposes:
> > - make it easy to detect which files are in the source
> >   directory (a bit more work for writers, easier for readers)
> > - reduce chances of conflicts with possible stale files in source
> >   directory (which could be left over from e.g. old patches, etc)
>=20
> If people care about this, then they can just be doing a build
> with  srcdir !=3D builddir config.  If people are using srcdir =3D=3D b=
uilddir
> then they likely *want* all the generated files in their srcdir.
>=20
> IMHO it would be valid for us to consider if we could just mandate
> srcdir !=3D builddir, but if people object to such a proposal, then I
> don't think we should arbitrarily move all generated source files
> in this way, as that's effectively the same thing forced onto devs.

Not necessarily. I build from the srcdir simply because it's more
convenient to be able to easily start the editor and make from the same
directory (or sometimes start make from inside the editor). I suppose
that (or for users, being too lazy to create a second directory for that
one-time build) is the motivation for most other users of srcdir =3D=3D
builddir, too.

I don't really mind where generated source files are stored, they just
happen to end up in my root source directory if I want to be able to
build from there without dealing with paths. I won't be angry if they
are suddenly in a different directory as long as it doesn't mean more
typing for me. Moving them to a separate directory might in fact make
things a bit nicer occasionally. Not enough for me to actively propose
such a change, but if Michael wants to do this, I'm certainly not
opposed.

Kevin
