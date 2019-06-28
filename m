Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp2672650wru;
        Fri, 28 Jun 2019 09:20:06 -0700 (PDT)
X-Received: by 2002:a2e:9c03:: with SMTP id s3mr6746200lji.209.1561738806818;
        Fri, 28 Jun 2019 09:20:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561738806; cv=none;
        d=google.com; s=arc-20160816;
        b=fwY/l2UA/A1G2lRutioT6nVn94vsJThIjmB2Jn25GoyP4cFk+zTrMaXs6kVQVr+lWc
         0oWAossI/pxG0HaevxRMSVDNqJLj2IgjII26XrzHoQxIYrnkI5uhDxgTEs/ANJYPI6pU
         XwaUNUT8DAqQi6rE3WrKAyUyIXKgtsNASWtuqxzCmL+L6fC8l2MCtM/5cXyCP8NLhK8v
         FREcN+qrqoFmQqPoHE+EQJjvWIyQTJYRUohRBjrYBMHAtdjv+7oXUhbbHq6CwYdmDSLi
         Q1mU6JMb13Q52H0QRloTPEjPsNaLa1l6vUSwesPkp1HY9W7zY7LJDU+NFb8xYCmBGwZX
         XBlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3L0a++vJ0Hqer90XeUWUES0yvyyu/FiXM74eh2UIIoI=;
        b=mSxJbpmlIueizW11sVBPSoZzk8aS/CjrHEHWmI3DMpEGZqdTA5KV/RKVnGTcoYe4JK
         Y4/xLoTLL8CkDd9jGgXR7f9HKocTV3kEwqCPyqaGcagoc+0yrnGsM7Q+6NSgUU5mT9fQ
         VibcNqvP2Q/psu+2bSpwZDfKrdA0Esd/6CmtVV1r6TJtSsBfOvsLhB0VjBwuapmphXSJ
         4nVIM6tyUf61STKGVsADUTl0AL36zCJUWLc4RW5HBLCvEvvOVz7BUm7ae3pCCinKCHnl
         MRuFyywzs7DHgFGfZVpnX+FVdYbKh9SNVbMaTFOoaQCLUD5aFJGwsJIe9pE0Ts/wqnBJ
         PpoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=eZ33s0e5;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <alistair23@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id f17sor741211lfk.1.2019.06.28.09.20.06
        (Google Transport Security);
        Fri, 28 Jun 2019 09:20:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=eZ33s0e5;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=3L0a++vJ0Hqer90XeUWUES0yvyyu/FiXM74eh2UIIoI=;
        b=eZ33s0e5VPYr9AeHkc2UPccaxXwH66fbBuRzmTs4VdNNYW7vFlS38Y7iSofZ460S0R
         CXVYr3PPa2k292W0YcYFxyTX//3K/TajpyQtDTHBN67noB0hO2qVM8xs8g6/X7C5UsoE
         TBfAiPEpDIhVXn1XCEmQzTivZ+OAuAdfZmPhHeGbfW7q7al7LTv9Wz59z9WxeHBwKcIF
         iJnRzv6FOyh7M9zfxnqEsHgzxAXZqgEqPlrOnMjuvuxyTpgbo+ZII+azI6C78uwYVgnN
         OUxk+oa1N7F453l6yLgvmkaywlq+u6qhknrxizVDR9vFNM5xC+xB6ssbdaN0k4qtJYGr
         xOKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=3L0a++vJ0Hqer90XeUWUES0yvyyu/FiXM74eh2UIIoI=;
        b=az9aIa2IZsb8m3hF6a9N9s60VmizxD8SyOeQAvM0DHeqEMdgOJOY7jGTobZ5f2gfFq
         6kqjXlgWsg3kz5g2e661kAKJHqzmY1oaRprRM2b0SHApg4ldWqsNjHj5bncDheHoXXKO
         KF69XjWUUyZpaOj5NkP5K9kxsb10oQtWoGmlb9Xedo541LwoxkwOl8V0k5WMRdYHXTZP
         4XNRbXd45GDLHHqliV0aODgVgxxo8FRQ5NDaw4JdejC/t+oJIuAWCqs68ppMa6HXJpZB
         Lrzz2TIXV1r0xdWHXboOSCkQp3avdG13B6fOkewaDvo+kn5TX+76t1YBOr+n3img0y2n
         b+Fg==
X-Gm-Message-State: APjAAAVVad7CevT4z11stdjEa9oljq5MFHB4AaTuxaZWuOxuK6k9bzDa
	1f1aT+OoIluZmGl+wC2a64tZgq+fEv3YX7Oyu8Y=
X-Google-Smtp-Source: APXvYqx22sgpTlr3scbGHhOFgnltQylPTT0iKg2Wdn5d+JfP7uEkZ6dhksxCYs/362ZvkMn4f33iepD9lRtTcdWpYJs=
X-Received: by 2002:a05:6512:29a:: with SMTP id j26mr5302424lfp.44.1561738806501;
 Fri, 28 Jun 2019 09:20:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190627202719.17739-1-philmd@redhat.com> <20190627202719.17739-11-philmd@redhat.com>
In-Reply-To: <20190627202719.17739-11-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 28 Jun 2019 09:17:05 -0700
Message-ID: <CAKmqyKMk=bHg8KWvsfCoQwKp2Rk3z=rwoq0XDA42PLEeY-5m=A@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v5 10/28] hw/block/pflash_cfi02: Extract the
 pflash_data_read() function
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: Stephen Checkoway <stephen.checkoway@oberlin.edu>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, Kevin Wolf <kwolf@redhat.com>, 
	Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>, 
	Qemu-block <qemu-block@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>, 
	John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Alistair Francis <alistair@alistair23.me>, Magnus Damm <magnus.damm@gmail.com>, 
	Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Michael Walle <michael@walle.cc>, qemu-arm <qemu-arm@nongnu.org>, 
	"open list:New World" <qemu-ppc@nongnu.org>, Antony Pavlov <antonynpavlov@gmail.com>, 
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Jan Kiszka <jan.kiszka@web.de>, 
	Aurelien Jarno <aurelien@aurel32.net>, David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: uTOTGOACIZWE

On Thu, Jun 27, 2019 at 1:46 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Extract the code block in a new function, remove a goto statement.
>
> Signed-off-by: Stephen Checkoway <stephen.checkoway@oberlin.edu>
> Message-Id: <20190426162624.55977-3-stephen.checkoway@oberlin.edu>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> [PMD: Extracted from bigger patch, remove the XXX tracing comment]
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/block/pflash_cfi02.c | 24 ++++++++++++++----------
>  1 file changed, 14 insertions(+), 10 deletions(-)
>
> diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
> index 49afecb921..c079a63880 100644
> --- a/hw/block/pflash_cfi02.c
> +++ b/hw/block/pflash_cfi02.c
> @@ -165,12 +165,23 @@ static void pflash_timer (void *opaque)
>      pfl->cmd =3D 0;
>  }
>
> +/*
> + * Read data from flash.
> + */
> +static uint64_t pflash_data_read(PFlashCFI02 *pfl, hwaddr offset,
> +                                 unsigned int width)
> +{
> +    uint8_t *p =3D (uint8_t *)pfl->storage + offset;
> +    uint64_t ret =3D pfl->be ? ldn_be_p(p, width) : ldn_le_p(p, width);
> +    trace_pflash_data_read(offset, width << 1, ret);
> +    return ret;
> +}
> +
>  static uint32_t pflash_read(PFlashCFI02 *pfl, hwaddr offset,
>                              int width, int be)
>  {
>      hwaddr boff;
>      uint32_t ret;
> -    uint8_t *p;
>
>      ret =3D -1;
>      /* Lazy reset to ROMD mode after a certain amount of read accesses *=
/
> @@ -194,15 +205,8 @@ static uint32_t pflash_read(PFlashCFI02 *pfl, hwaddr=
 offset,
>      case 0x80:
>          /* We accept reads during second unlock sequence... */
>      case 0x00:
> -    flash_read:
>          /* Flash area read */
> -        p =3D (uint8_t *)pfl->storage + offset;
> -        if (pfl->be) {
> -            ret =3D ldn_be_p(p, width);
> -        } else {
> -            ret =3D ldn_le_p(p, width);
> -        }
> -        trace_pflash_data_read(offset, width << 1, ret);
> +        ret =3D pflash_data_read(pfl, offset, width);
>          break;
>      case 0x90:
>          /* flash ID read */
> @@ -222,7 +226,7 @@ static uint32_t pflash_read(PFlashCFI02 *pfl, hwaddr =
offset,
>              }
>              /* Fall through to data read. */
>          default:
> -            goto flash_read;
> +            ret =3D pflash_data_read(pfl, offset, width);
>          }
>          DPRINTF("%s: ID " TARGET_FMT_plx " %" PRIx32 "\n", __func__, bof=
f, ret);
>          break;
> --
> 2.20.1
>
>
