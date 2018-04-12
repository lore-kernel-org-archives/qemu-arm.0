Received: by 10.28.71.155 with SMTP id m27csp2166897wmi;
        Thu, 12 Apr 2018 10:30:21 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4+myL0LaURx5RbPh4H+f9nFynp04E1ItbbG8M1iVBecTtkJPPkhw7ecAutiXmh0Vhz23ScU
X-Received: by 10.55.43.144 with SMTP id r16mr2399318qkr.117.1523554221686;
        Thu, 12 Apr 2018 10:30:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523554221; cv=none;
        d=google.com; s=arc-20160816;
        b=xibJakp2nudgaoivdD4BAYEKk8Jp9o8N0yM0dJ3DSYz2DS1GZ2Ys1Qmq2mg8uZNcFY
         JLbvL+n9UL6ebNsLV/CuKQ7EQkrWeMo3UTUrgYGZZbzOiNg98DOE5w97FoXH2/61GkD7
         lOM+rUt2YBDEUTneGhiZnLNUuaQBfM3YOF1VDvl3QJTHJ/UZ/vwXXeHS+PdBmss6eVqr
         cyRkAKi+lfKYg8xmiASr5Id44zXAJy3VEu9+lLFPwwYGCeLkU+rhdNkcOZhDTMspSGz1
         ohGcNNVmtyzjE5hJz+D6/P+XlsoUdgreE5g/cgl19tJxcpzsqAaRO0Q4sHDlf9q9Seuf
         LRaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=xrkwiS78yejn6pMmfcjPxEZenxW3ExntvKJZiD2xurE=;
        b=UB7jARVaJGeNoVpu49F+dmoXkmCqvri1Rd5dHIxNsa9WRhXaKa+F4fdgZNhcjFByjb
         HSI1XImC7x4f6AjeO59vjv5ZOUcdBit0ZFO3fo27cMf7p7eSYXRGgg7IQm7kKq476KEU
         MUmJyRiHm44Qe+5RdCeIoXf2Fyy0funSkw7o4cuflaG0z5Msi4oRz5Gvlua1vXGPK2Np
         zEWYmL98dPB/9lC1+i3q+UmU/y/n0CGbxaQ1EHV+G33fKH6ITkx+TetmagPbaE9V3HRG
         5A8jAONpmhWVTCeL/XgJ+DqJpxlI5QD9/YBdkAuw+Zj2MI+J9TgrXm3iKvtWHrwGwPqG
         sEpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=P7HO2+VB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i10si5041337qtp.59.2018.04.12.10.30.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 Apr 2018 10:30:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=P7HO2+VB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57044 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f6g3B-00062t-74
	for alex.bennee@linaro.org; Thu, 12 Apr 2018 13:30:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41141)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f6g2z-0005zi-Uv
	for qemu-arm@nongnu.org; Thu, 12 Apr 2018 13:30:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f6g2u-00007B-45
	for qemu-arm@nongnu.org; Thu, 12 Apr 2018 13:30:09 -0400
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:43730)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1f6g2t-00006n-Vm
	for qemu-arm@nongnu.org; Thu, 12 Apr 2018 13:30:04 -0400
Received: by mail-oi0-x241.google.com with SMTP id u84-v6so5922765oie.10
	for <qemu-arm@nongnu.org>; Thu, 12 Apr 2018 10:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xrkwiS78yejn6pMmfcjPxEZenxW3ExntvKJZiD2xurE=;
	b=P7HO2+VBqJrFjRidc0c+izR1lTnm/4gFglxVQQiAlX+MgnCfcGOtkpUZclvwaI8CR6
	zIkVNpgap3izdjpOXDzHWshbWHfRxkbk4w/JH/esyB9OXpDj5TyquIz6GCJp5iGevZEJ
	K9PnCAmB8PMxVfGWC5hGDUzyvLFGVoI6yv1Y4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xrkwiS78yejn6pMmfcjPxEZenxW3ExntvKJZiD2xurE=;
	b=gnib+mXRO92crq53fiXj6k+3m7LsUdOqo36rAlizMRXSFzsgENpug6u4sIgh8nHyfU
	ug9A2s4H+LGbWqSfyRPKFFQfvPIz3rzfSnIMq3i5aG8uY7p6WJ3WB584dtaYgF6a9tbL
	/5FqIT0gR2mAVUB6qdvquCRI5SZg5ODnvP45tDg9nsDsbpingz3YQkCcpCfaPgEo9Lqt
	i/4fqpBq9rTwGlyYIteTAhJVPxoDPVlDgMTrSM4Y/IXffRZ2wNlEEMhQGsWwG+ZxsAh4
	rTnJMtRofN7wk2ouRVlp9rwton+gtq73kqvjmPtUg6E6FUVvXyDvW6VTx5mfa2RSWgB2
	rpTg==
X-Gm-Message-State: ALQs6tCvl01nMJ23RKl0ghaP+l4rpA6TSeCAlDl1lNMOCsp3PPKzIPBw
	BuYkZ5SjjLHKUezviCeiYpdEXV9sLuvgL/JtVakXpQ==
X-Received: by 2002:aca:1c7:: with SMTP id 190-v6mr6652240oib.80.1523554203416;
	Thu, 12 Apr 2018 10:30:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2286:0:0:0:0:0 with HTTP; Thu, 12 Apr 2018 10:29:43
	-0700 (PDT)
In-Reply-To: <1521232280-13089-18-git-send-email-alindsay@codeaurora.org>
References: <1521232280-13089-1-git-send-email-alindsay@codeaurora.org>
	<1521232280-13089-18-git-send-email-alindsay@codeaurora.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Apr 2018 18:29:43 +0100
Message-ID: <CAFEAcA_ouvraVWU+JvfrWhYcoU_sdGMDmBnH8hFThOhDvBr3BA@mail.gmail.com>
To: Aaron Lindsay <alindsay@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-arm] [PATCH v3 17/22] target/arm: Split arm_ccnt_enabled
 into generic pmu_counter_enabled
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
X-TUID: s3sQ8XgliZuS

On 16 March 2018 at 20:31, Aaron Lindsay <alindsay@codeaurora.org> wrote:
> Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index f5e800e..2073d56 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -1009,17 +1009,22 @@ static CPAccessResult pmreg_access_ccntr(CPUARMState *env,
>      return pmreg_access(env, ri, isread);
>  }
>
> -static inline bool arm_ccnt_enabled(CPUARMState *env)
> +static inline bool pmu_counter_enabled(CPUARMState *env, uint8_t counter)
>  {
>      /* Does not check PMCCFILTR_EL0, which is handled by pmu_counter_filtered */
> -
> -    if (!(env->cp15.c9_pmcr & PMCRE) || !(env->cp15.c9_pmcnten & (1 << 31))) {
> +    if (!(env->cp15.c9_pmcr & PMCRE) ||
> +            !(env->cp15.c9_pmcnten & (1 << counter))) {
>          return false;
>      }
>
>      return true;
>  }
>
> +static inline bool arm_ccnt_enabled(CPUARMState *env)
> +{
> +    return pmu_counter_enabled(env, 31);
> +}

We only use arm_ccnt_enabled() in a couple of places, so
I would just make those callsites use pmu_counter_enabled(env, 31)
directly.

thanks
-- PMM
