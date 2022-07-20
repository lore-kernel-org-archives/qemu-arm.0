Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp2605465lfp;
        Wed, 20 Jul 2022 05:55:52 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uMqUK6jfSUflbCpNRzu3gQrcEnHeZwbIQpkYYfecxIte/myMzQIxV622cQemEJQIqqdzZP
X-Received: by 2002:ac8:5f07:0:b0:31e:a164:6a89 with SMTP id x7-20020ac85f07000000b0031ea1646a89mr28904911qta.578.1658321752233;
        Wed, 20 Jul 2022 05:55:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1658321752; cv=none;
        d=google.com; s=arc-20160816;
        b=t0eafbQ8RSF8ignPXEGtbg1IerXAGI7SG6bQYK3iqjt/ZRlASmuhh6d8DSI3ewfoIy
         QASndLqwsPhweBYXNhq3moNPPSz82g8yZz6U4Jk0AkjpfGudDXdU0ee1V6uA4FDv0LZI
         6CRdJ8J7/RzyhU07j095Aby7CXEMyco45g2zJahb9lVziYl5Y5gIvXWsUhvMOe0CrVOa
         KFKqGSuoksF9uaDGIUtYuDtv2TbayMXZzRtd7vqsLNofpWDqYmsrksHXcQaHfAhq/hqA
         rtkqkJxDF7WmGYuNmdqMdIq0KbPClj329zA8IFJBb8sjjXT7l24ukv1rPXSFtK84tnAh
         YYHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=P1H/cJ74clTgOzYi3xJhY69DWQ88lXdEyvn+jTkic2Y=;
        b=wYa3vB0yFkz/LssE3ODoUAcuW3FzQdX77SjprPoa28b4tI8aywxMYNuro6KIB4sbmq
         sRHIMN/4akgmRoUEFYXRb50QMZt9rHX1cDd19r0OVh1MkaaqMXOhuVcduUSs0GWALy+1
         B+ak+qRbJMNQ21G+rMBCr9q17wDiC1aeSBPJQCSwWLqw+NKuehCEmM7LOx8SQj31TaTp
         RgE59U8swuj/XOiIM2Y9WO1Yzny53BlTL2VqLFtWxlLy2W/0gdT9ggi0EzmVV3f1n4lE
         3+ZHYYKfTRS+/oP88e2E3qV17Db7xBO9FgYabA6eQos5FkQIN9mKkdADAVpPjJphMjUV
         OeBg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=GuzcXQTN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h10-20020a0562140daa00b0047355888c54si8921234qvh.55.2022.07.20.05.55.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Jul 2022 05:55:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=GuzcXQTN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:59390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oE9F1-00024K-O7
	for alex.bennee@linaro.org; Wed, 20 Jul 2022 08:55:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jon.alduan@gmail.com>)
 id 1oE9EY-0001ya-Ri
 for qemu-arm@nongnu.org; Wed, 20 Jul 2022 08:55:24 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:35378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jon.alduan@gmail.com>)
 id 1oE9ES-0003aQ-Es
 for qemu-arm@nongnu.org; Wed, 20 Jul 2022 08:55:22 -0400
Received: by mail-ej1-x62f.google.com with SMTP id j22so32925391ejs.2
 for <qemu-arm@nongnu.org>; Wed, 20 Jul 2022 05:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=P1H/cJ74clTgOzYi3xJhY69DWQ88lXdEyvn+jTkic2Y=;
 b=GuzcXQTNywtC7SVJ32dV1bh/xVX8IbkPtIRmvi5jdsnxQYup2XlKkYUZ348m+vN9si
 pkd63PjmMvKKeCR6UQyc1a4fqbD8Wcc5ss0Xxg3/1WHPug2W505Gcv/jZfH8IcDsNpl5
 dZiAeQTjs/vZjZAWZj0vuSRIfgfquSIk9WWaYETAvM4bbtKjSFqOVR29YuZXvyurwAMP
 A8jVX7D9Es40UV1NrhJNO2D/So2dF8Q7LnPYiKS6ECpjf7Je6ZDG3+dkfEJtqXCn8Eu8
 J5GF7eXP4aF5CTwO13rCY6eVQE8qCpddTtHPzn1jm2152wB/ONg6AEMMfVwyILbu5lI/
 1xgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P1H/cJ74clTgOzYi3xJhY69DWQ88lXdEyvn+jTkic2Y=;
 b=M+3gJHL3JjYkoDboNJRzzYezN0cvrz2tG4ZBfgtaVKfyc2IR2iDNjDFU/nd+hH6R/U
 3q0j9lAerguswk1tKe/6RxVk5KVktsrPC9COB4IztMK8CFFJUG9H7C1mvUN2snBZOfLC
 Nk0P1A9IaAdIrUnziaQjoyxX8i9eJ439KhoTBWVoLM1DKy6Kg6wgmqHhwX1oDVDqBLzD
 MgYI+6rxWx+VdNY5pUBbWZLcoR9K+WnzAjI76ZvtG1oSVbkAucp1essqIcH+oqBOO1ZS
 5pB5wdgh5VOozBDeKdYHE6qaHu0GdXCT6BQXGm8XflwYBdwqsS3wk8cGTBSgARG0BbfU
 GIyg==
X-Gm-Message-State: AJIora9kE9M7feoIyaYVwI6DJ/VYd9kmULZm3DG8uZF5fQX6ofokabmz
 0TrM9ihygTCjgBDk/OTLwFn3UJuIToD6H0+4ZwM=
X-Received: by 2002:a17:907:96a4:b0:72b:647e:30fd with SMTP id
 hd36-20020a17090796a400b0072b647e30fdmr34608204ejc.723.1658321710166; Wed, 20
 Jul 2022 05:55:10 -0700 (PDT)
MIME-Version: 1.0
References: <CAL7npF9T0148jkgTigVfE7cSzH2HKqy0NG0VQtAH2HMXjdBOOg@mail.gmail.com>
 <CAFEAcA8RHhRcrMSO_3MK0hSH=zWzde7S0DHHaLPZf4jOv48RLQ@mail.gmail.com>
 <CAL7npF9hKFsQF18Udi9QFnRZSH-G8cafXHBSBQcrs7jpJmPd7Q@mail.gmail.com>
 <CAFEAcA92=ne8weVYDnLLzNk0+z+aMFJgOJvW_7hSYcY1TimyHw@mail.gmail.com>
 <CAL7npF8Hg7hJBxw9j-1_7GRV_E52KS+hP1WXKfD3+r05C=CBgg@mail.gmail.com>
 <CAFEAcA8tGiaXq+y40-BtdG3jiBJpP=L6x9tsPL_5dF6dr=afEA@mail.gmail.com>
 <CAL7npF8d6LZHZtLWe65JiwQW+X-48JxLa2xBoGdxjJJWpKx-Fw@mail.gmail.com>
 <CAFEAcA9SM--_+Ret6fZwvWNe0J3E8TE-+do614TtTpi0rbAM9A@mail.gmail.com>
In-Reply-To: <CAFEAcA9SM--_+Ret6fZwvWNe0J3E8TE-+do614TtTpi0rbAM9A@mail.gmail.com>
From: Jon Alduan <jon.alduan@gmail.com>
Date: Wed, 20 Jul 2022 14:54:58 +0200
Message-ID: <CAL7npF_8ErAn2cvFBQxVCdP96uKpdRQMs_3aL_UW5OLzm3Q=GQ@mail.gmail.com>
Subject: Re: [qemu-arm-static] timer_delete issue from Qemu 5.0.0 onwards
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000075382a05e43c1cc9"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=jon.alduan@gmail.com; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: dMmAY2soBtrR

--00000000000075382a05e43c1cc9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Peter,

thank you for your file and information. And I get the same wrong behavior
(see below). Also with the dynamic qemu-arm version 7.0.50.
What does this mean? Do you see anything which could be different between
our test environments? Kernel too new?
I am feeling frustrated. I have no more ideas, except that in fact, it is a
bug in qemu. But if it cannot be reproduced on your side...
































































*$:/home/jon/test_qemu_timer/peter# qemu-arm-static_ -versionqemu-arm
version 5.2.0 (Debian 1:5.2+dfsg-9ubuntu3.3)Copyright (c) 2003-2020 Fabrice
Bellard and the QEMU Project developers$:/home/jon/test_qemu_timer/peter#
qemu-arm-static_  /home/jon/test_qemu_timer/peter/timertestCreate timer 0
536880Create timer 1 537928Create timer 2 537944Create timer 3 537960Create
timer 4 537976thread0: startedthread0: saw 0 alarms from 0thread1:
startedthread2: startedthread3: startedthread4: startedthread5:
startedthread6: startedthread7: startedthread8: startedthread9:
startedsignal from alarm 4 537976 4signal from alarm 2 537944 2signal from
alarm 0 536880 0signal from alarm 0 536880 0signal from alarm 4 537976
4signal from alarm 1 537928 1signal from alarm 3 537960 3signal from alarm
2 537944 2signal from alarm 0 536880 0signal from alarm 4 537976 4signal
from alarm 2 537944 2signal from alarm 2 537944 2signal from alarm 4 537976
4signal from alarm 0 536880 0signal from alarm 3 537960 3signal from alarm
1 537928 1signal from alarm 0 536880 0signal from alarm 2 537944 2signal
from alarm 4 537976 4Remove timer 0 536880signal from alarm 3 537960
3signal from alarm 2 537944 2signal from alarm 4 537976 4signal from alarm
0 0 0Error, already deletedsignal from alarm 0 0 0Error, already
deletedsignal from alarm 2 537944 2signal from alarm 4 537976 4signal from
alarm 0 0 0Error, already deletedsignal from alarm 3 537960 3signal from
alarm 4 537976 4signal from alarm 2 537944 2signal from alarm 0 0 0Error,
already deletedsignal from alarm 2 537944 2signal from alarm 4 537976
4Remove timer 1 537928signal from alarm 3 537960 3signal from alarm 4
537976 4signal from alarm 2 537944 2signal from alarm 4 537976 4signal from
alarm 2 537944 2*

*---*

*j.A.*

El mi=C3=A9, 20 jul 2022 a las 11:30, Peter Maydell (<peter.maydell@linaro.=
org>)
escribi=C3=B3:

> On Tue, 19 Jul 2022 at 23:09, Jon Alduan <jon.alduan@gmail.com> wrote:
> >
> > Hello Peter,
> >
> > I compiled the latest Qemu version with standard options. I did it for
> the dynamic qemu-arm option.
> > Anyway, I get the same result.
> > If you do not provide the -L option to qemu-arm, where are the arm-libs
> which it does need to run?
> > i.e. qemu-arm: Could not open '/lib/ld-linux-armhf.so.3': No such file
> or directory
>
> I build the guest binary with -static, so it does not need any
> arm libraries: the executable is completely self-contained.
>
> > Which ld and libc version are you using for building and running the ap=
p?
>
> This is Ubuntu 20.04, with Ubuntu's cross-arch arm-linux-gnueabihf
> libraries used for the link. So the libc is
> libc6-armhf-cross                             2.31-0ubuntu9.9cross1
>
> > Would it be possible that you provide me these libs and the app you
> created? Then, I could try to reproduce this good behavior on my side and
> discard possible issues in my environment.
>
> The compiled binary is at
> https://people.linaro.org/~peter.maydell/timertest
>
> -- PMM
>


--=20
j.A

--00000000000075382a05e43c1cc9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Peter,</div><div><br></div><div>thank you for your=
 file and information. And I get the same wrong behavior (see below). Also =
with the dynamic qemu-arm version 7.0.50.<br></div><div>What does this mean=
? Do you see anything which could be different between our test environment=
s? Kernel too new?<br></div><div>I am feeling frustrated. I have no more id=
eas, except that in fact, it is a bug in qemu. But if it cannot be reproduc=
ed on your side... <br></div><div><br></div><div><i>$:/home/jon/test_qemu_t=
imer/peter# qemu-arm-static_ -version<br>qemu-arm version 5.2.0 (Debian 1:5=
.2+dfsg-9ubuntu3.3)<br>Copyright (c) 2003-2020 Fabrice Bellard and the QEMU=
 Project developers<br>$:/home/jon/test_qemu_timer/peter# qemu-arm-static_ =
=C2=A0/home/jon/test_qemu_timer/peter/timertest<br>Create timer 0 536880<br=
>Create timer 1 537928<br>Create timer 2 537944<br>Create timer 3 537960<br=
>Create timer 4 537976<br>thread0: started<br>thread0: saw 0 alarms from 0<=
br>thread1: started<br>thread2: started<br>thread3: started<br>thread4: sta=
rted<br>thread5: started<br>thread6: started<br>thread7: started<br>thread8=
: started<br>thread9: started<br>signal from alarm 4 537976 4<br>signal fro=
m alarm 2 537944 2<br>signal from alarm 0 536880 0<br>signal from alarm 0 5=
36880 0<br>signal from alarm 4 537976 4<br>signal from alarm 1 537928 1<br>=
signal from alarm 3 537960 3<br>signal from alarm 2 537944 2<br>signal from=
 alarm 0 536880 0<br>signal from alarm 4 537976 4<br>signal from alarm 2 53=
7944 2<br>signal from alarm 2 537944 2<br>signal from alarm 4 537976 4<br>s=
ignal from alarm 0 536880 0<br>signal from alarm 3 537960 3<br>signal from =
alarm 1 537928 1<br>signal from alarm 0 536880 0<br>signal from alarm 2 537=
944 2<br>signal from alarm 4 537976 4<br>Remove timer 0 536880<br>signal fr=
om alarm 3 537960 3<br>signal from alarm 2 537944 2<br>signal from alarm 4 =
537976 4<br>signal from alarm 0 0 0<br><b>Error, already deleted</b><br>sig=
nal from alarm 0 0 0<br><b>Error, already deleted</b><br>signal from alarm =
2 537944 2<br>signal from alarm 4 537976 4<br>signal from alarm 0 0 0<br><b=
>Error, already deleted</b><br>signal from alarm 3 537960 3<br>signal from =
alarm 4 537976 4<br>signal from alarm 2 537944 2<br>signal from alarm 0 0 0=
<br><b>Error, already deleted</b><br>signal from alarm 2 537944 2<br>signal=
 from alarm 4 537976 4<br>Remove timer 1 537928<br>signal from alarm 3 5379=
60 3<br>signal from alarm 4 537976 4<br>signal from alarm 2 537944 2<br>sig=
nal from alarm 4 537976 4<br>signal from alarm 2 537944 2</i></div><div><i>=
<br></i></div><div><i>---</i></div><div><i>j.A.<br></i></div></div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">El mi=C3=A9, 2=
0 jul 2022 a las 11:30, Peter Maydell (&lt;<a href=3D"mailto:peter.maydell@=
linaro.org">peter.maydell@linaro.org</a>&gt;) escribi=C3=B3:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">On Tue, 19 Jul 2022 at 23:09, =
Jon Alduan &lt;<a href=3D"mailto:jon.alduan@gmail.com" target=3D"_blank">jo=
n.alduan@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hello Peter,<br>
&gt;<br>
&gt; I compiled the latest Qemu version with standard options. I did it for=
 the dynamic qemu-arm option.<br>
&gt; Anyway, I get the same result.<br>
&gt; If you do not provide the -L option to qemu-arm, where are the arm-lib=
s which it does need to run?<br>
&gt; i.e. qemu-arm: Could not open &#39;/lib/ld-linux-armhf.so.3&#39;: No s=
uch file or directory<br>
<br>
I build the guest binary with -static, so it does not need any<br>
arm libraries: the executable is completely self-contained.<br>
<br>
&gt; Which ld and libc version are you using for building and running the a=
pp?<br>
<br>
This is Ubuntu 20.04, with Ubuntu&#39;s cross-arch arm-linux-gnueabihf<br>
libraries used for the link. So the libc is<br>
libc6-armhf-cross=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A02.31-0ubuntu9.9cross1<br>
<br>
&gt; Would it be possible that you provide me these libs and the app you cr=
eated? Then, I could try to reproduce this good behavior on my side and dis=
card possible issues in my environment.<br>
<br>
The compiled binary is at<br>
<a href=3D"https://people.linaro.org/~peter.maydell/timertest" rel=3D"noref=
errer" target=3D"_blank">https://people.linaro.org/~peter.maydell/timertest=
</a><br>
<br>
-- PMM<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">j.A</div>

--00000000000075382a05e43c1cc9--
