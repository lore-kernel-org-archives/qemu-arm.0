Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp2010445lff;
        Mon, 2 Aug 2021 15:25:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwLHsvKi7NWfBB2pltup6bCZZvS20H2MITfxyLmPsicZ11Addmnyp/i5z6unitYkY/qKX+R
X-Received: by 2002:a5e:8c07:: with SMTP id n7mr195192ioj.26.1627943147305;
        Mon, 02 Aug 2021 15:25:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627943147; cv=none;
        d=google.com; s=arc-20160816;
        b=tv1LdkzXURLvPPlkAzHE1lTn81WiLv0YcTWExLfp4leVEwvviLvqGWmeJQB7uHJVSY
         hzURXoi8LOR+N8tsAoAz7//JJDxPLEM7IbLBSMWD2XDcP9ljBlBTcyL2Z/Bc77tr0SPc
         NPGDGf01X82VOCCdcwWJTMPKjKhaVRrTMJBs69wj3l4KBVi9jllaOWtwTKA3AG/cyDYy
         rzrddIjaaOar4d8/EXgTVeUubBBXhKT2G6kyYd/NwPpLB9VmLxrTQqGe5gIy1JV6Xpr2
         Xt654Fvb1/GPh511O8bifK8cHC9W93MQyvLICXPNEbrjPeueAHT//7VesWpfyFW6hh37
         rtqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=XUKekG2iztZi06QuFftTXXYolQqk4b2faKhKenQWaM4=;
        b=BZotECEOn0fuWX+XcPdjg1f0V5A3WYINASJemDNIz9N6Y1T/FRvcRaxZXeJBvm75L7
         YZfzvzLwl2Og+BFxdUlU/imbN7X+G8IL4Sxs3vyVvXA5CQLlO8heyqR5xL7PNRT/wLZf
         vNv/HbkTuRzjinBoMuYLUbr9XqZIKezDaAixtOSCNnUajeKFgkeRHRMQSPGObxOCnS5I
         3EwiCKd6+iO8vRlnzXL/uBhyx9M+4h0sxSIZ5pbaVkEudJJ5QUc8HAxK43V/eGeS4J7s
         LGg0WfXhGJkBSNdkjt0g01vvD3ZOg/WCTor/feWg8DBGsQY4uTnqN0HTA1y3Xtre9sfA
         qRgg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hmSz0kOY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g15si14109839ilc.45.2021.08.02.15.25.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Aug 2021 15:25:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hmSz0kOY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mAgNW-0008Vi-Mq
	for alex.bennee@linaro.org; Mon, 02 Aug 2021 18:25:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAgLh-0006VC-CJ
 for qemu-arm@nongnu.org; Mon, 02 Aug 2021 18:23:53 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:45891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAgLf-0004Ex-W8
 for qemu-arm@nongnu.org; Mon, 02 Aug 2021 18:23:53 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 m10-20020a17090a34cab0290176b52c60ddso2039219pjf.4
 for <qemu-arm@nongnu.org>; Mon, 02 Aug 2021 15:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=XUKekG2iztZi06QuFftTXXYolQqk4b2faKhKenQWaM4=;
 b=hmSz0kOYUnh3F8m1C5aaG5mPZv9erEQ+e8NVNGwqXRH+/Y4DV0iaexySn35i3M7uri
 9kWccVkOIrtFFZl2rQVIDQYPxvtcAmgK7evuHfy+G/BaU0ubi1tLMd4W/FgDvud+pwJf
 Jp5Zj+woG96nBQpr2a0VxHR57xKWm2MTelIOPq7HdLNWco19uf2OD/N+vhdzOyiGbKch
 6trXEuu8D9xa6pnr4pLdvti5Lr6ShJeMjFt1dniR8yQcaVvBFvLcVV7lYtX1RzVKXY14
 zokNN44NNPy3xC+/E2DaxgbeuyD2X9kI75cqcZcV57uLUgQ1/DKGwx/MaNTAxtx8Yy7X
 hf0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XUKekG2iztZi06QuFftTXXYolQqk4b2faKhKenQWaM4=;
 b=Dug3VZPISgmh4mi+voMwkoz7gb007tYvSPvrKNQD+BA5EoV5xbgAmqtyR5TOJVGJYi
 aOG9AHCJwO2Ih7LpbFS7J4b6ZcdHfwA+9oG4mKNNynacE216FGReWyWEg6ou0lmS4jiH
 bMPCT/O2FglNQSIP2MKTtOH3rqYYa9OSRUosSKd3jg6DFsvKFD+r4bRiETm3wPfrmthY
 szcCYVAEDyFHjumoBO+Ln/3PomZRl93yO7Iqe5qN0sX3aMQ4nJtnmJ3sERNtxOImDr0k
 g9zswevGnOgOi/w5IfilrFvPEojZUMqlV1uLkDkWSJ9uSWW0JRpdveJwtXztGFnMt90G
 r/2A==
X-Gm-Message-State: AOAM531r1V8P3f3hi7Fv5yk2yU7DwygNersEDGvclzdY+gYL3Q214zIY
 lrmbfsPCEft/+9+vuxD46Swjjg==
X-Received: by 2002:a63:204a:: with SMTP id r10mr2466861pgm.365.1627943030730; 
 Mon, 02 Aug 2021 15:23:50 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id z9sm13020170pfa.2.2021.08.02.15.23.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Aug 2021 15:23:50 -0700 (PDT)
Subject: Re: [PATCH 1/2] target/arm: Re-indent sdiv and udiv helpers
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210730151636.17254-1-peter.maydell@linaro.org>
 <20210730151636.17254-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6925ba1f-2f07-1308-7e08-f88d1766d8d8@linaro.org>
Date: Mon, 2 Aug 2021 12:23:48 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210730151636.17254-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
X-TUID: gyhBPnBWYN/u

On 7/30/21 5:16 AM, Peter Maydell wrote:
> We're about to make a code change to the sdiv and udiv helper
> functions, so first fix their indentation and coding style.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper.c | 15 +++++++++------
>   1 file changed, 9 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
