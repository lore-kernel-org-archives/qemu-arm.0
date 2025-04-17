Received: by 2002:a17:504:749a:b0:1be9:327d:8ee3 with SMTP id a26csp636222njk;
        Thu, 17 Apr 2025 02:18:15 -0700 (PDT)
X-Received: by 2002:a17:90b:2c8b:b0:2ee:aed6:9ec2 with SMTP id 98e67ed59e1d1-30863f1c90dmr8934975a91.14.1744881495699;
        Thu, 17 Apr 2025 02:18:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744881495; cv=none;
        d=google.com; s=arc-20240605;
        b=PSxjZvG+fp3F4XOyGWJJhCV7idjBsKYdIU6FyH2NrWT8QAWhVirJRNm+ztEZ+/+pTt
         x7xszJQTZAX/prP6sihvDreni5ikgp09TJa1wuklWotSelz2p9otg9M8BvYx9KNZOTAv
         FNBRkQWBsasBQ6I20/CobiPyXjElYFWFu72JjOcD0MEB44ioS0KxZzUQUsAEq5sZmfWS
         e+OZQfYnWwyLciY43/ChA2640DQJwAIgzUh1RWK9R4/X4atIPcXWMgnAE8GzRrM2WO1k
         V2rvI2KGNgd+3lBkY8U8qZ+SGU0vjMt933GnJV5sCtQOhOmmG9cXLHzBqhRALN2T7F6U
         Zrpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1WLBjPWfsO4BXL0OvQ1i5sHakJ1+UaHlRH3KudpiBG4=;
        fh=yHosOoybXN/c//EbXiCgpUbhKRtqfB+K7jfAv8MdkMA=;
        b=ZD1ZMEFgUJvRq9ss9JLji/1aXjdL+8+xJPq+WCAwNjcbyrKDaFMBBKWsfyh+V3C6CX
         56bn6E+Ykpgt6XakJhmPPB+Qf2Hf7xxFiXviELXCzd+ti2ZSYhcaBQ21v1OprfeHBiiU
         mLX8p8+2fuxAusPtgUADdd5jOiA3x6ek3wqZbRhv6p8bFuXPtwNjEUa7cxQZ2xQgcXaD
         IlMISL8c7gw/RzMJ/JsZmM84Q4CYi9rg+1vb/72BBQziU96t2XeXiceDhEE/+SyCTkaM
         jRdi5NZnkhLqxTS09uKZ57vs6jUMiQafOuV4j6KNXIqCrZ+cyojcRQjaz/VmX2BrkxQ5
         yY4g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="KVLFm3p/";
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22be10b53bfsor150771845ad.3.2025.04.17.02.18.15
        (Google Transport Security);
        Thu, 17 Apr 2025 02:18:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="KVLFm3p/";
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744881495; x=1745486295; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1WLBjPWfsO4BXL0OvQ1i5sHakJ1+UaHlRH3KudpiBG4=;
        b=KVLFm3p/E9gis3KmAOsIi6DbpF5q/0ljWvh3Q+Lj7yF7a/FqfQxTKie9gqCmdNa4XT
         iqBjCPZBo+DcPTXtGlmq3BgKS5oUeznIbyEI63dF6pM2zp0bKx3HF7fTaxE00QrbQ1Da
         YXXtDxfhfvDCNn/DxYc5w+iJTi442uKkmx+byBXb969a1r1TjJYo2VfNTT3A0LKqG9q6
         RQrZ1Ap14J7ISD5G7HnoXeJIPwGEdMgOuo6Q2EXI4GclU5878Nu/bFiTPKTvTF7wf60a
         HdEmmxs9IjbRgjOBgoY5ExjqFMTL5OgwlwKrvuAdMAHcgsQ14ucx9C3ylgOlabsxco3Y
         35fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744881495; x=1745486295;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1WLBjPWfsO4BXL0OvQ1i5sHakJ1+UaHlRH3KudpiBG4=;
        b=RJLSWnfIcr+UHwZvSeluose8txvDf+plDm3xHgIc5ulIsG57wBfecwStcsf8nuvDXf
         eTuBfd255cO44Zn/vlO/N9rXVZ4UTLpI4H9hSMe4B/mLBETtFlvuerLH7qpeoCozW5eI
         eSq9zd/Q0dI/f5nrG01wQWDEismj41dyhPDUJAncG/Do+bkGADqtrJd3yOlrIVk34MKA
         m/lhMPx7b+zVLOYlUREu6n6CITI4+bu03oVR0MZ6F4GvXCcYOKaur2uf8sdvKXeyiCIF
         sZg0JBKWQrJrRF9H1kR32mTq6Z1JVZKr3TRwWEcrsNqWD7zWDLdiW40j8OZR5zFrJEh3
         IH1w==
X-Forwarded-Encrypted: i=1; AJvYcCVpcSwPPibYQTxO62iJ6YispoSYyy8Dmwjxax9lNCYfRxntdkWvQG81cbQDOdKKopdfSeOis8IP@linaro.org, AJvYcCVv8odcebvLdw7+5AnZr4vJlOMOJfPa6ldwAfZViUKFRodUsu2f1juyRXAmw3/PebUnt2w3yhLjSHZIeoZg@linaro.org, AJvYcCXFpvxv74geeL8/r2ZRSRgxJY/KDbD5dFb/nGR8jMsit7aJBoErLFnJPG2YbLmNBWWV2uFo994FATeDbasaCuaU4Sk=@linaro.org, AJvYcCXh5sYz0GhOMYRXfEGHJbQWcYQuf29J9NgDgDvoHHno8pjA6DBSiZbZdPm952IFQVFwP+sUNX6t6P5b+La3dxZrQA==@linaro.org
X-Gm-Message-State: AOJu0YzFgb4CzBLXpF5MSYuVWHqxS8NOH1AT64ZGf5RIf2/8ZOoP+pFN
	nCIqXLqxktFdwFXMqfbwQqJLNvOfL0Agi+Ju+eb53GEq8r0yoonidg9E2ZG6YsQ0cjC2D3Q6s+Z
	5jLtXbMOAXuRZ4cHfVDVlFrj+x+I=
X-Gm-Gg: ASbGncsmd6ws09OTvEnB88I20DjxE/5Xh8piOT/4phy4TxgJcJztevA06LxnYuab1ec
	VIzRCMy4ooB5KNxQbfzMCJvjxPqVOBMH9WDOC69Z3nPkT/P8UXe9p/kR7HfZ9ufgkG6sqce2yFi
	jX5nbcPQmMfuARtMM/mJwtN+uxi00hlYJdn/n//s2HBzIxJp6pBejq
X-Google-Smtp-Source: AGHT+IF4Rj1T9/KMNZqxohi5RwAbiBoQGmz+hSuqGgEUXQj0HsnRboEYQra1EsTT3emQLFpOZXah8k1AtyHzy5DAlg8=
X-Received: by 2002:a17:90a:e70b:b0:2fc:3264:3657 with SMTP id
 98e67ed59e1d1-30863c54ae3mr8816800a91.0.1744881494943; Thu, 17 Apr 2025
 02:18:14 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1744787186.git.ktokunaga.mail@gmail.com>
 <44e9ef95ea6e8aa33560ca8580db0033623f0e91.1744787186.git.ktokunaga.mail@gmail.com>
 <Z_9qIQhjsI5zOwXA@redhat.com> <CABgObfaj0ycyc2jVSJEVvQJ1m+uLf=_HYiOafn2MECgU36aspw@mail.gmail.com>
 <Z_90aqNE74sonn8O@redhat.com> <CABgObfaNAEsRQrr8O8fpuGGoQHq14Q_niBnQf1Yj4iD33a0LVA@mail.gmail.com>
In-Reply-To: <CABgObfaNAEsRQrr8O8fpuGGoQHq14Q_niBnQf1Yj4iD33a0LVA@mail.gmail.com>
From: Kohei Tokunaga <ktokunaga.mail@gmail.com>
Date: Thu, 17 Apr 2025 18:18:03 +0900
X-Gm-Features: ATxdqUHgp2h8Pj8TyRxXfyhh8WPCb-zjOPqcUlZcrXo0tsUUQI1ADOBE82KIVwY
Message-ID: <CAEDrbUb0G=12Gt50sV+mM3gw_MbXpKwy-F0pXs1rAzdUoU3qKg@mail.gmail.com>
Subject: Re: [PATCH 01/19] hw/core/loader.c: Fix type conflict of GLib
 function pointers
To: Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Thomas Huth <thuth@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, 
	Alexandre Iooss <erdnaxe@crans.org>, Mahmoud Mandour <ma.mandourr@gmail.com>, 
	Pierrick Bouvier <pierrick.bouvier@linaro.org>, Pavel Pisa <pisa@cmp.felk.cvut.cz>, 
	Francisco Iglesias <francisco.iglesias@amd.com>, Vikram Garhwal <vikram.garhwal@bytedance.com>, 
	Jason Wang <jasowang@redhat.com>, =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	Eduardo Habkost <eduardo@habkost.net>, Peter Maydell <peter.maydell@linaro.org>, 
	Zhao Liu <zhao1.liu@intel.com>, Nicholas Piggin <npiggin@gmail.com>, 
	Daniel Henrique Barboza <danielhb413@gmail.com>, David Hildenbrand <david@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Ilya Leoshkevich <iii@linux.ibm.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>, "open list:Block layer core" <qemu-block@nongnu.org>, 
	qemu-arm <qemu-arm@nongnu.org>, 
	"zmta06.collab.prod.int.phx2.redhat.com, list@suse.de" <qemu-ppc@nongnu.org>, qemu-s390x <qemu-s390x@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000ae74880632f5e1d2"
X-TUID: ta/q0lJtV1Yw

--000000000000ae74880632f5e1d2
Content-Type: text/plain; charset="UTF-8"

Hi Daniel, Paolo and Thomas,

> > > I suggested this solution to Kohei because it's easy to check that
we're
> > > converting all users and not introducing new ones in the future (see
> > > poisoning in patch 10).
> >
> > It is easy to check this /one/ example, but this pattern of bad casts
> > is typical in glib with likely many more examples, so avoidance in this
> > way does not feel like a sustainable long term strategy to me.
>
> If you refer to the general case of function casting then yes, I agree
that there could be other problems in the future but that would have to be
solved in glib.
>
> However QEMU's use of glib is overall relatively limited and for now this
seems to be the only case we hit. What this patch is doing is both
effective at solving the immediate issue, and future proof.

The current patch addresses the cases we've encountered so far, and the
poisoning will help catch the usage of them in future development.

That said, it's worth continuing to explore a more robust solution. I've
submitted an issue to the GLib repository to investigate a long-term fix[1].

[1] https://gitlab.gnome.org/GNOME/glib/-/issues/3670

--000000000000ae74880632f5e1d2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Daniel, Paolo and Thomas,<br><br>&gt; &gt; &gt; I sugge=
sted this solution to Kohei because it&#39;s easy to check that we&#39;re<b=
r>&gt; &gt; &gt; converting all users and not introducing new ones in the f=
uture (see<br>&gt; &gt; &gt; poisoning in patch 10).<br>&gt; &gt; <br>&gt; =
&gt; It is easy to check this /one/ example, but this pattern of bad casts<=
br>&gt; &gt; is typical in glib with likely many more examples, so avoidanc=
e in this<br>&gt; &gt; way does not feel like a sustainable long term strat=
egy to me.<br>&gt; <br>&gt; If you refer to the general case of function ca=
sting then yes, I agree that there could be other problems in the future bu=
t that would have to be solved in glib.<br>&gt; <br>&gt; However QEMU&#39;s=
 use of glib is overall relatively limited and for now this seems to be the=
 only case we hit. What this patch is doing is both effective at solving th=
e immediate issue, and future proof.<br><br>The current patch addresses the=
 cases we&#39;ve encountered so far, and the<br>poisoning will help catch t=
he usage of them in future development.<br><br>That said, it&#39;s worth co=
ntinuing to explore a more robust solution. I&#39;ve<br>submitted an issue =
to the GLib repository to investigate a long-term fix[1].<br><br>[1] <a hre=
f=3D"https://gitlab.gnome.org/GNOME/glib/-/issues/3670">https://gitlab.gnom=
e.org/GNOME/glib/-/issues/3670</a><br><br><br></div>

--000000000000ae74880632f5e1d2--
