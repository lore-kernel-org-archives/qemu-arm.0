Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp1530816lfq;
        Mon, 11 Apr 2022 04:00:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzJdwbp6LHHdV1seu5/hgxR6EhpXEqGYnPoGlrwjXzmdVd9mFIn04at68u9T/SCMYfXsjFq
X-Received: by 2002:a05:620a:410b:b0:67d:d59c:13b8 with SMTP id j11-20020a05620a410b00b0067dd59c13b8mr21448910qko.449.1649674828860;
        Mon, 11 Apr 2022 04:00:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649674828; cv=none;
        d=google.com; s=arc-20160816;
        b=OYYTwBmA49qOZB9VB9SQhaStG1dUnqWKF/FeLjxcAnedwH+idCRRJU5s+rRXeVXWDd
         ycOV76M+xq6E3Ybfd0n+U9WOpUhlA1xZzGYO67izEIqrz+zMN0bVokteE4ybAYsWps3J
         itZwefDiMHIL2NQyIxqRSKRMST1tOtY6KSLNOqOgP48eqlQHa7W4RTYtEVV7uz0BzfaG
         +nOPH8hzC2SFluy+TDe2y+6ChsiNF5L9Y19ZDwRjXXjuJzN+xPdD7kKnDOupN5Cc256t
         0cTL6Umtj9aKEhtf7v8o1qy1HloCrP0XCtlqIJ7O8tXWNamZag04S9gvBKaeVuUm5F5D
         beAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=06ZWhCrHCc7V8kivDU9cjKy+8lGFD7ZELA3yTgE6Omc=;
        b=0OaxsxOUrkrJDmFA/dfdIxp+fFdXpjaYYjLLaU50e0VluT3IZeduKsW73AZwQ9lFAf
         t3yLAAnPAuvPafPGcPvUWT7sOaDouh6Ywe1UyuujzQZxTHdnU6SYRmQIxA/x1az7Yao7
         wGHz5f8gZqstT8eyd2P5DWZBy9iiMHoWkLUBR+Anodb0oaM2UWNppgEwg/B50uiuetBO
         b0yP9ZY1lWQDTCy4O3KPbsohWgiOBcAs/RHGFh6kApmQ/xC1iY59vLxztZb8QFvgssjl
         gxOlka24q/Jd0XzKxj6029XALzMwdZ620uWthiUvxJmmW4bVhl2js/4x4kaErmOL7IcM
         CAnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QGuvFFrx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j15-20020ac84c8f000000b002ed13834f9fsi2158829qtv.58.2022.04.11.04.00.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Apr 2022 04:00:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QGuvFFrx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ndrmW-0000Ux-B4
	for alex.bennee@linaro.org; Mon, 11 Apr 2022 07:00:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndreb-0006Qd-Fq
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 06:52:17 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d]:37733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndreZ-0003Tf-Oq
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 06:52:17 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-2ebebe631ccso75627757b3.4
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 03:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=06ZWhCrHCc7V8kivDU9cjKy+8lGFD7ZELA3yTgE6Omc=;
 b=QGuvFFrxsGHDbq/YaOSncuHYKZzibIbvQDm1/MdHtNGa5goQolXQjjKF2Gv63X6gtD
 qIy9rlZy6lj8m3GpeWJ6lZH/vtezeylpzvw0K6jx0ytxp5VuwPz5I8jqUtIkDBULqM+I
 9s6xtzWQA9+MRd0/WMIg9/s3+xb7i9vhWI4fOY5ivCTWcv3H+fVojMjBQBbfBgHrRDAe
 F4rQqQSuX08X/X51lo3H3VrgfhGOswbu1CwTa3dgO0FUSrmqPAlq42V4Cd6TXhjuhGKt
 cgQvgIRZxRegktirV2A+eAW5jxQBg4j20UFVRlqhDlL5I8Ehd7A3TI6pmbaPACLwzBxC
 aevg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=06ZWhCrHCc7V8kivDU9cjKy+8lGFD7ZELA3yTgE6Omc=;
 b=4PUJqKU52a7pt1gyQKh3l0a8x/ftI2ffAi4He+oxZXCUaWBncBHFWkhjO3yW5dGMc/
 k7RrMsjiPioWrVrsVyeF4r1t7KF1NVU/Yk1tO6nc+OwMcgmiDSHDrvQruxF/qM2wpfpR
 yQ9Jc1bFQLC/Pl4nENPzVoEonMSm8vUVdybxHC9D9yDE6dIk6pO6E8/NDAe2kcev1Wm0
 VHfcp9EmPABSbxuwnFn4ga3hJtkg0ZrirjlDr1fbYn4nx71EBaHkVjI3Yiy1VWxX8vXj
 8iEIRQCfZJKPrMenI/G44peEIZ8AiSiZK4yt2pMEPx4JohbE+7/Oc5dynbdRHzbQEUAY
 0D5g==
X-Gm-Message-State: AOAM532B3L58Wm254j63zaJiStacYedOLFym0dIRKTnC2kz03o7DCogg
 EV+r91jrP1zZb3QXvpsvh30TTU3Pw3f4locUdJg/ag==
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr25850178ywb.257.1649674334845; Mon, 11
 Apr 2022 03:52:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220406223440.2901032-1-wuhaotsh@google.com>
 <20220406223440.2901032-2-wuhaotsh@google.com>
In-Reply-To: <20220406223440.2901032-2-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Apr 2022 11:52:03 +0100
Message-ID: <CAFEAcA9x7zu5PnsUQmE-mHDs1n-tLWkJqNV_HczvD6Zs3=rmDg@mail.gmail.com>
Subject: Re: [PATCH 1/2] hw/misc: Add PWRON STRAP bit fields in GCR module
To: Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Uri.Trichter@nuvoton.com, titusr@google.com, venture@google.com,
 hskinnemoen@google.com, qemu-devel@nongnu.org, kfting@nuvoton.com,
 qemu-arm@nongnu.org, Avi.Fishman@nuvoton.com, Vishal.Soni@microsoft.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: L+qN0p3V6Hvj

On Wed, 6 Apr 2022 at 23:34, Hao Wu <wuhaotsh@google.com> wrote:
>
> Similar to the Aspeed code in include/misc/aspeed_scu.h, we define
> the PWRON STRAP fields in their corresponding module for NPCM7XX.
>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> Reviewed-by: Patrick Venture <venture@google.com>
> ---
>  include/hw/misc/npcm7xx_gcr.h | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>
> diff --git a/include/hw/misc/npcm7xx_gcr.h b/include/hw/misc/npcm7xx_gcr.h
> index 13109d9d32..98da5d171f 100644
> --- a/include/hw/misc/npcm7xx_gcr.h
> +++ b/include/hw/misc/npcm7xx_gcr.h
> @@ -19,6 +19,36 @@
>  #include "exec/memory.h"
>  #include "hw/sysbus.h"
>
> +/*
> + * NPCM7XX PWRON STRAP bit fields
> + * 12: SPI0 powered by VSBV3 at 1.8V
> + * 11: System flash attached to BMC
> + * 10: BSP alternative pins.
> + * 9:8: Flash UART command route enabled.
> + * 7: Security enabled.
> + * 6: HI-Z state control.
> + * 5: ECC disabled.
> + * 4: Reserved
> + * 3: JTAG2 enabled.
> + * 2:0: CPU and DRAM clock frequency.
> + */
> +#define NPCM7XX_PWRON_STRAP_SPI0F18                 BIT(12)
> +#define NPCM7XX_PWRON_STRAP_SFAB                    BIT(11)
> +#define NPCM7XX_PWRON_STRAP_BSPA                    BIT(10)
> +#define NPCM7XX_PWRON_STRAP_FUP(x)                  ((x) << 8)
> +#define     FUP_NORM_UART2      3
> +#define     FUP_PROG_UART3      2
> +#define     FUP_PROG_UART2      1
> +#define     FUP_NORM_UART3      0
> +#define NPCM7XX_PWRON_STRAP_SECEN                   BIT(7)
> +#define NPCM7XX_PWRON_STRAP_HIZ                     BIT(6)
> +#define NPCM7XX_PWRON_STRAP_ECC                     BIT(5)
> +#define NPCM7XX_PWRON_STRAP_RESERVE1                BIT(4)
> +#define NPCM7XX_PWRON_STRAP_J2EN                    BIT(3)
> +#define NPCM7XX_PWRON_STRAP_CKFRQ(x)                ((x) << 8)

Comment says clock frequency is bits [2:0] but macro definition
puts them in bits [9:8]...

> +#define     CKFRQ_SKIPINIT      (0x000)
> +#define     CKFRQ_DEFAULT       (0x111)

These don't need parentheses around them.

thanks
-- PMM
