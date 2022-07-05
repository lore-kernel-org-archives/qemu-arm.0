Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3697534lft;
        Mon, 4 Jul 2022 22:52:04 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1thC1mc1FkjG+LCOtIqfFAJyxA9XVwypNoofQjoLfifvJLxfU/8QT46eJLULAoWllarx99R
X-Received: by 2002:a05:622a:5cf:b0:31d:4c04:b642 with SMTP id d15-20020a05622a05cf00b0031d4c04b642mr7518660qtb.310.1657000324545;
        Mon, 04 Jul 2022 22:52:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657000324; cv=none;
        d=google.com; s=arc-20160816;
        b=SlRrBPUr4iPLlWiGXhlkXWd2lJz2ElPwfRAlN5/88ifHlKrXnOl/sEgjaVzjMtDq2G
         HHXmJH1GYRyWJXjnG2nLTodBMECevXHyPIJrIDRsF4rq4E1w9m1r6myIzdInQ097W4cc
         rVV2gX8Q0bqGpkGw+2m+90/Q2/gkWabFGD4KZ7mf2vUcgwocd7M6ItSMe+7cvlItyRod
         E0l74vT+jyXc4hm3fyufApdDSVnxj8Hc8zod0O9G/gowMJ7TM0pBzydSucM1KL5xnnDQ
         ssOo/SWWmAAT1N9XVBOXA+tVcxOyfRWQoY4BBx2cJFr+rL0aFz7iPRuXW0QAr4BlPQMw
         To0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=ijIhVmwXu1X/blTFAdU1lKsPIsn+0cy0laSrnvr6D08=;
        b=gi9jSe7qjzhzVmtaKOShztUNalCD343DaFK3IEkOVmNJZaB3cu95fn6K5sD/ctNThS
         3WloGLd9KpnUj4lClgcMj0fWs8afCvsUg6dz60e76sJCeBD9cuuPPLMpmzjqxz9xC8W1
         rRora/jipD5dskbTasSeRrGzjRmL2RXh+mGB/vcZvoL0NGB6ir48PTUTdvyUj3m5uaIf
         NaEoDYERSJrl0Qoih9xfeWbYNYKg97fN56+1MF/UgeQe6zxlauXH4roSOvJXa3ozUwam
         SjedNwXR1lOjE8Ab0OH7o0o3AiKXTAjxOZVQa7kJXS2rm/vt6xTBD0j+RVgG3N243HsR
         azXw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s18-20020a05622a179200b0031a08325b86si15516472qtk.513.2022.07.04.22.52.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Jul 2022 22:52:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o8bTf-0003vI-Vh
	for alex.bennee@linaro.org; Tue, 05 Jul 2022 01:52:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o8bRF-0001HY-TF
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 01:49:34 -0400
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81]:34489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o8bRE-0005QS-5S
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 01:49:33 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.107])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 3A30411460544;
 Tue,  5 Jul 2022 07:49:30 +0200 (CEST)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Tue, 5 Jul 2022
 07:49:29 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G00271c749b0-bb19-4acc-b544-7c7d087ea3f5,
 4FF77D4A254985FC0BE9A952312E42D6E34C6CC4) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <e6006847-fac1-2925-6aa7-ae9c09b737f0@kaod.org>
Date: Tue, 5 Jul 2022 07:49:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 4/8] aspeed: Make aspeed_board_init_flashes public
Content-Language: en-US
To: Peter Delevoryas <peter@pjd.dev>
CC: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery
 <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>, <qemu-arm@nongnu.org>,
 <qemu-devel@nongnu.org>
References: <20220704215457.38332-1-peter@pjd.dev>
 <20220704215457.38332-4-peter@pjd.dev>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220704215457.38332-4-peter@pjd.dev>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 28644541-8d28-4679-b8b5-a283ed8e4512
X-Ovh-Tracer-Id: 15053844706887895846
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudeitddgleelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekteejtdelkeejvdevffduhfetteelieefgeefffeugffhfeekheffueefledujeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpoffvtefjohhsthepmhhohedvle
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout3.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lCaDOKjXA3qC

On 7/4/22 23:54, Peter Delevoryas wrote:
> Signed-off-by: Peter Delevoryas <peter@pjd.dev>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
>   hw/arm/aspeed.c             | 2 +-
>   include/hw/arm/aspeed_soc.h | 2 ++
>   2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index cc395f988c..b2486a9e78 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -262,7 +262,7 @@ static void write_boot_rom(DriveInfo *dinfo, hwaddr addr, size_t rom_size,
>       rom_add_blob_fixed("aspeed.boot_rom", storage, rom_size, addr);
>   }
>   
> -static void aspeed_board_init_flashes(AspeedSMCState *s, const char *flashtype,
> +void aspeed_board_init_flashes(AspeedSMCState *s, const char *flashtype,
>                                         unsigned int count, int unit0)
>   {
>       int i;
> diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
> index 68e907cd64..8389200b2d 100644
> --- a/include/hw/arm/aspeed_soc.h
> +++ b/include/hw/arm/aspeed_soc.h
> @@ -184,5 +184,7 @@ void aspeed_mmio_map(AspeedSoCState *s, SysBusDevice *dev, int n, hwaddr addr);
>   void aspeed_mmio_map_unimplemented(AspeedSoCState *s, SysBusDevice *dev,
>                                      const char *name, hwaddr addr,
>                                      uint64_t size);
> +void aspeed_board_init_flashes(AspeedSMCState *s, const char *flashtype,
> +                               unsigned int count, int unit0);
>   
>   #endif /* ASPEED_SOC_H */

