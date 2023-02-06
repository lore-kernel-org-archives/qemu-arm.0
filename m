Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp4477020ejb;
        Mon, 6 Feb 2023 10:56:17 -0800 (PST)
X-Google-Smtp-Source: AK7set9cifbzd/rbP3Y0c81YjWyQwvzLYAwh/o2U1VJMesOyHwrJ/gF7HVDyyp+6tidQFDZCT0w6
X-Received: by 2002:a05:6214:29cd:b0:56b:fadf:d02c with SMTP id gh13-20020a05621429cd00b0056bfadfd02cmr162352qvb.33.1675709777768;
        Mon, 06 Feb 2023 10:56:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675709777; cv=none;
        d=google.com; s=arc-20160816;
        b=jsRBOHxUZU5QZ4SNJtA4DrBep7ufqLIYnfzIXpYnQmXmRU6YZ4p9y7/7OVaoHotULH
         GAhITx4ughN7+oDDhBrti9MGu9bsw16nkQgWeL0iq1nOL2KiJP60aDq2+BJvYbPC5XQo
         sLPsyylfPJG9vqK5A7fVFM0s8366k/cvkxgL13OefSVXFFVxX0rSBUPYtjqo9ev4KQc0
         21nfXEP7qX6FJIyxJV2zkyJlYtolXhsEfkk7QbK6ioCSaqJ5gqQPgnA/RKqneKS/kJ22
         spZxntdp8JadId8dYhs7e8Dcki3l0/Q0eqEGMjXPLo8V5QL61r+T0vGgy3+ZyVo/ys2k
         WnVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Q478AxlTUaHNPjJfTzgp+5LnAX8emdR6WXcGf+alPSQ=;
        b=Y2HtHUmiVbC4NEqoGqW+MRux2Zz2Hh4RAM+RMONN6NF1VyjwXX+B3TXA5e+xdeN54B
         ZM88rjcNNLoRCG+PYK0NEORcVzfJ/DhDyztWjGfyqpEvML8UBg6YjQIj55S1bv5KrB0w
         MoiQNarvzOm1ertaJgCJzlvum3RKhibzyWTOZ/A9U0jYl+zv8NfFxYcYjEgCoNDwrhRS
         DQR+p4oDP/Ha4dtv1yuRR/yCSlofKKtKuVvCCEIINDKydlrBxy23aejV3MRMTynqSN6w
         FGM0RswCdvkAiYjBzUSIQbGpB1eXmlTpS+4+LDJoVLTD1SQx0lr07TrrkvfQWvq+RNA5
         09TA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vyEm3niV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id om6-20020a0562143d8600b0053c64c47019si8907300qvb.55.2023.02.06.10.56.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Feb 2023 10:56:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vyEm3niV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pP6bm-0004y8-UD; Mon, 06 Feb 2023 13:52:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pP6bl-0004xD-4B
 for qemu-arm@nongnu.org; Mon, 06 Feb 2023 13:52:53 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pP6bj-0005Tq-IW
 for qemu-arm@nongnu.org; Mon, 06 Feb 2023 13:52:52 -0500
Received: by mail-pl1-x62e.google.com with SMTP id b5so13170676plz.5
 for <qemu-arm@nongnu.org>; Mon, 06 Feb 2023 10:52:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Q478AxlTUaHNPjJfTzgp+5LnAX8emdR6WXcGf+alPSQ=;
 b=vyEm3niVCPZ68K4soHeVmTUTbeTlBIJbE1B05ntE3cQKk5AbSesszC0cH1zI96R/TC
 JFJV860rraKcV6OF9+4yY5U64KT4NwPM+0ooTyNS4BNS2X2bZnIkJxQDhk6cPXDajlX+
 K9WbGKQYBWLLD1I3j+mcilRGLVPpS0u6fjRbiE4zL3HXLM8KTOft1H3E3D+4id2iRXzO
 /LJBmriZlayJ8o8PeSW07IJwoT8B3S4sKQmADYbwJTVHjze1aU6u89dPcrurPwW14d+h
 oTPoDSUQmdDGEDPSp7owUwneDiPK9woesCLFfbIljnB/g5dqmQ8bRxL2WSTgvBXXlxiN
 +A0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Q478AxlTUaHNPjJfTzgp+5LnAX8emdR6WXcGf+alPSQ=;
 b=oKy3+3DwiKW4FpsqZqFU0phOonMOhNLJSmxFZ/q3bBJlaemoN8XOKTB+v6wGdYK5xg
 JYH9y0CRXVKOuVKiZko6K9LrTuGrhd2f84DD/FuIqVEly8oxcg3FSdehqHWLNUIs6gTH
 p+6mlXrLjZVKcc9Dt3tF6TDykiOj8X/66yCc3I4avQ/F2mR/VG55ibJosEvU+FYtR0ca
 TkV3Rsocnw0WP0oGjaZACeb+VQ6VTArKx/oaFdt2Vv5se63yxZlr/7cWzZo5uTKjvapE
 PDRHj0lRXgj7bx8rsn0IYHYknncJ/2HcHRxUYzIRWsS6/jqTzcm87gC4ZIiVTMIARjie
 odbg==
X-Gm-Message-State: AO0yUKXym9QQYJ2Mog8i/ZdWV7HJrFhz03t17GJBIbnB8/stpQS2OZ9J
 ruw6YDDHjWXTz6fOqD9ZLxQGCHedFYJgSgpb+fJCLw==
X-Received: by 2002:a17:902:e3c1:b0:199:18ac:cd33 with SMTP id
 r1-20020a170902e3c100b0019918accd33mr3640879ple.33.1675709570109; 
 Mon, 06 Feb 2023 10:52:50 -0800 (PST)
Received: from [192.168.101.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 v3-20020a170902e8c300b0019602274208sm6653087plg.186.2023.02.06.10.52.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 10:52:49 -0800 (PST)
Message-ID: <bc6354f6-6e25-fc68-5982-054299b0c3c1@linaro.org>
Date: Mon, 6 Feb 2023 08:52:46 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 4/9] target/arm: Restrict CPUARMState::arm_boot_info to
 sysemu
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20230206121714.85084-1-philmd@linaro.org>
 <20230206121714.85084-5-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230206121714.85084-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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
X-TUID: 4N1vcQMVcghF

On 2/6/23 02:17, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/arm/cpu.h | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index bbbcf2e153..01d478e9ce 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -770,9 +770,10 @@ typedef struct CPUArchState {
>   #if defined(CONFIG_USER_ONLY)
>       /* For usermode syscall translation.  */
>       int eabi;
> +#else
> +    const struct arm_boot_info *boot_info;
>   #endif
>       void *nvic;
> -    const struct arm_boot_info *boot_info;
>       /* Store GICv3CPUState to access from this struct */
>       void *gicv3state;
>   

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
