Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp2080864lfk;
        Mon, 31 Jan 2022 00:28:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz2cTG6xJe6FiR4EfQbgp9952YdAdMODa2s1JCXPEntPGin0rJhD/qICpH0XA8vd677AcpO
X-Received: by 2002:ac8:7f4d:: with SMTP id g13mr14124927qtk.173.1643617736213;
        Mon, 31 Jan 2022 00:28:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643617736; cv=none;
        d=google.com; s=arc-20160816;
        b=Q7MtcX1Zye4X23ICOXAy1tkMFRCR4NSCUKCDAwZIgaABteCLBgXQp6nYryiKFD0+a2
         kZad5/60dzRDNV0LdKHcgM6vD5nwqinvpxLaAEh/ckG/4OimUqfxm3EpL/YQ/Uo8m/zY
         q2+3pBWivOhZG4yR7IoLeFL44Z3Sahtf+KmKDMT4ZGRhwK/Es4ntJFCYbJKllojRE/oM
         prn1LeST0dJVfAf77oqGqZ4iE3NnOE8TBeaU9Enwc/juOkTscKJljlHJDP711okeA6zN
         RdwM3gwL9vO2evdK4daz5UkK+eQ2fba3mNiVi0rCzeI3LVbvzZ9kp/DsOxRZlgbxZlTU
         72jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=K9PHSmzQT0cxQD81dO3PaonqG2wYx11DIXsGZN7p6mw=;
        b=JlA8jvjAiSXc8XJybugEc/NJSWFnKEnzOtP6yPUW91CrWYJZF0EWIP+3XlvLsdlw1L
         LiC4OzDMaQYLhyBQuwcdcmt1R+dR6fCntUcwn2ZeR2Sr0fgLmNETqiCX3LCPbLnCSzyx
         wTml5WUSVppoGwhxTdkDvSF0EJ8C3VhirAdrErY+EfUo5YGZ0MFm2pTSR9GYthw2Ambz
         a/L2Ef0wriqvOVybMFxGGCKJflrlZ8Aq/m+C4+u2H2YLNXMtmyN7VfjRAs0TDyWZ+a8S
         hXrGMbr/UVFILXQ7V6rAJonmS2D21WyNP862MK3vKSFwwRwqnx4nx/jC+ShNB8fwLQAe
         fIjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=pJ+SosqS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t14si1287761qta.117.2022.01.31.00.28.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 31 Jan 2022 00:28:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=pJ+SosqS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nES3T-0001fS-N7
	for alex.bennee@linaro.org; Mon, 31 Jan 2022 03:28:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nERkx-0006Kp-Ty
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 03:09:49 -0500
Received: from [2607:f8b0:4864:20::434] (port=41884
 helo=mail-pf1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nERkw-0004Fr-Co
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 03:09:47 -0500
Received: by mail-pf1-x434.google.com with SMTP id i30so12225482pfk.8
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 00:09:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=K9PHSmzQT0cxQD81dO3PaonqG2wYx11DIXsGZN7p6mw=;
 b=pJ+SosqSXiBvFKNpgqw7V+opiTFAWHS22l0091NvVZdXakoofHynciu7siv9dhNhX0
 yT4zAmKzbtRr/q6BXKfkILJ7DzD4FTV7If2SjY9J1volVTIEzp3Sfw3Z0WbrIJkwhVyV
 +Kt18ZUN4vDJa/oslyr6NH96TjzNXcD4mePfT12WfkKcdGNpbX6qhuBvP3ZSUkUUaNs7
 c3IQL405rSHzT0doXFzdf9TTFPx7Hxx6/YxZX0hDp8B6IPLBgWjExF/YtG2+I1raJSev
 91KB4MzCTPjH7peIs97hFHipv41+CT+u3hytzFDN97Ms0pCDVbqZRmGx0W/8fIUX4yNx
 MoEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=K9PHSmzQT0cxQD81dO3PaonqG2wYx11DIXsGZN7p6mw=;
 b=66ODm9lbup9asIsmNnYU+ZGzAIZcH5BXZ46AuXff5maBzJRo1uBR1YYI2UF1xjzKLj
 9SGxPChxwZhHARaoQ9AzcbcHHL1bmjeTfSM5GhQrl+SE4GjCPdKmuGdicXejROknwteE
 TbNaXwYyv0CyTtEuvHBAMD2tBXrToI0nNsTagU8QuKPov5IvcvXEzzWguZxA4eUtdD0T
 ENhK8vZ1TS1JmKqYzJANIfkzPUgWJdLRdf4lV+kAqZWlBrT/eYc/S6u1MYMGJ+2x2Vro
 +rlr6YehvF0GRkistfmE8llBVPsOKxDTUUcmxJGUs1GuT8wDRjqzklh3YxQmjWoe94DJ
 /z+A==
X-Gm-Message-State: AOAM533NxT/zjP5gt05XCUgxFQb/n4PGpxMhL4sKa8yY8M4zkv8Y/lqU
 858qXAkOglXth0AL4+7C9/NS3Q==
X-Received: by 2002:a63:6486:: with SMTP id
 y128mr13808059pgb.152.1643616585159; 
 Mon, 31 Jan 2022 00:09:45 -0800 (PST)
Received: from [192.168.15.130] ([60.231.85.5])
 by smtp.gmail.com with ESMTPSA id 202sm28680716pga.72.2022.01.31.00.09.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Jan 2022 00:09:44 -0800 (PST)
Message-ID: <eacd074c-1c26-da1a-72dd-dfbcebf85ae7@linaro.org>
Date: Mon, 31 Jan 2022 19:09:34 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 15/16] hw/arm/boot: Drop nb_cpus field from arm_boot_info
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220127154639.2090164-1-peter.maydell@linaro.org>
 <20220127154639.2090164-16-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220127154639.2090164-16-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::434
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eduardo Habkost <eduardo@habkost.net>, Rob Herring <robh@kernel.org>,
 Andrew Jeffery <andrew@aj.id.au>, Andre Przywara <andre.przywara@arm.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Beniamino Galvani <b.galvani@gmail.com>, Tyrone Ting <kfting@nuvoton.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, Alexander Graf <agraf@csgraf.de>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Andrey Smirnov <andrew.smirnov@gmail.com>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ChskNpUVlNjM

On 1/28/22 02:46, Peter Maydell wrote:
> We use the arm_boot_info::nb_cpus  field in only one place, and that
> place can easily get the number of CPUs locally rather than relying
> on the board code to have set the field correctly.  (At least one
> board, xlnx-versal-virt, does not set the field despite having more
> than one CPU.)
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   include/hw/arm/boot.h   | 1 -
>   hw/arm/aspeed.c         | 1 -
>   hw/arm/boot.c           | 7 +++----
>   hw/arm/exynos4_boards.c | 1 -
>   hw/arm/highbank.c       | 1 -
>   hw/arm/imx25_pdk.c      | 3 +--
>   hw/arm/kzm.c            | 1 -
>   hw/arm/mcimx6ul-evk.c   | 1 -
>   hw/arm/mcimx7d-sabre.c  | 1 -
>   hw/arm/npcm7xx.c        | 3 ---
>   hw/arm/orangepi.c       | 4 +---
>   hw/arm/raspi.c          | 1 -
>   hw/arm/realview.c       | 1 -
>   hw/arm/sabrelite.c      | 1 -
>   hw/arm/sbsa-ref.c       | 1 -
>   hw/arm/vexpress.c       | 1 -
>   hw/arm/virt.c           | 1 -
>   hw/arm/xilinx_zynq.c    | 1 -
>   18 files changed, 5 insertions(+), 26 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
