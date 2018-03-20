Received: by 10.28.91.67 with SMTP id p64csp3835647wmb;
        Tue, 20 Mar 2018 06:30:00 -0700 (PDT)
X-Google-Smtp-Source: AG47ELuyCJoMtA5xw+k5Mrc8T4Y7PsKClLbmIxIgA+maEXk3dGyMmMnbXFsFVn78dkB/ewjY9vSW
X-Received: by 10.237.33.228 with SMTP id m33mr24521190qtc.30.1521552600147;
        Tue, 20 Mar 2018 06:30:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521552600; cv=none;
        d=google.com; s=arc-20160816;
        b=hAVdW17MeV/MMFxBoHwSDEo4SOJRYWq0f9+70A6d0krZOQ9ePG96sAsE3KCRSZ+VRg
         uA2DG9Y9J0hGp+buhDq+dIvC6c9Wpx+JkR47RkNANb9RaXsER+4CxYPma12aCFvE1tZp
         OGe3KXRVu2WGtj3NvgNk3zKND/zTL8hefp6FGpgutyT3uWHoi7U84yGl63YmryFtpNaV
         rroeeGiJoOgMLlAxgQdSKCdpgFyKsNmyme7GSAfeKjDCRRQqPQH/eMncm/SWj8F1UlCV
         ig/n+KS1Or6R82KLfCEbA6Xwjpv0qXAj+hnY9ENim+hX1uNYDKKBVTYsx+o8TAmlKzcy
         907w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:content-disposition
         :mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=udDGuv4JE08fhnEr85rJRHA4av/IRtC48RDH9In/QCE=;
        b=nsos1bMq3AZ620fZjQLHQmVxZnQ+Na3/pDrNRwVPNvc+rRaKkQZ7RCS05Bq0GfukMS
         ZEcryfDv4z1u2gnbPg+S68SjNB/k3iIviA5C7npVRwohnWw/IeP+7ZJ4dcMhd45aHk8/
         li13b4Kv6aewAKKOqyvq7jh7j+du7gWkj8LAhyVYEhqGy51AFQpM2Zy1GqTQLZDwd96q
         gY/gngKIBDeVREuxggu5visImxFWN49Us13/tQFVVUpnrNFNfUEnsId5mvjEt4OBj0Ey
         YalCVJbJuPCvXNXlUkxuwj/cWk5NU2JfU1SIoUJ8/EvrbPwXHMzn4ah1H3w/pDVKB63t
         081g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w202si2948213qkb.19.2018.03.20.06.29.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Mar 2018 06:30:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48536 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eyHKx-00015K-HC
	for alex.bennee@linaro.org; Tue, 20 Mar 2018 09:29:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35107)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1eyG28-0007Vi-KI
	for qemu-devel@nongnu.org; Tue, 20 Mar 2018 08:06:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1eyG23-0005D7-KQ
	for qemu-devel@nongnu.org; Tue, 20 Mar 2018 08:06:28 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:38202 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1eyG1p-00053M-IJ; Tue, 20 Mar 2018 08:06:09 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EDFE640006E6;
	Tue, 20 Mar 2018 12:06:03 +0000 (UTC)
Received: from redhat.com (ovpn-121-0.rdu2.redhat.com [10.10.121.0])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3F7292022C02;
	Tue, 20 Mar 2018 12:05:56 +0000 (UTC)
Date: Tue, 20 Mar 2018 14:05:56 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Laurent Vivier <laurent@vivier.eu>
Message-ID: <20180320135548-mutt-send-email-mst@kernel.org>
References: <1521510562-529051-1-git-send-email-mst@redhat.com>
	<8f06e1e3-4823-d8e8-43bd-c092c523849e@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <8f06e1e3-4823-d8e8-43bd-c092c523849e@vivier.eu>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Tue, 20 Mar 2018 12:06:04 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Tue, 20 Mar 2018 12:06:04 +0000 (UTC) for IP:'10.11.54.4'
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
	qemu-devel@nongnu.org, Keith Busch <keith.busch@intel.com>,
	Max Filippov <jcmvbkbc@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
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
	Cornelia Huck <cohuck@redhat.com>,
	"Richard W.M. Jones" <rjones@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	Max Reitz <mreitz@redhat.com>, Michael Walle <michael@walle.cc>,
	qemu-ppc@nongnu.org, Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Igor Mammedov <imammedo@redhat.com>, Hannes Reinecke <hare@suse.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ri2a2Bdy20Qj

On Tue, Mar 20, 2018 at 09:58:23AM +0100, Laurent Vivier wrote:
> Le 20/03/2018 =E0 02:54, Michael S. Tsirkin a =E9crit=A0:
> > QEMU coding style at the moment asks for all non-system
> > include files to be used with #include "foo.h".
> > However this rule actually does not make sense and
> > creates issues for when the included file is generated.
>=20
> If you change that, we can have issue when a system include has the sam=
e
> name as our local include. With "<FILE>", system header are taken first=
.

Are you sure? I just tested and that is not the case with
either gcc or clang.

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

This is exactly what we do.

> #include "file"
> This variant is used for header files of your own program. It searches
> for a file named file first in the directory containing the current
> file, then in the quote directories and then the same directories used
> for <file>. You can prepend directories to the list of quote directorie=
s
> with the -iquote option.

Since we do not use -iquote, "" just adds the current directory.


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

Using <> we avoid the problem completely and create slightly
less work for the preprocessor.

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
>=20
> commit d8e39b70625d4ba1e998439d1a077b4b978930e7
> Author: Markus Armbruster <armbru@redhat.com>
> Date:   Thu Feb 1 12:18:28 2018 +0100
>=20
>     Use #include "..." for our own headers, <...> for others
>=20
>     System headers should be included with <...>, our own headers with
>     "...".  Offenders tracked down with an ugly, brittle and probably
>     buggy Perl script.  Previous iteration was commit a9c94277f0.
>=20
>     Delete inclusions of "string.h" and "strings.h" instead of fixing t=
hem
>     to <string.h> and <strings.h>, because we always include these via
>     osdep.h.
>=20
>     Put the cleaned up system header includes first.
>=20
>     While there, separate #include from file comment with exactly one
>     blank line.
>=20
> commit a9c94277f07d19d3eb14f199c3e93491aa3eae0e
> Author: Markus Armbruster <armbru@redhat.com>
> Date:   Wed Jun 22 19:11:19 2016 +0200
>=20
>     Use #include "..." for our own headers, <...> for others
>=20
>     Tracked down with an ugly, brittle and probably buggy Perl script.
>=20
>     Also move includes converted to <...> up so they get included befor=
e
>     ours where that's obviously okay.
>=20
> Thanks,
> Laurent

I suspect we previously actually did have headers in the
same directory as source so it was somewhat helpful.
They all have been moved out to include now.

--=20
MST
