Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp6150234lfc;
        Wed, 21 Jul 2021 15:02:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxazaxd8QeBxwN56YIIDuwlT6fIpY3ZaGV00JAw5ioupLLNRFzOy0ZrixYahEKpnXXBXrra
X-Received: by 2002:a25:be48:: with SMTP id d8mr47503856ybm.521.1626904935685;
        Wed, 21 Jul 2021 15:02:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626904935; cv=none;
        d=google.com; s=arc-20160816;
        b=lwjiuYhwS1aGSfUNA+6R6DblAVIG5iQiWJ+qYt4dvKgV16qhMHdFiCgEUweHRngbIW
         QQbny8CTWY4Ym/4C/T9qiR4F7aMy45eEb9oj+egUQFkYdOraWc0SOXGGuOVd5MT3bBK7
         BLlwLMqP3118BUeLqqsEEnel8y/LoaULIvJytkhvshNnjvLBzlN5+/j3b7OjWD6KnsKR
         wKMhGG/caM0Hk0+YSkHfNPEF5vqd5bjziRnEGMa8y7qnyCLpjP0Z4s+zRjkBPDTg/dB7
         btrhR0e1r5rFs/+NS3uxXF1EKZ8qIHnkVwXYck8svd4U+VRm+nafhbVMPgGi52MgV00u
         ChkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=O/IHiYSl6Na004nA6vNtdTWdPT4lsK3wuN4E7ZtM0jc=;
        b=eXXsQaLicZyfIR+ZMnkCfbwA94dFvu5s24F1WkfhzIB6PDsQG3CTdz5L8t55vZ0bFU
         8fJggfdDhMRWYdD2GSAYgDNkPHfdVMy11pZQBiM28igbfxZ5CrKfaAtd+ofqSz0BnFGm
         Qp1fh0zOEwT4LyUWCIlOmPreLAiVQ8AkTkVKNk1D7i6m0lg21INjobyyoFFDin+GXzNN
         dpQLBZ0ZuIzVOpM1uTOCQ2S5HzNKYbZiL08z3QMy1hiyf0wY7GMU1wMtxyoLndD1nibf
         eg+hZjfH4J9xr9hmyvI6RRhcSXlLhOGJQHbbOVv5v36mZRK+swZBqRw9iw70okfvDD6Y
         OrvA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HhGAVv3N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 66si28737467ybu.460.2021.07.21.15.02.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Jul 2021 15:02:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HhGAVv3N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m6KI9-0004Jr-Sv
	for alex.bennee@linaro.org; Wed, 21 Jul 2021 18:02:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6KHj-0004IC-Bm
 for qemu-arm@nongnu.org; Wed, 21 Jul 2021 18:01:48 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:36522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6KHd-00054r-PI
 for qemu-arm@nongnu.org; Wed, 21 Jul 2021 18:01:47 -0400
Received: by mail-pl1-x62b.google.com with SMTP id x16so2199269plg.3
 for <qemu-arm@nongnu.org>; Wed, 21 Jul 2021 15:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=O/IHiYSl6Na004nA6vNtdTWdPT4lsK3wuN4E7ZtM0jc=;
 b=HhGAVv3NKTt01oYOjB1Sxhe8csm770dgobP/mlgrxmoRFYIM00a/mM9Yx6KKFt0Fss
 SRsLzixCC+i425XASKAe4KaB97/xyhaku6lokPcrpVl99IZpqbjBsmzEFMC2G35E2XCt
 EKtEFelh2JlL7qrD6zGSa9vax20M9WnXdBSXUgjRkK7ev4noEcqiPxmOquvfYfjG3CN6
 7KFFGlcCdHv5WM4T6dAODwoBPwLVXhEpwCR3/Hhy7RF86NKLB98EoUQClNTivsWFjGgB
 Y/eSN17XPbZJ/TRvNZbGZv6fuEMGKy0LqgTQ9qwP6T3t2uR7ogK69ez5qSt/51U9aqXo
 uGXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=O/IHiYSl6Na004nA6vNtdTWdPT4lsK3wuN4E7ZtM0jc=;
 b=LuHJmiUXMb0GzBsM9G3VNyn1aZFcfX6UtiAv8KGcATRTDHD6wOLoqwO27WBqPFyvBq
 UNL2GfKQ+Dgvvv39N3YF7+v8fs+Cqi1L2qPTx2+D9dTVks6uL3tkUuO6w/23EdAsjWW4
 JbcJYHWLOvOiQAyp30wAp8SDVVilq5pwECOH9di+PTUyXtUHqauH1DywfN9IdoLQUV+5
 Uu7QVdgVz2nuZBn75WzWn5O5XlZVLpNSNNhxtzYxM43Ke5Tc0bII6c/1Q2t0Y5J9xzlz
 0bIVTmJ7rzdbDgUlaMYeEF3dFpIofnZ45FmI5m/s073C5jkPMiglGOzaaBOL8OFfDeAN
 iNhg==
X-Gm-Message-State: AOAM533IOtMZX0A+ydGweoVP1cv1Oyqr5XL91HlJyTy81iGYcGIIAipf
 9WPkHv1+TJmZawvLzqmaVjYZxQ==
X-Received: by 2002:a17:90a:6a04:: with SMTP id
 t4mr37047866pjj.55.1626904900062; 
 Wed, 21 Jul 2021 15:01:40 -0700 (PDT)
Received: from [192.168.3.43] (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id i8sm832283pjh.36.2021.07.21.15.01.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jul 2021 15:01:39 -0700 (PDT)
Subject: Re: [PATCH for-6.2 24/34] target/arm: Implement MVE VMLADAV and
 VMLSLDAV
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210713133726.26842-1-peter.maydell@linaro.org>
 <20210713133726.26842-25-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <584d6771-b6ea-ea4a-977b-60fb2a6e511e@linaro.org>
Date: Wed, 21 Jul 2021 12:01:36 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713133726.26842-25-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.117,
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
X-TUID: wkm52MyKuJ28

On 7/13/21 3:37 AM, Peter Maydell wrote:
> Implement the MVE VMLADAV and VMLSLDAV insns.  Like the VMLALDAV and
> VMLSLDAV insns already implemented, these accumulate multiplied
> vector elements; but they accumulate a 32-bit result rather than a
> 64-bit one.
> 
> Note that these encodings overlap with what would be RdaHi=0b111 for
> VMLALDAV, VMLSLDAV, VRMLALDAVH and VRMLSLDAVH.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    | 17 ++++++++++
>   target/arm/mve.decode      | 33 +++++++++++++++++---
>   target/arm/mve_helper.c    | 41 ++++++++++++++++++++++++
>   target/arm/translate-mve.c | 64 ++++++++++++++++++++++++++++++++++++++
>   4 files changed, 150 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
