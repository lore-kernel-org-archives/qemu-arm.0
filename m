Received: by 2002:a17:906:3554:b0:a35:2c0b:b7b4 with SMTP id s20csp63848eja;
        Fri, 26 Jan 2024 19:09:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFui/nMkoFFHOY1+Ru6KmR25wI2G4jpG8SXWWIhQAwsvtDbCQKdprh5UuzfVLWIBjyi9oZs
X-Received: by 2002:ac8:7f05:0:b0:42a:69a5:1e55 with SMTP id f5-20020ac87f05000000b0042a69a51e55mr1187771qtk.99.1706324993022;
        Fri, 26 Jan 2024 19:09:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706324993; cv=none;
        d=google.com; s=arc-20160816;
        b=bJIYS0tXv1UYtTR5plrZUI/21obRe3aLCEDai8nos2vLnaHQvEYPCoblycOv98/qTU
         TEarv+VXjidEG59fqnLHXWn7ri/Crg9P9A7qJhcj7Pa/QjgM5neHGxDx9TXQOPKXS0VK
         ewyboPStxBHVvMGRUgZ560iGYBpq+EsP+GBrnaAkV5+i5RtMWZK+DzFB0Wp7G1u4fSTP
         ZTIIiAH8vhOv5fTy8ucWn9bS5PhTnVVqW9IaMBIIuRVtPThFDJlralc0NTQaR8jS3hd3
         5haW790Axjkl0JuhTUZr7nlvtzdSq+qPD5kNA1Lj3yddU9KixYQ4PoYv+kOE6FO1yNF9
         EBpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=brvN+T3G8ChesX+gJm3C8l7IDzprPjl4zysU1+vcnIw=;
        fh=+xj4Yfkfa7hWRbLS+DTrcNY2o0evBrBbm0gAigyTnIw=;
        b=wES/M8Rz2NsdKIJ/CiXbQv28j7uZv9afwMwPeJOf3vazK1sLlbk9v8BVECC3mezoQk
         hPwk4arbNmjmSO2imxPC8Bsh0rBwEA8PFK5BV8WsWJy01xIRKmffRUjMMmrDIbTrANZw
         MLS49uJaOMe9XymFQvARwTmqaOQJ7BPbQnxNgvubDTqG5smY1aLUPy2QnEOtbC9EBVt8
         SI3XhOMrjwcM318c0k+uE3zzCMQMwXXqBnCkVaV03P0yGUDVhRRrSQ9wjdQDrGgn5LvR
         11jTjXZFJK2moWVQSA4ax6pXJRwr15lfgVHMILwVqVYvIQPrTyKT6DGtvLELY+g/obZ/
         A3jw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="X5c/FB3O";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c17-20020ac87d91000000b0042a5cae47c4si2679849qtd.666.2024.01.26.19.09.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jan 2024 19:09:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="X5c/FB3O";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rTZ4O-0002Sg-6b; Fri, 26 Jan 2024 22:09:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rTZ4M-0002Rg-RH
 for qemu-arm@nongnu.org; Fri, 26 Jan 2024 22:09:22 -0500
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rTZ4L-0007Jd-6h
 for qemu-arm@nongnu.org; Fri, 26 Jan 2024 22:09:22 -0500
Received: by mail-oi1-x22e.google.com with SMTP id
 5614622812f47-3bded20a30eso705183b6e.2
 for <qemu-arm@nongnu.org>; Fri, 26 Jan 2024 19:09:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706324959; x=1706929759; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=brvN+T3G8ChesX+gJm3C8l7IDzprPjl4zysU1+vcnIw=;
 b=X5c/FB3OcikweA09g5hLM2PGP8/qW0QcJ+Z2B/tjkJ2NbD0ATJiiYjXENV5OlV+Uqf
 cJO60aJidcH3f/T4edgoNezoeYVEPUNNB9oFdfn9Nq0i37AGZ93j1UyuoJh1Kc6FrCnT
 f7ZnavytSzZ16JJ3T8GUu8qVkcm2IRjj7LDl0kN9nshjIx5LjDtXKLrrmMgvxZyQmiWT
 PdQ83naQ6w0nyDjqWjNhHSNUpoX4VcKP6Wro0sVCTYmJOteWgxzregos4qxRN/seXv2s
 Pei7fDc+K1EV0QX4fo6VuY4p9u7KqcLQmqdKh4oYr5Yx/DtlPyuKBTaPR4ccVS4wYrlR
 tLsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706324960; x=1706929760;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=brvN+T3G8ChesX+gJm3C8l7IDzprPjl4zysU1+vcnIw=;
 b=R7LpA7JIK+61w7pU/a6LHhH68fpAlACQphc/q53Vuf7KEhcLojSaFtctdXIxhu2cPh
 AY9URqk2fx9cybSIOvNliSeEnbwwCZDQYYAXkXzgaVgzBxFC8NlXiLWK7Lf6dUW9YBSS
 5h6XB8mF8I3M5+KVSfCsSPLVauFNaOcK74rcjshk7hC9TGgmWXQ+mH52+JXC7h6N2x7f
 hbUgMWtAU7J0y/l67rbeBl3y85ONwWrr7MoIOd0npwfUnCLgRAq+tqMGl2hw5H/tKLKy
 Vk3XliHuFxqfntrYUqfCC3IWA+LP1Fs6DuXTyt+CeWJ1NvGUVNDYm/Y1I3e/ModwaKiH
 G5vA==
X-Gm-Message-State: AOJu0YwgUSHMnXtjjd1EElwiUhV2w+IekqOiihPPSfEknHT4Y7D8Qdka
 /aaUgrXJo7r/eyNXz4N7B9AK996FXapvAHkzv3AhdRySfP55qkB+TsFP8W3mQYI=
X-Received: by 2002:a05:6808:1314:b0:3be:174c:1888 with SMTP id
 y20-20020a056808131400b003be174c1888mr457260oiv.44.1706324959685; 
 Fri, 26 Jan 2024 19:09:19 -0800 (PST)
Received: from ?IPV6:2001:8003:c96c:3c00:b5dc:ba0f:990f:fb9e?
 ([2001:8003:c96c:3c00:b5dc:ba0f:990f:fb9e])
 by smtp.gmail.com with ESMTPSA id
 jw16-20020a056a00929000b006d99056c4edsm1784168pfb.187.2024.01.26.19.09.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Jan 2024 19:09:19 -0800 (PST)
Message-ID: <87c249b0-8f08-40e6-91c1-1d3c970b567a@linaro.org>
Date: Sat, 27 Jan 2024 13:09:13 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/arm: Add ID_AA64ZFR0_EL1.B16B16 to the
 exposed-to-userspace set
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20240125134304.1470404-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240125134304.1470404-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: gGQAAaLgXRmL

On 1/25/24 23:43, Peter Maydell wrote:
> In kernel commit 5d5b4e8c2d9ec ("arm64/sve: Report FEAT_SVE_B16B16 to
> userspace") Linux added ID_AA64ZFR0_el1.B16B16 to the set of ID
> register fields which it exposes to userspace.  Update our
> exported_bits mask to include this.
> 
> (This doesn't yet change any behaviour for us, because we don't yet
> have any CPUs that implement this feature, which is part of SVE2.)
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> This is a loose end from last year: in commit 5f7b71fb99dc I
> updated our mask values to match the kernel, and when I was
> doing that I noticed that the kernel had forgotten to add
> B16B16 to its report-to-userspace list when adding support
> for that architectural feature. Now the kernel has fixed its
> side, we can update again to match it.
> ---
>   target/arm/helper.c         | 1 +
>   tests/tcg/aarch64/sysregs.c | 2 +-
>   2 files changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
