Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp4974738lfp;
        Mon, 17 Feb 2020 03:28:16 -0800 (PST)
X-Google-Smtp-Source: APXvYqxkR683Bk3ff6ZXyJdAJUv/eFzMCP4/5Hrh7jDj3yaSzdc1kO6PMr86Ao9gchAgjzeo1TA4
X-Received: by 2002:ac8:1194:: with SMTP id d20mr12568816qtj.243.1581938896757;
        Mon, 17 Feb 2020 03:28:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581938896; cv=none;
        d=google.com; s=arc-20160816;
        b=uTkU3vhHVyKaY1Yqj24vyfeU4zR0iRDgo59XcpKYfsFgMy3qxn2Tnp/O5DGwUvAawK
         nYmJQaTvgSl2fgS6kExprTqcBuiTzFrLeVyLSBiHNABZ/ykKIjrkvtPA4eZ2DlFySpkw
         UKD42jdml3gI5JxeNfL2mUyFzrysv0nEYrUGMyOKtvSidB6CKgmT0eu1ih2vYK8E7kvZ
         IGfXI3idq5VkIMBavfzT1i3DAYy+3DArMvq6/RHluvWs43v8MWfwZSBkx5oh66VWrpdY
         meaBSxKU9FYVugLG2a7fVeL62PYdq1J/74yYpgPCGPqc7KorYsIdA5tMv1wk9tTnIk96
         OYwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=P6A4CuPNh5DrmAV95Z4jahk8OrH+S9Dcprv7wSv2qqM=;
        b=ZrePW/1Rl8ynvWrep4HN1+WicXQQxCZnWRNhLYhYNY1bUJRGqJOPRiW9tJeSIXWZhA
         YLWG0jampCb7m7YxRrjnBy18e5zzTaujdoMR3xBOvOAyJ4KQnV6IH0JeS5u3mH3UZate
         NOP2Q8RV4yWLwnnRLhCqgFZEw3rs3OOGIrbpTkWvuDnOgFZxZR5lTXn/XeFqQ/ok/I/j
         +Ipny3Ua2oX9of2yIJEX0yFRR0kC5hPFFUraW1SiNjdwOF8d/L6w4UHhZT7ZRaXRNyBP
         VDktsbAb7DHArG66RQSwflGl0u/1WQgP28xcTJz28hek6o4EzCepT9dg7Tt66ASiZext
         7e7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OWlPY6LX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i6si142543qvw.80.2020.02.17.03.28.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Feb 2020 03:28:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OWlPY6LX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j3eZU-0004kh-6k
	for alex.bennee@linaro.org; Mon, 17 Feb 2020 06:28:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38839)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j3eZM-0004iB-7S
 for qemu-arm@nongnu.org; Mon, 17 Feb 2020 06:28:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j3eZK-0002Pc-Vx
 for qemu-arm@nongnu.org; Mon, 17 Feb 2020 06:28:07 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:45839)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j3eZK-0002Oo-PU
 for qemu-arm@nongnu.org; Mon, 17 Feb 2020 06:28:06 -0500
Received: by mail-oi1-x241.google.com with SMTP id v19so16330100oic.12
 for <qemu-arm@nongnu.org>; Mon, 17 Feb 2020 03:28:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=P6A4CuPNh5DrmAV95Z4jahk8OrH+S9Dcprv7wSv2qqM=;
 b=OWlPY6LXd7WCTA1HpliAtBFKIi27s46D/y8xB63R01SH64dqFQ7lQsEXqL4H7b/baD
 2se5BgQH7KcGdFC73D6Nm0OrJVDzQjGTsuvt7FbzVMlsZO3EBOjY87SlkxS0odm6joq0
 dA5k3U6fy4OeMoB6rSNC7sqMxibmG/HQAdbYVQEth9p2ZFt8U+hCp29yicwyvkyRMNpa
 ung0trd3Cxt7mldRuMhxa/CxH2VVClisjHC7rG0y5Vzs08lNvvCfdNQwwbnKnZtkmTlR
 l/Wv3ZVgBfIGEVEsIqgDh/H1eoFO1xVCFhRyHsxDvN/PN2Mhsb2f94HZVh0+bg4w16DV
 PtQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=P6A4CuPNh5DrmAV95Z4jahk8OrH+S9Dcprv7wSv2qqM=;
 b=J5shX47cIJa7fi6nE6MPe8SCn5tdUlZPClIZjR88C9lMQNonxcZD1Lw/eHQwgTyRw8
 Do++2cYL9caP0h2vLVw0uRWaXHMcz+PyAI8xfHkme71Q/GoSSrTn+4sSA/a7aqvOQuvz
 FW2IAJqNkM6Q2jvSFcePZJ4DBZILNZg0tj21legxE2wF9CXvpcS5UpplD/8qFWi8/hvD
 l2OpU22Dm+z5QoRtcIzd0yxVt7hy/A3r9YcsbhQC7rEhR6Q26AWCoDiQJjQJivqmL6D2
 ost9+LrC36j5AujVn9nBNyvLLfyy//BlirI+hJlzsBxkRxOZQNHmuwtIMUgMPCDC5cA/
 j9vQ==
X-Gm-Message-State: APjAAAWAKNuABzOWiZuzGuMpeYPHzS0XTwKVbdqRT4OtD///jAf8zSj+
 ESjcCbGETCZ9BwlSAJRU4OOfWHhotZ6MJ5zaXpSLhpKx
X-Received: by 2002:aca:3d7:: with SMTP id 206mr9747324oid.98.1581938885747;
 Mon, 17 Feb 2020 03:28:05 -0800 (PST)
MIME-Version: 1.0
References: <20200217105657.31506-1-f4bug@amsat.org>
In-Reply-To: <20200217105657.31506-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 17 Feb 2020 11:27:54 +0000
Message-ID: <CAFEAcA8AT2YE0kzWjRmR1ZsSFxH7bs1t_G8Bs+J-QsCzMXPg3w@mail.gmail.com>
Subject: Re: [PATCH v2] hw/misc/iotkit-secctl: Fix writing to 'PPC Interrupt
 Clear' register
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::241
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Sf1DTewA0rw2

On Mon, 17 Feb 2020 at 10:57, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Fix warning reported by Clang static code analyzer:
>
>     CC      hw/misc/iotkit-secctl.o
>   hw/misc/iotkit-secctl.c:343:9: warning: Value stored to 'value' is neve=
r read
>           value &=3D 0x00f000f3;
>           ^        ~~~~~~~~~~
>
> Fixes: b3717c23e1c
> Reported-by: Clang Static Analyzer
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> v2: Corrected bitwise-not precedence (pm215)
> ---
>  hw/misc/iotkit-secctl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/misc/iotkit-secctl.c b/hw/misc/iotkit-secctl.c
> index 609869821a..43cf0f9970 100644
> --- a/hw/misc/iotkit-secctl.c
> +++ b/hw/misc/iotkit-secctl.c
> @@ -340,7 +340,7 @@ static MemTxResult iotkit_secctl_s_write(void *opaque=
, hwaddr addr,
>          qemu_set_irq(s->sec_resp_cfg, s->secrespcfg);
>          break;
>      case A_SECPPCINTCLR:
> -        value &=3D 0x00f000f3;
> +        s->secppcintstat =3D ~(value & 0x00f000f3);

Should be &=3D, not =3D. Otherwise you set all the other
bits in the register.

thanks
-- PMM
