Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp419871lfh;
        Thu, 26 May 2022 09:21:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxo7omkM4TPd+IMSSKnhtRdtn7VXgKKJWWxdxiC2KsERh0YyeVHkjNhupnJEhxOV6Xb9Oap
X-Received: by 2002:a05:622a:186:b0:2f3:b5e1:8f2c with SMTP id s6-20020a05622a018600b002f3b5e18f2cmr29726647qtw.99.1653582105676;
        Thu, 26 May 2022 09:21:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653582105; cv=none;
        d=google.com; s=arc-20160816;
        b=clPFjcvGWWnKBJpTn5LgVH6Oz5rK9050Ul9Qp0VsXoKhBifnZv0lQ88UOR98JoSwaB
         37Ug9GZpfg55YmVsYl1u33oMxmLMa69OeKjyr1SRx3xqPSPCdXaUuCGO7mJB3aHKBhNH
         qxQowW1tZUwpN54Zs3bFFgKik0OgMCR86r+uJf9I9TIBzi1FyaAIMV0ZNNFQncEgz9yG
         0b9f8F4Cb+x6D2zbLGvLZowzWsC2NlL2kZut2IDVoFzPja0pQ5AgTG5rUyQlrFHcgQD8
         nqHuLn2CsLR2zeA8Cl0KL5M1Ds+F8cJZoCqVBiqo45jtYapZ4U0Bs2zX+ztN7d/ObTSZ
         a6Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=J100SEPKQyXjVRHZ+aN2Puog2bHT17/VIJf6A0OpCcI=;
        b=X7VWv89PneHyHiALW1ZGvDAScFKciyIt3VCMucFpo5j4YMiAKIW/Di7smTyLynV7bb
         ZHVYfR7ZB3VMhVvuNjcOLEpAy049krgjsEYGfs8WOme7qpAjeV8kVsJnZUa0tcQvD/hh
         SsCDHQTAgIHDoQ4iyWVJrXdEHgB94YKgdlI6jFKNPb7VFqb8E8VOFTk3/Yd4X+Z+qock
         4rrUWMsji1pm2tGxquQOCHWYg8TKmR5OZdcFVyOIfyCU7DhItjwEo/sYU+q+yeN7KbUi
         bUnKYooUXkK1BkALXEPOfoMvb55JN2k2i9Kf/Y4+JP6nk1+Q4wK1wxlKOjXXpoRHSjjL
         qiHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=YIL6N+lO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jf6-20020a0562142a4600b004467a86a642si1237250qvb.90.2022.05.26.09.21.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 May 2022 09:21:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=YIL6N+lO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:51328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nuGF7-0003n4-6f
	for alex.bennee@linaro.org; Thu, 26 May 2022 12:21:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1nuGEo-0003lK-Gk
 for qemu-arm@nongnu.org; Thu, 26 May 2022 12:21:26 -0400
Received: from mail-vs1-xe2f.google.com ([2607:f8b0:4864:20::e2f]:39537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1nuGEl-0006HP-Ma
 for qemu-arm@nongnu.org; Thu, 26 May 2022 12:21:26 -0400
Received: by mail-vs1-xe2f.google.com with SMTP id c26so1878267vsl.6
 for <qemu-arm@nongnu.org>; Thu, 26 May 2022 09:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=J100SEPKQyXjVRHZ+aN2Puog2bHT17/VIJf6A0OpCcI=;
 b=YIL6N+lOy5P3rVT1mHmm9RBuvusq/tLrOC2q+4GIwdQ/wtEMLGsjTTjAB8cQnpvtaJ
 tOJXU+nw/XfiZzFyeIQLheOx+0FY8zZxupudkZGtW+Y7HKz1XpIzcSHISYZCRNQmmAdd
 DprRIctG3p1LWLN0ks88cEmjLzjNSjHzGCTFiScs37+ujaNh5hm4kB0VLago9ee5TypD
 WA/bh3Q3qncZRappHcDEYC8aqD13fRT/zflBb6lNdKGusLsHyetkGu+cCYxtXW2T4Q3m
 maTjVf6jW3e3MVrq/IiM7Y84c4ogFlbP/o/w8YWEYAx/Ni2wBw+eYSGpgbuAfN4NXTrQ
 sNEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J100SEPKQyXjVRHZ+aN2Puog2bHT17/VIJf6A0OpCcI=;
 b=q8jgMRWguqMZeT/VLF+GgnOmb4X6um1bEFS6wkD6Oktw4f4bHpKu/88I6fVUjvtLOo
 8FVXbb9yU/fIY1sayxHbUUcCliOdbeTunT0UjdfjKfNap+awhLxVSSwU4/OjQboOTBTf
 KbMZFEmb4FXi+wT/0VewT3MqD0pbRCXQUBYc8UCF4kszm1DTFwjbvg96IUexTBwxSGiG
 x6+Jg4+rFHoYNPtA3WVIJSJH45mSlMuqq2Ev4JS16eAgU28XwfgmPDKadNr8V9DnFa8Y
 fjuiGKKfUUQ+tAHLbop5K2wVHcbJUX0cs83C2E0erZtWNfkfMzspb7S6otBGesq3rw4G
 O3AQ==
X-Gm-Message-State: AOAM5306LsTH9917ej6XMVGaq8lXsDQytLO4/S++kwdxYULfYIJOdZ5U
 lwxMt45XmN6YTVONn1XsBiKUesnLPBRQ9fytQhTeuw==
X-Received: by 2002:a05:6102:1622:b0:337:b6b2:f715 with SMTP id
 cu34-20020a056102162200b00337b6b2f715mr8868821vsb.35.1653582081744; Thu, 26
 May 2022 09:21:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220225174451.192304-1-wuhaotsh@google.com>
 <CAFEAcA8vcRme05raLOhtaxmvbbLhLrSZwEaz1BVk5uUYSdmL6w@mail.gmail.com>
In-Reply-To: <CAFEAcA8vcRme05raLOhtaxmvbbLhLrSZwEaz1BVk5uUYSdmL6w@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Thu, 26 May 2022 09:21:10 -0700
Message-ID: <CAO=notyz+SjAoomWGubV5pBuc4qSmNdJF5cmMBf7J8DevF9T4A@mail.gmail.com>
Subject: Re: [PATCH v5] tests/qtest: add qtests for npcm7xx sdhci
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Hao Wu <wuhaotsh@google.com>, qemu-arm <qemu-arm@nongnu.org>, 
 QEMU Developers <qemu-devel@nongnu.org>, Chris Rauer <crauer@google.com>, 
 Shengtan Mao <stmao@google.com>, John Snow <jsnow@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000097609905dfec94bc"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2f;
 envelope-from=venture@google.com; helo=mail-vs1-xe2f.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: izSnCTyVnZZR

--00000000000097609905dfec94bc
Content-Type: text/plain; charset="UTF-8"

On Thu, May 26, 2022 at 8:54 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Fri, 25 Feb 2022 at 17:45, Hao Wu <wuhaotsh@google.com> wrote:
> >
> > From: Shengtan Mao <stmao@google.com>
> >
> > Reviewed-by: Hao Wu <wuhaotsh@google.com>
> > Reviewed-by: Chris Rauer <crauer@google.com>
> > Signed-off-by: Shengtan Mao <stmao@google.com>
> > Signed-off-by: Patrick Venture <venture@google.com>
>
> Hi; John Snow tells me that this test fails in the tests/vm/netbsd
> VM (you can test this with 'make vm-build-netbsd') because the
> assert() on the ftruncate() call fails:
>
> > +    ret = ftruncate(fd, NPCM7XX_TEST_IMAGE_SIZE);
> > +    g_assert_cmpint(ret, ==, 0);
>
> > +#define NPCM7XX_TEST_IMAGE_SIZE (1 << 30)
>
> I haven't investigated the exact cause, but this is a
> gigabyte, right? That's a pretty massive file for a test case to
> create -- can we make the test use a more sensible size of
> sd card image ?
>

It looks like the nuvoton part had an issue with a smaller image size, but
we can resurrect that thread and poke at it a bit and see what shakes out.


>
> thanks
> -- PMM
>

--00000000000097609905dfec94bc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 26, 2022 at 8:54 AM Peter=
 Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@lina=
ro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On Fri, 25 Feb 2022 at 17:45, Hao Wu &lt;<a href=3D"mailto:wuhaotsh@g=
oogle.com" target=3D"_blank">wuhaotsh@google.com</a>&gt; wrote:<br>
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
<br>
Hi; John Snow tells me that this test fails in the tests/vm/netbsd<br>
VM (you can test this with &#39;make vm-build-netbsd&#39;) because the<br>
assert() on the ftruncate() call fails:<br>
<br>
&gt; +=C2=A0 =C2=A0 ret =3D ftruncate(fd, NPCM7XX_TEST_IMAGE_SIZE);<br>
&gt; +=C2=A0 =C2=A0 g_assert_cmpint(ret, =3D=3D, 0);<br>
<br>
&gt; +#define NPCM7XX_TEST_IMAGE_SIZE (1 &lt;&lt; 30)<br>
<br>
I haven&#39;t investigated the exact cause, but this is a<br>
gigabyte, right? That&#39;s a pretty massive file for a test case to<br>
create -- can we make the test use a more sensible size of<br>
sd card image ?<br></blockquote><div><br></div><div>It looks like the nuvot=
on part had an=C2=A0issue with a smaller image size, but we can resurrect t=
hat thread and poke at it a bit and see what shakes out.</div><div>=C2=A0</=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
thanks<br>
-- PMM<br>
</blockquote></div></div>

--00000000000097609905dfec94bc--
