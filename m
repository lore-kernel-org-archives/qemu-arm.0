Received: by 10.28.91.67 with SMTP id p64csp3843207wmb;
        Tue, 20 Mar 2018 06:36:24 -0700 (PDT)
X-Google-Smtp-Source: AG47ELs0s6uHISQYwdFOAWJ31TWkedYbocXNRQTfg2C/xn3hK9pITpnt0PXvzY7X2RhQ6X7S88c+
X-Received: by 10.200.41.237 with SMTP id 42mr13085828qtt.159.1521552983874;
        Tue, 20 Mar 2018 06:36:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521552983; cv=none;
        d=google.com; s=arc-20160816;
        b=BADEaZu9Z3gFyDtqFvu0xJGTqNz8XTSAN9f0M0XMGb6To5NsRmNNoYA10Tvkz3YD+H
         82Re2fqm17zzgLsMVbuMt7oDrBAD2BlEcAhtFKyfBozYjMsey/UedEotAXnXfe43Qh0P
         HPbGTVx1ZnP8qwPMgGosGWftPaboquUogL6Bso30zLF+Uv4rECX0oN6Cl5ox8XWIqnZW
         +Hu1Rn1NPPkzYbv1YmUNoKndbXkmTjGgLseslO00jrxLpDapeMM1lnOhDrqqcHVDzgZ5
         OVbw7DVyO51vhnRsF2f97kMuJvCaPIqAJ8nfm4skq5a7hujhaZXTVRBatyXcL4m3dTAR
         fhGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=0YDgDIYam5rfYqLpHdCxKup0g+1upDqXRTKuKp5E/dI=;
        b=pm+CyT4KmpyoF3vo3NWvq+hAPGYFhhW6SewDGAqz119el/Qw9fPG+1fGATosJP1mA6
         8pc/KJkB80PoMhiCmxzICQSPw6frBxL6axtgAPE6s0KIcKkfcYdkXTRNa+zmoNr9uCaW
         EwdaO1ryneT6oyCnYGvzXiHilG9CLAISRtmfNx4UhMx2CyroE7+nfW8Fhq6Y76NueseZ
         vGA8aXaJ4ddAFk4+/AuHVE83klkjfR53V/5kt2aKGZHBBZgXgiyAfCD9iPBbygtAJ/6s
         Qu9xueha3w9ND6QUY84kkn/+COGIm5Cn2T87D+X7XURp1n4bB0Aky8VpVm7MwgIrJq8p
         EfxA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t13si2022198qte.367.2018.03.20.06.36.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Mar 2018 06:36:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48596 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eyHR9-0007R7-94
	for alex.bennee@linaro.org; Tue, 20 Mar 2018 09:36:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43085)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1eyGXr-00007P-HY
	for qemu-arm@nongnu.org; Tue, 20 Mar 2018 08:39:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1eyGXq-0004Al-3N
	for qemu-arm@nongnu.org; Tue, 20 Mar 2018 08:39:15 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:39232 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>)
	id 1eyGXp-0004AP-U2; Tue, 20 Mar 2018 08:39:14 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C62EF406804F;
	Tue, 20 Mar 2018 12:39:12 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B1F1215CDB7;
	Tue, 20 Mar 2018 12:39:02 +0000 (UTC)
Date: Tue, 20 Mar 2018 12:39:00 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20180320123900.GO4530@redhat.com>
References: <1521510562-529051-1-git-send-email-mst@redhat.com>
	<8f06e1e3-4823-d8e8-43bd-c092c523849e@vivier.eu>
	<20180320094406.GD4530@redhat.com>
	<20180320141107-mutt-send-email-mst@kernel.org>
	<20180320121841.GN4530@redhat.com>
	<20180320142756-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20180320142756-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Tue, 20 Mar 2018 12:39:13 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Tue, 20 Mar 2018 12:39:13 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
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
	xen-devel@lists.xenproject.org, BALATON Zoltan <balaton@eik.bme.hu>,
	John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Kevin Wolf <kwolf@redhat.com>, Alexander Graf <agraf@suse.de>,
	qemu-block@nongnu.org, Hitoshi Mitake <mitake.hitoshi@lab.ntt.co.jp>,
	Wen Congyang <wencongyang2@huawei.com>, qemu-s390x@nongnu.org,
	Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
	Juan Quintela <quintela@redhat.com>,
	Max Reitz <mreitz@redhat.com>, Michael Walle <michael@walle.cc>,
	qemu-ppc@nongnu.org, Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
	Igor Mammedov <imammedo@redhat.com>, Hannes Reinecke <hare@suse.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9IoQn/BA5sWk

On Tue, Mar 20, 2018 at 02:28:42PM +0200, Michael S. Tsirkin wrote:
> On Tue, Mar 20, 2018 at 12:18:41PM +0000, Daniel P. Berrang=C3=A9 wrote=
:
> > On Tue, Mar 20, 2018 at 02:12:24PM +0200, Michael S. Tsirkin wrote:
> > > On Tue, Mar 20, 2018 at 09:44:06AM +0000, Daniel P. Berrang=C3=A9 w=
rote:
> > > > On Tue, Mar 20, 2018 at 09:58:23AM +0100, Laurent Vivier wrote:
> > > > > Le 20/03/2018 =C3=A0 02:54, Michael S. Tsirkin a =C3=A9crit=C2=A0=
:
> > > > > > QEMU coding style at the moment asks for all non-system
> > > > > > include files to be used with #include "foo.h".
> > > > > > However this rule actually does not make sense and
> > > > > > creates issues for when the included file is generated.
> > > > >=20
> > > > > If you change that, we can have issue when a system include has=
 the same
> > > > > name as our local include. With "<FILE>", system header are tak=
en first.
> > > >=20
> > > > > > In C, include "file" means look in current directory,
> > > > > > then on include search path. Current directory here
> > > > > > means the source file directory.
> > > > > > By comparison include <file> means look on include search pat=
h.
> > > > >=20
> > > > > Not exactly, there is the notion of "system header" too.
> > > > >=20
> > > > > https://gcc.gnu.org/onlinedocs/cpp/Include-Syntax.html
> > > > >=20
> > > > > #include <file>
> > > > > This variant is used for system header files. It searches for a=
 file
> > > > > named file in a standard list of system directories. You can pr=
epend
> > > > > directories to this list with the -I option (see Invocation).
> > > > >=20
> > > > > #include "file"
> > > > > This variant is used for header files of your own program. It s=
earches
> > > > > for a file named file first in the directory containing the cur=
rent
> > > > > file, then in the quote directories and then the same directori=
es used
> > > > > for <file>. You can prepend directories to the list of quote di=
rectories
> > > > > with the -iquote option.
> > > > >=20
> > > > > > As generated files are not in the search directory (unless th=
e build
> > > > > > directory happens to match the source directory), it does not=
 make sense
> > > > > > to include them with "" - doing so is merely more work for pr=
eprocessor
> > > > > > and a source or errors if a stale file happens to exist in th=
e source
> > > > > > directory.
> > > > >=20
> > > > > I agree there is a problem with stale files. But linux, for ins=
tance,
> > > > > asks for a "make mrproper" to avoid this.
> > > >=20
> > > > We can follow what autoconf does, and add a check to configure to=
 see if
> > > > there are generated files left in the source dir, when configurin=
g with
> > > > builddir !=3D srcdir, and exit with error, telling user to clean =
their
> > > > src dir first.
> > > >=20
> > > > > > This changes include directives for all generated files, acro=
ss the
> > > > > > tree. The idea is to avoid sending a huge amount of email.  B=
ut when
> > > > > > merging, the changes will be split with one commit per file, =
e.g. for
> > > > > > ease of bisect in case of build failures, and to ease merging=
.
> > > > > >=20
> > > > > > Note that should some generated files be missed by this tree-=
wide
> > > > > > refactoring, it isn't a big deal - this merely maintains the =
status quo,
> > > > > > and this can be addressed by a separate patch on top.
> > > > > >=20
> > > > > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > > > >=20
> > > > > I think your idea conflicts with what Markus has started to do:
> > > >=20
> > > > Yes, I don't think we should revert what Markus started.   Both w=
ays of
> > > > referencing QEMU headers have downsides, but I think "..." has fe=
wer
> > > > downsides that "<....">.
> > >=20
> > > Could you please explain what the advantage of "" is?
> > > It seems to be gone since we moved headers away from
> > > source.
> >=20
> > We moved *some* headers into the include/ directory tree.
> >=20
> > I still count 650+ headers which are alongside the .c files.
>=20
> So for these, we should use "".  None of these are generated files thou=
gh.

That leads to crazy inconsistent message for developers where 50% of QEMU
header files must use <> and the other 50% of header files must use "".
Having a consistent message for developers is one of the key reasons why
Markus submitted the patches to standardize on the use of "" for QEMU
header files, leaving <> for system headers & external dependancies.

Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
|: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
