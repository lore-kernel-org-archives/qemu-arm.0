Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp6707351ejb;
        Mon, 2 Jan 2023 05:36:20 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsXTTC0rklvTocj0yKbJdbSqvxeJazQTOamZqDe1w77kbbsf1ees1Js2hf2+sFUpxRf2IC9
X-Received: by 2002:a05:622a:2516:b0:3a9:70a2:2c59 with SMTP id cm22-20020a05622a251600b003a970a22c59mr62673532qtb.39.1672666580343;
        Mon, 02 Jan 2023 05:36:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672666580; cv=none;
        d=google.com; s=arc-20160816;
        b=z0S+o3sUqhpu117gX/em6CKQQt+QYFAY9WD4cMdY1z9sZG6WOsoSWB/s1rKitbIYy9
         SVyIrTzxVgeV1QwUvXr0c6JiFJXWoXOrCGkLy3f/DgAbH9W80ACIN36Cu2dPhVeI8DZD
         TlKGFeD6XX/S7UKDcD7mPKuApWyQmrQAlIQ0JUgbE0t0d+telGKKPgLikjsUnqCsFkcL
         XL8NQel7+JN8BvapDnVEBudvLnzBhSn/YRphlmnfXQEQbFtPFqbtgKFddMvX5Uol3u/B
         KxJ9zxkt3BhDHFADe+836eyENCqcL0BD4BtzTs2EO2eIaeGEUjBv5uWaR8v0S5i/yei+
         PQaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=kYWIgpHHo1wzwPxGlc8DOwWpRzeli5L4DAr9AgyOpjI=;
        b=KV6riWt5oywIXyJuQAj+Hzlf84twi9DLrG/c/H9ticEP1LJDDjWNJFCk8xwR/X3JEa
         d+gk+lpPaHtMBAPNA/mURwZXobnbm0WgTVFFoV5bwB4WyQECWpQWh4VlUSgnzdx8irDW
         OYyWCKqAztAhgfUnAjTW9Zc6CcCfS4329yCTXsQeTDA5Ayj2/C9J4aYF+EXEqAHhcnqN
         8aLMnxJ+Bk5f5NU09dWAxBEI3n5mFNe4Gik4N6lokovEBW8hdJzjbcQzeWH7CBpH7RWe
         5EKy+RKucqkxd04yiUY897AUJKkxeaV8jGGB0HVdOg62//gp+2VhBuQq1SbqGQBMYG4r
         4CrA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u18-20020a05620a455200b006fec41dd8e1si15965343qkp.506.2023.01.02.05.36.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Jan 2023 05:36:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pCKyt-0007Vr-TK; Mon, 02 Jan 2023 08:35:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1pCKys-0007Ve-SC; Mon, 02 Jan 2023 08:35:58 -0500
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1pCKyq-0005nX-PD; Mon, 02 Jan 2023 08:35:58 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.235])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 6673C150560F0;
 Mon,  2 Jan 2023 14:35:51 +0100 (CET)
Received: from kaod.org (37.59.142.103) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Mon, 2 Jan
 2023 14:35:50 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G005aacd1b6e-11e8-41d4-ad12-1b23f5547c81,
 EB6D15DD045C308F841A27F8E66F545441276E15) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <978c32d6-3e76-0a2c-fe47-169994b55541@kaod.org>
Date: Mon, 2 Jan 2023 14:35:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 03/11] hw/watchdog/wdt_aspeed: Log unimplemented
 registers as UNIMP level
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
 <20221230113504.37032-4-philmd@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20221230113504.37032-4-philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 098b4b4e-3063-471d-afbb-ac2b9243ff08
X-Ovh-Tracer-Id: 15976238204933409668
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrjedvgdehhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepfefgkeetkeegleehueejgefhteekteelieduueffkeetgfekheeuffehveevkeejnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepphhhihhlmhgusehlihhnrghrohdrohhrghdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpjhhovghlsehjmhhsrdhiugdrrghupdhtrhhohigplhgvvgesrghsphgvvgguthgvtghhrdgtohhmpdgslhgvrghlsehrvgguhhgrthdrtghomhdpphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgpdifrghinhgvrhhsmhesrhgvughhrghtrdgtohhmpdgrnhgurhgvfiesrghjrdhiugdrrghupdgthhhinhdqth
 hinhhgpghkuhhosegrshhpvggvughtvggthhdrtghomhdpphgvthgvrhesphhjugdruggvvhdpshhtvghvvghnpghlvggvsegrshhpvggvughtvggthhdrtghomhdpjhgrmhhinhgplhhinhesrghsphgvvgguthgvtghhrdgtohhmpdhpuggvlhesfhgsrdgtohhmpdhpuggvlhesmhgvthgrrdgtohhmpdhqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgpdgtrhhoshgrsehrvgguhhgrthdrtghomhdpoffvtefjohhsthepmhhohedvledpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout3.mo529.mail-out.ovh.net
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.142,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: XoXcuNkffpdH

On 12/30/22 12:34, Philippe Mathieu-Daudé wrote:
> Add more Aspeed watchdog registers from [*].
> 
> Since guests can righteously access them, log the access at
> 'unimplemented' level instead of 'guest-errors'.
> 
> [*] https://github.com/AspeedTech-BMC/zephyr/blob/v00.01.08/drivers/watchdog/wdt_aspeed.c#L31
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

LGTM.

We need to decide how to address the #regs per soc. I would introduce a class
attribute and define ASPEED_WDT_REGS_MAX as the maximum of all, or possibly
allocate the regs array in the realize routine. This is a little more work.

Thanks,

C.



> ---
>   hw/watchdog/wdt_aspeed.c         | 13 +++++++++++++
>   include/hw/watchdog/wdt_aspeed.h |  2 +-
>   2 files changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
> index eefca31ae4..d267aa185c 100644
> --- a/hw/watchdog/wdt_aspeed.c
> +++ b/hw/watchdog/wdt_aspeed.c
> @@ -42,6 +42,11 @@
>   #define     WDT_PUSH_PULL_MAGIC         (0xA8 << 24)
>   #define     WDT_OPEN_DRAIN_MAGIC        (0x8A << 24)
>   #define WDT_RESET_MASK1                 (0x1c / 4)
> +#define WDT_RESET_MASK2                 (0x20 / 4)
> +
> +#define WDT_SW_RESET_CTRL               (0x24 / 4)
> +#define WDT_SW_RESET_MASK1              (0x28 / 4)
> +#define WDT_SW_RESET_MASK2              (0x2c / 4)
>   
>   #define WDT_TIMEOUT_STATUS              (0x10 / 4)
>   #define WDT_TIMEOUT_CLEAR               (0x14 / 4)
> @@ -83,6 +88,10 @@ static uint64_t aspeed_wdt_read(void *opaque, hwaddr offset, unsigned size)
>           return s->regs[WDT_RESET_MASK1];
>       case WDT_TIMEOUT_STATUS:
>       case WDT_TIMEOUT_CLEAR:
> +    case WDT_RESET_MASK2:
> +    case WDT_SW_RESET_CTRL:
> +    case WDT_SW_RESET_MASK1:
> +    case WDT_SW_RESET_MASK2:
>           qemu_log_mask(LOG_UNIMP,
>                         "%s: uninmplemented read at offset 0x%" HWADDR_PRIx "\n",
>                         __func__, offset);
> @@ -190,6 +199,10 @@ static void aspeed_wdt_write(void *opaque, hwaddr offset, uint64_t data,
>   
>       case WDT_TIMEOUT_STATUS:
>       case WDT_TIMEOUT_CLEAR:
> +    case WDT_RESET_MASK2:
> +    case WDT_SW_RESET_CTRL:
> +    case WDT_SW_RESET_MASK1:
> +    case WDT_SW_RESET_MASK2:
>           qemu_log_mask(LOG_UNIMP,
>                         "%s: uninmplemented write at offset 0x%" HWADDR_PRIx "\n",
>                         __func__, offset);
> diff --git a/include/hw/watchdog/wdt_aspeed.h b/include/hw/watchdog/wdt_aspeed.h
> index db91ee6b51..e90ef86651 100644
> --- a/include/hw/watchdog/wdt_aspeed.h
> +++ b/include/hw/watchdog/wdt_aspeed.h
> @@ -21,7 +21,7 @@ OBJECT_DECLARE_TYPE(AspeedWDTState, AspeedWDTClass, ASPEED_WDT)
>   #define TYPE_ASPEED_2600_WDT TYPE_ASPEED_WDT "-ast2600"
>   #define TYPE_ASPEED_1030_WDT TYPE_ASPEED_WDT "-ast1030"
>   
> -#define ASPEED_WDT_REGS_MAX        (0x20 / 4)
> +#define ASPEED_WDT_REGS_MAX        (0x30 / 4)
>   
>   struct AspeedWDTState {
>       /*< private >*/

