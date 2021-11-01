Received: by 2002:a05:6512:b9e:0:0:0:0 with SMTP id b30csp2648741lfv;
        Mon, 1 Nov 2021 15:56:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJ0h7wtQciCKzfcWykmz8tJl91dL3UJx8wFBKTmCzLtEb8RHRN496jWkyIilTm3ihzggeJ
X-Received: by 2002:aca:3903:: with SMTP id g3mr1749045oia.12.1635807403565;
        Mon, 01 Nov 2021 15:56:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1635807403; cv=none;
        d=google.com; s=arc-20160816;
        b=AVJ4xKdcHoVdL6aYP2vHZSQPPB8hiUs7ULppPZ9dUbwj8NBaadys8/AlvTk4eLSJjB
         9B9KTzb3WNmY5RCsD/8cyHYid+U1MTMsBfIniUy4eFEi5UJ1PjMHoBF31uIioFVN0vLV
         UovrF3U3vUNatR49jdHgKpMPe4CGwgjF9lk0NJ4hQXUc8nC8A0WzvGlLVRO6PM33jYpr
         3eeiRFqMLqESOrjX94R3RgyFkNQAR0YRkrC8p0DHGvrcIu/xxM+phR4oSwTFJOMvd6/Z
         lfbwdQf3Rtb94uQTN20gSPOCCfeEr27T4ON411ARxkuSCZ3NiodGwA3/vR78HQt60FXr
         ZGPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=ruDq+Ue1WCLZHP1+LuUhcoRPYr7uhk7nMY90VIZo7wU=;
        b=KOkXlnuOdBgIj1ol4c2HVvnG7OD2el/7uDaeQaJjN1/o1DEvzdRzJopZPR0hfg5pMv
         HsEZEdUUShoDUHKd2yB8bHMesVzIM+sMDQpxwuOT3jIFqcHtpKErIANAPBw7Yi7DFPfz
         FjRJjWEwWx+Fl85/v10e1vayi48IhP/fMmMR0koYW2HJ5R2f2J/x1tDYhKH4gBnGS6pH
         QidBqGPSaPw00uCsdyZZuE4x4ggyGaa3dNUFjX8lbp78r1CRSm0NmynddOlD3hYXLSPc
         fNb+rt5UoLJNJHLRC5L5uSl+jRYOtg08KFa7ynsNDpxZnmEaQRmCjgKx19xRWjtenLnN
         Av2w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=N+9gLia2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b22si4771783otf.333.2021.11.01.15.56.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Nov 2021 15:56:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=N+9gLia2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:41086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mhgEM-00059H-T7
	for alex.bennee@linaro.org; Mon, 01 Nov 2021 18:56:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1mhgCQ-0003in-Vm
 for qemu-arm@nongnu.org; Mon, 01 Nov 2021 18:54:42 -0400
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134]:39463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1mhgCM-0000rl-8T
 for qemu-arm@nongnu.org; Mon, 01 Nov 2021 18:54:42 -0400
Received: by mail-lf1-x134.google.com with SMTP id l13so39222860lfg.6
 for <qemu-arm@nongnu.org>; Mon, 01 Nov 2021 15:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ruDq+Ue1WCLZHP1+LuUhcoRPYr7uhk7nMY90VIZo7wU=;
 b=N+9gLia2HokKlYGI+fHD4xmymwO/1iqqX5jSNw5yx5u0DpUCvvCwd/l/ulWZ2zfZLn
 B1+UEdCgYKqoUsB8T+3wM02ddsukWrZqgVlEKCCAv/UffL66kMTHV1ckNjX4TPVgjU3z
 rEqnsyoIkWLDkf9joEtbgmRInGfJN/vbG7+Hp603DsDPDtX1dF+ezELS0Z3rS6oSN8bQ
 U5aJQlwppe+rcil+azAZIcYRqyF/fCq/xQVXnoUkah5uvsQLJT0mpg+IH7TK1mJ1IexC
 eiPJ6xHmYDF6Gp27RQisON8O7u+Yl7kkxM9Q99XTg371+Y0pJ2XZtCEQlOJk1E1JR/fH
 XNLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ruDq+Ue1WCLZHP1+LuUhcoRPYr7uhk7nMY90VIZo7wU=;
 b=DoGJxlKPOqTPC6c8tbvSADILrqQ5LVM/6ZlFEcXpIAA0MEghN09b2PvuV+wc1Bwocg
 nCMDeY8335dka729jy4JpYRKtdyKB2kG942zIGvVIKsNohoPmPVROOebfkNAXlHZVsGi
 ZeMw2XTn0qSaxCZYhCvvt7RUIQNQC9SyNNr2wIM2czBLp+sUGvJrNDkH3SjtdhFxWslC
 l09eGlMcZqHzdRgVSpeXETR7X0hfjOmSVT6+uZfIpGp5P+AsHyhedcpQvB9dm0NhblD6
 A1geaHRrSANO9srEj1LRvi6K+LeXp0Vx7iT+uRJpI66RaJ5N42JfJR+rmwXnIchGwTh0
 wOnA==
X-Gm-Message-State: AOAM533iQFyv6FiTUyUtoAxEZ449YOALw919GiU9etxCqDIwU/EnDQav
 RiXooviholazRcFnhwPYecoFZ+kmTYdn8DaoQjgTNA==
X-Received: by 2002:ac2:5f0d:: with SMTP id 13mr31060538lfq.334.1635807276014; 
 Mon, 01 Nov 2021 15:54:36 -0700 (PDT)
MIME-Version: 1.0
References: <20211021183956.920822-1-wuhaotsh@google.com>
 <20211021183956.920822-8-wuhaotsh@google.com>
 <CAFEAcA8B9uKOyVycq7+kbOSVSfXD9-xsAuBaNowy56CvZKpTUQ@mail.gmail.com>
In-Reply-To: <CAFEAcA8B9uKOyVycq7+kbOSVSfXD9-xsAuBaNowy56CvZKpTUQ@mail.gmail.com>
From: Hao Wu <wuhaotsh@google.com>
Date: Mon, 1 Nov 2021 15:54:13 -0700
Message-ID: <CAGcCb124=YD1f+93RoytAGecoAuVCOwvEpsMA1nrwQPL8Bihnw@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] hw/arm: Add ID for NPCM7XX SMBus
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, venture@google.com, 
 Avi.Fishman@nuvoton.com, KFTING@nuvoton.com, hskinnemoen@google.com
Content-Type: multipart/alternative; boundary="0000000000009c08de05cfc20f90"
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=wuhaotsh@google.com; helo=mail-lf1-x134.google.com
X-Spam_score_int: -156
X-Spam_score: -15.7
X-Spam_bar: ---------------
X-Spam_report: (-15.7 / 5.0 requ) DKIMWL_WL_MED=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
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
X-TUID: xXL2pUFMVr43

--0000000000009c08de05cfc20f90
Content-Type: text/plain; charset="UTF-8"

I was trying to allow attaching a device using "-device xxx,bus=smbus[0]"
Maybe there's a better way to allow that?

I guess I can drop this one from the patch set.

On Mon, Nov 1, 2021 at 10:33 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Thu, 21 Oct 2021 at 19:40, Hao Wu <wuhaotsh@google.com> wrote:
> >
> > The ID can be used to indicate SMBus modules when adding
> > dynamic devices to them.
> >
> > Signed-off-by: Hao Wu <wuhaotsh@google.com>
> > ---
> >  hw/arm/npcm7xx.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/hw/arm/npcm7xx.c b/hw/arm/npcm7xx.c
> > index 2ab0080e0b..72953d65ef 100644
> > --- a/hw/arm/npcm7xx.c
> > +++ b/hw/arm/npcm7xx.c
> > @@ -421,6 +421,7 @@ static void npcm7xx_init(Object *obj)
> >      for (i = 0; i < ARRAY_SIZE(s->smbus); i++) {
> >          object_initialize_child(obj, "smbus[*]", &s->smbus[i],
> >                                  TYPE_NPCM7XX_SMBUS);
> > +        DEVICE(&s->smbus[i])->id = g_strdup_printf("smbus[%d]", i);
> >      }
>
> This one looks weird to me -- I'm pretty sure we shouldn't be messing
> about with the DeviceState id string like that. It's supposed to be
> internal to the QOM/qdev code.
>
> -- PMM
>

--0000000000009c08de05cfc20f90
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I was trying to allow attaching a device using &quot;-devi=
ce xxx,bus=3Dsmbus[0]&quot;<div>Maybe there&#39;s a better way to allow tha=
t?</div><div><br></div><div>I guess I can drop this one from the patch set.=
</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_=
attr">On Mon, Nov 1, 2021 at 10:33 AM Peter Maydell &lt;<a href=3D"mailto:p=
eter.maydell@linaro.org">peter.maydell@linaro.org</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">On Thu, 21 Oct 2021 at 19:=
40, Hao Wu &lt;<a href=3D"mailto:wuhaotsh@google.com" target=3D"_blank">wuh=
aotsh@google.com</a>&gt; wrote:<br>
&gt;<br>
&gt; The ID can be used to indicate SMBus modules when adding<br>
&gt; dynamic devices to them.<br>
&gt;<br>
&gt; Signed-off-by: Hao Wu &lt;<a href=3D"mailto:wuhaotsh@google.com" targe=
t=3D"_blank">wuhaotsh@google.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 hw/arm/npcm7xx.c | 1 +<br>
&gt;=C2=A0 1 file changed, 1 insertion(+)<br>
&gt;<br>
&gt; diff --git a/hw/arm/npcm7xx.c b/hw/arm/npcm7xx.c<br>
&gt; index 2ab0080e0b..72953d65ef 100644<br>
&gt; --- a/hw/arm/npcm7xx.c<br>
&gt; +++ b/hw/arm/npcm7xx.c<br>
&gt; @@ -421,6 +421,7 @@ static void npcm7xx_init(Object *obj)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; ARRAY_SIZE(s-&gt;smbus); i++)=
 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 object_initialize_child(obj, &quot;s=
mbus[*]&quot;, &amp;s-&gt;smbus[i],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TYPE_NPCM7XX_SMBUS);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 DEVICE(&amp;s-&gt;smbus[i])-&gt;id =3D g_=
strdup_printf(&quot;smbus[%d]&quot;, i);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
<br>
This one looks weird to me -- I&#39;m pretty sure we shouldn&#39;t be messi=
ng<br>
about with the DeviceState id string like that. It&#39;s supposed to be<br>
internal to the QOM/qdev code.<br>
<br>
-- PMM<br>
</blockquote></div>

--0000000000009c08de05cfc20f90--
