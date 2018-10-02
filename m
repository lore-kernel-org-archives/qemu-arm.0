Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp5220954wrt;
        Tue, 2 Oct 2018 08:56:55 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63LtAtdObVZ62R4PLk47eyNUAcvXYdxeBN04Oo6HhNWEqgHt2SAIvqFz2msykcIlJrNUSCz
X-Received: by 2002:ad4:51d2:: with SMTP id p18-v6mr13167727qvq.186.1538495815661;
        Tue, 02 Oct 2018 08:56:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538495815; cv=none;
        d=google.com; s=arc-20160816;
        b=MrYHdlRwXb8jxVyCLxvyBQS2QhV6pnTLNo1Gs07a18VANeMIpsat6Ba97SzHjRsbRf
         UsxodD09e6nr12RpAePHwmiw+tZye1/Tulfhiyt17w9GiBgDM5TEd3co/d88Q/eQCPMU
         0ZrJNqzmZq4i9E5+ONWMUT7Vn2yT4WoJI181vi0F3cB6yQQSVArS/UD7mcrz727oaOkP
         s14YkmClXeLjbDrhZTSec/+Wa9K3RX0A8zLaBtDuC22pi7H/HOSBC2XvvRIDRxr6jh6V
         zpWYEAJcHsGYg91k0EaOpbkCwri4CcKMm+cyvzbnQCEpbqHyahPgL/L7eMbURPqVBba+
         3yTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=cg5tsyfardrAZMPHbf6i5LIUuCIxf4kStmZz1q+N8Es=;
        b=KYR/1C+hwHFr4XquZzQH7JYYB+RFGO+ZQKX1XHN0iY2u8nuTp2LfuleNaMsdwbWNwV
         TU5fm5Vni6i6bRkBRrvxRK0duqyIUTLUJtojg5kKMrEnKMwmfVg8KRO0p9mKr9qyURGp
         aehKgYPSlQyP7HeP1j0p0SJN+bhyIdsENi8ZYPYhrdISkanzCBE/SExcnDJeR7Ceoyr9
         4kUPLBQX+r6AqTOq+N1LJNWleO24xoERAy2m2eAxq1eI9bbfiz98YIoHyQsjiIEv/f4s
         0N18mPjYtodNHyP5CIwnekJs5mkm0IcsHdtewAh2MiKAoW9YneKepqWfFMHL+CQCniNj
         YmXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f52-v6si1975616qtf.362.2018.10.02.08.56.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 02 Oct 2018 08:56:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44415 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g7N2d-0002QN-0o
	for alex.bennee@linaro.org; Tue, 02 Oct 2018 11:56:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47805)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1g7N1A-0001YC-Jf
	for qemu-arm@nongnu.org; Tue, 02 Oct 2018 11:55:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1g7N15-0001J5-Ln
	for qemu-arm@nongnu.org; Tue, 02 Oct 2018 11:55:24 -0400
Received: from 12.mo5.mail-out.ovh.net ([46.105.39.65]:53960)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1g7N15-0001Io-Dr
	for qemu-arm@nongnu.org; Tue, 02 Oct 2018 11:55:19 -0400
Received: from player697.ha.ovh.net (unknown [10.109.146.106])
	by mo5.mail-out.ovh.net (Postfix) with ESMTP id 3FE121F6089
	for <qemu-arm@nongnu.org>; Tue,  2 Oct 2018 17:55:18 +0200 (CEST)
Received: from zorba.kaod.org (unknown [145.131.95.179])
	(Authenticated sender: postmaster@kaod.org)
	by player697.ha.ovh.net (Postfix) with ESMTPSA id 2412C4800AE;
	Tue,  2 Oct 2018 17:55:09 +0200 (CEST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180921161939.822-1-clg@kaod.org>
	<20180921161939.822-9-clg@kaod.org>
	<CAFEAcA8W0ixkfje4NSx-+kdw4rNh44JgNTu2OhDD_p91nHK7hw@mail.gmail.com>
	<f18e92fa-7b49-04b6-0adb-4f1a84668168@kaod.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <ba569f61-6c94-4a22-3f1b-f8ac72499fd7@kaod.org>
Date: Tue, 2 Oct 2018 17:55:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <f18e92fa-7b49-04b6-0adb-4f1a84668168@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 10729263164865285060
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtkedrtddtgdeikecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.39.65
Subject: Re: [Qemu-arm] [PATCH v2 08/11] aspeed/smc: add support for DMAs
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Alistair Francis <alistair@alistair23.me>,
	QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2kZWZwvGdUVo

With the links,

[ ... ]

>> Otherwise, patch looks good, though I don't know enough about
>> the device/SoC to review those details.
> 
> For the moment the only use of these registers is in the Aspeed custom 
> u-boot of the SDK : 

https://github.com/openbmc/u-boot/blob/v2016.07-aspeed-openbmc/arch/arm/mach-aspeed/platform_g5.S#L2314
 
> or in the rewrite I proposed in mainline :

http://patchwork.ozlabs.org/patch/972868/


C.
