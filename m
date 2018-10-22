Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp3153547wrt;
        Mon, 22 Oct 2018 08:03:16 -0700 (PDT)
X-Google-Smtp-Source: AJdET5eZpGwuMSAxUEE4oU6FJtlt6alco8BpIocd2HVmZd8S4kPz+Npf+4hOwRjLoVNgb7jWCBri
X-Received: by 2002:a0c:c38d:: with SMTP id o13mr4022135qvi.100.1540220595995;
        Mon, 22 Oct 2018 08:03:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540220595; cv=none;
        d=google.com; s=arc-20160816;
        b=tRevehXgRJhIv4RurHmoh0paB+TiB2YjMt9ykP8s45LrVliNmVj4hcpkVn2zXOKff0
         WuLZ6BIUkkF6U9h4tH38Hx6tKNWRbgfSyhx1NsWaNKq3F/PUhWNRC1tzWEke0yKGEr8C
         wQdduU8cdMDwl8DbkdwYP4EMZCJoaX5S34XW2BSiIjwmn/NerfKqbq3RrxEPNuNAoJHW
         UOuVdT3L5CNZlyB8ZFTIJjcQfI4Ncr4f/lc9p6k5GJtf/MBQNcvRTEnUlDnAizJuzhtf
         LMEA6Q+Alg/4Rf8ggorW0+NHFwlf8mCOSQDzwXqSFAhe9aeUdZLrLoQS2at7odOvAvPu
         t3Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:user-agent:message-id
         :in-reply-to:date:references:to:from;
        bh=0z6R17TnXDDgf5+0t4UQgjGzFimvfB6RkF4Keskt9jo=;
        b=rBKRXPBhXiqQITSVtAp2inDAAGyaA+qI0oaVEyTfniUrkOA+lezAtX0r51xO5t/wsy
         3oILsmbtLgWuXmmszN4kdHmwPBkk3aKK00gUqqstgUwEho5KPeet5l5cTrpAvdPfvi2h
         2lQRg3uySX4wPQjs98iNmL9OGMGWrPPrcRyXLiA8tFHSdcKD7A6rLjTKWXyC0mKFNO6e
         l2zuWtlUBTcX2zI5Xnvr77QNiqNwCArG9e2uG23Rbr2UnKtoJJzth1qk57O5ckje9kOe
         uZjxSQGdPRaiWkRdsopL/+Z7LAVxPtTZ7vvMtkY8Hic5GEB/0vVYd5L/C+mTHCb5XLFt
         BRTw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t15si3406971qvm.195.2018.10.22.08.03.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 22 Oct 2018 08:03:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35662 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gEbjf-0002HK-HB
	for alex.bennee@linaro.org; Mon, 22 Oct 2018 11:03:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33992)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1gEbjS-00023d-JV
	for qemu-arm@nongnu.org; Mon, 22 Oct 2018 11:03:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1gEbjP-0006on-1s
	for qemu-arm@nongnu.org; Mon, 22 Oct 2018 11:03:02 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59356)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1gEbjM-0005QS-DR; Mon, 22 Oct 2018 11:02:57 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E7E24753F9;
	Mon, 22 Oct 2018 15:02:42 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-34.ams2.redhat.com
	[10.36.117.34])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1C83660925;
	Mon, 22 Oct 2018 15:02:36 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id A776A11385F2; Mon, 22 Oct 2018 17:02:34 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
References: <20181018200422.4358-1-ehabkost@redhat.com>
	<CAFEAcA9p0dLoNQy7kBdcXMz0HiMGEZTBX67Lq2SizTY3kgeksw@mail.gmail.com>
	<20181019184408.GG31060@habkost.net>
	<20181019215345.521d58d7@igors-macbook-pro.local>
	<20181019202321.GM31060@habkost.net>
	<20181022100022.0dc514b9@igors-macbook-pro.local>
Date: Mon, 22 Oct 2018 17:02:34 +0200
In-Reply-To: <20181022100022.0dc514b9@igors-macbook-pro.local> (Igor
	Mammedov's message of "Mon, 22 Oct 2018 10:00:22 +0100")
Message-ID: <87h8heaut1.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Mon, 22 Oct 2018 15:02:43 +0000 (UTC)
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
	Eduardo Habkost <ehabkost@redhat.com>,
	Alistair Francis <alistair@alistair23.me>, qemu-arm <qemu-arm@nongnu.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
	Michael Walle <michael@walle.cc>, qemu-ppc <qemu-ppc@nongnu.org>,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lnm8HGmiKIor

Igor Mammedov <imammedo@redhat.com> writes:

> On Fri, 19 Oct 2018 17:23:21 -0300
> Eduardo Habkost <ehabkost@redhat.com> wrote:
>
>> On Fri, Oct 19, 2018 at 09:53:45PM +0200, Igor Mammedov wrote:
>> > On Fri, 19 Oct 2018 15:44:08 -0300
>> > Eduardo Habkost <ehabkost@redhat.com> wrote:
>> >=20
>> > > On Fri, Oct 19, 2018 at 03:12:31PM +0100, Peter Maydell wrote:
>> > > > On 18 October 2018 at 21:03, Eduardo Habkost <ehabkost@redhat.com>=
 wrote:
>> > > > > The following changes since commit 09558375a634e17cea6cfbfec883a=
c2376d2dc7f:
>> > > > >
>> > > > >   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-targe=
t-arm-20181016-1' into staging (2018-10-16 17:42:56 +0100)
>> > > > >
>> > > > > are available in the Git repository at:
>> > > > >
>> > > > >   git://github.com/ehabkost/qemu.git tags/machine-next-pull-requ=
est
>> > > > >
>> > > > > for you to fetch changes up to 6d8e1bcc7dd5e819ce81e6a87fffe23e3=
9c700cc:
>> > > > >
>> > > > >   numa: Clean up error reporting in parse_numa() (2018-10-17 16:=
33:40 -0300)
>> > > > >
>> > > > > ----------------------------------------------------------------
>> > > > > Machine queue, 2018-10-18
>> > > > >
>> > > > > * sysbus init/realize cleanups
>> > > > >   (C=C3=A9dric Le Goater, Philippe Mathieu-Daud=C3=A9)
>> > > > > * memory-device refactoring (David Hildenbrand)
>> > > > > * -smp: deprecate incorrect CPUs topology (Igor Mammedov)
>> > > > > * -numa parsing cleanups (Markus Armbruster)
>> > > > > * Fix hostmem-file memory leak (Zhang Yi)
>> > > > > * Typo fix (Li Qiang)
>> > > > >
>> > > > > ----------------------------------------------------------------
>> > > > >
>> > > >=20
>> > > > Hi. This had some problems in merge testing, I'm afraid:
>> > > >=20
>> > > > On aarch64 host, warnings running tests/cpu-plug-test for i386 and=
 s390 targets:
>> > > >=20
>> > > > TEST: tests/cpu-plug-test... (pid=3D12602)
>> > > >   /i386/cpu-plug/pc-i440fx-3.0/cpu-add/1x3x2&maxcpus=3D12:
>> > > > qemu-system-i386: warning: Invalid CPU topology deprecated: sockets
>> > > > (1) * cores (3) * threads (2) !=3D maxcpus (12)
>> > > [...]
>> > > >=20
>> > > > (plus similar ppc64, x86_64 targets)
>> > >=20
>> > > Ouch.  Apologies.
>> > >=20
>> > > Can we please do something make sure "make check" will fail on
>> > > these cases?  I'd like to be able to trust CI systems like
>> > > travis-ci.
>> > >=20
>> >=20
>> > we probably don't want make check fail on warning.
>>=20
>> I disagree.  If a warning is blocking a pull request from being
>> merged, it must make CI systems fail too.  Otherwise we're
>> defeating the purpose of CI systems.
>
> When we deprecate options we are bound to trigger warning which are not e=
rrors
> and are meant to be there until deprecated options are removed/tested by =
make check.
> So what would you suggest to do wrt tests that use deprecated features,
> drop testing for it?

We commonly suppress the warning when testing.  Search for
'if (qtest_enabled())'.
