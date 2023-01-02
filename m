Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp6707833ejb;
        Mon, 2 Jan 2023 05:37:06 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsVgFeaQYoXXj5UFrY1+eLQ7EzqM2BO0HIClNbHo8ukeW9gyO3+2aqbYdB3B8bI+qg3w7MU
X-Received: by 2002:a0c:f242:0:b0:52a:e0dd:ef65 with SMTP id z2-20020a0cf242000000b0052ae0ddef65mr52758401qvl.24.1672666626749;
        Mon, 02 Jan 2023 05:37:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672666626; cv=none;
        d=google.com; s=arc-20160816;
        b=C2qaidc+alNfcoRq8M0muqTtR2GVWjLi6oE4gkzKSCsBbG83ZDSgNXJjTLmAQIAHGB
         oxa7FDCqlhzASFApx+D5fruKaP/cT5hIPNm+X3hEZqD/jyAH5zGBcvLzEhRBYkK5Vkd7
         GiaVNO43syk8cBiFCIT1LgDqklYH1+4/eBG7u9XBp3mTTkZ4blmf6bGZOUuNUx72jJBn
         I+rG0ZkUVgxDRHLV1tMIl/31hq34lafT2H+HX3Yto/bwyifb0r8TvKW1f7WVLbrB/0V2
         TTAHY8EfXYE190Cv/LBXNMTgwJkCjq0C9ia+3TC/1fuLHRWSjtz9sgAqegPB6osiH0Lv
         ATwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=zmXA35lYP7m/VgjujDDqC5xbvWmD3CzV25otfCWDsOg=;
        b=o1Bg2s/l8ixxCva8Ia7bvfTCIiuGxD0EZTNFCS6e+opkXmC9zt5hKqM+9pz37Xtrok
         ippdrlZ7lUexqH5SX9ScWT4Oeb0SCg+aOm4YWGg8Un8U8+gqgDuxPdmzdOFmzIPJ4is1
         NyHoV32t19B6MxHRW9YQmfevjeTnnGMYXzxhnjJzwJHfRS93lybFQ/JwZrpgVGMnaOmT
         GbnwWU8ePj1NyEPnf0vomrCWq1wuBpo2PruviQiNXUTE0ihBjoRofHuPXidNaA2BXB1S
         P5lNwJSQ6+88DxOeOcRddlqZxatdWcyQhUT+zgRUW/BXwJL6uScem9ee2IJEW+O08s2Y
         oxAA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id iu15-20020ad45ccf000000b004c6987c3032si14949802qvb.27.2023.01.02.05.37.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Jan 2023 05:37:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCKzn-0008Bz-5t; Mon, 02 Jan 2023 08:36:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pCKzl-00089d-A6
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 08:36:53 -0500
Received: from 8.mo552.mail-out.ovh.net ([46.105.37.156])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pCKzj-000617-2U
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 08:36:53 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.246])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 475E92CD67;
 Mon,  2 Jan 2023 13:36:48 +0000 (UTC)
Received: from kaod.org (37.59.142.96) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Mon, 2 Jan
 2023 14:36:47 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R0010d53704b-dd8b-42ab-bcd4-c6b2b1babc15,
 EB6D15DD045C308F841A27F8E66F545441276E15) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <c574fc46-a5cc-846d-7dd9-ff7b52dab4b5@kaod.org>
Date: Mon, 2 Jan 2023 14:36:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 04/11] hw/arm/aspeed: Use the IEC binary prefix
 definitions
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 <qemu-devel@nongnu.org>
CC: Joel Stanley <joel@jms.id.au>, Troy Lee <troy_lee@aspeedtech.com>, Beraldo
 Leal <bleal@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Wainer dos
 Santos Moschetta <wainersm@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, Peter Delevoryas
 <peter@pjd.dev>, Steven Lee <steven_lee@aspeedtech.com>, Jamin Lin
 <jamin_lin@aspeedtech.com>, Peter Delevoryas <pdel@fb.com>, Peter Delevoryas
 <pdel@meta.com>, <qemu-arm@nongnu.org>, Cleber Rosa <crosa@redhat.com>
References: <20221230113504.37032-1-philmd@linaro.org>
 <20221230113504.37032-5-philmd@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20221230113504.37032-5-philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: f32aa98f-6556-419a-b67e-6db9c8524573
X-Ovh-Tracer-Id: 15992282280746388356
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrjedvgdehgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepffdufeeliedujeeffffhjeffiefghffhhfdvkeeijeehledvueffhfejtdehgeegnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepphhhihhlmhgusehlihhnrghrohdrohhrghdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpjhhovghlsehjmhhsrdhiugdrrghupdhtrhhohigplhgvvgesrghsphgvvgguthgvtghhrdgtohhmpdgslhgvrghlsehrvgguhhgrthdrtghomhdpphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgpdifrghinhgvrhhsmhesrhgvughhrghtrdgtohhmpdgrnhgurhgvfiesrghjrdhiugdrrghupdgthhhinhdqthhinhhgpghkuhhosegrshhpvggvughtvggthhdrtg
 homhdpphgvthgvrhesphhjugdruggvvhdpshhtvghvvghnpghlvggvsegrshhpvggvughtvggthhdrtghomhdpjhgrmhhinhgplhhinhesrghsphgvvgguthgvtghhrdgtohhmpdhpuggvlhesfhgsrdgtohhmpdhpuggvlhesmhgvthgrrdgtohhmpdhqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgpdgtrhhoshgrsehrvgguhhgrthdrtghomhdpoffvtefjohhsthepmhhoheehvddpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=46.105.37.156; envelope-from=clg@kaod.org;
 helo=8.mo552.mail-out.ovh.net
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.142,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: HNfLia2ODkOl

On 12/30/22 12:34, Philippe Mathieu-Daudé wrote:
> IEC binary prefixes ease code review: the unit is explicit.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: Peter Delevoryas <peter@pjd.dev>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>   hw/arm/aspeed_ast10x0.c | 3 ++-
>   hw/arm/aspeed_ast2600.c | 3 ++-
>   hw/arm/aspeed_soc.c     | 4 ++--
>   3 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
> index 122b3fd3f3..3500294df7 100644
> --- a/hw/arm/aspeed_ast10x0.c
> +++ b/hw/arm/aspeed_ast10x0.c
> @@ -10,6 +10,7 @@
>    */
>   
>   #include "qemu/osdep.h"
> +#include "qemu/units.h"
>   #include "qapi/error.h"
>   #include "exec/address-spaces.h"
>   #include "sysemu/sysemu.h"
> @@ -348,7 +349,7 @@ static void aspeed_soc_ast1030_class_init(ObjectClass *klass, void *data)
>       sc->name = "ast1030-a1";
>       sc->cpu_type = ARM_CPU_TYPE_NAME("cortex-m4");
>       sc->silicon_rev = AST1030_A1_SILICON_REV;
> -    sc->sram_size = 0xc0000;
> +    sc->sram_size = 768 * KiB;
>       sc->spis_num = 2;
>       sc->ehcis_num = 0;
>       sc->wdts_num = 4;
> diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
> index a79e05ddbd..72df72a540 100644
> --- a/hw/arm/aspeed_ast2600.c
> +++ b/hw/arm/aspeed_ast2600.c
> @@ -8,6 +8,7 @@
>    */
>   
>   #include "qemu/osdep.h"
> +#include "qemu/units.h"
>   #include "qapi/error.h"
>   #include "hw/misc/unimp.h"
>   #include "hw/arm/aspeed_soc.h"
> @@ -619,7 +620,7 @@ static void aspeed_soc_ast2600_class_init(ObjectClass *oc, void *data)
>       sc->name         = "ast2600-a3";
>       sc->cpu_type     = ARM_CPU_TYPE_NAME("cortex-a7");
>       sc->silicon_rev  = AST2600_A3_SILICON_REV;
> -    sc->sram_size    = 0x16400;
> +    sc->sram_size    = 89 * KiB;
>       sc->spis_num     = 2;
>       sc->ehcis_num    = 2;
>       sc->wdts_num     = 4;
> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> index 2c0924d311..677342c9ed 100644
> --- a/hw/arm/aspeed_soc.c
> +++ b/hw/arm/aspeed_soc.c
> @@ -517,7 +517,7 @@ static void aspeed_soc_ast2400_class_init(ObjectClass *oc, void *data)
>       sc->name         = "ast2400-a1";
>       sc->cpu_type     = ARM_CPU_TYPE_NAME("arm926");
>       sc->silicon_rev  = AST2400_A1_SILICON_REV;
> -    sc->sram_size    = 0x8000;
> +    sc->sram_size    = 32 * KiB;
>       sc->spis_num     = 1;
>       sc->ehcis_num    = 1;
>       sc->wdts_num     = 2;
> @@ -544,7 +544,7 @@ static void aspeed_soc_ast2500_class_init(ObjectClass *oc, void *data)
>       sc->name         = "ast2500-a1";
>       sc->cpu_type     = ARM_CPU_TYPE_NAME("arm1176");
>       sc->silicon_rev  = AST2500_A1_SILICON_REV;
> -    sc->sram_size    = 0x9000;
> +    sc->sram_size    = 36 * KiB;
>       sc->spis_num     = 2;
>       sc->ehcis_num    = 2;
>       sc->wdts_num     = 3;

