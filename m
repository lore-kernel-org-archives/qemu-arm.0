Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp4208609wrq;
        Mon, 11 Jun 2018 08:55:45 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIebKAiELY5gpksvN3eqcIpOgRQo686sREiznHsWRrw8qEdd2A6jP3H8w5uHLHazxeiGTxR
X-Received: by 2002:ac8:2351:: with SMTP id b17-v6mr15488612qtb.304.1528732545679;
        Mon, 11 Jun 2018 08:55:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528732545; cv=none;
        d=google.com; s=arc-20160816;
        b=lFdTsSDryh6DqYXve0ZaweOf5FD1tDT7la4FoB3U0KxjIIcBrOiG7FxV20FCxPnXa7
         yK6T7Z2t9f7j/ZLAN8HR1WhCq9THhe3myXDYBwlBhY7G7NM0IY83Yx1gzAFIoe0ByB3f
         /JioFvz5/d4HejiQs6qPwmphIeJ+55V/6R11WVmqJdBS7YboZWM8Xvd3CLNodcCoVoeC
         BCCOAjUPVX20VHbhNnHFxHYMiIURoLORY6GiMq4cgJrs/cAxhoMI6YbrsJaA3WEdNjGY
         wznWZu/E1RYPavVMbxvKxut4Knh3k404AOmtLkdG5/BJbCY2f/7hmWwMnIKV/ML2qoJC
         3RBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:organization:from:references:to
         :arc-authentication-results;
        bh=x0L5E0UQVeFXyak6ID/irC3hXh5sjlq2MfzeIZNz9dA=;
        b=qyPgENpTZYtU84MSbYT2gUn0fqEZjap5PEvsQ0g2RbPDslicexG5bgUAHfPgtVuqc/
         227+O60ogDCYBsCbOEIEJXSjpab310Rqo6YelTiwrCYpiqVXmldeWUMahnRY7qkDIh31
         SF0pRgF4ANYNp3WhDMtquJLauFTKlPh3swc475K/yIWlXGHnJ2aCqYDhyfpjaY3soMcg
         6PPt8A17OiCsGbAPrDg1Co2XeI5JdUpTYfE3mhLV7ImRf9ySqfNfomUPKd9Z3UBETCDB
         P/aMF8zciL6xOtyAlnBDAri4YKdVaI2x+AQo0+BIY+FqbSkyklyj3v27dVbMgNdBjm6n
         abWA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s8-v6si785068qta.56.2018.06.11.08.55.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Jun 2018 08:55:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49733 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fSPAX-0001vb-4c
	for alex.bennee@linaro.org; Mon, 11 Jun 2018 11:55:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51955)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1fSPAJ-0001te-EN
	for qemu-arm@nongnu.org; Mon, 11 Jun 2018 11:55:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1fSPAG-0000a6-CJ
	for qemu-arm@nongnu.org; Mon, 11 Jun 2018 11:55:31 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:36872 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1fSPAG-0000Ze-5R; Mon, 11 Jun 2018 11:55:28 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C5C418AA17;
	Mon, 11 Jun 2018 15:55:26 +0000 (UTC)
Received: from [10.10.120.103] (ovpn-120-103.rdu2.redhat.com [10.10.120.103])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0680420357CA;
	Mon, 11 Jun 2018 15:55:17 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>,
	Nikunj A Dadhania <nikunj@linux.vnet.ibm.com>
References: <20180611011501.10235-1-f4bug@amsat.org>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <54eb6ae9-d7e0-8a4d-6bd4-f8f1d0f00b92@redhat.com>
Date: Mon, 11 Jun 2018 10:55:17 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180611011501.10235-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Mon, 11 Jun 2018 15:55:27 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Mon, 11 Jun 2018 15:55:27 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eblake@redhat.com' RCPT:''
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
	qemu-devel@nongnu.org, Alexander Graf <agraf@suse.de>,
	Keith Busch <keith.busch@intel.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Michael Clark <mjc@sifive.com>,
	Gerd Hoffmann <kraxel@redhat.com>, Max Reitz <mreitz@redhat.com>,
	Yongbok Kim <yongbok.kim@mips.com>, Marek Vasut <marex@denx.de>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Alberto Garcia <berto@igalia.com>, qemu-block@nongnu.org,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	qemu-trivial@nongnu.org, Jiri Slaby <jslaby@suse.cz>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Magnus Damm <magnus.damm@gmail.com>, Markus Armbruster <armbru@redhat.com>,
	Michael Walle <michael@walle.cc>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	=?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Richard Henderson <rth@twiddle.net>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>, Fam Zheng <famz@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	Fabien Chouteau <chouteau@adacore.com>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-s390x@nongnu.org,
	qemu-arm@nongnu.org, Peter Chubb <peter.chubb@nicta.com.au>,
	Yuval Shaia <yuval.shaia@oracle.com>, Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Chris Wulff <crwulff@gmail.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Paul Burton <paul.burton@mips.com>, qemu-ppc@nongnu.org,
	Cornelia Huck <cohuck@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: G0dFk0+f+X1m

On 06/10/2018 08:14 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> Hi,
>=20
> This series:
>=20
> - split the byte-based definitions from "qemu/cutils.h" to "qemu/units.=
h"
>    (this now triggers WARNING: 1 added file, does MAINTAINERS need upda=
ting?)
> - clean hw/ includes;
> - replace different constants used for byte size with their correspondi=
ng
>    IEC binary prefix definitions.
>=20
> Since v3:
> - use IEC binary prefix definitions (Stefan Weil)
> - rebased
> - added R-b tags
>=20

>   hw/net/ne2000.h                          |  5 ++--
...
>   tests/test-qemu-opts.c                   |  7 +++---
>   scripts/checkpatch.pl                    |  1 +
>   135 files changed, 533 insertions(+), 431 deletions(-)
>   create mode 100644 include/qemu/units.h
>=20

At least monitor.c and vl.c are missing from this list; a more general=20
grep shows that the following are all potential candidates for this clean=
up:

$ git grep -n '[<>][<>]=3D [1-5]0'
disas/m68k.c:787:      val >>=3D 10;
hw/mips/mips_malta.c:194:    ram_size >>=3D 20;
hw/ppc/sam460ex.c:129:    ram_size >>=3D 20;
hw/timer/sh_timer.c:112:        case 4: freq >>=3D 10; break;
linux-user/mips/cpu_loop.c:641:                                code >>=3D=
 10;
linux-user/mips/cpu_loop.c:664:                        code >>=3D 10;
monitor.c:3198:                    val <<=3D 20;
target/m68k/helper.c:386:    size >>=3D 10;
target/m68k/helper.c:390:        size >>=3D 10;
target/m68k/helper.c:394:            size >>=3D 10;
target/xtensa/helper.c:729:            sz >>=3D 20;
target/xtensa/helper.c:732:            sz >>=3D 10;
vl.c:2793:            sz <<=3D 20;

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org
