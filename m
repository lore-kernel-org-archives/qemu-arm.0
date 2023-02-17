Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp1259842ejb;
        Thu, 16 Feb 2023 23:45:39 -0800 (PST)
X-Google-Smtp-Source: AK7set8J1O1BkNJuVScXaP6pqdGKgl19FmhgRmwDctqGQTintDuGM8lD+1hqvkPHOJRQ1oVM2cSt
X-Received: by 2002:a05:622a:4ce:b0:3b8:6b1b:e378 with SMTP id q14-20020a05622a04ce00b003b86b1be378mr8931290qtx.8.1676619939761;
        Thu, 16 Feb 2023 23:45:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676619939; cv=none;
        d=google.com; s=arc-20160816;
        b=xO824DzfGry8BKdM431qvBNvcmqA7EWQdCaXwix18OauqMKOEKJtlXXrNdMx+dF2XZ
         AuQVko8GIbLyyblVcc5ECCoZu2Cq+fRR/Is1XL3dpefpVSu3SapzM+hHe3gxnW/gkEmA
         oN7Jd9G4b1s2IZtieRcSiA0LAqVXcVfrEIJWepGbplk2oE95G6CpQh2TsbdIH76sLGvG
         oLrekdvF4EVJHOxuLiIl+vSv6RuI5X7of+4qidRq5JnArCfVd2TUlltLkrfRV3Nk/lNF
         1pdChvjW4X3zWis5iM/C1LJ8FDDRbrTSyXgfsMTcSBMSez+4UgRuanUPpuMwOhBSFvyq
         frQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=akgqU4OcfOXl1eZSiZD/6kYTxmmg4f+XOnDzcveQPZM=;
        b=qJEzOaoXjpzcE5oaeft8WtdpuarwdlmYBApBcKfmYWXc/N8GX2cukFVsst8q59bxsf
         BabaluxUg2Y8/YJGuokBStg24GS5FpDdESQlAQeBL6jT9yjexi8pBRCJmzskNwXCzyXk
         WnF0EL0U0uOT8bpEJftGu9mDxKR6UpzLiZbuUEv6Tft4SopLx2zwGg8D0wRP6ZB0cY2C
         ddMxc36U74g/dl3SYXZQiWmU3oLLUpZXeQzxvD0n0JQv4YawAAy0eX3aBYLoh3tpioFO
         O7n/NjT+HAPtj5bX7MVkHtBbRK+7rFZz6fmJPWLjax3JvC4GPloEGeO/i0sVK2ct0xLh
         HxwA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t19-20020a05622a149300b003a55b624080si3329233qtx.48.2023.02.16.23.45.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Feb 2023 23:45:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSvQZ-0000ql-5t; Fri, 17 Feb 2023 02:45:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pSvQW-0000pu-3h
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 02:45:04 -0500
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pSvQT-0004Q9-7a
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 02:45:03 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.90])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id B199E2133C;
 Fri, 17 Feb 2023 07:44:56 +0000 (UTC)
Received: from kaod.org (37.59.142.105) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Fri, 17 Feb
 2023 08:44:55 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G0060aa277ca-0488-4649-a6b4-d487f012d04d,
 D8AD3BA2C27EEBE7B4560DA8411A9B1E3CFED360) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <08d5f5d0-1538-e35b-df02-c4e3dacfd4cd@kaod.org>
Date: Fri, 17 Feb 2023 08:44:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH qemu v3 0/2] hw/at24c support eeprom size less than equal
 256 byte
Content-Language: en-US
To: ~ssinprem <ssinprem@celestica.com>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>
CC: <qemu-stable@nongnu.org>, <ssumet@celestica.com>,
 <srikanth@celestica.com>, <kgengan@celestica.com>,
 <peter.maydell@linaro.org>, <andrew@aj.id.au>, <joel@jms.id.au>, Peter
 Delevoryas <peter@pjd.dev>
References: <167660539263.10409.9736070122710923479-0@git.sr.ht>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <167660539263.10409.9736070122710923479-0@git.sr.ht>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: b490d99c-fa3c-4952-8496-ca5257d1c66f
X-Ovh-Tracer-Id: 3492541512126204917
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrudeikedguddutdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepuedutdetleegjefhieekgeffkefhleevgfefjeevffejieevgeefhefgtdfgiedtnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrddutdehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehsshhinhhprhgvmhestggvlhgvshhtihgtrgdrtghomhdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrghdpqhgvmhhuqdhsthgrsghlvgesnhhonhhgnhhurdhorhhgpdhsshhumhgvthestggvlhgvshhtihgtrgdrtghomhdpshhrihhkrghnthhhsegtvghlvghsthhitggrrdgtohhmpdhkghgvnhhgrghnsegtvghlvghsthhitggrrdgtohhmpdhpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrghdprg
 hnughrvgifsegrjhdrihgurdgruhdpjhhovghlsehjmhhsrdhiugdrrghupdhpvghtvghrsehpjhgurdguvghvpdfovfetjfhoshhtpehmohehvdelpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout3.mo529.mail-out.ovh.net
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.351,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 91ek6IL7LHK8

Add Peter D. since he wrote the fuji.

Thanks for the contribution !

C.

On 2/17/23 04:43, ~ssinprem wrote:
> - hw/at24c : modify at24c to support 1 byte address mode
> - aspeed/fuji : correct the eeprom size
> 
> Sittisak Sinprem (2):
>    hw/at24c : modify at24c to support 1 byte address mode
>    aspeed/fuji : correct the eeprom size
> 
>   hw/arm/aspeed.c         | 36 ++++++++++++++++++++----------------
>   hw/nvram/eeprom_at24c.c | 28 +++++++++++++++++++++++++---
>   2 files changed, 45 insertions(+), 19 deletions(-)
> 

