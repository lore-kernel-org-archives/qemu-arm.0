Received: by 2002:a17:505:42a7:b0:1be9:327d:8ee3 with SMTP id rt7csp2795553njb;
        Tue, 24 Sep 2024 05:32:22 -0700 (PDT)
X-Received: by 2002:a05:651c:542:b0:2f3:cd4e:b931 with SMTP id 38308e7fff4ca-2f7cb30cb9bmr94430401fa.10.1727181141750;
        Tue, 24 Sep 2024 05:32:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727181141; cv=none;
        d=google.com; s=arc-20160816;
        b=dybxseea/iicnK+S343+BKLWLRaRGYHEZT+lphaDBa5VAevy02ZWf6Ms+wfjt267dS
         2Lni02zk1+Ntb8Y44sAA1I1msHjd935CjqcA/J7/2oS3CtHMOAXIqd/rYAJY52IRXpdA
         6YvF4vQKsBpjwGeTFaScifqZjwmiIuL3KcEnQPIlnLRPjHc5uS0oJkCnTegSiskWHker
         Ea8K0T+Sx+IHzzx67N80xMZy/9DiLtBpIanj0nbbOGdXI/66hKC4ONE+PvMSRfVAAUU6
         beApksNh6Df6OlzmMhZSbgYMQoPRj+9onXz6Hd8vU+FzJxDxS1SV4eyxgju2rfo38en6
         ikYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=GyRKw9qtbFiiitlNZMMOTwG0z8GW4JOzDpGvDMyvWiI=;
        fh=JiTWXjSUoAsVgXHVDv5qopTke0cv8JhW4+l60+TEk7A=;
        b=0GWTzLFrMRPYSwaJHtK5G6CddCid25lGnahTVbCuxdBgLaDdHcO211TrYAopyfQIln
         TMDshkN3nCnT1WqvO6DBQoI7GrkIIRKZHKyZmb4+/eywXyXbnNOhyIBWjyM6p9Q7III9
         UGfAi3t8FnGBzcn05RGSAXlHRxfto8Ch67b5pqJY8+NA+qn0eHP0n3x+npzOhEiJJJP7
         M/h1/ri/j/1cFWsd3HS1/Ql/9CFrdJd/IVk/8LSZjAnjh3+YCCwzqFkS0hqL9wYQwJHA
         Jtzih5rxTRLe+M0rpnLqdRdDgTOlsznoVjVOKtVaj0zj5bFT9SM6bkErGLcciHc/MjjK
         WN+Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="zH6wxjf/";
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 38308e7fff4ca-2f8d289b4ccsor3265681fa.13.2024.09.24.05.32.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 24 Sep 2024 05:32:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="zH6wxjf/";
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727181141; x=1727785941; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GyRKw9qtbFiiitlNZMMOTwG0z8GW4JOzDpGvDMyvWiI=;
        b=zH6wxjf/BqO4O/w6PlG8TwDu3Xie8RyEz5eLQ5mCrV5zdurj4hE07wHZxBDaXznVUU
         cQrDnOsxegVeN/pd2Sk8EKg6oemVNheRrua9l6Kr0As1t/DybHEP9Tg9tInMI5EHh5sn
         9QOZ9BruYZRgIlEZX6SA2RBtBCgf/WFKv4f9qvSXsGKezs3suZYCYU5eYq8JEqnRvctw
         rK6+YB3e6ffB/9p0tDWxlf/oJ69Vmq6hUMfiTZZakFGnkvGYdOv9Kd0OKNtd0aP6BSap
         2w9mG/5NYqC67C6JO6zjbdRPPlN+GUhWxc1sSrWtvw0cs7etyI7aFp1DFZ5YLsqwer70
         OhxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727181141; x=1727785941;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GyRKw9qtbFiiitlNZMMOTwG0z8GW4JOzDpGvDMyvWiI=;
        b=tu8vKPVadiCVxzfM3DmX1mjXqN1dRdpOPnypiNAI3R+G7CyJlOl4FfVHj2ZMUVajpI
         OoYcpAciCTOPzGJeY5OVCyevuksKekZgP06wrMrbuVvl7cmsKsuKtDfcp8L9cj+kaOK9
         aTC7zV6l8ZiRWeZEOYVHYDCLBWeiuMZxemEebZs5u+9XOtU2JaumIWfdP6zk/jYm0+E3
         BvDkSspPiIRMLcU8CMHqXy0VIoMl7aULBSOrktpMsTe177P3Oxm26Tn0fluZZcILSkgD
         9IyODsfTHscG2Bz+/QHQ+NmPIWC/Bo5PBSzXsspr4ZRV8/hClX+szC3FJZ30jN1Vd1cR
         FPoA==
X-Gm-Message-State: AOJu0YzxiRp8on9FGUjbyUaRp86oD/ereS3969BOl2khoU+kUncUAh3f
	gRa57NzPPNXvRavHUH8qmZ+WpAQRhAsaHJR9KowxTSnkSZNIQfQLv5PRFLl9+l52GaXrr4mqHIC
	ZuWxPlhKAyfbcPMb2IeUKYJBXyEZfEL11igokrCAN
X-Google-Smtp-Source: AGHT+IH7lyPF2LdCsDkake6J/K8hp6pJdd40tPZtKXa6rYUJkS7RdcfNSTYmoHT9kDCLD+qiP1iWYgJFuT3gjDhmpSM=
X-Received: by 2002:a2e:96c8:0:b0:2f3:c384:71ee with SMTP id
 38308e7fff4ca-2f7cb358d5amr77860411fa.33.1727181140913; Tue, 24 Sep 2024
 05:32:20 -0700 (PDT)
MIME-Version: 1.0
References: <20240923-feature-build-info-cli-v2-1-66b3462f16a1@linaro.org>
 <ZvGbRWSPPLJDx7BX@redhat.com> <ka5ia.wqlrej2ef9q@linaro.org>
 <ZvJ8JblXVH-kJGi1@redhat.com> <CAAjaMXZ8q0is2-7-kjyBs=YsBc03=0R2XcYiR-fp05=bcerD6Q@mail.gmail.com>
 <87setpcl9p.fsf@draig.linaro.org> <ZvKrqCR5L21-6k54@redhat.com>
In-Reply-To: <ZvKrqCR5L21-6k54@redhat.com>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Tue, 24 Sep 2024 15:32:10 +0300
Message-ID: <CAAjaMXYX5f5_Q6WezmteM77dSqTHZOdCB7LdZYY6Tj9PtKkSCw@mail.gmail.com>
Subject: Re: [PATCH v2] Add -build-info and -build-info-json CLI arguments
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	"open list:ARM SMMU <qemu-arm@nongnu.org>," <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>, 
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Gustavo Romero <gustavo.romero@linaro.org>, 
	Peter Maydell <peter.maydell@linaro.org>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Pierrick Bouvier <pierrick.bouvier@linaro.org>, 
	Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000005e15bb0622dcb21f"
X-TUID: fZUiH2q2BCvG

--0000000000005e15bb0622dcb21f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Daniel,

On Tue, Sep 24, 2024, 3:08 PM Daniel P. Berrang=C3=A9 <berrange@redhat.com>
wrote:

> On Tue, Sep 24, 2024 at 01:02:26PM +0100, Alex Benn=C3=A9e wrote:
> > Manos Pitsidianakis <manos.pitsidianakis@linaro.org> writes:
> >
> > > Hello Daniel,
> > >
> > > On Tue, 24 Sept 2024 at 11:45, Daniel P. Berrang=C3=A9 <berrange@redh=
at.com>
> wrote:
> > >>
> > >> On Mon, Sep 23, 2024 at 10:09:32PM +0300, Manos Pitsidianakis wrote:
> > >> > Hello Daniel,
> > >> >
> > >> > On Mon, 23 Sep 2024 19:45, "Daniel P. Berrang=C3=A9" <
> berrange@redhat.com> wrote:
> > >> > > On Mon, Sep 23, 2024 at 09:05:24AM +0300, Manos Pitsidianakis
> wrote:
> > <snip>
> > >> > > ie, look a query-audiodevs to discover what audio baxckends are
> > >> > > built-in, don't look for CONFIG_XXX settings related to audio.
> > >> > > If there are gaps in information we can query from QMP, we shoul=
d
> > >> > > aim to close those gaps.
> > >> > >
> > >> > > IOW, I don't think we should expose this build info info in eith=
er
> > >> > > human readable or machine readable format.
> > >> >
> > >> > QAPI/QMP is not the perspective of this patch, this is for people
> who use
> > >> > custom-built (i.e. not from a distro) binaries and want to be able
> to
> > >> > identify how it was built. Launching a binary to query stuff is
> > >> > unnecessarily complex for this task, and the info is not generally
> > >> > interesting to the API consumers as you said.
> > >>
> > >> Launching QEMU to talk QMP is our defined public API for querying
> > >> anything about the capabilities of QEMU. We're worked hard to get
> > >> away from providing ad-hoc ways to query QEMU from the command
> > >> line and going back to that is not desirable. It may be slightly
> > >> more complicated, but not by very much.
> > >
> > > Again, this is not a "capabilities discovery" API. It lists the
> > > build-time configuration of the binary. Perhaps we can expose it in a
> > > different way so that people don't end up confused?
> >
> > I think the problem is however much we might say it's not a capabilitie=
s
> > discovery API it's very existence encourages users to use it as one.
> >
> > What about a script:
> >
> >   qemu-get-build-info </path/to/qemu>
> >
> > which would launch the binary and query it over QMP? Would that work?
>
> If this is purely a debugging aid, we could make use of ELF notes to
> just stick the config-host.h content into the binary. This has precedent
> in systemd package notes (https://github.com/systemd/package-notes) and
> is more clearly *NOT* an end user CLI option, nor a public API in QMP.
>
> Querying is then
>
>     objdump -j .note.qemu-config-h -s /usrbin/qemu-system-x86_64
>

That's actually a way better solution! I will attempt it for the next
revision.

Manos

>

--0000000000005e15bb0622dcb21f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hello Daniel,<br><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 24, 2024, 3:08 PM Daniel P. B=
errang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com">berrange@redhat.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
On Tue, Sep 24, 2024 at 01:02:26PM +0100, Alex Benn=C3=A9e wrote:<br>
&gt; Manos Pitsidianakis &lt;<a href=3D"mailto:manos.pitsidianakis@linaro.o=
rg" target=3D"_blank" rel=3D"noreferrer">manos.pitsidianakis@linaro.org</a>=
&gt; writes:<br>
&gt; <br>
&gt; &gt; Hello Daniel,<br>
&gt; &gt;<br>
&gt; &gt; On Tue, 24 Sept 2024 at 11:45, Daniel P. Berrang=C3=A9 &lt;<a hre=
f=3D"mailto:berrange@redhat.com" target=3D"_blank" rel=3D"noreferrer">berra=
nge@redhat.com</a>&gt; wrote:<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; On Mon, Sep 23, 2024 at 10:09:32PM +0300, Manos Pitsidianakis=
 wrote:<br>
&gt; &gt;&gt; &gt; Hello Daniel,<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; On Mon, 23 Sep 2024 19:45, &quot;Daniel P. Berrang=C3=A9=
&quot; &lt;<a href=3D"mailto:berrange@redhat.com" target=3D"_blank" rel=3D"=
noreferrer">berrange@redhat.com</a>&gt; wrote:<br>
&gt; &gt;&gt; &gt; &gt; On Mon, Sep 23, 2024 at 09:05:24AM +0300, Manos Pit=
sidianakis wrote:<br>
&gt; &lt;snip&gt;<br>
&gt; &gt;&gt; &gt; &gt; ie, look a query-audiodevs to discover what audio b=
axckends are<br>
&gt; &gt;&gt; &gt; &gt; built-in, don&#39;t look for CONFIG_XXX settings re=
lated to audio.<br>
&gt; &gt;&gt; &gt; &gt; If there are gaps in information we can query from =
QMP, we should<br>
&gt; &gt;&gt; &gt; &gt; aim to close those gaps.<br>
&gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; IOW, I don&#39;t think we should expose this build =
info info in either<br>
&gt; &gt;&gt; &gt; &gt; human readable or machine readable format.<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; QAPI/QMP is not the perspective of this patch, this is f=
or people who use<br>
&gt; &gt;&gt; &gt; custom-built (i.e. not from a distro) binaries and want =
to be able to<br>
&gt; &gt;&gt; &gt; identify how it was built. Launching a binary to query s=
tuff is<br>
&gt; &gt;&gt; &gt; unnecessarily complex for this task, and the info is not=
 generally<br>
&gt; &gt;&gt; &gt; interesting to the API consumers as you said.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Launching QEMU to talk QMP is our defined public API for quer=
ying<br>
&gt; &gt;&gt; anything about the capabilities of QEMU. We&#39;re worked har=
d to get<br>
&gt; &gt;&gt; away from providing ad-hoc ways to query QEMU from the comman=
d<br>
&gt; &gt;&gt; line and going back to that is not desirable. It may be sligh=
tly<br>
&gt; &gt;&gt; more complicated, but not by very much.<br>
&gt; &gt;<br>
&gt; &gt; Again, this is not a &quot;capabilities discovery&quot; API. It l=
ists the<br>
&gt; &gt; build-time configuration of the binary. Perhaps we can expose it =
in a<br>
&gt; &gt; different way so that people don&#39;t end up confused?<br>
&gt; <br>
&gt; I think the problem is however much we might say it&#39;s not a capabi=
lities<br>
&gt; discovery API it&#39;s very existence encourages users to use it as on=
e.<br>
&gt; <br>
&gt; What about a script:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0qemu-get-build-info &lt;/path/to/qemu&gt;<br>
&gt; <br>
&gt; which would launch the binary and query it over QMP? Would that work?<=
br>
<br>
If this is purely a debugging aid, we could make use of ELF notes to<br>
just stick the config-host.h content into the binary. This has precedent<br=
>
in systemd package notes (<a href=3D"https://github.com/systemd/package-not=
es" rel=3D"noreferrer noreferrer" target=3D"_blank">https://github.com/syst=
emd/package-notes</a>) and<br>
is more clearly *NOT* an end user CLI option, nor a public API in QMP.<br>
<br>
Querying is then<br>
<br>
=C2=A0 =C2=A0 objdump -j .note.qemu-config-h -s /usrbin/qemu-system-x86_64<=
br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">T=
hat&#39;s actually a way better solution! I will attempt it for the next re=
vision.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Manos=C2=A0</div=
><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">
</blockquote></div></div></div>

--0000000000005e15bb0622dcb21f--
