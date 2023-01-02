Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp6697402ejb;
        Mon, 2 Jan 2023 05:18:29 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuHn51MA7ENe30SWcv36OtorPfDdS65EVowjbvIt9TlcYjD0VNbSJ1QZWq3563N1APDzcsr
X-Received: by 2002:a05:6102:334f:b0:3b1:4888:f6ad with SMTP id j15-20020a056102334f00b003b14888f6admr18955205vse.0.1672665508898;
        Mon, 02 Jan 2023 05:18:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672665508; cv=none;
        d=google.com; s=arc-20160816;
        b=AIE3u1E378bAcGAZB1k9i1Rg6+UcZ7uA/mfMK8GD6z0ZBaDb99vLwM9XGGeswN79nK
         KmBYyZM4XWl6TV6oCPOlirHK0zYbnnEFysGFchrYxlcAC7YxKanZQ32YGztrAANTXj59
         Qa5jJM6IL4PjnpS+ZrJiB0x1uYuAQ9aIfn+7Nd2+V8ht6UTRf0gQHBnim6oIv7LOl838
         4gjrJKZ8LKNKk9IQBMH7mEWqazPJgY57Try3SH29uCvGQhJqbdi7WaBGdEcgvErHWihQ
         Mp7oVXJKxNpRe7fBBnVQ0e0fQTJ0RAszfQUEu5mkDmat0nrg0Fh0UhEWowNqnAapZ7Tr
         Ln3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=jFMHPlwbbgRTvE/oKz34PjmvJtaXr8zcwtrHLEVUKYw=;
        b=Hjb6SSd/OkcgENEJquImLsx0J/xZccn3t4oZasvOJIQ2VuPX5KDu2hlbcHOgI0FJR5
         XYznQz8sgeKbKL5MP4bynqSyczkV2hgW0gby4VO3wtb728bQEovb+Jh86L7Ya3Qx11RU
         rQdA9mvMYPEBf8g3mYOi1HIqn4BQjaxkGYxWhoJ/ogydcxzvmNk8APJptQN1f1l+DQ57
         3+OpATFHte97JzHCp9wieSM60jy4evy0ItcN0dKlZhLXSkBzsVOiW8tmqbgVpSQ5To2d
         d14yurVS+6um3R83t65ds6ogmHyNmem64v2Rr3hqvTiC5F1kbIzeaJFdUnyyd0nGfKst
         DF4w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y3-20020a05620a44c300b006fda6cdf527si15443818qkp.236.2023.01.02.05.18.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Jan 2023 05:18:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pCKhJ-0000wI-Fz; Mon, 02 Jan 2023 08:18:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pCKgo-0000vp-Qw
 for qemu-arm@nongnu.org; Mon, 02 Jan 2023 08:17:18 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pCKgm-0001on-Lx
 for qemu-arm@nongnu.org; Mon, 02 Jan 2023 08:17:18 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.5])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 69CE015054F30;
 Mon,  2 Jan 2023 14:17:12 +0100 (CET)
Received: from kaod.org (37.59.142.109) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Mon, 2 Jan
 2023 14:17:11 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-109S003b0f1ed63-9e2e-41bc-b2ce-633e4cfe523c,
 EB6D15DD045C308F841A27F8E66F545441276E15) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <ad4e6873-1b5b-d8ea-d72f-acd38658fd45@kaod.org>
Date: Mon, 2 Jan 2023 14:17:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 08/11] hw/arm/aspeed_ast10x0: Map the secure SRAM
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
 <20221230113504.37032-9-philmd@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20221230113504.37032-9-philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.109]
X-ClientProxiedBy: DAG5EX1.mxp5.local (172.16.2.41) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 7463a9a5-1cef-4e69-866e-c869144973ab
X-Ovh-Tracer-Id: 15661267707281378180
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrjedvgdehudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepffdufeeliedujeeffffhjeffiefghffhhfdvkeeijeehledvueffhfejtdehgeegnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrddutdelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehphhhilhhmugeslhhinhgrrhhordhorhhgpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdhjohgvlhesjhhmshdrihgurdgruhdpthhrohihpghlvggvsegrshhpvggvughtvggthhdrtghomhdpsghlvggrlhesrhgvughhrghtrdgtohhmpdhpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrghdpfigrihhnvghrshhmsehrvgguhhgrthdrtghomhdprghnughrvgifsegrjhdrihgurdgruhdptghhihhnqdhtihhnghgpkhhuohesrghsphgvvgguthgvtghhrd
 gtohhmpdhpvghtvghrsehpjhgurdguvghvpdhsthgvvhgvnhgplhgvvgesrghsphgvvgguthgvtghhrdgtohhmpdhjrghmihhnpghlihhnsegrshhpvggvughtvggthhdrtghomhdpphguvghlsehfsgdrtghomhdpphguvghlsehmvghtrgdrtghomhdpqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrghdptghrohhsrgesrhgvughhrghtrdgtohhmpdfovfetjfhoshhtpehmohehvdelpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.142,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-TUID: 4eG7h9EL+Q/1

On 12/30/22 12:35, Philippe Mathieu-Daudé wrote:
> Some SRAM appears to be used by the Secure Boot unit and
> crypto accelerators. Name it 'secure sram'.
> 
> Note, the SRAM base address was already present but unused
> (the 'SBC' index is used for the MMIO peripheral).
> 
> Interestingly using CFLAGS=-Winitializer-overrides reports:
> 
>    ../hw/arm/aspeed_ast10x0.c:32:30: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
>      [ASPEED_DEV_SBC]       = 0x7E6F2000,
>                               ^~~~~~~~~~
>    ../hw/arm/aspeed_ast10x0.c:24:30: note: previous initialization is here
>      [ASPEED_DEV_SBC]       = 0x79000000,
>                               ^~~~~~~~~~
> This fixes with Zephyr:
> 
>    uart:~$ rsa test
>    rsa test vector[0]:
>    [00:00:26.156,000] <err> os: ***** BUS FAULT *****
>    [00:00:26.157,000] <err> os:   Precise data bus error
>    [00:00:26.157,000] <err> os:   BFAR Address: 0x79000000
>    [00:00:26.158,000] <err> os: r0/a1:  0x79000000  r1/a2:  0x00000000  r2/a3:  0x00001800
>    [00:00:26.158,000] <err> os: r3/a4:  0x79001800 r12/ip:  0x00000800 r14/lr:  0x0001098d
>    [00:00:26.158,000] <err> os:  xpsr:  0x81000000
>    [00:00:26.158,000] <err> os: Faulting instruction address (r15/pc): 0x0001e1bc
>    [00:00:26.158,000] <err> os: >>> ZEPHYR FATAL ERROR 0: CPU exception on CPU 0
>    [00:00:26.158,000] <err> os: Current thread: 0x38248 (shell_uart)
>    [00:00:26.165,000] <err> os: Halting system
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: Peter Delevoryas <peter@pjd.dev>
> ---
>   hw/arm/aspeed_ast10x0.c     | 11 ++++++++++-
>   include/hw/arm/aspeed_soc.h |  3 +++
>   2 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
> index 6c6d33d4a0..e74e2660ce 100644
> --- a/hw/arm/aspeed_ast10x0.c
> +++ b/hw/arm/aspeed_ast10x0.c
> @@ -22,7 +22,7 @@
>   
>   static const hwaddr aspeed_soc_ast1030_memmap[] = {
>       [ASPEED_DEV_SRAM]      = 0x00000000,
> -    [ASPEED_DEV_SBC]       = 0x79000000,
> +    [ASPEED_DEV_SECSRAM]   = 0x79000000,
>       [ASPEED_DEV_IOMEM]     = 0x7E600000,
>       [ASPEED_DEV_PWM]       = 0x7E610000,
>       [ASPEED_DEV_FMC]       = 0x7E620000,
> @@ -222,6 +222,14 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
>       memory_region_add_subregion(s->memory,
>                                   sc->memmap[ASPEED_DEV_SRAM],
>                                   &s->sram);
> +    memory_region_init_ram(&s->secsram, OBJECT(s), "sec.sram",
> +                           sc->secsram_size, &err);
> +    if (err != NULL) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +    memory_region_add_subregion(s->memory, sc->memmap[ASPEED_DEV_SECSRAM],
> +                                &s->secsram);
>   
>       /* SCU */
>       if (!sysbus_realize(SYS_BUS_DEVICE(&s->scu), errp)) {
> @@ -401,6 +409,7 @@ static void aspeed_soc_ast1030_class_init(ObjectClass *klass, void *data)
>       sc->cpu_type = ARM_CPU_TYPE_NAME("cortex-m4");
>       sc->silicon_rev = AST1030_A1_SILICON_REV;
>       sc->sram_size = 768 * KiB;
> +    sc->secsram_size = 9 * KiB;

256  * KiB

>       sc->spis_num = 2;
>       sc->ehcis_num = 0;
>       sc->wdts_num = 4;
> diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
> index 9a5e3c0bac..bd1e03e78a 100644
> --- a/include/hw/arm/aspeed_soc.h
> +++ b/include/hw/arm/aspeed_soc.h
> @@ -71,6 +71,7 @@ struct AspeedSoCState {
>       AspeedSMCState spi[ASPEED_SPIS_NUM];
>       EHCISysBusState ehci[ASPEED_EHCIS_NUM];
>       AspeedSBCState sbc;
> +    MemoryRegion secsram;
>       UnimplementedDeviceState sbc_unimplemented;
>       AspeedSDMCState sdmc;
>       AspeedWDTState wdt[ASPEED_WDTS_NUM];
> @@ -105,6 +106,7 @@ struct AspeedSoCClass {
>       const char *cpu_type;
>       uint32_t silicon_rev;
>       uint64_t sram_size;
> +    uint64_t secsram_size;
>       int spis_num;
>       int ehcis_num;
>       int wdts_num;
> @@ -143,6 +145,7 @@ enum {
>       ASPEED_DEV_SCU,
>       ASPEED_DEV_ADC,
>       ASPEED_DEV_SBC,
> +    ASPEED_DEV_SECSRAM,

May be keep the ASPEED_DEV_SBC_ prefix ?

Thanks,

C.

>       ASPEED_DEV_EMMC_BC,
>       ASPEED_DEV_VIDEO,
>       ASPEED_DEV_SRAM,

