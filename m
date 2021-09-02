Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp625865lfb;
        Thu, 2 Sep 2021 13:28:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwNHqBiC3L6stokb8C0HXSuoCDuXbcPly/3B1B9dv3pbhIXgofuYgFLZoCpZyPFHEfld+QW
X-Received: by 2002:a05:6e02:506:: with SMTP id d6mr5290ils.141.1630614535382;
        Thu, 02 Sep 2021 13:28:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630614535; cv=none;
        d=google.com; s=arc-20160816;
        b=MAHNZ+Q2SQr6Hf+np2Aqcklc3/5zk9aQb/pI4HhUHgmD+zbkoBJZhQC/LcoVcpNM2u
         +FPFiFxNVAeVofBKUEWoLfRGcbzBguthSp1KvspWGaK3ueYnVNDbAKrioFt718aJMWvl
         fdYbO14Xcd4DtVq7uFqymFKVr5KcdFlpZYs5XnzZnsDmZPT0H+IHdfqtqxeHvsc+QHAS
         yBT7WdV6vovvPksWuZxulxLuF63KC1+IDmSgAGOsTVge75NWmu9kUvFuLKWFcJMj5kwm
         jY+J2Vp4YyWjHHE7zNf91bEmNufI4R/PSR4xossmVtl1d+661X2KHNz1UaR3oTUgoDvG
         BAQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QyZobYMQHcUZ56oMxYtgIAHx7uOBirlOqQnRrRYCGUI=;
        b=TRZ0SXhPFBK365kpy86DqyBRHACG2sq8NrwPNOTFFoTaTVt+g50xkArO3mRfc30CmT
         edUSyfceVImSjhgH422kmoswYtyQGTpHjoeswh21YdPbov1p9WUm683dzJusdhchBu1D
         7BFXCAYTMU2NQB7fB3Igwhnun9mHrpbdCW9QLr+lPSUDFS8MmE9i77KSRYka2FidOvzi
         5rMfI5k4j6CZnDRFlAsZ06KqYKJHVPsC9OtAG9a+TMqyv4C19WY+A55WxccdLBa2RmGx
         W4qSwnW0OeK5G5HtT9VZ8QaXj2gkrjeTN7ZM6vp4CNlYn88VofZPru/9NpP9CE7uJzSA
         zkRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@bsdimp-com.20150623.gappssmtp.com header.s=20150623 header.b=1yyYZIkk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p6si2898661ilj.154.2021.09.02.13.28.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Sep 2021 13:28:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@bsdimp-com.20150623.gappssmtp.com header.s=20150623 header.b=1yyYZIkk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mLtKQ-0002S4-MH
	for alex.bennee@linaro.org; Thu, 02 Sep 2021 16:28:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mLtHj-0005c2-2w
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 16:26:07 -0400
Received: from mail-ua1-x92a.google.com ([2607:f8b0:4864:20::92a]:42780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mLtHe-0006RS-Gs
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 16:26:06 -0400
Received: by mail-ua1-x92a.google.com with SMTP id m39so1581833uad.9
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 13:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QyZobYMQHcUZ56oMxYtgIAHx7uOBirlOqQnRrRYCGUI=;
 b=1yyYZIkkhfoO+E3vnuqxjEE4D+RA6JVkccMhh/o/OvH6EFAInyzYHomT+vcegJIOSP
 IpTXEzMRPIYt1Nruwf5TqFEqOOuxe+ZuZm2NHbWNy3iqnu42NFzuO0/H5t7b08L3kokg
 OJjkkIqLP7Ao5LU/49vtHNzUS0ym0Cv+3ZYi4EAne/xRvPhnhlfHf3IelVJF0xwYAP8a
 DQExSN2gzWQ5/a+TDRraX1SgLRINskjkMSdXSRQoT6CGj9LoZgcvjpkR9mr+VXGePht4
 Pn8Kle+XZpEDqvcUzR4gRegMuFK65n4Lsv2XEL80AiAZf0WvR1wv5DrxQcsPW7qDnvFW
 LgTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QyZobYMQHcUZ56oMxYtgIAHx7uOBirlOqQnRrRYCGUI=;
 b=MnqmLL+Kcruj0NB9AQTmwNSqtq+qlXDIuUVAFal3hqfQWXh2ZJpoYhQSW7GqK5/12N
 cWWQqaQFHATdDY1z/YKltgweHvvvsuc/mtqUoEjOzbsUQ7xfKe/vMBp6XMcXcAb7WvGg
 bHIBQOtTAu6hYuzuhp0RlyRl5a0plYwjMKKoEpExngNGU4vZTgO+j4mTHpNvKAO4323v
 zOviMUZO0hDgBs/kYdA7pBxKKjezrRUNoRWDMB0mwoA2gNGds0YWkvDaBoBV9ds8dc1F
 BlhfWZKDP5Ql07VQPaIzIJGjZHQZS8ix3zykoINh2EfAKq2a8J7elq4WTetvS7RXDmBR
 ysJA==
X-Gm-Message-State: AOAM532cGIriqSLCWWGz/CNduw2C3i+utoqNB4BjCwaIlb4EoCl6Pk/p
 FNNjGa3CNRavRYw1uNC7CCdD5j3WmgXyP6Uc5S9rug==
X-Received: by 2002:a9f:23d0:: with SMTP id 74mr70802uao.69.1630614360980;
 Thu, 02 Sep 2021 13:26:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210902151715.383678-1-f4bug@amsat.org>
 <20210902151715.383678-20-f4bug@amsat.org>
In-Reply-To: <20210902151715.383678-20-f4bug@amsat.org>
From: Warner Losh <imp@bsdimp.com>
Date: Thu, 2 Sep 2021 14:25:50 -0600
Message-ID: <CANCZdfoCQ8-gAj67vHwCSVZ1QYoirMJw=vu4_=2Q=6gMA8BBtQ@mail.gmail.com>
Subject: Re: [PATCH 19/24] target/sh4: Restrict cpu_exec_interrupt() handler
 to sysemu
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="000000000000c08c8005cb08fdc7"
Received-SPF: none client-ip=2607:f8b0:4864:20::92a;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x92a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Filippov <jcmvbkbc@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Marek Vasut <marex@denx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, qemu-ppc <qemu-ppc@nongnu.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-arm <qemu-arm@nongnu.org>, Michael Rolnik <mrolnik@gmail.com>,
 Stafford Horne <shorne@gmail.com>, David Gibson <david@gibson.dropbear.id.au>,
 qemu-riscv@nongnu.org, Chris Wulff <crwulff@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XeechV2Eern2

--000000000000c08c8005cb08fdc7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 2, 2021 at 9:19 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
>
wrote:

> Restrict cpu_exec_interrupt() and its callees to sysemu.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  target/sh4/cpu.h    | 4 ++--
>  target/sh4/cpu.c    | 2 +-
>  target/sh4/helper.c | 9 ++-------
>  3 files changed, 5 insertions(+), 10 deletions(-)
>
> Reviewed-by: Warner Losh <imp@bsdimp.com>



> diff --git a/target/sh4/cpu.h b/target/sh4/cpu.h
> index 01c43440822..017a7702140 100644
> --- a/target/sh4/cpu.h
> +++ b/target/sh4/cpu.h
> @@ -204,8 +204,6 @@ struct SuperHCPU {
>  };
>
>
> -void superh_cpu_do_interrupt(CPUState *cpu);
> -bool superh_cpu_exec_interrupt(CPUState *cpu, int int_req);
>  void superh_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
>  hwaddr superh_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
>  int superh_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg=
);
> @@ -223,6 +221,8 @@ bool superh_cpu_tlb_fill(CPUState *cs, vaddr address,
> int size,
>
>  void sh4_cpu_list(void);
>  #if !defined(CONFIG_USER_ONLY)
> +void superh_cpu_do_interrupt(CPUState *cpu);
> +bool superh_cpu_exec_interrupt(CPUState *cpu, int int_req);
>  void cpu_sh4_invalidate_tlb(CPUSH4State *s);
>  uint32_t cpu_sh4_read_mmaped_itlb_addr(CPUSH4State *s,
>                                         hwaddr addr);
> diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
> index 83269229421..2047742d03c 100644
> --- a/target/sh4/cpu.c
> +++ b/target/sh4/cpu.c
> @@ -236,10 +236,10 @@ static const struct SysemuCPUOps sh4_sysemu_ops =3D=
 {
>  static const struct TCGCPUOps superh_tcg_ops =3D {
>      .initialize =3D sh4_translate_init,
>      .synchronize_from_tb =3D superh_cpu_synchronize_from_tb,
> -    .cpu_exec_interrupt =3D superh_cpu_exec_interrupt,
>      .tlb_fill =3D superh_cpu_tlb_fill,
>
>  #ifndef CONFIG_USER_ONLY
> +    .cpu_exec_interrupt =3D superh_cpu_exec_interrupt,
>      .do_interrupt =3D superh_cpu_do_interrupt,
>      .do_unaligned_access =3D superh_cpu_do_unaligned_access,
>      .io_recompile_replay_branch =3D superh_io_recompile_replay_branch,
> diff --git a/target/sh4/helper.c b/target/sh4/helper.c
> index 2d622081e85..53cb9c3b631 100644
> --- a/target/sh4/helper.c
> +++ b/target/sh4/helper.c
> @@ -45,11 +45,6 @@
>
>  #if defined(CONFIG_USER_ONLY)
>
> -void superh_cpu_do_interrupt(CPUState *cs)
> -{
> -    cs->exception_index =3D -1;
> -}
> -
>  int cpu_sh4_is_cached(CPUSH4State *env, target_ulong addr)
>  {
>      /* For user mode, only U0 area is cacheable. */
> @@ -784,8 +779,6 @@ int cpu_sh4_is_cached(CPUSH4State * env, target_ulong
> addr)
>      return 0;
>  }
>
> -#endif
> -
>  bool superh_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
>  {
>      if (interrupt_request & CPU_INTERRUPT_HARD) {
> @@ -803,6 +796,8 @@ bool superh_cpu_exec_interrupt(CPUState *cs, int
> interrupt_request)
>      return false;
>  }
>
> +#endif /* !CONFIG_USER_ONLY */
> +
>  bool superh_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>                           MMUAccessType access_type, int mmu_idx,
>                           bool probe, uintptr_t retaddr)
> --
> 2.31.1
>
>

--000000000000c08c8005cb08fdc7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 2, 2021 at 9:19 AM Philip=
pe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@amsat.or=
g</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>Restrict cpu_exec_interrupt() and its callees to sysemu.<br>
<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsa=
t.org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
---<br>
=C2=A0target/sh4/cpu.h=C2=A0 =C2=A0 | 4 ++--<br>
=C2=A0target/sh4/cpu.c=C2=A0 =C2=A0 | 2 +-<br>
=C2=A0target/sh4/helper.c | 9 ++-------<br>
=C2=A03 files changed, 5 insertions(+), 10 deletions(-)<br>
<br></blockquote><div>Reviewed-by: Warner Losh &lt;<a href=3D"mailto:imp@bs=
dimp.com" target=3D"_blank">imp@bsdimp.com</a>&gt;</div><div class=3D"gmail=
-yj6qo gmail-ajU" style=3D"outline:none;padding:10px 0px;width:22px;margin:=
2px 0px 0px"><br class=3D"gmail-Apple-interchange-newline"></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
diff --git a/target/sh4/cpu.h b/target/sh4/cpu.h<br>
index 01c43440822..017a7702140 100644<br>
--- a/target/sh4/cpu.h<br>
+++ b/target/sh4/cpu.h<br>
@@ -204,8 +204,6 @@ struct SuperHCPU {<br>
=C2=A0};<br>
<br>
<br>
-void superh_cpu_do_interrupt(CPUState *cpu);<br>
-bool superh_cpu_exec_interrupt(CPUState *cpu, int int_req);<br>
=C2=A0void superh_cpu_dump_state(CPUState *cpu, FILE *f, int flags);<br>
=C2=A0hwaddr superh_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);<br>
=C2=A0int superh_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int =
reg);<br>
@@ -223,6 +221,8 @@ bool superh_cpu_tlb_fill(CPUState *cs, vaddr address, i=
nt size,<br>
<br>
=C2=A0void sh4_cpu_list(void);<br>
=C2=A0#if !defined(CONFIG_USER_ONLY)<br>
+void superh_cpu_do_interrupt(CPUState *cpu);<br>
+bool superh_cpu_exec_interrupt(CPUState *cpu, int int_req);<br>
=C2=A0void cpu_sh4_invalidate_tlb(CPUSH4State *s);<br>
=C2=A0uint32_t cpu_sh4_read_mmaped_itlb_addr(CPUSH4State *s,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hwaddr a=
ddr);<br>
diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c<br>
index 83269229421..2047742d03c 100644<br>
--- a/target/sh4/cpu.c<br>
+++ b/target/sh4/cpu.c<br>
@@ -236,10 +236,10 @@ static const struct SysemuCPUOps sh4_sysemu_ops =3D {=
<br>
=C2=A0static const struct TCGCPUOps superh_tcg_ops =3D {<br>
=C2=A0 =C2=A0 =C2=A0.initialize =3D sh4_translate_init,<br>
=C2=A0 =C2=A0 =C2=A0.synchronize_from_tb =3D superh_cpu_synchronize_from_tb=
,<br>
-=C2=A0 =C2=A0 .cpu_exec_interrupt =3D superh_cpu_exec_interrupt,<br>
=C2=A0 =C2=A0 =C2=A0.tlb_fill =3D superh_cpu_tlb_fill,<br>
<br>
=C2=A0#ifndef CONFIG_USER_ONLY<br>
+=C2=A0 =C2=A0 .cpu_exec_interrupt =3D superh_cpu_exec_interrupt,<br>
=C2=A0 =C2=A0 =C2=A0.do_interrupt =3D superh_cpu_do_interrupt,<br>
=C2=A0 =C2=A0 =C2=A0.do_unaligned_access =3D superh_cpu_do_unaligned_access=
,<br>
=C2=A0 =C2=A0 =C2=A0.io_recompile_replay_branch =3D superh_io_recompile_rep=
lay_branch,<br>
diff --git a/target/sh4/helper.c b/target/sh4/helper.c<br>
index 2d622081e85..53cb9c3b631 100644<br>
--- a/target/sh4/helper.c<br>
+++ b/target/sh4/helper.c<br>
@@ -45,11 +45,6 @@<br>
<br>
=C2=A0#if defined(CONFIG_USER_ONLY)<br>
<br>
-void superh_cpu_do_interrupt(CPUState *cs)<br>
-{<br>
-=C2=A0 =C2=A0 cs-&gt;exception_index =3D -1;<br>
-}<br>
-<br>
=C2=A0int cpu_sh4_is_cached(CPUSH4State *env, target_ulong addr)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0/* For user mode, only U0 area is cacheable. */<br>
@@ -784,8 +779,6 @@ int cpu_sh4_is_cached(CPUSH4State * env, target_ulong a=
ddr)<br>
=C2=A0 =C2=A0 =C2=A0return 0;<br>
=C2=A0}<br>
<br>
-#endif<br>
-<br>
=C2=A0bool superh_cpu_exec_interrupt(CPUState *cs, int interrupt_request)<b=
r>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0if (interrupt_request &amp; CPU_INTERRUPT_HARD) {<br>
@@ -803,6 +796,8 @@ bool superh_cpu_exec_interrupt(CPUState *cs, int interr=
upt_request)<br>
=C2=A0 =C2=A0 =C2=A0return false;<br>
=C2=A0}<br>
<br>
+#endif /* !CONFIG_USER_ONLY */<br>
+<br>
=C2=A0bool superh_cpu_tlb_fill(CPUState *cs, vaddr address, int size,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 MMUAccessType access_type, int mmu_idx,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 bool probe, uintptr_t retaddr)<br>
-- <br>
2.31.1<br>
<br>
</blockquote></div></div>

--000000000000c08c8005cb08fdc7--
