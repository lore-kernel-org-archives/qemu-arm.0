Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp6016965lfp;
        Tue, 11 Feb 2020 22:56:35 -0800 (PST)
X-Google-Smtp-Source: APXvYqyIQgBPMaMa7XqbKI6vu5djrb+2dJ+0/Z8PW/yxbGPI7EBrDW8SfRH3sSh22UppDNx27kc3
X-Received: by 2002:aed:2be4:: with SMTP id e91mr18693651qtd.148.1581490595333;
        Tue, 11 Feb 2020 22:56:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581490595; cv=none;
        d=google.com; s=arc-20160816;
        b=MohTOGN6XjT4V7NBctdNyRnmwhOxIoKNZOgZgANMVBcGrxZO8sQPrwEpnNlEDnzu3o
         oFxjUhunACiW1cNKdrvUqOst7aEyHtlLurFb+1LIyIe6Gg9JGvt9CvHF93Nxxl3uxSwx
         6nldr03gbZ9UVeaFVO3WE7N61R3XiLcmKf37AdIkEB+YV38iy6iEIaR2VgW8jPYc/3kj
         IfTfyVmR9BzWIGw2iGBhKraPY8AQNmgEreXUtxNs8SPAcySe62cJbTLU0cJTFmKiPptx
         qKXeCAFGezzEExprxHOOZk08H72hSMhXPgf2vzuRBBtqbRper4MH+Q3mYzQzOkapdvXA
         5bTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=emBLU9zfR6wvubBsXvLZCTLmJWD4AYoymoktpSgcDJI=;
        b=X6ZlroqrokECRJ38Nld35GmIB+8TqH9hVeaOUY1L2lo5ugWoqJDZ6pqrXvyZIYl3/8
         +WRuT92PB1TP3XO5AeQQdQeGS+eclxAebXXzImvoZkgNb7bkKyQliLson1xQgB/LcGxY
         yuF6gRp4o5X7IGTg5DIjg1iETzDwG5oyaG1zX3bn1mR+qH2rf+VOnZUEcxVLvVumtOj1
         Txo9i4k5egpPWNWSZ2Z9n+vpFA86YwxsdHTuxCjtjlbjmVpApJpV3ezYfgrQL3wOVBTK
         tB/EBP3x7JhjhCyc2o0FQ83ToxeeLWMcyADMlBUCr5s3U85eAKzrfdOx6RAZ/NfVVYXz
         kBCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=W4lwN4wx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e5si3167610qvy.97.2020.02.11.22.56.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Feb 2020 22:56:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=W4lwN4wx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j1lwo-0005pF-OT
	for alex.bennee@linaro.org; Wed, 12 Feb 2020 01:56:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50698)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j1lwe-0005mb-Qo
 for qemu-arm@nongnu.org; Wed, 12 Feb 2020 01:56:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j1lwc-0005hT-PD
 for qemu-arm@nongnu.org; Wed, 12 Feb 2020 01:56:24 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:34043
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j1lwc-0005g9-LS
 for qemu-arm@nongnu.org; Wed, 12 Feb 2020 01:56:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581490581;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=emBLU9zfR6wvubBsXvLZCTLmJWD4AYoymoktpSgcDJI=;
 b=W4lwN4wxF1Eq4zTsRxSE7h7x/lIjxneNzniGf5pEvJyco309i/lF3/C5sU4FBKZdvjPvGz
 O7YElWTG+sfsP76/lZb1dFliJmQqGfv3TQ7A8SwwztbtBjhU6S3lRrC6W9dKJYBjq7CkAE
 jjDXrGOPIbeP2+VCVN6eFXuVWOyM05c=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-317-Es2RzCjtMKi0XvrDJ6GM4Q-1; Wed, 12 Feb 2020 01:56:19 -0500
Received: by mail-wr1-f69.google.com with SMTP id s13so426300wru.7
 for <qemu-arm@nongnu.org>; Tue, 11 Feb 2020 22:56:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+vc/IPVngR7+dVJrNaz1Qwoc+ViRrmQ+T3F453ChKZY=;
 b=YTy/oDiG2GqIsdissGe+pSnwpF9LpafKBi94uS8Srnqaffz43u9gwivig89jm2jqwI
 7k6EgX5aNK7rHXe8CwsTgTo1no0YA1FWEcwL/QduBoAa+jtopKoM1ytrszavkjG6FMYz
 2pD4ep8bqqp8n9gpPboFJB4DEnIsXr/1y99nqCVsJoKMfhbVTanhwYSsvkAO2HJSdChR
 IakC3KvuNiOAzVsCUtT+f6wD2qbtjDPl0vCRPQjFJcmitKEGp6ZJVwSnKIws/Kxi1Mh3
 MlqtNav5rKV/bmIhTLGkAsRQNEJFqxtLXRUvsWecPStAvS6tFqwi64DtFqPcnytjwGzI
 Xz+Q==
X-Gm-Message-State: APjAAAUacE2A1/Av42ACdLc8yFU2jhc5c/MVhd/pkEGH/o/Os+bSTfz1
 vMa3NZ/QDUtFH4Xu6/Djmyt2TfKC+IiWu5SnSfV3VqLPbZyItZfwntr0XjqvAz+8ETQZXdPtnX4
 Q/q+YlZ1NCGx/
X-Received: by 2002:a1c:1b4d:: with SMTP id b74mr10993915wmb.33.1581490578284; 
 Tue, 11 Feb 2020 22:56:18 -0800 (PST)
X-Received: by 2002:a1c:1b4d:: with SMTP id b74mr10993873wmb.33.1581490577879; 
 Tue, 11 Feb 2020 22:56:17 -0800 (PST)
Received: from [192.168.1.35] (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id j65sm2175105wmb.21.2020.02.11.22.56.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Feb 2020 22:56:17 -0800 (PST)
Subject: Re: [PATCH 08/13] target/arm: Add _aa64_ and _any_ versions of
 pmu_8_1 isar checks
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200211173726.22541-1-peter.maydell@linaro.org>
 <20200211173726.22541-9-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <89172af7-49e5-156d-4ca6-566417039c4e@redhat.com>
Date: Wed, 12 Feb 2020 07:56:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200211173726.22541-9-peter.maydell@linaro.org>
Content-Language: en-US
X-MC-Unique: Es2RzCjtMKi0XvrDJ6GM4Q-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Eric Auger <eric.auger@redhat.com>,
 Aaron Lindsay <aaron@os.amperecomputing.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QKEHx0Zr/76z

On 2/11/20 6:37 PM, Peter Maydell wrote:
> Add the 64-bit version of the "is this a v8.1 PMUv3?"
> ID register check function, and the _any_ version that
> checks for either AArch32 or AArch64 support. We'll use
> this in a later commit.
>=20
> We don't (yet) do any isar_feature checks on ID_AA64DFR1_EL1,
> but we move id_aa64dfr1 into the ARMISARegisters struct with
> id_aa64dfr0, for consistency.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/cpu.h    | 15 +++++++++++++--
>   target/arm/cpu.c    |  3 ++-
>   target/arm/cpu64.c  |  6 +++---
>   target/arm/helper.c | 12 +++++++-----
>   4 files changed, 25 insertions(+), 11 deletions(-)
>=20
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index b55f6c8b7d3..2b3124fd76b 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -871,6 +871,8 @@ struct ARMCPU {
>           uint64_t id_aa64pfr1;
>           uint64_t id_aa64mmfr0;
>           uint64_t id_aa64mmfr1;
> +        uint64_t id_aa64dfr0;
> +        uint64_t id_aa64dfr1;
>       } isar;
>       uint32_t midr;
>       uint32_t revidr;
> @@ -887,8 +889,6 @@ struct ARMCPU {
>       uint32_t id_mmfr2;
>       uint32_t id_mmfr3;
>       uint32_t id_mmfr4;
> -    uint64_t id_aa64dfr0;
> -    uint64_t id_aa64dfr1;
>       uint64_t id_aa64afr0;
>       uint64_t id_aa64afr1;
>       uint32_t dbgdidr;
> @@ -3728,6 +3728,12 @@ static inline bool isar_feature_aa64_bti(const ARM=
ISARegisters *id)
>       return FIELD_EX64(id->id_aa64pfr1, ID_AA64PFR1, BT) !=3D 0;
>   }
>  =20
> +static inline bool isar_feature_aa64_pmu_8_1(const ARMISARegisters *id)
> +{
> +    return FIELD_EX32(id->id_aa64dfr0, ID_AA64DFR0, PMUVER) >=3D 4 &&
> +        FIELD_EX32(id->id_aa64dfr0, ID_AA64DFR0, PMUVER) !=3D 0xf;

FIELD_EX64()

> +}
> +
>   /*
>    * Feature tests for "does this exist in either 32-bit or 64-bit?"
>    */
> @@ -3741,6 +3747,11 @@ static inline bool isar_feature_any_predinv(const =
ARMISARegisters *id)
>       return isar_feature_aa64_predinv(id) || isar_feature_aa32_predinv(i=
d);
>   }
>  =20
> +static inline bool isar_feature_any_pmu_8_1(const ARMISARegisters *id)
> +{
> +    return isar_feature_aa64_pmu_8_1(id) || isar_feature_aa32_pmu_8_1(id=
);
> +}
> +
>   /*
>    * Forward to the above feature tests given an ARMCPU pointer.
>    */

I'm not sure why, I can't apply this patch locally, but this might be a=20
problem with my smtp setup (I am having some mails oddly re-encoded).

Applying: target/arm: Add _aa64_ and _any_ versions of pmu_8_1 isar checks
error: patch failed: target/arm/cpu.h:3741
error: target/arm/cpu.h: patch does not apply
Patch failed at 0008 target/arm: Add _aa64_ and _any_ versions of=20
pmu_8_1 isar checks

> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index ac0c96322d1..df44df1a43a 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1602,7 +1602,8 @@ static void arm_cpu_realizefn(DeviceState *dev, Err=
or **errp)
>                   cpu);
>   #endif
>       } else {
> -        cpu->id_aa64dfr0 =3D FIELD_DP32(cpu->id_aa64dfr0, ID_AA64DFR0, P=
MUVER, 0);
> +        cpu->isar.id_aa64dfr0 =3D
> +            FIELD_DP32(cpu->isar.id_aa64dfr0, ID_AA64DFR0, PMUVER, 0);

FIELD_EX64()

>           cpu->isar.id_dfr0 =3D FIELD_DP32(cpu->isar.id_dfr0, ID_DFR0, PE=
RFMON, 0);
>           cpu->pmceid0 =3D 0;
>           cpu->pmceid1 =3D 0;
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index f8fda7e0988..4b4b134ef84 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -135,7 +135,7 @@ static void aarch64_a57_initfn(Object *obj)
>       cpu->isar.id_isar5 =3D 0x00011121;
>       cpu->isar.id_isar6 =3D 0;
>       cpu->isar.id_aa64pfr0 =3D 0x00002222;
> -    cpu->id_aa64dfr0 =3D 0x10305106;
> +    cpu->isar.id_aa64dfr0 =3D 0x10305106;
>       cpu->isar.id_aa64isar0 =3D 0x00011120;
>       cpu->isar.id_aa64mmfr0 =3D 0x00001124;
>       cpu->dbgdidr =3D 0x3516d000;
> @@ -189,7 +189,7 @@ static void aarch64_a53_initfn(Object *obj)
>       cpu->isar.id_isar5 =3D 0x00011121;
>       cpu->isar.id_isar6 =3D 0;
>       cpu->isar.id_aa64pfr0 =3D 0x00002222;
> -    cpu->id_aa64dfr0 =3D 0x10305106;
> +    cpu->isar.id_aa64dfr0 =3D 0x10305106;
>       cpu->isar.id_aa64isar0 =3D 0x00011120;
>       cpu->isar.id_aa64mmfr0 =3D 0x00001122; /* 40 bit physical addr */
>       cpu->dbgdidr =3D 0x3516d000;
> @@ -241,7 +241,7 @@ static void aarch64_a72_initfn(Object *obj)
>       cpu->isar.id_isar4 =3D 0x00011142;
>       cpu->isar.id_isar5 =3D 0x00011121;
>       cpu->isar.id_aa64pfr0 =3D 0x00002222;
> -    cpu->id_aa64dfr0 =3D 0x10305106;
> +    cpu->isar.id_aa64dfr0 =3D 0x10305106;
>       cpu->isar.id_aa64isar0 =3D 0x00011120;
>       cpu->isar.id_aa64mmfr0 =3D 0x00001124;
>       cpu->dbgdidr =3D 0x3516d000;
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index ca0bf3402ca..9537785104e 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -25,6 +25,7 @@
>   #include "hw/semihosting/semihost.h"
>   #include "sysemu/cpus.h"
>   #include "sysemu/kvm.h"
> +#include "sysemu/tcg.h"
>   #include "qemu/range.h"
>   #include "qapi/qapi-commands-machine-target.h"
>   #include "qapi/error.h"
> @@ -5771,9 +5772,10 @@ static void define_debug_regs(ARMCPU *cpu)
>        * check that if they both exist then they agree.
>        */
>       if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
> -        assert(FIELD_EX32(cpu->id_aa64dfr0, ID_AA64DFR0, BRPS) =3D=3D br=
ps);
> -        assert(FIELD_EX32(cpu->id_aa64dfr0, ID_AA64DFR0, WRPS) =3D=3D wr=
ps);
> -        assert(FIELD_EX32(cpu->id_aa64dfr0, ID_AA64DFR0, CTX_CMPS) =3D=
=3D ctx_cmps);
> +        assert(FIELD_EX32(cpu->isar.id_aa64dfr0, ID_AA64DFR0, BRPS) =3D=
=3D brps);
> +        assert(FIELD_EX32(cpu->isar.id_aa64dfr0, ID_AA64DFR0, WRPS) =3D=
=3D wrps);
> +        assert(FIELD_EX32(cpu->isar.id_aa64dfr0, ID_AA64DFR0, CTX_CMPS)
> +               =3D=3D ctx_cmps);

FIELD_EX64()

>       }
>  =20
>       define_one_arm_cp_reg(cpu, &dbgdidr);
> @@ -6395,12 +6397,12 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>                 .opc0 =3D 3, .opc1 =3D 0, .crn =3D 0, .crm =3D 5, .opc2 =
=3D 0,
>                 .access =3D PL1_R, .type =3D ARM_CP_CONST,
>                 .accessfn =3D access_aa64_tid3,
> -              .resetvalue =3D cpu->id_aa64dfr0 },
> +              .resetvalue =3D cpu->isar.id_aa64dfr0 },
>               { .name =3D "ID_AA64DFR1_EL1", .state =3D ARM_CP_STATE_AA64=
,
>                 .opc0 =3D 3, .opc1 =3D 0, .crn =3D 0, .crm =3D 5, .opc2 =
=3D 1,
>                 .access =3D PL1_R, .type =3D ARM_CP_CONST,
>                 .accessfn =3D access_aa64_tid3,
> -              .resetvalue =3D cpu->id_aa64dfr1 },
> +              .resetvalue =3D cpu->isar.id_aa64dfr1 },
>               { .name =3D "ID_AA64DFR2_EL1_RESERVED", .state =3D ARM_CP_S=
TATE_AA64,
>                 .opc0 =3D 3, .opc1 =3D 0, .crn =3D 0, .crm =3D 5, .opc2 =
=3D 2,
>                 .access =3D PL1_R, .type =3D ARM_CP_CONST,
>=20

Using 64bit macros:
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

