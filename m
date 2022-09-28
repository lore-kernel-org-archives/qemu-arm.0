Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp434749ocs;
        Wed, 28 Sep 2022 10:03:18 -0700 (PDT)
X-Received: by 2002:a17:902:b18e:b0:178:3484:f45e with SMTP id s14-20020a170902b18e00b001783484f45emr759881plr.166.1664384598681;
        Wed, 28 Sep 2022 10:03:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664384598; cv=none;
        d=google.com; s=arc-20160816;
        b=eJ+v2MhK7JeLQIr/OA1ZtVHRrdUQC/NtWF+hgzUXir0n7ckqWKuz5Kq+yy9miaxUQb
         vdPvR2iRWqH5Co29ey88f6MU0Xli/e8uldN8miMhmSq0d8xMzyYrQXakSdAmKQmFH6YC
         1tKrjB1Iz0WyY6vdHRijNpmG98EMnVdJrSnqCR8yfr433jbITOILNMXT3/4/UPOEeQUs
         EmM96rXYxV/iY70gFjVQ9deGdK1FOjNyvyW38vyum2dWRiC7K3d+oSRRrrs0w6H5q+2x
         mLEG/83nDMoO9NPtJOExPn9sLMD6j9AGJE48E0qm3zBD3QHlQbKIEnw0o1obJD4cJLeM
         emIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=mdAzjl6IyU8tvxzZG2JHN5uBLEw4boCOr3S6Cf3tUt0=;
        b=u6COpLbCDxZRwLS817ua2PplDo9grktosbZOIbmP1z1950p/Lvu1Dx93OsOq2hUmXi
         2EdBGg+Pm7g0/Ga/wjf2vphi/f9j/jeyGKrZyfNs+n9/33dfINLmdkfCiy+UEmz9nJ0H
         fzfaNfBGNcxHVH8tqU9AAipXBWOl4slL6xRZGHe33j6ghBGOMHd5x7dmVZMrFg+yBjhG
         c8xSe9fjXKmQl9YxHDmMrJQsPEE4pMZZu6cyCjuK9mryPYZ4PrExRHtbiunCdtxrnUk/
         btK0YAiGZEABbkytrCEzOHRgHayjBFLUYitoEL/xNWOxHHL+gq23LMSyVZ/dFeOv/V41
         4zkQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ve5lqRJF;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id y15-20020a170902b48f00b00176c2b25d25sor2459801plr.121.2022.09.28.10.03.18
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 28 Sep 2022 10:03:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ve5lqRJF;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=mdAzjl6IyU8tvxzZG2JHN5uBLEw4boCOr3S6Cf3tUt0=;
        b=Ve5lqRJFHJaobo6Nvr+9R9354ZrwFZNe7OsAjdIYCVtx1Az01Gf6qEtzXBwNG0GptT
         FNAXZrgBz0rH1XNBiLYq6w9ex6BuXWhcHNrf1heiaQ6bGyTpIDoiWhoynaZFf59vKtHq
         b29YHUNByFO1V5uziCYF4N8p3ZXj2CNEHTyQjo+nLGXQNMQb4RHqMRTvmNVu4c/SETKz
         v5IRpYDQQpfkRbXj8dFrfYTmQEZdzKr2giqhVkXir6AgGXwGDtOxr0b/4DMkD1grkzqB
         uErx6IBVwJ8ReM/MQ4JCfJKDv18Go2GyeU54Sf7SP9tPxRKcViYZ1kZWg52sXu4fN9gs
         HVrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=mdAzjl6IyU8tvxzZG2JHN5uBLEw4boCOr3S6Cf3tUt0=;
        b=pxMzWDbizrniC7Wk8MmMuwTkwzJ0Y1MTtvVfbryxBUVNu8Ocrw1P0xlWKIwKsByBj7
         oUIlD12x1JZNofBtnA6f6oyoOrsHwCix0AvwsQhXVj5sVcOYZsJYGPU2BYY608kkjk4z
         ckQQ5vv+qKhh5M1nL6XjMDhgSp6k6jGF/23uj0iyd6I6b0F4vbXfWgAx/q9aQnhEzjzA
         Gs9zRkVZHLHfe4aIFLYbA2kgbv6n2tKuGtWrmiOGsf67+9GTXDvGsPzh4ePt1MoRPObe
         lzQkwHrup7nSsx6xwv9W0CGdheZltYRKPgpfOlWUpUTrTDDrLpXcyX5TUtAan8QBZe5I
         HYIQ==
X-Gm-Message-State: ACrzQf25XE5oa3NG8B85U3Js78pmtW4pyD/huR5SSlfinPk1MmC1BTbl
	bE45E2qFH8GtIiDogvkdCvI+mgAvPOo+VHH/
X-Google-Smtp-Source: AMsMyM6Bf0l3JVVvZvQwSZOQg1m0yNkXOrTC23Jsmg4oKnq52vB8N1Qy+f72rJ+LLt/UypxpIDtmYA==
X-Received: by 2002:a17:903:1112:b0:179:ce23:dd57 with SMTP id n18-20020a170903111200b00179ce23dd57mr795041plh.114.1664384598225;
        Wed, 28 Sep 2022 10:03:18 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2602:47:d49d:ec01:986f:cb56:6709:4057? ([2602:47:d49d:ec01:986f:cb56:6709:4057])
        by smtp.gmail.com with ESMTPSA id v11-20020a17090a088b00b001f22647cb56sm1786018pjc.27.2022.09.28.10.03.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Sep 2022 10:03:17 -0700 (PDT)
Message-ID: <eebd5989-73e5-7b2d-f83b-fd3d413ea8e0@linaro.org>
Date: Wed, 28 Sep 2022 10:03:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 08/15] hw/intc/gic: use MxTxAttrs to divine accessing
 CPU
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20220927141504.3886314-1-alex.bennee@linaro.org>
 <20220927141504.3886314-9-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220927141504.3886314-9-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 6h4Zh43nCmrv

On 9/27/22 07:14, Alex Bennée wrote:
> Now that MxTxAttrs encodes a CPU we should use that to figure it out.
> This solves edge cases like accessing via gdbstub or qtest. As we
> should only be processing accesses from CPU cores we can push the CPU
> extraction logic out to the main access functions. If the access does
> not come from a CPU we log it and fail the transaction with
> MEMTX_ACCESS_ERROR.
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/124
> 
> ---
> v2
>    - update for new field
>    - bool asserts
> v3
>    - fail non-CPU transactions
> ---
>   hw/intc/arm_gic.c | 174 +++++++++++++++++++++++++++++++---------------
>   1 file changed, 118 insertions(+), 56 deletions(-)
> 
> diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
> index 492b2421ab..7b4f3fb81a 100644
> --- a/hw/intc/arm_gic.c
> +++ b/hw/intc/arm_gic.c
> @@ -56,17 +56,42 @@ static const uint8_t gic_id_gicv2[] = {
>       0x04, 0x00, 0x00, 0x00, 0x90, 0xb4, 0x2b, 0x00, 0x0d, 0xf0, 0x05, 0xb1
>   };
>   
> -static inline int gic_get_current_cpu(GICState *s)
> +
> +/*
> + * The GIC should only be accessed by the CPU so if it is not we
> + * should fail the transaction (it would either be a bug in how we've
> + * wired stuff up, a limitation of the translator or the guest doing
> + * something weird like programming a DMA master to write to the MMIO
> + * region).
> + *
> + * Note the cpu_index is global and we currently don't have any models
> + * with multiple SoC's with different CPUs. However if we did we would
> + * need to transform the cpu_index into the socket core.
> + */
> +typedef struct {
> +    bool valid;
> +    int cpu_index;
> +} GicCPU;
> +
> +static inline GicCPU gic_get_current_cpu(GICState *s, MemTxAttrs attrs)
>   {
> -    if (!qtest_enabled() && s->num_cpu > 1) {
> -        return current_cpu->cpu_index;
> +    if (attrs.requester_type != MTRT_CPU) {
> +        qemu_log_mask(LOG_UNIMP | LOG_GUEST_ERROR,
> +                      "%s: saw non-CPU transaction", __func__);
> +        return (GicCPU) { .valid = false };
>       }
> -    return 0;
> +    g_assert(attrs.requester_id < s->num_cpu);
> +
> +    return (GicCPU) { .valid = true, .cpu_index = attrs.requester_id };
>   }

I think you should split this function, and do away with the struct.

>   static MemTxResult gic_dist_read(void *opaque, hwaddr offset, uint64_t *data,
>                                    unsigned size, MemTxAttrs attrs)
>   {
> +    GICState *s = (GICState *)opaque;
> +    GicCPU cpu = gic_get_current_cpu(s, attrs);
> +
> +    if (!cpu.valid) {
> +        return MEMTX_ACCESS_ERROR;
> +    }

This would become

     if (!gic_valid_cpu(attrs)) {
         return MEMTX_ACCESS_ERROR;
     }
     cpu = gic_get_cpu(attrs);



r~
