Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1092188lfb;
        Wed, 1 Sep 2021 19:52:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxTEer/YETMsHtkAsgTJtOxk56UtiO7zUMKPadEx1PNzjCXFrJCRgG54uVIhwxr5UvVXp/K
X-Received: by 2002:a05:6e02:1846:: with SMTP id b6mr695416ilv.264.1630551134873;
        Wed, 01 Sep 2021 19:52:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630551134; cv=none;
        d=google.com; s=arc-20160816;
        b=ZVoBrC/OE+rpO7u6DkwRTpVbR7adQvxcVpsH+7N4d36q+Kq3JdNXFJkYXye7TPPQWj
         UbKZK4VF2v+H9paFWGHKK7KGzeub5/hk8T5F62cezEVpmy+KAlUfuJtDfadcu8lAmXhe
         L66IeUx9/gMZK0bdKeeXzo09X/Cazd4iulNTKoG7NH0JiuWaETnB5Zlf9mBRV7NAjB8o
         OsKCQOCIsHBCB0c1/SixQZ9nH8DA9eEehfqRCjvdI5PKtpnfR4OmkvGXbecCXufIhI0e
         1vi3WFbdLiS81bRKjv44pl5jcZIkuxFQDL8OtYBMxEaGv54GERkSe1XL43+QwfgtmD51
         bXkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UpWKkr3qQ8+XGzlqYitu+URnCAbj5ZL7JeUzQ6s9FYc=;
        b=BzMsfsGvgyIC5fnAvAfomGQ7sq6dEgPPlR8kSoo/XFbQQRwjVphBbK0WHy4hkfWfMN
         ucqz3koBPDLcHDolJgJx7FKPhtfEPX/a7kG1BdQg1eah4uwN5Cn5+jGb6+NTJfOijrqq
         x/yz5U58GNuRFNU43boJ1pQxKKhHlLSqs+BIwqXwJQhhuoAq0g/P4GY5fH1DUk+Dn8nk
         b0r4qZ/a68DaUwQ3pw/oq4IiwAOwbSjBE8oOcdlGGLqrv9Ly+AvbYU32VXTK/E7M9CK6
         xReW9rxk1yNG/3K3I/0VvuaR22UqXhop7DN2tM6xqQAEkSseTJIK6ot533xVtKUGoVl1
         1T9g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=ImefpKm9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p14si777232ilo.31.2021.09.01.19.52.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Sep 2021 19:52:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=ImefpKm9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:35690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mLcpq-0001gq-7j
	for alex.bennee@linaro.org; Wed, 01 Sep 2021 22:52:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mLcpf-0001e4-2j; Wed, 01 Sep 2021 22:52:03 -0400
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b]:43746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mLcpd-0006qW-Ge; Wed, 01 Sep 2021 22:52:02 -0400
Received: by mail-il1-x12b.google.com with SMTP id v16so307761ilo.10;
 Wed, 01 Sep 2021 19:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UpWKkr3qQ8+XGzlqYitu+URnCAbj5ZL7JeUzQ6s9FYc=;
 b=ImefpKm9u9QBuiNOqSpxO9QK1z70yIT/A3YcCzwRkXylZpE5v6+BcxNm7eoMvwb80H
 xLsrdFt04h8E8Fy0RuBeaib3DiWXb4ZmzGIRmTdJ/76FyCbnbm4E9anVOxYjwJkCF3//
 YjXFjVgP4saw8uTuoVkG4dDM1wjGSNNNDI+cHzFfSvwbkY0EvHJYczOwIugTf8eHdwoz
 Dm+DTwKzsdGFBliaHVz+dvIh+3qUre+SS0xuLqqjCJo7Ej3XbZfXvKiWnFwTAEwWMgrq
 l1zjXcc71f5kT8vEAPnKCNunwjK96Zdfr03TYjGEN7hvvK3UpkyXoah2IovAZf5TPI5p
 +7iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UpWKkr3qQ8+XGzlqYitu+URnCAbj5ZL7JeUzQ6s9FYc=;
 b=EOQmsFsLGycSs8zyED8/8ABzjXK7YFQ9JKe+GA522p/5qOybLHS89k0faI3ra3tB15
 tlHtq+2caXQcBe3wXY2CVNEShbyICZNCgRnqD5BS0Ld6i2efO8GOEXhmN95aqal8vGKa
 JIadwjj1QFKgzscs2/mchvCupdmpvOX6hKBUDd6i6zAOooeiCRpSnot5dAypiWhc328v
 7P/Y3tweTmNhcJe2ckoph5AafF2Yk+QtSzLqXSusK5NKUSl8YgqE+5qi9YkrvFmHZbj5
 rOaAFJqmm9C2o9e72/jUIP+dYMvylGwPArLbMgYB35TucKgjcXSZK7XeqvmqUGnrYHVP
 NjEg==
X-Gm-Message-State: AOAM531LKAnIIJ2fpHPQ0SEvi6KtQ2relCAWMAArJjD1WCDXxQJmUXae
 hUjaLf2gPfGTIKcbqq1nBu/HhHzG8xZ4aXnU3UQK7azgkkihHJ8C
X-Received: by 2002:a92:d3cf:: with SMTP id c15mr640627ilh.131.1630551119947; 
 Wed, 01 Sep 2021 19:51:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210901124521.30599-1-bmeng.cn@gmail.com>
 <20210901124521.30599-6-bmeng.cn@gmail.com>
In-Reply-To: <20210901124521.30599-6-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 2 Sep 2021 12:51:34 +1000
Message-ID: <CAKmqyKOZ9eefqrAYe-Ndu=Ub=5sJOfmEFLuekWaM2WFB+frr9Q@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] hw/char: cadence_uart: Ignore access when
 unclocked or in reset for uart_{read, write}()
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12b;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12b.google.com
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
X-TUID: sgyy/tgAf0aM

On Wed, Sep 1, 2021 at 10:49 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Read or write to uart registers when unclocked or in reset should be
> ignored. Add the check there, and as a result of this, the check in
> uart_write_tx_fifo() is now unnecessary.
>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

>
> ---
>
> (no changes since v2)
>
> Changes in v2:
> - new patch: hw/char: cadence_uart: Ignore access when unclocked or in reset for uart_{read,write}()
>
>  hw/char/cadence_uart.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
>
> diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
> index 8bcf2b718a..5f5a4645ac 100644
> --- a/hw/char/cadence_uart.c
> +++ b/hw/char/cadence_uart.c
> @@ -335,11 +335,6 @@ static gboolean cadence_uart_xmit(void *do_not_use, GIOCondition cond,
>  static void uart_write_tx_fifo(CadenceUARTState *s, const uint8_t *buf,
>                                 int size)
>  {
> -    /* ignore characters when unclocked or in reset */
> -    if (!clock_is_enabled(s->refclk) || device_is_in_reset(DEVICE(s))) {
> -        return;
> -    }
> -
>      if ((s->r[R_CR] & UART_CR_TX_DIS) || !(s->r[R_CR] & UART_CR_TX_EN)) {
>          return;
>      }
> @@ -416,6 +411,11 @@ static MemTxResult uart_write(void *opaque, hwaddr offset,
>  {
>      CadenceUARTState *s = opaque;
>
> +    /* ignore access when unclocked or in reset */
> +    if (!clock_is_enabled(s->refclk) || device_is_in_reset(DEVICE(s))) {
> +        return MEMTX_ERROR;
> +    }
> +
>      DB_PRINT(" offset:%x data:%08x\n", (unsigned)offset, (unsigned)value);
>      offset >>= 2;
>      if (offset >= CADENCE_UART_R_MAX) {
> @@ -476,6 +476,11 @@ static MemTxResult uart_read(void *opaque, hwaddr offset,
>      CadenceUARTState *s = opaque;
>      uint32_t c = 0;
>
> +    /* ignore access when unclocked or in reset */
> +    if (!clock_is_enabled(s->refclk) || device_is_in_reset(DEVICE(s))) {
> +        return MEMTX_ERROR;
> +    }
> +
>      offset >>= 2;
>      if (offset >= CADENCE_UART_R_MAX) {
>          return MEMTX_DECODE_ERROR;
> --
> 2.25.1
>
>
