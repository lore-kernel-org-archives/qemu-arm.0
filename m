Received: by 10.28.4.212 with SMTP id 203csp1660143wme;
        Sat, 21 Apr 2018 02:42:30 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZprOLpKOdcV5tdzHIjBsR5oDxzP0lrpY48JYRLg26JS12y8coHIPT1jwU+BKUdLwLB/+IWt
X-Received: by 2002:ac8:2447:: with SMTP id d7-v6mr15223566qtd.50.1524303750109;
        Sat, 21 Apr 2018 02:42:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524303750; cv=none;
        d=google.com; s=arc-20160816;
        b=EoGIJgMSx0LaC2SNAUdjbwNc8x8IHz8tgSbPao0yfRz7eAw0/v/9F6S2PcOS38SQb3
         ihjucjzQE6nTeGwOdzr0bLTmM8iP7R017cN7W5nE2f+Fr4JMc3cnrOs5Vi4QdkmiCkW6
         kt5pH/SI4PdHJ1V4GyMbK1A3KnLJU9TatcOi5CXK9l7YIpNZQqr9WD97LYKgLGrzIxcx
         ADYcIELadJ7bG3orLo0YYpZ7r0Z4VSmDlVCpt5XyaNucwwHMqMILojWRf06L/vPB8kso
         IQmE46X9AUOk3tsXzO0xqS5kVZsugu50xCIR6wq3iQBF9GPyj48Herkp1M2n1t5Q3j5X
         kU3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=jTeotSqc5kSiey3ngI3MLhKGZfI/z6tKh8dcFNay6kU=;
        b=fIr5/PbMUEmMAQQTrKuOLkPbxEAUkgSWi9xUptUT/yI6JSpJB9JI5Xp70wrdAjtfZA
         wWhDmLQc0bVrVLOG83u/3lgf1M8YxRd3w0G2jUqxLiN7ECCnm6S1hZ49C5/HzL03+UsS
         uPd5mu9/wJFuxzccy817MjpofelX3aRNQfphmoGUpQlYtH4rKF5eeSRcaiSxlUJreFYL
         eN8W2LhZt4pcrhqQi/mrODmdJmWac2UDFf68eeiMUqJlhPfn3oPt6VySo5JJEfhqUN5N
         vTSBRkf4KKfisbm3am1le5OdDlEeohhNxF4PsuXFt47irvwCqM1HSi9wCC1H1od3+0IK
         NTpw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y63si6514791qka.292.2018.04.21.02.42.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 21 Apr 2018 02:42:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58011 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f9p2L-0000cZ-Ll
	for alex.bennee@linaro.org; Sat, 21 Apr 2018 05:42:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46358)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1f9p2B-0000ag-CH
	for qemu-arm@nongnu.org; Sat, 21 Apr 2018 05:42:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1f9p28-0007Dy-9P
	for qemu-arm@nongnu.org; Sat, 21 Apr 2018 05:42:19 -0400
Received: from 8.mo2.mail-out.ovh.net ([188.165.52.147]:45987)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1f9p28-0007CO-2O
	for qemu-arm@nongnu.org; Sat, 21 Apr 2018 05:42:16 -0400
Received: from player796.ha.ovh.net (unknown [10.109.108.84])
	by mo2.mail-out.ovh.net (Postfix) with ESMTP id 54C4712D01C
	for <qemu-arm@nongnu.org>; Sat, 21 Apr 2018 11:42:14 +0200 (CEST)
Received: from zorba.kaod.org (bad36-1-78-202-132-1.fbx.proxad.net
	[78.202.132.1]) (Authenticated sender: postmaster@kaod.org)
	by player796.ha.ovh.net (Postfix) with ESMTPSA id A4FBD5C0093;
	Sat, 21 Apr 2018 11:42:06 +0200 (CEST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180420124835.7268-1-peter.maydell@linaro.org>
	<20180420124835.7268-3-peter.maydell@linaro.org>
	<f80b3748-12d4-de8b-1661-e07a7d33b60a@kaod.org>
	<CAFEAcA8g_qcXj7ErMNODexU4k2k56nYUSzoh3WX06mZTVRMLLg@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <11085e2c-69dd-93b1-ebeb-5b7c1257e26e@kaod.org>
Date: Sat, 21 Apr 2018 11:42:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8g_qcXj7ErMNODexU4k2k56nYUSzoh3WX06mZTVRMLLg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 537617207387786034
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtgedrjeelgddvtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 188.165.52.147
Subject: Re: [Qemu-arm] [PATCH 2/3] hw/arm/aspeed: don't make 'boot_rom'
 region 'nomigrate'
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
Cc: Rob Herring <robh@kernel.org>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: edNMHpfIN8Y7

On 04/21/2018 11:34 AM, Peter Maydell wrote:
> On 21 April 2018 at 10:07, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>> On 04/20/2018 02:48 PM, Peter Maydell wrote:
>>> Currently we use memory_region_init_ram_nomigrate() to create
>>> the "aspeed.boot_rom" memory region, and we don't manually
>>> register it with vmstate_register_ram(). This currently
>>> means that its contents are migrated but as a ram block
>>> whose name is the empty string; in future it may mean they
>>> are not migrated at all. Use memory_region_init_ram() instead.
>>>
>>> Note that this is a cross-version migration compatibility break
>>> for the "palmetto-bmc", "ast2500-evb" and "romulus-bmc" machines.
>>
>> Migration does not work for these.
>=20
> Well, at least we're not breaking anything :-)
> Do you know why migration doesn't work?

A quick migration test shows that :

qemu-system-arm: Missing section footer for aspeed.timerctrl
qemu-system-arm: load of migration failed: Invalid argument

which is surprising, the state looks correct. I will dig in.=20

Thanks,

C.


    "aspeed.timerctrl (8)": {
        "ctrl": "0x00000003",
        "ctrl2": "0x00000000",
        "timers": [
            {
                "id": "0x00",
                "level": "0x00000000",
                "timer": "00 00 00 29 aa bd 88 44",
                "reload": "0xffffffff",
                "match": [
                    "0x00000000",
                    "0x00000000"
                ]
            },
            {
                "id": "0x01",
                "level": "0x00000000",
                "timer": "ff ff ff ff ff ff ff ff",
                "reload": "0x00000000",
                "match": [
                    "0x00000000",
                    "0x00000000"
                ]
            },
            {
                "id": "0x02",
                "level": "0x00000000",
                "timer": "ff ff ff ff ff ff ff ff",
                "reload": "0x00000000",
                "match": [
                    "0x00000000",
                    "0x00000000"
                ]
            },
            {
                "id": "0x03",
                "level": "0x00000000",
                "timer": "ff ff ff ff ff ff ff ff",
                "reload": "0xffffffff",
                "match": [
                    "0x00000000",
                    "0x00000000"
                ]
            },
            {
                "id": "0x04",
                "level": "0x00000000",
                "timer": "ff ff ff ff ff ff ff ff",
                "reload": "0x00000000",
                "match": [
                    "0x00000000",
                    "0x00000000"
                ]
            },
            {
                "id": "0x05",
                "level": "0x00000000",
                "timer": "ff ff ff ff ff ff ff ff",
                "reload": "0x00000000",
                "match": [
                    "0x00000000",
                    "0x00000000"
                ]
            },
            {
                "id": "0x06",
                "level": "0x00000000",
                "timer": "ff ff ff ff ff ff ff ff",
                "reload": "0x00000000",
                "match": [
                    "0x00000000",
                    "0x00000000"
                ]
            },
            {
                "id": "0x07",
                "level": "0x00000000",
                "timer": "ff ff ff ff ff ff ff ff",
                "reload": "0x00000000",
                "match": [
                    "0x00000000",
                    "0x00000000"
                ]
            }
        ]
    },
