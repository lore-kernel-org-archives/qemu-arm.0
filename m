Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp3503682lfm;
        Tue, 1 Jun 2021 03:53:00 -0700 (PDT)
X-Received: by 2002:a05:6402:50c6:: with SMTP id h6mr31623586edb.327.1622544780033;
        Tue, 01 Jun 2021 03:53:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622544780; cv=none;
        d=google.com; s=arc-20160816;
        b=jBafeFDaDxi4p1NLFQ2SIk0wXGEYyVRIU/NHpjjb1xsRTK60XXuDK+y1U64B1Jqn5u
         /b7ranLL+XE0+uE8D2ZAjY1J4o7gf/6cxjBlukBwyeD2wIcIUAAEn9SyuUIIfX5r36JW
         AlVh200A6ZUdwY1Xx4gUGPuUjTkjg7sBi7IYgKI/VQUvvyPNwSGzFQx3vkBIl49VM5t8
         7qniiSOXS733KcVrjKHJ4dwGCsUIR7XzX6eeHZ55CKvmLXgEz6Z/mEoQ/00+Eh4yeU1D
         cTiF/o1GjEmHj2bhzfMSIF1dNv3mfe27jyNmobdv0jKwDmhcYzIUHY3QJOzhCkSmnyNB
         5Pyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6qR9r8ygB9T3Jj0GgCbCYrrWcpUrucASbP0orSW8qAw=;
        b=kK2EnoR1g3vSRg44G/dBObuS1qEwe2AFjVjPLBzgmGlz8ICKf8WEpInNmxcc1rO831
         dBGNVT6bDnAAf7BbFOwG7pjuo25qWoObQ8jq5GM1dM6lj8JhGqehKsUla5v75aXSTeXS
         9sioQTD55pWBuHPCYyo7tN3HWzjB/Bgfl97EGEciFxIv30NYR2FY8Ih+zRKPy4fnU6Oz
         hJnlJwdGG2Bdq+6D4EPLXDtEpONKcCxv9hQqs5VDyCQNSPkiODSaDS0CYCrarazPzEHx
         51kLXzEATOdpclxpUl6moYA7n5AbkvwBm1bxcPpw/C03TuRP9YQJFzWFoKN65vaaQxUs
         CrnA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=DblQSFLG;
       spf=pass (google.com: domain of astrauss11@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=astrauss11@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <astrauss11@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id x9sor15873223edv.11.2021.06.01.03.52.59
        (Google Transport Security);
        Tue, 01 Jun 2021 03:53:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of astrauss11@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=DblQSFLG;
       spf=pass (google.com: domain of astrauss11@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=astrauss11@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6qR9r8ygB9T3Jj0GgCbCYrrWcpUrucASbP0orSW8qAw=;
        b=DblQSFLGWcbneD22C0eBcMb1phFwLr4SpC50pg15P+NAcXeU3ESC4zerZsqDhP54I7
         0C+CSKsEisKS7Vdw1iRFKxNEbpgNEfg6+FdZRJDVTGhU22X4ei+LWqowhfdWMfT/xXjk
         sLHA+5BMTVcSMRCP30oZh2NfcO+1PTu45yZklEQOO9JyiqGXREViHqBKhc6j236dPXDx
         TfEkBR9UDt7WH9+ZcibI1HuRjQ2xmFMBUG1C4NZ4sa2CGAuL92lCQBMqFPPYRShnQt65
         j/S9Yyaev0Mp3W6HmmwXfZP4FKdFGp38aLD6uOGgICuW4NDLa42ZDg+yZgyujts84o9r
         dorQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6qR9r8ygB9T3Jj0GgCbCYrrWcpUrucASbP0orSW8qAw=;
        b=FBOyXpDcWAvxGlKG0KmgG+brnCTotvQv/uiIFcPAgi0sY/qMxhE91d79tgTNgjp36F
         v3a7XFkH1RssaGJS+8jcrvINAMfoNS3L4I5p5Zwb67MHv4+VMJyu0ApxyuW+yySp2aIO
         FuTw5l00IdCGyd+kstDHyHLTBn9WzeMXA9CqP1wYcJF13sI0wG59kFbCActcrjmuz9xU
         8rZU6Z5IQJE8RlkdYXEQpZ3A7RZrLnU8RsF7IlVCiCK04UQAzCt8m6Iag6Cs5UtVMnSr
         5ZV5P+4YLsePPFUuWTW9srA0XOYbliOajnVNWgRY8foGlyWxuvoe+9HOwye+Pp7Pb4EC
         JrNw==
X-Gm-Message-State: AOAM532WQxNQYmVS7EsbvggzxFSxCMSgmSeXm4XGiYgPRjgjKn8W7Yo9
	prwmEVhokYtj4UU9Az7H+MJvSjNldadPJOGixCaw1AcyTGQAIkih
X-Google-Smtp-Source: ABdhPJyeTQebog2vCkGABsje4gRa9J04GXNrpXPFwY7XUD0Bo0vwMDq+kDa/r/dUy+mS3kxzgIIHMFA1HpuQbGq/pxg=
X-Received: by 2002:aa7:dc17:: with SMTP id b23mr31221754edu.359.1622544779680;
 Tue, 01 Jun 2021 03:52:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210601090715.22330-1-alex.bennee@linaro.org>
 <CAFEAcA-zzg4Yh0pX2q-9OfFKEbX_uGkVb_8kZbQJJETLRo_zOQ@mail.gmail.com>
 <87fsy1dhke.fsf@linaro.org> <CAFEAcA8rre_ADS_x0TJpgeBOx=KeEzs1Q-pSiAtVK77G2tDLxg@mail.gmail.com>
In-Reply-To: <CAFEAcA8rre_ADS_x0TJpgeBOx=KeEzs1Q-pSiAtVK77G2tDLxg@mail.gmail.com>
From: Andrew Strauss <astrauss11@gmail.com>
Date: Tue, 1 Jun 2021 06:52:48 -0400
Message-ID: <CAP=E3JhXeG-eyrVifAZBv4A05rxCsm_eihe1pXJ8Zi=jTiENcQ@mail.gmail.com>
Subject: Re: [RFC PATCH] semihosting/arm-compat: remove heuristic softmmu SYS_HEAPINFO
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Content-Type: multipart/alternative; boundary="00000000000039a15d05c3b225ce"
X-TUID: m3KsEfy95S5f

--00000000000039a15d05c3b225ce
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yeah, newlib falls back to using the symbols __stack and end to figure out
where to start the stack and heap if 0 is returned by SYS_HEAPINFO.

-- Andrew Strauss

On Tue, Jun 1, 2021 at 6:31 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Tue, 1 Jun 2021 at 11:07, Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
> >
> >
> > Peter Maydell <peter.maydell@linaro.org> writes:
> >
> > > On Tue, 1 Jun 2021 at 10:12, Alex Benn=C3=A9e <alex.bennee@linaro.org=
>
> wrote:
> > >>
> > >> The previous numbers were a guess at best. While we could extract th=
e
> > >> information from a loaded ELF file via -kernel we could still get
> > >> tripped up by self decompressing or relocating code. Besides sane
> > >> library code has access to the same symbols in run time to make a
> > >> determination of the location of the heap.
> > >>
> > >> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> > >> Cc: Andrew <astrauss11@gmail.com>
> > >> ---
> > >>  semihosting/arm-compat-semi.c | 19 ++++++++++---------
> > >>  1 file changed, 10 insertions(+), 9 deletions(-)
> > >
> > > This seems like a pretty good candidate for breaking existing
> > > working binaries. How much testing against different varieties of
> > > guest-code-using-semihosting have you done ?
> >
> > None, which is why it's an RFC - but at least one user reported newlib
> > attempts to use the numbers we gave it rather than falling back to
> > numbers it knew from the build and getting it wrong. I suspect any code
> > that doesn't have a fallback path is getting it right more by luck than
> > judgement though. I'd be curious to hear of code that relies on the
> > numbers it gets from QEMU.
>
> Well, newlib is the main one I had in mind -- does it have a fallback
> codepath?
>
> -- PMM
>

--00000000000039a15d05c3b225ce
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Yeah, newlib falls back to using the symb=
ols __stack and end to figure out where to start the stack and heap if 0 is=
 returned by SYS_HEAPINFO.</div><div dir=3D"ltr"><br></div><div>-- Andrew S=
trauss<br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gm=
ail_attr">On Tue, Jun 1, 2021 at 6:31 AM Peter Maydell &lt;<a href=3D"mailt=
o:peter.maydell@linaro.org">peter.maydell@linaro.org</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue, 1 Jun 2021 at 1=
1:07, Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org" target=
=3D"_blank">alex.bennee@linaro.org</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt; Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org" target=
=3D"_blank">peter.maydell@linaro.org</a>&gt; writes:<br>
&gt;<br>
&gt; &gt; On Tue, 1 Jun 2021 at 10:12, Alex Benn=C3=A9e &lt;<a href=3D"mail=
to:alex.bennee@linaro.org" target=3D"_blank">alex.bennee@linaro.org</a>&gt;=
 wrote:<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; The previous numbers were a guess at best. While we could ext=
ract the<br>
&gt; &gt;&gt; information from a loaded ELF file via -kernel we could still=
 get<br>
&gt; &gt;&gt; tripped up by self decompressing or relocating code. Besides =
sane<br>
&gt; &gt;&gt; library code has access to the same symbols in run time to ma=
ke a<br>
&gt; &gt;&gt; determination of the location of the heap.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Signed-off-by: Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.be=
nnee@linaro.org" target=3D"_blank">alex.bennee@linaro.org</a>&gt;<br>
&gt; &gt;&gt; Cc: Andrew &lt;<a href=3D"mailto:astrauss11@gmail.com" target=
=3D"_blank">astrauss11@gmail.com</a>&gt;<br>
&gt; &gt;&gt; ---<br>
&gt; &gt;&gt;=C2=A0 semihosting/arm-compat-semi.c | 19 ++++++++++---------<=
br>
&gt; &gt;&gt;=C2=A0 1 file changed, 10 insertions(+), 9 deletions(-)<br>
&gt; &gt;<br>
&gt; &gt; This seems like a pretty good candidate for breaking existing<br>
&gt; &gt; working binaries. How much testing against different varieties of=
<br>
&gt; &gt; guest-code-using-semihosting have you done ?<br>
&gt;<br>
&gt; None, which is why it&#39;s an RFC - but at least one user reported ne=
wlib<br>
&gt; attempts to use the numbers we gave it rather than falling back to<br>
&gt; numbers it knew from the build and getting it wrong. I suspect any cod=
e<br>
&gt; that doesn&#39;t have a fallback path is getting it right more by luck=
 than<br>
&gt; judgement though. I&#39;d be curious to hear of code that relies on th=
e<br>
&gt; numbers it gets from QEMU.<br>
<br>
Well, newlib is the main one I had in mind -- does it have a fallback<br>
codepath?<br>
<br>
-- PMM<br>
</blockquote></div></div>

--00000000000039a15d05c3b225ce--
