Received: by 10.223.172.38 with SMTP id v35csp1974684wrc;
        Tue, 5 Sep 2017 16:03:19 -0700 (PDT)
X-Received: by 10.200.25.246 with SMTP id s51mr986735qtk.70.1504652599822;
        Tue, 05 Sep 2017 16:03:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504652599; cv=none;
        d=google.com; s=arc-20160816;
        b=jsNJ19Hv5QXxjTObOEhcEr5U+50hQaiSOOiDz+9Rd/5k9wKps02B988Lk24Zu4JNHP
         p9RNe0+PNMw0iNPvwMJxpTo3pSoMKST0am3TlYlszwKE+uGtcbCrkbauWE1wMwyzt9bg
         ll6A3WuBy9n0nuDseqW4UvSoPjkJzHlC2oKTDrvCay/3iUJJIIhB0pqBhp2goWCwchyp
         SLOh0rLfvk+ezkiT6xnTV/1wg/CBELajxrNUVGGh6omZolJ5W7UFNuWPmOV7F4m3MMW/
         rTl/TXmvaCN+Hnbohua01ujOK+0oCQKXp7qqLZud2CD0HZDWCf2J//EU2bjW/zrvgeMl
         9gcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=mt1bDjYwYRT9TdAIaM54Mz+k9+aXeBXyrlQI1spVBF8=;
        b=nV39lZdLw5yLJfAQhB4VYp/qLR9I91Uqpgi6R5umlnS63++RbZyiFI1vrj8IWL8cfd
         l9UrWiNCg8ipfiMXxpcS/PkQK2loNwdy3TaMkuA2y7Wrp8n9CH8jDSv4ocod5YEa5DbU
         9+XTaOR0nJ+Ds/ZHfNgNMAe9Me6aaWX/Xv8I9GCc/IlmgjRKSpqOeApw6jh2TTmQLoqg
         qKJ+kJsGkx7tzqZHCqxEZBGeKg/bZdQlT4K0R9TYYQHsNVe2wVMHbv5+AKIS/+GiBxeK
         b/KKKSPsifhM/bFpqx+jFvU68Dk569PXhwY9d+ZmjjftzZomGrYRQzqTtxSfjH0Qc3bz
         NWnw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=qVcztI2d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t22si1392990qte.536.2017.09.05.16.03.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Sep 2017 16:03:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=qVcztI2d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33492 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dpMsH-0005yp-Jp
	for alex.bennee@linaro.org; Tue, 05 Sep 2017 19:03:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35102)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dpMs4-0005uC-Js
	for qemu-arm@nongnu.org; Tue, 05 Sep 2017 19:03:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dpMrz-0005l8-Cf
	for qemu-arm@nongnu.org; Tue, 05 Sep 2017 19:03:04 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:38538)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dpMro-0005es-Aw; Tue, 05 Sep 2017 19:02:48 -0400
Received: by mail-qt0-x241.google.com with SMTP id k2so318109qte.5;
	Tue, 05 Sep 2017 16:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=mt1bDjYwYRT9TdAIaM54Mz+k9+aXeBXyrlQI1spVBF8=;
	b=qVcztI2dYg8sQaElLHm2vjDWvPJ10wqaYaTxT8ZOKXuDYwoPpcAgEiHcYcsk0DBiAy
	AP6PvIdzrXmqKc1GfpyAPIBihrhUno+AvfAufvR2mUevdMlQ1RqKdKqM6V5DQRckAqZI
	Ata+Ga8UHpqd6tnBuVADYt6b/92zEnrBFllR7ZdIbcWKS+m7ERFDdR6/YqyyEyjJ7LiQ
	H2fTwqQ7W6hkMQ78wO+oMpnhmZxw3Fv3dHj6AmJlXFhFz+Xc+YdmZPHQ1FTC/FZ4N19t
	m1Hwr1D9CVZrVdfO0mUKs63zCWURtKdrz/TfYguQ4Thv8daOdH0Oeia6drsfcp12y7AL
	Jewg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=mt1bDjYwYRT9TdAIaM54Mz+k9+aXeBXyrlQI1spVBF8=;
	b=hW84ZYN0xcckFRbEPSdRKleEV7ERqvEagxSihjz/cgTd3dmqTtKO9XlNKOv7vBv+zg
	xKvCEwdyq15EgAP80yaJrVBhTMJuHYwHVgFBP2s2ZnnzqMOxmphhSHEEO9GhsvKcdmnL
	3KCARWHX9QC5G5/RmKfx22Us45z2x+5utmGd7lGzwubGEbgjyFwUxieQzutt3UU4U3uS
	1zLcIhkRzeAjecUXlsCd6bLkJMDYVeXgdnVzejHgfw4oY7vCU3Ga/v7fEDCFvIVJV1EO
	Y667ceprgVeZagcxI7P70kP/oGk8MNahJeeGqW0P2406TOf18mfkAvYZiKOXcGKKpUYO
	pMMQ==
X-Gm-Message-State: AHPjjUir2ItE+lSO3pGPc5fjLBuQSdD/fB0RfkrZ0/QVfCX0/nEC018Y
	SyymP703mVxGgQ==
X-Google-Smtp-Source: ADKCNb5qWicwxp8a2H14tscB1NXPOuJh3p5rTRpSpkrOBS2UQh1wI5ol2AXbA5jyU3X0+YXrs62fWA==
X-Received: by 10.200.63.124 with SMTP id w57mr941058qtk.43.1504652567628;
	Tue, 05 Sep 2017 16:02:47 -0700 (PDT)
Received: from [192.168.1.10] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id q5sm1357784qkh.43.2017.09.05.16.02.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Sep 2017 16:02:46 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1503414539-28762-1-git-send-email-peter.maydell@linaro.org>
	<1503414539-28762-14-git-send-email-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <0bdf90f4-979c-5553-f10b-f92ac01b8aa9@amsat.org>
Date: Tue, 5 Sep 2017 20:02:44 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1503414539-28762-14-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: Re: [Qemu-arm] [PATCH 13/20] target/arm: Make MPU_RBAR,
 MPU_RLAR banked for v8M
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YUlzJ+4EEPd7

On 08/22/2017 12:08 PM, Peter Maydell wrote:
> Make the MPU registers MPU_MAIR0 and MPU_MAIR1 banked if v8M security
> extensions are enabled.
> 
> We can freely add more items to vmstate_m_security without
> breaking migration compatibility, because no CPU currently
> has the ARM_FEATURE_M_SECURITY bit enabled and so this
> subsection is not yet used by anything.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/cpu.h      |  4 ++--
>   hw/intc/armv7m_nvic.c |  8 ++++----
>   target/arm/cpu.c      | 26 ++++++++++++++++++++------
>   target/arm/helper.c   | 11 ++++++-----
>   target/arm/machine.c  | 12 ++++++++----
>   5 files changed, 40 insertions(+), 21 deletions(-)
> 
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 2f59828..12fa95e 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -543,8 +543,8 @@ typedef struct CPUARMState {
>            *  pmsav7.rnr (region number register)
>            *  pmsav7_dregion (number of configured regions)
>            */
> -        uint32_t *rbar;
> -        uint32_t *rlar;
> +        uint32_t *rbar[2];
> +        uint32_t *rlar[2];
>           uint32_t mair0[2];
>           uint32_t mair1[2];
>       } pmsav8;
> diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
> index e98eb95..9ced7af 100644
> --- a/hw/intc/armv7m_nvic.c
> +++ b/hw/intc/armv7m_nvic.c
> @@ -564,7 +564,7 @@ static uint32_t nvic_readl(NVICState *s, uint32_t offset, MemTxAttrs attrs)
>               if (region >= cpu->pmsav7_dregion) {
>                   return 0;
>               }
> -            return cpu->env.pmsav8.rbar[region];
> +            return cpu->env.pmsav8.rbar[attrs.secure][region];
>           }
>   
>           if (region >= cpu->pmsav7_dregion) {
> @@ -591,7 +591,7 @@ static uint32_t nvic_readl(NVICState *s, uint32_t offset, MemTxAttrs attrs)
>               if (region >= cpu->pmsav7_dregion) {
>                   return 0;
>               }
> -            return cpu->env.pmsav8.rlar[region];
> +            return cpu->env.pmsav8.rlar[attrs.secure][region];
>           }
>   
>           if (region >= cpu->pmsav7_dregion) {
> @@ -756,7 +756,7 @@ static void nvic_writel(NVICState *s, uint32_t offset, uint32_t value,
>               if (region >= cpu->pmsav7_dregion) {
>                   return;
>               }
> -            cpu->env.pmsav8.rbar[region] = value;
> +            cpu->env.pmsav8.rbar[attrs.secure][region] = value;
>               tlb_flush(CPU(cpu));
>               return;
>           }
> @@ -806,7 +806,7 @@ static void nvic_writel(NVICState *s, uint32_t offset, uint32_t value,
>               if (region >= cpu->pmsav7_dregion) {
>                   return;
>               }
> -            cpu->env.pmsav8.rlar[region] = value;
> +            cpu->env.pmsav8.rlar[attrs.secure][region] = value;
>               tlb_flush(CPU(cpu));
>               return;
>           }
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index ae8af19..333029c 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -235,10 +235,20 @@ static void arm_cpu_reset(CPUState *s)
>       if (arm_feature(env, ARM_FEATURE_PMSA)) {
>           if (cpu->pmsav7_dregion > 0) {
>               if (arm_feature(env, ARM_FEATURE_V8)) {
> -                memset(env->pmsav8.rbar, 0,
> -                       sizeof(*env->pmsav8.rbar) * cpu->pmsav7_dregion);
> -                memset(env->pmsav8.rlar, 0,
> -                       sizeof(*env->pmsav8.rlar) * cpu->pmsav7_dregion);
> +                memset(env->pmsav8.rbar[M_REG_NS], 0,
> +                       sizeof(*env->pmsav8.rbar[M_REG_NS])
> +                       * cpu->pmsav7_dregion);
> +                memset(env->pmsav8.rlar[M_REG_NS], 0,
> +                       sizeof(*env->pmsav8.rlar[M_REG_NS])
> +                       * cpu->pmsav7_dregion);
> +                if (arm_feature(env, ARM_FEATURE_M_SECURITY)) {
> +                    memset(env->pmsav8.rbar[M_REG_S], 0,
> +                           sizeof(*env->pmsav8.rbar[M_REG_S])
> +                           * cpu->pmsav7_dregion);
> +                    memset(env->pmsav8.rlar[M_REG_S], 0,
> +                           sizeof(*env->pmsav8.rlar[M_REG_S])
> +                           * cpu->pmsav7_dregion);
> +                }
>               } else if (arm_feature(env, ARM_FEATURE_V7)) {
>                   memset(env->pmsav7.drbar, 0,
>                          sizeof(*env->pmsav7.drbar) * cpu->pmsav7_dregion);
> @@ -823,8 +833,12 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>           if (nr) {
>               if (arm_feature(env, ARM_FEATURE_V8)) {
>                   /* PMSAv8 */
> -                env->pmsav8.rbar = g_new0(uint32_t, nr);
> -                env->pmsav8.rlar = g_new0(uint32_t, nr);
> +                env->pmsav8.rbar[M_REG_NS] = g_new0(uint32_t, nr);
> +                env->pmsav8.rlar[M_REG_NS] = g_new0(uint32_t, nr);
> +                if (arm_feature(env, ARM_FEATURE_M_SECURITY)) {
> +                    env->pmsav8.rbar[M_REG_S] = g_new0(uint32_t, nr);
> +                    env->pmsav8.rlar[M_REG_S] = g_new0(uint32_t, nr);
> +                }
>               } else {
>                   env->pmsav7.drbar = g_new0(uint32_t, nr);
>                   env->pmsav7.drsr = g_new0(uint32_t, nr);
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index b1bb507..5394cef 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -8442,6 +8442,7 @@ static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
>   {
>       ARMCPU *cpu = arm_env_get_cpu(env);
>       bool is_user = regime_is_user(env, mmu_idx);
> +    uint32_t secure = regime_is_secure(env, mmu_idx);

        bool secure = regime_is_secure(env, mmu_idx);

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

>       int n;
>       int matchregion = -1;
>       bool hit = false;
> @@ -8468,10 +8469,10 @@ static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
>                * with bits [4:0] all zeroes, but the limit address is bits
>                * [31:5] from the register with bits [4:0] all ones.
>                */
> -            uint32_t base = env->pmsav8.rbar[n] & ~0x1f;
> -            uint32_t limit = env->pmsav8.rlar[n] | 0x1f;
> +            uint32_t base = env->pmsav8.rbar[secure][n] & ~0x1f;
> +            uint32_t limit = env->pmsav8.rlar[secure][n] | 0x1f;
>   
> -            if (!(env->pmsav8.rlar[n] & 0x1)) {
> +            if (!(env->pmsav8.rlar[secure][n] & 0x1)) {
>                   /* Region disabled */
>                   continue;
>               }
> @@ -8520,8 +8521,8 @@ static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
>           /* hit using the background region */
>           get_phys_addr_pmsav7_default(env, mmu_idx, address, prot);
>       } else {
> -        uint32_t ap = extract32(env->pmsav8.rbar[matchregion], 1, 2);
> -        uint32_t xn = extract32(env->pmsav8.rbar[matchregion], 0, 1);
> +        uint32_t ap = extract32(env->pmsav8.rbar[secure][matchregion], 1, 2);
> +        uint32_t xn = extract32(env->pmsav8.rbar[secure][matchregion], 0, 1);
>   
>           if (m_is_system_region(env, address)) {
>               /* System space is always execute never */
> diff --git a/target/arm/machine.c b/target/arm/machine.c
> index 414a879..05c6c7a 100644
> --- a/target/arm/machine.c
> +++ b/target/arm/machine.c
> @@ -225,10 +225,10 @@ static const VMStateDescription vmstate_pmsav8 = {
>       .minimum_version_id = 1,
>       .needed = pmsav8_needed,
>       .fields = (VMStateField[]) {
> -        VMSTATE_VARRAY_UINT32(env.pmsav8.rbar, ARMCPU, pmsav7_dregion, 0,
> -                              vmstate_info_uint32, uint32_t),
> -        VMSTATE_VARRAY_UINT32(env.pmsav8.rlar, ARMCPU, pmsav7_dregion, 0,
> -                              vmstate_info_uint32, uint32_t),
> +        VMSTATE_VARRAY_UINT32(env.pmsav8.rbar[M_REG_NS], ARMCPU, pmsav7_dregion,
> +                              0, vmstate_info_uint32, uint32_t),
> +        VMSTATE_VARRAY_UINT32(env.pmsav8.rlar[M_REG_NS], ARMCPU, pmsav7_dregion,
> +                              0, vmstate_info_uint32, uint32_t),
>           VMSTATE_UINT32(env.pmsav8.mair0[M_REG_NS], ARMCPU),
>           VMSTATE_UINT32(env.pmsav8.mair1[M_REG_NS], ARMCPU),
>           VMSTATE_END_OF_LIST()
> @@ -257,6 +257,10 @@ static const VMStateDescription vmstate_m_security = {
>           VMSTATE_UINT32(env.v7m.vecbase[M_REG_S], ARMCPU),
>           VMSTATE_UINT32(env.pmsav8.mair0[M_REG_S], ARMCPU),
>           VMSTATE_UINT32(env.pmsav8.mair1[M_REG_S], ARMCPU),
> +        VMSTATE_VARRAY_UINT32(env.pmsav8.rbar[M_REG_S], ARMCPU, pmsav7_dregion,
> +                              0, vmstate_info_uint32, uint32_t),
> +        VMSTATE_VARRAY_UINT32(env.pmsav8.rlar[M_REG_S], ARMCPU, pmsav7_dregion,
> +                              0, vmstate_info_uint32, uint32_t),
>           VMSTATE_END_OF_LIST()
>       }
>   };
> 
