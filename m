Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp4243687wrq;
        Mon, 11 Jun 2018 09:28:19 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJuviqcCFaAcBYa/dEor9P2eJRYZsQloiZqaqL6FhODHOPs06OWWh+MCNyUIvmQ9NYRXzCC
X-Received: by 2002:ae9:dd06:: with SMTP id r6-v6mr7632450qkf.417.1528734499326;
        Mon, 11 Jun 2018 09:28:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528734499; cv=none;
        d=google.com; s=arc-20160816;
        b=ziZlGOXwzHzBpADQrhkURNV2hPbfJX6ZsG2Rb2u7SiGAa5WlWO/HKe0DBRxn2IPJmN
         7rqJVyfQFY59tNa7zurV9j07twND4CyVN7wgoI/mc1BopgJuC3UoUnhjzIZheQdm9IGw
         x4HSqVQuPfiuz1T7Oqy1P6wtnncuZthR58gS1kt1vkvEHm4h1FSWO2SNzzcTzLjqJeGS
         PC9fSuokEp1KrRFTSyequJ9hez8dogdgRNXkRXktGYflPfTW6CL27DKFukdmzLJDl0Nn
         J6LVkeHINBc2jMWbJd5vD+2Yyw+aSVt7f0EHdYzs+pAdAhnUvgQJ4c8/wIBxSngiZcGK
         sARw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:content-disposition
         :mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=605JhgJ3ORk1gPuSgkCNfM/j5xzdTQ9i0BIyhHbE5zs=;
        b=Z9nRtDvQjBKKUcNT7/e7GH0/T/2p02tSwjYwuyrnMa1NoPt2iy1j3Q2stK69ENVOB8
         8sVj3bXFy8RQekmP9vwyx7BG0m+20uL9aWlt9a+fqoNZdIzRuoBos0TNfXUp76dHigjp
         iMudPAs05kEMWJWJmybgSK4/2FR5iEyznN/AH/gMqklzcHZ9DsFu5FajAXWzSnUmuZrI
         KUZGwEdOqPQ4XqwGfP61gOL0PNw+koWF/I+4x2l07ZnxrygwoTo6S8euvRLznSC2drn8
         RnMpqy4kKoMt6cNkz7gYyCmzuonF0PobvTKy24JqpI6gkcOz2AGFQsElHiSs8LKTUi05
         202w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m44-v6si17720150qta.390.2018.06.11.09.28.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Jun 2018 09:28:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50100 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fSPg2-0006w9-T1
	for alex.bennee@linaro.org; Mon, 11 Jun 2018 12:28:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39941)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1fSPfr-0006uR-LK
	for qemu-arm@nongnu.org; Mon, 11 Jun 2018 12:28:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1fSPfo-0001H6-Ei
	for qemu-arm@nongnu.org; Mon, 11 Jun 2018 12:28:07 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:59722 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1fSPfo-0001GS-8l; Mon, 11 Jun 2018 12:28:04 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1872D406E8A1;
	Mon, 11 Jun 2018 16:28:03 +0000 (UTC)
Received: from redhat.com (ovpn-122-170.rdu2.redhat.com [10.10.122.170])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 56E8C2024CA2;
	Mon, 11 Jun 2018 16:27:57 +0000 (UTC)
Date: Mon, 11 Jun 2018 19:27:57 +0300
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eric Blake <eblake@redhat.com>
Message-ID: <20180611192510-mutt-send-email-mst@kernel.org>
References: <20180611011501.10235-1-f4bug@amsat.org>
	<54eb6ae9-d7e0-8a4d-6bd4-f8f1d0f00b92@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <54eb6ae9-d7e0-8a4d-6bd4-f8f1d0f00b92@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Mon, 11 Jun 2018 16:28:03 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Mon, 11 Jun 2018 16:28:03 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'mst@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [PATCH v4 00/40] Use the IEC binary prefix
 definitions
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
	Jan Kiszka <jan.kiszka@web.de>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
	Palmer Dabbelt <palmer@sifive.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	Keith Busch <keith.busch@intel.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Michael Clark <mjc@sifive.com>,
	Gerd Hoffmann <kraxel@redhat.com>, Max Reitz <mreitz@redhat.com>,
	Yongbok Kim <yongbok.kim@mips.com>, Marek Vasut <marex@denx.de>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Alberto Garcia <berto@igalia.com>, qemu-block@nongnu.org,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	qemu-trivial@nongnu.org, Jiri Slaby <jslaby@suse.cz>,
	Magnus Damm <magnus.damm@gmail.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Michael Walle <michael@walle.cc>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	=?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Richard Henderson <rth@twiddle.net>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Thomas Huth <thuth@redhat.com>, Fam Zheng <famz@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Nikunj A Dadhania <nikunj@linux.vnet.ibm.com>,
	Stefan Weil <sw@weilnetz.de>, Alistair Francis <alistair@alistair23.me>,
	Fabien Chouteau <chouteau@adacore.com>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-s390x@nongnu.org,
	qemu-arm@nongnu.org, Peter Chubb <peter.chubb@nicta.com.au>,
	Yuval Shaia <yuval.shaia@oracle.com>, Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Kevin Wolf <kwolf@redhat.com>, Alexander Graf <agraf@suse.de>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Chris Wulff <crwulff@gmail.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Paul Burton <paul.burton@mips.com>, qemu-ppc@nongnu.org,
	Cornelia Huck <cohuck@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dnvw/3BLV7tF

On Mon, Jun 11, 2018 at 10:55:17AM -0500, Eric Blake wrote:
> On 06/10/2018 08:14 PM, Philippe Mathieu-Daud=E9 wrote:
> > Hi,
> >=20
> > This series:
> >=20
> > - split the byte-based definitions from "qemu/cutils.h" to "qemu/unit=
s.h"
> >    (this now triggers WARNING: 1 added file, does MAINTAINERS need up=
dating?)
> > - clean hw/ includes;
> > - replace different constants used for byte size with their correspon=
ding
> >    IEC binary prefix definitions.
> >=20
> > Since v3:
> > - use IEC binary prefix definitions (Stefan Weil)
> > - rebased
> > - added R-b tags
> >=20
>=20
> >   hw/net/ne2000.h                          |  5 ++--
> ...
> >   tests/test-qemu-opts.c                   |  7 +++---
> >   scripts/checkpatch.pl                    |  1 +
> >   135 files changed, 533 insertions(+), 431 deletions(-)
> >   create mode 100644 include/qemu/units.h
> >=20
>=20
> At least monitor.c and vl.c are missing from this list; a more general =
grep
> shows that the following are all potential candidates for this cleanup:
>=20
> $ git grep -n '[<>][<>]=3D [1-5]0'
> disas/m68k.c:787:      val >>=3D 10;
> hw/mips/mips_malta.c:194:    ram_size >>=3D 20;
> hw/ppc/sam460ex.c:129:    ram_size >>=3D 20;
> hw/timer/sh_timer.c:112:        case 4: freq >>=3D 10; break;

Most likely not 4 kilobyte.


> linux-user/mips/cpu_loop.c:641:                                code >>=3D=
 10;
> linux-user/mips/cpu_loop.c:664:                        code >>=3D 10;

Seems to do with decoding machine code. Also unlikely to be in bytes.

> monitor.c:3198:                    val <<=3D 20;
> target/m68k/helper.c:386:    size >>=3D 10;
> target/m68k/helper.c:390:        size >>=3D 10;
> target/m68k/helper.c:394:            size >>=3D 10;
> target/xtensa/helper.c:729:            sz >>=3D 20;
> target/xtensa/helper.c:732:            sz >>=3D 10;
> vl.c:2793:            sz <<=3D 20;




> --=20
> Eric Blake, Principal Software Engineer
> Red Hat, Inc.           +1-919-301-3266
> Virtualization:  qemu.org | libvirt.org
