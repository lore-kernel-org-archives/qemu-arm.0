Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp3148725njc;
        Tue, 5 Nov 2024 14:25:53 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX/gA7U8W8nsSN3JyjarXUrQb6xV6OwaSMpF4oFT+ZaYzIZc04fVRGOwbquyhmrl73R3dzUSgZGzF9UvA==@linaro.org
X-Google-Smtp-Source: AGHT+IFijl9hkgvjCNud2e5q1XxikrpbUPhy5NnU15Al6TJPxqh5QizEaOuU3CLjq/MPm3CwUqTB
X-Received: by 2002:a05:6902:702:b0:e29:699:3ca5 with SMTP id 3f1490d57ef6-e330256823amr15095200276.22.1730845552815;
        Tue, 05 Nov 2024 14:25:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730845552; cv=none;
        d=google.com; s=arc-20240605;
        b=ABem4rfhrZI9GshWz2zMwdTeVqrJWPcvxlp76Yop+SuF+VRXRANSqDXP8T3Zid3huj
         snyfTU7YWeo61p9BRVMKP+NX4x4Y+K6qaJ2K45USIrtCvMdz1FAjHPYMRJTB10wwX/lu
         eVf3ok9u7r6T+mzqe7eRdDlQHj6Oq2Glv7JJb/VoCZSvgJwzmWd5NTnD9EBCH5Dwlquo
         V9l78HoEAqhnT0VFDx1SnyHjlUNUxruwIoQAnOkqVr3RCuvIb8+LHZBXF/QrB0lGZKcg
         8J+4fa7mmhzizJx7gcgoYH26r8hhChUGx8i1UpnzhoxR1vjMbsjHbNrlpNyvE2rREXX7
         vxEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=rHggrVLdK90aIRJ3MiUpg0/17iirYyZWzPNt0PsNzC4=;
        fh=+Ge9RE8O14kIGVAw3c6nvvBinENHHm5745+bw4Mfkxs=;
        b=dh/4ugVQDPN1XZjPx/TOHE9NFfDCbvm1IDPsIze3WH0Wj5X2/4uHrqYnNZ+pwvKkUv
         iixsRXbjWXU+byciOwAuul5dB8q4AtwtGSc5GVmz2ANXRa69RjWAi2UIqfO+Ma8X4Kye
         NvBx2pKpfQ2HXkL3vO9AnqCs8i9jumAgZ8/zKPtc+fxDZammT9hvgIkyRRyba+FNvFTe
         fXa02sgql1tqqXhcgU2Ts1tAwrjGFPrLNMMpzVm1gCXRikTgXFVY5pXONDVoYmjJuM04
         FzMzeJx2rPWY8DAXSEXYY1rC7yzyJHKz6gGM8F+z6DWHI6EPSsLOAFKN4x8ofSLieamT
         GOIQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=Rb9OX6ZF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-462ad0b2596si163200901cf.105.2024.11.05.14.25.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Nov 2024 14:25:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=Rb9OX6ZF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1t8Rzb-0003G9-U6; Tue, 05 Nov 2024 17:25:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1t8RzZ-0003Fd-2U; Tue, 05 Nov 2024 17:25:41 -0500
Received: from mail-ua1-x936.google.com ([2607:f8b0:4864:20::936])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1t8RzX-0000KZ-KD; Tue, 05 Nov 2024 17:25:40 -0500
Received: by mail-ua1-x936.google.com with SMTP id
 a1e0cc1a2514c-84fe1bc5284so2276471241.0; 
 Tue, 05 Nov 2024 14:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730845538; x=1731450338; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rHggrVLdK90aIRJ3MiUpg0/17iirYyZWzPNt0PsNzC4=;
 b=Rb9OX6ZFj2qiU4eGKScGlfonTp16aXpc4dnTR+PujHNZ3QyMEvyF7ZqOGBeKB4Zl1X
 nZGHlDje7kaYiDZ6AmziIeafhBVHyoRcFXjJ0oe5r7KW/KvMp4o2qjMoVlxJLepV7emZ
 uqjFBzF50YiMoqk85mlewf4htRpppMpdIUYQuKwwfPerJnHJTBdhTgiFQEDtOa3+pzRp
 n9dHBNZwBqiQm68KzuxVUEcYpiL4WBSwqU5/R+QJwerKcYHM+uIrPvjQ2StiPvrY8THY
 AmEjYJypFjC/zB27+S/p1pEzzT79T1OuISc/buJAWFi1qY2DaZ/60WPO7Xmlte+MHTij
 xbzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730845538; x=1731450338;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rHggrVLdK90aIRJ3MiUpg0/17iirYyZWzPNt0PsNzC4=;
 b=YR4KzCyLkfzLHf8qbmiTG1Xf1phTc2zXx7imTNyXT/GCWvlWdsB8Y/FHxW1y4OpS0S
 LKze55AOzhZ6/lzK38evn5O+BtPUYFq+OMK/SB++47qzaXdHjrGJtHIi67hGxJKNYLsa
 HOE08zr3tAhudIrd9gFqSJeuTmvAL0Qu6CZ2wpknbYdANG9uTWmpFG07kPQKh5z3GAIZ
 m3nePSYeSSa0svT9V1LZKo/2Y76ZCJrCUIfiv7jB6eGaNuKFsERklh+zQ3KQvui/K1mg
 WQ62f4gpeXZ7EHSxtdDqx79k4rjKD2+Xv2RGl4RtJ2mX18Wrq0f45X1SoqqWbn+/SJtl
 Oxtw==
X-Forwarded-Encrypted: i=1;
 AJvYcCURouHXM6gEtLobveH6P9L+fpLKnU1Y9RqKMtZV4d2KnKXoP/kbHlnynB9bVjp68sKiRRABYt+l6g==@nongnu.org
X-Gm-Message-State: AOJu0YwDHVGMC2bTYHyzE5du+lrrVaxFZdXnohrUISvTQCFDrjjXuAd4
 LcSdL21m7vO7xtFPJbEyMgmZgLLxCmV6Dty4hYLKUZbiLjlDdOqdcOgLCA2VfilnErDauMu5RiQ
 c9HFn9tJQwcLfRB1d0nFXn4TFrBI=
X-Received: by 2002:a05:6102:3909:b0:4a5:c74b:66a7 with SMTP id
 ada2fe7eead31-4a962f3bd39mr16750535137.19.1730845537820; Tue, 05 Nov 2024
 14:25:37 -0800 (PST)
MIME-Version: 1.0
References: <20241105130431.22564-1-philmd@linaro.org>
 <20241105130431.22564-12-philmd@linaro.org>
In-Reply-To: <20241105130431.22564-12-philmd@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 6 Nov 2024 08:25:11 +1000
Message-ID: <CAKmqyKNrr0g6a1yA33TdvYkJFJdNSKP7nNhhb3H5pQtpPHc=_A@mail.gmail.com>
Subject: Re: [PATCH 11/19] hw/timer/xilinx_timer: Allow down to 8-bit memory
 access
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Anton Johansson <anjo@rev.ng>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Alistair Francis <alistair@alistair23.me>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, devel@lists.libvirt.org,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowang@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::936;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x936.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: nBxr0PZbi0aa

On Tue, Nov 5, 2024 at 11:07=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> Allow down to 8-bit access, per the datasheet (reference added
> in previous commit):
>
>  "Timer Counter registers are accessed as one of the following types:
>   =E2=80=A2 Byte (8 bits)
>   =E2=80=A2 Half word (2 bytes)
>   =E2=80=A2 Word (4 bytes)"
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/timer/xilinx_timer.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/timer/xilinx_timer.c b/hw/timer/xilinx_timer.c
> index 3e272c8bb39..e9498fc7eec 100644
> --- a/hw/timer/xilinx_timer.c
> +++ b/hw/timer/xilinx_timer.c
> @@ -201,7 +201,7 @@ static const MemoryRegionOps timer_ops =3D {
>          .max_access_size =3D 4,
>      },
>      .valid =3D {
> -        .min_access_size =3D 4,
> +        .min_access_size =3D 1,
>          .max_access_size =3D 4,
>      },
>  };
> --
> 2.45.2
>
>
