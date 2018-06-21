Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp2315435wrq;
        Thu, 21 Jun 2018 11:14:03 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJQeeCKLtza2HbgUko5/UJwfEGkdz4XyPOJ0RVYfGUIa23gPcJRjcQkCWyZ1wpINs6DVzu1
X-Received: by 2002:a0c:99df:: with SMTP id y31-v6mr23503542qve.156.1529604843413;
        Thu, 21 Jun 2018 11:14:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529604843; cv=none;
        d=google.com; s=arc-20160816;
        b=L/zadZzLhYw4slJc1PXGbfs37W3Jii3eKw+ZMr1u+SWf53tpvQz3VxG5ehsoRvSMpi
         I9FCsX/Z21qDAR/BWv3AOl6fcz4Y5rUO9cdjjqfA2V1MG7Kbz9q5UZih34k9LBLaAbkc
         QUeyfwwuS/flbQY/FTq7V9QcJUXvo04a177iwuXEEBVcjmGpbeltPOzDHj71neFH7eCz
         H6vo3DQ85njPvEg4cUIQwPXg+YwGEsR6LHNV30FeKm8mEeMlSNbYWM0ybUfjA2ekSNe6
         zq4EVKf9zGus2M/XnQQI48J/+sDPRiOyxqUFaZ0/ihBWUBS36XO2CXfAygJPpN3WYnoi
         +1jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=xvl6zLRces/SMktD691P47IbrnWKJFqGCaFx1dBAR4c=;
        b=MaFpU20xX82Alf84H7f0nXo4NjagZPHmRS5ziRX0KeA1gETStxEuIj58qR0O8v5xWl
         K5O7OHKlF5ywiciqwDLC3W70Rmr7Z7HwJm+9BnDO30KXSBGXcFGc3YULvAgxtkuHz8PU
         eCNIdmsQIwfmEC+lZQY17NhbSztmtxzcDvyfclQ+L6cHJlFPDLoZZUAIDRcZE6ewEVNG
         fm6EXs7MJTnK7NClXlaknrjXLOBCGlmECmesKMhHeVlNQK6er00irYvOjqBCMLRTcg3/
         8lRUFUGKj13AOl8Imn9DUBe2yJoYzx19BB9szSC/YV6sOfykqsIP/OJ8ob6k1tFzzBmz
         Ej2g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=pe9x0hTh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o187-v6si1275837qkf.285.2018.06.21.11.14.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 21 Jun 2018 11:14:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=pe9x0hTh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:57080 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fW45q-0000vf-T4
	for alex.bennee@linaro.org; Thu, 21 Jun 2018 14:14:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59921)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1fW3wy-00029k-MJ
	for qemu-devel@nongnu.org; Thu, 21 Jun 2018 14:04:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1fW3wx-0007NK-OV
	for qemu-devel@nongnu.org; Thu, 21 Jun 2018 14:04:52 -0400
Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244]:34777)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1fW3wv-0007LX-1E; Thu, 21 Jun 2018 14:04:49 -0400
Received: by mail-lf0-x244.google.com with SMTP id e13-v6so5654871lfc.1;
	Thu, 21 Jun 2018 11:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=xvl6zLRces/SMktD691P47IbrnWKJFqGCaFx1dBAR4c=;
	b=pe9x0hThWOolEfrhzCHe3qpfHViTpk9ovR09lG4ZfkpkAjUmQsrMIm8P/4lyF1S1Ls
	ufgDbijYoqG37B/o9HmzD50lDgYW6mxPzFWtAXRv5bMGh5fsDFlY4z6HTXyHXG4Cy5ea
	i2nG6KIVR7H8awQsZ3y4mEXDCk4Xer2aKtG/510JvHbSx34ZitPoJSw4IvOar0ECBEhJ
	B8sTb1XKOoK/rOPHliHId4p1/dbofmHz+7/WLzKf/TNAKDMhZJOkXSNjdkkQY/uFyG6L
	BeVOHW+x5OXNzsiaIVDK/20CR4Rmzg9fcoJ02UKEwt/CqwPo9vXu9M0WiTK3rm9gOFvv
	0qSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=xvl6zLRces/SMktD691P47IbrnWKJFqGCaFx1dBAR4c=;
	b=Ptva5tTkcwD1eROjswelbYUXALGgjbXEOHuBR+fiGDDtYN5Ig1xnkUhkMOWI52ANUt
	gWNMYd2fayzFonvd1FH5yMzD+zkH5hA6s/Iq7aW+kjM+BZ9kC/Q/A7MBDvn2o8XZLBfd
	DEVhgHYQTQ3SuhIkiVPvx9pqO8IFzqLXPoYUpX0MB5f8KU5X4YjihJBWA5pyKbafR1Gz
	wKZbBsXO20eMLvtf55YquOrpPbFWUJ5PRShwoUYTY2l3hUZSqr8QzZnTGTYBW8EX4EDX
	2inlP53SnEO7o5ZFbWlGznbEFhjjoC86mqiM9/qtTER2pN4TyRcvyquxvk9bWY4RuY0G
	xT5w==
X-Gm-Message-State: APt69E0XlF3HJSpszJx4+D6Z+lDDEgM/EvG7hr0hdkILIvD12gXkdho9
	JrSBgxFPdoCdPspR0qi9eAn1kJjm4vbuSZnbXwU=
X-Received: by 2002:a19:f24e:: with SMTP id
	d14-v6mr17311457lfk.18.1529604286250; 
	Thu, 21 Jun 2018 11:04:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:4242:0:0:0:0:0 with HTTP; Thu, 21 Jun 2018 11:04:15
	-0700 (PDT)
In-Reply-To: <20180621180224.8312-6-f4bug@amsat.org>
References: <20180621180224.8312-1-f4bug@amsat.org>
	<20180621180224.8312-6-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 21 Jun 2018 11:04:15 -0700
Message-ID: <CAKmqyKMgfiaLhQgKmSqewNzC6k1B5MfhNXThBScNoUcmyuuuBg@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::244
Subject: Re: [Qemu-devel] [PATCH 05/11] hw/ssi/omap_spi: Use
 qemu_log_mask(GUEST_ERROR) instead of fprintf
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	Alistair Francis <alistair@alistair23.me>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NMkE3ZaMC0SJ

On Thu, Jun 21, 2018 at 11:02 AM, Philippe Mathieu-Daud=C3=A9
<f4bug@amsat.org> wrote:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/ssi/omap_spi.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
>
> diff --git a/hw/ssi/omap_spi.c b/hw/ssi/omap_spi.c
> index 34163e5646..f278a55160 100644
> --- a/hw/ssi/omap_spi.c
> +++ b/hw/ssi/omap_spi.c
> @@ -20,6 +20,7 @@
>   * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
>   */
>  #include "qemu/osdep.h"
> +#include "qemu/log.h"
>  #include "hw/hw.h"
>  #include "hw/arm/omap.h"
>
> @@ -294,11 +295,15 @@ static void omap_mcspi_write(void *opaque, hwaddr a=
ddr,
>      case 0x2c: /* MCSPI_CHCONF */
>          if ((value ^ s->ch[ch].config) & (3 << 14))    /* DMAR | DMAW */
>              omap_mcspi_dmarequest_update(s->ch + ch);
> -        if (((value >> 12) & 3) =3D=3D 3)                  /* TRM */
> -            fprintf(stderr, "%s: invalid TRM value (3)\n", __func__);
> -        if (((value >> 7) & 0x1f) < 3)                 /* WL */
> -            fprintf(stderr, "%s: invalid WL value (%" PRIx64 ")\n",
> -                            __func__, (value >> 7) & 0x1f);
> +        if (((value >> 12) & 3) =3D=3D 3) { /* TRM */
> +            qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid TRM value (3)\n"=
,
> +                          __func__);
> +        }
> +        if (((value >> 7) & 0x1f) < 3) { /* WL */
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "%s: invalid WL value (%" PRIx64 ")\n",
> +                          __func__, (value >> 7) & 0x1f);
> +        }
>          s->ch[ch].config =3D value & 0x7fffff;
>          break;
>
> --
> 2.18.0.rc2
>
>
