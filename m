Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1423406lfb;
        Fri, 27 Aug 2021 03:04:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwhss/SIrLTsStpV9ZDfjFgOykObBCj3NW96RLocDXIkI7xOvfO41HXP5PX1z3LVi+ZOq1m
X-Received: by 2002:a67:fe57:: with SMTP id m23mr6050080vsr.58.1630058648525;
        Fri, 27 Aug 2021 03:04:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630058648; cv=none;
        d=google.com; s=arc-20160816;
        b=nJL778TY4OXz7HB4MDZEXPhPXP5M8wgGy7r8dYjAXH9FW0KTfYeBqM5UFKbqnDXQ/I
         PSgY6UqSLgORa79CQ5dTfC9PX666+xTg7ZQbOMxPYuSbuwexA9koUj6GShYFPBgj9Tzw
         wAWwnv1vRmXUY5+4LSC+ax91pfm+WsHaUZx38VndT1XYuwhKv7FvWtSp0CjdrdvMjyIG
         23cVeapBDGT3eJKlKl6EwW1Hvx6AaO2OSb0ZucHkhB35I4lUdXOD7gW+4cjnxgZr3swN
         mivk6YVDXYMHdL/VTcuWny2zes7A/C47YNLaSsQhpoHV72DyUxqkyKeDBeYNqQElWScq
         Q4rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-disposition:in-reply-to:mime-version:references:message-id
         :subject:to:from:date:dkim-signature;
        bh=20ifT1NgPkUzDQ4UNUNUsf1bgDRyUf4PaK2WE8aq3EM=;
        b=DakDU21ppXJAoY4DyH3/79tHe9SUxY2D5hAO7SkL8WE4ibHQsLaXr6ceAy5T6G16hW
         wuhHuW7xQNBqY9qL2OFzgt98GIrviCGWAb1lQ8doyHONNFxjG0YmirD/x3MdJFnwWs9F
         cpAtIEqgW67UCky2cWOKIXmLIurTw64IjMyVWXHiTvTAbzV8i7g24MZiqReYZF+Dx0yp
         2HfpMf6e6vlfcbQKZxkP4nFUL3kfGkzS9EtODJA9okwXS/6rZWBMYnOKkAS74Lgmj9Tc
         PZiZkGW4WotfMNNuNQs+AWhZBzNEVtX7ZbLrB2eYAz35rwcBR/owSnGOAsoBRbRzEWXF
         ok6g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Pf+MIXPB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e33si2643464uad.226.2021.08.27.03.04.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Aug 2021 03:04:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Pf+MIXPB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mJYiV-0003u8-LP
	for alex.bennee@linaro.org; Fri, 27 Aug 2021 06:04:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mJYiG-0003ta-TL
 for qemu-arm@nongnu.org; Fri, 27 Aug 2021 06:03:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mJYiD-00006U-HS
 for qemu-arm@nongnu.org; Fri, 27 Aug 2021 06:03:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630058627;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=20ifT1NgPkUzDQ4UNUNUsf1bgDRyUf4PaK2WE8aq3EM=;
 b=Pf+MIXPBVFTuMAr4xfxUx5vnAB4WwoOJ5va4+agWtXLgtfyYu9byNZd9bAter+O/50MHgD
 qHM2m0jnK2WNu1Eam7+Fxs1At2svCOWsmmIpzvPoVqeeiHgAQpf7GXhKZf7iuwuozxeh7r
 DPZVdu3cQ1ZF8eHaYvcfn2w/D1xvtsk=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-TXSGpDlHMx6xxtxBP317XA-1; Fri, 27 Aug 2021 06:03:46 -0400
X-MC-Unique: TXSGpDlHMx6xxtxBP317XA-1
Received: by mail-ej1-f70.google.com with SMTP id
 ne21-20020a1709077b95b029057eb61c6fdfso1594055ejc.22
 for <qemu-arm@nongnu.org>; Fri, 27 Aug 2021 03:03:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=20ifT1NgPkUzDQ4UNUNUsf1bgDRyUf4PaK2WE8aq3EM=;
 b=bCX1QatcJgPXPfpa2vz7nPmizM6dy2rN16j9Ni/jL04bDx6jJDhzL8xRaRV1whYdYY
 FwaOLhHtlWQbrBZnHst1RCcsWv24RNR9LfkS4AkmzCNOzwyG4pFXxLkuM2wpdBtxhUhz
 zzf3jH8tJbFA6F8DozBlD7XZuakdS64qYD3OR76t3PzI63czc7nrte8nvryApE6Q9ias
 +ILKQnilG2rWXheADfXNH2NMHRDoGMUJEB0o+88Jf1tfIn29PPaUZxrUhPKaTs+hr/fu
 pvZ2xJidTwNUqGIHSmBIJQSY18g7ln2dpJVH9xi1+InAiqvGJJJcJjYrdog4Yqae7trI
 8ahw==
X-Gm-Message-State: AOAM532z33/PKV5JKyYmC1TsI3n4k6MvWNSKKh4VOr06uK0hxHXhF/j7
 2ZCX+PAk6FfrkaSjguVHw2GTq5iUFAWvQLShw3/ylu+WC4tjq91dUG3qbbGIsKVfmOni9S6/qwM
 uwrbdAzTOt63n
X-Received: by 2002:a17:906:3388:: with SMTP id
 v8mr8619278eja.540.1630058625093; 
 Fri, 27 Aug 2021 03:03:45 -0700 (PDT)
X-Received: by 2002:a17:906:3388:: with SMTP id
 v8mr8619240eja.540.1630058624631; 
 Fri, 27 Aug 2021 03:03:44 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id qx18sm2547217ejb.75.2021.08.27.03.03.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Aug 2021 03:03:44 -0700 (PDT)
Date: Fri, 27 Aug 2021 12:03:42 +0200
From: Andrew Jones <drjones@redhat.com>
To: "ishii.shuuichir@fujitsu.com" <ishii.shuuichir@fujitsu.com>
Subject: Re: [PATCH v2 0/4] target/arm/cpu: Introduce sve_vq_supported bitmap
Message-ID: <20210827100342.m3krf6fyazyndytb@gator.home>
References: <20210823160647.34028-1-drjones@redhat.com>
 <TYCPR01MB6160D6A837EBECCBC1F70847E9C89@TYCPR01MB6160.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <TYCPR01MB6160D6A837EBECCBC1F70847E9C89@TYCPR01MB6160.jpnprd01.prod.outlook.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.742,
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "philmd@redhat.com" <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AvBRyteMBeq3

On Fri, Aug 27, 2021 at 08:30:07AM +0000, ishii.shuuichir@fujitsu.com wrote:
> 
> Thank you, Andrew, for creating the patches.
> And thank you all for your comments.
> 
> I have applied the suggested v2 patch series by andrew locally, 
> and reviewed the next version of the a64fx patch series as follows. 
> I would appreciate if you could comment on whether there are
> any problems with the fixes before I post the next version of the patch.
> (The a64fx patch series to be posted later will be split as previously posted.)
> 
> ------------------------------------------------------------------------------------------------
> diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
> index 59acf0eeaf..850787495b 100644
> --- a/docs/system/arm/virt.rst
> +++ b/docs/system/arm/virt.rst
> @@ -55,6 +55,7 @@ Supported guest CPU types:
>  - ``cortex-a53`` (64-bit)
>  - ``cortex-a57`` (64-bit)
>  - ``cortex-a72`` (64-bit)
> +- ``a64fx`` (64-bit)
>  - ``host`` (with KVM only)
>  - ``max`` (same as ``host`` for KVM; best possible emulation with TCG)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 81eda46b0b..10286d3fd6 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -200,6 +200,7 @@ static const char *valid_cpus[] = {
>      ARM_CPU_TYPE_NAME("cortex-a53"),
>      ARM_CPU_TYPE_NAME("cortex-a57"),
>      ARM_CPU_TYPE_NAME("cortex-a72"),
> +    ARM_CPU_TYPE_NAME("a64fx"),
>      ARM_CPU_TYPE_NAME("host"),
>      ARM_CPU_TYPE_NAME("max"),
>  };
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 2866dd7658..2d9f779cb6 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1350,10 +1350,12 @@ void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
>      Error *local_err = NULL;
> 
>      if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
> -        arm_cpu_sve_finalize(cpu, &local_err);
> -        if (local_err != NULL) {
> -            error_propagate(errp, local_err);
> -            return;
> +        if (!arm_feature(&cpu->env, ARM_FEATURE_A64FX)) {
> +            arm_cpu_sve_finalize(cpu, &local_err);
> +            if (local_err != NULL) {
> +                error_propagate(errp, local_err);
> +                return;
> +            }

We don't want to do this anymore. Now we want to call
arm_cpu_sve_finalize() for all cpu models.

>          }
> 
>          /*
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index cc645b5742..bf8d9ddaa1 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -2149,6 +2149,7 @@ enum arm_features {
>      ARM_FEATURE_M_SECURITY, /* M profile Security Extension */
>      ARM_FEATURE_M_MAIN, /* M profile Main Extension */
>      ARM_FEATURE_V8_1M, /* M profile extras only in v8.1M and later */
> +    ARM_FEATURE_A64FX, /* Fujitsu A64FX processor */
>  };
> 
>  static inline int arm_feature(CPUARMState *env, int feature)
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 2f0cbddab5..18e813264a 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -841,10 +841,80 @@ static void aarch64_max_initfn(Object *obj)
>                          cpu_max_set_sve_max_vq, NULL, NULL);
>  }
> 
> +static void a64fx_cpu_set_sve(Object *obj)
> +{
> +    int i;
> +    Error *errp = NULL;
> +    ARMCPU *cpu = ARM_CPU(obj);
> +    /* Suppport of A64FX's vector length are 128,256 and 512bit only */
> +    const char *vl[] = {"sve128", "sve256", "sve512"};
> +
> +    object_property_add_bool(obj, "sve", cpu_arm_get_sve, cpu_arm_set_sve);
> +    object_property_set_bool(obj, "sve", true, &errp);
> +
> +    for(i = 0; i <sizeof(vl)/sizeof(vl[0]); i++){
> +        object_property_add(obj, vl[i], "bool", cpu_arm_get_sve_vq,
> +                            cpu_arm_set_sve_vq, NULL, NULL);
> +        object_property_set_bool(obj, vl[i], true, &errp);
> +    }

We don't want to do any of the above anymore either. We can add all the
properties with aarch64_add_sve_properties() now because only the
supported vector lengths may be enabled.

> +
> +    bitmap_zero(cpu->sve_vq_supported, ARM_MAX_VQ);
> +    set_bit(0, cpu->sve_vq_supported); /* 128bit */
> +    set_bit(1, cpu->sve_vq_supported); /* 256bit */
> +    set_bit(3, cpu->sve_vq_supported); /* 512bit */

This is correct, but since it's only a few lines it can be put directly
into aarch64_a64fx_initfn().

> +
> +    cpu->sve_max_vq = find_last_bit(cpu->sve_vq_map, ARM_MAX_VQ) + 1;

This isn't necessary. arm_cpu_sve_finalize() will manage it.

> +}
> +
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
> +    /* Set SVE properties */
> +    a64fx_cpu_set_sve(obj);
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
> diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
> index 8252b85bb8..bf30bee462 100644
> --- a/tests/qtest/arm-cpu-features.c
> +++ b/tests/qtest/arm-cpu-features.c
> @@ -472,6 +472,11 @@ static void test_query_cpu_model_expansion(const void *data)
>          assert_has_feature_enabled(qts, "max", "sve128");
>          assert_has_feature_enabled(qts, "cortex-a57", "pmu");
>          assert_has_feature_enabled(qts, "cortex-a57", "aarch64");
> +        assert_has_feature_enabled(qts, "a64fx", "pmu");
> +        assert_has_feature_enabled(qts, "a64fx", "aarch64");
> +        assert_has_feature_enabled(qts, "a64fx", "sve");
> +        assert_has_feature_enabled(qts, "a64fx", "sve128");
> +        assert_has_feature_enabled(qts, "a64fx", "sve256");
> +        assert_has_feature_enabled(qts, "a64fx", "sve512");

You should also add tests that make sure no other vectors may be enabled.
Also, you can use assert_sve_vls() to check more than one vector length
is enabled at once. So, something like

/*
 * For A64FX SVE should be enabled by default with the vectors
 * sve128, sve256, and sve512
 */
 assert_has_feature_enabled(qts, "a64fx", "sve");
 assert_sve_vls(qts, "a64fx", 0xb, NULL);

/*
 * A64FX does not support any other vector lengths besides those
 * that are enabled by default.
 */
 assert_error(qts, "a64fx", "cannot enable sve384", "{ 'sve384': true }");
 assert_error(qts, "a64fx", "cannot enable sve640", "{ 'sve640': true }");


You could also test that completely disabling sve works and that disabling
sve256 (which also disables sve512) and/or only test disabling sve512
works, but that would only be testing the same code covered by tests with
the 'max' cpu type, since that code is shared.


> 
>          sve_tests_default(qts, "max");
>          pauth_tests_default(qts, "max");
> ------------------------------------------------------------------------------------------------
> 
> By the way, There is one thing that bothers me about the above modification.
> The A64FX supports only 128-bit, 256-bit, and 512-bit SVE vector lengths, but the
> The following process in the arm_cpu_sve_finalize() function sets all bits of cpu->sve_vq_map to 1.
> 
> /* Set all bits not explicitly set within sve-max-vq. */
> bitmap_complement(tmp, cpu->sve_vq_init, max_vq);
> bitmap_or(cpu->sve_vq_map, cpu->sve_vq_map, tmp, max_vq);
> 
> As a result, enter a routine where the following process will be executed.
> 
> error_setg(errp, "cannot set sve-max-vq=%d", cpu->sve_max_vq);

This is the correct behavior and the rest of the error message explains
why

 error_append_hint(errp, "This CPU does not support "
                   "the vector length %d-bits.\n", vq * 128);

In A64FX's case that will point out the vector length 384-bits, which
indeed A64FX does not support.

As I've stated a few different times, the sve-max-vq property is of
marginal use, as it only works for CPU models that support all vector
lengths, including non-power-of-2 lengths. This is because the property
says to enable all vector lengths smaller and including sve-max-vq and to
disable all the rest, but if the CPU doesn't support non-power-of-2 vector
lengths, then sve-max-vq will not work for anything other than max-vq=1
and max-vq=2. For this reason, I didn't even bring this property over to
the 'host' cpu type. I think I once suggested that you don't bring it over
to A64FX either and I'll suggest that again.

> 
> Therefore, We have applied the following fix, is this ok?

No :-)

Thanks,
drew

> ------------------------------------------------------------------------------------------------
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1350,10 +1350,12 @@ void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
>      Error *local_err = NULL;
> 
>      if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
> -        arm_cpu_sve_finalize(cpu, &local_err);
> -        if (local_err != NULL) {
> -            error_propagate(errp, local_err);
> -            return;
> +        if (!arm_feature(&cpu->env, ARM_FEATURE_A64FX)) {
> +            arm_cpu_sve_finalize(cpu, &local_err);
> +            if (local_err != NULL) {
> +                error_propagate(errp, local_err);
> +                return;
> +            }
>          }
> ------------------------------------------------------------------------------------------------
> 
> Please your comments if we have misunderstood.
> Best regards.
> 
> > -----Original Message-----
> > From: Andrew Jones <drjones@redhat.com>
> > Sent: Tuesday, August 24, 2021 1:07 AM
> > To: qemu-devel@nongnu.org; qemu-arm@nongnu.org
> > Cc: Ishii, Shuuichirou/石井 周一郎 <ishii.shuuichir@fujitsu.com>;
> > richard.henderson@linaro.org; peter.maydell@linaro.org; philmd@redhat.com
> > Subject: [PATCH v2 0/4] target/arm/cpu: Introduce sve_vq_supported bitmap
> > 
> > v2:
> >  - Completed testing
> >  - Removed extra space in an error message
> >  - Added Phil's r-b's
> > 
> > While reviewing the new A64FX CPU type it became clear that CPU types should
> > be able to specify which SVE vector lengths are supported. This series adds a new
> > bitmap member to ARMCPU and modifies arm_cpu_sve_finalize() to validate
> > inputs against it.
> > So far we only need to set the bitmap for the 'max' CPU type though and, since it
> > supports all vector lengths, we just fill the whole thing.
> > 
> > This series was inspired by Richard Henderson's suggestion to replace
> > arm_cpu_sve_finalize's kvm_supported bitmap with something that could be
> > shared with TCG.
> > 
> > Thanks,
> > drew
> > 
> > 
> > Andrew Jones (4):
> >   target/arm/cpu: Introduce sve_vq_supported bitmap
> >   target/arm/kvm64: Ensure sve vls map is completely clear
> >   target/arm/cpu64: Replace kvm_supported with sve_vq_supported
> >   target/arm/cpu64: Validate sve vector lengths are supported
> > 
> >  target/arm/cpu.h   |   4 ++
> >  target/arm/cpu64.c | 118
> > +++++++++++++++++++++------------------------
> >  target/arm/kvm64.c |   2 +-
> >  3 files changed, 61 insertions(+), 63 deletions(-)
> > 
> > --
> > 2.31.1
> 

