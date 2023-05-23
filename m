Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp1653741ejb;
        Mon, 22 May 2023 22:53:55 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4TgCB0Y4FuPNJgpmfrx3iszyXLG47gAktY3MKyZLdWp2KcSdsF8JFVOua8td8aCF1cepvD
X-Received: by 2002:ac8:5a8f:0:b0:3f6:b1a4:5914 with SMTP id c15-20020ac85a8f000000b003f6b1a45914mr6755961qtc.37.1684821235530;
        Mon, 22 May 2023 22:53:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684821235; cv=none;
        d=google.com; s=arc-20160816;
        b=cjxYX08JXJM+7xrcxz7b7mQXpXdIXOD3U1xGav3M7+jHEh+9fKtTKXrgNc2hye2UlU
         5qMML73v2Ytnz72pcQ4KJYldY8PGet51+uPno1ifT60WL/0POuQQ69mZokLQ/bPPUVky
         Bv3hfklar4oBj7hF2Rrv4AwZEQW1P0ypQX+O9NtmnZmS89wIfJj+6TAl/SBdeSyhmpuQ
         0upAN2+Kg//iWdNL7NOOzIlkj/oGUmW5jnSge6R5XMqMHl3IHFyBciKX0aWkJXwsT5k2
         ilipWhUWutUpwYbqedLEBs5ixJ5zQuLEJL4gw6wMB5xJY93JWBohKwvbv/7n2SOQliXX
         yF7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=eVPrPNi7G8S6YWZpWgjMq/U/stT8d/OQBXXt43uu/AY=;
        b=LMiJaSJky+wTsKKKobp0TB42GD/QG8FaDp7ADAVd3ZcvUNiSAlzhDlm1g89omT8WtO
         Q+tJgCSp1157yn3/LmTRR29EVsl5qUtOvGj8AygNwefn7+T8SKXUUi1D96f7zZMuFA+F
         Ovn10nmrCHfgUAnwlTuYnYiBijd0XjEtI5rl3GI6S+zZzR7vI40nF61hSMyVnZSCQE9k
         hmbaEr6ZR33z6TIGE4W4fMuCQsRFUwbNfG5PKC09WWT29dVJLO6HaxLUn8WHMNgTNWC4
         2hXCxKC+a+8vde0fs5OOVb6ShBbCuDb6jzkxygsmvlZ3kzKcxbl8Ms+8MWMO0A8Xh4fK
         KovQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i9-20020ac85c09000000b003f36c78b040si4725014qti.397.2023.05.22.22.53.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 May 2023 22:53:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q1KxX-0004qX-1e; Tue, 23 May 2023 01:53:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1q1KxU-0004q7-Lo
 for qemu-arm@nongnu.org; Tue, 23 May 2023 01:53:21 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1q1KxR-0000EV-Fg
 for qemu-arm@nongnu.org; Tue, 23 May 2023 01:53:20 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.108])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 4C597220E1;
 Tue, 23 May 2023 05:53:13 +0000 (UTC)
Received: from kaod.org (37.59.142.103) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Tue, 23 May
 2023 07:53:12 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G0057ab6da47-8385-4730-83d3-a1aa93b365ef,
 3FF756ED2DFBFFA1C653908339DD7057409F5F10) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <52f72e7d-fe49-a3b9-271c-b508fa2c5a87@kaod.org>
Date: Tue, 23 May 2023 07:53:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 1/1] Add vpd data for Rainier machine
Content-Language: en-US
To: Ninad Palsule <ninad@linux.ibm.com>, <qemu-devel@nongnu.org>,
 <peter.maydell@linaro.org>, <andrew@aj.id.au>, <joe@jms.id.au>
CC: <qemu-arm@nongnu.org>
References: <20230522153659.3379729-1-ninad@linux.ibm.com>
 <20230522153659.3379729-2-ninad@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20230522153659.3379729-2-ninad@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 268b3bd6-e03b-45fa-b4de-09ed412feb95
X-Ovh-Tracer-Id: 6109414370495859494
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrfeejvddguddtvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepffdufeeliedujeeffffhjeffiefghffhhfdvkeeijeehledvueffhfejtdehgeegnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrddutdefpdekvddrieegrddvhedtrddujedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehnihhnrggusehlihhnuhigrdhisghmrdgtohhmpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdhpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrghdprghnughrvgifsegrjhdrihgurdgruhdpjhhovgesjhhmshdrihgurdgruhdpqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrghdpoffvtefjohhsthepmhhohedvledpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.091,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: GWlwFjYfUnx8

On 5/22/23 17:36, Ninad Palsule wrote:
> The VPD data is added for system and BMC FRU. This data is fabricated.
> 
> Tested:
>     - The system-vpd.service is active.
>     - VPD service related to bmc is active.
> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
>   hw/arm/aspeed.c        |  6 ++++--
>   hw/arm/aspeed_eeprom.c | 45 +++++++++++++++++++++++++++++++++++++++++-
>   hw/arm/aspeed_eeprom.h |  5 +++++
>   3 files changed, 53 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 0b29028fe1..bfc2070bd2 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -788,8 +788,10 @@ static void rainier_bmc_i2c_init(AspeedMachineState *bmc)
>                        0x48);
>       i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 8), TYPE_TMP105,
>                        0x4a);
> -    at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 8), 0x50, 64 * KiB);
> -    at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 8), 0x51, 64 * KiB);
> +    at24c_eeprom_init_rom(aspeed_i2c_get_bus(&soc->i2c, 8), 0x50,
> +                          64 * KiB, rainier_bb_fruid, rainier_bb_fruid_len);
> +    at24c_eeprom_init_rom(aspeed_i2c_get_bus(&soc->i2c, 8), 0x51,
> +                          64 * KiB, rainier_bmc_fruid, rainier_bmc_fruid_len);
>       create_pca9552(soc, 8, 0x60);
>       create_pca9552(soc, 8, 0x61);
>       /* Bus 8: ucd90320@11 */
> diff --git a/hw/arm/aspeed_eeprom.c b/hw/arm/aspeed_eeprom.c
> index dc33a88a54..ace5266cec 100644
> --- a/hw/arm/aspeed_eeprom.c
> +++ b/hw/arm/aspeed_eeprom.c
> @@ -119,9 +119,52 @@ const uint8_t yosemitev2_bmc_fruid[] = {
>       0x6e, 0x66, 0x69, 0x67, 0x20, 0x41, 0xc1, 0x45,
>   };
>   
> +const uint8_t rainier_bb_fruid[] = {
> +    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x84,
> +    0x28, 0x00, 0x52, 0x54, 0x04, 0x56, 0x48, 0x44, 0x52, 0x56, 0x44, 0x02,
> +    0x01, 0x00, 0x50, 0x54, 0x0e, 0x56, 0x54, 0x4f, 0x43, 0x00, 0x00, 0x37,
> +    0x00, 0x4a, 0x00, 0x00, 0x00, 0x00, 0x00, 0x50, 0x46, 0x08, 0x00, 0x00,
> +    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46, 0x00, 0x52, 0x54,
> +    0x04, 0x56, 0x54, 0x4f, 0x43, 0x50, 0x54, 0x38, 0x56, 0x49, 0x4e, 0x49,
> +    0x00, 0x00, 0x81, 0x00, 0x3a, 0x00, 0x00, 0x00, 0x00, 0x00, 0x56, 0x53,
> +    0x59, 0x53, 0x00, 0x00, 0xbb, 0x00, 0x27, 0x00, 0x00, 0x00, 0x00, 0x00,
> +    0x56, 0x43, 0x45, 0x4e, 0x00, 0x00, 0xe2, 0x00, 0x27, 0x00, 0x00, 0x00,
> +    0x00, 0x00, 0x56, 0x53, 0x42, 0x50, 0x00, 0x00, 0x09, 0x01, 0x19, 0x00,
> +    0x00, 0x00, 0x00, 0x00, 0x50, 0x46, 0x01, 0x00, 0x00, 0x00, 0x36, 0x00,
> +    0x52, 0x54, 0x04, 0x56, 0x49, 0x4e, 0x49, 0x44, 0x52, 0x04, 0x44, 0x45,
> +    0x53, 0x43, 0x48, 0x57, 0x02, 0x30, 0x31, 0x43, 0x43, 0x04, 0x33, 0x34,
> +    0x35, 0x36, 0x46, 0x4e, 0x04, 0x46, 0x52, 0x34, 0x39, 0x53, 0x4e, 0x04,
> +    0x53, 0x52, 0x31, 0x32, 0x50, 0x4e, 0x04, 0x50, 0x52, 0x39, 0x39, 0x50,
> +    0x46, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x23, 0x00, 0x52, 0x54,
> +    0x04, 0x56, 0x53, 0x59, 0x53, 0x53, 0x45, 0x07, 0x49, 0x42, 0x4d, 0x53,
> +    0x59, 0x53, 0x31, 0x54, 0x4d, 0x08, 0x32, 0x32, 0x32, 0x32, 0x2d, 0x32,
> +    0x32, 0x32, 0x50, 0x46, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x23,
> +    0x00, 0x52, 0x54, 0x04, 0x56, 0x43, 0x45, 0x4e, 0x53, 0x45, 0x07, 0x31,
> +    0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x46, 0x43, 0x08, 0x31, 0x31, 0x31,
> +    0x31, 0x2d, 0x31, 0x31, 0x31, 0x50, 0x46, 0x04, 0x00, 0x00, 0x00, 0x00,
> +    0x00, 0x00, 0x15, 0x00, 0x52, 0x54, 0x04, 0x56, 0x53, 0x42, 0x50, 0x49,
> +    0x4d, 0x04, 0x50, 0x00, 0x10, 0x01, 0x50, 0x46, 0x04, 0x00, 0x00, 0x00,
> +    0x00, 0x00,
> +};
> +
> +/* Rainier BMC FRU */
> +const uint8_t rainier_bmc_fruid[] = {
> +    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x84,
> +    0x28, 0x00, 0x52, 0x54, 0x04, 0x56, 0x48, 0x44, 0x52, 0x56, 0x44, 0x02,
> +    0x01, 0x00, 0x50, 0x54, 0x0e, 0x56, 0x54, 0x4f, 0x43, 0x00, 0x00, 0x37,
> +    0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x50, 0x46, 0x08, 0x00, 0x00,
> +    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1c, 0x00, 0x52, 0x54,
> +    0x04, 0x56, 0x54, 0x4f, 0x43, 0x50, 0x54, 0x0e, 0x56, 0x49, 0x4e, 0x49,
> +    0x00, 0x00, 0x57, 0x00, 0x1e, 0x00, 0x00, 0x00, 0x00, 0x00, 0x50, 0x46,
> +    0x01, 0x00, 0x00, 0x00, 0x1a, 0x00, 0x52, 0x54, 0x04, 0x56, 0x49, 0x4e,
> +    0x49, 0x44, 0x52, 0x04, 0x44, 0x45, 0x53, 0x43, 0x48, 0x57, 0x02, 0x30,
> +    0x31, 0x50, 0x46, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00,
> +};
> +
>   const size_t tiogapass_bmc_fruid_len = sizeof(tiogapass_bmc_fruid);
>   const size_t fby35_nic_fruid_len = sizeof(fby35_nic_fruid);
>   const size_t fby35_bb_fruid_len = sizeof(fby35_bb_fruid);
>   const size_t fby35_bmc_fruid_len = sizeof(fby35_bmc_fruid);
> -
>   const size_t yosemitev2_bmc_fruid_len = sizeof(yosemitev2_bmc_fruid);
> +const size_t rainier_bb_fruid_len = sizeof(rainier_bb_fruid);
> +const size_t rainier_bmc_fruid_len = sizeof(rainier_bmc_fruid);
> diff --git a/hw/arm/aspeed_eeprom.h b/hw/arm/aspeed_eeprom.h
> index 86db6f0479..bbf9e54365 100644
> --- a/hw/arm/aspeed_eeprom.h
> +++ b/hw/arm/aspeed_eeprom.h
> @@ -22,4 +22,9 @@ extern const size_t fby35_bmc_fruid_len;
>   extern const uint8_t yosemitev2_bmc_fruid[];
>   extern const size_t yosemitev2_bmc_fruid_len;
>   
> +extern const uint8_t rainier_bb_fruid[];
> +extern const size_t rainier_bb_fruid_len;
> +extern const uint8_t rainier_bmc_fruid[];
> +extern const size_t rainier_bmc_fruid_len;
> +
>   #endif

