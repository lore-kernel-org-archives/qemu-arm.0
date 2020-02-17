Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp4916916lfp;
        Mon, 17 Feb 2020 02:23:02 -0800 (PST)
X-Google-Smtp-Source: APXvYqygGx3Fn7GyvFZVb5jGLdRwo9yvXnmlD5b/hXLy1iu1yuijTKTHt9WDZqE8s+P54UNegupg
X-Received: by 2002:a05:6214:11ac:: with SMTP id u12mr12093056qvv.85.1581934982795;
        Mon, 17 Feb 2020 02:23:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581934982; cv=none;
        d=google.com; s=arc-20160816;
        b=dRViMjbyHRTd8/ECgEnLsr3T/RBmN6KjRI0LJruQuEytdubjUIm7MaMN2A+e7Zm8xv
         x8hQ36tBbFp06bOlJZq8/MTym/NemzczsEytd95oOGHzPtYnjG1OOxP9lX2K/agoDOa+
         nEPJgwWZq/+AZWL4EkMGTFjZ9c3tphwTGigX6R08gitpt6ChsNKSl7T6PHvKnP8X10Yg
         GgGRBBq2Q+mDGDOBnbNda/2HZN4ml2ED+WZQNXhjG3OG5pK/RGPtLX6UTPvcislzRuOK
         lRdg0sUN47DYAAIoHmJ3D3X4y94gPqrJELEJJOkFSxR4BLvGkGtm1IvAUYo0SMMoqxII
         +9jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=I6pZiQYKw5bllwTSpCcY4oy/Qpa5ymGvSq6XhrO1I8E=;
        b=c9N9SCjKT1ASJrRHL6PrZ/r8pDWQjyXSNU6wFwbLDWQCexZ+IY180YpHq958e8T0ZT
         gv8eImrc94K0Njo4MqTOYWSem6AFQUyolT76edXgaamUPy9/6Zne9XUrsCRC/AJR8IFe
         VzBzrKBahCfbjgw1p8KyyoTdFkETr74ElB6JCGe9OqyDZ/xHPAG64a53DXQvSmp0rEUJ
         uAx1X/l+JD9NwflikJOi2PcYRvzYsPxpNCHsG315XyFzalGbyyB4Fjzq11XgbLKUTtbb
         H2ewlQCs6RlsYgKw8C+uycfUPIVgfZUXQu04jJJ+Hypj4mqw7Enkh1bEPmLarjXe2pFP
         Ltmw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Cn/w2X8L";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p36si20839qtf.263.2020.02.17.02.23.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Feb 2020 02:23:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Cn/w2X8L";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j3dYM-0000xT-7Z
	for alex.bennee@linaro.org; Mon, 17 Feb 2020 05:23:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59295)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j3dYE-0000x8-C8
 for qemu-arm@nongnu.org; Mon, 17 Feb 2020 05:22:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j3dYD-0007dN-AY
 for qemu-arm@nongnu.org; Mon, 17 Feb 2020 05:22:54 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:34521)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j3dYD-0007ct-4z
 for qemu-arm@nongnu.org; Mon, 17 Feb 2020 05:22:53 -0500
Received: by mail-oi1-x242.google.com with SMTP id l136so16208581oig.1
 for <qemu-arm@nongnu.org>; Mon, 17 Feb 2020 02:22:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=I6pZiQYKw5bllwTSpCcY4oy/Qpa5ymGvSq6XhrO1I8E=;
 b=Cn/w2X8LK+eUuGcaKEJnmpUVYtIoe4M2Tb3U7GBngu4QBBg7kItnO+XMp9HA1F8iKE
 yR5nzk4Sr8nBk+5dCIEwhgWAmo70sAN7I1L981vrRHLg18M9yUS5BAuLqUELurlw9NaO
 4Cw9mIetxYbmdb0WZO3MM4bojmTTTPs/rfVBbGipzZlrmfGTTjatrv7BvgpRIq2VclIR
 2+tRWtnZPknSirR01eCTOQ38aa5SMnz9Uhx2I2oCBuhPWgvK05ffOI9jqJTNOWfl+2UK
 x3ibOh3DSuq+Nrphfh6kGKyXNZ7o5J4BYmartzSfUjDNkZ0ZxFTEM3WrQUOOsbk6EL1X
 aX+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=I6pZiQYKw5bllwTSpCcY4oy/Qpa5ymGvSq6XhrO1I8E=;
 b=ouPgAVPTNGqh1iQDCF/5JPPXBtCXfAeSIAQYKtXKLgDxCnt0XkTbbFgTpdWsTDygGI
 ox8Lut926FIGQZkP0m1XJy7gcRJZ6E5eKw28MiSC0RQyuzdz2DWBgavux/oauKkTCMHY
 8r7UAV4hyHfzWehA4cjpjxDQeSuD9wxEH+Gy0HXfM8b5csi9STtfXp2SW2dY0b4/nxZQ
 wT66lIcz+npH3BldiItm/24nNvdzG9M7CX1f2wep2A3kky3oHaB2mZmfHPkG8lTrkavo
 MXKjNGRRT+F221JWEPJZuRGsd4O5NK9DYG1ZSLM1Ht/GI3q9QHAUekTVyXNcAmmORbjR
 Ekuw==
X-Gm-Message-State: APjAAAUPnVoi5/BGUUGLc/SqiuWbXnVzioMUOhso1nRhucyX1Mja7KnX
 bk4OwgUgAK3Pqc3+LtexXmDSQOBSWsoByiP/9nnvww==
X-Received: by 2002:a54:4f16:: with SMTP id e22mr9754321oiy.170.1581934972203; 
 Mon, 17 Feb 2020 02:22:52 -0800 (PST)
MIME-Version: 1.0
References: <20200215161923.4741-1-f4bug@amsat.org>
In-Reply-To: <20200215161923.4741-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 17 Feb 2020 10:22:41 +0000
Message-ID: <CAFEAcA8SLR5YXWYiS_GXOBhHAxR2QKut_BGVzNeamw_1xtifLA@mail.gmail.com>
Subject: Re: [PATCH] hw/misc/iotkit-secctl: Fix writing to 'PPC Interrupt
 Clear' register
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
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
X-TUID: iQ2h9uhRnsYg

On Sat, 15 Feb 2020 at 16:19, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
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
>  hw/misc/iotkit-secctl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/misc/iotkit-secctl.c b/hw/misc/iotkit-secctl.c
> index 609869821a..0d5556dd17 100644
> --- a/hw/misc/iotkit-secctl.c
> +++ b/hw/misc/iotkit-secctl.c
> @@ -340,7 +340,7 @@ static MemTxResult iotkit_secctl_s_write(void *opaque=
, hwaddr addr,
>          qemu_set_irq(s->sec_resp_cfg, s->secrespcfg);
>          break;
>      case A_SECPPCINTCLR:
> -        value &=3D 0x00f000f3;
> +        s->secppcintstat =3D ~value & 0x00f000f3;

This is (obviously) a bug, but I don't think your fix is right.
This register has bits which are write-one-to-clear,
(plus some other bits that are reserved and RAZ/WI)
so we want:
  s->secppcintstat &=3D ~(value & 0x00f000f3);

(In particular bitwise-not has higher precedence than
bitwise-and, so your expression will end up writing zero
to s->specppcintstat for any valid guest write.)

My guess is that when I originally wrote the code I meant
to write something like
   value &=3D 0x00f000f3;
   s->secppcintstat &=3D ~value;
and forgot the second line.

thanks
-- PMM
