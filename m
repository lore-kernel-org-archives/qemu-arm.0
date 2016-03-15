Received: by 10.25.208.211 with SMTP id h202csp620598lfg;
        Tue, 15 Mar 2016 07:17:21 -0700 (PDT)
X-Received: by 10.55.19.96 with SMTP id d93mr38039038qkh.12.1458051441193;
        Tue, 15 Mar 2016 07:17:21 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b53si11769594qga.33.2016.03.15.07.17.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 15 Mar 2016 07:17:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48473 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1afpmi-0003Zi-CZ
	for alex.bennee@linaro.org; Tue, 15 Mar 2016 10:17:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60805)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1afmBE-0007fu-Ug
	for qemu-arm@nongnu.org; Tue, 15 Mar 2016 06:26:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1afmB7-00047o-6N
	for qemu-arm@nongnu.org; Tue, 15 Mar 2016 06:26:24 -0400
Received: from 19.mo4.mail-out.ovh.net ([87.98.179.66]:47585)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1afmB7-00046h-06
	for qemu-arm@nongnu.org; Tue, 15 Mar 2016 06:26:17 -0400
Received: from mail178.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo4.mail-out.ovh.net (Postfix) with SMTP id 696BC10640B3
	for <qemu-arm@nongnu.org>; Tue, 15 Mar 2016 11:26:13 +0100 (CET)
Received: from localhost (HELO queueout) (127.0.0.1)
	by localhost with SMTP; 15 Mar 2016 12:26:12 +0200
Received: from deibp9eh1--blueice1n3.emea.ibm.com (HELO ?9.101.4.42?)
	(clg@kaod.org@195.212.29.165)
	by ns0.ovh.net with SMTP; 15 Mar 2016 12:25:41 +0200
To: andrew@aj.id.au, Jeremy Kerr <jk@ozlabs.org>,
	Peter Maydell <peter.maydell@linaro.org>
References: <1457928832-31026-1-git-send-email-andrew@aj.id.au>
	<56E790E2.7040006@ozlabs.org> <1458018080.29435.20.camel@aj.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <56E7E31B.20703@kaod.org>
Date: Tue, 15 Mar 2016 11:25:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.6.0
MIME-Version: 1.0
In-Reply-To: <1458018080.29435.20.camel@aj.id.au>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 16367488421530536881
X-Ovh-Remote: 195.212.29.165 (deibp9eh1--blueice1n3.emea.ibm.com)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-OVH-SPAMSTATE: OK
X-OVH-SPAMSCORE: -100
X-OVH-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeekjedrleekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeekjedrleekgddufecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 87.98.179.66
X-Mailman-Approved-At: Tue, 15 Mar 2016 10:17:16 -0400
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-arm] [PATCH v4 0/4] Add ASPEED AST2400 SoC and OpenPower
	BMC machine
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 4z3aSCUce3C7

On 03/15/2016 06:01 AM, Andrew Jeffery wrote:
> On Tue, 2016-03-15 at 12:34 +0800, Jeremy Kerr wrote:
>> Hi Andrew,
>>
>>> This patch series models enough of the ASPEED AST2400 ARM9 SoC[0] to
>>> boot an aspeed_defconfig Linux kernel[1][2]. Specifically, the series
>>> implements the ASPEED timer and VIC devices, integrates them into an
>>> AST2400 SoC and exposes it all through a new opbmc2400 machine. The
>>> device model patches only partially implement the hardware features of
>>> the timer and VIC, again mostly just enough to boot Linux.
>>
>> Awesome! Nice to have these patches escaping the lab :)
>>
>> In terms of naming suggestions: I think this depends on what we're
>> looking to emulate here. I see two options:
>>
>> The qemu platform becomes a "reference" for OpenPOWER bmc hardware, but
>> doesn't necessarily align with an actual machine. In that case,
>> something generic like opbmc- would make sense.
>>
>> On the other hand, if we'd like to create qemu platforms that represent
>> actual machines (eg, the OpenPOWER "palmetto" machine), then
>> -bmc would seem more appropriate. In this case, the machine
>> name would be palmetto-bmc. No need to include the SoC name in that, as
>> it's defined by the hardware implementation.
>>
>> I think the latter option may be more generally useful.
> 
> Okay, agreed, I'll rework the change to use palmetto-bmc for the
> machine name. Thanks for the feedback.

Yes. palmetto-bmc is good choice. Palmetto is a reference machine
for OpenPOWER. 

May be change also :

+    mc->desc = "OpenPOWER AST2400 BMC (ARM926EJ-S)";

to reflect that choice.

Thanks,

C. 

