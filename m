Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp9319687njk;
        Wed, 1 Jan 2025 18:42:52 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUiOzL7HqYbmLExQ2VpoPJHKK4/KxMcNlMWQnUUdxVG5/KaAjbmgs5d3Fgtb8QUE2MKFoZkAUT3e5wAcA==@linaro.org
X-Google-Smtp-Source: AGHT+IEEmQ8isEllAUkt/onkg2F9i1F9W2Y8qX86kR7m+40cLdLZMjnN0w4kjFuQjEFvwTRuJOHL
X-Received: by 2002:a05:620a:44c8:b0:7b6:d5cb:43b0 with SMTP id af79cd13be357-7b9ba7f6884mr5381647685a.39.1735785772576;
        Wed, 01 Jan 2025 18:42:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1735785772; cv=none;
        d=google.com; s=arc-20240605;
        b=LjLaqzCx1CD9VP29xZ01hK6Ech2dSLn8w/Dv6pKayjo8DL8hvYO8jY/wi/IXYoob9v
         mjzJcgkcm4PbT5AL477KVq+Bi20DFV58Fx7iUUmNy5wmDeYYhqvRN1mC7Q+RCp172wez
         Xbbf3tFS3/j56W+NrJN+s1yCNd/bW5AeAq3pBn9TQpE3r82v360RpczOExNlq0H/hc+w
         4TUcEixQrcUoAMS/1qMCW1mx0SuYfeSyLCi54cH94kuyYV7wHYTd4xwmkRCDosoOfdN4
         l6YAHsZWXIEUZY2Eyyahpr+fL2FmwEGk4Y2GlDyCHpYTL6szlwFcCmMvtJd+1naeiGqw
         O+rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=Oo5zUOoZoyHSvjtTD6b2JHyMjMiFjvaYDEzl4hAv93g=;
        fh=0mGxfv4pFpwsrgducROcORROFiNbAFJ/wnrLGVXoqZg=;
        b=Xz3VdxooTHTw6hgV+9fJJl5MjcZdPylkyJYjWYOSMVjeYRNZP8yqIfUAqmoOo7BPTf
         7YUjqaJD1FSxYI9bbhziXvM78eLrwmV9JVCy2o27GhqsL0lWhJyux+t8pD9AgyGXuRmy
         iRGtzbJ/V636ZD8f7MqPgFgieQ81yGSdB3qi9iGaMUGy3e33JK38RsgPjDhrU6qfhcdx
         +NirmqSYU4JuQm+xskIb62JED5SKW/w/xHtgarTyE5vnQUi+ybcyu+EE2XQXGMFFQzld
         sGuDZ5GaCwDZO67TZG0ro08puf7hFdWkyAS/hcVytGGhnRNEUaOfzB1UA3yQFfHHyaCe
         Ieuw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="dxhXV//9";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46a3eb9a6e5si241432761cf.327.2025.01.01.18.42.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Jan 2025 18:42:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="dxhXV//9";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tTBAV-0000Oo-Kr; Wed, 01 Jan 2025 21:42:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1tTBAT-0000OS-Dy; Wed, 01 Jan 2025 21:42:38 -0500
Received: from mail-vk1-xa35.google.com ([2607:f8b0:4864:20::a35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1tTBAQ-0002lo-1p; Wed, 01 Jan 2025 21:42:36 -0500
Received: by mail-vk1-xa35.google.com with SMTP id
 71dfb90a1353d-51bb020339fso1944467e0c.0; 
 Wed, 01 Jan 2025 18:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1735785752; x=1736390552; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Oo5zUOoZoyHSvjtTD6b2JHyMjMiFjvaYDEzl4hAv93g=;
 b=dxhXV//9xt7r9iHc9GSXbFGSrMKv9wxfwRssrpWJI6NX9HXyFMSuIMQnXB37EnU2cY
 OpS/35SSbPqa1CUL8h+q7ly7zekR1vqvA03Mf4PhJpC56/3EiD4r7KEKy9KYybB18R3k
 0JWWRoxWYad4rEPWrtEDyTAFSS5cXOhxevAqoBJrMHeSAr/B91fppjzggN5FuJPQewuw
 Kx7/mO+iX2Ozx27UnZJNs1uURFDO5lvhylzzVj0BH87LOh34RjL+X+DTlKAd7PwnJyTk
 NGml2VZh30FoepKTe3xQcYiCgkAxSCE92W+AIUIYrZX7cJ/c+l9PEWeoNj8vzv4E6plQ
 xYEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735785752; x=1736390552;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Oo5zUOoZoyHSvjtTD6b2JHyMjMiFjvaYDEzl4hAv93g=;
 b=XdIvCaka9aK/7D9BfP6txTrJOEglGSlbZZ90M8LRwQQhBOIklttsYENrU/g4xxIMV0
 4nqmoNGVciHjPv4lqhJf7xK7wG9dbzzQb+zD9dhzV6ZtL9QokNwgaubsf5fWTJ0XsRs9
 DOvSrvYhCSnFrVX5pmnVm82Rmb1Blwuo0mKbkL4NPzf3reniNWEcae4rjG94KZAW+bqQ
 cAG2v7JqboZtqzhec9UmDvTCEN2hqgNFoVNJydSgkssg+7Cyf7HA2NWJ3G9olw9DUuRN
 XPDyJ+03nEFbkjyttwpksDrGFIaNRgxqa1i3guDf0YHo0nsChNMUnwb04kzrO4ps1YbO
 0E3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdrOCVeMUXUfBSTu/y+Mks8FF0hy78JmrcNAuszJ+04sQGi3/+zGNEZBa+n/kpqap5o7a62jTeaif9ng==@nongnu.org,
 AJvYcCWljl9KVsAl68xSiQQH+IZ0doiZkSaVTXSaYTGOaOdDaYboswxu5yJV6lcy+LWwDFk0J+K88ez1Hw==@nongnu.org
X-Gm-Message-State: AOJu0Yx5epi32gutrQ51ZH3RxpNEs5F8YeTF7yChs/gL4PdTAyOYP/Xq
 omxauYoWyzm1e6yzaQPpBfQAdCgaFIUtxvY6K3yz7o85DgyQMKCxExNFIbiBoC8IPywLgI2WFgI
 2Wx4e0/hYhGPDe9X+g7TDVKnbCeQ=
X-Gm-Gg: ASbGncsy2UJjpoDGo8HorDakdkkrJgWFOfl3FX2nYgMInLr6Zi0V4ZnX0oTI3FhVNrP
 AHj9hlkwPl62/D/24IbFy5l6sJ7t/Xd/6eetY8xqOXtQfSfm1fNlmf5VSUQAvPXEmOwUU
X-Received: by 2002:a05:6102:f10:b0:4b2:4a38:7b8f with SMTP id
 ada2fe7eead31-4b2cc4626c3mr32833842137.17.1735785752204; Wed, 01 Jan 2025
 18:42:32 -0800 (PST)
MIME-Version: 1.0
References: <20241220084623.1889-1-nikita.shubin@maquefel.me>
 <20241220111756.16511-1-nikita.shubin@maquefel.me>
In-Reply-To: <20241220111756.16511-1-nikita.shubin@maquefel.me>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 2 Jan 2025 12:42:06 +1000
Message-ID: <CAKmqyKMuyj_3vQjH2PRnWY3HAz_+9cATzsJF=1qNssXYS6FfeA@mail.gmail.com>
Subject: Re: [PATCH v2] hw/char: stm32f2xx_usart: replace print with trace
To: Nikita Shubin <nikita.shubin@maquefel.me>
Cc: Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Nikita Shubin <n.shubin@yadro.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a35;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa35.google.com
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
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: TqoRuC3lBI8s

On Fri, Dec 20, 2024 at 9:18=E2=80=AFPM Nikita Shubin <nikita.shubin@maquef=
el.me> wrote:
>
> From: Nikita Shubin <nshubin@yadro.com>
>
> Drop debug printing macros and replace them with according trace
> functions.
>
> Signed-off-by: Nikita Shubin <n.shubin@yadro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> v1->v2:
> Phil:
> - fix typo s/recieve/receive/
> - initialize 'retvalue' with zero
>
> ---
>  hw/char/stm32f2xx_usart.c | 49 ++++++++++++++++++---------------------
>  hw/char/trace-events      |  6 +++++
>  2 files changed, 29 insertions(+), 26 deletions(-)
>
> diff --git a/hw/char/stm32f2xx_usart.c b/hw/char/stm32f2xx_usart.c
> index 17b5b1f15f..cd97f7d7e4 100644
> --- a/hw/char/stm32f2xx_usart.c
> +++ b/hw/char/stm32f2xx_usart.c
> @@ -30,17 +30,7 @@
>  #include "qemu/log.h"
>  #include "qemu/module.h"
>
> -#ifndef STM_USART_ERR_DEBUG
> -#define STM_USART_ERR_DEBUG 0
> -#endif
> -
> -#define DB_PRINT_L(lvl, fmt, args...) do { \
> -    if (STM_USART_ERR_DEBUG >=3D lvl) { \
> -        qemu_log("%s: " fmt, __func__, ## args); \
> -    } \
> -} while (0)
> -
> -#define DB_PRINT(fmt, args...) DB_PRINT_L(1, fmt, ## args)
> +#include "trace.h"
>
>  static int stm32f2xx_usart_can_receive(void *opaque)
>  {
> @@ -67,10 +57,11 @@ static void stm32f2xx_update_irq(STM32F2XXUsartState =
*s)
>  static void stm32f2xx_usart_receive(void *opaque, const uint8_t *buf, in=
t size)
>  {
>      STM32F2XXUsartState *s =3D opaque;
> +    DeviceState *d =3D DEVICE(s);
>
>      if (!(s->usart_cr1 & USART_CR1_UE && s->usart_cr1 & USART_CR1_RE)) {
>          /* USART not enabled - drop the chars */
> -        DB_PRINT("Dropping the chars\n");
> +        trace_stm32f2xx_usart_drop(d->id);
>          return;
>      }
>
> @@ -79,7 +70,7 @@ static void stm32f2xx_usart_receive(void *opaque, const=
 uint8_t *buf, int size)
>
>      stm32f2xx_update_irq(s);
>
> -    DB_PRINT("Receiving: %c\n", s->usart_dr);
> +    trace_stm32f2xx_usart_receive(d->id, *buf);
>  }
>
>  static void stm32f2xx_usart_reset(DeviceState *dev)
> @@ -101,49 +92,55 @@ static uint64_t stm32f2xx_usart_read(void *opaque, h=
waddr addr,
>                                         unsigned int size)
>  {
>      STM32F2XXUsartState *s =3D opaque;
> -    uint64_t retvalue;
> -
> -    DB_PRINT("Read 0x%"HWADDR_PRIx"\n", addr);
> +    DeviceState *d =3D DEVICE(s);
> +    uint64_t retvalue =3D 0;
>
>      switch (addr) {
>      case USART_SR:
>          retvalue =3D s->usart_sr;
>          qemu_chr_fe_accept_input(&s->chr);
> -        return retvalue;
> +        break;
>      case USART_DR:
> -        DB_PRINT("Value: 0x%" PRIx32 ", %c\n", s->usart_dr, (char) s->us=
art_dr);
>          retvalue =3D s->usart_dr & 0x3FF;
>          s->usart_sr &=3D ~USART_SR_RXNE;
>          qemu_chr_fe_accept_input(&s->chr);
>          stm32f2xx_update_irq(s);
> -        return retvalue;
> +        break;
>      case USART_BRR:
> -        return s->usart_brr;
> +        retvalue =3D s->usart_brr;
> +        break;
>      case USART_CR1:
> -        return s->usart_cr1;
> +        retvalue =3D s->usart_cr1;
> +        break;
>      case USART_CR2:
> -        return s->usart_cr2;
> +        retvalue =3D s->usart_cr2;
> +        break;
>      case USART_CR3:
> -        return s->usart_cr3;
> +        retvalue =3D s->usart_cr3;
> +        break;
>      case USART_GTPR:
> -        return s->usart_gtpr;
> +        retvalue =3D s->usart_gtpr;
> +        break;
>      default:
>          qemu_log_mask(LOG_GUEST_ERROR,
>                        "%s: Bad offset 0x%"HWADDR_PRIx"\n", __func__, add=
r);
>          return 0;
>      }
>
> -    return 0;
> +    trace_stm32f2xx_usart_read(d->id, size, addr, retvalue);
> +
> +    return retvalue;
>  }
>
>  static void stm32f2xx_usart_write(void *opaque, hwaddr addr,
>                                    uint64_t val64, unsigned int size)
>  {
>      STM32F2XXUsartState *s =3D opaque;
> +    DeviceState *d =3D DEVICE(s);
>      uint32_t value =3D val64;
>      unsigned char ch;
>
> -    DB_PRINT("Write 0x%" PRIx32 ", 0x%"HWADDR_PRIx"\n", value, addr);
> +    trace_stm32f2xx_usart_write(d->id, size, addr, val64);
>
>      switch (addr) {
>      case USART_SR:
> diff --git a/hw/char/trace-events b/hw/char/trace-events
> index 59e1f734a7..8b847006a0 100644
> --- a/hw/char/trace-events
> +++ b/hw/char/trace-events
> @@ -125,3 +125,9 @@ xen_console_unrealize(unsigned int idx) "idx %u"
>  xen_console_realize(unsigned int idx, const char *chrdev) "idx %u chrdev=
 %s"
>  xen_console_device_create(unsigned int idx) "idx %u"
>  xen_console_device_destroy(unsigned int idx) "idx %u"
> +
> +# stm32f2xx_usart.c
> +stm32f2xx_usart_read(char *id, unsigned size, uint64_t offs, uint64_t va=
l) " %s size %d offs 0x%02" PRIx64 " -> 0x%02" PRIx64
> +stm32f2xx_usart_write(char *id, unsigned size, uint64_t offs, uint64_t v=
al) "%s size %d offs 0x%02" PRIx64 " <- 0x%02" PRIx64
> +stm32f2xx_usart_drop(char *id) " %s dropping the chars"
> +stm32f2xx_usart_receive(char *id, uint8_t chr) " %s receiving %c"
> --
> 2.45.2
>
>
