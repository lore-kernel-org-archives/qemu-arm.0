Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp1118809wrg;
        Wed, 15 May 2019 16:10:04 -0700 (PDT)
X-Received: by 2002:a19:740e:: with SMTP id v14mr16879652lfe.144.1557961804072;
        Wed, 15 May 2019 16:10:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557961804; cv=none;
        d=google.com; s=arc-20160816;
        b=Z9V0+063ve81DJWPkzhzhivdjI/R5T9Hyj7nMHVCuhhyRY9+ftI4wke+zOZ0tAMS+P
         9iCZJsIg9VXBMeWU+U195jlq4ZoiF08NLeK4rK+5SfcDEjN2k33PiHvE6Jv6wwQrXkCg
         OV4iJXTpqTWSQq3ou8Ssr4USl51eV9pcgAUC+8WsNGiyK71swtGqaX8SoQHWw+bPxqKC
         4Qn0X7NZINkD1eCfUOF5+cXQZqlCT5KDb6LgaNGBT+/+qGfOIGxaX4C+lxJ73eFIGAru
         7Dcclg9qMtWZFnIRGOCn+GoeXODflxY9o6oIR73LdcaB6RTJmfzitHV1j5yatTdolW/V
         +3XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SEA0weuAopREcGK/9RGgbjirEdTuVM8BWT7R4Wr+Jr4=;
        b=UAQxkOYGIpB31RdiK7+yoK+2VicMVPvXwH6fnUkhNNFOyYbg8XgsUjJhOTokFhba9P
         sTLc1/2HdmyH/LD+u57ADset0UVpxYaRO4FpyvvK3CC9dyuCCXtuUHbmA/ehyP2S9hq3
         xbn2VB8jjongqDvyxg1UvtjKeB9ykPbEh95awei0Iq5HqN/tbGTB+jEkTKgvs3bQTa7v
         s2U0rnnYJ1J4WylPNXGMVT6HqlyzHqjWqQAZ0tIGf1VM6ZlrccPnqpacqYQtOyprsDvg
         jAZ1aZwyFxxpS3ZAjGF5IDFwdCdtipCf0hTEH4O10ubBckFra8BhG6KY62b0U6loaVUS
         hElQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=F4FA+gbr;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <alistair23@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id j24sor2410660ljg.21.2019.05.15.16.10.03
        (Google Transport Security);
        Wed, 15 May 2019 16:10:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=F4FA+gbr;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=SEA0weuAopREcGK/9RGgbjirEdTuVM8BWT7R4Wr+Jr4=;
        b=F4FA+gbr6aVBdvkboBrQkX+JQM2Lv+8NAKCt9BVzVYKp6zWipEPsdWpw5s0Q3ilHsk
         fa2gfm3jPbhNGgLu42bChDYWGWK8TRjmb0GeWljksijfwkMiAqWLWlBnX175O7a9f3Rs
         8wqjWVst4e4Cw31q3KIiaU5plg5EgCD0HlJUv14UDy06LmXvj0+tETUOviVTxF4WYHkq
         yJ38lXV6XNJeZDweFA1M9iZP8HgXiA7YwLShT5b7rOaHL4iTnjmRJwTe0dvnPlXlL7d7
         8ezSheUsOxtTF25bLAdad9HS/Vq829NlaSBAoR98361Dk3nsJjAgYgUQm4mDSvdgASuJ
         sf9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=SEA0weuAopREcGK/9RGgbjirEdTuVM8BWT7R4Wr+Jr4=;
        b=r4cgLNtJpXqz5ZTf5XUOKWcTJQ9Nq0i+A/sjUsCMdH7B2d8LR9jFZeFyLPCM991KRe
         3csvOFfs8ktO6uUk7ja74/xxzeI0qghB+BJFpv5IiN/Ypgri05gPEQRaceQlFlRvdaL9
         RdqtKiAngRv6q+HW1LGR7WxcJrRHssErWpvOiX325VgiOXgkxZb0fA3+7wi3gdTQP+1Y
         GeZXP5wmnxs7z9ElWyTs58yb5vswJx7pXkFxsluOrb3dBkvdCjRF61Fy4f3vxJ6Nu35t
         FLy5ml30coc2vR0PS7RwmFyXCSzvjhhdWYvkpCIDt/bF7Jd6JAbPqN65kXf9NeFFKarA
         NgNw==
X-Gm-Message-State: APjAAAWOCjfA+pHt8t8auWAIkiwIRkIY/NfCyVx6gc8jKCmAHeCDIRTM
	Xth2CBIz7oCB7ZNblvQZOcJrMZYi/YVcJBv1ojt0O/3v
X-Google-Smtp-Source: APXvYqwaeI/6fFaYyXmw4MXRGosbehibcNg5nSY8FRhxvYox9AUnnRAy/kTuAxf0rBAzzHLBT5xyYJKzcSPLFNK2qc0=
X-Received: by 2002:a2e:8988:: with SMTP id c8mr16429243lji.99.1557961803496;
 Wed, 15 May 2019 16:10:03 -0700 (PDT)
MIME-Version: 1.0
References: <78cf484c4d991e899d0065b2dab3a2e204ce8723.1557879499.git.alistair.francis@wdc.com>
 <87tvdvn9qw.fsf@zen.linaroharston>
In-Reply-To: <87tvdvn9qw.fsf@zen.linaroharston>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 15 May 2019 16:07:47 -0700
Message-ID: <CAKmqyKPT5yCO7+pQ+ijUSDP33-_sRwv3D217gqATnmeC5WHTvQ@mail.gmail.com>
Subject: Re: [Qemu-arm] [PATCH v2 1/1] target/arm: Fix vector operation segfault
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>, Alistair Francis <Alistair.Francis@wdc.com>, 
	"richard.henderson@linaro.org" <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: qq4Z6sZ6nNh9

On Wed, May 15, 2019 at 6:11 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>
>
> Alistair Francis <Alistair.Francis@wdc.com> writes:
>
> > Commit 89e68b575 "target/arm: Use vector operations for saturation"
> > causes this abort() when booting QEMU ARM with a Cortex-A15:
>
> You may want to check your email settings because when I tried to apply
> this patch it failed because the message is base64 encoded which choked g=
it-am:
>
>   Content-Type: text/plain; charset=3D"utf-8"
>   Content-Transfer-Encoding: base64

Yeah, it does look strange. I'll look into it, thanks for pointing it out.

Alistair

>
> --
> Alex Benn=C3=A9e
