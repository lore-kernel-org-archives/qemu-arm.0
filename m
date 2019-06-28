Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp2657222wru;
        Fri, 28 Jun 2019 09:04:32 -0700 (PDT)
X-Received: by 2002:a2e:8681:: with SMTP id l1mr6847113lji.166.1561737872877;
        Fri, 28 Jun 2019 09:04:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561737872; cv=none;
        d=google.com; s=arc-20160816;
        b=fSKPdDlHnbgbBFlrgXJa9DbajJAuoeV2CWfdHjyINVQA2MYlj6lkiY2T8CnwSTi5+c
         aooaPYkO4UJlOllidWrFB0V4XTWzQk43FPoVXImhQNSpD1NFbq4UXuDiS4ELViORImbL
         ypqPUB/uLNJR0S427gsfeCrFHjAac5EX+PmP/gr4IQjC2pKe5PmLFqXK7Cn6KiaFsyMQ
         qj03FNFiB5MfUxaQAM8zDNjGbFdkCDuJet/3ymVMwE/AU9ZRzC0qo8d7uHNRZFkHc2ar
         Vu2pPSno/6Oz09OwQuNU+T+f192tNVQV/DSdgQqjwfYsFeazFZSseQnbWBamJCt6pWUL
         zdrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5dGU74xjYmsrypBQMVhsWiBTBztQOu4PtmKJ8sUHT2g=;
        b=AvIb3DfQaOFCzbuQqn7Jp4xj4ZCMocEvvIaZddqZZG50vL3AydUA+TFDWrsQOxiQxb
         t5QvY5T3ntdho4lwHaLfYy2ijSg1sDyW+9xYoW8FcNfFzXY0YM1ldzg3AKOKUIaaunmE
         QlkQDHLPTJJQ2LaQczJFqBptYao/TyFSpYT7jF8isYofBbRS0DW9YenCxANNXjUvWnsD
         jMnNqMOhleKrJbwdAEUeS/BSaH4vZLa9mExq7qnrIuuWWRQ8eK0nVMGDKgc1Y8VxWgrN
         tjgUduaaytUv8AISncY80X8lpynEXH4pHz3B3tpmFw848IG2cYamfc8f6jpRpJdqWxdB
         UFJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=uztqS68f;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <alistair23@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id j1sor730268lfh.44.2019.06.28.09.04.32
        (Google Transport Security);
        Fri, 28 Jun 2019 09:04:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=uztqS68f;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=5dGU74xjYmsrypBQMVhsWiBTBztQOu4PtmKJ8sUHT2g=;
        b=uztqS68f0BdHeo3tc+fr2QKH14VfYOSPZAodaS7py4Hu7shbOw3jL8RSZ7xzwwg09D
         2qesWTYh1C4754/6YW66PWcY39Bk4UyHcdIsswQgML80d3nRNkVdZKcU8k26nrFeDIT4
         uw8XPRueagyGslP2S70I4REWtA2HRweTExTt9jpbSQRfr4X0IvQ5XfOLnNvLCB68Pxeg
         0NAvq15A2baKZ+55F2bre+Q6wGrKYqncvJO6OjOp63q9c/VEe/+inTzK9ZwVrNjM8vGI
         f9Z6gxfIGWlrjWt3X96WzBKEjG9mBHukQHS8FjGq3l+CyA8quvdO9CvNpHogEVKKvPbf
         wCVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=5dGU74xjYmsrypBQMVhsWiBTBztQOu4PtmKJ8sUHT2g=;
        b=M0z0Uetb2fFgn81gxLcXdlAg5p3Cfkbx48+mIQtyuek6v/vW/TCnc9xW7wSkbEwJaZ
         gvbmjaWND3yWq4iD0E2vTEJyjGecl/KTAcqFBmvCwvOhLhePu/Nva5wvk0IQNdBQZvrw
         LsMcqG9GR1HYJZM6rRmZImq32yqPCKKOlh1PDsN5mNcXerVaXnZyegHcd7l0Bn1pmyVj
         Ybl9/eP1h4qv3n8c+lD4ENZwdSYzV9c7VrX4YWGmWoo5PD3oCAc3IW9tFuX/zkTSMJxD
         8n+wLRMN6hOlCv9GfTMQwKdCd+EY0G6ky0r+oFN1GTcJqmtqM7W25LOh0tK3Gz6ZNSKo
         zFJA==
X-Gm-Message-State: APjAAAWc7h6zc+OPvxxIyuvJoZIaPImabLtkV3SYR69UKOGItRW0y1Eb
	XmIiwwYj1Hw5JphqyYOHZbsA/e8pqgnyz++aCmc=
X-Google-Smtp-Source: APXvYqwF7e0zx1tQvrQedR6htzRevSsC2E4lPPRr2FGufD1LNIirVxkhJrVWH2LiqHancWBbZP+64KpOKk7LktBt9Gk=
X-Received: by 2002:a05:6512:29a:: with SMTP id j26mr5269037lfp.44.1561737872461;
 Fri, 28 Jun 2019 09:04:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190627202719.17739-1-philmd@redhat.com> <20190627202719.17739-8-philmd@redhat.com>
In-Reply-To: <20190627202719.17739-8-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 28 Jun 2019 09:01:32 -0700
Message-ID: <CAKmqyKPMkKNPXHqqEZPLmKH61c_BHSOXf26Fj8ZU4pyyoT8pWg@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v5 07/28] hw/block/pflash_cfi02: Simplify a
 statement using fall through
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
X-TUID: SDDeLhPK9kaz

On Thu, Jun 27, 2019 at 1:31 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Signed-off-by: Stephen Checkoway <stephen.checkoway@oberlin.edu>
> Message-Id: <20190426162624.55977-3-stephen.checkoway@oberlin.edu>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> [PMD: Extracted from bigger patch]
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/block/pflash_cfi02.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
> index e9eea0ec08..9e8c28af8f 100644
> --- a/hw/block/pflash_cfi02.c
> +++ b/hw/block/pflash_cfi02.c
> @@ -239,10 +239,10 @@ static uint32_t pflash_read(PFlashCFI02 *pfl, hwadd=
r offset,
>          case 0x0E:
>          case 0x0F:
>              ret =3D boff & 0x01 ? pfl->ident3 : pfl->ident2;
> -            if (ret =3D=3D (uint8_t)-1) {
> -                goto flash_read;
> +            if (ret !=3D (uint8_t)-1) {
> +                break;
>              }
> -            break;
> +            /* Fall through to data read. */
>          default:
>              goto flash_read;
>          }
> --
> 2.20.1
>
>
