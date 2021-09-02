Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp613718lfb;
        Thu, 2 Sep 2021 13:11:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxJqzPXz3et9agFE1K0KbkS89hqOobq6L/XGwFMbt0NfFmnQus2po3RClkcFm898dGbenWQ
X-Received: by 2002:a67:b005:: with SMTP id z5mr3265378vse.13.1630613490511;
        Thu, 02 Sep 2021 13:11:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630613490; cv=none;
        d=google.com; s=arc-20160816;
        b=no1vJc2+IrC1P+GuPtfIwoYTxQadY0pICEce8WAXRWOIt156oFaG7xJiBTfrq8ohT8
         f1JqCtCWvMGhNe9sWGaQjt31M4t6E21HbAVVprq3kwVHzjI/oKSactCOw1LjnK7Yb9OR
         lxhtIqjzqTiqJuTWn7yT31Xn6x5YB+5au24DKLXR/oPTikG7H4Plpxr4RvtwMNGxSXvy
         iAq7qw0heNSdlUO0deS8aFQjXjBWidVzBCP3baGWxqbfR1Z0ZKvZVyTZ4M2Z7yjfafEH
         JL+3p2waQbujEFHpIhzVKz8sK/2oHCpdaR5T+Z5TMLq5k0npeznYVKMPHUW9Dw8wvmNU
         2ofg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fsnnJngU8FJKGJiteH3LQIa76mAdiGjGjhj3YdkLcB0=;
        b=WcEahqnlmB0YkovzDTLNtnO3m8oLJ0/tn6SNBPNyMqEqRtGgRacOOlANm3OuHHg3e+
         D6gVg/Sw3pkz41BrUDuHEQ3om2UrqiwpHtkroh8XVF4dv0Z1TmK8yzW/ufXU97KRRqcJ
         s+4e6eIsXrxsPbjnjHJSVHU/PylYFYCqdnsl4QsWsyWt4hlFjGj8iAKsKCyDpJi1YVoG
         GHcLF0+KXIJtcyCIroDDnLbsm0WORYXv9m5WTxofUvqeWxM3rRN9svYjNnKHq+ijCRl7
         x9Vc5Ig4vrJ55q6PTkLnK5P7IfLFzF1Em+JQEI3VXnb71oqpgglJUCEi9FLZwML4Y/9v
         buDg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@bsdimp-com.20150623.gappssmtp.com header.s=20150623 header.b=tMLGYsHR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u22si1327907uap.160.2021.09.02.13.11.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Sep 2021 13:11:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@bsdimp-com.20150623.gappssmtp.com header.s=20150623 header.b=tMLGYsHR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mLt3Z-00059n-ON
	for alex.bennee@linaro.org; Thu, 02 Sep 2021 16:11:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mLt3D-0004aI-7j
 for qemu-arm@nongnu.org; Thu, 02 Sep 2021 16:11:07 -0400
Received: from mail-vk1-xa2c.google.com ([2607:f8b0:4864:20::a2c]:42962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mLt3A-0001z3-7W
 for qemu-arm@nongnu.org; Thu, 02 Sep 2021 16:11:06 -0400
Received: by mail-vk1-xa2c.google.com with SMTP id bb10so1038813vkb.9
 for <qemu-arm@nongnu.org>; Thu, 02 Sep 2021 13:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fsnnJngU8FJKGJiteH3LQIa76mAdiGjGjhj3YdkLcB0=;
 b=tMLGYsHRCqlvyuZ9xdquTci31FXqNIL406Qq5pyI23fQN6YS89FgGbIV/6QW0vPpB9
 kkXVmYD0su2o7/LbC7cLNCqa/Zl2ojZjd0v0PcpUmrVN961W40KU5IQGVEdFpU3+/k0b
 qPtXXadbHY6dN6GaqYKuLGURJj9a6dj0SZTW8qErTr2xlyfLDdwhSpkBXYVvhaK++Z75
 Wn1gzZUjoqhc3jmFNNB3Q+WVCWcOzbTgmvqgU+oa9oSEQBdxEVzBU2f4jlgUP5YHC0w4
 GhnBVTMELgDmlVKs4FQHA1b1F0t01SunCn2vkCnuGBuULQsuycT+pQwLUJtI4soqv7BE
 tuOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fsnnJngU8FJKGJiteH3LQIa76mAdiGjGjhj3YdkLcB0=;
 b=pcEPNKBVLZq8wzvUdCp7vdGyXK+26J65CQJnVGoKBn8k9tOuxszQK0yqXaCE2GJA45
 BfQOtQ2BhySCVa7WDA1GiFT0yM/xFUHFf2chTf6BiKlxTVPKwI8EUhfgPTnh6gI/sY97
 LHsvMUT1O6848AOC6sJZ/Pn2hecLbnejBnBetHVkYLoGXKUQO51pChBw7OyVMudgc/jf
 o0R4oksIQKbO02Tr69iO03i2m6kP+lmXOdvOzlWnbc+/CEnOOkSRyqX223Q1QsIzy3qk
 /6ycffFq0u8wXe42T6RWureErUElKUaVSN19sFLv/GbydnFz9Wsnr5oc3w7sJAzdnvVT
 Zh+Q==
X-Gm-Message-State: AOAM533ManohV6anLu5r/gfXzj3E6uhevpWLgVGKtsUgjzgR4DuYRQ+4
 oRGhFj/4IjAGcEwNXe2wkJ4YDyx/FVak6GWjFLWxmQ==
X-Received: by 2002:a1f:294:: with SMTP id 142mr67784vkc.6.1630613462724; Thu,
 02 Sep 2021 13:11:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210902151715.383678-1-f4bug@amsat.org>
 <20210902151715.383678-4-f4bug@amsat.org>
In-Reply-To: <20210902151715.383678-4-f4bug@amsat.org>
From: Warner Losh <imp@bsdimp.com>
Date: Thu, 2 Sep 2021 14:10:51 -0600
Message-ID: <CANCZdfqmsEyj7S-b2P1jdVWjZg2mPS2mKGeBQ21=VFm2Ux=c2Q@mail.gmail.com>
Subject: Re: [PATCH 03/24] target/i386: Simplify TARGET_X86_64 #ifdef'ry
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="00000000000036482205cb08c819"
Received-SPF: none client-ip=2607:f8b0:4864:20::a2c;
 envelope-from=wlosh@bsdimp.com; helo=mail-vk1-xa2c.google.com
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 Marek Vasut <marex@denx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 qemu-ppc <qemu-ppc@nongnu.org>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-arm <qemu-arm@nongnu.org>, Michael Rolnik <mrolnik@gmail.com>,
 Stafford Horne <shorne@gmail.com>, David Gibson <david@gibson.dropbear.id.au>,
 qemu-riscv@nongnu.org, Chris Wulff <crwulff@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JnYYyrAxSubc

--00000000000036482205cb08c819
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 2, 2021 at 9:17 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
>
wrote:

> Merge two TARGET_X86_64 consecutive blocks.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  target/i386/tcg/seg_helper.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>

Reviewed-by: Warner Losh <imp@bsdimp.com>



>
> diff --git a/target/i386/tcg/seg_helper.c b/target/i386/tcg/seg_helper.c
> index 3ed20ca31d7..dee7bef68c6 100644
> --- a/target/i386/tcg/seg_helper.c
> +++ b/target/i386/tcg/seg_helper.c
> @@ -929,9 +929,7 @@ static void do_interrupt64(CPUX86State *env, int
> intno, int is_int,
>                     e2);
>      env->eip =3D offset;
>  }
> -#endif
>
> -#ifdef TARGET_X86_64
>  void helper_sysret(CPUX86State *env, int dflag)
>  {
>      int cpl, selector;
> @@ -984,7 +982,7 @@ void helper_sysret(CPUX86State *env, int dflag)
>                                 DESC_W_MASK | DESC_A_MASK);
>      }
>  }
> -#endif
> +#endif /* TARGET_X86_64 */
>
>  /* real mode interrupt */
>  static void do_interrupt_real(CPUX86State *env, int intno, int is_int,
> --
> 2.31.1
>
>

--00000000000036482205cb08c819
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 2, 2021 at 9:17 AM Philip=
pe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@amsat.or=
g</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>Merge two TARGET_X86_64 consecutive blocks.<br>
<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsa=
t.org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
---<br>
=C2=A0target/i386/tcg/seg_helper.c | 4 +---<br>
=C2=A01 file changed, 1 insertion(+), 3 deletions(-)<br></blockquote><div><=
br></div><div>Reviewed-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com=
" target=3D"_blank">imp@bsdimp.com</a>&gt;</div><div class=3D"gmail-yj6qo g=
mail-ajU" style=3D"outline:none;padding:10px 0px;width:22px;margin:2px 0px =
0px"><br class=3D"gmail-Apple-interchange-newline"></div><div>=C2=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
<br>
diff --git a/target/i386/tcg/seg_helper.c b/target/i386/tcg/seg_helper.c<br=
>
index 3ed20ca31d7..dee7bef68c6 100644<br>
--- a/target/i386/tcg/seg_helper.c<br>
+++ b/target/i386/tcg/seg_helper.c<br>
@@ -929,9 +929,7 @@ static void do_interrupt64(CPUX86State *env, int intno,=
 int is_int,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 e2);<=
br>
=C2=A0 =C2=A0 =C2=A0env-&gt;eip =3D offset;<br>
=C2=A0}<br>
-#endif<br>
<br>
-#ifdef TARGET_X86_64<br>
=C2=A0void helper_sysret(CPUX86State *env, int dflag)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0int cpl, selector;<br>
@@ -984,7 +982,7 @@ void helper_sysret(CPUX86State *env, int dflag)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DESC_W_MASK | DESC_A_MASK);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
-#endif<br>
+#endif /* TARGET_X86_64 */<br>
<br>
=C2=A0/* real mode interrupt */<br>
=C2=A0static void do_interrupt_real(CPUX86State *env, int intno, int is_int=
,<br>
-- <br>
2.31.1<br>
<br>
</blockquote></div></div>

--00000000000036482205cb08c819--
