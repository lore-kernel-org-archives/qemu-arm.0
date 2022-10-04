Received: by 2002:a8a:1930:0:0:0:0:0 with SMTP id be48csp446214ocb;
        Mon, 3 Oct 2022 20:54:18 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4zU8iaB0mHWDmt7FLHjZhxQn1Dzq3KSDsD1AGuycGUOazTO/39K/3Rai5hB80w0p9Oyab5
X-Received: by 2002:ac8:7f14:0:b0:35c:c557:df78 with SMTP id f20-20020ac87f14000000b0035cc557df78mr17830831qtk.209.1664855657973;
        Mon, 03 Oct 2022 20:54:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664855657; cv=none;
        d=google.com; s=arc-20160816;
        b=L3qI1hOzOBoQZiDNxwefmPl1eccEmNIm/ionrUNF6Fs3jg+jkVLqD6OZxHFz3wStHh
         4x87u1+2FVtZR4yeNPrTZ+sE9hne8w6Xqo6ZE+axNlxRKQcMkATGpTwZ45HLKmyRwStr
         bAAwo7Ebue/Y1u627ItwJ+ae7PXeTRFJOw/86WQDf/gcZDZgcvW81KSo8IIGQ+hg7E6Q
         kc+hILiSlwwzAhs8aIsTGyj/gwwzmpUWcLSXAh94zOnr+XqqH8TwyGoDUBW6/wt+aMpp
         OyMD8+lfvIqXx6RDGUYK5Q8dF29zutGgxbrswUYG1YmJ2rRDqjme7bFXqVyIRMXoHWrQ
         AYLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=NrsqlHT+SWorq2vMGLKkcJ9jxUhHgPTnKBoMnpFY1yI=;
        b=zuXOb8p+80plzF/59KISkevIz09kVE10BTQk6MmDJJY+YJzS+KTd1pTDkodBZLP9yy
         GKoS8pawiHRuXFmbeGWJQdsM3cmeeb0cZQwD0EMUZC8X6WHPsMrdddyZD8FqueHLcFIL
         3kAlK81TNe8eZLqg8NI1v3nwn9YZqHKNyJVg38JOgr6ScsVIDV6JMAnRI0dQYUkEfvfk
         Je0yimeUoXSPsr2qXoFhavt9RYrdQovbL01mXTqU03kMFra2Tc0lkPyEyhtiCjwR1WQS
         Zacq2nk2qQ91+Z752QoFzgZIj1ddBkZpk7NCf2sBxnjYzCgO3ZWkZZ5XVVH8IFeA9cCM
         q4NQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BqMdwXFo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v15-20020ad4528f000000b004af8746052fsi502629qvr.505.2022.10.03.20.54.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Oct 2022 20:54:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BqMdwXFo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ofZ0b-0002ce-Iy
	for alex.bennee@linaro.org; Mon, 03 Oct 2022 23:54:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ofYof-0004vU-Aa
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 23:41:57 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:38836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ofYmh-00065Z-Hh
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 23:41:55 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 x1-20020a17090ab00100b001fda21bbc90so17402315pjq.3
 for <qemu-devel@nongnu.org>; Mon, 03 Oct 2022 20:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=NrsqlHT+SWorq2vMGLKkcJ9jxUhHgPTnKBoMnpFY1yI=;
 b=BqMdwXFoE8RJ7aPMF27LGIvI3DDDCazkvNPS9Fb864+fzi4P88LJ4Md+IpKHF9PSfP
 HIQJRQzrpz3W19w/TG69s4rW8WX9S5zm3bwsYXFDlLMtY+Kx1zHRIpaC30uvI5+I9Kdu
 q3E4ZVbMqGWGjenfm+JO8r27x9BoA0+IqcuMRlfVdOE+HebVoHT2edlrATuc+SrWpRgH
 i2w6LKymT7SKMxBR0tMXCLuDX1ahPo6YxA558tu4LNZPlvSvMUOMUQgHE5UXuacULPXj
 CVT02KKFuVfr5lQygMgw/IabZVPkRXiTXKJ9e7PoVYJSMVb8Q8iiG9aySur6ZsTD8eBj
 /R3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=NrsqlHT+SWorq2vMGLKkcJ9jxUhHgPTnKBoMnpFY1yI=;
 b=mLNEheZYujiEtybHDi7wLPwU4edIuHS0JH8DU9iPf/r6I+22LwEv6sYhlY0FOeC2aa
 fnxItq9PyQvthBF2PgtFKDL562w9UbsRNfyKWfJtCLz8rLmRjWG2KCVrxUQv7FewzRkJ
 s7SDVhoHfmH8rPZZ6KNiWAZ8F9lxgSz402MbBiq0s2LNH8nyXBWS21p5Rbhs0gQBm/I4
 9MvHurmcc+iOiQF1zhbENldKqNAzFS7fveHVKPxsS+QM6efX/VCF4GcC1pG5MAxLngw4
 kZKhE5DkfkxkpqZ2QJ+SGxztSnt1SXp/3/h5iQdn2pWGGffs8zHCRVE8iENkFczBwJzP
 6A/g==
X-Gm-Message-State: ACrzQf3aAPiohwB36lv5hr9eaZdAf67iCMYtA21Jv0c8PKSfoBHtD+eV
 M1pXGUjr2IjgcUEoR5Y2bQui7Q==
X-Received: by 2002:a17:902:f64d:b0:178:a963:d400 with SMTP id
 m13-20020a170902f64d00b00178a963d400mr25788383plg.6.1664854793904; 
 Mon, 03 Oct 2022 20:39:53 -0700 (PDT)
Received: from ?IPV6:2605:ef80:8013:3067:f071:7cf1:b2a:fad?
 ([2605:ef80:8013:3067:f071:7cf1:b2a:fad])
 by smtp.gmail.com with ESMTPSA id
 200-20020a6214d1000000b0055abc22a1absm5593470pfu.209.2022.10.03.20.39.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Oct 2022 20:39:53 -0700 (PDT)
Message-ID: <95da790c-e4f8-9d4b-d6aa-e06f4ec40ddd@linaro.org>
Date: Mon, 3 Oct 2022 20:39:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 2/3] target/arm: Use ARMGranuleSize in ARMVAParameters
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20221003162315.2833797-1-peter.maydell@linaro.org>
 <20221003162315.2833797-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221003162315.2833797-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jT+9M1prnYvJ

On 10/3/22 09:23, Peter Maydell wrote:
> Now we have an enum for the granule size, use it in the
> ARMVAParameters struct instead of the using16k/using64k bools.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/internals.h | 23 +++++++++++++++++++++--
>   target/arm/helper.c    | 39 ++++++++++++++++++++++++++++-----------
>   target/arm/ptw.c       |  8 +-------
>   3 files changed, 50 insertions(+), 20 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
