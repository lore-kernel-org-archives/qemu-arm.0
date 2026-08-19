Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAC4FC5DF81
	for <qemu-arm@archiver.kernel.org>; Wed, 19 Aug 2026 15:20:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wwi5M-0003lb-3Z; Wed, 19 Aug 2026 11:20:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wwi5L-0003lJ-6v
 for qemu-arm@nongnu.org; Wed, 19 Aug 2026 11:20:11 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wwi5J-0004hg-LS
 for qemu-arm@nongnu.org; Wed, 19 Aug 2026 11:20:10 -0400
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-84f77cc7302so499933b3a.3
 for <qemu-arm@nongnu.org>; Wed, 19 Aug 2026 08:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787152808; x=1787757608; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=JZnB3Dxuypq1DfYlzbRvpa+QT/STF1iSVE4GHNfBWw8=;
 b=IxGIQvRMEjV5zHLPwMfFrf0KLPHI9cQArdewhCqs1NHMTfONHAVE9tRwomnljqtMt2
 OsHhMtGViYTm/bmV43T8ga8grIbTpbdzzSAfJigxwLgdtTL4T+tlqUga067ONGu8jyF+
 xcwdB5/eQiXc4ljLDlZy9L9t0HEOuVtmarnT3v+pEbKHklQz72BGJwPerGo2hC1qSdPj
 CBQmenQy6t3HV3pKvVFUh36wrlQ3smckx7PQRs+0Ifyox5msYbdDw+UmOPreKVGRaPSR
 PQda1IdvcBxyahi7/HC+cqbvxot7acTI/hmWRDo7fYMpCTFzBhEF0tbQ0MIyldX98Tpf
 Rjdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787152808; x=1787757608;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=JZnB3Dxuypq1DfYlzbRvpa+QT/STF1iSVE4GHNfBWw8=;
 b=OTawadvhPZ5svMOiHKFu0NbD2vqKYSYJSV+wq2Qc7BNFpbnAcjtgX/9cyMEz0pl/8H
 2tSFUvttAQ85jBvDL9hCrLa+4rOu5a9K+MtJizJC8QhESzIn84p1Ft9kNaEO9l2D1Yje
 SMuIoJxoGS1nbEIJzwLFADcS370lLwFYwKVekuKOCCtLeYDb9e2fL4fooaD2JWfzcOJf
 6YLlNAEr6w6UbdhwdGVfaGSNtEoP5VC4a+uDkGqgrXHgix1DOxMZBw8AMpiUbuCZLCzN
 pO8+BQm82tBw/UshxXNqYrMkF7At7yE7rryn6RIytVgW0KwkiV67wn65EkSoSDNF2d9d
 99Ng==
X-Forwarded-Encrypted: i=1;
 AHgh+RroVUNDB57XzipMVssJnkXPxfzBenCwIi7P53CTSKQD0pLjaXuyfO8Grj3//UVp+2upbt5IBomYdQ==@nongnu.org
X-Gm-Message-State: AOJu0YwxK5YBuu3M9Q5auMPpYUZUqMo1UTH144+nU/XRpwhkfrpNXzyo
 86M38hi2Z4cSDbHKC8oV8EQSMHcJjpXOZth8nvQrV7gtvy9Dgo1g4M0J8BKJyB1kwLlpn5QFz03
 lSr2MkzI=
X-Gm-Gg: AR+sD13+l36xYTy1XOxByiGuPZnEkl6+h8CDa1Cf4QtIDDeabsj9rWTxdnwmFOZU8sx
 og/QFoAsVxHgPSrUt+3BgJaahCkhjiYfp2uU0DFZqYSzOUf9s3ExfQAlCG9try/8XEAXFf/Epe8
 qCzqROHO2FLNeyZkVH/vSi1MoCITgMf+ASMxY0lNTVAbw7xP5so1jKJBjEKeg68zhVs+QfBndmY
 DTEkOwqQMAB20taeCREMwHPODj0/m18hmh0CBc+UCqmWKcVRD0YujnAhl8sacjRP4gByKD86iKh
 P1LcK5gwEf+YwI46uMElElWbtofxy8GtbG3CH6LIrI0D7w4GdJ/l6I1jBABcR6Xlackj2n8ubR5
 1G4IrYAqKO71+iOTnDttXrr8HJsTNpgpqC4QAcqZcQvfTh3B2ylPAUW3/KzEbx7fuP8u6Tcu4B7
 IufME0FLeIPi6Bs9Us7ALrGE6EFkO1QRO4DJXE3lr4/fSDGvrcSZTmNQPMk/x8bZeET6uhIkiXG
 hxDhKNk
X-Received: by 2002:a05:6a00:3407:b0:845:e8b5:8c49 with SMTP id
 d2e1a72fcca58-851d3942af9mr8946037b3a.10.1787152808025; 
 Wed, 19 Aug 2026 08:20:08 -0700 (PDT)
Received: from [192.168.122.51] ([173.164.107.233])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-851d366dc9fsm802985b3a.51.2026.08.19.08.20.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Aug 2026 08:20:07 -0700 (PDT)
Message-ID: <9372f8a2-c54e-4e54-83c6-e0454a308c33@linaro.org>
Date: Wed, 19 Aug 2026 08:20:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/8] target/arm: Pull Neon dregs checks out into a
 function
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20260817123838.1578060-1-peter.maydell@linaro.org>
 <20260817123838.1578060-9-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260817123838.1578060-9-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 8/17/26 05:38, Peter Maydell wrote:
> Abstract out the register check for Neon insns into a new function,
> similarly to what we have for VFP.  We don't have any extra checks
> that we need to add here, but having a neon_dregs_ok() is cleaner and
> means the Neon decode isn't oddly different to the VFP decode.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/tcg/translate-neon.c | 118 ++++++++++++++------------------
>   target/arm/tcg/translate.c      |   1 +
>   target/arm/tcg/translate.h      |   1 +
>   3 files changed, 53 insertions(+), 67 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

