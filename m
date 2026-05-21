Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAFE4CD5BAC
	for <qemu-arm@archiver.kernel.org>; Thu, 21 May 2026 16:43:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wQ6Tz-0002K9-05; Thu, 21 May 2026 12:42:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wQ6Tx-0002JV-DU
 for qemu-arm@nongnu.org; Thu, 21 May 2026 12:42:49 -0400
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wQ6Tv-0003AW-J2
 for qemu-arm@nongnu.org; Thu, 21 May 2026 12:42:49 -0400
Received: by mail-yx1-xb133.google.com with SMTP id
 956f58d0204a3-65c7efdb7d8so6793949d50.3
 for <qemu-arm@nongnu.org>; Thu, 21 May 2026 09:42:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779381766; cv=none;
 d=google.com; s=arc-20240605;
 b=Lsgxza4mCvbz+mQYJCk/8Xeg2WKeQqFOPTvaV6+7uE3dyyON7t1txpPPJv30mzvHe8
 KNytvJvHu10fOxjYp+OedQpcCmVu3qoFCOqhghTYNlN5WMSuhLL3p4JIVx2FnCzfSqMN
 rAnZgGtOyuDvUu1F5MMwdBqSZWoJcxbBTcK/PxeomouU4u7EaonnJ+tAnQ7WU2Zcug+e
 WEb1GbXG54NfpV2WWel46uok9lRja6rIfBNg82NVOwqoPI0Yh2mhk8YZQ5Fej4Jsk1Pk
 bEGn66L6gP6/U4gZW/FByYe5oj3SrURZC1zqi8cNMrNEJy90IXksWcdkSKlY0XPo36L5
 vaLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=ERQHoPK48RtEl3HMvfGHVAAti7bwRuPobKLgXU+qz28=;
 fh=wuWR8lxhAt2TcBDoM8v4WMQqc/fiDzaTeaU6kbS1rwc=;
 b=QjE7Ul0Afn00FgkC7y0oHl7y959iXgAs1bXodeyZje/crzwQaKjak4imPSkN7X+Rjk
 XIXStV5vRV3V/r1HEF0qRvzNRmcNoZhkw9PMddsgpctucsepjzI2b1c8LCgX//9bHLEp
 k4lyandl/xS4xLbvfd02yb8js3vQ76UhjVDmXlVIaemJjoH4oGAM4CQ59JrxATBX5zA7
 ddISwC3Cdz44sDX88dXSLtVHOP3LXUiVNZ+UbWSUaIisJrNkPm+fNGVzj9TZHszmjWZu
 5QuI9QmUttcXG+1HovBSJgszV/LtugiqW46HMxbL2JTsVWdql75/V3DtWQ3QGp0h4P3j
 Sggg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779381766; x=1779986566; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ERQHoPK48RtEl3HMvfGHVAAti7bwRuPobKLgXU+qz28=;
 b=Wkyhmb9FGbWiiQrulnjH29QnGlB4r7L52+ht48D3pdDqbpk7C8Fh2yHqOAyZHWhYYF
 MIV3N5H0DBva3mQsvFFvdRdbdVXEF3UfA5lSmi6EXeVXHtIHGdDMAfY8YGLKEdHTprAw
 2MjNB5T0iRWo62a/3hGCd08UWdiOe7jHgp+2NfVoNJGKvUpr3O14fGoPcigC6M7FTptv
 PlJl0xaw3FpwuRi0w7t+YIgkjdjoxE/zFP1kGV5srUCXVN4aXOMTuF/Kr8AXBYbdebHK
 4QW39TybwQscjoUsC8UYzlASnl4pdsT6w2Fvc96KLnhWLk6BYRiqBU16hd4RzdMkUHXW
 iZxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779381766; x=1779986566;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ERQHoPK48RtEl3HMvfGHVAAti7bwRuPobKLgXU+qz28=;
 b=KhcoGmhdnf8muNLZUD7LYDAeX4Ty5Mpw61FPR9heyMZQglKyMbm7ymX0PbfGOt+2uI
 pg91mmydt9sQqyVEkhgl5I82qlz7RYDVeOzDn2CDxQivEgqFX5uE4zLrfAiP+s17N9E1
 Fu2TaaNfk32o0r9iml6X/C2n/BJTytYEPRYUSowGNUiGh3Civ1hlmQGmrJMNSUShB/9/
 iSI5fDlhjXWG27He9gXub+sVxQBzW5ZsUzd8+m2pKbi8Exi0RnkK2BM3X2gl0XGbI7CM
 nyRjhpYfX4q+pS2Pu/RY2DuJPRqRhVhkRfnlwnPyLu9VM7HdG1dFxKCTa2+WvhdgFz1E
 vnwg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/khfxRoJ67bTUk3A/7frYtzuql4z5MpK7c1Rha9RnyuBmP28EpuLMMsI2e8h+iZ26laDwWRl8Egg==@nongnu.org
X-Gm-Message-State: AOJu0YxIY1xRm79Mi4Hp1YNZPgZflqZ865JfCwAmyDoarx9SaGR78hor
 0LFfP2xCDLakNjwhlefWjOxRcUYq1FETnRFMSvD0CQAucXbi87tChublqW9uNKYUyehbTYZMPoS
 031R8NcGpRRH0EKjuwrbc1mXG9OJJya8S4PNRmbEMuA==
X-Gm-Gg: Acq92OHcnKWAxhjH+LnkNkYnEIRqC/j7wEeDsEK6No4226HzLLLiLUgtCBqR9A0l0eq
 iEU6oZ1njGIQN6ThUhn9pLfxI7oX91x+V/YOyobPMuKUHOa2iPqMLLNyOIRZsKHQtJU96dgTWYi
 yHySVWM4FfC33yiQ9D35OvP63At9UKtwh+HNurryRnqoLzBQPswmghpo7W5hGgVT0xNBviobrGG
 tGLzKYKOoMNfHLLAb4YCOctxDSkZ+bbP63k89N4rCkqAh/bpH5KlVP6dAAGLbAhQQePo9JyDco6
 lQ2lWRegRQBJmCopsFQEgN3n67fwJmOzEE8oH+zullh7Uxz3uxfggKAwllft9MU22HA=
X-Received: by 2002:a53:c044:0:20b0:65e:44a3:ac3 with SMTP id
 956f58d0204a3-65eae440399mr2459751d50.50.1779381766228; Thu, 21 May 2026
 09:42:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260520182213.872945-1-richard.henderson@linaro.org>
 <20260520182213.872945-64-richard.henderson@linaro.org>
In-Reply-To: <20260520182213.872945-64-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 May 2026 17:42:35 +0100
X-Gm-Features: AVHnY4JBq3C2LiDBD92Bk71FZ76hfB2ehhtSG6ohY_YD7UAiyt_GMFFg5FZ0D-E
Message-ID: <CAFEAcA90jtHDCXGuTUUu7ErLcH=wMCPmqOEi3X-n2WriLoWEkw@mail.gmail.com>
Subject: Re: [PATCH v6 63/64] linux-user/aarch64: Implement hwcap bits for fp8
 features
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb133.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Wed, 20 May 2026 at 19:29, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/aarch64/elfload.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/linux-user/aarch64/elfload.c b/linux-user/aarch64/elfload.c
> index 3af5a37776..0934524be2 100644
> --- a/linux-user/aarch64/elfload.c
> +++ b/linux-user/aarch64/elfload.c
> @@ -218,6 +218,20 @@ abi_ulong get_elf_hwcap2(CPUState *cs)
>      GET_FEATURE_ID(aa64_sve_b16b16, ARM_HWCAP2_A64_SVE_B16B16);
>      GET_FEATURE_ID(aa64_cssc, ARM_HWCAP2_A64_CSSC);
>      GET_FEATURE_ID(aa64_lse128, ARM_HWCAP2_A64_LSE128);
> +    GET_FEATURE_ID(aa64_fpmr, ARM_HWCAP2_A64_FPMR);
> +    GET_FEATURE_ID(aa64_lut, ARM_HWCAP2_A64_LUT);
> +    GET_FEATURE_ID(aa64_faminmax, ARM_HWCAP2_A64_FAMINMAX);
> +    GET_FEATURE_ID(aa64_f8cvt, ARM_HWCAP2_A64_F8CVT |
> +                               ARM_HWCAP2_A64_F8E4M3 |
> +                               ARM_HWCAP2_A64_F8E5M2);
> +    GET_FEATURE_ID(aa64_f8fma, ARM_HWCAP2_A64_F8FMA);
> +    GET_FEATURE_ID(aa64_f8dp4, ARM_HWCAP2_A64_F8DP4);
> +    GET_FEATURE_ID(aa64_f8dp2, ARM_HWCAP2_A64_F8DP2);
> +    GET_FEATURE_ID(aa64_sme2p1_lutv2, ARM_HWCAP2_A64_SME_LUTV2);
> +    GET_FEATURE_ID(aa64_sme2p1_lutv2, ARM_HWCAP2_A64_SME_LUTV2);

Accidental duplicated line?

> +    GET_FEATURE_ID(aa64_ssve_f8fma, ARM_HWCAP2_A64_SME_SF8FMA);
> +    GET_FEATURE_ID(aa64_ssve_f8dp4, ARM_HWCAP2_A64_SME_SF8DP4);
> +    GET_FEATURE_ID(aa64_ssve_f8dp2, ARM_HWCAP2_A64_SME_SF8DP2);
>
>      return hwcaps;

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

