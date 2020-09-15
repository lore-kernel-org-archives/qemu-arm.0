Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp2890114lfq;
        Mon, 14 Sep 2020 23:11:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyiiUiL0N5zKZrS5YuCPc4CWrS0C/P9qgtjTd5dkKQJS8NuypJODSBNrLvpAjdJFG8b9Oby
X-Received: by 2002:a25:7785:: with SMTP id s127mr10191379ybc.360.1600150280961;
        Mon, 14 Sep 2020 23:11:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600150280; cv=none;
        d=google.com; s=arc-20160816;
        b=gd3SdQK1/0lrO2uTLAaO9YyA8zxC07JqaPmqkxM47jV2LyymFWOU88jZR3PGXFx6TN
         mNC4NXodrn471WZPOIQSKgnGf1jZsOK6XnsFg7CBLFwiYym/acTbNKqI8ulwPeMiXN32
         wryEdG7agJkiKDhfiQ7wRGXhHYw7hmuZvGhTUTq3RqOoBknbtRP38B+YHfZBIYT9UBi3
         0k4mk7wHjaFaT+qnkhAlJegLW+tywC9z4i8yal77vSt7kJFZ4lISBU/iPyRNC6AZVOQk
         A9hCwBfQvbXHDwRYlFglvHxifd5ONbhzHpSBP/sLE0hun9vspI2EB6Mr3n7geOkoKzEz
         HW2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=ehjLp9+ink0kA2VBhO0sRZiYhxp+98C2vbv/FiUj2Nw=;
        b=WcAT1U/L5PpYVB7yqUajW1mXKnhgRaBcKM3dGm1Zgw0ZBQ2rBZ+D8b9+F3KvWiYzG9
         FapkLCG9w0fRYD3hxqr21UGdgYXxcu3DRrrivoH7NjcHWnZg0NBHGbPc36mT5TDBGxZ1
         XIepBQ68afQU9y/0gI8pg8TPgUuDjrI64OpbRM99+deNPOuE9JliPl3P+nkOiGT36jwr
         zfc8WEhzahANiryRqlgbPF9DKG8Vx1s+j3yaFXd3o2ick5tm4FgVeJkElnUsbS6MJbV9
         RW5UNtlfUOyETd/g90zIYadVvDSgkncQcKZ5oASLM3EwoZS2volwsi8rL2jMmSEN7mxY
         VzsQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=eLvK8ykO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 132si1811710ybk.433.2020.09.14.23.11.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Sep 2020 23:11:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=eLvK8ykO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kI4BU-0003Rz-Bp
	for alex.bennee@linaro.org; Tue, 15 Sep 2020 02:11:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kI4BK-0003Pc-Jq
 for qemu-arm@nongnu.org; Tue, 15 Sep 2020 02:11:10 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:44736
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kI4BI-0003Zl-S3
 for qemu-arm@nongnu.org; Tue, 15 Sep 2020 02:11:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600150267;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ehjLp9+ink0kA2VBhO0sRZiYhxp+98C2vbv/FiUj2Nw=;
 b=eLvK8ykObsv5iav3cshf159amUbZiGo/HgkW67zytTg4jsUB2lBD8pC8GUXOfIf3NJ3d5m
 6HkYPwk+vJS3XQeCgiuZAbKoP+at2FHHToIU2rn4UxzXFlmzwTQwmDm9g6oDo7WQc/o1xK
 kWg0OlBoaki8s61aX3z/VifSHC5yKkI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-546-eV7UwSB4Mkm7Fn3GEQkLeg-1; Tue, 15 Sep 2020 02:11:04 -0400
X-MC-Unique: eV7UwSB4Mkm7Fn3GEQkLeg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EBF7A425CD;
 Tue, 15 Sep 2020 06:11:02 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.192.136])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 151FE7B7B3;
 Tue, 15 Sep 2020 06:11:00 +0000 (UTC)
Date: Tue, 15 Sep 2020 08:10:58 +0200
From: Andrew Jones <drjones@redhat.com>
To: Haibo Xu <haibo.xu@linaro.org>
Subject: Re: [PATCH v3 03/12] target/arm/cpu: spe: Add an option to turn
 on/off vSPE support
Message-ID: <20200915061058.zl7dbgmcjh5icu74@kamzik.brq.redhat.com>
References: <cover.1600135462.git.haibo.xu@linaro.org>
 <90fec9ff0da7595f52caccf052c019d9359c8724.1600135462.git.haibo.xu@linaro.org>
MIME-Version: 1.0
In-Reply-To: <90fec9ff0da7595f52caccf052c019d9359c8724.1600135462.git.haibo.xu@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=drjones@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/15 02:11:06
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.792,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KcAdloXr6S57

On Tue, Sep 15, 2020 at 03:11:39AM +0000, Haibo Xu wrote:
> Adds a spe=[on/off] option to enable/disable vSPE support in
> guest vCPU.
> 
> Reviewed-by: Andrew Jones <drjones@redhat.com>
> Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
> ---
>  target/arm/cpu.c   |  6 ++++++
>  target/arm/cpu.h   | 13 ++++++++++++
>  target/arm/cpu64.c | 52 ++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 71 insertions(+)
> 
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index c179e0752d..f211958eaa 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1310,6 +1310,12 @@ void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
>              error_propagate(errp, local_err);
>              return;
>          }
> +
> +        arm_cpu_spe_finalize(cpu, &local_err);
> +        if (local_err != NULL) {
> +            error_propagate(errp, local_err);
> +            return;
> +        }
>      }
>  }
>  
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index a1c7d8ebae..baf2bbcee8 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -24,6 +24,7 @@
>  #include "hw/registerfields.h"
>  #include "cpu-qom.h"
>  #include "exec/cpu-defs.h"
> +#include "qapi/qapi-types-common.h"
>  
>  /* ARM processors have a weak memory model */
>  #define TCG_GUEST_DEFAULT_MO      (0)
> @@ -196,9 +197,11 @@ typedef struct {
>  #ifdef TARGET_AARCH64
>  # define ARM_MAX_VQ    16
>  void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp);
> +void arm_cpu_spe_finalize(ARMCPU *cpu, Error **errp);
>  #else
>  # define ARM_MAX_VQ    1
>  static inline void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp) { }
> +static inline void arm_cpu_spe_finalize(ARMCPU *cpu, Error **errp) { }
>  #endif
>  
>  typedef struct ARMVectorReg {
> @@ -829,6 +832,8 @@ struct ARMCPU {
>      bool has_el3;
>      /* CPU has PMU (Performance Monitor Unit) */
>      bool has_pmu;
> +    /* CPU has SPE (Statistical Profiling Extension) */
> +    OnOffAuto has_spe;
>      /* CPU has VFP */
>      bool has_vfp;
>      /* CPU has Neon */
> @@ -3869,6 +3874,14 @@ static inline bool isar_feature_aa64_pmu_8_4(const ARMISARegisters *id)
>          FIELD_EX64(id->id_aa64dfr0, ID_AA64DFR0, PMUVER) != 0xf;
>  }
>  
> +/*
> + * Currently we don't differentiate between the ARMv8.2-SPE and ARMv8.3-SPE.
> + */
> +static inline bool isar_feature_aa64_spe(const ARMISARegisters *id)
> +{
> +    return FIELD_EX64(id->id_aa64dfr0, ID_AA64DFR0, PMSVER) != 0;
> +}
> +
>  static inline bool isar_feature_aa64_rcpc_8_3(const ARMISARegisters *id)
>  {
>      return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, LRCPC) != 0;
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 3c2b3d9599..4997c4a3c0 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -572,6 +572,55 @@ void aarch64_add_sve_properties(Object *obj)
>      }
>  }
>  
> +void arm_cpu_spe_finalize(ARMCPU *cpu, Error **errp)
> +{
> +    uint64_t t;
> +    uint32_t value = 0;
> +
> +    if (cpu->has_spe == ON_OFF_AUTO_AUTO) {
> +        if (kvm_enabled() && kvm_arm_spe_supported()) {
> +            cpu->has_spe = ON_OFF_AUTO_ON;
> +        } else {
> +            cpu->has_spe = ON_OFF_AUTO_OFF;
> +        }
> +    } else if (cpu->has_spe == ON_OFF_AUTO_ON) {
> +        if (!kvm_enabled() || !kvm_arm_spe_supported()) {
> +            error_setg(errp, "'spe' cannot be enabled on this host");
> +            return;
> +        }
> +    }
> +
> +    /*
> +     * According to the ARM ARM, the ID_AA64DFR0[PMSVER] currently
> +     * support 3 values:
> +     *
> +     * 0b0000: SPE not implemented
> +     * 0b0001: ARMv8.2-SPE implemented
> +     * 0b0010: ARMv8.3-SPE implemented
> +     *
> +     * But the kernel KVM API didn't expose all these 3 values, and
> +     * we can only get whether the SPE feature is supported or not.
> +     * So here we just set the PMSVER to 1 if this feature was supported.
> +     */
> +    if (cpu->has_spe == ON_OFF_AUTO_ON) {
> +        value = 1;
> +    }
> +
> +    t = cpu->isar.id_aa64dfr0;
> +    t = FIELD_DP64(t, ID_AA64DFR0, PMSVER, value);
> +    cpu->isar.id_aa64dfr0 = t;
> +}
> +
> +static bool arm_spe_get(Object *obj, Error **errp)
> +{
> +    return ARM_CPU(obj)->has_spe != ON_OFF_AUTO_OFF;
> +}
> +
> +static void arm_spe_set(Object *obj, bool value, Error **errp)
> +{
> +    ARM_CPU(obj)->has_spe = value ? ON_OFF_AUTO_ON : ON_OFF_AUTO_OFF;
> +}
> +
>  /* -cpu max: if KVM is enabled, like -cpu host (best possible with this host);
>   * otherwise, a CPU with as many features enabled as our emulation supports.
>   * The version of '-cpu max' for qemu-system-arm is defined in cpu.c;
> @@ -721,6 +770,9 @@ static void aarch64_max_initfn(Object *obj)
>      aarch64_add_sve_properties(obj);
>      object_property_add(obj, "sve-max-vq", "uint32", cpu_max_get_sve_max_vq,
>                          cpu_max_set_sve_max_vq, NULL, NULL);
> +
> +    cpu->has_spe = ON_OFF_AUTO_AUTO;
> +    object_property_add_bool(obj, "spe", arm_spe_get, arm_spe_set);
>  }

The cover-letter says we're only providing the 'spe' property for KVM
enabled guests, but we're adding it here in the common part of the
max init function. It should be added in the kvm_enabled() part only.

Thanks,
drew

>  
>  static const ARMCPUInfo aarch64_cpus[] = {
> -- 
> 2.17.1
> 
> 

