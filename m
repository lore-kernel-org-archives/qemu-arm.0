Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAF01D6D229
	for <qemu-arm@archiver.kernel.org>; Thu, 18 Dec 2025 13:52:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vWEQA-0000IL-3X; Thu, 18 Dec 2025 08:51:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1vWEQ5-0000Hp-7G
 for qemu-arm@nongnu.org; Thu, 18 Dec 2025 08:51:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1vWEQ2-0003Ax-SJ
 for qemu-arm@nongnu.org; Thu, 18 Dec 2025 08:51:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1766065909;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iUU5ovWJx8/Z9eD5ayVhi/Ir8JJwZuJVwGvbkubgBXE=;
 b=CUqoBpEhewhnISYC2D2kDPP+2803h5bnleb8tex+V9sJJpHUHthKLk2q44FIWf1S6pRq0m
 QpMw1Ri56hVkZMg/dzOHJ9jJ+6kmI8CuG1kPFyqXP0pA6G9lpSld4Pr3j2kehH+Fu5bx1H
 mDV37if4D/CF+mvBAZgcrCM5BQYALkQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-497-LMAz4d3zPqORJ7EFZx_qcw-1; Thu, 18 Dec 2025 08:51:47 -0500
X-MC-Unique: LMAz4d3zPqORJ7EFZx_qcw-1
X-Mimecast-MFC-AGG-ID: LMAz4d3zPqORJ7EFZx_qcw_1766065906
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-431054c09e3so383396f8f.0
 for <qemu-arm@nongnu.org>; Thu, 18 Dec 2025 05:51:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766065906; x=1766670706;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=t0ri+3+P9kmZqLA6W5PjkdvgB9+zIG9sNloSxhOLmgI=;
 b=gDYkPW+4bJKRFBMnRMJoeLf2gwW6b4qSDe8a0gw16IrDOKvfG3UnbDF7pgyhJi5KdD
 6N6gOCzTxDsQsMNOTsN1AVIxh00K7BbgK/c9wIkPM5H9qxat4Q8xIWu+TOyfeSz5MbcY
 gzyovZQUaML/hdgdiwEMiS1+xFOvf/K4tqjZOnQY4s72BrLlXdPCUCNCP4B0t7ZeQ2rG
 oZ0WJOVnAFZbbBI3Ad7swBo2kWG9mSnDZukMjapCmbeMEWxVVN9jGaVkfVjCnoJA6cay
 Dsc79VzsWRVarHkp+/vZ5XYm81PneoPVYGq/5V+gkaM0/2MCKVEYuM8D6gSE2JzsfM4v
 G3ew==
X-Forwarded-Encrypted: i=1;
 AJvYcCXughdbkJPExj32PY5YS8oJA92G0XZ7dSkfmcZcurko48cV5dKxppcpEsmRJ2woj9jh1/iWz4u+2Q==@nongnu.org
X-Gm-Message-State: AOJu0YwWAAMmPURE4xy5rN0dMW1wUlP/gpS0En/Hv8JpjdSrzr3V+w4k
 fB5AOhzRXntdWzT7W4rV/6UEN6/q/LjsvZmrGEc+XOCCHpy7GEb2wJH94ql5MSssTjYru30GaZP
 VZSsoTUUXJDt5Vc/HZyF1toc+2/lX4YoUh5XlZTtJu4cK4LX6CHIF6Q==
X-Gm-Gg: AY/fxX64FXMZAnAdtTsPgc7KfgXK3aiOSe7srhmBFTiFfyj6rbsfw3xk8ZVybVxyK0R
 3FhJZtA0oohxxZoibeLJTdIjjZjxEl0ejIVB/LRYbgOafKWxdSpyjqdLvqlNL/A1X/kLYQrQMzy
 8BbbIxwocFp6zHmk1jOdX8z9dCMFZTmb59dpMBkDkeMwC7BAR8y+ygF1snmcSjhJdycAvVPwrIu
 IUPfEMVM2v8altM+rqBXKffxsXbHR3NxRafs7IEn+SRaZkwE1hlAZg4cVuKtBvTKjeLg3RSNBER
 qVSXBox8/Q0e0yeAZ41N0VlIebrXUubJ0SsK3CcG3bArhBuhVhYAF5Klq8IGdkkSdqP5jA==
X-Received: by 2002:a5d:5c84:0:b0:430:f272:3489 with SMTP id
 ffacd0b85a97d-430f2723770mr18910667f8f.28.1766065906144; 
 Thu, 18 Dec 2025 05:51:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGqTw6EaaSgOvc8aqRzlQOIS6p3UeBfp9gbhwXh+PofYa9MrFMQWpWZVlutgK2FCXVStBZkXw==
X-Received: by 2002:a5d:5c84:0:b0:430:f272:3489 with SMTP id
 ffacd0b85a97d-430f2723770mr18910634f8f.28.1766065905655; 
 Thu, 18 Dec 2025 05:51:45 -0800 (PST)
Received: from imammedo ([213.175.46.86]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43244940120sm5315826f8f.16.2025.12.18.05.51.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Dec 2025 05:51:45 -0800 (PST)
Date: Thu, 18 Dec 2025 14:51:43 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Zhao Liu <zhao1.liu@intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, "Michael S . Tsirkin"
 <mst@redhat.com>, Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?=
 <philmd@linaro.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Thomas
 Huth <thuth@redhat.com>, qemu-devel@nongnu.org, devel@lists.libvirt.org,
 kvm@vger.kernel.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org, Richard
 Henderson <richard.henderson@linaro.org>, Sergio Lopez <slp@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Laurent Vivier <lvivier@redhat.com>, Jiaxun
 Yang <jiaxun.yang@flygoat.com>, Yi Liu <yi.l.liu@intel.com>, Eduardo
 Habkost <eduardo@habkost.net>, Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, Marcelo Tosatti
 <mtosatti@redhat.com>, Weiwei Li <liwei1518@gmail.com>, Amit Shah
 <amit@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, Yanan Wang
 <wangyanan55@huawei.com>, Helge Deller <deller@gmx.de>, Palmer Dabbelt
 <palmer@dabbelt.com>, "Daniel P . =?UTF-8?B?QmVycmFuZ8Op?="
 <berrange@redhat.com>, Ani Sinha <anisinha@redhat.com>, Fabiano Rosas
 <farosas@suse.de>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?B?Q2zDqW1lbnQ=?= Mathieu--Drif <clement.mathieu--drif@eviden.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>, Huacai
 Chen <chenhuacai@kernel.org>, Jason Wang <jasowang@redhat.com>, Mark
 Cave-Ayland <mark.caveayland@nutanix.com>, BALATON Zoltan
 <balaton@eik.bme.hu>, Peter Krempa <pkrempa@redhat.com>, Jiri Denemark
 <jdenemar@redhat.com>
Subject: Re: [PATCH v5 23/28] target/i386/cpu: Remove
 CPUX86State::full_cpuid_auto_level field
Message-ID: <20251218145143.743ff111@imammedo>
In-Reply-To: <20251202162835.3227894-24-zhao1.liu@intel.com>
References: <20251202162835.3227894-1-zhao1.liu@intel.com>
 <20251202162835.3227894-24-zhao1.liu@intel.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SrmytgHC4tdwaMvGJcohzC82ZNVmhBwvPnznfVrgoXU_1766065906
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Wed,  3 Dec 2025 00:28:30 +0800
Zhao Liu <zhao1.liu@intel.com> wrote:

> From: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>=20
> The CPUX86State::full_cpuid_auto_level boolean was only
> disabled for the pc-q35-2.7 and pc-i440fx-2.7 machines,
> which got removed. Being now always %true, we can remove
> it and simplify x86_cpu_expand_features().
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
> Note, although libvirt still uses this property in its test cases, it
> was confirmed this property is not exposed to user directly [*].
>=20
> [*]: https://lore.kernel.org/qemu-devel/aDmphSY1MSxu7L9R@orkuz.int.mamuti=
.net/
> ---
>  target/i386/cpu.c | 111 ++++++++++++++++++++++------------------------
>  target/i386/cpu.h |   3 --
>  2 files changed, 54 insertions(+), 60 deletions(-)
>=20
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index 641777578637..72c69ba81c1b 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -9019,69 +9019,67 @@ void x86_cpu_expand_features(X86CPU *cpu, Error *=
*errp)
> =20
>      /* CPUID[EAX=3D7,ECX=3D0].EBX always increased level automatically: =
*/
>      x86_cpu_adjust_feat_level(cpu, FEAT_7_0_EBX);
> -    if (cpu->full_cpuid_auto_level) {
> -        x86_cpu_adjust_feat_level(cpu, FEAT_1_EDX);
> -        x86_cpu_adjust_feat_level(cpu, FEAT_1_ECX);
> -        x86_cpu_adjust_feat_level(cpu, FEAT_6_EAX);
> -        x86_cpu_adjust_feat_level(cpu, FEAT_7_0_ECX);
> -        x86_cpu_adjust_feat_level(cpu, FEAT_7_1_EAX);
> -        x86_cpu_adjust_feat_level(cpu, FEAT_7_1_ECX);
> -        x86_cpu_adjust_feat_level(cpu, FEAT_7_1_EDX);
> -        x86_cpu_adjust_feat_level(cpu, FEAT_7_2_EDX);
> -        x86_cpu_adjust_feat_level(cpu, FEAT_8000_0001_EDX);
> -        x86_cpu_adjust_feat_level(cpu, FEAT_8000_0001_ECX);
> -        x86_cpu_adjust_feat_level(cpu, FEAT_8000_0007_EDX);
> -        x86_cpu_adjust_feat_level(cpu, FEAT_8000_0008_EBX);
> -        x86_cpu_adjust_feat_level(cpu, FEAT_C000_0001_EDX);
> -        x86_cpu_adjust_feat_level(cpu, FEAT_SVM);
> -        x86_cpu_adjust_feat_level(cpu, FEAT_XSAVE);
> -
> -        /* Intel Processor Trace requires CPUID[0x14] */
> -        if ((env->features[FEAT_7_0_EBX] & CPUID_7_0_EBX_INTEL_PT)) {
> -            if (cpu->intel_pt_auto_level) {
> -                x86_cpu_adjust_level(cpu, &cpu->env.cpuid_min_level, 0x1=
4);
> -            } else if (cpu->env.cpuid_min_level < 0x14) {
> -                mark_unavailable_features(cpu, FEAT_7_0_EBX,
> -                    CPUID_7_0_EBX_INTEL_PT,
> -                    "Intel PT need CPUID leaf 0x14, please set by \"-cpu=
 ...,intel-pt=3Don,min-level=3D0x14\"");
> -            }
> +    x86_cpu_adjust_feat_level(cpu, FEAT_1_EDX);
> +    x86_cpu_adjust_feat_level(cpu, FEAT_1_ECX);
> +    x86_cpu_adjust_feat_level(cpu, FEAT_6_EAX);
> +    x86_cpu_adjust_feat_level(cpu, FEAT_7_0_ECX);
> +    x86_cpu_adjust_feat_level(cpu, FEAT_7_1_EAX);
> +    x86_cpu_adjust_feat_level(cpu, FEAT_7_1_ECX);
> +    x86_cpu_adjust_feat_level(cpu, FEAT_7_1_EDX);
> +    x86_cpu_adjust_feat_level(cpu, FEAT_7_2_EDX);
> +    x86_cpu_adjust_feat_level(cpu, FEAT_8000_0001_EDX);
> +    x86_cpu_adjust_feat_level(cpu, FEAT_8000_0001_ECX);
> +    x86_cpu_adjust_feat_level(cpu, FEAT_8000_0007_EDX);
> +    x86_cpu_adjust_feat_level(cpu, FEAT_8000_0008_EBX);
> +    x86_cpu_adjust_feat_level(cpu, FEAT_C000_0001_EDX);
> +    x86_cpu_adjust_feat_level(cpu, FEAT_SVM);
> +    x86_cpu_adjust_feat_level(cpu, FEAT_XSAVE);
> +
> +    /* Intel Processor Trace requires CPUID[0x14] */
> +    if ((env->features[FEAT_7_0_EBX] & CPUID_7_0_EBX_INTEL_PT)) {
> +        if (cpu->intel_pt_auto_level) {
> +            x86_cpu_adjust_level(cpu, &cpu->env.cpuid_min_level, 0x14);
> +        } else if (cpu->env.cpuid_min_level < 0x14) {
> +            mark_unavailable_features(cpu, FEAT_7_0_EBX,
> +                CPUID_7_0_EBX_INTEL_PT,
> +                "Intel PT need CPUID leaf 0x14, please set by \"-cpu ...=
,intel-pt=3Don,min-level=3D0x14\"");
>          }
> +    }
> =20
> -        /*
> -         * Intel CPU topology with multi-dies support requires CPUID[0x1=
F].
> -         * For AMD Rome/Milan, cpuid level is 0x10, and guest OS should =
detect
> -         * extended toplogy by leaf 0xB. Only adjust it for Intel CPU, u=
nless
> -         * cpu->vendor_cpuid_only has been unset for compatibility with =
older
> -         * machine types.
> -         */
> -        if (x86_has_cpuid_0x1f(cpu) &&
> -            (IS_INTEL_CPU(env) || !cpu->vendor_cpuid_only)) {
> -            x86_cpu_adjust_level(cpu, &env->cpuid_min_level, 0x1F);
> -        }
> +    /*
> +     * Intel CPU topology with multi-dies support requires CPUID[0x1F].
> +     * For AMD Rome/Milan, cpuid level is 0x10, and guest OS should dete=
ct
> +     * extended toplogy by leaf 0xB. Only adjust it for Intel CPU, unles=
s
> +     * cpu->vendor_cpuid_only has been unset for compatibility with olde=
r
> +     * machine types.
> +     */
> +    if (x86_has_cpuid_0x1f(cpu) &&
> +        (IS_INTEL_CPU(env) || !cpu->vendor_cpuid_only)) {
> +        x86_cpu_adjust_level(cpu, &env->cpuid_min_level, 0x1F);
> +    }
> =20
> -        /* Advanced Vector Extensions 10 (AVX10) requires CPUID[0x24] */
> -        if (env->features[FEAT_7_1_EDX] & CPUID_7_1_EDX_AVX10) {
> -            x86_cpu_adjust_level(cpu, &env->cpuid_min_level, 0x24);
> -        }
> +    /* Advanced Vector Extensions 10 (AVX10) requires CPUID[0x24] */
> +    if (env->features[FEAT_7_1_EDX] & CPUID_7_1_EDX_AVX10) {
> +        x86_cpu_adjust_level(cpu, &env->cpuid_min_level, 0x24);
> +    }
> =20
> -        /* SVM requires CPUID[0x8000000A] */
> -        if (env->features[FEAT_8000_0001_ECX] & CPUID_EXT3_SVM) {
> -            x86_cpu_adjust_level(cpu, &env->cpuid_min_xlevel, 0x8000000A=
);
> -        }
> +    /* SVM requires CPUID[0x8000000A] */
> +    if (env->features[FEAT_8000_0001_ECX] & CPUID_EXT3_SVM) {
> +        x86_cpu_adjust_level(cpu, &env->cpuid_min_xlevel, 0x8000000A);
> +    }
> =20
> -        /* SEV requires CPUID[0x8000001F] */
> -        if (sev_enabled()) {
> -            x86_cpu_adjust_level(cpu, &env->cpuid_min_xlevel, 0x8000001F=
);
> -        }
> +    /* SEV requires CPUID[0x8000001F] */
> +    if (sev_enabled()) {
> +        x86_cpu_adjust_level(cpu, &env->cpuid_min_xlevel, 0x8000001F);
> +    }
> =20
> -        if (env->features[FEAT_8000_0021_EAX]) {
> -            x86_cpu_adjust_level(cpu, &env->cpuid_min_xlevel, 0x80000021=
);
> -        }
> +    if (env->features[FEAT_8000_0021_EAX]) {
> +        x86_cpu_adjust_level(cpu, &env->cpuid_min_xlevel, 0x80000021);
> +    }
> =20
> -        /* SGX requires CPUID[0x12] for EPC enumeration */
> -        if (env->features[FEAT_7_0_EBX] & CPUID_7_0_EBX_SGX) {
> -            x86_cpu_adjust_level(cpu, &env->cpuid_min_level, 0x12);
> -        }
> +    /* SGX requires CPUID[0x12] for EPC enumeration */
> +    if (env->features[FEAT_7_0_EBX] & CPUID_7_0_EBX_SGX) {
> +        x86_cpu_adjust_level(cpu, &env->cpuid_min_level, 0x12);
>      }
> =20
>      /* Set cpuid_*level* based on cpuid_min_*level, if not explicitly se=
t */
> @@ -10010,7 +10008,6 @@ static const Property x86_cpu_properties[] =3D {
>      DEFINE_PROP_UINT32("min-xlevel2", X86CPU, env.cpuid_min_xlevel2, 0),
>      DEFINE_PROP_UINT8("avx10-version", X86CPU, env.avx10_version, 0),
>      DEFINE_PROP_UINT64("ucode-rev", X86CPU, ucode_rev, 0),
> -    DEFINE_PROP_BOOL("full-cpuid-auto-level", X86CPU, full_cpuid_auto_le=
vel, true),
>      DEFINE_PROP_STRING("hv-vendor-id", X86CPU, hyperv_vendor),
>      DEFINE_PROP_BOOL("cpuid-0xb", X86CPU, enable_cpuid_0xb, true),
>      DEFINE_PROP_BOOL("x-vendor-cpuid-only", X86CPU, vendor_cpuid_only, t=
rue),
> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> index cee1f692a1c3..8c3eb86fa0c7 100644
> --- a/target/i386/cpu.h
> +++ b/target/i386/cpu.h
> @@ -2292,9 +2292,6 @@ struct ArchCPU {
>      /* Force to enable cpuid 0x1f */
>      bool force_cpuid_0x1f;
> =20
> -    /* Enable auto level-increase for all CPUID leaves */
> -    bool full_cpuid_auto_level;
> -
>      /*
>       * Compatibility bits for old machine types (PC machine v6.0 and old=
er).
>       * Only advertise CPUID leaves defined by the vendor.


