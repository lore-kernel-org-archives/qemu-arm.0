Received: by 2002:adf:a557:0:0:0:0:0 with SMTP id j23csp4717307wrb;
        Wed, 10 Jul 2019 02:33:27 -0700 (PDT)
X-Received: by 2002:a9d:7d82:: with SMTP id j2mr23637343otn.171.1562751207230;
        Wed, 10 Jul 2019 02:33:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562751207; cv=none;
        d=google.com; s=arc-20160816;
        b=lLy1IfMuje0HBDuBYNGhZh4c9GQQHkL0HddnpSnfjtBVf8tu3SSW2kHT8knYjxsqe7
         5DBk4nC6vmvmt7FcUenProlMnIJkwjl0bVKE90uxAZz3LNyH04+6CYQLWfXdK5llwTF+
         wYAHgT29UXdZQ15UtYVqOh1k3vnWUL6OCs4g4a0UU3oga69QB+Lo7YcF7TCFAH5Yq4sh
         0TxWqUOHsotLLR4A2rtJ1brKOUBctogWgLATGImPS1ePQaaWPLpPdTkCn42rbGhSzEJ5
         mOHSAoSiADW4qhok7FoNLm4n9apbQsC0KcXy5yB/ZOJanP1m6SAmbUC2ljPopRrzS7Fz
         cyJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=0C7Vne2I0LXUUInU2T8v7zArx3LpW7irxRMIAehEJ8A=;
        b=ZsS6g+FxBT9Kn48dUSycV+aE7eulzfLix1QW5cv0b8mlRYgwkZg9DHFL51kbzK6CrJ
         Rl0EKaP3mtoGJuH8MCj2HDGC44CbSGuMl2jfsQzZ6u/1ueJ43IWtEpqXiuNhSvoDQC2h
         qnFA1dN8OQ0zfL6yVT+dJeHaywkwizfRUSexjxUusqqnol1cDQ58bsmcJHg3u+MbInPv
         TiYYo8xXxLwcfBzLtVoh3RXB6DkoQE5fc4xR4hmRpK76jC7w0TYYYOOPGKkW4loLkjsS
         kbBLPmfbr3Ua92kYBAdlfAFHlUx2SVMLpfPZZeJRssP/qo7PcBBwEmZlAECLf/aEcs2V
         Iyrg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=XlRRdEzu;
       spf=pass (google.com: domain of aleksandar.m.mail@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=aleksandar.m.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <aleksandar.m.mail@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id k78sor686729oib.103.2019.07.10.02.33.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 10 Jul 2019 02:33:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of aleksandar.m.mail@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=XlRRdEzu;
       spf=pass (google.com: domain of aleksandar.m.mail@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=aleksandar.m.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=0C7Vne2I0LXUUInU2T8v7zArx3LpW7irxRMIAehEJ8A=;
        b=XlRRdEzuHpqjIiD+uIqjQODSnM5OG7Cacr5G4bD3lizfBZX5Pl3qkYW9oD9V5e7RDQ
         aVQ9WLUI1Og7b/gkH+pGfoYH1hSIjevJBE03fsBC4GHpl4ewvY3B2RvTXrccb7ThqeTy
         8jAsZ1g0kwhKwnF2mSEKexOkf75mtEpnNVLoAcmsbdiUNYgEZeeJie7lYp7yEEGWP3VW
         YK/CT8g23sIdib6Ldz8vwr2hTGaiFNujtEHOKjt/Cg2O2bV1hqLZJmmzj5X0Q8nQQ+mp
         eJyi16/wZ/bZS7hMgO+v0TZUSjY7Z9rkz0EwHYY4uSy+8SWRdCqhemZ42xuFePelT8wX
         RxtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=0C7Vne2I0LXUUInU2T8v7zArx3LpW7irxRMIAehEJ8A=;
        b=iC2JSIy+45Xpspipk4w+ReICF15EjQQmhlZ8NKw1lmp+EUtz6CWR/YkguNEHhWFgxM
         b0Bb5lMIFc1mW92ok8u1lSXxIdkhvuyy+UH6pM9jcpz65ljIsz6qKGgIjIvv4WbyBP7x
         79JP34E1zIEkWo4g6ZFZ88ToN2KUAdLhrvyXpVvWk9pRtE2Oa8cyxxUFcSmUfZkp/Adt
         KM1gEDXh2De+zMm5xuIG2BpQsxTsaYx/bTlgvsFc7gaZwjc8BAn75Muz4Biq7GoFC+Ot
         i6/Psgr1qNxxvrSHQO2t+2QUFsLzH6avZ9qahGt6k6vH8cKfSymtTBVTrhxY8dDPFTcC
         lMYg==
X-Gm-Message-State: APjAAAXCRJWmigH7KEpPaMcZlfX8SRnLtdk32ALu2r60FOlstPS4dHVN
	slLnwGyiFWHWq4AZXRbt3yJ11ExRjSNcvg5K9G1IwA==
X-Google-Smtp-Source: APXvYqzT/QPqS/ECpIoEIgyxDrxg2b8MaIWSU/bKp5D3RJA7jPLxto17ETfDojeI2ae8QS4RqfIKRm/EH5MSeJ7zbPM=
X-Received: by 2002:aca:abd8:: with SMTP id u207mr2714622oie.136.1562751206470;
 Wed, 10 Jul 2019 02:33:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:4798:0:0:0:0:0 with HTTP; Wed, 10 Jul 2019 02:33:25
 -0700 (PDT)
Received: by 2002:a9d:4798:0:0:0:0:0 with HTTP; Wed, 10 Jul 2019 02:33:25
 -0700 (PDT)
In-Reply-To: <87o922dyog.fsf@zen.linaroharston>
References: <20190705160421.19015-1-alex.bennee@linaro.org>
 <20190705160421.19015-6-alex.bennee@linaro.org> <CAL1e-=i08h1j0V7d97p7a-OQqdNXzG1s5QATmLDxfGCDtwE-4Q@mail.gmail.com>
 <87o922dyog.fsf@zen.linaroharston>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Wed, 10 Jul 2019 11:33:25 +0200
Message-ID: <CAL1e-=jTA+kcq-Z25nXH4gy-cd99L4u3DsWo2qN5u8xN49uQ7g@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v1 5/5] gdbstub: revert to previous set_reg behaviour
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
	Jon Doron <arilou@gmail.com>, qemu-arm@nongnu.org, 
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Content-Type: multipart/alternative; boundary="00000000000088b761058d505e31"
X-TUID: iVB8TIVkB3uH

--00000000000088b761058d505e31
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Jul 10, 2019 11:30 AM, "Alex Benn=C3=A9e" <alex.bennee@linaro.org> wrote=
:
>
>
> Aleksandar Markovic <aleksandar.m.mail@gmail.com> writes:
>
> > On Jul 5, 2019 6:08 PM, "Alex Benn=C3=A9e" <alex.bennee@linaro.org> wro=
te:
> >>
> >> The refactoring of handle_set_reg missed the fact we previously had
> >> responded with an empty packet when we were not using XML based
> >> protocols. This broke the fallback behaviour for architectures that
> >> don't have registers defined in QEMU's gdb-xml directory.
> >>
> >> Revert to the previous behaviour and clean up the commentary for what
> >> is going on.
> >>
> >> Fixes: 62b3320bddd
> >> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> >> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> >> Cc: Jon Doron <arilou@gmail.com>
> >> Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> >> ---
> >
> > Do you plan to integrate this patch in 4.1?
> >
> > Thanks, Aleksandar
>
> Yes - I'm putting together a PR today.
>

That's great, thanks!!

Aleksandar

> >
> >>  gdbstub.c | 18 ++++++++++++------
> >>  1 file changed, 12 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/gdbstub.c b/gdbstub.c
> >> index ea3349d1aa..b6df7ee25a 100644
> >> --- a/gdbstub.c
> >> +++ b/gdbstub.c
> >> @@ -1669,12 +1669,23 @@ static void handle_remove_bp(GdbCmdContext
> > *gdb_ctx, void *user_ctx)
> >>      put_packet(gdb_ctx->s, "E22");
> >>  }
> >>
> >> +/*
> >> + * handle_set/get_reg
> >> + *
> >> + * Older gdb are really dumb, and don't use 'G/g' if 'P/p' is
available.
> >> + * This works, but can be very slow. Anything new enough to understan=
d
> >> + * XML also knows how to use this properly. However to use this we
> >> + * need to define a local XML file as well as be talking to a
> >> + * reasonably modern gdb. Responding with an empty packet will cause
> >> + * the remote gdb to fallback to older methods.
> >> + */
> >> +
> >>  static void handle_set_reg(GdbCmdContext *gdb_ctx, void *user_ctx)
> >>  {
> >>      int reg_size;
> >>
> >>      if (!gdb_has_xml) {
> >> -        put_packet(gdb_ctx->s, "E00");
> >> +        put_packet(gdb_ctx->s, "");
> >>          return;
> >>      }
> >>
> >> @@ -1694,11 +1705,6 @@ static void handle_get_reg(GdbCmdContext
*gdb_ctx,
> > void *user_ctx)
> >>  {
> >>      int reg_size;
> >>
> >> -    /*
> >> -     * Older gdb are really dumb, and don't use 'g' if 'p' is
avaialable.
> >> -     * This works, but can be very slow.  Anything new enough to
> >> -     * understand XML also knows how to use this properly.
> >> -     */
> >>      if (!gdb_has_xml) {
> >>          put_packet(gdb_ctx->s, "");
> >>          return;
> >> --
> >> 2.20.1
> >>
> >>
>
>
> --
> Alex Benn=C3=A9e

--00000000000088b761058d505e31
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
On Jul 10, 2019 11:30 AM, &quot;Alex Benn=C3=A9e&quot; &lt;<a href=3D"mailt=
o:alex.bennee@linaro.org">alex.bennee@linaro.org</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt; Aleksandar Markovic &lt;<a href=3D"mailto:aleksandar.m.mail@gmail.com"=
>aleksandar.m.mail@gmail.com</a>&gt; writes:<br>
&gt;<br>
&gt; &gt; On Jul 5, 2019 6:08 PM, &quot;Alex Benn=C3=A9e&quot; &lt;<a href=
=3D"mailto:alex.bennee@linaro.org">alex.bennee@linaro.org</a>&gt; wrote:<br=
>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; The refactoring of handle_set_reg missed the fact we previous=
ly had<br>
&gt; &gt;&gt; responded with an empty packet when we were not using XML bas=
ed<br>
&gt; &gt;&gt; protocols. This broke the fallback behaviour for architecture=
s that<br>
&gt; &gt;&gt; don&#39;t have registers defined in QEMU&#39;s gdb-xml direct=
ory.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Revert to the previous behaviour and clean up the commentary =
for what<br>
&gt; &gt;&gt; is going on.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Fixes: 62b3320bddd<br>
&gt; &gt;&gt; Signed-off-by: Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.be=
nnee@linaro.org">alex.bennee@linaro.org</a>&gt;<br>
&gt; &gt;&gt; Reviewed-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailt=
o:philmd@redhat.com">philmd@redhat.com</a>&gt;<br>
&gt; &gt;&gt; Cc: Jon Doron &lt;<a href=3D"mailto:arilou@gmail.com">arilou@=
gmail.com</a>&gt;<br>
&gt; &gt;&gt; Cc: Mark Cave-Ayland &lt;<a href=3D"mailto:mark.cave-ayland@i=
lande.co.uk">mark.cave-ayland@ilande.co.uk</a>&gt;<br>
&gt; &gt;&gt; ---<br>
&gt; &gt;<br>
&gt; &gt; Do you plan to integrate this patch in 4.1?<br>
&gt; &gt;<br>
&gt; &gt; Thanks, Aleksandar<br>
&gt;<br>
&gt; Yes - I&#39;m putting together a PR today.<br>
&gt;</p>
<p dir=3D"ltr">That&#39;s great, thanks!!</p>
<p dir=3D"ltr">Aleksandar</p>
<p dir=3D"ltr">&gt; &gt;<br>
&gt; &gt;&gt;=C2=A0 gdbstub.c | 18 ++++++++++++------<br>
&gt; &gt;&gt;=C2=A0 1 file changed, 12 insertions(+), 6 deletions(-)<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; diff --git a/gdbstub.c b/gdbstub.c<br>
&gt; &gt;&gt; index ea3349d1aa..b6df7ee25a 100644<br>
&gt; &gt;&gt; --- a/gdbstub.c<br>
&gt; &gt;&gt; +++ b/gdbstub.c<br>
&gt; &gt;&gt; @@ -1669,12 +1669,23 @@ static void handle_remove_bp(GdbCmdCo=
ntext<br>
&gt; &gt; *gdb_ctx, void *user_ctx)<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 put_packet(gdb_ctx-&gt;s, &quot;E22&quot;=
);<br>
&gt; &gt;&gt;=C2=A0 }<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; +/*<br>
&gt; &gt;&gt; + * handle_set/get_reg<br>
&gt; &gt;&gt; + *<br>
&gt; &gt;&gt; + * Older gdb are really dumb, and don&#39;t use &#39;G/g&#39=
; if &#39;P/p&#39; is available.<br>
&gt; &gt;&gt; + * This works, but can be very slow. Anything new enough to =
understand<br>
&gt; &gt;&gt; + * XML also knows how to use this properly. However to use t=
his we<br>
&gt; &gt;&gt; + * need to define a local XML file as well as be talking to =
a<br>
&gt; &gt;&gt; + * reasonably modern gdb. Responding with an empty packet wi=
ll cause<br>
&gt; &gt;&gt; + * the remote gdb to fallback to older methods.<br>
&gt; &gt;&gt; + */<br>
&gt; &gt;&gt; +<br>
&gt; &gt;&gt;=C2=A0 static void handle_set_reg(GdbCmdContext *gdb_ctx, void=
 *user_ctx)<br>
&gt; &gt;&gt;=C2=A0 {<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 int reg_size;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 if (!gdb_has_xml) {<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 put_packet(gdb_ctx-&gt;s, &quot;=
E00&quot;);<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 put_packet(gdb_ctx-&gt;s, &quot;=
&quot;);<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; @@ -1694,11 +1705,6 @@ static void handle_get_reg(GdbCmdConte=
xt *gdb_ctx,<br>
&gt; &gt; void *user_ctx)<br>
&gt; &gt;&gt;=C2=A0 {<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 int reg_size;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 /*<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 =C2=A0* Older gdb are really dumb, and don&#39=
;t use &#39;g&#39; if &#39;p&#39; is avaialable.<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 =C2=A0* This works, but can be very slow.=C2=
=A0 Anything new enough to<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 =C2=A0* understand XML also knows how to use t=
his properly.<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 if (!gdb_has_xml) {<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 put_packet(gdb_ctx-&gt;s, &=
quot;&quot;);<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; &gt;&gt; --<br>
&gt; &gt;&gt; 2.20.1<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; Alex Benn=C3=A9e<br>
</p>

--00000000000088b761058d505e31--
