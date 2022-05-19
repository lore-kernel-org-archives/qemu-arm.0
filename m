Received: by 2002:a19:ef07:0:0:0:0:0 with SMTP id n7csp1068473lfh;
        Thu, 19 May 2022 04:36:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJypQ/QxNCu5ejwZLDdEHivTAODmXp5spn16WMBs4mGQz5LYYsaP24BfcXVoa5nBby76d5id
X-Received: by 2002:a05:6214:d0c:b0:45b:3c7:fd68 with SMTP id 12-20020a0562140d0c00b0045b03c7fd68mr3420087qvh.77.1652960192229;
        Thu, 19 May 2022 04:36:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1652960192; cv=none;
        d=google.com; s=arc-20160816;
        b=U6oIYB/yWMgyM5VYtTmxxE8w/nItnPO+L3l/gjrqVbDCku1EKznipQ03dSuYIgEyFd
         AUvHSnk6O0jTkBR0xen9JczrTo3Q7zVCQChqWk/hKa1YCbx6D1dhrktW1+kdxK1aHSvV
         /Uvex2a4YxUol9lcEKYlEOBf4C3vk5dl7rHdLuXHeCr59mKZQWIzRKH2a5/GYh/T5dYB
         5cYMtkxC0JXozadZfRkSqvuz79eLb14j/6RiiYFjMYg5IN1dO9hD38g3H/twNoj4IGZH
         SC7z+Kwr1tDmwaNnBdCQyyYDC+Rf/2+0g9Cn3Ut88ULj/t78IGSZtoX4xQONKkw0gBPt
         z7fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=wITwYHXpB40U77MD2w2HBo2qi2Lnz9Ej7GevTKq/v2k=;
        b=a0FmlvCww1fKGfJSizle9ag93vwcPqskQIJLWgOUqX4MXUuaHWIUY0piZq9RPnrSNt
         Xh0421+NFYTeyjc4GWbVLvqRAMDHLcbyf1xvZa+SCm9poam+E5gFmtWJJT5D934nsT0C
         Yf7LLpav99lu+f5hDkA0HSlZEvYNUdPXg5T6h2MxtmBCwImhYoUyZLWHjY/U/ahH2uZt
         T9mliwSYzJyJ0mr5mIP3C/ZZcfeXXPYRbS/rmgfQGDiq5VGcCQKtP2rSof/x2B1rYYru
         jodE8Sn4s1+iNM/2PGlnqaYHAN7uweWWxWVbMEx6c4u9eqyNzZVf2Koja1WXurMmHbFv
         aneQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Naiv2gj1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id hu7-20020a056214234700b00454cc0fc323si927313qvb.43.2022.05.19.04.36.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 May 2022 04:36:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Naiv2gj1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nreSF-0003OZ-NQ
	for alex.bennee@linaro.org; Thu, 19 May 2022 07:36:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nreRy-0003HJ-7i
 for qemu-arm@nongnu.org; Thu, 19 May 2022 07:36:14 -0400
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:36839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nreRw-0003ZZ-CJ
 for qemu-arm@nongnu.org; Thu, 19 May 2022 07:36:13 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id t26so8529532ybt.3
 for <qemu-arm@nongnu.org>; Thu, 19 May 2022 04:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wITwYHXpB40U77MD2w2HBo2qi2Lnz9Ej7GevTKq/v2k=;
 b=Naiv2gj1V60id/LH0NJrQAV3pzK4Wzpe1VTTgP6iumQQndB7Fmnz81IU70t7//2vYH
 YwMMDLN4Y50cozwQc/SThuaLfAfrfGl67HSa/EE2QXjyrL63aIQbIFKbm5nzFWWK8IBL
 f9rolTaZpl2HMgfqBw7sWS9nwV1r8csKsnttzoXs8JeKK3XBVWt6bo5U21RMAqHbn7/D
 FvpOQ7ZlvYKZ2sU32VzCmorp08q4N8TAsa9ZAkpA/hko+NVbvkJC0zhMBRGcZkXgDOK1
 kMVhYdjl3yvJQO2g++Mo8CdXFnivPjJ471UIrxWN0cQ7WgW7psn3lG2JUGtpyUv+Ortq
 i9fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wITwYHXpB40U77MD2w2HBo2qi2Lnz9Ej7GevTKq/v2k=;
 b=VKmoO2vudhRmdGjBw+ub38NOVlxhbd/ZRm+xUldGktz6pww5d5T1Q4e1Rlc8CY49iI
 ApC32QUn1FGgeu9h0m2IU9QnA3zhAzx2be8d1E8PbCUSBmMZSwqoClfRzelqCt6UTVkM
 dPO1trEy9RXVdvVOxIfKnHjBhqcGcRcO7qkmUS77pKKITg6PcM+RB1Zf/oW7tlVfgt9C
 SXWXfkNEn/6kuAN79bNF6lSZGRvWUexs6d8FNzWsrJribSUQ27GkjEuOyVGGwFEG0Gw3
 N/0T6euvU8U56RrK634exKqxL1LxfzQQ6DkQy7yTjR70DFGlVn98kloB3wOHnQfw2kRZ
 nwyQ==
X-Gm-Message-State: AOAM531OR7P7fQpGacqFMEoPCEVJVj3FNOXd2pouitP4Eu/2hyE30iC9
 +PyBwfrDCNFtWVRoeJpfKOAcR0/6dTA+XQDf+fzxAw==
X-Received: by 2002:a05:6902:102a:b0:64f:4132:9be with SMTP id
 x10-20020a056902102a00b0064f413209bemr1457254ybt.288.1652960171292; Thu, 19
 May 2022 04:36:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220517054850.177016-1-richard.henderson@linaro.org>
 <20220517054850.177016-7-richard.henderson@linaro.org>
In-Reply-To: <20220517054850.177016-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 May 2022 12:36:00 +0100
Message-ID: <CAFEAcA_oX3RRc4mLtBZc8SH9pjAM_cDQzqgzoqxH+8+Rct68mA@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] target/arm: Remove fp checks from sve_exception_el
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HS4IWJPMYWTo

On Tue, 17 May 2022 at 07:00, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Instead of checking these bits in fp_exception_el and
> also in sve_exception_el, document that we must compare
> the results.  The only place where we have not already
> checked that FP EL is zero is in rebuild_hflags_a64.

aarch64_cpu_dump_state() calls sve_exception_el() and doesn't
check against the FP exception EL.

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.c | 52 ++++++++++++++-------------------------------
>  1 file changed, 16 insertions(+), 36 deletions(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index edeab4e473..05baa73986 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -6136,10 +6136,12 @@ static const ARMCPRegInfo minimal_ras_reginfo[] = {
>        .access = PL2_RW, .fieldoffset = offsetof(CPUARMState, cp15.vsesr_el2) },
>  };
>
> -/* Return the exception level to which exceptions should be taken
> - * via SVEAccessTrap.  If an exception should be routed through
> - * AArch64.AdvSIMDFPAccessTrap, return 0; fp_exception_el should
> - * take care of raising that exception.
> +/*
> + * Return the exception level to which exceptions should be taken
> + * via SVEAccessTrap.  This excludes the check for whether the exception
> + * should be routed through AArch64.AdvSIMDFPAccessTrap.  That can easily
> + * be found by testing 0 < fp_exception_el <= sve_exception_el.
> + *
>   * C.f. the ARM pseudocode function CheckSVEEnabled.

We should probably note that the pseudocode does *not* separate
out the FP trap checks, but has them all in the same function.

>   */

>          /*
> -         * If SVE is disabled, but FP is enabled,
> -         * then the effective len is 0.
> +         * If either FP or SVE are disabled, translator does not need len.
> +         * If SVE EL >= FP EL, FP exception has precedence, and translator
> +         * does not need SVE EL.  Save potential re-translations by forcing
> +         * the unneeded data to zero.
>           */

These comments say that if SVE EL == FP EL then the FP exception
has precedence, but looking at the pseudocode CheckNormalSVEEnabled()
it seems to be the other way around:  eg if CPACR_EL1 has
"disabled at EL0" for both the .ZEN bits and the .FPEN bits
then the SVEAccessTrap() is handled first.

thanks
-- PMM
