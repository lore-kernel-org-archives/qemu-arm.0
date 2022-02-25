Received: by 2002:ac2:5cd0:0:0:0:0:0 with SMTP id f16csp1947435lfq;
        Fri, 25 Feb 2022 09:55:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwkA64uHdJ2ymk6G+C1Vz+5XAVT2CPO6WxgDJgNsFWbRsdJwT2z4bxWH+u+s9YP08XHJhfW
X-Received: by 2002:a81:6dd5:0:b0:2d0:e1b8:2e13 with SMTP id i204-20020a816dd5000000b002d0e1b82e13mr8828548ywc.132.1645811740417;
        Fri, 25 Feb 2022 09:55:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645811740; cv=none;
        d=google.com; s=arc-20160816;
        b=k8VhvYFxK6bhaJa7DjwMzWZycU+X0uewJ/Ob0e/waTBb2c8slub4/Qdppf0LfFIpr3
         ZTuY1k0m/G6TERYmM/qtE4nOO0wtO9Kep4xgvkqj/cyqOopH9Nht7ZYZRUToKGmZCpe8
         K8USn8XVCynZ2GxZfbvMtkIlLOWUBbsHOVLB1I62EzP+fZsVsfjNYpeiHrkXN89Km4A7
         w93OBtYLrjFKaZACEAFJJs/SRlFWGs9ZmyMvzvZjR3ofotQuCqAy+SO3FutxsjsF7x/h
         LTS9GXTTjXwESaY1K6AuvG4SsVz/46Cw1P7tke2CRUUC1XFRx1pB1T9jtGPbBRJ79bGg
         /+yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=/381xFlDvlMJbcDQUOQ+lPaHQnxr0LexRrBSKCzoQ1M=;
        b=EDtDgcaV6oLMZyX14siG7gh/fNqilGCoUOYKgJObHbcYGq9T6+9H2sLjWBNGf+0K+N
         1fhWAcOIO9XlPMxB1op5DZqb8Vxo99QGynyKX3yE3fsJ5j80lbZJZDWJ0LPCaNUx8npW
         Ikbf7WUmhyZgvMAcS9UdVOpxENnkle4ERl/ZS2uGlhorCIJKkgkSIRjBcDhl2lKlWEnK
         dKcpe4BvaV1AeDMN6PVJTjhvH4IcHfJZuKG73r7ii2HqcQESdkjezb6s3eKbkWR0iHzH
         c4igJyrIimeMWKFCwfpwT0zpr1IcK5LfvM6CJKKeDL/ZmZx8qsu6y/OOMOzkGcHapnv6
         zchw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=CxWQ9ezU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y14-20020a81ca4e000000b002d035ccf9casi3034193ywk.110.2022.02.25.09.55.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 25 Feb 2022 09:55:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=CxWQ9ezU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:45724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nNeod-0003P3-P5
	for alex.bennee@linaro.org; Fri, 25 Feb 2022 12:55:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1nNefB-0006oq-1N
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 12:45:53 -0500
Received: from [2a00:1450:4864:20::129] (port=33393
 helo=mail-lf1-x129.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1nNef9-0004x4-BP
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 12:45:52 -0500
Received: by mail-lf1-x129.google.com with SMTP id bu29so10787962lfb.0
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 09:45:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/381xFlDvlMJbcDQUOQ+lPaHQnxr0LexRrBSKCzoQ1M=;
 b=CxWQ9ezUxhUmw4co+O/85WI9eUMOc1dWucxKb6OiC3T5SwiNYDdAfycJ4Y6L9BbP/I
 bv2ZqLp/kxEd/ZAZzV8ENCGucBdoyiN8g3TIVVfCodxOw0LRjRk2i1//7cp8oAeGDR6B
 veAAMP1kCfYBEohvo+6rWGGLQeGBxlRC/DesuwooX6cgPAwQxuzpJm5eG+tlDFNwTWTY
 I07HY6j+LyTje6yhqjV3UMb+jxpkFTp4q+cI3nymXw/HMuKk2cJXM8RdD+H4nZyBu+Vo
 jv7ngJp+e4UEGdgnfd4PFz6/BB6PlEx+BrHHi/I23UFsAj6Q2nZCEbteTartQaQlEZbu
 hK9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/381xFlDvlMJbcDQUOQ+lPaHQnxr0LexRrBSKCzoQ1M=;
 b=sVA8ULtrk3I1+1dgWEkgJ4Y0jK4KFrQCZIC7TKlDD7XWk3fFgywHJD23nUp4LIjC8y
 M5cnkQyxviXKH3qVFFnay1ptB4zHm8WeZXU4ia0zjV8MuUTcQfhC93gdAOtczboQMajC
 2B8SzMu/hnqfXc1282St6GzZf5LBS5mr6TANockJJ+Hg/0Kl9wMgfgT0pJNFQx85jG1c
 49f434Mozpw7rsAhZG1ke1tRFltsvZKmLN8Kace8Qd46sVaE5ktbWztDv/KHXic1/6fV
 dY5rMHYl928tN7HBhccAz9fgNXOhoIk5+rAxbjdQOwMHXmLHqH24R8tVePLH18FqxK4L
 Hm2Q==
X-Gm-Message-State: AOAM533ySyR1+5mgjUpMyj/XaP6drygdgXvFHAWfslUUy92GCKK0cJy9
 mzJno/VDq5kOE2WZLbzDIWMAfxocAzfR5S7fxJTiiw==
X-Received: by 2002:a05:6512:a93:b0:43c:cf81:d848 with SMTP id
 m19-20020a0565120a9300b0043ccf81d848mr5748773lfu.538.1645811149507; Fri, 25
 Feb 2022 09:45:49 -0800 (PST)
MIME-Version: 1.0
References: <20220224190325.2990336-1-wuhaotsh@google.com>
 <CAFEAcA_hzOkgLaYv=Zy338zfv3WsvSyKVEgzS6bn03o0=ed1VA@mail.gmail.com>
In-Reply-To: <CAFEAcA_hzOkgLaYv=Zy338zfv3WsvSyKVEgzS6bn03o0=ed1VA@mail.gmail.com>
From: Hao Wu <wuhaotsh@google.com>
Date: Fri, 25 Feb 2022 09:45:33 -0800
Message-ID: <CAGcCb10AbftohExf2-2u6gAs+MeOj8gYceDoJ59t4pcX3rz_Pg@mail.gmail.com>
Subject: Re: [PATCH v4] tests/qtest: add qtests for npcm7xx sdhci
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm <qemu-arm@nongnu.org>, 
 QEMU Developers <qemu-devel@nongnu.org>, Patrick Venture <venture@google.com>, 
 IS20 Avi Fishman <Avi.Fishman@nuvoton.com>, CS20 KFTing <kfting@nuvoton.com>, 
 Havard Skinnemoen <hskinnemoen@google.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 bin.meng@windriver.com, qemu-block@nongnu.org, 
 Shengtan Mao <maoshengtan2011@gmail.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Shengtan Mao <stmao@google.com>, Chris Rauer <crauer@google.com>
Content-Type: multipart/alternative; boundary="000000000000efba3805d8db44cf"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::129
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=wuhaotsh@google.com; helo=mail-lf1-x129.google.com
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
X-TUID: FuAgQB7Oic3I

--000000000000efba3805d8db44cf
Content-Type: text/plain; charset="UTF-8"

I have sent an updated version that uses memcmp()

On Fri, Feb 25, 2022 at 3:44 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Thu, 24 Feb 2022 at 19:03, Hao Wu <wuhaotsh@google.com> wrote:
> >
> > From: Shengtan Mao <stmao@google.com>
> >
> > Reviewed-by: Hao Wu <wuhaotsh@google.com>
> > Reviewed-by: Chris Rauer <crauer@google.com>
> > Signed-off-by: Shengtan Mao <stmao@google.com>
> > Signed-off-by: Patrick Venture <venture@google.com>
> > Signed-off-by: Hao Wu <wuhaotsh@google.com>
> > ---
> > v4:
> >  * use strncmp to compare fixed length strings
> > v3:
> >  * fixup compilation from missing macro value
> > v2:
> >  * update copyright year
> >  * check result of open
> >  * use g_free instead of free
> >  * move declarations to the top
> >  * use g_file_open_tmp
> > ---
>
> > +static void write_sdread(QTestState *qts, const char *msg)
> > +{
> > +    int fd, ret;
> > +    size_t len = strlen(msg);
> > +    char *rmsg = g_malloc(len);
> > +
> > +    /* write message to sd */
> > +    fd = open(sd_path, O_WRONLY);
> > +    g_assert(fd >= 0);
> > +    ret = write(fd, msg, len);
> > +    close(fd);
> > +    g_assert(ret == len);
> > +
> > +    /* read message using sdhci */
> > +    ret = sdhci_read_cmd(qts, NPCM7XX_MMC_BA, rmsg, len);
> > +    g_assert(ret == len);
> > +    g_assert(!strncmp(rmsg, msg, len));
>
> We always know we want to compare exactly 'len' bytes here, and we know
> the buffers in each case are at least that large. The right function
> for that is memcmp(), I think.
>
> thanks
> -- PMM
>

--000000000000efba3805d8db44cf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I have sent an updated version that uses memcmp()</div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, F=
eb 25, 2022 at 3:44 AM Peter Maydell &lt;<a href=3D"mailto:peter.maydell@li=
naro.org">peter.maydell@linaro.org</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">On Thu, 24 Feb 2022 at 19:03, Hao Wu &lt;=
<a href=3D"mailto:wuhaotsh@google.com" target=3D"_blank">wuhaotsh@google.co=
m</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Shengtan Mao &lt;<a href=3D"mailto:stmao@google.com" target=3D"_=
blank">stmao@google.com</a>&gt;<br>
&gt;<br>
&gt; Reviewed-by: Hao Wu &lt;<a href=3D"mailto:wuhaotsh@google.com" target=
=3D"_blank">wuhaotsh@google.com</a>&gt;<br>
&gt; Reviewed-by: Chris Rauer &lt;<a href=3D"mailto:crauer@google.com" targ=
et=3D"_blank">crauer@google.com</a>&gt;<br>
&gt; Signed-off-by: Shengtan Mao &lt;<a href=3D"mailto:stmao@google.com" ta=
rget=3D"_blank">stmao@google.com</a>&gt;<br>
&gt; Signed-off-by: Patrick Venture &lt;<a href=3D"mailto:venture@google.co=
m" target=3D"_blank">venture@google.com</a>&gt;<br>
&gt; Signed-off-by: Hao Wu &lt;<a href=3D"mailto:wuhaotsh@google.com" targe=
t=3D"_blank">wuhaotsh@google.com</a>&gt;<br>
&gt; ---<br>
&gt; v4:<br>
&gt;=C2=A0 * use strncmp to compare fixed length strings<br>
&gt; v3:<br>
&gt;=C2=A0 * fixup compilation from missing macro value<br>
&gt; v2:<br>
&gt;=C2=A0 * update copyright year<br>
&gt;=C2=A0 * check result of open<br>
&gt;=C2=A0 * use g_free instead of free<br>
&gt;=C2=A0 * move declarations to the top<br>
&gt;=C2=A0 * use g_file_open_tmp<br>
&gt; ---<br>
<br>
&gt; +static void write_sdread(QTestState *qts, const char *msg)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 int fd, ret;<br>
&gt; +=C2=A0 =C2=A0 size_t len =3D strlen(msg);<br>
&gt; +=C2=A0 =C2=A0 char *rmsg =3D g_malloc(len);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* write message to sd */<br>
&gt; +=C2=A0 =C2=A0 fd =3D open(sd_path, O_WRONLY);<br>
&gt; +=C2=A0 =C2=A0 g_assert(fd &gt;=3D 0);<br>
&gt; +=C2=A0 =C2=A0 ret =3D write(fd, msg, len);<br>
&gt; +=C2=A0 =C2=A0 close(fd);<br>
&gt; +=C2=A0 =C2=A0 g_assert(ret =3D=3D len);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* read message using sdhci */<br>
&gt; +=C2=A0 =C2=A0 ret =3D sdhci_read_cmd(qts, NPCM7XX_MMC_BA, rmsg, len);=
<br>
&gt; +=C2=A0 =C2=A0 g_assert(ret =3D=3D len);<br>
&gt; +=C2=A0 =C2=A0 g_assert(!strncmp(rmsg, msg, len));<br>
<br>
We always know we want to compare exactly &#39;len&#39; bytes here, and we =
know<br>
the buffers in each case are at least that large. The right function<br>
for that is memcmp(), I think.<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div>

--000000000000efba3805d8db44cf--
