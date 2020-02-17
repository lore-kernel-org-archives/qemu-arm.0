Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp4870583lfp;
        Mon, 17 Feb 2020 01:29:52 -0800 (PST)
X-Google-Smtp-Source: APXvYqxFqojKF3HQNa9hnAl88f8+Zr5C4GThB32B1MIT0ATMcr6tUawrtxqUyR/YIgd5gGWr0BEZ
X-Received: by 2002:a37:9acf:: with SMTP id c198mr11167164qke.437.1581931792486;
        Mon, 17 Feb 2020 01:29:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581931792; cv=none;
        d=google.com; s=arc-20160816;
        b=dsUwWmqpwctKYR+XAeAJZKp0WtkQNXWqJ4ZTU4bE7yL8JzPguRmcfj/GVXzPGoSxh4
         xI1gAoJzjz2iO8ls1IMzOhWbhVlWXnE9jX+cv4ukJQWx+v9ZRKgqgGOT9eoNXyTtDqgn
         O3tSqDy5jYnwz2wA1jZV47FtwHc9lVGx7H7Vtea9wqTvHiTe3eewVD5nvIX8wzddRIME
         r0/1rjNcBB97kYR/FVA6LL9GYNL7+S8f0Pdf86COflOWhf0zi0TTlMDcKkCs6U7yrxkO
         XmHq7VHiw9mRaAdmSLODFzwNHJAu9c+z8d15jcRJoI1ZB99JTygpcxssmdSuMLa82ulg
         5C4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=I8yvvj4dvkVTz0MbgC/XGUG+rJWUZfmlEWcYTWfAWRg=;
        b=uPp/htUPbj4jM7rG6LaLHZMCJ2Y1VYl7c9Vlr6vsR/fzGmmEBKdi+m6fL3dSozP/Ww
         g4W1AqhSm4s2AhoSs0yoGTpeiBauGEEmK1l24PCjc8pY7u+XH9lJu4UaGc1sLzfjfIqw
         FNxUcSdEWsNbvMhtiICH1SumPNiclUgZPEtQjHHeSk3AM9m3Z/EBHP/lRv/IhVTMMVCF
         ovbCgyLiy4j0Y1p3CUVYbfS+8ViQNafh8xLFZtC+9ekgE/qDV7tIS1kCZOctkjqrZ7f4
         MdCoQhoxOlvKoRq2T76TkiyesyOnrLjBASFr8V8+9FocyPsmzckyfMQ/q65pirGbwENO
         Flnw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z53si6371041qta.251.2020.02.17.01.29.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Feb 2020 01:29:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j3cit-0006WK-U4
	for alex.bennee@linaro.org; Mon, 17 Feb 2020 04:29:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52097)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1j3cil-0006Va-EP
 for qemu-arm@nongnu.org; Mon, 17 Feb 2020 04:29:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1j3cik-0008Af-EH
 for qemu-arm@nongnu.org; Mon, 17 Feb 2020 04:29:43 -0500
Received: from 10.mo69.mail-out.ovh.net ([46.105.73.241]:59299)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1j3cik-0007xQ-9Y
 for qemu-arm@nongnu.org; Mon, 17 Feb 2020 04:29:42 -0500
Received: from player746.ha.ovh.net (unknown [10.110.208.131])
 by mo69.mail-out.ovh.net (Postfix) with ESMTP id 9128A8413A
 for <qemu-arm@nongnu.org>; Mon, 17 Feb 2020 10:29:33 +0100 (CET)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player746.ha.ovh.net (Postfix) with ESMTPSA id A63C1F83E892;
 Mon, 17 Feb 2020 09:29:28 +0000 (UTC)
Subject: Re: [PATCH 0/2] aspeed/scu: Implement chip id register
To: Joel Stanley <joel@jms.id.au>, Peter Maydell <peter.maydell@linaro.org>
References: <20200121013302.43839-1-joel@jms.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <6ac783d8-84c0-2200-9c7b-964f8dc56da9@kaod.org>
Date: Mon, 17 Feb 2020 10:29:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200121013302.43839-1-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 6700511824454257472
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrjeeigddtgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgsehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdekvddrieegrddvhedtrddujedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeegiedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhg
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.73.241
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Pt6wTrKkh4Lk

On 1/21/20 2:33 AM, Joel Stanley wrote:
> This implements the chip id register in the SCU for the ast2500 and
> ast2600. The first patch is a cleanup to separate out ast2400 and
> ast2500 functionality.
> 
> Joel Stanley (2):
>   aspeed/scu: Create separate write callbacks
>   aspeed/scu: Implement chip ID register
> 
>  hw/misc/aspeed_scu.c | 93 +++++++++++++++++++++++++++++++++-----------
>  1 file changed, 70 insertions(+), 23 deletions(-)
> 

Hello Peter,

I see you have merged patches more recent than this series. Do you
plan to take them later on ? They apply correctly on mainline.

Thanks,

C.
