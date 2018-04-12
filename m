Received: by 10.28.71.155 with SMTP id m27csp2102589wmi;
        Thu, 12 Apr 2018 09:24:40 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4+aCbqTTecDKQdoTfCVZQZ4KC3R3m0saZVsUVmExYiVwm4wyz9IJ+puKZtXDs6xGRymAW3T
X-Received: by 10.129.183.35 with SMTP id v35mr774324ywh.506.1523550280181;
        Thu, 12 Apr 2018 09:24:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523550280; cv=none;
        d=google.com; s=arc-20160816;
        b=K3mrccJPRg+4+0htaIgM3eIcZbjmleCenjeeYUeUgS9EHdoIdOsERd+/idyCDgrRWH
         ZDyEgbRhWhGjOVU66LNV47Gs+92zPvA7DVUatBzdo4jx5uQ1AxkEWsPDCxsJv/O6zmTc
         C3njkEF50JvHuBG9tv5hp5ZymfSaUkDTomIQ5LDSFRSa+EmetWj3wTaTidyFTqX0Xv/X
         50/SmRL8mBWlX6CE+geuL//lYEFiRvyshm5Z533XuwcyHZzII+ms7Z7QuN3svOYB8UD0
         Mk04ZJKSmmMgirXAoo8ZI20X4MGoEQEOTnm5SIX773gW5zvr0NIbhs2J0pp7t4YBuHFh
         2crA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=CoxR89HLgrTHZS9rS9G5vKcL/JS02tnkAW4bAUA1Yrk=;
        b=SqddFLA1RB91bcufwUNuTufzpBxVV70GWsVbbusYALviD48HKvcZ3Mqv/WzTBnBhhE
         IYe5XtUSmT7si+6i1WkJK0yTnFsXF/hkS+E6S97RZH9PDQbZ+s1G9094n+w0jkuZgZGj
         RcP8/exaf9+IMibkYOJjdPIJlmwxRKBlbpKgT7B8TYApY4/EF6CHpi4CJo9NojG0sEH2
         A4DDt0p7cej1eDSKaMgQcqLcIX+3ywLfutdjLls07S8Z4ZPOwGBipHk0N5rcLbr1Tw44
         55tKN8qAJWCXxDPuBF26Anda+D178yJPebJSAqeY8Uu8L5HPeZZsGfdhsvK6WmLE+xi1
         RfHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Lewmy4zY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 124si4990580qkf.482.2018.04.12.09.24.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 Apr 2018 09:24:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Lewmy4zY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52190 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f6f1b-0002Cg-Hf
	for alex.bennee@linaro.org; Thu, 12 Apr 2018 12:24:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42959)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f6f1O-0002BM-W5
	for qemu-arm@nongnu.org; Thu, 12 Apr 2018 12:24:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f6f1O-0002Al-3k
	for qemu-arm@nongnu.org; Thu, 12 Apr 2018 12:24:26 -0400
Received: from mail-ot0-x241.google.com ([2607:f8b0:4003:c0f::241]:40855)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1f6f1N-0002AK-Vm
	for qemu-arm@nongnu.org; Thu, 12 Apr 2018 12:24:26 -0400
Received: by mail-ot0-x241.google.com with SMTP id j8-v6so6666384ota.7
	for <qemu-arm@nongnu.org>; Thu, 12 Apr 2018 09:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=CoxR89HLgrTHZS9rS9G5vKcL/JS02tnkAW4bAUA1Yrk=;
	b=Lewmy4zYApPtdEx4ZTmDmq1TDLtqJ+NSx1yZb1vJoMEb525O9Xth3mEJBjNfukZtFw
	1Slk5bnDvnqjKAo9riGNefuqJG1MdHobBhTwUYm+UyzdG0bzxPu+mqfqma3NSbYz//a6
	fG5r+jOHhYusMdwUDXYfXpZKmcWXZm2R4LNgA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=CoxR89HLgrTHZS9rS9G5vKcL/JS02tnkAW4bAUA1Yrk=;
	b=EUQ5rB6V3Y9aOsxCMVfTqX1qrrPDO/XiQIwyqEv/lQ1Y/1kAJnbk75wVibrXXxz20I
	EirrWxAroPbXo46TxxuvtjDwjxL3Cl1eN3XjOHRFlfgBKIqm6cAXBpeCN3ly3OIme/Tp
	cpBy56QBWorPqS6+t4MRls5U2UChk9WNLaOy9sNCjUzDgeew6cF7KCYO1vr8EnbdXVh+
	ku5dHybCjn3iff9UsHfRTPC34cbdREtPdToo65hfr+53eT5QcCd3yGEXj0yia0GFwuer
	PT3W5KRTGyV2vG0KNRSCYgznC54ZlfcTVI6CRaSRzK2EtNQwEaCVKv78X8ZBabu9NZMI
	DVoQ==
X-Gm-Message-State: ALQs6tCEOJpyCl8xH964gToxpJGbpfCDekRUqDnVeffGfQnnKCL764t5
	T/s6R2bcNWdLovHsvgXLcTDbrDVOGNAHgUZ1ODy/qw==
X-Received: by 2002:a9d:32f5:: with SMTP id
	u108-v6mr1169509otb.308.1523550265250; 
	Thu, 12 Apr 2018 09:24:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2286:0:0:0:0:0 with HTTP; Thu, 12 Apr 2018 09:24:04
	-0700 (PDT)
In-Reply-To: <1521232280-13089-7-git-send-email-alindsay@codeaurora.org>
References: <1521232280-13089-1-git-send-email-alindsay@codeaurora.org>
	<1521232280-13089-7-git-send-email-alindsay@codeaurora.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Apr 2018 17:24:04 +0100
Message-ID: <CAFEAcA_hsh+virQsKPdDGOQXaBYiTX+G+gJ8=Qi0gsC_==zO5A@mail.gmail.com>
To: Aaron Lindsay <alindsay@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::241
Subject: Re: [Qemu-arm] [PATCH v3 06/22] target/arm: Mask PMU register
 writes based on PMCR_EL0.N
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
Cc: Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YLqAMqXsFnhw

On 16 March 2018 at 20:31, Aaron Lindsay <alindsay@codeaurora.org> wrote:
> This is in preparation for enabling counters other than PMCCNTR
>
> Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
> ---
>  target/arm/helper.c | 24 +++++++++++++++---------
>  1 file changed, 15 insertions(+), 9 deletions(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 6480b80..5d5c738 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -52,11 +52,6 @@ typedef struct V8M_SAttributes {
>  static void v8m_security_lookup(CPUARMState *env, uint32_t address,
>                                  MMUAccessType access_type, ARMMMUIdx mmu_idx,
>                                  V8M_SAttributes *sattrs);
> -
> -/* Definitions for the PMCCNTR and PMCR registers */
> -#define PMCRD   0x8
> -#define PMCRC   0x4
> -#define PMCRE   0x1
>  #endif
>
>  static int vfp_gdb_get_reg(CPUARMState *env, uint8_t *buf, int reg)
> @@ -906,6 +901,17 @@ static const ARMCPRegInfo v6_cp_reginfo[] = {
>      REGINFO_SENTINEL
>  };
>
> +/* Definitions for the PMU registers */
> +#define PMCRN_MASK  0xf800
> +#define PMCRN_SHIFT 11
> +#define PMCRD   0x8
> +#define PMCRC   0x4
> +#define PMCRE   0x1
> +
> +#define PMU_NUM_COUNTERS(env) ((env->cp15.c9_pmcr & PMCRN_MASK) >> PMCRN_SHIFT)
> +/* Bits allowed to be set/cleared for PMCNTEN* and PMINTEN* */
> +#define PMU_COUNTER_MASK(env) ((1 << 31) | ((1 << PMU_NUM_COUNTERS(env)) - 1))

These would be better as inline functions I think.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
