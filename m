Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp578452lfm;
        Wed, 24 Jun 2020 10:10:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy7aZ6GI3nWHSVMjAUgC8mo/LKRbCcq4FwdVW1YbIyW+5rZEjkHnVQIFkNDtXgbRMoC1OIg
X-Received: by 2002:a25:1f55:: with SMTP id f82mr45996647ybf.103.1593018632225;
        Wed, 24 Jun 2020 10:10:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593018632; cv=none;
        d=google.com; s=arc-20160816;
        b=IF/UBDetM6o7Bfz1J0QR73OSWbid9VzsM2xmyl85paLfaJk1KTJnsrTZD2ESb1fVTm
         yPqzL0azNksRDclALZhjPaQh5jyh5L0EKEV1pxI3g6fZQlDU2igToMWJ3EmeMxplNIcX
         BTdXIjaG80zCaYfsQEQ1pIK+4LKzOWFx99HDJuEVNrO24vjf85w1s9a1wMbjig4Mb3cO
         C2mOg7qvNZ68bBHbnrlv+DjvwVsWkSWoZbNGN5ruOBKbxGz/PGewz1dOScuw3QJH+nsS
         QDAGEu9UylekUrw4FtlPdpM5sAwynKhY+2DdvE/0qJYUFEWpJ4xRvrdvI17FTWrJqtYo
         skzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=qEjxyoT37F86eFes4Av6MMaft6Ye9guPcUpYcE4iSWA=;
        b=HqjzLVdOAn3GOsR+v6H6TJcPgFTbVEufAo7SWWzvQ2mMYELg8gDMWjnR5edSmFOu+n
         PPXB3IC+K+2SjbB3c8L/mFBFKtcr/SbJehgP2bmBFat/NAoG4aWsjRPo1NdLHuPS4GJr
         jM5OUFP3YkTR9/dqetiu6UCajRdoEmSLE1ZIYDSL6ax7YoarCAkMh87x3h5ZiYkXvrza
         OTw5LRyEQPfOScGX1IoTqLlrnc5p/zVfF4WTgBEeewz2lh2ZCMd9Ca//bv/gvL/1rr9H
         w/zH/tNPOGRRXZlfGPsTbMjl8bW4Kvj6JbY99QLbX7ktzMNu4cG4EFRVsyfcDYJS1mS3
         uo7w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a5si18753521ybq.296.2020.06.24.10.10.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Jun 2020 10:10:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jo8ut-0007Qn-Hi
	for alex.bennee@linaro.org; Wed, 24 Jun 2020 13:10:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1jo8o2-0003ag-51
 for qemu-arm@nongnu.org; Wed, 24 Jun 2020 13:03:26 -0400
Received: from 8.mo178.mail-out.ovh.net ([46.105.74.227]:37983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1jo8nz-0005JL-AL
 for qemu-arm@nongnu.org; Wed, 24 Jun 2020 13:03:25 -0400
Received: from player795.ha.ovh.net (unknown [10.110.115.173])
 by mo178.mail-out.ovh.net (Postfix) with ESMTP id 6A553A42C3
 for <qemu-arm@nongnu.org>; Wed, 24 Jun 2020 19:03:13 +0200 (CEST)
Received: from kaod.org (lfbn-tou-1-921-245.w86-210.abo.wanadoo.fr
 [86.210.152.245]) (Authenticated sender: clg@kaod.org)
 by player795.ha.ovh.net (Postfix) with ESMTPSA id 2C49213950807;
 Wed, 24 Jun 2020 17:03:01 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G00569df303c-7093-4f3f-af98-080a0189bc4b,E10FFB909967CDEE565F5962A97A61CD472B7760)
 smtp.auth=clg@kaod.org
Subject: Re: [PATCH v4 6/8] hw/arm/aspeed: Describe each PCA9552 device
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>
References: <20200620225854.31160-1-f4bug@amsat.org>
 <20200620225854.31160-7-f4bug@amsat.org>
 <38918d0a-272f-c05c-6a03-c6ddd8cc592e@kaod.org>
 <a046bcd2-1937-d971-8a1c-23fae0dfc9b1@amsat.org>
 <CAAdtpL4vFQaD_7uUvVAOy34ySXrZCQWnALM9=FOfVZo3750ufg@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <c33ab0f8-e0b9-9b98-5fb2-24ac6aef67b7@kaod.org>
Date: Wed, 24 Jun 2020 19:02:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAAdtpL4vFQaD_7uUvVAOy34ySXrZCQWnALM9=FOfVZo3750ufg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 9750574671788542737
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedrudekjedguddtvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieefheetueejvdduudevvddvvdefieefkeeitdejleeuffdthffhteelveevheeknecuffhomhgrihhnpehosghsvghrvhgrsghlvghhqhdrtghomhenucfkpheptddrtddrtddrtddpkeeirddvuddtrdduhedvrddvgeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeelhedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=46.105.74.227; envelope-from=clg@kaod.org;
 helo=8.mo178.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/24 13:03:13
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
 qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0jhNpz8QgpfL

On 6/24/20 6:54 PM, Philippe Mathieu-Daudé wrote:
> Hi Cédric,
> 
> On Mon, Jun 22, 2020 at 10:35 AM Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>> On 6/22/20 8:49 AM, Cédric Le Goater wrote:
>>> On 6/21/20 12:58 AM, Philippe Mathieu-Daudé wrote:
>>>> We have 2 distinct PCA9552 devices. Set their description
>>>> to distinguish them when looking at the trace events.
>>>
>>> It's nice and usefull but couldn't we do the same with a QOM object name ?
>>
>> qdev inherits QOM and overloads it with the qdev_ API.
>> Since we have a qdev object, isn't it better to use the qdev_ API?
>>
>> I'd keep the QOM API for bare QOM objects.(I find confusing to use
>> different APIs).
> 
> FYI you can get an idea of the QOM -> qdev -> sysbus -> ... tree here:
> https://observablehq.com/@philmd/qemu-aarch64-softmmu-qom-tree
> 

nice ! 

Thanks,

C.
