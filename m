Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp1676496lfm;
        Thu, 23 Apr 2020 02:28:29 -0700 (PDT)
X-Google-Smtp-Source: APiQypJqMVbOm3WbfrSSK6HhM5f9pUh9cG79pPIh0hXvXgqtspUk/5W9ImkQ1V6z+AG0LLrgYhhT
X-Received: by 2002:ac8:19fd:: with SMTP id s58mr3042367qtk.354.1587634109477;
        Thu, 23 Apr 2020 02:28:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587634109; cv=none;
        d=google.com; s=arc-20160816;
        b=aJe4Oq9Kcsv7ElCFFidg7nC411orc3gmmdqluW8RrkBm3hDVzVNCpSx31dEMpkvlug
         ndw5q06+gtbMh30iiaXTsYhw5/STSNu8tNI/fchbPDmBqlw+98SyEII7b3CsN8a0oLbY
         BMRvirhdgE5QK9karwlMdM0TEpj4iv490Zkp5qwY43j+QUENtElE3TvFlEseRK57YeyE
         cE4ietdbZ1nS5BghZSDgWi5sHin1ON2mshjgkZpa7w8e6hN4lMnJwVBFelmJPerwSHxw
         alXZg2s0ErIzasXZM0U8QqPBU47Ug2oTg5g9Mo2il64Nb0jAj0lUElkUEkKgXl3CFHAl
         dSqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:from:references:to:subject:dkim-signature;
        bh=UlGV2vqlzbuHPWbE+jpO9xzuY7SKXtYOixbqsj1pKu0=;
        b=d9QlYIudUkWG68mNTBVwemqM/NyY2X8ADUxlCk9jkGKwuYfXI94EDKeUENaMjzZ8R8
         Njxn3UbJk9g0+tURiW/345S+G+raaLAgy397p4X9+nMsmboTqnpadXv+pq9MCH8zHgJC
         97xnzMOHW309O+NCYFKYGUl2I/qFn01Ce8/9Pf/cy9usTcDPMmoaqLLC/e29nSnD9Hpg
         9IJeIdEvuVdTwgncyC8o6k/tXa8u94tC8oEkp1V9XRVrjlvfsSHkpvLVBfI7o2DjJb+j
         1a6YH8NYEkGEjeKwNex9WMn8am3xQh+l5jK+//6avKeEfNFplUtRRadj0qtraTcmsdjx
         Yl0A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=I7xhHbF+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b10si1350745qvj.20.2020.04.23.02.28.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Apr 2020 02:28:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=I7xhHbF+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:39656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jRY9k-00034A-Q6
	for alex.bennee@linaro.org; Thu, 23 Apr 2020 05:28:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43650)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jRY9c-00033l-07
 for qemu-arm@nongnu.org; Thu, 23 Apr 2020 05:28:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jRY9b-0004wL-Ao
 for qemu-arm@nongnu.org; Thu, 23 Apr 2020 05:28:19 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:53269)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jRY9Z-0004vZ-75; Thu, 23 Apr 2020 05:28:17 -0400
Received: by mail-wm1-x341.google.com with SMTP id t63so5635749wmt.3;
 Thu, 23 Apr 2020 02:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UlGV2vqlzbuHPWbE+jpO9xzuY7SKXtYOixbqsj1pKu0=;
 b=I7xhHbF+mE0+/tGWxhgM39U1d2IvjmUw+CZakoTePRpplOwIz6ZoBxkb4lEakLjvYp
 LA32xw2L/KFi4DmEmYrlKwwA7lP39PZynWbGKhfw9ck3frnsdsckhlbA4KGyGd+F5FrG
 B1C7C7zYlfhJVkegH5TYu8N/AA5KnCHJs7E4/ZlY8No2+gBD8s83Bo4423JcnAZ8/en5
 epsR3viwNyh0jGFQe5CX8rGcX3u/M0B9YOC90Vlgb0OeHAuJNA96IEs09tqSiQjdFHKT
 ttddYL07HQxzM1aPJFbAedHpFfS8jN0/C/eDWBDcEniELDJPtmPRuyLb5h5VMPLY6fU5
 Pa9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=UlGV2vqlzbuHPWbE+jpO9xzuY7SKXtYOixbqsj1pKu0=;
 b=NiE8guYQQRdtztuh9gnntuWVAGn5pU8eqhN6EnC2Kk6M+tyINgGJH6U90uwibmyhqe
 rExbX/k/ZDcUZmfkQSOs83y7cXX+79LpZsyMhXWyhTTpKYpesb64Xo3HgEEndB8jhzep
 cEuya3b06NI76vh2loRoJ39tULb74lvQs9V/UZyyrqtAI1JTxfrYDDavLJcfBSAyiKVT
 yEnkickqDbxQzWnlwjxsGU3GHRkPsbBr8jvrs2HGbTw9J7WyBWlXsr6wZ4I0XsjNi44X
 qRzB8vWZs6JNw/G0oCbJrzBbhrY/8jbNpYjiopmHEeVqPMiCxkoMcW9s3FB43PssHLD8
 Aq9Q==
X-Gm-Message-State: AGi0PuY5c7zDk0SxVu9JtYfMNu3RFKf0iz1PEwJoDwdUwcT65HoVTzpY
 jEmxZQ5Pca7Ergjq0z3ZwWQDQjff
X-Received: by 2002:a05:600c:22d1:: with SMTP id
 17mr2966366wmg.167.1587634094955; 
 Thu, 23 Apr 2020 02:28:14 -0700 (PDT)
Received: from [192.168.1.39] (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id w10sm3037407wrg.52.2020.04.23.02.28.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Apr 2020 02:28:14 -0700 (PDT)
Subject: Re: [PATCH QEMU v2 3/5] Add a GPIO backend using libgpiod
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Alexander Graf <graf@amazon.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <bartekgola@gmail.com>,
 Magnus Damm <magnus.damm@gmail.com>
References: <20200423090118.11199-1-geert+renesas@glider.be>
 <20200423090118.11199-4-geert+renesas@glider.be>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Autocrypt: addr=f4bug@amsat.org; keydata=
 mQINBDU8rLoBEADb5b5dyglKgWF9uDbIjFXU4gDtcwiga9wJ/wX6xdhBqU8tlQ4BroH7AeRl
 u4zXP0QnBDAG7EetxlQzcfYbPmxFISWjckDBFvDbFsojrZmwF2/LkFSzlvKiN5KLghzzJhLO
 HhjGlF8deEZz/d/G8qzO9mIw8GIBS8uuWh6SIcG/qq7+y+2+aifaj92EdwU79apZepT/U3vN
 YrfcAuo1Ycy7/u0hJ7rlaFUn2Fu5KIgV2O++hHYtCCQfdPBg/+ujTL+U+sCDawCyq+9M5+LJ
 ojCzP9rViLZDd/gS6jX8T48hhidtbtsFRj/e9QpdZgDZfowRMVsRx+TB9yzjFdMO0YaYybXp
 dg/wCUepX5xmDBrle6cZ8VEe00+UQCAU1TY5Hs7QFfBbjgR3k9pgJzVXNUKcJ9DYQP0OBH9P
 ZbZvM0Ut2Bk6bLBO5iCVDOco0alrPkX7iJul2QWBy3Iy9j02GnA5jZ1Xtjr9kpCqQT+sRXso
 Vpm5TPGWaWljIeLWy/qL8drX1eyJzwTB3A36Ck4r3YmjMjfmvltSZB1uAdo1elHTlFEULpU/
 HiwvvqXQ9koB15U154VCuguvx/Qnboz8GFb9Uw8VyawzVxYVNME7xw7CQF8FYxzj6eI7rBf2
 Dj/II6wxWPgDEy3oUzuNOxTB7sT3b/Ym76yOJzWX5BylXQIJ5wARAQABtDFQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoRjRCVUcpIDxmNGJ1Z0BhbXNhdC5vcmc+iQJVBBMBCAA/AhsPBgsJ
 CAcDAgYVCAIJCgsEFgIDAQIeAQIXgBYhBPqr514SkXIh3P1rsuPjLCzercDeBQJd660aBQks
 klzgAAoJEOPjLCzercDe2iMP+gMG2dUf+qHz2uG8nTBGMjgK0aEJrKVPodFA+iedQ5Kp3BMo
 jrTg3/DG1HMYdcvQu/NFLYwamUfUasyor1k+3dB23hY09O4xOsYJBWdilkBGsJTKErUmkUO2
 3J/kawosvYtJJSHUpw3N6mwz/iWnjkT8BPp7fFXSujV63aZWZINueTbK7Y8skFHI0zpype9s
 loU8xc4JBrieGccy3n4E/kogGrTG5jcMTNHZ106DsQkhFnjhWETp6g9xOKrzZQbETeRBOe4P
 sRsY9YSG2Sj+ZqmZePvO8LyzGRjYU7T6Z80S1xV0lH6KTMvq7vvz5rd92f3pL4YrXq+e//HZ
 JsiLen8LH/FRhTsWRgBtNYkOsd5F9NvfJtSM0qbX32cSXMAStDVnS4U+H2vCVCWnfNug2TdY
 7v4NtdpaCi4CBBa3ZtqYVOU05IoLnlx0miKTBMqmI05kpgX98pi2QUPJBYi/+yNu3fjjcuS9
 K5WmpNFTNi6yiBbNjJA5E2qUKbIT/RwQFQvhrxBUcRCuK4x/5uOZrysjFvhtR8YGm08h+8vS
 n0JCnJD5aBhiVdkohEFAz7e5YNrAg6kOA5IVRHB44lTBOatLqz7ntwdGD0rteKuHaUuXpTYy
 CRqCVAKqFJtxhvJvaX0vLS1Z2dwtDwhjfIdgPiKEGOgCNGH7R8l+aaM4OPOd
Message-ID: <5dbfd026-3807-b122-ce60-1339a5252fca@amsat.org>
Date: Thu, 23 Apr 2020 11:28:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200423090118.11199-4-geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2a00:1450:4864:20::341
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
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sQbM9+7doMmj

On 4/23/20 11:01 AM, Geert Uytterhoeven wrote:
> Add a GPIO controller backend, to connect virtual GPIOs on the guest to
> physical GPIOs on the host.  This allows the guest to control any
> external device connected to the physical GPIOs.
> 
> Features and limitations:
>   - The backend uses libgpiod on Linux,
>   - For now only GPIO outputs are supported,
>   - The number of GPIO lines mapped is limited to the number of GPIO
>     lines available on the virtual GPIO controller.
> 
> Future work:
>   - GPIO inputs,
>   - GPIO line configuration,
>   - Optimizations for controlling multiple GPIO lines at once,
>   - ...
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2:
>   - Drop vgpios and gpios parameters, and map the full gpiochip instead,
>   - Replace hardcoded PL061 instance by multiple dynamic instances,
>     registered through qemu_gpiodev_add().
> ---
>  MAINTAINERS              |  6 +++
>  backends/Makefile.objs   |  2 +
>  backends/gpiodev.c       | 94 ++++++++++++++++++++++++++++++++++++++++
>  configure                | 28 ++++++++++++
>  include/sysemu/gpiodev.h | 12 +++++
>  5 files changed, 142 insertions(+)
>  create mode 100644 backends/gpiodev.c
>  create mode 100644 include/sysemu/gpiodev.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e760f65270d29d5d..a70af47430083d14 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -607,6 +607,12 @@ F: include/hw/arm/digic.h
>  F: hw/*/digic*
>  F: include/hw/*/digic*
>  
> +GPIO device backend
> +M: Geert Uytterhoeven <geert+renesas@glider.be>
> +S: Supported
> +F: backends/gpiodev.c
> +F: include/sysemu/gpiodev.h
> +
>  Goldfish RTC
>  M: Anup Patel <anup.patel@wdc.com>
>  M: Alistair Francis <Alistair.Francis@wdc.com>
> diff --git a/backends/Makefile.objs b/backends/Makefile.objs
> index 28a847cd571d96ed..ee658e797454119a 100644
> --- a/backends/Makefile.objs
> +++ b/backends/Makefile.objs
> @@ -21,3 +21,5 @@ common-obj-$(CONFIG_LINUX) += hostmem-memfd.o
>  common-obj-$(CONFIG_GIO) += dbus-vmstate.o
>  dbus-vmstate.o-cflags = $(GIO_CFLAGS)
>  dbus-vmstate.o-libs = $(GIO_LIBS)
> +
> +common-obj-$(CONFIG_GPIODEV) += gpiodev.o
> diff --git a/backends/gpiodev.c b/backends/gpiodev.c
> new file mode 100644
> index 0000000000000000..df1bd0113c7b2985
> --- /dev/null
> +++ b/backends/gpiodev.c
> @@ -0,0 +1,94 @@
> +/*
> + * QEMU GPIO Backend
> + *
> + * Copyright (C) 2018-2020 Glider bv
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include <errno.h>

<errno.h> probably not needed.

> +#include <gpiod.h>

Please move this one...

> +
> +#include "qemu/osdep.h"
> +#include "qemu/config-file.h"
> +#include "qemu/cutils.h"
> +#include "qemu/error-report.h"
> +#include "qemu/module.h"
> +#include "qemu/option.h"
> +#include "qapi/error.h"
> +
> +#include "sysemu/gpiodev.h"
> +
> +#include "hw/irq.h"
> +#include "hw/qdev-core.h"

... here:

#include <gpiod.h>

> +
> +static void gpiodev_irq_handler(void *opaque, int n, int level)
> +{
> +    struct gpiod_line *line = opaque;
> +    int status;
> +
> +    status = gpiod_line_set_value(line, level);
> +    if (status < 0) {
> +        struct gpiod_chip *chip = gpiod_line_get_chip(line);
> +
> +        error_report("%s/%s: Cannot set GPIO line %u: %s",
> +                     gpiod_chip_name(chip), gpiod_chip_label(chip),
> +                     gpiod_line_offset(line), strerror(errno));
> +    }
> +}
> +
> +static int gpiodev_map_line(DeviceState *dev, struct gpiod_chip *chip,
> +                            unsigned int gpio, Error **errp)
> +{
> +    struct gpiod_line *line;
> +    qemu_irq irq;
> +    int status;
> +
> +    line = gpiod_chip_get_line(chip, gpio);
> +    if (!line) {
> +        error_setg(errp, "Cannot obtain GPIO line %u: %s", gpio,
> +                   strerror(errno));
> +        return -1;
> +    }
> +
> +    status = gpiod_line_request_output(line, "qemu", 0);
> +    if (status < 0) {
> +        error_setg(errp, "Cannot request GPIO line %u for output: %s", gpio,
> +                   strerror(errno));
> +        return status;
> +    }
> +
> +    irq = qemu_allocate_irq(gpiodev_irq_handler, line, 0);
> +    qdev_connect_gpio_out(dev, gpio, irq);
> +    return 0;
> +}
> +
> +void qemu_gpiodev_add(DeviceState *dev, const char *name, unsigned int maxgpio,
> +                      Error **errp)
> +{
> +    struct gpiod_chip *chip;
> +    unsigned int i, n;
> +    int status;
> +
> +    chip = gpiod_chip_open_lookup(name);
> +    if (!chip) {
> +        error_setg(errp, "Cannot open GPIO chip %s: %s", name,
> +                   strerror(errno));
> +        return;
> +    }
> +
> +    n = gpiod_chip_num_lines(chip);
> +    if (n > maxgpio) {
> +        warn_report("Last %u GPIO line(s) will not be mapped", n - maxgpio);
> +        n = maxgpio;
> +    }
> +
> +    for (i = 0; i < n; i++) {
> +        status = gpiodev_map_line(dev, chip, i, errp);
> +        if (status < 0) {
> +            return;
> +        }
> +    }
> +
> +    info_report("Mapped %u GPIO lines", n);
> +}
> diff --git a/configure b/configure
> index 23b5e93752b6a259..8b133402ef727c8e 100755
> --- a/configure
> +++ b/configure
> @@ -509,6 +509,7 @@ libpmem=""
>  default_devices="yes"
>  plugins="no"
>  fuzzing="no"
> +gpio=""

Maybe name this feature 'libgpiod'?

>  
>  supported_cpu="no"
>  supported_os="no"
> @@ -1601,6 +1602,10 @@ for opt do
>    ;;
>    --gdb=*) gdb_bin="$optarg"
>    ;;
> +  --disable-gpio) gpio="no"
> +  ;;
> +  --enable-gpio) gpio="yes"

Ditto: --enable-libgpiod, because else it seems rather confusing.

> +  ;;
>    *)
>        echo "ERROR: unknown option $opt"
>        echo "Try '$0 --help' for more information"
> @@ -1894,6 +1899,7 @@ disabled with --disable-FEATURE, default is enabled if available:
>    debug-mutex     mutex debugging support
>    libpmem         libpmem support
>    xkbcommon       xkbcommon support
> +  gpio            gpio support
>  
>  NOTE: The object files are built at the place where configure is launched
>  EOF
> @@ -6250,6 +6256,23 @@ case "$slirp" in
>      ;;
>  esac
>  
> +##########################################
> +# check for libgpiod
> +
> +if test "$gpio" != "no"; then
> +    if $pkg_config --exists "libgpiod"; then
> +        gpio="yes"
> +        libgpiod_libs=$($pkg_config --libs libgpiod)
> +        libgpiod_cflags=$($pkg_config --cflags libgpiod)
> +        libs_softmmu="$libs_softmmu $libgpiod_libs"
> +        QEMU_CFLAGS="$QEMU_CFLAGS $libgpiod_cflags"
> +    else
> +        if test "$gpio" = "yes" ; then
> +            feature_not_found "gpio" "Install libgpiod"
> +        fi
> +        gpio="no"
> +    fi
> +fi
>  
>  ##########################################
>  # End of CC checks
> @@ -6733,6 +6756,7 @@ echo "default devices   $default_devices"
>  echo "plugin support    $plugins"
>  echo "fuzzing support   $fuzzing"
>  echo "gdb               $gdb_bin"
> +echo "gpio support      $gpio"
>  
>  if test "$supported_cpu" = "no"; then
>      echo
> @@ -7614,6 +7638,10 @@ if test -n "$gdb_bin" ; then
>      echo "HAVE_GDB_BIN=$gdb_bin" >> $config_host_mak
>  fi
>  
> +if test "$gpio" = "yes" ; then
> +  echo "CONFIG_GPIODEV=y" >> $config_host_mak
> +fi
> +
>  if test "$tcg_interpreter" = "yes"; then
>    QEMU_INCLUDES="-iquote \$(SRC_PATH)/tcg/tci $QEMU_INCLUDES"
>  elif test "$ARCH" = "sparc64" ; then
> diff --git a/include/sysemu/gpiodev.h b/include/sysemu/gpiodev.h
> new file mode 100644
> index 0000000000000000..bedd141001245207
> --- /dev/null
> +++ b/include/sysemu/gpiodev.h
> @@ -0,0 +1,12 @@
> +/*
> + * QEMU GPIO Backend
> + *
> + * Copyright (C) 2018-2020 Glider bv
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include "qemu/typedefs.h"

"qemu/typedefs.h" not needed in includes.

> +
> +void qemu_gpiodev_add(DeviceState *dev, const char *name, unsigned int maxgpio,
> +                      Error **errp);
> 
