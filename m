Received: by 2002:a17:504:4644:b0:1be9:327d:8ee3 with SMTP id d4csp1013766njg;
        Wed, 26 Feb 2025 08:17:38 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXVLtT/3lCCl5InYqqlYwP/MrzvFgKEiLtGHch+WrWiKJpJxfFNPsGsILua9iAprjLEyC+ym2r6zPSITQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHnsm9hXffGNE0F4JAvAS+Aau6Bxl1drXHOOsjiTHIQel+jgFl/HIISnavoIdMVJM6gC+fX
X-Received: by 2002:ac8:5f8a:0:b0:472:7a2:c3d9 with SMTP id d75a77b69052e-47377227edfmr127287351cf.23.1740586658435;
        Wed, 26 Feb 2025 08:17:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740586658; cv=none;
        d=google.com; s=arc-20240605;
        b=e7cYWhcKkMV1m7WH3pexfGR04mg597EqKY+bTWjxWPIFv7E1OjGFRRIBIo58YWYTdk
         6Z2T0Qjtn3vnaprnL29fzpeyELjAezlLj4ocmwV1ebeq0cNMqW3FyXc1EbCQN9vnx3mh
         4+1+KKDmc0QEGRfLvk7oRHzIgsWZHUCCC2wK5KHiK9GC4g8v5EuJviDPUQUga5/Hvren
         we1D/S7xIVthN9JtP9jAnQHUSHaP+aUoZvfDs3Ibu4N6Yk7NFd9C2XIHSe+4xhST8UL9
         7jTS/PLjXwpKP1skIvIKbsUgoNKJMQBlIZfLCTK8Glh7+i2ZH97FLmhMZfw5CGVgewwm
         xu7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Rfd8ez1be281m0pXL4wTzICVX5fPl02NDM2agZxbJKM=;
        fh=IvQOqQSHdWNMuxLN1U+a5c9JPlqPkBVnF7bIwKXZVN8=;
        b=ePmWswNGBI+aw/85rZ0XvdvzYQZe+caaDa6vHjf/Xk47AoOs5HAkpNjgAbDOczgLqR
         L8Yy62L0jR2bqmhXCoPxx2D7lTo1J5o/rEhWwHcFqoO4JFkwiFbbzMQxushfA6+MyciH
         8v8TutvEZchcH0p7ym1xwUN1pF7k2tEhIplMHDaZZpQmAzLc9h30d5ZEKPs3OYy3KSJl
         c3x9Hj2vK39vd97Sl8h5TROoOWTiSIN5HC/7UPl5GKC6dHfqev8AaO0fSXFD7tTflqL/
         D6R65IHbT0Oyg2jwfR5Lc8gTs+IJsyTh53emlijism3LDAlq8BBWars8fYB2OeaDYVJD
         pC0w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="MG//cePc";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47378095390si40071291cf.366.2025.02.26.08.17.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Feb 2025 08:17:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="MG//cePc";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tnK68-0006iC-E2; Wed, 26 Feb 2025 11:17:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1tnK5R-0006HS-6K
 for qemu-arm@nongnu.org; Wed, 26 Feb 2025 11:16:52 -0500
Received: from mail-ua1-x933.google.com ([2607:f8b0:4864:20::933])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1tnK5P-000834-Eq
 for qemu-arm@nongnu.org; Wed, 26 Feb 2025 11:16:40 -0500
Received: by mail-ua1-x933.google.com with SMTP id
 a1e0cc1a2514c-86112ab1ad4so1994025241.1
 for <qemu-arm@nongnu.org>; Wed, 26 Feb 2025 08:16:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1740586597; x=1741191397; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Rfd8ez1be281m0pXL4wTzICVX5fPl02NDM2agZxbJKM=;
 b=MG//cePcg7nL1AdG5hYu9C02HvMv7hCicAesWmNCdQpmXi4tOhXlwKAF+XDqL49v1E
 hsOM+ylB6bc1VGJ9kqxybSa8rEjmWOar9nzBIbDFs56PY0PBkbzHBpbJJGS4ye4j3Q9r
 sOQcSIA1ePHvvZqtEonLNCWJQciH5x3nm/woU5YFurCzTTDVoM5X/Syfpk/QwSgcDYmQ
 ZckayEWdEEESlkvxygEf6gwmBSHFKf+CPXuFtMyJHmsoa6cNNTJzdT2Cr84OBJVyAeby
 /wQP0BPiCzvS0CcmpqZGyQ8dm4Z6Yh7GkG9ngkkXw3IkwI+wn5CTlz6iWvfy5Unpu77B
 oZ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740586597; x=1741191397;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Rfd8ez1be281m0pXL4wTzICVX5fPl02NDM2agZxbJKM=;
 b=ToqgJJB5iv9nx37t/kQrya6FZWQHXx+nPomGD5pz4KNfZ9wc8GLJ/PMIHhJJARGwuV
 mYtZCZnp9AA10na8bN3gtPIVr5aJj8ougF4Z1/9Dp/ug3H+zecDOKV6W2aUpnU0qyVr8
 /DgiIqkD114uhNJVa1qcF8UeXB56CGxkz1Dcfxy4b0ETNBV6hkgJ9PGv9ESBwvnq32hQ
 fdEh/M9ITiMa6rgwl1n6PrzGu5BYrlq9/X5b+iHCtpHWWZqVJLQRv/HkYjQ41eA7cGLA
 0HmK/crmyrNR5gFaoGxrMvPqcOnVFtbDjI+DuwbyfdpXyrslSD2fhoSS1cbbAzpoNcVd
 LXTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWIWuRB2zKAa5ky5dPudmz8oayN6qd0H0DjKFshVg18llRH9DogG8RSKWwxtS5DI2D2sx/EruZaRw==@nongnu.org
X-Gm-Message-State: AOJu0Yz0ofk9wjtEYrU//Vew58JQ9DUUwS4djuaDzymFGJHD/9c6RBWX
 W579c4w6PEZ+IjFSG634oXfi9H57erg6BPKW8aG+RpbzLXCDhZtqJrvvL4N88/x0GDyTEUapsYc
 GVv/cUJUfFfidlk9hDg9XTHiWCpttPvqz0v48
X-Gm-Gg: ASbGnctjq4j1yPXA70VZojK6pKRR9DpurTN6n7vMBt540mp0rwCTiSHFNfd0kLfLWHC
 MaFyv0UbUeLU5VtoE0lA3iiFZOzGC6SxdxliksaUt3NAP/CtvjXghk/FrH+s+vilOrLoVXIlNQU
 4y6FSYT0XhKmOyLksw48J5Xx+HcPm/D5iuOtVufw==
X-Received: by 2002:a05:6102:290c:b0:4bb:ecb9:b34d with SMTP id
 ada2fe7eead31-4c00ae577ccmr4852728137.18.1740586596984; Wed, 26 Feb 2025
 08:16:36 -0800 (PST)
MIME-Version: 1.0
References: <20250226024603.493148-1-venture@google.com>
 <f4b1dfc6-5265-400b-8842-349668c8e972@linaro.org>
In-Reply-To: <f4b1dfc6-5265-400b-8842-349668c8e972@linaro.org>
From: Patrick Venture <venture@google.com>
Date: Wed, 26 Feb 2025 08:16:25 -0800
X-Gm-Features: AQ5f1JoZdt_B4TYWgbuiZqSvXwVfKomIu2XSllZ52u2dg_6mWC3lJW3JqxhxPgc
Message-ID: <CAO=notzbY3wR+=gKeCS70ZpMAzhPZ-M4MHTF0MBP-GKMWXf_UQ@mail.gmail.com>
Subject: Re: [PATCH] hw/gpio: npcm7xx: fixup out-of-bounds access
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 kfting@nuvoton.com, wuhaotsh@google.com
Content-Type: multipart/alternative; boundary="000000000000d10ccb062f0de537"
Received-SPF: pass client-ip=2607:f8b0:4864:20::933;
 envelope-from=venture@google.com; helo=mail-ua1-x933.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: 55IkPMmp7bjh

--000000000000d10ccb062f0de537
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 25, 2025 at 11:04=E2=80=AFPM Philippe Mathieu-Daud=C3=A9 <philm=
d@linaro.org>
wrote:

> On 26/2/25 03:46, Patrick Venture wrote:
> > The reg isn't validated to be a possible register before
> > it's dereferenced for one case.  The mmio space registered
> > for the gpio device is 4KiB but there aren't that many
> > registers in the struct.
> >
> > Google-Bug-Id: 397469048
> > Change-Id: I2fb8d0d3d41422baab22e8fc7e9fadd0f2ee7068
>
> ^ Both lines are irrelevant on mainstream git history, otherwise:
>

Thanks, sorry, I was in a hurry last night to send this out and forgot to
strip them.


>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>
> Cc: qemu-stable@nongnu.org
> Fixes: 526dbbe0874 ("hw/gpio: Add GPIO model for Nuvoton NPCM7xx")
>
> > Signed-off-by: Patrick Venture <venture@google.com>
> > ---
> >   hw/gpio/npcm7xx_gpio.c | 3 +--
> >   1 file changed, 1 insertion(+), 2 deletions(-)
>
>

--000000000000d10ccb062f0de537
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 25,=
 2025 at 11:04=E2=80=AFPM Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto=
:philmd@linaro.org">philmd@linaro.org</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">On 26/2/25 03:46, Patrick Venture wrot=
e:<br>
&gt; The reg isn&#39;t validated to be a possible register before<br>
&gt; it&#39;s dereferenced for one case.=C2=A0 The mmio space registered<br=
>
&gt; for the gpio device is 4KiB but there aren&#39;t that many<br>
&gt; registers in the struct.<br>
&gt; <br>
&gt; Google-Bug-Id: 397469048<br>
&gt; Change-Id: I2fb8d0d3d41422baab22e8fc7e9fadd0f2ee7068<br>
<br>
^ Both lines are irrelevant on mainstream git history, otherwise:<br></bloc=
kquote><div><br></div><div>Thanks, sorry, I was in a hurry last night to se=
nd this out and forgot to strip them.</div><div>=C2=A0</div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">
<br>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@linar=
o.org" target=3D"_blank">philmd@linaro.org</a>&gt;<br>
<br>
Cc: <a href=3D"mailto:qemu-stable@nongnu.org" target=3D"_blank">qemu-stable=
@nongnu.org</a><br>
Fixes: 526dbbe0874 (&quot;hw/gpio: Add GPIO model for Nuvoton NPCM7xx&quot;=
)<br>
<br>
&gt; Signed-off-by: Patrick Venture &lt;<a href=3D"mailto:venture@google.co=
m" target=3D"_blank">venture@google.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0hw/gpio/npcm7xx_gpio.c | 3 +--<br>
&gt;=C2=A0 =C2=A01 file changed, 1 insertion(+), 2 deletions(-)<br>
<br>
</blockquote></div></div>

--000000000000d10ccb062f0de537--
