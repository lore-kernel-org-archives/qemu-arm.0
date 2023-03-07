Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp5974025ejc;
        Tue, 7 Mar 2023 05:54:17 -0800 (PST)
X-Google-Smtp-Source: AK7set8Kn+KNFEKlOfjwvpilQNW84z0SskgjxBbrJpgn1B6i+T+eJoqyUKlXZ6DQ6c6fD8RVVaQF
X-Received: by 2002:a05:622a:18e:b0:3bb:7603:d68e with SMTP id s14-20020a05622a018e00b003bb7603d68emr23684207qtw.10.1678197257729;
        Tue, 07 Mar 2023 05:54:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678197257; cv=none;
        d=google.com; s=arc-20160816;
        b=nZDiPReTFtAfj0Zd6Xxxgc/FJoG7B5wOGrww704VoxTfWDNVAaGQt+cmGnlpbG22/D
         idD9z0a4dV0MPJbV//yJ3ecWl47LO581WtMRjF7HSFs3jr1aKYZyVndbK8TDLF5DkKPj
         osG3w0mlXOFrJb7ctoc1/FFP45ICQqL4dmaFXvsc9FSoLtu04S7nR+uyxNjonXOfkuur
         ohBI+CNxTLS3GfZAtjPLtHGqEcg81n2+XJtpnNfNOJjzyWg4Ph1GcAGgd82wAKj+7vZm
         iG8aPC0PgwCHY1Usy2y9gAUxA3XP8rjf3bBaC6mQJ4LjRcHS3u4Wr/+FxxecfpyprIUO
         vIbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id;
        bh=/VaU1xtfJOQyP9TFDhgTJ29YWb7ODih7aHqph3SaKD4=;
        b=MQGMgPEfegBIKZ5/qvWF+5iOcVmUrtDBaWWro4FyIOPGXq+WKBG6t8bGlWmNAnwJCC
         sdEKU/e93Tu1dqbm+6Mh6mDm8AVH3MCSG3nyYW5uTMo29M8dvKSTN/YMgJD32NPdsLDV
         eNS60ngo3IVTnSWlygAl7KK5D/o3h2ze7m4rKLfS9289njB+1pu7tojcy1vf6XCciFhz
         kBiZYqGz9aK7IdCGri39BdD0ra/C4bkKqSZ9gOOPFSitowlPQ8vOTqi3LF2gnYNaVbsG
         GF2jSjOpk0bt2Va8Xve/+73s0HalU/DJC+HSv225LCpHxKorkFT2Dl+I2f2GbtVZl90b
         lyHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 10-20020ac8574a000000b003b0b9d2c5b4si9776313qtx.769.2023.03.07.05.54.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Mar 2023 05:54:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pZXlR-0000Hi-9G; Tue, 07 Mar 2023 08:54:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1pZXlP-0000HO-Ay; Tue, 07 Mar 2023 08:53:59 -0500
Received: from smtpout2.mo529.mail-out.ovh.net ([79.137.123.220])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1pZXlN-0008MK-OV; Tue, 07 Mar 2023 08:53:59 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.25])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 21AB121290;
 Tue,  7 Mar 2023 13:53:53 +0000 (UTC)
Received: from kaod.org (37.59.142.110) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Tue, 7 Mar
 2023 14:53:52 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-110S004e6b4e1a3-afde-4c3f-b8d5-ef80f374963d,
 D586700EEA543FC8D630564B717DAE7078976E4F) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <5221a4d8-9926-1331-c2b4-8c94702f9d1f@kaod.org>
Date: Tue, 7 Mar 2023 14:53:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v1] Added TMP421 type sensor's support in tiogapass
Content-Language: en-US
To: Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>,
 <peter.maydell@linaro.org>, <andrew@aj.id.au>, <joel@jms.id.au>,
 <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
References: <20230307103334.3586755-1-pkarthikeyan1509@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20230307103334.3586755-1-pkarthikeyan1509@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.110]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: e28f4059-9528-4181-b34d-52a61f00dee4
X-Ovh-Tracer-Id: 4751579084146182950
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrvddutddghedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepteeghedugeeiffekfedtlefftdejleefgeegteelgfdujeeggfefieevuedtffehnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrdduuddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehpkhgrrhhthhhikhgvhigrnhduhedtleesghhmrghilhdrtghomhdpphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgpdgrnhgurhgvfiesrghjrdhiugdrrghupdhjohgvlhesjhhmshdrihgurdgruhdpqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrghdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpoffvtefjohhsthepmhhohedvledpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout2.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
X-TUID: YnrD0+Smhmk8

On 3/7/23 11:33, Karthikeyan Pasupathi wrote:
> Added TMP421 type sensor support in tiogapass platform.
> 
> Tested: Tested and verified in tiogapass platform.
> 
> Signed-off-by: Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
>   hw/arm/aspeed.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 86601cb1a5..c1843693fa 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -542,6 +542,10 @@ static void tiogapass_bmc_i2c_init(AspeedMachineState *bmc)
>       at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 4), 0x54, 128 * KiB);
>       at24c_eeprom_init_rom(aspeed_i2c_get_bus(&soc->i2c, 6), 0x54, 128 * KiB,
>                             tiogapass_bmc_fruid, tiogapass_bmc_fruid_len);
> +    /* TMP421 */
> +    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 8), "tmp421", 0x1f);
> +    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 6), "tmp421", 0x4f);
> +    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 6), "tmp421", 0x4e);
>   }
>   
>   static void create_pca9552(AspeedSoCState *soc, int bus_id, int addr)

