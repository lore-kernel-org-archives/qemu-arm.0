Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp3032114ejx;
        Mon, 7 Nov 2022 06:08:03 -0800 (PST)
X-Google-Smtp-Source: AMsMyM4vntyVdd6Md25dqtpLE+XEyvjDocy3IbYgCmaEMUItssoF47OOvKZfZRI7kuJs8ms8p7jw
X-Received: by 2002:a05:6000:810:b0:236:8a6d:e4e1 with SMTP id bt16-20020a056000081000b002368a6de4e1mr31463882wrb.661.1667830083824;
        Mon, 07 Nov 2022 06:08:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1667830083; cv=none;
        d=google.com; s=arc-20160816;
        b=OmNXmEluNN0cXbi2DS+I/xPHOhgF19dbpNUDsio7Gbm5dz3QKAecj+TNwfdyuQpUxY
         U1PeeAaYss5/YNVEBTLv1H+7urWzZoIXtmy+L8g4/oM5vq+xYHkbjnYRIgzHqdrTGc8+
         c6Afx3r15HQFFqhGNK9OB/s0K0m2ecMGSFAwQLLhhkv1G+IxbBvK3g7orjdlzCc4Rx8Q
         xKBY2wfgYUWefaTahnHZNwPV2se4xM4agXii1rn8Bbi2QTRdAhLMAdqm4Fq8jgKHrOuF
         nGSGHMi80A/tZR1GqGeGPBc61Sk8Cw6R/tnVAB9kjixPrgmtPa5L4VFqkDFxpokXEBrh
         tNCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=0fjQ4sBZIxjINZSsQL+fFdWRH4HP2yI78iCQEtn8mJk=;
        b=JAQifSqaU5rS9Or4wlbGo03ip/a51uNc9uXG+dJo3DouA++TekTet5CDEo1VWrmTBo
         51yjSbgeHktA4qhEaknyGVb/Lr9vITwvtdtwnhcJSHn9dO2Xm2IBZMp4dRIzmzGV7x27
         jJ92QQSr2vTathi7rAlLxIoEf9jcDYxunkCClfH86N7lM2wD3RM0quqS1GO/TWwb45LL
         K6117H5dkAhefR0hfUAdsZE4jOjD2Un80QgfXG+s5JTuVL/bh7mjaV6LGGEewVJ2pQcW
         OiZ8vYTGBKwEpF8+AXBwVRh3pWgCMwGB0C9lAGgmiFQHJ5r8e5mD51fWxUyBAppmAd8R
         +L8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@filipe-pinto-com.20210112.gappssmtp.com header.s=20210112 header.b=lL6EqVH1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x13-20020adfffcd000000b002365d8fa965si5163271wrs.553.2022.11.07.06.08.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Nov 2022 06:08:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@filipe-pinto-com.20210112.gappssmtp.com header.s=20210112 header.b=lL6EqVH1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1os2mx-0006nJ-1T; Mon, 07 Nov 2022 09:07:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fpinto@filipe-pinto.com>)
 id 1os0rh-0007xF-Kx
 for qemu-arm@nongnu.org; Mon, 07 Nov 2022 07:04:33 -0500
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fpinto@filipe-pinto.com>)
 id 1os0rd-0008T5-5H
 for qemu-arm@nongnu.org; Mon, 07 Nov 2022 07:04:30 -0500
Received: by mail-qt1-x82e.google.com with SMTP id l15so6703300qtv.4
 for <qemu-arm@nongnu.org>; Mon, 07 Nov 2022 04:04:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=filipe-pinto-com.20210112.gappssmtp.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=0fjQ4sBZIxjINZSsQL+fFdWRH4HP2yI78iCQEtn8mJk=;
 b=lL6EqVH1tNn613SXl5enNPpLZ46UpBGLb55597QDgJnNCqaqhYy+pOApqgeR2pf9sT
 Q6eNsI4aWnTcRzXnr6/Zr34P1zNKWyNaS59q4xGpuj/3qvvCwZQM+KBbOX7W7oYoaKf6
 lRjkV8saSOYefW5d43atjtcS6d9F6cAPw3pZ4IAIAWhVVji3Z5Q7ezZqsj2gXxz4IeBz
 5iCX+F+PTcv4fl33cYSSjaWbEVw9JGsnl2YoSeJp7oL1h4xZ97L2EhYSzwg6ZpQbf5aW
 yNaJTeI6HcnvA6Sm2aon2X86qLsO9Ll5lT/oAVi1luoANmDF7GAKyCnICO3MmtQnSG+C
 AZ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0fjQ4sBZIxjINZSsQL+fFdWRH4HP2yI78iCQEtn8mJk=;
 b=UyqEjjJDubS1xQRiTmyRAbuRiIw3hFGRT2ZnbPW8rZwIj+32j0ISwETWBGpOEQsGHG
 rpa1F1gLYC973YNPhL5O0Ww8zjBcEJSEwevYaXBndCdtYjmwnXJjfCBlj3+siuP3IM6R
 tHMExi6Y/lysO9zIJWuyW44s2xbKtX45ghDxcxjdmCVaQS047u54QagZvbq8gTIx5/E3
 A2chqT1pzl8/8CfQwe7yDtos5GUu0dBo3HCU7VgpszWy81gwcSV2VfdxHRTs1n/UlRhT
 +fvXRi0exJ3fnWV0M5fb6H0XkugaJPvqLZ5GVMlXd6fxvsfbba8K5r7UbNPcyp05RYnE
 RI9Q==
X-Gm-Message-State: ACrzQf15fKJqkOX9xsxNM+QtB85bLIHrYqB1FabtVG3ZuYm3StNW6Cg+
 p89DdRZpkIeEL6UYUHZU4enHLYnNeXSwzGgVhxmRhdzP/DJhfOdJeg==
X-Received: by 2002:a05:622a:2446:b0:3a5:75ee:be5e with SMTP id
 bl6-20020a05622a244600b003a575eebe5emr8796204qtb.23.1667822666720; Mon, 07
 Nov 2022 04:04:26 -0800 (PST)
MIME-Version: 1.0
From: Filipe Pinto <fpinto@filipe-pinto.com>
Date: Mon, 7 Nov 2022 07:03:51 -0500
Message-ID: <CAGPg-2T=cGvXBpB=SxHv2NTru2ghk-TgYCwaZvt5qHfJt-OwJg@mail.gmail.com>
Subject: Raspberry PI emulation - "state of the art"
To: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000993f2d05ece03979"
Received-SPF: none client-ip=2607:f8b0:4864:20::82e;
 envelope-from=fpinto@filipe-pinto.com; helo=mail-qt1-x82e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 07 Nov 2022 09:07:44 -0500
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
X-TUID: 3NzqT3/9cEXF

--000000000000993f2d05ece03979
Content-Type: text/plain; charset="UTF-8"

Hi,

I'm new to the group. I'm also new to this problem.

As part of my research on IoT architectures, I need to emulate Raspberry
Pi. My ultimate objective is to research Hyperledger Indy on smart devices.
It would be great to be able to have an environment with multiple devices.

I was excited when I saw this article -
https://hackernoon.com/raspberry-pi-cluster-emulation-with-docker-compose-xo3l3tyw

However, the author is emulating RPI 1, which doesn't have enough power to
do what I need to do.

Because of that I started to look for something more advanced and found
this video -
https://www.youtube.com/watch?v=Y-FUvi1z1aU&t=865s&ab_channel=SourceMeetsSink
- "Emulating ARM64 Raspberry Pi Image using QEMU"

Unfortunately this video is 2 years old. I wonder if there are more
advanced ways to do it.

I continued my research and end up coming across ARM virtual tools on AWS -
https://aws.amazon.com/marketplace/pp/prodview-urbpq7yo5va7g (which
accordingly to them - "Provides a functionally accurate representation of a
physical SoC, simulating software-visible behavior")

At this point, I started looking at the usual places, namely "*stack
overflow et al*".

Since I'm new to the emulation of ARM processors, the following questions
popped into my mind:

   1. why is emulation of an accurate representation of a RPI physical SoC
   is so complex? From my initial research I'm sure it involves the kernel but
   I was wondering if you could point me to an article that would make it
   clear for people that haven't been involved
   2. what is the most recent known successful RPI emulation? Is it RPI 3?
   3. using open source would be ideal (e.g.,QEMU), but would you recommend
   against it since my ultimate objective is to enter the Hyperledger identity
   stack?
   4. have any of you ever used the ARM tools to replicate their hardware?
   5.
   6. have any of you ever used the ARM tools on AWS to replicate their
   hardware?
   7. is there any article that you  know of that explains in detail the
   differences between "physical SoC" versus "processor" emulations?

I'm kind of stuck so any assistance you can provide it would be very
welcome.

FP

--000000000000993f2d05ece03979
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:trebuche=
t ms,sans-serif">Hi,</div><div class=3D"gmail_default" style=3D"font-family=
:trebuchet ms,sans-serif"><br></div><div class=3D"gmail_default" style=3D"f=
ont-family:trebuchet ms,sans-serif">I&#39;m new to the group. I&#39;m also =
new to this problem.</div><div class=3D"gmail_default" style=3D"font-family=
:trebuchet ms,sans-serif"><br></div><div class=3D"gmail_default" style=3D"f=
ont-family:trebuchet ms,sans-serif">As part of my research on=C2=A0IoT arch=
itectures, I need to emulate Raspberry Pi. My ultimate objective is to rese=
arch Hyperledger Indy on smart devices. It would be great to be able to hav=
e an environment with multiple devices.</div><div class=3D"gmail_default" s=
tyle=3D"font-family:trebuchet ms,sans-serif"><br></div><div class=3D"gmail_=
default" style=3D"font-family:trebuchet ms,sans-serif">I was excited when I=
 saw this article=C2=A0-=C2=A0<a href=3D"https://hackernoon.com/raspberry-p=
i-cluster-emulation-with-docker-compose-xo3l3tyw">https://hackernoon.com/ra=
spberry-pi-cluster-emulation-with-docker-compose-xo3l3tyw</a></div><div cla=
ss=3D"gmail_default" style=3D"font-family:trebuchet ms,sans-serif"><br></di=
v><div class=3D"gmail_default" style=3D"font-family:trebuchet ms,sans-serif=
">However, the author is emulating RPI 1, which doesn&#39;t have enough pow=
er to do what I need to do.</div><div class=3D"gmail_default" style=3D"font=
-family:trebuchet ms,sans-serif"><br></div><div class=3D"gmail_default" sty=
le=3D"font-family:trebuchet ms,sans-serif">Because of that I started to loo=
k for something more advanced and found this video -=C2=A0<a href=3D"https:=
//www.youtube.com/watch?v=3DY-FUvi1z1aU&amp;t=3D865s&amp;ab_channel=3DSourc=
eMeetsSink">https://www.youtube.com/watch?v=3DY-FUvi1z1aU&amp;t=3D865s&amp;=
ab_channel=3DSourceMeetsSink</a> - &quot;Emulating ARM64 Raspberry Pi Image=
 using QEMU&quot;</div><div class=3D"gmail_default" style=3D"font-family:tr=
ebuchet ms,sans-serif"><br></div><div class=3D"gmail_default" style=3D"font=
-family:trebuchet ms,sans-serif">Unfortunately this video is 2 years old. I=
 wonder=C2=A0if there are more advanced ways to do it.</div><div class=3D"g=
mail_default" style=3D"font-family:trebuchet ms,sans-serif"><br></div><div =
class=3D"gmail_default" style=3D"font-family:trebuchet ms,sans-serif">I con=
tinued my research and end up coming=C2=A0across ARM virtual tools on AWS -=
=C2=A0<a href=3D"https://aws.amazon.com/marketplace/pp/prodview-urbpq7yo5va=
7g">https://aws.amazon.com/marketplace/pp/prodview-urbpq7yo5va7g</a> (which=
 accordingly to them - &quot;Provides a functionally accurate representatio=
n of a physical SoC, simulating software-visible behavior&quot;)</div><div =
class=3D"gmail_default" style=3D"font-family:trebuchet ms,sans-serif"><br><=
/div><div class=3D"gmail_default" style=3D"font-family:trebuchet ms,sans-se=
rif">At this point, I started looking at the usual places, namely &quot;<i>=
stack overflow et al</i>&quot;.</div><div class=3D"gmail_default" style=3D"=
font-family:trebuchet ms,sans-serif"><br></div><div class=3D"gmail_default"=
 style=3D"font-family:trebuchet ms,sans-serif">Since I&#39;m new to the emu=
lation of ARM processors, the following questions popped into my mind:</div=
><div class=3D"gmail_default" style=3D"font-family:trebuchet ms,sans-serif"=
><ol><li>why is emulation of an accurate representation of a RPI physical S=
oC is so complex? From my initial research I&#39;m sure it involves the ker=
nel but I was wondering if you could point me to an article that would make=
 it clear for people that haven&#39;t been involved</li><li>what is the mos=
t recent known successful RPI emulation? Is it RPI 3?</li><li>using open so=
urce would be ideal (e.g.,QEMU), but would you recommend against it since m=
y ultimate objective is to enter the Hyperledger identity stack?</li><li>ha=
ve any of you ever used the ARM tools to replicate their hardware?</li><li>=
</li><li>have any of you ever used the ARM tools on AWS to replicate their =
hardware?</li><li>is there any article=C2=A0that you=C2=A0 know of that exp=
lains in detail the differences between &quot;physical SoC&quot; versus &qu=
ot;processor&quot; emulations?</li></ol>I&#39;m kind of stuck so any assist=
ance you can provide it would be very welcome.</div><div class=3D"gmail_def=
ault" style=3D"font-family:trebuchet ms,sans-serif"><br></div><div class=3D=
"gmail_default" style=3D"font-family:trebuchet ms,sans-serif">FP=C2=A0<br><=
/div><div class=3D"gmail_default" style=3D"font-family:trebuchet ms,sans-se=
rif"><br></div><div class=3D"gmail_default" style=3D"font-family:trebuchet =
ms,sans-serif"><br></div><div class=3D"gmail_default" style=3D"font-family:=
trebuchet ms,sans-serif"><br></div><div class=3D"gmail_default" style=3D"fo=
nt-family:trebuchet ms,sans-serif"><br></div></div>

--000000000000993f2d05ece03979--
