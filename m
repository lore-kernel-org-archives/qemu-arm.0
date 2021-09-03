Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1318412lfb;
        Fri, 3 Sep 2021 06:58:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxub6oLUcYPXl69XUuME4fTvc0m9KRsntsFLoKSxwM+6AKRQREh3LTO6+326/gdjocrgKx0
X-Received: by 2002:a67:1c05:: with SMTP id c5mr2704225vsc.25.1630677503373;
        Fri, 03 Sep 2021 06:58:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630677503; cv=none;
        d=google.com; s=arc-20160816;
        b=XDYs7ajWqi/GBe3bHgaHbRYLdvzxMxW3sMrgGgdBYFmFelY4x2zoUssEwdtg3nCbZx
         joeQ7KRNGdYhCsYjwsLa/rpFys5IyLGmC9Mwp0JB1TEHpxaXXfOhEM/JVyGk/QjC543I
         sXnYuvWPrUi++ETDvkL5fEN2dcbEFY6MRMXr3rWruR3iKh5v0zlMk4YrFA2VKutELlbB
         /7uaoffwIf94c9a7OpqcweNX/Vszw9k240iwEMHcscw4oF9NtUxvEAzfdZchYg7SLuOm
         If9DXnvvBaXjhM/x7if1j1ZZuAg23aleY/fvezjdWSD1YkT+FbZc6kEEsZOmk3m4FR4M
         ZmwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=w+nA8CYw202ilVLnTMkA3NdoO8LNl+MwuwzqtYbJyeM=;
        b=iLoBivtQhdO6IKz6bj6Z9RgWzp3KzkeuPHgOSqn8kEACh21ZG0IRu3CNQDvBHC439S
         zYZ1XPoUiAr3huj0Uvfg86U18VH+M/Xnw6elqETgpZECYUC2DN0XNNf1On1bEro0/Hdd
         KF7VtUHYCxseyp1Vo2kcepAs2j3qxQEvtGeCI6bw3SAXy7Z23zz1KMa+YDk6Xrd5Wx0b
         ie2+2DUxiOpxTcHKB9Npp0Wtnv2aR4IoRrHXOZbE6qeOLMZmqDEZgUuq24OyAQwJI2//
         LjMhJDqZWRWzqwMVAg+VQ9lk3m1uirPmbxi5Mop4ToExv7LWhjcKhF/zVKF3tje9irDE
         xptw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZfQmFXGT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e14si2494123uad.58.2021.09.03.06.58.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Sep 2021 06:58:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZfQmFXGT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mM9i2-0000si-Kd
	for alex.bennee@linaro.org; Fri, 03 Sep 2021 09:58:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mM9hq-0000rE-9X
 for qemu-arm@nongnu.org; Fri, 03 Sep 2021 09:58:10 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:33662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mM9hn-0005bf-LC
 for qemu-arm@nongnu.org; Fri, 03 Sep 2021 09:58:10 -0400
Received: by mail-wr1-x434.google.com with SMTP id b10so8431184wru.0
 for <qemu-arm@nongnu.org>; Fri, 03 Sep 2021 06:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=w+nA8CYw202ilVLnTMkA3NdoO8LNl+MwuwzqtYbJyeM=;
 b=ZfQmFXGTknfPkIn78LmYXgoM5yAb7MvUuj7iviUjmFjP3pum5mWLdxIJiG5+hexRAQ
 odJTkQum3FesYjExpo3n/HjPH/otmDk4yLPBYq2ALzSek5PDGScl31ncY98ymO0XXT9y
 Y8MS5whLpLgwhOJCKP/TnUtNpYhbuEza17iMo7vzpSc/z9+Nhkz7HsDDHnHpjC7xicfc
 F0PgzmRbxbNEsMKnuh1/VyMG2/973x3s1Nab42ucFmrbKn5raHu+BJ4CEjuMx9e3Qbz3
 /qy4ZrcJj1Y/UrpDb+PNE2AeOQAbUtr0Ib4OMp5zg4cu2A3gRIpyuov5lvL0csSrsnLC
 OVdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=w+nA8CYw202ilVLnTMkA3NdoO8LNl+MwuwzqtYbJyeM=;
 b=AGklLYNqhhtnNhetlInqNo9YQzIRWxIisI0+sR1wx4SCyuRZyUqXdumQGuoh2OskxK
 ZhfRHPyp15gOMAWp/p4f/S2gyBhP1UVLicUEd9mI3YrdGFOi9pIERsujrJ9Ig7vBhQI1
 se6/ZSang9pi7tuAOJxGn612isPcSo6VPtdv/XLs2B0/v3x86k74TXBw2RGq7l+avmWT
 Q44tcsJjTfguZyqkAUh0AvFyl5BS0TqMwYUn0P4EIm/zm6vL706Oekbi5RMa1/2YTs3b
 pEnuI5TaxgYWvU/UDZayBW6EStFpDdMlrh3z/bwXFo1x2+zyNpo4wbYodlBV2C2iKFlq
 fvCw==
X-Gm-Message-State: AOAM531SVDy9PRwYK6/AstxhpiXfvSBlZuenffglCW4xk2yqzcTnbsAo
 8yFgQYAjVOJ/awOb7W7O5VeMtw==
X-Received: by 2002:adf:d184:: with SMTP id v4mr4340093wrc.229.1630677485507; 
 Fri, 03 Sep 2021 06:58:05 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id d7sm4793884wrs.39.2021.09.03.06.58.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 06:58:05 -0700 (PDT)
Subject: Re: [PATCH 1/4] target/arm: Add TB flag for "MVE insns not predicated"
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210902150910.15748-1-peter.maydell@linaro.org>
 <20210902150910.15748-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <76cd3594-f864-232c-8687-19a1d44ff07e@linaro.org>
Date: Fri, 3 Sep 2021 15:57:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902150910.15748-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.888,
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
X-TUID: yh4eXryGBKLJ

On 9/2/21 5:09 PM, Peter Maydell wrote:
> Our current codegen for MVE always calls out to helper functions,
> because some byte lanes might be predicated. The common case is
> that in fact there is no predication active and all lanes should
> be updated together, so we can produce better code by detecting
> that and using the TCG generic vector infrastructure.
> 
> Add a TB flag that is set when we can guarantee that there
> is no active MVE predication, and a bool in the DisasContext.
> Subsequent patches will use this flag to generate improved
> code for some instructions.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Another of those awkward-to-review patches where the interesting
> question is "did I miss anywhere where we set v7m.vpr to non-0
> or v7m.ltpsize to non-4 while in the middle of a TB ?" ...
> 
> I've left the TB flag as non-cached because there seemed to
> be an irritatingly large set of places where we'd have to do
> an hflags recomputation.

Indeed, non-cached seems like the right option.

> +static bool mve_no_predication(CPUARMState *env)
> +{
> +    /*
> +     * Return true if there is definitely no predication of MVE
> +     * instructions for any reason. (Returning false even if there
> +     * isn't any predication is OK; generated code will just be
> +     * a little worse.)
> +     * We do not account here for partial insn execution due to
> +     * ECI bits as those are already in the TB flags elsewhere.
> +     */

I think you should go ahead and include that here, as it makes the test self-contained, 
and avoids you having to do this:

> +        dc->mve_no_pred = EX_TBFLAG_M32(tb_flags, MVE_NO_PRED) && dc->eci == 0;



> +    /* VLLDM or VLSTM helpers might have updated vpr or ltpsize */
> +    s->mve_no_pred = false;

For a moment I was thinking that this was ok, just finish the rest of the TB and resync 
naturally, letting the end of the TB use the helpers.  But then I thought about goto_tb. 
If you have this potentially variable condition, you can't chain the links between this TB 
and the next.

I think you need to go ahead and end the TB and resync immediately.
Just set dc->base.is_jmp = DISAS_UPDATE_NOCHAIN instead.


r~
