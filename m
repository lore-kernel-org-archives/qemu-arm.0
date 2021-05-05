Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp424610lfg;
        Wed, 5 May 2021 08:53:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwvUHMbQ1paLsQgvIxtoVx0Tquu49pKA3qvE4v7Bnm3KkEqSqkxMEH9QlmYCGIp9b6LU3Ta
X-Received: by 2002:a02:83c3:: with SMTP id j3mr29197997jah.41.1620230008473;
        Wed, 05 May 2021 08:53:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620230008; cv=none;
        d=google.com; s=arc-20160816;
        b=0RUWVXo8SfIl1B/3e9SeAUwMdYeEo0lcFiax4py76/Dz51ol1uBQn+cwG9aZnG4PdA
         TdBuwqvN4tPLIMwS4hqFHCO6JPAPXJfbUiRdqfGs/ND0P8eJxtLe5ThmtaK6S85wfN7/
         DlEOFrmx44fErbOlw0gtcAf/5fnjELeWJPLT/Bt1mvO6Tahn3nIY8m53fCitYoxuqCU7
         H86BmlUjl+zxeC0zgMna1VgCQvMTSrcF/puJ7EFkSpmVWI7MTVR9oBQGiTf6RCvblx6O
         YrxuIfzdV8tquoi2HZRqABJG6FqRxaxOweZE1uhQ0gPF//TIWQ50jNSJKKpTp27avi5I
         4F6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=4H6+2JNOScrDLriISWo/PWOmOqFh4tEhv5vhGPxW7AA=;
        b=tj5C7/0Yn12VbvrnHsSPSxKcuuOvBg6uda6jkODcbwlGjcElnbxr0efb70Q0x6HmZW
         FXjgX3CZuB/65mXkoVuvaK58XfWXnxUdwPI2UGnNQygsJ+szagLa28XQp5Yq70Jvb/fl
         L58TKDLwIdmBIwxIw4QhyMZBI3AbkhqTJ1zem8RFQYLrWlhlRQhdTSV1pmgtzGqbZC2F
         yh7Clq1vQFbDX6JUplm0D3VvQhrByWQGB1hCh14u3tnjFlGOPPVC/GQ9F5YDtWC7SRE7
         kK+X/CcuOA0kdZNU7o7CvtuoyQOujf3lvxELLLpr/qjaL3cVpjBLe6BbGxJLuQLRVU3l
         bn6w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=jvTSXRUz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i21si9058209iov.29.2021.05.05.08.53.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 May 2021 08:53:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=jvTSXRUz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:58506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1leJq3-0008HW-PE
	for alex.bennee@linaro.org; Wed, 05 May 2021 11:53:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1leJjs-0002vM-B6
 for qemu-devel@nongnu.org; Wed, 05 May 2021 11:47:04 -0400
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f]:44921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1leJjk-0006uD-1k
 for qemu-devel@nongnu.org; Wed, 05 May 2021 11:47:03 -0400
Received: by mail-lj1-x22f.google.com with SMTP id b21so3058705ljf.11
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 08:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4H6+2JNOScrDLriISWo/PWOmOqFh4tEhv5vhGPxW7AA=;
 b=jvTSXRUzXQ7aB+0sW9f7zNS8pDuyWDTiT3kAJMZE53/mj/Mk1mkR+9jkqUaFynH3zU
 8vwhzECLwHhw+gHnbDuJNco8HIJf7X50hN8hDambFdI64A8cHCCVJCWImkPzVVjYBQyi
 cS2cBK0FQEeQ/m8JqgvlIjYpp4hq+DWqQJI4Ven2n2Eu8YSc1A+/fBkZOe5XGF5EpKbh
 Z/q4REPzUyO3ynp7AcMsn9ZxUt0hwZ0AfJxUPX3+XafuDmGQBCM3bD0Gg6ygCFp8sf29
 BAS4cMq3qhYw+ihIGML1g1GGzDGhK3TR/KA9GpBbF9IB1s1rlvvlEOsCSJTJC5ervJbJ
 JjOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4H6+2JNOScrDLriISWo/PWOmOqFh4tEhv5vhGPxW7AA=;
 b=Tt1tag6UN2QDBdketJP5T6hsgET7u3h0ssySvqhRRInekwnyUEVK/1gZpEr6PfVQmF
 QGAdz8ANJEKR9pnDCfAIlOQPoendYjlhQbQEN1iLPmBfB0eIVGDUYO1y+4xEwZ43OoBs
 lBikdEOvlEr2Bc1lxh52pEki7AJ9gnaP7RktNooFM2ta+S4p/A/tHcBOX3RJ1a4SSF/1
 RzPQ4eTDusSdh4qE3H+2DI+O/zk4QWbbcnSRpJRHRRr5ifBQsbaJFtUsU8yz6zBPXlOD
 7gt1tLGUrdSeHU1wsVvS2D3k4MNCT6LrMyyGQIvfRyNl3KX1hk+RRZaXQIvbdDqZ8Nxs
 A9HQ==
X-Gm-Message-State: AOAM5339fjbYmjk47GlmouptV/7PwYjk/3mXqpqTfN9QSTdGA5IRaMrq
 jtKQUjwIHb0/S3oTjRUjRhKizWB7ZWfR/fDcyy1tnA==
X-Received: by 2002:a2e:b5cd:: with SMTP id g13mr22710477ljn.0.1620229611861; 
 Wed, 05 May 2021 08:46:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210505135516.21097-1-peter.maydell@linaro.org>
 <CAFQmdRZyt6o+A8cSZ+MVsKYC0F-Prp2H09Obxk=U9uY6C1sbtw@mail.gmail.com>
In-Reply-To: <CAFQmdRZyt6o+A8cSZ+MVsKYC0F-Prp2H09Obxk=U9uY6C1sbtw@mail.gmail.com>
From: Hao Wu <wuhaotsh@google.com>
Date: Wed, 5 May 2021 08:46:40 -0700
Message-ID: <CAGcCb11bQ6rY6AR+yY9SJ09WWeQn7bJopRZE6r1MBu2=2JDEuw@mail.gmail.com>
Subject: Re: [PATCH] tests/qtest/npcm7xx_pwm-test.c: Avoid g_assert_true() for
 non-test assertions
To: Havard Skinnemoen <hskinnemoen@google.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, 
 QEMU Developers <qemu-devel@nongnu.org>, Tyrone Ting <kfting@nuvoton.com>, 
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000789cfe05c1971ac1"
Received-SPF: pass client-ip=2a00:1450:4864:20::22f;
 envelope-from=wuhaotsh@google.com; helo=mail-lj1-x22f.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0XE9gjjYVOQb

--000000000000789cfe05c1971ac1
Content-Type: text/plain; charset="UTF-8"

On Wed, May 5, 2021 at 7:09 AM Havard Skinnemoen <hskinnemoen@google.com>
wrote:

> On Wed, May 5, 2021 at 6:55 AM Peter Maydell <peter.maydell@linaro.org>
> wrote:
> >
> > In the glib API, the distinction between g_assert() and
> > g_assert_true() is that the former is for "bug, terminate the
> > application" and the latter is for "test check, on failure either
> > terminate or just mark the testcase as failed".  For QEMU, g_assert()
> > is always fatal, so code can assume that if the assertion fails
> > execution does not proceed, but this is not true of g_assert_true().
> >
> > In npcm7xx_pwm-test, the pwm_index() and pwm_module_index() functions
> > include some assertions that are just guarding against possible bugs
> > in the test code that might lead us to out-of-bounds array accesses.
> > These should use g_assert() because they aren't part of what the test
> > is testing and the code does not correctly handle the case where the
> > condition was false.
> >
> > This fixes some Coverity issues where Coverity knows that
> > g_assert_true() can continue when the condition is false and
> > complains about the possible array overrun at various callsites.
> >
> > Fixes: Coverity CID 1442340, 1442341, 1442343, 1442344, 1442345, 1442346
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>
> Reviewed-by: Havard Skinnemoen <hskinnemoen@google.com>
>
Reviewed-by: Hao Wu <wuhaotsh@google.com>

--000000000000789cfe05c1971ac1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, May 5, 2021 at 7:09 AM Havard=
 Skinnemoen &lt;<a href=3D"mailto:hskinnemoen@google.com">hskinnemoen@googl=
e.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">On Wed, May 5, 2021 at 6:55 AM Peter Maydell &lt;<a href=3D"mailto:pet=
er.maydell@linaro.org" target=3D"_blank">peter.maydell@linaro.org</a>&gt; w=
rote:<br>
&gt;<br>
&gt; In the glib API, the distinction between g_assert() and<br>
&gt; g_assert_true() is that the former is for &quot;bug, terminate the<br>
&gt; application&quot; and the latter is for &quot;test check, on failure e=
ither<br>
&gt; terminate or just mark the testcase as failed&quot;.=C2=A0 For QEMU, g=
_assert()<br>
&gt; is always fatal, so code can assume that if the assertion fails<br>
&gt; execution does not proceed, but this is not true of g_assert_true().<b=
r>
&gt;<br>
&gt; In npcm7xx_pwm-test, the pwm_index() and pwm_module_index() functions<=
br>
&gt; include some assertions that are just guarding against possible bugs<b=
r>
&gt; in the test code that might lead us to out-of-bounds array accesses.<b=
r>
&gt; These should use g_assert() because they aren&#39;t part of what the t=
est<br>
&gt; is testing and the code does not correctly handle the case where the<b=
r>
&gt; condition was false.<br>
&gt;<br>
&gt; This fixes some Coverity issues where Coverity knows that<br>
&gt; g_assert_true() can continue when the condition is false and<br>
&gt; complains about the possible array overrun at various callsites.<br>
&gt;<br>
&gt; Fixes: Coverity CID 1442340, 1442341, 1442343, 1442344, 1442345, 14423=
46<br>
&gt; Signed-off-by: Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linar=
o.org" target=3D"_blank">peter.maydell@linaro.org</a>&gt;<br>
<br>
Reviewed-by: Havard Skinnemoen &lt;<a href=3D"mailto:hskinnemoen@google.com=
" target=3D"_blank">hskinnemoen@google.com</a>&gt;<br></blockquote><div>Rev=
iewed-by: Hao Wu &lt;<a href=3D"mailto:wuhaotsh@google.com">wuhaotsh@google=
.com</a>&gt;=C2=A0</div></div></div>

--000000000000789cfe05c1971ac1--
