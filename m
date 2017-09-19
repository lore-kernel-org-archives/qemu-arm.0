Received: by 10.223.172.38 with SMTP id v35csp5027259wrc;
        Tue, 19 Sep 2017 07:52:27 -0700 (PDT)
X-Received: by 10.200.47.238 with SMTP id m43mr2344089qta.251.1505832747718;
        Tue, 19 Sep 2017 07:52:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505832747; cv=none;
        d=google.com; s=arc-20160816;
        b=wLG31TWqJR2GO53lcwTU52pAMG2KYpXs3Q4UULms5RVKSethYvHZ3YFvcsWQe0f/pK
         lzDog/esrW7lM6HYq+IJJz82T1AFxxBD/+wAn7vRKWZIM6zCWze/o4WmExKryPupEBWn
         kSD0CUC3wsamcTpus9wpDztdb8iGTxdiYi4w9dhGl3Z978Np1+fCuclCG+jJOFdoylu5
         DKmWcvM7mhFzIN/Ht3VNjm6Mg8o1zTMfC6FfAUtADe+wLNVITR6jGdH+jCndqAnqUK+h
         aWVpDBki/u7Y6nbJizTikdVZ4/NUde/d7cM8MSKEMqzFiHmGPYNR4epVbScq4aMvIvPC
         EXyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=8Flc7AjTrj2x50bSVec6go0URiBjgD9Jhr99JappdTo=;
        b=sIfv0oumPwXVac3dZ6vactfryRdpcd0qaU5z4Z6dI0+ONSG9Ux317el1F+MCgPBh5i
         b9yKJkIBgmJfejDszGN9WZSd5aLmrEJmLUNF1HjsG12StuiLw/beMOIytOPQq2STlh8p
         3mgb47O4kXPWxD8bB+A5OnIGUdpZ1jNWOgSYp9EZEIZikvU2Rks1RxQ6nzFtm8EIenKY
         A7A9U1/CqyKZR0t8fwxGhhRrQ70JAZeujJKnDAxulWSh2u7QOgI3ohczn6OD4GD6/eDz
         QieCwtahaafg9ViTJhVy/zyHDpg5vh6sfbNPk/hx3jYpDWCswhY3KIOucAXWbU7AXtfx
         Neyg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p6si904543qtd.432.2017.09.19.07.52.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Sep 2017 07:52:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43359 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1duJsv-0006X4-GM
	for alex.bennee@linaro.org; Tue, 19 Sep 2017 10:52:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41245)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1duJsl-0006Uk-N7
	for qemu-arm@nongnu.org; Tue, 19 Sep 2017 10:52:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1duJsf-0004Sy-Sy
	for qemu-arm@nongnu.org; Tue, 19 Sep 2017 10:52:15 -0400
Received: from mail-wr0-f173.google.com ([209.85.128.173]:48094)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1duJsf-0004SQ-MJ
	for qemu-arm@nongnu.org; Tue, 19 Sep 2017 10:52:09 -0400
Received: by mail-wr0-f173.google.com with SMTP id k20so226477wre.4
	for <qemu-arm@nongnu.org>; Tue, 19 Sep 2017 07:52:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=8Flc7AjTrj2x50bSVec6go0URiBjgD9Jhr99JappdTo=;
	b=p8lwuSHjCRUs9p2riQeTyYioUD63vGPAJuxo3mtv8v2wwZEvBqxgCp8EAxuDq19CjX
	ATwqaM6S2p50H7P2HGhd/XAow7nUoJcDTnouzEYhZP+cm7b37UL5Pz+euU2vqXOC9C9i
	HfbGnjBd6FxjaFy6R17cHXvuFe7sMCXtoxaqrBON7LBiSVKasnMZuLlQQWIpoGORvX2u
	dBSy0+Lo34KzqFdppOyv0qzxGFjDT0k1ymQD1Bf//KIWd+CjPV+oE94tIqp3XHpkdhK1
	T0C+9Dek9tE1ylueLIWMXVhmW9lyoeX1tSw5DhMBfGJ651WBfNLvS71Kmbdb/wnrH7Ju
	G1TQ==
X-Gm-Message-State: AHPjjUjHBsq+P3tvoQeNL6OAPU3YOicHM+Zz1xiZX7VesfVh94TdvxBB
	xoYx/bwovJtqGbP615IWyuXgxQ==
X-Google-Smtp-Source: AOwi7QAKzI/lfNbLd040PbTbrZoTFCTuXwY0Z1v8pMXIXQ/FrGOVjxA1Ily8Bg4Wh+jgvLfhEtksZQ==
X-Received: by 10.223.183.17 with SMTP id l17mr1585592wre.139.1505832728407;
	Tue, 19 Sep 2017 07:52:08 -0700 (PDT)
Received: from [192.168.10.165] (dynamic-adsl-78-12-246-117.clienti.tiscali.it.
	[78.12.246.117])
	by smtp.gmail.com with ESMTPSA id u1sm8722339wrd.95.2017.09.19.07.52.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Sep 2017 07:52:07 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Andrzej Zaborowski <balrogg@gmail.com>
References: <20170919125041.2153-1-f4bug@amsat.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <9832b91c-18dd-778a-b7a1-696a27359721@redhat.com>
Date: Tue, 19 Sep 2017 16:52:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170919125041.2153-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.173
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] hw/input/lm832x: move LM8323
 declarations to input/keypad.h
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZZE/sS2An59P

On 19/09/2017 14:50, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> Based-on: 20170919123053.32675-1-f4bug@amsat.org
> 
> $ ./scripts/get_maintainer.pl -f hw/input/lm832x.c
> get_maintainer.pl: No maintainers found, printing recent contributors.

I think the keymap and handler should be moved entirely to
hw/input/lm832x.c, removing the corresponding code from nseries.c; same
for tsc210x.c.

Unfortunately this is not my area, so I'm not very sure about it.  But
it should be relatively easy to write a qtest for lm832x, since it's an
i2c device just like e.g. tmp105.c (you can use QMP to send keys).

Thanks,

Paolo

>  include/hw/i2c/i2c.h      |  3 ---
>  include/hw/input/keypad.h | 23 +++++++++++++++++++++++
>  hw/arm/nseries.c          |  3 ++-
>  hw/input/lm832x.c         |  3 +--
>  4 files changed, 26 insertions(+), 6 deletions(-)
>  create mode 100644 include/hw/input/keypad.h
> 
> diff --git a/include/hw/i2c/i2c.h b/include/hw/i2c/i2c.h
> index 24e95d0155..8fdf3e47d6 100644
> --- a/include/hw/i2c/i2c.h
> +++ b/include/hw/i2c/i2c.h
> @@ -70,9 +70,6 @@ int i2c_recv(I2CBus *bus);
>  
>  DeviceState *i2c_create_slave(I2CBus *bus, const char *name, uint8_t addr);
>  
> -/* lm832x.c */
> -void lm832x_key_event(DeviceState *dev, int key, int state);
> -
>  extern const VMStateDescription vmstate_i2c_slave;
>  
>  #define VMSTATE_I2C_SLAVE(_field, _state) {                          \
> diff --git a/include/hw/input/keypad.h b/include/hw/input/keypad.h
> new file mode 100644
> index 0000000000..efacef6458
> --- /dev/null
> +++ b/include/hw/input/keypad.h
> @@ -0,0 +1,23 @@
> +/*
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2 or later, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License along with
> + * this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +#ifndef HW_KEYPAD_H
> +#define HW_KEYPAD_H
> +
> +#include "hw/hw.h"
> +
> +#define TYPE_LM8323 "lm8323"
> +
> +void lm832x_key_event(DeviceState *dev, int key, int state);
> +
> +#endif
> diff --git a/hw/arm/nseries.c b/hw/arm/nseries.c
> index a32ac82702..594b7e878c 100644
> --- a/hw/arm/nseries.c
> +++ b/hw/arm/nseries.c
> @@ -30,6 +30,7 @@
>  #include "ui/console.h"
>  #include "hw/boards.h"
>  #include "hw/i2c/i2c.h"
> +#include "hw/input/keypad.h"
>  #include "hw/devices.h"
>  #include "hw/block/flash.h"
>  #include "hw/hw.h"
> @@ -412,7 +413,7 @@ static void n810_kbd_setup(struct n800_s *s)
>      /* Attach the LM8322 keyboard to the I2C bus,
>       * should happen in n8x0_i2c_setup and s->kbd be initialised here.  */
>      s->kbd = i2c_create_slave(omap_i2c_bus(s->mpu->i2c[0]),
> -                           "lm8323", N810_LM8323_ADDR);
> +                              TYPE_LM8323, N810_LM8323_ADDR);
>      qdev_connect_gpio_out(s->kbd, 0, kbd_irq);
>  }
>  
> diff --git a/hw/input/lm832x.c b/hw/input/lm832x.c
> index 2340523da0..868ddfe5ea 100644
> --- a/hw/input/lm832x.c
> +++ b/hw/input/lm832x.c
> @@ -19,12 +19,11 @@
>   */
>  
>  #include "qemu/osdep.h"
> -#include "hw/hw.h"
>  #include "hw/i2c/i2c.h"
> +#include "hw/input/keypad.h"
>  #include "qemu/timer.h"
>  #include "ui/console.h"
>  
> -#define TYPE_LM8323 "lm8323"
>  #define LM8323(obj) OBJECT_CHECK(LM823KbdState, (obj), TYPE_LM8323)
>  
>  typedef struct {
> 

