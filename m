MIME-Version: 1.0
Date: Wed, 23 Oct 2019 19:06:11 +0100
References: <20191018174431.1784-1-richard.henderson@linaro.org>
	<CAFEAcA-MyKoA63UF6DYQ6J-dKihYn9iyG09eFCgWT8j4OqsQnw@mail.gmail.com>
	<CAFEAcA-Xj-6CdVzgfcVONipApD5b5PZ84nPnvbbOQjQkqQLnqA@mail.gmail.com>
	<6e06dede-2470-92e1-eba9-40646ed56af0@linaro.org>
	<87zhhrmqyh.fsf@linaro.org>
	<3e366a5d-0de6-ff1d-7a0c-a40ef8a2bf98@linaro.org>
In-Reply-To: <3e366a5d-0de6-ff1d-7a0c-a40ef8a2bf98@linaro.org>
Message-ID: <CAHDbmO3BZCUMkk0Q=6ZcRqG7D47vy8enYdh6hpeVXsRoEL4FkQ@mail.gmail.com>
Subject: Re: [PATCH v8 00/22] target/arm: Reduce overhead of cpu_get_tb_cpu_state
From: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>, 
	QEMU Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000008f3597059597c591"
X-TUID: fsQsbkvMzGnJ

--0000000000008f3597059597c591
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

For system emulation? Sure. I think linux-user is harder because you need
the be crt and libs packaged.

On Wed, 23 Oct 2019, 17:13 Richard Henderson, <richard.henderson@linaro.org=
>
wrote:

> On 10/23/19 11:17 AM, Alex Benn=C3=A9e wrote:
> >>> Dropping this series again for the moment.
> >> Argh!  I had forgotten that we have no testing of armeb in check-tcg.
> >
> > Does it need it's own toolchain or can it be done with flags?
>
> I think the compiler only needs flags, so we might be able to gin
> something up
> for {aarch64_eb,armeb}-linux-user from __start.
>
>
> r~
>

--0000000000008f3597059597c591
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">For system emulation? Sure. I think linux-user is harder =
because you need the be crt and libs packaged.</div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 23 Oct 2019, 17:13 Ri=
chard Henderson, &lt;<a href=3D"mailto:richard.henderson@linaro.org">richar=
d.henderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">On 10/23/19 11:17 AM, Alex Benn=C3=A9e wrote:<br>
&gt;&gt;&gt; Dropping this series again for the moment.<br>
&gt;&gt; Argh!=C2=A0 I had forgotten that we have no testing of armeb in ch=
eck-tcg.<br>
&gt; <br>
&gt; Does it need it&#39;s own toolchain or can it be done with flags?<br>
<br>
I think the compiler only needs flags, so we might be able to gin something=
 up<br>
for {aarch64_eb,armeb}-linux-user from __start.<br>
<br>
<br>
r~<br>
</blockquote></div>

--0000000000008f3597059597c591--
