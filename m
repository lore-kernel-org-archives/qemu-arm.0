Received: by 2002:a17:906:d8da:b0:98d:c41:35ab with SMTP id re26csp278097ejb;
        Wed, 21 Jun 2023 21:53:39 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5T0UFHNFz+4sPPIBtNC16gDLzKJJj72GslTtz+vY5JbVXUIPwac6FRlQ0muTZ0nWZ5kBFG
X-Received: by 2002:a05:6214:124f:b0:630:4ac:3489 with SMTP id r15-20020a056214124f00b0063004ac3489mr25182186qvv.35.1687409618763;
        Wed, 21 Jun 2023 21:53:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687409618; cv=none;
        d=google.com; s=arc-20160816;
        b=ji+R6ul8hzPc/lCbcb73P6Cjl00G5uPzXeIqqfQIJg3cCHNh13ihM4U1YuXs6yr96N
         0rBaY+c5C+WAKu4uaq5W5+whnR9XsPuwg86ppNwHuC9duwuS8EAjPdHm+/0KfuTSOyvN
         Ztx6DPAKuRf69/Bm8CdEXODf+tkif6DwjZCQXXViIofwKXh+QcAvVuWPYCRlgso+Bo2j
         np8qKBPAYd5Gb8yjrvMu5JsjvJi21x5OP5rwuhJuKsao4xV0g1KvCwWxR4BJqMS1OlDD
         UV0sFnLIpojpKE5ykub3SsKmKUIRoSp0GgP9um0PxZwZcGuAgqvH4brYc6zHR4eRQWG9
         JLTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:content-language:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=SXti0mB7XzGaXBJrNPs/RcZqGfjO6pKp5r+aSUyXw5o=;
        b=WS3NzvbY+RK8thTN3b6ZNYcPAnL5qM0Ql7f3Lbonavzjm4OeeWNHiLiDeDlynnC4ze
         5P3IJ0ixEnPt8qekGicU5escEb1ZN7j7ITT9ZdzLHpUR9QQzj+CY8K5YosXS+deiJGcR
         WNgN+bBf/tRvra5yPpKI72Ytq/z8VBdZtjSrdgJWZxLIacKotaeYwZfa7Ky0W384BN8s
         hFpKEZY4SHOkl9FPCXnvMAUl/pYZwWKylSd2NxZmyJiwUgBuO/CxHjlELwevwFn0A2g0
         sAMfcgq8wiHZ2QQQtp35kaYg+22HiagMDi2PPUBkMMdZBAgY6bM7NauD6oLCgIy+wMDm
         /aOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LfrmZl58;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kk7-20020a056214508700b00630138406a4si2352188qvb.537.2023.06.21.21.53.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Jun 2023 21:53:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LfrmZl58;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qCCJj-0002RX-41; Thu, 22 Jun 2023 00:53:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qCCJW-0002QQ-60
 for qemu-arm@nongnu.org; Thu, 22 Jun 2023 00:52:58 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qCCJT-0004Ng-6a
 for qemu-arm@nongnu.org; Thu, 22 Jun 2023 00:52:57 -0400
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-51bdc87feb1so1590979a12.3
 for <qemu-arm@nongnu.org>; Wed, 21 Jun 2023 21:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687409573; x=1690001573;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=SXti0mB7XzGaXBJrNPs/RcZqGfjO6pKp5r+aSUyXw5o=;
 b=LfrmZl58oyrVQHGSFq200RQmUGyRvh94Q6wg6dc1Ii+SrcJ2eMKZ6F/hzc+U2dIYIJ
 XcwlO8IEhTrhzvi5AyReXnaG4V/3F+b0AqHWei9OgamAQzxQUCaBsUYr6GjtSbV68pgK
 +Ln8nyiF8yWJ6VaLmljcqaBxeo//eAvEeU2rkAuEcabVb6zEGkwgf41rvxMOrRWCtbbo
 K6N4Jq51zPmwSRrsiU9qZE1R1OLinpq8cCbCbFXmJEYpq0MPO9Cx56Aumv1elW5HBFDj
 unPNxizCVWKI6CmnShOH+Mo4+bow7XpUQ/Rh8i+0EPIz7gdFEJ+pCTRWwPHk6PDA2olo
 KTIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687409573; x=1690001573;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SXti0mB7XzGaXBJrNPs/RcZqGfjO6pKp5r+aSUyXw5o=;
 b=PtrxixVGaJZ/JqZcQgYfnp/Nak9TjfbFGjbY1ubpLlygYXNK9amQg6vnjy7cfAolgS
 BELFE2dVpn9jVdR27m6ARY0VMELa1ybMvYSWDZm62fK/2V2jLWrjPUvKYRO/ycTrTTsP
 OwpmD/n9eeNPkJ+3zYwiUJm36WoLEyNpMzorn4oftnTKgX9v4RdLBU8DT2v7JpP5kBNt
 Evy+tMtAO9KBR/yEVOuSW41oo+TyOO3OCygNY9/hnGyHwpfkwumx9AwH01v2+TfkG8tS
 dZdbFJkvUfBlCm+DQKsLKMA/RN5Qoc23jB+8e+6C+VSfEdWLxI5cQAmFt9V1yNYbNvAo
 WFgw==
X-Gm-Message-State: AC+VfDyYxuClJkhaYfACRfSc/yqEcrUxq/Z5+WKNhxoe641NVJ2UF0xZ
 7qwMAcojiLWk4gYKdYbikFGVIw==
X-Received: by 2002:a17:907:843:b0:94f:7a8:a902 with SMTP id
 ww3-20020a170907084300b0094f07a8a902mr17313756ejb.14.1687409573147; 
 Wed, 21 Jun 2023 21:52:53 -0700 (PDT)
Received: from [192.168.69.129] ([176.176.171.45])
 by smtp.gmail.com with ESMTPSA id
 qu21-20020a170907111500b00982cfe1fe5dsm3925198ejb.65.2023.06.21.21.52.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jun 2023 21:52:52 -0700 (PDT)
Message-ID: <59e80d79-4465-f99e-0515-7a8693879946@linaro.org>
Date: Thu, 22 Jun 2023 06:52:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 00/37] crypto: Provide aes-round.h and host accel
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: berrange@redhat.com, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org
References: <20230620110758.787479-1-richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20230620110758.787479-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.093,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: F4l3EowM3yC6

On 6/20/23 13:07, Richard Henderson wrote:
> Patches missing r-b:
>    08-target-arm-Use-aesenc_SB_SR_AK.patch
>    10-target-riscv-Use-aesenc_SB_SR_AK.patch
>    13-target-arm-Use-aesdec_ISB_ISR_AK.patch
>    15-target-riscv-Use-aesdec_ISB_ISR_AK.patch
>    17-target-arm-Use-aesenc_MC.patch
>    19-target-i386-Use-aesdec_IMC.patch
>    20-target-arm-Use-aesdec_IMC.patch
>    21-target-riscv-Use-aesdec_IMC.patch
>    23-target-i386-Use-aesenc_SB_SR_MC_AK.patch
>    25-target-riscv-Use-aesenc_SB_SR_MC_AK.patch
>    27-target-i386-Use-aesdec_ISB_ISR_IMC_AK.patch
>    28-target-riscv-Use-aesdec_ISB_ISR_IMC_AK.patch
>    35-host-include-i386-Implement-aes-round.h.patch
>    36-host-include-aarch64-Implement-aes-round.h.patch

The crypto/ portion of the patch set has now been reviewed (thanks Daniel P.B.), as well 
as the target/ppc/ portions (thanks Daniel H.B.).

What's left are the x86 and aa64 host accel, target/{arm,i386,riscv}.

Would it make anything easier if I re-sorted and separated the unreviewed patches per target?


r~
