Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp5376614ejc;
        Mon, 6 Mar 2023 18:25:06 -0800 (PST)
X-Google-Smtp-Source: AK7set9kLaEcdllR3gfrNiB4TaEYLBW+THRKneg5wgHFC71IuBjmUmdQGQ4vWG2Tre8IZ+r2uNXs
X-Received: by 2002:ad4:5ba7:0:b0:56b:ee46:5c3c with SMTP id 7-20020ad45ba7000000b0056bee465c3cmr20884423qvq.49.1678155906419;
        Mon, 06 Mar 2023 18:25:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678155906; cv=none;
        d=google.com; s=arc-20160816;
        b=RZ2qluT82MR5Of9wHpta0D8N2Onh2wjt6MHIVqeDfsge/+bUiF+ubz/H2MtCc6XCbb
         tKzNIwndWFSek9io0PvhfsfC24tGikXbj59lD5Nvks1xde6kk1hBTubKWNHxnB1BEiZA
         Jh6wF9aJpuTEW3RAX+shsmaqyXTtDGaOhZwdiWj0xgfg7/RAYezRJpt7XzJzDWutdLmt
         YaA+FPVuPJV3uaY0XGx9Bmjk+b7MIDqXBTHeMgFYjHCT/nTCYxZAhMroscVoo96WMuwk
         F76X3zHEqE56y/TFHgPNu1Fy1uPEAo35RYr9bN/RDoaj0HsPL6WuPRCFXsedIff0A/PY
         XyVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=dExFf6s3Ic3QnTf7cCF6RvMH66LT8iARfR05LVi+wy8=;
        b=dUDK3ppNsyADndxdakgKUdNSG9JgH8lV7p3bRI5h/XkJiFVuA6LQ7RQuT1g1Pdfzto
         FQonzN3Lc8B0cLNhjAxpljvoKHUodLqO1/dWC1espX829Nj4IcGt66bb0zZNKELi9o60
         Wh3VRVH9fQY9DQvNfXm2KvsStVRl+z+mVBMRCcGR1HU7jkHTaXt+aoMrb/sz1jJ5QSf4
         LhBR9ylB6fv2YL7y7Q6hc/muYSSb0+QHUq78YTEh8oyHI8s5Hv1eISxs7gmthIyVuPmb
         in/onXwy5TLf3msyJtmcLBNv6GpUz94tNCNRa+8z4Wh/hLZWD86Jk2TpGkqJGS9QQ946
         JESQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="q0s01l/R";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q9-20020a0cf5c9000000b0056eda581394si8718572qvm.46.2023.03.06.18.25.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Mar 2023 18:25:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="q0s01l/R";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pZN0G-0005Tw-Nj; Mon, 06 Mar 2023 21:24:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZN0F-0005TV-Ko
 for qemu-arm@nongnu.org; Mon, 06 Mar 2023 21:24:35 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZN0E-0008Ke-22
 for qemu-arm@nongnu.org; Mon, 06 Mar 2023 21:24:35 -0500
Received: by mail-pl1-x62c.google.com with SMTP id x11so8095748pln.12
 for <qemu-arm@nongnu.org>; Mon, 06 Mar 2023 18:24:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678155872;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dExFf6s3Ic3QnTf7cCF6RvMH66LT8iARfR05LVi+wy8=;
 b=q0s01l/R2fa/mSwI7Tye7X+Z8Adf24rSUZ8BUvQoSMH4dfhCw9EHp/Srt61j1l2QZ7
 6qpO3ARAFpwuzIXQBCY6HG/fg/ZofEjvA9Dk2AGLape1L6+IzoRjkV8PtJiNucrS4Wwm
 Qr3kW4lhE8V+oK9iQtIjIIeVyzh8LUXq2WZm0iX2yECU/vgANWPFYzfU2zGYqbEL/keD
 f5OJRZcp6f+epcojlZ0knO3k+SFn8AX6+QfbcInRzFi6nID/9o/UBEA9F7cMZj28Bfrm
 AH0WyHR6ansQZ8fCNVuMBAmz56tr1xs2W1q4yM33wEi8QsSO8OEo0vIauE/qDpCVHCq6
 J+uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678155872;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dExFf6s3Ic3QnTf7cCF6RvMH66LT8iARfR05LVi+wy8=;
 b=x4D2CHtnnaJCUfut/Pm2l7CYn9xwIHA0SMXVs0E0WoFsA5oyxGcKGN93MqPtMgK+Q4
 NBv5prZFNgkpr0jJk+UJWGyyxucoEC3W1egUI30CfiYaJivTMSgOTTCEeyyAmjbSS5gS
 K5SsE2smSLLNjfi4v1Tuul5L5wkVJ3B3Wc3UQptK9ufIIISChLJnsMc4wkkkIDSvs47l
 YscOwA87SnVjEzi7/a/XxiZm8lKEHeWO9e+Hsw7zkH1p1Yg/u0hk9T84laExBVUFJiVp
 zjqOL0Q5karBgY4e1hfc5cevqVslpRXRWiYEzhlJdQWW7fyWZHqz/6oPmxkGo/sKED1e
 s+FQ==
X-Gm-Message-State: AO0yUKV/T+jc+YIAU2etMqv8gsXdrj1lem7+i4ydr44TbLYXHrXUrzjl
 SD78uRaTxF0NwWZU9E7IRdvyeg==
X-Received: by 2002:a17:90b:38c7:b0:234:b03:5a70 with SMTP id
 nn7-20020a17090b38c700b002340b035a70mr13515969pjb.35.1678155872413; 
 Mon, 06 Mar 2023 18:24:32 -0800 (PST)
Received: from ?IPV6:2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb?
 ([2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb])
 by smtp.gmail.com with ESMTPSA id
 h2-20020a17090a648200b002375c356b0csm6484537pjj.19.2023.03.06.18.24.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 18:24:31 -0800 (PST)
Message-ID: <fb9062cf-3a01-9b6e-669f-a6ae2c10c25b@linaro.org>
Date: Mon, 6 Mar 2023 18:24:29 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 56/70] target/tricore: Split t_n as constant from temp as
 variable
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-57-richard.henderson@linaro.org>
 <38504dfd-e253-0efe-2188-b4b43a7bffe2@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <38504dfd-e253-0efe-2188-b4b43a7bffe2@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-TUID: CXGncGsktmT/

On 3/6/23 16:19, Philippe Mathieu-Daudé wrote:
> On 27/2/23 06:42, Richard Henderson wrote:
>> As required, allocate temp separately.
> 
> Hmm not quite accurate; this patch contains functions
> which don't require separate temp and belong to the
> next "All remaining uses are strictly read-only."
> patch.

But they're all renaming, in the similar contexts.
That's what I meant by "As required...".


r~
