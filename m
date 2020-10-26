Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp3029340lfa;
        Mon, 26 Oct 2020 09:39:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyKxpiu9x3CKdk/a8sUOeiYJGmxwVS9HEu/UHuvVD9AOT3zvjQGHiz7MSV6ewXTmLuwUxZ1
X-Received: by 2002:a0c:a4c5:: with SMTP id x63mr14293929qvx.58.1603730344612;
        Mon, 26 Oct 2020 09:39:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603730344; cv=none;
        d=google.com; s=arc-20160816;
        b=THUODUM4VdSf2T7E/MHugekulZINznUJrjzuZUD9j48URntJ2s7qRK27aMccaynhlM
         XhoFjwolQXInmMOveOSj8QABja6in/MqIbviAYzpnwXWMxn2gtrbvL/vn3lfve5vlmWI
         eEYCKt67Vpx4gKyaLkRjpPk2R9yOFKWWYch5K1o/kl/O0rPLkXhCCDZV4OLRF3SX646l
         RvTj7/K6fQU3g/4T8hq9HIq/m5Bc6FgnALPSgsm4uwEq7L/U/a0P+pkxbv8mRgFuXuEf
         Z1MhnKwLZkZM4C8l4AhZvrlC6xijtyw+88SYIEAfDY6WoqKV7VYy70LONSk4mSZFgXG0
         2clw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DI53dgFPkps8h/TY5y041PBMFl/Ix4XWl8lmpI6++jY=;
        b=Z9MfobYwlmaxqR+fuIGW3Ht/T99Q7OMHriECkKmreNkCRwaFKAg+p6bH8mb/aaxTdJ
         7dry+q683AiS6Q6Z7ZXgt4O1gvGTEYP6Kmt8byZweKuMRm9z2zVU85Pw3GuEHhvq9G+G
         LVPQTEyzgCu5OpaR0x4MPyUSylhnRPNxG3yf8BgCSxKuy3l4i48+CRJzvTijeho3/U4j
         XSdXHo5stlGn33YeTPrZZDT0elPjKU3vI7oAypqfFUrPNgmLLxBKzFSGN9SFWtEds0bN
         B6+ZJpVOURo5KWV/ACgSu1/JyWj4+GL4jQkhdPhjT4fFQFdBZmaN0tl+oRT3A3SW+dJl
         4L0w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=pJXbGOJ0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p6si5819488qkh.312.2020.10.26.09.39.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Oct 2020 09:39:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=pJXbGOJ0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kX5WS-0003UZ-21
	for alex.bennee@linaro.org; Mon, 26 Oct 2020 12:39:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kX5Qw-000587-SH
 for qemu-arm@nongnu.org; Mon, 26 Oct 2020 12:33:23 -0400
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:40384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kX5Qt-000200-AT
 for qemu-arm@nongnu.org; Mon, 26 Oct 2020 12:33:22 -0400
Received: by mail-ej1-x643.google.com with SMTP id z5so14509229ejw.7
 for <qemu-arm@nongnu.org>; Mon, 26 Oct 2020 09:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DI53dgFPkps8h/TY5y041PBMFl/Ix4XWl8lmpI6++jY=;
 b=pJXbGOJ0idyZzT6rBH9Lt8m+PdlZePfNpNtF3gGKrocKmeTnpb/jWDZ9gnaMo2DCta
 42STIfKSSVdvt4LOhvsjRlo3T9eWFYjcpcX+K526bXb8uF6L7oG9Ux7rwerhh8t84mmd
 bQ6Xp7Cjfb5X/Ami9VcC5Yl/Q7GtP1GA1dwoJoJBWmEgcs090Zg2yTeyGBxWycb3ir14
 GS9AEXEnJ1JZNCVL+VLTOz/lB9rEPCkGANsNQNG4aVjPHcYz1oY14eCy9OZDyIJQsqvH
 ocRndUHoh8lRG29p3i6lI6dAGX3M52TdfF0NZobA1jeHar+lBmU75ZPzdlViuUkS30hp
 kCfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DI53dgFPkps8h/TY5y041PBMFl/Ix4XWl8lmpI6++jY=;
 b=RAA1DvJrxZeYYyCrFzC3lrjQydU+gyhcqF026PbNKuXcDbQnuEZ46BbEsfn1M/OJ+b
 ERNFRk86c5muQ+gZGcpZrKCh8q+VZ/PLESLmY7PxkDqqQTYqbCL10xLq+UXxvrKJ+k6F
 OS7R0Pw3eJp+xsadxOsQi/O57rOYxAERkh0iXYzOhjexHRYPteKEYYKiZImxKdewV78V
 ON/6tJxXmiuFlKE74IWNJxaYMYqox8AFzdNUslFsCoZp8y3IuzjIsDwxRf2I2mhq4CLX
 N1LetNjS3FoAdg5hksbggWwUPQytrxdBZwwS8I+/skTBcTbtaf7FghnqRoPBygtuQcY0
 BmdQ==
X-Gm-Message-State: AOAM533YtUsqal7KHMib7xLH1+oXpV36eAt4TV4/bVgxLj4cQX8x6GHI
 w8VTBkAtND0RLb7lgn4aGFfaVBSmOQcJqUK1HxiYBg==
X-Received: by 2002:a17:906:af8d:: with SMTP id
 mj13mr16141276ejb.85.1603729997270; 
 Mon, 26 Oct 2020 09:33:17 -0700 (PDT)
MIME-Version: 1.0
References: <20201023160057.21543-1-shashi.mallela@linaro.org>
 <20201023160057.21543-2-shashi.mallela@linaro.org>
In-Reply-To: <20201023160057.21543-2-shashi.mallela@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 26 Oct 2020 16:33:05 +0000
Message-ID: <CAFEAcA9AeG6U1rCHuSSJctBafwMu+h1-8x5OgF==QdWs2SBM4A@mail.gmail.com>
Subject: Re: [PATCH v7 1/2] hw/watchdog: Implement SBSA watchdog device
To: Shashi Mallela <shashi.mallela@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::643;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: Leif Lindholm <leif@nuviainc.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Radoslaw Biernacki <rad@semihalf.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eJ8RF2LpIVIN

On Fri, 23 Oct 2020 at 17:01, Shashi Mallela <shashi.mallela@linaro.org> wrote:
>
> Generic watchdog device model implementation as per ARM SBSA v6.0
>
> Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>

Thanks for the respin; only a couple of minor issues left.

General note: you implement WS0 with an external qemu_irq line.
You correctly call qemu_set_irq(s->irq, 1) when you set the WS0
bit in sbsa_gwdt_timer_sysinterrupt(), but you also need to lower
the line by calling qemu_set_irq(s->irq, 0) whenever WS0 is cleared.
(The exception to this is that you mustn't call qemu_set_irq()
in the sysbus reset method, because it can confuse the device
on the other end of the irq line which is also going to be
resetting.)

Otherwise I just have some minor nits about bit operation style.

> +static void sbsa_gwdt_write(void *opaque, hwaddr offset, uint64_t data,
> +                             unsigned size) {
> +    SBSA_GWDTState *s = SBSA_GWDT(opaque);
> +    bool enable;
> +
> +    switch (offset) {
> +    case SBSA_GWDT_WCS:
> +        enable = data & SBSA_GWDT_WCS_EN;
> +        if (enable) {
> +            s->wcs |= SBSA_GWDT_WCS_EN;
> +        } else {
> +            s->wcs &= ~SBSA_GWDT_WCS_EN;
> +        }
> +        s->wcs &= ~SBSA_GWDT_WCS_WS0;
> +        s->wcs &= ~SBSA_GWDT_WCS_WS1;

These 8 lines are a long-winded way to write:

  /* All writes clear WS0 and WS1 */
  s->wcs = data & SBSA_GWDT_WCS_EN;

> +        sbsa_gwdt_update_timer(s, EXPLICIT_REFRESH);
> +        break;
> +
> +    case SBSA_GWDT_WOR:
> +        /*
> +         * store the lower 32 bits of WOR for now.
> +         * explicit refresh to be triggered on upper 16 bits
> +         * being written to WORU register (that follows this write)
> +         */

There's nothing in the spec that I can see that obliges the guest
to write the high half last. I think you should call the
timer update function and clear WS0/WS1 for a write here as well
as one to WORU.

> +        s->worl = data;
> +        break;
> +
> +    case SBSA_GWDT_WORU:
> +        s->woru = data & SBSA_GWDT_WOR_MASK;
> +        s->wcs &= ~SBSA_GWDT_WCS_WS0;
> +        s->wcs &= ~SBSA_GWDT_WCS_WS1;

You might as well combine these into one line:
           s->wcs &= ~(SBSA_GWDT_WCS_WS0 | SBSA_GWDT_WCS_WS1);
(same applies for the same code in the SBSA_GWDT_WRR write handling.)

> +        sbsa_gwdt_update_timer(s, EXPLICIT_REFRESH);
> +        break;
> +
> +    case SBSA_GWDT_WCV:
> +        s->wcvl = data;
> +        break;
> +
> +    case SBSA_GWDT_WCVU:
> +        s->wcvu = data;
> +        break;
> +
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR, "bad address in control frame write :"
> +                " 0x%x\n", (int)offset);
> +    }
> +    return;
> +}
> +
> +static void wdt_sbsa_gwdt_reset(DeviceState *dev)
> +{
> +    SBSA_GWDTState *s = SBSA_GWDT(dev);
> +
> +    timer_del(s->timer);
> +
> +    s->wcs &= ~SBSA_GWDT_WCS_EN;
> +    s->wcs &= ~SBSA_GWDT_WCS_WS0;
> +    s->wcs &= ~SBSA_GWDT_WCS_WS1;

Just saying s->wcs = 0; is clearer than clearing all
the bits one by one.

> +    s->wcvl = 0;
> +    s->wcvu = 0;
> +    s->worl = 0;
> +    s->woru = 0;
> +    s->id = SBSA_GWDT_ID;
> +}

thanks
-- PMM
