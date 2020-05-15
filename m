Received: by 2002:a05:6214:92e:0:0:0:0 with SMTP id dk14csp160418qvb;
        Fri, 15 May 2020 15:49:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwhS8loX+J9bQHkbBHdYcvu8jzdR4ogLj17MwSRUFZTKvwVDkIUxcOKCvMn8Hoy1FjT/XV6
X-Received: by 2002:a37:6690:: with SMTP id a138mr5792439qkc.152.1589582996699;
        Fri, 15 May 2020 15:49:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589582996; cv=none;
        d=google.com; s=arc-20160816;
        b=naakvNmo3iqiOTMYZJSwYPFs6BopW1Uh10NpG5vwIbO9Usws6vIZbL6fQBoFg8/mFS
         u4yEV6QcV3B4jJSzy4TL69E1OBXG/QmIYTphX2VcTK7tGXDQCdDScwM4nWyp+li+p3tO
         WsYZtX3tHyGdyQehDedGeK2mzWP2FKM3KNPFrUHA5ZFDu3k0a29xFIkp3bJyX8QghWy/
         ZLXBqJE2QjdAFpXRxr9tEoLA998RdPLkwctpza0itp5/m0lalVQLsJwrDf6kWhRU/VeH
         M815fUZTFxd3yUXSqhFGBcuMZC8a0TWvcWEVVIHokXYAgcuo6Re9/zKUBg71dZzePbh5
         KiNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=R72cI1LNjHoQ6XVJOuHXxzQMiC0tIJsRCfUGgOWKcPA=;
        b=OszMdgs+iIh8qk65+1EaEt5XdHpxMmSt9pdroNuEGJSU8qXBMW6jLzn5pY2UpO6pGT
         LPTjBRs+9BNFvjq1Z1r27Jw7wIXBANwTFV0nQq28Afqi4AzGQe3qRIpbnOGvApOKK2uc
         Z2sbcgM5dtP2yAtRfPZcAvy6SfZhPJ1DQ6xJrluc7rg1ZKa5lB8CXpzLtLvWuWnqDGTZ
         nQKYMS8ZfVNjLdhjoLRZnG4qGjXWBgV6uHGNdINEivAYPR3l468YhlgFn6Fq7sZnR7R6
         hDAyNS6mxKXL75E+0X1ep8lXfohhiFpXDSo2fue3UjePy4shJaE/pqzIJaBZtIDabh/y
         04QA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Thhe0Jgg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a138si2068470qkc.26.2020.05.15.15.49.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 May 2020 15:49:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Thhe0Jgg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jZj9Q-0004Z4-8H
	for alex.bennee@linaro.org; Fri, 15 May 2020 18:49:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jZj8T-0003Qf-OE
 for qemu-arm@nongnu.org; Fri, 15 May 2020 18:48:57 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:38509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jZj8S-0006lz-7H
 for qemu-arm@nongnu.org; Fri, 15 May 2020 18:48:57 -0400
Received: by mail-pl1-x644.google.com with SMTP id m7so1500226plt.5
 for <qemu-arm@nongnu.org>; Fri, 15 May 2020 15:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=R72cI1LNjHoQ6XVJOuHXxzQMiC0tIJsRCfUGgOWKcPA=;
 b=Thhe0JggEfdkklN0D9uvRERplbdyAi44cVjiGGAb3SCVCKLr5W1KaDXFqtIhCdM2Si
 Bw75/+AWPKzlJU0exVjkXBR/WsFvSCT9lAdqxcmFhI0n96LPFiDQ8X1faV1lPffHOd+m
 2dtqAPoK6P3bElGQGZRcIkeSp4YNvIKiUlrlloVc5fWXv/3OK2onmNVUzx/CntzgaAXw
 14Qetzl4MJ0FSvQWEnyiryfXn7/EHE7PrHTrBMx677ESfX4i2Qq5PM71Eugl34ju0VXH
 R5yrMpUUOnHKpARrKFtdOmv+Y8LxsKI0hB7vn8AaLYwUll9V11/ycWrGm7Ph+NrDb7nk
 iSEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=R72cI1LNjHoQ6XVJOuHXxzQMiC0tIJsRCfUGgOWKcPA=;
 b=OQAad9DUrN5TtEr4mx139i/rUvXmvdq4gGAKQizhOfxvr4ioS/HmnKj+FuyivwtAx1
 hgfg5SJv5j0+xSTK/NgK3/jC6cQXcCz5TuPpNVcaTjiCtCogtMdoQ08HsjVo3tRPTj5Z
 n5Zd8r/H3LqFbz8qG3cSAhsPZZBnPyJQJvX9ePRRjZ3JtQiKCEpZWeJeW8+KBDTBbCpc
 AhGjUxiFP/8wkvpagw+hoLpb0nx/zg5zLhbin5bM4EBXDSqSPRR7R1VPZVzx8Rq7z2yn
 TsLHa1dQaKe6KqjnPElIMgSIk01MfelvpwWG/O7mpw6PXVzuJfKryc0Xri2fUsDBYrGY
 a7cQ==
X-Gm-Message-State: AOAM5334aKFhen4hRqbuh9v/uFVgFvLpogjCCXEn9M7IZ11Lx9zF+1JL
 e4MpHXXzZK1NkhGl06GKRsmInQ==
X-Received: by 2002:a17:902:b217:: with SMTP id
 t23mr5968367plr.132.1589582934560; 
 Fri, 15 May 2020 15:48:54 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id gv7sm2285455pjb.16.2020.05.15.15.48.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 May 2020 15:48:53 -0700 (PDT)
Subject: Re: [PATCH 03/10] target/arm: Convert Neon VSHR 2-reg-shift insns to
 decodetree
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200515142056.21346-1-peter.maydell@linaro.org>
 <20200515142056.21346-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bb092cca-f5cf-f0fa-40ff-56b405e5035b@linaro.org>
Date: Fri, 15 May 2020 15:48:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200515142056.21346-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::644;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x644.google.com
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
X-TUID: xbXv5NzMTyLG

On 5/15/20 7:20 AM, Peter Maydell wrote:
> +VSHR_S_2sh       1111 001 0 1 .  ......     .... 0000 1 . . 1 .... \
> +                 @2reg_shift size=3 shift=%neon_rshift_i6
> +VSHR_S_2sh       1111 001 0 1 . 1 .....     .... 0000 0 . . 1 .... \
> +                 @2reg_shift size=2 shift=%neon_rshift_i5
> +VSHR_S_2sh       1111 001 0 1 . 01 ....     .... 0000 0 . . 1 .... \
> +                 @2reg_shift size=1 shift=%neon_rshift_i4
> +VSHR_S_2sh       1111 001 0 1 . 001 ...     .... 0000 0 . . 1 .... \
> +                 @2reg_shift size=0 shift=%neon_rshift_i3

It would be worth creating new @formats for each of these, since there are 9
uses of each, between this patch and the next.

E.g.

@2reg_shr_b    .... .... ..00 1... .... .... . q:1 0. .... \
               &2reg_shift vm=%vm_dp vd=%vd_dp size=0 \
               shift=%neon_rshift_i3
@2reg_shr_h    .... .... ..01 .... .... .... . q:1 0. .... \
               &2reg_shift vm=%vm_dp vd=%vd_dp size=1 \
               shift=%neon_rshift_i4
@2reg_shr_s    .... .... ..1. .... .... .... . q:1 0. .... \
               &2reg_shift vm=%vm_dp vd=%vd_dp size=2 \
               shift=%neon_rshift_i5
@2reg_shr_d    .... .... .... .... .... .... . q:1 1. .... \
               &2reg_shift vm=%vm_dp vd=%vd_dp size=2 \
               shift=%neon_rshift_i6


r~
