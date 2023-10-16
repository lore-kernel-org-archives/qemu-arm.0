Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp3240168ejc;
        Mon, 16 Oct 2023 07:59:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFMp3iZteeml11J6mLPqMTI402qyqdvzFhkchlkqgQex3CDqqHlVHDVZHXH6DJ+AGtzkCWk
X-Received: by 2002:a05:622a:651:b0:40d:589d:9ce5 with SMTP id a17-20020a05622a065100b0040d589d9ce5mr39528958qtb.34.1697468357999;
        Mon, 16 Oct 2023 07:59:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697468357; cv=none;
        d=google.com; s=arc-20160816;
        b=eQfCx5M/Qb/ZJBrvUdmfMWQXVUeegOWX3zbvWd9XP+sdcV0BJWK4B3v53KBepqEZWd
         r7eip0hV9KeaZIkF2DdsviJoDFdb501QBFZ4UbE7ZPa4k5G+JPSNQPcL5SaUj3sva086
         SlujfyDC7KM4dQrctJXYb/HhEv4/aYklW+X+wtTos3wSbJ9jioVyeEyGOTM5kUlT+Csq
         iUbRsCZnNwRul+csk4EY2tRfqnrraFujvdCPr1LxU2+qGstYlTbDrfzo+MV+XFV4dMFb
         kbcntpjupZR24mVY8XuxsQyr/RLrUQy5n/uv+nVlt4D9Kn8ApK0cCT9JXLG2hhsYVAjD
         cEpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=diUamlBHjZf6xyEHj/pxt4Vry4evnH5aDuUnyiLvoHM=;
        fh=o6lzXfIHkJUkcD3JMuKdY3cyetGbDZa/iv8TApNLlvc=;
        b=0rs0wxikcvkkXBGbrlzs3KJ+N5ZezSh1UdHi/mj71LCFcqTKI92LFHdD5Iryu3zLES
         NepKu5gcIA0eVc/3kCq37BcKhS4uCSi5okGjvYoKWdVwhJoBOgFL9zN9jPSH3oSK4dno
         8tHIa56RJecIGl0zGiizf7LeiVu9y5QDzYrdnPxdJNbdA+/NY+btwujqnn5uYl9/IGQx
         4XYG+YV9GwNVDOsGs9Lcrxf/HKwjS65yF7v4DI0k5ulZkJaxoWoiatQercKYigtBh3sH
         624PzXyuHerK4DImuj6Hltmwd5Px3AiAwwrDAeMu2If32QhQPjFKks/KCe0Qyr8zzsCk
         hVgA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="d7VKU/eZ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h5-20020ac85845000000b003f6aa29b61dsi5479645qth.99.2023.10.16.07.59.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Oct 2023 07:59:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="d7VKU/eZ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qsP3O-0005ao-Rv; Mon, 16 Oct 2023 10:58:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1qsP3N-0005a8-SN
 for qemu-arm@nongnu.org; Mon, 16 Oct 2023 10:58:45 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1qsP3K-0005Lk-IC
 for qemu-arm@nongnu.org; Mon, 16 Oct 2023 10:58:45 -0400
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-9c3aec5f326so253706866b.1
 for <qemu-arm@nongnu.org>; Mon, 16 Oct 2023 07:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697468321; x=1698073121; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=diUamlBHjZf6xyEHj/pxt4Vry4evnH5aDuUnyiLvoHM=;
 b=d7VKU/eZBXOmUWoClWGA8ynJyT09EqQpSK3H1LoFxJT5Ws7nJpxtv4qe9VQjVD+/Gi
 N4pP2uHncLdkriKccTfuWZk3U2T1yMI5mKX00/syn4c9TmhxAWmLrFZYC+n37E3StHaw
 9Ct7HiPTc+kqIm3S5sMNAxoRkoL5B4EXxwnZUAS99SlVHrevDUTZ/ndyt84sGA8v177S
 v6KJukZ/bXlPBK0m//vln5tQ8446in6T3goreXyrU1HRhnYbcFQSH51lTiWnnbX4L4u9
 9TI8fzS9mUx0nPmR2/rsQlEGGAoGuDGbZ5NRSXHQYm385UNZqaVNaM7H6ainL9gYnuYI
 q36Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697468321; x=1698073121;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=diUamlBHjZf6xyEHj/pxt4Vry4evnH5aDuUnyiLvoHM=;
 b=gMys62t5o2+q02hxVpFvjcojLi5X2+x/lIZ7QIiAeRvSjrAk5ZQ7HFGfdi0jiD27+L
 yYQJkAxxenG4M9SDy8BYrieg6+Nzbx1fwhxObT6Csya5Kzs08v3q1xj6q2z9fM6lt+Dk
 LKryXe/dBBqR+NKUM1wP0210Q7NLG/GdkS1x4JK/uwAiExbzOB72WDUH/5rmNiSgxVSv
 7EtAEkpJf6I7KLxLt8nv6LthTbJWFMsF1RPKdcZciIKyWLairvCll+IO/r8y+o4Jb6Vi
 Xhq9bw9tEJOLHUde52WlMzjWwyNWx4DaE1hj6G5i/pdboj0Q9gxylvyZDhYq8D730EHd
 tRiQ==
X-Gm-Message-State: AOJu0Yy8Az/RvoXuNCqhUQxHEDItnrFPjJdK4/l/iSiBYe5U9ECWsZbP
 z4WynZraD2B2ZgaGq3UQK6mF5O0OgiZSNygFhEtHjg==
X-Received: by 2002:a17:907:c26:b0:9ad:8a96:ad55 with SMTP id
 ga38-20020a1709070c2600b009ad8a96ad55mr7717305ejc.14.1697468320868; Mon, 16
 Oct 2023 07:58:40 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1697183081.git.manos.pitsidianakis@linaro.org>
 <87o7h2hey5.fsf@pond.sub.org>
 <CAFEAcA-LQP_dQ0mjeNe8nOtMVy22iwJt2yfG5m_f4oQjQ9ts7w@mail.gmail.com>
In-Reply-To: <CAFEAcA-LQP_dQ0mjeNe8nOtMVy22iwJt2yfG5m_f4oQjQ9ts7w@mail.gmail.com>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Mon, 16 Oct 2023 17:58:28 +0300
Message-ID: <CAAjaMXYfu2rVVUkwAczqQRHxgFrYr=hQHP_UGn7LVUks+DFz4A@mail.gmail.com>
Subject: Re: [RFC PATCH 00/78] Strict disable implicit fallthrough
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org, 
 "open list:ARM SMMU" <qemu-arm@nongnu.org>,
 "open list:Block Jobs" <qemu-block@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000487ca90607d6a4f7"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 0W2ZvpnCnWJW

--000000000000487ca90607d6a4f7
Content-Type: text/plain; charset="UTF-8"

Hello Peter,

On Mon, 16 Oct 2023, 17:13 Peter Maydell, <peter.maydell@linaro.org> wrote:

> On Fri, 13 Oct 2023 at 13:42, Markus Armbruster <armbru@redhat.com> wrote:
> >
> > Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org> writes:
> >
> > > Hello,
> > >
> > > This RFC is inspired by the kernel's move to -Wimplicit-fallthrough=3
> > > back in 2019.[0]
> > > We take one step (or two) further by increasing it to 5 which rejects
> > > fall through comments and requires an attribute statement.
> > >
> > > [0]:
> > >
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=a035d552a93b
> > >
> > > The line differences are not many, but they spread all over different
> > > subsystems, architectures and devices. An attempt has been made to
> split
> > > them in cohesive patches to aid post-RFC review. Part of the RFC is to
> > > determine whether these patch divisions needs improvement.
> > >
> > > Main questions this RFC poses
> > > =============================
> > >
> > > - Is this change desirable and net-positive.
> >
> > Unwanted fallthrough is an easy mistake to make, and
> > -Wimplicit-fallthrough=N helps avoid it.  The question is how far up we
> > need to push N.  Right now we're at N=2.  Has unwanted fallthrough been
> > a problem?
>
> Mmm, this is my opinion I think. We have a mechanism for
> catching "forgot the 'break'" already (our =2 setting) and
> a way to say "intentional" in a fairly natural way (add the
> comment). Does pushing N up any further gain us anything
> except a load of churn?
>
> Also, the compiler is not the only thing that processes our
> code: Coverity also looks for "unexpected fallthrough" issues,
> so if we wanted to switch away from our current practice we
> should check whether what we're switching to is an idiom
> that Coverity recognises.
>

It is a code style change as the cover letter mentions, it's not related to
the static analysis itself.

--
Manos

>

--000000000000487ca90607d6a4f7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hello Peter,<br><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Mon, 16 Oct 2023, 17:13 Peter Maydell, =
&lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@linaro.org</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Fri, 13 Oct 2023 at=
 13:42, Markus Armbruster &lt;<a href=3D"mailto:armbru@redhat.com" target=
=3D"_blank" rel=3D"noreferrer">armbru@redhat.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Emmanouil Pitsidianakis &lt;<a href=3D"mailto:manos.pitsidianakis@lina=
ro.org" target=3D"_blank" rel=3D"noreferrer">manos.pitsidianakis@linaro.org=
</a>&gt; writes:<br>
&gt;<br>
&gt; &gt; Hello,<br>
&gt; &gt;<br>
&gt; &gt; This RFC is inspired by the kernel&#39;s move to -Wimplicit-fallt=
hrough=3D3<br>
&gt; &gt; back in 2019.[0]<br>
&gt; &gt; We take one step (or two) further by increasing it to 5 which rej=
ects<br>
&gt; &gt; fall through comments and requires an attribute statement.<br>
&gt; &gt;<br>
&gt; &gt; [0]:<br>
&gt; &gt; <a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git/commit/?id=3Da035d552a93b" rel=3D"noreferrer noreferrer" targe=
t=3D"_blank">https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux=
.git/commit/?id=3Da035d552a93b</a><br>
&gt; &gt;<br>
&gt; &gt; The line differences are not many, but they spread all over diffe=
rent<br>
&gt; &gt; subsystems, architectures and devices. An attempt has been made t=
o split<br>
&gt; &gt; them in cohesive patches to aid post-RFC review. Part of the RFC =
is to<br>
&gt; &gt; determine whether these patch divisions needs improvement.<br>
&gt; &gt;<br>
&gt; &gt; Main questions this RFC poses<br>
&gt; &gt; =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; &gt;<br>
&gt; &gt; - Is this change desirable and net-positive.<br>
&gt;<br>
&gt; Unwanted fallthrough is an easy mistake to make, and<br>
&gt; -Wimplicit-fallthrough=3DN helps avoid it.=C2=A0 The question is how f=
ar up we<br>
&gt; need to push N.=C2=A0 Right now we&#39;re at N=3D2.=C2=A0 Has unwanted=
 fallthrough been<br>
&gt; a problem?<br>
<br>
Mmm, this is my opinion I think. We have a mechanism for<br>
catching &quot;forgot the &#39;break&#39;&quot; already (our =3D2 setting) =
and<br>
a way to say &quot;intentional&quot; in a fairly natural way (add the<br>
comment). Does pushing N up any further gain us anything<br>
except a load of churn?<br>
<br>
Also, the compiler is not the only thing that processes our<br>
code: Coverity also looks for &quot;unexpected fallthrough&quot; issues,<br=
>
so if we wanted to switch away from our current practice we<br>
should check whether what we&#39;re switching to is an idiom<br>
that Coverity recognises.<br></blockquote></div></div><div dir=3D"auto"><br=
></div><div dir=3D"auto">It is a code style change as the cover letter ment=
ions, it&#39;s not related to the static analysis itself.</div><div dir=3D"=
auto"><br></div><div dir=3D"auto">--</div><div dir=3D"auto">Manos</div><div=
 dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--000000000000487ca90607d6a4f7--
