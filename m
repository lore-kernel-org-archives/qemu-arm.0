Received: by 2002:a17:906:590b:b0:a31:23a7:2a34 with SMTP id h11csp309274ejq;
        Wed, 24 Jan 2024 05:59:43 -0800 (PST)
X-Received: by 2002:a05:651c:b29:b0:2cc:e86c:7fc2 with SMTP id b41-20020a05651c0b2900b002cce86c7fc2mr602124ljr.153.1706104783262;
        Wed, 24 Jan 2024 05:59:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706104783; cv=none;
        d=google.com; s=arc-20160816;
        b=g8uYiBgkJbJErYma24OVNhk2Y7OTTFIAw5sfRz1Huf5TqYLIxzQDlSOFrH7Sfs9p9P
         +Z4lH4juNd54Tbyi3S73dToVzKeZfjXpOIC6WkIbKeP0/AbeNZn4Pzdys/qODFSTR/Fr
         8a2I4QC2DdBrDyeQS+4lmvCgzCpRnowWV3W4kXqLgyOilF/kz+OtPUONMlBE0opD3cEt
         F2u9/ngztZPo2gMjpaw9Kx1K8YHvQAkAdNVMUEPke1paLiCZbX51iFT0+tgDuTdAVkQ2
         vHNwSPdejR84jShNLaLHV7IOz/1dA32OW06jt+c4U0SMOpMETWqMN8UMPPmUOeDpQPNf
         GGQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=8fNpQFi2GM0w37a0PO1Z4htSzc3o14Ers8stsbamzC8=;
        fh=RdGC+Elts2HyLTiTm7BdegMDW6Glbfp7jwLT7GT6JDQ=;
        b=HU3yRd+pZZet6Ho5Iev6GEjSK9QA2ibUP5qz5y+skGirZDAd5xuEsJYGqTg9+td/xM
         0Jugo/pbElN4w8U/MiHvTO9onQDiC7VDd2o8Mzl3Q13q+YX4oeOnRwhucjwDK/wUvOML
         u3eX1Z5h+zNHV0etWFxQkXwUmKJWlcykJ0zmscTSexSn7a/bdT4Ih1ytObkCx992xBl5
         lNWI9VeAMrI7TWNUz9sKjKYp7AiDx1+vEuibIn4zwpUBPlWz0wQic6APWoHoiEAQ1rc0
         Fj6u9aEjOVXJMh9QsHLM3vq3WHPFhg0yM3e3wv3phcaChuun4xTaWOKiJiHpiCMxkm3x
         7qQg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=XsTzRM4k;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id x3-20020aa7d383000000b0055c4cb82bbfsor110041edq.10.2024.01.24.05.59.43
        (Google Transport Security);
        Wed, 24 Jan 2024 05:59:43 -0800 (PST)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=XsTzRM4k;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706104782; x=1706709582; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8fNpQFi2GM0w37a0PO1Z4htSzc3o14Ers8stsbamzC8=;
        b=XsTzRM4kGtHquFlu0S8O3CJXLuTq5D5wBDFFweZzeajwd6mvnbjPu5h5PzYXnj9MS7
         muVC/Nq9QQPTVGXnI1sDTYeO7T2VaWrbti/RlsBe6cqo3fQ53v5wA4Y2gHAN/8JD2Mc6
         G0TEfQgrTKn94vevDjT3VQvrfierw/OMVoOZImMNyy8ji04H3KNtT7UG3MTny1+RrEom
         WF35KLQxnFWbl0XtdRefnqWziRSwk7Clp99VuK6WiujNgUK01qzg9CzBr9cTcGpPxygc
         GkHDYTKor/hYGv7OE+YyBryc7V2ipIgoeWFM6nF82/XhJgxJ/8VMEzjKDFFLJYQWjnMG
         kWGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706104782; x=1706709582;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8fNpQFi2GM0w37a0PO1Z4htSzc3o14Ers8stsbamzC8=;
        b=D5vtceQDtDe/TgBUpUbh+CAFRapDbpkYX+eZjkbs+fWaZCK6G76PV6Gc8+6tGMVUe/
         i7lUNDclzJsfYuXXDJyxohHEdh783rM/e1JxOolVlJtIjpZGYsYyJnYGbLvdylGXXIJE
         VaYXW+j9oQhqqgYtXkjza+fwTXmrL2503n3NPW/RddHZnleDrq565aaa3nEZx980C8I2
         5Fho0ik3ifh54xhhyQc5SWf9T9Q/LRKTrEcU/sPaq6xFWZhwrx4PbOqI+0NqzGbdC7Uw
         +Mm30jlWtGt3H81t6Fy9J+Foc/vmdLETuM6u/SzAcw9vq0MJom6qbT6FgpN5pGyd15d5
         AG8Q==
X-Gm-Message-State: AOJu0YzWBi1P3JeWmvWYbH5nnUS6xfFUmrQDCJ1dPfKAd+9zqH6MFpSv
	ovGaBuR7BFGD5CDqjvrYect/eMqAHZNTxxhnCBJnCdYl0VjJsBGIC4M/U/vODuqKyVSKiSrVLel
	vxY5NpMoJJb5Zc4sInwTFM9ESMQsyd7EpFjzjFG0g
X-Google-Smtp-Source: AGHT+IEIiUNtaw0Djb+h4wv6InydMRC9iK8ay6yELMASXhGw+2lMNB0xwGazogaamNzlbn8coQQSf/Bvu53RFGNj4Hk=
X-Received: by 2002:a05:6402:2550:b0:55c:a89c:359f with SMTP id
 l16-20020a056402255000b0055ca89c359fmr392192edb.15.1706104781630; Wed, 24 Jan
 2024 05:59:41 -0800 (PST)
MIME-Version: 1.0
References: <20230925144854.1872513-1-alex.bennee@linaro.org>
 <20230925144854.1872513-5-alex.bennee@linaro.org> <ZRG1g/2hWi8+AzNn@redhat.com>
 <878r8urxxc.fsf@linaro.org> <CAJy5ezoucKM=VvYsHeFep7r0i1PV_JUCgq6gs4JJQVHqq3Yz3Q@mail.gmail.com>
 <5a1cb4ae-b43c-4ef5-9572-6636a2d787e7@linaro.org>
In-Reply-To: <5a1cb4ae-b43c-4ef5-9572-6636a2d787e7@linaro.org>
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Date: Wed, 24 Jan 2024 14:59:28 +0100
Message-ID: <CAJy5ezoW40OxdEjLgu4VXLrA7CurVSSUcj5JM18fh6wxPb0eYg@mail.gmail.com>
Subject: Re: [PATCH 04/31] docs: mark CRIS support as deprecated
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	=?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
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
	Thomas Huth <thuth@redhat.com>, Wainer dos Santos Moschetta <wainersm@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Bin Meng <bin.meng@windriver.com>, 
	Alexandre Iooss <erdnaxe@crans.org>, Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-ppc@nongnu.org, 
	David Hildenbrand <david@redhat.com>, Yanan Wang <wangyanan55@huawei.com>, 
	Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org, qemu-arm@nongnu.org, 
	Palmer Dabbelt <palmer@dabbelt.com>, Ilya Leoshkevich <iii@linux.ibm.com>, 
	Laurent Vivier <lvivier@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Leif Lindholm <quic_llindhol@quicinc.com>, Beraldo Leal <bleal@redhat.com>, 
	Rabin Vincent <rabinv@axis.com>
Content-Type: multipart/alternative; boundary="000000000000757348060fb1796c"
X-TUID: yIjDbAktOwJ4

--000000000000757348060fb1796c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 24, 2024 at 12:06=E2=80=AFPM Philippe Mathieu-Daud=C3=A9 <philm=
d@linaro.org>
wrote:

> On 25/9/23 19:17, Edgar E. Iglesias wrote:
> >
> > On Mon, Sep 25, 2023 at 7:00=E2=80=AFPM Alex Benn=C3=A9e <alex.bennee@l=
inaro.org
> > <mailto:alex.bennee@linaro.org>> wrote:
> >
> >
> >     Daniel P. Berrang=C3=A9 <berrange@redhat.com
> >     <mailto:berrange@redhat.com>> writes:
> >
> >      > On Mon, Sep 25, 2023 at 03:48:27PM +0100, Alex Benn=C3=A9e wrote=
:
> >      >> This might be premature but while streamling the avocado tests =
I
> >      >> realised the only tests we have are "check-tcg" ones. The aging
> >      >> fedora-criss-cross image works well enough for developers but
> >     can't be
> >      >> used in CI as we need supported build platforms to build QEMU.
> >      >>
> >      >> Does this mean the writing is on the wall for this architecture=
?
> >      >>
> >      >> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org
> >     <mailto:alex.bennee@linaro.org>>
> >      >> Cc: Rabin Vincent <rabinv@axis.com <mailto:rabinv@axis.com>>
> >      >> Cc: Edgar E. Iglesias <edgar.iglesias@xilinx.com
> >     <mailto:edgar.iglesias@xilinx.com>>
> >      >> ---
> >      >>  docs/about/deprecated.rst | 11 +++++++++++
> >      >>  1 file changed, 11 insertions(+)
> >      >>
> >      >> diff --git a/docs/about/deprecated.rst
> b/docs/about/deprecated.rst
> >      >> index dc4da95329..7cfe313aa6 100644
> >      >> --- a/docs/about/deprecated.rst
> >      >> +++ b/docs/about/deprecated.rst
> >      >> @@ -399,6 +399,17 @@ Specifying the iSCSI password in plain tex=
t
> >     on the command line using the
> >      >>  used instead, to refer to a ``--object secret...`` instance
> >     that provides
> >      >>  a password via a file, or encrypted.
> >      >>
> >      >> +TCG CPUs
> >      >> +--------
> >      >> +
> >      >> +CRIS CPU architecture (since 8.1)
> >      >> +'''''''''''''''''''''''''''''''''
> >      >> +
> >      >> +The CRIS architecture was pulled from Linux in 4.17 and the
> >     compiler
> >      >> +is no longer packaged in any distro making it harder to run th=
e
> >      >> +``check-tcg`` tests. Unless we can improve the testing
> >     situation there
> >      >> +is a chance the code will bitrot without anyone noticing.
> >      >
> >      > Deprecated is generally a warning that we intend to delete the
> >      > feature.   If we're just going to relegate it to untested
> >      > status (what I'd call "tier 3" quality), then we should document
> >      > that elsewhere.  I don't mind which way we go.
> >
> >     We do have reasonably good coverage with tests/tcg/cris but of cour=
se
> >     without a compiler we can't build them.
> >
> >     Both nios2 and microblaze have build-toolchain scripts which can be
> used
> >     to re-create containers. However my preference is having pre-built
> >     toolchains hosted by others like we do for loongarch, hexagon, xten=
sa
> >     and tricore. Then the docker image can simply curl them into an
> image.
> >
> >
> > Yeah, I guess it's time to deprecate it...
>
> Is that an informal Acked-by? (:
>
>
OK with me!

Acked-by: Edgar E. Iglesias <edgar.iglesias@gmail.com>

--000000000000757348060fb1796c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jan 24, 2024 at 12:06=E2=80=
=AFPM Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@linaro.org">=
philmd@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">On 25/9/23 19:17, Edgar E. Iglesias wrote:<br>
&gt; <br>
&gt; On Mon, Sep 25, 2023 at 7:00=E2=80=AFPM Alex Benn=C3=A9e &lt;<a href=
=3D"mailto:alex.bennee@linaro.org" target=3D"_blank">alex.bennee@linaro.org=
</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:alex.bennee@linaro.org" target=3D"_blank"=
>alex.bennee@linaro.org</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Daniel P. Berrang=C3=A9 &lt;<a href=3D"mailto:berra=
nge@redhat.com" target=3D"_blank">berrange@redhat.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:berrange@redhat.com" t=
arget=3D"_blank">berrange@redhat.com</a>&gt;&gt; writes:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; On Mon, Sep 25, 2023 at 03:48:27PM +0100, Ale=
x Benn=C3=A9e wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; This might be premature but while streaml=
ing the avocado tests I<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; realised the only tests we have are &quot=
;check-tcg&quot; ones. The aging<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; fedora-criss-cross image works well enoug=
h for developers but<br>
&gt;=C2=A0 =C2=A0 =C2=A0can&#39;t be<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; used in CI as we need supported build pla=
tforms to build QEMU.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; Does this mean the writing is on the wall=
 for this architecture?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; Signed-off-by: Alex Benn=C3=A9e &lt;<a hr=
ef=3D"mailto:alex.bennee@linaro.org" target=3D"_blank">alex.bennee@linaro.o=
rg</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:alex.bennee@linaro.org=
" target=3D"_blank">alex.bennee@linaro.org</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; Cc: Rabin Vincent &lt;<a href=3D"mailto:r=
abinv@axis.com" target=3D"_blank">rabinv@axis.com</a> &lt;mailto:<a href=3D=
"mailto:rabinv@axis.com" target=3D"_blank">rabinv@axis.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; Cc: Edgar E. Iglesias &lt;<a href=3D"mail=
to:edgar.iglesias@xilinx.com" target=3D"_blank">edgar.iglesias@xilinx.com</=
a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:edgar.iglesias@xilinx.=
com" target=3D"_blank">edgar.iglesias@xilinx.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; ---<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 docs/about/deprecated.rst | 11 ++++=
+++++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 1 file changed, 11 insertions(+)<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; diff --git a/docs/about/deprecated.rst b/=
docs/about/deprecated.rst<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; index dc4da95329..7cfe313aa6 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; --- a/docs/about/deprecated.rst<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; +++ b/docs/about/deprecated.rst<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; @@ -399,6 +399,17 @@ Specifying the iSCSI=
 password in plain text<br>
&gt;=C2=A0 =C2=A0 =C2=A0on the command line using the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 used instead, to refer to a ``--obj=
ect secret...`` instance<br>
&gt;=C2=A0 =C2=A0 =C2=A0that provides<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 a password via a file, or encrypted=
.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; +TCG CPUs<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; +--------<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; +CRIS CPU architecture (since 8.1)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; +&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;=
&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;=
&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; +The CRIS architecture was pulled from Li=
nux in 4.17 and the<br>
&gt;=C2=A0 =C2=A0 =C2=A0compiler<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; +is no longer packaged in any distro maki=
ng it harder to run the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; +``check-tcg`` tests. Unless we can impro=
ve the testing<br>
&gt;=C2=A0 =C2=A0 =C2=A0situation there<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; +is a chance the code will bitrot without=
 anyone noticing.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Deprecated is generally a warning that we int=
end to delete the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; feature.=C2=A0 =C2=A0If we&#39;re just going =
to relegate it to untested<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; status (what I&#39;d call &quot;tier 3&quot; =
quality), then we should document<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; that elsewhere.=C2=A0 I don&#39;t mind which =
way we go.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0We do have reasonably good coverage with tests/tcg/=
cris but of course<br>
&gt;=C2=A0 =C2=A0 =C2=A0without a compiler we can&#39;t build them.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Both nios2 and microblaze have build-toolchain scri=
pts which can be used<br>
&gt;=C2=A0 =C2=A0 =C2=A0to re-create containers. However my preference is h=
aving pre-built<br>
&gt;=C2=A0 =C2=A0 =C2=A0toolchains hosted by others like we do for loongarc=
h, hexagon, xtensa<br>
&gt;=C2=A0 =C2=A0 =C2=A0and tricore. Then the docker image can simply curl =
them into an image.<br>
&gt; <br>
&gt; <br>
&gt; Yeah, I guess it&#39;s time to deprecate it...<br>
<br>
Is that an informal Acked-by? (:<br><br></blockquote><div><br></div><div>OK=
 with me!</div><div><br></div><div>Acked-by: Edgar E. Iglesias &lt;<a href=
=3D"mailto:edgar.iglesias@gmail.com">edgar.iglesias@gmail.com</a>&gt;</div>=
<div>=C2=A0</div></div></div>

--000000000000757348060fb1796c--
