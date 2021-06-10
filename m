Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp129511lfa;
        Wed, 9 Jun 2021 20:50:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxnDt23l5CLeAAq54vxTj7a5moeNZRn15wKYLmEaTa0oJydjIm0M/4hdioSpVQxR7AQUtVN
X-Received: by 2002:a25:be09:: with SMTP id h9mr5043782ybk.239.1623297040836;
        Wed, 09 Jun 2021 20:50:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623297040; cv=none;
        d=google.com; s=arc-20160816;
        b=F86/GTO0KtPzPPQumtAjk04CPWifu6hAks2kDxr6KFHUiMkzbNhu/Y8onuyb0gYbWw
         7dg5G1lCK0JWFuAdxz9+kEv9whNGYfJQ1J0y/g9somQlCvwfC9BBCe06DvMjo7Af7obu
         y3J3BOOFPSwoteWm3P9aS247peKYi76U13oT/Wzoscnld9i+4uMjbpAqRGjKf2Zhonbn
         wuxkoYx8eeJLrPANy/K5Gg91Zhq19htYYei2kzzolLXmf0A17naiNTLxh5gh3UFaZOR3
         rpNLEIIFBcm0ZttSd+FnTZSHh1liwiLlGuCL4mD81BepBVcawhGDqW0TazE1QDoB4RcG
         tSig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=l4/jWOyjQmQlDclsx4aTDyIPuRy7h8zqZ6ItTNz8Nmw=;
        b=OJvd84W3nt7M4/gt4J3GInkQ/2O4rL5PQBmqmY8Va9jMTB435Stbi/+n1/aiyKrICc
         p/e8fxIInGcy/MGdzhuX5Q5iHivHf3FLrIUdHtqmjyoPc+q1y2FpAiCWw/uxt1nq1PLB
         /Wmy/jh74cZP+/tkEis3rdCKqTuO4dGORN5P8NAHDkTXaHptAWE+kFaSuPcdcHnzCU+Z
         bZW/uGTnO2wyqFEksHSUSEEm9AbcHVG9FctXbfOixvscQ2doOj1cF/UUhgLWoNeJm1JE
         SObboxuJaxo4cTONCdGi3cGQzGxizvzM8nRsxpFT1wRnFkgMtfn/XlQPzDaRvGUkr8JW
         7ozQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZbTKAQPs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y188si1486287yby.33.2021.06.09.20.50.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Jun 2021 20:50:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZbTKAQPs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lrBiK-0002av-74
	for alex.bennee@linaro.org; Wed, 09 Jun 2021 23:50:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrBi8-0002an-Vx
 for qemu-arm@nongnu.org; Wed, 09 Jun 2021 23:50:29 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:40702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrBi7-0002v2-BV
 for qemu-arm@nongnu.org; Wed, 09 Jun 2021 23:50:28 -0400
Received: by mail-pg1-x536.google.com with SMTP id j12so21465046pgh.7
 for <qemu-arm@nongnu.org>; Wed, 09 Jun 2021 20:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=l4/jWOyjQmQlDclsx4aTDyIPuRy7h8zqZ6ItTNz8Nmw=;
 b=ZbTKAQPsdghW/ClHgVcsZWRx6MBS7428YZaDI24xjn/CE0/nDsuyxbMj8b8+ApdMil
 5tUAPjOTKv+bv1/Bp3vvHQoQ62GfIt0/wjustBLTCPYMmv/v2xa4KM6A25IsptnMOwnM
 ake6IBxgDhPEerzC9+pPvWahdelWUKD003BICHxExMopqChypNTI1lg3s1J8BH7wIqWx
 aPr7gTadrCuo1KmVYLPTM+ALx310FX8+qM86fTljyMp2HhNdjZNkvjd0Dpjc9jB+9Jez
 eJy5B0GMz6X5/Z7T4RVo9YLDtox2GEwzO48j4tu3qhO0Sg/RwdEpQpbiEKcZNJqKxRMt
 zL6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=l4/jWOyjQmQlDclsx4aTDyIPuRy7h8zqZ6ItTNz8Nmw=;
 b=jr5gwjVxR+CLE+3QBweZPexyT+J+TrQW1p3mrYi2Ozal77F0atX1DNBBv09stiiyVm
 48azPuo0q67goOai3UXdNNvISWcgYSYLCFMNlg5MM0thrgHiGiIxzAfZl2P66+QYl0by
 XCUrWuGLIuK/E8+lJzUw/Mk8cjckE0tdxYWemuxLTfoTygsg1kx2CW5OyHneqswLg/hf
 lCgcPcobxop+ohK/MLevOYrgdTLxRkletwvA3le7LCWeXB+LC4nlt4QhFCqPqFeK8+VT
 U74ffOZjlM/vbuE6RlsehaqBevZGpL8G4yhFRm58IHJ/ssaqjnDVitYCOTZBDN7yQIC6
 jlEw==
X-Gm-Message-State: AOAM532WzdjLdMe6bLVd9GCEo5/NU+PAY6OzY1iE/q9tyqb5cyKWHlUQ
 pEJypwwjsgc8qYh++B1G6o6Kkw==
X-Received: by 2002:a05:6a00:ac9:b029:2de:a06d:a52f with SMTP id
 c9-20020a056a000ac9b02902dea06da52fmr1042173pfl.4.1623297025041; 
 Wed, 09 Jun 2021 20:50:25 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 k25sm852554pfk.33.2021.06.09.20.50.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 20:50:24 -0700 (PDT)
Subject: Re: [PATCH 53/55] target/arm: Implement MVE VHCADD
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-54-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <aa1f6cd9-3c15-8dd5-90a1-86448c077531@linaro.org>
Date: Wed, 9 Jun 2021 20:50:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607165821.9892-54-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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
X-TUID: 0PC1vfLaFyuz

On 6/7/21 9:58 AM, Peter Maydell wrote:
> +#define DO_HADD(N, M) (((int64_t)(N) + (int64_t)(M)) >> 1)
> +#define DO_HSUB(N, M) (((int64_t)(N) - (int64_t)(M)) >> 1)

You've already got do_vhadd_[us] defined from vadd[su]...


r~


