Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1300985ejc;
        Mon, 16 Jan 2023 03:14:34 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtiBtvEMqBaPmkzish2SR7KTlQOaa2IiRrP21DWo+lM+nG7K/tFtHQgXQ6LEyuwl7UQBcWc
X-Received: by 2002:ac8:5481:0:b0:3a7:e2df:e868 with SMTP id h1-20020ac85481000000b003a7e2dfe868mr107576760qtq.41.1673867674092;
        Mon, 16 Jan 2023 03:14:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673867674; cv=none;
        d=google.com; s=arc-20160816;
        b=LaeB1K17eEUxN3ZK5urjGo5baryZzrP04yvSMKInPVs3irvBzJ2EgRXEaKDziLJKPg
         tzmNY/Wq9JKXvB/c+aU/m3IEDfBvFR6k4I7kIPzOEgCUrs7BKFHFHm9EyxeRrqQ4LXKq
         vpxJtetDYtJr0ixwa6+UZJIHFKLbvZBaL+P17bZ+Ktw1JRkM/foaNZ0rcTy4VTSW6jn5
         P6ZFhJbjw/+IW9mezLlwXeg6WNdR2bXBDXlyxtFSmy4M7Ac9HS7+FoY5l6cIBKByUTb4
         8DHJMXVuaqJy/vfl11wBAs7YSmaPo+33lELDfPY67NtAGMGKoRWH8PCLTjNx1TrI/DZ0
         JivQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=uHqxom8QpCmKAApLukb2kS1juw3uFZmpUlYv/oaA0I8=;
        b=GHrZAetgfx34fuc3p+PharxMgdS7WZQFPDlO0T4B/rYo3Wpi56o34Q+WVwdQfXtOjA
         HKz0RP/1XRD5EtGtoeiLm4iyKWYyPGPRsyIQWRBvlqZIatertWgrwl72gDhNIqvUaXn2
         yzACZDxekqBR/0LFIIeT98fAtPRGJgR9G7yzT4QaGXhso4Sa5mRAo8cetCT+jjn3htJB
         itjPxdptPXudJifUDXOazdrs7m3vgSiepQltnlR980o8afXrm5x8z5Ejd9h3+Lu/kTon
         fogwGZZSfuBv+vjSm9H5io1ABRYYWYUaiIjRFPKMymzoNsU6jxCdu+bSaK8cTNuKLcKU
         mLNA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bn11-20020a05622a1dcb00b003ab93dd883fsi16863708qtb.243.2023.01.16.03.14.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Jan 2023 03:14:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pHNRS-0004hH-Ut; Mon, 16 Jan 2023 06:14:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pHNRQ-0004gH-Uw
 for qemu-arm@nongnu.org; Mon, 16 Jan 2023 06:14:16 -0500
Received: from 9.mo548.mail-out.ovh.net ([46.105.48.137])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pHNRO-0005Tl-25
 for qemu-arm@nongnu.org; Mon, 16 Jan 2023 06:14:16 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.233])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 63FA121E88;
 Mon, 16 Jan 2023 11:14:02 +0000 (UTC)
Received: from kaod.org (37.59.142.98) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Mon, 16 Jan
 2023 12:14:01 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R002253ca706-ccc4-42e1-a0eb-c3f4fd7c1d23,
 9562F276D9C9043C19838F7BDA7B87DE9C964FD3) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <8ff7fec7-125e-11f1-5479-7489ecc03330@kaod.org>
Date: Mon, 16 Jan 2023 12:13:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 2/6] hw/arm/aspeed: Remove local copy of at24c_eeprom_init
Content-Language: en-US
To: Peter Delevoryas <peter@pjd.dev>
CC: <patrick@stwcx.xyz>, <peter.maydell@linaro.org>, <andrew@aj.id.au>,
 <joel@jms.id.au>, <hskinnemoen@google.com>, <kfting@nuvoton.com>,
 <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
References: <20230114170151.87833-1-peter@pjd.dev>
 <20230114170151.87833-3-peter@pjd.dev>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20230114170151.87833-3-peter@pjd.dev>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 9a3f3ae1-8a3f-4555-9fc3-4669399f2ffe
X-Ovh-Tracer-Id: 3565162059284777775
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedruddtgedgvdegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeffudefleeiudejfeffhfejffeigffhhffhvdekieejheelvdeufffhjedtheeggeenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddrleeknecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehpvghtvghrsehpjhgurdguvghvpdhprghtrhhitghksehsthiftgigrdighiiipdhpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrghdprghnughrvgifsegrjhdrihgurdgruhdpjhhovghlsehjmhhsrdhiugdrrghupdhhshhkihhnnhgvmhhovghnsehgohhoghhlvgdrtghomhdpkhhfthhinhhgsehnuhhvohhtohhnrdgtohhmpdhqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdfovfetjfhoshhtpehmoh
 ehgeekpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=46.105.48.137; envelope-from=clg@kaod.org;
 helo=9.mo548.mail-out.ovh.net
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
X-TUID: vu6x1NiX5LhJ

On 1/14/23 18:01, Peter Delevoryas wrote:
> Signed-off-by: Peter Delevoryas <peter@pjd.dev>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>   hw/arm/aspeed.c | 10 +---------
>   1 file changed, 1 insertion(+), 9 deletions(-)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 55f114ef729f..1f9799d4321e 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -17,6 +17,7 @@
>   #include "hw/i2c/i2c_mux_pca954x.h"
>   #include "hw/i2c/smbus_eeprom.h"
>   #include "hw/misc/pca9552.h"
> +#include "hw/nvram/eeprom_at24c.h"
>   #include "hw/sensor/tmp105.h"
>   #include "hw/misc/led.h"
>   #include "hw/qdev-properties.h"
> @@ -429,15 +430,6 @@ static void aspeed_machine_init(MachineState *machine)
>       arm_load_kernel(ARM_CPU(first_cpu), machine, &aspeed_board_binfo);
>   }
>   
> -static void at24c_eeprom_init(I2CBus *bus, uint8_t addr, uint32_t rsize)
> -{
> -    I2CSlave *i2c_dev = i2c_slave_new("at24c-eeprom", addr);
> -    DeviceState *dev = DEVICE(i2c_dev);
> -
> -    qdev_prop_set_uint32(dev, "rom-size", rsize);
> -    i2c_slave_realize_and_unref(i2c_dev, bus, &error_abort);
> -}
> -
>   static void palmetto_bmc_i2c_init(AspeedMachineState *bmc)
>   {
>       AspeedSoCState *soc = &bmc->soc;

