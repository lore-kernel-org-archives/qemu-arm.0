Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp486104wrw;
        Fri, 16 Nov 2018 06:59:45 -0800 (PST)
X-Google-Smtp-Source: AJdET5d0stON8mLBmTaUSUjg+V5NMOKqn74IaYwHIEYL5nisR55Z4hNzgJbS7wwVy3Tcd1mHdtET
X-Received: by 2002:ac8:274a:: with SMTP id h10mr10490446qth.189.1542380385343;
        Fri, 16 Nov 2018 06:59:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542380385; cv=none;
        d=google.com; s=arc-20160816;
        b=GW2ySZVrYrTYtZ4sKiTU0u/LGQucAxtFSEyAXnVpSTjx53M0emve3bYE1rTZMHdkZU
         cR/dip8u/Kooo5yBZvSEgduWnZLtMUvo3hAjTMSl4zsUn8KrHkvupAQzsWQZTsOWo1MG
         4wn7tN7wdY5qScIyenzARonJeS4rxl6NYVpnZ3gtKtgaAxeh6LyWgBWOjlN/nFaMiWO5
         PGoXSW+7bYILXlEHsOeAUGxiYOxofJwaFpZUQvIaD93no7pXb3f+p2PkRQYEIbk9tX8H
         iJRpffFsxFlM4tGS45q21ut8XhXrMkQvGCyOErVBvbv1y1BrCfE8YOoR55jdnFhuhnRX
         ugqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=5hkDJyks8GsERFvTocxRPhVxjf7lfvvXX4lZDc9Y/wQ=;
        b=LbdWwz8Ozp6/4YasH4obbwPxAwOCA/LZTiEzrD/zboqY99q8rSwAEgtflWBwhI3f41
         whgFbn6L93OJxW+hQo//j2qGy/fSIjU+y9d866fAvT5WfMPi+frSEaP2y1Zq5VdL1Em9
         o/o2SZWdMiP+fXtqr93gdWARuw34lfdsgVZO/nSfJ705em53miUZLzzmlAuZ3IR5tgKa
         HWU3FYoMvvQGTji/wwM+ATIMZwKPk8r5KHOidjtjYuxhfuiOIknKzxHO82BnDFMcZJg/
         9vxMvftCe1aI3ocUszQJwsCIcYrulWLHHlzsWv1XvGU7XClS73b2KC78VTt6DVayc0lb
         Fcog==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TR9N4LPX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g188si1012075qkf.215.2018.11.16.06.59.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Nov 2018 06:59:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TR9N4LPX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45189 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gNfay-0001om-Ot
	for alex.bennee@linaro.org; Fri, 16 Nov 2018 09:59:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38945)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gNfas-0001oh-AN
	for qemu-arm@nongnu.org; Fri, 16 Nov 2018 09:59:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gNfao-0002V9-QP
	for qemu-arm@nongnu.org; Fri, 16 Nov 2018 09:59:37 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:42772)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gNfag-0002PA-0P
	for qemu-arm@nongnu.org; Fri, 16 Nov 2018 09:59:27 -0500
Received: by mail-oi1-x243.google.com with SMTP id w13so7255700oiw.9
	for <qemu-arm@nongnu.org>; Fri, 16 Nov 2018 06:59:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=5hkDJyks8GsERFvTocxRPhVxjf7lfvvXX4lZDc9Y/wQ=;
	b=TR9N4LPXzTvRNs+D7E862JwAEhX34jgU2+5o2Mng7JD8/qr3oRFHuQqt4pYQUysiv3
	SmUO+H1LNIApnuHoPNVzLqCQWmsLpVrMyjPjsFMuuTMviE25XtKCRBnUuGFS6RKV4hWn
	6TF5wPDc5eYoSCiTvumafEF7EqdrU+6pW4GWQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=5hkDJyks8GsERFvTocxRPhVxjf7lfvvXX4lZDc9Y/wQ=;
	b=bqIGmnqBRER/9RRCorbeWR90Pz7H3dLDUNMcARiiWS9B8CsFtOb0ZW5RTad6QqLwQN
	nkQr6ZLv498hOHcbjmM55V8LaJ6I57BFGu3UgAx06qM9+nXeT2WXxfl3rSnBXTZpzktO
	pKergeqR+nqXj2LrYgddkCkCVzgtKWDYx8WyoqH0I8RShWz8RlYS7vrA1d7/9cCFnJ3h
	yqILhbN1P79/vAXRb0x/Tz/YwXIdUUnufeBIqENCS6lCGzoQygB+7ASKXks+QL90GPG/
	CKvlEgEQ4lmacI+W+obL31sXAv74XQXxkkehByhmkJJ6Qw2VDRTKjFn+0gFKJCLs/Fmv
	V2iQ==
X-Gm-Message-State: AGRZ1gJYPN4Kbvgpx8vdavdzLNLkv3cCOQPycQuP40cSzbwdwbhXqggw
	hDHk1zZ6E7Rt/kb9aDcBYiZT5C4VYKOlWG7g152SGg==
X-Received: by 2002:aca:b68b:: with SMTP id
	g133-v6mr1182530oif.25.1542380363521; 
	Fri, 16 Nov 2018 06:59:23 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9d:4b0e:0:0:0:0:0 with HTTP; Fri, 16 Nov 2018 06:59:03
	-0800 (PST)
In-Reply-To: <20181105185046.2802-11-aaron@os.amperecomputing.com>
References: <20181105185046.2802-1-aaron@os.amperecomputing.com>
	<20181105185046.2802-11-aaron@os.amperecomputing.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 16 Nov 2018 14:59:03 +0000
Message-ID: <CAFEAcA9ymwu8YzJoBsAP-7==MtxC=tf2YOyV1D5ORRMbVoXS+A@mail.gmail.com>
To: Aaron Lindsay <aaron@os.amperecomputing.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::243
Subject: Re: [Qemu-arm] [PATCH v7 10/12] target/arm: PMU: Set PMCR.N to 4
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
	Digant Desai <digantd@codeaurora.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IAIkKCYUCjh1

On 5 November 2018 at 18:52, Aaron Lindsay <aaron@os.amperecomputing.com> wrote:
> This both advertises that we support four counters and enables them
> because the pmu_num_counters() reads this value from PMCR.
>
> Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
> Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
> ---
>  target/arm/helper.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index e3ec36490c..11eb62bdda 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -1753,7 +1753,7 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
>        .access = PL1_W, .type = ARM_CP_NOP },
>      /* Performance monitors are implementation defined in v7,
>       * but with an ARM recommended set of registers, which we
> -     * follow (although we don't actually implement any counters)
> +     * follow.
>       *
>       * Performance registers fall into three categories:
>       *  (a) always UNDEF in PL0, RW in PL1 (PMINTENSET, PMINTENCLR)
> @@ -5508,10 +5508,10 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>      }
>      if (arm_feature(env, ARM_FEATURE_V7)) {
>          /* v7 performance monitor control register: same implementor
> -         * field as main ID register, and we implement only the cycle
> -         * count register.
> +         * field as main ID register, and we implement four counters in
> +         * addition to the cycle count register.
>           */
> -        unsigned int i, pmcrn = 0;
> +        unsigned int i, pmcrn = 4;
>          ARMCPRegInfo pmcr = {
>              .name = "PMCR", .cp = 15, .crn = 9, .crm = 12, .opc1 = 0, .opc2 = 0,
>              .access = PL0_RW,
> @@ -5526,7 +5526,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>              .access = PL0_RW, .accessfn = pmreg_access,
>              .type = ARM_CP_IO,
>              .fieldoffset = offsetof(CPUARMState, cp15.c9_pmcr),
> -            .resetvalue = cpu->midr & 0xff000000,
> +            .resetvalue = (cpu->midr & 0xff000000) | (pmcrn << PMCRN_SHIFT),
>              .writefn = pmcr_write, .raw_writefn = raw_write,
>          };
>          define_one_arm_cp_reg(cpu, &pmcr);
> --

With PMCR.N > 0, this means that MDCR_EL2.HPMN behaviour and
more generally support for the EL2 performance monitor trapping
options in MDCR_EL2 become relevant. But I think we're probably
best off leaving that for a future patchset.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
