Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp1653326lfy;
        Thu, 6 Aug 2020 06:49:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzHf78fLwDYVNdP/tX57XKI+x2Lll+tPRyGDkFbngDVeCavAoflqO4pLskwWyHft3fM/c8g
X-Received: by 2002:a25:e406:: with SMTP id b6mr12481377ybh.211.1596721797740;
        Thu, 06 Aug 2020 06:49:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596721797; cv=none;
        d=google.com; s=arc-20160816;
        b=qV5/MyePzTXoeyepLbb2fjXB5F0NaajXguSdw15VqtWm+KUBsP9tJL94Zjn/8yCOTf
         F7KhWqzCyAcL2hzEznA/lmX1xVwU7O69vr/P4BhxnldS2C9IR/csHhzptksp7eIp7MU7
         44d2zpdLnM/Cz7qSIza4hsFQ5RlMj7jHlgQU8S1Hwgu+yTdxc6WZWWX+njMh3I7AGIxM
         iH6QabXP/6UByTekiyuY+2P1Sdh1MnlUOBYLwx6YD2WEFM2OstRLz7AuYVGMMOxJMvg/
         z116xlWkVEeOmKch5MXOd1OL989UIf2rw73AwpKKHWLR8WDEcpaqzCgcgFXcF005bkKq
         p1Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=uKQPgG3HScyz4B9e5tbvQtX/LVbG3RkzJqsxi8TF1UY=;
        b=FR3vj60hDrD6ywVPvypvr63ZioRvGi3ghGwNo4OjOJx/FJpbX2aymJ/0tti4q/aWs3
         edDPC2COGF9ASCs3Xyao30+Yxw2jDQ7iOGzt4upzkIx6Bw9WQorJL1ai43AK9crWkKZ8
         4pGu7ZFvSYlFNYihkN8FNXYvfougnAwATz3v4Ui2D1ydeNuLg1E/q5qq+7UqnWVt8Jjn
         xb23oOj2vTyQ9b1lM0c17npFL0/lOr/rep23KypCkLI01WXo6GWIA8bC/dNwgBictwJN
         MiOTtIrWoy81QmbjARbES1/DuL75u+9KEUNh9dRW/NNW01B5EcsdFa81m6pNugqUq22v
         CIrA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x2si4434485ybs.364.2020.08.06.06.49.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Aug 2020 06:49:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k3gHN-0006L0-55
	for alex.bennee@linaro.org; Thu, 06 Aug 2020 09:49:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1k3gHF-0006Jb-5s; Thu, 06 Aug 2020 09:49:49 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:51339)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1k3gHD-0004JJ-0p; Thu, 06 Aug 2020 09:49:48 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.2])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 9CC304DB0CEA;
 Thu,  6 Aug 2020 15:49:43 +0200 (CEST)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Thu, 6 Aug 2020
 15:49:42 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G001ac1e7be0-fb11-4190-810b-4d83ddf1ba2f,
 96EDEDBD7B7627A0205C40E9E2B74F8D513A659B) smtp.auth=clg@kaod.org
Subject: Re: [PATCH for-5.2 04/19] aspeed/scu: Fix valid access size on AST2400
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>, Peter Maydell
 <peter.maydell@linaro.org>
References: <20200806132106.747414-1-clg@kaod.org>
 <20200806132106.747414-5-clg@kaod.org>
 <4a41f234-ab81-d078-0fcd-c1b20fceb1e9@amsat.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <bd58f180-1c18-c998-5fa7-da41177deb02@kaod.org>
Date: Thu, 6 Aug 2020 15:49:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <4a41f234-ab81-d078-0fcd-c1b20fceb1e9@amsat.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 84e0f196-ed16-4d38-a499-96a76aa49294
X-Ovh-Tracer-Id: 754071466221407081
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedrkedtgdejudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejkeduueduveelgeduueegkeelffevledujeetffeivdelvdfgkeeufeduheehfeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehfgegsuhhgsegrmhhsrghtrdhorhhg
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/06 09:21:10
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, erik-smit <erik.lucas.smit@gmail.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qsk0K+4//IZK

On 8/6/20 3:32 PM, Philippe Mathieu-Daudé wrote:
> On 8/6/20 3:20 PM, Cédric Le Goater wrote:
>> The read access size of the SCU registers can be 1/2/4 bytes and write
>> is 4 bytes. Set the min access size to 1 byte to cover both read and
>> write operations on the AST2400 but keep the min access size of the
>> other SoCs to 4 bytes as this is an unusual access size.
> 
> From your description it seems you need to implement .valid.accepts().

Ah yes. 

Can this come as a follow up ? because this patch is enabling
support for the Supermicro X11 BMC machine.

Thanks,

C. 


> 
>>
>> This fixes support for some old firmware doing 2 bytes reads on the
>> AST2400 SoC.
>>
>> Reported-by: erik-smit <erik.lucas.smit@gmail.com>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>  hw/misc/aspeed_scu.c | 7 ++++---
>>  1 file changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
>> index ec4fef900e27..764222404bef 100644
>> --- a/hw/misc/aspeed_scu.c
>> +++ b/hw/misc/aspeed_scu.c
>> @@ -328,9 +328,10 @@ static const MemoryRegionOps aspeed_ast2400_scu_ops = {
>>      .read = aspeed_scu_read,
>>      .write = aspeed_ast2400_scu_write,
>>      .endianness = DEVICE_LITTLE_ENDIAN,
>> -    .valid.min_access_size = 4,
>> -    .valid.max_access_size = 4,
>> -    .valid.unaligned = false,
>> +    .valid = {
>> +        .min_access_size = 1,
>> +        .max_access_size = 4,
>> +    },
>>  };
>>  
>>  static const MemoryRegionOps aspeed_ast2500_scu_ops = {
>>
> 

