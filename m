Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1929670lfg;
        Fri, 21 Feb 2020 07:31:03 -0800 (PST)
X-Google-Smtp-Source: APXvYqwJIUOIugdwgcqqmszPr7pN8xWUQbKLUImdT8P3myM0nWTMwNk5Lq+tsaJeFwzcqeIP/Qrz
X-Received: by 2002:aed:3463:: with SMTP id w90mr31499439qtd.42.1582299063221;
        Fri, 21 Feb 2020 07:31:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582299063; cv=none;
        d=google.com; s=arc-20160816;
        b=HiT3E0wdUDjePy2A2ZKpq/pTAsUk/6MUfsewVBCDS83UGceGgZPMVewQIoZNgn1HBM
         rViANce+2xagv5U3t4IIVMB+yT06OfJ9MzAnNC9W39+eYZJX4N6q2spdp95SD50hnn0q
         S2eQpyzYiB83dNwPpRNm7xkkci70BTdza0GuckGmb2teYhMcD+8drcctUPhySokrmIt+
         tyGfpwZGgh+Uz5gTCTymVygysdx7Xf6g6JxTpycsT1kANPRo6iL8FWweLbl+NfimPz38
         +Ma2WQjSl+uhBxf+YaAIWR4pLLLUYnl73I9vhZ01ChmNJpyJbxT1U3P+imBFY8uMa1yl
         FgYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8q1sawrAR7L0CtEGCE+s9tKiGKo+ZNnF45eMhlEP5bk=;
        b=n2zbhFJUtu7SaFhTUPQJDtNwyoRpbheVf5PU/O0caBL95qCtnEf8ILtm0ZKOsh1b9q
         6TivFJO7TR/QpC58Uqb9svKVKnkt2H59HtMkrBymVBfAIfmu9SR45+SatxUrkTfEObir
         82UPVuVchIqugZ+V7yE5LOkAPz7uY2ZnLT5iMlETfLe8Xmb7OYn6Bw2GNEYFQ3cO/2J9
         OFAFZ/uQq93R/Ftd/BHsCVB5KXxdZP0BClDoh5Kz9sqLX0Syzm4gSRBCpavW8NEmf4Ae
         imWpUhixiEsruXfkvN5vLuDgGjVfk+YscIVtSS044gpBnLR1NRMIlq3LKUSnl3WMu+TV
         U2Ug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="prw/lj0M";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x13si1519016qkj.359.2020.02.21.07.31.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Feb 2020 07:31:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="prw/lj0M";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j5AGc-00017H-IR
	for alex.bennee@linaro.org; Fri, 21 Feb 2020 10:31:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36385)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j5AG0-0000PT-Gv
 for qemu-arm@nongnu.org; Fri, 21 Feb 2020 10:30:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j5AFz-0002fo-5H
 for qemu-arm@nongnu.org; Fri, 21 Feb 2020 10:30:24 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:37415)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j5AFy-0002ez-UM
 for qemu-arm@nongnu.org; Fri, 21 Feb 2020 10:30:23 -0500
Received: by mail-ot1-x343.google.com with SMTP id b3so2335396otp.4
 for <qemu-arm@nongnu.org>; Fri, 21 Feb 2020 07:30:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8q1sawrAR7L0CtEGCE+s9tKiGKo+ZNnF45eMhlEP5bk=;
 b=prw/lj0MFL1ohYfunJmvfyt8+yw1W2KsB0Dkb0yrTyiVqOL1aknpqtDry7n1OmCrVA
 DKHZjjC4V3wje41lNWrObHfuH4zowyxjvilsMENtjAdvJaL/71w1glKUwM5oG7fobItf
 vtCR5sH/O7AsDWzJYlKXvZzntbEBhJJqFwmcG9JUf+2aZZsYmFET8xTtudRJLaAQFrPP
 /QMaxkGKElvbCGLCgvzvIHSqn2x1cL/2cIAslJkH0naFJKQzkqzAyGP5G1MjW/8dU/CU
 nmrXYVL2z9xlods4Q4e+uhdchgI/C+7lXrHzCC4yKFmKvPTYPjnBiY/TnJUsWfGyb8LY
 tKiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8q1sawrAR7L0CtEGCE+s9tKiGKo+ZNnF45eMhlEP5bk=;
 b=Hq5P7U3RzgS77QcuGslKv9+mAk2fQPiBVn0QqCYBNwPK216a2xzzbteYtsYweLu8M0
 PAt7kvkHs7O7Wa7lIkO/HXFw521JTypcURNjDWoLonitI5p06qr0UB0/hTP1yyus+je6
 WJbh8DllmGHyX6jI6wVh7bOMUF8YO8tKKgbOY7BPJkRDQQK0kdgpK8DJ2YKy7Un96xiX
 DItIeO8qBgjlyJfrpy6VEy+hYweC6g6uLNol4Qyrz/WnNqAY4ETKHgs1LUGShXhW/pWr
 ODc6dBOXA5ycpsqrP+1RcIIhLe46Ge1pDwBF6JeGeYypwJbcDFA/0t9zOoRnHSB5JwWA
 EwXw==
X-Gm-Message-State: APjAAAXDfUuzQQkFlpFbNWau4bZHTYwnhOmmqVP9OdHfe/MW7wNkhIc1
 YSOSmVPK0zDcgo2cSPidfHGjZ3nMc01u6BTdOLnbeQ==
X-Received: by 2002:a05:6830:4a4:: with SMTP id
 l4mr28894585otd.91.1582299020896; 
 Fri, 21 Feb 2020 07:30:20 -0800 (PST)
MIME-Version: 1.0
References: <1582270927-2568-1-git-send-email-sai.pavan.boddu@xilinx.com>
 <1582270927-2568-2-git-send-email-sai.pavan.boddu@xilinx.com>
In-Reply-To: <1582270927-2568-2-git-send-email-sai.pavan.boddu@xilinx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 21 Feb 2020 15:30:10 +0000
Message-ID: <CAFEAcA-NYkaQuJq=0Ft7j0XEPqJQz=G=wwKTWTxdbCmSRUh6uA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] arm_gic: Mask the un-supported priority bits
To: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Anthony Liguori <anthony@codemonkey.ws>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: B1G2nH1ha85L

On Fri, 21 Feb 2020 at 07:46, Sai Pavan Boddu
<sai.pavan.boddu@xilinx.com> wrote:
>
> Priority bits implemented in arm-gic can be 8 to 4, un-implemented bits
> are read as zeros(RAZ).
>
> Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
> ---
>  hw/intc/arm_gic.c                | 26 ++++++++++++++++++++++++--
>  hw/intc/arm_gic_common.c         |  1 +
>  include/hw/intc/arm_gic_common.h |  1 +
>  3 files changed, 26 insertions(+), 2 deletions(-)
>
> diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
> index 1d7da7b..dec8767 100644
> --- a/hw/intc/arm_gic.c
> +++ b/hw/intc/arm_gic.c
> @@ -641,6 +641,23 @@ uint32_t gic_acknowledge_irq(GICState *s, int cpu, MemTxAttrs attrs)
>      return ret;
>  }
>
> +static uint32_t gic_fullprio_mask(GICState *s, int cpu)
> +{
> +    /*
> +     * Return a mask word which clears the unimplemented priority
> +     * bits from a priority value for an interrupt. (Not to be
> +     * confused with the group priority, whose mask depends on BPR.)
> +     */
> +    int unimpBits;
> +
> +    if (gic_is_vcpu(cpu)) {
> +        unimpBits = GIC_VIRT_MAX_GROUP_PRIO_BITS;
> +    } else {
> +        unimpBits = 8 - s->n_prio_bits;

This isn't right; GIC_VIRT_MAX_GROUP_PRIO_BITS should
be handled the same way as s->n_prio_bits. The expression
I suggested in my comment on your v1 should work:

    if (gic_is_vcpu(cpu)) {
        pribits = GIC_VIRT_MAX_GROUP_PRIO_BITS;
    } else {
        pribits = s->n_prio_bits;
    }
    return ~0U << (8 - s->n_prio_bits);

> +    }
> +    return ~0U << unimpBits;
> +}
> +
>  void gic_dist_set_priority(GICState *s, int cpu, int irq, uint8_t val,
>                        MemTxAttrs attrs)
>  {


You seem to have lost the part of the patch which applies
the mask in gic_dist_set_priority(). If the GIC only
has 5 bits of priority we should not allow the guest to
set more than that.

> @@ -669,7 +686,7 @@ static uint32_t gic_dist_get_priority(GICState *s, int cpu, int irq,
>          }
>          prio = (prio << 1) & 0xff; /* Non-secure view */
>      }
> -    return prio;
> +    return prio & gic_fullprio_mask(s, cpu);
>  }
>
>  static void gic_set_priority_mask(GICState *s, int cpu, uint8_t pmask,
> @@ -684,7 +701,7 @@ static void gic_set_priority_mask(GICState *s, int cpu, uint8_t pmask,
>              return;
>          }
>      }
> -    s->priority_mask[cpu] = pmask;
> +    s->priority_mask[cpu] = pmask & gic_fullprio_mask(s, cpu);
>  }
>
>  static uint32_t gic_get_priority_mask(GICState *s, int cpu, MemTxAttrs attrs)
> @@ -2055,6 +2072,11 @@ static void arm_gic_realize(DeviceState *dev, Error **errp)
>          return;
>      }
>
> +    if (s->n_prio_bits > 8) {
> +        error_setg(errp, "num-priority-bits cannot be greater than 8");
> +        return;
> +    }

You need to also check that the value is at least as large
as the lowest permitted value, as I suggested in my v1 comment.

thanks
-- PMM
