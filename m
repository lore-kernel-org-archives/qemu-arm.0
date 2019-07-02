Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp3958618wru;
        Tue, 2 Jul 2019 09:05:47 -0700 (PDT)
X-Received: by 2002:a05:651c:92:: with SMTP id 18mr18343140ljq.35.1562083547042;
        Tue, 02 Jul 2019 09:05:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562083547; cv=none;
        d=google.com; s=arc-20160816;
        b=kRqdxIpWksmBHwtbJg0wjcJACx4xiBP7DGovvImPAgdPHqRNQiunBmnJ9XqWTNnaqh
         jd/ajWqXBCd7XFt9AZnF8b8yndK95yZ1mlJB+RDNXPFoL4bl2WiLAAravjfFpRkfgQYB
         HZRmRYu3Ns2ZTbM2kk20GAP+gs+1nOUCZ047jUePyvoquuJTroQbsMuLdmEXirUkRoa6
         stD9Xf5o5LEHobgMYj2XeOZNH3xc23YbQywF5a40cZ00zerrKd7+daNrDJhJsbYGWgKH
         yHnvJP40R4LLunA6WeTfI1LCXsT6riuvkqoNXyOy6fXtbZ2qZ6ALTmPch1O9tdvvq7dF
         CmtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MelK9/24wgEDxir8AlFJoXVIGm/gACqxwd68SwN6Unw=;
        b=Q2twZce0499trgCq225pYp/jcjt6YYyk5a7L/gJ9YsA9iDc93AqSeOl1j5jXSAUZFe
         7inWobtwmRP2UtgeI/kmgA5RQCx5zEyU2VeYhxeao3TXjadw0s/WxktHI0GSQwycgSJA
         5HUzOSHRXPuNvlcydK5rwYpoo1dYGa+R899zaRhICOtTWdX/Z0u+k7XAVGWffW4UmCQN
         wWN3xPsRCCwkDxzKx1ZKvqA+2sB00Q8kObJF8IoQg34mdt5k9A5ysc4klHLhkTyDpoJl
         s4Hj02kfOfGbaHNmnfjqKgLIssazdhHY+1ZgM87J/xwDhMfjAIV85LVQG2Gup/T1REfz
         /fIQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=UXLmdoFd;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <alistair23@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id 186sor3522114lfb.10.2019.07.02.09.05.46
        (Google Transport Security);
        Tue, 02 Jul 2019 09:05:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=UXLmdoFd;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=MelK9/24wgEDxir8AlFJoXVIGm/gACqxwd68SwN6Unw=;
        b=UXLmdoFdeFQOuGae+Klm8S09pNd/PGd3Fx4USmE8o8R1amXntyB7AFTo9h/9LZmMHJ
         IZ5GfynwjKI98kATLzMeYPoQLUvZKRYNAH0bmjvAfgCbVW/wZSWtZ1CMCh5ams5xaE3L
         yJuqa8Pzis8y8Kg5BdQaZvvQ8ILo7z30MFngQJWgJzMOKyhuLFOpa6j08K55SjO+TiuP
         jGH7m31cKOXkM/h2gRjgyfx40P0LpPRkJnCkGR8gdueeL7/lA6Kz0VGQ9cSyD3kiW42T
         J9Ux3BuILDg4FkmjujPsVwa+cAZneGx5ErfnvMB655x5ldctsIBI/4/KwYETDXqtWxEP
         Ybjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=MelK9/24wgEDxir8AlFJoXVIGm/gACqxwd68SwN6Unw=;
        b=fyO5yWaVTMOfRGU6f5yb9/R8PJgUz2Sms+FPqr9kriPzkglCBZC6n+JojKbpe9h/k4
         oHznYyLiEyPemllUwoZ92PunqPNemI0Ekc1B/TsWOmrPI1FiZ5R8qNxm/CRI+yPFEMAd
         KvV8f1aSE2Iu7sDJBPVNykCg4Jb4xuJ5rU5L3jE40HW5dopOSn0m4TZkKiwzY8P/vRsh
         IRnmKmIKc1WGjEQ4c0WYq1NM4Zhqdo+TYTFqcWIgdppsG64KFrBfA+um5uO0CJ2in+gp
         XHBJwXvPZnpzlOuuZs/TvZlCOhoB46cKaL+mopY1MzGpVnFOuhKx/X97KRFKq9mVOIRg
         55pA==
X-Gm-Message-State: APjAAAWLwNVDEeP/BySMrde95xIcO5F6R+MhKWGtMmJoNz34J2sq5wic
	BQQxRZqA1JA5+Stb66tLADZ0BDY14tnFaNqr3kk=
X-Google-Smtp-Source: APXvYqxcD7/ledexO5fqoAvjpv9rCd/E8M+qmxQM0/puQbPP2Z2AS4fjg8Qw5NjaP33oBiWzu/p5trcJflQg9sINne8=
X-Received: by 2002:a19:6a01:: with SMTP id u1mr211477lfu.141.1562083546622;
 Tue, 02 Jul 2019 09:05:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190702001301.4768-1-philmd@redhat.com> <20190702001301.4768-5-philmd@redhat.com>
In-Reply-To: <20190702001301.4768-5-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 2 Jul 2019 09:02:43 -0700
Message-ID: <CAKmqyKO-yYE5-bWnWLAvKA2ZAAiCkH9_WUNsS2GF0GhCMGzf9Q@mail.gmail.com>
Subject: Re: [PATCH v2 4/9] hw/block/pflash_cfi01: Start state machine as
 READY to accept commands
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>, 
	Laszlo Ersek <lersek@redhat.com>, David Gibson <david@gibson.dropbear.id.au>, 
	"open list:New World" <qemu-ppc@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>, 
	Max Filippov <jcmvbkbc@gmail.com>, John Snow <jsnow@redhat.com>, 
	Aleksandar Markovic <amarkovic@wavecomp.com>, Wei Yang <richardw.yang@linux.intel.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Aurelien Jarno <aurelien@aurel32.net>, BALATON Zoltan <balaton@eik.bme.hu>, 
	Markus Armbruster <armbru@redhat.com>, Andrzej Zaborowski <balrogg@gmail.com>, 
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Michael Walle <michael@walle.cc>, 
	Paolo Bonzini <pbonzini@redhat.com>, Max Reitz <mreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>, 
	Richard Henderson <rth@twiddle.net>, qemu-arm <qemu-arm@nongnu.org>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Qemu-block <qemu-block@nongnu.org>, 
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>, 
	Aleksandar Rikalo <arikalo@wavecomp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: K8c+S/s0FxwR

On Mon, Jul 1, 2019 at 5:14 PM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.c=
om> wrote:
>
> When the state machine is ready to accept command, the bit 7 of
> the status register (SR) is set to 1.
> The guest polls the status register and check this bit before
> writting command to the internal 'Write State Machine' (WSM).
>
> Set SR.7 bit to 1 when the device is created.
>
> Reference: Read Array Flowchart
>   "Common Flash Interface (CFI) and Command Sets"
>    (Intel Application Note 646)
>    Appendix B "Basic Command Set"
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/block/pflash_cfi01.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
> index 33c77f6569..dd1dfd266b 100644
> --- a/hw/block/pflash_cfi01.c
> +++ b/hw/block/pflash_cfi01.c
> @@ -764,7 +764,7 @@ static void pflash_cfi01_realize(DeviceState *dev, Er=
ror **errp)
>      }
>
>      pflash_mode_read_array(pfl);
> -    pfl->status =3D 0;
> +    pfl->status =3D 0x80; /* WSM ready */
>      /* Hardcoded CFI table */
>      /* Standard "QRY" string */
>      pfl->cfi_table[0x10] =3D 'Q';
> --
> 2.20.1
>
