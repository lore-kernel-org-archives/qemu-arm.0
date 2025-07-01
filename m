Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp2997089dye;
        Tue, 1 Jul 2025 01:27:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUS4Ir4VXwI1Dk97GDE+ynIhab4yilzW8nkkoB3KRCG7AaN1WMCw1BohDLxNYS0TuzhJyo8EyyMAK6VQA==@linaro.org
X-Google-Smtp-Source: AGHT+IEt9HpKVfsm0qg+uogm6ah2z/H0v6N0e2aG1GvaNKlwHjdjV39uJ5+Ln5umv03ODEs312f0
X-Received: by 2002:a05:620a:3728:b0:7d3:f883:6047 with SMTP id af79cd13be357-7d4439ca3e3mr2380983385a.51.1751358457402;
        Tue, 01 Jul 2025 01:27:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751358457; cv=none;
        d=google.com; s=arc-20240605;
        b=CLlGcJ/efjCYGSnJ01RBeFnzWQ3GSi3vpdb0YtOPB7SVDjwuZhovxB87/jR05iX043
         tlagWDVcbucwcQbg5zzgCl29j41R2bMYSnvis4ouotTyMWjTxGCBIG0UwZE52wIWQH6v
         h+kYc3DkU0yDr057mp/Pdc3EKsXtU0rzaw2CKGJlGAklZm61uObLQU4L3kXYp7r/jf8I
         yiSet4TwvJTsbnq4gCGFl9D6vOrM+9x171nPwwdgTDbsGvCzQNdIKJUETHYUBRvWSH+8
         Ps8ZOb6jlzUzb2j3LnA8GwB84FVWGFIvarCpM7iZpEvGIOKEFp5B/r8Wnp6e813GwH3l
         s/WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Cec4ZnY4yDttputSR02LtvbTtScjGMxT6YCVoIAp95Q=;
        fh=WETLppX2Lat/nyozxxfx70e4PNWnKb+71tAv5LpD48M=;
        b=gwyUYjsdx/X0QT4mYZ8YMdpkeUc0av9KRPMYRd8zCOG5fN1FWYushulwbJMAudLzsX
         9qKz2ZX4YJkPI05dCqepXsfuj6tdlWxjZTo9RCvNZZNZTT2KJZbGKOg+TqFerChYsO+j
         ngsflaUxmIXDuhs21cAvmytxif9sKiVGvhR6dpl78F8jd1Bvkoj/lW9nbN9wR/p3C2DF
         dNn4XcYDDOCzUQJrZo3VhmHmQ32QL3DVfA/1s0pLoCK/+U2YZxQ4dGieuz8G7cpCAEB6
         n5967WB/cvvDWnVgJdppwQyoXppKPvwhfSWmaJXqOT4wQRXTALtnW4jmvb2DaK1svyIW
         csJg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=STDjjxPf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d44326698csi988254885a.409.2025.07.01.01.27.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Jul 2025 01:27:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=STDjjxPf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uWWKv-00049v-8x; Tue, 01 Jul 2025 04:27:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kosasihwilliam4@gmail.com>)
 id 1uWWKr-00049H-Ti; Tue, 01 Jul 2025 04:27:26 -0400
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kosasihwilliam4@gmail.com>)
 id 1uWWKo-0006Xm-OQ; Tue, 01 Jul 2025 04:27:24 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id
 3f1490d57ef6-e8601ce24c9so2237536276.1; 
 Tue, 01 Jul 2025 01:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751358440; x=1751963240; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Cec4ZnY4yDttputSR02LtvbTtScjGMxT6YCVoIAp95Q=;
 b=STDjjxPfX2dXnsJ8mO2BnrZfqTOVVBmKWF+Uotaen+eZ35HlDKOXjXCUcj9X8+xXyi
 MDiWFXGafUVek3WQ40/MExhjac4wm1QFoDYV476Kff5saNbaBhQtdq7XSmHxDEUaFW7H
 Pt9pHlzocikv9p8v6RLlBGWhHz+hiqpBa0awS0XF3/LpxNhRHsgQqaHsdUigCSmp11E5
 /FrlYvNAC5GVtnJtD3NO2KMdppo019sKRSyQyE0yfc4foTbLnIEhB8NgGS3fBMUB5YOg
 y9GKeFRTBAackykqnWeGD7Eke30WbcBRhsGkzIWYO3yIgXk50apN/IA9Rx1314YgcVbP
 eqpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751358440; x=1751963240;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Cec4ZnY4yDttputSR02LtvbTtScjGMxT6YCVoIAp95Q=;
 b=HFiyr3iV/L2FEZLuCVs4aNDf/Ze7xR1VfQQxiE8EhucDA5gDTm3RsrJGja4l7HFBWA
 idMpN0CU6NW56tBmUS74W7sdAeEJOa3Hrgma3+N8dhrr0YMhnV9OgHczhXSoKO5az6SB
 WmFSwmACApmnrJY89b1Jv65z+jF4JHTiTMf22WHTBEkW4gCqP5j752T2gNvD2HYviDdl
 yrRSXzRFLIUcgXYHpC0B6ccvjVXx2ZTaaGkXDhaEEJHtNCV9ObBsSBRsWcdfu4y1aTHS
 lF784kdqDJK1Fa93gsV20hCewYq/9+5A0mc+5oABP1MO9xJq+cUosOMXNPJnF0DgTLrY
 zO8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3BTEOKu0zZCDG0Xex+Pb5oGXBkoxJgzcbCgKVNS+Te8BSVSEY4BwEt+l+cjrldLyDh+K1wNRn/g==@nongnu.org
X-Gm-Message-State: AOJu0YwloSaynSaPYhnRvH/jKA2OYA6lYxAOQCO8/Qm1yh6+JwAuLWrh
 pJtXWox7uglFElyycqopq/mEtaI8aOBsURNU6wmQFqZ3xlkxTplVNBF8k5a0Wl2YXgYk0S/jqE+
 1HANwM//C/VhiD5RuAQiJJml6RGxsOn8=
X-Gm-Gg: ASbGncuTVgM3cQuO3AU79+Joj2CnAwFle4Ax9IKEXra/apljwDW30z/RpeAGseYLo+6
 8BLx2dobfBLDAyefs6mrwNR8hg7UT+8Rx26lDkZCNXUO+ETrd8yJyF+3UaIKSLBbMYB1lga7jQk
 TUOp8w0pzASD702aMQQXF+93jVfT92S4AgKhCBSfuLlH4=
X-Received: by 2002:a05:690c:30d:b0:70f:84c8:312e with SMTP id
 00721157ae682-7151713d346mr246637127b3.1.1751358440398; Tue, 01 Jul 2025
 01:27:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250625105832.1277378-1-kosasihwilliam4@gmail.com>
 <CAFEAcA9X8B8cUbv2hj8dXEnu5OgBW=mzO47PBO9HEDzAVOnGCg@mail.gmail.com>
In-Reply-To: <CAFEAcA9X8B8cUbv2hj8dXEnu5OgBW=mzO47PBO9HEDzAVOnGCg@mail.gmail.com>
From: William Kosasih <kosasihwilliam4@gmail.com>
Date: Tue, 1 Jul 2025 17:57:09 +0930
X-Gm-Features: Ac12FXyz9S3OKl6b-yP1Tnj65aJaOuD3MGhEYSQ1--tb5hGTXCqtz6Bf1hMpuuI
Message-ID: <CAG66A_dyEsx_kFEuKNTdgYos+3m4hboR8g_YmjvKFDc6ZQNYpg@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Fix M-profile helper loads/stores alignment
 checks
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000b6e21f0638d9e9c0"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=kosasihwilliam4@gmail.com; helo=mail-yb1-xb2c.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
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
X-TUID: S5rdmUEZPPUX

--000000000000b6e21f0638d9e9c0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Peter, really appreciate your feedback, thank you so much. I'll split
the patch into smaller
series as you suggested, and keep changes to bare minimum for this fix.
I'll create another
patch for the refactoring of the helper macros indentation.

Cheers,
William

On Tue, Jul 1, 2025 at 1:13=E2=80=AFAM Peter Maydell <peter.maydell@linaro.=
org>
wrote:

> On Wed, 25 Jun 2025 at 11:59, William Kosasih <kosasihwilliam4@gmail.com>
> wrote:
> >
> > Historically, M-profile helper functions in m_helper.c and mve_helper.c
> > used the unaligned cpu_*_data_ra() routines to perform guest memory
> > accesses. This meant we had no way to enforce alignment constraints
> > when executing helper-based loads/stores. With the addition of the
> > cpu_*_mmu() APIs, we can now combine the current MMU state
> > (cpu_mmu_index(env, false)) with MO_ALIGN flags to build a MemOpIdx
> > that enforces alignment at the helper level.
> >
> > This patch:
> > - Replaces all calls to cpu_ldl_data_ra(), cpu_ldst_data_ra(), etc.,
> >   in the M-profile helpers (m_helper.c) and the MVE helpers
> >   (mve_helper.c) with their cpu_*_mmu() equivalents.
> > - Leaves SME and SVE helper code untouched, as those extensions
> >   support unaligned accesses by design.
> > - Retains the manual alignment checks in the vlldm/vlstm helpers
> >   because those instructions enforce an 8-byte alignment requirement
> >   (instead of the 4-byte alignment for ordinary long loads/stores).
> >   References to cpu_*_data_* are still replaced with cpu_*_mmu(), so
> >   that the individual word accesses themselves also perform the standar=
d
> >   alignment checks, in keeping with the ARM pseudocode.
> >
> > With this change, all M-profile and MVE helper-based loads and stores
> > will now correctly honor their alignment requirements.
> >
> > Signed-off-by: William Kosasih <kosasihwilliam4@gmail.com>
> >
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1154
> > ---
> >  target/arm/tcg/m_helper.c   |  33 +--
> >  target/arm/tcg/mve_helper.c | 408 ++++++++++++++++++++----------------
> >  2 files changed, 254 insertions(+), 187 deletions(-)
>
> Hi; thanks for doing this work, this is something that it's definitely
> nice to see fixed.
>
> My main comment here is that this patch is really too large
> at 400+ lines to review easily. Could you split it up into
> a multi-patch series where each patch does one coherent
> thing, please? (For instance "honour alignment requirements in
> vlldm and vlstm" could be one patch, and so on.) This will
> make it easier to review, and also easier to track down any
> problems in it by bisecting to the relevant commit if we get
> reports of a regression.
>
> thanks
> -- PMM
>

--000000000000b6e21f0638d9e9c0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Peter, really appreciate your feedback, thank you so mu=
ch. I&#39;ll split the patch into smaller<div>series as you suggested, and =
keep changes to bare minimum for this fix. I&#39;ll create another</div><di=
v>patch for the refactoring of the helper macros indentation.=C2=A0</div><d=
iv><br></div><div>Cheers,</div><div>William</div></div><br><div class=3D"gm=
ail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On T=
ue, Jul 1, 2025 at 1:13=E2=80=AFAM Peter Maydell &lt;<a href=3D"mailto:pete=
r.maydell@linaro.org">peter.maydell@linaro.org</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">On Wed, 25 Jun 2025 at 11:59,=
 William Kosasih &lt;<a href=3D"mailto:kosasihwilliam4@gmail.com" target=3D=
"_blank">kosasihwilliam4@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Historically, M-profile helper functions in m_helper.c and mve_helper.=
c<br>
&gt; used the unaligned cpu_*_data_ra() routines to perform guest memory<br=
>
&gt; accesses. This meant we had no way to enforce alignment constraints<br=
>
&gt; when executing helper-based loads/stores. With the addition of the<br>
&gt; cpu_*_mmu() APIs, we can now combine the current MMU state<br>
&gt; (cpu_mmu_index(env, false)) with MO_ALIGN flags to build a MemOpIdx<br=
>
&gt; that enforces alignment at the helper level.<br>
&gt;<br>
&gt; This patch:<br>
&gt; - Replaces all calls to cpu_ldl_data_ra(), cpu_ldst_data_ra(), etc.,<b=
r>
&gt;=C2=A0 =C2=A0in the M-profile helpers (m_helper.c) and the MVE helpers<=
br>
&gt;=C2=A0 =C2=A0(mve_helper.c) with their cpu_*_mmu() equivalents.<br>
&gt; - Leaves SME and SVE helper code untouched, as those extensions<br>
&gt;=C2=A0 =C2=A0support unaligned accesses by design.<br>
&gt; - Retains the manual alignment checks in the vlldm/vlstm helpers<br>
&gt;=C2=A0 =C2=A0because those instructions enforce an 8-byte alignment req=
uirement<br>
&gt;=C2=A0 =C2=A0(instead of the 4-byte alignment for ordinary long loads/s=
tores).<br>
&gt;=C2=A0 =C2=A0References to cpu_*_data_* are still replaced with cpu_*_m=
mu(), so<br>
&gt;=C2=A0 =C2=A0that the individual word accesses themselves also perform =
the standard<br>
&gt;=C2=A0 =C2=A0alignment checks, in keeping with the ARM pseudocode.<br>
&gt;<br>
&gt; With this change, all M-profile and MVE helper-based loads and stores<=
br>
&gt; will now correctly honor their alignment requirements.<br>
&gt;<br>
&gt; Signed-off-by: William Kosasih &lt;<a href=3D"mailto:kosasihwilliam4@g=
mail.com" target=3D"_blank">kosasihwilliam4@gmail.com</a>&gt;<br>
&gt;<br>
&gt; Resolves: <a href=3D"https://gitlab.com/qemu-project/qemu/-/issues/115=
4" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/qemu-project/qem=
u/-/issues/1154</a><br>
&gt; ---<br>
&gt;=C2=A0 target/arm/tcg/m_helper.c=C2=A0 =C2=A0|=C2=A0 33 +--<br>
&gt;=C2=A0 target/arm/tcg/mve_helper.c | 408 ++++++++++++++++++++----------=
------<br>
&gt;=C2=A0 2 files changed, 254 insertions(+), 187 deletions(-)<br>
<br>
Hi; thanks for doing this work, this is something that it&#39;s definitely<=
br>
nice to see fixed.<br>
<br>
My main comment here is that this patch is really too large<br>
at 400+ lines to review easily. Could you split it up into<br>
a multi-patch series where each patch does one coherent<br>
thing, please? (For instance &quot;honour alignment requirements in<br>
vlldm and vlstm&quot; could be one patch, and so on.) This will<br>
make it easier to review, and also easier to track down any<br>
problems in it by bisecting to the relevant commit if we get<br>
reports of a regression.<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div>

--000000000000b6e21f0638d9e9c0--
