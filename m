Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp7312367wrw;
        Thu, 15 Nov 2018 09:55:02 -0800 (PST)
X-Google-Smtp-Source: AJdET5f7/FxTCogw/MFAae+d6Yng6eZE0Eb39d0Eajax5GyB6uJqPpwmHV/bo0m372OXpAYM+F77
X-Received: by 2002:a37:2b5b:: with SMTP id r88mr7162781qkh.336.1542304502271;
        Thu, 15 Nov 2018 09:55:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542304502; cv=none;
        d=google.com; s=arc-20160816;
        b=DKt8KfXIguDueXj8qqlXELJaDQUbixTlri87wLUGdMcw+Pqt+1QEzsTVBY4BWpxs/t
         TRLtiGALfv/nH+vRqo6vwJKmLTcwdc+Dl6ymC1I526gACU+cekK2OZYHHByuHwISSdJe
         7HizbAZKPW2HqOgXFStXn4PNdpVZtVLzPywx1HiT/v5j87997eaG7xua62qw/aH0uhPU
         luPt3W7t4mev3keSKyETQsLSkuQ3JZb36/H99xVlyurOU0DXeyPl420eoMjjTciq+zip
         OSblqEmB6lVXWkpvtX9r4O5rpHMnYCOZULDbjXpizyl7ZeHBLOQY139gtDqMbUx0fOti
         4L7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=54133OLfa4AzLmyCw3NXVU6LKcbj4i+BFYaFKi9+gR0=;
        b=JsQmXenLc7ToPSJQmA/Z2NlYQZJ//41lY6471I2thA5y8F3NCyP8RsgyHcd/YG9p8A
         rgOx8a/OxEcmpCIb/zadKM08F9WCan2CDxvS27jojz0Ar56YGeqDjiO6knqnnxHYiDmD
         gL1WpdlviE/zGNBU0Ukyvb3iMAajqUFJ6lPCchDuOHLDCYSJ1Cq7qMt2Avsy3B9F3j+6
         Nv1UAlhugw/V+ggdVJblMbkCQBYU7YQYd1LBUBXQA8sD2reLA7EPgrGGP0UJcctSvHQu
         2S10L3HEkA5Tq3NmooDTicC+bKGVA7OpRYeXj65UwzxwIFzPwAx+e/lYeDq4LbNvVgMb
         zFoA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=X9ugxRVB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t74si5058134qke.33.2018.11.15.09.55.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 15 Nov 2018 09:55:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=X9ugxRVB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40128 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gNLr3-0003pe-NF
	for alex.bennee@linaro.org; Thu, 15 Nov 2018 12:55:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59557)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gNLqw-0003pU-7N
	for qemu-arm@nongnu.org; Thu, 15 Nov 2018 12:54:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gNLqv-0000S7-7E
	for qemu-arm@nongnu.org; Thu, 15 Nov 2018 12:54:54 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:39121)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gNLqu-000081-L6
	for qemu-arm@nongnu.org; Thu, 15 Nov 2018 12:54:53 -0500
Received: by mail-ot1-x341.google.com with SMTP id g27so18822884oth.6
	for <qemu-arm@nongnu.org>; Thu, 15 Nov 2018 09:54:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=54133OLfa4AzLmyCw3NXVU6LKcbj4i+BFYaFKi9+gR0=;
	b=X9ugxRVBi06bluwJEub2McO0fGsXHWATVEUalgIpSHZv5XMyVW8cTo2w05zQE2mC2K
	hpZX7IvzrqXox2BoyesF3OcEQ+ntvhCorh9xAEL/kgmZOVqjCpLUD/ubJzzEGE6RXO16
	EY664Q7beqBu3ExoPNbGdhjkPg2tvBDfHQV5I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=54133OLfa4AzLmyCw3NXVU6LKcbj4i+BFYaFKi9+gR0=;
	b=fLngnkNDJ9qVBj6iP8tNpwFv5oVT1Rs0Q6/0mhLpTfIP2NXJweTblocDdVaEOpxsXk
	lnhCJk5jJa5S+jWzuUXyAb9ROBU8RUQ9zp8e2CNg8BvreGjbfUuh7okrLWuxI0o4Ls+s
	4V7m3LFhe2xV0ZVFk6OoEwCVD4cpQw6tGZr/LpVOcVjoAT3kj4mGX08QPdhK7lcCaF/5
	PurwrKN/U7kVdF7YGg8xuzGIpMtXcd3WCxZIx1szO0hG4vmzpOkDX5euvKXAXtuqHqU8
	u4b2Vo9fWvEBb8jLEo+oUJrjtGLJW8ByRmOYJt3ykdZ947+BViEsrjWndCZv0u5mtq6q
	/pvA==
X-Gm-Message-State: AGRZ1gKbjdRtWwIJSkMfsGUrbpmJh6M/Rm56/n71i5bpDHATf4sjYqOv
	6j9krnREKRWmPLSYdg60+qcNUBBPvDmx8YkqIg0P+A==
X-Received: by 2002:a9d:5a81:: with SMTP id w1mr4476602oth.317.1542304491672; 
	Thu, 15 Nov 2018 09:54:51 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9d:4b0e:0:0:0:0:0 with HTTP; Thu, 15 Nov 2018 09:54:31
	-0800 (PST)
In-Reply-To: <20181102134112.26370-5-richard.henderson@linaro.org>
References: <20181102134112.26370-1-richard.henderson@linaro.org>
	<20181102134112.26370-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Nov 2018 17:54:31 +0000
Message-ID: <CAFEAcA8C1x8HRDd5JiV8sUgBM48CE+YcLH3HU2=3Vu6mSz_ACw@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-4.0 4/4] target/arm:
 Implement the ARMv8.2-AA32HPD extension
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2qT4XSqQKvM9

On 2 November 2018 at 13:41, Richard Henderson
<richard.henderson@linaro.org> wrote:
> The bulk of the work here, beyond base HPD, is defining the TTBCR2 register.
> In addition we must check TTBCR.T2E, which is not present (RES0) for AArch64.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h    |  8 ++++++++
>  target/arm/cpu.c    |  4 ++++
>  target/arm/helper.c | 37 +++++++++++++++++++++++++++++--------
>  3 files changed, 41 insertions(+), 8 deletions(-)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index f12a6afddc..a253cdebde 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -1517,6 +1517,14 @@ FIELD(ID_ISAR6, FHM, 8, 4)
>  FIELD(ID_ISAR6, SB, 12, 4)
>  FIELD(ID_ISAR6, SPECRES, 16, 4)
>
> +FIELD(ID_MMFR4, SPECSEI, 0, 4)
> +FIELD(ID_MMFR4, AC2, 4, 4)
> +FIELD(ID_MMFR4, XNX, 8, 4)
> +FIELD(ID_MMFR4, CNP, 12, 4)
> +FIELD(ID_MMFR4, HPDS, 16, 4)
> +FIELD(ID_MMFR4, LSM, 20, 4)
> +FIELD(ID_MMFR4, CCIDX, 24, 4)

Maybe add the v8.5 field too?
FIELD(ID_MMFR4, EVT, 28, 4)

> +/* Note that unlike TTBCR, writing to TTBCR2 does not require flushing
> + * qemu tlbs nor adjusting cached masks.
> + */
> +static const ARMCPRegInfo ttbcr2_reginfo = {
> +    .name = "TTBCR2", .cp = 15, .crn = 2, .crm = 0, .opc1 = 0, .opc2 = 3,

Our usual order for these fields is cp, opc1, crn, crm, opc2.

> +    .access = PL1_RW, .type = ARM_CP_ALIAS,
> +    .bank_fieldoffsets = { offsetofhigh32(CPUARMState, cp15.tcr_el[3]),
> +                           offsetofhigh32(CPUARMState, cp15.tcr_el[1]) },
> +};

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
