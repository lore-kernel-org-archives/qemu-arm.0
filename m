Received: by 2002:a05:6214:acc:0:0:0:0 with SMTP id g12csp2068252qvi;
        Fri, 23 Jul 2021 00:53:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxzQrLcSjkvekB/gTxWNpS1byk6kW/UPl8L8MFh0AtvLTBJBZCFQxhoslcffpgxZhHzu9b4
X-Received: by 2002:a25:aa11:: with SMTP id s17mr4563989ybi.145.1627026813799;
        Fri, 23 Jul 2021 00:53:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627026813; cv=none;
        d=google.com; s=arc-20160816;
        b=XsUTlkh3YrDA/am6yQlMnc565Buw1ZNs/B0DBL53Lfh7kHY29w7NORIrOYrwwzQlX8
         dhmlEqFlg7gxym2x21Y8CfiyF8/24r16QXPYB3Q2sawtPxkjVU7utfJl/oLAAFcb8Ldt
         TSQym6E04/o1LmfxP9bgrULdug0kX9yxHNxuMITmM3Ni1hYpHuv/UWVGSuNGn9nvsehU
         8g8NUiVV5+QrojJ2hMnxxm0RIP6Eli+ue3FXhZnB3/7KPRdTA+O4B27Jr36rk6SrzrPQ
         LOX5yqhEZ21oJs6rx4Xp8lmID+QahwJUxYAW1+NApiUy7ymD6JfHol9tROpZZeGpvGLn
         aCsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=t8q3vRjJWXwYDc71VSJTouXEKwkiOY4eO2Z70LG1r4Y=;
        b=0/k/z5LC44wwSPUtKd/NJcDnA/bIMMgPrs0ht0znfuD+cgDY/tYYEjpoMeup4K8zE/
         eooQDVfid8tLS2KPSTru33XdLCvwCNSu38Sz4ybOoEG+finnat7UF3ersaH9v8iCiV2b
         gLtM0SYbX1Ecme04B4JK7CE3JKIcMVCmm+sBC7lOEaUmHfi/gR2U3jaeKbgzpFxxPfum
         cKJTx0lQ1VWn3IwpTu7qlLbOSlYY5KfybvRH0TC3AHhfVYtPwuAcK1N2ZODZml1/0sP9
         k/XdOcMK2vDtEdsXJccTVP0PVSlQ/UudjpUYXmsh0Yn/c61kpYsx9cvhbXDvLKtLeHLl
         GgiA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x15si32241780ybs.105.2021.07.23.00.53.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Jul 2021 00:53:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m6pzx-0000tY-9X
	for alex.bennee@linaro.org; Fri, 23 Jul 2021 03:53:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1m6pzl-0000rs-H4
 for qemu-arm@nongnu.org; Fri, 23 Jul 2021 03:53:21 -0400
Received: from 2.mo52.mail-out.ovh.net ([178.33.105.233]:57150)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1m6pzh-0003hn-VN
 for qemu-arm@nongnu.org; Fri, 23 Jul 2021 03:53:21 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.102])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 12E2328C6C2;
 Fri, 23 Jul 2021 09:53:05 +0200 (CEST)
Received: from kaod.org (37.59.142.106) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Fri, 23 Jul
 2021 09:53:05 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R006c29741a4-1e0a-43c9-9ff8-06f7504ebb55,
 CCFD3B4E31AF20DD7D8BEE14B896D6F8BB7C2A05) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.89.73.13
Subject: Re: [PATCH] misc/pca9552: Fix LED status register indexing in
 pca955x_get_led()
To: Andrew Jeffery <andrew@aj.id.au>
References: <20210723043624.348158-1-andrew@aj.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <b7ab107a-1dd2-bc77-c1e7-7cea625cdb95@kaod.org>
Date: Fri, 23 Jul 2021 09:53:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210723043624.348158-1-andrew@aj.id.au>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 8b652633-3b89-4d64-992c-c23b9be89062
X-Ovh-Tracer-Id: 8458041576511474595
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrfeejgdduvddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeekudeuudevleegudeugeekleffveeludejteffiedvledvgfekueefudehheefnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegrnhgurhgvfiesrghjrdhiugdrrghu
Received-SPF: pass client-ip=178.33.105.233; envelope-from=clg@kaod.org;
 helo=2.mo52.mail-out.ovh.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.203,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, joel@jms.id.au,
 qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uY3P+T7GSGkL

On 7/23/21 6:36 AM, Andrew Jeffery wrote:
> There was a bit of a thinko in the state calculation where every odd pin
> in was reported in e.g. "pwm0" mode rather than "off". This was the
> result of an incorrect bit shift for the 2-bit field representing each
> LED state.
> 
> Fixes: a90d8f84674d ("misc/pca9552: Add qom set and get")
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

I don't think we need this fix for 6.1 since it has been there since 
January 2020. Tell me otherwise.

Thanks,

C.

> ---
>  hw/misc/pca9552.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/misc/pca9552.c b/hw/misc/pca9552.c
> index b7686e27d7fa..fff19e369a39 100644
> --- a/hw/misc/pca9552.c
> +++ b/hw/misc/pca9552.c
> @@ -272,7 +272,7 @@ static void pca955x_get_led(Object *obj, Visitor *v, const char *name,
>       * reading the INPUTx reg
>       */
>      reg = PCA9552_LS0 + led / 4;
> -    state = (pca955x_read(s, reg) >> (led % 8)) & 0x3;
> +    state = (pca955x_read(s, reg) >> ((led % 4) * 2)) & 0x3;
>      visit_type_str(v, name, (char **)&led_state[state], errp);
>  }
>  
> 

