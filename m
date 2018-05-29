Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp3785864wre;
        Tue, 29 May 2018 09:57:49 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIDAZCDr5PMaH6fymFWfJC867UU6kUbckDdZ48ctM4MAn6aZWcL7fu7IP162zkTF+vNNDyQ
X-Received: by 2002:a37:cbd3:: with SMTP id u80-v6mr15129566qkl.290.1527613069474;
        Tue, 29 May 2018 09:57:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527613069; cv=none;
        d=google.com; s=arc-20160816;
        b=AhVIjr2BByIyb+CarVcjrTTgp7Md5NyqzP8cMljJJX1bNOMWcDmQXVjeOEuix+kmwO
         tWhVhvaHwtdBQ/nwqSsV/iK2ybLegSPNJuK6Tc759Zb5IHtunSwz1PlmWLNHj3fW0o+4
         wGGGfxDZlr1iCoJy3s4yTcSq7k0D3GwaSQTDvbGa9chMLJrBKOjcmsEauyWpZfko6Q0w
         OwxM8R2hQvplORrDRu9pI04FChsetUXJKmboMWeqt+oQzO19Lm++J51gyhc6OkduknDP
         NQqqwa/DT/LhAWnyDnI1jU+19VhH79vNGWecG0svSOFoiz8knXpubRAK0aqDTvJ45IQc
         OkhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=Q10GVMNOLsLs7RLoiNP+ClbpVGkXldYCu7pOif+kUKQ=;
        b=O92e6VeAhr0snTY3ZHTT9lSyss7y8oSEx10MIfvnnsXzDGbA0KKqyDOtpdwlMBZdp5
         NflOMWiawAszF11Vzqvy4eqPwY3v7ysxd9w3KYS0iVtCUwoHkIbLxJS+6MuN6UpDPPc9
         rN3Ks06ptdklPumycYgC/eu1E/ZjpboSYNw9jWbbLMe8cL29D0g9Przr7SNaTsiHKlqJ
         3Tngaf4MpM1tgye4fUuSlIGFJiS9eNF56qRUi3hUMA6pJA5g8EXGjsByUIeBfluhXqaL
         eHOjAXbfMR17l3fWSJ0E1ic6Bp2WqxwHjkpdpATyRamyyRwRe2O2L2luQr/GIn61zBOn
         BGWA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e31-v6si3471293qve.100.2018.05.29.09.57.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 May 2018 09:57:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34008 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNhwT-0008T0-42
	for alex.bennee@linaro.org; Tue, 29 May 2018 12:57:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52183)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fNhwL-0008RY-8i
	for qemu-arm@nongnu.org; Tue, 29 May 2018 12:57:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fNhwH-0005wu-Br
	for qemu-arm@nongnu.org; Tue, 29 May 2018 12:57:41 -0400
Received: from 8.mo178.mail-out.ovh.net ([46.105.74.227]:58143)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1fNhwH-0005vv-5Y
	for qemu-arm@nongnu.org; Tue, 29 May 2018 12:57:37 -0400
Received: from player771.ha.ovh.net (unknown [10.109.105.30])
	by mo178.mail-out.ovh.net (Postfix) with ESMTP id A358B166F7
	for <qemu-arm@nongnu.org>; Tue, 29 May 2018 18:57:35 +0200 (CEST)
Received: from zorba.kaod.org (deibp9eh1--blueice1n0.emea.ibm.com
	[195.212.29.162]) (Authenticated sender: postmaster@kaod.org)
	by player771.ha.ovh.net (Postfix) with ESMTPSA id 101488400AA;
	Tue, 29 May 2018 18:57:30 +0200 (CEST)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	qemu-arm@nongnu.org
References: <20180529062838.20556-1-clg@kaod.org>
	<fac124fe-d816-1bb2-c8b3-d1a0213f968b@amsat.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <15666557-66b1-78e0-1062-b3a28ecaf580@kaod.org>
Date: Tue, 29 May 2018 18:57:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <fac124fe-d816-1bb2-c8b3-d1a0213f968b@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 9691464923922467648
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedthedrheekgddutdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 46.105.74.227
Subject: Re: [Qemu-arm] [PATCH 0/6] ftgmac100 and NC-SI enhancements for the
 Aspeed SoC
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
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QfTVmk3wHmHT

On 05/29/2018 02:34 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> Hi C=C3=A9dric,
>=20
> On 05/29/2018 03:28 AM, C=C3=A9dric Le Goater wrote:
>> Hello,
>>
>> Here is a couple of enhancements and fixes for the ftgmac100 NIC used
>> on the Aspeed SoC. It includes VLAN and multicast support.
>>
>> Following is an assorted set of changes for the NC-SI backend also
>> used on the Aspeed SoC when soldered on OpenPOWER boards. These fix a
>> few problems found when running OpenBMC on aspeed QEMU machines.
>>
>> Thanks,
>>
>> C=C3=A9dric.
>>
>> C=C3=A9dric Le Goater (6):
>>   ftgmac100: compute maximum frame size depending on the protocol
>>   ftgmac100: add IEEE 802.1Q VLAN support
>>   net/ftgmac100: fix multicast hash routine
>>   slirp/ncsi: fix "Get Version ID" payload length
>>   slirp/ncsi: add a "Get Parameter" response
>>   slirp/ncsi: add checksum support
>=20
> Doesn't it make more sens to have slirp patches applied previous to the
> ftgmac100 model?

why ? They are not necessarily dependent.=20

C.

>=20
>>
>>  include/hw/net/ftgmac100.h |  7 +++++-
>>  hw/net/ftgmac100.c         | 59 +++++++++++++++++++++++++++++++++++--=
---------
>>  slirp/ncsi.c               | 54 +++++++++++++++++++++++++++++++++++++=
-----
>>  3 files changed, 99 insertions(+), 21 deletions(-)
>>

