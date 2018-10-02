Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp5222419wrt;
        Tue, 2 Oct 2018 08:58:28 -0700 (PDT)
X-Google-Smtp-Source: ACcGV60LmhBJED3qE7To94edgN7svPGr6R3PMsOLEJaOZFsEZbNvtL8gAjQGJ//HrY0UNkF8f/u8
X-Received: by 2002:a37:6204:: with SMTP id w4-v6mr12749589qkb.258.1538495908851;
        Tue, 02 Oct 2018 08:58:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538495908; cv=none;
        d=google.com; s=arc-20160816;
        b=txHiCZc6b0CCxXYiGEku1ACm/51qvDT7psYVqO9FalsMw8lZfl2ktAZsL5AfML4hGk
         Q4Z8Qky/sYeZjZWoQdvTC5kdrxt7KmSQUcWz2AlEqYCCr9YvELkcOJk/l40L6/356/dx
         FP8vrm0ykTSC/3YmV1aRX+4rNwATKzpUmhdjVZ/iqtkJ4CLPgwenAhQQBwUa/AoTGuZn
         p2GHaFJ5LQLzCPzegU4E7a/o2zigoOuAo9Glnc4UUdtkNpoAZ5PmCizHISwToqZMAaWi
         s5IY2dlboh/EjJd6MJrko0rJX5RRYAQT2fj/6xCbqrDWNEcmQIvL7frXbyTuNqvrmrpc
         O4qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=on5WAmcsryEsrITEHFyA7BF4gyFX2H+lY2+eJgJ7KkQ=;
        b=v8YoG+VpECbExV9jY5sGKoqrppUT13F1012hrYNuseS5WgTTijXvMkUb4/CvLOs3mL
         X98hbgnBdUyvXD/AyDY4oNdbdE6YFko/GsZ2/ykWS3I/3llQ9h+5tUUQ9Tspr+vXZWSk
         b8AOAbiOZ18oJJK8WMyQo3EaB+xssL4/EAEFb/i+uxpLIf4Ylrrbs7u2JGdMHXCznV7H
         IMw9kE8xgkw97C4G6AAmFIH+8yf/af1rmfk65ZHC9Fg9tMMMS4juKhVNrrBgSYjJypvt
         Qcadx0ML5RepQC0poyzlBTPWPqdTLEiK8GToYObwOzx6fD6p9iMWQesqFIsNkVVzW70b
         EY9A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c189-v6si1284335qkd.219.2018.10.02.08.58.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 02 Oct 2018 08:58:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44418 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g7N48-0003kA-Bf
	for alex.bennee@linaro.org; Tue, 02 Oct 2018 11:58:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48247)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1g7N2N-0002Mf-Uc
	for qemu-devel@nongnu.org; Tue, 02 Oct 2018 11:56:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1g7N2J-0001kJ-UJ
	for qemu-devel@nongnu.org; Tue, 02 Oct 2018 11:56:39 -0400
Received: from 2.mo3.mail-out.ovh.net ([46.105.75.36]:55147)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1g7N2J-0001jx-LR
	for qemu-devel@nongnu.org; Tue, 02 Oct 2018 11:56:35 -0400
Received: from player755.ha.ovh.net (unknown [10.109.159.152])
	by mo3.mail-out.ovh.net (Postfix) with ESMTP id 81E521D917F
	for <qemu-devel@nongnu.org>; Tue,  2 Oct 2018 17:56:33 +0200 (CEST)
Received: from zorba.kaod.org (unknown [145.131.95.179])
	(Authenticated sender: postmaster@kaod.org)
	by player755.ha.ovh.net (Postfix) with ESMTPSA id 82DD02600C9;
	Tue,  2 Oct 2018 17:56:22 +0200 (CEST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180921161939.822-1-clg@kaod.org>
	<CAFEAcA_Nm7qX1w16spsW-VgsMOebW=tNo9VT0paws7+9YH+zZQ@mail.gmail.com>
	<CAFEAcA8FuQRB-p-CxQ+D9ins1ubFzC4TpW21=0076LWETFv4Gg@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <ddc7e69e-7ee7-2868-9d5d-23593bd31493@kaod.org>
Date: Tue, 2 Oct 2018 17:56:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8FuQRB-p-CxQ+D9ins1ubFzC4TpW21=0076LWETFv4Gg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 10750373789099264964
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtkedrtddtgdeikecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.75.36
Subject: Re: [Qemu-devel] [PATCH v2 00/11] aspeed: misc fixes and
 enhancements (SMC)
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
Cc: Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Andrew Jeffery <andrew@aj.id.au>,
	Alistair Francis <alistair@alistair23.me>,
	QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5QYngZ4wo4HR

On 9/25/18 2:30 PM, Peter Maydell wrote:
> On 25 September 2018 at 13:20, Peter Maydell <peter.maydell@linaro.org>=
 wrote:
>> On 21 September 2018 at 17:19, C=C3=A9dric Le Goater <clg@kaod.org> wr=
ote:
>>> Hello,
>>>
>>> This series adds a couple of cleanups and two main features to the
>>> SMC controller of the Aspeed machines :
>>>
>>>  - a 'execute-in-place' property to boot directly from a memory regio=
n
>>>    alias of the FMC flash module using MMIO execution. This is not
>>>    activated by default because boot time needs to be improved on
>>>    recent firmwares. It also breaks migration compatibility.
>>>
>>>  - support for DMA to access the flash modules. Our primary need is
>>>    the checksum calculation which is used to evaluate the best clock
>>>    settings for reads.
>>
>> I've picked out the easy parts of this series and added
>> them to target-arm.next:
>>
>>>   aspeed/timer: fix compile breakage with clang 3.4.2
>>>   hw/arm/aspeed: change the FMC flash model of the AST2500 evb
>>>   hw/arm/aspeed: Add an Aspeed machine class
>>>   aspeed/smc: fix some alignment issues
>>
>> and left the rest for the moment (I've still got this series
>> on my to-review list).
>=20
> PS: review from people familiar with the SoC would also be helpful.

Joel has reviewed the u-boot patches. May be, he can chime in ?=20

Thanks,

C.=20

