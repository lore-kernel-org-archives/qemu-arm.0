Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp3139349njb;
        Tue, 10 Dec 2024 00:18:30 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWN4U0fn1e8jjj29QTg0pN23ED7Fss155w3K260auKl0A0D0NfxIYtU7lrfpRS1TLPJ4gEZhMBuua5Zfg==@linaro.org
X-Google-Smtp-Source: AGHT+IHYTCvPbceAszbptUQhtucxhueTKrpcyBXZ3uCJ308EznN//AQyVQ1/je8fzEXF4mRXD6o3
X-Received: by 2002:a05:622a:4d07:b0:467:8217:aae3 with SMTP id d75a77b69052e-4678217ab77mr6195981cf.47.1733818710155;
        Tue, 10 Dec 2024 00:18:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733818710; cv=none;
        d=google.com; s=arc-20240605;
        b=DAYencqSd6ClGD3l6YmON/rDC2HM6Cbe87pB3f+p6OV0AYcKqBT4weujzfc/dg6nW3
         3VmX+Io4x0VgCDnfaX8j627FwuM1zuwUf4ZsRfq0lm4dGfY0rcyK1XlLYBfU9C37nbWg
         ld4IDhb2/GTYjN3c4SuU7Vm3kR1MK/yuXmUtIkvf16QTMoMRDFc6OCVPWVbKzUc5qTNj
         uVsDtlN1pS+s47AAfG88q5W4AWkD0N3/nYuZPwr6IjfZB3yDRV2GpZAtsyT/uLGjygra
         D9r7syitoH4UE8EInWbyIQoRpYF/PeV613kPyvYWXEUmu5OmvbS4iRwG7MJEvAC/JCvj
         HKPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=eTnOVMRfEikzF5Vj1vn0lvjRxVxUxWA7W6bt29SKfzI=;
        fh=wB/mkvPcS/qILZ9BC3pwQnoJN8uvRuD9PwSI0fk3iDM=;
        b=crokz9L1Mbp5aZdE68tnqVh+ZEFFq4BXZ/cS4lq+XJenSEUvrreMl/Mu6bmTG3EvzK
         LAmct3C3AVBd8SZ3sPJ25mhDqqSeezoST3MvPtCHPmCSfuu1fzXR1drqtluSNlgMhEqj
         k2vPcMulTeWos5tPivw3pxu32y2l2BLPLPP2n1x85unI1+K5xlFLhKxtMhmYiUrE3OZF
         Q0cbSJ480qfj9XbAHUNqQR4Wp6sWHwoisbYDGWW1Hp+FEs//LsksiyaJ6lnNq3qamad4
         y8QIx/3abl4jk5++EsQrTqIz7Yi7AHEhsDDtvR+5MvzY9RRtf7UVazvVwbtC/5naShDd
         /hBw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=Ua9XmlSA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4676c1a092fsi35934471cf.273.2024.12.10.00.18.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Dec 2024 00:18:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=Ua9XmlSA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tKvRN-00072Q-E3; Tue, 10 Dec 2024 03:17:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tKvRG-0006x3-E8
 for qemu-arm@nongnu.org; Tue, 10 Dec 2024 03:17:54 -0500
Received: from mail-vs1-xe31.google.com ([2607:f8b0:4864:20::e31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tKvRE-0000XU-Jp
 for qemu-arm@nongnu.org; Tue, 10 Dec 2024 03:17:50 -0500
Received: by mail-vs1-xe31.google.com with SMTP id
 ada2fe7eead31-4aff620b232so629758137.0
 for <qemu-arm@nongnu.org>; Tue, 10 Dec 2024 00:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1733818666; x=1734423466;
 darn=nongnu.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=eTnOVMRfEikzF5Vj1vn0lvjRxVxUxWA7W6bt29SKfzI=;
 b=Ua9XmlSAYZl5BWLmBxbPjjHbngdQqogn2pTscVehFYAdJYlLZhZLcr9elO2u6jXimv
 ZDB9f8UChXDkuE5m+V1354CtKBkUw8vRZx7Yqc1v19B9pltsinBr52xmQ10db47xBQCr
 d8RWG5Xna54GCNmMUB8K1qPCqR3kni+Cy+TAx5JbWxUGz7oiVTQ73+ee44n3BLIe9+Ab
 PnbQPRnhzoM3H0O1kurfJ5nxi11dL/Q2Wewqx8blNkD9cwNDzGkKUzjHSudUFYo0zZc4
 IzGPwYh5XYMKvzRHn3fhsK++ddS8Xnf6p9N7bJQ1XF0T3X42NPC97Y8XQaVxowWQYEet
 EewA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733818666; x=1734423466;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eTnOVMRfEikzF5Vj1vn0lvjRxVxUxWA7W6bt29SKfzI=;
 b=qEYiKnNThZfQ6bf3yKsRucHrG99PvmrBniZsO32xs7OSqsF5gjK1tivwhNDPtNdzDQ
 4MDeIfN1RTaizwHtfCwbfoFW5rOtFi/kflvcTf0Uu39WiqDE7/YGo4sqFXbbv1F2kuQW
 ZUvzdVMKw6y8IbnPI5mycmWdVCBbARQJ8jf00C0CqkwD4ofA9M9OlfzbjmKzPU2Y2CxK
 LcN4cVkQfHWVm4Kz4SYF2UNwEjweip4ikBFiFwE9emP9oHOQVrDyuCiKcMBkyobg7BLC
 i1TfoytSXEdSpn2UntmOAp/L3HQN1jC9gimdNRsSjxRuFAq1gKHLs79EdNHaLsobnu91
 UovA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXI1P8907Y5FQ+H6zFSrQnO69oxEPvmoQq/GFm8gotBDyBealnBodD+2eW0jCQpDwEsEI0OYuIEVw==@nongnu.org
X-Gm-Message-State: AOJu0YyFo8Abm+uE4xNd5l8oRPj2zOR9Qn1Kr8Y1Q0yqH9mFU8XJuwLa
 TwotwQVVWjO2HybtHlEiULTsRrqzDcdjf4+hhtPIUWR9liIHjr4oSz3f446gBCpNAn++CZYGvQZ
 v9ZU5GPlSnjgJCAQmebBxqY0/fIWBqYm8o6mo
X-Gm-Gg: ASbGncu8XH0GmsDiWE4QqhcFP2adm+fFbGOs8FcgPJ0uLzkssjDIO5PkEi/1ys9V51e
 AFefEaMNavRvUx8YUp4NOBamV1jkeFuhxX8Q=
X-Received: by 2002:a05:6102:54a5:b0:4b1:1b33:ed2f with SMTP id
 ada2fe7eead31-4b11b33f2f9mr1037706137.1.1733818666361; Tue, 10 Dec 2024
 00:17:46 -0800 (PST)
MIME-Version: 1.0
References: <20241209203629.74436-1-phil@philjordan.eu>
 <20241209203629.74436-4-phil@philjordan.eu>
 <c401b320-b382-4887-82bc-0252dd9f8c98@linaro.org>
In-Reply-To: <c401b320-b382-4887-82bc-0252dd9f8c98@linaro.org>
From: Phil Dennis-Jordan <phil@philjordan.eu>
Date: Tue, 10 Dec 2024 09:17:35 +0100
Message-ID: <CAAibmn0tDOeaCY_ZLsyvtiE5pqJB1PbgdXMcADj45zBaLMg6OA@mail.gmail.com>
Subject: Re: [PATCH 03/11] i386/hvf: Don't send signal to thread when kicking
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Cameron Esfahani <dirty@apple.com>, 
 Roman Bolshakov <rbolshakov@ddn.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Alexander Graf <agraf@csgraf.de>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000b6c1d10628e61d43"
Received-SPF: neutral client-ip=2607:f8b0:4864:20::e31;
 envelope-from=phil@philjordan.eu; helo=mail-vs1-xe31.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NEUTRAL=0.779 autolearn=no autolearn_force=no
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
X-TUID: nSRv2UteEOiQ

--000000000000b6c1d10628e61d43
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon 9. Dec 2024 at 22:22, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
>
wrote:

> On 9/12/24 21:36, phil@philjordan.eu wrote:
> > From: Phil Dennis-Jordan <phil@philjordan.eu>
> >
> > This seems to be entirely superfluous and is costly enough to show up i=
n
>
> So the pthread_kill(cpu->thread, SIG_IPI) is entirely superfluous?
>

Yes, that is my conclusion after looking at the code and testing without
the signal sending. (I am only talking about HVF/x86 here!)

By my understanding, the HVF vCPU thread is always in one of 3 states:
- running hv_vcpu_run_until (hv_vcpu_interrupt() forces the transition out
of this, even in edge cases)
- waiting in qemu_wait_io_event In the main  hvf_cpu_thread_fn loop
(signalling the condition variable will bring it out of this)
- actively processing a VM exit, I/O request, etc (whatever it=E2=80=99s do=
ing
can=E2=80=99t be interrupted, but it will make progress and check its job q=
ueue on
completion)

So I can=E2=80=99t see any purpose the signal is supposed to be serving. I =
mean,
maybe I=E2=80=99ve missed something important - always happy to be correcte=
d and
learn something new. :-)

I=E2=80=99ll still need to investigate if the arm64 version is also doing t=
his
unnecessarily and whether we can remove the signal handler entirely.


> > profiling. hv_vcpu_interrupt() has been demonstrated to very reliably
> > cause VM exits - even if the target vCPU isn't even running, it will
> > immediately exit on entry.
> >
> > Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>
> > ---
> >   target/i386/hvf/hvf.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
> > index 3b6ee79fb2..936c31dbdd 100644
> > --- a/target/i386/hvf/hvf.c
> > +++ b/target/i386/hvf/hvf.c
> > @@ -214,7 +214,7 @@ static inline bool
> apic_bus_freq_is_known(CPUX86State *env)
> >
> >   void hvf_kick_vcpu_thread(CPUState *cpu)
> >   {
> > -    cpus_kick_thread(cpu);
> > +    cpu->thread_kicked =3D true;
> >       hv_vcpu_interrupt(&cpu->accel->fd, 1);
> >   }
> >
>
>

--000000000000b6c1d10628e61d43
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon 9. Dec 2024 at 22:22, Philippe Mathieu-Daud=C3=A9 &l=
t;<a href=3D"mailto:philmd@linaro.org">philmd@linaro.org</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-c=
olor:rgb(204,204,204)">On 9/12/24 21:36, <a href=3D"mailto:phil@philjordan.=
eu" target=3D"_blank">phil@philjordan.eu</a> wrote:<br>
&gt; From: Phil Dennis-Jordan &lt;<a href=3D"mailto:phil@philjordan.eu" tar=
get=3D"_blank">phil@philjordan.eu</a>&gt;<br>
&gt; <br>
&gt; This seems to be entirely superfluous and is costly enough to show up =
in<br>
<br>
So the pthread_kill(cpu-&gt;thread, SIG_IPI) is entirely superfluous?<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Yes, that is my =
conclusion after looking at the code and testing without the signal sending=
. (I am only talking about HVF/x86 here!)</div><div dir=3D"auto"><br></div>=
<div dir=3D"auto">By my understanding, the HVF vCPU thread is always in one=
 of 3 states:</div><div dir=3D"auto">- running hv_vcpu_run_until (<span sty=
le=3D"font-family:-apple-system,helveticaneue">hv_vcpu_interrupt() forces t=
he transition out of this, even in edge cases)</span></div><div dir=3D"auto=
"><span style=3D"font-family:-apple-system,helveticaneue">- waiting in=C2=
=A0</span><span style=3D"font-family:&quot;gitlab mono&quot;,&quot;jetbrain=
s mono&quot;,menlo,&quot;dejavu sans mono&quot;,&quot;liberation mono&quot;=
,consolas,&quot;ubuntu mono&quot;,&quot;courier new&quot;,&quot;andale mono=
&quot;,&quot;lucida console&quot;,monospace;font-size:13px;white-space:pre;=
color:rgb(58,56,63)">qemu_wait_io_event </span>In the main =C2=A0<span styl=
e=3D"font-family:&quot;gitlab mono&quot;,&quot;jetbrains mono&quot;,menlo,&=
quot;dejavu sans mono&quot;,&quot;liberation mono&quot;,consolas,&quot;ubun=
tu mono&quot;,&quot;courier new&quot;,&quot;andale mono&quot;,&quot;lucida =
console&quot;,monospace;font-size:13px;white-space:pre;float:none;display:i=
nline!important;color:rgb(153,0,0)">hvf_cpu_thread_fn </span>loop (signalli=
ng the condition variable will bring it out of this)</div><div dir=3D"auto"=
>- actively processing a VM exit, I/O request, etc (whatever it=E2=80=99s d=
oing can=E2=80=99t be interrupted, but it will make progress and check its =
job queue on completion)</div><div dir=3D"auto"><br></div><div dir=3D"auto"=
>So I can=E2=80=99t see any purpose the signal is supposed to be serving. I=
 mean, maybe I=E2=80=99ve missed something important - always happy to be c=
orrected and learn something new. :-)<br></div><div dir=3D"auto"><br></div>=
<div dir=3D"auto">I=E2=80=99ll still need to investigate if the arm64 versi=
on is also doing this unnecessarily and whether we can remove the signal ha=
ndler entirely.</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left=
-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)"><br>
&gt; profiling. hv_vcpu_interrupt() has been demonstrated to very reliably<=
br>
&gt; cause VM exits - even if the target vCPU isn&#39;t even running, it wi=
ll<br>
&gt; immediately exit on entry.<br>
&gt; <br>
&gt; Signed-off-by: Phil Dennis-Jordan &lt;<a href=3D"mailto:phil@philjorda=
n.eu" target=3D"_blank">phil@philjordan.eu</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0target/i386/hvf/hvf.c | 2 +-<br>
&gt;=C2=A0 =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c<br>
&gt; index 3b6ee79fb2..936c31dbdd 100644<br>
&gt; --- a/target/i386/hvf/hvf.c<br>
&gt; +++ b/target/i386/hvf/hvf.c<br>
&gt; @@ -214,7 +214,7 @@ static inline bool apic_bus_freq_is_known(CPUX86St=
ate *env)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0void hvf_kick_vcpu_thread(CPUState *cpu)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt; -=C2=A0 =C2=A0 cpus_kick_thread(cpu);<br>
&gt; +=C2=A0 =C2=A0 cpu-&gt;thread_kicked =3D true;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0hv_vcpu_interrupt(&amp;cpu-&gt;accel-&gt;fd,=
 1);<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
<br>
</blockquote></div></div>

--000000000000b6c1d10628e61d43--
