Received: by 2002:a17:907:10c8:b0:98d:b2f5:1316 with SMTP id rv8csp1139248ejb;
        Thu, 3 Aug 2023 08:52:23 -0700 (PDT)
X-Google-Smtp-Source: APBJJlF+U2O+LzZ6lF4I6PRG9V5UpBwpLDcMLcMok16tx4NQHhAqu0lmbwz4GxyMs5JCPPaijJ6M
X-Received: by 2002:a05:6358:5e0a:b0:135:515c:38ee with SMTP id q10-20020a0563585e0a00b00135515c38eemr8787928rwn.25.1691077943047;
        Thu, 03 Aug 2023 08:52:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691077943; cv=none;
        d=google.com; s=arc-20160816;
        b=nvGd+8T0L+tmtHEYkkx+sQ/g2FBJ/QOdpPrVXgPN3UdD0TLxDZbtCPpIXX82K47+gl
         6sG6bZfmigOkTwUBLGRawXzgn3fkjY7GD7OBxdVA/WCtBt8KPxJMJ962SxYHJxFcqJm3
         boiYKoV6+r0Y5ONR9+6KUCSmnpLSapOEhH1mU1Q6lOK2iGXU4jTd+d8aSplnfh1ibIky
         sJ+ehIty1nJH58vRYOcktmgwQ0lpEiJxl2iBTIW1HgmleUNghz/PlpEp8qomGHFBVL5n
         Tl0NfpZh66jMWRFmPI43q3UkUd8yFKKYwyHqRlG8Y0yHGFyGrLs97+nDqnkfOCfKhIS9
         9BUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=I6TTnOyTZIXYcRolg2KXuOZGMRy9t0s0uYD8kqaHwBc=;
        fh=Pe/MIC7yvB073Sd6/4lunpd6aUW6AVi1jfN++S25pLo=;
        b=nvusy5r/yFigF43fRUE2uwo2FMv9udG8aJdsHh+1+cHyW0UdEtcW/zTcWYALYhSb0R
         fKmIrosSc8nl00JSu7BdYcu5H31BpLw1fjdFf3IfKND8nmrdCJQxcejKP9/MOhYOS9sY
         Ba9MRXErv0CrkYZnTYX7WTlgUznuaenr13eScYmnEs06r2P8SyIrheoQwHGGt8Afbq/U
         dPz5CwbTcO97+apl5U2goJchX3zvoUDtrSR0zS4LdVmuySROUO3MlFFJ8kMwPdtLnbFt
         6/Pono6zVtkfKlSOqt/EfPyIpwEdX77fOh13gMSnqC0AVQikUQbs35k5x0PE8PmAXQvu
         99AA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qQLjUG8P;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z3-20020a0cda83000000b0063cf2552c69si10188993qvj.292.2023.08.03.08.52.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Aug 2023 08:52:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qQLjUG8P;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qRace-0001Wd-T3; Thu, 03 Aug 2023 11:52:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qRacd-0001WV-T9
 for qemu-arm@nongnu.org; Thu, 03 Aug 2023 11:52:19 -0400
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qRacc-0003cE-Av
 for qemu-arm@nongnu.org; Thu, 03 Aug 2023 11:52:19 -0400
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4fe0d5f719dso2012875e87.2
 for <qemu-arm@nongnu.org>; Thu, 03 Aug 2023 08:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691077936; x=1691682736;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=I6TTnOyTZIXYcRolg2KXuOZGMRy9t0s0uYD8kqaHwBc=;
 b=qQLjUG8Ps6+af2a2HSSSI6kTBfyy6ZyBncPxMLgGFMUvBXQNscgxb8Xp+dML5nKoXy
 qVX5ipOnFsJSqoGyG9qDfvJd/rE1ARFItlx4fLM6MQ21nAZaMP9tPSPG8G7DvbH09q4W
 i2vH6BNOg+XD/8ZXVdLnbtPoxjjCTlwY4PVdOvQ8sGV13V8HAeQWqIcSUgqu7cwCJfHz
 3K0wDD70KsnqaxDowA+BvYNTVxOP3Uj+5zAhyQ1TBNuCeA0nM5BSjulJTpmpqMTGSGOc
 t05VNHIj7HTsm8HC2fNGpbyWeZNl7a/Iq7GFCEq5TwO2F0GsIO7iIet2FOGbiYxKAXgd
 IJJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691077936; x=1691682736;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=I6TTnOyTZIXYcRolg2KXuOZGMRy9t0s0uYD8kqaHwBc=;
 b=DKHUTQlnHHMElbow7ACvqS/jdxp1/GGGH1WXHx40b7cH4o999LFi0TNze+6lCE2TEx
 w1Uf/g/4zPaQ7nkP8XKH+GlyeAPsUBNrowG7CQRDtvqKuW/VjCuLZsrhVG6sptLDaTMZ
 b8uqtPYHcD5OCAI0vNPqJAk+mp++N82+rkcTa4xliXnum4No0ljSxIX+eFAmhHqQKP7f
 IoLkZczQrgkehkBlYWmAoJdljo8KA/sRvGS5fGTgEuf1rqXCs1ZpLcd8zP1zAngbuSUp
 xePZRjS/oC4TjGvjDFaIbTl5fFOieHK4O/1X7MDGhhhRnSJNDxE7xq6MFLjo6wKzakD9
 ltiw==
X-Gm-Message-State: ABy/qLaG1yG/Wqr/F0o22sj1tUOnEAERCn1AuFIr+z/4i7qs/7+uwDID
 PRpBVB7YPZtIQfxLliB64hrbNJ3ls/R+trQjMRFT5A==
X-Received: by 2002:ac2:47ea:0:b0:4fe:3a2f:681 with SMTP id
 b10-20020ac247ea000000b004fe3a2f0681mr6445939lfp.23.1691077936458; Thu, 03
 Aug 2023 08:52:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230726132512.149618-1-sergey.kambalin@auriga.com>
 <20230726132512.149618-3-sergey.kambalin@auriga.com>
In-Reply-To: <20230726132512.149618-3-sergey.kambalin@auriga.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Aug 2023 16:52:05 +0100
Message-ID: <CAFEAcA_Ts7hAtSBy8WVxk6u9doqTX7-0Jb70TvYaVDV1zZjwzg@mail.gmail.com>
Subject: Re: [PATCH 02/44] Split out common part of peripherals
To: Sergey Kambalin <serg.oker@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Sergey Kambalin <sergey.kambalin@auriga.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x134.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: njFb/V0CTJO8

On Wed, 26 Jul 2023 at 14:44, Sergey Kambalin <serg.oker@gmail.com> wrote:
>
> Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
> ---
>  hw/arm/bcm2835_peripherals.c         | 198 +++++++++++++++------------
>  hw/arm/bcm2836.c                     |  24 ++--
>  include/hw/arm/bcm2835_peripherals.h |  29 +++-
>  include/hw/arm/bcm2836.h             |   3 +-
>  4 files changed, 154 insertions(+), 100 deletions(-)
>
> diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
> index 0233038b95..4c0c0b1e7d 100644
> --- a/hw/arm/bcm2835_peripherals.c
> +++ b/hw/arm/bcm2835_peripherals.c
> @@ -30,9 +30,9 @@
>  #define SEPARATE_DMA_IRQ_MAX 10
>  #define ORGATED_DMA_IRQ_COUNT 4
>
> -static void create_unimp(BCM2835PeripheralState *ps,
> -                         UnimplementedDeviceState *uds,
> -                         const char *name, hwaddr ofs, hwaddr size)
> +void create_unimp(RaspiPeripheralBaseState *ps,

Something has gone wrong with the naming here. This is
the SoC implementation, and its peripherals should be
the same whether the BCM2838 is being used on the raspi,
or on any other board. The type names and so on should
be SoC-specific, not board-specific.

thanks
-- PMM
