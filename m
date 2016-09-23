Received: by 10.80.163.71 with SMTP id 65csp330840edn;
        Fri, 23 Sep 2016 02:34:43 -0700 (PDT)
X-Received: by 10.55.82.4 with SMTP id g4mr6397566qkb.220.1474623283366;
        Fri, 23 Sep 2016 02:34:43 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e34si4519445qkh.308.2016.09.23.02.34.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Sep 2016 02:34:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43101 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bnMsU-0006Vf-Rg
	for alex.bennee@linaro.org; Fri, 23 Sep 2016 05:34:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46686)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bnLqy-0002ec-94
	for qemu-devel@nongnu.org; Fri, 23 Sep 2016 04:29:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bnLqu-00050v-2g
	for qemu-devel@nongnu.org; Fri, 23 Sep 2016 04:29:03 -0400
Received: from 2.mo178.mail-out.ovh.net ([46.105.39.61]:38589)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bnLqt-00050b-Sq
	for qemu-devel@nongnu.org; Fri, 23 Sep 2016 04:29:00 -0400
Received: from player714.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo178.mail-out.ovh.net (Postfix) with ESMTP id 6243DFFB55C
	for <qemu-devel@nongnu.org>; Fri, 23 Sep 2016 10:28:58 +0200 (CEST)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player714.ha.ovh.net (Postfix) with ESMTPSA id 046BD3C0090;
	Fri, 23 Sep 2016 10:28:51 +0200 (CEST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1467634738-28642-1-git-send-email-clg@kaod.org>
	<1467634738-28642-5-git-send-email-clg@kaod.org>
	<577AA388.3060100@gmail.com>
	<2c52c156-2a32-b437-acd2-af13faaef55d@kaod.org>
	<CAFEAcA_MOhS04HiAVWg5xB8xBQ=krfZC6OBnH+X7UBo2_rf1uA@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <673755bd-c971-eb34-99b6-ac874a0d9a98@kaod.org>
Date: Fri, 23 Sep 2016 10:28:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_MOhS04HiAVWg5xB8xBQ=krfZC6OBnH+X7UBo2_rf1uA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
X-Ovh-Tracer-Id: 16701880693844577195
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelvddrtdejgddtvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 46.105.39.61
Subject: Re: [Qemu-devel] [PATCH 4/7] m25p80: add a m25p80_set_rom_storage()
 routine
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"mar.krzeminski" <mar.krzeminski@gmail.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XpqF7kfNRLch

On 09/23/2016 10:17 AM, Peter Maydell wrote:
> On 23 September 2016 at 08:19, C=C3=A9dric Le Goater <clg@kaod.org> wro=
te:
>> But the goal is to boot from the device, so I added a memory region al=
ias
>> at 0 to trigger the flash module mmios at boot time, as this is where
>> u-boot expects to be.
>>
>> and I fell in this trap :/
>>
>>         aspeed_smc_flash_read: To 0x0 of size 1: 0xbe mode:0
>>         Bad ram pointer (nil)
>>         Aborted (core dumped)
>>
>> There is a failure in get_page_addr_code(), possibly because qemu uses
>> byte per byte reads of the code (cpu_ldub_code). But this is beyond my
>> understanding of qemu's internal.
>=20
> This is a bug in how we report the problem, but the underlying
> issue here is attempting to execute from something that's not RAM
> or ROM. You can't execute code out of something backed by MMIO.

OK. So I see two solutions. T

The "brutal" one which is to copy the flash contents in a rom blob=20
at 0, but there is still an issue in getting access to the storage=20
anyhow, as it is internal to m25p80. Or we should get the name of the=20
backing file of the drive but I am not sure we are expected to do=20
that as I don't see any API for it.

The other solution is something like this patch which lets the storage=20
of the flash device be assigned externally.=20


Thanks,

C.

