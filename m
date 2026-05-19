Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FA83CD4F54
	for <qemu-arm@archiver.kernel.org>; Tue, 19 May 2026 21:52:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPSMH-0007lg-59; Tue, 19 May 2026 17:52:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPSMF-0007kE-1e
 for qemu-arm@nongnu.org; Tue, 19 May 2026 17:52:11 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPSMD-0004w8-Bi
 for qemu-arm@nongnu.org; Tue, 19 May 2026 17:52:10 -0400
Received: by mail-pg1-x52a.google.com with SMTP id
 41be03b00d2f7-c8026aa4d53so3092987a12.3
 for <qemu-arm@nongnu.org>; Tue, 19 May 2026 14:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779227528; x=1779832328; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cjoyWxzcc+a2c9gHHTQ2sXqtL7HPTeJX2sYofxYKnSw=;
 b=Inv5RE8fKskK+Z1QD5LXEhe2XYS0UiYLmxO2nMe4xBwt5QaVWSTHgrmHLPiPEWIglX
 EK4j9VbdiKEtEEfiml4odiZHiz/qwHdeq77GE1/G2srgMybQIb/rd7u0kR0WD8oP70HQ
 p0nDQYFC/S9XJuKl+nNhZIXihR5QRRrd4fWSmNrCHf8mtbrcVdt4tSPn3SBNpSKQs11P
 Es2GJUb4ZZZQditS1KWtlRRWoalmZrSEVCY5t2F3GEdRgsKMyJHlN0PYk5Bnarbz9pom
 JV5n0UH+ZTFyljo8/tWfkKaILiLziDIn2SfZkK5lKsI/P6Nzus/l6q+fO3fW1amdpdR1
 3gBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779227528; x=1779832328;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cjoyWxzcc+a2c9gHHTQ2sXqtL7HPTeJX2sYofxYKnSw=;
 b=Fi7qX1+Ir9c/P1yUSPTXPLC9X9PIyU+a2XcxuS+Evp5EdQnAZXSkr/Kf6FW+6ZGF8t
 jgNRu6/VvwmlMWjWMnpEYWF2/pfVAOE+iL/Zhw9io2+GMWaXVozCvjT4UVMmoM9Cr11u
 /hyOOQ1AIqc/soraoeyJd1tAIE9cuPuPBKaWBy9MN8w8EKwJiwBh1TOewHKgFOyrYCvr
 iSEM9pVbglyoj1YYjiJ1aCvbatwhLwbKfpuxJMk5cYSYQVr4Qc1OouyrpnNI7UeX3WJh
 T5H68yM5hzlpY8xJXKcwlk1/YUaquey9gtr6QRoJFhnwow9IxrJDgBCegf86Txz2ts2y
 dOZw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+1fGYI6+/mZUgVymS52068P1A0AW2IbOTwMpdD4i6qrmAnWHxfVGaQ4eOD98Z6Hpbd8BGZfjP0bg==@nongnu.org
X-Gm-Message-State: AOJu0YywS/IBVX+7qtNBazoar61Kw8HeaPAW49Q3H/YLurHQ00628NSu
 XuwGkTJECcLA+hInznwVJ7JGxwVmAtJwwGZmWZSvXbQLOIzvRXzWjT2iJdiHqWTinEyUYVSVsDr
 neKWNPO4=
X-Gm-Gg: Acq92OE4sUGM4dLrG1gK/nOQ3Jd+iBAbzt8BdGBpzjhSGWMYjRPOE26N/+fUNWpyA8X
 tN5rqvNyubk+sHRIsrSkTtMEEDVJ4sIu2iyuy0pnvWWk+b/mMbFewSiVmgFqjxYSrt8LiX+BnGm
 d+HSOw0ig+Bu4BjGzm5bsHpFA37QIj+xXLJ6hs48pzUfdBfzBmm0c9Q4qH9UjBY3T9oCbzr6nKI
 j69rzV3IHIw0LIbI6mb6484K62tMEj654YoCEoZ+vbJikRFQ7uDyFrNAexf8xqpN1IiXDzO2mUg
 FoYHVFlA9koOtjGT938IqeSC77ZjpUQXb5lE4GdN+aAD/d3P3N8WRrtdECHmVhUMn+1pnbqXp/S
 2p8ee7ptLMDrwOIY1PKKCZzBRbcJ25Gx/t66yH1ZTuiz/duxKR/jX0KfQz0KHxRiTIKCHwNxTMh
 cv3L1TM/O8WvHrUCTQiK+YpLJUbYL5H5RxjoWz
X-Received: by 2002:a05:6a20:7486:b0:3a2:d79c:416d with SMTP id
 adf61e73a8af0-3b22ed6295emr25180204637.43.1779227527629; 
 Tue, 19 May 2026 14:52:07 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.142.33])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c82bb07b007sm17563097a12.11.2026.05.19.14.52.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 May 2026 14:52:07 -0700 (PDT)
Message-ID: <90811f89-79a0-4e34-b6a8-d349353620f0@linaro.org>
Date: Tue, 19 May 2026 14:52:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 45/63] target/arm: Implement FMLALB, FMLALT for AdvSIMD
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20260517003002.321430-1-richard.henderson@linaro.org>
 <20260517003002.321430-46-richard.henderson@linaro.org>
 <CAFEAcA_4wU+wndbAqjnObpvnLit11OVDZvTZ1RWy_q0cNfH7uA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <CAFEAcA_4wU+wndbAqjnObpvnLit11OVDZvTZ1RWy_q0cNfH7uA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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

On 5/19/26 06:41, Peter Maydell wrote:
>> +static void fp8_mul_finish(CPUARMState *env, FP8MulContext *c)
>> +{
>> +    /*
>> +     * FP8 multiplies don't update FPSR.{IDC,IOC,IXC,UFC}.
>> +     * Since this is multiply-add, DZC does not apply and only OFC remains.
>> +     */
>> +    fp8_finish_fpst(&env->vfp.fp_status[FPST_A64], &c->stat,
>> +                    float_flag_overflow);
> 
> Looking at the A1.5.5 text a bit more carefully I don't think
> we should propagate OFC either for FP8 mul:
> 
> "When the rounded result with unbounded exponent has an absolute value that
>   is greater than the maximum normalized number for the output precision:
>   — Generate one of the following outputs with the sign of the result:
>   — When FPMR.OSM is 1, the maximum normalized number.
>   — When FPMR.OSM is 0, an Infinity.
>   — Do not update FPSR.OFC. "

Huh.  What an odd way to define things.  AFAICS, this means no exception bits are updated 
at all.  Why not just say that.

> Also, I realized that this squashing mechanic means we can't do
> the handling of invalid input formats the way we do at the moment.
> The float_raise() operations done by fp8_invalid_input() will
> get squashed for multiplies. I think the fp8_invalid_output() part
> is still OK because we only use it in the FP8 convert operations.
> 
> We could perhaps have fp8_mul_start() explicitly check for fmt1
> or fmt2 being fp8_invalid_input -- it has access to the real
> fp_status so can raise Invalid and InvalidSNaN there.

Here's the thing:

FP8Unpack doesn't raise an exception itself, just sets fptype = FPType_SNaN.

For FP8ConvertFP, we then explicitly raise invalid and return default nan.

For FP8DotAddFP, we notice nans within a loop, setting any_nan; after the loop, if any_nan 
is set, we return default nan but do not raise invalid.

So I guess we don't need to do anything special during fp8_mul_start.

One thing I could do that might be slightly clearer is

static FloatParts64 fp8_invalid_input(uint8_t x, float_status *s)
{
     /*
      * Invalid input format is treated as snan, then one of the uses
      * will convert to default nan and raise invalid.
      */
     return (FloatParts64){ .cls = float_class_snan };
}

What do you think?


r~

