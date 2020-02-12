Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5991247lfp;
        Tue, 11 Feb 2020 22:23:46 -0800 (PST)
X-Google-Smtp-Source: APXvYqywm0tj6EjC0HHF43Nmc8cyo2VEIjBD12pgkgt1uQrXKPDux4eZ4qTB4C+XVozOm3fe/xa+
X-Received: by 2002:a05:6214:6f0:: with SMTP id bk16mr6140201qvb.23.1581488626684;
        Tue, 11 Feb 2020 22:23:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581488626; cv=none;
        d=google.com; s=arc-20160816;
        b=Aawziiq25s25hbW5r2FJg+0MCdN+S5rcfvYmiRbA4A/vZs1fL6s1jKMGFGra05MDNG
         unri48ZbPCk/xGbBF3WSkLqqt7IgYDosLBB/usJ+7HYSVk1YpIWV+tckEpdP10D4BWW+
         G+hiQCqozGQO+XkoLyDV3zvPSzxRB5TPc6aivVdM0Amv/IAAhyJjhSlzj8JTMu8Y4gpM
         2W7UzV94pQIeBTBTZA+Ww1PYZxGG9Scy5DmH8HAfZ4EShxoQkKONwvIz6tdlYsW785Ty
         RJBnrnJop1BCdoeL+QFwnObTKzMHjU6/NE7Gbh/ME8ojw2hjmJAcN8PH/Z54GtUN212N
         v0Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=ShdSIJsVbxraNMT6Ul9zW3sWcww70w2aFAMJSWkQ6+I=;
        b=xBd543divLDiRsmtQxKTP+jk7/73XIADO5NOKXwtLf8ISbMmiqw4wR3US5AK9rhcCx
         3V8ewRl9asBM8DOSUngy2folAlRIwhMY10usrlfP/7N2X/Qwrlf9N84jQ6U2y0CaMpIk
         z99+Q0Ah3MH2H2H7hrgaCk0Zyrd7YU6SqAXnso3BfQ9xACHY0M5X5hnzcqS2Q62EngBG
         zsdxC9qy2HD+IIM915N61iPLvPaw7Z7K7w9dgVUeQ/48dHNy/Sv6FaC3bhnB33jByu2K
         gtQ947QB4E3nIsSlcSVV2LPlSBVMzSObpJP4wHXhEWmBZSOC5WJ3UINAl3oYwP1IbQGS
         2NvA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=G0eP3YMv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q57si3051219qtk.183.2020.02.11.22.23.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Feb 2020 22:23:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=G0eP3YMv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j1lR4-00073W-4p
	for alex.bennee@linaro.org; Wed, 12 Feb 2020 01:23:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46520)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j1lQv-00072I-5Z
 for qemu-arm@nongnu.org; Wed, 12 Feb 2020 01:23:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j1lQt-0004dp-Q8
 for qemu-arm@nongnu.org; Wed, 12 Feb 2020 01:23:37 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:58262
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j1lQt-0004de-N5
 for qemu-arm@nongnu.org; Wed, 12 Feb 2020 01:23:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581488615;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ShdSIJsVbxraNMT6Ul9zW3sWcww70w2aFAMJSWkQ6+I=;
 b=G0eP3YMv5o0mfKZWgUxrudkR1q0zjzW+w4h1YrQC30qTSq/fDnGuSlIuAB1RrqzCstDEZL
 bo5lbmKbRJn/TrbseSi9c9lIc6pKk4uHICF5mNYKCKVrkhLq/8C54/DKThZOTjcAtOygJO
 6JeutluseimGrkHAa+xTs4aG225c02Q=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19-f1DEHgdpPyGeGmmibHfvKQ-1; Wed, 12 Feb 2020 01:23:31 -0500
Received: by mail-wr1-f69.google.com with SMTP id m15so380504wrs.22
 for <qemu-arm@nongnu.org>; Tue, 11 Feb 2020 22:23:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KiRTYevWMHh+t30KcxR011xXTbCZDJemC6XYm/SEGJU=;
 b=CXs5cybVm1TYgJNGUx6Mhri8Phl7Yx9sdyaUwxE+goI0r+ES91Kgqotg9ue+wAKrD0
 9axcG0UnhHgJ/ugGi483g/QGFgfeiEvTNpHDbgQG9MYW7gGqkTO6W7o485cN7MZM+ocd
 Bmmq5tJljdEA9X9V/az6ftDCwSh7nB6aKWN9N77d31tXuA2WoWPs3fqwa/JmMDhQfrgh
 LGIoSDatxx/zeiImY0W8B3MK7XIMuyYRUPsQmx6VDVJGWi1JR+7egrpWaXIXZPKx1CC+
 furSSpc+8eMRF6rcHn4cP98+KPrkKNei2IzFyvgCb+4e0ELrVxV57ciZUpqTIl9l3mO/
 pjUw==
X-Gm-Message-State: APjAAAVT77+c98AnhZgBN10ugGRJwIKYZv17+L0ZYaQ1+SGMkdfbLDk2
 mreP9s9cpwuH3KPRW0VSXZSobCOAmVyYIjEdwC8OzCbDw0YroaE/RnQWdFOyaMF7OeBtcfAhxXP
 ZUq1VEHBpukRe
X-Received: by 2002:a5d:5704:: with SMTP id a4mr14107831wrv.198.1581488610250; 
 Tue, 11 Feb 2020 22:23:30 -0800 (PST)
X-Received: by 2002:a5d:5704:: with SMTP id a4mr14107800wrv.198.1581488609886; 
 Tue, 11 Feb 2020 22:23:29 -0800 (PST)
Received: from [192.168.1.35] (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id m21sm6769353wmi.27.2020.02.11.22.23.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Feb 2020 22:23:29 -0800 (PST)
Subject: Re: [PATCH 01/13] target/arm: Add _aa32_ to isar_feature functions
 testing 32-bit ID registers
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200211173726.22541-1-peter.maydell@linaro.org>
 <20200211173726.22541-2-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <79afba27-ee35-a393-1dfa-38ede89af728@redhat.com>
Date: Wed, 12 Feb 2020 07:23:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200211173726.22541-2-peter.maydell@linaro.org>
Content-Language: en-US
X-MC-Unique: f1DEHgdpPyGeGmmibHfvKQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
X-TUID: tpERXcp7EW2U

On 2/11/20 6:37 PM, Peter Maydell wrote:
> Enforce a convention that an isar_feature function that tests a
> 32-bit ID register always has _aa32_ in its name, and one that
> tests a 64-bit ID register always has _aa64_ in its name.
> We already follow this except for three cases: thumb_div,
> arm_div and jazelle, which all need _aa32_ adding.
>=20
> (As noted in the comment, isar_feature_aa32_fp16_arith()
> is an exception in that it currently tests ID_AA64PFR0_EL1,
> but will switch to MVFR1 once we've properly implemented
> FP16 for AArch32.)
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

> ---
>   target/arm/cpu.h       | 13 ++++++++++---
>   linux-user/elfload.c   |  4 ++--
>   target/arm/cpu.c       |  6 ++++--
>   target/arm/helper.c    |  2 +-
>   target/arm/translate.c |  6 +++---
>   5 files changed, 20 insertions(+), 11 deletions(-)
>=20
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 608fcbd0b75..ad2f0e172a7 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -3396,20 +3396,27 @@ static inline uint64_t *aa64_vfp_qreg(CPUARMState=
 *env, unsigned regno)
>   /* Shared between translate-sve.c and sve_helper.c.  */
>   extern const uint64_t pred_esz_masks[4];
>  =20
> +/*
> + * Naming convention for isar_feature functions:
> + * Functions which test 32-bit ID registers should have _aa32_ in
> + * their name. Functions which test 64-bit ID registers should have
> + * _aa64_ in their name.
> + */
> +
>   /*
>    * 32-bit feature tests via id registers.
>    */
> -static inline bool isar_feature_thumb_div(const ARMISARegisters *id)
> +static inline bool isar_feature_aa32_thumb_div(const ARMISARegisters *id=
)
>   {
>       return FIELD_EX32(id->id_isar0, ID_ISAR0, DIVIDE) !=3D 0;
>   }
>  =20
> -static inline bool isar_feature_arm_div(const ARMISARegisters *id)
> +static inline bool isar_feature_aa32_arm_div(const ARMISARegisters *id)
>   {
>       return FIELD_EX32(id->id_isar0, ID_ISAR0, DIVIDE) > 1;
>   }
>  =20
> -static inline bool isar_feature_jazelle(const ARMISARegisters *id)
> +static inline bool isar_feature_aa32_jazelle(const ARMISARegisters *id)
>   {
>       return FIELD_EX32(id->id_isar1, ID_ISAR1, JAZELLE) !=3D 0;
>   }
> diff --git a/linux-user/elfload.c b/linux-user/elfload.c
> index f3080a16358..b1a895f24ce 100644
> --- a/linux-user/elfload.c
> +++ b/linux-user/elfload.c
> @@ -475,8 +475,8 @@ static uint32_t get_elf_hwcap(void)
>       GET_FEATURE(ARM_FEATURE_VFP3, ARM_HWCAP_ARM_VFPv3);
>       GET_FEATURE(ARM_FEATURE_V6K, ARM_HWCAP_ARM_TLS);
>       GET_FEATURE(ARM_FEATURE_VFP4, ARM_HWCAP_ARM_VFPv4);
> -    GET_FEATURE_ID(arm_div, ARM_HWCAP_ARM_IDIVA);
> -    GET_FEATURE_ID(thumb_div, ARM_HWCAP_ARM_IDIVT);
> +    GET_FEATURE_ID(aa32_arm_div, ARM_HWCAP_ARM_IDIVA);
> +    GET_FEATURE_ID(aa32_thumb_div, ARM_HWCAP_ARM_IDIVT);
>       /* All QEMU's VFPv3 CPUs have 32 registers, see VFP_DREG in transla=
te.c.
>        * Note that the ARM_HWCAP_ARM_VFPv3D16 bit is always the inverse o=
f
>        * ARM_HWCAP_ARM_VFPD32 (and so always clear for QEMU); it is unrel=
ated
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index f86e71a260d..5712082c0b9 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1470,7 +1470,8 @@ static void arm_cpu_realizefn(DeviceState *dev, Err=
or **errp)
>            * Presence of EL2 itself is ARM_FEATURE_EL2, and of the
>            * Security Extensions is ARM_FEATURE_EL3.
>            */
> -        assert(!tcg_enabled() || no_aa32 || cpu_isar_feature(arm_div, cp=
u));
> +        assert(!tcg_enabled() || no_aa32 ||
> +               cpu_isar_feature(aa32_arm_div, cpu));
>           set_feature(env, ARM_FEATURE_LPAE);
>           set_feature(env, ARM_FEATURE_V7);
>       }
> @@ -1496,7 +1497,8 @@ static void arm_cpu_realizefn(DeviceState *dev, Err=
or **errp)
>       if (arm_feature(env, ARM_FEATURE_V6)) {
>           set_feature(env, ARM_FEATURE_V5);
>           if (!arm_feature(env, ARM_FEATURE_M)) {
> -            assert(!tcg_enabled() || no_aa32 || cpu_isar_feature(jazelle=
, cpu));
> +            assert(!tcg_enabled() || no_aa32 ||
> +                   cpu_isar_feature(aa32_jazelle, cpu));
>               set_feature(env, ARM_FEATURE_AUXCR);
>           }
>       }
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 19a57a17da5..ddfd0183d98 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -6781,7 +6781,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>       if (arm_feature(env, ARM_FEATURE_LPAE)) {
>           define_arm_cp_regs(cpu, lpae_cp_reginfo);
>       }
> -    if (cpu_isar_feature(jazelle, cpu)) {
> +    if (cpu_isar_feature(aa32_jazelle, cpu)) {
>           define_arm_cp_regs(cpu, jazelle_regs);
>       }
>       /* Slightly awkwardly, the OMAP and StrongARM cores need all of
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index 2f4aea927f1..052992037cc 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -42,7 +42,7 @@
>   #define ENABLE_ARCH_5     arm_dc_feature(s, ARM_FEATURE_V5)
>   /* currently all emulated v5 cores are also v5TE, so don't bother */
>   #define ENABLE_ARCH_5TE   arm_dc_feature(s, ARM_FEATURE_V5)
> -#define ENABLE_ARCH_5J    dc_isar_feature(jazelle, s)
> +#define ENABLE_ARCH_5J    dc_isar_feature(aa32_jazelle, s)
>   #define ENABLE_ARCH_6     arm_dc_feature(s, ARM_FEATURE_V6)
>   #define ENABLE_ARCH_6K    arm_dc_feature(s, ARM_FEATURE_V6K)
>   #define ENABLE_ARCH_6T2   arm_dc_feature(s, ARM_FEATURE_THUMB2)
> @@ -9850,8 +9850,8 @@ static bool op_div(DisasContext *s, arg_rrr *a, boo=
l u)
>       TCGv_i32 t1, t2;
>  =20
>       if (s->thumb
> -        ? !dc_isar_feature(thumb_div, s)
> -        : !dc_isar_feature(arm_div, s)) {
> +        ? !dc_isar_feature(aa32_thumb_div, s)
> +        : !dc_isar_feature(aa32_arm_div, s)) {
>           return false;
>       }
>  =20
>=20

