Received: by 2002:a17:505:5382:b0:1be9:327d:8ee3 with SMTP id ma2csp1547260njb;
        Sun, 9 Feb 2025 11:46:29 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVa9aH+G7l1Gk0d2Zha4FetVQrBH/hytB0Uq2GCMISYaplZBmuCM7l9trRDv4W+tDJWGpq7UZchMdD4eA==@linaro.org
X-Google-Smtp-Source: AGHT+IFMxwX1Qg+6nzavMQ4UJKSjo1ICxanDwqIkYvPHtpHB1pCrnbnUpcvm3NY1at1HbqlGJ+js
X-Received: by 2002:ac8:7d4b:0:b0:466:9197:b4fa with SMTP id d75a77b69052e-47168911fb9mr140800431cf.21.1739130389623;
        Sun, 09 Feb 2025 11:46:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739130389; cv=none;
        d=google.com; s=arc-20240605;
        b=b3XAKBlhKtmicLSAq77btta03OGfCfhXofirum5gfcUXLpXPyyAyTCnwNMJpFcDV+c
         EwO+NmvsBiJwKyy8wo76lL4vO1N7oupCdgMS8dr5AeyUubbimq2YbfP3O+yVYXGhsyMp
         jqwrt+HKzDa4XrYmsRnST1LuiRGCrj6E/tGpPhFXvGgmEFBhP9/iYuJqHrYLzicwtDl7
         wBjp40IiE9dSh6kZZT4k4pQBiZEw4ywBrIe1RJpYI8CunL/WxmEcO3vRzlkY6Ka0ds9F
         DtDZvmcvASwadZLhD+NQF6J0LB5Su3xNQKaps8qgS8RmrwrkPzgOIuEnQEErVXQlgNVs
         EUdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=urNuZnXPwv+gJ6vliVoctc1I7osNV5qRMxUlbAmOQQA=;
        fh=HDs+tKmg7mFvChaCY0I3Eu3uqK6YdcowOs33hJhFpUs=;
        b=LFTitS11Mhhh6j01o0m4egNNafIz3XDUanhuyIklWt2H6eN8Ue+f2aQSF6Q0OzcOZW
         gDrRO/dlvqXaVr7VukhTRFNLcbDR1tIYk9RB9gJ9nsvqKFj0fKuHt4yigxIhCEtlX7pH
         sWeWIN5yrzddEc+bcEhyBEux1ZSnU6/+Od4C5FB1Wd5M5NnvPCelfBC4y1AEV86w22Rx
         ZOkp+K3+QeBCe+5L+9R8juWTvCndlh1tFItXMOnif2PjcXCOG4uEEji1KQzAp4BzPReA
         uf0Tkb0e5494nO824O5Mu6khdUJbc+It1W7OwYGTs023liCOM9ZonV/k/kNNCbDhxvpH
         khJg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=VjMyjEG8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4718d1679d4si14551311cf.444.2025.02.09.11.46.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 09 Feb 2025 11:46:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=VjMyjEG8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1thDFS-00060p-Qy; Sun, 09 Feb 2025 14:45:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1thDFP-0005zi-Hs
 for qemu-arm@nongnu.org; Sun, 09 Feb 2025 14:45:44 -0500
Received: from mail-vk1-xa2b.google.com ([2607:f8b0:4864:20::a2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1thDFM-0000OG-BJ
 for qemu-arm@nongnu.org; Sun, 09 Feb 2025 14:45:42 -0500
Received: by mail-vk1-xa2b.google.com with SMTP id
 71dfb90a1353d-52043dec766so217383e0c.1
 for <qemu-arm@nongnu.org>; Sun, 09 Feb 2025 11:45:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1739130337; x=1739735137;
 darn=nongnu.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=urNuZnXPwv+gJ6vliVoctc1I7osNV5qRMxUlbAmOQQA=;
 b=VjMyjEG8ibVIoVKsUXkpdL656fgGSU3AzM/o/H5KW47hJtQ4PqDTw/OSJP/DHfofwJ
 aBH3c5pwDz35E/GoE1IGSVu7EquyfLdx7rM8pYoAm2caAtVtPox9XIFkuRfwN6dlhHCK
 Xi4VymXxSzZr7F2CuPiUE9TOIqwJMRKwcXBc+AvwV80vsVPrVMBYlw7ktLAmiDgxTMCT
 mo2X7a4Nk8MtQByhszJb2SJJ1feL7TEcqHsEunH0qWC26gbrOF7po0s++D8CfxSiVxDh
 1Pe+0MErEGx+U0hTK/mWBqLWYjQzbbVv33lEXCcP13r9/2bBq+LeiUhqkq1q755ZGBN6
 x9Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739130337; x=1739735137;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=urNuZnXPwv+gJ6vliVoctc1I7osNV5qRMxUlbAmOQQA=;
 b=n4/QJMPNk4Wr/HwyWK53lcZ7XutVACUDitMpxKYUUocNKuJ9wLfmHTWJdoMUzxE08w
 gt0CaMT3LO6gn0NUmqc+A5a7RLe5vvIaArvD9WXEegcBB4Zfx9Ezehsu4ZGEi1bc5/1I
 5T5yoYE2XWE3HsbGo79DaYa0PR3ZdCPgQhwZB6ejWaYv7tw421x3Rw17279clILBQ+25
 7Cstfe/pDWydwFsFB8rjvizJKMk+6asHAOOVi9hMPCI6onn/0IEmZB0sO4SWz0HxPzNS
 5tEWrthlARzepdVTvOxbY4TwACJYbCjDnBF9j/IQ/b9wuvcxMvgcjvGte6c5HE6gZRvq
 XoFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW25z9OaWMZoOu8QzrT9DizDA8HFXmdtBct/cAi0lgiXl7KuLUvxNKw7lXl+m49coPxONSrwjkKOA==@nongnu.org
X-Gm-Message-State: AOJu0Yy/ABytWpfh0A8J7o4qiGwi6pQzC7tPQjbeNOmKKyryGUz3Ni/y
 W0yxm5Gdq2bbKzsC4ehGoesLOXYcLt5eYKOYMKrMz444SZ971bx4IM7dYwnCrDx5KQ0rQfQXW92
 oJDljaaE39+17HElnzXxbETtuP+mIbsB1ijB4
X-Gm-Gg: ASbGncsrkACQiajMwR3gyv6FW9bdB+Jf5rpwXiGw9ZsmFafaVxqBqRzaXuq3ZwuUYcD
 DU4HcR6kPSveWgX/WG14nHdSemPq88dCEbKxCDlt9XGpgtRz+DuziPWKDk06TCGymYEVuQkLQ
X-Received: by 2002:a05:6122:2c84:b0:51f:405f:c967 with SMTP id
 71dfb90a1353d-51f405fcc7amr4059363e0c.7.1739130335635; Sun, 09 Feb 2025
 11:45:35 -0800 (PST)
MIME-Version: 1.0
References: <20241209203629.74436-1-phil@philjordan.eu>
 <20241209203629.74436-2-phil@philjordan.eu>
 <64671a22-a1d3-4d76-839c-287e5cf2390b@linaro.org>
In-Reply-To: <64671a22-a1d3-4d76-839c-287e5cf2390b@linaro.org>
From: Phil Dennis-Jordan <phil@philjordan.eu>
Date: Sun, 9 Feb 2025 20:45:24 +0100
X-Gm-Features: AWEUYZmZ5HszkudiG_qqFFkPBoFn_OqWcR7OBBCUhj8xxekGCQHH3XwdROj7Yqw
Message-ID: <CAAibmn3=-R69ap7AkdwS9w0LO__FmCtMp2eHbZVNn2bt-+D_5A@mail.gmail.com>
Subject: Re: [PATCH 01/11] hvf: Add facility for initialisation code prior to
 first vCPU run
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Igor Mammedov <imammedo@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, 
 Roman Bolshakov <rbolshakov@ddn.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Alexander Graf <agraf@csgraf.de>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000dfc52a062dbad566"
Received-SPF: neutral client-ip=2607:f8b0:4864:20::a2b;
 envelope-from=phil@philjordan.eu; helo=mail-vk1-xa2b.google.com
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
X-TUID: 57mdIl4/kdP0

--000000000000dfc52a062dbad566
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 5 Feb 2025 at 22:02, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
>
wrote:

> +Igor
>
> On 9/12/24 21:36, phil@philjordan.eu wrote:
> > From: Phil Dennis-Jordan <phil@philjordan.eu>
> >
> > Some VM state required for fully configuring vCPUs is only available
> > after all devices have been through their init phase. This extra
> > function, called just before each vCPU makes its first VM entry,
> > allows us to perform such architecture-specific initialisation.
> >
> > Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>
> > ---
> >   accel/hvf/hvf-accel-ops.c | 5 +++++
> >   include/sysemu/hvf_int.h  | 1 +
> >   target/arm/hvf/hvf.c      | 4 ++++
> >   target/i386/hvf/hvf.c     | 4 ++++
> >   4 files changed, 14 insertions(+)
> >
> > diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
> > index d60874d3e6..c17a9a10de 100644
> > --- a/accel/hvf/hvf-accel-ops.c
> > +++ b/accel/hvf/hvf-accel-ops.c
> > @@ -442,6 +442,11 @@ static void *hvf_cpu_thread_fn(void *arg)
> >       cpu_thread_signal_created(cpu);
> >       qemu_guest_random_seed_thread_part2(cpu->random_seed);
> >
> > +    if (!cpu_can_run(cpu)) {
> > +        qemu_wait_io_event(cpu);
> > +    }
> > +    hvf_vcpu_before_first_run(cpu);
>
> Could this be fixed by the cpu_list_add() split?
> https://lore.kernel.org/qemu-devel/20250128142152.9889-1-philmd@linaro.or=
g/
>
>
You mean by implementing a wire() handler for HVF CPU classes? Possibly -
I'll need to apply those patches locally and trace in what context those
wire methods would run. HVF wants most vCPU-specific functions to be run on
the thread owning the vCPU, so if wire() runs on the main QEMU event
handling thread (or anything other than the vCPU's own thread), it won't
work for patches 2 & 7 from this series which actually do stuff in these
before_first_run() handlers.

I notice that Igor's v2 of the cpu_list_add patch set no longer includes
the wire()/unwire() handlers=E2=80=A6
https://patchew.org/QEMU/20250207162048.1890669-1-imammedo@redhat.com/

Another option might be to use async_run_on_cpu() for such early
on-vCPU-thread initialisation, but I figured that option would perhaps be a
little to indirect to readers of the code and difficult to reason about.

>       do {
> >           if (cpu_can_run(cpu)) {
> >               r =3D hvf_vcpu_exec(cpu);
>

--000000000000dfc52a062dbad566
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 5 Feb 2025 a=
t 22:02, Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@linaro.or=
g" target=3D"_blank">philmd@linaro.org</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">+Igor<br>
<br>
On 9/12/24 21:36, <a href=3D"mailto:phil@philjordan.eu" target=3D"_blank">p=
hil@philjordan.eu</a> wrote:<br>
&gt; From: Phil Dennis-Jordan &lt;<a href=3D"mailto:phil@philjordan.eu" tar=
get=3D"_blank">phil@philjordan.eu</a>&gt;<br>
&gt; <br>
&gt; Some VM state required for fully configuring vCPUs is only available<b=
r>
&gt; after all devices have been through their init phase. This extra<br>
&gt; function, called just before each vCPU makes its first VM entry,<br>
&gt; allows us to perform such architecture-specific initialisation.<br>
&gt; <br>
&gt; Signed-off-by: Phil Dennis-Jordan &lt;<a href=3D"mailto:phil@philjorda=
n.eu" target=3D"_blank">phil@philjordan.eu</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0accel/hvf/hvf-accel-ops.c | 5 +++++<br>
&gt;=C2=A0 =C2=A0include/sysemu/hvf_int.h=C2=A0 | 1 +<br>
&gt;=C2=A0 =C2=A0target/arm/hvf/hvf.c=C2=A0 =C2=A0 =C2=A0 | 4 ++++<br>
&gt;=C2=A0 =C2=A0target/i386/hvf/hvf.c=C2=A0 =C2=A0 =C2=A0| 4 ++++<br>
&gt;=C2=A0 =C2=A04 files changed, 14 insertions(+)<br>
&gt; <br>
&gt; diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c<br>
&gt; index d60874d3e6..c17a9a10de 100644<br>
&gt; --- a/accel/hvf/hvf-accel-ops.c<br>
&gt; +++ b/accel/hvf/hvf-accel-ops.c<br>
&gt; @@ -442,6 +442,11 @@ static void *hvf_cpu_thread_fn(void *arg)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0cpu_thread_signal_created(cpu);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_guest_random_seed_thread_part2(cpu-&gt;=
random_seed);<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +=C2=A0 =C2=A0 if (!cpu_can_run(cpu)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_wait_io_event(cpu);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 hvf_vcpu_before_first_run(cpu);<br>
<br>
Could this be fixed by the cpu_list_add() split?<br>
<a href=3D"https://lore.kernel.org/qemu-devel/20250128142152.9889-1-philmd@=
linaro.org/" rel=3D"noreferrer" target=3D"_blank">https://lore.kernel.org/q=
emu-devel/20250128142152.9889-1-philmd@linaro.org/</a><br>
<br></blockquote><div><br></div><div>You mean by implementing a wire() hand=
ler for HVF CPU classes? Possibly - I&#39;ll need to apply those patches lo=
cally and trace in what context those wire methods would run. HVF wants mos=
t vCPU-specific functions to be run on the thread owning the vCPU, so if wi=
re() runs on the main QEMU event handling thread (or anything other than th=
e vCPU&#39;s own thread), it won&#39;t work for patches 2 &amp; 7 from this=
 series which actually do stuff in these before_first_run() handlers.</div>=
<div><br></div><div>I  notice that Igor&#39;s v2 of the cpu_list_add patch =
set no longer includes the wire()/unwire() handlers=E2=80=A6</div><div><a h=
ref=3D"https://patchew.org/QEMU/20250207162048.1890669-1-imammedo@redhat.co=
m/">https://patchew.org/QEMU/20250207162048.1890669-1-imammedo@redhat.com/<=
/a></div><div><br></div><div>Another option might be to use async_run_on_cp=
u() for such early on-vCPU-thread initialisation, but I figured that option=
 would perhaps be a little to indirect to readers of the code and difficult=
 to reason about.</div><div><br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0do {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (cpu_can_run(cpu)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r =3D hvf_vcpu_e=
xec(cpu);<br>
</blockquote></div></div>
</div>

--000000000000dfc52a062dbad566--
