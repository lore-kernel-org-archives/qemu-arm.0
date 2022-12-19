Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp3619177ejb;
        Mon, 19 Dec 2022 08:24:39 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsSxL7pJKv9vIXonxsoyufDBffhUx6EYStG9xObjcXjyln+jz3cP/bG6XMadOgbHcE5Zcz/
X-Received: by 2002:a05:6214:18eb:b0:51a:a201:5619 with SMTP id ep11-20020a05621418eb00b0051aa2015619mr1976513qvb.13.1671467078736;
        Mon, 19 Dec 2022 08:24:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671467078; cv=none;
        d=google.com; s=arc-20160816;
        b=e909DOpcC/VTfgZRpxtblmIbg4NZb6UhuS3VLK3OFMcoyRIjpIDlEqC9yPAKbQgtFI
         qas1Tq6IKKzQsnwcBso/4nn+0mVLn2m83x/ySRt5hUwkFjTeHQU7QyET6n2T643lntSZ
         GFHOxvDxUvs55Dy52RHALi/Vg4ztwSO58F+NgCo3+pUDbeOm5ETOKh+ZWtwoT2VAeG+A
         7of82Ykgx5yh77elNOgD6WL91zT5ahRyPnyxqXk1YcN4Ku37VJGSIHCKIkIKTpd5g8WX
         t8E+p0eNhghIOs59DWBUEkSxTHUxozFrob2hWexiQeqTU42eTICAUJjbzmNDtpBDuUul
         2QoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=qQOgQNEfd1WzX5EPD2Cgkpof9TAOJVzvD/fygDNgqxE=;
        b=dNojSB2lnRzoBjfMCjKA+U1WUZ4IL6wf9LzVfQosCrmOXotmZ5iRbwZ3aERSqQII/k
         wDCzVaVw+CY4iWh7BjvpKWbunn7QUnRavHBBtgXp3cqiD+2EXxC+lAxjJKczhtgI4IDg
         sHFVQ+mJeBB1Qwn/0y1oOChvvDufTJ7BY83tGxlA+zk35InwU4kxZUm1gcJrKhmDYAlI
         LwNCQxxlRZbLfvVcQo2FgLOm7Gx8RY5Pgvj5smNGT/LsjYbYqAwEtbeHWlyJuR/Xm6fG
         xvwIW45se9nx4I3dZA/zFcdUL2ewm3lXIUopMmDOdujbK3TdeDgQvoFLmHBJUNjqa7U+
         cJVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Cod84tor;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kf10-20020a056214524a00b004afb740a4a2si3863331qvb.518.2022.12.19.08.24.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Dec 2022 08:24:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Cod84tor;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p7Iw3-0001PK-La; Mon, 19 Dec 2022 11:24:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p7Iw2-0001Ll-Bz
 for qemu-arm@nongnu.org; Mon, 19 Dec 2022 11:24:14 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p7Iw0-00071j-TB
 for qemu-arm@nongnu.org; Mon, 19 Dec 2022 11:24:14 -0500
Received: by mail-pf1-x429.google.com with SMTP id x66so6627547pfx.3
 for <qemu-arm@nongnu.org>; Mon, 19 Dec 2022 08:24:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qQOgQNEfd1WzX5EPD2Cgkpof9TAOJVzvD/fygDNgqxE=;
 b=Cod84tors/iJPKXPAPDtc2buRZOzLUos1cke/OJBUXKhJS/vlTFBjusO28JryZR4Po
 ZkeSy/KPGwQShSak1VTcopmErfVURbKah4zgFcIZH9tz7MzVJgZmTI+mgsrVVxYh8ibP
 +07I4UfjOATt6+5QhzoNvnlMxVuZlJah1pgdSGI0STkCKHklwT5L3ci2T68/p+CwgCJg
 hmkXRX0CB1Syb1SP5V2isOlImqvQjTDxNhvvy5mKmwuKdBZmFn0Ri11dEPvV4EiJKt8a
 wqX/aFnxrL5BEaVcyviJNK/SyYNQ14wjjsJP52+SjbW+UmIHeq1WFCLgsaXrCoOjpbNt
 fonQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qQOgQNEfd1WzX5EPD2Cgkpof9TAOJVzvD/fygDNgqxE=;
 b=vxUwlCjtJiYKYvM8QWiVnRgdFbiySfM9mrypX/bBtABoTfh50Xrs+pLNMsJmXoIWy6
 j2MfIgbft24dpZOHOZ66gdhNo20xEw37zObnlisSHxRSVvzyeWt9Xh0Ou9f3R2H8+2XB
 Zit3rHigJYFPas996NeUwyyREZYKS4mVkTagPXm8ZgWOEoS0/Iy5E93BP1+NcEeiCwFR
 Kby833ptmM9LBBGryOcUGLX8WTK+ZVg6UBkM1kvnnFooDr9+8OWGe1PlAmJBCXnN8w6S
 bGx2MO8ixZbJVP91zmVwrzA/jKKR6q6cUxbcBQNRORMXqcdwvhKbBgbRK0G/gQbta5aP
 e90Q==
X-Gm-Message-State: ANoB5pnqOfvziPk7Wci0ZQSFFrXdrMY8+MgE2ZMlxEzHcwMOJgG/Pb1z
 i6xQE8PrukxE+wVFTjEoJyziw78h8lfyzOi6Yl4i+w==
X-Received: by 2002:a63:d20d:0:b0:479:18a:8359 with SMTP id
 a13-20020a63d20d000000b00479018a8359mr6668121pgg.105.1671467051177; Mon, 19
 Dec 2022 08:24:11 -0800 (PST)
MIME-Version: 1.0
References: <20221207021322.16165-1-vikram.garhwal@amd.com>
 <20221207021322.16165-4-vikram.garhwal@amd.com>
In-Reply-To: <20221207021322.16165-4-vikram.garhwal@amd.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Dec 2022 16:24:00 +0000
Message-ID: <CAFEAcA-kiS3RJNVFuR=fnKQ6Dg5pWtqcW1zyJ4vnPpJtOjJ8Aw@mail.gmail.com>
Subject: Re: [QEMU][PATCH v3 3/4] xlnx-versal: Connect Xilinx VERSAL CANFD
 controllers
To: Vikram Garhwal <vikram.garhwal@amd.com>
Cc: qemu-devel@nongnu.org, francisco.iglesias@amd.com, 
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 "open list:Xilinx ZynqMP and..." <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x429.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 8ZMoLPT/uBjJ

On Wed, 7 Dec 2022 at 02:13, Vikram Garhwal <vikram.garhwal@amd.com> wrote:
>
> Connect CANFD0 and CANFD1 on the Versal-virt machine and update xlnx-versal-virt
> document with CANFD command line examples.
>
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> ---
>  docs/system/arm/xlnx-versal-virt.rst | 31 ++++++++++++++++++
>  hw/arm/xlnx-versal-virt.c            | 48 ++++++++++++++++++++++++++++
>  hw/arm/xlnx-versal.c                 | 37 +++++++++++++++++++++
>  include/hw/arm/xlnx-versal.h         | 12 +++++++
>  4 files changed, 128 insertions(+)


> @@ -163,6 +170,11 @@ struct Versal {
>  #define MM_UART1                    0xff010000U
>  #define MM_UART1_SIZE               0x10000
>
> +#define MM_CANFD0                   0xff060000
> +#define MM_CANFD0_SIZE              0x10000
> +#define MM_CANFD1                   0xff070000
> +#define MM_CANFD1_SIZE              0x10000
> +
>  #define MM_GEM0                     0xff0c0000U
>  #define MM_GEM0_SIZE                0x10000
>  #define MM_GEM1                     0xff0d0000U
> --
> 2.17.1

I see this file is rather inconsistent about whether it
wants to use a 'U' suffix for 32-bit hex values where bit
31 is set. I don't think it makes a difference in practice.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
