Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp3618675ejb;
        Mon, 19 Dec 2022 08:23:57 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuGlZ8lBeQTLSoSBnq5hv7o0Pq2WQnr8YrzYjF2q99TEqxNPVv8b5DTPJai5I/ioQlH5MOR
X-Received: by 2002:a67:e301:0:b0:3b5:2fe2:aadd with SMTP id j1-20020a67e301000000b003b52fe2aaddmr10697651vsf.32.1671467037509;
        Mon, 19 Dec 2022 08:23:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671467037; cv=none;
        d=google.com; s=arc-20160816;
        b=CGLeTNnqIgllIkVcVB+0GedLg8Y7Sf5Z+mwtWMVqtemkTmYbiT/Al8zDjhm/qjlFae
         8Az8IZugWZWdJ3GRukll+/DvZ3fi602zjMw9P+v3i844Qpmt2YG7PBYh9bqNrJYN4Ows
         FRdynUnXaQ0pK84vSpUVhm4DJhuOuoNUbjuAo0oIQynASJFeBWfpdQABbv6yudMMEOOK
         H2wtGM43Z7fk2KAr2CFgO6Q2oRwWE9SQ7A/Ggt1N/DD9SYuQ7SGKmqI/bT9V9oRJd9a3
         9TFplpGp05DUfrDFit2MfWpK/vE1TwoqUDGyvLOai1BO6sKNH2pC0maM4y4n0FoBftUH
         GXHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=9jeJwacrw2WqDtInyXpswO/mEQQCwCkubjQWJs63pw4=;
        b=dbBTMVfqo9DP3q/8Vg5liI5LHsMpuRLUqVRPcDtUbnCsSRJ2bNoS7zC3xdFnOpTNkO
         QmD3NZoAyT6OUv8rPWTyFV+fUrj+sNHR8ut0uYcGxyeZLfQJ/2IBuEzXew1vuAS+NIzW
         c8qBZoMZE6l+ZVobit87SUhJtpHsmhlNdtqeipeMJV8r28NOEV7pZzJMxMhSUIhsQ6qd
         GyYKXr3wp1cKMHZx3Zdl9wsR0X4Nv33zQjVQPNFNMKSZ5jmI79CWcxKHqbSUW/09FBVX
         5gKPYDfYeVAept3YSUFjzJKkMZlfkse1tJJ3nyawuKW8eqIF19MgRyK4lUw3wFexm6Ke
         Ih5w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="eAQ/D40S";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b2-20020a05620a088200b006fb8db8f204si2400957qka.282.2022.12.19.08.23.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Dec 2022 08:23:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="eAQ/D40S";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p7IvP-0000jy-Ai; Mon, 19 Dec 2022 11:23:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p7IvN-0000jd-BT
 for qemu-arm@nongnu.org; Mon, 19 Dec 2022 11:23:33 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p7IvL-0006w9-Nh
 for qemu-arm@nongnu.org; Mon, 19 Dec 2022 11:23:33 -0500
Received: by mail-pg1-x530.google.com with SMTP id f3so6521350pgc.2
 for <qemu-arm@nongnu.org>; Mon, 19 Dec 2022 08:23:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9jeJwacrw2WqDtInyXpswO/mEQQCwCkubjQWJs63pw4=;
 b=eAQ/D40Syd0YA40dZ/P+VwghNSNrrkkC11VtAFcVCjEvnVlLItrgkzbUijxg2vkOUW
 wC2VhGSuN7sxbYi2ixjxQ12dihbVzzOkdCFdfr5lOUhA78a9wZFwNQv+SbdxyxD3XJHO
 bkuXuwPaqDx3zwxGuiQ4GkhBAWXsFQ5bKm8MaZcgGqAYnlTJL564CWQ7Gdcncbuik6fn
 uMuqs32tBGWTgm3EMz7KbgZdUoHtiO/RoTX0P5MMKmr97W12OYCqvnCi61DM7tN4PXA/
 s19lMIv5wwov95i0t9WcRicdClgp/PV3gZZYPIJRBCFoXpVN2t8rcKXb1taL2coylcHl
 WtwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9jeJwacrw2WqDtInyXpswO/mEQQCwCkubjQWJs63pw4=;
 b=NPt1QD1U9Qpqp45qqj9xFHEym9BIHZH3v38O7Req0SevkoJv5fBgvpLXgPZT4V4Ojn
 e8bBY9+2C+36fK826y+lw+wHzB8TSX19e7iyhtbWaKpkzN7z4QOf4uvkW4nKCtEgEn2L
 h+7Q+DQ6ehAfjLNXZzhr6udAYaxBwPJ1Jj+8E4nIsOlYLNNv+78f+Lm8WJWyL/qW/OeS
 bnaq9NboDDCXxxnEYRPDBfv7y3VgCmEaOJEi0BbPnca7dXAzH1stPlbuPRab/RYFoGDf
 v/wg2ZjNVgZEYxQYpXoA5X/H9m6Y7QOBtjvLNh7efyevVXLFyFXGFxZBHTH7oi2aGxB5
 nZ8g==
X-Gm-Message-State: ANoB5pkxm/KdqxzYXIla+ZY85tXop7dppOyVO1//mGkFN7bAlJZtDHBn
 lEyYq8PfD0kFVE9LQ11PWTj5ZQ==
X-Received: by 2002:a62:fb11:0:b0:56c:3696:ad68 with SMTP id
 x17-20020a62fb11000000b0056c3696ad68mr43403228pfm.8.1671467009987; 
 Mon, 19 Dec 2022 08:23:29 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:b343:d344:137b:e318?
 ([2602:47:d48c:8101:b343:d344:137b:e318])
 by smtp.gmail.com with ESMTPSA id
 x22-20020aa79ad6000000b00577617c05ecsm6804904pfp.130.2022.12.19.08.23.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Dec 2022 08:23:29 -0800 (PST)
Message-ID: <77355b29-8110-7d95-25bc-4a93a0d58f9a@linaro.org>
Date: Mon, 19 Dec 2022 08:23:27 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] target/arm:Set lg_page_size to 0 if either S1 or S2 asks
 for it
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Tobias_R=c3=b6hmel?= <tobias.roehmel@rwth-aachen.de>
References: <20221212142708.610090-1-peter.maydell@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221212142708.610090-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
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
X-TUID: KDEDpk8u3W6K

On 12/12/22 06:27, Peter Maydell wrote:
> In get_phys_addr_twostage() we set the lg_page_size of the result to
> the maximum of the stage 1 and stage 2 page sizes.  This works for
> the case where we do want to create a TLB entry, because we know the
> common TLB code only creates entries of the TARGET_PAGE_SIZE and
> asking for a size larger than that only means that invalidations
> invalidate the whole larger area.  However, if lg_page_size is
> smaller than TARGET_PAGE_SIZE this effectively means "don't create a
> TLB entry"; in this case if either S1 or S2 said "this covers less
> than a page and can't go in a TLB" then the final result also should
> be marked that way.  Set the resulting page size to 0 if either
> stage asked for a less-than-a-page entry, and expand the comment
> to explain what's going on.
> 
> This has no effect for VMSA because currently the VMSA lookup always
> returns results that cover at least TARGET_PAGE_SIZE; however when we
> add v8R support it will reuse this code path, and for v8R the S1 and
> S2 results can be smaller than TARGET_PAGE_SIZE.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Specifically, this avoids bugs for v8R if either S1 or S2
> MPU is set up with region sizes < 1K.


Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

> 
>   target/arm/ptw.c | 16 +++++++++++++---
>   1 file changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index f812734bfb2..2e7826dc29b 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -2655,10 +2655,20 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
>       }
>   
>       /*
> -     * Use the maximum of the S1 & S2 page size, so that invalidation
> -     * of pages > TARGET_PAGE_SIZE works correctly.
> +     * If either S1 or S2 returned a result smaller than TARGET_PAGE_SIZE,
> +     * this means "don't put this in the TLB"; in this case, return a
> +     * result with lg_page_size == 0 to achieve that. Otherwise,
> +     * use the maximum of the S1 & S2 page size, so that invalidation
> +     * of pages > TARGET_PAGE_SIZE works correctly. (This works even though
> +     * we know the combined result permissions etc only cover the minimum
> +     * of the S1 and S2 page size, because we know that the common TLB code
> +     * never actually creates TLB entries bigger than TARGET_PAGE_SIZE,
> +     * and passing a larger page size value only affects invalidations.)
>        */
> -    if (result->f.lg_page_size < s1_lgpgsz) {
> +    if (result->f.lg_page_size < TARGET_PAGE_BITS ||
> +        s1_lgpgsz < TARGET_PAGE_BITS) {
> +        result->f.lg_page_size = 0;
> +    } else if (result->f.lg_page_size < s1_lgpgsz) {
>           result->f.lg_page_size = s1_lgpgsz;
>       }
>   

