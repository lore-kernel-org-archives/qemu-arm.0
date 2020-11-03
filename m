Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp5088850lfa;
        Tue, 3 Nov 2020 11:55:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx//VqBy0LX9xFGLaa9rOEjpJlnlGMlh1k/gEVJUsbzft7IIJza9JJ9Y7nZAIH6gDHmzHiP
X-Received: by 2002:ae9:e856:: with SMTP id a83mr21346087qkg.142.1604433317085;
        Tue, 03 Nov 2020 11:55:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604433317; cv=none;
        d=google.com; s=arc-20160816;
        b=nkckITf+bzgwqXfcz3nDa+y+SH0Lg+91bKfWbIAI7ZQt/8X/3BWs4TbGWWcN7QXsq0
         MgUHwvuWkTyFCyFO7CRcF2O6oSSoG5vfRfvXhBeK+Smpq7ajRkHdTnu9ErcqC1GboF9o
         a3Njt3QXj+Tof1y+S5c7DdgGEqIbXRNy2NiaubLm+b4v5TMzaOdhhqaOgEo8KeyJ1d6b
         JU3i9stdswlpXE39Wc82ZoRcyfElVIY0wy6wPMmZSvq6UrpkmmjEDH/hbb0uXGH/Spdr
         gcuRTzI5qH333q4HIiB2MmiHb/vToyEqu7ybhqPe3QTCQj/MtSoK5U9OODYtZ5hoLV6j
         NOLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=eDD9pZcUv9kiEIg0fEw1tNmd54O+9K55ilcE3Uho19c=;
        b=uPn9/G/r9wQWIWZV22WwMbf6IX5nzFgE/Qm/F70jk7YboPH1VjSx0iRdlkXZvP+adt
         yGVpWpHxLoUT2lb7z9/uiKW1OeeQc7KqwpMLl4EwIgmfbmyhj5KyZ1Wfe+5QXG42oKOd
         9L/G12GgbS9coUgQeIKRWjvmuus/8JP/deCaL/aEtNrJaCuNdx1wRPfwLU8HWZLbfd4w
         mN3fmR37zSIUNT2ORRYxbffFJui+Y82FltEBBAHkWWYOCk4dTppxvQBI4lpoyw+7WN7M
         epbYVN2eqLq5MZFdyoI0YDYNJcz8UFgSzMQTPRhXbl90qQvipXcZIomgnCGjnBfV81s/
         Kw9A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rDw6X3kl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s3si11580119qvv.80.2020.11.03.11.55.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Nov 2020 11:55:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rDw6X3kl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ka2Oi-0007SW-Ha
	for alex.bennee@linaro.org; Tue, 03 Nov 2020 14:55:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ka2ON-0007Rs-7n
 for qemu-arm@nongnu.org; Tue, 03 Nov 2020 14:54:56 -0500
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:46425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ka2OK-0001a5-M9
 for qemu-arm@nongnu.org; Tue, 03 Nov 2020 14:54:54 -0500
Received: by mail-pg1-x544.google.com with SMTP id w4so4298070pgg.13
 for <qemu-arm@nongnu.org>; Tue, 03 Nov 2020 11:54:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=eDD9pZcUv9kiEIg0fEw1tNmd54O+9K55ilcE3Uho19c=;
 b=rDw6X3klCA7RI6u/DqHk0DET2E88CzR9sMM+PkSMPWpYgy4lOQHc7dPN/YJsyqfceq
 wn0i2vpjL+P0MXa3VVgflW4CGgTdCKiTyC7SWpuH+wCriH8SROj0OxIBM5vhJmOC1QBZ
 wFGREQvTy0U0bxGGDH9kl9vKuc9JOlyM3QK0N+qXpbZn1xSIJtPovoCqVWVrmsXeFOj6
 ogatKdMuyqqBp3T+WFeLdw11ntWM+LrluF4yv+praLdL9gPlY5S50tq7gqRp7VrHFhPS
 3RKPs9gevLkiTD7Bwozz3VR9ymivBAjvl6V8R7aUkBtikaBui9bFSWwuHsTToCd26oNM
 hiHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eDD9pZcUv9kiEIg0fEw1tNmd54O+9K55ilcE3Uho19c=;
 b=lihsTpV4x2AqKLtdSZNqRE5vkK+8uHoxjWD0cFEbHFbVbQuBN7H1HVbNmfPnI62keN
 2nVKtp5LFpz/mvhWE2LUOdM08IPNldfy8Ou1qVuXVK5eAvDDxf4Onaq6u110y6Ro6nJu
 INcf0GJa6nyK+CkFlt3FeE/kuA4UbALIZtywwjiPkjXvIT5b2i6sD+S22LTYKV0XV5Ep
 wOxoRY9Ej1gsX0TmHxqiE9D32SbUn7lGp8hiXLnSTyAfNTRVkWTYRtcDAnMkmPvLinAY
 OYmtgrx40NAFQCJAlS77LemgDuzxY+OHOHCqsxWOyNmhTat1IipdD/97eX9u1FENZjx3
 hm+w==
X-Gm-Message-State: AOAM533yq48qh51zQmNRq+7qfLonArN1qmNsXuCp42PExuCxzJ8zTHlW
 U7bLjlK28ZlQFrQZ21QIPhqiQg==
X-Received: by 2002:a17:90a:34cd:: with SMTP id
 m13mr821715pjf.201.1604433291128; 
 Tue, 03 Nov 2020 11:54:51 -0800 (PST)
Received: from [172.16.1.221] (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id e10sm3558808pfl.162.2020.11.03.11.54.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Nov 2020 11:54:50 -0800 (PST)
Subject: Re: [PATCH 10/14] target/arm: do S1_ptw_translate() before address
 space lookup
To: remi.denis.courmont@huawei.com, qemu-arm@nongnu.org
References: <2172054.ElGaqSPkdT@basile.remlab.net>
 <20201102105802.39332-10-remi.denis.courmont@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8ebcf033-7044-ee14-8b84-3812ff041d5c@linaro.org>
Date: Tue, 3 Nov 2020 11:54:48 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201102105802.39332-10-remi.denis.courmont@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::544;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x544.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2YSz45XtKAyJ

On 11/2/20 2:57 AM, remi.denis.courmont@huawei.com wrote:
> From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
> 
> In the secure stage 2 translation regime, the VSTCR.SW and VTCR.NSW
> bits can invert the secure flag for pagetable walks. This patchset
> allows S1_ptw_translate() to change the non-secure bit.
> 
> Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
> ---
>  target/arm/helper.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 4c86e4f57c..7c70460e65 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -10403,7 +10403,7 @@ static bool get_level1_table_address(CPUARMState *env, ARMMMUIdx mmu_idx,
>  
>  /* Translate a S1 pagetable walk through S2 if needed.  */
>  static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
> -                               hwaddr addr, MemTxAttrs txattrs,
> +                               hwaddr addr, bool *is_secure,
>                                 ARMMMUFaultInfo *fi)
>  {
>      ARMMMUIdx s2_mmu_idx;
> @@ -10415,6 +10415,9 @@ static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
>          int s2prot;
>          int ret;
>          ARMCacheAttrs cacheattrs = {};
> +        MemTxAttrs txattrs = {};
> +
> +        assert(!*is_secure); /* TODO: S-EL2 */


Are you sure that you don't want to pass in txattrs via pointer instead?  This
change by itself looks questionable.  I guess I'll have to look forward to the
other patch...


r~
