Received: by 2002:a17:90a:1a54:0:0:0:0 with SMTP id 20csp761407pjl;
        Wed, 25 Sep 2019 06:58:17 -0700 (PDT)
X-Google-Smtp-Source: APXvYqySs0HbdzJI4Xi+Wx/4fAPZaBkbDUYVTaxJZBJ6dNljP80vXWfTJjN5seomvjvRdSWT2ehk
X-Received: by 2002:a02:ba17:: with SMTP id z23mr5370577jan.24.1569419897327;
        Wed, 25 Sep 2019 06:58:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569419897; cv=none;
        d=google.com; s=arc-20160816;
        b=tsX+meNYnMWPB+3DBxcjlK1f6HtzKOgrg1MIsIKgT+4OE1JYvb5jQ9QaYkep4t5KYo
         ZbLS1dORdoRvk2wEm9HdK7elXBdmlnaHRaCMZwZGyPDijS6XK4AdRvIG996vbIhU3k20
         CekkoZnZ1+F+MJ/Z01yjBsC53AivR7os6edsdXs7LOWXUq6/31tXmC/BGeC3d4XpkWCQ
         Q7hpHF9D5PxJj7HwRFIkCNIjKDKx8e9DA0XiGLW8SeQp8uZE3JZO+m0kUHs4SkTyAkVw
         F5RaJdy1IRvRqmUxjwXU8ijj7QKe/5/AcA7Cpt514mipmPcCZXKaYuNnwhZG1sddfdW9
         TXJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=uFirFuD2XoL3Dy/ciLGJB5FDhLRMbw3s3gK/7RVA600=;
        b=0drUlrb7aUzDxp+FKvcM1fwuLZucfFjtrgPtKDt0xuL6BrfSKeRDeC7hH8nTyHRv2v
         u3fp2N4KGOyo4GfSkej5cAh+Q3kxaflr5cdsxYh2beDQOLwymXEoPDQ67qbiZ1vlcNHh
         RMf7teWzq1pAHlKzOukdf4umvvULGcE0f34ufUyp8Myumv4K990fs8ehNYkAq8jHIit6
         1tGtHcxTh5DJKMYq/Ku3PtfRz10prWIRJ0NaWfux2xrGbyfcXpWKGTyA8TTbgtb2KEiS
         UUf4r1FLqO3W2VJjbKW6NPgQ3+rAQpwHVDZLBnqyCcqkofQQNGbj+pWjb7fVr9s7dmc+
         19Aw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id c24si6893122iom.50.2019.09.25.06.58.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Sep 2019 06:58:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6DC738980FE;
	Wed, 25 Sep 2019 13:58:16 +0000 (UTC)
Received: from [10.36.117.64] (ovpn-117-64.ams2.redhat.com [10.36.117.64])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C6EEC19C7F;
	Wed, 25 Sep 2019 13:58:13 +0000 (UTC)
Subject: Re: [PATCH v4 5/9] target/arm/kvm64: Add kvm_arch_get/put_sve
To: Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 alex.bennee@linaro.org, armbru@redhat.com, eblake@redhat.com,
 Dave.Martin@arm.com, imammedo@redhat.com
References: <20190924113105.19076-1-drjones@redhat.com>
 <20190924113105.19076-6-drjones@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <fc9ad988-d909-de1f-b29d-5d6a239f5da3@redhat.com>
Date: Wed, 25 Sep 2019 15:58:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190924113105.19076-6-drjones@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.67]); Wed, 25 Sep 2019 13:58:16 +0000 (UTC)
X-TUID: CoENCJuyjzdp

Hi Drew,

On 9/24/19 1:31 PM, Andrew Jones wrote:
> These are the SVE equivalents to kvm_arch_get/put_fpsimd. Note, the
> swabbing is different than it is for fpsmid because the vector format
> is a little-endian stream of words.
> 
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  target/arm/kvm64.c | 137 +++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 133 insertions(+), 4 deletions(-)
> 
> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> index 28f6db57d5ee..ea454c613919 100644
> --- a/target/arm/kvm64.c
> +++ b/target/arm/kvm64.c
> @@ -671,11 +671,12 @@ int kvm_arch_destroy_vcpu(CPUState *cs)
>  bool kvm_arm_reg_syncs_via_cpreg_list(uint64_t regidx)
>  {
>      /* Return true if the regidx is a register we should synchronize
> -     * via the cpreg_tuples array (ie is not a core reg we sync by
> -     * hand in kvm_arch_get/put_registers())
> +     * via the cpreg_tuples array (ie is not a core or sve reg that
> +     * we sync by hand in kvm_arch_get/put_registers())
>       */
>      switch (regidx & KVM_REG_ARM_COPROC_MASK) {
>      case KVM_REG_ARM_CORE:
> +    case KVM_REG_ARM64_SVE:
>          return false;
>      default:
>          return true;
> @@ -761,6 +762,78 @@ static int kvm_arch_put_fpsimd(CPUState *cs)
>      return 0;
>  }
>  
> +/*
> + * SVE registers are encoded in KVM's memory in an endianness-invariant format.
> + * The byte at offset i from the start of the in-memory representation contains
> + * the bits [(7 + 8 * i) : (8 * i)] of the register value. As this means the
> + * lowest offsets are stored in the lowest memory addresses, then that nearly
> + * matches QEMU's representation, which is to use an array of host-endian
> + * uint64_t's, where the lower offsets are at the lower indices. To complete
> + * the translation we just need to byte swap the uint64_t's on big-endian hosts.
> + */
> +static uint64_t *sve_bswap64(uint64_t *dst, uint64_t *src, int nr)
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
> +/*
> + * KVM SVE registers come in slices where ZREGs have a slice size of 2048 bits
> + * and PREGS and the FFR have a slice size of 256 bits. However we simply hard
> + * code the slice index to zero for now as it's unlikely we'll need more than
> + * one slice for quite some time.
> + */
> +static int kvm_arch_put_sve(CPUState *cs)
> +{
> +    ARMCPU *cpu = ARM_CPU(cs);
> +    CPUARMState *env = &cpu->env;
> +    uint64_t tmp[ARM_MAX_VQ * 2];
> +    uint64_t *r;
> +    struct kvm_one_reg reg;
> +    int n, ret;
> +
> +    for (n = 0; n < KVM_ARM64_SVE_NUM_ZREGS; ++n) {
> +        r = sve_bswap64(tmp, &env->vfp.zregs[n].d[0], cpu->sve_max_vq * 2);
> +        reg.addr = (uintptr_t)r;
> +        reg.id = KVM_REG_ARM64_SVE_ZREG(n, 0);
> +        ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
> +        if (ret) {
> +            return ret;
> +        }
> +    }
> +
> +    for (n = 0; n < KVM_ARM64_SVE_NUM_PREGS; ++n) {
> +        r = sve_bswap64(tmp, r = &env->vfp.pregs[n].p[0],
> +                        DIV_ROUND_UP(cpu->sve_max_vq, 8));
> +        reg.addr = (uintptr_t)r;
> +        reg.id = KVM_REG_ARM64_SVE_PREG(n, 0);
> +        ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
> +        if (ret) {
> +            return ret;
> +        }
> +    }
> +
> +    r = sve_bswap64(tmp, &env->vfp.pregs[FFR_PRED_NUM].p[0],
> +                    DIV_ROUND_UP(cpu->sve_max_vq, 8));
> +    reg.addr = (uintptr_t)r;
> +    reg.id = KVM_REG_ARM64_SVE_FFR(0);
> +    ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
> +    if (ret) {
> +        return ret;
> +    }
> +
> +    return 0;
> +}
> +
>  int kvm_arch_put_registers(CPUState *cs, int level)
>  {
>      struct kvm_one_reg reg;
> @@ -855,7 +928,11 @@ int kvm_arch_put_registers(CPUState *cs, int level)
>          }
>      }
>  
> -    ret = kvm_arch_put_fpsimd(cs);
> +    if (cpu_isar_feature(aa64_sve, cpu)) {
> +        ret = kvm_arch_put_sve(cs);
> +    } else {
> +        ret = kvm_arch_put_fpsimd(cs);
> +    }
>      if (ret) {
>          return ret;
>      }
> @@ -918,6 +995,54 @@ static int kvm_arch_get_fpsimd(CPUState *cs)
>      return 0;
>  }
>  
> +/*
> + * KVM SVE registers come in slices where ZREGs have a slice size of 2048 bits
> + * and PREGS and the FFR have a slice size of 256 bits. However we simply hard
> + * code the slice index to zero for now as it's unlikely we'll need more than
> + * one slice for quite some time.
> + */
> +static int kvm_arch_get_sve(CPUState *cs)
> +{
> +    ARMCPU *cpu = ARM_CPU(cs);
> +    CPUARMState *env = &cpu->env;
> +    struct kvm_one_reg reg;
> +    uint64_t *r;
> +    int n, ret;
> +
> +    for (n = 0; n < KVM_ARM64_SVE_NUM_ZREGS; ++n) {
> +        r = &env->vfp.zregs[n].d[0];
> +        reg.addr = (uintptr_t)r;
> +        reg.id = KVM_REG_ARM64_SVE_ZREG(n, 0);
> +        ret = kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &reg);
> +        if (ret) {
> +            return ret;
> +        }
> +        sve_bswap64(r, r, cpu->sve_max_vq * 2);
> +    }
> +
> +    for (n = 0; n < KVM_ARM64_SVE_NUM_PREGS; ++n) {
> +        r = &env->vfp.pregs[n].p[0];
> +        reg.addr = (uintptr_t)r;
> +        reg.id = KVM_REG_ARM64_SVE_PREG(n, 0);
> +        ret = kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &reg);
> +        if (ret) {
> +            return ret;
> +        }
> +        sve_bswap64(r, r, DIV_ROUND_UP(cpu->sve_max_vq, 8));
> +    }
> +
> +    r = &env->vfp.pregs[FFR_PRED_NUM].p[0];
> +    reg.addr = (uintptr_t)r;
> +    reg.id = KVM_REG_ARM64_SVE_FFR(0);
> +    ret = kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &reg);
> +    if (ret) {
> +        return ret;
> +    }
> +    sve_bswap64(r, r, DIV_ROUND_UP(cpu->sve_max_vq, 8));
> +
> +    return 0;
> +}
> +
>  int kvm_arch_get_registers(CPUState *cs)
>  {
>      struct kvm_one_reg reg;
> @@ -1012,7 +1137,11 @@ int kvm_arch_get_registers(CPUState *cs)
>          env->spsr = env->banked_spsr[i];
>      }
>  
> -    ret = kvm_arch_get_fpsimd(cs);
> +    if (cpu_isar_feature(aa64_sve, cpu)) {
> +        ret = kvm_arch_get_sve(cs);
> +    } else {
> +        ret = kvm_arch_get_fpsimd(cs);
> +    }
>      if (ret) {
>          return ret;
>      }
> 
