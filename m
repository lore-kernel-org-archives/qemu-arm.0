Received: by 2002:a17:906:3683:b0:98d:b2f5:1316 with SMTP id a3csp1815661ejc;
        Fri, 11 Aug 2023 22:38:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKsWPYrVgxJa3oWcFFFwtvSew/AcNIdGOa3E88omHw9m3Bo7bePliak9AWgIY3L3QCKY6O
X-Received: by 2002:a05:620a:470a:b0:768:3bda:b1ba with SMTP id bs10-20020a05620a470a00b007683bdab1bamr4336228qkb.28.1691818702700;
        Fri, 11 Aug 2023 22:38:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691818702; cv=none;
        d=google.com; s=arc-20160816;
        b=Yy4ra0q92Zau3ZvMTGDKgwgwRYM10T3/i2lXTLJFrF8D20+FPRy3ucqtZFb67JA7X7
         Dd0V/ZNiDNKxMGZR0mdxjwp5b2iDryHXID0eQ8BC2hDeTwa8x+zhoyIBYQO/Rn0vGrD4
         yrbAd5Gsz9b2dzih/i6GV7akN3b2+vTiFg+UlINiDTXSjo6vg8Z4sP3oEIjv843bmZkp
         d2tf52uMUZTif6WJJF6DJkvT4V0aR3flGYVOHbuqs1JBIv9IwjK8kzvDKAo5yl1SqSHN
         w4nB/gSUiZupOszX0KKrmftp9lY3Y/vFgtUBu1Qeis9lgr4BoQrBZ/xfu9MiVWRzipxf
         MZGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=0w49hh0ndCUVUw3IOTmlaZgcRVo6pbefY0/yWB1pShQ=;
        fh=3C01RXjYisGCsX9JYzNt3BUE7pDy00mZDt0FF8s/0OY=;
        b=tuyuhh6vye35isNW0rOKLHPIqzDbwrkdj7B+n58qyEYmquNw3sjz4Si+KuyQx7HAuu
         Z643LXSfXz1YwVnrpUJkQBd9MFVg6298DcFRosU/D8VXOqRhdtQhOWNTGyw4uit7LdD/
         mvoNw2jyj3L+1eL1Z3Kj92MMtRjyki3ItBT0BJbDKANXWZk11txJjXNK/FEFs3L8F0n9
         RZyFWDGJ7bAPDqnQAUgnxfV9Xh+WwKDvUJzuArKFjnWRTzHqsZsxvrX6hhpNFbTVy3lS
         h7FLYjIUg13XeDA2kDpJd5loDQDsqRiyyyGlFHtYkvmRxFqG2C+/Kdfc2p33CM2zGHpv
         G9vQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b=GjlnB5Fu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=sifive.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id rg3-20020a05620a8ec300b00763a90661a1si2923813qkn.516.2023.08.11.22.38.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Aug 2023 22:38:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b=GjlnB5Fu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=sifive.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qUhJq-0003vk-84; Sat, 12 Aug 2023 01:37:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1qUhJo-0003vI-QV
 for qemu-arm@nongnu.org; Sat, 12 Aug 2023 01:37:44 -0400
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1qUhJn-0002K7-6F
 for qemu-arm@nongnu.org; Sat, 12 Aug 2023 01:37:44 -0400
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2b9d3dacb33so40949901fa.1
 for <qemu-arm@nongnu.org>; Fri, 11 Aug 2023 22:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1691818661; x=1692423461;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0w49hh0ndCUVUw3IOTmlaZgcRVo6pbefY0/yWB1pShQ=;
 b=GjlnB5FuaWriwuy6+n2f2/nt2sOu+KS8/phNd6n71EV7ek3wGjAKD1uB7L2XD4o/7y
 K4KokySxTGLKct2sZTteFRsOY4ne6qEeEkn41Nbd6go0/3D1Gc/VquaVT/gOU9ZLddPa
 S2yfAk8YBUSjNUB86fA1hjutxWMI8DBSLIw55+3O7GCc/7JMP3Qk/B35wq4Dw9STYiDl
 u/d07a1pngtPdscbxytWo1OduATxO9aNE4sIsJMUoHke51Cv1HyAUYcA9YO3MJLjbdK3
 Iub3EI3+xfHWEPrMDgyeah6pUgov+I2ceqqkTwgvL/ErmEJ9vQZLioRMkGKD4+n8wyY+
 ELFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691818661; x=1692423461;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0w49hh0ndCUVUw3IOTmlaZgcRVo6pbefY0/yWB1pShQ=;
 b=ljyISKj/ctIdYHyoifxf7iI2QFgPujotnfXXFzxC/kTlnqH9QZAnGFgTl8N7+dvfCM
 vnmLUBHoRb4bMOeCTAEMEbmSjl5ypymeqNWLlI6acKWWEkbT2accbEo8BOtyKgkF3Vxq
 ka+OlN2ATl4HsgU/eM7sowQzG1jecOOsdnJHZFAAjaZFiKYq0sEQum2l2TR3c5mPsOB7
 DgqeTaoOFhsqCBEy0UzfLoAyelN1mD8SrBmyVWyosXYPm80MHCQccfGKaRdYlaLlCml6
 fWILThVGhXmjXCCpQDDbP8vbrIIduXEZL94SKzAvJjMgMktFLATYU0DWrGjXU+c3jyTh
 HFTA==
X-Gm-Message-State: AOJu0Yy2FTCfYUssxIm7ikMS0uTHLBnkZP1idEVlK73oGtQYZOaLAP/6
 90zhSJXp0dJ65N4q2LzFGohMg+DwOzyT+xDaeC0BeQ==
X-Received: by 2002:a2e:b0fc:0:b0:2b9:e053:7a01 with SMTP id
 h28-20020a2eb0fc000000b002b9e0537a01mr3364558ljl.43.1691818660257; Fri, 11
 Aug 2023 22:37:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230809102257.25121-1-jason.chien@sifive.com>
 <20230810135050-mutt-send-email-mst@kernel.org>
 <CAFEAcA_B5W5CX7-C_a7iWTL87kpcLsGEjAsqs5t54sgjTKi3Eg@mail.gmail.com>
 <CAFEAcA8vr-Bk+tPvugTH4DwAk=S_RXiUhrqDytFGg-EyoC9Mmg@mail.gmail.com>
In-Reply-To: <CAFEAcA8vr-Bk+tPvugTH4DwAk=S_RXiUhrqDytFGg-EyoC9Mmg@mail.gmail.com>
From: Jason Chien <jason.chien@sifive.com>
Date: Sat, 12 Aug 2023 13:37:28 +0800
Message-ID: <CADr__8rR7dT+UNqEAUgw6Z-V+OLJ8th750UA-LrmY7Y7LkKKkw@mail.gmail.com>
Subject: Re: [PATCH] hw/pci-host: Allow extended config space access for
 Designware PCIe host
To: Peter Maydell <peter.maydell@linaro.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, 
 Andrey Smirnov <andrew.smirnov@gmail.com>, Greg Kurz <groug@kaod.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Igor Mammedov <imammedo@redhat.com>, qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000004513eb0602b33a81"
Received-SPF: pass client-ip=2a00:1450:4864:20::229;
 envelope-from=jason.chien@sifive.com; helo=mail-lj1-x229.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 6VcKqSe3sW/7

--0000000000004513eb0602b33a81
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This bug was also in 8.0.

Jason

On Fri, Aug 11, 2023 at 10:07=E2=80=AFPM Peter Maydell <peter.maydell@linar=
o.org>
wrote:

> On Fri, 11 Aug 2023 at 10:55, Peter Maydell <peter.maydell@linaro.org>
> wrote:
> >
> > On Thu, 10 Aug 2023 at 18:51, Michael S. Tsirkin <mst@redhat.com> wrote=
:
> > >
> > > On Wed, Aug 09, 2023 at 10:22:50AM +0000, Jason Chien wrote:
> > > > In pcie_bus_realize(), a root bus is realized as a PCIe bus and a
> non-root
> > > > bus is realized as a PCIe bus if its parent bus is a PCIe bus.
> However,
> > > > the child bus "dw-pcie" is realized before the parent bus "pcie"
> which is
> > > > the root PCIe bus. Thus, the extended configuration space is not
> accessible
> > > > on "dw-pcie". The issue can be resolved by adding the
> > > > PCI_BUS_EXTENDED_CONFIG_SPACE flag to "pcie" before "dw-pcie" is
> realized.
> > > >
> > > > Signed-off-by: Jason Chien <jason.chien@sifive.com>
> > >
> > >
> > > Acked-by: Michael S. Tsirkin <mst@redhat.com>
> > >
> > > I'm not planning another pull before release, hopefully
> > > another maintainer can pick it up? Peter?
> >
> > At the moment I don't have anything intended for 8.1 either,
> > so whoever of us does it it would be a 1-patch pullreq...
>
> Also, at this stage in the release cycle it's always worth
> asking: is this a regression, or was this bug also in 8.0?
>
> thanks
> -- PMM
>

--0000000000004513eb0602b33a81
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This bug was also in 8.0.<br><br>Jason</div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Aug 11, 2023=
 at 10:07=E2=80=AFPM Peter Maydell &lt;<a href=3D"mailto:peter.maydell@lina=
ro.org">peter.maydell@linaro.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On Fri, 11 Aug 2023 at 10:55, Peter Maydel=
l &lt;<a href=3D"mailto:peter.maydell@linaro.org" target=3D"_blank">peter.m=
aydell@linaro.org</a>&gt; wrote:<br>
&gt;<br>
&gt; On Thu, 10 Aug 2023 at 18:51, Michael S. Tsirkin &lt;<a href=3D"mailto=
:mst@redhat.com" target=3D"_blank">mst@redhat.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; On Wed, Aug 09, 2023 at 10:22:50AM +0000, Jason Chien wrote:<br>
&gt; &gt; &gt; In pcie_bus_realize(), a root bus is realized as a PCIe bus =
and a non-root<br>
&gt; &gt; &gt; bus is realized as a PCIe bus if its parent bus is a PCIe bu=
s. However,<br>
&gt; &gt; &gt; the child bus &quot;dw-pcie&quot; is realized before the par=
ent bus &quot;pcie&quot; which is<br>
&gt; &gt; &gt; the root PCIe bus. Thus, the extended configuration space is=
 not accessible<br>
&gt; &gt; &gt; on &quot;dw-pcie&quot;. The issue can be resolved by adding =
the<br>
&gt; &gt; &gt; PCI_BUS_EXTENDED_CONFIG_SPACE flag to &quot;pcie&quot; befor=
e &quot;dw-pcie&quot; is realized.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Signed-off-by: Jason Chien &lt;<a href=3D"mailto:jason.chien=
@sifive.com" target=3D"_blank">jason.chien@sifive.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; Acked-by: Michael S. Tsirkin &lt;<a href=3D"mailto:mst@redhat.com=
" target=3D"_blank">mst@redhat.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; I&#39;m not planning another pull before release, hopefully<br>
&gt; &gt; another maintainer can pick it up? Peter?<br>
&gt;<br>
&gt; At the moment I don&#39;t have anything intended for 8.1 either,<br>
&gt; so whoever of us does it it would be a 1-patch pullreq...<br>
<br>
Also, at this stage in the release cycle it&#39;s always worth<br>
asking: is this a regression, or was this bug also in 8.0?<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div>

--0000000000004513eb0602b33a81--
