Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp631708lfb;
        Thu, 2 Sep 2021 13:37:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwMvUldxNL8zaw0rkMSld3DpSclgdZwToe31ugXCRUI1+JIkKpk2dWTPXnlbk88CJR9CGMr
X-Received: by 2002:a25:bb8b:: with SMTP id y11mr288042ybg.384.1630615060303;
        Thu, 02 Sep 2021 13:37:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630615060; cv=none;
        d=google.com; s=arc-20160816;
        b=jNIaI0dbO9Cw1YmEz+4WyGWVdcehKQBs/Qo+VFlbsfP/bYRcmoCD6C7TZj2g7wTMT/
         0gVLSW25ZqychWpAkRPdxBCIWuHrozBMAbPmz04w3PKBQbmuABgc1+q4BUj9ksQNhj/T
         5WZ61q5yjlkA3NfATbCkiGnDZemakqbNu6J599vMR88iQ7nWlCT6e2VFwNOrog6kmfML
         AGCAcx+7T2SEuj67rCblNIBBpJAwBfodTnvQNklQZ29n+8q69Hami8toq7jJ3NfhRLa7
         qiuxHRPDxZgibniufgsQgYXBrxNkykANy+GcrHJfHE0qXyEInGJielYN6Acyh6bMy1nx
         C/9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IXs4nJs4COlMewLGKj8MReIetgZVSeTYTHEcqZse/qQ=;
        b=CSfK6xHTZ+MV05jrarci6KeNUFwfaMkRV07ELh5Ue7Bvat7wrWsVSthxlikBIF+BTQ
         itDFvEjECL45dEvOnxELhXBNths5Q93hP7UTnHzwgWzvl38FTc3jE7SIi4G17R2AI1cH
         0eVjrEBcjiM0JJZb771Qzzi1lxk3NBaRxQpkS9nVMroDLELen9OdDiud1hYjeyrjb6ux
         8cdH/1EpKvwa0nHpDBG5WcFFt15jpyGsh8YC16fF+tvLhoPIUQwF1RpjxobLPzDXaPvh
         0J5qyjdXumzTlwTMtyUjQgkNMeedd2kzV5puoRfHxWl3ZogsoARbd/zQ9O86ZVoPO8Ym
         CMzA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@bsdimp-com.20150623.gappssmtp.com header.s=20150623 header.b=XHeayma8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t20si2605660ybt.93.2021.09.02.13.37.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Sep 2021 13:37:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@bsdimp-com.20150623.gappssmtp.com header.s=20150623 header.b=XHeayma8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mLtSt-0001wW-KR
	for alex.bennee@linaro.org; Thu, 02 Sep 2021 16:37:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mLtJj-0002Ig-CE
 for qemu-arm@nongnu.org; Thu, 02 Sep 2021 16:28:11 -0400
Received: from mail-ua1-x931.google.com ([2607:f8b0:4864:20::931]:42794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mLtJh-000891-IB
 for qemu-arm@nongnu.org; Thu, 02 Sep 2021 16:28:11 -0400
Received: by mail-ua1-x931.google.com with SMTP id m39so1584530uad.9
 for <qemu-arm@nongnu.org>; Thu, 02 Sep 2021 13:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IXs4nJs4COlMewLGKj8MReIetgZVSeTYTHEcqZse/qQ=;
 b=XHeayma8ok14I3d4JnNJOfDsI490aC4PaNrShe7GKHdZuFwssrOQf3hjRFGgUJL93L
 yUwk+eZoeU0geczbPsOYLCdJmo1NKVJbrmav7DnQEKNr0QCQu3pbckAiRHXVNf9NNERd
 ZLOwxm+FxUQPJNLdJR09PzEIMAtysE/DMBK25fvW3T6YiS53X14H8NNEQZr3nfEHs7nM
 jydS6yr3a6yUFS4YhF5aVeca80NF30RtsfHiTshdIE31cRpcxRyd8Lm3xm8UehqRqVSA
 z51r3Kv1c+lgW8ofeDN/zOXi2ueAEfOrb2elu/6DEim4+ZOOwTFe5DrXx2WYaHDQtKTQ
 fsug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IXs4nJs4COlMewLGKj8MReIetgZVSeTYTHEcqZse/qQ=;
 b=dPp0t650Om/weSCQ7d5Ns2XXnpFgaNfu8J3F7UWxYg0Y1YbgfInt8e/N8uj3LgFefk
 wvd2yTWAyankG9jXm27zRvCbdCX9TmmRKJVJMRhiNqgjiUrpnxdtPV5l8GZFuN3nT+Kw
 WfWNebVO1s/EesH+GuOJmpRbuC6A+zfr3izgrUz6PQD6dFubDt2wBcKnIqBeBkq1VawF
 VdcLi3gVCmoIdk7pe6Mt/pU61kFi9BNcBE2ETzGb9K7zhHRXHRtPpu40AY4AVVKNC3st
 WTMYiM1se/h/mK+fjVPFSC4G3iH23mTfDQjiFeTF1cpAK5R9PpZ2WafaEwY2bLygiEBT
 hAhw==
X-Gm-Message-State: AOAM531dGkT7gy3jasyIO9Mln28TSY6cDXn5kRr7c4xSQVRHkcHvKc+q
 gxMB/5/9TDBl5kahQuDrEXlUdE6sOXF6WFczWSCpfA==
X-Received: by 2002:a9f:2a87:: with SMTP id z7mr95147uai.11.1630614488604;
 Thu, 02 Sep 2021 13:28:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210902151715.383678-1-f4bug@amsat.org>
 <20210902151715.383678-25-f4bug@amsat.org>
In-Reply-To: <20210902151715.383678-25-f4bug@amsat.org>
From: Warner Losh <imp@bsdimp.com>
Date: Thu, 2 Sep 2021 14:27:57 -0600
Message-ID: <CANCZdfrF3j+J2L_3KfbRNMF3r9+Fz3BUGYnbuRuvLyjF1HEJbw@mail.gmail.com>
Subject: Re: [PATCH 24/24] user: Remove cpu_get_pic_interrupt() stubs
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="0000000000005bf1b905cb0905f7"
Received-SPF: none client-ip=2607:f8b0:4864:20::931;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x931.google.com
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
X-TUID: ihKt7g7cYE94

--0000000000005bf1b905cb0905f7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 2, 2021 at 9:19 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
>
wrote:

> cpu_get_pic_interrupt() is now unreachable from user-mode,
> delete the unnecessary stubs.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  target/i386/cpu.h | 2 +-
>  bsd-user/main.c   | 7 -------
>  linux-user/main.c | 7 -------
>  3 files changed, 1 insertion(+), 15 deletions(-)
>

Reviewed-by: Warner Losh <imp@bsdimp.com>


> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> index c241bc183d2..c7cc65e92d5 100644
> --- a/target/i386/cpu.h
> +++ b/target/i386/cpu.h
> @@ -1832,9 +1832,9 @@ int x86_cpu_gdb_write_register(CPUState *cpu,
> uint8_t *buf, int reg);
>  void x86_cpu_list(void);
>  int cpu_x86_support_mca_broadcast(CPUX86State *env);
>
> +#ifndef CONFIG_USER_ONLY
>  int cpu_get_pic_interrupt(CPUX86State *s);
>
> -#ifndef CONFIG_USER_ONLY
>  /* MSDOS compatibility mode FPU exception support */
>  void x86_register_ferr_irq(qemu_irq irq);
>  void fpu_check_raise_ferr_irq(CPUX86State *s);
> diff --git a/bsd-user/main.c b/bsd-user/main.c
> index fe66204b6b7..e358c38c353 100644
> --- a/bsd-user/main.c
> +++ b/bsd-user/main.c
> @@ -66,13 +66,6 @@ void gemu_log(const char *fmt, ...)
>      va_end(ap);
>  }
>
> -#if defined(TARGET_I386)
> -int cpu_get_pic_interrupt(CPUX86State *env)
> -{
> -    return -1;
> -}
> -#endif
> -
>  void fork_start(void)
>  {
>  }
>

Love it, but either you or I will have to rebase based on which of us lands
in the tree first :).
For me, the rebase will be easy though.


> diff --git a/linux-user/main.c b/linux-user/main.c
> index 37ed50d98e2..f5c0a82427b 100644
> --- a/linux-user/main.c
> +++ b/linux-user/main.c
> @@ -120,13 +120,6 @@ const char *qemu_uname_release;
>     by remapping the process stack directly at the right place */
>  unsigned long guest_stack_size =3D 8 * 1024 * 1024UL;
>
> -#if defined(TARGET_I386)
> -int cpu_get_pic_interrupt(CPUX86State *env)
> -{
> -    return -1;
> -}
> -#endif
> -
>  /***********************************************************/
>  /* Helper routines for implementing atomic operations.  */
>
> --
> 2.31.1
>
>

--0000000000005bf1b905cb0905f7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 2, 2021 at 9:19 AM Philip=
pe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@amsat.or=
g</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>cpu_get_pic_interrupt() is now unreachable from user-mode,<br>
delete the unnecessary stubs.<br>
<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsa=
t.org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
---<br>
=C2=A0target/i386/cpu.h | 2 +-<br>
=C2=A0bsd-user/main.c=C2=A0 =C2=A0| 7 -------<br>
=C2=A0linux-user/main.c | 7 -------<br>
=C2=A03 files changed, 1 insertion(+), 15 deletions(-)<br></blockquote><div=
><div><br></div><div>Reviewed-by: Warner Losh &lt;<a href=3D"mailto:imp@bsd=
imp.com" target=3D"_blank">imp@bsdimp.com</a>&gt;</div></div><div>=C2=A0</d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
diff --git a/target/i386/cpu.h b/target/i386/cpu.h<br>
index c241bc183d2..c7cc65e92d5 100644<br>
--- a/target/i386/cpu.h<br>
+++ b/target/i386/cpu.h<br>
@@ -1832,9 +1832,9 @@ int x86_cpu_gdb_write_register(CPUState *cpu, uint8_t=
 *buf, int reg);<br>
=C2=A0void x86_cpu_list(void);<br>
=C2=A0int cpu_x86_support_mca_broadcast(CPUX86State *env);<br>
<br>
+#ifndef CONFIG_USER_ONLY<br>
=C2=A0int cpu_get_pic_interrupt(CPUX86State *s);<br>
<br>
-#ifndef CONFIG_USER_ONLY<br>
=C2=A0/* MSDOS compatibility mode FPU exception support */<br>
=C2=A0void x86_register_ferr_irq(qemu_irq irq);<br>
=C2=A0void fpu_check_raise_ferr_irq(CPUX86State *s);<br>
diff --git a/bsd-user/main.c b/bsd-user/main.c<br>
index fe66204b6b7..e358c38c353 100644<br>
--- a/bsd-user/main.c<br>
+++ b/bsd-user/main.c<br>
@@ -66,13 +66,6 @@ void gemu_log(const char *fmt, ...)<br>
=C2=A0 =C2=A0 =C2=A0va_end(ap);<br>
=C2=A0}<br>
<br>
-#if defined(TARGET_I386)<br>
-int cpu_get_pic_interrupt(CPUX86State *env)<br>
-{<br>
-=C2=A0 =C2=A0 return -1;<br>
-}<br>
-#endif<br>
-<br>
=C2=A0void fork_start(void)<br>
=C2=A0{<br>
=C2=A0}<br></blockquote><div><br></div><div>Love it, but either you or I wi=
ll have to rebase based on which of us lands in the tree first :).</div><di=
v>For me, the rebase will be easy though.</div><div>=C2=A0</div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
diff --git a/linux-user/main.c b/linux-user/main.c<br>
index 37ed50d98e2..f5c0a82427b 100644<br>
--- a/linux-user/main.c<br>
+++ b/linux-user/main.c<br>
@@ -120,13 +120,6 @@ const char *qemu_uname_release;<br>
=C2=A0 =C2=A0 by remapping the process stack directly at the right place */=
<br>
=C2=A0unsigned long guest_stack_size =3D 8 * 1024 * 1024UL;<br>
<br>
-#if defined(TARGET_I386)<br>
-int cpu_get_pic_interrupt(CPUX86State *env)<br>
-{<br>
-=C2=A0 =C2=A0 return -1;<br>
-}<br>
-#endif<br>
-<br>
=C2=A0/***********************************************************/<br>
=C2=A0/* Helper routines for implementing atomic operations.=C2=A0 */<br>
<br>
-- <br>
2.31.1<br>
<br>
</blockquote></div></div>

--0000000000005bf1b905cb0905f7--
