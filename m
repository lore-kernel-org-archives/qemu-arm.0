Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1615002wrm;
        Wed, 9 Oct 2019 17:39:26 -0700 (PDT)
X-Received: by 2002:a25:bdd4:: with SMTP id g20mr3831343ybk.99.1570667966177;
        Wed, 09 Oct 2019 17:39:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570667966; cv=none;
        d=google.com; s=arc-20160816;
        b=dYjp8KqHyS7S4OG8CZeJzC/6Y3LzKzYGlPoCJttiOxDPhJLAMjCNIbMl6mZb0pI4Gw
         ntZac146o4N6L14AGITX9e8qMbD7SA+rJkJXdJJuDjmHc7js22Ypz2ggVQ9LOmDd7TMt
         QC40Md/yoKDEAR1vAKeqFeL8acqTRTvAGFaEac0o/If7KGDMUt3F97eSKGlPWHaEbAFk
         envI+z161pl7q1QBQL9H/WwTZadylYTDSwsbFQ3gTkw8dxr18b+ztPe8tPPFUiYpQnoR
         02GccgFQsWxnBXhrQmZYzF5DSNyhKXgjGtNgU5LFLE6HYIEM+CtLCTQqOwuYDwyUOlbJ
         MTpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=sLTnFbZCpIgGeIi6dyjb1EhS2fZO48oPmcKPcfao7eI=;
        b=iK810d6mdPi+OWPaYOuCr/keyMlaeV7/CyjLfJa3NF+zoI3+gRXea+ZfJB5eayzzHu
         XAIkEL2nNVNJJFDMw6VoTZXcriRNv3T+ED3LXXBhAPTDiq76yrqfcvobOYpErVGgFk0F
         pcWjzoL32i1NOEF8TUcs3Um53Cst1DYDBf7lckXnYnpc/rnkeTUbNivmTjJcsEs+gZ27
         bTpVTPqeE03HlsPqoZgUrhEyg1KwVA7/T3/kjpJG+IY3dSgGNU7gNX0HilhZxpbx/Mbo
         pxQovg4jMHB9BBRXHK6PhGiaFDtmrbeQjdF8GOMlJhVA9c5BDXSW+6CSOxOZ+bLGas83
         Cw2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sU6SE2P7;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id y123sor2098996yba.20.2019.10.09.17.39.26
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 09 Oct 2019 17:39:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sU6SE2P7;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=sLTnFbZCpIgGeIi6dyjb1EhS2fZO48oPmcKPcfao7eI=;
        b=sU6SE2P7zgK3Wvw8zxSi7B2uTnDH2ntWHdJgqJ1dsOZ7OjlntOxDPkR5DPoRM5QaLz
         ZPQgsiyM0cQjw6cXWGl12PMxLa/YL4pfhIxVRwGU5R6CtU+iW9pXH7PWVKBvG4IXEYTk
         nKC2sUV7ldvYr8r7SbLpiTZL1HwRkx8iyiwUIAmbG3sCMFQ+yHHN88mZUDm59fWbqkX8
         aOPW96tBtrfDat0ZuHPry57KRnFWsfitAvI3h8Qb9qG0a6+GF0J+e2SMO4KKXfmex4q9
         K28SLN4dtJo2ed+Po6ktszy91ae1dGmmd5CL/JGfz8fT6UJRK/kbmaisC38jVcdrymi5
         s3jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=sLTnFbZCpIgGeIi6dyjb1EhS2fZO48oPmcKPcfao7eI=;
        b=hox6zLpSmX35xrK0yYxzxvyZLJ2KV9khJv3zhiGSVFj8HIv6GDFXR/IO/aS4qGYUny
         pWiz12dpKdJ1R6huEohgQ5KGQb7NzusZclT+wAhwGPVaA2Xyh44/RKnEXugh5RfKcrM2
         69DJ33Yv2K/m1kEI5DPV0AjE7daBt0tltQsQxfNu886fAO/fSc7doAFMNcHCK8TRH6Le
         BIoGbId6xKSsPyvX4O7nxYoyHb1fosyZs2zEypnTciSY3G5onXuUe36MbQzuUFPlEIo/
         +dS1tNTo1jfyHtLoPVMoKyDTUDlfC94S5ta00z7h0j6yzYJNa7kmouclwquvE08c4/nM
         Fi8w==
X-Gm-Message-State: APjAAAUDDD+FvDA2Ym5hmN4gb0vgEjuOhp/+cX7PqKM7bqC71cRl0Ypy
	r5Fl+mwV1Yhtvrlaz58YFs87TtNI
X-Google-Smtp-Source: APXvYqxv9d4o6zmHoNFiW9D+nqKY58x2Aiq5BWQ9DuXf4AzCbJDygKbh+UJLLshBQmzUMVSsR9QYkg==
X-Received: by 2002:a25:5542:: with SMTP id j63mr4123772ybb.76.1570667965549;
        Wed, 09 Oct 2019 17:39:25 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.44] (67.216.151.25.pool.hargray.net. [67.216.151.25])
        by smtp.gmail.com with ESMTPSA id 137sm993566ywp.64.2019.10.09.17.39.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 09 Oct 2019 17:39:24 -0700 (PDT)
Subject: Re: [PATCH v2] target/arm/arch_dump: Add SVE notes
To: Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org, Dave.Martin@arm.com,
 eric.auger@redhat.com
References: <20191004120313.5347-1-drjones@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <f23153f2-35be-f74d-ad7b-d9c324cba1cf@linaro.org>
Date: Wed, 9 Oct 2019 20:39:21 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191004120313.5347-1-drjones@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: 2JK71GC0dGYk

On 10/4/19 8:03 AM, Andrew Jones wrote:
> +#ifdef TARGET_AARCH64
> +static off_t sve_zreg_offset(uint32_t vq, int n)
> +{
> +    off_t off = sizeof(struct aarch64_user_sve_header);
> +    return ROUND_UP(off, 16) + vq * 16 * n;
> +}
> +static off_t sve_preg_offset(uint32_t vq, int n)
> +{
> +    return sve_zreg_offset(vq, 32) + vq * 16 / 8 * n;
> +}
> +static off_t sve_fpsr_offset(uint32_t vq)
> +{
> +    off_t off = sve_preg_offset(vq, 17) + offsetof(struct aarch64_note, sve);
> +    return ROUND_UP(off, 16) - offsetof(struct aarch64_note, sve);
> +}
> +static off_t sve_fpcr_offset(uint32_t vq)
> +{
> +    return sve_fpsr_offset(vq) + sizeof(uint32_t);
> +}
> +static uint32_t sve_current_vq(CPUARMState *env)
> +{
> +    return sve_zcr_len_for_el(env, arm_current_el(env)) + 1;
> +}
> +static size_t sve_size_vq(uint32_t vq)
> +{
> +    off_t off = sve_fpcr_offset(vq) + sizeof(uint32_t) +
> +                offsetof(struct aarch64_note, sve);
> +    return ROUND_UP(off, 16) - offsetof(struct aarch64_note, sve);
> +}
> +static size_t sve_size(CPUARMState *env)
> +{
> +    return sve_size_vq(sve_current_vq(env));
> +}

Watch the missing spaces between functions.

> +    for (i = 0; i < 32; ++i) {
> +#ifdef HOST_WORDS_BIGENDIAN
> +        uint64_t d[vq * 2];
> +        int j;
> +
> +        for (j = 0; j < vq * 2; ++j) {
> +            d[j] = bswap64(env->vfp.zregs[i].d[j]);
> +        }
> +#else
> +        uint64_t *d = &env->vfp.zregs[i].d[0];
> +#endif
> +        memcpy(&buf[sve_zreg_offset(vq, i)], &d[0], vq * 16);
> +    }

We should avoid the variable sized array here.

It might be best to avoid the ifdef altogether:

    for (i = 0; i < 32; ++i) {
        uint64_t *d = (uint64_t *)&buf[sve_zreg_offset(vq, i)];
        for (j = 0; j < vq * 2; ++j) {
            d[j] = cpu_to_le64(env->vfp.zregs[i].d[j]);
        }
    }

The compiler may well transform the inner loop to memcpy for little-endian
host, but even if it doesn't core dumping is hardly performance sensitive.



r~
