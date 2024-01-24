Received: by 2002:a17:906:590b:b0:a31:23a7:2a34 with SMTP id h11csp122200ejq;
        Tue, 23 Jan 2024 22:50:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE/9ytXskp/yQfIRwzTAb0F2yUrn9APHWzosfitSTaRjuUt6LWIx+hJGOGyd3Mpu7GXFtOL
X-Received: by 2002:a05:622a:1111:b0:42a:329e:b5c8 with SMTP id e17-20020a05622a111100b0042a329eb5c8mr2545317qty.81.1706079053001;
        Tue, 23 Jan 2024 22:50:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706079052; cv=none;
        d=google.com; s=arc-20160816;
        b=Ndcxwy4UWcGQHXVib2OBLeVDB/s6nUHAEl11G+58cT15PpmypiPk1xYC+2p/ZSgqmx
         GoBrNn2Th0GLDXG8sg4ylXyO1b8uPuJFdpkv+zPoDe/pMP/BqAjVbfzKVGvaWcBjRzQ5
         K4y8e5IOVG/iFq7Jv573jmRA7r4dWZnHeXeDnZmgKhTa5eAap7kI/4L5+2C9JWAJUKrY
         0cQvyYkmn1lRZUeJ9aUrs2A60SYuawI5Ghpe40mljfYM9vOd32IfKJZ8ZkbJ3kpJqzYp
         SR96zxVkrk59NWbzxfkLSshyY2pb1+byZm6t0CM5zoHFodkXpNzPNw4HG/GrwK7TQfPr
         ljJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=l40xmOfBH5u3YWc3/8f30RfqTNNdpK91d3K2oYXRs8o=;
        fh=PGBvAVDo542HGKR2HEyzwlMafYQwpX/jzYtHtf/eDX4=;
        b=NoWM/ZvnAw74WppRfghwEniZOWVu+cAHoEADTxyeDKbl1OaU30/GyDS6ux1A08KfUr
         FkTN9Yp76LdsbPfwJdZMQm82JiYvuFJBFkIDNdFrHgcBGuG/pkNxq38+bC2T0WBheqlo
         h9vBMafpEFlhfiPVf7or1LhdQL7WExq5SGy42kLKfioFCrvMR1eTI3iiAdrnFGJ0kVHa
         sXwl8xZSabDgV6gJi2yRKIBkkakmyqrV6bK2jkDj7y20YR8kx6oerz4/5okO6siOxGlG
         WsM+FFyZ3E3J6S1plVwa9K2nG7ifD/jkdCxuIJRSeR7WtNleMiep6Hkx8etd/HmjK6kE
         yKZA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h8-20020ac85e08000000b00428204215cdsi9738237qtx.74.2024.01.23.22.50.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Jan 2024 22:50:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rSX5v-0005Pe-GE; Wed, 24 Jan 2024 01:50:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=rIgd=JC=kaod.org=clg@ozlabs.org>)
 id 1rSX5t-0005PM-Hn; Wed, 24 Jan 2024 01:50:41 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=rIgd=JC=kaod.org=clg@ozlabs.org>)
 id 1rSX5s-0003iM-06; Wed, 24 Jan 2024 01:50:41 -0500
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4TKZN41c2Lz4x2S;
 Wed, 24 Jan 2024 17:50:28 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4TKZN20Bxlz4wcg;
 Wed, 24 Jan 2024 17:50:25 +1100 (AEDT)
Message-ID: <b1731d4b-00ca-4fc1-8d2f-fe8e9236a324@kaod.org>
Date: Wed, 24 Jan 2024 07:50:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] hw/arm/aspeed: Remove dead code
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>
References: <20240123224842.18485-1-philmd@linaro.org>
 <20240123224842.18485-2-philmd@linaro.org>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20240123224842.18485-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=rIgd=JC=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: gg5d12tAYEhF

On 1/23/24 23:48, Philippe Mathieu-Daudé wrote:
> Remove copy/paste typo from commit 6c323aba40 ("hw/arm/aspeed:
> Adding new machine Tiogapass in QEMU").
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>



Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
>   hw/arm/aspeed.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index cc59176563..4bc292ff84 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -1301,7 +1301,6 @@ static void aspeed_machine_tiogapass_class_init(ObjectClass *oc, void *data)
>       mc->default_ram_size       = 1 * GiB;
>       mc->default_cpus = mc->min_cpus = mc->max_cpus =
>           aspeed_soc_num_cpus(amc->soc_name);
> -        aspeed_soc_num_cpus(amc->soc_name);
>   };
>   
>   static void aspeed_machine_sonorapass_class_init(ObjectClass *oc, void *data)

