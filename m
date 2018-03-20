Received: by 10.28.91.67 with SMTP id p64csp3833779wmb;
        Tue, 20 Mar 2018 06:28:17 -0700 (PDT)
X-Google-Smtp-Source: AG47ELsdmb+pSdCFPSx8VUsShxMlGb8GAlZDKBwDZoQV8mo2OaSQ0rjosmnFNfZ/8510v8fbV87k
X-Received: by 10.237.37.246 with SMTP id y51mr24764150qtc.182.1521552497596;
        Tue, 20 Mar 2018 06:28:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521552497; cv=none;
        d=google.com; s=arc-20160816;
        b=pbzAsQrdlRuNBZRH8gRlfVnElSuVIw6a7NGQ+Gsd+Nxg9psyB2ZwJDgpUYEadj4hkS
         YiClb1Pkex4ZKj9mj6u7YZGboAngubJqDNQFtJ7nyeFcJKzCQTuHjc9sSSib82Vrbcgn
         ZPRD31IhDstTKWfcCNomWM5liINTlmPOx/iIjZKeXQ92JNdd3SsjWcVM8Pp6/OCQ9y7C
         K/EM4mYKXyJ85+N5GJ7Y9qu5P1lKaMx9y0LKzBmPwxuGuWVLdSQCWKSCFvIqVgzzHfY4
         DLCgoIzHGnOX8t63z60Rbw+9l4Cdp7VoRMf9eQnpTsuTz//ICezmdOTMn74GpdyMdJYd
         fUIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:content-disposition
         :mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=HFDrg8qrnZSGy+68J0D7IXzUkGeQkNodAVZT53kVH9I=;
        b=F0UdHMiwFihVOAm1b5wKBunksOsnGJuAozPHYYh0TpcbIyuo2uRdIfImrYtd6ED0n3
         eiPiZ9fhrvxLUQJ5NBqM5h6lSI0CKY0SOhMQcQTv39E/H8F4xxn6/FufTaN3+rZIhTzr
         dMlXsAhaaBVA54YZFUzxU5PwA+zYxa6waB6okzmiU1fmTt9TfyZYR3Ik68NyIDj72arw
         gn1kTzvHNCaJtzeQy3aTrisuHxhZ4q0pDvaHa3PLZw1sSL+nnpNcmMj0Bfk9nDSsYwQF
         tfogADi59gm4k3+8mc+V2TBUqrySzQ1wLVIycBlnUwUiMxO8HUr7flG6KrUDBCRxjOzT
         2ltQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z5si1905727qtz.53.2018.03.20.06.28.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Mar 2018 06:28:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48531 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eyHJJ-0008Ax-0x
	for alex.bennee@linaro.org; Tue, 20 Mar 2018 09:28:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44847)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1eyGdg-0005pP-8c
	for qemu-devel@nongnu.org; Tue, 20 Mar 2018 08:45:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1eyGde-00030Z-KO
	for qemu-devel@nongnu.org; Tue, 20 Mar 2018 08:45:16 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:39682 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1eyGdN-0002jH-Dt; Tue, 20 Mar 2018 08:44:57 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 427B84040853;
	Tue, 20 Mar 2018 12:44:56 +0000 (UTC)
Received: from redhat.com (ovpn-121-0.rdu2.redhat.com [10.10.121.0])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7BABE94581;
	Tue, 20 Mar 2018 12:44:34 +0000 (UTC)
Date: Tue, 20 Mar 2018 14:44:34 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Message-ID: <20180320143945-mutt-send-email-mst@kernel.org>
References: <1521510562-529051-1-git-send-email-mst@redhat.com>
	<8f06e1e3-4823-d8e8-43bd-c092c523849e@vivier.eu>
	<20180320094406.GD4530@redhat.com>
	<20180320141107-mutt-send-email-mst@kernel.org>
	<20180320121841.GN4530@redhat.com>
	<20180320142756-mutt-send-email-mst@kernel.org>
	<20180320123900.GO4530@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20180320123900.GO4530@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Tue, 20 Mar 2018 12:44:56 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Tue, 20 Mar 2018 12:44:56 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'mst@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
X-Mailman-Approved-At: Tue, 20 Mar 2018 09:27:42 -0400
Subject: Re: [Qemu-devel] [PATCH] qemu: include generated files with <> and
 not ""
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
	Dmitry Fleytman <dmitry.fleytman@gmail.com>, sheepdog@lists.wpkg.org,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Li Zhijian <lizhijian@cn.fujitsu.com>,
	David Hildenbrand <david@redhat.com>,
	Jeff Cody <jcody@redhat.com>, Zhang Chen <zhangckid@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-devel@nongnu.org, "Richard W.M. Jones" <rjones@redhat.com>,
	Keith Busch <keith.busch@intel.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Jiri Pirko <jiri@resnulli.us>, Subbaraya Sundeep <sundeep.lkml@gmail.com>,
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
	Jason Wang <jasowang@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
	Thomas Huth <thuth@redhat.com>, Riku Voipio <riku.voipio@iki.fi>,
	Fam Zheng <famz@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
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
	xen-devel@lists.xenproject.org, John Snow <jsnow@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	Kevin Wolf <kwolf@redhat.com>, Alexander Graf <agraf@suse.de>,
	qemu-block@nongnu.org, Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Hitoshi Mitake <mitake.hitoshi@lab.ntt.co.jp>,
	Wen Congyang <wencongyang2@huawei.com>, qemu-s390x@nongnu.org,
	Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
	Juan Quintela <quintela@redhat.com>,
	Max Reitz <mreitz@redhat.com>, Michael Walle <michael@walle.cc>,
	qemu-ppc@nongnu.org, Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Igor Mammedov <imammedo@redhat.com>, Hannes Reinecke <hare@suse.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LRKpOWWem7dw

On Tue, Mar 20, 2018 at 12:39:00PM +0000, Daniel P. Berrang=E9 wrote:
> On Tue, Mar 20, 2018 at 02:28:42PM +0200, Michael S. Tsirkin wrote:
> > On Tue, Mar 20, 2018 at 12:18:41PM +0000, Daniel P. Berrang=E9 wrote:
> > > On Tue, Mar 20, 2018 at 02:12:24PM +0200, Michael S. Tsirkin wrote:
> > > > On Tue, Mar 20, 2018 at 09:44:06AM +0000, Daniel P. Berrang=E9 wr=
ote:
> > > > > On Tue, Mar 20, 2018 at 09:58:23AM +0100, Laurent Vivier wrote:
> > > > > > Le 20/03/2018 =E0 02:54, Michael S. Tsirkin a =E9crit=A0:
> > > > > > > QEMU coding style at the moment asks for all non-system
> > > > > > > include files to be used with #include "foo.h".
> > > > > > > However this rule actually does not make sense and
> > > > > > > creates issues for when the included file is generated.
> > > > > >=20
> > > > > > If you change that, we can have issue when a system include h=
as the same
> > > > > > name as our local include. With "<FILE>", system header are t=
aken first.
> > > > >=20
> > > > > > > In C, include "file" means look in current directory,
> > > > > > > then on include search path. Current directory here
> > > > > > > means the source file directory.
> > > > > > > By comparison include <file> means look on include search p=
ath.
> > > > > >=20
> > > > > > Not exactly, there is the notion of "system header" too.
> > > > > >=20
> > > > > > https://gcc.gnu.org/onlinedocs/cpp/Include-Syntax.html
> > > > > >=20
> > > > > > #include <file>
> > > > > > This variant is used for system header files. It searches for=
 a file
> > > > > > named file in a standard list of system directories. You can =
prepend
> > > > > > directories to this list with the -I option (see Invocation).
> > > > > >=20
> > > > > > #include "file"
> > > > > > This variant is used for header files of your own program. It=
 searches
> > > > > > for a file named file first in the directory containing the c=
urrent
> > > > > > file, then in the quote directories and then the same directo=
ries used
> > > > > > for <file>. You can prepend directories to the list of quote =
directories
> > > > > > with the -iquote option.
> > > > > >=20
> > > > > > > As generated files are not in the search directory (unless =
the build
> > > > > > > directory happens to match the source directory), it does n=
ot make sense
> > > > > > > to include them with "" - doing so is merely more work for =
preprocessor
> > > > > > > and a source or errors if a stale file happens to exist in =
the source
> > > > > > > directory.
> > > > > >=20
> > > > > > I agree there is a problem with stale files. But linux, for i=
nstance,
> > > > > > asks for a "make mrproper" to avoid this.
> > > > >=20
> > > > > We can follow what autoconf does, and add a check to configure =
to see if
> > > > > there are generated files left in the source dir, when configur=
ing with
> > > > > builddir !=3D srcdir, and exit with error, telling user to clea=
n their
> > > > > src dir first.
> > > > >=20
> > > > > > > This changes include directives for all generated files, ac=
ross the
> > > > > > > tree. The idea is to avoid sending a huge amount of email. =
 But when
> > > > > > > merging, the changes will be split with one commit per file=
, e.g. for
> > > > > > > ease of bisect in case of build failures, and to ease mergi=
ng.
> > > > > > >=20
> > > > > > > Note that should some generated files be missed by this tre=
e-wide
> > > > > > > refactoring, it isn't a big deal - this merely maintains th=
e status quo,
> > > > > > > and this can be addressed by a separate patch on top.
> > > > > > >=20
> > > > > > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > > > > >=20
> > > > > > I think your idea conflicts with what Markus has started to d=
o:
> > > > >=20
> > > > > Yes, I don't think we should revert what Markus started.   Both=
 ways of
> > > > > referencing QEMU headers have downsides, but I think "..." has =
fewer
> > > > > downsides that "<....">.
> > > >=20
> > > > Could you please explain what the advantage of "" is?
> > > > It seems to be gone since we moved headers away from
> > > > source.
> > >=20
> > > We moved *some* headers into the include/ directory tree.
> > >=20
> > > I still count 650+ headers which are alongside the .c files.
> >=20
> > So for these, we should use "".  None of these are generated files th=
ough.
>=20
> That leads to crazy inconsistent message for developers where 50% of QE=
MU
> header files must use <> and the other 50% of header files must use "".
> Having a consistent message for developers is one of the key reasons wh=
y
> Markus submitted the patches to standardize on the use of "" for QEMU
> header files, leaving <> for system headers & external dependancies.
>=20
> Regards,
> Daniel

I guess it's in the eye of the beholder. The simple rule since days of
K&R is that "" looks in the current directory of the source.
Whoever learned C knows this.

So use "" if your header is in the same directory as the source.

This will guarantee that whoever violates the rule will get a patch that
does not build.  Having our own rules without any good technical reason
that are not enforced by the build system just leads to small patches
from new contributors getting up to v23.


> --=20
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberr=
ange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange=
.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberr=
ange :|
