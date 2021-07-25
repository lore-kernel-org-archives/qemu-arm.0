Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp2247705lfc;
        Sun, 25 Jul 2021 11:20:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw0K/sxZhGjC5lEwaDxZhWnvOH+Ai1pPkplGHHsdNZziFqOgZTqhEt4IQrx/vDHkmPZfcVE
X-Received: by 2002:a05:6638:25c7:: with SMTP id u7mr13000928jat.26.1627237216093;
        Sun, 25 Jul 2021 11:20:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627237216; cv=none;
        d=google.com; s=arc-20160816;
        b=GLUD/6u6yzmweK3NyJVTvGQOBDv7LUSXlVX60GCht2AUqxurT8kNpNmaEl+eHc9wH3
         dDqewzWxDOBw3fFDP0FsCWVG4nZCh+qXr1hzTLvOSE5nqEsHmorP3ASsG7zmSItuAX8h
         pevTdki1k1WIMVnCKaDjnW7+ibNYPQLwMgatbQjnPrBvJ+fbvr3dj7GZtZRcmCBVcnB7
         gN280BQfKsxNhIa5cmoLMhO4h2K6PR118RdD6kSqxwBT/LBrKpLEsY1D2AN2qrDjOsWN
         wYdttAIjbwUHyhf17Q3PBqMvETB87fwe1ezcHmRambc4VA90oqzyDd2ttE2rMNyk9JOA
         B9XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=JBKtoajRFqAQmYRHIJJ0fkQH8d+bSUkkequ4cY7/wgI=;
        b=dacZjgfa9A7AMwiElR1IKps3wfaPxUNwGHiiGJosnh2quXW4mNcQYZ6oPRIhTyNEMz
         zO2vv/qjOEiT+AwwBCFAVg/FLG5oL9rd8reEWkptwcxfzlETzmk2wRj65QF+7SkGbjGE
         IGD4CW+kHrkQ4Ebt8sbliG+rVq/vre2ewFI/tBMp5PAzI8OgoSualYCMmdsvkX3CoAqp
         iI7qr05mQc5YEyonZdNZptkzLM5/H/dAB4NoyUOjCDDOPk/MQLOzd0JPSF76FscEgoFQ
         0bQecMS8mzW204AJXGd8X9WL2icGbnr0edUhGGZ5Yp46HGzy2fpGc8AB4/fLIb5HWUlP
         p+Ig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TAkzfKwm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b14si28465130ilv.52.2021.07.25.11.20.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 25 Jul 2021 11:20:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TAkzfKwm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m7ijX-00005U-FQ
	for alex.bennee@linaro.org; Sun, 25 Jul 2021 14:20:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m7ihh-0006nl-5U
 for qemu-arm@nongnu.org; Sun, 25 Jul 2021 14:18:22 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:41500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m7ihd-0003st-4V
 for qemu-arm@nongnu.org; Sun, 25 Jul 2021 14:18:19 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 q17-20020a17090a2e11b02901757deaf2c8so11122059pjd.0
 for <qemu-arm@nongnu.org>; Sun, 25 Jul 2021 11:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=JBKtoajRFqAQmYRHIJJ0fkQH8d+bSUkkequ4cY7/wgI=;
 b=TAkzfKwmBifcXRmyDdqIUJG7bHydT2k2D93tjpOyKfl7+OaC/7kWOa6cqmqiZD8bWc
 lZsSwbO59fGaeKs+rHhM/NUE3JJ8VLKC1CxrXiDngMZeL+S2oVzhmYdTwQNSCuAKBdoz
 HopPo1UbwVtT5E6K8Z6TFV+bQZ63/IboKC6KL0lxqdYw3u/ktP08tl5CZmK/+ldLxnQW
 1Y2/MLZUXwjd5QXmMyJz7wOSfaetcfrF3NlAcjgcfOebO6oF0PC5ckCRHxgD4X8bQCtK
 yThnOBBD+GSP3m0bnPYgV2uKvBwy0s9zIOFkaKDCbJf3twG7OMEKG42nTOM/vb/Qz7Eu
 Yi3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JBKtoajRFqAQmYRHIJJ0fkQH8d+bSUkkequ4cY7/wgI=;
 b=UDbjj7T9HZWsbmh0smmHhI4E9AitTGuRELXJV8PibHGivamf5qK/PXmHXaByirdYk3
 k81kvzdW3zx2fPDHIBT4fyl13FI6tzobn0KnbRVKxrmm1OEoqzqRzeDb5IRHkxrNrnE2
 8skXJA8OWCrkmeMQ43bUMlJX/PHY2J2rL/0hgNtrjVA54zrb+otnxFgHyjzY2GESF9u3
 03qcxqkB9nY7VYk/jzf9J24TQWwZ+E4JaUGMzNybjKHJW3hWXqbdppSSAbrZvpTfkSq6
 dovcy3hYvFxjkRPLAtlw7dHg6v0IxfMvlS8rf2M6snBdz8R7VaQ0IHP/j5qDgIzGdYme
 ZLQQ==
X-Gm-Message-State: AOAM533sX8Jbxf89egi8gOgDPb7UOGOmPd1sSVtfOw+Df/N2KJV3XYfb
 78w3FUxDFZHRI5DAFDmJEyXODg==
X-Received: by 2002:a17:90a:a013:: with SMTP id
 q19mr22288467pjp.224.1627237095792; 
 Sun, 25 Jul 2021 11:18:15 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:497b:6ae4:953c:7ad1?
 (2603-800c-3202-ffa7-497b-6ae4-953c-7ad1.res6.spectrum.com.
 [2603:800c:3202:ffa7:497b:6ae4:953c:7ad1])
 by smtp.gmail.com with ESMTPSA id f5sm8498143pjo.23.2021.07.25.11.18.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Jul 2021 11:18:15 -0700 (PDT)
Subject: Re: [PATCH for-6.1 4/6] hw/intc/armv7m_nvic: ISCR.ISRPENDING is set
 for non-enabled pending interrupts
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210723162146.5167-1-peter.maydell@linaro.org>
 <20210723162146.5167-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9df91161-c097-81b2-6062-c7961fec3938@linaro.org>
Date: Sun, 25 Jul 2021 08:18:13 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210723162146.5167-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.091,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QAO3Bd2gmjXY

On 7/23/21 6:21 AM, Peter Maydell wrote:
> The ISCR.ISRPENDING bit is set when an external interrupt is pending.
> This is true whether that external interrupt is enabled or not.
> This means that we can't use 's->vectpending == 0' as a shortcut to
> "ISRPENDING is zero", because s->vectpending indicates only the
> highest priority pending enabled interrupt.
> 
> Remove the incorrect optimization so that if there is no pending
> enabled interrupt we fall through to scanning through the whole
> interrupt array.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/armv7m_nvic.c | 9 ++++-----
>   1 file changed, 4 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
