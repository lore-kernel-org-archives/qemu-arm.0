Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp4518653lfb;
        Tue, 24 Nov 2020 05:43:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyu2H5y4GtyO73Wgbx1uASoNO4ao1g7Yeu1xCJVTxEP1vvx8NgFErGV7a+oO48l5j80oq2g
X-Received: by 2002:a25:7b86:: with SMTP id w128mr5842590ybc.192.1606225420976;
        Tue, 24 Nov 2020 05:43:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606225420; cv=none;
        d=google.com; s=arc-20160816;
        b=J6EIBbCZJu32U4v9+7ovhydEOrddVwgDDEauTGX0pINqh8FA7S2N31lx0v58FLfeNy
         0tQgRJIhXBSOa/3Mc2Iz61BVa+GU/AZmtNi30GihlrSOk1lmgfh9/WGRxKPGywR8d3d/
         mz4shL6ehJjUesWFzBW6Re61alwdu5U5qJ8tY+3S6Fe5d4bYmadzN1p21JYXEJ/6KGmx
         kKoBE3zVfH3maKhinCwkgbZlfjrc4ASixfTbexzmJtOwFwcdAyLfsCUJ0XOc6Q0rYsGG
         YtDy/WvuKhEUSx4235ARq1dCcAtKR6NDajL+jyMCHPImmkbcoXValyZ76kUBCZSH8+JG
         KxSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NLt9hYWt++DaPXegFmbT1bFITii7wZIzdrhm/7F/+9s=;
        b=C++1ZhjD9UvdZisNyr7zfQWUwx2p11AyWgvzAtGa3m9aSfih0OdvYUc9DJROzVjaNR
         vSFCRenZXolvpnlYmbgGFclig1SyKGpSIaaBUHLXBx8hU+Y/Kl8KPBAO0wCTFZ+y0ldQ
         D7i0QWrwJEfYvmucSn0yO1AXCSAycPcX/TsIEu3HWdM9AjBjf1jee53LR6LpvHTZx45B
         dW2wm1P/7lRZqyZA7NCIc/QjkTx+DdxM1mFKnOJh+FkG9r0hdMcrURl8avgu4I+qB+n7
         DeT1mwgNydz5BXQb4TSrIEt/rjqzqKGMWtwhr4KTX2SpgWx2N58HRefLrR5zE4LCFTBF
         7r5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZnXYmZf1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p18si17296730ybl.48.2020.11.24.05.43.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Nov 2020 05:43:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZnXYmZf1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:34218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1khYbc-00086k-Ba
	for alex.bennee@linaro.org; Tue, 24 Nov 2020 08:43:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1khYbU-00086J-Kz; Tue, 24 Nov 2020 08:43:32 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:35548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1khYbS-0005uc-Iv; Tue, 24 Nov 2020 08:43:32 -0500
Received: by mail-ej1-x62e.google.com with SMTP id f23so28579757ejk.2;
 Tue, 24 Nov 2020 05:43:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NLt9hYWt++DaPXegFmbT1bFITii7wZIzdrhm/7F/+9s=;
 b=ZnXYmZf1deXbA4c/L05TjPJied7VVDoIFMDKio3TaNCsSF2pzWYxH5SsqfqC4RR4Le
 kX9SEok3Dv2PpGFED2fxbkQUH7qBciD3SWgDzggr7rZJElwFnfR7lYzPG+yrXEIX6fsF
 V8miOLv4G1khrE+h52V4gdzglv+J3CeQEic4i6BlxEzuPCroA6vKSGxBByF5Hp0l4Kyw
 iwLscsrF56tyXFXXerAVIwER3y0I5oxj4Z9FBhTVmnHpv8opAGVkxu3qvLnl1jNf5Nhk
 7G2VhQxfJVdHHrGqwOAm1YhGeJLfg+5tpYAVoa65y2/RFy8fQuYSBa1sfARybpwXZdo0
 j2Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NLt9hYWt++DaPXegFmbT1bFITii7wZIzdrhm/7F/+9s=;
 b=k/HGQpjLE3wZp6A2fPQdjGlV1+muJbiNsaGssOl983oJKKQIpgp4e/TOjreBDiHyxH
 cGnoMiKjVkm+/VGF7lRuQCDuHBPywR2NhDl4YCX6RK7M1z6fICu2zloMbUf9iEUa1hN6
 ocCaNdXHHrI7qsuU4uJX3LJ2oVJmRUOBANcfhN3SIMVKIcUp8DdN0rmQul+Ob3I9Rxoy
 86qcMgTkNS7dOKIvof7Spzd6Wuv13eZgfK2hFlFxpN6a3VWOcmBVg0iyiGKNe4JlE+LH
 7oQcLmTGaqb7sAWVejZkEsXYlhlws8Z9ZCZKamq1lWGW5Bt/r0AOQmdmvCpJysMgDVB4
 RR8Q==
X-Gm-Message-State: AOAM5319LfUhrmdyvpsLCZSBU5qThfuM+pTXogQQs72soZ7uUw8Ru5Tu
 MtgLjQe79gyw4ZV4vrFhqKM1lLqspd2KQwPbcSw=
X-Received: by 2002:a17:906:af47:: with SMTP id
 ly7mr4499786ejb.532.1606225399307; 
 Tue, 24 Nov 2020 05:43:19 -0800 (PST)
MIME-Version: 1.0
References: <20201124125235.266884-1-marcandre.lureau@redhat.com>
 <CAFEAcA8cUpnA9bdp_MBe65YZe+6=avrczSO1=_Gc-gT6d+YVfw@mail.gmail.com>
In-Reply-To: <CAFEAcA8cUpnA9bdp_MBe65YZe+6=avrczSO1=_Gc-gT6d+YVfw@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 24 Nov 2020 17:43:06 +0400
Message-ID: <CAJ+F1C+o+xZGyjGMyVGZmTGcvtdFswB2DYNCOmBr7uZwTbzCbQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] Remove GCC < 4.8 checks
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000006576c005b4da7ec2"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TXv/agUg6+YG

--0000000000006576c005b4da7ec2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2020 at 5:33 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Tue, 24 Nov 2020 at 12:52, <marcandre.lureau@redhat.com> wrote:
> >
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > Hi,
> >
> > Since commit efc6c07 ("configure: Add a test for the minimum compiler
> version=3D
> > "),
> > QEMU explicitely depends on GCC >=3D 4.8.
>
> You need to be a bit cautious about removing QEMU_GNUC_PREREQ()
> checks, because clang advertises itself as GCC 4.2 via the
> __GNUC__ and __GNUC_MINOR__ macros that QEMU_GNUC_PREREQ()
> tests, and so unless the code has explicitly handled clang
> via a different ifdef or feature test clang will be using
> the fallback codepath in cases like this. So you also need
> to find out whether all our supported versions of clang
> are OK with the gcc-4.4-and-up version of the code before
> removing any particular ifdef.
>
> Compare this previous (not-applied) patchset from Philippe:
>  https://patchew.org/QEMU/20200928125859.734287-1-philmd@redhat.com/
> which dealt with two of these ifdefs, one of which is
> "clearly OK" and the other of which is "needs more analysis".
> The path forward I think is along those lines -- we need
> one patch per ifdef we're trying to remove, and the commit
> message can then include the information about why in
> this case it is OK for clang too (or switch the ifdef
> to check for something else, eg one of clang's feature-specific
> test macros).
>


Thanks for pointing out the series, I missed it. Ok, I'll try to do some
more research.

--=20
Marc-Andr=C3=A9 Lureau

--0000000000006576c005b4da7ec2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 24, 2020 at 5:33 PM Peter=
 Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@lina=
ro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On Tue, 24 Nov 2020 at 12:52, &lt;<a href=3D"mailto:marcandre.lureau@=
redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt; wrote:<br=
>
&gt;<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt;<br>
&gt; Hi,<br>
&gt;<br>
&gt; Since commit efc6c07 (&quot;configure: Add a test for the minimum comp=
iler version=3D<br>
&gt; &quot;),<br>
&gt; QEMU explicitely depends on GCC &gt;=3D 4.8.<br>
<br>
You need to be a bit cautious about removing QEMU_GNUC_PREREQ()<br>
checks, because clang advertises itself as GCC 4.2 via the<br>
__GNUC__ and __GNUC_MINOR__ macros that QEMU_GNUC_PREREQ()<br>
tests, and so unless the code has explicitly handled clang<br>
via a different ifdef or feature test clang will be using<br>
the fallback codepath in cases like this. So you also need<br>
to find out whether all our supported versions of clang<br>
are OK with the gcc-4.4-and-up version of the code before<br>
removing any particular ifdef.<br>
<br>
Compare this previous (not-applied) patchset from Philippe:<br>
=C2=A0<a href=3D"https://patchew.org/QEMU/20200928125859.734287-1-philmd@re=
dhat.com/" rel=3D"noreferrer" target=3D"_blank">https://patchew.org/QEMU/20=
200928125859.734287-1-philmd@redhat.com/</a><br>
which dealt with two of these ifdefs, one of which is<br>
&quot;clearly OK&quot; and the other of which is &quot;needs more analysis&=
quot;.<br>
The path forward I think is along those lines -- we need<br>
one patch per ifdef we&#39;re trying to remove, and the commit<br>
message can then include the information about why in<br>
this case it is OK for clang too (or switch the ifdef<br>
to check for something else, eg one of clang&#39;s feature-specific<br>
test macros).<br></blockquote><div><br></div><div><br></div><div>Thanks for=
 pointing out the series, I missed it. Ok, I&#39;ll try to do some more res=
earch.<br></div><br clear=3D"all"></div><div>-- <br><div dir=3D"ltr" class=
=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br></div></div></div>

--0000000000006576c005b4da7ec2--
