Received: by 2002:adf:a557:0:0:0:0:0 with SMTP id j23csp3910056wrb;
        Tue, 9 Jul 2019 10:03:25 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwesxyoBKZrLW1E9lU3ZV+Tde9O40RbCYs8e/5KSW9j2fiGj1o4Bjw0GW+AB9v3y1aAW7AO
X-Received: by 2002:a17:906:4911:: with SMTP id b17mr21726283ejq.158.1562691805929;
        Tue, 09 Jul 2019 10:03:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562691805; cv=none;
        d=google.com; s=arc-20160816;
        b=xHqloNh8jA21kPKnvch/R/73Icm7u6a1fO9M7X1+PMu6PRjIPNPFO7QI62FXwGG6QX
         Y9627HKns9Ixa6HI7e05mHAsGMxfcjm7WzFPgLf/0TSjc0D4N5yb3UspdiS2E8VRwsoz
         kUM5x2JHbryt8I5qQzpBHPOlsqR3yCcRnkOg4tJi+mx5izAHFwN/3Baer7FIRo7MbPG1
         eL2XtRECYvVbKydM78XV3SDCnQDe+odJxNpFlSEEWp84NQxTceVushVnMBg8DHNvwoqt
         VaJ9BflINB9XSI7jdpDu2GR0sk8UbkvJQ4Yokew0J0HK4Q5Btx1fbC3OK1Hd4XDY/3Gy
         ekpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=lItc9gAwv9zbMEx6MjHCHOxGakzxL9FxuZYPnMDnwFw=;
        b=OFGD9chp/Nls9YHStYqrRCQHKWSQG9MdFeFko+TQfjv3SYe+M9L8sylEHPALui4C0H
         EC19pBoREab9deUJR+jdM3xYqwUQtip+PIC+BLiYKJdBdMUJjqpT1htvD5kKG/+R7yVc
         Vj0tL2VnoIJFol56PRM5dNoG1Qn3Q/AgHpoStlm6xqYU/FQV4WoqDY9T8xXsDcCmvUAE
         BhRBl7/xU6p+OihcxYXYNkOlKttZ7qKbFa3ioxXV8KM8LBEOQddekvSTRgOtJUMQ9a69
         nvwaPXQ/5a3yqjiu9O/7ePBGQupjbKdSBslmNyOzZSJcWkOm+Vlm4N4DiuqRDZfbU/xu
         on2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=p0xwYqJQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f13si7161282eje.197.2019.07.09.10.03.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jul 2019 10:03:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=p0xwYqJQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:52138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hktWW-0001rU-VT
	for alex.bennee@linaro.org; Tue, 09 Jul 2019 13:03:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47027)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alistair23@gmail.com>) id 1hktTm-0000BI-3Z
 for qemu-arm@nongnu.org; Tue, 09 Jul 2019 13:00:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1hktTk-00020q-N1
 for qemu-arm@nongnu.org; Tue, 09 Jul 2019 13:00:33 -0400
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242]:43574)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1hktTI-0001Z5-8b; Tue, 09 Jul 2019 13:00:06 -0400
Received: by mail-lj1-x242.google.com with SMTP id 16so20242536ljv.10;
 Tue, 09 Jul 2019 10:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=lItc9gAwv9zbMEx6MjHCHOxGakzxL9FxuZYPnMDnwFw=;
 b=p0xwYqJQ3MaWh8XzIPVAIo7AyaxxtYZCSY+Ox5rMZmYloN7oXMjo/sfmuW/ImRfLEa
 qtrru3ssk/9qbc7iXHapm3/6qyJaIUKTWI7YBIW7jX9CgjCqerHd8fnprdGzgJlLuQzb
 Cy1DSgl/gg2FV6CRMeJVyJdnqxItQMg5uwPNZ5LY8u7ySCTW8S+R0/TRDGo1V3QXLTB7
 zcOmbaXUmH22a9d86+9d/HUxrZq3R2RJkFbFvlQFqvm9ujcn43mu0LRzvc9Y6DCfuxUi
 vtE0PC7IigShB+GU1gQQ1rNDDIcqbT8U4Ode1yBe1GMtqav6UWMurXGzj59d1mHANSVJ
 JgfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=lItc9gAwv9zbMEx6MjHCHOxGakzxL9FxuZYPnMDnwFw=;
 b=LkEb+yO2w8wT5+9EVyuZpHoVib4t7+8KJmnm2OHy5tNihZB9lZJcIwDFRaF4lkQZCp
 E4CbVZ8pHVal9yJoIiYyeREd/prf08c/M6fM3nx0AMs74qQ2iq8Q5GuCR4kpXvmD2snB
 x2wBotz6qWZwhHH1fNz4VCra/8wvXMK/sNwGjph+hRYhpPRw0gxkdx+pwN3JGfftVsHh
 8cSOW/oWFCY2EtoB92wVTLsr3ZA/b1hdFhpMrXWdqNS/wr0arugpk8K88kSA2dqqp1rE
 kHFUGPGW/alKOcUzQh2iyVEzXjDd4ieJmPDOz/eQ7oiO8VPEBCH0+rOp+MdLgcQwWCEP
 EdRQ==
X-Gm-Message-State: APjAAAXPvMPdyhD5KdPl9oHzrfFKZCwmxuKx8U2pGBL6qRdb9/YDNeB3
 JtYDUOYk8/QVnq4dXVREqemwDWxzJYNXxn88pokDLG1B
X-Received: by 2002:a2e:9158:: with SMTP id q24mr14584240ljg.119.1562691600972; 
 Tue, 09 Jul 2019 10:00:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190709113715.7761-1-philmd@redhat.com>
 <20190709113715.7761-2-philmd@redhat.com>
In-Reply-To: <20190709113715.7761-2-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 9 Jul 2019 09:56:51 -0700
Message-ID: <CAKmqyKN+wczk1TvWcswV9AaarMXNddJGSfxDatU-QERSM1bC7g@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/3] hw/ssi/mss-spi: Convert
 debug printf()s to trace events
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: heEmDGlEGX6f

On Tue, Jul 9, 2019 at 4:40 AM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.c=
om> wrote:
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> Useful while debugging, can be skipped for next dev cycle.
>
>  Makefile.objs       |  1 +
>  hw/ssi/mss-spi.c    | 23 ++++++-----------------
>  hw/ssi/trace-events |  6 ++++++
>  3 files changed, 13 insertions(+), 17 deletions(-)
>  create mode 100644 hw/ssi/trace-events
>
> diff --git a/Makefile.objs b/Makefile.objs
> index 6a143dcd57..60ec443091 100644
> --- a/Makefile.objs
> +++ b/Makefile.objs
> @@ -178,6 +178,7 @@ trace-events-subdirs +=3D hw/scsi
>  trace-events-subdirs +=3D hw/sd
>  trace-events-subdirs +=3D hw/sparc
>  trace-events-subdirs +=3D hw/sparc64
> +trace-events-subdirs +=3D hw/ssi
>  trace-events-subdirs +=3D hw/timer
>  trace-events-subdirs +=3D hw/tpm
>  trace-events-subdirs +=3D hw/usb
> diff --git a/hw/ssi/mss-spi.c b/hw/ssi/mss-spi.c
> index 918b1f3e82..4878279482 100644
> --- a/hw/ssi/mss-spi.c
> +++ b/hw/ssi/mss-spi.c
> @@ -27,18 +27,8 @@
>  #include "hw/ssi/mss-spi.h"
>  #include "qemu/log.h"
>  #include "qemu/module.h"
> +#include "trace.h"
>
> -#ifndef MSS_SPI_ERR_DEBUG
> -#define MSS_SPI_ERR_DEBUG   0
> -#endif
> -
> -#define DB_PRINT_L(lvl, fmt, args...) do { \
> -    if (MSS_SPI_ERR_DEBUG >=3D lvl) { \
> -        qemu_log("%s: " fmt "\n", __func__, ## args); \
> -    } \
> -} while (0)
> -
> -#define DB_PRINT(fmt, args...) DB_PRINT_L(1, fmt, ## args)
>
>  #define FIFO_CAPACITY         32
>
> @@ -187,9 +177,9 @@ spi_read(void *opaque, hwaddr addr, unsigned int size=
)
>          }
>          break;
>      }
> -
> -    DB_PRINT("addr=3D0x%" HWADDR_PRIx " =3D 0x%" PRIx32, addr * 4, ret);
> +    trace_mss_spi_read(addr << 2, ret);
>      spi_update_irq(s);
> +
>      return ret;
>  }
>
> @@ -225,9 +215,9 @@ static void spi_flush_txfifo(MSSSpiState *s)
>          s->regs[R_SPI_STATUS] &=3D ~(S_TXDONE | S_RXRDY);
>
>          tx =3D fifo32_pop(&s->tx_fifo);
> -        DB_PRINT("data tx:0x%" PRIx32, tx);
> +        trace_mss_spi_flush_fifo("tx", tx);
>          rx =3D ssi_transfer(s->spi, tx);
> -        DB_PRINT("data rx:0x%" PRIx32, rx);
> +        trace_mss_spi_flush_fifo("rx", rx);
>
>          if (fifo32_num_used(&s->rx_fifo) =3D=3D s->fifo_depth) {
>              s->regs[R_SPI_STATUS] |=3D S_RXCHOVRF;
> @@ -262,9 +252,8 @@ static void spi_write(void *opaque, hwaddr addr,
>      MSSSpiState *s =3D opaque;
>      uint32_t value =3D val64;
>
> -    DB_PRINT("addr=3D0x%" HWADDR_PRIx " =3D0x%" PRIx32, addr, value);
> +    trace_mss_spi_write(addr, value);
>      addr >>=3D 2;
> -
>      switch (addr) {
>      case R_SPI_TX:
>          /* adding to already full FIFO */
> diff --git a/hw/ssi/trace-events b/hw/ssi/trace-events
> new file mode 100644
> index 0000000000..6e494b913c
> --- /dev/null
> +++ b/hw/ssi/trace-events
> @@ -0,0 +1,6 @@
> +# See docs/devel/tracing.txt for syntax documentation.
> +
> +# mss-spi.c
> +mss_spi_read(uint32_t addr, uint32_t value) "read addr:0x%02x value:0x%0=
8x"
> +mss_spi_write(uint32_t addr, uint32_t value) "write addr:0x%02x value:0x=
%08x"
> +mss_spi_flush_fifo(const char *name, uint32_t value) "flush fifo:%s valu=
e:0x%08x"
> --
> 2.20.1
>
>
