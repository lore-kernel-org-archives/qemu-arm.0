Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1222287lfb;
        Fri, 3 Sep 2021 05:09:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxwP9mKgtZ8fjkKlHX0JDKV8OB88HvsH3l2se8v9bLrZlJdIlHzPAMKVSS1KA7oPglaXEdZ
X-Received: by 2002:adf:eb8d:: with SMTP id t13mr3784183wrn.4.1630670999334;
        Fri, 03 Sep 2021 05:09:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630670999; cv=none;
        d=google.com; s=arc-20160816;
        b=ahw62FL2fo2XzdosY9uSGyp87dTeZGo7UhU7iADCO9ERpQEdej48GYY2aNYnlPzfH6
         iYYndLnYAJtCIeHTnFVjLngek3ShBponx+v5QzJbmnNJcCSHXtiGcpqC9aGlsaR0CkCU
         UMf/YAqDOjVrB/CIUGKpYRmsybDvnza6pXhTBgn7kY+3MT7XnlaVUj9dg2YkeJc3hurz
         H2pWK+43ZvLLRVP1C9VbWR5PgWoLIb3rYNyIWjLpRpbcSr1oakFj1yy1e8h0jy9Z4FNM
         esUx2PPqyvE+Ad/QDdJ7lhilT489zxrAvDNBhNOY1Q08ygw8U1W07FBBqDQ9ewqdOVzv
         d85Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:references:to:from:subject;
        bh=RbSca/4M5xaqVo7oyGZGmMSLqbOe04hXnJBTNswwCV0=;
        b=b6NH2PbK5z/GgrGUkdniFy+iVYznJJfgLmbYiLLK4eoTLgx3pHVIXt95OHm39l7QRD
         TBUv3Q040boHrE1XwQ7d1VETKo3wdbNPJlQFR0C5fyXmoo8YFczAd8qT38vzQkqOHOAX
         Hs7YpyWMZCcUTWL85kXYCaCTA2PoVZ910CBVT7KGyHE9/PxqG/3rVVy55pm5b/meK5KP
         Ye4OCTVyKRXCzqmuFjQzkG6HXPv5wofelj7GIbwTv9tY3MK7pSt/bCKDNkdhGchoDVwa
         EEJTtc8mBElwcCvqj8Cm1qSQjRVFd5CASVfEiQzhz4WFXPfbpJr3lKnVOfQYKcWk/Ii8
         9bQw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z7si5993689wma.29.2021.09.03.05.09.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Sep 2021 05:09:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mM818-0006GX-At
	for alex.bennee@linaro.org; Fri, 03 Sep 2021 08:09:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mM80u-0006AL-Kz; Fri, 03 Sep 2021 08:09:44 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:47603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mM80f-0008LZ-Nk; Fri, 03 Sep 2021 08:09:44 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.171])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 29906BC3AC12;
 Fri,  3 Sep 2021 14:09:25 +0200 (CEST)
Received: from kaod.org (37.59.142.106) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Fri, 3 Sep
 2021 14:09:24 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R0067530df98-ca36-4ee1-94f9-442b572c1736,
 15E2C03324B5D6AD2543493448FEC157D625CB40) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 129.41.46.1
Subject: Re: [PATCH v2 0/1] hw/arm/aspeed: Add Fuji machine type
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
To: <pdel@fb.com>
References: <20210903082027.704397-1-pdel@fb.com>
 <f380c5b5-a472-d41e-7821-4155113bdbc0@kaod.org>
Message-ID: <c7d6e268-19a8-5b75-1310-6c943050a1ac@kaod.org>
Date: Fri, 3 Sep 2021 14:09:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <f380c5b5-a472-d41e-7821-4155113bdbc0@kaod.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG5EX1.mxp5.local (172.16.2.41) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: a1a9d4db-3d0b-4649-bcd1-61585ee1a10b
X-Ovh-Tracer-Id: 1185854079196171171
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddruddvjedggeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefuhffvfhfkffgfgggjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeiveehgedvfeejgfdvudevkefgjeevtdehueeiffduieeuudeufffgteetkeekgeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepphguvghlsehfsgdrtghomh
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.888,
 SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: patrick@stwcx.xyz, qemu-arm@nongnu.org, joel@jms.id.au,
 qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qkdrJR6c+g4J

>>>> Is the Fuji using the Aspeed RTC ?
>>>>
>>>> hwclock: ioctl(RTC_RD_TIME) to /dev/rtc0 to read the time failed: Invalid argument
>>
>> I don't understand exactly what's going on here, but running "hwclock --get"
>> and "hwclock --set --date 2021-01-01" both seem to work fine after booting,
>> so I think the Aspeed RTC is setup correctly and working. As far as I know
>> Fuji uses it, but I'm not really sure.
> 
> QEMU doesn't model the SoC RTC. Something to add on the TODO list.

Joel made me notice that we had a model for it :) The time is 
not initialized at reset and that might be the issue we are 
seeing in Linux.

Thanks,

C.
