Received: by 10.28.173.206 with SMTP id w197csp2183456wme;
        Fri, 12 Jan 2018 10:45:08 -0800 (PST)
X-Google-Smtp-Source: ACJfBoulbzhCnLk2L9WN6nTNdr8samThG9rhUbFazKq+OFaZJjP2PbI8+xUok8yCrny4hsUB5CB4
X-Received: by 10.37.144.10 with SMTP id s10mr1750487ybl.93.1515782708572;
        Fri, 12 Jan 2018 10:45:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515782708; cv=none;
        d=google.com; s=arc-20160816;
        b=bsNWQj5g1JZF9Ik3P2Zfbn74JolgvNIb7BEsVbcA0yoP4lquX0+elj+5jhB/LOFfm8
         +gCJ5hQz8PPoXdKUsP3+YUihnJDhQfS7DGNdJ3ZdKBhrGSUCN1b4XW01rxUr+mcLmxww
         e7cUZ5TPSd8nxRDc4I+9sIuvBXZvtZ+XShb+ngBDcJ6EpQ+U/2Soyxb7CTmzyHJRGj8x
         YKYmJSPNdpmZ2hWE/P9mL3z7nQqyATgkB9Ex6bqXC2d/ZGcyoUpbJ5B/CHEbr7rdKM6O
         le/VUWKleEksCgf3ZZU7We93fvg50BEoj/mr0BkveZ8YEdVYRH8uyFZdx+tSvrIQkCYH
         p5VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=Tj5aly79yx0pP+A0zF6oDtiup0p8tr7crrPNuy4YEdw=;
        b=ZAR+eECUdui3XTD2blOYMjpekWKEBoL4xJVyWqiGHRe/MfYGDYzfvllrUAHjjfzTxL
         gf0rmPSx0cFTSu/DfY9bhP+mDsL1HjF5GMfEIj85BOCJOM14LTXBnsMkaVAcqq7No2hp
         RhPVqmOsLFU3r+tp0WGBPtfPlLOtOsQd1hZofb7G9XQivw9IbLhRNgWApTf7iWNoS+e9
         Eb9dqEJ25TytMY93RLmL6GwHqAu2GvJzBn/Lbb8BULIbyt+aQ9h+WpMiMLydbnddvmtn
         Sqh4IgsBiO5BFElPd0YTZBVNZvIx9e5DQZJfgR87iOCGRDEG4IqGKQ2JctuGVMDxyXq2
         /Hzg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DCK5y18Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i5si4559678yba.59.2018.01.12.10.45.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Jan 2018 10:45:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DCK5y18Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58957 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ea4KC-0005mu-0w
	for alex.bennee@linaro.org; Fri, 12 Jan 2018 13:45:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45163)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ea4K2-0005lV-QV
	for qemu-arm@nongnu.org; Fri, 12 Jan 2018 13:44:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ea4K2-0006Ww-0x
	for qemu-arm@nongnu.org; Fri, 12 Jan 2018 13:44:58 -0500
Received: from mail-ot0-x243.google.com ([2607:f8b0:4003:c0f::243]:46788)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ea4K1-0006W5-RO
	for qemu-arm@nongnu.org; Fri, 12 Jan 2018 13:44:57 -0500
Received: by mail-ot0-x243.google.com with SMTP id f6so5825799oti.13
	for <qemu-arm@nongnu.org>; Fri, 12 Jan 2018 10:44:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Tj5aly79yx0pP+A0zF6oDtiup0p8tr7crrPNuy4YEdw=;
	b=DCK5y18ZpRNIYy4bYeKLJQZRRy/t2Q8OjStt7aUz9EPSmVlcbf1mXJYLctDaJvU2dD
	Yj17VR4OEr7KAyP//7ZC3zSEFM3tlBEhzA/eWyVV5oxx0QCYHglJq409bxG2C0wiuXue
	oHwu21u+B6gcAh9AjGyj38+GrVEuwONcofKNg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Tj5aly79yx0pP+A0zF6oDtiup0p8tr7crrPNuy4YEdw=;
	b=uYyaVJySQNZpqbtGmXioiqMCfXV9CeWuQuxEgQ8ar45TJlIV80TguGGFFbWXxp8lcN
	Zg8T7bEWyoikyWu6X2IIR6dg0KbOXdGUGhwW7mcALdBgl0cB4xwc3Ekvh//BeWy/9MWI
	ENdCX45Zv0AsaF33XH9iOiM4164WOQhPH+/NiivgjtSoc2vuLZKkQflrKY/u0CRc3FDy
	kk1WNsLn67lrlvv4QkP6UISGu8H4aUbLeCFD/WgEMI0soU67Rd7fS/X/UYPJQU23ItXh
	X5n6d5Qimp5Uwr4HHAk2/xckyh2WrNTi7OGhZatWaHlmCkDP2/5bI21iaZCDdI706u9m
	y/jQ==
X-Gm-Message-State: AKwxyteS054SNhD5YcF/m6HpLDtxoCI6T5GXNvLK/LJoAEvcZqnBFmko
	Ao8uu8ttawplHqhObs7t1N08t6fBXeywv74PB+pGSw==
X-Received: by 10.157.29.233 with SMTP id w38mr14219441otw.24.1515782696923;
	Fri, 12 Jan 2018 10:44:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.15.71 with HTTP; Fri, 12 Jan 2018 10:44:36 -0800 (PST)
In-Reply-To: <20171218173022.18418-6-richard.henderson@linaro.org>
References: <20171218173022.18418-1-richard.henderson@linaro.org>
	<20171218173022.18418-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Jan 2018 18:44:36 +0000
Message-ID: <CAFEAcA-e0unT9rx9L0mqCbOwCREDg+-FifKL-mwusNZSRv_Vpg@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::243
Subject: Re: [Qemu-arm] [PATCH 5/9] target/arm: Add
 aa32_vfp_dreg/aa64_vfp_qreg helpers
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
X-TUID: kQ4O+HJS0pC8

On 18 December 2017 at 17:30, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Helpers that return a pointer into env->vfp.regs so that we isolate
> the logic of how to index the regs array for different cpu modes.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -64,15 +64,16 @@ static int vfp_gdb_get_reg(CPUARMState *env, uint8_t *buf, int reg)
>      /* VFP data registers are always little-endian.  */
>      nregs = arm_feature(env, ARM_FEATURE_VFP3) ? 32 : 16;
>      if (reg < nregs) {
> -        stfq_le_p(buf, env->vfp.regs[reg]);
> +        stfq_le_p(buf, *aa32_vfp_dreg(env, reg));
>          return 8;
>      }
>      if (arm_feature(env, ARM_FEATURE_NEON)) {
>          /* Aliases for Q regs.  */
>          nregs += 16;
>          if (reg < nregs) {
> -            stfq_le_p(buf, env->vfp.regs[(reg - 32) * 2]);
> -            stfq_le_p(buf + 8, env->vfp.regs[(reg - 32) * 2 + 1]);
> +            uint64_t *q = aa32_vfp_dreg(env, (reg - 32) * 2);
> +            stfq_le_p(buf, q[0]);
> +            stfq_le_p(buf + 8, q[1]);
>              return 16;
>          }
>      }
> @@ -90,14 +91,15 @@ static int vfp_gdb_set_reg(CPUARMState *env, uint8_t *buf, int reg)
>
>      nregs = arm_feature(env, ARM_FEATURE_VFP3) ? 32 : 16;
>      if (reg < nregs) {
> -        env->vfp.regs[reg] = ldfq_le_p(buf);
> +        *aa32_vfp_dreg(env, reg) = ldfq_le_p(buf);
>          return 8;
>      }
>      if (arm_feature(env, ARM_FEATURE_NEON)) {
>          nregs += 16;
>          if (reg < nregs) {
> -            env->vfp.regs[(reg - 32) * 2] = ldfq_le_p(buf);
> -            env->vfp.regs[(reg - 32) * 2 + 1] = ldfq_le_p(buf + 8);
> +            uint64_t *q = aa32_vfp_dreg(env, (reg - 32) * 2);
> +            q[0] = ldfq_le_p(buf);
> +            q[1] = ldfq_le_p(buf + 8);
>              return 16;
>          }
>      }

After reading patch 7 I came back to this one. I wonder if these two
(which I think are the only ones) justify an aa32_vfp_qreg() ?

thanks
-- PMM
