Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp196503lfp;
        Fri, 15 Jul 2022 07:36:08 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uX/cq+sNEMJj/iSVXa+/cP0ykI/7AB4rKWUYtj77a/xiYc4WYl/qhpI/MINc2qsJPHa7AH
X-Received: by 2002:a05:622a:1453:b0:31d:4c06:4a04 with SMTP id v19-20020a05622a145300b0031d4c064a04mr12126021qtx.432.1657895768278;
        Fri, 15 Jul 2022 07:36:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657895768; cv=none;
        d=google.com; s=arc-20160816;
        b=eWv/3kOExF7HyfLD00K/8/FciMiri3nnT60syZ9o8HpFs6/YCUaoNqK5Fz/qk2wfRI
         +2bdRwfZWLGtqvSvJnnKfFclb1tQB8VMGOubWOa5sGUBxZMiXoCjx38gNiAGxaJIfmPN
         NQn3PR7IoAIh0LhV7IQIzfRhxgy3Uf4V3d/SmYFsUnI+967mRM51i9MU3VnoA7/sh+Ya
         hwFClxklS13p4GTFnt/+a66erjk+xWPD/SXwgV9N+ppd/k55dorHrEM769xeq30Fcoze
         8CalgDMSKfE+ewGSataeFzubTLJNJr8ZMPhSES6/cY3hpwXCQ8jStK1Mwh8bpNwWf5AI
         3mNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=8EBaWQOdQ0aBXaKkpKYJEVBEbLTsskAniyKwawUbcEw=;
        b=CouKppTUXrQ8I1U7aUwtsc9MiOafKj2rI8v/4cHFHbyiRNWtRcDHpIZN+wY2ME+cdi
         OEPp4YNB1jbHb/nAqwhOKO09Ni93SsgTUxpDu3V7mIyWd1Oe+nZcnvJB482ONecg5b0X
         +STCwknP2syCvlwb1GLSND459eFs3SqM7qEBtgotpWSeHH6f8p6TT2HDWKl/Izt0PrGx
         A0UUyjrOYIa23EfM4SkbOaYu0X50iR816OB4W8erKZNl6vtWBJhoEceeahQZpLOWfmdB
         vLeSvKs9n0fmJr/FnDpRsjl7NeLM36En17Z1+0gYTEHknIkh3/J3U7KrwEXkRfao/3FI
         KXvA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=guDjWk6x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u11-20020a05620a454b00b006b58e5431b9si2931130qkp.522.2022.07.15.07.36.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Jul 2022 07:36:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=guDjWk6x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:34134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oCMQJ-0003q9-P2
	for alex.bennee@linaro.org; Fri, 15 Jul 2022 10:36:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jon.alduan@gmail.com>)
 id 1oCMJe-0000YU-DG
 for qemu-arm@nongnu.org; Fri, 15 Jul 2022 10:29:14 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:42578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jon.alduan@gmail.com>)
 id 1oCMJc-0002Io-Jv
 for qemu-arm@nongnu.org; Fri, 15 Jul 2022 10:29:14 -0400
Received: by mail-ej1-x62c.google.com with SMTP id sz17so9263675ejc.9
 for <qemu-arm@nongnu.org>; Fri, 15 Jul 2022 07:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=8EBaWQOdQ0aBXaKkpKYJEVBEbLTsskAniyKwawUbcEw=;
 b=guDjWk6xcTsvsJfYtLRDF4P1BVC/0GVqIWt0Yp16xahJuoYTzmiNU8rcnQKUaGhF5C
 47slBaOuLYdUY0X2IrkR1TkrVM+L/q+giKw0O8MdYRS+cxzaJL1HufKnveoZc08pcrH+
 bX7GgWv8cYly8jP8J3la9kOQLm9cceDD5KbyV3A2W528mbOFW+lICovHLUy0Ai5yBTHW
 FhWvwkNrWC23Ei6eHhoZpIUy/5fLSC05tIdx7iR2NPWi/HttcZGyP98ibiDDLXxNBjxJ
 PQ/h6vijagPFJmu8CGtr0+eCYqUdXb1j7L5oZgQFejVUtbT9TyQJJGY6+b9xt8tx6ZF5
 eWXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=8EBaWQOdQ0aBXaKkpKYJEVBEbLTsskAniyKwawUbcEw=;
 b=VElfXIqlXZ8naGEbBo8EupZbV3A/oelPJxuD4LqfmN0TkwPn2WewS6I/n+l7hpzj9P
 xNJul6Ww+tjqOCn966AWHv0KlxJY5EXy/VInhy6gLv5USjPpS62lH7stxrtfkNPXSf96
 MOAYqsXfxNJF6dFD8zyoCC3xqqC8mXpXJGkT885c5DTZUMQ3ioGYlCi44eXaeCpJYWV7
 fkzpkyKC/ggcn9rWBNStGbAMm89JRNhNKXSx8X4g8tY1nEcym4evY8nul/np4QGy1cAf
 RZhLI4x+d9VcFQAaU1XJEVaVU6Wac9EgV62GVg8wGr9dpbTbriDIxaGiUfVasIYmuoWR
 eDkA==
X-Gm-Message-State: AJIora9ZqUVdw9QIoFRD39C561Ic4ZbY6vcI66UlXjKeDC7UTjIQ3mf8
 KGzSdORy0NwhGppXrWethC8DrwJxzLim9eZS8UlwFLWWseQ=
X-Received: by 2002:a17:907:7394:b0:72b:3e52:6262 with SMTP id
 er20-20020a170907739400b0072b3e526262mr14119642ejc.756.1657895350487; Fri, 15
 Jul 2022 07:29:10 -0700 (PDT)
MIME-Version: 1.0
From: Jon Alduan <jon.alduan@gmail.com>
Date: Fri, 15 Jul 2022 16:28:59 +0200
Message-ID: <CAL7npF9T0148jkgTigVfE7cSzH2HKqy0NG0VQtAH2HMXjdBOOg@mail.gmail.com>
Subject: [qemu-arm-static] timer_delete issue from Qemu 5.0.0 onwards
To: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000070cdea05e3d8d79b"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=jon.alduan@gmail.com; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 15 Jul 2022 10:34:29 -0400
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
X-TUID: fJfU1kqHaSkC

--00000000000070cdea05e3d8d79b
Content-Type: text/plain; charset="UTF-8"

*Is this a bug report, feature (enhancement) request or question? (leave
only one on its own line)*

/kind bug

*Description:*

I am using qemu-arm-static to run "armv7l" applications on a x86_64 system
(usually using "chroot" to an own arm root file system). The host system is
ubuntu.

I compiled a common and simple posix timer (timer_create/timer_delete)
application to verify that qemu-arm-static is handling these calls
correctly. I found out, that regardless of Ubuntu's version,
qemu-arm-static with version 4.2.1 does it right, but 5.0.0 onwards it does
not.

When removing first created timer (index 0), timer created on second place
(index 1) is unexpectedly removed.

This beavior is reproducible.

*Steps to reproduce the issue:*

C++ application creating several recursive timers with timer_create and
type SIGNAL. Configure and start them with timer_settime. Check with some
output which timers are being received within the configured callback
function. After some delay delete first created timer.

*Describe the results you received:*

You will still receive this timer's signal on the callback function, but
the timer created on a second place won't be triggered anymore. Other
timers created subsequentially (index > 1) would not be affected.

*Describe the results you expected:*

I would expect that when I delete first created timer, this timer and not
the secondly created timer will be removed. This is the behavior with Qemu
version 4.2.1
*.*

*Environment:*

   - qemu-arm-static version: 4.2.1 works fine. 5.0.0 onwards the issue can
   be reproduced.
   - Ubuntu + ARM RootFS

*Additional information optionally:*

I can provide logs and application to test if needed.

I need to update the qemu-arm-static version to a newer version, as I get
several qemu outputs saying that some calls are not supported. I checked
out that they are supported by newer qemu versions, but I cannot update
until this important issue is solved.

--00000000000070cdea05e3d8d79b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">
<p dir=3D"auto"><strong>Is this a bug report, feature (enhancement) request=
 or question? (leave only one on its own line)</strong></p>
<p dir=3D"auto">/kind bug</p>
<p dir=3D"auto"><strong>Description:</strong></p>

<p dir=3D"auto">I am using qemu-arm-static to run &quot;armv7l&quot; applic=
ations on a x86_64 system (usually using &quot;chroot&quot; to an own arm r=
oot file system). The host system is ubuntu. <br></p><p>I compiled a common=
 and simple posix timer (timer_create/timer_delete) application to verify t=
hat qemu-arm-static is handling these calls correctly. I found out, that re=
gardless of Ubuntu&#39;s version, qemu-arm-static with version 4.2.1 does i=
t right, but 5.0.0 onwards it does not. <br></p><p>When removing first crea=
ted timer (index 0), timer created on second place (index 1) is unexpectedl=
y removed.<br></p><p>This beavior is reproducible.</p><p></p><p dir=3D"auto=
"> <strong>Steps to reproduce the issue:</strong></p><p>C++ application cre=
ating several recursive timers with timer_create and type SIGNAL. Configure=
 and start them with timer_settime. Check with some output which timers are=
 being received within the configured callback function. After some delay d=
elete first created timer. <strong><br></strong></p>
<p dir=3D"auto"><strong>Describe the results you received:</strong></p><p d=
ir=3D"auto"><strong>
</strong>You will still receive this timer&#39;s signal on the callback fun=
ction, but the=20
timer created on a second place won&#39;t be triggered anymore. Other=20
timers created subsequentially (index &gt; 1) would not be affected. <stron=
g><strong><br></strong>

</strong></p>
<p dir=3D"auto"><strong>Describe the results you expected:</strong></p><p>I=
 would expect that when I delete first created timer, this timer and not th=
e secondly created timer will be removed. This is the behavior with Qemu ve=
rsion 4.2.1<strong>.<br></strong></p>
<p dir=3D"auto"><strong>Environment:</strong></p>

<ul dir=3D"auto"><li>qemu-arm-static version: 4.2.1 works fine. 5.0.0 onwar=
ds the issue can be reproduced.<br></li><li>Ubuntu + ARM RootFS<br></li></u=
l>
<p dir=3D"auto"><code class=3D"gmail-notranslate"></code></p>
<p dir=3D"auto"><strong>Additional information optionally:</strong><br></p>=
<p>I can provide logs and application to test if needed.</p><p>
I need to update the qemu-arm-static version to a newer version, as I get s=
everal qemu outputs saying that some calls are not supported. I checked out=
 that they are supported by newer qemu versions, but I cannot update until =
this important issue is solved.

</p>

<div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signatur=
e"><br></div></div>

--00000000000070cdea05e3d8d79b--
