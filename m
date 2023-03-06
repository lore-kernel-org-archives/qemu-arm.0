Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4765514ejc;
        Mon, 6 Mar 2023 07:16:17 -0800 (PST)
X-Google-Smtp-Source: AK7set+936SL/i/CAkWbpNpoVEhtMa2XL0cEE/Ofcl7V4eD0IsOUV7lACTH7NQRQOK/ovWDEkDcv
X-Received: by 2002:a05:6214:1d2e:b0:56e:a918:a4ed with SMTP id f14-20020a0562141d2e00b0056ea918a4edmr18091182qvd.1.1678115777211;
        Mon, 06 Mar 2023 07:16:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678115777; cv=none;
        d=google.com; s=arc-20160816;
        b=cnjpvEAhv/IJP83KL3bqLPv/wilw9KZmBunMVJMCurv0PuDk4f9hVF/9T6dM07V9JT
         Ofl3n+sZp4pG9A3IEoShx0+yCpeIRJHC/htUR7heQOqARR2LzITJ2npee7Zx/b6Mym1h
         xabXqftvvxBbgZHLqffmfojuiVmsNQD463d1FjB2f/Z+FKk3UIIJbyuwC9cj/u2tK39g
         hQWZzVTekrQ5ZRd5KCCZz6F/rOh8kjOu9aEGoUMzaWh4EZW5hN6cxXNIu04hzHIxnLkx
         TosiBaOUSgpxZjdCetehk0BIbhWYdAjVBtkstCfheCaHczG4ivjTeMbSPwApoeIef/ID
         crdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=yRQl9IavSP2ECC7Npy1kkvDd7fq8yF3XjhXOCTQ7O94=;
        b=i8++OgTCiNkDD/QrfBbsyQkOT6LBVd6tUZ6tddDInP4iFPjrjzepFYmXJNnxQNFa9X
         bFsQDDCOhn3S3GxA7ioqqNW+y2GEktjIC2lPoer78+yGrs6q93Hsdpa+nxyBZwyqfgTW
         4JnPt1ra/8CUir66iLz3N5M3vGe0+1emWFuiIx0f4iUIyRgL0lDGAKcYqN+r5Bu501ME
         n0fILMga7BlaRlFNU9T445aEjtNOIpfvwfahj+zoPERq85D8zjDV4xoaIlWhoqAhDDEA
         kCMSM1JezvAFvJBmBbGaIYkOiiIq+uKTmZWYsTkmY+ZtABfEO4EUBfVd2d7iyBUSaFf5
         mKVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YquRDKbK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fi16-20020a0562141a5000b0056ea7de3446si7315641qvb.587.2023.03.06.07.16.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Mar 2023 07:16:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YquRDKbK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pZCZ9-0000Cr-CZ; Mon, 06 Mar 2023 10:15:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZCZ7-0000BN-HU
 for qemu-arm@nongnu.org; Mon, 06 Mar 2023 10:15:53 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZCZ6-0006Y2-3Y
 for qemu-arm@nongnu.org; Mon, 06 Mar 2023 10:15:53 -0500
Received: by mail-wr1-x431.google.com with SMTP id h11so9187674wrm.5
 for <qemu-arm@nongnu.org>; Mon, 06 Mar 2023 07:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678115750;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yRQl9IavSP2ECC7Npy1kkvDd7fq8yF3XjhXOCTQ7O94=;
 b=YquRDKbKEtYWh2bDDkqMNyQreLSxV4TO/zSf+aL6uxzZPmB/VPMKvw23JlSZ7TKT2t
 Xfv/wAgD3jbXBNqUpiVkNHoccaGMi7v7QFK8m/jR9yySZG7Y3kCZopRJdrvQtfjr3K/Q
 Y9pvgboZPkj44EY6xbwzsSIft1ThrNplVhqg/El6vN0yY0GmKB3Xaneb6s2b7LiBDedM
 u3XRqtbjMNbYdmMt5V0+pzAisjju9HKET16dnBWmUIL7ZE+VxuRZfRYodQ9EPvlROzFX
 9ytFi2q0/AxIJwOAT5ljYLwvDFtm21FYSJfwD9KyCI3gpuwnnxEWnRi0fA1NyGChwUDB
 dsuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678115750;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yRQl9IavSP2ECC7Npy1kkvDd7fq8yF3XjhXOCTQ7O94=;
 b=7FmhTLL1Iha/r78KSd1PGduG1p1BiXLwKthtHwgW5pDeYzl1vuhREpX0Vk3J6l/M16
 /Ximva0hQqJ+zkWJJ9yDPf1/BmgVlkqGe7XFOd/ftyq/P42xWc3hCk/WhfF8j3YJueyB
 yZyC8XlDvqiIXCBP5T1ouCD0wbj6GK2SKbrK9akSxJpr72MbuyP533QTzhBLga2WN8JC
 IaYC7Cwq1ez64YZ0qsWcj3xT8WJW6WmUcSTEPrshZzmYvwBOhliqvDAkV9SyqJUTE+iJ
 tHYwCdeDi14zocSDlpHiFSz85XMVAA0hXyGDZlNgz0s3O4KFebgGjXL3c9X05PhANAMo
 pAzg==
X-Gm-Message-State: AO0yUKX0mK38NoXTZRGVmXVWUqfVOYNH8mi/ppu4iBgfwj8TcWCJpnNF
 nvVVceBbOhKxFCsY9LkoHHJQng==
X-Received: by 2002:adf:f20d:0:b0:2c7:e60:a41d with SMTP id
 p13-20020adff20d000000b002c70e60a41dmr7235515wro.61.1678115750559; 
 Mon, 06 Mar 2023 07:15:50 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 n1-20020adffe01000000b002c4084d3472sm10349148wrr.58.2023.03.06.07.15.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 07:15:50 -0800 (PST)
Message-ID: <c5541883-df72-90ac-88d3-ecc01c78058d@linaro.org>
Date: Mon, 6 Mar 2023 16:15:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 10/70] target/arm: Avoid tcg_const_ptr in
 handle_vec_simd_sqshrn
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-11-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230227054233.390271-11-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-TUID: Ns98qvbzPtWh

On 27/2/23 06:41, Richard Henderson wrote:
> It is easy enough to use mov instead of or-with-zero
> and relying on the optimizer to fold away the or.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/translate-a64.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


