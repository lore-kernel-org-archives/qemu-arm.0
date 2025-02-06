Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp1416168njb;
        Thu, 6 Feb 2025 01:22:41 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWOVxm7I8Th2W6JN46H7kdrLPRfb1g/Icvj3IrZvNIrotlznNOUdv0Zx91oAtblVoejlElbnUDO4spyRQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFAtILipGxoGrBf3j5r5LFC050eZ8n1CNSB4SCbAR9nYE0kVQHfyR1X5pyRvZw4c4smDDFB
X-Received: by 2002:a05:620a:1925:b0:7be:82fc:6871 with SMTP id af79cd13be357-7c039f980bbmr870698785a.18.1738833761576;
        Thu, 06 Feb 2025 01:22:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738833761; cv=none;
        d=google.com; s=arc-20240605;
        b=dnPttQqAZc4nBRWXSibqFFcnU0YlyPQnTUzQ0NBtVlpA2D9/PCb5FHrh6m8OY+FJMI
         UraiCsBZXaecYuPYyY7SpST4iEadLv6WZzXHSy2haLIiwLfywKcJUSOXUOgE+7tU2bWy
         o/aLLxiaV5yze+eXR6ZFphOYVbegAFcJT8dwD3iPpAbb3fh5WymFgdkpenxpcNiEDh10
         YOx760QRSvxCUtodirg3yg8g49MIbotKNp/3vrnSxpHn4r8cBNkn2y6uG4HLjKn5yht3
         0v20dHtK2skoWot2wKSXENR2JHRECB7pHpjnTvZFkgiY7sqTDdGlfjfdzn/lVKdmpjJE
         dTpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=ucLbf6McKPZCu5LWqoHXPjVgQjymbuLDL3K2a69zdug=;
        fh=c8fHOSfepZpraM5kd61iQblNo+/0YhVDJmbS6Tbl5o8=;
        b=HnlDAb8fLi5proKJ8FMD67Bev55JIF78aVR8r/k8XwVPd2Cx2RxfWJWBL9Clhpe8Q9
         g398/8HUzGpcqGz2LycEhY0bZ8ZVsH/JpJD7iWK32MMw1VdbDryqAs6glKCErRiqSQ1w
         eJCDIkb3q4sNuR7HYuGWD8uemolhjzzFXRmJBMTbKdKGESXqdPPTRL5hI2+nYZUJpuAU
         g2vKJ431e2KvJGLrtoNQHwhgy9Wed4nfq0z51ss8qTldTAa8NdL/djbNCK+DeaUXffXi
         kQvF6RPPqRoVNDWqKt7i94HCg5OEo753XB94g0B97kQzdYyu7028uT3WIOclDB4NjMQy
         CAeA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YIAUvItN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c041ecf014si79803685a.461.2025.02.06.01.22.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2025 01:22:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YIAUvItN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tfy5l-0004Da-Vj; Thu, 06 Feb 2025 04:22:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tfy5j-0004DE-RB
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 04:22:35 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tfy5h-0002TJ-Ub
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 04:22:35 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4361f796586so6734525e9.3
 for <qemu-arm@nongnu.org>; Thu, 06 Feb 2025 01:22:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738833752; x=1739438552; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ucLbf6McKPZCu5LWqoHXPjVgQjymbuLDL3K2a69zdug=;
 b=YIAUvItNSSWjU0maTptRuHQ1VaYTviH/CpfTrW4raEvSSqxDMp/+H2DSuVIaSTZBGb
 6/GbNlg0pbV3+odsTFMWalwHzeq7qAQpAFOTAaKjT5he3fytCurYJHQPtQfv9Jnx0xkU
 N9HkFSgKPuw7VptfQwmy3PXgJMff8vdK2Q/yXpMankYXghaZTzwIbu4/KaPtIXeKWdbS
 eJjzMzplUjrWyMk++kmf/ZbeThx9RMbUkhLpBDOCRnYnOWhHpCHUzGL/9ErLmHQCr3ol
 jHz0+5en48wZ/F6kjWCXpYYHy7lV8IwgdI+M4/2b8Q1CtaXaB4ArqTyiQtx0jRPq+OCH
 6R2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738833752; x=1739438552;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ucLbf6McKPZCu5LWqoHXPjVgQjymbuLDL3K2a69zdug=;
 b=FLD2f1+sBYAdvB5GH3HGR78HGIXVOaAHtAKNpqe7vvho8O+he6WKoZGjnnRyDvTvkL
 E5HWoDLUsLJwK1u4Hm4AwbwYSMwslDoNjDGFBuoICB42AtjC1pQ0ENBrUjiDJMECS6k8
 9Oh3AiYbZxvX80qK2BBtuZbqTJq1Tg1r0FC8EFKZMokm2C+mIO/tlrm0g68oNQslM3GQ
 zNEEkIByn6Tg6UDoMHxAnEXywTs3lPBfRgbEfcuqkWNiUYnMsxCssjVc3Q5SQhIG6mDT
 uHM2TkOJ+kxUtwVUegmKg/WDTfXeODIjfKUerpFXotPyKnFACg1QesvtcJnQSBo127Ts
 8Pnw==
X-Gm-Message-State: AOJu0YwyOy+KcHF5ivR207ESOCYEFJvNDnh9f7GnZ8KhEQldoDGWNdwf
 TcmUQ1OKiTInBhl8AeFgkhmtkVA/ThC/iBCNSiHHGzLaiuz+nOa8O8PlcxjBAgs=
X-Gm-Gg: ASbGncuetSqwGUWAzSm4s+R3pB0TmOZSD7qqkeNq1aoxO0dWkS0hWZFMzSWRJij3qR6
 8nt6JZL7Y0+NJqAYX1uWc0UiwV9FklIYOFAIzNcLnWuWa9DtkdPR4Cw92SIkEyvGBud3L7Lck+g
 EcnSnZx3Cfh23cuQPChuvtQDtWT2/Q7ezKUCP+Bbdp/+ddng5Dmw1CmqpOgV6oNGED+dqUQpPzp
 UM/sTxiVqeV5Y+WBYb/w76rVqgM1whCN/wL1FzTFI3iGfp6drAwRPYwULBUqwKCd6ASeKP4Ei6J
 nUJeqZ2nOgJe1xy0QprrSiBu0s5PH/+lqiDeVWfhT/Q6QwAXzC+in4CkKwA=
X-Received: by 2002:a05:6000:1889:b0:385:f909:eb2c with SMTP id
 ffacd0b85a97d-38db49005f5mr5297634f8f.38.1738833752020; 
 Thu, 06 Feb 2025 01:22:32 -0800 (PST)
Received: from [192.168.69.198] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4391dfc87desm12531185e9.25.2025.02.06.01.22.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Feb 2025 01:22:31 -0800 (PST)
Message-ID: <387122a2-0e10-44bf-9810-aa8b122b7425@linaro.org>
Date: Thu, 6 Feb 2025 10:22:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/17] hw/misc: Add nr_regs and cold_reset_values to
 NPCM CLK
To: Hao Wu <wuhaotsh@google.com>, peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, venture@google.com,
 Avi.Fishman@nuvoton.com, kfting@nuvoton.com, hskinnemoen@google.com,
 titusr@google.com, chli30@nuvoton.corp-partner.google.com
References: <20250206013105.3228344-1-wuhaotsh@google.com>
 <20250206013105.3228344-13-wuhaotsh@google.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250206013105.3228344-13-wuhaotsh@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: MepeIq2DvfjZ

On 6/2/25 02:31, Hao Wu wrote:
> These 2 values are different between NPCM7XX and NPCM8XX
> CLKs. So we add them to the class and assign different values
> to them.
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> ---
>   hw/misc/npcm_clk.c         | 19 +++++++++++++------
>   include/hw/misc/npcm_clk.h |  9 ++++++++-
>   2 files changed, 21 insertions(+), 7 deletions(-)


> @@ -870,10 +872,11 @@ static const struct MemoryRegionOps npcm_clk_ops = {
>   static void npcm_clk_enter_reset(Object *obj, ResetType type)
>   {
>       NPCMCLKState *s = NPCM_CLK(obj);
> +    NPCMCLKClass *c = NPCM_CLK_GET_CLASS(s);
>   
> -    QEMU_BUILD_BUG_ON(sizeof(s->regs) != sizeof(cold_reset_values));
> -
> -    memcpy(s->regs, cold_reset_values, sizeof(cold_reset_values));
> +    g_assert(sizeof(s->regs) >= sizeof(c->cold_reset_values));

Equivalent to:

        g_assert(sizeof(s->regs) >= sizeof(uintptr_t));

Not very useful IMHO.

> +    g_assert(sizeof(s->regs) >= c->nr_regs * sizeof(uint32_t));
> +    memcpy(s->regs, c->cold_reset_values, sizeof(s->regs));
>       s->ref_ns = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>       npcm7xx_clk_update_all_clocks(s);
>       /*
> @@ -1045,11 +1048,14 @@ static void npcm_clk_class_init(ObjectClass *klass, void *data)
>   
>   static void npcm7xx_clk_class_init(ObjectClass *klass, void *data)
>   {
> +    NPCMCLKClass *c = NPCM_CLK_CLASS(klass);
>       DeviceClass *dc = DEVICE_CLASS(klass);
>   
>       QEMU_BUILD_BUG_ON(NPCM7XX_CLK_REGS_END > NPCM_CLK_MAX_NR_REGS);
>       QEMU_BUILD_BUG_ON(NPCM7XX_CLK_REGS_END != NPCM7XX_CLK_NR_REGS);
>       dc->desc = "NPCM7xx Clock Control Registers";
> +    c->nr_regs = NPCM7XX_CLK_NR_REGS;
> +    c->cold_reset_values = npcm7xx_cold_reset_values;
>   }
>   
>   static const TypeInfo npcm7xx_clk_pll_info = {
> @@ -1081,6 +1087,7 @@ static const TypeInfo npcm_clk_info = {
>       .parent             = TYPE_SYS_BUS_DEVICE,
>       .instance_size      = sizeof(NPCMCLKState),
>       .instance_init      = npcm_clk_init,
> +    .class_size         = sizeof(NPCMCLKClass),
>       .class_init         = npcm_clk_class_init,
>       .abstract           = true,
>   };
> diff --git a/include/hw/misc/npcm_clk.h b/include/hw/misc/npcm_clk.h
> index db03b46a52..f47614ac8d 100644
> --- a/include/hw/misc/npcm_clk.h
> +++ b/include/hw/misc/npcm_clk.h
> @@ -175,8 +175,15 @@ struct NPCMCLKState {
>       Clock *clkref;
>   };
>   
> +typedef struct NPCMCLKClass {
> +    SysBusDeviceClass parent;
> +
> +    size_t nr_regs;
> +    const uint32_t *cold_reset_values;
> +} NPCMCLKClass;
