Received: by 10.25.159.19 with SMTP id i19csp358481lfe;
        Fri, 15 Jan 2016 02:04:30 -0800 (PST)
X-Received: by 10.55.40.3 with SMTP id o3mr11660097qkh.92.1452852270745;
        Fri, 15 Jan 2016 02:04:30 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t138si4510757qhb.115.2016.01.15.02.04.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Jan 2016 02:04:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:46162 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aK1F8-0007bS-6n
	for alex.bennee@linaro.org; Fri, 15 Jan 2016 05:04:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34008)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aK1F6-0007b8-GQ
	for qemu-arm@nongnu.org; Fri, 15 Jan 2016 05:04:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aK1F5-00070h-DZ
	for qemu-arm@nongnu.org; Fri, 15 Jan 2016 05:04:28 -0500
Received: from mail-vk0-x235.google.com ([2607:f8b0:400c:c05::235]:36192)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aK1F5-00070b-6f
	for qemu-arm@nongnu.org; Fri, 15 Jan 2016 05:04:27 -0500
Received: by mail-vk0-x235.google.com with SMTP id n1so141293460vkb.3
	for <qemu-arm@nongnu.org>; Fri, 15 Jan 2016 02:04:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=KUUsVpdqRNU+AV3i+3gwhC0Uivs2AdRc6C3EhIR9FOY=;
	b=iXudEHcI74pN9bOPz7kiOLr3e9prZH1b/VWJJEXxguwzUIUwaZOd3cDMpxUfjHuYAx
	7tY19cZHmNmwPKBAZrpxNNRdusrmjhvMGMb8Yziqa/tlAtnyuhnPycudWDLcZVk25NDU
	+/sBqK8kJhlgbUjHhb/ZM6WUCM0xzKXDNvNnY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=KUUsVpdqRNU+AV3i+3gwhC0Uivs2AdRc6C3EhIR9FOY=;
	b=CyNxUZUoC8g1L9GhsKiye0b6mxfflSA5biJ/5a521K7Cx9HcKsHEGlFLLH8s5Nyt2D
	522mmnJjg7UmwKBcD2Pc8ni5BZBTh0iXcygxOJ9DePJPa8nUTbCqJtPzU4hTOPhjK6w3
	QEsIxkxK7a/WNMOy6DRxQE/eW8zfEqiGxhSdBOLQysdVTuOaIEEyEcc0EPkv8lbcf3PG
	oUN66vVBtKJZ9V5E/A1xOpuMPQGNxny+ntYzycdmqLp2Ki589g1FVT508oVnxDOa1U3a
	wqLiVYJXqfjaEpPLJCMYNH5jlY+uwoBiQLk43tPclnVsVpnFl/v7226T3kHqf32m9lJ1
	WMuQ==
X-Gm-Message-State: ALoCoQkhhh4y6XEAikeNzlhsY0OoUweFqV6cw4qofkKvLyPFQT1oUbHA+tduuS3Goc/iGAZ6GUqnbn6E4bb0KRMW7H97IXgUkAlNq6C1W8Wv6P+/QwPcH8A=
X-Received: by 10.31.131.203 with SMTP id f194mr7038644vkd.90.1452852266760;
	Fri, 15 Jan 2016 02:04:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Fri, 15 Jan 2016 02:04:07 -0800 (PST)
In-Reply-To: <1452851965-19418-1-git-send-email-a.rigo@virtualopensystems.com>
References: <1452851965-19418-1-git-send-email-a.rigo@virtualopensystems.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 Jan 2016 10:04:07 +0000
Message-ID: <CAFEAcA9FTxhaf3upvM-d6D14TpqA+Ed_OVJvFWK1Js_j2nTzhQ@mail.gmail.com>
To: Alvise Rigo <a.rigo@virtualopensystems.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::235
Cc: "tech@virtualopensystems.com" <tech@virtualopensystems.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"open list:ARM" <qemu-arm@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH] target-arm: fix MMU index in
	arm_cpu_do_unaligned_access
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: tCF9F1sB6zRg

On 15 January 2016 at 09:59, Alvise Rigo <a.rigo@virtualopensystems.com> wrote:
> arm_regime_using_lpae_format checks whether the LPAE extension is used
> for stage 1 translation regimes. MMU indexes not exclusively of a stage 1
> regime won't work with this method.
>
> In case of ARMMMUIdx_S12NSE0 or ARMMMUIdx_S12NSE1, offset these values
> by ARMMMUIdx_S1NSE0 to get the right index indicating a stage 1
> translation regime.
>
> Rename also the function to arm_s1_regime_using_lpae_format and update
> the comments to reflect the change.
>
> Signed-off-by: Alvise Rigo <a.rigo@virtualopensystems.com>
> ---
>  target-arm/helper.c    | 8 ++++----
>  target-arm/internals.h | 5 +++--
>  target-arm/op_helper.c | 8 ++++++--
>  3 files changed, 13 insertions(+), 8 deletions(-)
>
> diff --git a/target-arm/helper.c b/target-arm/helper.c
> index 59d5a41..8317ff5 100644
> --- a/target-arm/helper.c
> +++ b/target-arm/helper.c
> @@ -5996,10 +5996,10 @@ static inline bool regime_using_lpae_format(CPUARMState *env,
>      return false;
>  }
>
> -/* Returns true if the translation regime is using LPAE format page tables.
> - * Used when raising alignment exceptions, whose FSR changes depending on
> - * whether the long or short descriptor format is in use. */
> -bool arm_regime_using_lpae_format(CPUARMState *env, ARMMMUIdx mmu_idx)
> +/* Returns true if the stage 1 translation regime is using LPAE format page
> + * tables. Used when raising alignment exceptions, whose FSR changes depending
> + * on whether the long or short descriptor format is in use. */
> +bool arm_s1_regime_using_lpae_format(CPUARMState *env, ARMMMUIdx mmu_idx)
>  {
>      return regime_using_lpae_format(env, mmu_idx);
>  }
> diff --git a/target-arm/internals.h b/target-arm/internals.h
> index b925aaa..d226bbe 100644
> --- a/target-arm/internals.h
> +++ b/target-arm/internals.h
> @@ -441,8 +441,9 @@ struct ARMMMUFaultInfo {
>  bool arm_tlb_fill(CPUState *cpu, vaddr address, int rw, int mmu_idx,
>                    uint32_t *fsr, ARMMMUFaultInfo *fi);
>
> -/* Return true if the translation regime is using LPAE format page tables */
> -bool arm_regime_using_lpae_format(CPUARMState *env, ARMMMUIdx mmu_idx);
> +/* Return true if the stage 1 translation regime is using LPAE format page
> + * tables */
> +bool arm_s1_regime_using_lpae_format(CPUARMState *env, ARMMMUIdx mmu_idx);
>
>  /* Raise a data fault alignment exception for the specified virtual address */
>  void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr, int is_write,
> diff --git a/target-arm/op_helper.c b/target-arm/op_helper.c
> index e42d287..ccc505d 100644
> --- a/target-arm/op_helper.c
> +++ b/target-arm/op_helper.c
> @@ -133,7 +133,7 @@ void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr, int is_write,
>  {
>      ARMCPU *cpu = ARM_CPU(cs);
>      CPUARMState *env = &cpu->env;
> -    int target_el;
> +    int target_el, mmu_idx;
>      bool same_el;
>
>      if (retaddr) {
> @@ -146,10 +146,14 @@ void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr, int is_write,
>
>      env->exception.vaddress = vaddr;
>
> +    mmu_idx = cpu_mmu_index(env, false);
> +    if (mmu_idx == ARMMMUIdx_S12NSE0 || mmu_idx == ARMMMUIdx_S12NSE1) {
> +        mmu_idx += ARMMMUIdx_S1NSE0;
> +    }

I would let the arm_s1_regime_using_lpae_format() function do this conversion
from the S12 index to the S1 index.

Otherwise this looks good to me.

>      /* the DFSR for an alignment fault depends on whether we're using
>       * the LPAE long descriptor format, or the short descriptor format
>       */
> -    if (arm_regime_using_lpae_format(env, cpu_mmu_index(env, false))) {
> +    if (arm_s1_regime_using_lpae_format(env, mmu_idx)) {
>          env->exception.fsr = 0x21;
>      } else {
>          env->exception.fsr = 0x1;
> --
> 2.7.0

thanks
-- PMM
