Received: by 2002:a17:906:b78f:b0:98d:b2f5:1316 with SMTP id dt15csp1577111ejb;
        Sun, 23 Jul 2023 19:27:04 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHd9a4JJ5Tji0R5ZISuaamqFVj0gLfmGuj0l+dQ4kdXIrdul4uLU9FqnPDQnzQqKxIvumTP
X-Received: by 2002:a05:622a:170c:b0:403:fcd9:963 with SMTP id h12-20020a05622a170c00b00403fcd90963mr8446386qtk.67.1690165624016;
        Sun, 23 Jul 2023 19:27:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690165624; cv=none;
        d=google.com; s=arc-20160816;
        b=zpXgpr1BQxTaxG8UQsqRQyz5cVfvQyV+UNt7/3CuXbjpcWHpWL/+Vo3hJbWbVZoEyA
         96C6+CQAcBi5hv1qCnbuIITrxX/BlQS/TkOAu/8qCTqyZKcml+XCCgwyxYM1Te2SMdU5
         l35SCSTVmYq1MilBc4Z8I6cy8/V9dncdYZl/A4w3UCJdRMnSdRwPNxmKs4Z2+p4v5PLH
         ANrCgZkBCiDO69Q/iDMc5l16Sh86W8MDuTNn8i819FJXPWuWMab8mLCVbMGFj9Hs7e3S
         fGwxRDa9kkwSSEFoJsOczpuFMWv/chnQd3qJI+BaONR7ViwmT4AX5X47nM/hrJBgZN16
         Ay8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=vr63vJsetUCTOqbqYx8iyEflgHvCtl53gxJoykotGzo=;
        fh=bhKRZPTQegM9ngYzHPCNUPwAe0pzdMQzbQuG7bFjfgA=;
        b=zT3bSWiYVGxYqW+2deof8ryr2wmqWt4Ijtgs2CJah1b+YAREm1iAwK/LsYE58+RXcV
         L0jliZUCdfGGBj4Uzo+ZSemtVL/v3AwQeozm+gOF5EXum8VFmLREmNqHL43DvBwgfJ6O
         gxychTQKC6iFFDPEpn6d88dHK4vYx/kXsHc/UGJ2dPwidgPboi7k6MOCmaqE7GvAWYDC
         bjkZdKFW2YeZnem+THi27Ofs7BL1AXadmGie1KHxKjNNuLnSHZCqRM/t4f89n6hwiq9k
         be14Cma8HmFiWO/HLgkwGAt6JZY/C1M9Vous7t/oapusZdcokxAArteWmAUc96NriEXL
         b/kA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ew+oogRh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p16-20020a05622a13d000b00401875aea68si4644212qtk.568.2023.07.23.19.27.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 23 Jul 2023 19:27:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ew+oogRh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qNlHS-0005S9-I2; Sun, 23 Jul 2023 22:26:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qNlHR-0005Rt-5J
 for qemu-arm@nongnu.org; Sun, 23 Jul 2023 22:26:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qNlHN-0002Na-1l
 for qemu-arm@nongnu.org; Sun, 23 Jul 2023 22:26:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690165591;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vr63vJsetUCTOqbqYx8iyEflgHvCtl53gxJoykotGzo=;
 b=ew+oogRhE8imllg3ZRsSUiRV74hSIyVYCUgo7BpBuA3ebaDd9eYHaMQEksqyx45GGCWIvj
 5EK+DUJFAx8+AOYvsJvzWQFGEE5Wuhl7W1ixGB/mpzcw6yjy1Sfza0FaCZtJYXwimYytoz
 6UWDVrHH/xRs77OkN/Amcvgftu7QkaU=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-473-S9sC8ifvNY2HbMCqWncT_A-1; Sun, 23 Jul 2023 22:26:26 -0400
X-MC-Unique: S9sC8ifvNY2HbMCqWncT_A-1
Received: by mail-oo1-f71.google.com with SMTP id
 006d021491bc7-565c44558b0so6968391eaf.0
 for <qemu-arm@nongnu.org>; Sun, 23 Jul 2023 19:26:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690165586; x=1690770386;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vr63vJsetUCTOqbqYx8iyEflgHvCtl53gxJoykotGzo=;
 b=mCDo/BHmt9UQgCqiikAN1K2qCd+V2XHWamZ74lEciKHuBchekFAJewUT5F1mTglck7
 qr1uP0nKWAPSWrH1To2bTMqIcRFGYbuy4UN6NCaotCNajmFNinC7wY4VWd8311oPFudR
 AB1R7Bf8dFxZX5GhWke/IDwZ63qRwmXIq7wz/YU0ihZqH9FR8j+uypZLyD82KbjyOHmz
 VVhGyFLPAgpYhaa5HDeO7H6KfKv14qsBlqAZqhM8VLDrGFfg/WE6x/qKhd+Ix7YULqqw
 kg3HSlGJ/XbCTbrgNDsysKj7McRonXRc2qRJlCxLPQgD2g/v9JqiNmqOcBE8A11jsbU0
 BRHw==
X-Gm-Message-State: ABy/qLaHpXZyNHHc/8tXe1VU3qda8ahsxsarguEzq/m6x0SZHawTlDXT
 c7Q4XvL3y5OdkLVxUvkHEG4r1WNmrtuqejPxiRui5CV2SFNdxXETyXlzUqWlUshxbzDvmEf0Don
 +iDJmjxt6ulhJ
X-Received: by 2002:a05:6358:4285:b0:135:afe6:4f83 with SMTP id
 s5-20020a056358428500b00135afe64f83mr2526977rwc.29.1690165586093; 
 Sun, 23 Jul 2023 19:26:26 -0700 (PDT)
X-Received: by 2002:a05:6358:4285:b0:135:afe6:4f83 with SMTP id
 s5-20020a056358428500b00135afe64f83mr2526957rwc.29.1690165585704; 
 Sun, 23 Jul 2023 19:26:25 -0700 (PDT)
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5?
 ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
 by smtp.gmail.com with ESMTPSA id
 p9-20020a639509000000b005633941a547sm7213949pgd.27.2023.07.23.19.26.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Jul 2023 19:26:25 -0700 (PDT)
Message-ID: <a5b93992-5576-04cf-3af0-2c237831f5c6@redhat.com>
Date: Mon, 24 Jul 2023 12:26:20 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH for-8.2 1/2] arm/kvm: convert to kvm_set_one_reg
To: Cornelia Huck <cohuck@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org
References: <20230718111404.23479-1-cohuck@redhat.com>
 <20230718111404.23479-2-cohuck@redhat.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20230718111404.23479-2-cohuck@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.093, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: MCq4Sp2Me1x6

Hi Connie,

On 7/18/23 21:14, Cornelia Huck wrote:
> We can neaten the code by switching to the kvm_set_one_reg function.
> 
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>   target/arm/kvm.c   | 13 +++------
>   target/arm/kvm64.c | 66 +++++++++++++---------------------------------
>   2 files changed, 21 insertions(+), 58 deletions(-)
> 

Some wrong replacements to be fixed in kvm_arch_put_fpsimd() as below.
Apart from that, LGTM:

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index b4c7654f4980..cdbffc3c6e0d 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -561,7 +561,6 @@ bool write_list_to_kvmstate(ARMCPU *cpu, int level)
>       bool ok = true;
>   
>       for (i = 0; i < cpu->cpreg_array_len; i++) {
> -        struct kvm_one_reg r;
>           uint64_t regidx = cpu->cpreg_indexes[i];
>           uint32_t v32;
>           int ret;
> @@ -570,19 +569,17 @@ bool write_list_to_kvmstate(ARMCPU *cpu, int level)
>               continue;
>           }
>   
> -        r.id = regidx;
>           switch (regidx & KVM_REG_SIZE_MASK) {
>           case KVM_REG_SIZE_U32:
>               v32 = cpu->cpreg_values[i];
> -            r.addr = (uintptr_t)&v32;
> +            ret = kvm_set_one_reg(cs, regidx, &v32);
>               break;
>           case KVM_REG_SIZE_U64:
> -            r.addr = (uintptr_t)(cpu->cpreg_values + i);
> +            ret = kvm_set_one_reg(cs, regidx, cpu->cpreg_values + i);
>               break;
>           default:
>               g_assert_not_reached();
>           }
> -        ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &r);
>           if (ret) {
>               /* We might fail for "unknown register" and also for
>                * "you tried to set a register which is constant with
> @@ -703,17 +700,13 @@ void kvm_arm_get_virtual_time(CPUState *cs)
>   void kvm_arm_put_virtual_time(CPUState *cs)
>   {
>       ARMCPU *cpu = ARM_CPU(cs);
> -    struct kvm_one_reg reg = {
> -        .id = KVM_REG_ARM_TIMER_CNT,
> -        .addr = (uintptr_t)&cpu->kvm_vtime,
> -    };
>       int ret;
>   
>       if (!cpu->kvm_vtime_dirty) {
>           return;
>       }
>   
> -    ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
> +    ret = kvm_set_one_reg(cs, KVM_REG_ARM_TIMER_CNT, &cpu->kvm_vtime);
>       if (ret) {
>           error_report("Failed to set KVM_REG_ARM_TIMER_CNT");
>           abort();
> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> index 94bbd9661fd3..b4d02dff5381 100644
> --- a/target/arm/kvm64.c
> +++ b/target/arm/kvm64.c
> @@ -540,14 +540,10 @@ static int kvm_arm_sve_set_vls(CPUState *cs)
>   {
>       ARMCPU *cpu = ARM_CPU(cs);
>       uint64_t vls[KVM_ARM64_SVE_VLS_WORDS] = { cpu->sve_vq.map };
> -    struct kvm_one_reg reg = {
> -        .id = KVM_REG_ARM64_SVE_VLS,
> -        .addr = (uint64_t)&vls[0],
> -    };
>   
>       assert(cpu->sve_max_vq <= KVM_ARM64_SVE_VQ_MAX);
>   
> -    return kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
> +    return kvm_set_one_reg(cs, KVM_REG_ARM64_SVE_VLS, &vls[0]);
>   }
>   
>   #define ARM_CPU_ID_MPIDR       3, 0, 0, 0, 5
> @@ -725,19 +721,17 @@ static void kvm_inject_arm_sea(CPUState *c)
>   static int kvm_arch_put_fpsimd(CPUState *cs)
>   {
>       CPUARMState *env = &ARM_CPU(cs)->env;
> -    struct kvm_one_reg reg;
>       int i, ret;
>   
>       for (i = 0; i < 32; i++) {
>           uint64_t *q = aa64_vfp_qreg(env, i);
>   #if HOST_BIG_ENDIAN
>           uint64_t fp_val[2] = { q[1], q[0] };
> -        reg.addr = (uintptr_t)fp_val;
> +        ret = kvm_set_one_reg(cs, AARCH64_SIMD_CORE_REG(fp_regs.vregs[i]),
> +                                                        &fp_val);
                                                            ^^^^^^^
                                                            s/&fp_val/fp_val
>   #else
> -        reg.addr = (uintptr_t)q;
> +        ret = kvm_set_one_reg(cs, AARCH64_SIMD_CORE_REG(fp_regs.vregs[i]), &q);
                                                                               ^^^
                                                                              s/&q/q
                                                                               
>   #endif
> -        reg.id = AARCH64_SIMD_CORE_REG(fp_regs.vregs[i]);
> -        ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
>           if (ret) {
>               return ret;
>           }
> @@ -758,14 +752,11 @@ static int kvm_arch_put_sve(CPUState *cs)
>       CPUARMState *env = &cpu->env;
>       uint64_t tmp[ARM_MAX_VQ * 2];
>       uint64_t *r;
> -    struct kvm_one_reg reg;
>       int n, ret;
>   
>       for (n = 0; n < KVM_ARM64_SVE_NUM_ZREGS; ++n) {
>           r = sve_bswap64(tmp, &env->vfp.zregs[n].d[0], cpu->sve_max_vq * 2);
> -        reg.addr = (uintptr_t)r;
> -        reg.id = KVM_REG_ARM64_SVE_ZREG(n, 0);
> -        ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
> +        ret = kvm_set_one_reg(cs, KVM_REG_ARM64_SVE_ZREG(n, 0), r);
>           if (ret) {
>               return ret;
>           }
> @@ -774,9 +765,7 @@ static int kvm_arch_put_sve(CPUState *cs)
>       for (n = 0; n < KVM_ARM64_SVE_NUM_PREGS; ++n) {
>           r = sve_bswap64(tmp, r = &env->vfp.pregs[n].p[0],
>                           DIV_ROUND_UP(cpu->sve_max_vq * 2, 8));
> -        reg.addr = (uintptr_t)r;
> -        reg.id = KVM_REG_ARM64_SVE_PREG(n, 0);
> -        ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
> +        ret = kvm_set_one_reg(cs, KVM_REG_ARM64_SVE_PREG(n, 0), r);
>           if (ret) {
>               return ret;
>           }
> @@ -784,9 +773,7 @@ static int kvm_arch_put_sve(CPUState *cs)
>   
>       r = sve_bswap64(tmp, &env->vfp.pregs[FFR_PRED_NUM].p[0],
>                       DIV_ROUND_UP(cpu->sve_max_vq * 2, 8));
> -    reg.addr = (uintptr_t)r;
> -    reg.id = KVM_REG_ARM64_SVE_FFR(0);
> -    ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
> +    ret = kvm_set_one_reg(cs, KVM_REG_ARM64_SVE_FFR(0), r);
>       if (ret) {
>           return ret;
>       }
> @@ -796,7 +783,6 @@ static int kvm_arch_put_sve(CPUState *cs)
>   
>   int kvm_arch_put_registers(CPUState *cs, int level)
>   {
> -    struct kvm_one_reg reg;
>       uint64_t val;
>       uint32_t fpr;
>       int i, ret;
> @@ -813,9 +799,8 @@ int kvm_arch_put_registers(CPUState *cs, int level)
>       }
>   
>       for (i = 0; i < 31; i++) {
> -        reg.id = AARCH64_CORE_REG(regs.regs[i]);
> -        reg.addr = (uintptr_t) &env->xregs[i];
> -        ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
> +        ret = kvm_set_one_reg(cs, AARCH64_CORE_REG(regs.regs[i]),
> +                              &env->xregs[i]);
>           if (ret) {
>               return ret;
>           }
> @@ -826,16 +811,12 @@ int kvm_arch_put_registers(CPUState *cs, int level)
>        */
>       aarch64_save_sp(env, 1);
>   
> -    reg.id = AARCH64_CORE_REG(regs.sp);
> -    reg.addr = (uintptr_t) &env->sp_el[0];
> -    ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
> +    ret = kvm_set_one_reg(cs, AARCH64_CORE_REG(regs.sp), &env->sp_el[0]);
>       if (ret) {
>           return ret;
>       }
>   
> -    reg.id = AARCH64_CORE_REG(sp_el1);
> -    reg.addr = (uintptr_t) &env->sp_el[1];
> -    ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
> +    ret = kvm_set_one_reg(cs, AARCH64_CORE_REG(sp_el1), &env->sp_el[1]);
>       if (ret) {
>           return ret;
>       }
> @@ -846,23 +827,17 @@ int kvm_arch_put_registers(CPUState *cs, int level)
>       } else {
>           val = cpsr_read(env);
>       }
> -    reg.id = AARCH64_CORE_REG(regs.pstate);
> -    reg.addr = (uintptr_t) &val;
> -    ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
> +    ret = kvm_set_one_reg(cs, AARCH64_CORE_REG(regs.pstate), &val);
>       if (ret) {
>           return ret;
>       }
>   
> -    reg.id = AARCH64_CORE_REG(regs.pc);
> -    reg.addr = (uintptr_t) &env->pc;
> -    ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
> +    ret = kvm_set_one_reg(cs, AARCH64_CORE_REG(regs.pc), &env->pc);
>       if (ret) {
>           return ret;
>       }
>   
> -    reg.id = AARCH64_CORE_REG(elr_el1);
> -    reg.addr = (uintptr_t) &env->elr_el[1];
> -    ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
> +    ret = kvm_set_one_reg(cs, AARCH64_CORE_REG(elr_el1), &env->elr_el[1]);
>       if (ret) {
>           return ret;
>       }
> @@ -881,9 +856,8 @@ int kvm_arch_put_registers(CPUState *cs, int level)
>   
>       /* KVM 0-4 map to QEMU banks 1-5 */
>       for (i = 0; i < KVM_NR_SPSR; i++) {
> -        reg.id = AARCH64_CORE_REG(spsr[i]);
> -        reg.addr = (uintptr_t) &env->banked_spsr[i + 1];
> -        ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
> +        ret = kvm_set_one_reg(cs, AARCH64_CORE_REG(spsr[i]),
> +                              &env->banked_spsr[i + 1]);
>           if (ret) {
>               return ret;
>           }
> @@ -898,18 +872,14 @@ int kvm_arch_put_registers(CPUState *cs, int level)
>           return ret;
>       }
>   
> -    reg.addr = (uintptr_t)(&fpr);
>       fpr = vfp_get_fpsr(env);
> -    reg.id = AARCH64_SIMD_CTRL_REG(fp_regs.fpsr);
> -    ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
> +    ret = kvm_set_one_reg(cs, AARCH64_SIMD_CTRL_REG(fp_regs.fpsr), &fpr);
>       if (ret) {
>           return ret;
>       }
>   
> -    reg.addr = (uintptr_t)(&fpr);
>       fpr = vfp_get_fpcr(env);
> -    reg.id = AARCH64_SIMD_CTRL_REG(fp_regs.fpcr);
> -    ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
> +    ret = kvm_set_one_reg(cs, AARCH64_SIMD_CTRL_REG(fp_regs.fpcr), &fpr);
>       if (ret) {
>           return ret;
>       }

Thanks,
Gavin

