Received: by 2002:a17:906:489:b0:a44:3ba0:e9d1 with SMTP id f9csp1334676eja;
        Fri, 1 Mar 2024 13:42:02 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWuK3NvJm2Rqzwuevea8s+l4IryhQGQMYTOxg2UjgxZFTUJM4tgpQEpnclNcNd5MY/rWiOoVXIDWs7q/81SbzFWirQB15/4
X-Google-Smtp-Source: AGHT+IFzSV09NerSMqov9Yg9CdbjW+x4mxTBDxtP37PjeIkE25Jy/a6YmncKv93+avp2WTnJqtZS
X-Received: by 2002:a05:6871:586:b0:220:932f:1a1b with SMTP id u6-20020a056871058600b00220932f1a1bmr2653169oan.10.1709329322532;
        Fri, 01 Mar 2024 13:42:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709329322; cv=none;
        d=google.com; s=arc-20160816;
        b=YKz4mS9i5/fERZulPzUc+dpEe7+FVJFUo7c6tLk2d8RjnAT7aARTQ7nqRZ4wiM0toG
         ughBm5FBtuHpKZXh7GuOBS0649ORCGW10mmJkc2HRZ9m/nuN/QF8W+qf5udPCbcQxM/u
         28JnA9AT+wpHp7yps+8DGfaO6OOkROuBm7sc1QdfCZfxzSW6+PCVQ2zOODz2CNQAA0pk
         YznBf+B9ZJq7zT8ujEP8D5CqYlpzD0+NDnc26AAhkH3/kq3ogcJNtvRlDHYu4usSVaPC
         XZSbj9LVrm3QsCJyiawX0Q90GTMSerquPqeeGZEkeO6sM+fcM46Ym1Z65fsQr+a4Mdjj
         Spnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=ZzZhDxlplHwia+1n13ggi/thEJy5BYwZCBwoJU9aC1U=;
        fh=Un5wg5XR3vKwItZLrGxiUnfHxZ9AF2dqkC/LC8FhGEA=;
        b=d7dFuhV8SfDF/UHMI4z5tbq8XQXvEPZA/bdbcGkPMMlU8Ew7lI7y7JYEgSuZ8/j3kW
         BEoEOROEpXKT3vz7IW7FqbmxueaRV6EfJlyLAUbhapmzvBErqJz+zjOpeCngCFyyOOv8
         3bwvjNFJzeLuIuj1kvskvghZCmglLCux/XZa9pue89wosorAbFLVGj3TIU/1ggGBUS3n
         DNLHCDm96VKr7GOa0PDZxNKxDvLGnOdVa0Zs4EeOQs0RoPpR9ScP5Rgq8NkivD/BW7Lc
         fr3tCAcfsPRokkCNGlShvA7gKdqwQP39CkafTmV71rHGWfHUEqSXsz7RZkLxxHdrcMR+
         zijQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zSYMPqUC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id xz20-20020a05620a5e1400b00787ec0d7144si4482865qkn.359.2024.03.01.13.42.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Mar 2024 13:42:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zSYMPqUC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rgAdR-0001an-Ib; Fri, 01 Mar 2024 16:41:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rgAdK-0001aL-04
 for qemu-devel@nongnu.org; Fri, 01 Mar 2024 16:41:39 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rgAdF-0005FZ-1G
 for qemu-devel@nongnu.org; Fri, 01 Mar 2024 16:41:33 -0500
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-6e4e7e25945so2281214b3a.1
 for <qemu-devel@nongnu.org>; Fri, 01 Mar 2024 13:41:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709329287; x=1709934087; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZzZhDxlplHwia+1n13ggi/thEJy5BYwZCBwoJU9aC1U=;
 b=zSYMPqUC3OcoRyH2gxcEawfElplyhS0sD2KpqpitJfHxZz+lsTBis1D10rBa6hMFwy
 T5x7gn2yybx0b2Y5Ej8a0M7uW+ffiiL36n7+ZikdR/UschbZPXo4K/bEQY4+OX/Dw2dQ
 zgh2bk0JN8NirY1lEW6kpqpyV1/D+IrtnjOhgAmTzlqK09xaQ2Lm1bVMh35/BQHS1nnL
 0usb8eUtl15ITh40WMweJS0AC5kOAJ4Ye27lmGz3TQAW2vEF615hoTJMGDIXrbrWqOhW
 TchCUSY8jOWkD6wCWR5cWouV/gHKa226QP5hirbUmWNpRfhKo1rwdbzM5FGYA+oGEMKP
 U8eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709329287; x=1709934087;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZzZhDxlplHwia+1n13ggi/thEJy5BYwZCBwoJU9aC1U=;
 b=qiHFfdoVNA5Gvcv8g7CEk+vwZBbBrF/tZ0VwYB2mXPcXQJ4aVhLr6GSR+6ubCVBarT
 D5CEZ31piXdbf0AvFWPgj9BdvrLe+3o8WSnFNSue7CfBBRw/i6qMOtmXEuN07melJWD8
 hfx9Jbw7JqOAzs+O/fvtF2Uzoof7rSiHpdoXjfD1VhEJ/0Oj1ZDEla089iB2530DAYnS
 2U45SUQ8APPRmylFZWfKpKtdvFygorVP9vIJpEvwwODEXLYB6aD0Hesp04axe63/yfeJ
 YpsxM0cvIMN0W8mZkfSinpH03Jl91Ekme5LjEjmSTw7d7tnYOk8QdaX/K88ciSgLv90+
 oGuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSGaQPWD/ti+lGo7xZGX1L18a0uSDWHj3tXQWXVQgSNCR2kMOH+MQ4+Nl4QXXb0xqIvjj4erICTJt8sIhNsL0u1GaBbtE=
X-Gm-Message-State: AOJu0Yz4J7wfN+PsmKlFcANbDV55Ybf8r6BrKhx6U0NtqFCxiHybDFmV
 wPM1IS2YgcBpLp/6lPnAnvWdduef47ibmu8OrO7mOn3sY0m57hRhPPGXrgXcfl/uhWNOH1oHeZK
 s
X-Received: by 2002:a05:6a20:7f8d:b0:1a1:2eb7:b6f8 with SMTP id
 d13-20020a056a207f8d00b001a12eb7b6f8mr2492796pzj.31.1709329287104; 
 Fri, 01 Mar 2024 13:41:27 -0800 (PST)
Received: from [192.168.6.128] (098-147-055-211.res.spectrum.com.
 [98.147.55.211]) by smtp.gmail.com with ESMTPSA id
 q5-20020a056a00084500b006e535914f9bsm3500666pfk.97.2024.03.01.13.41.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Mar 2024 13:41:26 -0800 (PST)
Message-ID: <d531f5f1-39d6-4693-b4d8-22327f7aa3b8@linaro.org>
Date: Fri, 1 Mar 2024 11:41:23 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] target/arm: Define CNTPCTSS_EL0 and CNTVCTSS_EL0
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20240301183219.2424889-1-peter.maydell@linaro.org>
 <20240301183219.2424889-7-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240301183219.2424889-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
X-TUID: GkQRJfFKCPJy

On 3/1/24 08:32, Peter Maydell wrote:
> For FEAT_ECV, new registers CNTPCTSS_EL0 and CNTVCTSS_EL0 are
> defined, which are "self-synchronized" views of the physical and
> virtual counts as seen in the CNTPCT_EL0 and CNTVCT_EL0 registers
> (meaning that no barriers are needed around accesses to them to
> ensure that reads of them do not occur speculatively and out-of-order
> with other instructions).
> 
> For QEMU, all our system registers are self-synchronized, so we can
> simply copy the existing implementation of CNTPCT_EL0 and CNTVCT_EL0
> to the new register encodings.
> 
> This means we now implement all the functionality required for
> ID_AA64MMFR0_EL1.ECV == 0b0001.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper.c | 43 +++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 43 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
