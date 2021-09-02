Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1083368lfb;
        Wed, 1 Sep 2021 19:33:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw5HwOBK4Ys18+f8mZkjFVoCnPj8i6pcaWuZf8LLJiud2gsrlsMcq3UboR3tcHewvL1C9Gy
X-Received: by 2002:a5d:9409:: with SMTP id v9mr845672ion.170.1630549996686;
        Wed, 01 Sep 2021 19:33:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630549996; cv=none;
        d=google.com; s=arc-20160816;
        b=0OJde+M5j/JwFB3c5Yl0XU9qZxBHMbKsKERutHEv7EfcR+hmpjCIw4tbCHTvx/Nin5
         ccu6VhKMTxcCR3UqgvEEtDlGlW/sGc1ulOmyEAestdvSfTzr9+FO6Jy3rYi4kwTe4bhZ
         HF+zfY2fWxa5hjUoKpGx+8pwcMz6VXESDX8K8KJUSAUpRm0S+v2pH4O36C44L610+MBI
         sA/ROOhtldOiJJHt3U3hDgZVYwiSQn83Fhv3NPozYI9TAAn7x7bkMsvbtnDds4nec6oc
         DLSWJYAOH/F2J6jRbktapNzvM0SDWhgknSlpNnNzWBGH42ogWNIEk68iy0nAnDUAKb2g
         p8HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YjuKy3HbY3EHtLLd6vGP28y0Qj6j8DN92zTt9E/Wjyc=;
        b=e+4ogaL7vdV1ooM2Jaj0HQcRQ+qtX4UvYiFp0Jfz+vl/6oRGldNkhlCTqCkTQ3mLnp
         gUXeYIIBVdck/G7ku3dPtQ16zq/XuQW2YV7RfzFsgUqr3491xzEA2Ib3GEGr2iJui1Xv
         vgcW6kF0S5L/Iz6QLThRtliamnebuQWeGt6LU/GokJ/9UmPdyL6Jhg/77qrVQGcQOp7P
         NBp9nszxV81SfkJ+9HesxpJv/CPR0ef9RsTFUv61qCJvBLzx58e9THKsr7haVNNreNk2
         4JBighDtQz+0145JPQE/+B99qpeY+5TcBB6hAfMkHPHk4CHbQDYY22xf7qQ7bXD8z5w+
         EYWg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=lE6K2GNn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r17si473746iov.104.2021.09.01.19.33.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Sep 2021 19:33:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=lE6K2GNn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:50920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mLcXT-0000To-WD
	for alex.bennee@linaro.org; Wed, 01 Sep 2021 22:33:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mLcX0-0000SX-99; Wed, 01 Sep 2021 22:32:46 -0400
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131]:36578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mLcWy-0000RD-R0; Wed, 01 Sep 2021 22:32:46 -0400
Received: by mail-il1-x131.google.com with SMTP id x5so294772ill.3;
 Wed, 01 Sep 2021 19:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YjuKy3HbY3EHtLLd6vGP28y0Qj6j8DN92zTt9E/Wjyc=;
 b=lE6K2GNnjIrHy7V8AaNuuzgl0WKxMBT8Tkf74niVi3Ua3rYVR0Pc0okMk4PG95w2jR
 IZsSr5Eaq6C4MZj4TuV7d10ZMXEFAUQxTf2piK/D05Mteb20eGNrkDuivfZNOnFpIwao
 6erDbDeFdCK4LvH+EDfGIfCj1Jm848rjeYNDsKqshP3wkdHMe07H9kaPoio+aG2AwFe+
 iPBoYoVnxqBEiTR4U0QasvC4lRiC+4zh43+wCTfm1AH4fkRT5klwu2KGsiu434r3AlgU
 LFhwWU/OyknIO41Y3+XGCM2oY9ZL9fAouLLerBvXuSHcQwlGVtwF8yZYMWgfihvslUmx
 lGJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YjuKy3HbY3EHtLLd6vGP28y0Qj6j8DN92zTt9E/Wjyc=;
 b=fvlBXEFggl+1DrExo8YcLaPEvT4cu0Mx+aRNHMXTJcM+HgRUbMk+86sEAWAntdSkK7
 OYmdTyqCt9g/lYtwfVYlb03qvJIer5dXxT+VXadjDIThgVKp7FRLpORFxcayOvyJYNKx
 7EOpu1YEVye6s0GlZMZsGo21RP2B/hZ79sj9mtHP3cdFhN3d9UoFQmkz+9dZs9fLAu4r
 MgM9WRXGQ0/Bs1xzbXZiUM+h3r8gHjDkcrnxPxHp11ILP9MiOpva9U9twTdAMsS1UQcg
 iaBorFS3tOH3Tok+O+LvPE5RPiSTMI6hcVuZBuEya8oPbcNuptkaC3HDuQ0xYE9+PiJe
 v36A==
X-Gm-Message-State: AOAM533M5GGZNahM+Vr8OLzfUX+5Ga+Q6WtPM+UPE+aOojUMYn5OU0d0
 vfYOK82ciVnR99wZHDmoYuHEgPBaVqT/uwV0IJ4=
X-Received: by 2002:a05:6e02:1044:: with SMTP id
 p4mr582453ilj.227.1630549963152; 
 Wed, 01 Sep 2021 19:32:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210901032724.23256-1-bmeng.cn@gmail.com>
 <20210901032724.23256-5-bmeng.cn@gmail.com>
In-Reply-To: <20210901032724.23256-5-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 2 Sep 2021 12:32:17 +1000
Message-ID: <CAKmqyKON_E3Pgds3B8UV6_E-ZvVRNE=UYCdkEmX2Rw1a=zc-3A@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] hw/char: cadence_uart: Convert to
 memop_with_attrs() ops
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::131;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x131.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sx4EjzxB8jeZ

On Wed, Sep 1, 2021 at 1:30 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> This converts uart_read() and uart_write() to memop_with_attrs() ops.
>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

>
> ---
>
> Changes in v2:
> - new patch: hw/char: cadence_uart: Convert to memop_with_attrs() ops
>
>  hw/char/cadence_uart.c | 26 +++++++++++++++-----------
>  1 file changed, 15 insertions(+), 11 deletions(-)
>
> diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
> index fff8be3619..8bcf2b718a 100644
> --- a/hw/char/cadence_uart.c
> +++ b/hw/char/cadence_uart.c
> @@ -411,15 +411,15 @@ static void uart_read_rx_fifo(CadenceUARTState *s, uint32_t *c)
>      uart_update_status(s);
>  }
>
> -static void uart_write(void *opaque, hwaddr offset,
> -                          uint64_t value, unsigned size)
> +static MemTxResult uart_write(void *opaque, hwaddr offset,
> +                              uint64_t value, unsigned size, MemTxAttrs attrs)
>  {
>      CadenceUARTState *s = opaque;
>
>      DB_PRINT(" offset:%x data:%08x\n", (unsigned)offset, (unsigned)value);
>      offset >>= 2;
>      if (offset >= CADENCE_UART_R_MAX) {
> -        return;
> +        return MEMTX_DECODE_ERROR;
>      }
>      switch (offset) {
>      case R_IER: /* ier (wts imr) */
> @@ -466,30 +466,34 @@ static void uart_write(void *opaque, hwaddr offset,
>          break;
>      }
>      uart_update_status(s);
> +
> +    return MEMTX_OK;
>  }
>
> -static uint64_t uart_read(void *opaque, hwaddr offset,
> -        unsigned size)
> +static MemTxResult uart_read(void *opaque, hwaddr offset,
> +                             uint64_t *value, unsigned size, MemTxAttrs attrs)
>  {
>      CadenceUARTState *s = opaque;
>      uint32_t c = 0;
>
>      offset >>= 2;
>      if (offset >= CADENCE_UART_R_MAX) {
> -        c = 0;
> -    } else if (offset == R_TX_RX) {
> +        return MEMTX_DECODE_ERROR;
> +    }
> +    if (offset == R_TX_RX) {
>          uart_read_rx_fifo(s, &c);
>      } else {
> -       c = s->r[offset];
> +        c = s->r[offset];
>      }
>
>      DB_PRINT(" offset:%x data:%08x\n", (unsigned)(offset << 2), (unsigned)c);
> -    return c;
> +    *value = c;
> +    return MEMTX_OK;
>  }
>
>  static const MemoryRegionOps uart_ops = {
> -    .read = uart_read,
> -    .write = uart_write,
> +    .read_with_attrs = uart_read,
> +    .write_with_attrs = uart_write,
>      .endianness = DEVICE_NATIVE_ENDIAN,
>  };
>
> --
> 2.25.1
>
>
