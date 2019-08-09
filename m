Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp9344489wrv;
        Fri, 9 Aug 2019 08:30:29 -0700 (PDT)
X-Received: by 2002:a05:6830:1197:: with SMTP id u23mr17497514otq.36.1565364629746;
        Fri, 09 Aug 2019 08:30:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565364629; cv=none;
        d=google.com; s=arc-20160816;
        b=z9gxYoSkt9Y/hVE1q72dD4gFCuI04SdE0aYk/EFic+sVLkm+xdGjNbhQtLQuLX03NJ
         587igfFaNeLytMLXLbM2PZZyWw7tvssjkL/yCdwrF3zfBmApr8tB6lPam8wRzjTZv5zp
         euTeNumBLqixX/D/lWulndX2BagarkyX4nipoQlAX2uRjOiwNJPEZuDo8bCwMr2OXpXu
         2xtH0eiN1a1/Zhy9c4JbyhITdeTyd4IG/BByuHFicIAyZz3PpzBbLqHXu+dgnWukKts3
         K6ZE9dF3sjOJIZlBwbrPalApsy9xC5L/umFgXBR3bH7ETrTGyiRsC1soTAwwFXN1IQEv
         minA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Ku8xseFYZ6gO8QVrGjY4WccKor9H1541AceJ4ihjarg=;
        b=QHzo3HV9AQaattHhWr0FYXb9JYXQ3Nvaes7OtsGMyxwZDnTIwvTw/xca4FgoZviP35
         ov2DHEO5DaUbIMZNF3UNl5sp5PksYp8nyEtwSJK5YLZ+xZ6SUaqWRAYQO7vukbOzJ9Ea
         YOQOVLkGE8HUUH04YrsTI1ohnQmFxNfhofYgIPUY6+sSQ5NwvHTCJ5qPjfXvhiov5FSf
         VttbkUszOegNuYkfZAQSwUeZOtH0HbR0RxfuO09yYMYzQX9PTUwRjzI04vVpCCLqb3yq
         +98SIagt0Kz5GKNf+Ke9IcHi9TsB2j2Mfr+CbWFWnT5L6IWTXqvRKkH8agwCA1/FW/Ko
         1VtQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="Dedc/AJm";
       spf=pass (google.com: domain of aleksandar.m.mail@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=aleksandar.m.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <aleksandar.m.mail@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id o62sor48911486ota.61.2019.08.09.08.30.29
        (Google Transport Security);
        Fri, 09 Aug 2019 08:30:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of aleksandar.m.mail@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="Dedc/AJm";
       spf=pass (google.com: domain of aleksandar.m.mail@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=aleksandar.m.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ku8xseFYZ6gO8QVrGjY4WccKor9H1541AceJ4ihjarg=;
        b=Dedc/AJmDXIu6IYp7H4c2kgcOEZAUt7Et3ojVYcvWiJPMORJlUDGuBdPrzZ1Is9Zzh
         avowI8N2AlSRVB7G+hzcdmc+3stFlAIKM5jIFjcaHoPJHIMaDOyU9rFcwLt7BVNV6zLB
         Wb+M2cKXBP9kEPoGfo9zhYInK7okvYAmYBU2IkIZJt0OzskzXQFrmQ2+AmSIUTKGkLEC
         kEE653dQrVyecYoYpzzqEXS2s0CvkUBjHxj8likJand+3SPu+wAo0vatydF8v56ynzlF
         lk3Gaq7BypQvsjPfGsRnA5N0qgzjekVjATcQpD/Zx4jYaOHtYeYfwO4s385Wp94w9X4V
         Pa3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ku8xseFYZ6gO8QVrGjY4WccKor9H1541AceJ4ihjarg=;
        b=ZYyFeQtQAoXijKi63WmKLGBSHCjMQ9t1MV4kMrPAzS8NbkIUUniOoeNg43d1rjyCw8
         sgeYfFZYYdJF1UwVxMaNKgraBzKlRJ2+6+1kXU9rwzrCABgfV1yl67hCL7UHFIh/xj28
         Cuh/eDE90IoPBBCqN68slefmap1Fc7oKvCLTCjKC8Ujz5XIPbC02NBa0ir9VRvcidYKn
         HnMcuzNk+iyWAa8aXYIywcKZlnuDvkvMVgRET0mB6oEtl4C0X+bir2lv41DlOVLhKjaw
         GwGJktgXidZzglxNSnP9snflJdD0B4HTqew2TAK6LlZI5YWzFM9TQqUMlNm3aZa71D36
         Epvg==
X-Gm-Message-State: APjAAAUX6xrzK6c/pHiji8v53/UZTqfwNLlbYEbc/A3NGM2s6KNBWaMA
	cPPRomR+AHPYOHfTK1SIE4WOz/s47JSna+GLuVslkloJ
X-Google-Smtp-Source: APXvYqyfEAZ+VCz6HidZzoL42scRoygHD+uvXitRMWr7mdPEw31GWrsD6OQ+L+e1BNUkvFXreMkhflIbyzxYak3Gmfo=
X-Received: by 2002:a05:6830:c6:: with SMTP id x6mr17188765oto.64.1565364628979;
 Fri, 09 Aug 2019 08:30:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190726175032.6769-1-richard.henderson@linaro.org>
 <20190726175032.6769-12-richard.henderson@linaro.org> <CAL1e-=gwyGB4ibo_B5W1MpFy-9bB7=5juqTJVBdD9N6XFOOsSQ@mail.gmail.com>
 <0f37edc5-2fb6-c92d-fb47-a381af649072@linaro.org> <CAL1e-=hWVfYVYySkMCF4NUkHbe=47qUTuAA0vK23TGMBzuA+PQ@mail.gmail.com>
 <0b6556a5-7db8-bedf-89f3-7ead8e9b19e6@linaro.org>
In-Reply-To: <0b6556a5-7db8-bedf-89f3-7ead8e9b19e6@linaro.org>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Fri, 9 Aug 2019 17:30:18 +0200
Message-ID: <CAL1e-=jsEtmWHA1aOzfRVqnh6VVYV6OMA7wAriXTd32vkFuJdA@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH 11/67] target/arm: Add stubs for aa32 decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>, 
	"open list:Stellaris" <qemu-arm@nongnu.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000a7850b058fb0da20"
X-TUID: hRsTYkzieVtd

--000000000000a7850b058fb0da20
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 9, 2019 at 4:55 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 8/9/19 3:31 AM, Aleksandar Markovic wrote:
> >
> >
> > On Thu, Aug 8, 2019 at 5:43 PM Richard Henderson <
> richard.henderson@linaro.org
> > <mailto:richard.henderson@linaro.org>> wrote:
> >
> >     On 8/8/19 4:41 AM, Aleksandar Markovic wrote:
> >     >     +/*
> >     >     + * Include the generated decoders.
> >     >     + * Note that the T32 decoder reuses some of the trans_*
> functions
> >     >     + * initially declared by the A32 decoder, which results in
> duplicate
> >     >     + * declaration warnings.  Suppress them.
> >     >     + */
> >     >     +
> >     >     +#ifdef CONFIG_PRAGMA_DIAGNOSTIC_AVAILABLE
> >     >     +# pragma GCC diagnostic push
> >     >     +# pragma GCC diagnostic ignored "-Wredundant-decls"
> >     >     +# ifdef __clang__
> >     >     +#  pragma GCC diagnostic ignored "-Wtypedef-redefinition"
> >     >     +# endif
> >     >     +#endif
> >     >     +
> >     >
> >     >
> >     > This looks more like a "band aid" solution rather than the right
> one.
> >
> >     What would the "right" solution be, would you say?
> >
> >
> > The right (without quotation marks) solution is not to generate the code
> that
> > generates compiler complaints.
>
> That would be impossible with the information supplied.
>

That limitation is a fault of decodetree design, not an obstacle per se.


> Emitting zero declarations will result in invalid C.  We ensure that each
> individual decodetree file does not emit duplicates.  However, there is no
> knowledge across separate decodetree files about which declarations are
> duplicate.
>
> In this particular case, I do not even agree that the warnings themselves
> are
> useful.  I suppose it's not impossible that they could diagnose some
> weirdness
> in a code base, where a function is declared in multiple headers or a patch
> application has gone awry leaving multiple sequential declarations, but
> honestly how often does that happen?
>
> I suppose with some work, we could not invoke decodetree multiple times,
> but
> give it all of the input files at once, producing a single output file.
>
>
> > Obviously, in this case, decodetree-generated code shows that it is
> > inferior to human-generated code.
>
> That is not obvious at all.  Moreover, I disagree strongly.
>
>
OK. I'm fine with your disagreeing. That why open source exists - to have
opportunities to hear different views.

Yours,
Aleksandar


> r~
>

--000000000000a7850b058fb0da20
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Aug 9, 2019 at 4:55 PM Richar=
d Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.hen=
derson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">On 8/9/19 3:31 AM, Aleksandar Markovic wrote:<br>
&gt; <br>
&gt; <br>
&gt; On Thu, Aug 8, 2019 at 5:43 PM Richard Henderson &lt;<a href=3D"mailto=
:richard.henderson@linaro.org" target=3D"_blank">richard.henderson@linaro.o=
rg</a><br>
&gt; &lt;mailto:<a href=3D"mailto:richard.henderson@linaro.org" target=3D"_=
blank">richard.henderson@linaro.org</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On 8/8/19 4:41 AM, Aleksandar Markovic wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0+/*<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0+ * Include the generated d=
ecoders.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0+ * Note that the T32 decod=
er reuses some of the trans_* functions<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0+ * initially declared by t=
he A32 decoder, which results in duplicate<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0+ * declaration warnings.=
=C2=A0 Suppress them.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0+ */<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0+#ifdef CONFIG_PRAGMA_DIAGN=
OSTIC_AVAILABLE<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0+# pragma GCC diagnostic pu=
sh<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0+# pragma GCC diagnostic ig=
nored &quot;-Wredundant-decls&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0+# ifdef __clang__<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0+#=C2=A0 pragma GCC diagnos=
tic ignored &quot;-Wtypedef-redefinition&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0+# endif<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0+#endif<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; This looks more like a &quot;band aid&quot; so=
lution rather than the right one.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0What would the &quot;right&quot; solution be, would=
 you say?<br>
&gt; <br>
&gt; <br>
&gt; The right (without quotation marks) solution is not to generate the co=
de that<br>
&gt; generates compiler complaints.<br>
<br>
That would be impossible with the information supplied.<br></blockquote><di=
v>=C2=A0</div><div>That limitation is a fault of decodetree design, not an =
obstacle per se.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">
Emitting zero declarations will result in invalid C.=C2=A0 We ensure that e=
ach<br>
individual decodetree file does not emit duplicates.=C2=A0 However, there i=
s no<br>
knowledge across separate decodetree files about which declarations are dup=
licate.<br>
<br>
In this particular case, I do not even agree that the warnings themselves a=
re<br>
useful.=C2=A0 I suppose it&#39;s not impossible that they could diagnose so=
me weirdness<br>
in a code base, where a function is declared in multiple headers or a patch=
<br>
application has gone awry leaving multiple sequential declarations, but<br>
honestly how often does that happen?<br>
<br>
I suppose with some work, we could not invoke decodetree multiple times, bu=
t<br>
give it all of the input files at once, producing a single output file.<br>
<br>
<br>
&gt; Obviously, in this case, decodetree-generated code shows that it is<br=
>
&gt; inferior to human-generated code.<br>
<br>
That is not obvious at all.=C2=A0 Moreover, I disagree strongly.<br><br></b=
lockquote><div><br></div><div>OK. I&#39;m fine with your disagreeing. That =
why open source exists - to have</div><div>opportunities to hear different =
views.</div><div><br></div><div>Yours,</div><div>Aleksandar</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
r~<br>
</blockquote></div></div>

--000000000000a7850b058fb0da20--
