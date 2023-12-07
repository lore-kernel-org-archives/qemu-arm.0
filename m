Received: by 2002:a17:906:fa94:b0:a1c:d2de:9065 with SMTP id lt20csp1929774ejb;
        Thu, 7 Dec 2023 14:07:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE8CnVwGsIRR9uHzKa1pHgNPC/J052EGQwQx+USHZMz9BZmTg8QaBwuqyEPDDHY2/wLrlFH
X-Received: by 2002:a05:620a:4090:b0:77e:fbba:6452 with SMTP id f16-20020a05620a409000b0077efbba6452mr3017842qko.49.1701986826021;
        Thu, 07 Dec 2023 14:07:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701986826; cv=none;
        d=google.com; s=arc-20160816;
        b=xZJ0CxJscs5u0zPDwFmXT0HaPHvb6yszUDPIlV+EYJ3befZD8Ooked0EqTag7qW6Uf
         5Lq/M2ZvWnC7e+JicNMaYelsKsWmRiSgfoZtiO6Cmn735eJSsY6nx7YAWnDd8T1OtQC+
         hxAgVD4+fgoYf1qsjVbar3JFVFfC1byWZ8QW/hF2OMGn6XGL/HxrV1GZRozBewi+jZEd
         H4NJ+arwF2PB5+s6k8BVYZ9CyIWUdWTK3eW9WmZdwMDL85GNpRfw8O+joiHAl5n/r5NN
         tkoUpVL/pdQkPE8B0EmttxNgF22XkpnBfOytd5HDvAT4dG0syS8wROLY/w8PXv3MlHIH
         s9TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=XOLSNqz1Z//fWhFPF97FKqMWTL6arVuM5heVLCwjf28=;
        fh=84KY1J7FJJGslRkG7yjQRx+I8Qn8QbTjdaXSfOowZRU=;
        b=LXYJWvSf0WubGVk3Uiqvg2ROn+x+vrUBP2r5HjudxI2T9D+KDffDfs3dbVGZ6rojki
         moN2pB6D2s+RJAR4hB+Au0ZW/qFyhRyMWNeF3PkoZv6QxBvE27RuqR0SzetpQ8AEPY7b
         R0PQI/wArx1cwh02GW3v+0BmF0r1mLhiwpWbjVSCmTnqyhiaJyBtQcnu08GvjCXvzHzl
         Fa3KpX0hBTBZg/3kZb3N3u0MsyPQMnMpwy3GFRJ8iyZHp6u3b0ua4hf96VAkf+Wbjn6j
         sPXhyXPYsLAGAdh6nlaqMiGM83oKmUS98MNGpmf8jKSlWBYIQdc1kKTbaCB/brUAIjwp
         ii1g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GMEt1muq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bl13-20020a05620a1a8d00b0077f0afe9b46si733945qkb.275.2023.12.07.14.07.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Dec 2023 14:07:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GMEt1muq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rBMVk-0007sm-Bp; Thu, 07 Dec 2023 17:06:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rBMVh-0007sb-UV
 for qemu-devel@nongnu.org; Thu, 07 Dec 2023 17:06:21 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rBMVg-0001Pt-CA
 for qemu-devel@nongnu.org; Thu, 07 Dec 2023 17:06:21 -0500
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1d075392ff6so11624465ad.1
 for <qemu-devel@nongnu.org>; Thu, 07 Dec 2023 14:06:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701986778; x=1702591578; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XOLSNqz1Z//fWhFPF97FKqMWTL6arVuM5heVLCwjf28=;
 b=GMEt1muqNAfsnircJ6pqn/ffOyb3SuzdEOQ9LXVK74pmg306kXWXuTxWAUGzBmBk1P
 4APbwo8c4CqTlzXSWRqU6/IRImQpI4+Ie+A+Ng0iJRgftbevT7sMqk6mcCHNpTZb/N/z
 qkdhukjmgYXfEjvc9qLiVFA2/vCyuRnxhzIe33XYVG8CwvFmdOFg5lj8KT0z9mHsUqjx
 pOU1QcqQTJq8ueR/SnbwCf6cKl9GjEmJu/wmLQ1GZZe+UgI9/J3C7ZkBtgzX+rEwItbd
 FlN8ZziE1r+dmJOvc+BBbhQfIRHKeKld40aM8S7mAVat1+41WxnSBnr5glP7TkSBii/6
 Xiug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701986778; x=1702591578;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XOLSNqz1Z//fWhFPF97FKqMWTL6arVuM5heVLCwjf28=;
 b=Vgpew1zg/7tpRBRSXVJ+mv2/tJaWRmRDVcQPLcaLAn70QGp/2dwfpaCUWYtog8bWMu
 vKDkuWQ/+iXto1zmgH6eXhq2tdBntvApDlvjcozSzovLRQuJ8Nvci25A2y7k71gzWqiv
 WLLCy5sHywg+gJcEaelCNQwS3S5dzV+3+/DTFZ9+03nVIAWwv8UZtA9VOM/Ged+ORws+
 PndGOwHwV9g4wO8kWGrw49iHCfOIpYV1wR77vJDsQu+jx1jv+3pMMlBdG/IEl8Ciuas9
 4/nFZi0vkXnQpUCzors38toBTo4esGJ3bo/Efk3K2fMuVRcHA8yqZSMhqcAfppIVm6z0
 f48w==
X-Gm-Message-State: AOJu0YyZjVFRP5ZpNgder7XWgBOSQeU+RmxdW5p4OCvBnwRJ6tHOq5D3
 eTC2EQFYKMb4EQkLNKkmHJmRXQ==
X-Received: by 2002:a17:902:e80f:b0:1d0:6cfd:d3c4 with SMTP id
 u15-20020a170902e80f00b001d06cfdd3c4mr4480662plg.17.1701986777839; 
 Thu, 07 Dec 2023 14:06:17 -0800 (PST)
Received: from [192.168.0.4] ([71.212.149.95])
 by smtp.gmail.com with ESMTPSA id
 k9-20020a170902c40900b001bc676df6a9sm298617plk.132.2023.12.07.14.06.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Dec 2023 14:06:17 -0800 (PST)
Message-ID: <eb416878-5f5e-4ff1-8c4b-35cbf70809ca@linaro.org>
Date: Thu, 7 Dec 2023 14:06:15 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] sysemu/cpu-timers: Introduce ICountMode enumerator
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Fam Zheng <fam@euphon.net>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-block@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20231207154550.65087-1-philmd@linaro.org>
 <20231207154550.65087-2-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231207154550.65087-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ZNfXB6NSgCEk

On 12/7/23 07:45, Philippe Mathieu-Daudé wrote:
> Rather than having to lookup for what the 0, 1, 2, ...
> icount values are, use a enum definition.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/sysemu/cpu-timers.h | 20 +++++++++++++-------
>   accel/tcg/icount-common.c   | 16 +++++++---------
>   stubs/icount.c              |  2 +-
>   system/cpu-timers.c         |  2 +-
>   target/arm/helper.c         |  3 ++-
>   5 files changed, 24 insertions(+), 19 deletions(-)
> 
> diff --git a/include/sysemu/cpu-timers.h b/include/sysemu/cpu-timers.h
> index 2e786fe7fb..e909ffae47 100644
> --- a/include/sysemu/cpu-timers.h
> +++ b/include/sysemu/cpu-timers.h
> @@ -17,18 +17,24 @@ void cpu_timers_init(void);
>   
>   /* icount - Instruction Counter API */
>   
> -/*
> - * icount enablement state:
> +/**
> + * ICountMode: icount enablement state:
>    *
> - * 0 = Disabled - Do not count executed instructions.
> - * 1 = Enabled - Fixed conversion of insn to ns via "shift" option
> - * 2 = Enabled - Runtime adaptive algorithm to compute shift
> + * @ICOUNT_DISABLED: Disabled - Do not count executed instructions.
> + * @ICOUNT_PRECISE: Enabled - Fixed conversion of insn to ns via "shift" option
> + * @ICOUNT_ADAPTATIVE: Enabled - Runtime adaptive algorithm to compute shift
>    */
> +typedef enum {
> +    ICOUNT_DISABLED = 0,
> +    ICOUNT_PRECISE = 1,
> +    ICOUNT_ADAPTATIVE = 2,

No need for the assignments.  Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
