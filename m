Received: by 2002:a19:ca1d:0:0:0:0:0 with SMTP id a29csp4093796lfg;
        Mon, 28 Jun 2021 08:17:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwJiq+rub6qv1Y4+qAtAX7Krydh2BrAe/fsBDxfTGc0LhR01bQoosWkVI5UMiASwAK1Ds9l
X-Received: by 2002:a19:c3d6:: with SMTP id t205mr18825299lff.609.1624893443160;
        Mon, 28 Jun 2021 08:17:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624893443; cv=none;
        d=google.com; s=arc-20160816;
        b=WbWQ7zYs5w5No/ebBIj1okC0vA3OM7sZPXtTfElq/q6ZIlK7aFKzOOtb5bcgZDMb8t
         YO6j0Ybxkfz4HNEZQ5jIJbZ6BW07GD+kiNLz5Gt0HeiBQLU4nSFnX0jRkw10ql4qLQaC
         sQYTX3iAV70D1UN59bW9IZt+zXkgpFDx7N4YxYyqgLnAsiwXiTbTIxC1dAfgMISh2pJg
         se1BCzwPUyLGHp3Tf+cF4keYL4m11qKPiTIW2XpF4GdS+S1GKwTISGBTNFvSjhxz5QyZ
         +Gibn9SQkJp+5FxGZgRkoWnn7zpK7oOspyHah/VzBubS8kHhmmAaMxIk7knt4yCvX6dp
         mWIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=QddxBhcxCu2fGsmIplJsAblDEANjvYaDuKQ/yNUueDg=;
        b=IGhjve597LMPHXgS8hR9A/cwJsHHzD0hY5hL5hHr013T61etZNfZRM9BapID5noyt5
         aCP3YznxQJu8uXD/3EOhs4M5IKSnrS3qX8h+s4TaAsFGvnUiUF9H7xtME+OXkL50/cH2
         MMiqtfCZ/u0f3exZxZhS5NByAsozsAQ0RJ0gbXt0iyx0PfEISXKHLDe05CShKKjxZ1in
         V78a09bDANRvuH6Qfke5ne5vogDtdK9s4ePqJ+A6WaMCP3t0jOaBxVAOlytnQ9Pi9JK5
         VIlNPDLfo+SnsPGyD/bsn8hikxUvWCCNA2WbEsRQ/T5M9HHi8zu5pVZ24eKwgUG0yOHB
         wuwA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aV+nyMrO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e10si18526832lfn.526.2021.06.28.08.17.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Jun 2021 08:17:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aV+nyMrO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lxt0k-0003v9-54
	for alex.bennee@linaro.org; Mon, 28 Jun 2021 11:17:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxt0Z-0003sj-N1
 for qemu-arm@nongnu.org; Mon, 28 Jun 2021 11:17:11 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:56208)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxt0X-0001rW-VC
 for qemu-arm@nongnu.org; Mon, 28 Jun 2021 11:17:11 -0400
Received: by mail-pj1-x1033.google.com with SMTP id l11so10344286pji.5
 for <qemu-arm@nongnu.org>; Mon, 28 Jun 2021 08:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=QddxBhcxCu2fGsmIplJsAblDEANjvYaDuKQ/yNUueDg=;
 b=aV+nyMrOgW0/1brpYuizzIBpbjYfg2c/VY0nMZM8qFAQkjNQfrj83nl3iczAnxhiJs
 VU0G9EdKRvm7Uf41viHAN51fB8mKBW08d4uXH78v/PxDX6RMeRIm569PYKHVFgtHreMr
 u9U+PxClkUcaVCh/vBfOpoWhusyNnk8mijqm9qXJUrBoqnu+nAw7Oo+rCGZLMSKUCmN6
 zy8+jdKL2z5Up01UR+8X0a2akzvdL1vCHRsu3MylqS92ZDzsDKg5zUpGiCuxZ31r2+ud
 UpmNWQX7Na/2Fn6wNk70sHnVHfRwmjcEMc3sqL12VkxzXUGOPD5Z3PCF64G+2CwqH2Lw
 PKlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QddxBhcxCu2fGsmIplJsAblDEANjvYaDuKQ/yNUueDg=;
 b=IGjgqny2t4TK0meneCDaAJfK+XopigyqGvFt6yBR14p+YiBQic4DmcOcMcePhQTTYV
 7ctNh2f2Yty0BbLqy8dtiGMGrPRPlgfxxUmqS4KqK54TS9qjrXxR/sJL9RSOOq/ygEHC
 RpCx+1Fi20wOCF07PuWkC5alCfpSDbhXnXNLOR6umU8TzFk3/nna3sP+F+zLaK+eCAzu
 CpKRcWsSKoux7+zjxkt7yUSDUBW+m1fP9nMdwYvBuRYCi5y5kfD+ZMHfwFp9w5vFdHgp
 KGfDWhtPCb2fDxbAUtFpm3fSVVDNToYaKVKZ9b3nsWLzuvTlBXA4iMRWNeZqOpshhCxh
 av8w==
X-Gm-Message-State: AOAM531kRQrD9oiF3pupEqZgX/DqYMRgv7yPLUklsRwq/1jQOVqiniMW
 swx3dmBmaKkesmmLBE27RjHAjw==
X-Received: by 2002:a17:90a:a107:: with SMTP id
 s7mr37879477pjp.1.1624893428591; 
 Mon, 28 Jun 2021 08:17:08 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id co18sm20349164pjb.37.2021.06.28.08.17.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jun 2021 08:17:08 -0700 (PDT)
Subject: Re: [PATCH 02/18] target/arm: Fix bugs in MVE VRMLALDAVH, VRMLSLDAVH
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210628135835.6690-1-peter.maydell@linaro.org>
 <20210628135835.6690-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2a6d7c6b-784c-49e2-a390-538c0dcd0514@linaro.org>
Date: Mon, 28 Jun 2021 08:17:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210628135835.6690-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
X-TUID: nXo+7/aFko5D

On 6/28/21 6:58 AM, Peter Maydell wrote:
> The initial implementation of the MVE VRMLALDAVH and VRMLSLDAVH
> insns had some bugs:
>   * the 32x32 multiply of elements was being done as 32x32->32,
>     not 32x32->64
>   * we were incorrectly maintaining the accumulator in its full
>     72-bit form across all 4 beats of the insn; in the pseudocode
>     it is squashed back into the 64 bits of the RdaHi:RdaLo
>     registers after each beat
> 
> In particular, fixing the second of these allows us to recast
> the implementation to avoid 128-bit arithmetic entirely.
> 
> Since the element size here is always 4, we can also drop the
> parameterization of ESIZE to make the code a little more readable.
> 
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> Richard suggested this change in review of v1 of the original
> MVE-slice-1 series, but at that time I was incorrectly reading the
> pseudocode as requiring the 72-bit accumulation over all four beats.
> Testing with a wider range of inputs showed I was wrong...
> ---
>   target/arm/mve_helper.c | 38 +++++++++++++++++++++-----------------
>   1 file changed, 21 insertions(+), 17 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
