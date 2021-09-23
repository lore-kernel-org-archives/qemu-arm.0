Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp121236lfp;
        Thu, 23 Sep 2021 05:24:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzO4vslKxFuM2PYTbZwPR4+g8VNkSqA5yYqprWhKnDQYR6MJy28UgntulVL37QmYQmFN+5R
X-Received: by 2002:aa7:cd79:: with SMTP id ca25mr5156557edb.389.1632399854052;
        Thu, 23 Sep 2021 05:24:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632399854; cv=none;
        d=google.com; s=arc-20160816;
        b=0H40E6JWPeKUYZTHo2YXzDuEqXhChuk1le5YHz5AZL+IH9vYTjGnrAYITYPRicDj/7
         qozutXnMwdB1BIDv1ZWyRT0JLUpIx2S/13oxKoL4akVkxJl8PVPD5vt1e1ZIATxUHIDq
         J2ju2EzshP0/0KBYQX6tDq7L50mYDcDbeICgaBtRQzgUXk0vExUSFWMNB0WwrGZk/sgD
         Zaj3xlcsBcBcHfvjxm2oB/L4wyH0IrzSAz+Q5iy5yz8YYHoKErYOrgCI8zbpWvGKsOcc
         Cm6OuVkrU0K5NFA3YSMUdBH7rrtX5KaxdVJtHIl2tN+FOXyIyjDLWKmJVOLDH3LryCkK
         fyGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=i5lF/loNbIAPOy/s796GJGtOMuERGNBkh7zDeZC12NM=;
        b=Gdc3+ADxoon9atAO3xIraaYZ3JzgE/TItCD5YYAIKX5nq/oJ23dElFeyT0kgv/v0SY
         T/EV5cn50oNnuipCyIyQpcN6yxSWz4hCeQOV5NDoN4wnFRoVXMrvwyiShUhm99k98nUe
         2c9FX7a5GBe7q2eHJBC2ZeLRd1WpTc23wLtnW+uhmqk3naOR1gTnxFg63jEMHi4nz3lD
         G0+roQDGDPhK+NNM5uG00/HY59JDMRcSLGupcyFGMQj05YSuPvclkp45/VwVGyniNPHi
         yzxB/1Anjiun6lRSVvrUO5lajU6W0oq8t34fVO24BVGUUS2ROdLHlGRfYD4Dnv6FnYxo
         fdEA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=AyPJgP+M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v17si5271257eds.80.2021.09.23.05.24.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Sep 2021 05:24:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=AyPJgP+M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:40452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mTNlt-0000oD-1J
	for alex.bennee@linaro.org; Thu, 23 Sep 2021 08:24:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <irakatz51@gmail.com>)
 id 1mTNkT-0000mK-AR
 for qemu-arm@nongnu.org; Thu, 23 Sep 2021 08:22:45 -0400
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132]:38763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <irakatz51@gmail.com>)
 id 1mTNkR-0000Mh-1C
 for qemu-arm@nongnu.org; Thu, 23 Sep 2021 08:22:44 -0400
Received: by mail-lf1-x132.google.com with SMTP id x27so25980619lfu.5
 for <qemu-arm@nongnu.org>; Thu, 23 Sep 2021 05:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=i5lF/loNbIAPOy/s796GJGtOMuERGNBkh7zDeZC12NM=;
 b=AyPJgP+Mxazxp+26HnE4djmAq6XO5l7HhSy2V/KsuFvqtRShk4G0y8L1GNVp/8APGD
 JMUhT2ZXsiJ7vHjt5jTsHhdDJDuOvNZY6z1tfDglUV/TSJM06Js5rxHkgf20scGj+jjI
 uY6pht1qV7KEhikDQDNNNy4flT/y1hTu7DPqHHL3bIiDTuhWMQbCs1giIUbd+P++0khk
 VMO7b8xcq+nb7bB7KxZ5yppmnY7KZirVC9Q4Ba5MLrPJn4Clqxdg2RVf6NyBzJm0aalO
 rbhs8lppdbq1hqdyfhoEeFgXd0PxjM46GEqUj04kjG8fxP3Bd54gXO5hHavjYTC/QH7r
 F7Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i5lF/loNbIAPOy/s796GJGtOMuERGNBkh7zDeZC12NM=;
 b=nm0IxYy8XRNhIC+GVHktCmcx7zw2VXwp2s1j44UyQmqB385vI1xCckWr9Q2a4a1V9W
 g27MgMa6baVCI8/DPpGRIwVQ+wE3MT9Zfgs1FT7vv+NS6fwE9oiecBW//0ry2ePqbWlZ
 GUhvGc2XJSXA/eidoltzbjUkXE1t2Qj8DNa67oeSMqD2nvOhY1s18P3+Yyjb1sNSyWk7
 MYLnb/0LH4p+jQrND0CKHR8pAX2xuIjQKo4ud7/wb3lhsDdYlY487/BKXu5A7qrcwzby
 XFM8TLqJHqLU6M75hkU7TNxr6vPqqhw5lMBIjfHQIrjXtYEBpoLpH6xrW2tVl7M2tx8M
 5pXQ==
X-Gm-Message-State: AOAM533n/qrchG605xJ8/+AJBRt768ASdTXZZ/A1jJmaL4W1x3c2d6w4
 MF3u8PQAinvXnga4psAJx0HJp3qc6wEoCTeKReI=
X-Received: by 2002:a2e:96d8:: with SMTP id d24mr4972998ljj.376.1632399760883; 
 Thu, 23 Sep 2021 05:22:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAFLP=uCeyj+MK_a_BgC27Gr_=MC7w+-_08xJsrUC+bHvV8KWWw@mail.gmail.com>
 <CAFEAcA-vpTqu+dX=CFCihWVC1FQSbXvQPdyPHg3P+0Rd40wdWA@mail.gmail.com>
 <CAFLP=uCmE71pVfB5xNUvF6sZn+srqnK4Qo4KwGJ-QhT79jr0qA@mail.gmail.com>
 <CAFEAcA8caoz9LruDwKOe0GHC7i_g=A=MUDK6EKYqd9Ffgdtouw@mail.gmail.com>
In-Reply-To: <CAFEAcA8caoz9LruDwKOe0GHC7i_g=A=MUDK6EKYqd9Ffgdtouw@mail.gmail.com>
From: Chenxu Wang <irakatz51@gmail.com>
Date: Thu, 23 Sep 2021 20:22:29 +0800
Message-ID: <CAFLP=uA=aB3-4=3MPP=xkRMV=G+DnBQgzGxmBmUdO-_AfdiS5Q@mail.gmail.com>
Subject: Re: Failed to execute "SMC" call on Guest OS.
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000e104e405cca8af4a"
Received-SPF: pass client-ip=2a00:1450:4864:20::132;
 envelope-from=irakatz51@gmail.com; helo=mail-lf1-x132.google.com
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +LJMOxb73Kym

--000000000000e104e405cca8af4a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Maydell,

Since the Guest OS is unable to directly calls the Host OS, I design an
undirected way, can you help me to check it?

I ask KVM to catch the SMC calls, and modify KVM (really KVM? not QEMU?)'s
exception handler. In the handler, I route the SMC call to the Host OS
rather than "Undefined".

Is it OK?

Sincerely,
Wang Chenxu

Peter Maydell <peter.maydell@linaro.org> =E4=BA=8E2021=E5=B9=B49=E6=9C=8823=
=E6=97=A5=E5=91=A8=E5=9B=9B =E4=B8=8B=E5=8D=887:22=E5=86=99=E9=81=93=EF=BC=
=9A

> On Thu, 23 Sept 2021 at 12:09, Chenxu Wang <irakatz51@gmail.com> wrote:
> > In my FVP, I want to write a Trusted Application (TA) and want my Guest
> > OS to call the application.
>
> You can't do this. The guest OS inside a VM does not have
> direct access to call a host system secure world application.
> The host kernel keeps code running inside the VM safely contained
> (which is the job of a hypervisor like KVM), so anything that in-the-VM
> code wants to do it must do via KVM.
>
> > PS: I Still do not know how to reply to the thread in the
> > mailing list, maybe cc the mailing list is OK?
>
> Yes, either to: or cc: works fine. Any mail client should have
> some kind of "reply to all" button, which is what you want.
>
> -- PMM
>

--000000000000e104e405cca8af4a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks Maydell,<div><br></div><div>Since the Guest OS is u=
nable to directly calls the Host OS, I design an undirected way, can you he=
lp me to check it?</div><div><br></div><div>I ask KVM to catch the SMC call=
s, and modify KVM (really KVM? not QEMU?)&#39;s exception handler. In the h=
andler, I route the SMC call to the Host OS rather than &quot;Undefined&quo=
t;.</div><div><br></div><div>Is it OK?=C2=A0</div><div><br></div><div>Since=
rely,</div><div>Wang Chenxu</div></div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">Peter Maydell &lt;<a href=3D"mailto:peter.=
maydell@linaro.org">peter.maydell@linaro.org</a>&gt; =E4=BA=8E2021=E5=B9=B4=
9=E6=9C=8823=E6=97=A5=E5=91=A8=E5=9B=9B =E4=B8=8B=E5=8D=887:22=E5=86=99=E9=
=81=93=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
On Thu, 23 Sept 2021 at 12:09, Chenxu Wang &lt;<a href=3D"mailto:irakatz51@=
gmail.com" target=3D"_blank">irakatz51@gmail.com</a>&gt; wrote:<br>
&gt; In my FVP, I want to write a Trusted Application (TA) and want my Gues=
t<br>
&gt; OS to call the application.<br>
<br>
You can&#39;t do this. The guest OS inside a VM does not have<br>
direct access to call a host system secure world application.<br>
The host kernel keeps code running inside the VM safely contained<br>
(which is the job of a hypervisor like KVM), so anything that in-the-VM<br>
code wants to do it must do via KVM.<br>
<br>
&gt; PS: I Still do not know how to reply to the thread in the<br>
&gt; mailing list, maybe cc the mailing list is OK?<br>
<br>
Yes, either to: or cc: works fine. Any mail client should have<br>
some kind of &quot;reply to all&quot; button, which is what you want.<br>
<br>
-- PMM<br>
</blockquote></div>

--000000000000e104e405cca8af4a--
