Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1265079dyc;
        Fri, 4 Jul 2025 07:48:18 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX2+YQO0QE6WgxaAem30rKZ9OmoE5uCynTGsS7QInAAhj4OH8iis+uYi3CXgIsQ29YeRrNWEezEyrAj/Q==@linaro.org
X-Google-Smtp-Source: AGHT+IF++qPwIusnKBccmVSymTAwPdTQvJg3o2/+SE7o0XDw0lmFkk1bvUEvAe7XV3OgwzU7kX/s
X-Received: by 2002:a05:620a:800b:b0:7d5:d1e3:42d6 with SMTP id af79cd13be357-7d5df14bb16mr330947885a.46.1751640498259;
        Fri, 04 Jul 2025 07:48:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751640498; cv=none;
        d=google.com; s=arc-20240605;
        b=cvPbzaJc57aOL8Q4b8A43qSHTm4LrAtqPBmw5Z0YAKcj1z6K+XJ9rASbaQvu7ENdYR
         Ws4X0L+H3GJtOgnW4vsWhH8htsZvx3/G8aJQAcGoKJ5AEIaTQIFv4bxYKQf+Uhz5vyDD
         TKwbuu/gAJIYJ6QcLwu/zv5eB2aVwx07jCTmuiT4peHLGo9dFU4tzhq3UwQYvpCnRnFS
         hYevAoEhxHIfrF9a9XonZ77URn3E0SEqmSijsIFWYwdTuskSav4vDf1KqqDHEPH/tDnL
         RQbUoIGCGZ8b4OjmEDyCeB9ZRy0Nml+y9mCFZkZJ+l26yWSfgWqTnjbBHrvcA+R/s7nr
         lNOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=8KN5kjPgG7Y3cd0Dfh0iSQPxyXBCyujt7qtT5C2AlO0=;
        fh=s787c/K3dqYr2+eK70tIcU96/jYPtDTdeb/moWqJmdA=;
        b=KxTdojUqWcSEgxCnv373pjETni4Oq/ZlOauHrHCzXMSy5a2dafSD+hEUM1HFhs4g0L
         89kHLl4wu0D5nuFxHzCwreuD4vnbnHnwYv6Ni7X8UGj95WdZ4tcM9ebJ083ILNFXXFSi
         KQNePMc/A7Y/EEauATmQ8uEcmyr4yMBp1UivmyYAgOjNCyqE3PG0hBeCR7GY7a8I6u2p
         9gHgv/eDFzDidTSOx4yWRDcrji8hZ7v16A+xPwr7alTZwUcZ7S/pGD6rCEsDsoqcjJ2t
         7FxmPYcgWaTRNhTs0kaZDQS8zgNqB+J5yCppdWWeu2wQagfNIbkfdZEpMurK9VtaEWmZ
         Hb3g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=QfcXkFyP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d5dbded3besi219328985a.161.2025.07.04.07.48.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jul 2025 07:48:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=QfcXkFyP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uXhgj-00062l-WA; Fri, 04 Jul 2025 10:46:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kosasihwilliam4@gmail.com>)
 id 1uXhgS-0005wa-B1; Fri, 04 Jul 2025 10:46:37 -0400
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kosasihwilliam4@gmail.com>)
 id 1uXhgQ-0000bM-JJ; Fri, 04 Jul 2025 10:46:36 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id
 3f1490d57ef6-e81f8679957so813606276.2; 
 Fri, 04 Jul 2025 07:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751640393; x=1752245193; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8KN5kjPgG7Y3cd0Dfh0iSQPxyXBCyujt7qtT5C2AlO0=;
 b=QfcXkFyPPI8Om7U762qYukAKIfqLxycPFufXm8gr7DiCZd/8KQEc3TC7VUoPEEc677
 FYD+PZhkHFsDj6IdWG0YX4dtIR50gO4QDyssKm9OS50VBdO1IvmNerqZ+cZZVbNnlegq
 33LnnwpT2O7FEPiljtWoaaF+ih9Zrt1zQ8firnhJTj9XtBfAFyCzCYtd1VHdx5rZZMdU
 D2B3Dmjetet4sf/ymfwV+K9n6HDgZzr7ggaZTeuqSSYXpPwJ6QwPO6S0xmnhxESwaUsV
 tgO2lzVwlNkfSPb8Xwirmxf8oyk6d63j2xCbIigWG0KpBnk2gnYf+Y5uqKgRgaEcVYIE
 5SKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751640393; x=1752245193;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8KN5kjPgG7Y3cd0Dfh0iSQPxyXBCyujt7qtT5C2AlO0=;
 b=XkduxisvghIQ4Q5biR6owy+rVHsLjKixcA8UgN7rOAHD7ule8cSrqZKLPzm2l09e6Y
 9QI4+pgcYEwcquH0HZOfD0j5Yi1jldOUb90bJVyytyaCAr7DxXaHpf85gYneIuj5KNRJ
 M0zwf+MMqfllbap2rDrqNoc/qb7QTSKlre/YJVlKcKqUTR5/Zd+Hc/W4BooNoZ/R9q81
 q9n8A1TX6iDFXurircEp4UrA6WyMu9nBwq0/KZ3XGbMQIRXMXIspZIaX6Nd4aBwGYSdI
 T7ME+Q/Adbwf52BwH/+Mwb1vZtRwHwI+Kyg+nWiGbxf8jOXYufLtxOtKP/EGBPMdWiB9
 7CIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUC+IYlDIrmxvgwUfCdCR5tu4SoMLUijvRH9f4LSmxekYCSdz24bmTfIqqo9Q0J7NKDs+xqUpcgvA==@nongnu.org
X-Gm-Message-State: AOJu0YwntksQ6EBOT3JTRB8FBkNzzp1UxP1IOfHqyt2vQm30JcUnniVw
 jnDmixaDCO8MrMymwmSzMWUirBKR4hrq4smwyZ5ECQb5AYa9uBc4wU56j+Lw+jY5qnbWp8GkXPh
 C8ixYSHOWUTz5KoPxnVbDYJ7EB/y8UMdNYS2r
X-Gm-Gg: ASbGncvbYmhp1vN11SF70MT2gCqJxlNB6BymcnLTHFMnMQkTCJfgfSUyr8fxXtGhXkR
 bjVFKDu1186MCE5qZmUPGq+drnnV+ZJfQyndBe2m9iTs97p5zF2x+n6YbDp5KdyG/XYUmi+jpzW
 Nbow1q9TvRo/p5PtZ7RPbCUSmofffEjFgxd3+wxMx03AI=
X-Received: by 2002:a05:6902:1790:b0:e84:940:e86c with SMTP id
 3f1490d57ef6-e89a0c25c6amr2572462276.22.1751640392781; Fri, 04 Jul 2025
 07:46:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250703085604.154449-1-kosasihwilliam4@gmail.com>
 <CAFEAcA97cvAmtRYEr3hD-BG=LNjoaZFAThYWNKa2zok1MOxgGA@mail.gmail.com>
In-Reply-To: <CAFEAcA97cvAmtRYEr3hD-BG=LNjoaZFAThYWNKa2zok1MOxgGA@mail.gmail.com>
From: William Kosasih <kosasihwilliam4@gmail.com>
Date: Sat, 5 Jul 2025 00:16:19 +0930
X-Gm-Features: Ac12FXwf3VuMMOCMZcrUeWeR9n6Ip0r6DCfKEviPXY4T003qmkWjvRSyn26oFmg
Message-ID: <CAG66A_cgmq==OZfbPbr+qEjosObu5Rx+XHMCa57Dz1H-i9Vyqg@mail.gmail.com>
Subject: Re: [PATCH v4 00/11] target/arm: Fix M-profile helper loads/stores
 alignment checks
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000062da6606391b8f25"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=kosasihwilliam4@gmail.com; helo=mail-yb1-xb2c.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 HTML_FONT_LOW_CONTRAST=0.001, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: rrFFHl+FODXX

--00000000000062da6606391b8f25
Content-Type: text/plain; charset="UTF-8"

This really made my day :-) Thanks Peter!

Best regards,
William

On Fri, Jul 4, 2025 at 22:29 Peter Maydell <peter.maydell@linaro.org> wrote:

> On Thu, 3 Jul 2025 at 09:56, William Kosasih <kosasihwilliam4@gmail.com>
> wrote:
> >
> > Historically, M-profile helper functions in m_helper.c and mve_helper.c
> > used the unaligned cpu_*_data_ra() routines to perform guest memory
> > accesses. This meant we had no way to enforce alignment constraints
> > when executing helper-based loads/stores. With the addition of the
> > cpu_*_mmu() APIs, we can now combine the current MMU state with MO_ALIGN
> > flags to build a MemOpIdx that enforces alignment at the helper level.
> >
> > This patch series:
> > - Replaces all calls to cpu_ld*_data_ra(), cpu_st*_data_ra()
> >   in the M-profile helpers (m_helper.c) and the MVE helpers
> >   (mve_helper.c) with their cpu_*_mmu() equivalents.
> > - Leaves SME and SVE helper code untouched, as those extensions
> >   support unaligned accesses by design.
> >
> > With this change, all M-profile and MVE helper-based loads and stores
> > will now correctly honor their alignment requirements.
> >
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1154
> > Signed-off-by: William Kosasih <kosasihwilliam4@gmail.com>
>
> Applied to target-arm.next. Thanks for these patches!
>
> -- PMM
>

--00000000000062da6606391b8f25
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div><div dir=3D"auto" style=3D"font-size:16px;font-style:normal;font-=
weight:400;letter-spacing:normal;text-indent:0px;text-transform:none;white-=
space:normal;word-spacing:0px;text-decoration:none;background-color:rgba(0,=
0,0,0);border-color:rgb(0,0,0);color:rgb(0,0,0)">This really made my day :-=
) Thanks Peter!</div><div dir=3D"auto" style=3D"font-size:16px;font-style:n=
ormal;font-weight:400;letter-spacing:normal;text-indent:0px;text-transform:=
none;white-space:normal;word-spacing:0px;text-decoration:none;background-co=
lor:rgba(0,0,0,0);border-color:rgb(0,0,0);color:rgb(0,0,0)"><br></div><div =
dir=3D"auto" style=3D"font-size:16px;font-style:normal;font-weight:400;lett=
er-spacing:normal;text-indent:0px;text-transform:none;white-space:normal;wo=
rd-spacing:0px;text-decoration:none;background-color:rgba(0,0,0,0);border-c=
olor:rgb(0,0,0);color:rgb(0,0,0)">Best regards,</div><div dir=3D"auto" styl=
e=3D"font-size:16px;font-style:normal;font-weight:400;letter-spacing:normal=
;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;te=
xt-decoration:none;background-color:rgba(0,0,0,0);border-color:rgb(0,0,0);c=
olor:rgb(0,0,0)">William</div></div></div><div><br><div class=3D"gmail_quot=
e gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jul =
4, 2025 at 22:29 Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.o=
rg">peter.maydell@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-=
left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">On Th=
u, 3 Jul 2025 at 09:56, William Kosasih &lt;<a href=3D"mailto:kosasihwillia=
m4@gmail.com" target=3D"_blank">kosasihwilliam4@gmail.com</a>&gt; wrote:<br=
>
&gt;<br>
&gt; Historically, M-profile helper functions in m_helper.c and mve_helper.=
c<br>
&gt; used the unaligned cpu_*_data_ra() routines to perform guest memory<br=
>
&gt; accesses. This meant we had no way to enforce alignment constraints<br=
>
&gt; when executing helper-based loads/stores. With the addition of the<br>
&gt; cpu_*_mmu() APIs, we can now combine the current MMU state with MO_ALI=
GN<br>
&gt; flags to build a MemOpIdx that enforces alignment at the helper level.=
<br>
&gt;<br>
&gt; This patch series:<br>
&gt; - Replaces all calls to cpu_ld*_data_ra(), cpu_st*_data_ra()<br>
&gt;=C2=A0 =C2=A0in the M-profile helpers (m_helper.c) and the MVE helpers<=
br>
&gt;=C2=A0 =C2=A0(mve_helper.c) with their cpu_*_mmu() equivalents.<br>
&gt; - Leaves SME and SVE helper code untouched, as those extensions<br>
&gt;=C2=A0 =C2=A0support unaligned accesses by design.<br>
&gt;<br>
&gt; With this change, all M-profile and MVE helper-based loads and stores<=
br>
&gt; will now correctly honor their alignment requirements.<br>
&gt;<br>
&gt; Resolves: <a href=3D"https://gitlab.com/qemu-project/qemu/-/issues/115=
4" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/qemu-project/qem=
u/-/issues/1154</a><br>
&gt; Signed-off-by: William Kosasih &lt;<a href=3D"mailto:kosasihwilliam4@g=
mail.com" target=3D"_blank">kosasihwilliam4@gmail.com</a>&gt;<br>
<br>
Applied to target-arm.next. Thanks for these patches!<br>
<br>
-- PMM<br>
</blockquote></div></div>

--00000000000062da6606391b8f25--
