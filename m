Received: by 2002:a17:906:9417:b0:98e:baa:bd63 with SMTP id q23csp334712ejx;
        Sat, 24 Jun 2023 20:38:01 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6b7LrkVkoqWJxn8W9IP8uwm3h963hX1RrF08FnN/tzNJy7sNKILoEXMadz6JxA68XIH0Dh
X-Received: by 2002:a05:6214:5195:b0:630:1b99:5c53 with SMTP id kl21-20020a056214519500b006301b995c53mr19893184qvb.9.1687664281178;
        Sat, 24 Jun 2023 20:38:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687664281; cv=none;
        d=google.com; s=arc-20160816;
        b=kwMaIkxfpatH+4LR02Qy1j5/4j2xlFuc1wb6Qa2MYnCYdZCFkOk1Gg/3gUankmnEje
         rjW5jPK4esp5hFDu5QbMMIsXTg3gia5/cuKpmmeigLzFbM8x4w67LJiJsIjmuroAVoi3
         r+DEzcz9gV0aC4vgkvz6KCo/dvW+qBk2zTfLyTgEnLpgA3kj0A6tybgglQNSaSXqrOWT
         DRQCoioJptvFqgOnZQ+9jbMt15FHAfzFixpB2WbHKK+rAu0AbLA5s23YLtZrL0SvgEy0
         5WejsK0PXRuHDE3LJ7t835+VQNs5PSNkyC+kPyAaf1euXUgCvynlGVsssMJAHINCP0fO
         94EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=7FozYAD3aRQmMOwHSSeMHzLrKnhT1EalMpVjn2MIhRI=;
        fh=/ZiA3UFzFZADWxYec0J5GWBlvoZq6v7R49CKNtX5R50=;
        b=Ds/BI7y/XGUIxWaogb1Ugx6q/niokwm6Fhb5DuWwaaQET0hhsrw6EjCWVFu7Q8j2kM
         kf68JxH8l1xTTkeSe+D6UynClbTlcQrVjSXstpZrTpLI6e+1WDEyL90RQLqvpolgh5EM
         LESoVeqNjgbuYSslTWwcbbCjVQaLGkJ6TtlqnkiCHFt4mwcjRpKVFo3G3eoNuxzicNba
         FMKTtjnjpkmt/FwXSwyfRNNsJRmLL4BPjzWJAk1DXRKegpPoCkkJQ0y/dmuyTDdqKThH
         +U9pGUuDGzl78bMvZ6593Co6PHanCflhVrmwLeVqeBs5otK7kbXXACL+B5KvvQZZlxJ4
         k8FA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@osdyne.com header.s=google header.b=RZWgW44h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r8-20020ad45768000000b006301ad42c47si1055301qvx.15.2023.06.24.20.38.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 24 Jun 2023 20:38:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@osdyne.com header.s=google header.b=RZWgW44h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qDGZK-0008DS-Qi; Sat, 24 Jun 2023 23:37:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas@osdyne.com>) id 1qDGZI-0008Ch-My
 for qemu-arm@nongnu.org; Sat, 24 Jun 2023 23:37:40 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lucas@osdyne.com>) id 1qDGZG-0003Up-T4
 for qemu-arm@nongnu.org; Sat, 24 Jun 2023 23:37:40 -0400
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-6748a616e17so65440b3a.1
 for <qemu-arm@nongnu.org>; Sat, 24 Jun 2023 20:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=osdyne.com; s=google; t=1687664257; x=1690256257;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7FozYAD3aRQmMOwHSSeMHzLrKnhT1EalMpVjn2MIhRI=;
 b=RZWgW44hOvIm6hLpvygl7krHADr2jBdA8rOxm16ZlRP/GQpWbIvaTOm+t/02XTrXht
 46CzIQIcGltKZ/Nl3WGAyWOheGY0GPRai9Y/ZCxA+ElZnFqB8VNQaXY1fh5ob39MemcR
 VwvmR9VkWSWo7WvX0zQRN7nDWN0DRZusrqjv/JBAZgiH9sASs6bvr/z7dmUvY6h8sZFl
 Rc/RYqlGOrQbtU3Lq0BXTFdxlQtDaznpVMz1M96/zhIVrYf+S1gPW7TPbwHpT45pBrtR
 aNd+tQKv+5/gsfnefBjTvpXAhtZbJSfZt+CdxcfrwRE7B4mZHEhxq/2yOlH1IV1G7yPa
 k/Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687664257; x=1690256257;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7FozYAD3aRQmMOwHSSeMHzLrKnhT1EalMpVjn2MIhRI=;
 b=hZtHQIxPbrrPAzpnnrw2FCuhgNStwJvM4vfPZONnFYr1XcPZLLYTqSz0Wm6vXkocaB
 eChqJsHCQmAtlttp8rvz/n7FfBaCRkUV0RqSdWmjv3xsfpcpc9JAKW6tR66KknTAKtWy
 r3aH22MzPT0p9cC2mh//UxdHr63fnQouatfx8yJchO+vfffuU/v+Jjv5GqnZU24cMxNf
 JvMRmYVu/Pc7rFwlWIX5aPewHn0dd8NvvehSDm/1G5GCFU774SYPH9MxUcTrldmop/FN
 +qL2qf0McickC0sz+jXz7DuNzayg29S0Twu9R+xNCv4wy2fEqdCPceWsQjxYuLUYMGxk
 al/g==
X-Gm-Message-State: AC+VfDzA82XS8fjF2h3TOTfvJyqlJoSUWfLhASumvvg2iY+10zgqAkMI
 S9fV//pObgHwgUFuCIL4OQcsyjcL6IvFTHN8wWbbzA==
X-Received: by 2002:a17:90a:6bc2:b0:262:dc59:ee64 with SMTP id
 w60-20020a17090a6bc200b00262dc59ee64mr2049617pjj.4.1687664256975; Sat, 24 Jun
 2023 20:37:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230619221819.6882-1-lucas@osdyne.com>
 <20230620194317.45772-1-lucas@osdyne.com>
 <CAKmqyKM1T6n3pKQV3ZuxDTHXurOOLE4W_33mk8cc9hM3cuGNpA@mail.gmail.com>
In-Reply-To: <CAKmqyKM1T6n3pKQV3ZuxDTHXurOOLE4W_33mk8cc9hM3cuGNpA@mail.gmail.com>
From: "Lucas C. Villa Real" <lucas@osdyne.com>
Date: Sun, 25 Jun 2023 00:37:25 -0300
Message-ID: <CAL+Dfo5=Zg=zvCZjTMTeU0L5kHfju8t9arOs6avURWvLYq=WFA@mail.gmail.com>
Subject: Re: [PATCH] STM32F100: add support for external memory via FSMC
To: Alistair Francis <alistair23@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, erdnaxe@crans.org, 
 "Lucas C . Villa Real" <lucas@odsyne.com>
Content-Type: multipart/alternative; boundary="0000000000008997e705feebf421"
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=lucas@osdyne.com; helo=mail-pf1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: qCryGs2APIMx

--0000000000008997e705feebf421
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 22, 2023 at 10:37=E2=80=AFPM Alistair Francis <alistair23@gmail=
.com>
wrote:

> On Wed, Jun 21, 2023 at 5:44=E2=80=AFAM Lucas Villa Real <lucas@osdyne.co=
m> wrote:
> >
> > Add support for FSMC on high-density STM32F100 devices and enable
> > mapping of additional memory via the `-m SIZE` command-line option.
> > FSMC Bank1 can address up to 4x64MB of PSRAM memory at 0x60000000.
>
> Thanks for the patches!
>

You're welcome!


> >
> > RCC is needed to enable peripheral clock for FSMC; this commit
> > implements support for RCC through the MMIO interface.
>
> This should be a separate commit. The idea is to break commits up as
> small as possible and send a patch series, this makes review much
> easier. Each new feature should be its own commit.
>

Thanks, I'll submit a new patchset as recommended.


> >
> > Last, high-density devices support up to 32KB of static SRAM, so
> > adjust SRAM_SIZE accordingly.
>
> Also, can you include a link to the documentation in the commit message?
>

Absolutely.


> > +static const MemoryRegionOps stm32f100_rcc_ops =3D {
> > +    .read =3D stm32f100_rcc_read,
> > +    .write =3D stm32f100_rcc_write,
> > +    .endianness =3D DEVICE_NATIVE_ENDIAN,
> > +};
>
> This should be its own file and device that is included
>

Sounds good, thanks for the guidance. I'll work on this next week.

Best regards,
Lucas

--0000000000008997e705feebf421
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, Jun 22, 2023 at 10:37=E2=80=AFPM =
Alistair Francis &lt;<a href=3D"mailto:alistair23@gmail.com">alistair23@gma=
il.com</a>&gt; wrote:</div><div class=3D"gmail_quote"><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">On Wed, Jun 21, 2023 at 5:44=E2=80=AFAM Lucas =
Villa Real &lt;<a href=3D"mailto:lucas@osdyne.com" target=3D"_blank">lucas@=
osdyne.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Add support for FSMC on high-density STM32F100 devices and enable<br>
&gt; mapping of additional memory via the `-m SIZE` command-line option.<br=
>
&gt; FSMC Bank1 can address up to 4x64MB of PSRAM memory at 0x60000000.<br>
<br>
Thanks for the patches!<br></blockquote><div><br></div><div>You&#39;re welc=
ome!<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">
&gt;<br>
&gt; RCC is needed to enable peripheral clock for FSMC; this commit<br>
&gt; implements support for RCC through the MMIO interface.<br>
<br>
This should be a separate commit. The idea is to break commits up as<br>
small as possible and send a patch series, this makes review much<br>
easier. Each new feature should be its own commit.<br></blockquote><div>=C2=
=A0</div><div>Thanks, I&#39;ll submit a new patchset as recommended.<br></d=
iv><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt;<br>
&gt; Last, high-density devices support up to 32KB of static SRAM, so<br>
&gt; adjust SRAM_SIZE accordingly.<br>
<br>
Also, can you include a link to the documentation in the commit message?<br=
></blockquote><div><br></div><div>Absolutely.<br></div><div>=C2=A0<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; +static const MemoryRegionOps stm32f100_rcc_ops =3D {<br>
&gt; +=C2=A0 =C2=A0 .read =3D stm32f100_rcc_read,<br>
&gt; +=C2=A0 =C2=A0 .write =3D stm32f100_rcc_write,<br>
&gt; +=C2=A0 =C2=A0 .endianness =3D DEVICE_NATIVE_ENDIAN,<br>
&gt; +};<br>
<br>
This should be its own file and device that is included<br></blockquote><di=
v>=C2=A0</div><div>Sounds good, thanks for the guidance. I&#39;ll work on t=
his next week.<br></div></div><div class=3D"gmail_quote"><br></div><div cla=
ss=3D"gmail_quote">Best regards,<br></div><div class=3D"gmail_quote">Lucas<=
br></div></div>

--0000000000008997e705feebf421--
