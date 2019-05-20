Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp333177wrg;
        Mon, 20 May 2019 08:53:22 -0700 (PDT)
X-Received: by 2002:a9d:1b67:: with SMTP id l94mr45829926otl.239.1558367602274;
        Mon, 20 May 2019 08:53:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558367602; cv=none;
        d=google.com; s=arc-20160816;
        b=fhK2Wk2mc1bNqFDs4vbtD6idNKbtBVddCr4rPLMg0E0K+x7IoUBaIO7ezQpjoruxM/
         ywNGN/dH8LHnNEy6OJmj2DK2Y7dk3r2KjWzixwV1dZIfXhn5VMYEwt3jjJ6U23k/cKUW
         FPzt+TYfJp5WQTRxvsqAj7Hb80pNOIecJRgV/iD/iwkpgKjsqpH5H/mqPgGb2bK/Cx+g
         I8eMzgi9pV40fXjZE6Z5XGPXSvBGrHtU/L/k9pPW5OupiSlAW0PVtOABiOr1kSgoXRjG
         SH3wSMANCnL4vVIwi0f8Ut+xkBlkxjM9KlyXVXL3ae54Bt259aGQQn8uqGsWBJos84I5
         eSZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=ADnEJ+RAf77BFuIoavz9FxqwTbRXPfb1+l/Atje8Xn4=;
        b=M/wm+wnbKJCmYjl3fZU08VMbC6DUSgZyghtCPGDCLIJ3OvzWM17BokqQJ1kFJGVOTo
         3PPTJmPoy07JMx2TWGQglquqYLIuWxIEgPat/oW2WjUAMsyNQsYZJu13kjAaJGzkTXzn
         CwKtx6rL5wolwZJf9bQb/Wo5IENZvxVXex77JvgyV1WnGZcaWJDa760Tx/8rU8fos9ZL
         TUtYH+TRq+BYDZwsaM08HHoNQ+9qBa4080EHyz5Dc5kTUdt/dptJzP2dOLShxpo443tH
         Fvi71BYzpBWAzC9b00lY1PzNqn9Af/JIrJBAoSSL5DngeypZu3uiuaoUlwETTFNyqPC4
         yI6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=KrP5WOGl;
       spf=pass (google.com: domain of aleksandar.m.mail@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=aleksandar.m.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <aleksandar.m.mail@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id a24sor8027459otr.141.2019.05.20.08.53.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 20 May 2019 08:53:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of aleksandar.m.mail@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=KrP5WOGl;
       spf=pass (google.com: domain of aleksandar.m.mail@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=aleksandar.m.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=ADnEJ+RAf77BFuIoavz9FxqwTbRXPfb1+l/Atje8Xn4=;
        b=KrP5WOGluB2AotWwHPVnc4M2SRORPz4cZdq6eX/N0wLkQhY+5YX8k4p8PsWJR6vfSK
         r0AXUcsRoUTtKfQo2MWMUFnrwbYpKX+PU1ooy5JxWxYslS/h5YUoRh9vv4ZXKQMMZRls
         WQU5GyEGVniBz6IG05gos0+Fyi0nRK+0fmSs8orff2ndF28nj66EOswSiS1fmIxiZq4y
         1lJjHVgoqXryFbpTKRh7jHtdGtPrtCzMmTzFLnKqaQyFb3DEPNrqB0NPrT4htC6iQdmv
         cRMDws7yn0j3in4llyNnSOwAdQgdT29ACo+wcCxDgGsVz8zRPMOL81TrDpEzdSh/6O5D
         547A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=ADnEJ+RAf77BFuIoavz9FxqwTbRXPfb1+l/Atje8Xn4=;
        b=EXXN18EUwuTX1eDZNw+DuDy50GWdr4qxcmd7yuRa24aBxu2mzKjw8FVafUBq0T61eq
         DN7svfbst+5/+GqE86LuW/qIwIFSf8Hsyof4HSnFeGSmJxj+ZX/D55YOk99TMq2AjITh
         3AXvjDT9RsZ9m7ArhZY6A0BuFChwTIUM/7nJxEBJMONrxyGIkyKvCbrQYbJ1+mL6jjP3
         ctmSsYbV+OHFm+71NOXwZjtpAxB3Rtma/E4O7RSXBNORMq5xbSozf9LsPhlhYN3fC9qs
         aAqZZ75SdRcTd98dSARgQxw9f9t/rZOqhbtXTywdB4rS5sxVj56eaCZiIMJqCds1X0tM
         WmgQ==
X-Gm-Message-State: APjAAAXsNcIBcLJTL4L1qjAgDy1c6aGIyOBIXsAvrHFX8yKBiJ8C/t5e
	dLGFUwo5338RFn1r0BRI5rlU8D4tWd13MDhkyoIIIw==
X-Google-Smtp-Source: APXvYqwGePBfC82FzgKDUQJuY7XGTQB79jEbIIIQEhEucdotmRq832Pb5CMsJvlBl8d+d0rALkoEinjMeol23Mve04U=
X-Received: by 2002:a05:6830:160a:: with SMTP id g10mr12353otr.121.1558367601478;
 Mon, 20 May 2019 08:53:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:410f:0:0:0:0:0 with HTTP; Mon, 20 May 2019 08:53:20
 -0700 (PDT)
Received: by 2002:a9d:410f:0:0:0:0:0 with HTTP; Mon, 20 May 2019 08:53:20
 -0700 (PDT)
In-Reply-To: <20190514155301.16123-11-alex.bennee@linaro.org>
References: <20190514155301.16123-1-alex.bennee@linaro.org> <20190514155301.16123-11-alex.bennee@linaro.org>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Mon, 20 May 2019 17:53:20 +0200
Message-ID: <CAL1e-=gGT3kFnc1JCiDne3EFDJMy_7nraMc=Pov=fE1ePK_AWg@mail.gmail.com>
Subject: Re: [Qemu-devel] [RFC PATCH 10/11] target/mips: convert UHI_plog to
 use common semihosting code
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Aleksandar Markovic <amarkovic@wavecomp.com>, qemu-devel@nongnu.org, 
	Aleksandar Rikalo <arikalo@wavecomp.com>, Aurelien Jarno <aurelien@aurel32.net>, qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000050d8e1058953bbb5"
X-TUID: mrf5ZJFwyMsf

--00000000000050d8e1058953bbb5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On May 14, 2019 6:02 PM, "Alex Benn=C3=A9e" <alex.bennee@linaro.org> wrote:
>
> Rather than printing directly to stdout lets use our common
> semihosting code. There is one minor difference in that the output
> currently defaults to stderr instead of stdout however this can be
> controlled by connecting semihosting to a chardev.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---

Reviewed-by: Aleksandar Markovic <amarkovic@wavecomp.com>

>  target/mips/mips-semi.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/target/mips/mips-semi.c b/target/mips/mips-semi.c
> index eac8374fb34..35bdfd7c77e 100644
> --- a/target/mips/mips-semi.c
> +++ b/target/mips/mips-semi.c
> @@ -23,6 +23,7 @@
>  #include "exec/helper-proto.h"
>  #include "exec/softmmu-semi.h"
>  #include "hw/semihosting/semihost.h"
> +#include "hw/semihosting/console.h"
>
>  typedef enum UHIOp {
>      UHI_exit =3D 1,
> @@ -329,13 +330,12 @@ void helper_do_semihosting(CPUMIPSState *env)
>          p2 =3D strstr(p, "%d");
>          if (p2) {
>              int char_num =3D p2 - p;
> -            char *buf =3D g_malloc(char_num + 1);
> -            strncpy(buf, p, char_num);
> -            buf[char_num] =3D '\0';
> -            gpr[2] =3D printf("%s%d%s", buf, (int)gpr[5], p2 + 2);
> -            g_free(buf);
> +            GString *s =3D g_string_new_len(p, char_num);
> +            g_string_append_printf(s, "%d%s", (int)gpr[5], p2 + 2);
> +            gpr[2] =3D qemu_semihosting_log_out(s->str, s->len);
> +            g_string_free(s, true);
>          } else {
> -            gpr[2] =3D printf("%s", p);
> +            gpr[2] =3D qemu_semihosting_log_out(p, strlen(p));
>          }
>          FREE_TARGET_STRING(p, gpr[4]);
>          break;
> --
> 2.20.1
>
>

--00000000000050d8e1058953bbb5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
On May 14, 2019 6:02 PM, &quot;Alex Benn=C3=A9e&quot; &lt;<a href=3D"mailto=
:alex.bennee@linaro.org">alex.bennee@linaro.org</a>&gt; wrote:<br>
&gt;<br>
&gt; Rather than printing directly to stdout lets use our common<br>
&gt; semihosting code. There is one minor difference in that the output<br>
&gt; currently defaults to stderr instead of stdout however this can be<br>
&gt; controlled by connecting semihosting to a chardev.<br>
&gt;<br>
&gt; Signed-off-by: Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@lina=
ro.org">alex.bennee@linaro.org</a>&gt;<br>
&gt; ---</p>
<p dir=3D"ltr">Reviewed-by: Aleksandar Markovic &lt;<a href=3D"mailto:amark=
ovic@wavecomp.com">amarkovic@wavecomp.com</a>&gt;</p>
<p dir=3D"ltr">&gt; =C2=A0target/mips/mips-semi.c | 12 ++++++------<br>
&gt; =C2=A01 file changed, 6 insertions(+), 6 deletions(-)<br>
&gt;<br>
&gt; diff --git a/target/mips/mips-semi.c b/target/mips/mips-semi.c<br>
&gt; index eac8374fb34..35bdfd7c77e 100644<br>
&gt; --- a/target/mips/mips-semi.c<br>
&gt; +++ b/target/mips/mips-semi.c<br>
&gt; @@ -23,6 +23,7 @@<br>
&gt; =C2=A0#include &quot;exec/helper-proto.h&quot;<br>
&gt; =C2=A0#include &quot;exec/softmmu-semi.h&quot;<br>
&gt; =C2=A0#include &quot;hw/semihosting/semihost.h&quot;<br>
&gt; +#include &quot;hw/semihosting/console.h&quot;<br>
&gt;<br>
&gt; =C2=A0typedef enum UHIOp {<br>
&gt; =C2=A0 =C2=A0 =C2=A0UHI_exit =3D 1,<br>
&gt; @@ -329,13 +330,12 @@ void helper_do_semihosting(CPUMIPSState *env)<br=
>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0p2 =3D strstr(p, &quot;%d&quot;);<br=
>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (p2) {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int char_num =3D p2 - =
p;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char *buf =3D g_malloc(char=
_num + 1);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 strncpy(buf, p, char_num);<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 buf[char_num] =3D &#39;\0&#=
39;;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gpr[2] =3D printf(&quot;%s%=
d%s&quot;, buf, (int)gpr[5], p2 + 2);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(buf);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GString *s =3D g_string_new=
_len(p, char_num);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_string_append_printf(s, &=
quot;%d%s&quot;, (int)gpr[5], p2 + 2);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gpr[2] =3D qemu_semihosting=
_log_out(s-&gt;str, s-&gt;len);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_string_free(s, true);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gpr[2] =3D printf(&quot;%s&=
quot;, p);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gpr[2] =3D qemu_semihosting=
_log_out(p, strlen(p));<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0FREE_TARGET_STRING(p, gpr[4]);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; -- <br>
&gt; 2.20.1<br>
&gt;<br>
&gt;<br>
</p>

--00000000000050d8e1058953bbb5--
