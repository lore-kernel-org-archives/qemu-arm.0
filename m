Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2639554ejb;
        Tue, 30 May 2023 22:57:50 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7QCnESARImt3Cmuf3/V6YL/Zn22Gcc9sMiXnXAitY/BUGOyTIjzIbQ8iALV+5sn8Jk9ui1
X-Received: by 2002:a05:620a:3a46:b0:75b:23a0:d9f1 with SMTP id sk6-20020a05620a3a4600b0075b23a0d9f1mr3982659qkn.71.1685512670642;
        Tue, 30 May 2023 22:57:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685512670; cv=none;
        d=google.com; s=arc-20160816;
        b=nXKQjHLIwHeFmGQ8MEWNAJMGOE3fDvTsP2gvt5b2RfsMxCB9xGmNBsclVkkTYsmYah
         gqjX/ysghyLp4iiMHMELpSQVY2WZlteapW7jEuUZCpl/Yj0Zer5KICLCd4jfRm/zV+w7
         N/Wmx3JT/My2w4Wt1CxUh6Jpi6D7X4Detzd7SKBn2tv/k7lBp30KRErW/emHr+C/Ri0m
         INeJrHPaFzmARSA8UNA6Rw7boI9Oo5dQtiGEQR/KJMSl5lXSGJMDu44nZfWsXsh058tf
         fxXfyyTs3aLHsUSgG3h4s6ZvNJSyarnP+BMPmo7xY94IgT2uwuMKRWflmxs6ylSsxMYT
         mevg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=vR6eU6X1OlR9c0+NlXKsx3Gnnoym7LMYxi2i24BuWwM=;
        b=FYmAjJYan+gBbyaSuMFktuxDmvxzgAaQYqO+r7sg1DYYBZb4LVTsOM3LAMTm1fi59q
         xKlGBDyX6djWkqko9pnWKo7WCGJx/XSzFoQtbSNgyMecToBMTmUIYi71CEg+M10LGmaD
         yYqKTQ2LhKWhcLYk1th5PanMaJEmVvDwTs/Z5znNJLbCRExTUlykxfHBYszqnSCvbHbd
         HUR9o3BnI5Ga1/KOgne1CwyH3pX/es3OpNBQpeaFnYhIJlvQOdHe177+DkXCjd9/LVRw
         sR+1fA2zEDlPs8wD9E0DkgdFsD/CN6ZSWBduEfKSoKvjhDjJH3jU4CDiI7ug00vOrQMu
         Bk3A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h3-20020a05620a13e300b0075947ef3253si7493297qkl.166.2023.05.30.22.57.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 May 2023 22:57:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q4Eq6-0004Lu-5K; Wed, 31 May 2023 01:57:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1q4Epe-0004DY-Q3; Wed, 31 May 2023 01:57:15 -0400
Received: from 3.mo548.mail-out.ovh.net ([188.165.32.156])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1q4EpX-0003lH-G7; Wed, 31 May 2023 01:57:09 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.173])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 566FA205FC;
 Wed, 31 May 2023 05:57:02 +0000 (UTC)
Received: from kaod.org (37.59.142.106) by DAG8EX2.mxp5.local (172.16.2.72)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Wed, 31 May
 2023 07:57:01 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R006ef32e9b2-4197-4da8-9ab0-68f1a643ffbe,
 AD4A5C7A17A66D4AFB6DE796C11E1CF112258E66) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <78953a5f-9a18-d718-c86c-2e6884e630ef@kaod.org>
Date: Wed, 31 May 2023 07:57:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 03/12] aspeed: Use the boot_rom region of the fby35 machine
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 <qemu-arm@nongnu.org>
CC: <qemu-devel@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>, Joel
 Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, Peter Delevoryas
 <peter@pjd.dev>
References: <20230508075859.3326566-1-clg@kaod.org>
 <20230508075859.3326566-4-clg@kaod.org>
 <981dd9cc-9d2a-9e41-8ae9-4fa355b0b061@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <981dd9cc-9d2a-9e41-8ae9-4fa355b0b061@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG8EX2.mxp5.local
 (172.16.2.72)
X-Ovh-Tracer-GUID: 849bd6c1-9202-4803-bd4a-a68ee4885f91
X-Ovh-Tracer-Id: 16261935306249309033
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrfeekkedguddtfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepffdufeeliedujeeffffhjeffiefghffhhfdvkeeijeehledvueffhfejtdehgeegnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrddutdeipdekvddrieegrddvhedtrddujedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehphhhilhhmugeslhhinhgrrhhordhorhhgpdhqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdhpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrghdpjhhovghlsehjmhhsrdhiugdrrghupdgrnhgurhgvfiesrghjrdhiugdrrghupdhpvghtvghrsehpjhgurdguvghvpdfovfetjfhoshhtpehmohehgeekpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=188.165.32.156; envelope-from=clg@kaod.org;
 helo=3.mo548.mail-out.ovh.net
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: cSIjtMaUYSu+

On 5/30/23 23:27, Philippe Mathieu-Daudé wrote:
> On 8/5/23 09:58, Cédric Le Goater wrote:
>> This change completes commits 5aa281d757 ("aspeed: Introduce a
>> spi_boot region under the SoC") and 8b744a6a47 ("aspeed: Add a
>> boot_rom overlap region in the SoC spi_boot container") which
>> introduced a spi_boot container at the SoC level to map the boot rom
>> region as an overlap.
> 
> 2nd patch,
> 
>> It also fixes a Coverity report (CID 1508061) for a memory leak
>> warning when the QEMU process exits by using an bmc_boot_rom
>> MemoryRegion available at the machine level.
> 
> 1st patch?

That would be superfluous.

> 
>> Cc: Peter Delevoryas <peter@pjd.dev>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>   hw/arm/fby35.c | 29 +++++++++++++++--------------
>>   1 file changed, 15 insertions(+), 14 deletions(-)
> 

