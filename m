Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp1709396lfm;
        Thu, 23 Apr 2020 03:08:34 -0700 (PDT)
X-Google-Smtp-Source: APiQypIxRXFZaeIr+VrgHeutAj7lt0lx7Ov9I422NrZ1PxKLgRbQXIuYpr5cyOSl4jJRIRZjoY2P
X-Received: by 2002:a0c:c603:: with SMTP id v3mr3383312qvi.82.1587636514740;
        Thu, 23 Apr 2020 03:08:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587636514; cv=none;
        d=google.com; s=arc-20160816;
        b=fWgzLgNqaAnN2Zi4LHv8dNdllQ1kCwbIX6DpxBQjKcVxrlY9QFWxqKbnOBNoTaPa02
         UvroNQMlonQJrdtby10sjsTD3/2fj2C6Bf9apZ2U4ISxtkMqoGPJPYyL8gr6wS9pMjjK
         qrGLpuqYPV/shnU0YNH9VmgjdK8ZXNm1qBz2NVvay5QPw0Mm59uCkQfv4SksPcaYy2s6
         jogYk4mRnufEx0ovbg5GGG6LIXgrFoC5O78LqeGKFTDyztzGHTFhuG0Ra7RZ0C0MMozk
         ffZZj2yP7fSKohW2tT/bifr7YUrSOMea4hkyLG83vwgA9Q4ctqCMkUKOlRBiGLaneibi
         dsqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:references:to:from:subject:dkim-signature;
        bh=26mFD04CNLFNlq5fAwrmrHfJmkaVx1OLPhxNguFh7xM=;
        b=WbGYlbyNiOu5YhaMyUWCeIGO8rffCJmFujmxxKIIcuwBDkGkCd57dG7K9FIGVvk4ts
         5pG6UqFEBm0g5krNtDj8WVnjaVXcZ7Xrm0IyfJxoVggXPQMjjE9UP7UhigSGQOQHlJqf
         5lchpDLoKi5eeqbrayno42rHPyjhBT5VlVDufa8tG0po027KhtaHArIPxoAw/F04ku2K
         AojxomYxnbg+KWCBc7YcUHwsqexP+2nj0QFkDoIN5nVZbaqPGJfuRp40Ngfx3lMVppG7
         Qi39Y0AZmil/0SuPH4gRONGsyripPNjOi2Ld/nCpKuomrvMNUJHGn/PJW5jGwoq+8qC2
         MU7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=DoHbKLum;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 123si1028024qkd.359.2020.04.23.03.08.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Apr 2020 03:08:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=DoHbKLum;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:40292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jRYmY-0005ny-2z
	for alex.bennee@linaro.org; Thu, 23 Apr 2020 06:08:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57346)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jRYmK-0005kk-Ds
 for qemu-arm@nongnu.org; Thu, 23 Apr 2020 06:08:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jRYmI-00013N-Hl
 for qemu-arm@nongnu.org; Thu, 23 Apr 2020 06:08:20 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:55565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jRYmG-0000t8-1V; Thu, 23 Apr 2020 06:08:16 -0400
Received: by mail-wm1-x343.google.com with SMTP id e26so5784684wmk.5;
 Thu, 23 Apr 2020 03:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=26mFD04CNLFNlq5fAwrmrHfJmkaVx1OLPhxNguFh7xM=;
 b=DoHbKLumbW1jbNg5zp+nL52JxsLPjc3C17kr+ny3zbMXIVdaahc73R1TIbSTPF1m9v
 RNcv1YHT4VJ7LyYmS+XxvHU8uqzHXYXa0a0/jdpgmSbc9XvxGWDToOioxBvoinAAd0N0
 a2HufSO4MzO95HjOdCzcg0Xnp9qZrNWRJ/TIVydjqEVd5QBZtHgPeDp3amNZ3Dtvs2RR
 WZ2prwrHvSfqMD5TFbuzhWhKaxsZzaUgAQq4a1MI8TJhaE9KjQEiRNWjioMLA+GUEgAq
 7SyuRqyDT+mTX8BLKiphd4VxGb1JtbK8Nyzlo5DkNjs3akcN+2f3P7XpgmhA46TskOBk
 GtKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=26mFD04CNLFNlq5fAwrmrHfJmkaVx1OLPhxNguFh7xM=;
 b=k3Z1bPJFYpZQ6BAK6pyPBwQ3WQWcFKEqJrT6MCVqKTvlFghDccCmIfl0GAlPABXHg+
 rJlAwdJGsj35lnQ5VFRXAwYPKTbpQtkyMCk8jQ29zrQ+hIZrGT7RjwBIUbTAFZVvPYFT
 +exN18cLVhm1gaUWUBIMErdp8423illh2pVDn6tq3Lg9gWONZ817LFwml7Ynnlx/k7cX
 0+RZHW6HcdX5mOxDCIQoSaufcMAXdKVWO/nGu+uR/KH8VkNUE4WjN3CmvRCvobr5XJJ5
 f6UnQ0ZwAFWcycpHFkKBd0yuzvVDZgWhLCLSN81tf9NLQ7hNkeRGx3iY9sPXlyaq5OpT
 uzIQ==
X-Gm-Message-State: AGi0PuZejZKNfqBRgX07A9E979fsMw2CqTwKq8D9ulpnV11kwHCTjbp9
 f3IB+S4G/Z7xWwada06BjHn8tAGK
X-Received: by 2002:a7b:c250:: with SMTP id b16mr3447916wmj.100.1587636493270; 
 Thu, 23 Apr 2020 03:08:13 -0700 (PDT)
Received: from [192.168.1.39] (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id l6sm3040357wrb.75.2020.04.23.03.08.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Apr 2020 03:08:12 -0700 (PDT)
Subject: Re: [PATCH QEMU v2 4/5] ARM: PL061: Add gpiodev support
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Alexander Graf <graf@amazon.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <bartekgola@gmail.com>,
 Magnus Damm <magnus.damm@gmail.com>
References: <20200423090118.11199-1-geert+renesas@glider.be>
 <20200423090118.11199-5-geert+renesas@glider.be>
 <520d1d07-7530-e133-af6e-a8b4615829b8@amsat.org>
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
Message-ID: <e279f622-3af6-5073-dac0-4c452a88c32b@amsat.org>
Date: Thu, 23 Apr 2020 12:08:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <520d1d07-7530-e133-af6e-a8b4615829b8@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2a00:1450:4864:20::343
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
X-TUID: Zo+C0R3tAHfm

On 4/23/20 11:33 AM, Philippe Mathieu-Daudé wrote:
> On 4/23/20 11:01 AM, Geert Uytterhoeven wrote:
>> Make the PL061 GPIO controller user-creatable, and allow the user to tie
>> a newly created instance to a gpiochip on the host.
>>
>> To create a new GPIO controller, the QEMU command line must be augmented
>> with:
>>
>>     -device pl061,host=<gpiochip>
>>
>> with <gpiochip> the name or label of the gpiochip on the host.
>>
>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> ---
>> v2:
>>   - New.
>> ---
>>  hw/gpio/pl061.c | 35 +++++++++++++++++++++++++++++++++++
>>  qemu-options.hx |  9 +++++++++
>>  2 files changed, 44 insertions(+)
>>
>> diff --git a/hw/gpio/pl061.c b/hw/gpio/pl061.c
>> index 74ba733a8a5e8ca5..98204f9a586ae8c8 100644
>> --- a/hw/gpio/pl061.c
>> +++ b/hw/gpio/pl061.c
>> @@ -12,11 +12,14 @@
>>  #include "hw/arm/fdt.h"
>>  #include "hw/gpio/pl061.h"
>>  #include "hw/irq.h"
>> +#include "hw/qdev-properties.h"
>>  #include "hw/sysbus.h"
>>  #include "migration/vmstate.h"
>> +#include "qapi/error.h"
>>  #include "qemu/log.h"
>>  #include "qemu/module.h"
>>  #include "sysemu/device_tree.h"
>> +#include "sysemu/gpiodev.h"
>>  
>>  //#define DEBUG_PL061 1
>>  
>> @@ -41,6 +44,9 @@ static const uint8_t pl061_id_luminary[12] =
>>  typedef struct PL061State {
>>      SysBusDevice parent_obj;
>>  
>> +#ifdef CONFIG_GPIODEV
>> +    char *host;
>> +#endif
>>      MemoryRegion iomem;
>>      uint32_t locked;
>>      uint32_t data;
>> @@ -370,10 +376,39 @@ static void pl061_init(Object *obj)
>>      qdev_init_gpio_out(dev, s->out, 8);
> 
> Not related to this patch, but we should replace this 8 magic value by a
> proper definition...
> 
>>  }
>>  
>> +#ifdef CONFIG_GPIODEV
>> +static Property pl061_properties[] = {
>> +    DEFINE_PROP_STRING("host", PL061State, host),
>> +    DEFINE_PROP_END_OF_LIST(),
>> +};
>> +
>> +static void pl061_realize(DeviceState *dev, Error **errp)
>> +{
>> +    PL061State *s = PL061(dev);
>> +
>> +    if (!dev->opts) {
>> +        /* Not created by user */
>> +        return;
>> +    }
>> +
>> +    if (!s->host) {
>> +        error_setg(errp, "'host' property is required");
>> +        return;
>> +    }
>> +
>> +    qemu_gpiodev_add(dev, s->host, 8, errp);
>> +}
>> +#endif /* CONFIG_GPIODEV */
>> +
>>  static void pl061_class_init(ObjectClass *klass, void *data)
>>  {
>>      DeviceClass *dc = DEVICE_CLASS(klass);
>>  
>> +#ifdef CONFIG_GPIODEV
>> +    device_class_set_props(dc, pl061_properties);
>> +    dc->realize = pl061_realize;
>> +    dc->user_creatable = true;
>> +#endif
>>      dc->vmsd = &vmstate_pl061;
>>      dc->reset = &pl061_reset;
>>  }
>> diff --git a/qemu-options.hx b/qemu-options.hx
>> index 292d4e7c0cef6097..182de7fb63923b38 100644
>> --- a/qemu-options.hx
>> +++ b/qemu-options.hx
>> @@ -875,6 +875,15 @@ SRST
>>  ``-device isa-ipmi-bt,bmc=id[,ioport=val][,irq=val]``
>>      Like the KCS interface, but defines a BT interface. The default port
>>      is 0xe4 and the default interrupt is 5.
>> +
>> +#ifdef CONFIG_GPIODEV
>> +``-device pl061,host=gpiochip``
>> +    Add a PL061 GPIO controller, and map its virtual GPIO lines to a GPIO
>> +    controller on the host.
>> +
>> +    ``host=gpiochip``
>> +        The name or label of the GPIO controller on the host.
>> +#endif
>>  ERST
>>  
>>  DEF("name", HAS_ARG, QEMU_OPTION_name,
>>
> 
> Instead of restricting this to the pl061, it would be cleaner you add a
> GPIO_PLUGGABLE_INTERFACE (or GPIO_BINDABLE_INTERFACE or better name),
> and have TYPE_PL061 implement it.

IOW your backend should consume devices implementing this generic interface.
