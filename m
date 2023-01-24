Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp4021393ejc;
        Tue, 24 Jan 2023 16:00:10 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuOxf8KFTGiJpCxIETiLY3dqhwaAt88mkwmFShgTA08eaEbssqXKX9uQN/abihq0GS/fvbH
X-Received: by 2002:ac8:7a86:0:b0:3b2:d1fe:90c4 with SMTP id x6-20020ac87a86000000b003b2d1fe90c4mr43006939qtr.19.1674604809855;
        Tue, 24 Jan 2023 16:00:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674604809; cv=none;
        d=google.com; s=arc-20160816;
        b=h3up/i22VYNr+ZELsU5iZvKxngKeE4sbx/JDGrx71AuvPn6fTIomGBXRWNpBr54e0v
         XQ31dyhViQv7lkKg7e8HTQlktxhZSOJHe6ZDkHLCffWgTJvbDZVyQPHJaGP5PnmW4o1Q
         WkUkx0XixntxlzR4tYURLQBVqeunS9M4C96wFPo0mMmHLKHpPsJaflhyFWa8h4zc5hX3
         aas13e8txXIEjmUYi2dQE3XsXugVWH1ATBVB9OdsHVayNp3ta2TZO9llZWTxl9JJjIK/
         v3ewOfD0wijzL46ZCOCaxCNI3gU0m15SJWliJLPU7p9/oaTHSFYoQ3ctVUBsHpGhJRYY
         RAbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=UOLr4pyyy5L8mFmpt5H+tPhyT7qOp1R7U+s5bkD1dac=;
        b=U4xwAyDelAoQr79p5orppSEWpdI601soO+Ee1oDIRkWr3Ro0TfDV2DKoYM+495+ibE
         x8KZ8bdaMzusSXGEoV0b/oSOkajmW/olU2gSCdyGFy23DjlSJKrd7Zui0QVtFFc1xboA
         cg7XKNhkJd0eJMFPLEGM2qcDxG3waCVxri0eVLLkESIMx79XLEppZztxoIPu874oKiS1
         /KQKpu6Dg79N+pojjMA/tAek9fcSEsulWixvt228b7a2d6wfh+ZpD1MY+injuqGZi4FU
         Ym1LswECDmTj7ueo6wfaebSxu3fGlMHJFzWIFey5kaXoND7NAdF1h7jGBHN9gPClxel3
         z9hQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Uk9LiKX7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c8-20020ac853c8000000b0038e72375b07si2434355qtq.692.2023.01.24.16.00.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Jan 2023 16:00:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Uk9LiKX7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pKTCX-0000F7-UL; Tue, 24 Jan 2023 18:59:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pKTCW-0000En-Jh
 for qemu-arm@nongnu.org; Tue, 24 Jan 2023 18:59:40 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pKTCV-0006s3-2o
 for qemu-arm@nongnu.org; Tue, 24 Jan 2023 18:59:40 -0500
Received: by mail-wr1-x433.google.com with SMTP id bk16so15450415wrb.11
 for <qemu-arm@nongnu.org>; Tue, 24 Jan 2023 15:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UOLr4pyyy5L8mFmpt5H+tPhyT7qOp1R7U+s5bkD1dac=;
 b=Uk9LiKX7s4imRxiYutE95es79mophIDUifZbIi88dB81LI3dBUhmmN7gWQ10/+ni3R
 iDXwwr46kPNqk+LGPg+FQ+TfoyZtKtQHtgnLqVsph14Wv8L59rxIpnbBEYO5IVgnTrqX
 Ul7YWuHDh02Ex68hFIp4kWF4i5NY7SKdEUji1hc5KKRRBRXjwXqsI2C3WOlfKIEfEIwu
 qKyqLipuOwuSSuW0CyEF12l93fX6bHzKHMjlSKOgq9uWT4nkSiBSfitPDHwA6IZT09r1
 6/3OUHTHeRHlBRAQs9YHgjNieFRnqANqeyjGz5loO4/UIyuMRApNVzaIGiNPJTERUjzl
 jLTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UOLr4pyyy5L8mFmpt5H+tPhyT7qOp1R7U+s5bkD1dac=;
 b=L9ndpo//xPPAF9AnnHYgBmw/2rbxQ4kxYihRz+9JTdvWL/NudzIMU7kCkQXNsEjDoW
 TcMrMiRsVjkdB2LimQCXJydo0fjJrjU6TtiBaX55blnr1/tqoMrlShgbF1sdlHicPjgZ
 u1+5pFuGR/ltxakji03pgwbB0xEsHEIEbBtqkgxVySDtVxhBXGwLrfQDPUC/Ha07lzyl
 GQ7LfdNKDeAG9dh1om0ToK1GX9+ZA20p6xaBfW/18we+TLi2DvdEyh+9t4XOL2uKC+1a
 2H6kZafqzvBLaGhNCbfa/45mAvpPUBPhRmT2AWVA7GdrYfGnQ4USQd9rJ7g8mNSWe3Fk
 hh1w==
X-Gm-Message-State: AO0yUKXHtbJfCP8QJyoB8Hyh+PeX6Yxnu8BnLXtdQixLfTqHNWVQl5WJ
 u+I6SfWnnBqvrE8GWJHvZeK2AA==
X-Received: by 2002:a05:6000:1c13:b0:2bf:afaf:9d71 with SMTP id
 ba19-20020a0560001c1300b002bfafaf9d71mr3817917wrb.48.1674604777522; 
 Tue, 24 Jan 2023 15:59:37 -0800 (PST)
Received: from [192.168.0.114] ([196.89.153.183])
 by smtp.gmail.com with ESMTPSA id
 t16-20020a5d49d0000000b002bfb0c5527esm2409267wrs.109.2023.01.24.15.59.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Jan 2023 15:59:37 -0800 (PST)
Message-ID: <32faa412-7b03-2f91-fde6-024be8276488@linaro.org>
Date: Wed, 25 Jan 2023 00:59:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v4 08/36] include/qemu/int128: Use Int128 structure for TCI
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, pbonzini@redhat.com, eduardo@habkost.net
References: <20230108023719.2466341-1-richard.henderson@linaro.org>
 <20230108023719.2466341-9-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230108023719.2466341-9-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: EvnOufX6b3kq

On 8/1/23 03:36, Richard Henderson wrote:
> We are about to allow passing Int128 to/from tcg helper functions,
> but libffi doesn't support __int128_t, so use the structure.
> 
> In order for atomic128.h to continue working, we must provide
> a mechanism to frob between real __int128_t and the structure.
> Provide a new union, Int128Alias, for this.  We cannot modify
> Int128 itself, as any changed alignment would also break libffi.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/qemu/atomic128.h | 29 +++++++++++++++++++++------
>   include/qemu/int128.h    | 25 +++++++++++++++++++++---
>   util/int128.c            | 42 ++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 87 insertions(+), 9 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


