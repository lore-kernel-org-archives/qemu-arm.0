Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp1539361lfg;
        Sun, 22 Aug 2021 21:44:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxpK8h8zJWoWemK1nfHMsx/RI0g/KTW0cV7oAtlpotUNHNYB5fKXNWZbmYY8z88fROLw/32
X-Received: by 2002:a25:88a:: with SMTP id 132mr41764577ybi.102.1629693852824;
        Sun, 22 Aug 2021 21:44:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629693852; cv=none;
        d=google.com; s=arc-20160816;
        b=sqBrn9AcsRKKhQ/8FlaWywloVcsdYci9hZNiNnNihazMZBpjskyy7ClcK6ryPLKTVF
         6FNqr7/jIDqmFzkSuK8F9ObdZO3uvBT5WLdKExe0/PDio3xVwyInZmwwTM3iHwZR62vS
         D/h/HUM9iai0eY+F7jg4PP6AQjo1UF7bAwKlYuly6qldCg5jnoV3KXSwioLvm3ItNXt9
         VAAOvnkxkCAAYhBAHWFHo+SthRcwpqI6FMSZQrk1hqlkOVELmn3/h4sY3MQDRZ6Qsapg
         SauuRSOkHn4sSez6xs3bhLaB0e1M/F6nUSxi5xjvrV1/giAQYB6xKZ9y70qtKa/+7Dt9
         n9pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NPuJ/uF35VmE6fDNEBB9W2rLpsRWgAg7mNFYYheQErI=;
        b=Vlm+cLGG7t14dSyHpUgKxqRbsLA+Gu1A1ex9xraHhvjiY7PdFJokff+zAxbwuFKrNn
         o8UyFko8gXqB9MNiO4sfW/DVfz6BvjCqg/rVzjSSIYAxzAqr5urL3e61fWsgXI6w5ZPd
         PPO+Rb9YtMjM/eyUeQQOa7Q4Gc2PxtwaeCDRV+wS8dn8ZLXr0VVVpSsdTD1MgspFqXOP
         Lj+YIu86fUpLxi7KAdMADEYtisr2qY9L9w+sJyvJkKtWZHfMhSmbXJ61zrlrOoTcPSZJ
         0wgDGk0KOXIe3CLnvPw59GEAViL5ye9DcUZwlNcfny65sJTPyfDijMd0FpecwcaDdDe6
         1dGw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="XfyE/Jn6";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r5si13442656ybp.276.2021.08.22.21.44.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 22 Aug 2021 21:44:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="XfyE/Jn6";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:50430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mI1oi-0002N3-8N
	for alex.bennee@linaro.org; Mon, 23 Aug 2021 00:44:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mI1oR-0002LD-CJ; Mon, 23 Aug 2021 00:43:55 -0400
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b]:43976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mI1oP-0002ya-GE; Mon, 23 Aug 2021 00:43:54 -0400
Received: by mail-io1-xd2b.google.com with SMTP id n24so20239170ion.10;
 Sun, 22 Aug 2021 21:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NPuJ/uF35VmE6fDNEBB9W2rLpsRWgAg7mNFYYheQErI=;
 b=XfyE/Jn6R6ehSdAlkqZo/40cUYi3Vc0yuQRBzyPOPel/HFDJXGQHhPW/onZ2hYdscV
 R5mnbF4V1wCV7oNK5hrvBr1gYKu8REvwe2c1bAQFP8Q2OMbru5rIMyponHGeWrOf4M91
 vNIu1/suerzgkaNmEYVBSSA4a/QLOR+318OF+qY65jhozL/gq+o05Lh9jm7DAJurjAkk
 3kVxSNV2NwKmgax4bl+hHeIJa0aKhYWkk0BWckKMWJn/UMgxYxUJOHLemQi5YwFH1/UW
 C6O30TIMSo6Y14mE22OGaq8AgxcLqky/3BSmTSEQT1psJCfwIVMuUfAY+X3pAt8IdLsp
 y/4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NPuJ/uF35VmE6fDNEBB9W2rLpsRWgAg7mNFYYheQErI=;
 b=fCcZib3f4HlCTgEw7vbZZG4bgV36F39FMfRZheWVuZp/ahRE6ChsShD/PI89LScWb3
 fSYwZUBBNeWjxBatGnc4wRZMabEJ/6ou57pANfl5890PRqWH9KiYKXJnhC9WBBB2O5D0
 rw6vVfqy3JQqOXmU/Z/zIx6NWQbZABVKm7TbMGE+QzvUsbklpE1rQovN7eaZUj8v3gc8
 zNTabjyyN8oxVECfbJEt3jGd7TrEIUP906G12V5BzRScFVvyzxdxe6vk/cRKWGFCfD44
 tUp/WBVJyft2ltQE7cFBf8FZ4pBY2nkU0QhzMN3mav1wJRQEup+jVD+7gwXZT3Di1dQQ
 So2A==
X-Gm-Message-State: AOAM531Ejuo3gcbvIpcLoThZ7JPoP+O0WyUX9YhLZcQYSk6orA/g/48u
 CnoaH1j7B7ow9DaNu6ctlHoU7T68Ufp+j+a/qyg=
X-Received: by 2002:a05:6638:338a:: with SMTP id
 h10mr4551503jav.8.1629693831856; 
 Sun, 22 Aug 2021 21:43:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210823020813.25192-1-bmeng.cn@gmail.com>
 <20210823020813.25192-3-bmeng.cn@gmail.com>
In-Reply-To: <20210823020813.25192-3-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 23 Aug 2021 14:43:26 +1000
Message-ID: <CAKmqyKMzq-F=MYMA=_7MeLTodxY7Eo91Nta4nKuncvAZ=bQUOQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] hw/char: cadence_uart: Disable transmit when input
 clock is disabled
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2b.google.com
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
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LE8Q9zC+mlgC

On Mon, Aug 23, 2021 at 12:11 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> At present when input clock is disabled, any character transmitted
> to tx fifo can still show on the serial line, which is wrong.
>
> Fixes: b636db306e06 ("hw/char/cadence_uart: add clock support")
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> ---
>
>  hw/char/cadence_uart.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
> index b4b5e8a3ee..154be34992 100644
> --- a/hw/char/cadence_uart.c
> +++ b/hw/char/cadence_uart.c
> @@ -327,6 +327,11 @@ static gboolean cadence_uart_xmit(void *do_not_use, GIOCondition cond,
>  static void uart_write_tx_fifo(CadenceUARTState *s, const uint8_t *buf,
>                                 int size)
>  {
> +    /* ignore characters when unclocked or in reset */
> +    if (!clock_is_enabled(s->refclk) || device_is_in_reset(DEVICE(s))) {
> +        return;
> +    }

Should we log a guest error here?

Alistair

> +
>      if ((s->r[R_CR] & UART_CR_TX_DIS) || !(s->r[R_CR] & UART_CR_TX_EN)) {
>          return;
>      }
> --
> 2.25.1
>
>
