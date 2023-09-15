Received: by 2002:a17:907:20b4:b0:9a1:fa4e:495e with SMTP id pw20csp1274394ejb;
        Fri, 15 Sep 2023 07:24:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGbcqbm77N4kW7CrqKqH7Zh6h85xq6zWdhDKq5tDMbKem96LrwqLHapmHvJ/qQb9npUuDg
X-Received: by 2002:a0c:b712:0:b0:64f:6022:17d8 with SMTP id t18-20020a0cb712000000b0064f602217d8mr1951191qvd.15.1694787850922;
        Fri, 15 Sep 2023 07:24:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694787850; cv=none;
        d=google.com; s=arc-20160816;
        b=RCdn4IZZr3SvrHEZgvossPi9wYn6MdaNuDM+vae7vqxwhBcutR4+nMyfPTV0ThNeW+
         xPOBO138e8UMv2prtGcKhX6bC+M/IEdzj5EzBU6AXYL6aY0mufKbkOONB70Lz+mPT8FT
         sV9ZxVr4pZRcv1rXGctZIT5NRMJsyXdFWF3CbbN5GCz5uGiQiLa/O1wAaQkrCVYTpDtn
         WKYPr2t7gF8+dEeOlT513XcVo5jSjm4xbEAAnIHF669wCbkpGIiRikJXkRevj4+Ub0Un
         BpurbPTdP0HBFHs99jNlFEBKPNk1CeyiovWBhGfiIEp62Ameus88gsAWnCjz1xpuz1cs
         26IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=T7P5lmIXyoTdkYaNDAXw92bAgTHk4zwBBPIFAs4SYrE=;
        fh=SGyEP1WubH2rQDn1pb/xNFcN4ClqObs2wW97JeBaRhM=;
        b=raxD+RwnBaJ9mFUn45nEj9SKcLBKC/uU0V8EZQtIuV/ER8dKmFNvmeTvhe3bcAEaA4
         KicnwSzcsnaAOWapUGP9J+Y9SWtwBLsD3FDJ4U8ZrzY0bMqFnCztQ7JcCgXT8a6bipG/
         aVMj3HkmGBMhOXEfA7qJZEXf33yI1icsfrOTtgo4vkzCtIQHEAjZohEN9knTiwZOajdD
         jecMttrCJz1upA5XtKSIwQzWnZ+CUUjhWScw1mAAV14ti81GCeBmrW7VTbhb4TtajNHn
         zqfubH7V5zq2RpY4qGkVLOGzlwojmUpNB/A5KPoisZq+rtylFoYzk4pJ2Xae7anTHpMU
         YHzA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MgG+5YJS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n19-20020a0cdc93000000b00644c880072fsi2308659qvk.58.2023.09.15.07.24.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Sep 2023 07:24:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MgG+5YJS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qh9je-0003R3-Uh; Fri, 15 Sep 2023 10:23:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qh9jb-0003Qb-PT
 for qemu-arm@nongnu.org; Fri, 15 Sep 2023 10:23:51 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qh9jZ-0001OY-Q8
 for qemu-arm@nongnu.org; Fri, 15 Sep 2023 10:23:51 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-31c65820134so1924124f8f.1
 for <qemu-arm@nongnu.org>; Fri, 15 Sep 2023 07:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694787827; x=1695392627; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=T7P5lmIXyoTdkYaNDAXw92bAgTHk4zwBBPIFAs4SYrE=;
 b=MgG+5YJSKhVV/nTK4eWO/RXFFF/Vo9x2DJts6drXXHp1Oz9QAx4Y1auTFat2IRHiO8
 CY9hiJCJldF2xJux/h3lhyAUOuwe5s514nzTpDijrd1ObzgmDVVHrIc17dh1k6wa51Eq
 zNUZxsivhUnOM7rimBHoO1eh1c80qVQdZ/JZRQHJq6DfqbSQ2q0ROLCxkjYPm5RzFxo1
 TRlxGWQ2FSU+4OKhuElvGHo7B2sDwDkfVT4dzwtEuzSEufel49uLdDBD43Oe/jrNq05D
 CQUD/lihFcHqdOuFFVZL3DogrcMXsabWFHAoBnyt8aMlgrhjKzqOw/OKoeW2UPBaeZZR
 Wq6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694787827; x=1695392627;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=T7P5lmIXyoTdkYaNDAXw92bAgTHk4zwBBPIFAs4SYrE=;
 b=MFeCGCQFhrWT6/yLC74PZ9CTyCI/QVRQzsZcm/IL44bXwPOcChmixxG/sco8D5f+2D
 OtDg4gFr9EdzWly9FjakASvFV8lUtF1R1oRk1eLIK5vfdAnd6MR5RjKEIhKQ7Qx9N/E5
 //iX8m6ZIZ0MC8n0d/c2xz2HygtO8/5NNydH+uhoB7HZpBGc2tQZ2aF8hGsepsne26rO
 krnpE19V3dwpvY9f4CStBvSyA1cUnIUe7JLEHh7zETEnxfMt5F22dnrKGPqDu9XclC+Z
 3dKrteThEtFKjiRvxuet/DdzTTfE4b8gzsQDu/Ea6VWESLgJvuY9vjEIabRpF3ieeaRK
 9rdA==
X-Gm-Message-State: AOJu0Yzx6um40/vsGy45HJWAezYMjqh0RBJnFtJeatJBUjiza6r0rU2d
 qMS4/lxev5iuVCaAEytDAZ8Vi/aESCFYJoexZLdqdw==
X-Received: by 2002:a5d:46c4:0:b0:31d:cf59:8de with SMTP id
 g4-20020a5d46c4000000b0031dcf5908demr1772896wrs.19.1694787827290; Fri, 15 Sep
 2023 07:23:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230905201425.118918-1-strahinja.p.jankovic@gmail.com>
 <20230905201425.118918-6-strahinja.p.jankovic@gmail.com>
In-Reply-To: <20230905201425.118918-6-strahinja.p.jankovic@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 Sep 2023 15:23:27 +0100
Message-ID: <CAFEAcA-601OV-RDDy4V+b7+2Ciyer8LSRiz+tfLHMWBTgwXvPg@mail.gmail.com>
Subject: Re: [RFC Patch 5/5] hw/input: Add Allwinner-A10 PS2 emulation
To: Strahinja Jankovic <strahinjapjankovic@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Beniamino Galvani <b.galvani@gmail.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: fP8EkMg5YKc7

On Tue, 5 Sept 2023 at 21:14, Strahinja Jankovic
<strahinjapjankovic@gmail.com> wrote:
>
> Add emulation for PS2-0 and PS2-1 for keyboard/mouse.
>
> Signed-off-by: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>



> +static int allwinner_a10_ps2_fctl_is_irq(AwA10PS2State *s)
> +{
> +    return (s->regs[REG_INDEX(REG_FCTL)] & FIELD_REG_FCTL_TXRDY_IEN) ||
> +        (s->pending &&
> +         (s->regs[REG_INDEX(REG_FCTL)] & FIELD_REG_FCTL_RXRDY_IEN));

It looks a little odd that you need a separate s->pending bool here.
Sometimes hardware does odd things, but the most usual situation
is that the pending status of an interrupt is directly reflected
in a register bit somewhere, and "is the interrupt high" logic
is then just "is the pending bit set and is the enable bit set".
Often the bit positions are deliberately the same in the two
registers and then "is an interrupt set" is something like
  if (s->regs[REG_INDEX(REG_FCTL)] & s->regs[REG_INDEX(REG_FSTS)] &
      (TXRDY_IEN | RXRDY_IEN))



> +}
> +
> +static void allwinner_a10_ps2_update_irq(AwA10PS2State *s)
> +{
> +    int level = (s->regs[REG_INDEX(REG_GCTL)] & FIELD_REG_GCTL_INT_EN) &&
> +        allwinner_a10_ps2_fctl_is_irq(s);
> +
> +    qemu_set_irq(s->irq, level);
> +}
> +
> +static void allwinner_a10_ps2_set_irq(void *opaque, int n, int level)
> +{
> +    AwA10PS2State *s = (AwA10PS2State *)opaque;
> +
> +    s->pending = level;
> +    allwinner_a10_ps2_update_irq(s);
> +}
> +
> +static uint64_t allwinner_a10_ps2_read(void *opaque, hwaddr offset,
> +                                       unsigned size)
> +{
> +    AwA10PS2State *s = AW_A10_PS2(opaque);
> +    const uint32_t idx = REG_INDEX(offset);
> +
> +    switch (offset) {
> +    case REG_FSTS:
> +        {
> +            uint32_t stat = FIELD_REG_FSTS_TX_RDY;
> +            if (s->pending) {
> +                stat |= FIELD_REG_FSTS_RX_LEVEL1 | FIELD_REG_FSTS_RX_RDY;
> +            }
> +            return stat;

The logic here also suggests that the code would be simpler if you
keep the TX_RDY and RX_RDY state directly in this register value,
rather than hardcoding TX_RDY to always-set and keeping RX_RDY
in a separate pending field.

> +        }
> +        break;
> +    case REG_DATA:
> +        if (s->pending) {
> +            s->last = ps2_read_data(s->ps2dev);
> +        }
> +        return s->last;

You could keep the last returned data in s->regs[REG_IDX(REG_DATA)]
and avoid having to have an extra s->last field in the state struct.

> +    case REG_GCTL:
> +        {
> +            if (allwinner_a10_ps2_fctl_is_irq(s)) {
> +                s->regs[idx] |= FIELD_REG_GCTL_INT_FLAG;
> +            } else {
> +                s->regs[idx] &= FIELD_REG_GCTL_INT_FLAG;
> +            }
> +        }
> +        break;
> +    case REG_LCTL:
> +    case REG_LSTS:
> +    case REG_FCTL:
> +    case REG_CLKDR:
> +        break;
> +    case 0x1C ... AW_A10_PS2_IOSIZE:
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: out-of-bounds offset 0x%04x\n",
> +                      __func__, (uint32_t)offset);
> +        return 0;
> +    default:
> +        qemu_log_mask(LOG_UNIMP, "%s: unimplemented read offset 0x%04x\n",
> +                      __func__, (uint32_t)offset);
> +        return 0;
> +    }
> +
> +    return s->regs[idx];
> +}
> +
> +static void allwinner_a10_ps2_write(void *opaque, hwaddr offset,
> +                                   uint64_t val, unsigned size)
> +{
> +    AwA10PS2State *s = AW_A10_PS2(opaque);
> +    const uint32_t idx = REG_INDEX(offset);
> +
> +    s->regs[idx] = (uint32_t) val;
> +
> +    switch (offset) {
> +    case REG_GCTL:
> +        allwinner_a10_ps2_update_irq(s);
> +        s->regs[idx] &= ~FIELD_REG_GCTL_SOFT_RST;
> +        break;
> +    case REG_DATA:
> +        /* ??? This should toggle the TX interrupt line.  */
> +        /* ??? This means kbd/mouse can block each other.  */

I don't understand this comment. It looks like it was cut-and-pasted
from another device where it was originally written in 2005 (and
I don't understand it there either). We should either understand
what we mean here, or else not have the comment at all...

> +        if (s->is_mouse) {
> +            ps2_write_mouse(PS2_MOUSE_DEVICE(s->ps2dev), val);
> +        } else {
> +            ps2_write_keyboard(PS2_KBD_DEVICE(s->ps2dev), val);
> +        }
> +        break;
> +    case REG_LCTL:
> +    case REG_LSTS:
> +    case REG_FCTL:
> +    case REG_FSTS:
> +    case REG_CLKDR:
> +        break;
> +    case 0x1C ... AW_A10_PS2_IOSIZE:
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: out-of-bounds offset 0x%04x\n",
> +                      __func__, (uint32_t)offset);
> +        break;
> +    default:
> +        qemu_log_mask(LOG_UNIMP, "%s: unimplemented write offset 0x%04x\n",
> +                      __func__, (uint32_t)offset);
> +        break;
> +    }
> +}

thanks
-- PMM
