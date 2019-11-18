Received: by 2002:a19:fc0b:0:0:0:0:0 with SMTP id a11csp163124lfi;
        Mon, 18 Nov 2019 07:07:29 -0800 (PST)
X-Google-Smtp-Source: APXvYqxQJZtjHIWQ6o7+PtaePFnFN0awy+9xXMSlDeqnAKEW23ZGAM0L2BbfAbr0mXt8m3htEXFI
X-Received: by 2002:ac8:4901:: with SMTP id e1mr27323563qtq.280.1574089649116;
        Mon, 18 Nov 2019 07:07:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574089649; cv=none;
        d=google.com; s=arc-20160816;
        b=eLMr8vA8mN7Sxqd3VKUfRcl3nTlBcxOfjNd/udwhlDrbGfUPvvGlv9cPX2hQsVJzVJ
         54dm6hI/sHtLck1Sf68glYCCqE5aEQTGsRXfuwiWAhPQG/U/tTWi/GWLErIcRUPF2kc0
         VhVfavTqymiWSxFnX6LLplg9ZqukQhB+CLVOaSSVr3T0scm2Vsvw2zxIv7k/nwzk+c0i
         ESBwShIDL1rEun3uNjSvNUhbpxZTONbULewkBIVu1QJBTaR9zMPAgMkNBjJ2WfZnC1+E
         txTSPvokzcH8hj4qxTXPi/fko5EcpaSdlvk9rc74BX7YEFQI0jmbeiQZ7pefG2geOk1C
         ho1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=Gu1Iv+CCf5Exkt+e6vonr2FfIz9x71rXUkPRrXFHeuY=;
        b=EqqFZGN5srlCnry+YR0WA1ZhWXc9jK4/Bop3PlBKZPDlM4daynNhM7eMbB+4hax20a
         OV/BvXR7KvPZGq/kuNSVl9oeigrATbnmZiX/VxYGy2RbcfsdQEe3WKDF3gz36685PNER
         CySh1Mj16EsRzm5yxjZsA0g6QP/NB0MNzIGaXtvFnDeGgfWt7S0cBaB0Eig2KeCTnoyF
         XVhl8mgOVse0fVlW0sLnMInoGU0YjDz5Sx8LRV4W1QQoHULJ4rS/ILpOZ+mAiK6opG2f
         QcFheKT32nWLkSHrwt3STpVtHPm7lkBJVc+n0KJD+gMGQ9lXGIY6iRkHgN5x63xwCgAG
         6IjA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="sL6/xvYI";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h90si9133501qva.43.2019.11.18.07.07.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Nov 2019 07:07:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="sL6/xvYI";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iWici-00088t-5D
	for alex.bennee@linaro.org; Mon, 18 Nov 2019 10:07:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34314)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iWicX-00088F-E3
 for qemu-arm@nongnu.org; Mon, 18 Nov 2019 10:07:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iWicW-0001xK-1k
 for qemu-arm@nongnu.org; Mon, 18 Nov 2019 10:07:17 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:43780)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iWicV-0001wp-Ro
 for qemu-arm@nongnu.org; Mon, 18 Nov 2019 10:07:15 -0500
Received: by mail-oi1-x241.google.com with SMTP id l20so15558614oie.10
 for <qemu-arm@nongnu.org>; Mon, 18 Nov 2019 07:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Gu1Iv+CCf5Exkt+e6vonr2FfIz9x71rXUkPRrXFHeuY=;
 b=sL6/xvYIcp2y1CIXEqJM1fxDHi9rw3vgWuCt+c9GN8zMxkVx2wfpOK/tz7ov0pCByS
 Db98AijiS0VeWFTOIk8hJJ1DteUFH09Tuli9smz5b8b4sP5z9EvqqyBT5ASAGLyMAbzB
 WYUNo94eUd2nE7Eg2bCL6lhhBTT9KItDJIk/Cs2aLJdfVPFS38UVpDc1VVEWTWLuh04T
 nDrzHt51hQbDzndOJhA0VI/WEYI6ob5Xph8K826N7b6/EZ+VNy5/M2Lq24pKhR8I1qHx
 ucrYDyfjjXPrpJlZ3fYF/bbzHooDliJZiRhFGKqihcWaCeHDjvHc1PyY05TVP6Tqul+n
 +now==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Gu1Iv+CCf5Exkt+e6vonr2FfIz9x71rXUkPRrXFHeuY=;
 b=noQcgLH2BTnBqDmfAUBdcDCSRYs20yGd6BpYtUBRw79SJP4WKe7Xd7Srx/xUyvKXwX
 0PvT8LYmxQqCo5QtdS385/iBvQe2MtNH/b0MmHDCgXPOgAHxTs6m8LPrecNUaKv+z9wu
 iyKCk5uL4EAXzoNqRYwd0wzDN7GN0nAkXMWX+Jz861goOvQq42hTC6iZZ/gkqu9CDIok
 vMUWqhNpCqLRGhG8/USm/uwbbDZiuoEWAfBmUS/4XwzQEBNPL19DMV3jE3I3gujMqpK9
 h0EOUjrC0SHQ8JPR6734VY48jxhlZlYfLhv+4Z9B3NVbrouZY/AMx3Ai1IjiYrZqSf7j
 ZHYw==
X-Gm-Message-State: APjAAAUZhWMnzaqB12M9ANgE6cS9yUQfxDGZd6P46sc+sY8V24XkVsyk
 NSizhg/MvGsrhR6jb7b47EsSW7i1KJXivRngSCIpkw==
X-Received: by 2002:a05:6808:b04:: with SMTP id
 s4mr20824695oij.163.1574089634917; 
 Mon, 18 Nov 2019 07:07:14 -0800 (PST)
MIME-Version: 1.0
References: <20191023173154.30051-1-marcandre.lureau@redhat.com>
 <20191023173154.30051-16-marcandre.lureau@redhat.com>
In-Reply-To: <20191023173154.30051-16-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Nov 2019 15:07:04 +0000
Message-ID: <CAFEAcA_e4byjW-zPWPWdwZX0qFwUesKo+FTFK6Y9_tMTejSsBQ@mail.gmail.com>
Subject: Re: [PATCH v3 15/33] serial-mm: add endianness property
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
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
Cc: Corey Minyard <cminyard@mvista.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, BALATON Zoltan <balaton@eik.bme.hu>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Paul Burton <pburton@wavecomp.com>, Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Fabien Chouteau <chouteau@adacore.com>, qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-ppc <qemu-ppc@nongnu.org>, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oeYaTouVOokW

On Wed, 23 Oct 2019 at 18:34, Marc-Andr=C3=A9 Lureau
<marcandre.lureau@redhat.com> wrote:
>
> Add a qdev property for endianness, so memory region setup can be done
> in realize.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  hw/char/serial.c         | 2 ++
>  include/hw/char/serial.h | 1 +
>  2 files changed, 3 insertions(+)
>
> diff --git a/hw/char/serial.c b/hw/char/serial.c
> index c28cfc94fd..2f7667c30c 100644
> --- a/hw/char/serial.c
> +++ b/hw/char/serial.c
> @@ -1081,6 +1081,7 @@ SerialMM *serial_mm_init(MemoryRegion *address_spac=
e,
>      qdev_prop_set_uint32(DEVICE(s), "baudbase", baudbase);
>      qdev_prop_set_chr(DEVICE(s), "chardev", chr);
>      qdev_prop_set_int32(DEVICE(s), "instance-id", base);
> +    qdev_prop_set_uint8(DEVICE(s), "endianness", end);
>
>      qdev_init_nofail(DEVICE(s));
>      qdev_init_nofail(DEVICE(self));
> @@ -1102,6 +1103,7 @@ static void serial_mm_instance_init(Object *o)
>
>  static Property serial_mm_properties[] =3D {
>      DEFINE_PROP_UINT8("regshift", SerialMM, regshift, 0),
> +    DEFINE_PROP_UINT8("endianness", SerialMM, endianness, DEVICE_NATIVE_=
ENDIAN),
>      DEFINE_PROP_END_OF_LIST(),
>  };

...on reading patch 16, I just noticed that here in patch 15
you define the 'endianness' property on the SerialMM object, but
you're trying to set it on the SerialState object. This bug then
gets fixed in passing in patch 16, but we should just be
setting it on the right object to start with.

thanks
-- PMM
