Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp2369651lfo;
        Mon, 14 Mar 2022 12:30:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxfYsb3yznhpjru1dq/j+5lrc5bXRQRR4+GPb3Gr8cRzDHsgoCQhmgiH08clYaVXn2ekvbG
X-Received: by 2002:a25:a286:0:b0:628:f1b2:f3ad with SMTP id c6-20020a25a286000000b00628f1b2f3admr20346263ybi.22.1647286221213;
        Mon, 14 Mar 2022 12:30:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1647286221; cv=none;
        d=google.com; s=arc-20160816;
        b=I6XNNpQQ6xevwQ4JqUvI4Lhgw6vJOBFmK+EuPK24rwQSuKDAhnpAy/3KgssKS0G+S7
         yO0cJ4vq9hBQrvizwcsFU+uJDhmXb4Mad9OQuMA1Sgi6jIz+kU11IEbHWicXC5yuwJUn
         JdeMNFAc4zIO7jQOwUv911PzlirYaB36/2rK476pg/Us9WwcXY7MAE2ft34XiOReKQHM
         meL6ABN6IkP2qZV43Snx5/hOsxrpe0xUnUaagOcebiU7ZyjfWAF78Dko7uI3QpbD1HKi
         aSIEMZCpMKdtTAQr2HyTBwcIpbSgigXQ4kJjxnSq15wejb9ZqRS18/Gdz7C9BaK7Fkt+
         jVzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=WGddOskTLE2ZfjWdwgAXfLnT6wv8yODluu7bGd/q1bc=;
        b=aa4OjhMN5SInHkMfdfvsc5c0OeOS5juWU2Z5MpZv1N/my+0sSigT1MFi5//RI3NCEQ
         mTfDjPfEXGRE8L5F2GZRe2O4Jy4soSPCzq1f/+pvJv5x7WUHFvY1O69m5O3FbNQbz9sQ
         StnAzgZNn1vqFSW7uQTUH2P6646onHgQ7UQNoqEZ670V4RvkJ9vktd4EcoihesDRD1Wm
         F2m1g3eyeFKiTt239aT2Oc7b4P/J8EoF4wjYXdD/+5p3RtDrO5++XbwSknKNhw7fd6/B
         UJmvq9hjMQmKsG3Rq2udmbH7zs434Mv5L6mYF58l1HgVw1oG3MX8BJzbhZ8MFgWM26lj
         TDkg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rf8bVEim;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z3-20020a259cc3000000b006294595ae44si10320542ybo.584.2022.03.14.12.30.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Mar 2022 12:30:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rf8bVEim;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nTqOa-0005TF-KT
	for alex.bennee@linaro.org; Mon, 14 Mar 2022 15:30:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nTqO9-0005Sy-RR
 for qemu-arm@nongnu.org; Mon, 14 Mar 2022 15:29:53 -0400
Received: from [2607:f8b0:4864:20::42b] (port=33517
 helo=mail-pf1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nTqO8-0000DY-1E
 for qemu-arm@nongnu.org; Mon, 14 Mar 2022 15:29:53 -0400
Received: by mail-pf1-x42b.google.com with SMTP id s42so15754204pfg.0
 for <qemu-arm@nongnu.org>; Mon, 14 Mar 2022 12:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=WGddOskTLE2ZfjWdwgAXfLnT6wv8yODluu7bGd/q1bc=;
 b=rf8bVEimniJ3nFs1VMQFbivLIm/ehVWFElqb1N4bWk7RswviUTk5xEs0blpdNucW5X
 95kolBMqABZBpJ3dz3z6XWu7UtWMe0TpluofdrFwCzpcSdMe7vN054vpip5MKjcPGunI
 FS0Mue15yZY7sYIibtko7V00hn3KzSSZmUuiLHCXEVJwLUJqXUrs4r8iOsgioe9J7oCn
 q3TyfrGzRU3+WpLaaXqJgPVlVsmD51ZsTJ2Fq2FYOikf2lUxsf3+aQ5LWdP2ecF5R2zG
 GF6SttXBJkp3Uq1pgXkwqq07g2LtMAuZb0I9sMzgCCA5xdatTd2f/+vynpBBxau7tsjA
 pDag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WGddOskTLE2ZfjWdwgAXfLnT6wv8yODluu7bGd/q1bc=;
 b=7C3N/vcFU0iYPLoyPviyhLVWTwUanzrAy2FCkpgH4uSdYg+Zwuf6FSugK2lCXO4EYt
 MtorQGEDt6cQ1XlF/oWtdNrEqci/4Q8mzlnDQ1X2xjEnBlBP+dudV9HdBvAY8WNsN+pX
 tkyc0P9x6NNw/ANH/JV3k7SlsNTnHyiaOuZ4EGnHvSrx0GSqsVlpWBSTNC9DCCNUbV8v
 sftEaoT7LoLGHJkKIp0loD1zpNfGDPlngGMNKNY9YAg037Cow25jdTSvWUgoi2XM/0wc
 bfJ4IUZOQkiJ4bC1/0zx06S5ohwuOfa0KjxJnRr0oVs63pUifRBV6z9UNulGpHAh4j3d
 GZlg==
X-Gm-Message-State: AOAM532K8cHaDVVRJZhX7YVCpl2whjXtEWD5t35ro8Bi2ul3p8jNPK7F
 ZJLX98Gt31zIaE7JoJ+ZC9tgAQ==
X-Received: by 2002:a65:550a:0:b0:374:5324:c32d with SMTP id
 f10-20020a65550a000000b003745324c32dmr21191026pgr.61.1647286190607; 
 Mon, 14 Mar 2022 12:29:50 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 o17-20020a639a11000000b0038160e4a2f7sm270219pge.48.2022.03.14.12.29.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Mar 2022 12:29:50 -0700 (PDT)
Message-ID: <942e09d4-13c9-d36a-b54c-920e570dcd38@linaro.org>
Date: Mon, 14 Mar 2022 12:29:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] target/arm: Fix handling of LPAE block descriptors
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220304165628.2345765-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220304165628.2345765-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: taonwaNwZFEr

On 3/4/22 08:56, Peter Maydell wrote:
> LPAE descriptors come in three forms:
> 
>   * table descriptors, giving the address of the next level page table
>   * page descriptors, which occur only at level 3 and describe the
>     mapping of one page (which might be 4K, 16K or 64K)
>   * block descriptors, which occur at higher page table levels, and
>     describe the mapping of huge pages
> 
> QEMU's page-table-walk code treats block and page entries
> identically, simply ORing in a number of bits from the input virtual
> address that depends on the level of the page table that we stopped
> at; we depend on the previous masking of descaddr with descaddrmask
> to have already cleared out the low bits of the descriptor word.
> 
> This is not quite right: the address field in a block descriptor is
> smaller, and so there are bits which are valid address bits in a page
> descriptor or a table descriptor but which are not supposed to be
> part of the address in a block descriptor, and descaddrmask does not
> clear them.  We previously mostly got away with this because those
> descriptor bits are RES0; however with FEAT_BBM (part of Armv8.4)
> block descriptor bit 16 is defined to be the nT bit.  No emulated
> QEMU CPU has FEAT_BBM yet, but if the host CPU has it then we might
> see it when using KVM or hvf.
> 
> Explicitly zero out all the descaddr bits we're about to OR vaddr
> bits into.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/790
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/helper.c | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 088956eecf0..b5c8caafe84 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -11706,11 +11706,17 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
>               indexmask = indexmask_grainsize;
>               continue;
>           }
> -        /* Block entry at level 1 or 2, or page entry at level 3.
> +        /*
> +         * Block entry at level 1 or 2, or page entry at level 3.
>            * These are basically the same thing, although the number
> -         * of bits we pull in from the vaddr varies.
> +         * of bits we pull in from the vaddr varies. Note that although
> +         * descaddrmask masks enough of the low bits of the descriptor
> +         * to give a correct page or table address, the address field
> +         * in a block descriptor is smaller; so we need to explicitly
> +         * clear the lower bits here before ORing in the low vaddr bits.
>            */
>           page_size = (1ULL << ((stride * (4 - level)) + 3));
> +        descaddr &= ~(page_size - 1);
>           descaddr |= (address & (page_size - 1));

As is,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

though I wonder if it reads better as

     page_bits = stride * (4 - level) + 3;
     descaddr = deposit64(descaddr, 0, page_bits, address);


r~
