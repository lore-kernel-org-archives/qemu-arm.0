Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp174044ejb;
        Tue, 14 Feb 2023 21:09:46 -0800 (PST)
X-Google-Smtp-Source: AK7set+f5KhN4ilobhdO+crgDocdZE5gmEtNJNtobODeP3crsqVuNy8/OPoPFw1AZpODwBCkNqCx
X-Received: by 2002:ac8:5811:0:b0:3b8:6d67:c178 with SMTP id g17-20020ac85811000000b003b86d67c178mr1669383qtg.3.1676437786642;
        Tue, 14 Feb 2023 21:09:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676437786; cv=none;
        d=google.com; s=arc-20160816;
        b=ObJUL6Z1pP+JYP7OxCZrzK9Lmaj0ECBGIhKlGJHSTYnlx5kWGmPBlVmxIwiFT3CE7z
         RsFqJtcfZDDwc29yOvNOpYZaHvvAV/XPtrlsKalYf5BLBc8x74NVuBjw00g6LKQ0kcg5
         FXBf6Mrj9ut5G34zt/CcDl6ft5lOSzPP3aAs5zRRRagKqQSE+d75PbngaQfedojDhmeY
         TNjZP0Cb5+SS1Y0T6JC6xl2tC3t3CZuHA/wtVBg+SRqJhPLihGIvL/jqSelqpCUqTX4o
         VghVo8mWD7HkjwqxAaY5nIivAaRrdB2v0ux/9kiEXvSjYiu97AKFG1Paomb7Hs7CLjeb
         V8ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=/+cpxky1Bz9DZXwAY5uKeAgwlwLpll94AyY9BFsXHZA=;
        b=n0gived5Fcow7O2uBiS4Pc94H+4F/C5n7xzg4ScMX71YSczFZxZjnfuGrrj417wkHl
         igxMEEDCddoiQ5nMzu2+Jm0nRpDO5NXVgUTw0QhU0AZIJh4FzLlbTgzOKZqGgSLwvy5G
         WDajBGVoBGede7Uo/imGNm8WsUzGrdb75xfGQk8FZth9DnT61I9OdP8h7OunrChcsWuE
         mhDomSvZ0WJPrmxz+dL4hoLzHrchUUi0ebVUMQVsQvfyE1mnTUgG3KZ/fDfOzCAvqZob
         iL7Dkldl+JAcgqRCWCyQpwC2LZlDMi1Wi5qDkS+eSbeF000fIp+otr2Gozg3xQP/xAVg
         79iA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=TJUopGEH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bm35-20020a05620a19a300b006cfc98465efsi13931115qkb.524.2023.02.14.21.09.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Feb 2023 21:09:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=TJUopGEH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pSA2s-0003SN-9x; Wed, 15 Feb 2023 00:09:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkarthikeyan1509@gmail.com>)
 id 1pSA2q-0003S5-Bj; Wed, 15 Feb 2023 00:09:28 -0500
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pkarthikeyan1509@gmail.com>)
 id 1pSA2o-0002YI-75; Wed, 15 Feb 2023 00:09:27 -0500
Received: by mail-vs1-xe33.google.com with SMTP id k6so18775302vsk.1;
 Tue, 14 Feb 2023 21:09:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/+cpxky1Bz9DZXwAY5uKeAgwlwLpll94AyY9BFsXHZA=;
 b=TJUopGEHhEWwbvi1aVTH3qcivN7sVphoPsDYonk+s232L6rV7CJmkzmNDvQQ3HnJNP
 9tRaN157wPzmK/7YyCrI9+Rk8rPyYHW140DvlRdDxJZTJ5iPG9AL9CDN7CAgqtHrGBnG
 kHtmjYr21OOY5Qp9HgWVHAVVu9jbzaYWCQqJFljpSNC8rNh0zuWfB2E4Le4s9wqwpb8k
 MLG9nlEZXLNW5Jnel1QjQfpkzIPqQ+Jl8HZ9/+k9LtVlyyQWRJI5FbG8F8AMUKIwMuSr
 Xw1qy0kc39VCXtPKWkJB9RXTJXw32cU32q5ATqW8SFnDoTaYwkpMmicznJx9W5+IrmUl
 LzQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/+cpxky1Bz9DZXwAY5uKeAgwlwLpll94AyY9BFsXHZA=;
 b=mEu/jDPRW9Gk8Vwyes8PaOuCBi9SguZ3ykYFIYc07r6oZqt6Rc7zoE6muGNerW55IG
 STRayHEbbjZXfFaiUeIzHD3Rsr6WSTHP6iOCywhs3jSe0zCqUQe+vKH8ZpIdz2TjNIbe
 lSLSQKIJ6QJl9KQXmzQ2JbbcDwE+E1fn3ztXE7a6Ghb4UTE9qXOIZq6+rvdbUJcglyS6
 8f8PKic/MLKL3R45SgWjste7Fs+Xqph0F9QJSZog9XRX7QqQDe5qB+h6vz3D21jUHryH
 D7veUDJmjpoEPmL2fNAKZN/GzsXEHwI0ifDChYRqEqUTg7hTrInLC/hL0DlRXN+fKvX8
 Ai1g==
X-Gm-Message-State: AO0yUKXe+hWvpzKPJGEGUN2PwRPsZYiYL8ycFQ1FZbmkN9SzcBU+GJ3/
 fTB5Z3oUTaTGMxqGjSez0qTarJ4WsC7L+SIc6fSHkkBGbgM=
X-Received: by 2002:a05:6102:2751:b0:3fe:b46c:7889 with SMTP id
 p17-20020a056102275100b003feb46c7889mr189536vsu.78.1676437764089; Tue, 14 Feb
 2023 21:09:24 -0800 (PST)
MIME-Version: 1.0
References: <20230210125028.839131-1-pkarthikeyan1509@gmail.com>
 <e16436c5-585d-1a9b-1d62-249922e924c6@kaod.org>
 <CA+ezb7ifqiE-WJnBfDpn6-F17ukkarqnXTmMsSTNRGAHEnp0mA@mail.gmail.com>
 <7589543a-f108-fe88-489b-1f0bba896c5f@kaod.org>
In-Reply-To: <7589543a-f108-fe88-489b-1f0bba896c5f@kaod.org>
From: karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>
Date: Wed, 15 Feb 2023 10:39:12 +0530
Message-ID: <CA+ezb7i=ueNVPrE56T+bzY-fmnB_2VkdpUDT467paU9N4qxuXA@mail.gmail.com>
Subject: Re: [PATCH v1] Adding new machine Yosemitev2 in QEMU
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000006aa97f05f4b615ad"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e33;
 envelope-from=pkarthikeyan1509@gmail.com; helo=mail-vs1-xe33.google.com
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
X-TUID: rIhvgRMLAcMo

--0000000000006aa97f05f4b615ad
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ok, will do that.

On Tue, Feb 14, 2023 at 12:35 PM C=C3=A9dric Le Goater <clg@kaod.org> wrote=
:

> Hello,
>
> [ adding the lists ]
>
> >      > +static void fb_bmc_i2c_init(AspeedMachineState *bmc)
> >
> >     The same routine name is proposed in the tiogapass patch :
> >
> >
> https://lore.kernel.org/qemu-devel/20230210122641.837614-1-pkarthikeyan15=
09@gmail.com/
> <
> https://lore.kernel.org/qemu-devel/20230210122641.837614-1-pkarthikeyan15=
09@gmail.com/
> >
> >
> >     Do you have plans to populate the I2C buses differently ?
> >
> >
> > This is an initial patch we have been working on adding more specific
> configurations in the future.
>
> OK. Then please rename the routine with a "yosemite" like prefix.
>
> Thanks,
>
> C.
>
>
>

--0000000000006aa97f05f4b615ad
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ok, will do that. <br></div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 14, 2023 at 12:35 PM C=
=C3=A9dric Le Goater &lt;<a href=3D"mailto:clg@kaod.org">clg@kaod.org</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hello,=
<br>
<br>
[ adding the lists ]<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +static void fb_bmc_i2c_init(AspeedMachineSta=
te *bmc)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0The same routine name is proposed in the tiogapass =
patch :<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://lore.kernel.org/qemu-devel/20230=
210122641.837614-1-pkarthikeyan1509@gmail.com/" rel=3D"noreferrer" target=
=3D"_blank">https://lore.kernel.org/qemu-devel/20230210122641.837614-1-pkar=
thikeyan1509@gmail.com/</a> &lt;<a href=3D"https://lore.kernel.org/qemu-dev=
el/20230210122641.837614-1-pkarthikeyan1509@gmail.com/" rel=3D"noreferrer" =
target=3D"_blank">https://lore.kernel.org/qemu-devel/20230210122641.837614-=
1-pkarthikeyan1509@gmail.com/</a>&gt;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Do you have plans to populate the I2C buses differe=
ntly ?<br>
&gt; <br>
&gt; <br>
&gt; This is an initial patch we have been working on adding more specific =
configurations in the future.<br>
<br>
OK. Then please rename the routine with a &quot;yosemite&quot; like prefix.=
<br>
<br>
Thanks,<br>
<br>
C.<br>
<br>
<br>
</blockquote></div>

--0000000000006aa97f05f4b615ad--
