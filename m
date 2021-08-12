Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp457047lff;
        Thu, 12 Aug 2021 08:16:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwRzDW8NPS92zwWB317OnhtAGb9hH4w1/dK1YQUeNBall1WySORqicDh2VrGfOMGz61duOo
X-Received: by 2002:ac8:5d45:: with SMTP id g5mr4394900qtx.127.1628781382384;
        Thu, 12 Aug 2021 08:16:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628781382; cv=none;
        d=google.com; s=arc-20160816;
        b=KEvOXU850zeq2DH7oa0Fg+dpwi+LBI/szFjvj6GIZkO0yYKBuS2HjyBLZSzl9DtsLV
         Sl6gvBSXgWQcp4oT2YqTDJAcmxcmGHUaO8YSRNtARboNrKyb1XVEdim238246JyuX6Lz
         kqb6evHHlMFF1ryRZqS2EDpcdrt7LsuB/XWpXLFuuQtDGcTrDSUdpNJl56iu7EqYhtZH
         8OIC2s6j5YAK+359layjqZ6vmwu65+7l3YYZfT49FUUWBn/5TiORGXGOJi5MOMzULzK9
         a8lhhcOWF12gUzHKi10vQesr4286YA1EyBo7h681yGNGXYhXdmqBdJEsk0jUN0Ys0cbU
         a80A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=TfWWuFGjX8SGRr6M0XdZICpOIb7dTQasD1z3bu6UVBg=;
        b=UHMXUTeTmVt1qPD44LFAR4pn/iCiiGEBO5zypFZOxRjIoI9kBt6A0QLVSdxqPFee+6
         YOyUZQ1XcPTCJw/OlGJcHu0BKinKr3gG/smUFteeXgLWnwiA5RhRgXK3CcKubLfQGuV/
         TeqkjWh0ti8dTR3Oa3Y1JKZBsI2j3f+PeNzZYc/i2uWascxyRrtULAtxjDE2lQmPHk8s
         nsutFlPgPMIPlV7+hoB1Iu4DWZm943myXD3kph4H9KBXEbDxxA6I1XW9AIHvFqsojQms
         4xI5SsfOJ0vU+KpjcnkLwxR1s/eZs/ECGFfwn58BTPd/8QMGhsLMmCQEm0UsKHUomZEL
         7Sog==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k66si2157055qke.195.2021.08.12.08.16.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Aug 2021 08:16:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mECRR-0005Eq-Jp
	for alex.bennee@linaro.org; Thu, 12 Aug 2021 11:16:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mECRG-0005CD-M3
 for qemu-arm@nongnu.org; Thu, 12 Aug 2021 11:16:10 -0400
Received: from 9.mo548.mail-out.ovh.net ([46.105.48.137]:50033)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mECRE-0005ol-Fh
 for qemu-arm@nongnu.org; Thu, 12 Aug 2021 11:16:10 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.131])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 63DF720504;
 Thu, 12 Aug 2021 15:15:56 +0000 (UTC)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Thu, 12 Aug
 2021 17:15:55 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G001c9455ccc-d02e-4a89-916f-597c1b8e9b1e,
 F21CE8212BD8F0BC5EECA12F1B7E00F4D5E87F00) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.89.73.13
Subject: Re: [PATCH 09/10] hw/misc: Add Infineon DPS310 sensor model
To: Joel Stanley <joel@jms.id.au>, Corey Minyard <minyard@acm.org>
References: <20210809131556.686260-1-clg@kaod.org>
 <20210809131556.686260-10-clg@kaod.org> <20210810233727.GR3406@minyard.net>
 <CACPK8XdL_s5AqdRH=VW_Csu7oWPvaD48LL8wz9B0X4jckJDLig@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <1e97d2e4-57c6-e88d-88ee-db70bdc85a04@kaod.org>
Date: Thu, 12 Aug 2021 17:15:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XdL_s5AqdRH=VW_Csu7oWPvaD48LL8wz9B0X4jckJDLig@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 80b952c5-1977-47e7-9755-a6023d096d85
X-Ovh-Tracer-Id: 4263782949440162598
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrkeefgdekhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejkeduueduveelgeduueegkeelffevledujeetffeivdelvdfgkeeufeduheehfeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehjohgvlhesjhhmshdrihgurdgruh
Received-SPF: pass client-ip=46.105.48.137; envelope-from=clg@kaod.org;
 helo=9.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
X-TUID: 4Jv+XP8rxa7O

On 8/11/21 3:25 AM, Joel Stanley wrote:
> On Tue, 10 Aug 2021 at 23:37, Corey Minyard <minyard@acm.org> wrote:
>>
>> On Mon, Aug 09, 2021 at 03:15:55PM +0200, Cédric Le Goater wrote:
>>> From: Joel Stanley <joel@jms.id.au>
>>>
>>> This contains some hardcoded register values that were obtained from the
>>> hardware after reading the temperature.
>>>
>>> It does enough to test the Linux kernel driver. The FIFO mode, IRQs and
>>> operation modes other than the default as used by Linux are not modelled.
>>>
>>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>>> [ clg: Fix sequential reading ]
>>> Message-Id: <20210616073358.750472-2-joel@jms.id.au>
>>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>>> Message-Id: <20210629142336.750058-4-clg@kaod.org>
>>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>>> ---
>>>  hw/misc/dps310.c    | 227 ++++++++++++++++++++++++++++++++++++++++++++
>>
>> Can this go into hw/sensor?
> 
> For sure. I wrote it four years ago, when obviously hw/sensor didn't exist.

I moved it under hw/sensor.

C.
