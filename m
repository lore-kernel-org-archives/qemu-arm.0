Received: by 2002:a17:504:c05:b0:1be9:327d:8ee3 with SMTP id k5csp68043njf;
        Fri, 25 Oct 2024 12:46:13 -0700 (PDT)
X-Received: by 2002:a05:6871:892:b0:288:679e:ca8a with SMTP id 586e51a60fabf-29051bab57cmr694982fac.18.1729885573086;
        Fri, 25 Oct 2024 12:46:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729885573; cv=none;
        d=google.com; s=arc-20240605;
        b=V1Ke2+6GbveMSk6QKL2tl68voiUI5s6Lbn9PQ0SZFmcX/PaEUEsX764YnPaHSZEqWg
         IY8fN0ppwJiOX0v8MtWbc7pl5Iq/VnkP5SqVGhzMOWkZAMnAG03tG3bEAT0y9PQUcuJN
         pbPeoiIj1ArmCAEZjbcIKs+BmhD2r9NS+V1mG8szBko/S2ysO85N6//3JYLTjTU0ZeaS
         XepqrKxC06LrW1ppmg9vPAaEvXk58dUm9/TkdkdiBejlr64QuJ920gSzJ4v+LMh++Izc
         nPdw0kzcFS8MZ9BSeMWg5gRLibPZYO9TLqGHCka9MRPF+hdP4mYNPYor2AH2agEWOtFf
         UEdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=YOGDYhl0qG1s0ZEAFo090clg/DIDqwtQaJt2M8YnNbE=;
        fh=57KB4fSpGukS9IUlPcDISciwmQ4lhGDq9IA5L5jXiis=;
        b=GG0ntX+7m20kQP749du/xdxmeghB2mwmeQl5ncsqdI1yX2dnnsanU8CKhr0b7W7xa5
         KNFqYSKzbpZRyPXZuJi1LrMP94OFBQJzFV2ZoaI3z7BkizaAf2w9NATXBWePqaZxvW91
         tBAPWXgvIvdowKgCvaKBtaig2/5sJsFUy1AEwD/3/jhJotAoivg8v58vcWmosLjtam1w
         GDeiHuLWynIhpjE8j4FrQ39Nc0/6qVjbWM/GNoc31+qGYdp07B8nbc4PZvlP+/j8lvPL
         36EZgFIh/O+xDdhW+Q7HMNrR/pAFOsP9li4DPPbMcOyh7Fr2ut/3PHrS5S42KPl2XJ7t
         P08g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="yi/izCKn";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-7edc89f10cfsor831280a12.5.2024.10.25.12.46.12
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 25 Oct 2024 12:46:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="yi/izCKn";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729885572; x=1730490372; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YOGDYhl0qG1s0ZEAFo090clg/DIDqwtQaJt2M8YnNbE=;
        b=yi/izCKnOYFDriAU12L3WcxfFMhEU5Atgmc7I7RNHX+99YzH3FoAtOAeuxSaiE6QrQ
         Vxsik2oyfAUx/y6ljzB84uaZWScuTw1HQD+pZ+gG3LhXHCS4NiuupACk1SfQQXmZLvhk
         M6vy77LJ8h/get9RgefMxISTU6w/vZPc4jOKSXtWnBCPLHCxFbNvr/yGffj9KEGskJ69
         gtOC/nlsZIJFh0z06vKLjhCwvI9M72OnMTQikp7eRMJz7+q5/lke1b2hCvPLd/jr1x4y
         GYHxk+uj2yLTZScMN2VmEv27xpUvhLIcJwKIjzEo5beBExjZytcj1J4DH1fHTDEarCUr
         Jk7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729885572; x=1730490372;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YOGDYhl0qG1s0ZEAFo090clg/DIDqwtQaJt2M8YnNbE=;
        b=cSuUDI9mIUJx1M2cNN+sAKxDrqcgREggSPvzietJS8bklTKyNH7EdJJZYKiidLz1Gq
         zCjKS795cG+V1Umw8Jyhl+UyzAhemnntmS18HKQCXj6ES2dQ5bFmePZIUeqV++75PWtA
         Rgb7REd2MQExmrEMOZ1M+j4JjBCs2INuHkpSSnSvPmr8bUUDc6leJ3wPrTAYwUqyAf+/
         4OslVqXnf+vjLw27B/pQ+qPBNxesQVfL5KqHeJv9Pbmn9G1OYc9UuGzPlPuPyjaI9FT2
         d9bvtC6sxUoU9b5VN0wuL+p238MDjgri3K1ZPOQR5pZhFO08jSwPDClQQ4KAKvoG0Eep
         5WbQ==
X-Gm-Message-State: AOJu0YyxtjDczcnu/FsQzLp39AbWb15Ymsh1tg4u1++kE2bzVihUhCgn
	FqXS5X4u+xmM2el0g1t0YK8234EbWDW4+/pg1p64r+jnWthWwhM+ZBSxz1wwd1fsAQ==
X-Google-Smtp-Source: AGHT+IH19+L0F6gDD1TRSLxGEGHwcI7HEby4tr0kP/4es7e6y+LR+loJMkfKrqHbTkTMDkf6sS6PDQ==
X-Received: by 2002:a05:6a21:6b0c:b0:1d9:1334:27e1 with SMTP id adf61e73a8af0-1d9a83ca04dmr480352637.13.1729885572601;
        Fri, 25 Oct 2024 12:46:12 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.2.252] ([201.190.186.93])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7edcc132c0bsm1202740a12.70.2024.10.25.12.46.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2024 12:46:12 -0700 (PDT)
Message-ID: <ed9a4ac3-1b89-4ed8-9839-01df7fb4d989@linaro.org>
Date: Fri, 25 Oct 2024 16:46:03 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/21] target/mips: Explicitly set 2-NaN propagation rule
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>, Eduardo Habkost <eduardo@habkost.net>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Aleksandar Rikalo
 <arikalo@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-ppc@nongnu.org, qemu-s390x@nongnu.org
References: <20241025141254.2141506-1-peter.maydell@linaro.org>
 <20241025141254.2141506-5-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241025141254.2141506-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: smS+ETuROqRf

On 25/10/24 11:12, Peter Maydell wrote:
> Set the 2-NaN propagation rule explicitly in the float_status words
> we use.
> 
> For active_fpu.fp_status, we do this in a new fp_reset() function
> which mirrors the existing msa_reset() function in doing "first call
> restore to set the fp status parts that depend on CPU state, then set
> the fp status parts that are constant".
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/mips/fpu_helper.h       | 22 ++++++++++++++++++++++
>   target/mips/cpu.c              |  2 +-
>   target/mips/msa.c              | 17 +++++++++++++++++
>   fpu/softfloat-specialize.c.inc | 18 ++----------------
>   4 files changed, 42 insertions(+), 17 deletions(-)
> 
> diff --git a/target/mips/fpu_helper.h b/target/mips/fpu_helper.h
> index ad1116e8c10..7c3c7897b45 100644
> --- a/target/mips/fpu_helper.h
> +++ b/target/mips/fpu_helper.h
> @@ -44,6 +44,28 @@ static inline void restore_fp_status(CPUMIPSState *env)
>       restore_snan_bit_mode(env);
>   }
>   
> +static inline void fp_reset(CPUMIPSState *env)
> +{
> +    restore_fp_status(env);
> +
> +    /*
> +     * According to MIPS specifications, if one of the two operands is
> +     * a sNaN, a new qNaN has to be generated. This is done in
> +     * floatXX_silence_nan(). For qNaN inputs the specifications
> +     * says: "When possible, this QNaN result is one of the operand QNaN
> +     * values." In practice it seems that most implementations choose
> +     * the first operand if both operands are qNaN. In short this gives
> +     * the following rules:
> +     *  1. A if it is signaling
> +     *  2. B if it is signaling
> +     *  3. A (quiet)
> +     *  4. B (quiet)
> +     * A signaling NaN is always silenced before returning it.
> +     */
> +    set_float_2nan_prop_rule(float_2nan_prop_s_ab,
> +                             &env->active_fpu.fp_status);
> +}
> +
>   /* MSA */
>   
>   enum CPUMIPSMSADataFormat {
> diff --git a/target/mips/cpu.c b/target/mips/cpu.c
> index 9724e71a5e0..d0a43b6d5c7 100644
> --- a/target/mips/cpu.c
> +++ b/target/mips/cpu.c
> @@ -407,9 +407,9 @@ static void mips_cpu_reset_hold(Object *obj, ResetType type)
>       }
>   
>       msa_reset(env);
> +    fp_reset(env);
>   
>       compute_hflags(env);
> -    restore_fp_status(env);
>       restore_pamask(env);
>       cs->exception_index = EXCP_NONE;
>   
> diff --git a/target/mips/msa.c b/target/mips/msa.c
> index 61f1a9a5936..9dffc428f5c 100644
> --- a/target/mips/msa.c
> +++ b/target/mips/msa.c
> @@ -49,6 +49,23 @@ void msa_reset(CPUMIPSState *env)
>       set_float_detect_tininess(float_tininess_after_rounding,
>                                 &env->active_tc.msa_fp_status);
>   
> +    /*
> +     * According to MIPS specifications, if one of the two operands is
> +     * a sNaN, a new qNaN has to be generated. This is done in
> +     * floatXX_silence_nan(). For qNaN inputs the specifications
> +     * says: "When possible, this QNaN result is one of the operand QNaN
> +     * values." In practice it seems that most implementations choose
> +     * the first operand if both operands are qNaN. In short this gives
> +     * the following rules:
> +     *  1. A if it is signaling
> +     *  2. B if it is signaling
> +     *  3. A (quiet)
> +     *  4. B (quiet)
> +     * A signaling NaN is always silenced before returning it.
> +     */
> +    set_float_2nan_prop_rule(float_2nan_prop_s_ab,
> +                             &env->active_tc.msa_fp_status);

Alternatively pass float_status* to fp_reset() and call it here as

        mips_fp_reset(&env->active_tc.msa_fp_status);

So we keep the comment in one place.

Regardless,

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
