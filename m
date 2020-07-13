Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3229149lfm;
        Mon, 13 Jul 2020 05:21:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzrfKEqVMx4D6os0T2I9ZpBeJvxjKkPp4brno7pjUR6eD4jC1rIcwfS/A4P/B/R9m8d6RO1
X-Received: by 2002:a25:acd5:: with SMTP id x21mr126597975ybd.400.1594642882477;
        Mon, 13 Jul 2020 05:21:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594642882; cv=none;
        d=google.com; s=arc-20160816;
        b=LwIsaw37AUvoV7l1PZuW6m3PzDZA3OwVvbEevqxnog6U7oN2S5wY70w3SltbhZGdwk
         IhQZJKd03VFfMSE5fIPzspAn3SwRLkfhrH2uJSkih8uF0uQwgls6uxWQPvjutN2FO12y
         tc6k2hhTtznXWYDjX4w8f5vF78DVwue8uWakzrKWHWx0XNQOIt5TJfSV1JpMeMZWleSl
         5rrg7lWXbnStAGt/2a42/jXAZ83T3Ai+Th1VlDfyhte6fqMbfOmavcS0Q7j/O2i2blai
         h6bwlB8aOBaJlRqOuP8Y8R+chvE0NXzIzT5E+EjUU3f03gbhKZdhCkaDcnZQkLZuLojx
         bwaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=Egpc54i5HYWfGCfP9m9uTkxpfsUOjfaZe0mlV+GmJB8=;
        b=U8oQ6Zpb3YKO4S8rrkIUWF200tOh1rZ8R64ql1hoo287MQHavfz7hW4lo6CLkSdXxA
         /NxL/0E1TGG4alYUtcMW4oChQw4/ZE2CjZk+2HuvpsdKdgdc45arnh8qvCsq+4sTCuDT
         xJUqRxLzPT7gj/PYtEG9JqRs0RwhRN6HqYWrX/KrGofzt84z5J1/HnS6+7G+VQ8Fptri
         UzsXAadJ0QPXQpiuZOj0pVULmIwxJLSfUXpD2YUWI2Up3UfJk8JpFC3wY6EC7LNkMFFB
         HSm8vCA8RAjHbGnM/fTuuN+DnusYZTEHS4RDMBuR3SKfM0TNsZhg6mUOHBu0e2f8uSqG
         vQHA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a11si15667957ybp.411.2020.07.13.05.21.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Jul 2020 05:21:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1juxST-0002Jh-NO
	for alex.bennee@linaro.org; Mon, 13 Jul 2020 08:21:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1juxSD-0002HM-Jh
 for qemu-arm@nongnu.org; Mon, 13 Jul 2020 08:21:05 -0400
Received: from 1.mo179.mail-out.ovh.net ([178.33.111.220]:50653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1juxSB-0007sg-Ri
 for qemu-arm@nongnu.org; Mon, 13 Jul 2020 08:21:05 -0400
Received: from player796.ha.ovh.net (unknown [10.108.57.139])
 by mo179.mail-out.ovh.net (Postfix) with ESMTP id 4B7C216FAF6
 for <qemu-arm@nongnu.org>; Mon, 13 Jul 2020 14:20:58 +0200 (CEST)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player796.ha.ovh.net (Postfix) with ESMTPSA id 8DA4C14402D22;
 Mon, 13 Jul 2020 12:20:48 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R003ca60b909-72eb-4364-a51f-3b7e6e2dbd1f,29C60B8BFD44B6CD822E82BF6A6060F4508BB267)
 smtp.auth=clg@kaod.org
Subject: Re: [PATCH] hw/arm/aspeed: Do not create and attach empty SD cards by
 default
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200705173402.15620-1-f4bug@amsat.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <f21c68c9-a4e3-76cb-7484-1816d5742163@kaod.org>
Date: Mon, 13 Jul 2020 14:20:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200705173402.15620-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 5884234388977978201
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedrvdekgdehvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepfeffvddtudegieefudeugffhjefgieegieegleettdehgfeiieevueeihfegfefgnecukfhppedtrddtrddtrddtpdekvddrieegrddvhedtrddujedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeeliedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=178.33.111.220; envelope-from=clg@kaod.org;
 helo=1.mo179.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/13 08:21:01
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
 qemu-arm@nongnu.org, Eddie James <eajames@linux.ibm.com>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Tmol9A4ujRrp

On 7/5/20 7:34 PM, Philippe Mathieu-Daudé wrote:
> Since added in commit 2bea128c3d, each SDHCI is wired with a SD
> card, using empty card when no block drive provided. This is not
> the desired behavior. The SDHCI exposes a SD bus to plug cards
> on, if no card available, it is fine to have an unplugged bus.
> 
> Avoid creating unnecessary SD card device when no block drive
> provided.
> 
> Fixes: 2bea128c3d ("hw/sd/aspeed_sdhci: New device")
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
> Cc: Eddie James <eajames@linux.ibm.com>
> Cc: Cédric Le Goater <clg@kaod.org>
> Cc: Joel Stanley <joel@jms.id.au>
> Cc: Andrew Jeffery <andrew@aj.id.au>
> ---
>  hw/arm/aspeed.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 379f9672a5..11521c4be1 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -246,11 +246,12 @@ static void sdhci_attach_drive(SDHCIState *sdhci, DriveInfo *dinfo)
>  {
>          DeviceState *card;
>  
> -        card = qdev_new(TYPE_SD_CARD);
> -        if (dinfo) {
> -            qdev_prop_set_drive_err(card, "drive", blk_by_legacy_dinfo(dinfo),
> -                                    &error_fatal);
> +        if (!dinfo) {
> +            return;
>          }
> +        card = qdev_new(TYPE_SD_CARD);
> +        qdev_prop_set_drive_err(card, "drive", blk_by_legacy_dinfo(dinfo),
> +                                &error_fatal);
>          qdev_realize_and_unref(card,
>                                 qdev_get_child_bus(DEVICE(sdhci), "sd-bus"),
>                                 &error_fatal);
> 

