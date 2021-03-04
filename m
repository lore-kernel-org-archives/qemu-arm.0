Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp6426268lfg;
        Thu, 4 Mar 2021 09:30:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyHxQXZ96l1OsivKR9mFPqRlS8bDtf/l7gVCGTA4GEr7xO67RxRWFuXm3vsAy37n/X8vUe4
X-Received: by 2002:a05:6602:14cb:: with SMTP id b11mr4484006iow.175.1614879011734;
        Thu, 04 Mar 2021 09:30:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614879011; cv=none;
        d=google.com; s=arc-20160816;
        b=EDOyQU8SaTdMfDE0A8Vg2tcwK4s+6VB1vzTLFF1tb2pwIFLJFeG0/pEoTyErCELnSI
         US5IMHclb7xVFmWbiKgSgfEbhxtFvCJ4fX5j4+qgc8GAtC3RZe5RB+w/9LkUZhMMucx0
         AzzXep2CnYtQUfApUxqzimWMIfOJLXG2Rd4knt9kNlkqYeT8RYUU68ZDdYcP4TfW5/HR
         IdP9BQkkFZ0bQ0bJ9ZUvEkwp8CUwfU5eNdSdi0A1dvWRRiyyx9RG6SjhlS/SHIYTInSq
         5XBcx2/kHJRD7pFFMs4fVEWE6Jeo80qmf4PfGVTegwXqbAc/hVTHXMH5cJmp3HLYr7Dh
         t7Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=5/b1P0cRaXwnbbPN/HlMCnTi143LUkySlaTLDq1g7e4=;
        b=PcsXByWcy6Kwrez39ur0JPDcnGuYL6zVZXwU5jd8Jnu34bCL5I9IzBuz3wTYbeMaBu
         If/X4W4pUYpYFIX8XKJL3kNKeaY3cLT4hL+MVU93iRwHNVM5wXOtZsk676QZd428D6uw
         69J1gg2Un44vLGcRwHUKYDKhrqYdRAp3eukvjQPVj/LlrrfOYNfKSWQ0A/RFn35iw9hM
         jLrz93LR45DPeRDOel6Oto29yov30o/2AyKTQBBF8wMH5FNoPQ/pArTvxLonGWhF3B2k
         +0rAcUwMnLwYxTPbPiocLAIAqrJTZw3NsMCjypN7uHxfrcqxKJtVyZei58Ns2JXFXHvp
         XGTw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jvVCSzPX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y12si25390331ilv.132.2021.03.04.09.30.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Mar 2021 09:30:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jvVCSzPX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lHrnf-0004K3-2K
	for alex.bennee@linaro.org; Thu, 04 Mar 2021 12:30:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHrnQ-0004Jh-2Y
 for qemu-arm@nongnu.org; Thu, 04 Mar 2021 12:29:56 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:40631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHrnO-0007Ny-Dw
 for qemu-arm@nongnu.org; Thu, 04 Mar 2021 12:29:55 -0500
Received: by mail-pf1-x42c.google.com with SMTP id d12so16875752pfo.7
 for <qemu-arm@nongnu.org>; Thu, 04 Mar 2021 09:29:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=5/b1P0cRaXwnbbPN/HlMCnTi143LUkySlaTLDq1g7e4=;
 b=jvVCSzPXUbogP6utkH3zarDKij0lSmPKYuT/bSyJ+PvEvqfEs4csxJE7rGgOrsbGiN
 A+TWfS5vuIPwbL1AMjMbaHpbyXZgeJsHiOJQWbkVgJIFbRxchB1UW/44Kdn+dQj6Ickp
 nmx7YPKmBcu+HbMr/y+SAvp1+sPxvtHfrDI1L7dC4EnTJcC+1YRFIxDc85m/9NuRZgH1
 yPDAhFZhOYAG3lFY5a9hYfa+z8ZXLSJnMLbVF/mrTiFwnzkBJ7atNiwnG1rxB0CJHrB1
 jZTFwsQqpUuN+1376yZ5I4/5Q1vkQ69YWYItjZM1GOjl9DucFdCeA/ss2o/ZhuZN6vyF
 tUMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5/b1P0cRaXwnbbPN/HlMCnTi143LUkySlaTLDq1g7e4=;
 b=k9ynF0E+qAw7GN/O7o5TVhObzg5ZpUzIXO96B3eM8qBaoRwbvnPPpPDH/Pjudpx/sA
 WW9t8DlMecHY5TnQ2jtuYLiGLXQ0R68AkMuvnMLbp88ry++LRWXd/SCVnbD1Dugq8w0n
 LZEfihbku/pxbG4nERIQztsTPT3wdv4iNcE3hqoRMpmlNYE/3Xe0GcOHpReN927DcpbZ
 jaO5BUqNt8hlN2oimAiumQzrwZQKUvYtmJBTYYtzP0X75ktHUueejeE2OaSDzdJK96NN
 gs5MVs7V87RN1iPK3dwlXlest/2lojxXWBW1FCvUnANbMlWlX50+iZrJdhaJH+CzSGOG
 9x9A==
X-Gm-Message-State: AOAM531Wmzq8J44EAd6FLSK6ntLiBDZoY0UdiMr07UyiH44Dvciv5bPZ
 1EZTWV+PtYHzMAkKgi+x3JpPbA==
X-Received: by 2002:a63:fd01:: with SMTP id d1mr4297504pgh.319.1614878990741; 
 Thu, 04 Mar 2021 09:29:50 -0800 (PST)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id w6sm13085pfj.190.2021.03.04.09.29.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 09:29:48 -0800 (PST)
Subject: Re: [PATCH 07/44] hw/misc/iotkit-secctl.c: Implement SSE-300 PID
 register values
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210219144617.4782-1-peter.maydell@linaro.org>
 <20210219144617.4782-8-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0f167565-0af3-ee18-4f16-ec0a8aab12f9@linaro.org>
Date: Thu, 4 Mar 2021 09:29:46 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210219144617.4782-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-TUID: 0MpfpTQXuhPT

On 2/19/21 6:45 AM, Peter Maydell wrote:
> The versions of the Secure Access Configuration Register Block
> and Non-secure Access Configuration Register Block in the SSE-300
> are the same as those in the SSE-200, but the CIDR/PIDR ID
> register values are different.
> 
> Plumb through the sse-version property and use it to select
> the correct ID register values.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   include/hw/misc/iotkit-secctl.h |  2 ++
>   hw/arm/armsse.c                 |  2 ++
>   hw/misc/iotkit-secctl.c         | 50 +++++++++++++++++++++++++++++++--
>   3 files changed, 52 insertions(+), 2 deletions(-)

Which document am I looking for here?  I found DAI 0547B "Application Note 
AN547", but I don't see these register definitions.

Apart from validating the constant values, the actual code looks good.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
