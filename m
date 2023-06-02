Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp1036477ejb;
        Fri, 2 Jun 2023 03:28:00 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4m48e8DlezjMNQtg9+rIbQvC/u7nUGuT4X1Jo+okO4VMsJvbAmqfs+fdU7OdBr+8AyIg03
X-Received: by 2002:ac8:5993:0:b0:3f7:f9e2:7187 with SMTP id e19-20020ac85993000000b003f7f9e27187mr15189775qte.7.1685701680034;
        Fri, 02 Jun 2023 03:28:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685701680; cv=none;
        d=google.com; s=arc-20160816;
        b=zAoc3FahwYHWJBLeAB5K8rwZ0imyhjKAMB5Mz3/uIknTOl7lFoISrLT6mUQ3z1J8rT
         L+0TPMbhOUJASo0UFfC26kDgUB0+HMJILMQHfG4ixFctBX0ucXzmR0pScAod61lQDWNj
         5+YTXIq4cLyI1LNEwnnc8UHTZ8XVysL8/z/CavhIOIn/JjKZxdigMSZL9FdJRuuHh7dn
         5BIFZUAcIrjOAqi6CbKsEhemz2g56Gt1hON7luaXILcZkCKMoogyPzWjx8pECezp1gSU
         DqoeTSAJPv8Bh/iN8PQqx2r4OI4mt2eAIxQcy7aj4tW4XnBzSB7ZbK+Pil1S7/1Ceaa6
         ah0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=HJ/pVCCuC9iawE4p6hPvBzjdsnRt0g4k19hTi247k6U=;
        b=VHuZ5WWSM71dWKpvX7IYtnfMz1cTiAU9rMdXWTiKcbpmyD5Rwqp8QfSd7tPDdWe0yA
         ZUs+bVJ9P/TY/wa5v7QVZUgJmBr8hrFdL7ObQQiGSaWERfXlGN+7OqqDRTkcUZcoHNjg
         MEjLWMioO/Qe2STlpPFjIfY5/GwD+RI4+JALwImuDY+sUGpyKmuInVxOMZ2z4qjbTWFS
         R0P4gt3XSMqj2lCfYoUbMOdYbFutBSjDA7Wxk7vF73qEmN8ZgBCgAQhYVg596EEVsjnv
         rdAMk3pmEvXmnHGTrxFMIT/Owlx9RxNzwfmHb2jfMzalaNBGK3BmH/ZRJh/+k/5G5hOr
         VCbg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=J01XcSOj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y15-20020a05622a004f00b003e644fd6856si586919qtw.166.2023.06.02.03.27.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Jun 2023 03:28:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=J01XcSOj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q520N-00023K-Jx; Fri, 02 Jun 2023 06:27:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q520G-00022o-P0
 for qemu-arm@nongnu.org; Fri, 02 Jun 2023 06:27:32 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q520F-0002ZW-2W
 for qemu-arm@nongnu.org; Fri, 02 Jun 2023 06:27:28 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-30aa1eb95a0so1923953f8f.1
 for <qemu-arm@nongnu.org>; Fri, 02 Jun 2023 03:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685701645; x=1688293645;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HJ/pVCCuC9iawE4p6hPvBzjdsnRt0g4k19hTi247k6U=;
 b=J01XcSOjYn0aKrCzt5c4QuJryYh3GuBBQ6E4h2X229xsNrANXJCVK1t8HjQtm4EslB
 FXNxkjUZui9H6oeezeIrK9jZTSlr15PnSDKUwl4mW09krUT3YXmc101RGkNKT12BZ86S
 a/Je+mIVldXIsNMxlizZRcBOlg9GQHl3Eu8PcyLYeqzdwEPP/FUlXMwkg9SQbR0Tam+5
 oaHRMgKsbVljHynd2qB/8hpdiaUPDmdjR0PXZ74ZVXg6n2JZVuw1uMT0JId1ujnepsSM
 mhUNOoYXddhSrT6VEfZgiM6CRt+SxZrhBWDR0LrwUi5xVgsBuuPD057FhWbXOsACkhGj
 NxSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685701645; x=1688293645;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HJ/pVCCuC9iawE4p6hPvBzjdsnRt0g4k19hTi247k6U=;
 b=fkIrk3uT5LDYRyPFM+SoqIPim9eupyRZQMlu5PZuoQjGAP3ZFPQQZ1ErWviGsRT2lQ
 sAHKOHOQevlXhNetQfvYVYkMt9BL8EPKc8lHwsq7FPk5AF518KNhHY4loeSa8vDU7C6e
 sjJmb9kvAhbbPAsNM8Y7YKx5xDXfe2LfhaKq46KR+EW7NnYwWN/o8Nsjz569r/8RC/3G
 ODCZidD17METDMKcaaZT0pOYZK8RzYIlti9Rz83a+hoOWb9Nx0zsl1NwQ1s4JvycKSY4
 xIzI28Kg0Lg4PIZAuia85V7S8bHlqBLFdqMgbLjSJ8aR1IxPHnyL9+g741ij04aImmJQ
 iLNQ==
X-Gm-Message-State: AC+VfDzFBnQOwOyVYIjhwL1snX9WTj5s0PySLk6L9oyQ67tU+3fPFKEt
 azD6TYavD7xW0S8uZCPdwJrDJQ==
X-Received: by 2002:a5d:52d2:0:b0:306:772:5c2e with SMTP id
 r18-20020a5d52d2000000b0030607725c2emr3441502wrv.70.1685701645391; 
 Fri, 02 Jun 2023 03:27:25 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.218.254])
 by smtp.gmail.com with ESMTPSA id
 b3-20020a5d4d83000000b0030c4d8930b1sm1255318wru.91.2023.06.02.03.27.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Jun 2023 03:27:24 -0700 (PDT)
Message-ID: <a48e823c-38ea-d5a3-af67-dc93dd6507ff@linaro.org>
Date: Fri, 2 Jun 2023 12:27:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH v4 1/2] target/arm: allow DC CVA[D]P in user mode emulation
Content-Language: en-US
To: Zhuojia Shen <chaosdefinition@hotmail.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org
References: <DS7PR12MB6309FD700EF00EF1EB541CA7AC49A@DS7PR12MB6309.namprd12.prod.outlook.com>
 <DS7PR12MB6309408A6BB4A469862CCA34AC49A@DS7PR12MB6309.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <DS7PR12MB6309408A6BB4A469862CCA34AC49A@DS7PR12MB6309.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: FKaN5lJyNOmq

On 2/6/23 00:11, Zhuojia Shen wrote:
> DC CVAP and DC CVADP instructions can be executed in EL0 on Linux,
> either directly when SCTLR_EL1.UCI == 1 or emulated by the kernel (see
> user_cache_maint_handler() in arch/arm64/kernel/traps.c).
> 
> This patch enables execution of the two instructions in user mode
> emulation.
> 
> Signed-off-by: Zhuojia Shen <chaosdefinition@hotmail.com>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/helper.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)


> -#ifndef CONFIG_USER_ONLY
>   static void dccvap_writefn(CPUARMState *env, const ARMCPRegInfo *opaque,
>                             uint64_t value)
>   {
> @@ -7420,6 +7419,7 @@ static void dccvap_writefn(CPUARMState *env, const ARMCPRegInfo *opaque,
>       /* This won't be crossing page boundaries */
>       haddr = probe_read(env, vaddr, dline_size, mem_idx, GETPC());
>       if (haddr) {
> +#ifndef CONFIG_USER_ONLY

This ifdef'ry placement is odd. Is it to silent a
unused-but-set-variable warning?

>           ram_addr_t offset;
>           MemoryRegion *mr;
> @@ -7430,6 +7430,7 @@ static void dccvap_writefn(CPUARMState *env, const ARMCPRegInfo *opaque,
>           if (mr) {
>               memory_region_writeback(mr, offset, dline_size);
>           }
> +#endif /*CONFIG_USER_ONLY*/
>       }
>   }
>   
> @@ -7448,7 +7449,6 @@ static const ARMCPRegInfo dcpodp_reg[] = {
>         .fgt = FGT_DCCVADP,
>         .accessfn = aa64_cacheop_poc_access, .writefn = dccvap_writefn },
>   };
> -#endif /*CONFIG_USER_ONLY*/

