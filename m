Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp358738wru;
        Wed, 26 Jun 2019 11:29:17 -0700 (PDT)
X-Received: by 2002:a05:600c:254b:: with SMTP id e11mr207252wma.171.1561573757438;
        Wed, 26 Jun 2019 11:29:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561573757; cv=none;
        d=google.com; s=arc-20160816;
        b=TjeuVqGCBO5qR3Xn1YljkKN+AUCJ8gZeqHln4xcb0ZMnVGKgazKb9DaiXoMEHlKrkv
         yCPRItLxckHehRkQV2cjxpkbmWxCOX6wBgvZTrZSm7PiH2hkteEXRIAVTxotrE9yTa7g
         GHePXRkyuny6tR+fr6VNLJyLjXe/FnJ1ZambvUq/StVv0feofTL7wDAaPXtOEdQpZ+/T
         FcGxRiiwmwuRoM1NXgV8UrHQyj5mO3OI4cooqx97LzHmSPoSZ6ciVa1Fiipor9obxjIw
         vXMG5pw2oxzEMpm25kmGZJqlv8rKu5040NthW8PaXUjJXtEBmpBHYsI8tTXCix9EuY2w
         Lm1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=L5TFjTIA0S4uo9coV4FdErRUtFqXXlJt9/7Jahxl5zg=;
        b=VlFyOt2vWAT+TWhD/RuidwoWjhLF5T9FiLRSaJHgL1E/uud8BE6ryvqKhCyi2VBxrB
         f+A9y2rKsprcnVdcf0um2uiMu7dZNZ99d1GpyUAPIMgiD8vTP+a43GuAR7s2zfO/eQle
         5EmXLladGAkNxJTcDIv4nvpGZjKS3BtIY86VgQrXmM/6gPfpTuhOwin4z4SEm1PoXZQ1
         x5t4NpRhed/7nxbSX0SZEKdx3i2kAjnz2yUUNthD4b1tKhk2wiiHGEME9hzMAP35HUUa
         O6YBK09n9/EG/REUZWXvdmlP6oSVBnVx4bCr1FeopMeByRixKd4p8O0dSjlF9I6SFJEq
         yynA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Y4GZ/vAS";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id 75sor13193450wrk.12.2019.06.26.11.29.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 26 Jun 2019 11:29:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Y4GZ/vAS";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=L5TFjTIA0S4uo9coV4FdErRUtFqXXlJt9/7Jahxl5zg=;
        b=Y4GZ/vASz36bxNxYFcJWVfCfs8yi7wkS2kYlIGYv3q8uvdKY6foGkA6Ag5jX80+ZYP
         Xkpb1EYgbwOcrzZs+q9ZDz5dJ8XZhxQ+87Orn6cuJn9Kmaq3U6bkdi1O2wlVUyp9XCyU
         aQEq/tLrENSGYUUC/zkWepA8ePZXr+XAraw2k+esqNBjPl8zCNmb0qDGUV98sEYw1lsu
         Kqvahzw6mI+ou/RnfTMg5oyBjgci0tTdC3psxwjLFx3St931CBzvg9al73GCvcpRSAke
         dtqAx7IsZaz8NxtiW6BLsRQkteeyVHuBbfNkXNP2OqLukX2hrvoXxroaORbJHqJPH7JY
         +e8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=L5TFjTIA0S4uo9coV4FdErRUtFqXXlJt9/7Jahxl5zg=;
        b=aKbV5scbMIweM65znx+FHZAfRZpCMgAieXwnFcYCtAfOetg1cqIKk+8sLqSap2h77V
         YcfXxgcp4BEwKni43MMl9hm04MbY3LKf4CgQRHjc8t+NVnjRf3PcKnCSbmwPgkQjMbER
         PlaGvpKPy3uMhwrzsu+b67IARNANVRaKmZh9q4FTDRGE3yBQrBctR9E4xqRXvB/1TRhG
         OQ47rBo5j0lRfAFRFrTN9USIyouOv8sJo2a+Js82lyx2pGzQuyQiLOy/dYhD1Y//DhWN
         MTSsc95RZEoGbhuuOdJ1typMWY2/5+Wa12ln0Hz8NuqwFl2sAgEs4siDs1atzYi4kXK7
         8dqg==
X-Gm-Message-State: APjAAAWLj3IrOE3I9fUpwPtLKTaQ7E2t90ptJlSu2pqX7Ec2dpgd6fKG
	Vwzgw2GLcpFIdVFCJmmavhQISRug
X-Google-Smtp-Source: APXvYqwo3t5ZMwLNX2xzhjoUY4QBzVLKd0wHISODXXD+VkXjxrGWw3NGG+GBNoEoUZM/W/EdSyhPTw==
X-Received: by 2002:adf:eb4e:: with SMTP id u14mr4778819wrn.168.1561573757143;
        Wed, 26 Jun 2019 11:29:17 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.2.137] (93-34-153-63.ip50.fastwebnet.it. [93.34.153.63])
        by smtp.gmail.com with ESMTPSA id e11sm40649513wrc.9.2019.06.26.11.29.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Jun 2019 11:29:16 -0700 (PDT)
Subject: Re: [PATCH v2 10/14] target/arm/kvm64: Add kvm_arch_get/put_sve
To: Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org, armbru@redhat.com,
 eblake@redhat.com, Dave.Martin@arm.com, eric.auger@redhat.com,
 imammedo@redhat.com
References: <20190621163422.6127-1-drjones@redhat.com>
 <20190621163422.6127-11-drjones@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <1e0bc93f-42e3-087f-a4b5-d356879cb806@linaro.org>
Date: Wed, 26 Jun 2019 17:22:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190621163422.6127-11-drjones@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: /4VvUh61AGK6

On 6/21/19 6:34 PM, Andrew Jones wrote:
> +/*
> + * If ARM_MAX_VQ is increased to be greater than 16, then we can no
> + * longer hard code slices to 1 in kvm_arch_put/get_sve().
> + */
> +QEMU_BUILD_BUG_ON(ARM_MAX_VQ > 16);

This seems easy to fix, or simply drop the slices entirely for now, as
otherwise they are a teeny bit confusing.

It's a shame that these slices exist at all.  It seems like the kernel could
use the negotiated max sve size to grab the data all at once.

> +        for (n = 0; n < KVM_ARM64_SVE_NUM_ZREGS; n++) {
> +            uint64_t *q = aa64_vfp_qreg(env, n);
> +#ifdef HOST_WORDS_BIGENDIAN
> +            uint64_t d[ARM_MAX_VQ * 2];
> +            int j;
> +            for (j = 0; j < cpu->sve_max_vq * 2; j++) {
> +                d[j] = bswap64(q[j]);
> +            }
> +            reg.addr = (uintptr_t)d;
> +#else
> +            reg.addr = (uintptr_t)q;
> +#endif
> +            reg.id = KVM_REG_ARM64_SVE_ZREG(n, i);
> +            ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);

It might be worth splitting this...

> +        for (n = 0; n < KVM_ARM64_SVE_NUM_PREGS; n++) {
> +            uint64_t *q = &env->vfp.pregs[n].p[0];
> +#ifdef HOST_WORDS_BIGENDIAN
> +            uint64_t d[ARM_MAX_VQ * 2 / 8];
> +            int j;
> +            for (j = 0; j < cpu->sve_max_vq * 2 / 8; j++) {
> +                d[j] = bswap64(q[j]);
> +            }
> +            reg.addr = (uintptr_t)d;
> +#else
> +            reg.addr = (uintptr_t)q;
> +#endif
> +            reg.id = KVM_REG_ARM64_SVE_PREG(n, i);
> +            ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);

... and this (unified w/ reg + size parameters?) to a function because ...

> +        reg.addr = (uintptr_t)&env->vfp.pregs[FFR_PRED_NUM].p[0];
> +        reg.id = KVM_REG_ARM64_SVE_FFR(i);
> +        ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);

... you forgot to apply the bswap here.

Likewise for the other direction.


r~


PS: It's also tempting to drop the ifdefs and, since we know the host supports
sve instructions, and that the host supports sve_max_vq, do the reformatting as

    uint64_t scratch[ARM_MAX_VQ * 2];
    asm("whilelo  p0.d, xzr, %2\n\t"
        "ld1d     z0.d, p0/z [%1]\n\t"
        "str      z0, [%0]"
        : "=Q"(scratch)
        : "Q"(*aa64_vfp_qreg(env, n)),
          "r"(cpu->sve_max_vq)
        : "p0", "v0");

PPS: Ideally, this would be further cleaned up with acle builtins, but those
are still under development for GCC.
