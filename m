Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp303483njb;
        Tue, 4 Feb 2025 07:56:24 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW+43qTptRzx3M6Y/EL4avPnnu2bdy15YL8780BRnMRyBC7xb3z2ZGkVJE1ehPQrnCHLEU4L5+tIOmgLg==@linaro.org
X-Google-Smtp-Source: AGHT+IFJu/Y5Mbdvra/Wdjwdn/kPan+k0lcCqVQYV5VXQhSdKf+6LwOmIprlk+Ws6kMQUDvgTYbM
X-Received: by 2002:a05:620a:271f:b0:7b6:c486:c4fc with SMTP id af79cd13be357-7bffccc5d35mr3870391285a.4.1738684584770;
        Tue, 04 Feb 2025 07:56:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738684584; cv=none;
        d=google.com; s=arc-20240605;
        b=C7X/2VfLMJIJCgE3dCKIXn+rSPcQ2cXK/Y3o0pWIbEqi9KVIflRdVz0DP9PNGEtBUn
         H10o7qB7M1z/loUXkbbfEpP0cl2hK1FXoHTqm95Wn8Pz7tSDD4lFZSwa2sc2HQLR6SCy
         WRj2B2ag+SU8PECK3egf0Q6iyHM/kvLk1Y/Q9HMCP163TE/nuL+sdNsqdPNeZrWeWiMa
         mf82TOuuEMl+td7Xh6UkBTnJThy4n5PArIe4CM1zhFZ8DX4I/BKA2LdqSm4kx5iqQjD1
         2H6JhuER/l6A6ksO8m/9PLSqkkk5it/8OV80vMIsCKzjyoP5EOdUvA/Gmmy+5kWL9jFs
         q4jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=qNXD0c3Wqp6I9lOufInk0/9QAiEHHO39zdWRZ/smY8U=;
        fh=rEivEy0Q92VafJjbqAN1xDaHhuLUfc2z3R+cg2mIYSU=;
        b=MEyy0WtVZtACmQeGwelFni5iD342gznxxkf2U5fx3wQy7ce/a9K7vVTFo/WR+5sqpA
         +feHREf9/g1zG0GdH+ULeXxjrVhHxwwOH9d8fxBr/ESFqLzAwkZoQruQI52VLxwSGzE+
         1KHwnxrjCBVpm87FQw+zgSsfGm5IM7C0VMCsv1i3I5RgvRnZ61cCCK+8wm62625IjKc3
         oX6GitmA/qjKgTChDLZHMYRfwlFJ1CVrNl5oa6FbuxgbmsuG8UsRJg+am6NHajkyuZSd
         9HLFwK2+3DdkCL+tOZlMTNuN815NmhQ4WJ/6M8RQhTfM/kE+t3roYLJ0+OhJPWKduM4Y
         813g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bYhMm+k4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c02dbe7139si296820385a.334.2025.02.04.07.56.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Feb 2025 07:56:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bYhMm+k4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tfLHP-00024s-UX; Tue, 04 Feb 2025 10:56:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tfLHO-00024L-JC
 for qemu-devel@nongnu.org; Tue, 04 Feb 2025 10:56:02 -0500
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tfLHN-00021s-0i
 for qemu-devel@nongnu.org; Tue, 04 Feb 2025 10:56:02 -0500
Received: by mail-yb1-xb30.google.com with SMTP id
 3f1490d57ef6-e3983426f80so5058573276.1
 for <qemu-devel@nongnu.org>; Tue, 04 Feb 2025 07:56:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738684560; x=1739289360; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qNXD0c3Wqp6I9lOufInk0/9QAiEHHO39zdWRZ/smY8U=;
 b=bYhMm+k44wPiFJPo7MeMhhVz2RXlPEzZF+J7FEvCbFIO6IlHoqwSBP1S029SH1+JGS
 GeAP1z1rJxGsX191qfqD/wHTAaogW4ZH1e8Dzwyd3Kp9rLb6ytAnZ9KNU10nyCNezvxf
 gqsEQvqBrkSrvkJr8HzopFHZO8Fm6dWN2W1/eb4J5o2sxXJo90o+gyMZhNOQ1aPO5KMx
 5s+y1ipZUXInPPX8GptQKchD4QO4iIxqhCVIZ9CvbWw0l20JDu+V01kW3IjabJAcrNgi
 XMNFdhryvg0mEzS7Q8v6zxxafGILyzu8FoIoglczxE3yRt6CZJLXlpw40u/m6hGwHVuZ
 ypSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738684560; x=1739289360;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qNXD0c3Wqp6I9lOufInk0/9QAiEHHO39zdWRZ/smY8U=;
 b=UtpTR+O8LXINSxWUxyZlR3spgDH5Vtx4OkgL4I5BNih/zPLSdi+7/pq1bp5Cmz6lAd
 JHZT0Zw0vl5H6746gOwfcUxd9p/a+gT6WwBjZykJ2RfvQJ3Er7wS+29giPGTjYHDiJRo
 vVeBZWrJs3biSM4dLCNnFgv0q5Az9gdPDzbuHmNBZ1CycYs+KzH85a5RhCtLZERHtesR
 FaGN5At6F+mCytcB9ydf7rXL3m/JG+ib7/bTB09NmK9lxhDyBxXN/6ayXO8/b7gjCbs3
 00M4rEFKdXcoE9FOmNIScJaqMBqTNuAmRW2eIoR+nmc9PtBnFfW1pNoHVk+HQQgz0yLG
 JA3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcNAbw4mzK024SFmqoBmVZCTcwEzN7chkyZNa8CvO9P9Hu5dCYGEUYAhtfv1fzI/bPLIyXZEE9xw2F@nongnu.org
X-Gm-Message-State: AOJu0Yya8ubj6tGZ/NXBtp423HSU0hh81KDJEejblKyopziezY2s6Yd+
 cs2QntH+yMndHDnXyiEVKBrrzvgxH8/udrI6gsvirFYSpDGKVKIULiRCVDUCYfcX5Dd3+szBxCH
 8Z4BqN+km1v7DxXp8axXohF/B6e/owzeOBhIWMg==
X-Gm-Gg: ASbGncunmxKD4/o+GFqim1k/jrDqUHpb3ZreXC39+hFvBuEULbPTHprvxCM6EbnOC6t
 +9XwSZ+ukPEpDNLB2Xs8ktNqos/XC2RhhXl1ogrhftM8lH86Ui31wJu2+0lzeW/vi+AW1DaQdiw
 ==
X-Received: by 2002:a05:6902:27c8:b0:e59:dbac:d993 with SMTP id
 3f1490d57ef6-e59dbacda16mr18973724276.17.1738684559653; Tue, 04 Feb 2025
 07:55:59 -0800 (PST)
MIME-Version: 1.0
References: <20241226082800.2887689-1-wuhaotsh@google.com>
 <20241226082800.2887689-11-wuhaotsh@google.com>
In-Reply-To: <20241226082800.2887689-11-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Feb 2025 15:55:48 +0000
X-Gm-Features: AWEUYZlA-QXxPJOjNuZD_TaGnj1L_c1v0otiylryN3pjjptxsg-theZwC9-1jpg
Message-ID: <CAFEAcA99ZeiHKTLVWrTYCQm16O=cyNSaNm1cbTG1qybxiOcHqA@mail.gmail.com>
Subject: Re: [PATCH v2 10/17] hw/misc: Support 8-bytes memop in NPCM GCR module
To: Hao Wu <wuhaotsh@google.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, titusr@google.com, hskinnemoen@google.com, 
 venture@google.com, pbonzini@redhat.com, jasowang@redhat.com, 
 alistair@alistair23.me
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: ruho39RMsrqP

On Thu, 26 Dec 2024 at 08:28, Hao Wu <wuhaotsh@google.com> wrote:
>
> The NPCM8xx GCR device can be accessed with 64-bit memory operations.
> This patch supports that.
>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> ---
>  hw/misc/npcm_gcr.c   | 94 +++++++++++++++++++++++++++++++++-----------
>  hw/misc/trace-events |  4 +-
>  2 files changed, 74 insertions(+), 24 deletions(-)
>
> diff --git a/hw/misc/npcm_gcr.c b/hw/misc/npcm_gcr.c
> index a4c9643119..7dfdd3d74b 100644
> --- a/hw/misc/npcm_gcr.c
> +++ b/hw/misc/npcm_gcr.c
> @@ -201,6 +201,7 @@ static uint64_t npcm_gcr_read(void *opaque, hwaddr offset, unsigned size)
>      uint32_t reg = offset / sizeof(uint32_t);
>      NPCMGCRState *s = opaque;
>      NPCMGCRClass *c = NPCM_GCR_GET_CLASS(s);
> +    uint64_t value;
>
>      if (reg >= c->nr_regs) {
>          qemu_log_mask(LOG_GUEST_ERROR,
> @@ -209,9 +210,21 @@ static uint64_t npcm_gcr_read(void *opaque, hwaddr offset, unsigned size)
>          return 0;
>      }
>
> -    trace_npcm_gcr_read(offset, s->regs[reg]);
> +    switch (size) {
> +    case 4:
> +        value = s->regs[reg];
> +        break;
> +
> +    case 8:
> +        value = s->regs[reg] + (((uint64_t)s->regs[reg + 1]) << 32);

Maybe
  value = deposit64(s->regs[reg], 32, 32, s->regs[reg + 1]);
?

(Mostly it's just the cast that makes me suggest a rephrase.)

> +        break;
> +
> +    default:
> +        g_assert_not_reached();
> +    }
>
> -    return s->regs[reg];
> +    trace_npcm_gcr_read(offset, value);
> +    return value;
>  }
>
>  static void npcm_gcr_write(void *opaque, hwaddr offset,
> @@ -231,29 +244,65 @@ static void npcm_gcr_write(void *opaque, hwaddr offset,
>          return;
>      }
>
> -    switch (reg) {
> -    case NPCM7XX_GCR_PDID:
> -    case NPCM7XX_GCR_PWRON:
> -    case NPCM7XX_GCR_INTSR:
> -        qemu_log_mask(LOG_GUEST_ERROR,
> -                      "%s: register @ 0x%04" HWADDR_PRIx " is read-only\n",
> -                      __func__, offset);
> -        return;
> -
> -    case NPCM7XX_GCR_RESSR:
> -    case NPCM7XX_GCR_CP2BST:
> -        /* Write 1 to clear */
> -        value = s->regs[reg] & ~value;
> +    switch (size) {
> +    case 4:
> +        switch (reg) {
> +        case NPCM7XX_GCR_PDID:
> +        case NPCM7XX_GCR_PWRON:
> +        case NPCM7XX_GCR_INTSR:
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "%s: register @ 0x%04" HWADDR_PRIx " is read-only\n",
> +                          __func__, offset);
> +            return;
> +
> +        case NPCM7XX_GCR_RESSR:
> +        case NPCM7XX_GCR_CP2BST:
> +            /* Write 1 to clear */
> +            value = s->regs[reg] & ~value;
> +            break;
> +
> +        case NPCM7XX_GCR_RLOCKR1:
> +        case NPCM7XX_GCR_MDLR:
> +            /* Write 1 to set */
> +            value |= s->regs[reg];
> +            break;
> +        };
> +        s->regs[reg] = value;
>          break;
>
> -    case NPCM7XX_GCR_RLOCKR1:
> -    case NPCM7XX_GCR_MDLR:
> -        /* Write 1 to set */
> -        value |= s->regs[reg];
> +    case 8:
> +        s->regs[reg] = value;
> +        s->regs[reg + 1] = v >> 32;

s->regs[reg + 1] = extract64(v, 32, 32);

>          break;
> -    };
>
> -    s->regs[reg] = value;
> +    default:
> +        g_assert_not_reached();
> +    }
> +}

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
