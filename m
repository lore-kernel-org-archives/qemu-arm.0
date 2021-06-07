Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp3844983lfa;
        Mon, 7 Jun 2021 14:19:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxVUEu8LxKbcBp5zPKQVyAGAEPkOyj6vck/4+GgGAsyRlobeOyebefagVQEGyoLtHMkZmWe
X-Received: by 2002:a02:a501:: with SMTP id e1mr17787361jam.96.1623100758253;
        Mon, 07 Jun 2021 14:19:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623100758; cv=none;
        d=google.com; s=arc-20160816;
        b=T+5mLDFl2eCmW8UL6VjVLycoJxowlDAm0iQ8krovDTNu7DzuyKbRhXF4/NZNXkObeb
         MVnI15oFwMCyHopdxIfASpu3+TOwpFcjExfsMii7cA668yrURDVaeC4C5YQ898HM2HBM
         HMeSQWoPvbY6ERB153OV4W7iZAqF33WJAEbrvTzL+fZHIXpZ0lZnmzEd0oEsh38he8HW
         teTsKehTez5xcEDwP961fMjfbQ9imZTzVjkyeLuPMACVXnDcKZdgjew8eKppXeOjphD+
         6BtZgbFh0JrE5hfP/4/wNyUgPBird27drggKAE2Apfsg6rycryxvtZxAlK0KotHfWMxS
         SQsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=JlFsy46jLLFrpGtbMMHWfQ7VG0oLfPsiz0n2d5lKWFI=;
        b=Sa1lvw4jmbAybRQ9qfD8IsmhXwKxUb6LQmQKWMl6yWyh5wh32FOrspecaMAtCl1dUn
         M5k96KN2mOYijaoI4IcRxhI/WQvuQ6j4YpkirxM/KdzjZ581kCOam3CWqGih1Xz40mRf
         sEj9K3UPTkzTg2ylYakxgFSs3JQyi8JPN7i1i07HVqLqrlYf1DuhBYN8BJLgigdzenCI
         JzjSNxCNqXlsvc1iVLrK1ICfHDLCtiCmLMPRQUHCgjfOe8Zi8AK4Bdw7c22KChmpcgwf
         7m7WqIO4X5P59mJDn49w7lNtH/jEY5jgIDyl4RCQF2WjOcx+x6cmBN7/V9jGkSvthwI7
         BM/w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MIePrU9z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n1si4055072jat.109.2021.06.07.14.19.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Jun 2021 14:19:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MIePrU9z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lqMeT-0006CY-Iq
	for alex.bennee@linaro.org; Mon, 07 Jun 2021 17:19:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqMeK-0006C5-Py
 for qemu-arm@nongnu.org; Mon, 07 Jun 2021 17:19:08 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:44633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqMeI-00076L-Rb
 for qemu-arm@nongnu.org; Mon, 07 Jun 2021 17:19:08 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 h12-20020a17090aa88cb029016400fd8ad8so873061pjq.3
 for <qemu-arm@nongnu.org>; Mon, 07 Jun 2021 14:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=JlFsy46jLLFrpGtbMMHWfQ7VG0oLfPsiz0n2d5lKWFI=;
 b=MIePrU9z4EMjf/NoTmsQaT/2fSxdbagm7rXYSLKTV6EHVpYR0iz8zS/ai2WL1UEGOG
 j7z5vj0Jv0fEx6vDJqRc+joJ1vihHXP7G7/gQfi9jD+yR0QGtiV5sG5sHiy2S3hLg4Bn
 Le+gHto6Pajpz8G2cwuRxtp4+KDDeS0x3r2Y8FQWtqqGEC7Qm8gzvFVZ0kh85AhAs0EQ
 X/A6R+DDQIxWoAfQhBoLyzXbXTIiRpheIEWLzkQ/Sr5XN2Ohlda8A0yPIAOA0mLDCdKp
 ULQnZM/imnK91KdNuzJTNc58bHLOZNZzRXHpCGevsZ8qDnOwc1bk0sgIA/tZgGCqMR0b
 YCoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JlFsy46jLLFrpGtbMMHWfQ7VG0oLfPsiz0n2d5lKWFI=;
 b=BpuGmJef4mNZojKXyyTh72EkxOXbcNdLNW6F8D7iVy2tPwcL7bw7HmG7eZQmG+gE+l
 X2bsqZ8CXllt1w7iv7veQaiKcIfdIHVpMhNcxDPnv5YZA4sB3nhpzQXGvMzosDlaYq/p
 H1qjge0QgGEYrumh6+J0pJUK/JZU2waE2tvMlpCCypGwNGMTe5Izx/hkbokFmbffdOQa
 F95AwL1gr39S1KMztJ0CNQHZep7N37FCVNiwvbqg4mDP8jdZdQmpsJyUTziAOp5YG3/a
 EE77FeKhr/SLz/I+Qz1zISQAX1Cx5we/ytgY3QIfvFKpHgVKNGLxTN0m9NOp8lmflcw6
 dyPQ==
X-Gm-Message-State: AOAM530dLE54iWvBnFkOAtQsdco1Smrb28uUonNTXrIfsrg6Bb2tGzBx
 CQ68hhP7AGwuOgRUvCkqWgvf7w==
X-Received: by 2002:a17:90b:17c2:: with SMTP id
 me2mr22796738pjb.176.1623100745190; 
 Mon, 07 Jun 2021 14:19:05 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 f6sm9037601pfb.28.2021.06.07.14.19.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jun 2021 14:19:04 -0700 (PDT)
Subject: Re: [PATCH 03/55] target/arm: Handle VPR semantics in existing code
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <23ec05cc-55d3-f343-d834-aa40f7685b37@linaro.org>
Date: Mon, 7 Jun 2021 14:19:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607165821.9892-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
X-TUID: WU4u2IjihrYH

On 6/7/21 9:57 AM, Peter Maydell wrote:
> @@ -410,16 +415,19 @@ void HELPER(v7m_preserve_fp_state)(CPUARMState *env)
>       env->v7m.fpccr[is_secure] &= ~R_V7M_FPCCR_LSPACT_MASK;
>   
>       if (ts) {
> -        /* Clear s0 to s31 and the FPSCR */
> +        /* Clear s0 to s31 and the FPSCR and VPR */
>           int i;
>   
>           for (i = 0; i < 32; i += 2) {
>               *aa32_vfp_dreg(env, i / 2) = 0;
>           }
>           vfp_set_fpscr(env, 0);
> +        if (cpu_isar_feature(aa32_mve, cpu)) {
> +            env->v7m.vpr = 0;
> +        }

If the vpr does not exist without mve, is it cleaner to simply set vpr 
unconditionally?

Either way it looks good.
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
