Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp6388001lfp;
        Tue, 18 Feb 2020 10:10:46 -0800 (PST)
X-Google-Smtp-Source: APXvYqzFmkXJntHX+Pfsp1ACAOYQn31PgwnGrrtmtxIsFVTXy/YKR+FzG4u44f82+ePzSqamBRa/
X-Received: by 2002:aed:2169:: with SMTP id 96mr18797926qtc.124.1582049445941;
        Tue, 18 Feb 2020 10:10:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582049445; cv=none;
        d=google.com; s=arc-20160816;
        b=TbxGXIVn4f7LE2xAQMp2SYQgKMMoTnCZxK/7teTC0Xi/ru+UmdYno35ktZ6MOLSJFk
         slRqUqcevV/Mm5WcgIm2o3opVt8ZbONtCL3FvgwcmJ7pYTP6VggiiKTJpPz8xEfTgGwj
         R6z85/g9Sb/zH26EsgfFwtn71zZ0YrWP6KckKh71gRLo0Ut5q6gFFK93cMJ48/TvERyF
         ple4eOuuUrv9OnPmvkDFcSJNPffvh7mJ8c50OfE0Rmv7VZzYOnqWAIbu0U8+57VNX42i
         rCtxs6pbynLIW6C5mUHkB74+VEqv9NjktvLH8izOU0klcEd1nkbOKhgn/NEI3LgqhT86
         1KSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=J+VIy0O5XdXZKn07jkrMRNJeMKYOXzruO3DBnEKwlT8=;
        b=j+eH18ZAWXatJ5uDaRKNZO3CTMg3NCBWYfKSpsTJgRSOPU2MY7/6D1Eh5uQWXQi0Fe
         v7i3GR2ka0OPWtl7TSfqvQZR42wvtWOw8WPyn0rLs2ShAyIIKiQLfAR2fv3B4HigIHlt
         P9dR/q8F0K4qtqr1YU9EE+AWvCbERbLmEGUNYVRIo8tc4WpNItEd2bAdhsTfT2z/nAmc
         BJeYypqC8V88WvS49Gd2UfxvZiU1Z3ozV2DZ4nFuHf60br+5OMkLGOpfcnwA9XQmWMlD
         iy4ZDzC1h3FrTeQSe8FFNGXhtot61EyEdreCnLQPyn/cxIMIYEgAu0qE+6Dq0bTs/zmn
         DU8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DOgg6EEq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l10si2071516qtv.179.2020.02.18.10.10.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Feb 2020 10:10:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DOgg6EEq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j47KX-0004n2-9u
	for alex.bennee@linaro.org; Tue, 18 Feb 2020 13:10:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59770)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j47KO-0004mk-Bf
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 13:10:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j47KN-0006O1-3S
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 13:10:36 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:35742)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j47KM-0006Ms-TM
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 13:10:35 -0500
Received: by mail-oi1-x242.google.com with SMTP id b18so21055194oie.2
 for <qemu-arm@nongnu.org>; Tue, 18 Feb 2020 10:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=J+VIy0O5XdXZKn07jkrMRNJeMKYOXzruO3DBnEKwlT8=;
 b=DOgg6EEq9cwk+Jtm3QnUh9xUgFN7XzRfx1Y+RLplYTPOEJsX620wD2C4VShobOQ/dA
 FZwft3HHGX2hdh8mIKps6W1Hh+86wCJ2NmcxOo2P0FKM7jHDGu5MWW4Qyo+Mp8kuLSAp
 SFMhn/qa+mBipYRDlWfzXhcy4YW5hZaHsfVtJogDf+PypSIkrTfh7VmPENfJ42Uv2Mqd
 2xso3YHBnCu32qvvvLjyK+GoxDpfChQWSveVY8YxUY15YwnSbzARO46/fygVfJFGZ26g
 dFCyCauBsXrULr4J3QvFphS285mLlH6/0xAr6SKJ7lTbrU/caoVKrcdU6SK697Dm16Ol
 V6gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J+VIy0O5XdXZKn07jkrMRNJeMKYOXzruO3DBnEKwlT8=;
 b=caksKDHujRha6pu6zew9rkBl8Ae6LAsPij0gZTLEGgUqMg67T+Pm2z1P/TBUuUZcCS
 DV9abLB+7VleHLzWNXScmhEj31irPVLHZ9oshkEEQW3aYtvOqDCpLuJvTq6eBkpNhGwU
 9qL9TjLqSiPA9YcrKCpF86dfL2JABLQ5MDUkbvlUsCTonnI1Ti6Vm2QDlOPhEBApb4/c
 wTQ6ZJhi3e2wo1SCGopu74WGLIMyUR2pEq0HF5GjElB7/L9XEwSy8KD9swXNxh++JKhU
 PNLUifULaCH5N96F03i9Gzf/79tE8PE9VRK4HkWkdvHRU3lXLRVdF08Lf9zvCeSnbv5P
 cA5g==
X-Gm-Message-State: APjAAAXzNK0/RrgOLtL7JouTgO72NapRfSQ7Xp0m/CYCiobt+MXewWDE
 +aVkaxQj8+hdSjXFo92YTvRIj14IfjPIpf+Qm5pQ0Q==
X-Received: by 2002:aca:3d7:: with SMTP id 206mr2092130oid.98.1582049434017;
 Tue, 18 Feb 2020 10:10:34 -0800 (PST)
MIME-Version: 1.0
References: <1581686212-9625-1-git-send-email-sai.pavan.boddu@xilinx.com>
 <1581686212-9625-2-git-send-email-sai.pavan.boddu@xilinx.com>
In-Reply-To: <1581686212-9625-2-git-send-email-sai.pavan.boddu@xilinx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 Feb 2020 18:10:22 +0000
Message-ID: <CAFEAcA-+=DrPkRE1sGNSNEBhaXYsUNi=-tOy58cZ3f1OiV2QVA@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm_gic: Mask the un-supported priority bits
To: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
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
X-TUID: ENukQuyRvDxy

On Fri, 14 Feb 2020 at 13:21, Sai Pavan Boddu
<sai.pavan.boddu@xilinx.com> wrote:
>
> Priority bits implemented in arm-gic can 8 to 4, un-implemented bits
> are read as zeros(RAZ).

This is nice to see -- I've known our GIC was a bit out-of-spec
in this area but it's good to see it's less painful to
retrofit than I thought it might be.

> Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
> ---
>  hw/intc/arm_gic.c                | 9 ++++++---
>  hw/intc/arm_gic_common.c         | 1 +
>  include/hw/intc/arm_gic_common.h | 1 +
>  3 files changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
> index 1d7da7b..8875330 100644
> --- a/hw/intc/arm_gic.c
> +++ b/hw/intc/arm_gic.c
> @@ -43,6 +43,9 @@
>          }                                                               \
>      } while (0)
>
> +#define UMASK(n) \
> +    ((((1 << n) - 1) << (8 - n)) & 0xFF)

This is a bit confusingly named (usually 'umask' is the file-permission
mask on unix). I think it's worth following the pattern used
in hw/intc/arm_gicv3_cpuif.c for icv_fullprio_mask(), and using
a function with a comment describing it. Also, you've not considered
the virtualization parts of the GIC, which also use these
codepaths. In those cases, the value of the mask is always
based on GIC_VIRT_MAX_GROUP_PRIO_BITS of priority (a GICv2
has 5 bits of priority in the VGIC, always). So:

static uint32_t gic_fullprio_mask(GICState *s, int cpu)
{
    /*
     * Return a mask word which clears the unimplemented priority
     * bits from a priority value for an interrupt. (Not to be
     * confused with the group priority, whose mask depends on BPR.)
     */
    int pribits;

    if (gic_is_vcpu(cpu)) {
        pribits = GIC_VIRT_MAX_GROUP_PRIO_BITS;
    } else {
        pribits = s->n_prio_bits;
    }
    return ~0U << (8 - s->n_prio_bits);
}

> +
>  static const uint8_t gic_id_11mpcore[] = {
>      0x00, 0x00, 0x00, 0x00, 0x90, 0x13, 0x04, 0x00, 0x0d, 0xf0, 0x05, 0xb1
>  };
> @@ -652,9 +655,9 @@ void gic_dist_set_priority(GICState *s, int cpu, int irq, uint8_t val,
>      }
>
>      if (irq < GIC_INTERNAL) {
> -        s->priority1[irq][cpu] = val;
> +        s->priority1[irq][cpu] = val & UMASK(s->n_prio_bits) ;
>      } else {
> -        s->priority2[(irq) - GIC_INTERNAL] = val;
> +        s->priority2[(irq) - GIC_INTERNAL] = val & UMASK(s->n_prio_bits);
>      }
>  }

Slightly cleaner to just put
   val &= gic_fullprio_mask(s);
before the if() rather than doing the same thing in both branches.

>
> @@ -684,7 +687,7 @@ static void gic_set_priority_mask(GICState *s, int cpu, uint8_t pmask,
>              return;
>          }
>      }
> -    s->priority_mask[cpu] = pmask;
> +    s->priority_mask[cpu] = pmask & UMASK(s->n_prio_bits);
>  }
>
>  static uint32_t gic_get_priority_mask(GICState *s, int cpu, MemTxAttrs attrs)
> diff --git a/hw/intc/arm_gic_common.c b/hw/intc/arm_gic_common.c
> index e6c4fe7..e4668c7 100644
> --- a/hw/intc/arm_gic_common.c
> +++ b/hw/intc/arm_gic_common.c
> @@ -357,6 +357,7 @@ static Property arm_gic_common_properties[] = {
>      DEFINE_PROP_BOOL("has-security-extensions", GICState, security_extn, 0),
>      /* True if the GIC should implement the virtualization extensions */
>      DEFINE_PROP_BOOL("has-virtualization-extensions", GICState, virt_extn, 0),
> +    DEFINE_PROP_UINT32("num-prio-bits", GICState, n_prio_bits, 8),

In patch 2 you use "num-priority-bits" for the proprety name
on the a9mpcore object. I like that better, and I think we
should name the property the same thing on both devices.

You should have some code in the realize method which sanity
checks the n_prio_bits value we are passed. It can't be
more than 8, and I'm not sure what the lowest valid value
is. Your commit message says 4. I'm pretty sure that if the
GIC has the virt extensions then it can't be less than
GIC_VIRT_MAX_GROUP_PRIO_BITS (ie 5).

thanks
-- PMM
