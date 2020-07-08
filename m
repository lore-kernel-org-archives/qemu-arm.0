Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp596519lfm;
        Wed, 8 Jul 2020 09:56:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxSg7Yq9a4s99UqPlCYIkIjBr6Z0Jh61D73sbMO4XCGfN0lGEjN+sLeRJPb0OWoIqT0gE3m
X-Received: by 2002:a25:ba81:: with SMTP id s1mr99169093ybg.386.1594227396403;
        Wed, 08 Jul 2020 09:56:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594227396; cv=none;
        d=google.com; s=arc-20160816;
        b=XWphzBTvxflaFRo/aM22xRZUzlokomCc6pWGNSSLdN+0Zx6ou0HQ9QlTd/awpYcpNG
         AMafklNIQ0vbmDzbX6fNcgeXvdyc0eOOblEVoDnCN+bfT4KHbLfrtqo1uSEADw87Umkb
         vlVIuesvyx9DpG2qB08HbjXBulfjLXvhB+81S0duCg92GyPZr/FNm/KkLBNk5ULADo4h
         qF/ihC2nx9pZUOHGlVxBP/AQ1UWWfwpF3G00qXQWTwDduaWkKhNiusxCHQUpGse/bIwc
         NVXIHvm4Q0+nRB5qzOs6+nWJlEeyzkpDlgWzxmNEt1vu+89c42GEUs5xVXQvWEDETI76
         fgoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=EAXU/TTClvGdi/zI+hMr8WfP/Y7qjetMMediXvP5wR8=;
        b=zmx7oflH5Wc7/yA9+vJ+OK6cT1SzKuq8bZZFVn0PW6Ils/CzSv1FJHu5tIA783hXDb
         AnJSjJAfHecmIOudSCBDtWZx6Jmw9ReDU7tnor0qoPL2oNNnHFWQXfCm6f8aZRm7G5Ls
         zw67fRwFfMz+0Gbmx8DyFytOv2VG2q6TQ1dx4kc3YEdxB/bsge5brbhUEtVVcgzk66lR
         1nSpxDDAil1d3Ikp7GdnurizWnEE9GNAWqz6GjAzERWgPGYaGR7ia8bZIewbLSasoLUU
         0juvsJ+JqEw9n9Cusf96losmoaX1mA4LiKE5nSLJ28u5EDN5ZTKkQnqhNaFfh4BVLSpu
         Gycw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=O3IvFx7a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p203si246085ybb.263.2020.07.08.09.56.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Jul 2020 09:56:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=O3IvFx7a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:35092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jtDN5-0000Jy-Pn
	for alex.bennee@linaro.org; Wed, 08 Jul 2020 12:56:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jtDMx-0000Ir-HT; Wed, 08 Jul 2020 12:56:27 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:35257)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jtDMv-0001bf-UU; Wed, 08 Jul 2020 12:56:27 -0400
Received: by mail-wm1-x342.google.com with SMTP id l2so3979022wmf.0;
 Wed, 08 Jul 2020 09:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=EAXU/TTClvGdi/zI+hMr8WfP/Y7qjetMMediXvP5wR8=;
 b=O3IvFx7amBt/cXfoHJiG5BetCs3YWCQoGaoF71UeSdRiHHVIDHgCkH7fUvoA5F7t9d
 i+fSJvQbLFl+UK+UWOtxwuNF2JOF+bY9ICdvYT1pL6UvuECtAIcfnkA9D5MabRRmQS8P
 88tUO0e3czI32EUuARfan2FLtU5grpDJzLgC2BA10dPCqPNrFT+DOgBT6WUTejCjkKv2
 D1Aty418lVCCtKYnbDN5bxzCEmviD9qJgdikop8CPrtUkQwAWCZ2VmH4+x0/fJB9Fz94
 3br2bITpgj8aAoXoKVXDfMh0LwfY1nN1wNOs9S6S/bONQJjXmv4uUzIQmQtZazyyRpO1
 xWqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EAXU/TTClvGdi/zI+hMr8WfP/Y7qjetMMediXvP5wR8=;
 b=B6LqLN5W2zAQNnwe4RSXa9FW8xmKb7X2GxStAi3U/7kCwhxP6Lv73XfUXjZmaV+ihq
 0Ilh0ahiTZtNKmgFHWHp73Ds01eHxg18ro2HalntfmwO2xFcF5xn5nG9MwCkO1icF9uP
 RVlrW62d7RiK0xihSV4dGAFylVsa2t8mjpu5XF+ofpuvFb+tp3+lUtmKlcqNgPN6eYsD
 jUJORqbzTpDq2b70RnWqdRSKgvJU7ZeVOMKG/BkIPWNAF7ZNlTx+01YMs124mqb45moO
 0O93Yzur40gm5VkHXpD8fcPY5jMlb1C2d+k5w6SGZdmoluMVc4m9aUZc+4/1wKuhuFYA
 sFBQ==
X-Gm-Message-State: AOAM531FB63WVOo+8zF6e26Vg99HvV2mE61TCe9Ce/etZwGjP8hpMLjE
 XsSnlqqaufXwSLn1fRHpN3du5LNB
X-Received: by 2002:a05:600c:2182:: with SMTP id
 e2mr10040563wme.186.1594227383825; 
 Wed, 08 Jul 2020 09:56:23 -0700 (PDT)
Received: from [192.168.1.36] (138.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.138])
 by smtp.gmail.com with ESMTPSA id y16sm774472wro.71.2020.07.08.09.56.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jul 2020 09:56:23 -0700 (PDT)
Subject: Re: [PATCH v4 01/12] npcm7xx: Add config symbol
To: Havard Skinnemoen <hskinnemoen@google.com>, peter.maydell@linaro.org
References: <20200707184730.3047754-1-hskinnemoen@google.com>
 <20200707184730.3047754-2-hskinnemoen@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <9b824a33-13d4-445d-4986-0c5a135c4bb8@amsat.org>
Date: Wed, 8 Jul 2020 18:56:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200707184730.3047754-2-hskinnemoen@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: kfting@nuvoton.com, qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
 qemu-devel@nongnu.org, Avi.Fishman@nuvoton.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Rp1uIFa9SIs3

On 7/7/20 8:47 PM, Havard Skinnemoen wrote:
> Add a config symbol for the NPCM7xx BMC SoC family that subsequent
> patches can use in Makefiles.
> 
> Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
> Acked-by: Joel Stanley <joel@jms.id.au>
> Signed-off-by: Havard Skinnemoen <hskinnemoen@google.com>
> ---
>  default-configs/arm-softmmu.mak | 1 +
>  hw/arm/Kconfig                  | 8 ++++++++
>  2 files changed, 9 insertions(+)
> 
> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
> index 8fc09a4a51..9a94ebd0be 100644
> --- a/default-configs/arm-softmmu.mak
> +++ b/default-configs/arm-softmmu.mak
> @@ -27,6 +27,7 @@ CONFIG_GUMSTIX=y
>  CONFIG_SPITZ=y
>  CONFIG_TOSA=y
>  CONFIG_Z2=y
> +CONFIG_NPCM7XX=y

I'd squash this in patch 6: "Add two NPCM7xx-based machines"

>  CONFIG_COLLIE=y
>  CONFIG_ASPEED_SOC=y
>  CONFIG_NETDUINO2=y
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 4a224a6351..a31d0d282f 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -354,6 +354,14 @@ config XLNX_VERSAL
>      select VIRTIO_MMIO
>      select UNIMP
>  
> +config NPCM7XX
> +    bool
> +    select A9MPCORE
> +    select ARM_GIC
> +    select PL310  # cache controller
> +    select SERIAL
> +    select UNIMP

And this in patch 5: "Add NPCM730 and NPCM750 SoC models"

> +
>  config FSL_IMX25
>      bool
>      select IMX
> 

