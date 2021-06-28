Received: by 2002:a19:ca1d:0:0:0:0:0 with SMTP id a29csp4096004lfg;
        Mon, 28 Jun 2021 08:19:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxgzQvAEu2YKwSRU6Y4kw6qplRfwVmJreu1A8+NuYY2oBtM4UT04DAayHKsJGiFKmqZirJ/
X-Received: by 2002:a17:906:86cc:: with SMTP id j12mr25449877ejy.548.1624893599108;
        Mon, 28 Jun 2021 08:19:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624893599; cv=none;
        d=google.com; s=arc-20160816;
        b=IZEtTfO5Mb9lZTKPy74nc1l0j3UUE4ZTeZk7XhCdV1iFNKnUigy5Xjy8odkoQDQQY1
         6m34HIRiBnIN/GTZJ6Ta0by5JgoKNYs+N4LPrx8JsUoXPm5nUb3U2piAOMW6cnFzoKMa
         vzWaj1kFsWK0RD+RV+3B6TcBDeEf4GzttVr+sxiFLwD1cG9T//eHvUE3HJJPD9Ha2ioU
         CpMJig7KxaVDRCQr1Yv/oEQYxr7mXFkwxvETfiJo8V3jq7vpv4WeW+jvdoe699aXfEW4
         DhwvzpyANBltwqOIhl+1/1652hXJLEwb8eRVkHSzawQvZUsCqjaswwVV8gd/n06p+sNs
         BKhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Kr936up2EFTAZEwd78qSaHC/UDnLrKRYp0F1hReScWM=;
        b=YrmcLKxUtUU5xnc76N0i0+qmQuxwhlH14YwtYq4Uo28zXdjrCmwVGTWxjO2ghXPVgy
         YeTd0JdzWfvr97OMjZQdjGDUZT/s3Qn6tDJsSsx4qajYPX8GZJmUpueYe9TZREGy+OE1
         XT+4ZZbN2WFBdLqy9lJiw+VklKJwbBE+V2N3x/9Y/WVCMjXoiZXFqM9KiSACBk8OlDpV
         5+Xu1wOInVKYleq5IvxRRuXhCHRHn8+oPYY9Tk/xnjUM9MQoF+KCvzp70s2eQCwjpBUI
         mGv44e8akgCczEZmrVBD3/gIUd+AgzSeDI49pCoH+0q+i0Liv3xoXHYowIXCU8k3o4+b
         5JaA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Bq65QqNX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w19si12725705edx.11.2021.06.28.08.19.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Jun 2021 08:19:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Bq65QqNX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lxt3G-0008Oi-7L
	for alex.bennee@linaro.org; Mon, 28 Jun 2021 11:19:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxt34-0008Mi-Uy
 for qemu-arm@nongnu.org; Mon, 28 Jun 2021 11:19:46 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:33350)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxt30-0003Rb-TH
 for qemu-arm@nongnu.org; Mon, 28 Jun 2021 11:19:46 -0400
Received: by mail-pf1-x42f.google.com with SMTP id s14so13096122pfg.0
 for <qemu-arm@nongnu.org>; Mon, 28 Jun 2021 08:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=Kr936up2EFTAZEwd78qSaHC/UDnLrKRYp0F1hReScWM=;
 b=Bq65QqNXjvpzwUb8b0JMIjR32rm5WDBFM3y9QwDEcIC0F6+CpDFi58IayxFgj//+bL
 3H4tV8T6bwfPrg1sMnVukisyvEGoveiFXPtjngB/e5ODm9UYu/+FSTc2lw6xrW0aXKTm
 pBvXus2o7L4Wt7nljgCb9HYponbr1L9rGgwNQR5NX1kpAxpHiqXTfFJ3rW5lO4KbFtPK
 pmXRl2QUJ1iFnP3y1g31kp50AKW5LM+mm4cs1nlYjAdkTXQF+ZS1Vbgx13mflep1boU2
 WccIzOX74SN9HxN0MTNTfQykqvGtFWRiahBYanWqvu8sVtbwNjDuhTC6EwVQGx8aeOzP
 0Wrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Kr936up2EFTAZEwd78qSaHC/UDnLrKRYp0F1hReScWM=;
 b=oboVD2VV0bsRxEm9MmjYI0Owe+a6zAjVxnja4NUArZs/MP7vrM0shqebNHEzQlNSyJ
 rLB6WlVmJxReIR0q8dQpJDS7VWM7PNDYhRFPkvgVZtM+8Y+bQLcq6UM3GtY3mHOHTo4K
 UXdU/6NfhFnHsyGosE7WB6V+kr2utC3GZ7POdZPz2CzlJWXwcUX0KEO0z+FUZCOXD9l3
 wgHeaZ3pXs3/ZlkpkCr2KhnWVfzUFDyFvx988AcBCM5Pe8UVXzMu82dO5yyphaWhbPFn
 8UdUtb4RJwVHCyK4XLJTLKUMiTI2mmwWut4+/PLCT9sQ/Nv1bBwjHKTBq7zA3XmYDUJn
 o+CQ==
X-Gm-Message-State: AOAM531aLbnY+XJxxAnGF8VO1yGso93sqaELpYIctI698Lxsu/3MwW1n
 TbHWGyXtj1GSAe7nRhNlWI+KUw==
X-Received: by 2002:a63:34a:: with SMTP id 71mr23184177pgd.305.1624893581211; 
 Mon, 28 Jun 2021 08:19:41 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id g10sm14458733pji.10.2021.06.28.08.19.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jun 2021 08:19:40 -0700 (PDT)
Subject: Re: [PATCH 03/18] target/arm: Make asimd_imm_const() public
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210628135835.6690-1-peter.maydell@linaro.org>
 <20210628135835.6690-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <85ce78ad-567a-c033-6dd0-542beb27bb5d@linaro.org>
Date: Mon, 28 Jun 2021 08:19:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210628135835.6690-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: iacD7HK57NZk

On 6/28/21 6:58 AM, Peter Maydell wrote:
> The function asimd_imm_const() in translate-neon.c is an
> implementation of the pseudocode AdvSIMDExpandImm(), which we will
> also want for MVE.  Move the implementation to translate.c, with a
> prototype in translate.h.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/translate.h      | 16 ++++++++++
>   target/arm/translate-neon.c | 63 -------------------------------------
>   target/arm/translate.c      | 57 +++++++++++++++++++++++++++++++++
>   3 files changed, 73 insertions(+), 63 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
