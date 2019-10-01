Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp7819758wrp;
        Mon, 30 Sep 2019 23:53:22 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzEL7RLTht4K5MtODaQxLmh3dB9b/NPiWCEe8hlc/bQTGR0rlvD0Kpab2d5HQqfc21ejCj+
X-Received: by 2002:a92:aa48:: with SMTP id j69mr24773927ili.231.1569912802693;
        Mon, 30 Sep 2019 23:53:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569912802; cv=none;
        d=google.com; s=arc-20160816;
        b=sIvslTZd0yUErV7T1U+yIaILX1tF4+sfYvV15pErP4G0mVMIc+HFm8rDHBm7v8a8Vh
         yS+OOgAsep+5Us+/Q7yDJmd6XlJsnG/kh9nW/s33A0PkOWlct/+SSOlMpMF05fTiPnLf
         t6S5Ztkt/b9jpdPBWkxNi0H7XMDRrw3e6wgV9C7dr21LKAivwxdxdD3ocO2Up50XH/yU
         TE/+njZBTh/86JbyhM1uY0GXAdRxvXCdPkZAiih/hK/dAWhi/2DPvW2BACVuvzczckh2
         3pr1scAhftOSzsGwDzAnas4libiPot0UX9HDrs9jH6hirwQJLjt33u8LZp8kpZ/m5Anh
         u0HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date;
        bh=A0bAGrI25zwOS7cZK5AgxKfu7GxiDBarZq75cPUOZYY=;
        b=wuF9lXVRTD+fKmHSZ+xg35JsxFn6yUQjJKXhH3r857OdcGFhWwAxIgsM5EboPeQIAK
         0qDhK5bnRLlPgthYolr7O2fixgkl8x5Mo1lNLaYQOsaXkLLssA6lgP6fGRDoPn5ADFQt
         oFVnhsdiePSzulKbxiMVKYckJ1qejTDrX0MqYK5I0HRN8wdliLcSFP3tSeesBlQyY+YL
         n8DbFbqP6XI5OeZCr2+T7mRX+fTY+r9JysdEzW5cZzLrwj6EchPobt/oriNdGRfaQOLx
         N7Nix8YQ1uzNlPFmSrb14rAUtc3+wqdRbSwladA8dA8ox5X/YPRU1wiww7C0pZy1YF5e
         Mklg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id v3si20537409iop.127.2019.09.30.23.53.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Sep 2019 23:53:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BAF2E308421A;
	Tue,  1 Oct 2019 06:53:21 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B0B4D10013D9;
	Tue,  1 Oct 2019 06:53:17 +0000 (UTC)
Date: Tue, 1 Oct 2019 08:53:15 +0200
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
	armbru@redhat.com, eric.auger@redhat.com, imammedo@redhat.com,
	alex.bennee@linaro.org, Dave.Martin@arm.com
Subject: Re: [PATCH v4 5/9] target/arm/kvm64: Add kvm_arch_get/put_sve
Message-ID: <20191001065315.mbw3xqoy7lc6dya4@kamzik.brq.redhat.com>
References: <20190924113105.19076-1-drjones@redhat.com>
 <20190924113105.19076-6-drjones@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190924113105.19076-6-drjones@redhat.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]); Tue, 01 Oct 2019 06:53:21 +0000 (UTC)
X-TUID: NKGpAM2DSYf3

On Tue, Sep 24, 2019 at 01:31:01PM +0200, Andrew Jones wrote:
> These are the SVE equivalents to kvm_arch_get/put_fpsimd. Note, the
> swabbing is different than it is for fpsmid because the vector format
> is a little-endian stream of words.
> 
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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

I see a bug here that I introduced between v2 and v3 when I switched to
DIV_ROUND_UP. I dropped the '* 2's on all of these. They should be
DIV_ROUND_UP(cpu->sve_max_vq * 2, 8). I'll fix for v5, which I'll be
posting later today.

Thanks,
drew
