Received: by 2002:ac9:4144:0:0:0:0:0 with SMTP id u4csp513874ocg;
        Fri, 7 Oct 2022 07:36:35 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5rjsxyQA3vvY7O5dCVdjk9rwJYX8KnFYvJkTRKVKheffS1IommQpldBsdd9LdaoNDdsl3u
X-Received: by 2002:a05:622a:304:b0:35d:4825:f812 with SMTP id q4-20020a05622a030400b0035d4825f812mr4456562qtw.467.1665153395113;
        Fri, 07 Oct 2022 07:36:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665153395; cv=none;
        d=google.com; s=arc-20160816;
        b=ggNJsAPwFG7+xwfV02L/OsRFL0aJt0MmHQ+J6yTHQXH+ke3nU9lylu1EKtB3amgNw4
         Jli6k+nyyeIK7W6YbG0fo7d9+/ljhy6V39TGC/LMENjWfDxsmGxOLvItzqqzV8/JtAH1
         PYl+P04VBZ+To2v1cKO1CTikvgwE4hYNU7so/scuCS4Pr4n/j/xMFjl035NPWaBhMaP8
         93Jo1EldNHR7O06qe4LlRGtUdNewyTVB1QPlX9qnbDJ3C5Xz3+D2uAfHR0WmpWAYUMUC
         jrY405jyRfVvBxHKG6WfayPVvCda6RL+HX3HEQnYLWGHQPzWR+USvjd+JohWCRGmP+vo
         +m6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=tmEa5HLsjmqv6X4y8o5tDNODJSGGyuldZ0KPzbVNBwE=;
        b=sqQLDW1MkvfxzXnAtz9IpjoeZE6sw6LgserK1pA8ZsoxsOiMWfzbkAdNEezKGTHhW6
         P7MdPYdQVI9iW4FQIN+qf8B32xbeg9nHeJW4M1z0/LqVjvdPe94p6LI7z6+ODivDmxB2
         g9u+hwXvjMZZp8fCHg/3qquFwXixcOfo/Kuno5GL0buhVt7KB3kJr0U6VcW75HfNUksn
         ADTyUHE263v020qr4KH171/kyqOiVOTQuAL+UeLWJXdUi/WzHJ41ZCOWy1eNZXVybx2x
         NAGoxqd2UwMTxdcQ5lOI2LhmDwaVpqq+lu7KaOIjW5G3joozedFI7X4zMnHDbVmSk8Sy
         Dr8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t11-20020a05622a180b00b0038fbcf8b10fsi190671qtc.745.2022.10.07.07.36.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Oct 2022 07:36:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:38818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ogoSn-0004rA-G0
	for alex.bennee@linaro.org; Fri, 07 Oct 2022 10:36:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1ognAr-0004yY-9l
 for qemu-arm@nongnu.org; Fri, 07 Oct 2022 09:13:57 -0400
Received: from 1.mo552.mail-out.ovh.net ([178.32.96.117]:46193)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1ognAm-0001nx-Ux
 for qemu-arm@nongnu.org; Fri, 07 Oct 2022 09:13:54 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.114])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id B992929A6A;
 Fri,  7 Oct 2022 13:13:48 +0000 (UTC)
Received: from kaod.org (37.59.142.101) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Fri, 7 Oct
 2022 15:13:48 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G0046e35eb97-5fe7-4fe7-a214-752ce9903440,
 72EF84A86A0CAB1F8CEB0FBBC9371DA6A893A50B) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.66.77.115
Message-ID: <97d016d5-802b-41db-0a6e-e1c03dc8dd67@kaod.org>
Date: Fri, 7 Oct 2022 15:13:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2] hw/arm/aspeed: increase Bletchley memory size
Content-Language: en-US
To: Patrick Williams <patrick@stwcx.xyz>
CC: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery
 <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>, "open list:ASPEED BMCs"
 <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
References: <20221006225232.3558794-1-patrick@stwcx.xyz>
 <20221007110529.3657749-1-patrick@stwcx.xyz>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20221007110529.3657749-1-patrick@stwcx.xyz>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 7c8190a8-6fbe-4d01-ae62-d275511db632
X-Ovh-Tracer-Id: 2741566275865447206
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -77
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeijedgiedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnegfrhhlucfvnfffucdlvdefmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkeetjedtleekjedvveffudfhteetleeifeegfeffuefghfefkeehffeufeeludejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpoffvtefjohhsthepmhhoheehvd
Received-SPF: pass client-ip=178.32.96.117; envelope-from=clg@kaod.org;
 helo=1.mo552.mail-out.ovh.net
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.699,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vuF4gIUMOKvw

On 10/7/22 13:05, Patrick Williams wrote:
> For the PVT-class hardware we have increased the memory size of
> this device to 2 GiB.  Adjust the device model accordingly.
> 
> Signed-off-by: Patrick Williams <patrick@stwcx.xyz>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
>   hw/arm/aspeed.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 7d2162c6ed..f8bc6d4a14 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -1330,6 +1330,13 @@ static void aspeed_machine_fuji_class_init(ObjectClass *oc, void *data)
>           aspeed_soc_num_cpus(amc->soc_name);
>   };
>   
> +/* On 32-bit hosts, lower RAM to 1G because of the 2047 MB limit */
> +#if HOST_LONG_BITS == 32
> +#define BLETCHLEY_BMC_RAM_SIZE (1 * GiB)
> +#else
> +#define BLETCHLEY_BMC_RAM_SIZE (2 * GiB)
> +#endif
> +
>   static void aspeed_machine_bletchley_class_init(ObjectClass *oc, void *data)
>   {
>       MachineClass *mc = MACHINE_CLASS(oc);
> @@ -1344,7 +1351,7 @@ static void aspeed_machine_bletchley_class_init(ObjectClass *oc, void *data)
>       amc->num_cs    = 2;
>       amc->macs_mask = ASPEED_MAC2_ON;
>       amc->i2c_init  = bletchley_bmc_i2c_init;
> -    mc->default_ram_size = 512 * MiB;
> +    mc->default_ram_size = BLETCHLEY_BMC_RAM_SIZE;
>       mc->default_cpus = mc->min_cpus = mc->max_cpus =
>           aspeed_soc_num_cpus(amc->soc_name);
>   }

