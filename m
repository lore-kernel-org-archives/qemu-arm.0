Received: by 10.28.91.67 with SMTP id p64csp3840852wmb;
        Tue, 20 Mar 2018 06:34:23 -0700 (PDT)
X-Google-Smtp-Source: AG47ELsPsNEK6/Uit+TGgA/wcXmYqpw9rWGNDH2vhE9II3bIdsZBQ7bRsTi6hIrnaQ65MPSqu00l
X-Received: by 10.55.46.194 with SMTP id u185mr7395908qkh.63.1521552863022;
        Tue, 20 Mar 2018 06:34:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521552863; cv=none;
        d=google.com; s=arc-20160816;
        b=HJN7dbQjSTYmA901vj2ezMeWpG4ft3VBBl3WSOq1XtCD038OyO8R1nV1GM148QcLWx
         UY/Kkh7HmbX9VgZFVNskPS10Ax4kJqjw+fQWDwIKbSUWOulkAVdsO2qxkP9QpJl1trdq
         qQWZUcMsea6cjthu12GEEmeQkvD3stg6FG7WYSUlmq6HTYNpHsO6bfiBmOkLfIxGXUo/
         Av8ltfjY2VlP/Fc4PwGPCESqBZGJgXk6lCw5qcvOdtZGQHfLsdQ2u7VhPO5oqRCdpZRi
         IXPzZeIl1OJ3E3Hj3RnwP2iFgt3ulpaKnUACovIF6GWZ4dDaKlzTGi+yOY7FDms2R5X4
         7VPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=jr8yUQfEb5LU+N+XV2IP5CFXNyTKgI+VIT3Y5FPfAo0=;
        b=w1zYrOdatoVn9X7KHIqfKq3J2sUok0Ce+xgWIYqksIrWWqrzIsX5LpvlRArim3Aoxp
         hQ+9FVUbCf7KUum/aJz7l+57jHTc7i597EdsI6WiYv8QF56k1ML4kuFsuH1pVceiiMdU
         oBsb2WPDHyaQlzo8NxRtMJKq7Xm2XtMvnAKKF1118BHV26P0HTGTUwyXFenVMfJKScHd
         IX0xHKAyIkkFwR6kYYhpFG0cZ5Iy4hC7KLE8uIuoaC+IM6rXqWSfB4JbQiceSHSU6Eaa
         EVQB0nxFA1wJotHfMIQqWT5U9aW6V583VDtmP4ei1hOEGTFzMF/QaOCBtYmA4m/hYy+9
         FKnw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e65si755636qkc.441.2018.03.20.06.34.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Mar 2018 06:34:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48565 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eyHPC-0005X7-Ft
	for alex.bennee@linaro.org; Tue, 20 Mar 2018 09:34:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55784)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1eyDpO-0007ws-1U
	for qemu-arm@nongnu.org; Tue, 20 Mar 2018 05:45:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1eyDpJ-0000ai-Iw
	for qemu-arm@nongnu.org; Tue, 20 Mar 2018 05:45:10 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:33554 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>)
	id 1eyDpJ-0000a8-Cm; Tue, 20 Mar 2018 05:45:05 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 13031401DEBF;
	Tue, 20 Mar 2018 09:44:54 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CB19010EE95B;
	Tue, 20 Mar 2018 09:44:08 +0000 (UTC)
Date: Tue, 20 Mar 2018 09:44:06 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Laurent Vivier <laurent@vivier.eu>
Message-ID: <20180320094406.GD4530@redhat.com>
References: <1521510562-529051-1-git-send-email-mst@redhat.com>
	<8f06e1e3-4823-d8e8-43bd-c092c523849e@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8f06e1e3-4823-d8e8-43bd-c092c523849e@vivier.eu>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Tue, 20 Mar 2018 09:44:54 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Tue, 20 Mar 2018 09:44:54 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'berrange@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
X-Mailman-Approved-At: Tue, 20 Mar 2018 09:28:26 -0400
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
	Gerd Hoffmann <kraxel@redhat.com>, Jiri Pirko <jiri@resnulli.us>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>, Eric Blake <eblake@redhat.com>,
	Michael Roth <mdroth@linux.vnet.ibm.com>,
	Marcelo Tosatti <mtosatti@redhat.com>, Josh Durgin <jdurgin@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Alberto Garcia <berto@igalia.com>,
	zhanghailiang <zhang.zhanghailiang@huawei.com>,
	Ben Warren <ben@skyportsystems.com>, Marcel Apfelbaum <marcel@redhat.com>,
	Yongbok Kim <yongbok.kim@mips.com>, David Hildenbrand <david@redhat.com>,
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
	Thomas Huth <thuth@redhat.com>, Riku Voipio <riku.voipio@iki.fi>,
	Fam Zheng <famz@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
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
X-TUID: KIIdB41LSmkC

On Tue, Mar 20, 2018 at 09:58:23AM +0100, Laurent Vivier wrote:
> Le 20/03/2018 =C3=A0 02:54, Michael S. Tsirkin a =C3=A9crit=C2=A0:
> > QEMU coding style at the moment asks for all non-system
> > include files to be used with #include "foo.h".
> > However this rule actually does not make sense and
> > creates issues for when the included file is generated.
>=20
> If you change that, we can have issue when a system include has the sam=
e
> name as our local include. With "<FILE>", system header are taken first=
.

> > In C, include "file" means look in current directory,
> > then on include search path. Current directory here
> > means the source file directory.
> > By comparison include <file> means look on include search path.
>=20
> Not exactly, there is the notion of "system header" too.
>=20
> https://gcc.gnu.org/onlinedocs/cpp/Include-Syntax.html
>=20
> #include <file>
> This variant is used for system header files. It searches for a file
> named file in a standard list of system directories. You can prepend
> directories to this list with the -I option (see Invocation).
>=20
> #include "file"
> This variant is used for header files of your own program. It searches
> for a file named file first in the directory containing the current
> file, then in the quote directories and then the same directories used
> for <file>. You can prepend directories to the list of quote directorie=
s
> with the -iquote option.
>=20
> > As generated files are not in the search directory (unless the build
> > directory happens to match the source directory), it does not make se=
nse
> > to include them with "" - doing so is merely more work for preprocess=
or
> > and a source or errors if a stale file happens to exist in the source
> > directory.
>=20
> I agree there is a problem with stale files. But linux, for instance,
> asks for a "make mrproper" to avoid this.

We can follow what autoconf does, and add a check to configure to see if
there are generated files left in the source dir, when configuring with
builddir !=3D srcdir, and exit with error, telling user to clean their
src dir first.

> > This changes include directives for all generated files, across the
> > tree. The idea is to avoid sending a huge amount of email.  But when
> > merging, the changes will be split with one commit per file, e.g. for
> > ease of bisect in case of build failures, and to ease merging.
> >=20
> > Note that should some generated files be missed by this tree-wide
> > refactoring, it isn't a big deal - this merely maintains the status q=
uo,
> > and this can be addressed by a separate patch on top.
> >=20
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>=20
> I think your idea conflicts with what Markus has started to do:

Yes, I don't think we should revert what Markus started.   Both ways of
referencing QEMU headers have downsides, but I think "..." has fewer
downsides that "<....">.

The problem Michael is tackling should be pretty rare, because moist
developers aren't frequently switching between srcdir=3D=3Dbuilddir and
srcdir!=3Dbiulddir setups - they have their preference for which to use
and stick with it. As long as we get ./configure to warn about the
dirty srcdir it should be good enough

Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
|: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
