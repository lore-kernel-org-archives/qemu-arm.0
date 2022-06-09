Received: by 2002:a0c:fd46:0:0:0:0:0 with SMTP id j6csp4098459qvs;
        Thu, 9 Jun 2022 06:23:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyHSSqjhMqM2PC+I473dyg5jJ7hxsQNkatVs2u3spkXCmepTWwM8CryeClkFJtrF2LnnXKg
X-Received: by 2002:a05:622a:1ba3:b0:305:15b5:8758 with SMTP id bp35-20020a05622a1ba300b0030515b58758mr737100qtb.10.1654781023358;
        Thu, 09 Jun 2022 06:23:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654781023; cv=none;
        d=google.com; s=arc-20160816;
        b=zsXU1okaXGbEcbkMLBdE6pWe5bXU7H4H4CS9xpoZmzTlzW0xCh3GcunHvkABPKN4Cq
         KqR5co6misdz3bpsI14TAFkB4YQAz9rmOPJh8BDaM1M7N8Esjbe2nFAON2gKJz6pAn+T
         3jfuUCwJMYwESq0yr5lgfiQ+uK05CerhfjA5Kg1tz9TigYBwORn5NwjU6oBx2/uoYYlM
         8dahz2DXXu2AlJmHiL8xSzDUUtujhFPu2QEv8p8W8P3bkuh2pXW0E84CNz9LggdoZqmd
         a6S7InveWqC5IOO166UGFGgyGJ4ZEFnRNZVjfO3lbGNhpoi8nifBF5tHSadO/sp6NBxM
         SMVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=FF+lW4l1rD3/qhWWyTh2XRqKAU4PcKOj5x+FeJQwbbA=;
        b=jh9lXDYwTDjqdozSw9i4PI+m0b6EzY8AHkugVlCO0jIeTInauDO9iOBfQ/oPmMWBHQ
         EALig7MDy3BNxfN1Jcd66SrTyTrmrl+5tlhhOAI+JXP/uoORmhdLI/btCwgj3Nj7rQt2
         JhpG2IPffyl4BoY2nZ/W6q4A38Fj6+0yfuCXt6cUOzLDKw0pdWnRJ1HNu/Dcu2ebhs5h
         CWw/u/t12wokUcgFhhE1IGgvR0Br1IzQNIAEjIuPU129wg+pABHmXhsnkRwLHRqsGb8W
         aRinmRxBySZmFTIucpp/WohA5eJr3Cf8J3StRU5XEUs0tHFXgN3HE60IwcnBaWCQCz+P
         J/Mw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FahmkrRl;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h4-20020a05620a244400b006a6c22d980fsi5936685qkn.235.2022.06.09.06.23.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jun 2022 06:23:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FahmkrRl;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nzI8U-0002Iq-MY
	for alex.bennee@linaro.org; Thu, 09 Jun 2022 09:23:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzFzH-0007Hi-Ci
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 07:06:05 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:40836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzFzE-0000a3-MB
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 07:06:03 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id w2so41160653ybi.7
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 04:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FF+lW4l1rD3/qhWWyTh2XRqKAU4PcKOj5x+FeJQwbbA=;
 b=FahmkrRl1IEYLDmKQFKtHxJ3ZlKSXxVmsIP69If/CELeHHDfihvisZS0RwTp0mZLFc
 fA0mu+EAtdmn1NelQDzC0Ii82Mjfee6xtIFDYl9/jlcQVijABgNyWDeI7sO9P31mkmY5
 tUCW5HQSchY2AzSadcutMahp9aHha0KTGv7KmDK9xGDMjBdkmc34c+5LGH0PaV+FLGHa
 6iYSu5hNGf3Yr4ae5QvF1cgIASjHWUQGygwxuKc4tD3ClcKOL8j1aVkGTSLfUnc6vBZu
 eyBr5hBrUWVK+Cj4SlJFgEEwcvvO85W53VTPoy8yo69wWoggREm0V5wp3X/e/lNi1ViM
 VpFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FF+lW4l1rD3/qhWWyTh2XRqKAU4PcKOj5x+FeJQwbbA=;
 b=7iMnpn3kMqIRTPYcw/Z5soNUHVzyVxqNZPFfwa7cOblbWnI1M2eOVP9snWXzUms45J
 xB6w71AXiabEa86TpzZxrczvItY9BwLE1mtzq4CDRrWXIsC2lhI+9G6090ruRa67IC3j
 1LPI6OBnO0eaXDmzvhqKwrR70icJ6v+NvF7hkHcuy+21Dk4WYgcgTP80fhgtTQI56mr8
 mXVS99HrJwiv8zIEI+U8VU3tqRPp+nyKUN+ozTXj0Taq5WnLrjE8aLarZ9ico5vXmJLh
 00lWn1SKOY98rIkSKAOMkRD+aI29h4pLt4zbnlgr1dA1rDFIMm07z0qTCqe8WADoHz8d
 w8YQ==
X-Gm-Message-State: AOAM532rwskP3TXSwRAlNqeGaw25eL3kz22r/52eAQkGPX56+Y3iF2Z7
 8rvPkFzcccgN6yK05DhzQN3bv6qIQgVqOYn/OwmSQw==
X-Received: by 2002:a05:6902:728:b0:663:5591:aa2c with SMTP id
 l8-20020a056902072800b006635591aa2cmr24938238ybt.288.1654772759681; Thu, 09
 Jun 2022 04:05:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
 <20220522181836.864-35-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220522181836.864-35-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 12:05:49 +0100
Message-ID: <CAFEAcA8dW9dAez-jtjiTiDN27DiqfbkOL5epp9PG_ibvsaQhwg@mail.gmail.com>
Subject: Re: [PATCH 34/50] ps2: add gpio for output IRQ and optionally use it
 in ps2_raise_irq() and ps2_lower_irq()
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com, 
 pbonzini@redhat.com, hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, 
 f4bug@amsat.org, jiaxun.yang@flygoat.com, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lB6g1A0w6F98

On Sun, 22 May 2022 at 19:20, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> Define the gpio for the PS2 output IRQ in ps2_init() and add logic to optionally
> use it in ps2_raise_irq() and ps2_lower_irq() if the gpio is connected. If the
> gpio is not connected then call the legacy update_irq() function as before.
>
> This allows the incremental conversion of devices from the legacy update_irq()
> function to use gpios instead.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/input/ps2.c         | 21 +++++++++++++++++++--
>  include/hw/input/ps2.h |  4 ++++
>  2 files changed, 23 insertions(+), 2 deletions(-)
>
> diff --git a/hw/input/ps2.c b/hw/input/ps2.c
> index 214dda60bf..891eb7181c 100644
> --- a/hw/input/ps2.c
> +++ b/hw/input/ps2.c
> @@ -24,6 +24,7 @@
>
>  #include "qemu/osdep.h"
>  #include "qemu/log.h"
> +#include "hw/irq.h"
>  #include "hw/sysbus.h"
>  #include "hw/input/ps2.h"
>  #include "migration/vmstate.h"
> @@ -174,12 +175,20 @@ void ps2_queue_noirq(PS2State *s, int b)
>
>  static void ps2_raise_irq(PS2State *s)
>  {
> -    s->update_irq(s->update_arg, 1);
> +    if (s->irq) {

I know this code is going to go away in patch 50, but cleaner to write
 if (qemu_irq_is_connected(s->irq))
rather than directly testing for NULL.

> +        qemu_set_irq(s->irq, 1);
> +    } else {
> +        s->update_irq(s->update_arg, 1);
> +    }
>  }

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
