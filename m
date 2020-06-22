Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3176929lfm;
        Mon, 22 Jun 2020 06:16:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx4Atp1JId6XRCwf5UQcPG18rcKxGmPOrgWxxrfjZKNZP5aX/CEcc0jPwBxwOrYhoLAqVKo
X-Received: by 2002:a25:a165:: with SMTP id z92mr27531362ybh.48.1592831774299;
        Mon, 22 Jun 2020 06:16:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592831774; cv=none;
        d=google.com; s=arc-20160816;
        b=tqLLIMsPEMZF77gjdd2ArK+qPHruSdxOEf7GdMC9Van9lWHtxG6vwGsl68mwjHfzVx
         PJrBSipL0WKl3R/XdhGbaWsrSuhTLZGHgvZ5NW+iEMFloEJ2QJ4FryjPpyIi8N7CPdXe
         +wWPyORc1hfvVkBKAqsE01U/ypZmYRB2Fj8dWudyT0CZGVmhItq75IE2tWx1fY/bN4dV
         ZXlFJF1oGgV0EnaGv2eY6NGXB6rhQNt/t3iOvkfnPoxMQgUqAWWSHhEqtw5ZZ9ykIGkx
         /S/OlQajpkgXKvAA2EShfYpzqCP/i6NVIOqlqBoXhSjOcEnciFl+E7eY55t3audFZ8jZ
         SRAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=dHkrXbSBjKwb6RjY0Jc+11eSVNK1w6yKxzKOzyo/PEw=;
        b=z8qK2AuI/6o7Qq3MnQsIHK2wYTUSYj5aq5nYpayNrnHwGEyWo1bRIv/+oaDof6gbpW
         rqh3SeNSvBPQItikzFi1a3qqC3YLQPd8bxAK3kfpvxN9JMC2bUSDYgtsSkbp0y4zoHhJ
         f6AobmTjaacDFUwHJDabSC4lM47Qzt9YjLVURRWQW0CwTTeZBBUZX/6ukjYeZz1xGiPG
         XrS1xvYZWaLwRHxklQZwN/fI0S3pUfARRRKk/mp75T0oiZ0vatW5l+usbo06lBsGK8Fb
         kM82jhBbmtZFZEA38clk+FxEZBOK04F81JkOHUgm6Dko5sCK9PqN9vj4Vc2/XacNLg0Q
         0V5w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i16si14445386ybm.105.2020.06.22.06.16.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jun 2020 06:16:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jnMJ3-0008CS-N7
	for alex.bennee@linaro.org; Mon, 22 Jun 2020 09:16:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1jnMIs-00089I-Sb
 for qemu-arm@nongnu.org; Mon, 22 Jun 2020 09:16:02 -0400
Received: from 18.mo6.mail-out.ovh.net ([46.105.73.110]:51339)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1jnMIq-000187-IC
 for qemu-arm@nongnu.org; Mon, 22 Jun 2020 09:16:02 -0400
Received: from player799.ha.ovh.net (unknown [10.108.54.97])
 by mo6.mail-out.ovh.net (Postfix) with ESMTP id DD77621B560
 for <qemu-arm@nongnu.org>; Mon, 22 Jun 2020 15:15:57 +0200 (CEST)
Received: from kaod.org (lfbn-tou-1-921-245.w86-210.abo.wanadoo.fr
 [86.210.152.245]) (Authenticated sender: clg@kaod.org)
 by player799.ha.ovh.net (Postfix) with ESMTPSA id A5463139F20A0;
 Mon, 22 Jun 2020 13:15:48 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G005c64ac237-f55f-4f8d-b1ed-e2ff97476e13,D5B34DF2F1998B4AFDB97B5973F1BB92C24DD330)
 smtp.auth=clg@kaod.org
Subject: Re: [PATCH v4 3/8] hw/misc/pca9552: Use the PCA9552_PIN_COUNT
 definition
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200620225854.31160-1-f4bug@amsat.org>
 <20200620225854.31160-4-f4bug@amsat.org>
 <4628bf30-9b56-a470-afc2-f140690cc002@kaod.org>
 <f5ced6f5-f1fb-bbc2-8f64-d5d55fe8a7df@amsat.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <bbd20ac0-ccf6-3bcb-c876-8515c64804a1@kaod.org>
Date: Mon, 22 Jun 2020 15:15:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <f5ced6f5-f1fb-bbc2-8f64-d5d55fe8a7df@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 12613738132085115665
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedrudekvddgieefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeefffdvtddugeeifeduuefghfejgfeigeeigeeltedthefgieeiveeuiefhgeefgfenucfkpheptddrtddrtddrtddpkeeirddvuddtrdduhedvrddvgeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeelledrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=46.105.73.110; envelope-from=clg@kaod.org;
 helo=18.mo6.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/22 09:15:58
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Corey Minyard <cminyard@mvista.com>,
 qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: I6n+/DtAYDUS

On 6/22/20 10:37 AM, Philippe Mathieu-Daudé wrote:
> On 6/22/20 8:25 AM, Cédric Le Goater wrote:
>> On 6/21/20 12:58 AM, Philippe Mathieu-Daudé wrote:
>>> The current code models the PCA9552, but there are comments
>>> saying the code could be easily adapted for the rest of the
>>> PCA955x family.
>>> Since we assume we have at most 16 pins (for the PCA9552),
>>> add a definition and check the instance doesn't use more than
>>> this number. This makes the code a bit safer in case other
>>> PCA955x devices are added.
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>
>> I would introduce a PCA9552Class and move nr_leds under the class.
> 
> A bit excessive (for now) for the hobbyist time I can dedicate
> to this, but I'll try (also renaming nr_leds -> nr_pins).


It's fine with me if you don't have time.  

Reviewed-by: Cédric Le Goater <clg@kaod.org>


> 
>>
>> C. 
>>
>>
>>> ---
>>>  hw/misc/pca9552.c | 12 ++++++++++++
>>>  1 file changed, 12 insertions(+)
>>>
>>> diff --git a/hw/misc/pca9552.c b/hw/misc/pca9552.c
>>> index cfefb8fce8..b97fc2893c 100644
>>> --- a/hw/misc/pca9552.c
>>> +++ b/hw/misc/pca9552.c
>>> @@ -303,6 +303,17 @@ static void pca9552_initfn(Object *obj)
>>>      }
>>>  }
>>>  
>>> +static void pca9552_realize(DeviceState *dev, Error **errp)
>>> +{
>>> +    PCA9552State *s = PCA9552(dev);
>>> +
>>> +    if (s->nr_leds > PCA9552_PIN_COUNT) {
>>> +        error_setg(errp, "%s invalid led count %u (max: %u)",
>>> +                   __func__, s->nr_leds, PCA9552_PIN_COUNT);
>>> +        return;
>>> +    }
>>> +}
>>> +
>>>  static void pca9552_class_init(ObjectClass *klass, void *data)
>>>  {
>>>      DeviceClass *dc = DEVICE_CLASS(klass);
>>> @@ -311,6 +322,7 @@ static void pca9552_class_init(ObjectClass *klass, void *data)
>>>      k->event = pca9552_event;
>>>      k->recv = pca9552_recv;
>>>      k->send = pca9552_send;
>>> +    dc->realize = pca9552_realize;
>>>      dc->reset = pca9552_reset;
>>>      dc->vmsd = &pca9552_vmstate;
>>>  }
>>>
>>
>>

