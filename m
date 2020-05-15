Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp852897lfb;
        Fri, 15 May 2020 14:27:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy+JudoVdaepMCuR37C/yrf8H5pAAbopuY6+xrFPw8GaoZPtX/8iXQEg3KQ9OtzqMyTf1tx
X-Received: by 2002:a0c:b524:: with SMTP id d36mr5487706qve.12.1589578022010;
        Fri, 15 May 2020 14:27:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589578022; cv=none;
        d=google.com; s=arc-20160816;
        b=kVI7Bh8MFaRPDVAXuXhUCjO2cB754WeOqAh1SuxxpFulR1doWLsWNhWLMByq7l/NNo
         PAIjyV1dpde/OLUc0Q8dsgKwAJlVpHg4+E1cBWGIv79DK7PnD7iiErpt63EMHFHoaCI3
         taf5O2p9BSPDu8PjGGqUDwFxiy77yZ2lemO7M8Kc7KnGQcICCB4Jg1drob4X0+SqbX/b
         DAj6lA93P4Q3A+sgQb6xqlyyiigOn2FI1KrUJ+hItFK8WWcvJ5TJrrfZ9f9SFoEvNxEa
         nxXJwyegeXm93MPh6Ql7aRxeNC5po5g7GRMlyWq0viydD8LgjpIjYtR3YJ31k8j8u50o
         sEdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=doBDCdXTOPTW9EhBLw1oNuUemWsv3RZ2j8ZS9h9ROBQ=;
        b=XSgvCZsVkVBf+W587QKdeSaWxCXY8hTRXX7v1IC2/uEWik3QIU8xvBzIehTBuyrq+/
         8PJmR7fxwPx79qmu0ahE5U7lHo9Qiiy5wHPrYpft7FQSwhYDl2kol4X6SIZjAHIFgw2f
         s8u8c0JJ+5pso62B6uhcoNC/IRWXXi7Y1eBqxp2KN2EhdrUkwj1tK1oFMO5ZnTPaEyro
         T+sR4iOozLRihVZfHVoONeDBX/oz75hcj+h7DZVu+qQxBSaesT5K0b86+eeKd14if+XC
         r+15dW+1TApuCm1fYTvAqR2kj6H9wQcstCkZ5SqweAH1nN66NCxw5ou6ArDHowcZ58au
         hb7g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vBKrSKGW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w186si1789617qkb.367.2020.05.15.14.27.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 May 2020 14:27:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vBKrSKGW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jZhrB-0008Ky-8w
	for alex.bennee@linaro.org; Fri, 15 May 2020 17:27:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jZhqz-0008Iv-Lo
 for qemu-arm@nongnu.org; Fri, 15 May 2020 17:26:49 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:46812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jZhqy-0008AP-Pn
 for qemu-arm@nongnu.org; Fri, 15 May 2020 17:26:49 -0400
Received: by mail-pl1-x643.google.com with SMTP id b12so1412693plz.13
 for <qemu-arm@nongnu.org>; Fri, 15 May 2020 14:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=doBDCdXTOPTW9EhBLw1oNuUemWsv3RZ2j8ZS9h9ROBQ=;
 b=vBKrSKGWY2NG5K7wr5CXRYf0r4Eh+i1BZSEgDlD9UjRuwL7U4jimXGIfztBmWlUwld
 WsnMprYdNzPxKeeAqjf73WNLae5/G3yLUOF9U9mdk5l+hoblPsO7vrvvuG5lnhQwBeaQ
 2v/q19RgbrBpQHDywQo73IkZ7/w1W9pc/7h9KB4Elc4Ewkj6QVUVZ13YZDhW8WadqE6g
 0MfpOwHm3m2K+o86uALWKO6kaPLWVenG1lgSaQVGB9MIpLcLPVrkvznXhjjNTlW0mMTP
 h3kWeysh3Qc4H4V8SfW/P5aC+u4Eldi/rLssQGBAj88j6NPP48OKtTuHR2PH83l9ZxY9
 ZafQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=doBDCdXTOPTW9EhBLw1oNuUemWsv3RZ2j8ZS9h9ROBQ=;
 b=onypanQjZ3OfFWxSg9JNOshJ76TKoGvJHjkMarmdgk0X1rHAkeyrxIgEWdGF9jqsu5
 fwIfvFzCzgABMi9aGRnl/SZwsYC0VKKlc4VIEFgTNxIiuCuZfBlfAVOImq0EWtthpkFn
 oBODDJv+FjAa3AFmTzBONZyamuobx52un53gjlXzvN5DV23N9EhzwCl2Y8J+YNUyFYqq
 ENdkmGBPb1rQsEXH2dtIAWGMjRNwjTsu4DXJbo8ChGOZFD9ahVi5XdnTlpHAcTs+qETc
 tWrgapLnAf7m53qNhUEvgpxujziV80sCyAeIkZfzDj2bxif0WUG7IHe3/is2nl98NIBK
 5ICw==
X-Gm-Message-State: AOAM533aeLrdJEhyH9QyHExu3sVh8ad5BgXEMwJThk/Dwsd48LME2PLj
 4dzjyrxsfRmndItTle1gHS1uCg==
X-Received: by 2002:a17:90a:fd16:: with SMTP id
 cv22mr5166468pjb.169.1589578007277; 
 Fri, 15 May 2020 14:26:47 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id u5sm2746985pfu.198.2020.05.15.14.26.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 May 2020 14:26:46 -0700 (PDT)
Subject: Re: [PATCH] target/arm: Allow user-mode code to write CPSR.E via MSR
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200515185026.30080-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <327074ea-2c2f-ad45-b53f-1c4dcb69f9bf@linaro.org>
Date: Fri, 15 May 2020 14:26:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200515185026.30080-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::643;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-TUID: EDoEs3sInPzB

On 5/15/20 11:50 AM, Peter Maydell wrote:
> Using the MSR instruction to write to CPSR.E is deprecated, but it is
> required to work from any mode including unprivileged code.  We were
> incorrectly forbidding usermode code from writing it because
> CPSR_USER did not include the CPSR_E bit.
> 
> We use CPSR_USER in only three places:
>  * as the mask of what to allow userspace MSR to write to CPSR
>  * when deciding what bits a linux-user signal-return should be
>    able to write from the sigcontext structure
>  * in target_user_copy_regs() when we set up the initial
>    registers for the linux-user process
> 
> In the first two cases not being able to update CPSR.E is a
> bug, and in the third case it doesn't matter because CPSR.E
> is always 0 there. So we can fix both bugs by adding CPSR_E
> to CPSR_EXEC.

Wrong variable in description here.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

> 
> (The recommended way to change CPSR.E is to use the 'SETEND'
> instruction, which we do correctly allow from usermode code.)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Bug reported on IRC. Quick-and-dirty test case at:
>  https://people.linaro.org/~peter.maydell/msr-setend.c
> 
>  target/arm/cpu.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 5d995368d4f..677584e5da0 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -1230,7 +1230,7 @@ void pmu_init(ARMCPU *cpu);
>  #define CACHED_CPSR_BITS (CPSR_T | CPSR_AIF | CPSR_GE | CPSR_IT | CPSR_Q \
>      | CPSR_NZCV)
>  /* Bits writable in user mode.  */
> -#define CPSR_USER (CPSR_NZCV | CPSR_Q | CPSR_GE)
> +#define CPSR_USER (CPSR_NZCV | CPSR_Q | CPSR_GE | CPSR_E)
>  /* Execution state bits.  MRS read as zero, MSR writes ignored.  */
>  #define CPSR_EXEC (CPSR_T | CPSR_IT | CPSR_J | CPSR_IL)
>  
> 

