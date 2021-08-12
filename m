Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp179107lff;
        Thu, 12 Aug 2021 02:17:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxffDZJomTA/OE2LLzdbXuc8oa9FNNxrnBkS7H842idml3u9RcT7wAp9lsUa+daZKAIhMWx
X-Received: by 2002:a05:6214:4b2:: with SMTP id w18mr2939675qvz.47.1628759829411;
        Thu, 12 Aug 2021 02:17:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628759829; cv=none;
        d=google.com; s=arc-20160816;
        b=pE6rQKqxUnLsuNHwTqnh18QCwsQRQMRjmnbFHu+CYsKrgyvgWquwJd0kCks+5wWboz
         +HubSRXiXyoc0aF9JBLEhD6F8QCYaxgvOLjjiLWMcDz8vyZ7wx/crTrGZy/XKOJGC2c/
         AUtK2CCvJtpoMVNJ7D6g1/fnPOBWyFfFsrHSLWRgbnVMfjX4Hy2KPU581oMGUegeE1O9
         AkyDtL53763Uj3un/8ZciFVULMF/s0FhRI7v5ARE/20tbv50s2n0xqNV1SjUn44lvuiG
         8DRZOFgl2jZG6umuKgqaE5kBdoJfHeIq5HnrRQ1vTTuNVIl2cKvjTDiUSOhfXukSa3ns
         bMyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=aClWDxzaMIeDI05iId9l5wVp+RZfyKAiYAjMpU21Xqs=;
        b=X1vOXXaDzo8cOKm/iNK7deP+GCp1fZVx8MuOre+FuLWAAjHfMmKsK9YzWVfzeifMTF
         ScPHOqHObdCPd3g8qB1/W7a1WDj9Rfb/w0Y5vCs9a6WsxuiFsJ2E3GUw5jnNcJq6VpyK
         HY/Gc4OSVBzNQVIh5b76k6t7bj0SpD4wKLG64AsnZCFFPcUp+XQP/Dk27EUWeTpZR+q2
         1CQs1bxpxpooZNLy8kms8AZzS9MGTZU/F7Pp6deLV+4cWFJWjx9rGPy0Ewjd3mvxnyAn
         5EzMnU3v8RS5emSkAP1O9pV0eWP9wP66iBj7JQ7sKbEuyRtH8bG8GrQFN2jt6/QHcxyL
         icyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BbvQ4sNz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g59si1912710qva.54.2021.08.12.02.17.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Aug 2021 02:17:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BbvQ4sNz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mE6po-00073T-Nj
	for alex.bennee@linaro.org; Thu, 12 Aug 2021 05:17:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mE6pf-00073D-La
 for qemu-arm@nongnu.org; Thu, 12 Aug 2021 05:16:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mE6pd-0001R8-5y
 for qemu-arm@nongnu.org; Thu, 12 Aug 2021 05:16:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628759815;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aClWDxzaMIeDI05iId9l5wVp+RZfyKAiYAjMpU21Xqs=;
 b=BbvQ4sNzDJG6uWM4hNNNXkXI5BMVbUsLMjXQ6upx1jHdHcrQew0GJdP/kGgtAVu6I6gm2Z
 quRUxVm+R+hco/9crRhnmzX+PJS5EESs7PbjI79Wfq2WmpybwgezRufg14dtHl32NBYNcN
 WCV4BZRiwq1c1SF1IPmkPR50AyhmRU0=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-255-tvves8WFMOOUNGjtebiGVw-1; Thu, 12 Aug 2021 05:16:54 -0400
X-MC-Unique: tvves8WFMOOUNGjtebiGVw-1
Received: by mail-ej1-f72.google.com with SMTP id
 kf21-20020a17090776d5b02905af6ad96f02so1578036ejc.12
 for <qemu-arm@nongnu.org>; Thu, 12 Aug 2021 02:16:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=aClWDxzaMIeDI05iId9l5wVp+RZfyKAiYAjMpU21Xqs=;
 b=ILmoibGR870PHzEZjNfL7tdhrFG26fqeprOugbGoke/Kmo8wOcFF76M4e9qRALekG1
 UUnJSH17otKsR9hj8PQrI/jaH8bLF83gAJ1B6SNK7dN8NHXB74CogJayG1qerWggZHS+
 EL0Ha7VmFiQ1+aRpwx7QK937jHdOdF2l347Ock0DL7LEcOAB3PP+w/1Ees2BKKhCUBZ5
 WO+a9EHhibCGSRPUWtQ+sCi/edhKs1NZVY6oOBW3yzPuiJGOQOZv3KeuOAFUw4KXlWyN
 XDD/0kIvYexITTtTYUvpzp5jlgdMaFkk+FvbiRUkEr5zoHZtevEuxFbw72VjnQINoHSC
 sQKg==
X-Gm-Message-State: AOAM531YEbSagEcYJlt6yckAO5U2FU4Tl0lmltqM9Jei3Z5LAmL2WyUg
 JzQyaEdBKgC6aJgyy2SFhK0rQc9Yl9A7PgP34l9wZsv5/2R0/qUBXWlRrTiB0EV2ZW5hE5zgJmD
 C4j6T9VhwD7ca
X-Received: by 2002:a05:6402:40f:: with SMTP id
 q15mr4436016edv.86.1628759812990; 
 Thu, 12 Aug 2021 02:16:52 -0700 (PDT)
X-Received: by 2002:a05:6402:40f:: with SMTP id
 q15mr4435988edv.86.1628759812638; 
 Thu, 12 Aug 2021 02:16:52 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id i6sm571487ejd.57.2021.08.12.02.16.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 02:16:52 -0700 (PDT)
Date: Thu, 12 Aug 2021 11:16:50 +0200
From: Andrew Jones <drjones@redhat.com>
To: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
Subject: Re: [PATCH v4 1/3] target-arm: Add support for Fujitsu A64FX
Message-ID: <20210812091650.i5np3szvdoelu2cx@gator.home>
References: <20210812060440.1330348-1-ishii.shuuichir@fujitsu.com>
 <20210812060440.1330348-2-ishii.shuuichir@fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <20210812060440.1330348-2-ishii.shuuichir@fujitsu.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Oq6MzObbBbai

On Thu, Aug 12, 2021 at 03:04:38PM +0900, Shuuichirou Ishii wrote:
> Add a definition for the Fujitsu A64FX processor.
> 
> The A64FX processor does not implement the AArch32 Execution state,
> so there are no associated AArch32 Identification registers.
> 
> For SVE, the A64FX processor supports only 128,256 and 512bit vector lengths.
> 
> Signed-off-by: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
> ---
>  target/arm/cpu.c   | 27 +++++++++++++++++++++++----
>  target/arm/cpu.h   |  1 +
>  target/arm/cpu64.c | 42 ++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 66 insertions(+), 4 deletions(-)
> 
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 2866dd7658..162e46afc3 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1345,15 +1345,34 @@ static void arm_cpu_finalizefn(Object *obj)
>  #endif
>  }
>  
> +static void a64fx_cpu_set_sve(ARMCPU *cpu)
> +{
> +    /* Suppport of A64FX's vector length are 128,256 and 512bit only */
> +    bitmap_zero(cpu->sve_vq_map, ARM_MAX_VQ);
> +    bitmap_zero(cpu->sve_vq_init, ARM_MAX_VQ);
> +    set_bit(0, cpu->sve_vq_map); /* 128bit */
> +    set_bit(0, cpu->sve_vq_init);
> +    set_bit(1, cpu->sve_vq_map); /* 256bit */
> +    set_bit(1, cpu->sve_vq_init);
> +    set_bit(3, cpu->sve_vq_map); /* 512bit */
> +    set_bit(3, cpu->sve_vq_init);
> +
> +    cpu->sve_max_vq = find_last_bit(cpu->sve_vq_map, ARM_MAX_VQ) + 1;
> +}
> +
>  void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
>  {
>      Error *local_err = NULL;
>  
>      if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
> -        arm_cpu_sve_finalize(cpu, &local_err);
> -        if (local_err != NULL) {
> -            error_propagate(errp, local_err);
> -            return;
> +        if (arm_feature(&cpu->env, ARM_FEATURE_A64FX)) {
> +            a64fx_cpu_set_sve(cpu);
> +        } else {
> +            arm_cpu_sve_finalize(cpu, &local_err);
> +            if (local_err != NULL) {
> +                error_propagate(errp, local_err);
> +                return;
> +            }
>          }
>  
>          /*
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 9f0a5f84d5..84ebca731a 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -2145,6 +2145,7 @@ enum arm_features {
>      ARM_FEATURE_M_SECURITY, /* M profile Security Extension */
>      ARM_FEATURE_M_MAIN, /* M profile Main Extension */
>      ARM_FEATURE_V8_1M, /* M profile extras only in v8.1M and later */
> +    ARM_FEATURE_A64FX, /* Fujitsu A64FX processor */
>  };
>  
>  static inline int arm_feature(CPUARMState *env, int feature)
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index c690318a9b..5e7e885f9d 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -847,10 +847,52 @@ static void aarch64_max_initfn(Object *obj)
>                          cpu_max_set_sve_max_vq, NULL, NULL);
>  }
>  
> +static void aarch64_a64fx_initfn(Object *obj)
> +{
> +    ARMCPU *cpu = ARM_CPU(obj);
> +
> +    cpu->dtb_compatible = "arm,a64fx";
> +    set_feature(&cpu->env, ARM_FEATURE_A64FX);
> +    set_feature(&cpu->env, ARM_FEATURE_V8);
> +    set_feature(&cpu->env, ARM_FEATURE_NEON);
> +    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
> +    set_feature(&cpu->env, ARM_FEATURE_AARCH64);
> +    set_feature(&cpu->env, ARM_FEATURE_EL2);
> +    set_feature(&cpu->env, ARM_FEATURE_EL3);
> +    set_feature(&cpu->env, ARM_FEATURE_PMU);
> +    cpu->midr = 0x461f0010;
> +    cpu->revidr = 0x00000000;
> +    cpu->ctr = 0x86668006;
> +    cpu->reset_sctlr = 0x30000180;
> +    cpu->isar.id_aa64pfr0 =   0x0000000101111111; /* No RAS Extensions */
> +    cpu->isar.id_aa64pfr1 = 0x0000000000000000;
> +    cpu->isar.id_aa64dfr0 = 0x0000000010305408;
> +    cpu->isar.id_aa64dfr1 = 0x0000000000000000;
> +    cpu->id_aa64afr0 = 0x0000000000000000;
> +    cpu->id_aa64afr1 = 0x0000000000000000;
> +    cpu->isar.id_aa64mmfr0 = 0x0000000000001122;
> +    cpu->isar.id_aa64mmfr1 = 0x0000000011212100;
> +    cpu->isar.id_aa64mmfr2 = 0x0000000000001011;
> +    cpu->isar.id_aa64isar0 = 0x0000000010211120;
> +    cpu->isar.id_aa64isar1 = 0x0000000000010001;
> +    cpu->isar.id_aa64zfr0 = 0x0000000000000000;
> +    cpu->clidr = 0x0000000080000023;
> +    cpu->ccsidr[0] = 0x7007e01c; /* 64KB L1 dcache */
> +    cpu->ccsidr[1] = 0x2007e01c; /* 64KB L1 icache */
> +    cpu->ccsidr[2] = 0x70ffe07c; /* 8MB L2 cache */
> +    cpu->dcz_blocksize = 6; /* 256 bytes */
> +    cpu->gic_num_lrs = 4;
> +    cpu->gic_vpribits = 5;
> +    cpu->gic_vprebits = 5;
> +
> +    /* TODO:  Add A64FX specific HPC extension registers */
> +}
> +
>  static const ARMCPUInfo aarch64_cpus[] = {
>      { .name = "cortex-a57",         .initfn = aarch64_a57_initfn },
>      { .name = "cortex-a53",         .initfn = aarch64_a53_initfn },
>      { .name = "cortex-a72",         .initfn = aarch64_a72_initfn },
> +    { .name = "a64fx",              .initfn = aarch64_a64fx_initfn },
>      { .name = "max",                .initfn = aarch64_max_initfn },
>  };
>  
> -- 
> 2.27.0
>

For the SVE related bits

Reviewed-by: Andrew Jones <drjones@redhat.com>

