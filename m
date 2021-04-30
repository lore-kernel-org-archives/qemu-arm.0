Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp245912lfg;
        Fri, 30 Apr 2021 08:57:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwvhRuelITlB0fJ+m9LrN+BEoCpO8PSAU2bWBquCoUMafxqcSL2Hyhx88fAPKmBj9mDElNt
X-Received: by 2002:a05:6e02:e0a:: with SMTP id a10mr4431600ilk.271.1619798220866;
        Fri, 30 Apr 2021 08:57:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619798220; cv=none;
        d=google.com; s=arc-20160816;
        b=mPB8NV62saMbE8O37GBIVinnGcTzFe/mF5ihNtgKkujRyn+bJjz4gj0U06/ZhGgI2C
         A5Vf05E6LvU00wDHZ/KumNY0abWv4iPMQTYr4/Gj9HVySDJ6+cuMkDJ4zGURpMB2rKeM
         ElJqq4SKOYqOn0gH3XjzMKC37UM9jC0OTTC9bApQz9Zc3IcgfKqmj1Pwp2/p0UMO0dFp
         O/rxcJN4cP5BWoTu13ObMBj1g/nlIsGfTK31YjQhHgukHSRZ5wV/SmbTpUbO1nrviDn5
         ohVJSYbIC3PxWghf8T9tESHQwRutJKQ6msm8ciUaZEukm14Xt74reGs+bSnPSr+gMqsx
         Eu6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:subject:references
         :in-reply-to:message-id:to:from:date:dkim-signature;
        bh=8JbeG77B4i0aUZIVbgMv0hLBrg9OCFkl+sFmOrFqJzg=;
        b=nSA3kI9QttVQ8RBnuiP90gzZlqpXcMiLF8lZdERVqZb77kfAnJfIHqyfS3VQY6ZWVx
         wrD1z6gDzjFVA/iVBc3PNE0rb9GlY9tVC0PO9nKxrFXddOI41EPTg7k1GjfK8qK8KMNm
         1D3H1rlQHfHRYrtt5+qIZk0WdnjALAFZEvLpNI3f8CoRO16SbXkSjDU2XPNPAzmfhPw8
         PgJu0L+C7DSJjCgO9dWOe/0iPhD+3uG0BRlur7Fm/FryFkd7SQqYvem4Vj++nYqWkD9O
         Srq9qwFXx95I2jc3odVQvoKKS0/SL6QOrsHlYPJ1HCb54KgLiobIJkR9FXhoJQVwAxRm
         uaIA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Sj8A4IQT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o24si2773068jah.59.2021.04.30.08.57.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Apr 2021 08:57:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Sj8A4IQT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lcVVk-0005N0-7Y
	for alex.bennee@linaro.org; Fri, 30 Apr 2021 11:57:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lcVUu-0003uL-0g
 for qemu-arm@nongnu.org; Fri, 30 Apr 2021 11:56:08 -0400
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c]:39817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lcVUq-00033J-Ji
 for qemu-arm@nongnu.org; Fri, 30 Apr 2021 11:56:06 -0400
Received: by mail-qk1-x72c.google.com with SMTP id k127so15533042qkc.6
 for <qemu-arm@nongnu.org>; Fri, 30 Apr 2021 08:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:message-id:in-reply-to:references:subject
 :mime-version; bh=8JbeG77B4i0aUZIVbgMv0hLBrg9OCFkl+sFmOrFqJzg=;
 b=Sj8A4IQTkk93rBvqS8yX0d9xi8reGBur1EjISY/YStz/xUoWNw6FA7lO98B5nAQCt8
 ZC3y75TEy4wTj1jc/7zAFF/Pmxn6l8Ncxsw5wUp738dOiHuJmQqK54S3J6/tSk9HCfd2
 ojc50qhL67DVQgGMdOGvh1FhrKPzhCHziPh+Nx5JRZS+KuqH1PlxW+SGRL4sjkkTthjo
 QATnkH2SUkdDw1LPYu95PhmztpwZ3IrqKpl0Wh5/1qgDUK07yZ0y41PA6298DcIAXLBJ
 +ghydXIcOeSeZThjxojl9rx67/+STBbpSL7BERrUhvDWz03S8uuW7fQfTHbMjqMGpnq9
 GWnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:message-id:in-reply-to
 :references:subject:mime-version;
 bh=8JbeG77B4i0aUZIVbgMv0hLBrg9OCFkl+sFmOrFqJzg=;
 b=gCuTaKVKPJGCG9eBhtnCWPqSSJun1SBr4tSOSzyJT/PxpqAJU9Ji6wEljPq2PVjRvl
 8hMir709qhc40bW9lQzOx7a93qXIJGKWiwGbrybusucWszgZpQNvkotMQI+aDTayn3lB
 c5719kPsI8592sspqhB9nKWR7bwBaLwAkHbrD/FjqJB5NI4VfoNCvIC+lQeec0gn1tux
 /zB9HZ8o5/v8mVL3FngRJ4gz9FpmH6XjiyhB5txvl/9FBbDCXnPU3MvtkOC2PDxEvZkT
 NlWmzWZ3cxvzzhRdpsueC4FPs4vHgS7JhJPvU9nmAVSMPYfsS0PXz9ok+Cci6Aob0uzp
 VatQ==
X-Gm-Message-State: AOAM533NSQpCEb4vOUyEnK7yN+y+GGUc/seE3I5oX5vW+Q0PJOnc5b4x
 mAYB8lMkmjLpis5xVCcCFAKi5Nc5gGwyBA==
X-Received: by 2002:a37:905:: with SMTP id 5mr6176652qkj.183.1619798163570;
 Fri, 30 Apr 2021 08:56:03 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-23-174-92-28-28.dsl.bell.ca. [174.92.28.28])
 by smtp.gmail.com with ESMTPSA id e15sm1756551qkl.9.2021.04.30.08.56.03
 for <qemu-arm@nongnu.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 30 Apr 2021 08:56:03 -0700 (PDT)
Date: Fri, 30 Apr 2021 11:56:00 -0400
From: Shashi Mallela <shashi.mallela@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <4B93C023-32E5-468F-80A8-DF58C8CD442F@getmailspring.com>
In-Reply-To: <CAFEAcA8EXUu8nfqz2Xn_Rke4Nk+cvdOuZOoFSfGkN6FFeTJ=yQ@mail.gmail.com>
References: <CAFEAcA8EXUu8nfqz2Xn_Rke4Nk+cvdOuZOoFSfGkN6FFeTJ=yQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] hw/intc: GICv3 ITS initial framework
X-Mailer: Mailspring
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="608c2890_3c7f7cc7_12a1"
Received-SPF: pass client-ip=2607:f8b0:4864:20::72c;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qk1-x72c.google.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_IMAGE_ONLY_20=1.546, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Leif Lindholm <leif@nuviainc.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Radoslaw Biernacki <rad@semihalf.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nt5YcPoAC+oN

--608c2890_3c7f7cc7_12a1
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Have taken care of it.please ignore PIDR2 changes in the current patchset ,will update the latest changes in the next patchset version

Thanks
Shashi

On Apr 30 2021, at 6:09 am, Peter Maydell <peter.maydell@linaro.org> wrote:
> On Fri, 30 Apr 2021 at 00:36, <shashi.mallela@linaro.org> wrote:
> >
> > On Fri, 2021-04-16 at 18:21 +0100, Peter Maydell wrote:
> > > On Thu, 1 Apr 2021 at 03:41, Shashi Mallela <
> > > shashi.mallela@linaro.org> wrote:
> > > > +#define GITS_PIDR2 0xFFE8
> > >
> > > You probably don't want an offset for GITS_PIDR2 specifically.
> > > Compare handling of GICD_IDREGS in the distributor emulation.
> > > Tried re-using the GICD_IDREGS offset for GITS_PIDR2,but from testing
> > > observed that the linux kernel driver and kvm-unit-tests both relied
> > > on using the 0xFFE8 offset instead of 0xFFD0 (used by GICD & GICR) to
> > > complete ITS initialization and setup
>
> I didn't mean "just put PIDR2 at the GICD_IDREGS offset", which
> obviously won't work, I meant "implement the whole set of ID registers
> (of which PIDR2 is one in the middle) in the same way we implement that
> set on the other GIC components".
>
> -- PMM
--608c2890_3c7f7cc7_12a1
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<div>Have taken care of it.please ignore PIDR2 changes in the current pat=
chset&nbsp; ,will update the latest changes in the next patchset version<=
/div><br><div>Thanks</div><div>Shashi</div><br><div class=3D=22gmail=5Fqu=
ote=5Fattribution=22>On Apr 30 2021, at 6:09 am, Peter Maydell &lt;peter.=
maydell=40linaro.org&gt; wrote:</div><blockquote><div><div>On =46ri, 30 A=
pr 2021 at 00:36, &lt;shashi.mallela=40linaro.org&gt; wrote:</div><div>&g=
t;</div><div>&gt; On =46ri, 2021-04-16 at 18:21 +0100, Peter Maydell wrot=
e:</div><div>&gt; &gt; On Thu, 1 Apr 2021 at 03:41, Shashi Mallela &lt;</=
div><div>&gt; &gt; shashi.mallela=40linaro.org&gt; wrote:</div><div>&gt; =
&gt; &gt; +=23define GITS=5FPIDR2 0x=46=46E8</div><div>&gt; &gt;</div><di=
v>&gt; &gt; You probably don't want an offset for GITS=5FPIDR2 specifical=
ly.</div><div>&gt; &gt; Compare handling of GICD=5FIDREGS in the distribu=
tor emulation.</div><div>&gt; &gt; Tried re-using the GICD=5FIDREGS offse=
t for GITS=5FPIDR2,but from testing</div><div>&gt; &gt; observed that the=
 linux kernel driver and kvm-unit-tests both relied</div><div>&gt; &gt; o=
n using the 0x=46=46E8 offset instead of 0x=46=46D0 (used by GICD &amp; G=
ICR) to</div><div>&gt; &gt; complete ITS initialization and setup</div><b=
r><div>I didn't mean =22just put PIDR2 at the GICD=5FIDREGS offset=22, wh=
ich</div><div>obviously won't work, I meant =22implement the whole set of=
 ID registers</div><div>(of which PIDR2 is one in the middle) in the same=
 way we implement that</div><div>set on the other GIC components=22.</div=
><br><div>-- PMM</div></div></blockquote><img class=3D=22mailspring-open=22=
 alt=3D=22Sent from Mailspring=22 width=3D=220=22 height=3D=220=22 style=3D=
=22border:0; width:0; height:0;=22 src=3D=22https://link.getmailspring.co=
m/open/4B93C023-32E5-468=46-80A8-D=4658C8CD442=46=40getmailspring.com=3Fm=
e=3D2a4b90d6&amp;recipient=3DcWVtdS1hcm1Abm9uZ251Lm9yZw%3D%3D=22>
--608c2890_3c7f7cc7_12a1--

