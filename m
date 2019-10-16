Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp7316310wrm;
        Wed, 16 Oct 2019 08:39:54 -0700 (PDT)
X-Received: by 2002:a17:902:6e17:: with SMTP id u23mr38470742plk.209.1571240394527;
        Wed, 16 Oct 2019 08:39:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571240394; cv=none;
        d=google.com; s=arc-20160816;
        b=z/IDZ/L9XAOl0dUPyHojsY9N81A0SHqaWFpCgyEUlzwdXpkH1ZBl/mxpaErGBJvm6D
         /poSHfCBlSoxAFT3H2T7gbWQCYhTK894e5veSaSt+tTUz1c3V5i/Z5LHLeuund4z+xjr
         ZpAatosYOyc8r3X+B5qiSeL1iuLUjyxagwBQDjzCNUB6t5qWbacGjEA2RDoVa6QOSGmG
         kMUCcUhqNgWUZGAljzM3PklHeKOo6e6iUMMhC2xE99bp1P18p8s6q03Z8d+6/GAvk1qg
         6WBS1bpX7jmWoeQfKXLwFIVF9xfpwjYn0qKni+O3znQgrqrvRvOgXX1Lp2ubIE0Wvs16
         ly2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=6YQ153NOOjUMl+pO/gDPGLBVsCywgtV0r9bpuBebW4Q=;
        b=ti8gdcZediUG0xslLtkUn8JrofnZwitcd5rBC/tq5CBnL7Rt4Zlzag28WfNGF22IzG
         7GMiBhgY7BwtHbkyIAFKrNGHcsEaSvF0skFtnGBQkJnqm4yFhmbqIunTclZCeVS0Ra3K
         OxDmHdqieoXqLy7WlzND+9L0d2V40rkzVKtOJZuhS4izzlDY0UEsdTp63vdTrmxvaRBp
         SEWFpTUzIB+h+YqVFcO5gzQtl8NhytaCqik9/d3nrOhlZiAaypWNqJDEo1QpB2k9Hmze
         SIqHfge/hNgbLY2MG078FxnSaUOYITqOIuvnGgm+3ekbxUxGhi3PzKyymxQBq6ekGLUr
         ySRw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MR+EhkwX;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id 25sor24793900pgo.19.2019.10.16.08.39.54
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 16 Oct 2019 08:39:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MR+EhkwX;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=6YQ153NOOjUMl+pO/gDPGLBVsCywgtV0r9bpuBebW4Q=;
        b=MR+EhkwXXfX63TmC7yls0Q9us9u7s2EeGHgdQJJDwsRBGvsspcSVkE/YCtry0R2huq
         GVydMEqm/f5CBdaZhqhhHzY3qZhw4Po44u2orqcGo4JJLxsulk5O2OIo5xO/UIjL5mXx
         HmEhG9tO5Tm5veriH9UCh/zDbZBKmZwOlWQHSLVl96F8V5NYq6abUGsL3Ow4m36UU2oo
         D1gD4eAkyjTEDK12FekalYkgebzYvhHfoVII3Rq6sXk7TRzC215GFOBzRoPbc19QVS9L
         5D/iasJPMLPbJMpZreu6DKM9Gd8bfAF/N/MHDDDjWq3BOC5RaS6h5/NxznWM6+ZVK5Vv
         kXGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6YQ153NOOjUMl+pO/gDPGLBVsCywgtV0r9bpuBebW4Q=;
        b=nmGWvSqeBakSzKS4Y5selXT2/dMfm1sVMfWBKvb14N9lvutfbmHzVKzwVKzdqdNFaC
         NlDi2jIwfxgjdHy5dL3KtfqV6f4RqA2YOgGK9Q0KpDDKMi7E6yZDrPA+/DU9hKvGacdD
         bHW0T0ZGa+Y1Xr18c6XqSIwuxSN8CjU6KJHSUtGNiMxqcYsn2KqRtHE3Nep+gZs9xehO
         6l2k+aeAJqNKjkenIxDVJvV3sbwBG05QmIB7US2QhdUforbFU5Ir7S7En88I/CSnLfic
         Fl1Mg8N0WdGLpH2UwSG2Mg6fpGr2E1e0Bxy0jC7UZiJBC8CrltamvIWba7A2lFk5rAoC
         2C2A==
X-Gm-Message-State: APjAAAV6muti2METEdoLtRnoCuySnkdl5UHa2ShyqGFZqYlFuGD+VAhw
	CXKCjT3cspS/mgtak7u+6zmPY29u
X-Google-Smtp-Source: APXvYqx0V/r2P4EjH/htlrY4j8iCWKpIve6Y1Q3VxHoEdjQsM16Kc0TlKSFLMgV1GRLrpaAu83d+Dg==
X-Received: by 2002:a65:500c:: with SMTP id f12mr15798271pgo.233.1571240393813;
        Wed, 16 Oct 2019 08:39:53 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id 2sm30815025pfa.43.2019.10.16.08.39.52
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Oct 2019 08:39:53 -0700 (PDT)
Subject: Re: [PATCH v2] target/arm/arch_dump: Add SVE notes
To: Andrew Jones <drjones@redhat.com>
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, eric.auger@redhat.com,
 qemu-arm@nongnu.org, alex.bennee@linaro.org, Dave.Martin@arm.com
References: <20191004120313.5347-1-drjones@redhat.com>
 <f23153f2-35be-f74d-ad7b-d9c324cba1cf@linaro.org>
 <20191010061600.pwhos4huazbsv6kn@kamzik.brq.redhat.com>
 <6451070f-9488-cc8f-2f4b-a7577e11f447@linaro.org>
 <20191016091314.cu76t3ovwofsfart@kamzik.brq.redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <f517a663-45ad-0ec0-785f-7540fc99acb5@linaro.org>
Date: Wed, 16 Oct 2019 08:39:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191016091314.cu76t3ovwofsfart@kamzik.brq.redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: 2byHTroLNKuH

On 10/16/19 2:13 AM, Andrew Jones wrote:
> On Thu, Oct 10, 2019 at 01:33:02PM -0400, Richard Henderson wrote:
>> Ah, I wonder if you changed things around with the ifdefs due to the pregs.
>> There's no trivial solution for those.  It'd be nice to share the bswapping
>> subroutine that you add in the SVE KVM patch set, and size the temporary array
>> using ARM_MAX_VQ.
> 
> How about something like this squashed in?

Looks good.


r~


> 
> Thanks,
> drew
> 
> diff --git a/target/arm/arch_dump.c b/target/arm/arch_dump.c
> index b02e398430b9..7c7fd23f4d94 100644
> --- a/target/arm/arch_dump.c
> +++ b/target/arm/arch_dump.c
> @@ -182,6 +182,7 @@ static int aarch64_write_elf64_sve(WriteCoreDumpFunction f,
>      struct aarch64_note *note;
>      ARMCPU *cpu = env_archcpu(env);
>      uint32_t vq = sve_current_vq(env);
> +    uint64_t tmp[ARM_MAX_VQ * 2], *r;
>      uint32_t fpr;
>      uint8_t *buf;
>      int ret, i;
> @@ -198,31 +199,14 @@ static int aarch64_write_elf64_sve(WriteCoreDumpFunction f,
>      note->sve.flags = cpu_to_dump16(s, 1);
>  
>      for (i = 0; i < 32; ++i) {
> -#ifdef HOST_WORDS_BIGENDIAN
> -        uint64_t d[vq * 2];
> -        int j;
> -
> -        for (j = 0; j < vq * 2; ++j) {
> -            d[j] = bswap64(env->vfp.zregs[i].d[j]);
> -        }
> -#else
> -        uint64_t *d = &env->vfp.zregs[i].d[0];
> -#endif
> -        memcpy(&buf[sve_zreg_offset(vq, i)], &d[0], vq * 16);
> +        r = sve_bswap64(tmp, &env->vfp.zregs[i].d[0], vq * 2);
> +        memcpy(&buf[sve_zreg_offset(vq, i)], r, vq * 16);
>      }
>  
>      for (i = 0; i < 17; ++i) {
> -#ifdef HOST_WORDS_BIGENDIAN
> -        uint64_t d[DIV_ROUND_UP(vq * 2, 8)];
> -        int j;
> -
> -        for (j = 0; j < DIV_ROUND_UP(vq * 2, 8); ++j) {
> -            d[j] = bswap64(env->vfp.pregs[i].p[j]);
> -        }
> -#else
> -        uint64_t *d = &env->vfp.pregs[i].p[0];
> -#endif
> -        memcpy(&buf[sve_preg_offset(vq, i)], &d[0], vq * 16 / 8);
> +        r = sve_bswap64(tmp, r = &env->vfp.pregs[i].p[0],
> +                        DIV_ROUND_UP(vq * 2, 8));
> +        memcpy(&buf[sve_preg_offset(vq, i)], r, vq * 16 / 8);
>      }
>  
>      fpr = cpu_to_dump32(s, vfp_get_fpsr(env));
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 5b9c3e4cd73d..b3092e5213e6 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -975,6 +975,31 @@ void aarch64_sve_narrow_vq(CPUARMState *env, unsigned vq);
>  void aarch64_sve_change_el(CPUARMState *env, int old_el,
>                             int new_el, bool el0_a64);
>  void aarch64_add_sve_properties(Object *obj);
> +
> +/*
> + * SVE registers are encoded in KVM's memory in an endianness-invariant format.
> + * The byte at offset i from the start of the in-memory representation contains
> + * the bits [(7 + 8 * i) : (8 * i)] of the register value. As this means the
> + * lowest offsets are stored in the lowest memory addresses, then that nearly
> + * matches QEMU's representation, which is to use an array of host-endian
> + * uint64_t's, where the lower offsets are at the lower indices. To complete
> + * the translation we just need to byte swap the uint64_t's on big-endian hosts.
> + */
> +static inline uint64_t *sve_bswap64(uint64_t *dst, uint64_t *src, int nr)
> +{
> +#ifdef HOST_WORDS_BIGENDIAN
> +    int i;
> +
> +    for (i = 0; i < nr; ++i) {
> +        dst[i] = bswap64(src[i]);
> +    }
> +
> +    return dst;
> +#else
> +    return src;
> +#endif
> +}
> +
>  #else
>  static inline void aarch64_sve_narrow_vq(CPUARMState *env, unsigned vq) { }
>  static inline void aarch64_sve_change_el(CPUARMState *env, int o,
> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> index 876184b8fe4d..e2da756e65ed 100644
> --- a/target/arm/kvm64.c
> +++ b/target/arm/kvm64.c
> @@ -876,30 +876,6 @@ static int kvm_arch_put_fpsimd(CPUState *cs)
>      return 0;
>  }
>  
> -/*
> - * SVE registers are encoded in KVM's memory in an endianness-invariant format.
> - * The byte at offset i from the start of the in-memory representation contains
> - * the bits [(7 + 8 * i) : (8 * i)] of the register value. As this means the
> - * lowest offsets are stored in the lowest memory addresses, then that nearly
> - * matches QEMU's representation, which is to use an array of host-endian
> - * uint64_t's, where the lower offsets are at the lower indices. To complete
> - * the translation we just need to byte swap the uint64_t's on big-endian hosts.
> - */
> -static uint64_t *sve_bswap64(uint64_t *dst, uint64_t *src, int nr)
> -{
> -#ifdef HOST_WORDS_BIGENDIAN
> -    int i;
> -
> -    for (i = 0; i < nr; ++i) {
> -        dst[i] = bswap64(src[i]);
> -    }
> -
> -    return dst;
> -#else
> -    return src;
> -#endif
> -}
> -
>  /*
>   * KVM SVE registers come in slices where ZREGs have a slice size of 2048 bits
>   * and PREGS and the FFR have a slice size of 256 bits. However we simply hard
> 
