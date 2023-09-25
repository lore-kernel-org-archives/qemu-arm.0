Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp543438ejc;
        Mon, 25 Sep 2023 10:18:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMfhajGxu9pEJ0oIu0sijqSQp378sBVIBYSGrRqIh76k49QnD7kiIKPK9JP5esKV+8e8GQ
X-Received: by 2002:ac2:430c:0:b0:503:314f:affe with SMTP id l12-20020ac2430c000000b00503314faffemr5330101lfh.17.1695662288081;
        Mon, 25 Sep 2023 10:18:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695662288; cv=none;
        d=google.com; s=arc-20160816;
        b=WrTjy0dg1nthRS3xEIipCcxM4Ju8iaZEzcuYui0IDMFsjrJpCv+Bh1mDgzPM7OX0GO
         xGlxicCqBTdbFt/hlR7g+8V2N2Yl94Ku6tpkZ1MlIDciYntzVz6rIUqa4kwDHU8BiCrR
         lKTiJDHzKpfXuZ8kffZHMnOd6K9OeTv02990DWl2qFnd1uTrGqzgnmUs3GaT8NoIxHGc
         K/H80TyBrK/pjyZGzvqtc3W2bX9dcvkGPBpfu2BXHWxRJmoBr+xHcyE7QOm7eW9Eoy8r
         i2A8ISb7bXl+sHJjvDSeD0qObI7YFMaXfWdf1XyrNM1De38iGm/8+gLlegOO+pEq1pIJ
         XC7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=J7i4KFEZ3VCP5ao6donJP8NRNxv/HImiLAsDiEO+CNs=;
        fh=s+w4pEokX5fsEoV+pjKxChHa470qt5qnb0lwKgIv924=;
        b=hn63PpTHODN/PeRujY9NPdTbfxEODRm4kGaF8PR+tzHCcFyzljQa6vp5hHLePsJbI8
         MEDI58kNZoMr29/8zwZyM+R3fpsxmK4CsmH8JvWx+t6P/RYKCb91yyh5jJc8ZJNoj4q4
         sjOxDLZS2ZxkrGrT1YUyQXw/FhzN3p1vDwPwZk8cRTw6rK6y3r2EqLWCgTZjjI76387j
         UcJ1m1muHKmU9910ZQ6nvMfPPWdL9pWzIIV6kQ9UWq/AxbTjWWheR1a1HnT31t9bgWgf
         D3yhPc639YKwIE2IvSXamUmsTCTopQrgWp0MR2MRC8/q97izFEF+DlQjs73MPHH/gDr7
         +D7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=nsN9uJZ2;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 2a00:1450:4864:20::534 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com. [2a00:1450:4864:20::534])
        by mx.google.com with ESMTPS id a11-20020aa7d90b000000b0052e34b814d1si8866916edr.295.2023.09.25.10.18.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Sep 2023 10:18:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 2a00:1450:4864:20::534 as permitted sender) client-ip=2a00:1450:4864:20::534;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=nsN9uJZ2;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 2a00:1450:4864:20::534 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5230a22cfd1so8089293a12.1;
        Mon, 25 Sep 2023 10:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695662287; x=1696267087; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=J7i4KFEZ3VCP5ao6donJP8NRNxv/HImiLAsDiEO+CNs=;
        b=nsN9uJZ2k6xhJGlCqtc4qI7TBDwsWhqLkl2hNZCabZ96pfvfmXcuXVfH430RHNxTy9
         Mq4xBLFsUvUfBfOXaZYyGJhdMyC6fUnFW2zcgbk22UXFTKV/7BymLHiDfrI0poKoyM9F
         sOypHysfyy1crA55opPlNYFqhBLlyKh/6QaeNZGygev5wzboCozmm8O1yODbSIFwW5Ir
         aOHYunGus74rqAegXBd116pvrk2Ru5/mw+W822rU53qqlry/65A1YzwcmI6w5XYf9EwX
         9+eEE7IHKNCY0KWlNjBlrwwyT/3KvtrPnwbRrOAZ5AXPdfXl3FQXin+1mEQ5CbRlwiZy
         +jog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695662287; x=1696267087;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J7i4KFEZ3VCP5ao6donJP8NRNxv/HImiLAsDiEO+CNs=;
        b=bq3ME4nvGdBU3KalAhhmLIsxE8OmJOBkKvZx7tzaMncuSZMPFHjhNXmUYH/kFV/Wzl
         ZkJS8Efu7eoYe1UMPMo6cWPdetKWVZiSXZteEDhV4F267vb6A9onp7l8osU+Sx00GfLs
         SDFE0h1ZeqpdnRZJBMo3XG+2NlH+cD5Rhw9WhwJjQ3fOEHQXGtZb+gE21oQ4W0W2n1Em
         kR9wfrEXMEL3blw5xo7nIfYaGyg+WIRxqjh+E1ha4rESqK8Pvy+TDZp7KekYW5kEEaPG
         QeUqxoe9FmI1jrHVuOzfy3Gvkt7hzlFNBpHJN2UddZI2gr2CbnC8gS+Maw/EBOPeX5Xp
         953w==
X-Gm-Message-State: AOJu0YxUzqrd8VmGYO4kH2xc/BRt3n/C5biLqQVyD+Q6bCJymZgookbp
	C2FQWbg/A6s6Okzq4vePGfEIyLN80oCK2ubdcOPem1TRIjbF9/ab
X-Received: by 2002:a05:6402:b5b:b0:533:d1cd:62c5 with SMTP id
 bx27-20020a0564020b5b00b00533d1cd62c5mr4789176edb.17.1695662286812; Mon, 25
 Sep 2023 10:18:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230925144854.1872513-1-alex.bennee@linaro.org>
 <20230925144854.1872513-5-alex.bennee@linaro.org> <ZRG1g/2hWi8+AzNn@redhat.com>
 <878r8urxxc.fsf@linaro.org>
In-Reply-To: <878r8urxxc.fsf@linaro.org>
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Date: Mon, 25 Sep 2023 19:17:55 +0200
Message-ID: <CAJy5ezoucKM=VvYsHeFep7r0i1PV_JUCgq6gs4JJQVHqq3Yz3Q@mail.gmail.com>
Subject: Re: [PATCH 04/31] docs: mark CRIS support as deprecated
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>, 
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, John Snow <jsnow@redhat.com>, libvir-list@redhat.com, 
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	qemu-s390x@nongnu.org, Song Gao <gaosong@loongson.cn>, 
	Daniel Henrique Barboza <danielhb413@gmail.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
	Weiwei Li <liweiwei@iscas.ac.cn>, Nicholas Piggin <npiggin@gmail.com>, 
	Radoslaw Biernacki <rad@semihalf.com>, Eduardo Habkost <eduardo@habkost.net>, Cleber Rosa <crosa@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Mahmoud Mandour <ma.mandourr@gmail.com>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Thomas Huth <thuth@redhat.com>, Wainer dos Santos Moschetta <wainersm@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Bin Meng <bin.meng@windriver.com>, 
	Alexandre Iooss <erdnaxe@crans.org>, Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-ppc@nongnu.org, 
	David Hildenbrand <david@redhat.com>, Yanan Wang <wangyanan55@huawei.com>, 
	Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org, qemu-arm@nongnu.org, 
	Palmer Dabbelt <palmer@dabbelt.com>, Ilya Leoshkevich <iii@linux.ibm.com>, 
	Laurent Vivier <lvivier@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Leif Lindholm <quic_llindhol@quicinc.com>, Beraldo Leal <bleal@redhat.com>, 
	Rabin Vincent <rabinv@axis.com>
Content-Type: multipart/alternative; boundary="00000000000043bf2a060632243a"
X-TUID: TnqtW3iPeQp+

--00000000000043bf2a060632243a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 25, 2023 at 7:00=E2=80=AFPM Alex Benn=C3=A9e <alex.bennee@linar=
o.org> wrote:

>
> Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:
>
> > On Mon, Sep 25, 2023 at 03:48:27PM +0100, Alex Benn=C3=A9e wrote:
> >> This might be premature but while streamling the avocado tests I
> >> realised the only tests we have are "check-tcg" ones. The aging
> >> fedora-criss-cross image works well enough for developers but can't be
> >> used in CI as we need supported build platforms to build QEMU.
> >>
> >> Does this mean the writing is on the wall for this architecture?
> >>
> >> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> >> Cc: Rabin Vincent <rabinv@axis.com>
> >> Cc: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> >> ---
> >>  docs/about/deprecated.rst | 11 +++++++++++
> >>  1 file changed, 11 insertions(+)
> >>
> >> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> >> index dc4da95329..7cfe313aa6 100644
> >> --- a/docs/about/deprecated.rst
> >> +++ b/docs/about/deprecated.rst
> >> @@ -399,6 +399,17 @@ Specifying the iSCSI password in plain text on th=
e
> command line using the
> >>  used instead, to refer to a ``--object secret...`` instance that
> provides
> >>  a password via a file, or encrypted.
> >>
> >> +TCG CPUs
> >> +--------
> >> +
> >> +CRIS CPU architecture (since 8.1)
> >> +'''''''''''''''''''''''''''''''''
> >> +
> >> +The CRIS architecture was pulled from Linux in 4.17 and the compiler
> >> +is no longer packaged in any distro making it harder to run the
> >> +``check-tcg`` tests. Unless we can improve the testing situation ther=
e
> >> +is a chance the code will bitrot without anyone noticing.
> >
> > Deprecated is generally a warning that we intend to delete the
> > feature.   If we're just going to relegate it to untested
> > status (what I'd call "tier 3" quality), then we should document
> > that elsewhere.  I don't mind which way we go.
>
> We do have reasonably good coverage with tests/tcg/cris but of course
> without a compiler we can't build them.
>
> Both nios2 and microblaze have build-toolchain scripts which can be used
> to re-create containers. However my preference is having pre-built
> toolchains hosted by others like we do for loongarch, hexagon, xtensa
> and tricore. Then the docker image can simply curl them into an image.
>
>
Yeah, I guess it's time to deprecate it...

Cheers,
Edgar


> --
> Alex Benn=C3=A9e
> Virtualisation Tech Lead @ Linaro
>
>

--00000000000043bf2a060632243a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Mon, Sep 25, 2023 at 7:00=E2=80=AFPM A=
lex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org">alex.bennee@l=
inaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><br>
Daniel P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com" target=
=3D"_blank">berrange@redhat.com</a>&gt; writes:<br>
<br>
&gt; On Mon, Sep 25, 2023 at 03:48:27PM +0100, Alex Benn=C3=A9e wrote:<br>
&gt;&gt; This might be premature but while streamling the avocado tests I<b=
r>
&gt;&gt; realised the only tests we have are &quot;check-tcg&quot; ones. Th=
e aging<br>
&gt;&gt; fedora-criss-cross image works well enough for developers but can&=
#39;t be<br>
&gt;&gt; used in CI as we need supported build platforms to build QEMU.<br>
&gt;&gt; <br>
&gt;&gt; Does this mean the writing is on the wall for this architecture?<b=
r>
&gt;&gt; <br>
&gt;&gt; Signed-off-by: Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@=
linaro.org" target=3D"_blank">alex.bennee@linaro.org</a>&gt;<br>
&gt;&gt; Cc: Rabin Vincent &lt;<a href=3D"mailto:rabinv@axis.com" target=3D=
"_blank">rabinv@axis.com</a>&gt;<br>
&gt;&gt; Cc: Edgar E. Iglesias &lt;<a href=3D"mailto:edgar.iglesias@xilinx.=
com" target=3D"_blank">edgar.iglesias@xilinx.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 docs/about/deprecated.rst | 11 +++++++++++<br>
&gt;&gt;=C2=A0 1 file changed, 11 insertions(+)<br>
&gt;&gt; <br>
&gt;&gt; diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst=
<br>
&gt;&gt; index dc4da95329..7cfe313aa6 100644<br>
&gt;&gt; --- a/docs/about/deprecated.rst<br>
&gt;&gt; +++ b/docs/about/deprecated.rst<br>
&gt;&gt; @@ -399,6 +399,17 @@ Specifying the iSCSI password in plain text o=
n the command line using the<br>
&gt;&gt;=C2=A0 used instead, to refer to a ``--object secret...`` instance =
that provides<br>
&gt;&gt;=C2=A0 a password via a file, or encrypted.<br>
&gt;&gt;=C2=A0 <br>
&gt;&gt; +TCG CPUs<br>
&gt;&gt; +--------<br>
&gt;&gt; +<br>
&gt;&gt; +CRIS CPU architecture (since 8.1)<br>
&gt;&gt; +&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;=
&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;=
&#39;&#39;&#39;&#39;&#39;<br>
&gt;&gt; +<br>
&gt;&gt; +The CRIS architecture was pulled from Linux in 4.17 and the compi=
ler<br>
&gt;&gt; +is no longer packaged in any distro making it harder to run the<b=
r>
&gt;&gt; +``check-tcg`` tests. Unless we can improve the testing situation =
there<br>
&gt;&gt; +is a chance the code will bitrot without anyone noticing.<br>
&gt;<br>
&gt; Deprecated is generally a warning that we intend to delete the<br>
&gt; feature.=C2=A0 =C2=A0If we&#39;re just going to relegate it to unteste=
d<br>
&gt; status (what I&#39;d call &quot;tier 3&quot; quality), then we should =
document<br>
&gt; that elsewhere.=C2=A0 I don&#39;t mind which way we go.<br>
<br>
We do have reasonably good coverage with tests/tcg/cris but of course<br>
without a compiler we can&#39;t build them.<br>
<br>
Both nios2 and microblaze have build-toolchain scripts which can be used<br=
>
to re-create containers. However my preference is having pre-built<br>
toolchains hosted by others like we do for loongarch, hexagon, xtensa<br>
and tricore. Then the docker image can simply curl them into an image.<br>
<br></blockquote><div><br></div><div>Yeah, I guess it&#39;s time to depreca=
te it...</div><div><br></div><div>Cheers,</div><div>Edgar</div><div>=C2=A0<=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
-- <br>
Alex Benn=C3=A9e<br>
Virtualisation Tech Lead @ Linaro<br>
<br>
</blockquote></div></div>

--00000000000043bf2a060632243a--
