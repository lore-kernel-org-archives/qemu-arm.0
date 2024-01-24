Received: by 2002:a17:906:590b:b0:a31:23a7:2a34 with SMTP id h11csp122782ejq;
        Tue, 23 Jan 2024 22:52:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFKlzZX4co4A3fnCluBaUZTpKzL0od+ZaBdsgWW2OPWEwV63BBAuasK7AbQgUI/wXchEnnC
X-Received: by 2002:a05:620a:22a7:b0:783:53ba:d9de with SMTP id p7-20020a05620a22a700b0078353bad9demr8286730qkh.23.1706079151494;
        Tue, 23 Jan 2024 22:52:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706079151; cv=none;
        d=google.com; s=arc-20160816;
        b=eEXwCPPfxu+skJeYMXbnLE4h3MD8YIUJXgNmJVbpQ832b9lfQTE8EP9YQbeug2pVT6
         /erinhl6qgglvDw2cbRtXofWkPe8pMC1bdfdyjXfuQ8OQ4+IJ8kdCBq0QcmN/BG3IGtW
         PmrqPblfmjIHKQoJbE8kyaPNlQpaHyywRGWEoO4LsNt5XHc2kEktnpSRxKwhNDBa0TFr
         2vN2lcdMEcKbng8TwVpYO23X0AMkTxcSqa4PR4kq455q9CC120YqLnqdRbz+5RcKPykp
         S/kwrMQZd/5X8CM0YJXLrm26AQLYhIGiSUXCxBSzVCdR0PPHW5WRqLxeJle1Jv2F1RQs
         cQsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=FG1Hu7Ayk8ApLucFZO/3A69tNYiDYobwgsBB+4M9fWo=;
        fh=PGBvAVDo542HGKR2HEyzwlMafYQwpX/jzYtHtf/eDX4=;
        b=plEh0GfMSjzM1PufE8+ZGfVeGffwAexZU+ZViLk+pTBcF4lDDRBnmNvjdUAvvY9Rx6
         7ywGEzcVx3CfNnWsTGXQQ9l5rBuVA7tIflRTBhivBOkj25sKUubENTprW1RfFUG8US0c
         OXHt/RP0//GLUU8mJtGy0dvWE+86XihaU6qfkvlWeKT3cEjZGQ8BMbtvqEkOwM6EWMhU
         jZPJtLvq+40Mz5a/SRarWJVEVWQbpgWX+tmMPkYusInoGpa1wQ/N4833qqpvPzXvW5hF
         WI5s2NLhp4Xg+F5Qqi8AbobAvJN4xBiPUHqAJzKjRKI27z31bh2z1BR3S17HFUehe0TX
         dk/g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z6-20020ae9f446000000b00783a96b5ee9si3322542qkl.92.2024.01.23.22.52.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Jan 2024 22:52:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rSX7Z-000671-3a; Wed, 24 Jan 2024 01:52:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=rIgd=JC=kaod.org=clg@ozlabs.org>)
 id 1rSX7W-00066f-R9; Wed, 24 Jan 2024 01:52:22 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=rIgd=JC=kaod.org=clg@ozlabs.org>)
 id 1rSX7T-0003vS-RT; Wed, 24 Jan 2024 01:52:21 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4TKZQ933Vkz4x2S;
 Wed, 24 Jan 2024 17:52:17 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4TKZQ72pVvz4wd4;
 Wed, 24 Jan 2024 17:52:15 +1100 (AEDT)
Message-ID: <e58f2344-8b74-4ee6-9ca7-8d422dba0184@kaod.org>
Date: Wed, 24 Jan 2024 07:52:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] hw/arm/aspeed: Set default CPU count using
 aspeed_soc_num_cpus()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>
References: <20240123224842.18485-1-philmd@linaro.org>
 <20240123224842.18485-3-philmd@linaro.org>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20240123224842.18485-3-philmd@linaro.org>
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
X-TUID: dmKDjpSUnVyo

On 1/23/24 23:48, Philippe Mathieu-Daudé wrote:
> Since commit b7f1a0cb76 ("arm/aspeed: Compute the number
> of CPUs from the SoC definition") Aspeed machines use the
> aspeed_soc_num_cpus() helper to set the number of CPUs.
> 
> Use it for the ast1030-evb (commit 356b230ed1 "aspeed/soc:
> Add AST1030 support") and supermicrox11-bmc (commit 40a38df55e
> "hw/arm/aspeed: Add board model for Supermicro X11 BMC") machines.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
>   hw/arm/aspeed.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 4bc292ff84..5b01a4dd28 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -1212,6 +1212,8 @@ static void aspeed_machine_supermicrox11_bmc_class_init(ObjectClass *oc,
>       amc->macs_mask = ASPEED_MAC0_ON | ASPEED_MAC1_ON;
>       amc->i2c_init  = palmetto_bmc_i2c_init;
>       mc->default_ram_size = 256 * MiB;
> +    mc->default_cpus = mc->min_cpus = mc->max_cpus =
> +        aspeed_soc_num_cpus(amc->soc_name);
>   }
>   
>   static void aspeed_machine_supermicro_x11spi_bmc_class_init(ObjectClass *oc,
> @@ -1586,11 +1588,12 @@ static void aspeed_minibmc_machine_ast1030_evb_class_init(ObjectClass *oc,
>       mc->init = aspeed_minibmc_machine_init;
>       amc->i2c_init = ast1030_evb_i2c_init;
>       mc->default_ram_size = 0;
> -    mc->default_cpus = mc->min_cpus = mc->max_cpus = 1;
>       amc->fmc_model = "sst25vf032b";
>       amc->spi_model = "sst25vf032b";
>       amc->num_cs = 2;
>       amc->macs_mask = 0;
> +    mc->default_cpus = mc->min_cpus = mc->max_cpus =
> +        aspeed_soc_num_cpus(amc->soc_name);
>   }
>   
>   static void aspeed_machine_qcom_dc_scm_v1_class_init(ObjectClass *oc,

