Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp2983119lfb;
        Mon, 18 May 2020 05:19:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJynPHZxfEElb71RsascAmHsGx+T4+GDm68NIXCFyI/huWSft7MhgvxkCaSL2asmoXgPYoS3
X-Received: by 2002:ac8:5191:: with SMTP id c17mr16089450qtn.79.1589804391103;
        Mon, 18 May 2020 05:19:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589804391; cv=none;
        d=google.com; s=arc-20160816;
        b=mdjrHN4/d+jiltXByZj1LbhsBklon0j7BHywJWU1CphfswwFkmrWaKOxPeSnVWTKg4
         ZktoFzKaQdn/PWafZQVP1qkPfHZ9NQ0jUea4Ckx7E6EvdG+SlexGsYEBsrMNpnRQJiit
         CcOLmYAi0ErFG3XusjquYePR3uD2IQmQ/uM7BtpA8+QdNnoe9RQl3yJG0nGPHYdbaCQS
         7eNgAWd1L7YfOtDLFr1sJXh4M358OQSUjaiR2ldiqSqepQDZzi+Sy0afHUbxNMg3N+cJ
         kanyx/4MZthNdXuWal/5NO48b7bgi1v+XHguw0B6501KCU/qHH0LlCjQcXe+gcXbp0JD
         Iq5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=xxPV6BxKOXqna+RgoleN5x2d+AT2fiXQz7RRm+fYLEI=;
        b=m4gBCnMRHJwiUFhbuU2Xu8SRvnDBIcIyfrpIqCZZrsPQpQd0YDe7lVnw7KjA+FDpgU
         5di8nY5qUyhZ3IXJ5bCXnFqjAuOkc6W3Ir7ubcIQSdiu+W2kdo5zpT6Li4YMjNGZryGv
         DDxwCzXwheEATQvl+dNeEbOpwxJvnAKX9y76gvF1cPFggyD16skWzOFkVSjFD8a7vjz5
         4LKaf0IfftrtbSNLZWOSkEr2kDLbsAMDzYu1WU5er7+BLsl9dbE3L3ogrq/fF3pnvOrC
         E+pwYOiQbt1pAHuJFniATThx6eC8rm4KpZHydOE3MZEQOO7Bak48Gdiqy6h02uGk+Grf
         BMXA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z187si5627400qkb.113.2020.05.18.05.19.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 May 2020 05:19:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jaekI-0002ha-Hr
	for alex.bennee@linaro.org; Mon, 18 May 2020 08:19:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1jaekB-0002gi-Rh
 for qemu-arm@nongnu.org; Mon, 18 May 2020 08:19:43 -0400
Received: from 2.mo173.mail-out.ovh.net ([178.33.251.49]:40553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1jaekA-0006hF-MB
 for qemu-arm@nongnu.org; Mon, 18 May 2020 08:19:43 -0400
Received: from player687.ha.ovh.net (unknown [10.108.42.142])
 by mo173.mail-out.ovh.net (Postfix) with ESMTP id 868B2139A2E
 for <qemu-arm@nongnu.org>; Mon, 18 May 2020 14:19:31 +0200 (CEST)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player687.ha.ovh.net (Postfix) with ESMTPSA id A546F126EBDD1;
 Mon, 18 May 2020 12:19:14 +0000 (UTC)
Subject: Re: [PATCH 04/24] aspeed: Don't create unwanted "ftgmac100",
 "aspeed-mmi" devices
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20200518050408.4579-1-armbru@redhat.com>
 <20200518050408.4579-5-armbru@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <9fc4a6e2-fa90-ba62-91cf-e22eb3ef4cdc@kaod.org>
Date: Mon, 18 May 2020 14:19:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200518050408.4579-5-armbru@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 9030561680808250288
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedruddthedghedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeefffdvtddugeeifeduuefghfejgfeigeeigeeltedthefgieeiveeuiefhgeefgfenucfkpheptddrtddrtddrtddpkedvrdeigedrvdehtddrudejtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrheikeejrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrgh
Received-SPF: pass client-ip=178.33.251.49; envelope-from=clg@kaod.org;
 helo=2.mo173.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/18 07:04:17
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>, berrange@redhat.com,
 ehabkost@redhat.com, Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ORQTf2KOTvDv

On 5/18/20 7:03 AM, Markus Armbruster wrote:
> These devices are optional, and controlled by @nb_nics.
> aspeed_soc_ast2600_init() and aspeed_soc_init() create the maximum
> supported number.  aspeed_soc_ast2600_realize() and
> aspeed_soc_realize() realize only the wanted number.  Works, although
> it can leave unrealized devices hanging around in the QOM composition
> tree.  Affects machines ast2500-evb, ast2600-evb, palmetto-bmc,
> romulus-bmc, swift-bmc, tacoma-bmc, and witherspoon-bmc.
> 
> Make the init functions create only the wanted ones.  Visible in "info
> qom-tree"; here's the change for ast2600-evb:
> 
>      /machine (ast2600-evb-machine)
>        [...]
>        /soc (ast2600-a1)
>          [...]
>          /ftgmac100[0] (ftgmac100)
>            /ftgmac100[0] (qemu:memory-region)
>     -    /ftgmac100[1] (ftgmac100)
>     -    /ftgmac100[2] (ftgmac100)
>     -    /ftgmac100[3] (ftgmac100)
>          /gpio (aspeed.gpio-ast2600)
>          [...]
>          /mii[0] (aspeed-mmi)
>            /aspeed-mmi[0] (qemu:memory-region)
>     -    /mii[1] (aspeed-mmi)
>     -    /mii[2] (aspeed-mmi)
>     -    /mii[3] (aspeed-mmi)
>          /rtc (aspeed.rtc)
> 
> I'm not sure creating @nb_nics devices makes sense.  How many does the
> physical chip provide?

The AST2400, AST2500 SoC have 2 macs and the AST2600 has 4. Each machine
define the one it uses, generally MAC0 but the tacoma board uses MAC3.

Shouldn't the model reflect the real address space independently from
the NIC backends defined on the command line ?  

How should we proceed in such cases ? 

Thanks,

C. 

> 
> Cc: "Cédric Le Goater" <clg@kaod.org>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Andrew Jeffery <andrew@aj.id.au>
> Cc: Joel Stanley <joel@jms.id.au>
> Cc: qemu-arm@nongnu.org
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  hw/arm/aspeed_ast2600.c | 2 +-
>  hw/arm/aspeed_soc.c     | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
> index 71a0acfe26..0a6a77dd54 100644
> --- a/hw/arm/aspeed_ast2600.c
> +++ b/hw/arm/aspeed_ast2600.c
> @@ -188,7 +188,7 @@ static void aspeed_soc_ast2600_init(Object *obj)
>                                sizeof(s->wdt[i]), typename);
>      }
>  
> -    for (i = 0; i < sc->macs_num; i++) {
> +    for (i = 0; i < nb_nics && i < sc->macs_num; i++) {
>          sysbus_init_child_obj(obj, "ftgmac100[*]", OBJECT(&s->ftgmac100[i]),
>                                sizeof(s->ftgmac100[i]), TYPE_FTGMAC100);
>  
> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> index cf6b6dd116..7ca860392a 100644
> --- a/hw/arm/aspeed_soc.c
> +++ b/hw/arm/aspeed_soc.c
> @@ -203,7 +203,7 @@ static void aspeed_soc_init(Object *obj)
>                                sizeof(s->wdt[i]), typename);
>      }
>  
> -    for (i = 0; i < sc->macs_num; i++) {
> +    for (i = 0; i < nb_nics && i < sc->macs_num; i++) {
>          sysbus_init_child_obj(obj, "ftgmac100[*]", OBJECT(&s->ftgmac100[i]),
>                                sizeof(s->ftgmac100[i]), TYPE_FTGMAC100);
>      }
> 

