Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp618595lfb;
        Thu, 2 Sep 2021 13:17:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzIuh8phPzkSruA+a6RdRJXUEEfuj9hbvrNr71Kk3rui6cjPAVf47QqxX3+fFnWp5tibkFM
X-Received: by 2002:a92:de46:: with SMTP id e6mr3747504ilr.273.1630613872316;
        Thu, 02 Sep 2021 13:17:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630613872; cv=none;
        d=google.com; s=arc-20160816;
        b=SmWalYzTZZg4qTZx0x3AxZeVT5Jsan32BzOOp2ZGH8eoB9ma6NbEq4R1UK+r8dxYgN
         8AYU7Kao2PmUHKAesj4eTd7LOmrVZm5G0CclsPqTYlEks6VdvckVB6cwYQmSAXPKmSiV
         LxKJY28cVAIhl4TM0Aumn4K+lANJ8gfkSyWpNlZVIZoE+29jFUNaOr4zSaUbJV37DPdJ
         bzsawY5u6kCcxNasZ3yXKMMftyn7VEO6jR7FqnpKOU3oSf9ugMtDPvn40Mm0myT01lm/
         kBFLMqSo3OxLD3gt4WDRCZ7UbZrFL2HqY4URsZinuuCyT1eIDm8i/5D96jiFQ24NqoqX
         Tqlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0kZY4/on1W113cAqIpbz7/EvRBMjEx9P7xoTiic8ahg=;
        b=fTqxhRw3n/xvuwrOyIXDhh6zC1DTeDnVF+PmlBDuCDj9xtO5s9i/9OpzcHoZthv4E8
         3Wfo//X6j9Xtcbpq2FHfbI4h97/fgzHGVqqlUrxaMSNSwdA9OJVopGpQskg6v5s/BNPA
         I5LSbuRrrLTR87xo5p1LryL8cgC6ZUxD1d8+EwZbgbzt60jxDSe5q++fDz/EakE1Daj0
         Me2TuTGNParHqjbKAVmsKYHm4xxuCa+4zXt3iqs7W+UbBLabkujcudxSSnkfAidXG/pQ
         QEWRdWTPhReeySsyPbajYkl4ZjYB3jvwMAQph9jOGudxcNeG13/806O0KNMe/dtq9+L8
         Nebw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@bsdimp-com.20150623.gappssmtp.com header.s=20150623 header.b=o+pBS4nP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b7si3016617ilr.75.2021.09.02.13.17.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Sep 2021 13:17:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@bsdimp-com.20150623.gappssmtp.com header.s=20150623 header.b=o+pBS4nP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mLt9j-0005RR-J9
	for alex.bennee@linaro.org; Thu, 02 Sep 2021 16:17:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mLt9Y-0005Ma-CW
 for qemu-arm@nongnu.org; Thu, 02 Sep 2021 16:17:40 -0400
Received: from mail-vs1-xe2a.google.com ([2607:f8b0:4864:20::e2a]:33596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mLt9W-0007tS-2N
 for qemu-arm@nongnu.org; Thu, 02 Sep 2021 16:17:40 -0400
Received: by mail-vs1-xe2a.google.com with SMTP id bf15so2632407vsb.0
 for <qemu-arm@nongnu.org>; Thu, 02 Sep 2021 13:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0kZY4/on1W113cAqIpbz7/EvRBMjEx9P7xoTiic8ahg=;
 b=o+pBS4nP03FRDT+8PmZdwxcsdoCmS6b0lbH/SzleoC4uYpANEf+7xkzgW123g+/C+L
 vsFmghrywAZ/W/kVLHkLh7dsPzvgLQdKU3Jysgx4lundQinYdti06802cEYlk44l2MVG
 JcCdc+Hq1qTP4PtszqzqnzQ+IMdL2cWwZ/O4egvjoFRVwdUBOZU0tiCDDaez3ztuoAPu
 ZyBjPikWZB4x023a2/sqbhhS7xyqfO2Y2dA8eA5ois/Q53ksSl2bRtAeYcyu7kctB9vW
 WK5DjvcuqRfaq+OIAZsmN1/kY4+IjLtn1nXzGw+5I1Vsn8Uluwn+UFp6JeD3/0p3LDjt
 U9yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0kZY4/on1W113cAqIpbz7/EvRBMjEx9P7xoTiic8ahg=;
 b=rHbV8B/xY/a+EgcqnhpcfdkB7GAhtYcpDF5LvdzjmLyIPuoJHQvmp42IIuMsTqOYZ5
 j09voRdd0WS+qKXiiM0PXocbKU7jKwIM5lbc+w0FbQYsQuJDfQlyhnGaPpaPj9wq+DHG
 XETfahCKlsLW0tkZTtvIUdVdOqboeX2pJvx0FzOFMf7Hn1gbXQMtdf7ERjzGSbbBgFuc
 xaPwr6csWRcRxAikq3Iu3ZYXcbTb8vI5dPtqlIDQt3a7Am2/Knw5snDcAWLhIPsXQckw
 e5MNbkGcQOyfVPC/acyrMQScKPsI/CaHualGyrNrE7dnvqFHYCVLSKZn+5ZCmScaw6f3
 7l0A==
X-Gm-Message-State: AOAM530wQysEVXNC6oEl/TLylWU93AHNUu6PcvEk1qTznuLr2FJhM6sA
 Zy+CnfrX57zo7tGW3h+nJTzslZ397hPNU/0u/rguew==
X-Received: by 2002:a67:2dc6:: with SMTP id t189mr3892333vst.49.1630613856925; 
 Thu, 02 Sep 2021 13:17:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210902151715.383678-1-f4bug@amsat.org>
 <20210902151715.383678-10-f4bug@amsat.org>
In-Reply-To: <20210902151715.383678-10-f4bug@amsat.org>
From: Warner Losh <imp@bsdimp.com>
Date: Thu, 2 Sep 2021 14:17:26 -0600
Message-ID: <CANCZdfq1tWapUj9DNrQ4T0VYf3xR=4te64+W3Bnppa=PHJhcEQ@mail.gmail.com>
Subject: Re: [PATCH 09/24] target/cris: Restrict cpu_exec_interrupt() handler
 to sysemu
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="000000000000b54e9c05cb08df4b"
Received-SPF: none client-ip=2607:f8b0:4864:20::e2a;
 envelope-from=wlosh@bsdimp.com; helo=mail-vs1-xe2a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: LTiodo5ZIwH4

--000000000000b54e9c05cb08df4b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 2, 2021 at 9:18 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
>
wrote:

> Restrict cpu_exec_interrupt() and its callees to sysemu.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  target/cris/cpu.h    |  2 +-
>  target/cris/cpu.c    |  4 ++--
>  target/cris/helper.c | 17 ++---------------
>  3 files changed, 5 insertions(+), 18 deletions(-)
>

Reviewed-by: Warner Losh <imp@bsdimp.com>


> diff --git a/target/cris/cpu.h b/target/cris/cpu.h
> index d3b64929096..be021899ae8 100644
> --- a/target/cris/cpu.h
> +++ b/target/cris/cpu.h
> @@ -185,11 +185,11 @@ struct CRISCPU {
>
>  #ifndef CONFIG_USER_ONLY
>  extern const VMStateDescription vmstate_cris_cpu;
> -#endif
>
>  void cris_cpu_do_interrupt(CPUState *cpu);
>  void crisv10_cpu_do_interrupt(CPUState *cpu);
>  bool cris_cpu_exec_interrupt(CPUState *cpu, int int_req);
> +#endif
>
>  void cris_cpu_dump_state(CPUState *cs, FILE *f, int flags);
>
> diff --git a/target/cris/cpu.c b/target/cris/cpu.c
> index 70932b1f8c7..c2e7483f5bd 100644
> --- a/target/cris/cpu.c
> +++ b/target/cris/cpu.c
> @@ -205,20 +205,20 @@ static const struct SysemuCPUOps cris_sysemu_ops =
=3D {
>
>  static const struct TCGCPUOps crisv10_tcg_ops =3D {
>      .initialize =3D cris_initialize_crisv10_tcg,
> -    .cpu_exec_interrupt =3D cris_cpu_exec_interrupt,
>      .tlb_fill =3D cris_cpu_tlb_fill,
>
>  #ifndef CONFIG_USER_ONLY
> +    .cpu_exec_interrupt =3D cris_cpu_exec_interrupt,
>      .do_interrupt =3D crisv10_cpu_do_interrupt,
>  #endif /* !CONFIG_USER_ONLY */
>  };
>
>  static const struct TCGCPUOps crisv32_tcg_ops =3D {
>      .initialize =3D cris_initialize_tcg,
> -    .cpu_exec_interrupt =3D cris_cpu_exec_interrupt,
>      .tlb_fill =3D cris_cpu_tlb_fill,
>
>  #ifndef CONFIG_USER_ONLY
> +    .cpu_exec_interrupt =3D cris_cpu_exec_interrupt,
>      .do_interrupt =3D cris_cpu_do_interrupt,
>  #endif /* !CONFIG_USER_ONLY */
>  };
> diff --git a/target/cris/helper.c b/target/cris/helper.c
> index 911867f3b48..36926faf323 100644
> --- a/target/cris/helper.c
> +++ b/target/cris/helper.c
> @@ -41,20 +41,6 @@
>
>  #if defined(CONFIG_USER_ONLY)
>
> -void cris_cpu_do_interrupt(CPUState *cs)
> -{
> -    CRISCPU *cpu =3D CRIS_CPU(cs);
> -    CPUCRISState *env =3D &cpu->env;
> -
> -    cs->exception_index =3D -1;
> -    env->pregs[PR_ERP] =3D env->pc;
> -}
> -
> -void crisv10_cpu_do_interrupt(CPUState *cs)
> -{
> -    cris_cpu_do_interrupt(cs);
> -}
> -
>  bool cris_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>                         MMUAccessType access_type, int mmu_idx,
>                         bool probe, uintptr_t retaddr)
> @@ -287,7 +273,6 @@ hwaddr cris_cpu_get_phys_page_debug(CPUState *cs,
> vaddr addr)
>      D(fprintf(stderr, "%s %x -> %x\n", __func__, addr, phy));
>      return phy;
>  }
> -#endif
>
>  bool cris_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
>  {
> @@ -319,3 +304,5 @@ bool cris_cpu_exec_interrupt(CPUState *cs, int
> interrupt_request)
>
>      return ret;
>  }
> +
> +#endif /* !CONFIG_USER_ONLY */
> --
> 2.31.1
>
>

--000000000000b54e9c05cb08df4b
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
=C2=A0target/cris/cpu.h=C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0target/cris/cpu.c=C2=A0 =C2=A0 |=C2=A0 4 ++--<br>
=C2=A0target/cris/helper.c | 17 ++---------------<br>
=C2=A03 files changed, 5 insertions(+), 18 deletions(-)<br></blockquote><di=
v><div><br></div><div>Reviewed-by: Warner Losh &lt;<a href=3D"mailto:imp@bs=
dimp.com" target=3D"_blank">imp@bsdimp.com</a>&gt;</div></div><div>=C2=A0</=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
diff --git a/target/cris/cpu.h b/target/cris/cpu.h<br>
index d3b64929096..be021899ae8 100644<br>
--- a/target/cris/cpu.h<br>
+++ b/target/cris/cpu.h<br>
@@ -185,11 +185,11 @@ struct CRISCPU {<br>
<br>
=C2=A0#ifndef CONFIG_USER_ONLY<br>
=C2=A0extern const VMStateDescription vmstate_cris_cpu;<br>
-#endif<br>
<br>
=C2=A0void cris_cpu_do_interrupt(CPUState *cpu);<br>
=C2=A0void crisv10_cpu_do_interrupt(CPUState *cpu);<br>
=C2=A0bool cris_cpu_exec_interrupt(CPUState *cpu, int int_req);<br>
+#endif<br>
<br>
=C2=A0void cris_cpu_dump_state(CPUState *cs, FILE *f, int flags);<br>
<br>
diff --git a/target/cris/cpu.c b/target/cris/cpu.c<br>
index 70932b1f8c7..c2e7483f5bd 100644<br>
--- a/target/cris/cpu.c<br>
+++ b/target/cris/cpu.c<br>
@@ -205,20 +205,20 @@ static const struct SysemuCPUOps cris_sysemu_ops =3D =
{<br>
<br>
=C2=A0static const struct TCGCPUOps crisv10_tcg_ops =3D {<br>
=C2=A0 =C2=A0 =C2=A0.initialize =3D cris_initialize_crisv10_tcg,<br>
-=C2=A0 =C2=A0 .cpu_exec_interrupt =3D cris_cpu_exec_interrupt,<br>
=C2=A0 =C2=A0 =C2=A0.tlb_fill =3D cris_cpu_tlb_fill,<br>
<br>
=C2=A0#ifndef CONFIG_USER_ONLY<br>
+=C2=A0 =C2=A0 .cpu_exec_interrupt =3D cris_cpu_exec_interrupt,<br>
=C2=A0 =C2=A0 =C2=A0.do_interrupt =3D crisv10_cpu_do_interrupt,<br>
=C2=A0#endif /* !CONFIG_USER_ONLY */<br>
=C2=A0};<br>
<br>
=C2=A0static const struct TCGCPUOps crisv32_tcg_ops =3D {<br>
=C2=A0 =C2=A0 =C2=A0.initialize =3D cris_initialize_tcg,<br>
-=C2=A0 =C2=A0 .cpu_exec_interrupt =3D cris_cpu_exec_interrupt,<br>
=C2=A0 =C2=A0 =C2=A0.tlb_fill =3D cris_cpu_tlb_fill,<br>
<br>
=C2=A0#ifndef CONFIG_USER_ONLY<br>
+=C2=A0 =C2=A0 .cpu_exec_interrupt =3D cris_cpu_exec_interrupt,<br>
=C2=A0 =C2=A0 =C2=A0.do_interrupt =3D cris_cpu_do_interrupt,<br>
=C2=A0#endif /* !CONFIG_USER_ONLY */<br>
=C2=A0};<br>
diff --git a/target/cris/helper.c b/target/cris/helper.c<br>
index 911867f3b48..36926faf323 100644<br>
--- a/target/cris/helper.c<br>
+++ b/target/cris/helper.c<br>
@@ -41,20 +41,6 @@<br>
<br>
=C2=A0#if defined(CONFIG_USER_ONLY)<br>
<br>
-void cris_cpu_do_interrupt(CPUState *cs)<br>
-{<br>
-=C2=A0 =C2=A0 CRISCPU *cpu =3D CRIS_CPU(cs);<br>
-=C2=A0 =C2=A0 CPUCRISState *env =3D &amp;cpu-&gt;env;<br>
-<br>
-=C2=A0 =C2=A0 cs-&gt;exception_index =3D -1;<br>
-=C2=A0 =C2=A0 env-&gt;pregs[PR_ERP] =3D env-&gt;pc;<br>
-}<br>
-<br>
-void crisv10_cpu_do_interrupt(CPUState *cs)<br>
-{<br>
-=C2=A0 =C2=A0 cris_cpu_do_interrupt(cs);<br>
-}<br>
-<br>
=C2=A0bool cris_cpu_tlb_fill(CPUState *cs, vaddr address, int size,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 MMUAccessType access_type, int mmu_idx,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 bool probe, uintptr_t retaddr)<br>
@@ -287,7 +273,6 @@ hwaddr cris_cpu_get_phys_page_debug(CPUState *cs, vaddr=
 addr)<br>
=C2=A0 =C2=A0 =C2=A0D(fprintf(stderr, &quot;%s %x -&gt; %x\n&quot;, __func_=
_, addr, phy));<br>
=C2=A0 =C2=A0 =C2=A0return phy;<br>
=C2=A0}<br>
-#endif<br>
<br>
=C2=A0bool cris_cpu_exec_interrupt(CPUState *cs, int interrupt_request)<br>
=C2=A0{<br>
@@ -319,3 +304,5 @@ bool cris_cpu_exec_interrupt(CPUState *cs, int interrup=
t_request)<br>
<br>
=C2=A0 =C2=A0 =C2=A0return ret;<br>
=C2=A0}<br>
+<br>
+#endif /* !CONFIG_USER_ONLY */<br>
-- <br>
2.31.1<br>
<br>
</blockquote></div></div>

--000000000000b54e9c05cb08df4b--
