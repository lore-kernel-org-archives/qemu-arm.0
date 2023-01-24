Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp3485293ejc;
        Mon, 23 Jan 2023 23:29:53 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsLsAZxqjBIq+OADCyU8qYQg0XiTMLQPp7ZrhkCLxEa4hEwHYvoqKZ8GvgUsRlDkmmRm7sc
X-Received: by 2002:ac8:1008:0:b0:3ab:6a9a:aa8b with SMTP id z8-20020ac81008000000b003ab6a9aaa8bmr34950560qti.60.1674545392831;
        Mon, 23 Jan 2023 23:29:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674545392; cv=none;
        d=google.com; s=arc-20160816;
        b=j+bKADu4OzZ49e6ch3A4QxyEe5tDtB6Kwk3p3hAJ6yUtU+5D8wg6mU+Y1GqfLJ4oMA
         tCT55WefwWygO74hMbh77PxFVRsyrlRIo0sP2nTT/96cPkauO/WEKsdOtcgmcYu1G/1W
         N9d33G9nxmXHtTDlVNlfsxlMT5J+IP48+P5Q0kUlsSS2uY8C0erwVIflLP+nPBcDgsSY
         4bmzQoRw6/BbG0dtAJEZ69Zb511LPY452WSpu03TvHVbDhUTbozPRSe9pSUjixpb52LV
         czjk795RmbJXAKskqmvAC7Kr2aYaiKCMOPFWpfGI+3/MCCpmlD/6EtvyTVezYOBO2PuB
         j9fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=mKCCY6AOwG+YKLnTKTOLOX/LoGQrnzoekJZKxsAicDM=;
        b=mk0V4M2fJHzp74Pu2coGqfJapcZe2pN1sgj9vXzdPrH3FNoW/xlMhry8AEGW5LRfWI
         LH0YCpxery86vtPL2b4BbPlrLnIQ85ReyfUYckT2CSdFEZFDWiOpzcFrs1hb/hXoNfz6
         ka1JQCt5pT4zLccHHGnn2aqlsGYD+N0fqzFpPnbM8n13oAsrkW0DKsk4wWv5keXs7eY2
         vwexz/6IBORgmiVAco3QA0IzhsEpJTMiyhha7exVhLhQgc1HFy6yqh12kJ/7b66C1keD
         xUBknCFc1RYrxoQWjht0RlgJA6C0V9y/gu2GnFFh5+ZEu7XEofMHsqseDMayOQ5y2HjK
         JAoA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k26-20020ae9f11a000000b006feb000391fsi1172178qkg.703.2023.01.23.23.29.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Jan 2023 23:29:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pKDkZ-0003mz-EC; Tue, 24 Jan 2023 02:29:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pKDkO-0003mS-8j
 for qemu-arm@nongnu.org; Tue, 24 Jan 2023 02:29:36 -0500
Received: from 3.mo552.mail-out.ovh.net ([178.33.254.192])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pKDkM-0005AG-G6
 for qemu-arm@nongnu.org; Tue, 24 Jan 2023 02:29:35 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.239])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 3301F2B3AB;
 Tue, 24 Jan 2023 07:29:19 +0000 (UTC)
Received: from kaod.org (37.59.142.107) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Tue, 24 Jan
 2023 08:29:19 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-107S00103ff705f-a811-424c-a923-b785971c099d,
 FEB7C0486E5C177E865405A4267E59907E449511) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <f9e30d2c-51e7-399d-1094-8a01c7ff0d2a@kaod.org>
Date: Tue, 24 Jan 2023 08:29:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] aspeed/sdmc: Drop unnecessary scu include
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>
CC: Peter Maydell <peter.maydell@linaro.org>, <qemu-arm@nongnu.org>,
 <qemu-devel@nongnu.org>
References: <20230124062022.298230-1-joel@jms.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20230124062022.298230-1-joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.107]
X-ClientProxiedBy: DAG9EX1.mxp5.local (172.16.2.81) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 84e978a8-071d-4f6b-acd1-c4634abeb15b
X-Ovh-Tracer-Id: 9858098110242261984
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrudduledguddtlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepffdufeeliedujeeffffhjeffiefghffhhfdvkeeijeehledvueffhfejtdehgeegnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrddutdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehjohgvlhesjhhmshdrihgurdgruhdpphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgpdhqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdfovfetjfhoshhtpehmohehhedvpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=178.33.254.192; envelope-from=clg@kaod.org;
 helo=3.mo552.mail-out.ovh.net
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.147,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: lJz0NqMv1ptH

On 1/24/23 07:20, Joel Stanley wrote:
> The model includes aspeed_scu.h but doesn't appear to require it.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>   hw/misc/aspeed_sdmc.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/hw/misc/aspeed_sdmc.c b/hw/misc/aspeed_sdmc.c
> index d2a3931033b3..abb272793393 100644
> --- a/hw/misc/aspeed_sdmc.c
> +++ b/hw/misc/aspeed_sdmc.c
> @@ -12,7 +12,6 @@
>   #include "qemu/module.h"
>   #include "qemu/error-report.h"
>   #include "hw/misc/aspeed_sdmc.h"
> -#include "hw/misc/aspeed_scu.h"
>   #include "hw/qdev-properties.h"
>   #include "migration/vmstate.h"
>   #include "qapi/error.h"

