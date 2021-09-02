Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp613121lfb;
        Thu, 2 Sep 2021 13:10:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzR5YCmluzbraig6YHjV9kB2axZcXrpI1OC73OOEkCzRklPoeTPoXJJgg9dtOAiCDctKZrz
X-Received: by 2002:a17:906:1484:: with SMTP id x4mr5831374ejc.72.1630613435174;
        Thu, 02 Sep 2021 13:10:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630613435; cv=none;
        d=google.com; s=arc-20160816;
        b=cm51r8v/k7RHZSAo8TbkDWj3YB3KUxODChLWVlW2CQxCFC0s+09XQekekGv751R19d
         FvYRQ6KOvWPfkUpIYqtVtM5a2mPAEeunsj9MNQ/vrZUXSNylSf5/4wvnbZOFEe2+8wsd
         TyMW2pgZ5JdgHIg3dOTVQ+cFX4qKIxeMdNaGPWncddzfeyZZtvnKr9fmufO7fx61B2mj
         crrUM1CZwVUEiGRW4ievThQC6t999YP69Z8kTj+yv7YlJC1gauHOB/+naNs/TaQJXb2u
         894k2Ck9VAtccFnffyXh8Zm8unpa3fvkrB+Ccbx7OLJ6vhfGkrH561Z3Fx7e2DuSJpAg
         8alA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yy/dcYFGhKpu0ptaayrsqN44d0c/Beh6cldZRRjkueo=;
        b=FOuVCB8shyW1X8Ph/pHC4aEm+fFBHS2VcIvm2IyFIQ71Fjb0hHbXQ3515XR9t0JIUw
         B+6Yg4Rf4EXKtJ1WgB1sGFAenrqIFm423r//uWQxgv296zALxM3Spq6cmmwLtpeP/Zu3
         PKlyqXUDcmBknBynzDOTjIemD79CKPNKjSg9AKBUzuiAQtW+HjWMcaavU07WhpUOdn4Y
         w1GU8/niWbi+eJEbQt74Um2A2qmQsX/RYP7xMeeM5kbFahSZaKmoTMMoeZMDINdh9jnV
         xUKfGPKsX+tB8/oJEot8/WcsrYnuD/n4decIAKjtgRJZO6iCwPlkljw424xKSWobJSop
         zC2w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@bsdimp-com.20150623.gappssmtp.com header.s=20150623 header.b=LAWjq4Vj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id hk14si2873223ejb.220.2021.09.02.13.10.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Sep 2021 13:10:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@bsdimp-com.20150623.gappssmtp.com header.s=20150623 header.b=LAWjq4Vj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:38132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mLt2e-00036Y-NM
	for alex.bennee@linaro.org; Thu, 02 Sep 2021 16:10:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mLt25-00035z-7l
 for qemu-arm@nongnu.org; Thu, 02 Sep 2021 16:09:57 -0400
Received: from mail-ua1-x932.google.com ([2607:f8b0:4864:20::932]:39797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mLt23-0000xQ-5N
 for qemu-arm@nongnu.org; Thu, 02 Sep 2021 16:09:57 -0400
Received: by mail-ua1-x932.google.com with SMTP id x21so1566233uan.6
 for <qemu-arm@nongnu.org>; Thu, 02 Sep 2021 13:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yy/dcYFGhKpu0ptaayrsqN44d0c/Beh6cldZRRjkueo=;
 b=LAWjq4VjLaMEZLOYnO/2vAI5sTFiOgEwDOOMTHHjQ+i3iFx5K3nBw4Xj1zaSbq80Ka
 hZOq595bqGDGMLAfW+/TREThUJs/cOJhxnuctnCQ1wZfIjIPIawR3tijX5SiPmbO247g
 kkCXFxG49IBOa9HDRksTrqPK8rDI3xkLjbzrRO3cqgXdcqsLd2GFapRJ6ABb49atdxeZ
 CKM6JX1ObcTOuY0B9yscIQW0p13uVlRqzY/FfGV8XtexDzWEGHqTinmH2Q63M9M9SKhw
 9VaSZvtO4tdYN0HEa2Nci2y/2n3PcIaRlCsHjlukt6FPai9xWH6odrwTPe4BaWu0pwWt
 nY+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yy/dcYFGhKpu0ptaayrsqN44d0c/Beh6cldZRRjkueo=;
 b=UtaADmn7jClfJ2neZZ9B6k8xX7CR/d9z5WbvS5lGKs3wxcsqn0jm+kaFrzvxkwRt5C
 MY9eXawjNMGpb2b6O/Wrf621cAePPGMJpll/ZeFWsm9+JLuIJz1bGPAAYw4x+i4epIA7
 EsZXS+YBRhR7qYGWicGO1a/3xH/sxmyalgqJmzo1skjRCV6D9soIWfaoPO68rcryC0W5
 Mc2Fcd3O/lCmRwjpAIBZrJ1Y31pdDckL/QvcSZmZjvl1PV5OJqklm3Cx1QrobMI4NqkS
 JldN5sSSGh0hoi/QEUxLVy1am/AS+3D1T3YtkQ7BWyfbbmL2kHMn9N2KJlP1Iyo2Bo3V
 zy6w==
X-Gm-Message-State: AOAM530wxMCcHVbojEm4mekZjghnwIbkZ2r+h/CUT4gVU11Kn6gdFLAT
 x9aW+ZnqQYHKuR3dLhG0WmMuNgWpsPoNfWKSC5Udbg==
X-Received: by 2002:ab0:3413:: with SMTP id z19mr24593uap.39.1630613393374;
 Thu, 02 Sep 2021 13:09:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210902151715.383678-1-f4bug@amsat.org>
 <20210902151715.383678-2-f4bug@amsat.org>
In-Reply-To: <20210902151715.383678-2-f4bug@amsat.org>
From: Warner Losh <imp@bsdimp.com>
Date: Thu, 2 Sep 2021 14:09:42 -0600
Message-ID: <CANCZdfrHrQQkiXmBc62X0b36n726iDCwvLfYXQrker7knhhD0g@mail.gmail.com>
Subject: Re: [PATCH 01/24] target/xtensa: Restrict do_transaction_failed() to
 sysemu
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="000000000000140ed505cb08c417"
Received-SPF: none client-ip=2607:f8b0:4864:20::932;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x932.google.com
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
X-TUID: YkjS4TJ4jd2C

--000000000000140ed505cb08c417
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 2, 2021 at 9:17 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
>
wrote:

> The do_transaction_failed() is restricted to system emulation since
> commit cbc183d2d9f ("cpu: move cc->transaction_failed to tcg_ops").
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>

Reviewed-by: Warner Losh <imp@bsdimp.com>


> ---
>  target/xtensa/cpu.h | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/target/xtensa/cpu.h b/target/xtensa/cpu.h
> index 2345cb59c79..1e0cb1535ca 100644
> --- a/target/xtensa/cpu.h
> +++ b/target/xtensa/cpu.h
> @@ -568,10 +568,12 @@ bool xtensa_cpu_tlb_fill(CPUState *cs, vaddr
> address, int size,
>                           bool probe, uintptr_t retaddr);
>  void xtensa_cpu_do_interrupt(CPUState *cpu);
>  bool xtensa_cpu_exec_interrupt(CPUState *cpu, int interrupt_request);
> +#ifndef CONFIG_USER_ONLY
>  void xtensa_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
> vaddr addr,
>                                        unsigned size, MMUAccessType
> access_type,
>                                        int mmu_idx, MemTxAttrs attrs,
>                                        MemTxResult response, uintptr_t
> retaddr);
> +#endif /* !CONFIG_USER_ONLY */
>  void xtensa_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
>  hwaddr xtensa_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
>  void xtensa_count_regs(const XtensaConfig *config,
> --
> 2.31.1
>
>

--000000000000140ed505cb08c417
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 2, 2021 at 9:17 AM Philip=
pe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@amsat.or=
g</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>The do_transaction_failed() is restricted to system emulation since<br>
commit cbc183d2d9f (&quot;cpu: move cc-&gt;transaction_failed to tcg_ops&qu=
ot;).<br>
<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsa=
t.org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br></blockquote><div><br><=
/div><div>Reviewed-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com">im=
p@bsdimp.com</a>&gt;</div><div>=C2=A0</div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">
---<br>
=C2=A0target/xtensa/cpu.h | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/target/xtensa/cpu.h b/target/xtensa/cpu.h<br>
index 2345cb59c79..1e0cb1535ca 100644<br>
--- a/target/xtensa/cpu.h<br>
+++ b/target/xtensa/cpu.h<br>
@@ -568,10 +568,12 @@ bool xtensa_cpu_tlb_fill(CPUState *cs, vaddr address,=
 int size,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 bool probe, uintptr_t retaddr);<br>
=C2=A0void xtensa_cpu_do_interrupt(CPUState *cpu);<br>
=C2=A0bool xtensa_cpu_exec_interrupt(CPUState *cpu, int interrupt_request);=
<br>
+#ifndef CONFIG_USER_ONLY<br>
=C2=A0void xtensa_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr, =
vaddr addr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned =
size, MMUAccessType access_type,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int mmu_i=
dx, MemTxAttrs attrs,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MemTxResu=
lt response, uintptr_t retaddr);<br>
+#endif /* !CONFIG_USER_ONLY */<br>
=C2=A0void xtensa_cpu_dump_state(CPUState *cpu, FILE *f, int flags);<br>
=C2=A0hwaddr xtensa_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);<br>
=C2=A0void xtensa_count_regs(const XtensaConfig *config,<br>
-- <br>
2.31.1<br>
<br>
</blockquote></div></div>

--000000000000140ed505cb08c417--
