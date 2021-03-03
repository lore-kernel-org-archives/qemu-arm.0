Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp5266807lfg;
        Wed, 3 Mar 2021 03:19:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwtBXt/VC0bVn/O4XVRRgYThPUL3XP9V0KBMV0+h9Lj2uwnCDSIMYqcQWMM3/lFyn1tRdoR
X-Received: by 2002:a5d:9386:: with SMTP id c6mr20775533iol.203.1614770382674;
        Wed, 03 Mar 2021 03:19:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614770382; cv=none;
        d=google.com; s=arc-20160816;
        b=IBHpeciLl81t8d1G1nvjW4Vcvvme8iJNwdr+oJ/jW4GOUswEUxk4UTtxZoLUJCE3y6
         dpm6Uju7Dt4Qhc2VYFMcpEEgLRAfnmnEx/Kw2A4YIGE2E7XVg3RHjO3j7e5NInDvG0h4
         52RIQkPbiogggsizWGliNTiXcXVHPc8d98G3lyHtEJ+YeoImdVQOu2EXK6sv3EVsVhOP
         fVQ4AqL89pN9YAm2TfGHWuybG6bRmKeMZwnJcUu0/R4BTsq6hpZ6+ZQQXhYv3ZOknx6W
         rfzk+kziOU34aDVU+bnjArUxQZ9zMSXWu+LyswMpZavmMnJ304dKje+t64IM/2bJE2hE
         HcMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=YMVzyyRH6aM6sWw9ndxTM3t8XrWYtoKdyiujxlvKy84=;
        b=gryGKMUdK8hHXj1cb2CG1tlMiEQdEcAqqXgqSq8ZTK7isvJLDq4EqdtyCv/PaO0xXT
         iTnGWCcW+RsNW9aBgm+C/4+mI2U6jsaiIXJBC/7VPzo6r9W7K8wsAOT/quUeHyeJ/Prw
         q3ereKj1kioUv6BiyRiUft4urMoAdOcF953QBZbqCqHAv6gkYwKsB8I41i0Bqx5PWCN5
         s29zYPHVU9FYOvGZDCUo/TO3cvwZUVlQ4Xy6BFwb0OvOylwFVY3fbq4xtlpbwIPJoKvh
         CWCldl7aSwMDPvZldiFmyFUVer5uiV7ttFec5s8x369g4DSV/V1kU7vPi9GoTsMxMr5n
         aCYg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c11si1944527ioi.68.2021.03.03.03.19.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Mar 2021 03:19:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lHPXZ-00078Y-VJ
	for alex.bennee@linaro.org; Wed, 03 Mar 2021 06:19:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lHPXR-00078M-JA; Wed, 03 Mar 2021 06:19:33 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:45451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lHPXP-0004RQ-Nk; Wed, 03 Mar 2021 06:19:33 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.123])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id DF98E8C9051C;
 Wed,  3 Mar 2021 12:19:27 +0100 (CET)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Wed, 3 Mar 2021
 12:19:27 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G0018d7ed5bc-4788-49c5-8fbd-c5c69f5ff984,
 24CAEE7A76C7E725A9866EAA9907F8E378F99BC5) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH] arm/ast2600: Fix SMP booting with -kernel
To: Joel Stanley <joel@jms.id.au>
References: <20210303010505.635621-1-joel@jms.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <d079f85c-198f-c6c7-e4bf-e9dce2b9fbeb@kaod.org>
Date: Wed, 3 Mar 2021 12:19:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210303010505.635621-1-joel@jms.id.au>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG6EX1.mxp5.local (172.16.2.51) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 78a116f8-103f-4fd0-9e1e-c8db43ae99ec
X-Ovh-Tracer-Id: 8124212256302795683
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledruddtvddgvdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeekudeuudevleegudeugeekleffveeludejteffiedvledvgfekueefudehheefnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepjhhovghlsehjmhhsrdhiugdrrghu
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: viq1VtL1wYjO

On 3/3/21 2:05 AM, Joel Stanley wrote:
> The ast2600 machines do not have PSCI firmware, so this property should
> have never been set. Removing this node fixes SMP booting Linux kernels
> that have PSCI enabled, as Linux fails to find PSCI in the device tree
> and falls back to the soc-specific method for enabling secondary CPUs.
> 
> The comment is out of date as Qemu has supported -kernel booting since
> 9bb6d14081ce ("aspeed: Add boot stub for smp booting"), in v5.1.
> 
> Fixes: f25c0ae1079d ("aspeed/soc: Add AST2600 support")
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Cédric Le Goater <clg@kaod.org>
Tested-by: Cédric Le Goater <clg@kaod.org>

Thanks

C.

> ---
>  hw/arm/aspeed_ast2600.c | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
> index bf31ca351feb..49b00763864c 100644
> --- a/hw/arm/aspeed_ast2600.c
> +++ b/hw/arm/aspeed_ast2600.c
> @@ -241,8 +241,6 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
>  
>      /* CPU */
>      for (i = 0; i < sc->num_cpus; i++) {
> -        object_property_set_int(OBJECT(&s->cpu[i]), "psci-conduit",
> -                                QEMU_PSCI_CONDUIT_SMC, &error_abort);
>          if (sc->num_cpus > 1) {
>              object_property_set_int(OBJECT(&s->cpu[i]), "reset-cbar",
>                                      ASPEED_A7MPCORE_ADDR, &error_abort);
> @@ -253,11 +251,6 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
>          object_property_set_int(OBJECT(&s->cpu[i]), "cntfrq", 1125000000,
>                                  &error_abort);
>  
> -        /*
> -         * TODO: the secondary CPUs are started and a boot helper
> -         * is needed when using -kernel
> -         */
> -
>          if (!qdev_realize(DEVICE(&s->cpu[i]), NULL, errp)) {
>              return;
>          }
> 

