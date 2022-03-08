Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp2579659lfo;
        Tue, 8 Mar 2022 10:53:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzdZJ6wmhz+rkHz7zdgrMrWo7afvqDHP615JwzvquDquknVzEvPkxb1OuBEUuQkgiqokObs
X-Received: by 2002:a25:254:0:b0:629:6709:2cc6 with SMTP id 81-20020a250254000000b0062967092cc6mr6513056ybc.357.1646765623929;
        Tue, 08 Mar 2022 10:53:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646765623; cv=none;
        d=google.com; s=arc-20160816;
        b=0dSaWY5SX1Al0fPgoj3FTO3htuKFSq9vHwry0Enzc0m8xHDKWJACnT3XO9pmN16GMM
         8NJAHMSkk0unBevU488S1l1ZC9iJRP/fOuMh1vKfbenaOycDRQNfB1dDl4wzSwcWWPEf
         10tSAer0CxFZoW7C8EL6BcpeUYwki5qnC/MgLaUCOFdPbEGdE/8+HIfeKpbv47UOeUKN
         2WS/B1dCg+YbHW09TOeGSTk8gFieP1O3wMqqcijg8TT2Z4FJGqhiSc+HW9/IAxfEah7q
         6gQ7AIh+or6/aetUMNwja7dTDHNiUb7b8Jwos6Qg02ylnlkwSVT59ywdWAZUPnNmcS8L
         lQ2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=phJ0KRh+qoV1VJHIW3W94dQ7PhLGPjLfVmNNIu3Cxyw=;
        b=Bf8PgUh+AwJRjtvfE85WWrLnqUBCh6XJt0Uzc5CFn2rwmg1fRLDnXIg872ILOm3fYY
         xmYElPstG2gR06mqz4KxgFkzU4CFiigyeGZPMt9tA9S/QmeQmy7m6+L8CrVY2QLuDF+D
         6+AXtnhn1gsEQLLFlIq2QTcOVLYaMB5g1SdP9gc/9T0kGgR6lkddn9abzVeEKam8Up3k
         RjZLYu66uL08+aNyqIdx1iwjBLL4NFY8cCYoI50lKKz5ik1EGyemu3jaktucKPcp27Bf
         LdgFe8OkcbtOCub2HhUMv9OA56gpKaukVY42V46s0YDrKeXhZRR/PCGYFR6wYuF0qmIO
         Q9jg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=X1ZhfdEu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p12-20020a056902114c00b0061d975f7c27si15127557ybu.355.2022.03.08.10.53.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Mar 2022 10:53:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=X1ZhfdEu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:43918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nRexr-0006uv-Cg
	for alex.bennee@linaro.org; Tue, 08 Mar 2022 13:53:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1nRexR-0006rH-O0
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 13:53:17 -0500
Received: from [2607:f8b0:4864:20::f30] (port=33499
 helo=mail-qv1-xf30.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1nRexQ-0000LA-6o
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 13:53:17 -0500
Received: by mail-qv1-xf30.google.com with SMTP id jq9so210257qvb.0
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 10:53:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=phJ0KRh+qoV1VJHIW3W94dQ7PhLGPjLfVmNNIu3Cxyw=;
 b=X1ZhfdEusdA/Jy/RCobfJfhMXKtaRlBvCOYE8r1NCRNmEIOEXNxvFrOYlpkRt7l2sj
 9TDnwn6z62xqqASfwaBoUUYfYauQKncAmFF4owMTmfYUNzizKcc869+MTI2UFKOefXje
 AA4pbV6k1a7alBbadAYU4uokSkxHPJEgFUh3ddgN9pXMFZQFuUVdHSNQwleUDvexDQWL
 rZABXI16fE+RCClJk+X0fbGYEtp7I6/k09xmRyYM92pfQFNwMeGxB1StmBJLgIWTr/dC
 LaqVrdQv14Bsc6Kv6/0Dvs9X6vET2xv9XoRmNbBb4RskRoK9jz5Uozw51YIx0p9T5/59
 ZxPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=phJ0KRh+qoV1VJHIW3W94dQ7PhLGPjLfVmNNIu3Cxyw=;
 b=hDsf6T1i86jk1uTvDJEoVOdRDTf/TxQf9d/TUkJMD3LPOO9cYpRh7L4UHlp5U36S13
 vE0Vuk2dNU8oQn7SFPGPVZZt2jNd5oQ2Gfea6X+vHVHkyegt6HlRkVropjit0/7bedmN
 luPNiKhfGP10aRltLMpdzK+sZKulC/bJjNdSRDorOQ5sQYNXHqgwnbR+QVNSaG5A6zdd
 KDWZUiUHgaxiFUrg5fbmZht2RFc4qos54lH4F4xNbg7zk3468Ju7IZJOEjL64WryP5tl
 KXPgp2F0hndJN/V7TQocIVcHvUUqgtaE2FqrYRCDT8BOWc+28D5AycHnKAduIm7gLJWZ
 ncag==
X-Gm-Message-State: AOAM5326oxvEhzom5WPAN9I+fWAkihbvUgvJy3Lm8468c9GWnAKyC4+i
 kELFUAR6cPHQu91fwIpk0l5q00mXrBo0dHwey1TUNg==
X-Received: by 2002:ad4:5ba5:0:b0:435:ac65:b179 with SMTP id
 5-20020ad45ba5000000b00435ac65b179mr3346006qvq.97.1646765593211; Tue, 08 Mar
 2022 10:53:13 -0800 (PST)
MIME-Version: 1.0
References: <20220308170302.2582820-1-peter.maydell@linaro.org>
 <1293fd43-c952-8c23-a903-485a15ec6366@linaro.org>
In-Reply-To: <1293fd43-c952-8c23-a903-485a15ec6366@linaro.org>
From: Hao Wu <wuhaotsh@google.com>
Date: Tue, 8 Mar 2022 10:53:02 -0800
Message-ID: <CAGcCb11FYaAEXDUc==FLYbVhL3eZgCTn_dwhd46SxjobGnF3Qg@mail.gmail.com>
Subject: Re: [PATCH] hw/misc/npcm7xx_clk: Don't leak string in
 npcm7xx_clk_sel_init()
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, 
 QEMU Developers <qemu-devel@nongnu.org>, Tyrone Ting <kfting@nuvoton.com>, 
 Havard Skinnemoen <hskinnemoen@google.com>
Content-Type: multipart/alternative; boundary="00000000000036d10105d9b97ec2"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f30
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f30;
 envelope-from=wuhaotsh@google.com; helo=mail-qv1-xf30.google.com
X-Spam_score_int: -161
X-Spam_score: -16.2
X-Spam_bar: ----------------
X-Spam_report: (-16.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YA7Xp47IMARO

--00000000000036d10105d9b97ec2
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 8, 2022 at 10:09 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 3/8/22 07:03, Peter Maydell wrote:
> > In npcm7xx_clk_sel_init() we allocate a string with g_strdup_printf().
> > Use g_autofree so we free it rather than leaking it.
> >
> > (Detected with the clang leak sanitizer.)
> >
> > Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> > ---
> >   hw/misc/npcm7xx_clk.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
> Reviewed-by: Hao Wu <wuhaotsh@google.com>

> r~
>
>

--00000000000036d10105d9b97ec2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 8, 2022 at 10:09 AM Richa=
rd Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.he=
nderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On 3/8/22 07:03, Peter Maydell wrote:<br>
&gt; In npcm7xx_clk_sel_init() we allocate a string with g_strdup_printf().=
<br>
&gt; Use g_autofree so we free it rather than leaking it.<br>
&gt; <br>
&gt; (Detected with the clang leak sanitizer.)<br>
&gt; <br>
&gt; Signed-off-by: Peter Maydell&lt;<a href=3D"mailto:peter.maydell@linaro=
.org" target=3D"_blank">peter.maydell@linaro.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0hw/misc/npcm7xx_clk.c | 4 ++--<br>
&gt;=C2=A0 =C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
Reviewed-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@lina=
ro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
<br></blockquote><div>Reviewed-by: Hao Wu &lt;<a href=3D"mailto:wuhaotsh@go=
ogle.com">wuhaotsh@google.com</a>&gt;=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">
r~<br>
<br>
</blockquote></div></div>

--00000000000036d10105d9b97ec2--
