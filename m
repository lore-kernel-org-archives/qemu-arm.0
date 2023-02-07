Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp5880564ejb;
        Tue, 7 Feb 2023 15:10:38 -0800 (PST)
X-Google-Smtp-Source: AK7set/Mreb20431u3R+lLQKVKmPMbn8ZZy5zDA6OdkMDQIlBL/zNza4R14RsW3JKhVqaEhXankw
X-Received: by 2002:ac8:7d84:0:b0:3a5:ff6e:d425 with SMTP id c4-20020ac87d84000000b003a5ff6ed425mr8522972qtd.4.1675811438762;
        Tue, 07 Feb 2023 15:10:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675811438; cv=none;
        d=google.com; s=arc-20160816;
        b=Xj1hGpPSAVj09WqTCTnFPPEblJMHFotqGeenACBtJuOybTMRCjYrEa8k3FT86N5DN+
         6orW6DGD2UpJcgFGsz+VUjSJ0flwsFfc04dyhzUVdClCbl7EhPEUtU0MQDRFpiRVAJDP
         wBLj6mjye2TRp4+ysraJlqbPrNzPs7tbbjrOqWe2wafI6DZUXEMfqvMyB+XMQiJVsryX
         y/rO/4B03Quyy9zkDQ1sC92+h/ZVeGJ52Gla20PnQunYzGlYfL1JNgvc1zw5JgXcewWI
         EwFccNs6eKzp1XkCYeKgMgu7fcT8r/8exqauBTww8CL5UYtd9d6we+LU++qAecPCcYcD
         ys3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=yW7AlBISalG9B0unzR7dsrdlUidqD5I857xFsauACZo=;
        b=XsuVwvH4SEXzTlWbO8BMySSk0QGd7vsW2wdcVNdReS20oT7O5B43BwtahbAcR/d+jc
         TviHunFbMRyRHJRPDPlIsqDxyIzjfDlg2DVa31TQwsGBxffLdD9wXMxURae5HEvZdgey
         /sRQPFipQ0/bfHuvTseJRdQhr9VNU9dOb5CBXbUvUISjB6jNjGRGkSo7VJWsFgAYNuys
         4Fbllkeg+5RXOc2XZKjpE7MHppYjCWcPco7XfCDPE/32a0kCwRS5mtSA1/j+Uf+AKcLN
         X4VVLiCoG8Jl7R3FSNd0/4ZHMuK/uj/6dq+jyXETfFGzwe7IB2ksNHSfbYsydqWjr89U
         UAyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YH3SOWuo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 195-20020a3707cc000000b006fa28c50e1asi11428181qkh.645.2023.02.07.15.10.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Feb 2023 15:10:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YH3SOWuo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pPX6S-0002l5-L4; Tue, 07 Feb 2023 18:10:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pPX6N-0002dq-I8
 for qemu-arm@nongnu.org; Tue, 07 Feb 2023 18:10:15 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pPX6L-0006VV-01
 for qemu-arm@nongnu.org; Tue, 07 Feb 2023 18:10:15 -0500
Received: by mail-pl1-x62a.google.com with SMTP id i2so3927030ple.13
 for <qemu-arm@nongnu.org>; Tue, 07 Feb 2023 15:10:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yW7AlBISalG9B0unzR7dsrdlUidqD5I857xFsauACZo=;
 b=YH3SOWuoPQQxl40uThnOxCZiTOirbUfoa/egAwFP2dB/qYCxUWbLp3k6Axm0wpNm/D
 LjS0KHKe1uBylOJzDJhQVddqIzLts6CoTg4kTjWpJxVlC4Enz5+YmguBUmqOPVWYFj9x
 WLSulu0GkkiLMuiW5o7Xlz9l8HUbVwdqsv2BxDImwSLdXZ0I3y7r+5vWMZtAPG4+ko3+
 njavsbPEUxfsKBMBC/yk9nsMg5drCysMh7HFLvA3YB0Ln8X59XZLbQGXifnFJhuGrtuc
 ++XUyqKMacdUEpuxbN45XqpueFccSe2OrJ2bQ6cxJRpJ0Pe+ozkYSMLwTnX0BAy6odBu
 e1bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yW7AlBISalG9B0unzR7dsrdlUidqD5I857xFsauACZo=;
 b=mTxZQlS5C1V0dNpsrjUDPEFORm2zE8tD8DjBz/svG2JRKevwTEUctwaP8rVoAYdvbY
 tlWO6cDgAPxzwr29oB/RkD0QCf9DxgHdmEme3yl9hISjJHSByTFdmVZIgprCJUx+0H4F
 wpGP+9oGOCxhDcVaffnVtPVsO6MwADOKVr7jznT+fn1XFGUL3uo+nvkW4VJZx8i8uJdt
 cpfMWhFxk/yYeuXrsQvUWEcwfKt5otYSH35q/3RaQZ25Ww7ifZfOEHzw8a7wchkgn35X
 61R99wiELHzvL20ttP0yiAVyUhFn4RzrpcikJvW+fE+ZFKPITg0yLlEU/ioNSVrnJRZY
 E6dg==
X-Gm-Message-State: AO0yUKVI7r0d6VVX/tYE0/q7TGG31yVBEH/3TZUCZqby45hAEPaI6Sa4
 979+fMURROzsFj9LVz/98lrQZQ==
X-Received: by 2002:a17:90a:1901:b0:230:b976:42cc with SMTP id
 1-20020a17090a190100b00230b97642ccmr5978417pjg.16.1675811411283; 
 Tue, 07 Feb 2023 15:10:11 -0800 (PST)
Received: from [192.168.101.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 q43-20020a17090a17ae00b0022be7a9e196sm95370pja.1.2023.02.07.15.10.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 15:10:10 -0800 (PST)
Message-ID: <9e40464b-9349-d9bf-7347-bc1bdf06ca93@linaro.org>
Date: Tue, 7 Feb 2023 13:10:06 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 09/11] target/arm: Restrict CPUARMState::nvic to sysemu
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230206223502.25122-1-philmd@linaro.org>
 <20230206223502.25122-10-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230206223502.25122-10-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 9ZeBoe6gwhRP

On 2/6/23 12:35, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/arm/cpu.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
