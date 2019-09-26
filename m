Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp2526098wrp;
        Thu, 26 Sep 2019 12:07:58 -0700 (PDT)
X-Received: by 2002:a65:5c0b:: with SMTP id u11mr4986673pgr.294.1569524878791;
        Thu, 26 Sep 2019 12:07:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569524878; cv=none;
        d=google.com; s=arc-20160816;
        b=N2Vcog/BA76Vbxwsk2bEoKl+le6UV/ld/aYL3Pzd+E4yuDwA732RRWIgExdkK7Xziw
         rTHbwlmLlO6o5ey2JVLMM/S9vGIqCjrifckv0iUOT0FxrNihOIS1YaRlVZjIwhaEvR88
         ICYzph/1hOIAgQLRT+2W7RV90/oBf7It084j4SjYAyBOMq/mfQleHSDB4YMwX5k8iRu/
         Hfd0ylo8tGEhXGVOvNqqulT1z3w8250Uzv5iOxAzQNU9a/IUk0BLdJH0YONKUKIjqY4q
         E9whNspEjp/Dov9+zBsArbRiQ8/xz1PAXsRl6Dwzh5u4xSTL0j0PFvcfIEqAu6+EUyPO
         +wAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=zKpl9jWF7yohhRW+KbqxUCibNvl2Z53+iZCD5XEizI4=;
        b=L0IUZbD7RAQtW38Og08K4ocO64hmr0QJ8xX6kLQvH9pRH2zUNuOBpGbc7NSuUMTAmK
         kApPow+hrVblu3YHvi63NVsfMRlHWNGLAoQ6qkAdk5jNE+oc9clABCmR8sbJ8WKhG4uj
         19njYoOeYgvZ0QH9fRMt3lqH500Rt8v4rO6Qrlz2dLesD3kk4xglNytYc3KjnQ9/TueG
         jOXX6EJ6ma9pcmg1/Ru1VjzYAPK+ZGXdqJ+zjvMUiyfGSIQ0e5+nHe4ZMv+5J3GIYSG9
         l4Yd6ZTQC6PO1vhDH4G/GrJS5cs41vj9qMH5iNi0H9ziETQmb4zNaje7D141xRify2yh
         OUZg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uNR91pvR;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id q8sor197185plr.67.2019.09.26.12.07.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 26 Sep 2019 12:07:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uNR91pvR;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=zKpl9jWF7yohhRW+KbqxUCibNvl2Z53+iZCD5XEizI4=;
        b=uNR91pvRCwcuiYNvBUqwh1PcxVPhBjuOKSe810lMdYb2XbCeTmwkyx/p+ZjPCtt1aC
         6Mq1TsQg5lh8Gua+uzY0KxJDwmhDpMMryajQjbGzqtCDthpWZ5XP/EpKJD3ZaojeS2iF
         uyDvbVcX16t+F2mloHDGFxkojM54XYObUJoZJLbWRtEUDagkbDTNrlTbtlV3ZTwe93cY
         f9DXoyJC+/QeT2SG5v7CTSi9iT2wMm6vCzYLjHb9jO97C8AEHfo435/dT8cdu/RaL7WH
         pPVEUB1VSLSYuvHITmhEGrfSbA6dxOR3LZ6VlBXd620gSt8WnZvn3w4TMZWHzqIei8YH
         43Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zKpl9jWF7yohhRW+KbqxUCibNvl2Z53+iZCD5XEizI4=;
        b=BdEGPkEBtmdqhGX4uWda3AHUn7WV9+tHm0N0zud4RQCy4fCe/g6nSDUK/MW2RcjdkW
         CYBJwT8XYXcefbBavyngrMT1b3Y53yaQL/JSn6e89hjCrPfVfq4AisVuWYnipUJtJ5IK
         wEhBCJJBAAvEPmyfmP5KprKvoWa7eYaTVkICP0n3qpqs5Ag4aeUNIJ1/bM1VXdeLTUBO
         wN4VmRSfU97Li5WS1wVtK2N4T/rIFcqv8pqd1kbXtpz9rCS8L8/okmqXGMY/FGkXCoGs
         Usk13vTcvk7dC6Oawlgpvr4VLdcN7UaNJe1vipYJgjFw3Bqf5cMEvn5xCFTnqQ6U4AI+
         vr/A==
X-Gm-Message-State: APjAAAW6t8kTqOuQltwpRwNp+zxLS99q1hcV3VzO5CrR14MjnL5kV+fk
	/ZRHEW+qafIHO5Oq+h07w4x1m5Y0
X-Google-Smtp-Source: APXvYqyEk2ODKjE97AqcrtWyw1yTImZvr7bM880/6S5IYEVIGFe0vAtOutG4wNaG89eGEDmwOTqVbg==
X-Received: by 2002:a17:902:5a44:: with SMTP id f4mr109642plm.31.1569524878184;
        Thu, 26 Sep 2019 12:07:58 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [172.20.32.216] ([12.157.10.114])
        by smtp.gmail.com with ESMTPSA id e10sm34997pfh.77.2019.09.26.12.07.56
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Sep 2019 12:07:56 -0700 (PDT)
Subject: Re: [PATCH v4 4/9] target/arm/cpu64: max cpu: Introduce sve<N>
 properties
To: Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org, armbru@redhat.com,
 eblake@redhat.com, Dave.Martin@arm.com, eric.auger@redhat.com,
 imammedo@redhat.com
References: <20190924113105.19076-1-drjones@redhat.com>
 <20190924113105.19076-5-drjones@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <2beb840f-99cf-d928-0926-c284933c78d9@linaro.org>
Date: Thu, 26 Sep 2019 12:07:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190924113105.19076-5-drjones@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: ri3ZBPFEqf0r

On 9/24/19 4:31 AM, Andrew Jones wrote:
> +static uint32_t sve_zcr_get_valid_len(ARMCPU *cpu, uint32_t start_len)
> +{
> +    uint32_t start_vq = (start_len & 0xf) + 1;
> +
> +    return arm_cpu_vq_map_next_smaller(cpu, start_vq + 1) - 1;
> +}
> +
>  /*
>   * Given that SVE is enabled, return the vector length for EL.
>   */
> @@ -5360,13 +5367,13 @@ uint32_t sve_zcr_len_for_el(CPUARMState *env, int el)
>      uint32_t zcr_len = cpu->sve_max_vq - 1;
>  
>      if (el <= 1) {
> -        zcr_len = MIN(zcr_len, 0xf & (uint32_t)env->vfp.zcr_el[1]);
> +        zcr_len = sve_zcr_get_valid_len(cpu, env->vfp.zcr_el[1]);
>      }
>      if (el <= 2 && arm_feature(env, ARM_FEATURE_EL2)) {
> -        zcr_len = MIN(zcr_len, 0xf & (uint32_t)env->vfp.zcr_el[2]);
> +        zcr_len = sve_zcr_get_valid_len(cpu, env->vfp.zcr_el[2]);
>      }
>      if (arm_feature(env, ARM_FEATURE_EL3)) {
> -        zcr_len = MIN(zcr_len, 0xf & (uint32_t)env->vfp.zcr_el[3]);
> +        zcr_len = sve_zcr_get_valid_len(cpu, env->vfp.zcr_el[3]);

This has lost the MIN relation between these 3 registers.
One possible solution is to keep these 3 if statements as-is,
but make one call

    zcr_len = arm_cpu_vq_map_next_smaller(cpu, zcr_len);

at the end.

> +#if __SIZEOF_LONG__ == 8
> +#define BIT(n) (1UL << (n))
> +#else
> +#define BIT(n) (1ULL << (n))
> +#endif

There's no reason not to always use 1ULL is there?


r~
