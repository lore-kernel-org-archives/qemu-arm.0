Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D95F6CD5BB0
	for <qemu-arm@archiver.kernel.org>; Fri, 22 May 2026 18:35:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wQUhr-0002Yb-Mo; Fri, 22 May 2026 14:34:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wQUho-0002Wh-7z
 for qemu-arm@nongnu.org; Fri, 22 May 2026 14:34:44 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wQUhl-0001Mz-L8
 for qemu-arm@nongnu.org; Fri, 22 May 2026 14:34:43 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-2bd2051167eso36873045ad.1
 for <qemu-arm@nongnu.org>; Fri, 22 May 2026 11:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779474880; x=1780079680; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TlF2BebW9lGZY3igTqy4P2tedbTbEGuevX3gYEU6Yq8=;
 b=ZvMcFcTN74ECXFOaKzZCa8NKtTzMg1f6xgUohBqRaFVoaxJSEisNu4ipyImWw/rF1/
 i6cANkxGW7F0HPW9JZNA/qJtWp8Cz5m9Pt0K7hLLoDWxBFfBKFG7mnT9s0AWOa22eEpC
 Wu5TFowU4SciW111lkeLjZQarzInJVHax/VFgzHSJ/If2aenAZpz3Keo2QMvtB4zXcXS
 15hJCA3wWKtZoJxX5qe1gkjb3aTm6q1a+W50W5LruoICk4Le+AOjSfFyx5DjD6gZkbPZ
 YuhEtoQS6Y9WpKVdPp7HYyxTZxpZ38Cp7QXtJioewDypf8uFOUqEqmZmqmoJX64F6nmM
 ta1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779474880; x=1780079680;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TlF2BebW9lGZY3igTqy4P2tedbTbEGuevX3gYEU6Yq8=;
 b=GAEM4QtfCsPGV/pqueQrtNpvgsLwXgZWMccRXplgjPz33crWNyARh6TONvZQ9l4Nz7
 xPtbcvuu3swj8b/TJ9cM2xuc/x2X8EzfdmYN/8+p5omfHVxJ5LJd1ofZPEE6z8je5HLM
 Sanfb1N4yr3t8dbM/Fxr6vr0W8M/vZIBZJ69Vf5jGq53mBRnDTcclvcxTCZ8W0YGdBbP
 a5Waxj6VuNCcn2GoXRESrd/XlnGZLdtOPAkdn4lhl6B8abCBZ0e+8E70gCnWHcLgJKht
 iT4zzJUzcwRTYvpRIp8I0oj+0PfL2daaLrUDAFORsb/yJ3WaXieMe7PC2ybrGZlXkj86
 cT6w==
X-Forwarded-Encrypted: i=1;
 AFNElJ+mUEAmvkGzhHy2Jel87UqlTEWFpsJ5FRfPwkvhH7MjzNP8ClEOWPXGnkQUpW8Omr+qKMY4IoePSA==@nongnu.org
X-Gm-Message-State: AOJu0Yx3vgggj4h/9EeqvXDZXrKZT8eAQSP1rtpGJzgGm0dguP+klTX/
 aJCH8zzp7cphnx6iPpYkvXFeAXmXsQN4tl48IXrzNGQ161quSpKCUWF0UWYDTZ4zDG4=
X-Gm-Gg: Acq92OE2jsq+WyGUZUIJZNbJ1K2xQTkJdHJduw/8Ugt32rqISzvxM6lYyoR/gBJL84Q
 15LwYTEz8dOVz1puGOq2Z18hzcG/YEBHsCAMOzQiFRDq9Dd6MqF1O5hoAHYC8ZVtE815UCh86T/
 30M2k9wM6FZiyCFfDANZrqgUpJPK/IHqx+0S7IsoDY9fLBZXU6MPhI3gRaFJBZPO8IJTCTKNtLo
 jJ0FR8+mFgN8chBNXWjPjUroerEGP4GUruPUGFzUZ1NPobbuF6WlL2n3x399fB/MxpxHrle9Ccv
 kaj7kta7qkNyhc/xI+338bRxwNMiUYFYge9xppGytalf2Ae/y0eUpdAdWlMG6xQD/BHXT863KO/
 FMKG7yo6bQiERKZAhfXair1KlOGwJKinYK3+QZkEHxBVvpH+gbRk0FXp4fZs1yB/77jK23ps+yK
 8qRlsDLv0GMfpNkWVYZQr5zlBAL8xP1p/inFMNBoym
X-Received: by 2002:a17:903:3c6d:b0:2b7:86be:7673 with SMTP id
 d9443c01a7336-2beb0366450mr51833775ad.6.1779474879582; 
 Fri, 22 May 2026 11:34:39 -0700 (PDT)
Received: from [192.168.64.111] ([50.78.183.177])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2beb591d102sm23030525ad.81.2026.05.22.11.34.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 May 2026 11:34:39 -0700 (PDT)
Message-ID: <d19f76ef-487c-493c-8276-4526b7f96762@linaro.org>
Date: Fri, 22 May 2026 11:34:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 02/64] target/arm: Implement FEAT_FAMINMAX for AdvSIMD
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20260520182213.872945-1-richard.henderson@linaro.org>
 <20260520182213.872945-3-richard.henderson@linaro.org>
 <CAFEAcA_F72LXF9kWVrU=mSt4=v19jRkDt9XkznpE+7DjVV94kw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <CAFEAcA_F72LXF9kWVrU=mSt4=v19jRkDt9XkznpE+7DjVV94kw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 5/21/26 01:25, Peter Maydell wrote:
> On Wed, 20 May 2026 at 19:22, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> 
>> +/*
>> + * Use float_minmax_ismag to get the absolute value min/max.
>> + * Avoid float_minmax_is{num,number} so that we get normal NaN processing.
>> + * If the result is not a nan, take the absolute value.
>> + *
>> + * Note this operation squashes FZ, FIZ, and AH to 0.
>> + * Create a fresh status with default behaviour and propagate exceptions.
>> + */
>> +#define DO_FAMINMAX(NAME, TYPE, MIN)                                    \
>> +TYPE TYPE##_##NAME(TYPE a, TYPE b, float_status *s)                     \
>> +{                                                                       \
>> +    float_status local = {};                                            \
>> +    arm_set_default_fp_behaviours(&local);                              \
> 
> This misses that we need to keep the default_nan_mode setting
> from 's', otherwise we stop honouring FPCR.DN. This will fix it:
> 
> --- a/target/arm/tcg/vec_helper64.c
> +++ b/target/arm/tcg/vec_helper64.c
> @@ -155,6 +155,7 @@ TYPE TYPE##_##NAME(TYPE a, TYPE b, float_status
> *s)                     \
>   {                                                                       \
>       float_status local = {};                                            \
>       arm_set_default_fp_behaviours(&local);                              \
> +    set_default_nan_mode(get_default_nan_mode(s), &local);              \
>       TYPE r = TYPE##_minmax(a, b, &local, MIN | float_minmax_ismag);     \
>       if (!TYPE##_is_any_nan(r)) {                                        \
>           r = TYPE##_abs(r);                                              \
> 
> (or we could go back to copying 's' into 'local').

I went back to copying s into local.  I should have known a blank slate was too good to be 
true.  :-)


r~

