Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2501204lft;
        Mon, 27 Jun 2022 09:25:50 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uvnqG2Naf6gcWrg7rHXgm2EX9hiaqlJ1xgUvy/iMl+ySje3+xpLzDfOnwEIpGJpVE1xtZP
X-Received: by 2002:a05:620a:2409:b0:6a7:641:a9d7 with SMTP id d9-20020a05620a240900b006a70641a9d7mr8227691qkn.132.1656347150525;
        Mon, 27 Jun 2022 09:25:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656347150; cv=none;
        d=google.com; s=arc-20160816;
        b=vF/tbB9Wf12DaLXJ0XjuRPY2bdjIPqtZf5mjA0csO8IZRZkL61sz+l5R7s3/i/Vo4i
         g1egzqz+fIrMOxSUXdztDtOBiYVIrvITGjffCSYVlCSyNeTybsyufdq9ylNCpwaGnao/
         myEEV3q4vI8NT1DPHuZMZ6NwYP/HucUa2kWT/QCXc5nXdP7XZK35H/7FeT1FQwClbuqI
         RYTYEJ4fOxCPVSbYNFiAtVGDVIId3KFTCzKH2GU+aVSmpndLnb3o9cc0ISwimN2xEhlr
         rdA9lbVHCKNxwBLndtPhkqGakhMIw0ZUCmxSUGX12NLbtmgaL6s8sOVSacYcTpI9NtUZ
         Vdfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=uS05bCXHngTWejALE/MFNDyXmW2AEsQeXc6nvpKJ07k=;
        b=jIvDq5lRjwQRBz5kiPB5k5pTG0u9j2rzgTSzjsEu8JEev1vFXx1gy78OAkPrZ0boiO
         bbyfBvZJSHscPvhfQsRzHdMjho/0Sqjxmbn5K4WdRgOreBcvY7wnfXD/dpLmK1brSno7
         RmnlWiW2q2UwUUTRJLzky0vNRO1Gw8qUo7yE3ZV0xk7kDcRgb4YqGM8Vo0k2cBYfoXlK
         qb8Pgf4gTx6RkarqiQqZldX9E+G07JIyd6OHoWn8wsGvV/H7tSRxxwuxWSgwZObjXCQ9
         V2MWXKdi+xpK1u0YoYp1FfbWdBP9srl3aTcCCogniH22Zh9oC7fSqz0zJFw2zJ69Gjql
         B4pg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id br33-20020a05620a462100b0069fa3f77bb1si7777112qkb.673.2022.06.27.09.25.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jun 2022 09:25:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o5rYc-0000Aq-0c
	for alex.bennee@linaro.org; Mon, 27 Jun 2022 12:25:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o5rDG-0001T6-Kh
 for qemu-arm@nongnu.org; Mon, 27 Jun 2022 12:03:46 -0400
Received: from 4.mo552.mail-out.ovh.net ([178.33.43.201]:56957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o5rDE-0007ro-P1
 for qemu-arm@nongnu.org; Mon, 27 Jun 2022 12:03:46 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.52])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 36C9823F9A;
 Mon, 27 Jun 2022 16:03:43 +0000 (UTC)
Received: from kaod.org (37.59.142.106) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Mon, 27 Jun
 2022 18:03:42 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R006b0853ed2-4a81-460c-8733-cef02c753d73,
 659C98CE65B422D4D127A36693B7EAD6442F0B22) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <f1248260-b12c-e43f-906c-b4f5f38732d1@kaod.org>
Date: Mon, 27 Jun 2022 18:03:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 7/7] hw/arm/aspeed: firework: add I2C MUXes for VR
 channels
Content-Language: en-US
To: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>, Peter Maydell
 <peter.maydell@linaro.org>, Titus Rwantare <titusr@google.com>, Andrew
 Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>, Patrick Venture
 <venture@google.com>, Hao Wu <wuhaotsh@google.com>
CC: Graeme Gregory <quic_ggregory@quicinc.com>, Maheswara Kurapati
 <quic_mkurapat@quicinc.com>, <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
References: <20220627154703.148943-1-quic_jaehyoo@quicinc.com>
 <20220627154703.148943-8-quic_jaehyoo@quicinc.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220627154703.148943-8-quic_jaehyoo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 854aa9dd-adc6-46fc-b3e0-e0509d2955bf
X-Ovh-Tracer-Id: 15338978856427621365
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudeghedgleekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekteejtdelkeejvdevffduhfetteelieefgeefffeugffhfeekheffueefledujeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtieenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdfovfetjfhoshhtpehmohehhedv
Received-SPF: pass client-ip=178.33.43.201; envelope-from=clg@kaod.org;
 helo=4.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ser2s3X0sR5Y

On 6/27/22 17:47, Jae Hyun Yoo wrote:
> Add 2-level cascaded I2C MUXes for SOC VR channels into the Firework
> machine.
> 
> Signed-off-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>



Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
> Changes in v2:
> * None
> 
>   hw/arm/aspeed.c | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index cfc322ee30e9..1708a8f3408d 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -1002,13 +1002,21 @@ static void qcom_dc_scm_bmc_i2c_init(AspeedMachineState *bmc)
>   static void qcom_dc_scm_firework_i2c_init(AspeedMachineState *bmc)
>   {
>       AspeedSoCState *soc = &bmc->soc;
> -    I2CSlave *therm_mux;
> +    I2CSlave *therm_mux, *cpuvr_mux;
>   
>       /* Create the generic DC-SCM hardware */
>       qcom_dc_scm_bmc_i2c_init(bmc);
>   
>       /* Now create the Firework specific hardware */
>   
> +    /* I2C7 CPUVR MUX */
> +    cpuvr_mux = i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 7),
> +                                        "pca9546", 0x70);
> +    i2c_slave_create_simple(pca954x_i2c_get_bus(cpuvr_mux, 0), "pca9548", 0x72);
> +    i2c_slave_create_simple(pca954x_i2c_get_bus(cpuvr_mux, 1), "pca9548", 0x72);
> +    i2c_slave_create_simple(pca954x_i2c_get_bus(cpuvr_mux, 2), "pca9548", 0x72);
> +    i2c_slave_create_simple(pca954x_i2c_get_bus(cpuvr_mux, 3), "pca9548", 0x72);
> +
>       /* I2C8 Thermal Diodes*/
>       therm_mux = i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 8),
>                                           "pca9548", 0x70);

