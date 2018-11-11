Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp2515468wrw;
        Sun, 11 Nov 2018 15:45:05 -0800 (PST)
X-Google-Smtp-Source: AJdET5fSn8KwHfRc1PqA/m2HQSvPEkwgLdkw4cs4rZokDw9cv7R5CVk2cW9SKerzMB0JEO1rCs7X
X-Received: by 2002:a37:1b46:: with SMTP id b67mr16598361qkb.144.1541979905386;
        Sun, 11 Nov 2018 15:45:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541979905; cv=none;
        d=google.com; s=arc-20160816;
        b=TjKqvr2osViPF5Q8Sb8hLubkS5/uE0vcxny3sXaxCRErfZYtGj5IQrjlc7pE/e5+Mv
         MrlM5bzdnkGPBXSuhyuGHiIqeVL8Zo2gHS+wBYuC8Qt/kqMyuRG86gSJuB+1uKWtI9B8
         LRI0KNIL15nZNivjZcnZn6uDIUuJ3ymaVv0QAPdyrOZI6EtiCQj8pqsZh+AgbO6/UYcy
         5GbRxNfz1j6XS1ZQ5UGxzY8mDLG/Ejgn9j0RmK+k32aez2bKQghT5Fjli08YJPp12gCB
         ZG2FIUV4NP1E/fPweHgrmG4UePE9N1sD8/N3E4PAZlYQ5uz/rsHHTmLw/LPvB1jKj115
         TRjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version;
        bh=qMmyzGZRSxg1jUqcSPjjmElk2UehQpHuKFDnp6l9D54=;
        b=tXa3yZAH0xoTkPEJegg8K/Ig75RAcDa1nLZ9IRwAJ8bu+9oe/uoXszn8uAOvBSZrGH
         lvibeQnvV/khtVz5zDujMx2o39N1gS7r1GeNkcCFhbo5B+J3m6AUqzSbG2S5ToSttf3/
         rmBtwIYsuaMThAbWYQNfZQxFVj9oT88iv0IH+8TKhiMQkkp7zV422o253M0yUlf5iVZZ
         e3g29jZ18A/S2bHUm/WT9aR1ZDcFEOZudprt5dPQr0Q1Jy7797JGAvWeMSzdna4QPOpc
         m99cQv/LqvdX52ogl31z0JyU98OnfkVa1Kgk9jyussOY8Dpwrdfy4tJe+CMRUpKDdUxv
         myxg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r42si8858861qta.300.2018.11.11.15.45.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 11 Nov 2018 15:45:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44049 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gLzPc-0004pX-Rs
	for alex.bennee@linaro.org; Sun, 11 Nov 2018 18:45:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55235)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1gLzPE-0004oX-UE
	for qemu-devel@nongnu.org; Sun, 11 Nov 2018 18:44:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1gLzP8-0005gP-Mh
	for qemu-devel@nongnu.org; Sun, 11 Nov 2018 18:44:40 -0500
Received: from mail-yw1-f68.google.com ([209.85.161.68]:46928)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1gLzP7-0005dp-Tk; Sun, 11 Nov 2018 18:44:34 -0500
Received: by mail-yw1-f68.google.com with SMTP id v5-v6so3679221ywa.13;
	Sun, 11 Nov 2018 15:44:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=qMmyzGZRSxg1jUqcSPjjmElk2UehQpHuKFDnp6l9D54=;
	b=ipEjWWCe5jcUklDLZoI6djUUvHhjr9GehQ103Qw3WFb1qjWqKL+uIYO0nZBGpjQv+F
	LEchB8Mfu/mcWiRuBNu2bfJRUSApUm1gHjZg0j7sLXD5h0Qy5UI3Uwk1D2MNipOnGoHI
	K0vpI1IZFGfEzqx4cd17G6YxgwfRWhnEMOi3cD86eTa8nQBwPBvVQnHAoB/oMcvJoQiY
	BY2t6h7AUYaMk7dgcG5aoaPVwcOq75pmAwfVaoaveKW6Z1yzt7cWwNqOxutU6vOFACY2
	0qBt155tdmKn7Qzfell/MqUO5YqR51/hA26Kzce6Yt47nVMvkjMrtv9rO90rdnoPDZ2r
	80DA==
X-Gm-Message-State: AGRZ1gI/dqKLYeXootTX39LWFeQ2g9SXnW3V04ZG7iNPDdAdyFS4KSvh
	mHFIe4fcKGLtSPcQMPjumcxIP/OBhLi/E6B7Dxs=
X-Received: by 2002:a0d:e541:: with SMTP id
	o62-v6mr16803947ywe.381.1541979863812; 
	Sun, 11 Nov 2018 15:44:23 -0800 (PST)
MIME-Version: 1.0
References: <20181108175246.13416-1-richard.henderson@linaro.org>
	<20181108175246.13416-6-richard.henderson@linaro.org>
In-Reply-To: <20181108175246.13416-6-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Mon, 12 Nov 2018 00:44:12 +0100
Message-ID: <CAAdtpL4xjCphH_1hz7s5Wb5jTSra1FN3UfkN7jp5MqSytoGkLA@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.161.68
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH v3 5/5] target/arm: Convert
 t32ee from feature bit to isar3 test
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bAfnQpGd14UW

On Thu, Nov 8, 2018 at 7:02 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

> ---
>  target/arm/cpu.h     | 6 +++++-
>  linux-user/elfload.c | 2 +-
>  target/arm/cpu.c     | 4 ----
>  target/arm/helper.c  | 2 +-
>  target/arm/kvm32.c   | 3 ---
>  target/arm/machine.c | 3 +--
>  6 files changed, 8 insertions(+), 12 deletions(-)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index b5eff79f73..5c2c77c31d 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -1575,7 +1575,6 @@ enum arm_features {
>      ARM_FEATURE_NEON,
>      ARM_FEATURE_M, /* Microcontroller profile.  */
>      ARM_FEATURE_OMAPCP, /* OMAP specific CP15 ops handling.  */
> -    ARM_FEATURE_THUMB2EE,
>      ARM_FEATURE_V7MP,    /* v7 Multiprocessing Extensions */
>      ARM_FEATURE_V7VE, /* v7 Virtualization Extensions (non-EL2 parts) */
>      ARM_FEATURE_V4T,
> @@ -3172,6 +3171,11 @@ static inline bool isar_feature_jazelle(const ARMI=
SARegisters *id)
>      return FIELD_EX32(id->id_isar1, ID_ISAR1, JAZELLE) !=3D 0;
>  }
>
> +static inline bool isar_feature_t32ee(const ARMISARegisters *id)
> +{
> +    return FIELD_EX32(id->id_isar3, ID_ISAR3, T32EE) !=3D 0;
> +}
> +
>  static inline bool isar_feature_aa32_aes(const ARMISARegisters *id)
>  {
>      return FIELD_EX32(id->id_isar5, ID_ISAR5, AES) !=3D 0;
> diff --git a/linux-user/elfload.c b/linux-user/elfload.c
> index 5bccd2e243..a3503c83c9 100644
> --- a/linux-user/elfload.c
> +++ b/linux-user/elfload.c
> @@ -466,7 +466,7 @@ static uint32_t get_elf_hwcap(void)
>      GET_FEATURE(ARM_FEATURE_V5, ARM_HWCAP_ARM_EDSP);
>      GET_FEATURE(ARM_FEATURE_VFP, ARM_HWCAP_ARM_VFP);
>      GET_FEATURE(ARM_FEATURE_IWMMXT, ARM_HWCAP_ARM_IWMMXT);
> -    GET_FEATURE(ARM_FEATURE_THUMB2EE, ARM_HWCAP_ARM_THUMBEE);
> +    GET_FEATURE_ID(t32ee, ARM_HWCAP_ARM_THUMBEE);
>      GET_FEATURE(ARM_FEATURE_NEON, ARM_HWCAP_ARM_NEON);
>      GET_FEATURE(ARM_FEATURE_VFP3, ARM_HWCAP_ARM_VFPv3);
>      GET_FEATURE(ARM_FEATURE_V6K, ARM_HWCAP_ARM_TLS);
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 784a4c2dfc..d4dc0bc225 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1451,7 +1451,6 @@ static void cortex_a8_initfn(Object *obj)
>      set_feature(&cpu->env, ARM_FEATURE_V7);
>      set_feature(&cpu->env, ARM_FEATURE_VFP3);
>      set_feature(&cpu->env, ARM_FEATURE_NEON);
> -    set_feature(&cpu->env, ARM_FEATURE_THUMB2EE);
>      set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
>      set_feature(&cpu->env, ARM_FEATURE_EL3);
>      cpu->midr =3D 0x410fc080;
> @@ -1520,7 +1519,6 @@ static void cortex_a9_initfn(Object *obj)
>      set_feature(&cpu->env, ARM_FEATURE_VFP3);
>      set_feature(&cpu->env, ARM_FEATURE_VFP_FP16);
>      set_feature(&cpu->env, ARM_FEATURE_NEON);
> -    set_feature(&cpu->env, ARM_FEATURE_THUMB2EE);
>      set_feature(&cpu->env, ARM_FEATURE_EL3);
>      /* Note that A9 supports the MP extensions even for
>       * A9UP and single-core A9MP (which are both different
> @@ -1583,7 +1581,6 @@ static void cortex_a7_initfn(Object *obj)
>      set_feature(&cpu->env, ARM_FEATURE_V7VE);
>      set_feature(&cpu->env, ARM_FEATURE_VFP4);
>      set_feature(&cpu->env, ARM_FEATURE_NEON);
> -    set_feature(&cpu->env, ARM_FEATURE_THUMB2EE);
>      set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
>      set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
>      set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
> @@ -1629,7 +1626,6 @@ static void cortex_a15_initfn(Object *obj)
>      set_feature(&cpu->env, ARM_FEATURE_V7VE);
>      set_feature(&cpu->env, ARM_FEATURE_VFP4);
>      set_feature(&cpu->env, ARM_FEATURE_NEON);
> -    set_feature(&cpu->env, ARM_FEATURE_THUMB2EE);
>      set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
>      set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
>      set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 96301930cc..e28770833a 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -5457,7 +5457,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>          define_arm_cp_regs(cpu, vmsa_pmsa_cp_reginfo);
>          define_arm_cp_regs(cpu, vmsa_cp_reginfo);
>      }
> -    if (arm_feature(env, ARM_FEATURE_THUMB2EE)) {
> +    if (cpu_isar_feature(t32ee, cpu)) {
>          define_arm_cp_regs(cpu, t2ee_cp_reginfo);
>      }
>      if (arm_feature(env, ARM_FEATURE_GENERIC_TIMER)) {
> diff --git a/target/arm/kvm32.c b/target/arm/kvm32.c
> index 9ededa3c73..8b2c9b3075 100644
> --- a/target/arm/kvm32.c
> +++ b/target/arm/kvm32.c
> @@ -115,9 +115,6 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures=
 *ahcf)
>      set_feature(&features, ARM_FEATURE_VFP3);
>      set_feature(&features, ARM_FEATURE_GENERIC_TIMER);
>
> -    if (extract32(id_pfr0, 12, 4) =3D=3D 1) {
> -        set_feature(&features, ARM_FEATURE_THUMB2EE);
> -    }
>      if (extract32(ahcf->isar.mvfr1, 20, 4) =3D=3D 1) {
>          set_feature(&features, ARM_FEATURE_VFP_FP16);
>      }
> diff --git a/target/arm/machine.c b/target/arm/machine.c
> index 239fe4e84d..07f904709a 100644
> --- a/target/arm/machine.c
> +++ b/target/arm/machine.c
> @@ -321,9 +321,8 @@ static const VMStateDescription vmstate_m =3D {
>  static bool thumb2ee_needed(void *opaque)
>  {
>      ARMCPU *cpu =3D opaque;
> -    CPUARMState *env =3D &cpu->env;
>
> -    return arm_feature(env, ARM_FEATURE_THUMB2EE);
> +    return cpu_isar_feature(t32ee, cpu);
>  }
>
>  static const VMStateDescription vmstate_thumb2ee =3D {
> --
> 2.17.2
>
>
