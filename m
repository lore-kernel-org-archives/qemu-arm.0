Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F20BCCD18D
	for <qemu-arm@archiver.kernel.org>; Mon, 13 Oct 2025 13:51:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v8Iwt-0006h3-Uj; Mon, 13 Oct 2025 09:50:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v8Iwr-0006gk-2D
 for qemu-arm@nongnu.org; Mon, 13 Oct 2025 09:50:49 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v8Iwo-0008N3-9n
 for qemu-arm@nongnu.org; Mon, 13 Oct 2025 09:50:48 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-781421f5be6so5053487b3.0
 for <qemu-arm@nongnu.org>; Mon, 13 Oct 2025 06:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760363442; x=1760968242; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=B9dMIVS73mWDE4Lqp7+S3qAEr4HjA/1yzsmF8bF7IVA=;
 b=cnmCgAoyKr+qw5HlqkZurWhmI66Fg/R11drUuCqhs9egYFqxZFsSPIeAkDdexEe6CT
 L4SciDWeb/13peQV4jf61mwL16CShaxB7KKfShbB3JCAfXUdfk0VbKe0x8OduiU1Pyee
 +8uctn7CCCMeJ0LZjxu/LYYc1/RVN51bwG1CoiTjQWTIXKnChFHrKAeyDkJ8fmQ1Zwhl
 KUbCoXMxpcO0I56aUTA2D6GBjVEZno+qso6qsz8LgTE+JFQp5KSdvb02NyHJUYFnTfA+
 UZULLJgzl+z07C8jxH3BX68KD+6BcJ/PIuNmHxvQp5gKWrP05FI/N5xwDrcsuL2JkIVP
 60HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760363442; x=1760968242;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=B9dMIVS73mWDE4Lqp7+S3qAEr4HjA/1yzsmF8bF7IVA=;
 b=k+7rSJKDRgM+1Gp69X++rGKeqZ+Zybt+uMlnAvGF/kLUawRvGTKBj8OZdo8SVEUAX5
 cTAwoZl7Zk5BJp7+dEgFeI8llvN5AhV2UmzN9U3vI/AqyYhRE2oq4xkvi3iEVpArqYdH
 dcsIm04BpvFWoWQIoRFvnDCSPz1Z0bKdGE+Nq+WuTgvloV6S/8rOEWfOOJX1X2285DbV
 zCcBYWtgU2EufOHO4wBDznDivYJ8QCTeyyAjTDdTyg4iwIE/MHpVvtQ82WJFEs79+z73
 ILv6N3qC5dNrnREMiyASnjiJRSMAsH7HH2TBpmmkhWObpUZNGqX/gNdLz8mj125il4AO
 IPZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSX2bqMEkcQeblz8dkGffdTrHSo9St2KWDB9yqN+TQDaT3jfz2K2XgMzwgW4AZYOWu7Kry6o/J/g==@nongnu.org
X-Gm-Message-State: AOJu0YwyJm5ugMbtrBTQca5sJORlxPOtnkeVzlMiIAfdbmyGcG87bO2s
 IBIfw/5HTFw9qpbkKqCJ/yDN3oGEAApNwXPuYFnX8OZdIgPT/hklEetxQs09gDFBVm/5azytnSY
 RX+hlMSxGiAlRim0QR+xD1FPj96mreRc55FRL2mieJQ==
X-Gm-Gg: ASbGnctcPg8Olse8iebD29RE0j37ThZ56vhA/EiSJimQkD8YXG8d+xBSDV2LIEDDdfg
 RvgpZGQmeiGlvdAyZj8XATGUk6OyDQMR9+eNkRcjWp1MO6TfdJFHK7gZEnXCIvNOKaWz5ao2OrD
 lE/oP6c80JSuiEt9w/rSDk9JffEGE6DWN3wCzIQEkQU1HuCGIcFFgEQ3ooZiUMGhsCuaOOuPaMO
 wYEmuwLRNVRdH2ysF682bOQ0mTiW9Pmagn8U1Dn2A==
X-Google-Smtp-Source: AGHT+IFdZ1d5qVyQNkbQDZlej9eWCKaOhz4x9WUbZ54TZTmqM2CiRdYDrv4nJSerulA3GPeqxMhHnlO3NK/wFRxcjLc=
X-Received: by 2002:a53:accc:0:20b0:63c:f5a6:f2fe with SMTP id
 956f58d0204a3-63cf5a707bemr6283504d50.64.1760363441977; Mon, 13 Oct 2025
 06:50:41 -0700 (PDT)
MIME-Version: 1.0
References: <20251010201917.685716-1-richard.henderson@linaro.org>
 <20251010201917.685716-7-richard.henderson@linaro.org>
In-Reply-To: <20251010201917.685716-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Oct 2025 14:50:30 +0100
X-Gm-Features: AS18NWBnZiffbyKDGYNxlfrCWCUTXgWeO2eYHKECmloHfiIy5kMdVktMWSoG5_w
Message-ID: <CAFEAcA-Y6fHULs167FZBFTAOo0FuPdVvaPtPb2ihXWkf=e4gfQ@mail.gmail.com>
Subject: Re: [PATCH 6/7] target/arm: Honor param.aie in get_phys_addr_lpae
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Fri, 10 Oct 2025 at 21:21, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/ptw.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index 5fcf104272..23f6616811 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -2319,7 +2319,9 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
>
>          /* Index into MAIR registers for cache attributes */
>          attrindx = extract32(attrs, 2, 3);
> -        mair = env->cp15.mair_el[el];
> +        mair = (param.aie && extract64(attrs, 59, 1)
> +                ? env->cp15.mair2_el[el]
> +                : env->cp15.mair_el[el]);
>          result->cacheattrs.is_s2_format = false;
>          result->cacheattrs.attrs = extract64(mair, attrindx * 8, 8);

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

