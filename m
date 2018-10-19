Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp4220434wrt;
        Fri, 19 Oct 2018 11:46:46 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62/7mgXcEZd0tyjfVwkJt4ktjhCiF9/O/rRWcwX9l4Ox2KzpzdtnOpb22cIUdc/RKkbMzTr
X-Received: by 2002:ac8:6917:: with SMTP id e23-v6mr33863394qtr.104.1539974806361;
        Fri, 19 Oct 2018 11:46:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539974806; cv=none;
        d=google.com; s=arc-20160816;
        b=a7Vpxh0FWXWQUuLW7ziYzvpuYNIXpt0k2BBjCV4+E+pnhYRiErvAqCIwniGqFh1jn+
         fFFiuEuOg2OIYFd4YCDEyAJMnQkRSzkA2NkLY33WAwMOT+zxDROw0Ugqgo9pdRdfki/5
         Z1Lpy9i5rg9L6bMsgJKzXU0PyRA7+hPlacofHWga13b2mvLByHK1QVtm1XVfmTAq4Knj
         AprwPtkHzQtUHFih5Fah03a0w71sEBn0EvgUbrUNr1p+UCFhusB+8iqmMW0HuZFH00R1
         bDkippoLuNLhyCuRDw3EdakMPy9frdIhKK7jCno4/MhRBtVqMuroYUbJja3dk7fQYQap
         CZNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=Gr+eiuStM82BpLBPeHc3WYHstI+dq12wdy2tUgiJuc8=;
        b=pM/s+lP+wu132b/nQO+TQnZqeOSbQGLeBAooV7VGxHrZQ1W8Wecawi/ioqu+4Nxg6Y
         vos1SSooyIDENj1iHRsrEK1FtNrK+Xkv/QZZ6nn/LABwOAA47g/RT3c+J48nJc7nNK3K
         DlPBUoQDSStUhgng6/sQbcw/iZ9CehteHMMY9cW00Yl/StWgq46zybFSyYJF6tEShQo+
         439dL3TaDGcDRQgcctj8LFbOiBCIJsu7bsPT9ux4uhgLMmW+kzBeLEecqczcTqpP9eQV
         B1acEsux1O3KcLXadQnK7KpbANvZ9lP7W6I2T2UyErzxBj2SGncvvVGJ0m7LkEF9AXfC
         66Ig==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p27-v6si6851641qvf.61.2018.10.19.11.46.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 Oct 2018 11:46:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52203 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gDZnJ-0008Rl-Qb
	for alex.bennee@linaro.org; Fri, 19 Oct 2018 14:46:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51430)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gDZnB-0008RR-Ap
	for qemu-arm@nongnu.org; Fri, 19 Oct 2018 14:46:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gDZn8-000745-5n
	for qemu-arm@nongnu.org; Fri, 19 Oct 2018 14:46:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59608)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gDZn7-00073g-UI; Fri, 19 Oct 2018 14:46:34 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DDE3E307D923;
	Fri, 19 Oct 2018 18:46:31 +0000 (UTC)
Received: from localhost (ovpn-117-52.phx2.redhat.com [10.3.117.52])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C9FDE6E50B;
	Fri, 19 Oct 2018 18:46:26 +0000 (UTC)
Date: Fri, 19 Oct 2018 15:44:08 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20181019184408.GG31060@habkost.net>
References: <20181018200422.4358-1-ehabkost@redhat.com>
	<CAFEAcA9p0dLoNQy7kBdcXMz0HiMGEZTBX67Lq2SizTY3kgeksw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <CAFEAcA9p0dLoNQy7kBdcXMz0HiMGEZTBX67Lq2SizTY3kgeksw@mail.gmail.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Fri, 19 Oct 2018 18:46:32 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PULL 00/45] Machine queue, 2018-10-18
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Libvirt <libvir-list@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	QEMU Developers <qemu-devel@nongnu.org>, Alexander Graf <agraf@suse.de>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Eric Blake <eblake@redhat.com>, Rob Herring <robh@kernel.org>,
	Markus Armbruster <armbru@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Richard Henderson <rth@twiddle.net>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Alistair Francis <alistair@alistair23.me>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
	Michael Walle <michael@walle.cc>, qemu-ppc <qemu-ppc@nongnu.org>,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: U1HGLHhYoRkx

On Fri, Oct 19, 2018 at 03:12:31PM +0100, Peter Maydell wrote:
> On 18 October 2018 at 21:03, Eduardo Habkost <ehabkost@redhat.com> wrot=
e:
> > The following changes since commit 09558375a634e17cea6cfbfec883ac2376=
d2dc7f:
> >
> >   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm=
-20181016-1' into staging (2018-10-16 17:42:56 +0100)
> >
> > are available in the Git repository at:
> >
> >   git://github.com/ehabkost/qemu.git tags/machine-next-pull-request
> >
> > for you to fetch changes up to 6d8e1bcc7dd5e819ce81e6a87fffe23e39c700=
cc:
> >
> >   numa: Clean up error reporting in parse_numa() (2018-10-17 16:33:40=
 -0300)
> >
> > ----------------------------------------------------------------
> > Machine queue, 2018-10-18
> >
> > * sysbus init/realize cleanups
> >   (C=E9dric Le Goater, Philippe Mathieu-Daud=E9)
> > * memory-device refactoring (David Hildenbrand)
> > * -smp: deprecate incorrect CPUs topology (Igor Mammedov)
> > * -numa parsing cleanups (Markus Armbruster)
> > * Fix hostmem-file memory leak (Zhang Yi)
> > * Typo fix (Li Qiang)
> >
> > ----------------------------------------------------------------
> >
>=20
> Hi. This had some problems in merge testing, I'm afraid:
>=20
> On aarch64 host, warnings running tests/cpu-plug-test for i386 and s390=
 targets:
>=20
> TEST: tests/cpu-plug-test... (pid=3D12602)
>   /i386/cpu-plug/pc-i440fx-3.0/cpu-add/1x3x2&maxcpus=3D12:
> qemu-system-i386: warning: Invalid CPU topology deprecated: sockets
> (1) * cores (3) * threads (2) !=3D maxcpus (12)
[...]
>=20
> (plus similar ppc64, x86_64 targets)

Ouch.  Apologies.

Can we please do something make sure "make check" will fail on
these cases?  I'd like to be able to trust CI systems like
travis-ci.

--=20
Eduardo
