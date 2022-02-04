Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp2415390lfk;
        Fri, 4 Feb 2022 00:33:22 -0800 (PST)
X-Received: by 2002:a17:906:c14d:: with SMTP id dp13mr1626303ejc.188.1643963602582;
        Fri, 04 Feb 2022 00:33:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643963602; cv=none;
        d=google.com; s=arc-20160816;
        b=AIoiQU6GVSYvXhFK51gR8l2o5IBdwNJ453E22UUJ8eFRC5Ii+wMz8/rFrN9bduNey3
         w3gb8rHlcpvbT/lbY3TW0jyjZbdaRqVPRB7fYUQhz5D/LbiBIhxuijiyAvd3MVVNV3Nd
         VS6U9PFvc1arTr1WpASEbHyAXnnYBlyhsDrJRXl0lF/O2n8LVncyQ5SQdtXY+dLW4kCE
         yj+XCLSf2BzhWu9OsunspFQGv4e83I7Wi1YjTBGUOBRbPOsmobEhZkfRAh8SS8qWgvMR
         V2CKZTbyvcg3+nTFznNvg1VGlOQ+q82Tx98iXMkjdWmn/U6csPlEDzica0a5cpVMF4vD
         48Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=77KThg+cYeye+WaZ44dPyN8Q4xZRJF6Uybo0js+f3Mk=;
        b=zfaq9a3EhhdLdIiIXEwVwwEuXGI6Pxq3q5/ywONqS9kuD7qSsMLoacVcpvKjszmaAe
         tzHlxHC642+vWYAHrCP2t+Wt3iPUGWr/cxv3p/VpYAdpZ91uDW1DXEU4V+ZfuDT1oT6j
         feBdkJLwOr2lq6oIU/oDPGc6jda+iQTo+RLmt096EV6JrPjOrcN8fzQ/m+X9+l6+1iId
         BigUzkGn3VWVS/BBqi25yB9VhNuCcqiOdysEX+PFejOxLIxsYLlXr6U+h3Y0po3Z4O9Z
         FY1/0BgyfkU6HheR5rmtpA4s9TAJ3WrjOeQ3qVch4TX4sKWiSdw5ZhsKa/zFxzvGXJhl
         v1Sg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=dT1SrlCq;
       spf=pass (google.com: domain of valentinghita@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=valentinghita@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <valentinghita@google.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id hp19sor669464ejc.11.2022.02.04.00.33.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 04 Feb 2022 00:33:22 -0800 (PST)
Received-SPF: pass (google.com: domain of valentinghita@google.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=dT1SrlCq;
       spf=pass (google.com: domain of valentinghita@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=valentinghita@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=77KThg+cYeye+WaZ44dPyN8Q4xZRJF6Uybo0js+f3Mk=;
        b=dT1SrlCq1UVbN7z2gv0Iwvkk+OslzGqAOlOUCazMLo4jq/2AX9bamQaw3LTB1Xi7dG
         8whetVWNEQw7vlEridhI3bqr/VSItexQj3dUrT0D56Qr9l4ZrhSGJuIbMMSo46A38Gwx
         QRPIrm1Tw6nmVE7NqHc6Lxvw15IZ12kw96AkqVleXNfKRl4cZQyoWYyd6W70S/bkXNbI
         FR9iz+84+AeHudhzF1ZfFF1rVZosuly/ihIRY5Y5ivpW9EO8uvOICaDNrTkq8qgXuWR3
         jQDqucKpo3U5ovPy9JEZO4D4dzPxZkpjN7JrK7BVV2Z6Lffq1WzCKrSkOaz1VbCoUgMb
         k93A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=77KThg+cYeye+WaZ44dPyN8Q4xZRJF6Uybo0js+f3Mk=;
        b=nra8JQCUYge4krTuYm+aqNWC6FDJrBAa+pFyL+Wy18aPlSw9SGNUFyFP5EpLKmj1O/
         RPVv2pCTOAB7/874ztB6c3RIunOnVPUD/qt9HPc93tLzhrVXYBquzNpeqdSrxl0rmxif
         qha7oGEVUfDJHmMCu1vWGrG39Wxt5RYcntKhRLXCAdswrohRuLZo3aflmFjtEL6c0r3a
         eeElCRlUSplLqH8uofcQt2i0Hn9kTMx4xvW6XROfTI+0SSgkdt8ME3I+MdlFkDUREXu3
         92iZaE9b9GwYqKP84Gg1azJdo8vxi2c1Xj6dzlcS5PyZ6Udig9Z9t8nuzjTxS0sC3+ml
         RYlw==
X-Gm-Message-State: AOAM533bQmzSXbgGrkvxW+SJd2RunPYPa9NKs1LDtMFJf7RRL9bklOEB
	9Zf03xvB+tjhITy9GhtENE66N8KiF8UMsxR+43/YZaYTD9cwcA==
X-Google-Smtp-Source: ABdhPJzwkpSgN1kKPDBQQYmJwdaxwULNJUM61xS/g2xApFZvNoQxFRWaLroSQQytI8wfltyVWX1iAPu8nwwtyeBZPb0=
X-Received: by 2002:a17:907:2511:: with SMTP id y17mr1520713ejl.123.1643963602010;
 Fri, 04 Feb 2022 00:33:22 -0800 (PST)
MIME-Version: 1.0
References: <20220203155304.2648009-1-valentinghita@google.com> <87tudfsv80.fsf@linaro.org>
In-Reply-To: <87tudfsv80.fsf@linaro.org>
From: Valentin Ghita <valentinghita@google.com>
Date: Fri, 4 Feb 2022 10:33:10 +0200
Message-ID: <CAKddhtYyZrEFveatS-o1YORdrUa-o53fBe3kwo9RVjXB2ovpyw@mail.gmail.com>
Subject: Re: [PATCH] armv7m_nvic: set DHCSR.DEBUGEN when debugger is attached
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000085db0605d72d1ac6"
X-TUID: uRbePC3xgXI1

--00000000000085db0605d72d1ac6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 3, 2022 at 7:42 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:

>
> Valentin Ghita <valentinghita@google.com> writes:
>
> > The DEBUGEN bit is set by the debugger when it is connected to the
> > core.  Software can use this bit to check if a debug session is active.
> >
> > Add a function in gdbstub to check if the debugger is attached to a CPU
> > and use this information when the DHCSR register is read in armv7m_nvic=
.
> >
> > Signed-off-by: Valentin Ghita <valentinghita@google.com>
>
> Nack - use of the gdbstub should be transparent to the guest. It is not
> trying to model any real JTAG/External debug hardware here.
>
>
The goal was to support the following piece of code:

if (DHCSR.C_DEBUGEN) {
    __asm ("bkpt");
}

And I have another patch which handles the bkpt exception when the DEBUGEN
bit is set, by interrupting the CPU.

Any suggestions on how we can achieve this?

Thank you,
Valentin.

> ---
> >  gdbstub.c              | 10 ++++++++++
> >  hw/intc/armv7m_nvic.c  |  4 ++++
> >  include/exec/gdbstub.h |  6 ++++++
> >  3 files changed, 20 insertions(+)
> >
> > diff --git a/gdbstub.c b/gdbstub.c
> > index 3c14c6a038..d4e39db8e7 100644
> > --- a/gdbstub.c
> > +++ b/gdbstub.c
> > @@ -3585,6 +3585,16 @@ int gdbserver_start(const char *device)
> >      return 0;
> >  }
> >
> > +bool gdb_attached(CPUState *cpu)
> > +{
> > +    GDBProcess *process =3D gdb_get_cpu_process(cpu);
> > +    if (process !=3D NULL) {
> > +        return process->attached;
> > +    }
> > +
> > +    return false;
> > +}
> > +
> >  static void register_types(void)
> >  {
> >      type_register_static(&char_gdb_type_info);
> > diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
> > index 13df002ce4..d6fff94bca 100644
> > --- a/hw/intc/armv7m_nvic.c
> > +++ b/hw/intc/armv7m_nvic.c
> > @@ -21,6 +21,7 @@
> >  #include "sysemu/runstate.h"
> >  #include "target/arm/cpu.h"
> >  #include "exec/exec-all.h"
> > +#include "exec/gdbstub.h"
> >  #include "exec/memop.h"
> >  #include "qemu/log.h"
> >  #include "qemu/module.h"
> > @@ -1510,6 +1511,9 @@ static uint32_t nvic_readl(NVICState *s, uint32_t
> offset, MemTxAttrs attrs)
> >          }
> >          /* We provide minimal-RAS only: RFSR is RAZ/WI */
> >          return 0;
> > +    case 0xdf0: /* DHCSR */
> > +        /* Bit 0: DEBUGEN. */
> > +        return gdb_attached(CPU(cpu)) ? 1 : 0;
> >      case 0xf34: /* FPCCR */
> >          if (!cpu_isar_feature(aa32_vfp_simd, cpu)) {
> >              return 0;
> > diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
> > index a024a0350d..383f4e5224 100644
> > --- a/include/exec/gdbstub.h
> > +++ b/include/exec/gdbstub.h
> > @@ -177,6 +177,12 @@ static inline uint8_t * gdb_get_reg_ptr(GByteArray
> *buf, int len)
> >   */
> >  int gdbserver_start(const char *port_or_device);
> >
> > +/**
> > + * gdb_attached: check if GDB is attached to a given CPU.
> > + * @cpu: the CPU to check if GDB is attached to.
> > + */
> > +bool gdb_attached(CPUState *cpu);
> > +
> >  /**
> >   * gdb_has_xml:
> >   * This is an ugly hack to cope with both new and old gdb.
>
>
> --
> Alex Benn=C3=A9e
>

--00000000000085db0605d72d1ac6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 3, 2022 at 7:42 PM Alex B=
enn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org">alex.bennee@linaro=
.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex"><br>
Valentin Ghita &lt;<a href=3D"mailto:valentinghita@google.com" target=3D"_b=
lank">valentinghita@google.com</a>&gt; writes:<br>
<br>
&gt; The DEBUGEN bit is set by the debugger when it is connected to the<br>
&gt; core.=C2=A0 Software can use this bit to check if a debug session is a=
ctive.<br>
&gt;<br>
&gt; Add a function in gdbstub to check if the debugger is attached to a CP=
U<br>
&gt; and use this information when the DHCSR register is read in armv7m_nvi=
c.<br>
&gt;<br>
&gt; Signed-off-by: Valentin Ghita &lt;<a href=3D"mailto:valentinghita@goog=
le.com" target=3D"_blank">valentinghita@google.com</a>&gt;<br>
<br>
Nack - use of the gdbstub should be transparent to the guest. It is not<br>
trying to model any real JTAG/External debug hardware here.<br>
<br></blockquote><div><br></div><div>The goal was to support the following =
piece of code:</div><div><br></div><div>if (DHCSR.C_DEBUGEN) {</div><div>=
=C2=A0 =C2=A0 __asm (&quot;bkpt&quot;);</div><div>}</div><div>=C2=A0</div><=
div>And I have another patch which handles the bkpt exception when the DEBU=
GEN</div><div>bit is set, by interrupting the CPU.</div><div><br></div><div=
>Any suggestions on how we can achieve this?</div><div><br></div><div>Thank=
 you,</div><div>Valentin.</div><div><br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">
&gt; ---<br>
&gt;=C2=A0 gdbstub.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 10 +=
+++++++++<br>
&gt;=C2=A0 hw/intc/armv7m_nvic.c=C2=A0 |=C2=A0 4 ++++<br>
&gt;=C2=A0 include/exec/gdbstub.h |=C2=A0 6 ++++++<br>
&gt;=C2=A0 3 files changed, 20 insertions(+)<br>
&gt;<br>
&gt; diff --git a/gdbstub.c b/gdbstub.c<br>
&gt; index 3c14c6a038..d4e39db8e7 100644<br>
&gt; --- a/gdbstub.c<br>
&gt; +++ b/gdbstub.c<br>
&gt; @@ -3585,6 +3585,16 @@ int gdbserver_start(const char *device)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; +bool gdb_attached(CPUState *cpu)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 GDBProcess *process =3D gdb_get_cpu_process(cpu);<br>
&gt; +=C2=A0 =C2=A0 if (process !=3D NULL) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return process-&gt;attached;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return false;<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 static void register_types(void)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 type_register_static(&amp;char_gdb_type_info);<br>
&gt; diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c<br>
&gt; index 13df002ce4..d6fff94bca 100644<br>
&gt; --- a/hw/intc/armv7m_nvic.c<br>
&gt; +++ b/hw/intc/armv7m_nvic.c<br>
&gt; @@ -21,6 +21,7 @@<br>
&gt;=C2=A0 #include &quot;sysemu/runstate.h&quot;<br>
&gt;=C2=A0 #include &quot;target/arm/cpu.h&quot;<br>
&gt;=C2=A0 #include &quot;exec/exec-all.h&quot;<br>
&gt; +#include &quot;exec/gdbstub.h&quot;<br>
&gt;=C2=A0 #include &quot;exec/memop.h&quot;<br>
&gt;=C2=A0 #include &quot;qemu/log.h&quot;<br>
&gt;=C2=A0 #include &quot;qemu/module.h&quot;<br>
&gt; @@ -1510,6 +1511,9 @@ static uint32_t nvic_readl(NVICState *s, uint32_=
t offset, MemTxAttrs attrs)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* We provide minimal-RAS only: RFSR=
 is RAZ/WI */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; +=C2=A0 =C2=A0 case 0xdf0: /* DHCSR */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Bit 0: DEBUGEN. */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return gdb_attached(CPU(cpu)) ? 1 : 0;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 case 0xf34: /* FPCCR */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!cpu_isar_feature(aa32_vfp_simd,=
 cpu)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h<br>
&gt; index a024a0350d..383f4e5224 100644<br>
&gt; --- a/include/exec/gdbstub.h<br>
&gt; +++ b/include/exec/gdbstub.h<br>
&gt; @@ -177,6 +177,12 @@ static inline uint8_t * gdb_get_reg_ptr(GByteArra=
y *buf, int len)<br>
&gt;=C2=A0 =C2=A0*/<br>
&gt;=C2=A0 int gdbserver_start(const char *port_or_device);<br>
&gt;=C2=A0 <br>
&gt; +/**<br>
&gt; + * gdb_attached: check if GDB is attached to a given CPU.<br>
&gt; + * @cpu: the CPU to check if GDB is attached to.<br>
&gt; + */<br>
&gt; +bool gdb_attached(CPUState *cpu);<br>
&gt; +<br>
&gt;=C2=A0 /**<br>
&gt;=C2=A0 =C2=A0* gdb_has_xml:<br>
&gt;=C2=A0 =C2=A0* This is an ugly hack to cope with both new and old gdb.<=
br>
<br>
<br>
-- <br>
Alex Benn=C3=A9e<br>
</blockquote></div></div>

--00000000000085db0605d72d1ac6--
