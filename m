Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp622042lfb;
        Thu, 2 Sep 2021 13:23:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzqHveRcs3Or0/Njl0VsK1idewyW8dCvgABqWOcXNYY/Ar3LvyJqu/GKlxl/q3sm586de8q
X-Received: by 2002:a05:6e02:1d1a:: with SMTP id i26mr14547ila.96.1630614182472;
        Thu, 02 Sep 2021 13:23:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630614182; cv=none;
        d=google.com; s=arc-20160816;
        b=rFkHq4lsvA4da4R+jRliq7hWl1NkRZ4uct/v5rTfg0Mff+uK6YxnkDOMWJLw7RWQMw
         g49c42UZc1JjRTblM8niTR9cXFqUMy9hv0/39z9UcOBblAxqcSS1FTORIHEeroKcF+AW
         4fq404U1/YqJKDLHxo3eRVZG6Mq7SOm9fwtrVzSIqNH00rG/FNfBXOADbhlaPNjXwP+/
         xMaACnEpvSiGVpLijhbKQM0W/PdrRwOUoz1N3UHT7u73HNHOWaxCDhkqGC1yCUvqM+fy
         5n7qJ3Tg06Jzyb+5p/2zTIYEjl5Nqc2PSRUsga20RlTP4b3ouDJ3Qi7WdAP5SovtRA57
         lD7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cCBveFy44EvN8Y+suw+PSl0yG/3v9JpIzr+j/jfrU2M=;
        b=RS5IXAK4xTWHgDXIGr2SVejpsoPjyB7V+ZgNvCwOTtDJ57nZjtj1OCt5hbJscNFOYg
         wRXGvtYw5R8bzm5hj24HURn+T4AM1kT6AfxMl1NIltG+yghPjbLkXf1SRtvlCaNp3blj
         MrD55HZeRjxNmPUTV/J3gBXb0jo/cYRbYoC9d0IH8KU0liUaRgrA0stTCvDSe0gfQdo0
         NOV8FV+9fNn400Md3GIRdKVBVkvQeN70yd2Qo+eVWRWsJbd0IEhdL7lHF3Xw5gOH9/NU
         EkX1izHVbiBEcDhuGJxcP/MmG4slnmKUMTIM7FrWrYXxDeCQmiCmIzn6L5SbtJ9vNr8Z
         iTXw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@bsdimp-com.20150623.gappssmtp.com header.s=20150623 header.b=arvYgetv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i12si3617701ilu.9.2021.09.02.13.23.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Sep 2021 13:23:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@bsdimp-com.20150623.gappssmtp.com header.s=20150623 header.b=arvYgetv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mLtEj-0007ik-NR
	for alex.bennee@linaro.org; Thu, 02 Sep 2021 16:23:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mLtEO-0007fS-BY
 for qemu-arm@nongnu.org; Thu, 02 Sep 2021 16:22:40 -0400
Received: from mail-ua1-x92f.google.com ([2607:f8b0:4864:20::92f]:44745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mLtEM-0003ah-Dm
 for qemu-arm@nongnu.org; Thu, 02 Sep 2021 16:22:39 -0400
Received: by mail-ua1-x92f.google.com with SMTP id x6so1571622uai.11
 for <qemu-arm@nongnu.org>; Thu, 02 Sep 2021 13:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cCBveFy44EvN8Y+suw+PSl0yG/3v9JpIzr+j/jfrU2M=;
 b=arvYgetv+GMbeeP+zczZjyDFEJU9iDLbMV+apowXv1huVUkgC5nOjCyvwmy8xIDP2k
 wwd/BPlBGYhn7j/ppiVy6hQ9jyKWuB1H2SwoDN4n1X0ticpGnMFi8HHYrjtYkMz7tu8C
 hSs7L3Bb4kj12/sXLD/+DC6aJFxo/UtvJg3PARsyUchRQQYNnWIcga7RNgAjJO+DLDgo
 0jW/IMR2EdEsjlKMCW50LB5NzmRNGqnJeHU3X0scHf02oM7o0Lold269hpEvImqMGUVC
 UX1aMjWY6Q3MAbjR05nqkR7glyTtRvVvJ6Ig3z3FliImRqfun1L8VqIbzGVX9LGmWQ6f
 /iZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cCBveFy44EvN8Y+suw+PSl0yG/3v9JpIzr+j/jfrU2M=;
 b=gVJ+b7Vw6Unjg8W7q400QJ10JxJ8a8cWh+c3YMQXMbxo9y6LAPFYWL+KTcJ71hiNJZ
 kLDzGqm8l5tFjEvnhn4wKM5geWuRkALy3PPquLcbHNNc9WhQaZijKhx0m+vIKlHzgg4Z
 VZD2kPOkfJVGHzIv1Cc7kN02t3DMqr9GFpjoD6cAMUNYF3KxWa0XunnCRxbB5ZAy7gfx
 05tf+6xdytuA0bXxaMd1SDxN5/u9Jsm59V87YyPT9cHHqqmVvdbKY/UysowV5LDuQouC
 3JqS2EhqgNa8AOVT1q8/Slb/9MvF5dDB+SvJGtyk1tGGjZnVkTDo/yjNkEBN7WCRPcyK
 sapw==
X-Gm-Message-State: AOAM531ul3Bfhj6C18+ARfHOQDt194z6TKz4CJbkMZ2IyFfdCrDEYjcX
 oiqvzJEF8Vmdjvo5irG/ZieXHTJFB1pIcgjgfAKEfw==
X-Received: by 2002:a9f:23d0:: with SMTP id 74mr64957uao.69.1630614155186;
 Thu, 02 Sep 2021 13:22:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210902151715.383678-1-f4bug@amsat.org>
 <20210902151715.383678-16-f4bug@amsat.org>
In-Reply-To: <20210902151715.383678-16-f4bug@amsat.org>
From: Warner Losh <imp@bsdimp.com>
Date: Thu, 2 Sep 2021 14:22:24 -0600
Message-ID: <CANCZdfq0LLoC3Tr66bmjXOgB381hrHC751AbwKAZG2vUN3YeQw@mail.gmail.com>
Subject: Re: [PATCH 15/24] target/nios2: Restrict cpu_exec_interrupt() handler
 to sysemu
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="0000000000007c672e05cb08f1b4"
Received-SPF: none client-ip=2607:f8b0:4864:20::92f;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x92f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
X-TUID: BC2/7QZy/KHs

--0000000000007c672e05cb08f1b4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 2, 2021 at 9:18 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
>
wrote:

> Restrict cpu_exec_interrupt() and its callees to sysemu.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  target/nios2/cpu.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>

Reviewed-by: Warner Losh <imp@bsdimp.com>



> diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
> index 5e37defef80..947bb09bc1e 100644
> --- a/target/nios2/cpu.c
> +++ b/target/nios2/cpu.c
> @@ -127,6 +127,7 @@ static void nios2_cpu_realizefn(DeviceState *dev,
> Error **errp)
>      ncc->parent_realize(dev, errp);
>  }
>
> +#ifndef CONFIG_USER_ONLY
>  static bool nios2_cpu_exec_interrupt(CPUState *cs, int interrupt_request=
)
>  {
>      Nios2CPU *cpu =3D NIOS2_CPU(cs);
> @@ -140,7 +141,7 @@ static bool nios2_cpu_exec_interrupt(CPUState *cs, in=
t
> interrupt_request)
>      }
>      return false;
>  }
> -
> +#endif /* !CONFIG_USER_ONLY */
>
>  static void nios2_cpu_disas_set_info(CPUState *cpu, disassemble_info
> *info)
>  {
> @@ -219,10 +220,10 @@ static const struct SysemuCPUOps nios2_sysemu_ops =
=3D {
>
>  static const struct TCGCPUOps nios2_tcg_ops =3D {
>      .initialize =3D nios2_tcg_init,
> -    .cpu_exec_interrupt =3D nios2_cpu_exec_interrupt,
>      .tlb_fill =3D nios2_cpu_tlb_fill,
>
>  #ifndef CONFIG_USER_ONLY
> +    .cpu_exec_interrupt =3D nios2_cpu_exec_interrupt,
>      .do_interrupt =3D nios2_cpu_do_interrupt,
>      .do_unaligned_access =3D nios2_cpu_do_unaligned_access,
>  #endif /* !CONFIG_USER_ONLY */
> --
> 2.31.1
>
>

--0000000000007c672e05cb08f1b4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 2, 2021 at 9:18 AM Philip=
pe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@amsat.or=
g</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>Restrict cpu_exec_interrupt() and its callees to sysemu.<br>
<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsa=
t.org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
---<br>
=C2=A0target/nios2/cpu.c | 5 +++--<br>
=C2=A01 file changed, 3 insertions(+), 2 deletions(-)<br></blockquote><div>=
<br></div><div>Reviewed-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.co=
m" target=3D"_blank">imp@bsdimp.com</a>&gt;</div><div class=3D"gmail-yj6qo =
gmail-ajU" style=3D"outline:none;padding:10px 0px;width:22px;margin:2px 0px=
 0px"><br class=3D"gmail-Apple-interchange-newline"></div><div>=C2=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c<br>
index 5e37defef80..947bb09bc1e 100644<br>
--- a/target/nios2/cpu.c<br>
+++ b/target/nios2/cpu.c<br>
@@ -127,6 +127,7 @@ static void nios2_cpu_realizefn(DeviceState *dev, Error=
 **errp)<br>
=C2=A0 =C2=A0 =C2=A0ncc-&gt;parent_realize(dev, errp);<br>
=C2=A0}<br>
<br>
+#ifndef CONFIG_USER_ONLY<br>
=C2=A0static bool nios2_cpu_exec_interrupt(CPUState *cs, int interrupt_requ=
est)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0Nios2CPU *cpu =3D NIOS2_CPU(cs);<br>
@@ -140,7 +141,7 @@ static bool nios2_cpu_exec_interrupt(CPUState *cs, int =
interrupt_request)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0return false;<br>
=C2=A0}<br>
-<br>
+#endif /* !CONFIG_USER_ONLY */<br>
<br>
=C2=A0static void nios2_cpu_disas_set_info(CPUState *cpu, disassemble_info =
*info)<br>
=C2=A0{<br>
@@ -219,10 +220,10 @@ static const struct SysemuCPUOps nios2_sysemu_ops =3D=
 {<br>
<br>
=C2=A0static const struct TCGCPUOps nios2_tcg_ops =3D {<br>
=C2=A0 =C2=A0 =C2=A0.initialize =3D nios2_tcg_init,<br>
-=C2=A0 =C2=A0 .cpu_exec_interrupt =3D nios2_cpu_exec_interrupt,<br>
=C2=A0 =C2=A0 =C2=A0.tlb_fill =3D nios2_cpu_tlb_fill,<br>
<br>
=C2=A0#ifndef CONFIG_USER_ONLY<br>
+=C2=A0 =C2=A0 .cpu_exec_interrupt =3D nios2_cpu_exec_interrupt,<br>
=C2=A0 =C2=A0 =C2=A0.do_interrupt =3D nios2_cpu_do_interrupt,<br>
=C2=A0 =C2=A0 =C2=A0.do_unaligned_access =3D nios2_cpu_do_unaligned_access,=
<br>
=C2=A0#endif /* !CONFIG_USER_ONLY */<br>
-- <br>
2.31.1<br>
<br>
</blockquote></div></div>

--0000000000007c672e05cb08f1b4--
