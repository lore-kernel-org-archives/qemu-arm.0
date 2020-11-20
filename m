Received: by 2002:a0c:dd89:0:0:0:0:0 with SMTP id v9csp358306qvk;
        Fri, 20 Nov 2020 08:20:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwkMmzbcFmJeam1EXPaUETNcDkqS+bL1Cmda3+/SsbqfY4Nd+grF8DN4Nyzh7KU8pokWpDi
X-Received: by 2002:a1f:f284:: with SMTP id q126mr13510080vkh.15.1605889224650;
        Fri, 20 Nov 2020 08:20:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605889224; cv=none;
        d=google.com; s=arc-20160816;
        b=GIkcB/v6Y6AJrhjhrEIKrAslslHFU3Ye6c8ZE9ap6XljTBaYzGe7zFFRV8ap+lViko
         jyFuCecdcapdCNAmsOOWUm2CojHKW4i7rjC3qwuCBv5Mf9HYT6PRewePXDFlhAPASwdb
         o+DSDraEiySx/JGk5RlsfFKG71WdsR2cTJdBe0r52LH+3HHhgYHlraEC+7ZM0P8XqgKc
         ISAb7za8kQ7XVbT9Ys+ow1+jlzWKC4B6aqxpz1Zc6aCFS4T2SQLR7ctzixhQ5jf5XAvj
         Mw4gWlEd/aYCqMcp09xOhuZRJpX/v85o6r/A3NAYXeovE5G88N6SgCZTz99zKM5THvOC
         dL/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=EVxgsPY9HkDAArKqSVmioxJ5t6zZHCyccS385R5pHuI=;
        b=UP4TG1aUT+p9Jz/2hmKHOGJmSc/3/wR8P9KOmL5sFtdxYR3Jtn03HRSoOtxr6KaBgs
         bp5qcWga7GbP8NNl8/FCqQTJDiGqXczIBJVUZNKU8ur2IUUeUbWlf2G2wcIR1WZkcr9n
         Po6NRSXMFPkhwF87z6590KYQZE7CHxM4xMLpvQHbGjJkWyOQ3EQDll0zwaTex7UjrZVN
         TmFPJ0C6Sctjem9OE5hDTYhnqIT5RFXH7UEPF4SFQWZQUmu+zIO/I682bPayZTeeTPxy
         7SKQEaF1hoivuMayZ+yhWyo8dnIEjjWyYTNOk+0p4klerkvEvsFUQgKtYuz7pHipkn3n
         pGdw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k143si753835vka.16.2020.11.20.08.20.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Nov 2020 08:20:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:39382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kg996-0000Fe-3a
	for alex.bennee@linaro.org; Fri, 20 Nov 2020 11:20:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1kg95n-00047P-51; Fri, 20 Nov 2020 11:16:59 -0500
Received: from smtpout1.mo804.mail-out.ovh.net ([79.137.123.220]:45263)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1kg95l-0004st-69; Fri, 20 Nov 2020 11:16:58 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.235])
 by mo804.mail-out.ovh.net (Postfix) with ESMTPS id 5DA0E7401BFF;
 Fri, 20 Nov 2020 17:16:52 +0100 (CET)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Fri, 20 Nov
 2020 17:16:52 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G005fb39b859-bef0-40c1-a480-b47cab6d8c19,
 A23325C36D42651F374A503D8DAC6E521FBBB235) smtp.auth=clg@kaod.org
Subject: Re: [PATCH-for-5.2 2/6] MAINTAINERS: Cover system/arm/aspeed.rst with
 ASPEED BMC machines
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 <qemu-devel@nongnu.org>
References: <20201120154545.2504625-1-f4bug@amsat.org>
 <20201120154545.2504625-3-f4bug@amsat.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <72872af7-8f99-bcbd-4cf4-905aed3d7e9b@kaod.org>
Date: Fri, 20 Nov 2020 17:16:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201120154545.2504625-3-f4bug@amsat.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: d7e3818b-a795-49c9-8128-6a3bcbb3f755
X-Ovh-Tracer-Id: 17002214495973510051
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudegtddgkeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeekudeuudevleegudeugeekleffveeludejteffiedvledvgfekueefudehheefnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehfgegsuhhgsegrmhhsrghtrdhorhhg
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout1.mo804.mail-out.ovh.net
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kRbN5bqfT0SH

On 11/20/20 4:45 PM, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks ! 

C. 


> ---
> Cc: "Cédric Le Goater" <clg@kaod.org>
> Cc: Andrew Jeffery <andrew@aj.id.au>
> Cc: Joel Stanley <joel@jms.id.au>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8d7a6026b91..cc883260d03 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1001,6 +1001,7 @@ F: include/hw/*/*aspeed*
>  F: include/hw/misc/pca9552*.h
>  F: hw/net/ftgmac100.c
>  F: include/hw/net/ftgmac100.h
> +F: docs/system/arm/aspeed.rst
>  
>  NRF51
>  M: Joel Stanley <joel@jms.id.au>
> 

