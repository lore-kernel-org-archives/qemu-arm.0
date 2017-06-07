Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id x20sm2107496wrd.63.2017.06.07.09.13.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 07 Jun 2017 09:13:20 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id ACC823E0410;
	Wed,  7 Jun 2017 17:13:46 +0100 (BST)
References: <1496849369-30282-1-git-send-email-peter.maydell@linaro.org>
User-agent: mu4e 0.9.19; emacs 25.2.50.3
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [PATCH] arm_gicv3: Fix ICC_BPR1 reset value when EL3 not implemented
In-reply-to: <1496849369-30282-1-git-send-email-peter.maydell@linaro.org>
Date: Wed, 07 Jun 2017 17:13:46 +0100
Message-ID: <87a85jdbd1.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: hGIHPcKCtXiz


Peter Maydell <peter.maydell@linaro.org> writes:

> If EL3 is not implemented (ie only one security state) then the
> one and only ICC_BPR1 register behaves like the Non-secure
> ICC_BPR1 in an EL3-present configuration. In particular, its
> reset value is GIC_MIN_BPR_NS, not GIC_MIN_BPR.
>
> Correct the erroneous reset value; this fixes a problem where
> we might hit the assert added in commit a89ff39ee901.
>
> Reported-by: Alex Bennée <alex.bennee@linaro.org>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Alex Bennée <alex.bennee@linaro.org>

> ---
>  hw/intc/arm_gicv3_cpuif.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
> index 09d8ba0..5cbafaf 100644
> --- a/hw/intc/arm_gicv3_cpuif.c
> +++ b/hw/intc/arm_gicv3_cpuif.c
> @@ -2039,11 +2039,7 @@ static void icc_reset(CPUARMState *env, const ARMCPRegInfo *ri)
>      cs->icc_pmr_el1 = 0;
>      cs->icc_bpr[GICV3_G0] = GIC_MIN_BPR;
>      cs->icc_bpr[GICV3_G1] = GIC_MIN_BPR;
> -    if (arm_feature(env, ARM_FEATURE_EL3)) {
> -        cs->icc_bpr[GICV3_G1NS] = GIC_MIN_BPR_NS;
> -    } else {
> -        cs->icc_bpr[GICV3_G1NS] = GIC_MIN_BPR;
> -    }
> +    cs->icc_bpr[GICV3_G1NS] = GIC_MIN_BPR_NS;
>      memset(cs->icc_apr, 0, sizeof(cs->icc_apr));
>      memset(cs->icc_igrpen, 0, sizeof(cs->icc_igrpen));
>      cs->icc_ctlr_el3 = ICC_CTLR_EL3_NDS | ICC_CTLR_EL3_A3V |


--
Alex Bennée
