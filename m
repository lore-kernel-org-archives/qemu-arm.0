Received: by 2002:a17:907:6195:b0:a52:fc6:5c40 with SMTP id mt21csp238149ejc;
        Wed, 10 Apr 2024 04:09:51 -0700 (PDT)
X-Received: by 2002:a50:8d0a:0:b0:56b:a077:2eee with SMTP id s10-20020a508d0a000000b0056ba0772eeemr1471836eds.4.1712747391233;
        Wed, 10 Apr 2024 04:09:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712747391; cv=none;
        d=google.com; s=arc-20160816;
        b=NFXSHAUtOTz0DxapOPhXwUNy406FdCyKmNr0bmUP6GjEp/jNOmREhbShq1bOHa3P1d
         /hsgEl4c5H2QIDM+bZrDD0sMDlwqz+y6U4bXcp7aqzWuxsW1J8lDC4dsrtbr2kdosSG9
         85GmpmLUkCUw412psI/XkCq0QVi2dbXPkl1cvjkrKJhXIOMCeViVZSXA0cteYPRkd3GX
         kbEeQgqIVvwrNRQd8zUA5AOUw7SrRhj74dIN3nfqyBXO6V+UQyHT9SChnbMsefc7AVpF
         997vpca2ooh2A9oy66h6//S5eS4q5EWLP6Rr1RF/HUJzLsQbP2I4g5ZrAuA596jdypYC
         9IfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vE92hnc8BAG0T6Kx44GKeZRxsC+3iq1fx3ux4Mdkiqk=;
        fh=CBnOaSFfJkaPz4RfPZ0Yxqetu/mr7EzRO2alpDGp8ZQ=;
        b=ys9zoXjfa1GLlPW/LQ9iVqfwNfp1hbXWJgvrWPcVyOjafz7h4wiFLBdzbXFuJq6slc
         t9gu2YN2LeMFAUD3ERiTkXgU/+MjFGA8in/475olb0Ei2wfZvPNoPiNnmOAqr8yZAZ3v
         pF6+tucLAvD+NjnyQSX1ljmCgiEeuoIp3DTIjlQbNDMKhwpgX0VwppzECfHHgyOfGcDz
         3NO9jmH2KBob2241U7obXSsYbpu39mVD2q+MdSkwjmmNOY0qpHIhbQeGFX40rg6oLMIV
         9PYjyfbtCitrlHjYBnV5SbBv9oaw6yWD/gPVj8QEt/kDT5Gz/PqCkE039ptA+M7w4vu2
         BUvQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=U1dzIePk;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id z3-20020a50cd03000000b0056c2e2f4575sor2741178edi.3.2024.04.10.04.09.51
        (Google Transport Security);
        Wed, 10 Apr 2024 04:09:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=U1dzIePk;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712747391; x=1713352191; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vE92hnc8BAG0T6Kx44GKeZRxsC+3iq1fx3ux4Mdkiqk=;
        b=U1dzIePkRQ2zx3fmMPm8Xeh6VqlvVFPWywIWaSW1wbZ64/W5F2DDmhY17UTXe4kcak
         aSBcj1o2gqSSaGkBOcH4lxvdoI4ICx09YiydEcV7O0weT0gmJ5fWlwPhSd0HCoJVegfU
         y11kTc2lmyBEY62ve3WOIszzY12zFxgnAocqJn/h9RVcRD4YGXHfaI0rvzmz4r48R4r9
         M8GRn8l75Sumc4omJERIKcIfW4gcXldCXMp1oSXtOoBsDZ3I9ikod2tucyJlbT+cglVy
         cmwJkq2oZuFhHcfx1VCSC4zEjTRz6rDk521xLSe9RguEFsWpJ4DkQlSvfX/QuuMK0nlt
         53gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712747391; x=1713352191;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vE92hnc8BAG0T6Kx44GKeZRxsC+3iq1fx3ux4Mdkiqk=;
        b=nu09BL0myqw1Uxxfh+vHJ8TL9+L6v7SZ4vX2YNXAeAsAvkwhU2eBxK7A87BvJx2J32
         rVkLSsYIsVhVqVxdCVT5I57JHUfNSqgpd4DDQx1Crz7KNxPr11WkbX4uREiOMgFBpnMt
         R6wQjHOMUHTn+llIX76zpjNXF0YBqEvXaxGIZpfGp0X/RdzXdcNG32GLHyjMoO40jq0J
         ne2qsG76dYL57s2Kas0nU3rqCMa6qX8AeQI7aEbYRkYGGFTgDVSou4NjmYDUh2Ixj4A3
         LRBsCgrt9sW0RHjDNZPDPuWCTefJpYzlHAa1uwyMCR5rBX8O+GXc3tigeW4xKnYfSJrg
         RNrg==
X-Forwarded-Encrypted: i=1; AJvYcCU2jcc/EFWs7oMXVNaRyvzoOwNg/0ApNiPNzV2uIZLNMfip3uDRqAN8nakAdBrdDmVWHVrWFiMaxMmK0U37K6F3jXYm8vwrpOo=
X-Gm-Message-State: AOJu0YxJM25oy1yoknnzLiofm9l+s9gUmJDJ0AMNuRI5etRSld+Sw6Od
	SEhyRJzVbdAj3JCA6oT7CT3NLgAlh6v1bJ28fut0u4Q0ieSmx0Ns4x/tnY8+yJjQMJytmt0XGyJ
	1nIXTvAKUCeDdtZPN1MCsPTywwwM1huPX69bsCFor
X-Google-Smtp-Source: AGHT+IHrJ+Y8ioHbIy0Osc3IVG8sczZ/fh2l/i3k+Pjsz6iAjVr7s4zdD5EDW4dIxxrrt0vurUB8+OFWHS+EEB1t83Q=
X-Received: by 2002:a50:8a89:0:b0:56d:c88a:f37 with SMTP id
 j9-20020a508a89000000b0056dc88a0f37mr1422295edj.26.1712747390673; Wed, 10 Apr
 2024 04:09:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240227223501.28475-1-vikram.garhwal@amd.com>
 <20240227223501.28475-8-vikram.garhwal@amd.com> <87il25514r.fsf@draig.linaro.org>
 <ZejYmXhm87RGhQED@amd.com>
In-Reply-To: <ZejYmXhm87RGhQED@amd.com>
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Date: Wed, 10 Apr 2024 13:09:39 +0200
Message-ID: <CAJy5ezqc1MsfR7A=ba5N42M-r42ciDzTvDy92r3SENQKg+FMYw@mail.gmail.com>
Subject: Re: [QEMU][PATCH v3 7/7] hw: arm: Add grant mapping.
To: Vikram Garhwal <vikram.garhwal@amd.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	qemu-devel@nongnu.org, sstabellini@kernel.org, jgross@suse.com, 
	Peter Maydell <peter.maydell@linaro.org>, "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000cfa99e0615bc13e8"
X-TUID: osFm9rq6b9g6

--000000000000cfa99e0615bc13e8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 6, 2024 at 9:57=E2=80=AFPM Vikram Garhwal <vikram.garhwal@amd.c=
om>
wrote:

> Hi Alex,
> On Fri, Mar 01, 2024 at 05:10:28PM +0000, Alex Benn=C3=A9e wrote:
> > Vikram Garhwal <vikram.garhwal@amd.com> writes:
> >
> > > Enable grant ram mapping support for Xenpvh machine on ARM.
> > >
> > > Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> > > Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> > > ---
> > >  hw/arm/xen_arm.c | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >
> > > diff --git a/hw/arm/xen_arm.c b/hw/arm/xen_arm.c
> > > index 32776d94df..b5993ef2a6 100644
> > > --- a/hw/arm/xen_arm.c
> > > +++ b/hw/arm/xen_arm.c
> > > @@ -125,6 +125,9 @@ static void xen_init_ram(MachineState *machine)
> > >                                   GUEST_RAM1_BASE, ram_size[1]);
> > >          memory_region_add_subregion(sysmem, GUEST_RAM1_BASE, &ram_hi=
);
> > >      }
> > > +
> > > +    DPRINTF("init grant ram mapping for XEN\n");
> >
> > I don't think we need the DPRINTF here (there others where recently
> > converted to trace-points although I suspect a memory_region tracepoint
> > would be a better place to capture this).
> May be drop the print? As it's not providing much information anyways.
>

With the DPRINTF dropped:
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>

--000000000000cfa99e0615bc13e8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, Mar 6, 2024 at 9:57=E2=80=AFPM Vi=
kram Garhwal &lt;<a href=3D"mailto:vikram.garhwal@amd.com">vikram.garhwal@a=
md.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Hi Alex,<br>
On Fri, Mar 01, 2024 at 05:10:28PM +0000, Alex Benn=C3=A9e wrote:<br>
&gt; Vikram Garhwal &lt;<a href=3D"mailto:vikram.garhwal@amd.com" target=3D=
"_blank">vikram.garhwal@amd.com</a>&gt; writes:<br>
&gt; <br>
&gt; &gt; Enable grant ram mapping support for Xenpvh machine on ARM.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Vikram Garhwal &lt;<a href=3D"mailto:vikram.garhwa=
l@amd.com" target=3D"_blank">vikram.garhwal@amd.com</a>&gt;<br>
&gt; &gt; Reviewed-by: Stefano Stabellini &lt;<a href=3D"mailto:sstabellini=
@kernel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 hw/arm/xen_arm.c | 3 +++<br>
&gt; &gt;=C2=A0 1 file changed, 3 insertions(+)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/hw/arm/xen_arm.c b/hw/arm/xen_arm.c<br>
&gt; &gt; index 32776d94df..b5993ef2a6 100644<br>
&gt; &gt; --- a/hw/arm/xen_arm.c<br>
&gt; &gt; +++ b/hw/arm/xen_arm.c<br>
&gt; &gt; @@ -125,6 +125,9 @@ static void xen_init_ram(MachineState *machin=
e)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GUEST_RAM1_BASE,=
 ram_size[1]);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 memory_region_add_subregion(sys=
mem, GUEST_RAM1_BASE, &amp;ram_hi);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 DPRINTF(&quot;init grant ram mapping for XEN\n&quo=
t;);<br>
&gt; <br>
&gt; I don&#39;t think we need the DPRINTF here (there others where recentl=
y<br>
&gt; converted to trace-points although I suspect a memory_region tracepoin=
t<br>
&gt; would be a better place to capture this).<br>
May be drop the print? As it&#39;s not providing much information anyways.<=
br>
</blockquote><div><br></div><div>With the DPRINTF dropped:</div><div>Review=
ed-by: Edgar E. Iglesias &lt;<a href=3D"mailto:edgar.iglesias@amd.com">edga=
r.iglesias@amd.com</a>&gt;</div><div><br></div><div><br></div></div></div>

--000000000000cfa99e0615bc13e8--
