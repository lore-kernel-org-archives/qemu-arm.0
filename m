Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1516737lfm;
        Thu, 18 Jun 2020 03:52:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyHlOfnwQbaUHZmxlLYSn7Iw66GswI4MPNt+MqL479snBWqK+lnGfUiWb1ru86aIL87zUst
X-Received: by 2002:a25:d08c:: with SMTP id h134mr5514895ybg.513.1592477577623;
        Thu, 18 Jun 2020 03:52:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592477577; cv=none;
        d=google.com; s=arc-20160816;
        b=qNQFZ6Wbz2A5NtImWNZKpSJ9AfNBdMu+udaPX7Nf4JvDmzU9JUSWUW/9gxmw/7Lf2K
         4rnOAnnX5hcIhO2Zrwp6UsxnXvut70IrQzh/ED6z3bjCUcDBiRGWH4qCqG/VuPv9daqr
         LxiwndoakFyMQf4ht2EM99aGVMz7A6wLvIrp+ex14H5xeqWD9vTWiPhomAz4BKC3Ig5F
         IhMevLxQf21ZMr2z6vjPPjOh/dXX+/okeD8l2C6T2Ath8y3MNlkzaZLkijZS1+qimjyE
         QCjZmy4fcaSr1mOXYJ2OroeQbji0kv6EblOW576CDXF1E9jpZAoCqQO5/96HnQrcFvhw
         xhwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iVZxlubKdO45F+wI2LxuA9yidpgPj1lhxOvNIiLJ0t0=;
        b=Do5xPhsCCjzhQCmz8O+Mm2l64QrL+kAMT719r0iAZIXNA4SjkxFFLAyc/VtTXflL0I
         ToQD6G5Uuome/9CuAFfLyemOSFj+fwfzEDWzeO4HWZWkBrV7C3FwCLVb21s82Jygdl6i
         77UXOlcSEW/g7afEQ4iw3+dZ4cET/IXlV+vDkMdPfntN1eqba7w+sUPahnTp6FoosC0C
         1HM1XRcnIR4dMU2EFbDftJCt5WQkHQlMVGEdjGMD2gsL+psm0CXuHjgP4oljZTW23S6H
         Z9o/kqUqF6/xpyoN26dodO19wSl01Y0t/hwqBv8U2IAOW7mKwRDF0igY+i11M9vyfhMR
         cgcA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CjxqTUDc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l83si2194166ybb.393.2020.06.18.03.52.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Jun 2020 03:52:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CjxqTUDc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlsAC-00064Z-Ui
	for alex.bennee@linaro.org; Thu, 18 Jun 2020 06:52:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jlsA1-00064E-4m
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 06:52:45 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:39907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jls9y-0002Iw-Ny
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 06:52:44 -0400
Received: by mail-ot1-x344.google.com with SMTP id g5so4164214otg.6
 for <qemu-arm@nongnu.org>; Thu, 18 Jun 2020 03:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iVZxlubKdO45F+wI2LxuA9yidpgPj1lhxOvNIiLJ0t0=;
 b=CjxqTUDcf2py6QIIe63ETfCfiIMeSPODgUlaYu/VCq0PZsWNONP1qLp1H/4Ris6XQF
 5py7vMpjjkQd4dnyMRwDzHYholioMMBsmTxRgTHng/Au6PodOf0otHJCDEQeP3Z3Vydi
 fPngIQS4gB5se/6WlrPqvWfegtXxDr9ItFuGu0KLWKXLT1BlDAbAS7W0R8q3G5EihMIy
 ru+bVAuC4yJ09wIPzrMqI1sVgUOih2GlDe7+KYQDEZ+b/nAzuJUNSuE2KZJFrWNsmIvT
 wqJ7BbgRia0rRki89GD73GrEPn+roojZKdmemp1WDklTZLsQhWvn6vXbgXJflrDJmfrC
 aYRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iVZxlubKdO45F+wI2LxuA9yidpgPj1lhxOvNIiLJ0t0=;
 b=iQDZ8xfMjZ1CB4LqmKEQRmD5WpbcyN0leMeV3sCK25RDVT3GbSq0mUAYg5nii+6jun
 IoSi3zmIBbXzxvuJfo+lvL2KLUn8fTQbT77PRR0mDy15CpigXdek3bU9F3GDH2UmhpDl
 6oV1Izh6OlceVelz0/0iawY19qO9/TAq4gNsEQUgK/eHO5WPECxFQXH99J1RnMaC9t8Y
 IP4zmxcpoXgbG8kSsiYJBCJ2TGvvZXq36+DgHF6suYuvWMcsjivgM3asO6oxZ4f9zuQJ
 OPey3xMkKX3t/Wk/dlaC2vmlCuectvD55N2DK1k+tXkhpMn3Efw2qByqvWZ3+bxam4jJ
 606A==
X-Gm-Message-State: AOAM532jl4uLXtnt01B8cyMG95ZoaMsGgUf7WpykQsHB+TgYpKQB95i3
 th4vk2VNwHzSXCwA8bPU0lldGiX0Pvu3YAksunjjDA==
X-Received: by 2002:a9d:67d6:: with SMTP id c22mr2736190otn.221.1592477561358; 
 Thu, 18 Jun 2020 03:52:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200603011317.473934-1-richard.henderson@linaro.org>
 <20200603011317.473934-4-richard.henderson@linaro.org>
In-Reply-To: <20200603011317.473934-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Jun 2020 11:52:30 +0100
Message-ID: <CAFEAcA9bAt=cG9nSWP6JaVyx4jf2UGmYLKzvaJ7rVCdLVpw2ig@mail.gmail.com>
Subject: Re: [PATCH v7 03/42] target/arm: Add support for MTE to SCTLR_ELx
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: t8DQafLRYNT8

On Wed, 3 Jun 2020 at 02:13, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This does not attempt to rectify all of the res0 bits, but does
> clear the mte bits when not enabled.  Since there is no high-part
> mapping of SCTLR, aa32 mode cannot write to these bits.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.c | 23 +++++++++++++++++------
>  1 file changed, 17 insertions(+), 6 deletions(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 2ec49c1a55..7862bf502d 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -4698,6 +4698,22 @@ static void sctlr_write(CPUARMState *env, const ARMCPRegInfo *ri,
>  {
>      ARMCPU *cpu = env_archcpu(env);
>
> +    if (arm_feature(env, ARM_FEATURE_PMSA) && !cpu->has_mpu) {
> +        /* M bit is RAZ/WI for PMSA with no MPU implemented */
> +        value &= ~SCTLR_M;
> +    }
> +
> +    /* ??? Lots of these bits are not implemented.  */
> +
> +    if (ri->state == ARM_CP_STATE_AA64 && !cpu_isar_feature(aa64_mte, cpu)) {
> +        if (ri->opc1 == 6) { /* SCTLR_EL3 */
> +            value &= ~(SCTLR_ITFSB | SCTLR_TCF | SCTLR_ATA);
> +        } else {
> +            value &= ~(SCTLR_ITFSB | SCTLR_TCF0 | SCTLR_TCF |
> +                       SCTLR_ATA0 | SCTLR_ATA);
> +        }

Doesn't SCTLR_EL2 have the same "no ATA0 and no TCF0" that
SCTLR_EL3 does?

thanks
-- PMM
