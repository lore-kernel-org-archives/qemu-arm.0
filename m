Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp620743lfb;
        Thu, 2 Sep 2021 13:20:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy+mmnzgznEpH6w70Aq830INDz19ptYz0leMKgKY5RxRSkU09C7Oapdt/jjjXvrbkNCV17A
X-Received: by 2002:ad4:5bea:: with SMTP id k10mr4927337qvc.23.1630614057558;
        Thu, 02 Sep 2021 13:20:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630614057; cv=none;
        d=google.com; s=arc-20160816;
        b=yTv3+f8mUYEKduRekmuUKXdOtwHgwLR6yqqZnQVZSbCNyoWsmw2tg0qvOTaszJfISC
         YboDsHdH2WG3Hn113Q+GcsHBxPD+cMsPLqGqxcWrBjGC3qFrqY3wL6bqp739OoN957fB
         +4vmeW4BZc/Mi3zX04Wzjhx3z7w9uHSOffDGBb5uKr/yURG0oq33Bn9u5kV54xeg6iUF
         RZ780TMjxmDB0qJvpR+GFZUbuIuL2m5v+jDjbIqlozR2bh/C2V3A8MquW36kXr12JiEb
         H7gQzE5fvCSeny8PC8UpX/LJ+mgtA1HLAkAnXcgy86uEiWdutJalPgfW8GCAD+qK0uKC
         nDkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fiqJpbTsxG4Wv0hD7u/eqtoU/AiPtbJu927f5MoVdkM=;
        b=nkAmVidZlXuinbgbNzA4A5epSrjayb+xDSDgEKtc1sTT3ttMPvzpJgWZYkLbvU4uAS
         G6BbqRv+xQv7NJRuC/Ihkd9iDeV1R/PvztS0r1baNermI2wzLNu+s22b4KKDpMSRFmmq
         DIvoxySZgYDg6cd20BAvVZtUjfcfjY4u/LjTSSIpo3oY/Hvq2TN7C/mKUqmFW/xnle7k
         wb/D7RpfMnDC4+jepJiqXQ080iysBtEPr6B3Wij4lzUXz37zo1Zpcl++BHVi3L3rD2Dr
         gcJH/VDPRx83gjjLDamQDsfyziHEPRJ7GPlE6YWrlL8gmQnj9SAQmA/hJfWGOm0VlsfB
         G0dA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@bsdimp-com.20150623.gappssmtp.com header.s=20150623 header.b="GVofx8Z/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a6si1496772qtj.223.2021.09.02.13.20.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Sep 2021 13:20:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@bsdimp-com.20150623.gappssmtp.com header.s=20150623 header.b="GVofx8Z/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mLtCi-0003CL-QY
	for alex.bennee@linaro.org; Thu, 02 Sep 2021 16:20:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mLtA3-00074w-27
 for qemu-arm@nongnu.org; Thu, 02 Sep 2021 16:18:11 -0400
Received: from mail-vs1-xe2a.google.com ([2607:f8b0:4864:20::e2a]:45943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mLt9z-0008GM-VC
 for qemu-arm@nongnu.org; Thu, 02 Sep 2021 16:18:09 -0400
Received: by mail-vs1-xe2a.google.com with SMTP id a21so2605414vsp.12
 for <qemu-arm@nongnu.org>; Thu, 02 Sep 2021 13:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fiqJpbTsxG4Wv0hD7u/eqtoU/AiPtbJu927f5MoVdkM=;
 b=GVofx8Z/LaXt6hpwAaaZmFv3SFrayfb8OxcwDDHUYbD7JI4JjoV7/Yq0ApJcuoOTLs
 iQq+x0ruJbOat2QjrxfxADL56cAS4wtyOazaUbWYJ3bUNrZUbONM0mMoQ0zG3lBp9PSo
 5bmW0p2EVOspHgoSPu7GNEvPipuL/HgIIgIRS+lYfxdmUrUCW7GLhmNWUdmi+F7CpCMd
 X3ClP8QW4j7j1D4Qgw0wlFASXli31x4MycOwBf2oEF4j2hzfE5SjieRcWiuw4KwoB3cq
 utjE1OwwG9dCyXzLczLQMXoK4ngeluvLcSdNHD/XgIpO36YmkLbSIE7fnfRhGDFDPByc
 0Pcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fiqJpbTsxG4Wv0hD7u/eqtoU/AiPtbJu927f5MoVdkM=;
 b=LeeRHgNmRoMxwrVbtch4H3Tinfw+sbvPFqSZS0Laz/vniu+my/V/ModxVRcgy/fofb
 GN202qG37ibrupo345TPEY0XXorroU1b/blcT8sg9BZCehIEEuTUjl2Qm3PFgzBxEO3U
 2lQ/Sy7eb0f+tk2hBwDhd2XaRMFfFwHY5jL+9bn74vyaipkIwdu/qM6vUWibbJwnQLRo
 iRRY8iCo6ZSmQVUuaGbhHAQyNKbV30vY6ExFWUGawhsdTxCX0LlmmDAwYDnrE/GcBiWA
 BPh4y+cml4B9MdKja9BmAD2wzY/4sZNOUG73Egs48vnKAgQ9g+CQ7DdljD8QZYhgGJO+
 fGXw==
X-Gm-Message-State: AOAM533Jvfv8g7BR2Punv1FjA7uOe/38wjfmq9HjG5eG+RMDsjkl5E/4
 R5Gemlwbvm1yfzQXI26KoCiuN89/uSPSD3Hx7NUr+g==
X-Received: by 2002:a05:6102:5a:: with SMTP id
 k26mr4329246vsp.26.1630613887057; 
 Thu, 02 Sep 2021 13:18:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210902151715.383678-1-f4bug@amsat.org>
 <20210902151715.383678-11-f4bug@amsat.org>
In-Reply-To: <20210902151715.383678-11-f4bug@amsat.org>
From: Warner Losh <imp@bsdimp.com>
Date: Thu, 2 Sep 2021 14:17:56 -0600
Message-ID: <CANCZdfqgD2yaoweZq=DOTxpxiCUN+hfuLntht01BNwez02_nvQ@mail.gmail.com>
Subject: Re: [PATCH 10/24] target/hppa: Restrict cpu_exec_interrupt() handler
 to sysemu
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="0000000000008114d405cb08e167"
Received-SPF: none client-ip=2607:f8b0:4864:20::e2a;
 envelope-from=wlosh@bsdimp.com; helo=mail-vs1-xe2a.google.com
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
X-TUID: V4Ua8onj5hEj

--0000000000008114d405cb08e167
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 2, 2021 at 9:18 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
>
wrote:

> Restrict cpu_exec_interrupt() and its callees to sysemu.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  target/hppa/cpu.h        | 4 ++--
>  target/hppa/cpu.c        | 2 +-
>  target/hppa/int_helper.c | 7 ++-----
>  3 files changed, 5 insertions(+), 8 deletions(-)
>

Reviewed-by: Warner Losh <imp@bsdimp.com>


> diff --git a/target/hppa/cpu.h b/target/hppa/cpu.h
> index 748270bfa31..7854675b903 100644
> --- a/target/hppa/cpu.h
> +++ b/target/hppa/cpu.h
> @@ -325,13 +325,13 @@ int cpu_hppa_signal_handler(int host_signum, void
> *pinfo, void *puc);
>  hwaddr hppa_cpu_get_phys_page_debug(CPUState *cs, vaddr addr);
>  int hppa_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
>  int hppa_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
> -void hppa_cpu_do_interrupt(CPUState *cpu);
> -bool hppa_cpu_exec_interrupt(CPUState *cpu, int int_req);
>  void hppa_cpu_dump_state(CPUState *cs, FILE *f, int);
>  bool hppa_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>                         MMUAccessType access_type, int mmu_idx,
>                         bool probe, uintptr_t retaddr);
>  #ifndef CONFIG_USER_ONLY
> +void hppa_cpu_do_interrupt(CPUState *cpu);
> +bool hppa_cpu_exec_interrupt(CPUState *cpu, int int_req);
>  int hppa_get_physical_address(CPUHPPAState *env, vaddr addr, int mmu_idx=
,
>                                int type, hwaddr *pphys, int *pprot);
>  extern const MemoryRegionOps hppa_io_eir_ops;
> diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
> index 2eace4ee124..e8edd189bfc 100644
> --- a/target/hppa/cpu.c
> +++ b/target/hppa/cpu.c
> @@ -144,10 +144,10 @@ static const struct SysemuCPUOps hppa_sysemu_ops =
=3D {
>  static const struct TCGCPUOps hppa_tcg_ops =3D {
>      .initialize =3D hppa_translate_init,
>      .synchronize_from_tb =3D hppa_cpu_synchronize_from_tb,
> -    .cpu_exec_interrupt =3D hppa_cpu_exec_interrupt,
>      .tlb_fill =3D hppa_cpu_tlb_fill,
>
>  #ifndef CONFIG_USER_ONLY
> +    .cpu_exec_interrupt =3D hppa_cpu_exec_interrupt,
>      .do_interrupt =3D hppa_cpu_do_interrupt,
>      .do_unaligned_access =3D hppa_cpu_do_unaligned_access,
>  #endif /* !CONFIG_USER_ONLY */
> diff --git a/target/hppa/int_helper.c b/target/hppa/int_helper.c
> index 349495d3610..13073ae2bda 100644
> --- a/target/hppa/int_helper.c
> +++ b/target/hppa/int_helper.c
> @@ -88,7 +88,6 @@ void HELPER(write_eiem)(CPUHPPAState *env, target_ureg
> val)
>      eval_interrupt(env_archcpu(env));
>      qemu_mutex_unlock_iothread();
>  }
> -#endif /* !CONFIG_USER_ONLY */
>
>  void hppa_cpu_do_interrupt(CPUState *cs)
>  {
> @@ -100,7 +99,6 @@ void hppa_cpu_do_interrupt(CPUState *cs)
>      uint64_t iasq_f =3D env->iasq_f;
>      uint64_t iasq_b =3D env->iasq_b;
>
> -#ifndef CONFIG_USER_ONLY
>      target_ureg old_psw;
>
>      /* As documented in pa2.0 -- interruption handling.  */
> @@ -187,7 +185,6 @@ void hppa_cpu_do_interrupt(CPUState *cs)
>      env->iaoq_b =3D env->iaoq_f + 4;
>      env->iasq_f =3D 0;
>      env->iasq_b =3D 0;
> -#endif
>
>      if (qemu_loglevel_mask(CPU_LOG_INT)) {
>          static const char * const names[] =3D {
> @@ -248,7 +245,6 @@ void hppa_cpu_do_interrupt(CPUState *cs)
>
>  bool hppa_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
>  {
> -#ifndef CONFIG_USER_ONLY
>      HPPACPU *cpu =3D HPPA_CPU(cs);
>      CPUHPPAState *env =3D &cpu->env;
>
> @@ -258,6 +254,7 @@ bool hppa_cpu_exec_interrupt(CPUState *cs, int
> interrupt_request)
>          hppa_cpu_do_interrupt(cs);
>          return true;
>      }
> -#endif
>      return false;
>  }
> +
> +#endif /* !CONFIG_USER_ONLY */
> --
> 2.31.1
>
>

--0000000000008114d405cb08e167
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
=C2=A0target/hppa/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 4 ++--<br>
=C2=A0target/hppa/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0target/hppa/int_helper.c | 7 ++-----<br>
=C2=A03 files changed, 5 insertions(+), 8 deletions(-)<br></blockquote><div=
><br></div><div><div>Reviewed-by: Warner Losh &lt;<a href=3D"mailto:imp@bsd=
imp.com" target=3D"_blank">imp@bsdimp.com</a>&gt;</div><div class=3D"gmail-=
yj6qo gmail-ajU" style=3D"outline:none;padding:10px 0px;width:22px;margin:2=
px 0px 0px">=C2=A0<br></div></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
diff --git a/target/hppa/cpu.h b/target/hppa/cpu.h<br>
index 748270bfa31..7854675b903 100644<br>
--- a/target/hppa/cpu.h<br>
+++ b/target/hppa/cpu.h<br>
@@ -325,13 +325,13 @@ int cpu_hppa_signal_handler(int host_signum, void *pi=
nfo, void *puc);<br>
=C2=A0hwaddr hppa_cpu_get_phys_page_debug(CPUState *cs, vaddr addr);<br>
=C2=A0int hppa_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int re=
g);<br>
=C2=A0int hppa_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg)=
;<br>
-void hppa_cpu_do_interrupt(CPUState *cpu);<br>
-bool hppa_cpu_exec_interrupt(CPUState *cpu, int int_req);<br>
=C2=A0void hppa_cpu_dump_state(CPUState *cs, FILE *f, int);<br>
=C2=A0bool hppa_cpu_tlb_fill(CPUState *cs, vaddr address, int size,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 MMUAccessType access_type, int mmu_idx,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 bool probe, uintptr_t retaddr);<br>
=C2=A0#ifndef CONFIG_USER_ONLY<br>
+void hppa_cpu_do_interrupt(CPUState *cpu);<br>
+bool hppa_cpu_exec_interrupt(CPUState *cpu, int int_req);<br>
=C2=A0int hppa_get_physical_address(CPUHPPAState *env, vaddr addr, int mmu_=
idx,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int type, hwaddr *pphys, int *pprot);=
<br>
=C2=A0extern const MemoryRegionOps hppa_io_eir_ops;<br>
diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c<br>
index 2eace4ee124..e8edd189bfc 100644<br>
--- a/target/hppa/cpu.c<br>
+++ b/target/hppa/cpu.c<br>
@@ -144,10 +144,10 @@ static const struct SysemuCPUOps hppa_sysemu_ops =3D =
{<br>
=C2=A0static const struct TCGCPUOps hppa_tcg_ops =3D {<br>
=C2=A0 =C2=A0 =C2=A0.initialize =3D hppa_translate_init,<br>
=C2=A0 =C2=A0 =C2=A0.synchronize_from_tb =3D hppa_cpu_synchronize_from_tb,<=
br>
-=C2=A0 =C2=A0 .cpu_exec_interrupt =3D hppa_cpu_exec_interrupt,<br>
=C2=A0 =C2=A0 =C2=A0.tlb_fill =3D hppa_cpu_tlb_fill,<br>
<br>
=C2=A0#ifndef CONFIG_USER_ONLY<br>
+=C2=A0 =C2=A0 .cpu_exec_interrupt =3D hppa_cpu_exec_interrupt,<br>
=C2=A0 =C2=A0 =C2=A0.do_interrupt =3D hppa_cpu_do_interrupt,<br>
=C2=A0 =C2=A0 =C2=A0.do_unaligned_access =3D hppa_cpu_do_unaligned_access,<=
br>
=C2=A0#endif /* !CONFIG_USER_ONLY */<br>
diff --git a/target/hppa/int_helper.c b/target/hppa/int_helper.c<br>
index 349495d3610..13073ae2bda 100644<br>
--- a/target/hppa/int_helper.c<br>
+++ b/target/hppa/int_helper.c<br>
@@ -88,7 +88,6 @@ void HELPER(write_eiem)(CPUHPPAState *env, target_ureg va=
l)<br>
=C2=A0 =C2=A0 =C2=A0eval_interrupt(env_archcpu(env));<br>
=C2=A0 =C2=A0 =C2=A0qemu_mutex_unlock_iothread();<br>
=C2=A0}<br>
-#endif /* !CONFIG_USER_ONLY */<br>
<br>
=C2=A0void hppa_cpu_do_interrupt(CPUState *cs)<br>
=C2=A0{<br>
@@ -100,7 +99,6 @@ void hppa_cpu_do_interrupt(CPUState *cs)<br>
=C2=A0 =C2=A0 =C2=A0uint64_t iasq_f =3D env-&gt;iasq_f;<br>
=C2=A0 =C2=A0 =C2=A0uint64_t iasq_b =3D env-&gt;iasq_b;<br>
<br>
-#ifndef CONFIG_USER_ONLY<br>
=C2=A0 =C2=A0 =C2=A0target_ureg old_psw;<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* As documented in pa2.0 -- interruption handling.=C2=
=A0 */<br>
@@ -187,7 +185,6 @@ void hppa_cpu_do_interrupt(CPUState *cs)<br>
=C2=A0 =C2=A0 =C2=A0env-&gt;iaoq_b =3D env-&gt;iaoq_f + 4;<br>
=C2=A0 =C2=A0 =C2=A0env-&gt;iasq_f =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0env-&gt;iasq_b =3D 0;<br>
-#endif<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (qemu_loglevel_mask(CPU_LOG_INT)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0static const char * const names[] =3D {<b=
r>
@@ -248,7 +245,6 @@ void hppa_cpu_do_interrupt(CPUState *cs)<br>
<br>
=C2=A0bool hppa_cpu_exec_interrupt(CPUState *cs, int interrupt_request)<br>
=C2=A0{<br>
-#ifndef CONFIG_USER_ONLY<br>
=C2=A0 =C2=A0 =C2=A0HPPACPU *cpu =3D HPPA_CPU(cs);<br>
=C2=A0 =C2=A0 =C2=A0CPUHPPAState *env =3D &amp;cpu-&gt;env;<br>
<br>
@@ -258,6 +254,7 @@ bool hppa_cpu_exec_interrupt(CPUState *cs, int interrup=
t_request)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hppa_cpu_do_interrupt(cs);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return true;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-#endif<br>
=C2=A0 =C2=A0 =C2=A0return false;<br>
=C2=A0}<br>
+<br>
+#endif /* !CONFIG_USER_ONLY */<br>
-- <br>
2.31.1<br>
<br>
</blockquote></div></div>

--0000000000008114d405cb08e167--
