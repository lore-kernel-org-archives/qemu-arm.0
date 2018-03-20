Received: by 10.28.91.67 with SMTP id p64csp3835466wmb;
        Tue, 20 Mar 2018 06:29:50 -0700 (PDT)
X-Google-Smtp-Source: AG47ELvW1xdvWAV9b+SEJ4y/5y8acvVjTnqgO8wImMCd37sLO8REutye4iK0ksYqaq0s1S1kOT5A
X-Received: by 10.55.64.22 with SMTP id n22mr23432290qka.186.1521552590359;
        Tue, 20 Mar 2018 06:29:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521552590; cv=none;
        d=google.com; s=arc-20160816;
        b=oBv3ElZA4BXRhJRKPHfx01pGrmsr39cJJ2+7UA8ehZAU8k8wHxIQVabRf3AFSpmjWJ
         Of8sf5DFtI0U3RRRhjbgwR8LMefWnkuKgw2jnmmd1BjQ8Xc2F6SfleKKPwDXW/jxf/pH
         Kdh7CoLwMT5Rduw8tCUW6uVGzVflct5QbrW8DtSpIG3kujqmjC4xQ+HpKZAcJ7K1jxpi
         QheVDR6ckyaXFxxI4iu6m831LoaTDvPvFH/4yp4y8ZJJbaky+ZCOyIT682KWLs7mTO4K
         ssztvDPUMviUxGmP2q1yqVp6IDAhwVCXOrFf5rnwL6fX27vP1oNDHxh/DX7xe+2fX7IJ
         QI0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:content-disposition
         :mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=7gjoQSNw163tg464kRzpbftibXjwV42rCIjo2E3oy2w=;
        b=QofCjh0p2V++1W+zj4nmwdGxSKeb+3WaFRgpal6LwZBQd3CoBBUFj49t173iS7jPiR
         9/Sjf5yNZMvOLtVlPPLAyC9F8u9bN7ic2+/qFlVlteo29hkDf9WKrsjBJblGTxfdIXCf
         GUFEql23pYoWiUsanCq+3Kf/wutvMEabRugvlrK/OnMSZcbO96XEkLniR/PTktiPkzna
         oR79QckYQj6UvTQmAkDaAB+WdiRvGZhYYyctu1Gn5FA1mgRp9h4XwTe2CJVwriiLFy+P
         pt04A5kc7sbLwty80PapVO9aHSmKbND9fjwhCmxoVQ+sDdP+Y5rlWosSI7wM3x41Miof
         XnUg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s123si1191795qke.479.2018.03.20.06.29.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Mar 2018 06:29:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48535 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eyHKn-00013v-IZ
	for alex.bennee@linaro.org; Tue, 20 Mar 2018 09:29:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40118)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1eyGO8-0004LL-16
	for qemu-devel@nongnu.org; Tue, 20 Mar 2018 08:29:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1eyGO6-0004vW-AV
	for qemu-devel@nongnu.org; Tue, 20 Mar 2018 08:29:12 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:37988 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1eyGNy-0004qu-8f; Tue, 20 Mar 2018 08:29:02 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EBF1F412A2A0;
	Tue, 20 Mar 2018 12:28:50 +0000 (UTC)
Received: from redhat.com (ovpn-121-0.rdu2.redhat.com [10.10.121.0])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 34C972024CA6;
	Tue, 20 Mar 2018 12:28:42 +0000 (UTC)
Date: Tue, 20 Mar 2018 14:28:42 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Message-ID: <20180320142756-mutt-send-email-mst@kernel.org>
References: <1521510562-529051-1-git-send-email-mst@redhat.com>
	<8f06e1e3-4823-d8e8-43bd-c092c523849e@vivier.eu>
	<20180320094406.GD4530@redhat.com>
	<20180320141107-mutt-send-email-mst@kernel.org>
	<20180320121841.GN4530@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20180320121841.GN4530@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Tue, 20 Mar 2018 12:28:51 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Tue, 20 Mar 2018 12:28:51 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
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
X-TUID: +gRWia4ZLwOi

On Tue, Mar 20, 2018 at 12:18:41PM +0000, Daniel P. Berrang=E9 wrote:
> On Tue, Mar 20, 2018 at 02:12:24PM +0200, Michael S. Tsirkin wrote:
> > On Tue, Mar 20, 2018 at 09:44:06AM +0000, Daniel P. Berrang=E9 wrote:
> > > On Tue, Mar 20, 2018 at 09:58:23AM +0100, Laurent Vivier wrote:
> > > > Le 20/03/2018 =E0 02:54, Michael S. Tsirkin a =E9crit=A0:
> > > > > QEMU coding style at the moment asks for all non-system
> > > > > include files to be used with #include "foo.h".
> > > > > However this rule actually does not make sense and
> > > > > creates issues for when the included file is generated.
> > > >=20
> > > > If you change that, we can have issue when a system include has t=
he same
> > > > name as our local include. With "<FILE>", system header are taken=
 first.
> > >=20
> > > > > In C, include "file" means look in current directory,
> > > > > then on include search path. Current directory here
> > > > > means the source file directory.
> > > > > By comparison include <file> means look on include search path.
> > > >=20
> > > > Not exactly, there is the notion of "system header" too.
> > > >=20
> > > > https://gcc.gnu.org/onlinedocs/cpp/Include-Syntax.html
> > > >=20
> > > > #include <file>
> > > > This variant is used for system header files. It searches for a f=
ile
> > > > named file in a standard list of system directories. You can prep=
end
> > > > directories to this list with the -I option (see Invocation).
> > > >=20
> > > > #include "file"
> > > > This variant is used for header files of your own program. It sea=
rches
> > > > for a file named file first in the directory containing the curre=
nt
> > > > file, then in the quote directories and then the same directories=
 used
> > > > for <file>. You can prepend directories to the list of quote dire=
ctories
> > > > with the -iquote option.
> > > >=20
> > > > > As generated files are not in the search directory (unless the =
build
> > > > > directory happens to match the source directory), it does not m=
ake sense
> > > > > to include them with "" - doing so is merely more work for prep=
rocessor
> > > > > and a source or errors if a stale file happens to exist in the =
source
> > > > > directory.
> > > >=20
> > > > I agree there is a problem with stale files. But linux, for insta=
nce,
> > > > asks for a "make mrproper" to avoid this.
> > >=20
> > > We can follow what autoconf does, and add a check to configure to s=
ee if
> > > there are generated files left in the source dir, when configuring =
with
> > > builddir !=3D srcdir, and exit with error, telling user to clean th=
eir
> > > src dir first.
> > >=20
> > > > > This changes include directives for all generated files, across=
 the
> > > > > tree. The idea is to avoid sending a huge amount of email.  But=
 when
> > > > > merging, the changes will be split with one commit per file, e.=
g. for
> > > > > ease of bisect in case of build failures, and to ease merging.
> > > > >=20
> > > > > Note that should some generated files be missed by this tree-wi=
de
> > > > > refactoring, it isn't a big deal - this merely maintains the st=
atus quo,
> > > > > and this can be addressed by a separate patch on top.
> > > > >=20
> > > > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > > >=20
> > > > I think your idea conflicts with what Markus has started to do:
> > >=20
> > > Yes, I don't think we should revert what Markus started.   Both way=
s of
> > > referencing QEMU headers have downsides, but I think "..." has fewe=
r
> > > downsides that "<....">.
> >=20
> > Could you please explain what the advantage of "" is?
> > It seems to be gone since we moved headers away from
> > source.
>=20
> We moved *some* headers into the include/ directory tree.
>=20
> I still count 650+ headers which are alongside the .c files.
>=20
> Regards,
> Daniel

So for these, we should use "".  None of these are generated files though=
.

> --=20
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberr=
ange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange=
.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberr=
ange :|
