Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp2550386wrp;
        Fri, 20 Sep 2019 08:24:52 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwEbtCB7wo3RTgn+hI5ZYjzmu5bREtcxUFhQ1uOe/wFzu7YX+rzBN9LlqzZow71CQaVcmUC
X-Received: by 2002:a05:6402:150a:: with SMTP id f10mr22033017edw.110.1568993092525;
        Fri, 20 Sep 2019 08:24:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568993092; cv=none;
        d=google.com; s=arc-20160816;
        b=kZw4tdwXCc6+315mnZ/7pXyXmxiJf/+S32ExBz/mfZXfnrFnmftW4T0Y0HJtf+exdk
         9ZmHWsvUxIvPzrGhcco/Rz9xUq76RoqKDXdUHCCUWrL8aN8ja4rXquHFGtcYoeBmnuqL
         o//BMWJgIiHgR6NX8sEIdm9E8KEnTFUePbAVkpIpkFRRruLAT5Ib2gk8LOh/1WwIqOmr
         6HJd/P0jOWYg+frND4Qn7J4v9Kz1LWsnmsfaKl+3IPYQfPRJyc9625WxphQzNv99bZvO
         4+P0sc5IkwUA8JbYVNMT9IUe6deDPhxie5n6nHHzzjg3d+VRaNoWe4opoOZs7A2xHIpu
         JXjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=R/Im3At0N/Bjboesr3qM8kioKwIWf2tN3osqNQ9qe58=;
        b=kssbKxd3Ct1YFYVVSBIP7eTlCr/tle/0zOQuUEkBC8HXDfSZ5JWH1Y/fWJhj+nb4LL
         U6htX2bAujmJSuB4bi90KKs4z3ErM2DyrGRhzbuDnLF09TCmtSY6VlcUiXMsUAv5o9PE
         K8ie99EypcfHHyZcrxqDfSM8ZRBmRz5g8648Mq1DnuLbENd787rnrsulNyf9p//dgnWf
         En2aIu9B+vh84TJR14a7u1wEZ5roGY/UOBDoPXRHGn1rzEmHweMmnXsTQgLqYds9wyJS
         fQt8qt+eBiRksX61fIcHR46sQqbUPsxO/sJfXLETsxg3H07v1YNuf3UdM9HNj6AAzwP4
         ByQw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v25si1396228edy.392.2019.09.20.08.24.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Sep 2019 08:24:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:60768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iBKmB-0005FD-FF
	for alex.bennee@linaro.org; Fri, 20 Sep 2019 11:24:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43192)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iBKm2-0005Em-DO
 for qemu-arm@nongnu.org; Fri, 20 Sep 2019 11:24:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iBKm1-0002s6-GL
 for qemu-arm@nongnu.org; Fri, 20 Sep 2019 11:24:42 -0400
Received: from 20.mo7.mail-out.ovh.net ([46.105.49.208]:50524)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iBKm1-0002rE-BU
 for qemu-arm@nongnu.org; Fri, 20 Sep 2019 11:24:41 -0400
Received: from player772.ha.ovh.net (unknown [10.108.35.240])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id 28B51133D1F
 for <qemu-arm@nongnu.org>; Fri, 20 Sep 2019 17:24:38 +0200 (CEST)
Received: from kaod.org (lfbn-1-2240-157.w90-76.abo.wanadoo.fr [90.76.60.157])
 (Authenticated sender: clg@kaod.org)
 by player772.ha.ovh.net (Postfix) with ESMTPSA id 140F4A088065;
 Fri, 20 Sep 2019 15:24:34 +0000 (UTC)
Subject: Re: [PATCH 12/21] aspeed/smc: Add AST2600 support
To: Joel Stanley <joel@jms.id.au>
References: <20190919055002.6729-1-clg@kaod.org>
 <20190919055002.6729-13-clg@kaod.org>
 <CACPK8XcJRT8fa81vp7aC8f+yfOxaHMFd9+tijq7j1D68DGbFcQ@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <f06cbfcf-8fe3-2b1b-b259-4995e4b30480@kaod.org>
Date: Fri, 20 Sep 2019 17:24:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XcJRT8fa81vp7aC8f+yfOxaHMFd9+tijq7j1D68DGbFcQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 17236964624092728235
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrvddvgdekjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.49.208
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uV8y+L5a86pC

On 20/09/2019 06:46, Joel Stanley wrote:
> On Thu, 19 Sep 2019 at 05:51, C=C3=A9dric Le Goater <clg@kaod.org> wrot=
e:
>>
>> The AST2600 SoC SMC controller is a SPI only controller now and has a
>> few extensions which we will need to take into account when SW
>> requires it.
>>
>>  - 4BYTE mode
>>  - HCLK divider has changed (SPI Training)
>>  - CE0-2 Read Timing Compensation registers
>>
>> This is enough to support u-boot.
>=20
> As easy as that! I hope the Linux driver is as simple :)

Only HW will tell ! :)
=20
>> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>=20
> Reviewed-by: Joel Stanley <joel@jms.id.au>

I had some issues with the segment routines. I will have to resend
this one.

thanks,

C.

=20

