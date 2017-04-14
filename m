Received: by 10.25.0.144 with SMTP id 138csp158652lfa;
        Thu, 13 Apr 2017 23:45:48 -0700 (PDT)
X-Received: by 10.200.40.72 with SMTP id 8mr5887900qtr.204.1492152348460;
        Thu, 13 Apr 2017 23:45:48 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o16si1032620qkl.81.2017.04.13.23.45.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 13 Apr 2017 23:45:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52073 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cyuzL-0007IP-Va
	for alex.bennee@linaro.org; Fri, 14 Apr 2017 02:45:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37653)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cyuzE-0007IE-Hw
	for qemu-arm@nongnu.org; Fri, 14 Apr 2017 02:45:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cyuzA-00052d-Js
	for qemu-arm@nongnu.org; Fri, 14 Apr 2017 02:45:40 -0400
Received: from 3.mo178.mail-out.ovh.net ([46.105.44.197]:47443)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1cyuzA-00051Z-Dw
	for qemu-arm@nongnu.org; Fri, 14 Apr 2017 02:45:36 -0400
Received: from player715.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo178.mail-out.ovh.net (Postfix) with ESMTP id 238F33106D
	for <qemu-arm@nongnu.org>; Fri, 14 Apr 2017 08:45:34 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-1-10647-27.w90-89.abo.wanadoo.fr
	[90.89.233.27]) (Authenticated sender: postmaster@kaod.org)
	by player715.ha.ovh.net (Postfix) with ESMTPSA id 9F0B61C008F;
	Fri, 14 Apr 2017 08:45:27 +0200 (CEST)
To: Jason Wang <jasowang@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <1492076514-28821-1-git-send-email-clg@kaod.org>
	<196d16bd-09ad-bdf2-7c41-63e6d8697874@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <283d2bbe-056d-a3d6-d9fb-99dbae3863b5@kaod.org>
Date: Fri, 14 Apr 2017 08:45:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <196d16bd-09ad-bdf2-7c41-63e6d8697874@redhat.com>
Content-Type: text/plain; charset=utf-8
X-Ovh-Tracer-Id: 8074109708891687856
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeliedrudelgddutdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 46.105.44.197
Subject: Re: [Qemu-arm] [PATCH v2 0/5] FTGMAC100 nic model for the Aspeed
 SoCs
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
Cc: Dmitry Fleytman <dmitry@daynix.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	Jan Kiszka <jan.kiszka@siemens.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CuR8FGh5/F47

On 04/14/2017 08:26 AM, Jason Wang wrote:
>=20
>=20
> On 2017=E5=B9=B404=E6=9C=8813=E6=97=A5 17:41, C=C3=A9dric Le Goater wro=
te:
>> Hi,
>>
>> The Aspeed SoCs AST2400 and AST2500 have two FTGMAC100 ethernet
>> controllers. This serie proposes a model for this device and a way to
>> customize the bit definitions which are slightly different from the
>> Faraday definitions.
>>
>> The last patch adds a fake NC-SI (Network Controller Sideband
>> Interface) backend to pretend a NIC is being managed. This is only
>> usable with the slirp stack.
>>
>> The model has been tested on the 'palmetto', 'romulus' and
>> 'ast2500-evb' machines using different implementations of the Linux
>> driver and with U-Boot.  It has been stressed with iperf.
>>
>> Thanks,
>>
>> C.
>>
>> C=C3=A9dric Le Goater (5):
>>    hw/net: add MII definitions
>>    net: add FTGMAC100 support
>>    net/ftgmac100: add a 'aspeed' property
>>    aspeed: add a FTGMAC100 nic
>>    slirp: add a fake NC-SI backend
>>
>>   default-configs/arm-softmmu.mak |    1 +
>>   hw/arm/aspeed_soc.c             |   21 +
>>   hw/net/Makefile.objs            |    1 +
>>   hw/net/ftgmac100.c              | 1016 +++++++++++++++++++++++++++++=
++++++++++
>>   include/hw/arm/aspeed_soc.h     |    2 +
>>   include/hw/net/ftgmac100.h      |   64 +++
>>   include/hw/net/mii.h            |   71 ++-
>>   include/net/eth.h               |    1 +
>>   slirp/Makefile.objs             |    2 +-
>>   slirp/ncsi-pkt.h                |  418 ++++++++++++++++
>>   slirp/ncsi.c                    |   78 +++
>>   slirp/slirp.c                   |    4 +
>>   slirp/slirp.h                   |    3 +
>>   13 files changed, 1663 insertions(+), 19 deletions(-)
>>   create mode 100644 hw/net/ftgmac100.c
>>   create mode 100644 include/hw/net/ftgmac100.h
>>   create mode 100644 slirp/ncsi-pkt.h
>>   create mode 100644 slirp/ncsi.c
>>
>=20
> Want to merge but looks like patch 2 does not apply cleanly on qemu mas=
ter.

ah. I will check that. Anyhow I have improved the fake NC-SI model. So I =
will=20
send a v3.=20

Thanks,

C.=20

