Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp984117lfo;
        Thu, 17 Mar 2022 12:22:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxhWe/WzOq3s287/miXrVW3HcFXYhh55Gc4h1Rr2dWx+xeL4Rt+9pF/jFs49NL0awlUWNUt
X-Received: by 2002:a05:620a:25cd:b0:67b:740:94fa with SMTP id y13-20020a05620a25cd00b0067b074094famr3873498qko.20.1647544929223;
        Thu, 17 Mar 2022 12:22:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1647544929; cv=none;
        d=google.com; s=arc-20160816;
        b=qSEJ6x0OXdasCtbRyYx/J+zSl+zWCa6Md6odLNUUmsLcna5f0y4z/vqjNama/TuqeA
         gGNTWGl44V3oVDrBDLyrBPDww+Y0z8qYv8OnrHUegid5jqMGu8S9ugtdkA95R9yUNqP0
         gQQxafEu+u8Ixmw08pysdXIs/uMY1kG942I6+EwOkXeIFfTmEQjG9BAiG0J7QOg0+qO1
         m1rhPtVg/xksO36KRN6qYsOa/mELbF/GglZfypgxyy80RU+58ugrAWWItKwDyZ/14FhW
         aQuNthy+QOJ2tUR3oQ0fIp6BleJEbhS6WFyyB1VUfmMISI9F5yOKA41P8LybIe931j7u
         CKzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4Z8myTSmLap9Lja6utZAAENjGr9eXUq3wUbFpUXg5PY=;
        b=Pv7l+OU0HtOJk9XlrGGUNR9pz84X3+dih089PZX67mnrgQh9wLbSKRS9RFDi6KYeSk
         8XFLpHw/yGzoUQ2Py9sbsJPfnZfFcgzn6aBHcnAq1mYGfzRkxpEoW2H6zHP6V/JvJpaO
         7pIfDSSz/CdqUuvr2yTyc8CRzynKN+VUv511whfJZRV+cj1IjZf/DasBfjlJ9DOKjPE/
         yOQYsEkG0sqQmInZTCofkrXCcv7w6giXPwrQAz4iGkLoWa0hDA/oElpgYllChtrFOviV
         sfrOMNAtDT/tot7H2AfIQ9zWQ0ilMntiLbMR0+fsK9+ImoN6Ydme9Lfoklo0mt3yv64S
         9ocw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=Aui8j1js;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a189-20020a3798c6000000b00649409cb608si1606560qke.322.2022.03.17.12.22.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Mar 2022 12:22:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=Aui8j1js;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:42472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nUvhI-0007LL-Nz
	for alex.bennee@linaro.org; Thu, 17 Mar 2022 15:22:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1nUvh5-0007Hr-Nh; Thu, 17 Mar 2022 15:21:55 -0400
Received: from [2607:f8b0:4864:20::12e] (port=33329
 helo=mail-il1-x12e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1nUvh2-0006O8-5E; Thu, 17 Mar 2022 15:21:55 -0400
Received: by mail-il1-x12e.google.com with SMTP id r2so4470947ilh.0;
 Thu, 17 Mar 2022 12:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4Z8myTSmLap9Lja6utZAAENjGr9eXUq3wUbFpUXg5PY=;
 b=Aui8j1jsIF4OObxlAa+PMqlqNruGJjukLAkNIkmuQ9w43e2lrb6piQGsO/ZH4cqbk6
 nPhTtQU5XXegHMQEBZiQfYf2sObnpaNWZgfogxeBfcHwiMpusGccdlR4fz93ur7+7rXv
 Tr9RZo6ic3SR13kZubNC6q7oTf8tQPepih/72DNX3rXgQnZ/kngtS79k7D1SdHV61+UN
 aHuCxBtCHxk8YyvLpX0eX+Fj2a9PeCjzAhC16gSkGDLSjbfvUwHjDf1MfAdo7HiAZqUL
 C+X0zqUio5RicQ+2A4gLmRu0Cm/Q93P9ZJhD15vd8Ubxi9PrHXIR+pnQOACOTfQrnrKX
 Cp1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4Z8myTSmLap9Lja6utZAAENjGr9eXUq3wUbFpUXg5PY=;
 b=76ZZ1Jvz0JfDB6zd/FLe7XVE54vz4CeRUEDPjsai/Pe4a8iqe8En8AzD44g+raCwr3
 TDaDH+OA/QxWbGPCkRVNO+Qy0pEDHU6WjuqYHyRM0MkQ0lu9/BDLlpWVLunT6XSi6Cp9
 E8C4ypK0X5W8Pk8SqWeuW0KVS7UfY92DI9YZqMaiPynsy8uJLItCYqr/CCDcHJOH2ONv
 wJMa2nQl6GeGKExazGglX/qOQGtTCZmF7nVvEDMtT+os87Hy54DW54UftCDk13cK6Nao
 41Wf/xkhvZh3oCqChiQYXieAHeCK1WTT0FsNDyirAg0YJk8Hn+6DLuJHc9kE6JtxQ4yY
 +fpA==
X-Gm-Message-State: AOAM533PVqPVbsEIhhQUbPzBLwUverzN8ABq4t0UjdtM1LuaSD5bSTYS
 Cza0KtNkva7iMi5Lyy1E696QE3S2ytZwmy3QD8U=
X-Received: by 2002:a92:c522:0:b0:2c6:3ddf:1b75 with SMTP id
 m2-20020a92c522000000b002c63ddf1b75mr2757102ili.293.1647544909871; Thu, 17
 Mar 2022 12:21:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220316164645.2303510-1-edgar.iglesias@gmail.com>
 <CAFEAcA9EYK7gS4bDToAXXD23uzhEazVeP--UGOrOX4wF3P-Fug@mail.gmail.com>
In-Reply-To: <CAFEAcA9EYK7gS4bDToAXXD23uzhEazVeP--UGOrOX4wF3P-Fug@mail.gmail.com>
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Date: Thu, 17 Mar 2022 20:21:39 +0100
Message-ID: <CAJy5ezopSM=N+rdmPs=PTerJFju5286eBRy7qMNwSOB2ftU9_A@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] hw/arm: zynqmp: Add CRF and APU control to support
 PSCI
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000001abf7605da6ef1a4"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::12e;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-il1-x12e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: luc@lmichel.fr, edgar.iglesias@amd.com,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
 francisco iglesias <frasse.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Francisco Iglesias <francisco.iglesias@xilinx.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iDcjkV/RFWGo

--0000000000001abf7605da6ef1a4
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 17, 2022 at 8:15 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Wed, 16 Mar 2022 at 16:46, Edgar E. Iglesias
> <edgar.iglesias@gmail.com> wrote:
> >
> > From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> >
> > This adds the necessary modeling to support some of our firmware
> > tests at EL3 implementing PSCI (TBM). These are the test-cases
> > that were previously relying on QEMU's builtin PSCI emulation.
>
> I wouldn't usually take patches new devices after softfreeze, but
> on the other hand this is addressing a regression, and it only
> affects the xilinx boards. Do you have a view on whether we should put
> this into 7.0 or defer to 7.1 ?
>
>
Hi Peter,

I'd lean slightly towards 7.0 (to allow our tests to pass cleanly on 7.0)
but it's not of huge importance.

Thanks,
Edgar

--0000000000001abf7605da6ef1a4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, Mar 17, 2022 at 8:15 PM Peter May=
dell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@linaro.o=
rg</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">On Wed, 16 Mar 2022 at 16:46, Edgar E. Iglesia=
s<br>
&lt;<a href=3D"mailto:edgar.iglesias@gmail.com" target=3D"_blank">edgar.igl=
esias@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; From: &quot;Edgar E. Iglesias&quot; &lt;<a href=3D"mailto:edgar.iglesi=
as@xilinx.com" target=3D"_blank">edgar.iglesias@xilinx.com</a>&gt;<br>
&gt;<br>
&gt; This adds the necessary modeling to support some of our firmware<br>
&gt; tests at EL3 implementing PSCI (TBM). These are the test-cases<br>
&gt; that were previously relying on QEMU&#39;s builtin PSCI emulation.<br>
<br>
I wouldn&#39;t usually take patches new devices after softfreeze, but<br>
on the other hand this is addressing a regression, and it only<br>
affects the xilinx boards. Do you have a view on whether we should put<br>
this into 7.0 or defer to 7.1 ?<br><br></blockquote><div><br></div><div>Hi =
Peter,</div><div><br></div><div>I&#39;d lean slightly towards 7.0 (to allow=
 our tests to pass cleanly on 7.0) but it&#39;s not of huge importance.</di=
v><div><br></div><div>Thanks,</div><div>Edgar=C2=A0</div></div></div>

--0000000000001abf7605da6ef1a4--
