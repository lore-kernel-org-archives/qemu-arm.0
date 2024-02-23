Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp711051ejf;
        Fri, 23 Feb 2024 09:35:32 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUBi2B+ET5Q/oOj21JWWZurhXGhTaLXNofXyOayLg8rtw2Pa9+ZoSgLHvivNntLr0CdGOESLm3m7MPJdPlfHkas7AnGvfTO
X-Google-Smtp-Source: AGHT+IHYjQmjEZuPzx3Z/0csl0+cqq7Wnj+2X8vdHjvvG1K1LqLEC/r3tIF46v5z3sHQNU8xOMRa
X-Received: by 2002:a05:620a:40ca:b0:787:b785:d07 with SMTP id g10-20020a05620a40ca00b00787b7850d07mr858793qko.0.1708709732655;
        Fri, 23 Feb 2024 09:35:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708709732; cv=none;
        d=google.com; s=arc-20160816;
        b=aohpxOuN4Qt1bJ2HkejQhUuRHU35rJhdH0ft4WBompil+9QaWLGKt+CK0iQUaF6HGP
         qOLsjyDIiDDKvFG+vR2or/fvNbCeck0de9OBj2Xe836i2rSVY+ERL0TbkxpMgmYsMrAH
         RQxuY1no4ohXhgJFSxu7sf36O1Wwor5Qg1avr5deSUVfON7QXaFfMuABhNsp87V5qpQI
         ZzOH7sptRSv0fb0UBvW20REDeU8VJYPUqjp8ljZ7+fccDpEmFULxMbcUEmLCAEJm/nZ5
         Wv0oBlA4Z3yeVbvRfS0MJM6pTq/myBtIiDgbggWtw/IIBYaeVQjS5OjLF2r98oruyX3d
         vRew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=bCMMo86psNeJZCuJrJCFsnR1RQQH5tGN/zrD06/nxDc=;
        fh=ERRZMMFcZ0KCW+l7KoMl5jSZRYmDHugcza6G46S/GKE=;
        b=Q6tv5zQNgo7PPX4Qhz9HZu3RwE46XoyyUf8hLSeQzkGT7/hgFCaJyFq3dzNrP86E+k
         tIiFfHFyFp/+h7/bTVEQ9jilHoPNvZaFOPSk5WRiJqF5NUvE4eah3m0zpMKE3OkH7NeD
         iZxAYA6yD6nECOB+kRxvTyT11QO04WtzpuJBygPt3jNPNWcpWY83ekYpr05/I1xRqEtL
         U8s5TUYLl+sihrm/5el3BLqu6ZyIIkoBSSNZna/EJTOKyohEzXnWqdrKS0sbWYs+1fKH
         y7F7XOrctDNzGpnJI/tY1Dee0xFsmQAaQ28yVpyDMvmCo7yf6wAfHd7+i26XaydUf3u8
         BfSA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CRyrim6d;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y21-20020a05620a44d500b00785d85d41b8si17701518qkp.110.2024.02.23.09.35.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Feb 2024 09:35:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CRyrim6d;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rdZR9-0003qF-Ty; Fri, 23 Feb 2024 12:34:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rdZ0f-0006ZV-8f
 for qemu-devel@nongnu.org; Fri, 23 Feb 2024 12:06:53 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rdZ0d-0006LK-JE
 for qemu-devel@nongnu.org; Fri, 23 Feb 2024 12:06:52 -0500
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5640fef9fa6so1375194a12.0
 for <qemu-devel@nongnu.org>; Fri, 23 Feb 2024 09:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708708008; x=1709312808; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bCMMo86psNeJZCuJrJCFsnR1RQQH5tGN/zrD06/nxDc=;
 b=CRyrim6dR/7FM1OyVnrVpXHoBDhYY4yBmFfu9/nPI+k3oY+eQUYZ+LDtZcLGxMWLYA
 ts5rQ2lk4SROKw6JM1wuSAmVSXwOEV61s5UUT/JJRhloBCSFegt2Fnob8LMyTlytHPkW
 vhohL0GTg2MORQLbCnkf1wPEQYjjk0sjIYGzpV5J9YkB0nI1vzxwct+P9umuSeWOx6Yg
 jVk9W7KVsA7NEVvV9lTYyWyaQsXnjXWTysXwfS/DFtsXuIluLFicC2oky3F5CO8Ima3g
 doCW9RHgt45Sf7BWMbswgr2RhBwzW93NYEUdC+FGoUQCk7Cl5lsu3YFsQRiwHo6U61fl
 mLWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708708008; x=1709312808;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bCMMo86psNeJZCuJrJCFsnR1RQQH5tGN/zrD06/nxDc=;
 b=Z8OuY/fIayKyT2roPxs7ZQdtKaSFsFlnvkeH5uQxPV7xlbpJFhwZXmKET9WwU/9wsC
 kSmw0hT+dBm/Ia3kJCI0tgDJHdjjOdVHVptMIK24VI96r8MKgitjtpCP5DMGG+HhKhFe
 17FwUb7obPQJq1zZccbcAq9gxs3XxL1ZhTkcFc4zTwx0/ezYRUGiSCkANQMiqBUWgAqe
 fnz74T/xaEeIAM4DdrmIW66/rZnzEIvGn8STm+xUZJKPzokl5FnN/mNNEo4AHn3aSdzu
 b7Ex+U0md+e03fk6zJlIuRqlGI9Hcms9AylC73AvPMgfrztQvGnRZkAH7gZ/mZE1Hpi3
 j5PQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7UmalXmlmwi9LFVXl8Z0naAlf9PsRlNPjt5RjenCe4Ux4BWJUjbYX/Y7sOaRmnJX75bOVmT2eMMzIPhK8Uvwrbaokl9g=
X-Gm-Message-State: AOJu0Yw7jvVIgSpAmLz1xOgjgpii/ksT48gr6/ZV8Why1JCYqlJx0q4J
 /IwHITSTZaBWbbPkZAfwcw6zzsl6PxB/XonPDmOt0+kBZifzvYRe5+7c/tcRM7qspgbOLeNgZH8
 07ERh/9efbnQ7ugNFsVZhbtRncB5GgAOGvtg/nA==
X-Received: by 2002:aa7:cf19:0:b0:565:3907:be45 with SMTP id
 a25-20020aa7cf19000000b005653907be45mr319772edy.37.1708708008689; Fri, 23 Feb
 2024 09:06:48 -0800 (PST)
MIME-Version: 1.0
References: <20240219011739.2316619-1-sergey.kambalin@auriga.com>
 <20240219011739.2316619-17-sergey.kambalin@auriga.com>
In-Reply-To: <20240219011739.2316619-17-sergey.kambalin@auriga.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Feb 2024 17:06:37 +0000
Message-ID: <CAFEAcA9-yfxyvOsk=5Yv8WbEi8rvrRHfybiAw164u8HsKyN8SQ@mail.gmail.com>
Subject: Re: [PATCH v5 16/41] Add RPi4 RNG200
To: Sergey Kambalin <serg.oker@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Sergey Kambalin <sergey.kambalin@auriga.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 4twFNwKozwWA

On Mon, 19 Feb 2024 at 01:20, Sergey Kambalin <serg.oker@gmail.com> wrote:
>
> Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
> ---
>  hw/arm/bcm2838.c                     |   4 +
>  hw/arm/bcm2838_peripherals.c         |  14 +
>  hw/arm/raspi4b.c                     |   1 -
>  hw/misc/bcm2838_rng200.c             | 405 +++++++++++++++++++++++++++
>  hw/misc/meson.build                  |   1 +
>  hw/misc/trace-events                 |   9 +
>  include/hw/arm/bcm2838_peripherals.h |   2 +
>  include/hw/misc/bcm2838_rng200.h     |  43 +++
>  8 files changed, 478 insertions(+), 1 deletion(-)
>  create mode 100644 hw/misc/bcm2838_rng200.c
>  create mode 100644 include/hw/misc/bcm2838_rng200.h

Compiling with clang detects an off-by-one-error in this patch:

../../hw/misc/bcm2838_rng200.c:119:32: error: array index 9 is past
the end of the array (which contains 9 elements)
[-Werror,-Warray-bounds]
        fifo_thld = FIELD_EX32(s->regs[R_RNG_FIFO_COUNT],
                               ^       ~~~~~~~~~~~~~~~~

This is because N_BCM2838_RNG200_REGS is 9, but
R_RNG_FIFO_COUNT is 0x24 / 4 == 9.

N_BCM2838_RNG200_REGS should be 10. (The regs[] array has
an empty slot for the 0x14 offset.)

thanks
-- PMM
