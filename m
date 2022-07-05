Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3695537lft;
        Mon, 4 Jul 2022 22:46:59 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t2LTIyxyRkh8EB4TpeRPvvO/vJMH8jJkh3VPWZlaK5eW/MAmAozMJULe4OSKkdzrdOdyiq
X-Received: by 2002:a05:620a:142c:b0:6b2:4a02:8c1b with SMTP id k12-20020a05620a142c00b006b24a028c1bmr16742753qkj.429.1657000019050;
        Mon, 04 Jul 2022 22:46:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657000019; cv=none;
        d=google.com; s=arc-20160816;
        b=Gr3maoTRH24ENpc9EQ4s/rMDHmoXb5amm3w5DXgShlhm2vb4Es9ithHcNrE9fdnn+l
         dbYBRoePMU4KhhySXS6kaHmHhO72bDaskYbLfgFChoKqLU8xfT+vYavZYcbN6/X8dZrH
         ZwaSRQqKzhVS6PQS6RpeGKrOnNuVYaEzE/yw/4hV0sQfVUE8aXCd/6IZ5pLfthbM6DEQ
         Ci7U1AH4dBlQnsyWnB1ChJHPSB2EhF/8jpWC4HnTpPONqGMKRa8uNp3wZs6acO31Byh8
         kCRCnN4IZnrFyBaFiq116pHbyilYXwoEMvZIYRMSgWrLQ7kmLeE4LYBzbvcPRBEXn+0a
         rOsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=itLsBjST24WWNC5lNWsDqhT49iUyAOfpuQs//Diik98=;
        b=t6iQmWtmfVxqUlQMJoUvSryeNJx1QyeC1XEu8KJJuOg6nd0mzAVAohHPU5ymHVNFxt
         mnPsCyUNAVOv/4nolQ/hP9cAEYTZtf4vaswQxZlwtF2NFDaJb1sQdCLIzqwABfnz/pIO
         Zze5lIDbpxMNH0ZZpkFIFNvhzPsalYWQ9ni4Q++4grsBugwzDNNkeNAiToc/9tSuxFLE
         Q4WpKH75h6w9geO4mi+4Ur78Tc9+Smr3Xl7N6RjNbU0R+bzo+Snjz/XQxrOuP8L5o8TO
         GszOWyhBjnwlkWu196TDU6DbhXSW1pnChEKB46SOp8NAF8jV4N2d/NsAgTkKQe7hC3JH
         vAwA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 3-20020a0562140cc300b00472f651257bsi3905024qvx.56.2022.07.04.22.46.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Jul 2022 22:46:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o8bOk-00083B-GY
	for alex.bennee@linaro.org; Tue, 05 Jul 2022 01:46:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o8bOB-000825-2m
 for qemu-arm@nongnu.org; Tue, 05 Jul 2022 01:46:25 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:36275)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o8bO7-00059M-MT
 for qemu-arm@nongnu.org; Tue, 05 Jul 2022 01:46:22 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.158])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 7F31111460171;
 Tue,  5 Jul 2022 07:46:07 +0200 (CEST)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Tue, 5 Jul 2022
 07:46:06 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G005099a3d19-86e8-4f7f-ad03-666118d27cae,
 4FF77D4A254985FC0BE9A952312E42D6E34C6CC4) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <9501abaf-c6b5-824c-cba8-fd4c18679b28@kaod.org>
Date: Tue, 5 Jul 2022 07:46:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/8] hw/i2c/pca954x: Add method to get channels
Content-Language: en-US
To: Peter Delevoryas <peter@pjd.dev>
CC: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery
 <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>, Patrick Venture
 <venture@google.com>, <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
References: <20220704215457.38332-1-peter@pjd.dev>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220704215457.38332-1-peter@pjd.dev>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 409e0528-e789-412c-ae5a-74b150f37d2b
X-Ovh-Tracer-Id: 14996705287660014441
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudeitddgleekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejgefggffgheejgfdufeeiueffveehteejgfelueekgfegtefgffejhedtgfejgfenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpoffvtefjohhsthepmhhohedvle
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: i5rnM4vSeRwo

On 7/4/22 23:54, Peter Delevoryas wrote:
> I added this helper in the Aspeed machine file a while ago to help
> initialize fuji-bmc i2c devices. This moves it to the official pca954x
> file so that other files can use it.
> 
> This does something very similar to pca954x_i2c_get_bus, but I think
> this is useful when you have a very complicated dts with a lot of
> switches, like the fuji dts.
> 
> This convenience method lets you write code that produces a flat array
> of I2C buses that matches the naming in the dts. After that you can just
> add individual sensors using the flat array of I2C buses.
> 
> See fuji_bmc_i2c_init to understand this point further.
> 
> The fuji dts is here for reference:
> 
> https://github.com/torvalds/linux/blob/40cb6373b46/arch/arm/boot/dts/aspeed-bmc-facebook-fuji.dts
> 
> Signed-off-by: Peter Delevoryas <peter@pjd.dev>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
>   hw/arm/aspeed.c                  | 29 +++++++++--------------------
>   hw/i2c/i2c_mux_pca954x.c         | 10 ++++++++++
>   include/hw/i2c/i2c_mux_pca954x.h | 13 +++++++++++++
>   3 files changed, 32 insertions(+), 20 deletions(-)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 6fe9b13548..bee8a748ec 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -793,15 +793,6 @@ static void rainier_bmc_i2c_init(AspeedMachineState *bmc)
>       create_pca9552(soc, 15, 0x60);
>   }
>   
> -static void get_pca9548_channels(I2CBus *bus, uint8_t mux_addr,
> -                                 I2CBus **channels)
> -{
> -    I2CSlave *mux = i2c_slave_create_simple(bus, "pca9548", mux_addr);
> -    for (int i = 0; i < 8; i++) {
> -        channels[i] = pca954x_i2c_get_bus(mux, i);
> -    }
> -}
> -
>   #define TYPE_LM75 TYPE_TMP105
>   #define TYPE_TMP75 TYPE_TMP105
>   #define TYPE_TMP422 "tmp422"
> @@ -814,20 +805,18 @@ static void fuji_bmc_i2c_init(AspeedMachineState *bmc)
>       for (int i = 0; i < 16; i++) {
>           i2c[i] = aspeed_i2c_get_bus(&soc->i2c, i);
>       }
> -    I2CBus *i2c180 = i2c[2];
> -    I2CBus *i2c480 = i2c[8];
> -    I2CBus *i2c600 = i2c[11];
>   
> -    get_pca9548_channels(i2c180, 0x70, &i2c[16]);
> -    get_pca9548_channels(i2c480, 0x70, &i2c[24]);
> +    pca954x_i2c_get_channels(i2c[2], 0x70, "pca9548", &i2c[16]);
> +    pca954x_i2c_get_channels(i2c[8], 0x70, "pca9548", &i2c[24]);
>       /* NOTE: The device tree skips [32, 40) in the alias numbering */
> -    get_pca9548_channels(i2c600, 0x77, &i2c[40]);
> -    get_pca9548_channels(i2c[24], 0x71, &i2c[48]);
> -    get_pca9548_channels(i2c[25], 0x72, &i2c[56]);
> -    get_pca9548_channels(i2c[26], 0x76, &i2c[64]);
> -    get_pca9548_channels(i2c[27], 0x76, &i2c[72]);
> +    pca954x_i2c_get_channels(i2c[11], 0x77, "pca9548", &i2c[40]);
> +    pca954x_i2c_get_channels(i2c[24], 0x71, "pca9548", &i2c[48]);
> +    pca954x_i2c_get_channels(i2c[25], 0x72, "pca9548", &i2c[56]);
> +    pca954x_i2c_get_channels(i2c[26], 0x76, "pca9548", &i2c[64]);
> +    pca954x_i2c_get_channels(i2c[27], 0x76, "pca9548", &i2c[72]);
>       for (int i = 0; i < 8; i++) {
> -        get_pca9548_channels(i2c[40 + i], 0x76, &i2c[80 + i * 8]);
> +        pca954x_i2c_get_channels(i2c[40 + i], 0x76, "pca9548",
> +                                 &i2c[80 + i * 8]);
>       }
>   
>       i2c_slave_create_simple(i2c[17], TYPE_LM75, 0x4c);
> diff --git a/hw/i2c/i2c_mux_pca954x.c b/hw/i2c/i2c_mux_pca954x.c
> index 3945de795c..6b07804546 100644
> --- a/hw/i2c/i2c_mux_pca954x.c
> +++ b/hw/i2c/i2c_mux_pca954x.c
> @@ -169,6 +169,16 @@ I2CBus *pca954x_i2c_get_bus(I2CSlave *mux, uint8_t channel)
>       return pca954x->bus[channel];
>   }
>   
> +void pca954x_i2c_get_channels(I2CBus *bus, uint8_t address,
> +                              const char *type_name, I2CBus **channels)
> +{
> +    I2CSlave *mux = i2c_slave_create_simple(bus, type_name, address);
> +    Pca954xClass *pc = PCA954X_GET_CLASS(mux);
> +    Pca954xState *pca954x = PCA954X(mux);
> +
> +    memcpy(channels, pca954x->bus, pc->nchans * sizeof(channels[0]));
> +}
> +
>   static void pca9546_class_init(ObjectClass *klass, void *data)
>   {
>       Pca954xClass *s = PCA954X_CLASS(klass);
> diff --git a/include/hw/i2c/i2c_mux_pca954x.h b/include/hw/i2c/i2c_mux_pca954x.h
> index 3dd25ec983..3a676a30a9 100644
> --- a/include/hw/i2c/i2c_mux_pca954x.h
> +++ b/include/hw/i2c/i2c_mux_pca954x.h
> @@ -16,4 +16,17 @@
>    */
>   I2CBus *pca954x_i2c_get_bus(I2CSlave *mux, uint8_t channel);
>   
> +/**
> + * Creates an i2c mux and retrieves all of the channels associated with it.
> + *
> + * @bus: the i2c bus where the i2c mux resides.
> + * @address: the address of the i2c mux on the aforementioned i2c bus.
> + * @type_name: name of the i2c mux type to create.
> + * @channels: an output parameter specifying where to return the channels.
> + *
> + * Returns: None
> + */
> +void pca954x_i2c_get_channels(I2CBus *bus, uint8_t address,
> +                              const char *type_name, I2CBus **channels);
> +
>   #endif

