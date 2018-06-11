Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp4235258wrq;
        Mon, 11 Jun 2018 09:19:47 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJt96G2Y38zF5vpd1tzVLZQvI6M/HIDQaIZZHKrjDY/qzscZr4dzGHqB2RXF2u34DBJddvh
X-Received: by 2002:a37:82c7:: with SMTP id e190-v6mr81173qkd.313.1528733987604;
        Mon, 11 Jun 2018 09:19:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528733987; cv=none;
        d=google.com; s=arc-20160816;
        b=rgTkeYLkg5K/13JzR0I0x6AYhr06fvdU2WSGg5JFAuRllqgzMBnEKGuiUxIzNn6eff
         R1tDGo5ce3LpgZFZIV9Kg3vhhBCQuAtyalzmirwILktHJl4IuqhFs26CYBnPbDfobeNl
         Pms8QiDWZDmhDqBQmBgtsjCmj1gLUyObDQ3ipYM/z3LvvWFp76DlgYOiFJuOk4HU8z/L
         Oc+HX4uljyI1n/38KG1rVG/6XWAixCGiEUVkU5A/E+6qVE7YF9ihPHVWwXJjnhdx5EhQ
         cXCy+PiCv75GJ5Oq2jcXHJYnQIPiWIwtu3rFRUU3B7onrFez1jQDp7wR5j9z7CuoKyfa
         DL+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:to:from:date:arc-authentication-results;
        bh=bt3qS6K9qzO1cUqljFrHXw+0mZzb7/sPzCkYTVuhmK0=;
        b=j54GW3GlIkLYacg/jPEteXIQgFVD+2+ZmmROziIEIJs9ZdIa5G4a6Kcnqjvy8NP0Ka
         AQnZjE+akDA6w8Exa+WOTw4XWtUVOpkbR+27TkbLde7KgxARrH1cqtMNHik/Sr1raLuk
         wfbySaUtJE8WjKAyNWTGOOrUvDrXy02LCnToFV5pe/7dpkyQZm+WaSrdRXn1OQNHLhCw
         fJm/mGL7b+NiMHxzsrqXdWK8UwvmQ2nIIqSjw8BmNAhhHubL1m5V7CouQjmbl9Fro/dG
         CR3YFJcKw/4CIVcoNExD1tGvTsliyt0XkTX8xOqz5T3sIMAb91XUCZ+KjwNwHAceKr2a
         6omw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l1-v6si5065368qvm.219.2018.06.11.09.19.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Jun 2018 09:19:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50001 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fSPXn-0001O7-2R
	for alex.bennee@linaro.org; Mon, 11 Jun 2018 12:19:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36426)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1fSPXY-0001My-DD
	for qemu-arm@nongnu.org; Mon, 11 Jun 2018 12:19:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1fSPXU-0004rS-BS
	for qemu-arm@nongnu.org; Mon, 11 Jun 2018 12:19:32 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:38800 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cohuck@redhat.com>)
	id 1fSPXU-0004rI-5b; Mon, 11 Jun 2018 12:19:28 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 17660808255D;
	Mon, 11 Jun 2018 16:19:27 +0000 (UTC)
Received: from gondolin (ovpn-117-32.ams2.redhat.com [10.36.117.32])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 80834112D18D;
	Mon, 11 Jun 2018 16:19:00 +0000 (UTC)
Date: Mon, 11 Jun 2018 18:18:56 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Message-ID: <20180611181856.71bf285a.cohuck@redhat.com>
In-Reply-To: <20180611011501.10235-1-f4bug@amsat.org>
References: <20180611011501.10235-1-f4bug@amsat.org>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Mon, 11 Jun 2018 16:19:27 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Mon, 11 Jun 2018 16:19:27 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'cohuck@redhat.com' RCPT:''
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
	qemu-trivial@nongnu.org, Eric Blake <eblake@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Magnus Damm <magnus.damm@gmail.com>, Markus Armbruster <armbru@redhat.com>,
	Michael Walle <michael@walle.cc>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	=?UTF-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
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
	Yuval Shaia <yuval.shaia@oracle.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Jiri Slaby <jslaby@suse.cz>,
	David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Chris Wulff <crwulff@gmail.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Paul Burton <paul.burton@mips.com>, qemu-ppc@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: z8lYNPOfTeZ9

On Sun, 10 Jun 2018 22:14:21 -0300
Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:

> Hi,
>=20
> This series:
>=20
> - split the byte-based definitions from "qemu/cutils.h" to "qemu/units.h"
>   (this now triggers WARNING: 1 added file, does MAINTAINERS need updatin=
g?)
> - clean hw/ includes;
> - replace different constants used for byte size with their corresponding
>   IEC binary prefix definitions.

Do we document preference for this somewhere? Can we automatically
check for this?
