Received: by 2002:a17:907:7006:b0:a35:eedd:80b0 with SMTP id wr6csp262918ejb;
        Thu, 1 Feb 2024 06:20:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGNs+HiOlKrvFG3WJjwvraaDKR8xt3MhblcwOKsT/BTMRWKntpTySKb1KSL4sItcNOW5xDi
X-Received: by 2002:a05:6808:bd5:b0:3bf:b779:96a with SMTP id o21-20020a0568080bd500b003bfb779096amr1572950oik.0.1706797202461;
        Thu, 01 Feb 2024 06:20:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706797202; cv=none;
        d=google.com; s=arc-20160816;
        b=WnLV8yQjjwVcfDTk6zFzVLu1Z2aHPhTiTC5yuJiRN0Ru2Do+Ys+Opo09c6VGgZO2JW
         ir9+PMAOa0zkOK6syd58IFLxKQ9bXTpR4NNYszl6Oickjmrm5EyH09htsbs+S6mxN8s9
         EKAR3pKTZJ/AHccVqWcx0Pq3YIduA/rT9VXxjaHawjJQhl60o5XQf2SJvNfdLpEsa8+M
         oPUoDshnGVVHh05O0a+PIdDP7Jhdwh2gCqhQ7V4QIDjQEXYuGEvPwy0RWchSszpd6iqD
         F+Z/TljHqJlaRnB9OHLG9z2/jQNKbYru6rV20III5PojK3ZPbJgltFRG92nJiK5z27A1
         v8ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=RgAyJhoJGNs6a1y3AJdOMnoQBlZetfOAd7uE86D3ig4=;
        fh=3UIX+E0GtScCe184dKSSWJSpulW9ThWjaD7b1Nq2VH0=;
        b=kYRDHB7btZ0bM+620rNGGJnbTEO62Gsr/QNCa1ZCU25EGJApu9USGaViC1gDfvAgdV
         axfGzbougnPNN5Wg/mTLd+R1DO9F28EsjmqtIJmw+LdGE87XdQflaCbp0x3RPlDyRwH8
         R3MCguEZbuvp/rBtx72ZFCbKflfy6128Mtwfv98m08BgXAMHvVgWxXKe4W5VHQchvZCj
         kWfk3pMAIkN/E7OkiKsNmKGBexUGOnQnLpjfB+9A6PJeyC1Dxb4AY/MGOwmKPysJN6Av
         +QYdU1ayIxZyuluUJfFcFKaTcXa2UgXehZuOOApSneaqGLa3PW2rfEztp292ma6fgMWP
         g+0g==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XObDb4y4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=0; AJvYcCU/KWM9+jYOk6u0RC+5xxlY3rSB3de/k9wI5O1pea45331GEUACXt65F5096D7pyRX25VB7laIEfDPgv5K4yd/qYFpc3WZ0
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y17-20020a05620a25d100b0078336deaed3si15761978qko.691.2024.02.01.06.20.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Feb 2024 06:20:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XObDb4y4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rVXv6-0005uS-Cx; Thu, 01 Feb 2024 09:20:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rVXv1-0005t8-Vo
 for qemu-arm@nongnu.org; Thu, 01 Feb 2024 09:19:56 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rVXuz-0000d8-EP
 for qemu-arm@nongnu.org; Thu, 01 Feb 2024 09:19:55 -0500
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-55c33773c0aso1379096a12.1
 for <qemu-arm@nongnu.org>; Thu, 01 Feb 2024 06:19:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706797191; x=1707401991; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RgAyJhoJGNs6a1y3AJdOMnoQBlZetfOAd7uE86D3ig4=;
 b=XObDb4y4CMMTE+7glKXcVcGauc2CAm/jxVuWIeRhtKl2LN1e3qaVwo2Ptr/rIw64uw
 xdPTww+EBUfKf7bj8Xac2wGPZDm0c6UXQUltm/4pacczPbM/GLAmDZYXa45IE5yAXd2I
 J6Ewb/+eEWPP1X9dPxwu76XkeAWbgcL7iichY6vBaKt45ekga1JN2ZunsBMxbRDs5wxu
 oQyWw3815wVg1MRDyKP/G2SkdfEMuK10wbHsEZBiH6N5FJuy+p9vB0cmPrDpXPIsmB79
 mZRMvbsFYYPvOLoXZolee0eI2JZz24N4NIfoxrt+3L4cr0YGhHFso4KsfKQlTq6mkS/W
 w7KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706797191; x=1707401991;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RgAyJhoJGNs6a1y3AJdOMnoQBlZetfOAd7uE86D3ig4=;
 b=ICoXEOkUmD9QQqEwxI6A2P93geSsmwaX687isAfXG+ZpdiGK1pBCqqMZob7ZnRPdf5
 7MgmoD8lm1IAHPP7RGUThDizHkiVefdyJOVA9f1uRBffX+UEmaMcy7u6suaoihmT0YkT
 ttivLFzhl9ynf5qUWGTRaixtYrXUVQvgvKWP5zPZsjGTDHgm6NwK+ju/3vyArIgDSV76
 24OzL/147UW1vUz62xcuEPLb5E2o4d5c4QXVjpkcwX0hRurxIdImTsnt03rXdgqNB3W6
 1Id7BTBmIPLomzgpfGP4huXxkfpxMjlCRNNcx00TNcBNofN/Uk9YZEaLlYp9ggEo1dnQ
 vRBw==
X-Gm-Message-State: AOJu0YyKZDuYNlFAV38uLW+Ix/9E6xekWM20+wGFSu5ZNwIjL/LAiAa0
 yPWE90z3fJkx3Q8q9eIcafYUVlDWYbulL9H7cUGvn6bO1GCD6bN7MJEKgF/B50R9A5niuMdWSCx
 zEgucDmjqBWXOKbMKYrMladKaYLrJEU7XKIaC9RGCRx0Z46DQ
X-Received: by 2002:aa7:d391:0:b0:55f:217d:9651 with SMTP id
 x17-20020aa7d391000000b0055f217d9651mr4107485edq.22.1706797191483; Thu, 01
 Feb 2024 06:19:51 -0800 (PST)
MIME-Version: 1.0
References: <20240129081835.137726-1-thuth@redhat.com>
 <20240129081835.137726-3-thuth@redhat.com>
In-Reply-To: <20240129081835.137726-3-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 1 Feb 2024 14:19:40 +0000
Message-ID: <CAFEAcA-yL8BAdtkF2xaWJOeFPUWRoBbuvPSEeorwjyei3oFjDQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] target/arm/tcg/m_helper.c: Include the full
 helpers only with CONFIG_ARM_V7M
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Fabiano Rosas <farosas@suse.de>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: jmWerCUzJU/y

On Mon, 29 Jan 2024 at 08:18, Thomas Huth <thuth@redhat.com> wrote:
>
> If CONFIG_ARM_V7M is not set, we don't want to include the full-fledged
> helper functions that require additional functions for linking. The
> reduced set of the linux-user functions works fine as stubs in this
> case, so change the #ifdef statement accordingly.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  target/arm/tcg/m_helper.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/target/arm/tcg/m_helper.c b/target/arm/tcg/m_helper.c
> index d1f1e02acc..a5a6e96fc3 100644
> --- a/target/arm/tcg/m_helper.c
> +++ b/target/arm/tcg/m_helper.c
> @@ -22,6 +22,7 @@
>  #endif
>  #if !defined(CONFIG_USER_ONLY)
>  #include "hw/intc/armv7m_nvic.h"
> +#include CONFIG_DEVICES
>  #endif
>
>  static void v7m_msr_xpsr(CPUARMState *env, uint32_t mask,
> @@ -69,7 +70,7 @@ uint32_t arm_v7m_mrs_control(CPUARMState *env, uint32_t secure)
>      return value;
>  }
>
> -#ifdef CONFIG_USER_ONLY
> +#if defined(CONFIG_USER_ONLY) || !defined(CONFIG_ARM_V7M)

This looks a bit odd. If we don't have CONFIG_ARM_V7M
why are we compiling this file at all?

>
>  void HELPER(v7m_msr)(CPUARMState *env, uint32_t maskreg, uint32_t val)
>  {

thanks
-- PMM
