MIME-Version: 1.0
Received: by 10.25.28.201 with HTTP; Tue, 14 Mar 2017 11:24:33 -0700 (PDT)
Received: by 10.25.28.201 with HTTP; Tue, 14 Mar 2017 11:24:33 -0700 (PDT)
In-Reply-To: <20170314173513.wruppu4js7ikaxu2@kozik-lap>
References: <20170313180432.7067-1-krzk@kernel.org>
	<87mvcnpzll.fsf@linaro.org>
	<20170314173513.wruppu4js7ikaxu2@kozik-lap>
Date: Tue, 14 Mar 2017 18:24:33 +0000
Message-ID: <CAHDbmO1apk81csbC7BJK2JFK23fvVBLb-wA5z7_y29T=ueFPyg@mail.gmail.com>
Subject: Re: [Qemu-arm] [PATCH v2 0/5] hw: arm: exynos: Bring up secondary CPU
 + CPUIDLE issue
From: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm <qemu-arm@nongnu.org>, qemu-devel@nongnu.org, 
	Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary=f403045e26407feb14054ab4f062
X-TUID: Qc/YPv1ghlmV

--f403045e26407feb14054ab4f062
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

That means you're on a pre-mttcg tree so that's not the reason.

On 14 Mar 2017 5:35 pm, "Krzysztof Kozlowski" <krzk@kernel.org> wrote:

> On Tue, Mar 14, 2017 at 04:55:34PM +0000, Alex Benn=C3=A9e wrote:
> >
> > Krzysztof Kozlowski <krzk@kernel.org> writes:
> >
> > > Hi,
> > >
> > <snip>
> > >
> > > Overview of the problem
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > On Exynos4210, by default Linux kernel uses cpuidle driver which trie=
s
> > > to enter low power mode, called AFTR (Arm Off, Top Running).  On real
> > > hardware this brings some power savings.  This AFTR mode requires
> second
> > > CPU to be off, so the driver (coupled cpuidle driver) when system is
> idle:
> > > 1. Turns off second CPU,
> > > 2. Enters AFTR on CPU0.
> > >
> > > However the QEMU system is then totally unresponsive (e.g. on serial
> console)
> > > and RCU stalls appear from time to time.  I spent some time on it and
> did not
> > > find the real cause behind the lag.  Maybe it is because the second C=
PU
> > > does not really power down itself and system just burns the cycles
> under spin
> > > locks?
> >
> > Was this tested post the MTTCG merge? Maybe there is an interaction
> > between power saving/halting the vCPU?
> >
> > I mention this because I already made some minor tweaks for handing the
> > WFI instruction in MTTCG. See commit c22edfebff. You can test this by
> > forcing the original behaviour by adding:
> >
> >   -accel tcg,thread=3Dsingle
> >
> > to your command line.
> >
>
> I am testing it on v2.8.0-2005-g17783ac828ad. Without any -accel, the
> system boots but responsiveness of serial console is bad. Bad but at
> least it is responding still a little bit.
>
> With the -accel you mentioned, system does not even reach user-space
> (initramfs).
>
> I tried rebasing on newer (e.g. v2.8.0-2182-g5e2fb7c598c6) but
> compilation fails all the time on:
> /home/dev/qemu/qemu/vl.c: In function =E2=80=98main=E2=80=99:
> /home/dev/qemu/qemu/vl.c:3131:18: error: =E2=80=98QEMU_OPTION_blockdev=E2=
=80=99
> undeclared (first use in this function)
>              case QEMU_OPTION_blockdev:
>
>
> Best regards,
> Krzysztof
>
>

--f403045e26407feb14054ab4f062
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">That means you&#39;re on a pre-mttcg tree so that&#39;s n=
ot the reason.</div><div class=3D"gmail_extra"><br><div class=3D"gmail_quot=
e">On 14 Mar 2017 5:35 pm, &quot;Krzysztof Kozlowski&quot; &lt;<a href=3D"m=
ailto:krzk@kernel.org">krzk@kernel.org</a>&gt; wrote:<br type=3D"attributio=
n"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">On Tue, Mar 14, 2017 at 04:55:34PM +0000,=
 Alex Benn=C3=A9e wrote:<br>
&gt;<br>
&gt; Krzysztof Kozlowski &lt;<a href=3D"mailto:krzk@kernel.org">krzk@kernel=
.org</a>&gt; writes:<br>
&gt;<br>
&gt; &gt; Hi,<br>
&gt; &gt;<br>
&gt; &lt;snip&gt;<br>
&gt; &gt;<br>
&gt; &gt; Overview of the problem<br>
&gt; &gt; =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D<br>
&gt; &gt; On Exynos4210, by default Linux kernel uses cpuidle driver which =
tries<br>
&gt; &gt; to enter low power mode, called AFTR (Arm Off, Top Running).=C2=
=A0 On real<br>
&gt; &gt; hardware this brings some power savings.=C2=A0 This AFTR mode req=
uires second<br>
&gt; &gt; CPU to be off, so the driver (coupled cpuidle driver) when system=
 is idle:<br>
&gt; &gt; 1. Turns off second CPU,<br>
&gt; &gt; 2. Enters AFTR on CPU0.<br>
&gt; &gt;<br>
&gt; &gt; However the QEMU system is then totally unresponsive (e.g. on ser=
ial console)<br>
&gt; &gt; and RCU stalls appear from time to time.=C2=A0 I spent some time =
on it and did not<br>
&gt; &gt; find the real cause behind the lag.=C2=A0 Maybe it is because the=
 second CPU<br>
&gt; &gt; does not really power down itself and system just burns the cycle=
s under spin<br>
&gt; &gt; locks?<br>
&gt;<br>
&gt; Was this tested post the MTTCG merge? Maybe there is an interaction<br=
>
&gt; between power saving/halting the vCPU?<br>
&gt;<br>
&gt; I mention this because I already made some minor tweaks for handing th=
e<br>
&gt; WFI instruction in MTTCG. See commit c22edfebff. You can test this by<=
br>
&gt; forcing the original behaviour by adding:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0-accel tcg,thread=3Dsingle<br>
&gt;<br>
&gt; to your command line.<br>
&gt;<br>
<br>
I am testing it on v2.8.0-2005-g17783ac828ad. Without any -accel, the<br>
system boots but responsiveness of serial console is bad. Bad but at<br>
least it is responding still a little bit.<br>
<br>
With the -accel you mentioned, system does not even reach user-space<br>
(initramfs).<br>
<br>
I tried rebasing on newer (e.g. v2.8.0-2182-g5e2fb7c598c6) but<br>
compilation fails all the time on:<br>
/home/dev/qemu/qemu/vl.c: In function =E2=80=98main=E2=80=99:<br>
/home/dev/qemu/qemu/vl.c:3131:<wbr>18: error: =E2=80=98QEMU_OPTION_blockdev=
=E2=80=99 undeclared (first use in this function)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case QEMU_OPTION_blockdev:<=
br>
<br>
<br>
Best regards,<br>
Krzysztof<br>
<br>
</blockquote></div></div>

--f403045e26407feb14054ab4f062--
