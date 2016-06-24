Received: by 10.25.21.96 with SMTP id l93csp1001062lfi;
        Fri, 24 Jun 2016 04:49:58 -0700 (PDT)
X-Received: by 10.200.46.25 with SMTP id r25mr4212023qta.3.1466768998887;
        Fri, 24 Jun 2016 04:49:58 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o77si4577718qka.265.2016.06.24.04.49.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 24 Jun 2016 04:49:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42781 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bGPcU-00010t-Ch
	for alex.bennee@linaro.org; Fri, 24 Jun 2016 07:49:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55585)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bGPcP-00010n-Vj
	for qemu-arm@nongnu.org; Fri, 24 Jun 2016 07:49:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bGPcL-0007y2-RM
	for qemu-arm@nongnu.org; Fri, 24 Jun 2016 07:49:52 -0400
Received: from 11.mo1.mail-out.ovh.net ([188.165.48.29]:36690)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bGPcL-0007xw-LE
	for qemu-arm@nongnu.org; Fri, 24 Jun 2016 07:49:49 -0400
Received: from player758.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo1.mail-out.ovh.net (Postfix) with ESMTP id 88358FF95AA
	for <qemu-arm@nongnu.org>; Fri, 24 Jun 2016 13:49:48 +0200 (CEST)
Received: from [192.168.124.3] (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player758.ha.ovh.net (Postfix) with ESMTPSA id 21BC62C006D;
	Fri, 24 Jun 2016 13:49:40 +0200 (CEST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1466699607-30406-1-git-send-email-clg@kaod.org>
	<1466699607-30406-2-git-send-email-clg@kaod.org>
	<CAFEAcA-qovoyt-d2-KJyuj2bur9DrnRSFcPr2=iPOX2YzDMnZQ@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <299428ce-ddc5-816b-0014-21f3597fb8c6@kaod.org>
Date: Fri, 24 Jun 2016 13:49:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.1.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-qovoyt-d2-KJyuj2bur9DrnRSFcPr2=iPOX2YzDMnZQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
X-Ovh-Tracer-Id: 2187623521275448270
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrtdekgdegvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 188.165.48.29
Subject: Re: [Qemu-arm] [PATCH v3 1/5] m25p80: qdev-ify drive property
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
Cc: Kevin Wolf <kwolf@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
	Markus Armbruster <armbru@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CDLKLcRYEFIC

On 06/23/2016 08:35 PM, Peter Maydell wrote:
> On 23 June 2016 at 17:33, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>> From: Paolo Bonzini <pbonzini@redhat.com>
>>
>> This allows specifying the property via -drive if=3Dnone and creating
>> the flash device with -device.
>>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>> ---
>>  hw/arm/xilinx_zynq.c                |  8 +++++++-
>>  hw/arm/xlnx-ep108.c                 |  9 ++++++++-
>>  hw/block/m25p80.c                   | 10 ++--------
>>  hw/microblaze/petalogix_ml605_mmu.c |  9 ++++++++-
>>  4 files changed, 25 insertions(+), 11 deletions(-)
>=20
> hw/arm/sabrelite.c also creates one of these devices and needs updating=
.

OK. I will extend Paolo's patch then.

Thanks,=20

C.

