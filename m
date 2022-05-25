Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp952916lfh;
        Wed, 25 May 2022 07:20:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx3QFprV+Jk5XlCpbHhzxeK0s1iHIeNtiZPQXdYhqa+qv1FWApy/36XXDa/bs+Dc2no7H/8
X-Received: by 2002:ad4:5b8d:0:b0:462:2a8e:9b6 with SMTP id 13-20020ad45b8d000000b004622a8e09b6mr15486677qvp.75.1653488403704;
        Wed, 25 May 2022 07:20:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653488403; cv=none;
        d=google.com; s=arc-20160816;
        b=oGIiJgmZJHLXSDeNmUzSiCQiYIETKPua0d/wljkaHqaF/sIHpfPiTZY5MdnAqsQQB+
         Ls2UdJd4W/muU/kkUlNCoTQ9JGi29/KCN6Wa852IaN9bS3v5ANIfUEqwHFm1IWiWGL8p
         2Ne4IDr2d0lU7JMU4wIiks1/qTnxmeMjLPVbhcoy6gykkjSr7CL0ibyIBdEdd+R8BL0c
         o23kqnirIQY1lpdfOW64AIskUt+5Rcryum5rRAp7dmjnkMRil/mJ1ri1cGvElDu8fz4e
         Tz8CbaUHmLrmphXBnSD0oaPOFt5GlnhdmwMSnnBL6oVYBgU67PJ1xT62HKcsXfcFwKDA
         aZ1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=POYOnxN0niCCaNrSahngugeVkxcVh5rQRmn5mKEQVgc=;
        b=J1pJXcOJUJN1zi8dzp6dACyAseNWOBMlHDaB6UpV9DvTriE+KoELs9DVslWkdOfCKP
         zM4Y4plb3GxNZcM3m1djvZcRw96lm0yUGs7XDn+7Lw+seKhHktyXzaUc/RmbQGh6FoeG
         PcAbKelI8i/LpS6ViXsvhoVt6s5PP/CTlDZBagS5++Shf651KwL3mQOfSMmh/l1qJ9x6
         gGbvnpl8N40Sw2DXMp+rc3cUC16pkXtWbZnADAYNoiCdVWP6LJvKK2a1Wesk7+ZJCckX
         NZg12juULYA5uClaI85+/+97NZGY6ry/UU5pXhdqlZ4jbSk6/YlIdqNG+GNraDS7DBsP
         BVNA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q12-20020a05621419ec00b00461df8399ecsi1511487qvc.532.2022.05.25.07.20.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 May 2022 07:20:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ntrrn-0005LQ-32
	for alex.bennee@linaro.org; Wed, 25 May 2022 10:20:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1ntrr9-0005J1-54
 for qemu-arm@nongnu.org; Wed, 25 May 2022 10:19:23 -0400
Received: from 2.mo548.mail-out.ovh.net ([178.33.255.19]:56097)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1ntrr7-0001HF-2T
 for qemu-arm@nongnu.org; Wed, 25 May 2022 10:19:22 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.102])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 6358120E96;
 Wed, 25 May 2022 14:19:17 +0000 (UTC)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Wed, 25 May
 2022 16:19:15 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G001a83b4016-6d22-4fcd-990d-c5d7d53a019d,
 D6A97ED6E11FF164423AFC60B0B43C9491D8EECB) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <5d57d89f-05c5-d248-4fae-ff6d484bdb8c@kaod.org>
Date: Wed, 25 May 2022 16:19:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] hw/arm/aspeed: Add i2c devices for AST2600 EVB
Content-Language: en-US
To: Howard Chiu <howard_chiu@aspeedtech.com>, "peter.maydell@linaro.org"
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: Troy Lee <troy_lee@aspeedtech.com>, Steven Lee
 <steven_lee@aspeedtech.com>, Jamin Lin <jamin_lin@aspeedtech.com>
References: <SG2PR06MB2315A0711B0DC6903A0291BAE6D69@SG2PR06MB2315.apcprd06.prod.outlook.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <SG2PR06MB2315A0711B0DC6903A0291BAE6D69@SG2PR06MB2315.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG2EX2.mxp5.local (172.16.2.12) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: c4e98ebc-24a3-4cad-82ff-65565c9c4a78
X-Ovh-Tracer-Id: 4243798224019295023
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrjeehgdejgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkeetjedtleekjedvveffudfhteetleeifeegfeffuefghfefkeehffeufeeludejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehjrghmihhnpghlihhnsegrshhpvggvughtvggthhdrtghomh
Received-SPF: pass client-ip=178.33.255.19; envelope-from=clg@kaod.org;
 helo=2.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: Pk0XJWkZpZ5k

On 5/25/22 12:00, Howard Chiu wrote:
> Add EEPROM and LM75 temperature sensor according to hardware schematic
> 
> Signed-off-by: Howard Chiu <howard_chiu@aspeedtech.com>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
>   hw/arm/aspeed.c | 11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index a74c13ab0f..df74d3e955 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -526,8 +526,15 @@ static void ast2500_evb_i2c_init(AspeedMachineState *bmc)
>   
>   static void ast2600_evb_i2c_init(AspeedMachineState *bmc)
>   {
> -    /* Start with some devices on our I2C busses */
> -    ast2500_evb_i2c_init(bmc);
> +    AspeedSoCState *soc = &bmc->soc;
> +    uint8_t *eeprom_buf = g_malloc0(8 * 1024);
> +
> +    smbus_eeprom_init_one(aspeed_i2c_get_bus(&soc->i2c, 7), 0x50,
> +                          eeprom_buf);
> +
> +    /* LM75 is compatible with TMP105 driver */
> +    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 8),
> +                     TYPE_TMP105, 0x4d);
>   }
>   
>   static void romulus_bmc_i2c_init(AspeedMachineState *bmc)

