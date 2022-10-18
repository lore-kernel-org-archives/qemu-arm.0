Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp3001618ejn;
        Tue, 18 Oct 2022 02:29:27 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5R5toQF8IivtuIiNJN2O5lle5bm7uCjeTDVeUII1GFnPkRl3xiokqQr/nLnKkDu2x2IbCc
X-Received: by 2002:a05:6214:f0c:b0:4b1:d497:732f with SMTP id gw12-20020a0562140f0c00b004b1d497732fmr1466316qvb.121.1666085367085;
        Tue, 18 Oct 2022 02:29:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666085367; cv=none;
        d=google.com; s=arc-20160816;
        b=RbVZ4Uit7VnYSVo6uLFj+pFfdfgSzJAfDLPdMjuGTu7IqTgtfoAOO3b7Z/BWrAedKx
         EJdCcqUDlp0r6DNChDn1U5ceAh13iVATZG0wS5ZKldU3rnrMT0CTe1Bewe0fzkH5kCiF
         HlmMagxNoyUMljYS/3BRYqU27bqgZJVbGX6bgvV1/9Vk7t0OHf8iKcybDRw+4gm9xvO7
         bZmi8n81aIdDWhZ8adJsaB5S2NtL+UYZ0HUdsUQPDwPRxQMQpewY8/IzvAZMvZsc4+A3
         WZY0B20/ghSYId5BPM8w4X00fXrdk4cYMrcE4jfgxkqRMncKoIgu6e0kJdPhKlitUXqd
         K3PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=dvj2LZOPuRCIGIZhk+v5GeI+35KsaJkv9TYSPnl6wnU=;
        b=F+wap7qxdViHke7GqAH8kDdZz0t8PjWveapKRRndphxD6aMSyg+hkdrf1/AOsSZtXo
         2H4I//l8LpDLXMOVE6rtVxQu/ib5lzdcdi1ngYUVlks+sXF4LNRpwWZv5B4vsIMgO0KN
         UpcDIiCUS78xsT1KT3spCRmJhiGWunp7io6OdiC9fQ6XqFiNN+fPup0OjUm4zybUwZ41
         xN6WMuULNw0nvT+NKvr0L3TGRoeSpdX4Re84Hiiuhogs94HZ/Ru45ueFeyKGJxcMTPbH
         j1QrmmYC2PXCpWOFklTyJ9Z640N8r4pn5MnR8S19EUOvA/8PyqzPewo3+2sXjdz+KqCh
         rXHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="jkJKbAZ/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b14-20020ac85bce000000b0039cdc6a9a35si6643670qtb.91.2022.10.18.02.29.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Oct 2022 02:29:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="jkJKbAZ/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1okiub-0003Ar-A2
	for alex.bennee@linaro.org; Tue, 18 Oct 2022 05:29:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1okitt-00039Q-KM
 for qemu-arm@nongnu.org; Tue, 18 Oct 2022 05:28:41 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:36778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1okitg-0003Lf-CI
 for qemu-arm@nongnu.org; Tue, 18 Oct 2022 05:28:40 -0400
Received: by mail-pl1-x630.google.com with SMTP id c24so13296400plo.3
 for <qemu-arm@nongnu.org>; Tue, 18 Oct 2022 02:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dvj2LZOPuRCIGIZhk+v5GeI+35KsaJkv9TYSPnl6wnU=;
 b=jkJKbAZ/p3RMuvIs6i5EZtloEo8tGv36EsjCV0yjHWma6UUUJz7WBvRISoAY+dEu/P
 bH0f3zaqJ8L70vcSgIFP9ns1CfIyiu8lAcYehe43YjnY0jSC525vQ/Xztmn6TeQr1YfH
 P3Hj7F0rdtA0+xFuFpY2o+Xras5ohli1twxiAaew5r6wlFPOuz9/H76+YyaumhGQ/5fk
 kfmzy2juEktVPdYopnPVkyqZUC2LJIsYrLDS2b/EFrc+uiWYxhkn/HGpu1HL5awF5d+a
 aSMbeM6FV/1fmvIYo9vrINXVjJ182iqKkntZ2+UL3CUP/ye/3bE2HslRyQs+OoUeBCvq
 sO3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dvj2LZOPuRCIGIZhk+v5GeI+35KsaJkv9TYSPnl6wnU=;
 b=e3SgQ7bd4HyGFFTMGnAtdzw0mWtCz8vYXChAKeOAIkz7hFA/TCYJQs5gQzdn7/5dcD
 hsyZ134gBKkWzycVoQzQwOpsSEmXFdybYR6lp1EcKC9pNOi4NCnXYaQ8nK8Ay+wj1MrQ
 3P2DpWpqborhgsGNfj8urhkF0oHKH/8umSllDFRieW3ZdfeV/rSHA7hPG7waAdtX7rg8
 aMb2j/9jUTNl75RfLIUdY4vJPRQBh67bem3MFz5ktH6A+yGjaC0UK9R743rP5107VgSC
 BjxJZjvZYgVPPTeJTGSvFhRBlN6VJEhpdlqRX6mkp0Z9+B1uFe2+s2Y5jfsHJTDA/v3i
 0EpQ==
X-Gm-Message-State: ACrzQf3jufgm0IVyZbGCVv1LoFg06lJ6KINPsViJwAjVtZSlJEeg8qOm
 x6uVhWIn2XalHZ4gY2hIHcuMJM+oZsiY9vRn2sM85g==
X-Received: by 2002:a17:90a:fe92:b0:20a:daaf:75ea with SMTP id
 co18-20020a17090afe9200b0020adaaf75eamr37276928pjb.221.1666085305892; Tue, 18
 Oct 2022 02:28:25 -0700 (PDT)
MIME-Version: 1.0
References: <20221016122737.93755-1-shentey@gmail.com>
 <20221016122737.93755-8-shentey@gmail.com>
In-Reply-To: <20221016122737.93755-8-shentey@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 Oct 2022 10:28:14 +0100
Message-ID: <CAFEAcA_19oiX1FDOTVTfyhLMaEQhcgx+2xoYB+CsZVq5uGb-GA@mail.gmail.com>
Subject: Re: [PATCH v3 7/9] hw/ppc/e500: Implement pflash handling
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 qemu-arm@nongnu.org, Alistair Francis <alistair@alistair23.me>, 
 Jan Kiszka <jan.kiszka@web.de>, Magnus Damm <magnus.damm@gmail.com>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, 
 Bin Meng <bin.meng@windriver.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-ppc@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, 
 Antony Pavlov <antonynpavlov@gmail.com>, Hanna Reitz <hreitz@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x630.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KWLM0EnSXbLY

On Sun, 16 Oct 2022 at 13:28, Bernhard Beschow <shentey@gmail.com> wrote:
>
> Allows e500 boards to have their root file system reside on flash using
> only builtin devices located in the eLBC memory region.
>
> Note that the flash memory area is only created when a -pflash argument is
> given, and that the size is determined by the given file. The idea is to
> put users into control.
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>

> +        pfl = pflash_cfi01_register("e500.flash", size, blk, 64 * KiB, 2,
> +                                    0x89, 0x18, 0x0000, 0x0, 1);
> +        memory_region_add_subregion(&pms->pbus_dev->mmio, 0,
> +                                    pflash_cfi01_get_memory(pfl));

pflash_cfi01_register() puts the memory region into the
system address space. It's just a legacy convenience wrapper
function, so if you need to put the resulting memory region somewhere
else, just directly create, configure and map the device in
this board code.


thanks
-- PMM
