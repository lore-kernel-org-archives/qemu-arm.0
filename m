Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp2731969wrt;
        Mon, 22 Oct 2018 02:01:05 -0700 (PDT)
X-Google-Smtp-Source: ACcGV6160A1jEfBkkjUTQ8W3wDBn0FAtTxP9K/uOC78lD4OErRQ/kxsqV1sbRbPhuCiiPeDs33vj
X-Received: by 2002:a37:cfc7:: with SMTP id v68-v6mr41869491qkl.35.1540198865799;
        Mon, 22 Oct 2018 02:01:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540198865; cv=none;
        d=google.com; s=arc-20160816;
        b=RRR333bSViqFR3/SROBjyeLHqB7XLyktDisSJzEPfzuLBYq9JZMZW2G3H8dCH0qkXf
         +sGKahLoIwQnMFbOetbXlsCJ4HBBK7YSy3MN/gJkOaE16aFGq8AUrq0vowGa6BqYrpLi
         P3cRaFqvEdpGifFUfJF3AigaEeRdcLcGoaoJ9c88h0JCYIasQjOenPt4FtyzPsaIxu0h
         Y2Aa9gPuWhTBPHH8cbILD/xBgMokdVjvr7/1ZFeJIajNoCNyrMdNVUe9XuKOodwXN1+m
         S2yXyStmVL2SsYCMNNnvaIXUYAsbNipE1EVQlHw33luIfJjUAvfwJ++OU+rgsXX60e4t
         RH6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=YslPpdOdMT3T/bGRY+XfBzPsuNOCBBcq9nNcBQ/5EBE=;
        b=fIKNLsOiYRfd6J82lpjDj1UPrPpZ7Ymm5TYcXjYiR3swr9bRte10KMZvE1Qb7ZozLL
         O+dbz5oJ5pRKe7l65nnjSUcp4C6o9/N+44d/u32TKGi2+ZnCGJjQpoKgnZnezd4q8cLl
         hiVAkV8lDFMS2LtlL5hNb50tDfg0V2LBSC1ed5doT5gVkZi9Jh1ziFxkseUYy/PIRKwz
         VYR1X4V4gmg5HULmRpznu+8azmDLFSjAfR5t/cEJAJ4OJn/s1o+tpe646ngngNsEwBEl
         ohoOpYrEeC3KgLL/P6C1xtZiLK5vZ8VqMdvJOa+Bzot4dE55P48GahkF4MeBtYzSQ3MH
         Lh7g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d14si5107738qvp.215.2018.10.22.02.01.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 22 Oct 2018 02:01:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33625 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gEW5B-0007ZY-10
	for alex.bennee@linaro.org; Mon, 22 Oct 2018 05:01:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36968)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gEW50-0007ZI-0O
	for qemu-arm@nongnu.org; Mon, 22 Oct 2018 05:00:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gEW4u-00080U-4k
	for qemu-arm@nongnu.org; Mon, 22 Oct 2018 05:00:53 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45116)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gEW4t-0007zY-PM; Mon, 22 Oct 2018 05:00:48 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CB5E430821C4;
	Mon, 22 Oct 2018 09:00:44 +0000 (UTC)
Received: from igors-macbook-pro.local (ovpn-112-55.ams2.redhat.com
	[10.36.112.55])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8F02B226FF;
	Mon, 22 Oct 2018 09:00:27 +0000 (UTC)
Date: Mon, 22 Oct 2018 10:00:22 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20181022100022.0dc514b9@igors-macbook-pro.local>
In-Reply-To: <20181019202321.GM31060@habkost.net>
References: <20181018200422.4358-1-ehabkost@redhat.com>
	<CAFEAcA9p0dLoNQy7kBdcXMz0HiMGEZTBX67Lq2SizTY3kgeksw@mail.gmail.com>
	<20181019184408.GG31060@habkost.net>
	<20181019215345.521d58d7@igors-macbook-pro.local>
	<20181019202321.GM31060@habkost.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Mon, 22 Oct 2018 09:00:45 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PULL 00/45] Machine queue, 2018-10-18
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
	"Michael S. Tsirkin" <mst@redhat.com>, Libvirt <libvir-list@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	QEMU Developers <qemu-devel@nongnu.org>, Alexander Graf <agraf@suse.de>,
	Max Filippov <jcmvbkbc@gmail.com>, Rob Herring <robh@kernel.org>,
	Markus Armbruster <armbru@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Alistair Francis <alistair@alistair23.me>, qemu-arm <qemu-arm@nongnu.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
	Michael Walle <michael@walle.cc>, qemu-ppc <qemu-ppc@nongnu.org>,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Nq16usR++0r/

On Fri, 19 Oct 2018 17:23:21 -0300
Eduardo Habkost <ehabkost@redhat.com> wrote:

> On Fri, Oct 19, 2018 at 09:53:45PM +0200, Igor Mammedov wrote:
> > On Fri, 19 Oct 2018 15:44:08 -0300
> > Eduardo Habkost <ehabkost@redhat.com> wrote:
> >=20
> > > On Fri, Oct 19, 2018 at 03:12:31PM +0100, Peter Maydell wrote:
> > > > On 18 October 2018 at 21:03, Eduardo Habkost <ehabkost@redhat.com> =
wrote:
> > > > > The following changes since commit 09558375a634e17cea6cfbfec883ac=
2376d2dc7f:
> > > > >
> > > > >   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target=
-arm-20181016-1' into staging (2018-10-16 17:42:56 +0100)
> > > > >
> > > > > are available in the Git repository at:
> > > > >
> > > > >   git://github.com/ehabkost/qemu.git tags/machine-next-pull-reque=
st
> > > > >
> > > > > for you to fetch changes up to 6d8e1bcc7dd5e819ce81e6a87fffe23e39=
c700cc:
> > > > >
> > > > >   numa: Clean up error reporting in parse_numa() (2018-10-17 16:3=
3:40 -0300)
> > > > >
> > > > > ----------------------------------------------------------------
> > > > > Machine queue, 2018-10-18
> > > > >
> > > > > * sysbus init/realize cleanups
> > > > >   (C=C3=A9dric Le Goater, Philippe Mathieu-Daud=C3=A9)
> > > > > * memory-device refactoring (David Hildenbrand)
> > > > > * -smp: deprecate incorrect CPUs topology (Igor Mammedov)
> > > > > * -numa parsing cleanups (Markus Armbruster)
> > > > > * Fix hostmem-file memory leak (Zhang Yi)
> > > > > * Typo fix (Li Qiang)
> > > > >
> > > > > ----------------------------------------------------------------
> > > > >
> > > >=20
> > > > Hi. This had some problems in merge testing, I'm afraid:
> > > >=20
> > > > On aarch64 host, warnings running tests/cpu-plug-test for i386 and =
s390 targets:
> > > >=20
> > > > TEST: tests/cpu-plug-test... (pid=3D12602)
> > > >   /i386/cpu-plug/pc-i440fx-3.0/cpu-add/1x3x2&maxcpus=3D12:
> > > > qemu-system-i386: warning: Invalid CPU topology deprecated: sockets
> > > > (1) * cores (3) * threads (2) !=3D maxcpus (12)
> > > [...]
> > > >=20
> > > > (plus similar ppc64, x86_64 targets)
> > >=20
> > > Ouch.  Apologies.
> > >=20
> > > Can we please do something make sure "make check" will fail on
> > > these cases?  I'd like to be able to trust CI systems like
> > > travis-ci.
> > >=20
> >=20
> > we probably don't want make check fail on warning.
>=20
> I disagree.  If a warning is blocking a pull request from being
> merged, it must make CI systems fail too.  Otherwise we're
> defeating the purpose of CI systems.

When we deprecate options we are bound to trigger warning which are not err=
ors
and are meant to be there until deprecated options are removed/tested by ma=
ke check.
So what would you suggest to do wrt tests that use deprecated features,
drop testing for it?

[...]

