Received: by 10.25.21.96 with SMTP id l93csp140413lfi;
        Fri, 1 Jul 2016 00:01:15 -0700 (PDT)
X-Received: by 10.55.192.143 with SMTP id v15mr23809116qkv.23.1467356475031;
        Fri, 01 Jul 2016 00:01:15 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 10si1254125qki.193.2016.07.01.00.01.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 Jul 2016 00:01:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54045 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bIsRu-0002bp-DY
	for alex.bennee@linaro.org; Fri, 01 Jul 2016 03:01:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57733)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bIs8o-0006PA-1l
	for qemu-devel@nongnu.org; Fri, 01 Jul 2016 02:41:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bIs8k-00045U-SL
	for qemu-devel@nongnu.org; Fri, 01 Jul 2016 02:41:30 -0400
Received: from 2.mo53.mail-out.ovh.net ([178.33.254.39]:56250)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bIs8k-00044L-MD
	for qemu-devel@nongnu.org; Fri, 01 Jul 2016 02:41:26 -0400
Received: from player158.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo53.mail-out.ovh.net (Postfix) with ESMTP id 9A997FF90C9
	for <qemu-devel@nongnu.org>; Fri,  1 Jul 2016 08:41:25 +0200 (CEST)
Received: from [192.168.124.3] (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player158.ha.ovh.net (Postfix) with ESMTPSA id 1520462009A;
	Fri,  1 Jul 2016 08:41:21 +0200 (CEST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1467301824-10123-1-git-send-email-clg@kaod.org>
	<CAFEAcA_iAVMPNxi8m=uv9OTGoHqxg8egsLT+SN=YFJA=tS4B9w@mail.gmail.com>
	<4c195494-c97a-29e5-f5fb-88e26e71ae13@kaod.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <0ec7be7e-7ca2-bef7-7285-129101ee7e64@kaod.org>
Date: Fri, 1 Jul 2016 08:41:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.1.0
MIME-Version: 1.0
In-Reply-To: <4c195494-c97a-29e5-f5fb-88e26e71ae13@kaod.org>
Content-Type: text/plain; charset=utf-8
X-Ovh-Tracer-Id: 1194861276991622059
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrudekgdduuddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 178.33.254.39
Subject: Re: [Qemu-devel] [PATCH 1/2] hw/misc: fix Aspeed SCU hw-strap2
 property
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
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mWTsRF1479zd

On 07/01/2016 08:11 AM, C=C3=A9dric Le Goater wrote:
> On 06/30/2016 08:24 PM, Peter Maydell wrote:
>> On 30 June 2016 at 16:50, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>>> These strap registers are complex enough, let's not mix them.
>>>
>>> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>>
>> Was there a cover letter for this patchset? I can't find
>> it in my email...
>=20
> Ah :/ No, I didn't send one as the patches were small and self=20
> contained. Should we each time ?=20

Let me rework that if possible. I need to add a few things.=20

Thanks,

C.

