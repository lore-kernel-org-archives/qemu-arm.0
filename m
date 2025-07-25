Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DCBBC87FCE
	for <qemu-arm@archiver.kernel.org>; Fri, 25 Jul 2025 13:19:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ufIJv-0007PQ-EY; Fri, 25 Jul 2025 09:18:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ufIJr-0007Ib-BD
 for qemu-arm@nongnu.org; Fri, 25 Jul 2025 09:18:39 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ufIJp-0005RF-GF
 for qemu-arm@nongnu.org; Fri, 25 Jul 2025 09:18:39 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3a54700a463so1335293f8f.1
 for <qemu-arm@nongnu.org>; Fri, 25 Jul 2025 06:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753449515; x=1754054315; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=l/fasLajEXfR8f6aYZdkSFrtQoIABhB180kDg2jNhno=;
 b=DTpXbKY7Gsxr4K3WHC/3Z1PgcPXdiV3F7bnvcMq3Wdu4GUJ3D7rW3evlngH0LotGuc
 Lx0Za0kwUxui+6KpwtYhLI5CXm5Vl57OfhACrTtjgwSr5hLBZ9IXiGjvGXrC30eM347G
 Yl7Q6Pzh526VidgZy55lvf/dN+U8cja85/OuqM1gBLmT1652PC6MbTw1cdZ4yOjeESdh
 E2YKKdRtfTgRKpWxCvb8qY8ZPjQaTkVHBVbyJGyQlQRQhNB5XvCMUv0UAQ9NvXpciA/E
 fWOKEIum7kehG6yQgsSpF7HOplgMYdGDToGV49dNG2VhTpwgOM1dc7S6y0jMUxHkeU33
 f9AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753449515; x=1754054315;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=l/fasLajEXfR8f6aYZdkSFrtQoIABhB180kDg2jNhno=;
 b=LwMIEFf1e0rKszH5DdVHAvzrNOS/nM9HaXuSEemGl+Mx8je7nKmojUXPHgmr7rtH8a
 +mftRtJJeBMrfZ1wDcKp9ItFtYHDhAUDMNYmXwQqb5gJusx2uS64QSxfA4+4Rg3WGNF2
 zV5KDbjvwYG29J19dnalPvKcaTU1daCT4q759oHz0NjxvRVHYRN0GTMMXPjmMpmGkxf+
 8j8icez/+O6zCwhY0kfRy0Ov0y6PDi4mwMQqRUbcvmyktWdy34we/mMXTpI4zv5VQ2ws
 i2jGHrOBZ96YvCvClfn+p+eqDb1BuJrEUN0Ui7FPIirjHXwL8uQ+3gYe1wO3PNlgZlOf
 hbXg==
X-Gm-Message-State: AOJu0YwYjCqSmXd60XbubcK2b5KeC/mcJTjCfilzjUlKhG2YcP548G8q
 eIfzM6KDMO8WVMTSElYrBgHyqQPw5JfQ93dEI6v2F9PWfzP+e0IgFhjDEHgPpHGXpzQ=
X-Gm-Gg: ASbGncv52dTAydDxJxKjr7nhRGJpUuUjEdIWAzFoKpxzKVYhsoAno8gp0snLvCM9fZC
 VzQad1dHsbJSCpejuyb5pMqX8biYj8wPVjh2+hbg4+jToW+hcRC98vmI4r1YLz1ympwXLYvQcL/
 uwHFLJvIR+VPlUzFoU2dEg14lp3SnJrX6axkzz9CFXv1c+ti3X9Dsh0/RVrAAVk+9mQ/GiL4svO
 bsW4viimbvOoGqsSvW8jBAKH3yvMoPy89y5V/0XG/OLt9qRI+HmH7S9Y9uZf5z1y1OEGJbo5eoG
 jA2b3rjzEA5C1VelvIgIiGUV6QMQjckl/eCkoWBaf0W2YEAhIx9J6voEX01Gc4MpRy+9yM42Ehb
 iN2BzCT5wSOSC6dbacCtVD7//lqTOnOExfiee2EYkL0y3XXzg8XA1klLPmq5skKRjKQ==
X-Google-Smtp-Source: AGHT+IGYZ6x/pz3Cm6CCCp3XNwtOo89b8BDosvEZ581wOiUG0k7YNRWpmLxxySb4Mc+0jSwm/4JC1g==
X-Received: by 2002:a05:6000:1ac5:b0:3b4:9ade:4e8a with SMTP id
 ffacd0b85a97d-3b77666023fmr2354242f8f.21.1753449515312; 
 Fri, 25 Jul 2025 06:18:35 -0700 (PDT)
Received: from [192.168.69.209] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b76fcb87b9sm4952974f8f.66.2025.07.25.06.18.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Jul 2025 06:18:34 -0700 (PDT)
Message-ID: <17254b66-4902-4ee0-8c9a-4082146255e3@linaro.org>
Date: Fri, 25 Jul 2025 15:18:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/arm: Clean up of register field definitions
To: Gustavo Romero <gustavo.romero@linaro.org>, qemu-devel@nongnu.org,
 peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, alex.bennee@linaro.org
References: <20250725014755.2122579-1-gustavo.romero@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250725014755.2122579-1-gustavo.romero@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi Gustavo,

On 25/7/25 03:47, Gustavo Romero wrote:
> Clean up the definitions of NSW and NSA fields in the VTCR register.
> These two fields are already defined properly using FIELD() so they are
> actually duplications. Also, define the NSW and NSA fields in the
> VSTCR register using FIELD() and remove their definitions based on VTCR
> fields.
> 
> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
> ---
>   target/arm/internals.h | 8 +++-----
>   target/arm/ptw.c       | 8 ++++----
>   2 files changed, 7 insertions(+), 9 deletions(-)
> 
> diff --git a/target/arm/internals.h b/target/arm/internals.h
> index c4765e4489..052f7b641c 100644
> --- a/target/arm/internals.h
> +++ b/target/arm/internals.h
> @@ -113,11 +113,6 @@ FIELD(DBGWCR, WT, 20, 1)
>   FIELD(DBGWCR, MASK, 24, 5)
>   FIELD(DBGWCR, SSCE, 29, 1)
>   
> -#define VTCR_NSW (1u << 29)
> -#define VTCR_NSA (1u << 30)
> -#define VSTCR_SW VTCR_NSW
> -#define VSTCR_SA VTCR_NSA
> -
>   /* Bit definitions for CPACR (AArch32 only) */
>   FIELD(CPACR, CP10, 20, 2)
>   FIELD(CPACR, CP11, 22, 2)
> @@ -220,6 +215,9 @@ FIELD(VTCR, NSA, 30, 1)
>   FIELD(VTCR, DS, 32, 1)
>   FIELD(VTCR, SL2, 33, 1)
>   
> +FIELD(VSTCR, SW, 29, 1)
> +FIELD(VSTCR, SA, 30, 1)
> +
>   #define HCRX_ENAS0    (1ULL << 0)
>   #define HCRX_ENALS    (1ULL << 1)
>   #define HCRX_ENASR    (1ULL << 2)
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index 561bf2678e..ed5c728eab 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -193,9 +193,9 @@ static ARMMMUIdx ptw_idx_for_stage_2(CPUARMState *env, ARMMMUIdx stage2idx)
>           return ARMMMUIdx_Phys_Realm;
>       case ARMSS_Secure:
>           if (stage2idx == ARMMMUIdx_Stage2_S) {
> -            s2walk_secure = !(env->cp15.vstcr_el2 & VSTCR_SW);
> +            s2walk_secure = !(env->cp15.vstcr_el2 & R_VSTCR_SW_MASK);

FYI register API provides helper macros:

             s2walk_secure = !FIELD_EX32(env->cp15.vstcr_el2, VSTCR, SW);


