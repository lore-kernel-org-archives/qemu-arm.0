Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp4283928lfp;
        Mon, 3 Feb 2020 10:52:13 -0800 (PST)
X-Google-Smtp-Source: APXvYqyOA2bPUXGL7BR5u3d/4rnkYrTqc37/vs5b/Zkwb9fekWUCVHPx5KE+Frwn9Dw7TIY3AyE/
X-Received: by 2002:a37:2e43:: with SMTP id u64mr23128123qkh.387.1580755933700;
        Mon, 03 Feb 2020 10:52:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580755933; cv=none;
        d=google.com; s=arc-20160816;
        b=qlQBulPXuv9NJMpnntp3DamLKEx7OTm8s15yDi0+VVq/Wq27Ac7sGucpZ4y73f/Y1G
         Bx0N8WNOh63eGl3kL2mQQZUCNuy7xl/WZJoxMYP69u8X00lMW33n/Ptby6ox07Lt1S8k
         h19hReKHxYrFXFRhevAB+ZxSiU+iq6u7VfAWAMTgvIVJe7g/eoHPfVLgVWKRLXXn5xXJ
         guwbftrR0+acA0jtZWLQYicoPS1pTHxxrx3tEcTXfjOoQX4nS5GpRAGzLAZW6gH8iogB
         xqCfXQ4kD3vFcedAX7u1z/1kQRnT1/14P3uMILIn9WTT994JW+o0ujZIP5oqdoOaUw9T
         +DNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SUcU9btibkd+i8XNvj4Am1wBntVho8Kwy0UhBE+Q19I=;
        b=JklBk3QM8OxGHh9R5qzZCFOewKH0WWicXYoiIyNiqKIn+I6ls4RXYHAhslCVrlllUY
         FhvlI6zceOngqoP9LLkZoxK5rPBbOo3antpjaPgATPT5UrdWPuvrfyHoxCW+0Ww1peTO
         W6zb3x9EWboqC7X/bKu8Oloi4yQ8ez6Y2I6DXJ+DwhAsig1kU19VF9eIJCsWeMitbw+c
         HYy2QqRU5P5fzk7KExbcID4356MfZyHn0R0+blrg4nYBC0EzDkopZ4wAWiW5XNp8/4qL
         hyNahwHoe7/O6e3mW2u5V9kINzvKPeXX+igTGU0EPE9eMPPk9R4RJNDxEbJGIDL1SyrP
         zvOw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=eBnrKkkq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p1si1905551qkk.158.2020.02.03.10.52.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Feb 2020 10:52:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=eBnrKkkq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:46058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iygpR-0002ME-5Q
	for alex.bennee@linaro.org; Mon, 03 Feb 2020 13:52:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40866)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1iygpI-0002In-Mh
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 13:52:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1iygpH-0002vI-99
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 13:52:04 -0500
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241]:45085)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1iygpA-0002cn-Q5; Mon, 03 Feb 2020 13:51:57 -0500
Received: by mail-lj1-x241.google.com with SMTP id f25so15761940ljg.12;
 Mon, 03 Feb 2020 10:51:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SUcU9btibkd+i8XNvj4Am1wBntVho8Kwy0UhBE+Q19I=;
 b=eBnrKkkqBRPXUwG0WsIxFpMn2B8MNCqQ1ov0+kG5zOqhRj46WfAXDLOI9MItjunl9G
 qjfvrYEPZCDjW1UEtjWfBzLYbWDFJrYNZlzYRcW0oTYeGRXxlJL9s0+EL8n2yYZ4iAmq
 oq6ccHwM6+XHg+uWM+BGAijdafhMW1YfIRBCsexQztyx5wkR8GL4uUydlEgG6cJ4yh5K
 3FDHoFsK0XeKhht4aAg8G7Ch89dwM3KtJ8tKigNWrIBVIbktujz7uYxQ+PigtDYAG6mV
 068EYrIjUYXD1ezc/TSGjy7TWydPfDnCjpkP9AC+jyn5d9pKyBaA7O2hOgefzrynbsuA
 mZLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SUcU9btibkd+i8XNvj4Am1wBntVho8Kwy0UhBE+Q19I=;
 b=e42j1gnzO8hb/2P2aneoWja9gL7n6heRorJcaT2+A//NFQ9ErNg6AJvOmKxIv72Tht
 Hh5STpIM/rmIczXj8Lu5gZ5Hac2a6YnCFSoYgP3/lneqlvka4rwghsZUXCS9PrCxJ60o
 6zhowThx6JwMh18h7vIHLhyKxLkxMXEoO8Vefick4ebhDpXxDSKeq+OsVOXqZGat2hMR
 aCp5n4aYu2v9TISwB6+wTxjJHohQcyREkN9l9j77Hzole6Di5lFWglK9LY6qtXb6n4WG
 nGmIOcSMNPvJOHnEXguWDM0Wvzvr0k5drkSD7czqo0eqObBelCyLmKMJXEysROK4Rv1I
 ndIg==
X-Gm-Message-State: APjAAAUzxg0PVX+xudYMGhtgHNfDrOUjNbig0cpayPecE09JazdPkv1H
 SB/BCnevru9rVVMEHtuQeH9cOPQ83WQAfvLv++E=
X-Received: by 2002:a2e:b4ac:: with SMTP id q12mr14097901ljm.285.1580755914921; 
 Mon, 03 Feb 2020 10:51:54 -0800 (PST)
MIME-Version: 1.0
References: <20200203180904.2727-1-linux@roeck-us.net>
In-Reply-To: <20200203180904.2727-1-linux@roeck-us.net>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 3 Feb 2020 10:44:47 -0800
Message-ID: <CAKmqyKN2esLw=GZq3sLJV=4x7UnvNMbeSuBreyrJ=uKL8X5A_w@mail.gmail.com>
Subject: Re: [PATCH 1/3] m25p80: Convert to support tracing
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::241
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Qemu-block <qemu-block@nongnu.org>, Andrew Jeffery <andrew@aj.id.au>,
 Alistair Francis <alistair@alistair23.me>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: T4cQ9k7tS8Eo

On Mon, Feb 3, 2020 at 10:10 AM Guenter Roeck <linux@roeck-us.net> wrote:
>
> While at it, add some trace messages to help debug problems
> seen when running the latest Linux kernel.
>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/block/m25p80.c     | 48 ++++++++++++++++++++-----------------------
>  hw/block/trace-events | 16 +++++++++++++++
>  2 files changed, 38 insertions(+), 26 deletions(-)
>
> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> index 11ff5b9ad7..63e050d7d3 100644
> --- a/hw/block/m25p80.c
> +++ b/hw/block/m25p80.c
> @@ -32,17 +32,7 @@
>  #include "qemu/module.h"
>  #include "qemu/error-report.h"
>  #include "qapi/error.h"
> -
> -#ifndef M25P80_ERR_DEBUG
> -#define M25P80_ERR_DEBUG 0
> -#endif
> -
> -#define DB_PRINT_L(level, ...) do { \
> -    if (M25P80_ERR_DEBUG > (level)) { \
> -        fprintf(stderr,  ": %s: ", __func__); \
> -        fprintf(stderr, ## __VA_ARGS__); \
> -    } \
> -} while (0)
> +#include "trace.h"
>
>  /* Fields for FlashPartInfo->flags */
>
> @@ -574,7 +564,8 @@ static void flash_erase(Flash *s, int offset, FlashCMD cmd)
>          abort();
>      }
>
> -    DB_PRINT_L(0, "offset = %#x, len = %d\n", offset, len);
> +    trace_m25p80_flash_erase(offset, len);
> +
>      if ((s->pi->flags & capa_to_assert) != capa_to_assert) {
>          qemu_log_mask(LOG_GUEST_ERROR, "M25P80: %d erase size not supported by"
>                        " device\n", len);
> @@ -607,8 +598,7 @@ void flash_write8(Flash *s, uint32_t addr, uint8_t data)
>      }
>
>      if ((prev ^ data) & data) {
> -        DB_PRINT_L(1, "programming zero to one! addr=%" PRIx32 "  %" PRIx8
> -                   " -> %" PRIx8 "\n", addr, prev, data);
> +        trace_m25p80_programming_zero_to_one(addr, prev, data);
>      }
>
>      if (s->pi->flags & EEPROM) {
> @@ -662,6 +652,9 @@ static void complete_collecting_data(Flash *s)
>
>      s->state = STATE_IDLE;
>
> +    trace_m25p80_complete_collecting(s->cmd_in_progress, n, s->ear,
> +                                     s->cur_addr);
> +
>      switch (s->cmd_in_progress) {
>      case DPP:
>      case QPP:
> @@ -825,7 +818,7 @@ static void reset_memory(Flash *s)
>          break;
>      }
>
> -    DB_PRINT_L(0, "Reset done.\n");
> +    trace_m25p80_reset_done();
>  }
>
>  static void decode_fast_read_cmd(Flash *s)
> @@ -941,9 +934,10 @@ static void decode_qio_read_cmd(Flash *s)
>
>  static void decode_new_cmd(Flash *s, uint32_t value)
>  {
> -    s->cmd_in_progress = value;
>      int i;
> -    DB_PRINT_L(0, "decoded new command:%x\n", value);
> +
> +    s->cmd_in_progress = value;
> +    trace_m25p80_command_decoded(value);
>
>      if (value != RESET_MEMORY) {
>          s->reset_enable = false;
> @@ -1042,7 +1036,7 @@ static void decode_new_cmd(Flash *s, uint32_t value)
>          break;
>
>      case JEDEC_READ:
> -        DB_PRINT_L(0, "populated jedec code\n");
> +        trace_m25p80_populated_jedec();
>          for (i = 0; i < s->pi->id_len; i++) {
>              s->data[i] = s->pi->id[i];
>          }
> @@ -1063,7 +1057,7 @@ static void decode_new_cmd(Flash *s, uint32_t value)
>      case BULK_ERASE_60:
>      case BULK_ERASE:
>          if (s->write_enable) {
> -            DB_PRINT_L(0, "chip erase\n");
> +            trace_m25p80_chip_erase();
>              flash_erase(s, 0, BULK_ERASE);
>          } else {
>              qemu_log_mask(LOG_GUEST_ERROR, "M25P80: chip erase with write "
> @@ -1184,7 +1178,7 @@ static int m25p80_cs(SSISlave *ss, bool select)
>          s->data_read_loop = false;
>      }
>
> -    DB_PRINT_L(0, "%sselect\n", select ? "de" : "");
> +    trace_m25p80_select(select ? "de" : "");
>
>      return 0;
>  }
> @@ -1194,19 +1188,20 @@ static uint32_t m25p80_transfer8(SSISlave *ss, uint32_t tx)
>      Flash *s = M25P80(ss);
>      uint32_t r = 0;
>
> +    trace_m25p80_transfer(s->state, s->len, s->needed_bytes, s->pos,
> +                          s->cur_addr, (uint8_t)tx);
> +
>      switch (s->state) {
>
>      case STATE_PAGE_PROGRAM:
> -        DB_PRINT_L(1, "page program cur_addr=%#" PRIx32 " data=%" PRIx8 "\n",
> -                   s->cur_addr, (uint8_t)tx);
> +        trace_m25p80_page_program(s->cur_addr, (uint8_t)tx);
>          flash_write8(s, s->cur_addr, (uint8_t)tx);
>          s->cur_addr = (s->cur_addr + 1) & (s->size - 1);
>          break;
>
>      case STATE_READ:
>          r = s->storage[s->cur_addr];
> -        DB_PRINT_L(1, "READ 0x%" PRIx32 "=%" PRIx8 "\n", s->cur_addr,
> -                   (uint8_t)r);
> +        trace_m25p80_read_byte(s->cur_addr, (uint8_t)r);
>          s->cur_addr = (s->cur_addr + 1) & (s->size - 1);
>          break;
>
> @@ -1244,6 +1239,7 @@ static uint32_t m25p80_transfer8(SSISlave *ss, uint32_t tx)
>          }
>
>          r = s->data[s->pos];
> +        trace_m25p80_read_data(s->pos, (uint8_t)r);
>          s->pos++;
>          if (s->pos == s->len) {
>              s->pos = 0;
> @@ -1281,7 +1277,7 @@ static void m25p80_realize(SSISlave *ss, Error **errp)
>              return;
>          }
>
> -        DB_PRINT_L(0, "Binding to IF_MTD drive\n");
> +        trace_m25p80_binding();
>          s->storage = blk_blockalign(s->blk, s->size);
>
>          if (blk_pread(s->blk, 0, s->storage, s->size) != s->size) {
> @@ -1289,7 +1285,7 @@ static void m25p80_realize(SSISlave *ss, Error **errp)
>              return;
>          }
>      } else {
> -        DB_PRINT_L(0, "No BDRV - binding to RAM\n");
> +        trace_m25p80_binding_no_bdrv();
>          s->storage = blk_blockalign(NULL, s->size);
>          memset(s->storage, 0xFF, s->size);
>      }
> diff --git a/hw/block/trace-events b/hw/block/trace-events
> index c03e80c2c9..d052f7578c 100644
> --- a/hw/block/trace-events
> +++ b/hw/block/trace-events
> @@ -134,3 +134,19 @@ xen_block_blockdev_add(char *str) "%s"
>  xen_block_blockdev_del(const char *node_name) "%s"
>  xen_block_device_create(unsigned int number) "%u"
>  xen_block_device_destroy(unsigned int number) "%u"
> +
> +# m25p80.c
> +m25p80_flash_erase(int offset, uint32_t len) "offset = 0x%"PRIx32", len = %u"
> +m25p80_programming_zero_to_one(uint32_t addr, uint8_t prev, uint8_t data) "programming zero to one! addr=0x%"PRIx32"  0x%"PRIx8" -> 0x%"PRIx8
> +m25p80_reset_done(void) "Reset done."
> +m25p80_command_decoded(uint32_t cmd) "new command:0x%"PRIx32
> +m25p80_complete_collecting(uint32_t cmd, int n, uint8_t ear, uint32_t cur_addr) "decode cmd: 0x%"PRIx32" len %d ear 0x%"PRIx8" addr 0x%"PRIx32
> +m25p80_populated_jedec(void) "populated jedec code"
> +m25p80_chip_erase(void) "chip erase"
> +m25p80_select(const char *what) "%sselect"
> +m25p80_page_program(uint32_t addr, uint8_t tx) "page program cur_addr=0x%"PRIx32" data=0x%"PRIx8
> +m25p80_transfer(uint8_t state, uint32_t len, uint8_t needed, uint32_t pos, uint32_t cur_addr, uint8_t t) "Transfer state 0x%"PRIx8" len 0x%"PRIx32" needed 0x%"PRIx8" pos 0x%"PRIx32" addr 0x%"PRIx32" tx 0x%"PRIx8
> +m25p80_read_byte(uint32_t addr, uint8_t v) "Read byte 0x%"PRIx32"=0x%"PRIx8
> +m25p80_read_data(uint32_t pos, uint8_t v) "Read data 0x%"PRIx32"=0x%"PRIx8
> +m25p80_binding(void) "Binding to IF_MTD drive"
> +m25p80_binding_no_bdrv(void) "No BDRV - binding to RAM"
> --
> 2.17.1
>
>
