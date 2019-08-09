Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp9015580wrv;
        Fri, 9 Aug 2019 03:31:20 -0700 (PDT)
X-Received: by 2002:a9d:6256:: with SMTP id i22mr17446640otk.139.1565346680335;
        Fri, 09 Aug 2019 03:31:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565346680; cv=none;
        d=google.com; s=arc-20160816;
        b=mh4tbRVoxXM0zyE3TRWFDMX4IgHzxOS5JV3rt309Ysk8E5jwQ+74ZClsNxZD4aVJSp
         PzewYeHHGJPCTFK2OHhNyamBITdwMMhE2RbKPDD9IvBKJtcbUm+aS3DG99pctcReL3RU
         IRJoBjFlW2C6YWEGMoUHmjV8LLc4nqStMS9xfuNLYwTruwT2NlD+nlJ/wgvmvH/huuVN
         1dgnVccKjfApPMEShEqor+PN9+i70P9nIQUjnTJJy8WvFzjKEqkNLzUfC84rYrmQRJxn
         9/UIdk9ExXnXVBL9S1BhMwaXcDzSS4WBPk8ZfhFa5ga2i1i1YQjR3FmFnhpxFiC5CaE1
         7n3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=x9z4SEeQla6rmDACSJZleWM2O1lvW+qJMcmmRggvV8A=;
        b=BlSysPQOWO1lZJQBUPrxmIezrRvQm8A0qNko+z0asOJOWRwqbiHmbwFLXcOF22GINj
         SYFo1XMDTGN/e48naQJiIao4hzZ1hs77vz+n+XGufCL+E4H5jtly+jTkH0py5aPUls7W
         vUm42HH2/T1DDEX0aWTQuQNsb7JoHX0D9pGm7exQmqMh00Lp7jD8nPr6qkIOjkvC1Rz8
         5e31V7I0AYC/z5JKfippO8c5HlCdEopWeKrozG/iS0pfTtVcOWc5ZT3L/1wGBpAq1l74
         dH3E9bO3/BVqGlRCkRAqnvLoBXoS4Xm6oBWfQomLJcDRZeAzRhW/nT4enhz1YB3HtCbN
         IqKg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZCmHOc+3;
       spf=pass (google.com: domain of aleksandar.m.mail@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=aleksandar.m.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <aleksandar.m.mail@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id p187sor44224010oia.145.2019.08.09.03.31.20
        (Google Transport Security);
        Fri, 09 Aug 2019 03:31:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of aleksandar.m.mail@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZCmHOc+3;
       spf=pass (google.com: domain of aleksandar.m.mail@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=aleksandar.m.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=x9z4SEeQla6rmDACSJZleWM2O1lvW+qJMcmmRggvV8A=;
        b=ZCmHOc+31wYa1C2mWsjR2WKpoTjG0gVRHTjX3lhibOAv7Q/MwCpCf7ZkIGx00opFSs
         fsGUoJLvTcN/KHrUZ4GLgQDOt5+mLO71OeA1MGfbCayeFagkO4YmipxqE/EAPL/fStX1
         n4QCEn37h4KO7zZo0NQVujKCQwll2FrgXUIVkYCE5mdaLJEb0/kH15xR8LV1wdieohwE
         ViJ1qTW401mpdpGbXwWnHQU/FCMzatZluBt3SFkl+kit1XPNti6lO/b9dV8e2GQ2eAAq
         1ZWE1mb24WwGO3nSa1x7zxkYgD31YNXfKMWnjDqBMJz0UQ8phCn3Ft2ST9zSWMnz3GBl
         wCEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=x9z4SEeQla6rmDACSJZleWM2O1lvW+qJMcmmRggvV8A=;
        b=B280Hl6dAD77EVGMAEdCBoGrHPOkPNOogooLM2GIqBwlvExCgthCR0PYRNr29SmLf1
         v/BEmlPfHdvPogxckqa1UvyvTqwZwsG0vROTtZK/DIZnw2Q1qzflGgYQZiXx6qd/x2He
         W0Lh3qKCG7DKAy+iSEk1reut/s8lR16Uqs8UQuUAyXT1Z5bcekCinbbope4dMeU6bGvI
         P6wE3aiODb4shawHAplcHmchk4lyXRNh57hzuluuywgPDCuJFdwh90MCP8Po0GLaTD26
         ishruD22ixpzG9nubc4F1eg47CkMtA+4uSDUIQhL99tG1We6CvOdNFkztjhtnMecsJXi
         +BXA==
X-Gm-Message-State: APjAAAWB5HRFfkXFHNmWCg49TjBmo4DdkOnsmQXzlnK/0itWLk6itVFK
	l9AOgxlFtUqkxCCDreH8a0a1KB8qhqzLnjC9Y9yPUMk0
X-Google-Smtp-Source: APXvYqzNlWaNh5Lv0/Bgk5d7T1R2xoFclTJ2DVuy86C7yreL661K+oTgMEz56iG5gOw8Qkwu5kLr/wYxSaqaLpgsFtg=
X-Received: by 2002:aca:abd8:: with SMTP id u207mr5883409oie.136.1565346679795;
 Fri, 09 Aug 2019 03:31:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190726175032.6769-1-richard.henderson@linaro.org>
 <20190726175032.6769-12-richard.henderson@linaro.org> <CAL1e-=gwyGB4ibo_B5W1MpFy-9bB7=5juqTJVBdD9N6XFOOsSQ@mail.gmail.com>
 <0f37edc5-2fb6-c92d-fb47-a381af649072@linaro.org>
In-Reply-To: <0f37edc5-2fb6-c92d-fb47-a381af649072@linaro.org>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Fri, 9 Aug 2019 12:31:09 +0200
Message-ID: <CAL1e-=hWVfYVYySkMCF4NUkHbe=47qUTuAA0vK23TGMBzuA+PQ@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH 11/67] target/arm: Add stubs for aa32 decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>, 
	"open list:Stellaris" <qemu-arm@nongnu.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000ccb90c058facac65"
X-TUID: W7+SNJi4R5s0

--000000000000ccb90c058facac65
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 8, 2019 at 5:43 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 8/8/19 4:41 AM, Aleksandar Markovic wrote:
> >     +/*
> >     + * Include the generated decoders.
> >     + * Note that the T32 decoder reuses some of the trans_* functions
> >     + * initially declared by the A32 decoder, which results in duplicate
> >     + * declaration warnings.  Suppress them.
> >     + */
> >     +
> >     +#ifdef CONFIG_PRAGMA_DIAGNOSTIC_AVAILABLE
> >     +# pragma GCC diagnostic push
> >     +# pragma GCC diagnostic ignored "-Wredundant-decls"
> >     +# ifdef __clang__
> >     +#  pragma GCC diagnostic ignored "-Wtypedef-redefinition"
> >     +# endif
> >     +#endif
> >     +
> >
> >
> > This looks more like a "band aid" solution rather than the right one.
>
> What would the "right" solution be, would you say?
>
>
The right (without quotation marks) solution is not to generate the code
that generates compiler complaints.

However, I do not say that this is a stopping issue for this series.
Perhaps at some time in future you can think of ways that would achieve not
resorting to pragmas. Obviously, in this case, decodetree-generated code
shows that it is inferior to human-generated code. Still, for now, go ahead
with this patch, as far as I am concerned.

Yours,
Aleksandar



> A couple of days ago Phil suggested moving these pragmas into the generated
> code, so that this need not be done by hand in the several targets that use
> multiple decoders.  That sounds reasonable to me.
>
>
> r~
>

--000000000000ccb90c058facac65
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 8, 2019 at 5:43 PM Richar=
d Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.hen=
derson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">On 8/8/19 4:41 AM, Aleksandar Markovic wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0+/*<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * Include the generated decoders.<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * Note that the T32 decoder reuses some of the tr=
ans_* functions<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * initially declared by the A32 decoder, which re=
sults in duplicate<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * declaration warnings.=C2=A0 Suppress them.<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ */<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+#ifdef CONFIG_PRAGMA_DIAGNOSTIC_AVAILABLE<br>
&gt;=C2=A0 =C2=A0 =C2=A0+# pragma GCC diagnostic push<br>
&gt;=C2=A0 =C2=A0 =C2=A0+# pragma GCC diagnostic ignored &quot;-Wredundant-=
decls&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+# ifdef __clang__<br>
&gt;=C2=A0 =C2=A0 =C2=A0+#=C2=A0 pragma GCC diagnostic ignored &quot;-Wtype=
def-redefinition&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+# endif<br>
&gt;=C2=A0 =C2=A0 =C2=A0+#endif<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt; <br>
&gt; <br>
&gt; This looks more like a &quot;band aid&quot; solution rather than the r=
ight one.<br>
<br>
What would the &quot;right&quot; solution be, would you say?<br>
<br></blockquote><div><br></div><div>The right (without quotation marks) so=
lution is not to generate the code that generates compiler complaints.</div=
><div><br></div><div>However, I do not say that this is a stopping issue fo=
r this series. Perhaps at some time in future you can think of ways that wo=
uld achieve not resorting to pragmas. Obviously, in this case, decodetree-g=
enerated code shows that it is inferior to human-generated code. Still, for=
 now, go ahead with this patch, as far as I am concerned.</div><div><br></d=
iv><div>Yours,</div><div>Aleksandar</div><div><br></div><div>=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
A couple of days ago Phil suggested moving these pragmas into the generated=
<br>
code, so that this need not be done by hand in the several targets that use=
<br>
multiple decoders.=C2=A0 That sounds reasonable to me.<br>
<br>
<br>
r~<br>
</blockquote></div></div>

--000000000000ccb90c058facac65--
