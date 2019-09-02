Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp3745366wrs;
        Sun, 1 Sep 2019 23:17:31 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxZWdWxG+lKyHN1uEomkHiCkiDCWaPrnzRQjioP2L7kJdAxUvL2/kGyfN+6w2+p2KnTDHZ6
X-Received: by 2002:a17:906:11d6:: with SMTP id o22mr23298318eja.60.1567405051918;
        Sun, 01 Sep 2019 23:17:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567405051; cv=none;
        d=google.com; s=arc-20160816;
        b=WVaNCkzx3fjpziYslbNkNpdWSW3VsCOTxwUeVLYe/6nn8+zWb1fLI8NrBwSPjbQ1Fh
         8UgVx6w1YY8rPySzDDrw9VNY50zTyVABTKc8BBfeGPO4uueCp6vP9NxL+reGByu8XZDE
         SYs4l6a8M+jfuLSHuH48pDFL9G8yiakv4CF3bL+WyDh3ctPtMDgrrL9p/PsVjvbyVeMQ
         dJp/0hSEceWJNs4A1IFOQ0EDr6isDAVBHKX6ueUD/B5B7AIh/ztqMqstdKaveFK5hNtH
         ++p0ZfAdsao0uEm4ZwecrFp2aOpK9IWlnn+XzSNeh69ZC2o7f42lHOHAY42kEGo4R0/V
         +QQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=AQN0vouBmSuM1M6PxjAO+iSGf8pKfgpru+aLYH42RsY=;
        b=qAAnRI6Otnt+l3pWkxkmSv1+NSurRLdRm9VeH7y+ERmqHsra/WilmqUkBP9fm1QI6+
         z6TONgVBJYKtMKK1ZTBh68acsGMe9AQoojuEM2wuLsfflvtgbMJk/6ldIVioa5a+sGAT
         ZWFHHHNJCIsrXXm73yGofCf3zE7f3sIky5B3q9lqBrsOzqjTwoqSa7H5LMyxNvv5R7GH
         HAzJGqg/hYquyBqGrByj35a8H+KjMoNolxITEYy0LIa32qIqR1Aim8jeDm1aR/JPRK8i
         iJf9ZWIFCc48j5Ue+JrWVoPB+OFtlRT9Pu1aKJfGJSeBPRgBkyTmm3NgaYp8jl5sDzqr
         Ojgg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b10si6454728ejv.84.2019.09.01.23.17.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 01 Sep 2019 23:17:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:33626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i4fec-0006se-VU
	for alex.bennee@linaro.org; Mon, 02 Sep 2019 02:17:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47443)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1i4fdq-0006sN-NQ
 for qemu-arm@nongnu.org; Mon, 02 Sep 2019 02:16:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1i4fdp-0003IW-Mn
 for qemu-arm@nongnu.org; Mon, 02 Sep 2019 02:16:42 -0400
Received: from 1.mo1.mail-out.ovh.net ([178.32.127.22]:59275)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1i4fdp-0003Ds-Hh
 for qemu-arm@nongnu.org; Mon, 02 Sep 2019 02:16:41 -0400
Received: from player793.ha.ovh.net (unknown [10.108.54.156])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id 7FB4F18D112
 for <qemu-arm@nongnu.org>; Mon,  2 Sep 2019 08:16:31 +0200 (CEST)
Received: from kaod.org (lfbn-1-2240-157.w90-76.abo.wanadoo.fr [90.76.60.157])
 (Authenticated sender: clg@kaod.org)
 by player793.ha.ovh.net (Postfix) with ESMTPSA id 3A568963F1AB;
 Mon,  2 Sep 2019 06:16:25 +0000 (UTC)
To: Eddie James <eajames@linux.ibm.com>, qemu-devel@nongnu.org
References: <1566327765-2003-1-git-send-email-eajames@linux.ibm.com>
 <c2a58f33-e4cf-0033-37bf-420cc665d949@kaod.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <6cf5b737-ed1b-2380-bbd8-e2e0f4134b91@kaod.org>
Date: Mon, 2 Sep 2019 08:16:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <c2a58f33-e4cf-0033-37bf-420cc665d949@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 12951789579048749841
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddrudeiledguddthecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 178.32.127.22
Subject: Re: [Qemu-arm] [RFC v3] hw/sd/aspeed_sdhci: New device
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
Cc: andrew@aj.id.au, peter.maydell@linaro.org, qemu-arm@nongnu.org,
 joel@jms.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OW8A4bE8TMsy

On 22/08/2019 11:17, C=C3=A9dric Le Goater wrote:
> On 20/08/2019 21:02, Eddie James wrote:
>> The Aspeed SOCs have two SD/MMC controllers. Add a device that
>> encapsulates both of these controllers and models the Aspeed-specific
>> registers and behavior.
>>
>> Tested by reading from mmcblk0 in Linux:
>> qemu-system-arm -machine romulus-bmc -nographic \
>>  -drive file=3Dflash-romulus,format=3Draw,if=3Dmtd \
>>  -device sd-card,drive=3Dsd0 -drive file=3D_tmp/kernel,format=3Draw,if=
=3Dsd
>>
>> Signed-off-by: Eddie James <eajames@linux.ibm.com>
>=20
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
>=20
>> ---
>> This patch applies on top of Cedric's set of recent Aspeed changes.
>> Therefore, I'm sending as an RFC rather than a patch for review.
>=20
> I merged this patch in aspeed-4.2 and made the adjustments to move
> it to the top of the patchset after the GPIO model.=20

Hello,

What would be required to the model under linux-5.2 ?=20

Thanks,

C.=20
