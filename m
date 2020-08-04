Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp608448lfy;
        Tue, 4 Aug 2020 07:50:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxeUx6TImf9xERbXLNKk0W1rKvkUVZ3mVWWXqkybYDI/a8aJ63OqAHCbl5Xmyko427UYHkx
X-Received: by 2002:a5b:d0a:: with SMTP id y10mr16872443ybp.128.1596552626884;
        Tue, 04 Aug 2020 07:50:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596552626; cv=none;
        d=google.com; s=arc-20160816;
        b=lVu1hEUUt918Q1hY/+2s7XTO16R6azUw8/kKrSY/14O8JY8JZtQAc4j8F3yUj3rvtL
         IlJmo8Xt4V9/JtI1WglvBcMk7eJ8y82oFmrX3AGXBKYN3DXhCILFxb6fmXTk1tSMugFr
         sRLHObXlmx5WQEjcnBhaSFg446XyiZL9WnCFsJY3+p+Lc8ZVIeg33ei9WQeQaIvVwma5
         mEObPoZatKkXSoUuwDhPRpFT8wNf5lvIRZjYh3qGr5QDWk+fkbqi5tuQ1DkFPOYicsWO
         tojvB/SAd6uFnIahYZ7ITdDiVU5nnrppI8VbD1sRxrIWFQ8YUBeAlVHjF/nKCq1Ci+HU
         HVzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=u3g8bUxJKgAkATBFWfijZJ6uapdTpyKvTAtXKaUMi2w=;
        b=znPFgycl9At23/Pfl8MfQmkoUzhlxVvxKYURGnjOKk1r6ZSfRQmp2VoG2/s9Py8Uv9
         zJkaIjx6hAkCg6/QETimvjW7OhyScmp6OzOkgfM6kna1qvIVfGd0Te/xozAXXKc0LXhC
         x8vBrvrtEfST8R5aHx7fCgmWxNszggA3/XObkAOgFREoDLsNQkH2u2Kjy/mPNBsZ/wux
         vsuU92IxRYiYhV+qbO9jNamjTnNphPiMSIgb+7DeMj+zZRB5Q3Kzb+I1Ba86X+ovy8Ks
         s3E/LxQgwW9j3QgN7bCYF7KIxYPU/TVviRhuLVn6Xksj7SlTjuxR4sd6s4SHkwXclDqK
         ZBYw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dsSIUQq5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u187si17912083ybb.130.2020.08.04.07.50.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Aug 2020 07:50:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dsSIUQq5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k2yGo-00080P-6l
	for alex.bennee@linaro.org; Tue, 04 Aug 2020 10:50:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k2yGX-0007zY-IL
 for qemu-arm@nongnu.org; Tue, 04 Aug 2020 10:50:09 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:39891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k2yGT-0000xM-15
 for qemu-arm@nongnu.org; Tue, 04 Aug 2020 10:50:08 -0400
Received: by mail-pg1-x544.google.com with SMTP id z5so22288400pgb.6
 for <qemu-arm@nongnu.org>; Tue, 04 Aug 2020 07:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=u3g8bUxJKgAkATBFWfijZJ6uapdTpyKvTAtXKaUMi2w=;
 b=dsSIUQq5brqYLlo7daCDbSB2hH/FA5DEH5PetwA3nzdt+SgWzRwtgvXsyLcOOEuHxs
 sjMOijdcQImphUOtn5TKGpVxTaB+ZdGxKXOMNHuBgh7g9XcDk8i/Fdw/WNm7EaSHGls/
 +rchmoyScO/O/8/vcb4X+1yVmUzzPtuFBPvEVfZR/nWWVQwneSE4iLX6hPvIMSc+8Fpm
 8qP4Av9kSpnD1f4fJ4cTQs2xOv1dgjKfSg30qaoRthVZyphdouJkW/5402SCoF0HPW6e
 H2du9P33crLMY7iiQA5K9AniUBGnj3UnsK3UUZp5jtI9JSYJODFYZWfmL0reZKQlLtK3
 Y7GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=u3g8bUxJKgAkATBFWfijZJ6uapdTpyKvTAtXKaUMi2w=;
 b=jbHTbtcy/PKQGEjgjZQysuQZkA4emUbryK75v0sfXM52iVY66EKae2g449DB+bzMND
 IJ3pbsprekERUy8rs3Km/QHqCVG3DxnIUdzinmcqcBkEva+5mEzUiRuNNGF1WC5isAU9
 QIcD3dCka1vbPVzcL92aVxkcYIT1JGlxUd7cL2rJja2iy8aZB/C4xqGj30/t+AgMOqKh
 i6+HMdG0Ct3P6z0TAHVss+3VIjlQ+/comEBwe24paxK0dglMHqMoq3ALwZbFnNmjPhIW
 XQcI+Z2Xn6KJL1YB+dJPqhJnPsLcHdyxMHExzOUHghbU9IFED/sp2usW1O/hJtT382aF
 PCAA==
X-Gm-Message-State: AOAM5305zPqdM5Py0j2yzjAChK4sjWBk0oQIvmLkfgot6yPjDQOcxf9v
 +lg+TwkVsI4JaR0DBQzE+zGa2Q==
X-Received: by 2002:a63:6cd:: with SMTP id 196mr19314989pgg.169.1596552602952; 
 Tue, 04 Aug 2020 07:50:02 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id n9sm2942824pjo.53.2020.08.04.07.50.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Aug 2020 07:50:01 -0700 (PDT)
Subject: Re: [PATCH 1/7] target/arm: Pull handling of XScale insns out of
 disas_coproc_insn()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200803111849.13368-1-peter.maydell@linaro.org>
 <20200803111849.13368-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <715e215c-9cad-ae8e-4f90-b81fdf2ad22b@linaro.org>
Date: Tue, 4 Aug 2020 07:49:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200803111849.13368-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::544;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x544.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: zUunchZLxAmk

On 8/3/20 4:18 AM, Peter Maydell wrote:
> At the moment we check for XScale/iwMMXt insns inside
> disas_coproc_insn(): for CPUs with ARM_FEATURE_XSCALE all copro insns
> with cp 0 or 1 are handled specially.  This works, but is an odd
> place for this check, because disas_coproc_insn() is called from both
> the Arm and Thumb decoders but the XScale case never applies for
> Thumb (all the XScale CPUs were ARMv5, which has only Thumb1, not
> Thumb2 with the 32-bit coprocessor insn encodings).  It also makes it
> awkward to convert the real copro access insns to decodetree.
> 
> Move the identification of XScale out to its own function
> which is only called from disas_arm_insn().
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate.c | 44 ++++++++++++++++++++++++++++--------------
>  1 file changed, 29 insertions(+), 15 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
