Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2241165wrt;
        Thu, 17 Jan 2019 12:26:45 -0800 (PST)
X-Google-Smtp-Source: ALg8bN6LHbr6VrgzaOn8PNN8ZjfysFqdwSx+uSGwGLDKSBb79mvrBG61QsSVmYuqID8pJ9E7pCV5
X-Received: by 2002:adf:9467:: with SMTP id 94mr13294525wrq.305.1547756805728;
        Thu, 17 Jan 2019 12:26:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547756805; cv=none;
        d=google.com; s=arc-20160816;
        b=EZYsaM3mJyFrWl54Aao5PgK9CTHPzD60S+0OIwdRZ+H5otQFQ5wMORFTh1/5Fq5ml6
         NIEA7c5n8hIzzsIGG9Ax9xBlrx5830BE39RlTo3tfpXeAy964jYu3q3ReD8fG/i/vp9/
         KH4eKG7U/pGfgpuhW90JbCjg7wknCOnKvTE3/o6f07hsCpAUdX1Ffnbz2kNvXzmV3BoN
         eDozMA+C5eWoTPosV3+uOe4wwxFVg2M3DQIAjfpj+ly0l23/eF8TOpdHI4gT1Sb/QPlI
         F4bCglzt8Q1CMpZIPP3sl9xVFaKbVGheHwcn5nyKhqojzSEfWrtq5AuqCR7FEhknLpEu
         q/1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=E5E3ssq5l1ohNn1aZPKhjOj+mp+1jmurZ8z4hOvTM5A=;
        b=UnVW+Zwk832KgjXtSKBfzUdkLkncgUMICfRZ14FdjJb8H/dm7JQeeqyPXWeKLaQjPc
         RudL12s4Mp69BUlW110qCKwU4gobnImZIB5uwtwYRt65XZww5HQDz/ZeXfOYisJbyFIL
         RpTiWG/4dbzIyop+ARmFvyZ9qVyD6U2UYsWua2LEm+hBYw25qm4SozU6YNuUvVZNLquc
         TK4k1gV+lWcBQV/ubHWLqtgDicVKa2M0xqG6H/bhpBkwchEReExySbiWTkBJSWuLFhrB
         wyCxOHicQp4SEiJdH+l5R2ZOlXidE+NavfXGysYcccPbX9bGGXbyupS25PcpU3bXH6Ac
         5cJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IU8ZCL+m;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w130si26747028wma.6.2019.01.17.12.26.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 17 Jan 2019 12:26:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IU8ZCL+m;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:54516 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gkEFQ-0003Nq-Ns
	for alex.bennee@linaro.org; Thu, 17 Jan 2019 15:26:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49010)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gkEFB-0003MS-Md
	for qemu-arm@nongnu.org; Thu, 17 Jan 2019 15:26:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gkEF7-0003GV-JR
	for qemu-arm@nongnu.org; Thu, 17 Jan 2019 15:26:29 -0500
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:42369)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gkEF3-0003DY-RN
	for qemu-arm@nongnu.org; Thu, 17 Jan 2019 15:26:25 -0500
Received: by mail-pg1-x541.google.com with SMTP id d72so4927263pga.9
	for <qemu-arm@nongnu.org>; Thu, 17 Jan 2019 12:26:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=E5E3ssq5l1ohNn1aZPKhjOj+mp+1jmurZ8z4hOvTM5A=;
	b=IU8ZCL+mHUWPbrOhQ4vbS9d3eyKxQvGeqte59Yze6VkI3D8mJEsHOKe9gu3OV2slhm
	KH/HhxlmmQgjfgI5/dsvbGVp2JOpxiMruysHG7x2pT0TCvEpCzr3jE0ABkoGP5V04cr4
	smnqTqIcBgbVDWVNB5RLHPUZ7Df2wmPpYdNnk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=E5E3ssq5l1ohNn1aZPKhjOj+mp+1jmurZ8z4hOvTM5A=;
	b=heBc/tO5jLgS7ZS7EYFHJOyrPmhhFQRdwU3wKyTCbnMelc/InURJdpVUAQ++xfLFyu
	OD0+ec7rwi1oqC2IEp2gOzIFLeqZkj6NqreQGS/6XwTsjvSNaYMB5dFT+GnYLGzrpIsz
	K/WD40xC8ybY7L4ZW9ayBGiRrpVmnCSFZgpiEo6XsxANQMMMX6ZhhYp9gOXlSv2dcqWJ
	6XEWPIgn/TE4Pglrj8gpZ8IaI1+NrmdOWwGxo2pBSP83TSI5hy0TrdUeROArKD6b883y
	lBPm6YsT7v31+4bXWuIrWnfyqS92F3KX13+4EBg807+Z/9ItoDLU7X20pMXt/4eLSrnW
	6oqw==
X-Gm-Message-State: AJcUukcV6m/vO7AIG6PjYpH3rmp77B3EWrAencUCQ6xSy1AObgOSRB6C
	A4r/IPbETJZANYortjMekw5QRg==
X-Received: by 2002:a63:9c1a:: with SMTP id f26mr14887136pge.381.1547756778826;
	Thu, 17 Jan 2019 12:26:18 -0800 (PST)
Received: from cloudburst.twiddle.net
	([2001:8000:10e0:a000:c673:a6b6:fdef:1933])
	by smtp.gmail.com with ESMTPSA id
	d21sm4130485pfo.162.2019.01.17.12.26.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Jan 2019 12:26:17 -0800 (PST)
To: Aaron Lindsay <aaron@os.amperecomputing.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Wei Huang <wei@redhat.com>, 
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
References: <20181211151945.29137-1-aaron@os.amperecomputing.com>
	<20181211151945.29137-15-aaron@os.amperecomputing.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <8683c2c4-0111-492c-c6f9-1b2dcc937405@linaro.org>
Date: Fri, 18 Jan 2019 07:26:11 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20181211151945.29137-15-aaron@os.amperecomputing.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::541
Subject: Re: [Qemu-arm] [PATCH v10 14/14] target/arm: Send interrupts on PMU
 counter overflow
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
Cc: Aaron Lindsay <alindsay@codeaurora.org>,
	Michael Spradling <mspradli@codeaurora.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Digant Desai <digantd@codeaurora.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: O/Vt1uQhxe1V

On 12/12/18 2:20 AM, Aaron Lindsay wrote:
> Setup a QEMUTimer to get a callback when we expect counters to next
> overflow and trigger an interrupt at that time.
> 
> Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
> Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
> ---
>  target/arm/cpu.c    |  12 +++++
>  target/arm/cpu.h    |   8 +++
>  target/arm/helper.c | 126 +++++++++++++++++++++++++++++++++++++++++---
>  3 files changed, 140 insertions(+), 6 deletions(-)

Well, this patch is doing several things at once -- adding the timer, adding
the ns_per_count hook, updating irqs.  Not ideal, but I won't insist it be split.

You'll need to re-run against scripts/checkpatch, it would seem.
The goal-posts with respect to comments have been changed since
you started this.


> @@ -1305,7 +1338,19 @@ void pmccntr_op_start(CPUARMState *env)
>              eff_cycles /= 64;
>          }
>  
> -        env->cp15.c15_ccnt = eff_cycles - env->cp15.c15_ccnt_delta;
> +        uint64_t new_pmccntr = eff_cycles - env->cp15.c15_ccnt_delta;
> +
> +        unsigned int overflow_bit = (env->cp15.c9_pmcr & PMCRLC) ? 63 : 31;
> +        uint64_t overflow_mask = (uint64_t)1 << overflow_bit;

Could just as easily be

  uint64_t overflow_mask = env->cp15.c9_pmcr & PMCRLC ? INT64_MIN : INT32_MIN;


> +        if (env->cp15.c15_ccnt & ~new_pmccntr & overflow_mask) {
> +            env->cp15.c9_pmovsr |= (1 << 31);
> +            if (!(env->cp15.c9_pmcr & PMCRLC)) {
> +                new_pmccntr &= 0xffffffff;
> +            }

Why is this truncation buried within the overflow condition?  Simply because
the high bits can't be set without overflow being noticed?  That could use a
comment, because it looks odd.

> @@ -1340,8 +1399,15 @@ static void pmevcntr_op_start(CPUARMState *env, uint8_t counter)
>      }
>  
>      if (pmu_counter_enabled(env, counter)) {
> -        env->cp15.c14_pmevcntr[counter] =
> -            count - env->cp15.c14_pmevcntr_delta[counter];
> +        uint64_t new_pmevcntr = count - env->cp15.c14_pmevcntr_delta[counter];
> +
> +        if (!(new_pmevcntr & PMEVCNTR_OVERFLOW_MASK) &&
> +                (env->cp15.c14_pmevcntr[counter] & PMEVCNTR_OVERFLOW_MASK)) {
> +            env->cp15.c9_pmovsr |= (1 << counter);
> +            new_pmevcntr &= ~PMEVCNTR_OVERFLOW_MASK;

That, surely, does not do what you intend.  I can only imagine that you meant

    new_pmevcntr = (uint32_t)new_pmevcntr;
or
    new_pmevcntr &= PMEVCNTR_OVERFLOW_MASK - 1;

depending on how much you want to depend on the symbol defining the width.
Given that it is architecturally defined to 32-bits, I think you could really
just drop the define and use

    uint32_t new_pmevcntr = ...;
    if (env->cp15.c14_pmevcntr[counter] & ~new_pmevcntr & INT32_MIN)

with equal clarity.  The type of new_pmevcntr means you don't have to clear any
high bits either.

> +            /* Detect if this write causes an overflow since we can't predict
> +             * PMSWINC overflows like we can for other events
> +             */
> +            uint64_t new_pmswinc = env->cp15.c14_pmevcntr[i] + 1;
> +
> +            if (!(new_pmswinc & PMEVCNTR_OVERFLOW_MASK) &&
> +                    (env->cp15.c14_pmevcntr[i] & PMEVCNTR_OVERFLOW_MASK)) {
> +                env->cp15.c9_pmovsr |= (1 << i);
> +                new_pmswinc &= ~PMEVCNTR_OVERFLOW_MASK;

Likewise.


r~
