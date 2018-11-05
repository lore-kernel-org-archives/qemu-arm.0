Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp2738701wro;
        Mon, 5 Nov 2018 07:49:42 -0800 (PST)
X-Google-Smtp-Source: AJdET5f1FVGGqs/EMdnkZqmsH+UiK5T+I6aT9xSOMf1MElJSLFCTXKCQsO0NtA4zCN21XtLeB7oc
X-Received: by 2002:a37:3388:: with SMTP id z130mr19902646qkz.51.1541432982329;
        Mon, 05 Nov 2018 07:49:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541432982; cv=none;
        d=google.com; s=arc-20160816;
        b=rXvTesNc4hPjRgL7WYfcf3BMBCnweZ4GQTPpq876XOw1dFNAQxJnlRJieHEBcolgmm
         fARPgEYUyLv8bdXUkszU4NogPHo0mtU0jE7ei+bbszq+XO4YEw+CeK4S28vaX5S87i5g
         CJ1SWK9iqLBUhSY8INFIVrDDKYDUxRKQFi75bzawE0mTkBC2NfvPbHIToneJ1K+zmXq0
         X3idahZnePhaaRP3v2NjDA/K5XgS0PfQYDsvt3z4TpN5X8SJo4BzAAZ3AJtjORB5IY5W
         a2tTsxkqrAMC7DckZK6NmbA9c/Cb7eF4PipxldXx31AF0ZYOgmJzF7swMLBrvKW+boUJ
         /Tsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature;
        bh=T+f9rmTBHbwmQ5DoiDP6Z82AB7y4hUcKqghghKfmpAw=;
        b=Qb7YmTYzYxCf0kVtMA453TSMA+l/psADZmOfnAxb86haW1Cnvh9ghkSC3uMkdK5Xpg
         ibHGo1xt7FG18uvohomBpIc4iM/w3yuMkVjRpLVG/I+OFoZ7VS/jw+JuQmNHGhB9pH9F
         KgBYfWHO1zggpAdB1z/wXH1aYWiFT04c43RCRhUzr7Ttv0YPe6R1tFvq2u7AnKgH66oO
         uelyW0ewR2n6ASS3D5ZzrYdzVVi0BEGPON4YRY27X571OiYgX492FIfi9Hq7gPF/iY4P
         nbcjbARIX9wFkyiCVTiT/omEcr4OQZYa7XM4G3OtpEPAoxMQ3qRZ4aIbi66q5F2CG9yA
         f7Yg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=c6Me2obQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k15si404877qke.86.2018.11.05.07.49.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 05 Nov 2018 07:49:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=c6Me2obQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35850 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gJh8H-0007wN-Nw
	for alex.bennee@linaro.org; Mon, 05 Nov 2018 10:49:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57485)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gJh5w-0004Xj-O4
	for qemu-arm@nongnu.org; Mon, 05 Nov 2018 10:47:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gJgyH-0000qK-KM
	for qemu-arm@nongnu.org; Mon, 05 Nov 2018 10:39:22 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:37604)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gJgyH-0000oX-CK
	for qemu-arm@nongnu.org; Mon, 05 Nov 2018 10:39:21 -0500
Received: by mail-oi1-x241.google.com with SMTP id w66-v6so7820361oiw.4
	for <qemu-arm@nongnu.org>; Mon, 05 Nov 2018 07:39:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=T+f9rmTBHbwmQ5DoiDP6Z82AB7y4hUcKqghghKfmpAw=;
	b=c6Me2obQ2MoXhA8zHzSMm4E3BZf5dgrF8ZaJL6doJRmPw6G4WsvuBN3wdqEmyYzHiw
	ByluKhism0BHoe9buHVEVrPy+mx5AZ8qENQihSryPPf/f5NZitxVL4BCMRapdyNYmdGY
	lZmNEXMkcAEX5i9RMh/9PcFYrGITcTA/nPeFA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=T+f9rmTBHbwmQ5DoiDP6Z82AB7y4hUcKqghghKfmpAw=;
	b=P81JwTDSjiKwv8RId3jl0+//SBNiGuM1/3c/4nYAoaidzm6Gu5dVNw7VvVbs5D6d1N
	1y1/RnQdivfAGh2XujdyDVxYjBNhmINcsdmmg2KOCE7WOtS0qK08IAEu+BP4fGGY/uAu
	6Re86cHuLzwR8veJPMKLEQD0OugmXGPDO80fCrsMxWdY4Y7J7ZU/HzDeSJszY+0oKuE+
	GXR7W7BiV3q77WLULA8yv2MjdnY8brOz1dn21hc/kOptpYlNN4UC+F/GY5K0hZKEMJ2R
	E++pzQuH0O1h0AF65OdZP0AxJOcWvjKNJzYAefSC5rJKvUpydGricRTgySOtlIuZWc44
	pD7w==
X-Gm-Message-State: AGRZ1gLkkeTFYOKbe63H+45EYCQ7jOnk6GEi9WXB7kL2D3GGarzDvkSl
	/gVLInJPsKnJJkYH0PjHTjvfPhSUB5mdPTB6Upjs6Q==
X-Received: by 2002:aca:ef56:: with SMTP id
	n83-v6mr12378375oih.146.1541432360495; 
	Mon, 05 Nov 2018 07:39:20 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9d:4b0e:0:0:0:0:0 with HTTP;
	Mon, 5 Nov 2018 07:39:00 -0800 (PST)
In-Reply-To: <20181102001303.32640-4-f4bug@amsat.org>
References: <20181102001303.32640-1-f4bug@amsat.org>
	<20181102001303.32640-4-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Nov 2018 15:39:00 +0000
Message-ID: <CAFEAcA8LOR7mCVMe6R1A+VJMXpJMreLV-0KQ0nTXZM=7VXcmSA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::241
Subject: Re: [Qemu-arm] [PATCH for 3.2 v2 3/7] hw/arm/bcm2835: Use 0x prefix
 for hex numbers
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: i3grW0UTmkNJ

On 2 November 2018 at 00:12, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/char/bcm2835_aux.c      | 2 +-
>  hw/intc/bcm2836_control.c  | 4 ++--
>  hw/misc/bcm2835_property.c | 2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)

Commit message says it's just adding 0x prefixes, but the
patch adds extra logging of new numbers that weren't there
before. I don't think the patch needs splitting, but the
commit message could be improved.

Also, the compile test says some of these new additions
are using the wrong kind of format string specifier.

>
> diff --git a/hw/char/bcm2835_aux.c b/hw/char/bcm2835_aux.c
> index 0364596c55..9632e8972c 100644
> --- a/hw/char/bcm2835_aux.c
> +++ b/hw/char/bcm2835_aux.c
> @@ -159,7 +159,7 @@ static void bcm2835_aux_write(void *opaque, hwaddr of=
fset, uint64_t value,
>      case AUX_ENABLES:
>          if (value !=3D 1) {
>              qemu_log_mask(LOG_UNIMP, "%s: unsupported attempt to enable =
SPI "
> -                          "or disable UART\n", __func__);
> +                          "or disable UART: 0x%lx\n", __func__, value);

uint64_t needs PRIx64, not %lx.

>          }
>          break;
>
> diff --git a/hw/intc/bcm2836_control.c b/hw/intc/bcm2836_control.c
> index cfa5bc7365..96cc53f8a7 100644
> --- a/hw/intc/bcm2836_control.c
> +++ b/hw/intc/bcm2836_control.c
> @@ -204,8 +204,8 @@ static void bcm2836_control_write(void *opaque, hwadd=
r offset,
>      } else if (offset >=3D REG_MBOX0_RDCLR && offset < REG_LIMIT) {
>          s->mailboxes[(offset - REG_MBOX0_RDCLR) >> 2] &=3D ~val;
>      } else {
> -        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset %"HWADDR_PRIx"\n"=
,
> -                      __func__, offset);
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%"HWADDR_PRIx" =
0x%lx\n",
> +                      __func__, offset, val);

Ditto. If you want to print the value you should also say in the
log message string what the second hex number in it is.
(Mostly we don't seem to worry about printing the data value
for "write to bogus device address" messages.)

>          return;
>      }
>
> diff --git a/hw/misc/bcm2835_property.c b/hw/misc/bcm2835_property.c
> index 5d332324bd..c715cbaef6 100644
> --- a/hw/misc/bcm2835_property.c
> +++ b/hw/misc/bcm2835_property.c
> @@ -277,7 +277,7 @@ static void bcm2835_property_mbox_push(BCM2835Propert=
yState *s, uint32_t value)
>
>          default:
>              qemu_log_mask(LOG_GUEST_ERROR,
> -                          "bcm2835_property: unhandled tag %08x\n", tag)=
;
> +                          "bcm2835_property: unhandled tag 0x%08x\n", ta=
g);
>              break;
>          }
>
> --
> 2.17.2

thanks
-- PMM
