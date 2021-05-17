Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp812784lfm;
        Sun, 16 May 2021 18:44:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxJulUXyXeQ3PhU+EeU0JWFCK7/8yOAODYGq9Bhxh/sA3159gdoLme9lcW6UoqaqWqgpHME
X-Received: by 2002:a5d:9343:: with SMTP id i3mr40355518ioo.77.1621215868389;
        Sun, 16 May 2021 18:44:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621215868; cv=none;
        d=google.com; s=arc-20160816;
        b=dFxlniw7ck+DcWLLe0KDQS9MlzL2EExbfe2JttxTUNKPu1P5pEn3Y44lA+jSZsG3wV
         /W9O9KmdahX8OrErvJFuh4XoEiZ2GlREUJZbbZJcWY8jliyQDH+pEObsiyTYLdYPnwcV
         zUwrJbSsyITAxSBnbF/y3HQw9Ap1/RpVnSQnAthtJxLKCOJCVTRFeykJUvOcRypVp59o
         1WDVocuvURTJ50ApNlJtO3+b78ELmo6HRetK8h5OMss/ayzDDKN1rRTxcrsuYSyGoCZ7
         4sBgFPvbnriORAM9fbZmXZZK/QV1Tif0Wla0pbeJpzOdzFAjAwRxqVoIBy/tUew1n2cU
         8v7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=g3xw0qSyOxOPiAGbQQC+ISBldTL9MV88oQhTnn3ElAE=;
        b=iSfAcc5/gR8sP9LCbnf+jUfg8YAe+pqof/Cwq+LrRT4FqPNN5ulZGXUSA/adhoU3Sz
         /JLvn2Rb0yUaX7n8x2XKxDUnom+as8eWApY3aW9OqHZooC86Mb9ijMwy7DdRgmNqVzy2
         Wz1FUan/HRpeCoYmTgrtZ+fQKJR5HaM2jmEi+CBvYx8Qd5voQ4c0pgggQ4jFLsHhhN1q
         9AjlARFKnBTLX2KhDM8OPUp8qEalQmWMNXJtyKK8edFFbgYi7TBeps6pCkbbRMGPMLMm
         gWbhJ8VgvpCggQ9XHd861r8kfSaWmY/DOVvUdGECfPbPTiCTXqY69Pqsf1z8/3R9Pbut
         AfIQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=VDnOQZJM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l24si14779480ioh.105.2021.05.16.18.44.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 16 May 2021 18:44:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=VDnOQZJM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:50506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1liSJ1-0006Yb-Ow
	for alex.bennee@linaro.org; Sun, 16 May 2021 21:44:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1liSHw-0004t8-B1; Sun, 16 May 2021 21:43:20 -0400
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30]:46817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1liSHu-0000hK-QB; Sun, 16 May 2021 21:43:20 -0400
Received: by mail-yb1-xb30.google.com with SMTP id y2so6395739ybq.13;
 Sun, 16 May 2021 18:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=g3xw0qSyOxOPiAGbQQC+ISBldTL9MV88oQhTnn3ElAE=;
 b=VDnOQZJM3bCyrVNkFjbHJ+vfYP7nSvgIaGT13jmO/zydG4mDYJ+fZ+He1wCLVjoniL
 BwDeLz2yccKslMPevMwkOKEg4WP2+tZCcFCtCn/2V6nHcY2OC3od+uOTgRC13MpdRURg
 xTgWY7DVDM8vhtRUnmDcvdDaxRTQYS1rHmpq3dVotuR7K9N3F0IYYUn9c9ISEC+BJgzT
 /r4GWIbq/MUssPPx683o0ZRYqZ3hfV6hSX5x5bzdHLbbLq4kEP6N+80Ja2F1ZssuHaaQ
 Nwqy7aH5IbSZMvNYzOFa/s0kj6d775DqmLG48pcarazC3/MgeyDTPTgpac53iH65XV+J
 uRdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=g3xw0qSyOxOPiAGbQQC+ISBldTL9MV88oQhTnn3ElAE=;
 b=Ls75FV4v9cxVkcCJwRApnMtQgLfFnvPQK4crvwC+k2zxWl05Y50Nv2HvJlFPANec8G
 BCsXaXzIFtaiyJ6jjFDPgLxg6hKCQt6wZmzvxaKkDEdHiFzQy+idIuz0iHoatDnYVTCk
 g612zSjvrZu6dc9wWa8qrv3gVFra7bM0lDW7MYhGpbqpfGxKAG3owOHYXXuT+sqlF/rA
 Y6jfnZ7Df63y5UGQovgg1a1bzDgL/XSeehRBd/KJIGCiRPXbfiCu8GD7hU6ayem2RvUt
 BtQRsWuQU1nmiakuxvGA4V3NOcOvWnYv3vvF75RgAE+uDOkU7I9NTkRgrrnKUKQTxdrK
 zKfA==
X-Gm-Message-State: AOAM5322HVyePFZ27hwRFc1NjYqtYXF5W0It8pMNW20pjXl/BKeqGUFk
 OMWhZF5Pb3sw1t5KMeAbRzisy47AShKcQ3m3VIY=
X-Received: by 2002:a05:6902:1543:: with SMTP id
 r3mr46361856ybu.332.1621215796958; 
 Sun, 16 May 2021 18:43:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210516205034.694788-1-f4bug@amsat.org>
In-Reply-To: <20210516205034.694788-1-f4bug@amsat.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 17 May 2021 09:43:05 +0800
Message-ID: <CAEUhbmWV2HBxk_5_YwdFXM_JauC0svy5QmMwvfpo_Eokxj6hcw@mail.gmail.com>
Subject: Re: [PATCH] misc: Correct relative include path
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 qemu-ppc <qemu-ppc@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 45Kmn6NqrbYS

On Mon, May 17, 2021 at 4:50 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> Headers should be included from the 'include/' directory,
> not from the root directory.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/i386/acpi-common.h     | 6 +++---
>  include/monitor/monitor.h | 2 +-
>  hw/gpio/aspeed_gpio.c     | 2 +-
>  hw/intc/ppc-uic.c         | 2 +-
>  4 files changed, 6 insertions(+), 6 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
