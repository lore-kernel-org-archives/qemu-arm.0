Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp1755835lfm;
        Thu, 23 Apr 2020 04:06:06 -0700 (PDT)
X-Google-Smtp-Source: APiQypKPDBmuDHXGnSqCR96fnbtDI4wJEBOog4Ka+J5x9pJHHKBG0o5BzEk7+dmHhpzvgbZKmL15
X-Received: by 2002:ac8:66c6:: with SMTP id m6mr3440590qtp.25.1587639966567;
        Thu, 23 Apr 2020 04:06:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587639966; cv=none;
        d=google.com; s=arc-20160816;
        b=Yt8n6dLw9JCOK0mWraSqNVo7TJhWGn3DQFgUOED9vm/p1JRzZ+W1fefpdh5sQp5bSo
         tzk0m+ZA9VG+avWfbIDwYRB6J/ZcJerUVbHK2FyThAZ2LzLu/JZAAniCWHfLcg/yiw+N
         7kcZGBJnQke97CcOj68qLzNUqLbV0vbys/Gcf+Rs687tMoG6ogmbmbH+VoCWZiB3ph4N
         fYBuK1LBQ0u7OP5F/INLANp56qU8RZBYP3u+EAm4ctlkQ49siNCQ4ZnaZGSrA28phmTr
         4XTh6Ki5CiZNnptEi643TDVBfP278k8ji2MMKjLqTjL96eG8ohl1zuc9lq1d+N4H+yVp
         YxlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EE+V4lph8j5aosFBB+StB7HloVKwTivpUyCdP1a6Nbo=;
        b=JVCZuvh/HjDbVrUIgEQuQxw4XyHpY7VtHDKRqd38Zcq++kCM0yj6aS5PER7ugorO7q
         9o5LEoa2X4VAAABk5pU257xvZGqkRuLBKF5eNupZ0B4xjGW6CbtOUNZWG0h2jiz347k1
         cOt8eA5NkbD9FCmIu9nI4AUX9nDF3PKPNxdSPO/sLqH5Iw/QHTjnb6Kv8ecJdx4xCfu4
         mDm339w1PUZsyZ/qxNkJolIjl5xZuyfNIZ7JCU61/oGdqVlqhGkFh5DERqFe5IiN4AKt
         T7z/s19fzcZvsJKOivZMGMlDLHf9CO1O5xMCYfNQm0gcFOfEdsfzjtMHMsoCjqdRFEW5
         VIZg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DoooT5n1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i11si1079948qtp.168.2020.04.23.04.06.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Apr 2020 04:06:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DoooT5n1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jRZgD-0004dS-Uh
	for alex.bennee@linaro.org; Thu, 23 Apr 2020 07:06:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39548)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jRZg6-0004cq-Eb
 for qemu-arm@nongnu.org; Thu, 23 Apr 2020 07:05:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jRZg5-0005cC-6U
 for qemu-arm@nongnu.org; Thu, 23 Apr 2020 07:05:58 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:34954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jRZg4-0005az-Ma
 for qemu-arm@nongnu.org; Thu, 23 Apr 2020 07:05:56 -0400
Received: by mail-ot1-x343.google.com with SMTP id e26so5331693otr.2
 for <qemu-arm@nongnu.org>; Thu, 23 Apr 2020 04:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EE+V4lph8j5aosFBB+StB7HloVKwTivpUyCdP1a6Nbo=;
 b=DoooT5n11EQDRhYw1GfbwXAP2Tv6+yZ1jNMyWnN7QbTog9UWYjz5y1MAZ/p83KSRY8
 oOmISdt2EBKZw1WKHLA9jQl0Ibo70UIDC7hoxLpiZRgCwvMv1wmOjptDQWekijQtbIJa
 7I3/Se+V3Ra1ow8QRpXQhf2CIjVknSNzT7lmajHHxiPrA0l5ipeNVwaxthJFSStex6qu
 Bfwo31Wwp9pkphRB0PVqjEJ6Is+1rsKfxLSBQj8qGCBPo5l1hG8wiOHqDFkh2zoCFu0j
 j1Slxgyy1FzZ8J774yU3F2oJY1xkd+pX9T12ecKUCyzyMzWiBk8VbZjssNDEZVCaBpHR
 WHRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EE+V4lph8j5aosFBB+StB7HloVKwTivpUyCdP1a6Nbo=;
 b=eS7WKTMpanOoZLw22+LEM7Logk2BH80LiCmXOCUGZk3mToyZmclv95naIY6Z3qSrKZ
 0ImQR7Go9+f+Goir15nDvV6K/bFhrUYnrCHeHkoDnzYiTYU8K4w99CW+UFGmXufYVAHe
 5lIMoIs+tszHGkQw3CPP5PJxKy4BF6ubqO2rXwLSA2VJ+EKhmpgMFCyHWFHqofEwq7vj
 Uaaq+dS9IPrd9Hg4qqsoKeyJ8m6TdSwUP3IsNvGvBajyf46qJqtuLizu0e9l/gZoH6rR
 teADF6u0sQr6VoiWgbgTIwgZmm69G95VWfut2fy6JRgusutj51mmdwlJJRlmrqCl+VF3
 nB6g==
X-Gm-Message-State: AGi0Pub4q5tdIlzFJuQY2VRi4Mq8sOWtHhITeNeJ5Iq+gtsizXJqWczE
 qwArFyMPS/Y91lFvKieetn2lwJRSRYB+ykijqsq06w==
X-Received: by 2002:a9d:2c08:: with SMTP id f8mr2980768otb.135.1587639954975; 
 Thu, 23 Apr 2020 04:05:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200311040923.29115-1-gshan@redhat.com>
In-Reply-To: <20200311040923.29115-1-gshan@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Apr 2020 12:05:42 +0100
Message-ID: <CAFEAcA8jukGvWA1J8k4VvDT=pbeK2X7_GJOKX6Wy0gEy3K_+bA@mail.gmail.com>
Subject: Re: [PATCH v3] hw/char/pl011: Enable TxFIFO and async transmission
To: Gavin Shan <gshan@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::343;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9jrxuZZfQCVj

On Wed, 11 Mar 2020 at 04:09, Gavin Shan <gshan@redhat.com> wrote:
>
> The depth of TxFIFO can be 1 or 16 depending on LCR[4]. The TxFIFO is
> disabled when its depth is 1. It's nice to have TxFIFO enabled if
> possible because more characters can be piled and transmitted at once,
> which would have less overhead. Besides, we can be blocked because of
> qemu_chr_fe_write_all(), which isn't nice.
>
> This enables TxFIFO if possible. On ther other hand, the asynchronous
> transmission is enabled if needed, as we did in hw/char/cadence_uart.c
>
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
> v3: Use PL011() to do data type conversion
>     Return G_SOURCE_REMOVE when the backend is disconnected in pl011_xmit()
>     Drop parenthesis in the condition validating @size in pl011_write_fifo()
> ---
>  hw/char/pl011.c         | 105 +++++++++++++++++++++++++++++++++++++---
>  include/hw/char/pl011.h |   3 ++
>  2 files changed, 102 insertions(+), 6 deletions(-)

Thanks for this patch. I have some comments on some bits of the
code below.

> diff --git a/hw/char/pl011.c b/hw/char/pl011.c
> index 13e784f9d9..dccb8c42b0 100644
> --- a/hw/char/pl011.c
> +++ b/hw/char/pl011.c
> @@ -169,6 +169,73 @@ static void pl011_set_read_trigger(PL011State *s)
>          s->read_trigger = 1;
>  }
>
> +static gboolean pl011_xmit(GIOChannel *chan, GIOCondition cond, void *opaque)
> +{
> +    PL011State *s = PL011(opaque);
> +    int ret;
> +
> +    /* Drain FIFO if there is no backend */
> +    if (!qemu_chr_fe_backend_connected(&s->chr)) {
> +        s->write_count = 0;
> +        s->flags &= ~PL011_FLAG_TXFF;
> +        s->flags |= PL011_FLAG_TXFE;
> +        return G_SOURCE_REMOVE;
> +    }

This "handle no backend" code isn't necessary. There was a
period of time when it was, because some of the qemu_chr_fe_*
functions did the wrong thing if called on a CharBackend with
a NULL Chardev, which is why some code in the tree checks it,
but we fixed that. If there's no backend then both
qemu_chr_fe_write() and qemu_chr_fe_add_watch() will return 0
without doing anything, which will make us drain the FIFO
via the "!s->watch_tag" code path below.

> +
> +    /* Nothing to do */
> +    if (!s->write_count) {
> +        return FALSE;
> +    }
> +
> +    ret = qemu_chr_fe_write(&s->chr, s->write_fifo, s->write_count);
> +    if (ret > 0) {
> +        s->write_count -= ret;
> +        memmove(s->write_fifo, s->write_fifo + ret, s->write_count);
> +        s->flags &= ~PL011_FLAG_TXFF;
> +        if (!s->write_count) {
> +            s->flags |= PL011_FLAG_TXFE;
> +        }
> +    }
> +
> +    if (s->write_count) {
> +        s->watch_tag = qemu_chr_fe_add_watch(&s->chr, G_IO_OUT | G_IO_HUP,
> +                                             pl011_xmit, s);
> +        if (!s->watch_tag) {
> +            s->write_count = 0;
> +            s->flags &= ~PL011_FLAG_TXFF;
> +            s->flags |= PL011_FLAG_TXFE;
> +            return FALSE;
> +        }
> +    }
> +
> +    s->int_level |= PL011_INT_TX;

Handling of INT_TX is more complicated when the FIFO is
enabled: the UARTIFLS.TXIFLSEL bits define at what point
we should raise the TX interrupt as the FIFO drains
(eg you can make it interrupt as the FIFO passes through
the "half full" point, or when it gets <= 1/8th full, etc).
Watch out that the definition is that the interrupt is raised
as the FIFO fill level progresses through the trigger
level, which is not the same as "is the FIFO fill level
less than or equal to the trigger level now?".

> +    pl011_update(s);
> +    return FALSE;
> +}
> +
> +static void pl011_write_fifo(void *opaque, const unsigned char *buf, int size)
> +{
> +    PL011State *s = PL011(opaque);
> +    int depth = (s->lcr & 0x10) ? 16 : 1;
> +
> +    if (size >= depth - s->write_count) {
> +        size = depth - s->write_count;
> +    }
> +
> +    if (size > 0) {
> +        memcpy(s->write_fifo + s->write_count, buf, size);
> +        s->write_count += size;
> +        if (s->write_count >= depth) {
> +            s->flags |= PL011_FLAG_TXFF;
> +        }
> +        s->flags &= ~PL011_FLAG_TXFE;
> +    }
> +
> +    if (!s->watch_tag) {
> +        pl011_xmit(NULL, G_IO_OUT, s);
> +    }
> +}

It looks like we only ever call pl011_write_fifo() with
a size of 1 -- should we just make it directly take
a single 'uint8_t ch' to write to the FIFO? It would
simplify some of this code I think.

The UARTFR.BUSY bit should be set to 1 as soon as the UART
gets data into the tx FIFO and then cleared only when the
data has all been transmitted. We didn't need to worry about
that when we blocked until the data was sent (the guest could
not execute at a point where it would see BUSY=1), but now
we model the tx FIFO we need to update the BUSY bit (both
in this function to set it and then in anywhere that
empties the FIFO to clear it).

> +
>  static void pl011_write(void *opaque, hwaddr offset,
>                          uint64_t value, unsigned size)
>  {
> @@ -179,13 +246,8 @@ static void pl011_write(void *opaque, hwaddr offset,
>
>      switch (offset >> 2) {
>      case 0: /* UARTDR */
> -        /* ??? Check if transmitter is enabled.  */

This ??? comment is about the fact that we don't check
UARTCR.TXE (the transmit enable bit). Your patch doesn't
add support for that (which is fine, it's entirely separate
from the FIFO stuff), so it shouldn't delete the comment.

>          ch = value;
> -        /* XXX this blocks entire thread. Rewrite to use
> -         * qemu_chr_fe_write and background I/O callbacks */
> -        qemu_chr_fe_write_all(&s->chr, &ch, 1);
> -        s->int_level |= PL011_INT_TX;
> -        pl011_update(s);
> +        pl011_write_fifo(opaque, &ch, 1);
>          break;
>      case 1: /* UARTRSR/UARTECR */
>          s->rsr = 0;
> @@ -207,7 +269,16 @@ static void pl011_write(void *opaque, hwaddr offset,
>          if ((s->lcr ^ value) & 0x10) {
>              s->read_count = 0;
>              s->read_pos = 0;
> +
> +            if (s->watch_tag) {
> +                g_source_remove(s->watch_tag);
> +                s->watch_tag = 0;
> +            }
> +            s->write_count = 0;
> +            s->flags &= ~PL011_FLAG_TXFF;
> +            s->flags |= PL011_FLAG_TXFE;
>          }
> +
>          s->lcr = value;
>          pl011_set_read_trigger(s);
>          break;
> @@ -292,6 +363,24 @@ static const MemoryRegionOps pl011_ops = {
>      .endianness = DEVICE_NATIVE_ENDIAN,
>  };

thanks
-- PMM
