Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp35003ejb;
        Wed, 7 Dec 2022 20:48:52 -0800 (PST)
X-Google-Smtp-Source: AA0mqf56Ff9RzTyki57pCicohztVx32sg07qfzdApHRmIkNjoNVsPcrNfwi2HPauBQko6bEV7iF4
X-Received: by 2002:a0c:ea2f:0:b0:4c6:fb4e:fefb with SMTP id t15-20020a0cea2f000000b004c6fb4efefbmr43872765qvp.114.1670474932266;
        Wed, 07 Dec 2022 20:48:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670474932; cv=none;
        d=google.com; s=arc-20160816;
        b=E5dy8pq5mmp4vQ/FN8PeLCCadH7TB9G+mt8bENk4VrIW1unRDAXjo3M71zZdP9/RkY
         HJm96fTX0j1ecTYRysQbmyecCMBHfErtkuLno6g60qP201PXjdUytLri5O/3hDjFuwiq
         ekn8PuBP872K5SWSRGiCnjxLN80bcFaaKI0h5annNU187WkzMBtvcrqRmo5NshiE0iPz
         zHzPZTxClHYvRuxHT6TvW0OO83z4GWx4YmLYdDK0fy6nghFvY51+4D+uEt9yj3QCAdzQ
         dhnmBJcF+m9vxXXI8X06H+6Xh41lQPxqBm0JV26Zjwlw2Vpk7CTyYI7N6Yu34TBn43FU
         xPlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=o+mFnVtP0vibPn2ujAg03JG+GpLY5sNnaWUKmLrzx9Q=;
        b=Kz5KhTffrR+YbcRn4cecZI2iyIArfFk4TTHFFQBoNk5NESZ25KYqv+3OQQsa/vYwjY
         0S4f/z6a3uPYDDOBZP24YAZNCZ52Z/wZhd3xPzMTaCyL12p6s2O/Fwvl087qFuxKgFRp
         qlWnKrGZAqDRxr0JcDybeF573jOOOGdhyYFByOH4Kkq8gIROqP6EkENz2ZINRYit9RxO
         e0S6hnhZvcGiT0Ie33nFhwMsFP6wyQdVlgAnyBLivTWIR0FYBWKYETcd8ltjPYIbtLBc
         bOjw0CITVzvZVX1Af6+p/V/4DuDUk6rqgCyJBhI5GXenYOjmUlZmmOJT3+rAhH0FPjYV
         tkGg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@oecu.jp header.s=gmail header.b=Vch1ZJ8f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t2-20020ac865c2000000b003a65b9faabasi10496278qto.179.2022.12.07.20.48.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Dec 2022 20:48:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@oecu.jp header.s=gmail header.b=Vch1ZJ8f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p38pr-0003xd-VY; Wed, 07 Dec 2022 23:48:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mt21a003@oecu.jp>) id 1p38pp-0003x2-19
 for qemu-arm@nongnu.org; Wed, 07 Dec 2022 23:48:37 -0500
Received: from gmgws.osakac.ac.jp ([202.232.129.24])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mt21a003@oecu.jp>) id 1p38pm-0004wi-D3
 for qemu-arm@nongnu.org; Wed, 07 Dec 2022 23:48:36 -0500
Received: from gmgws.osakac.ac.jp (localhost [127.0.0.1])
 by gmgws1g.osakac.ac.jp (Postfix) with ESMTP id BCD53C413F5E
 for <qemu-arm@nongnu.org>; Thu,  8 Dec 2022 13:48:28 +0900 (JST)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69])
 by gapp-gmgws1g.osakac.ac.jp (Postfix) with ESMTP id 4CA56C405439
 for <qemu-arm@nongnu.org>; Thu,  8 Dec 2022 13:48:28 +0900 (JST)
Received: by mail-wm1-f69.google.com with SMTP id
 c187-20020a1c35c4000000b003cfee3c91cdso234633wma.6
 for <qemu-arm@nongnu.org>; Wed, 07 Dec 2022 20:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oecu.jp; s=gmail;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=o+mFnVtP0vibPn2ujAg03JG+GpLY5sNnaWUKmLrzx9Q=;
 b=Vch1ZJ8fCAgoeL8xHvEJ+10R3vNcKSyS9qyRwVAePTjoQhqsJ3JS/fImnY9d43UjH7
 zpBnTiwlZY+nPtVHAs2WUohegp4VnmxzWwm4c+GqEpzlO8grxKeY4hxcepnDIjE8tRpD
 /91VIxQhglgJI9UhfoEgKXUlEDqx0dSvjstHXZ3UC4Ft/LQrU1JPq5VE22s2EpV/0VzS
 s/kU8IpkM7yTAHAqI2o0EdyZ3Ojs7Q9Dz5KUYupoSfX7qQNa20z2CwLT5kgJxtyqB7vG
 udQ6GAfAU6aspN+aCzNdoQO6RmDJBsp0R6CHcgFqydXjs6fQF3z6Z0iXvjGBJ+sDvDaO
 /DxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=o+mFnVtP0vibPn2ujAg03JG+GpLY5sNnaWUKmLrzx9Q=;
 b=WKDpXbgDfWjQ5GptgocQILVYApzmf/o5IX1HIQLZNLIvkcmine7YY+qlyyWp0C427Q
 uRPemLc3oUYi0ukV4X1XuvCnWjtj9ckDWwO7afiLuwc3VzsTibvfh3VBNu6SNqFr7UZd
 GQJjzXvapMEwjAW+aDbce9oyG4Dl6rWbRaHS/phYdWIn187HH729Bvm/Slcv2YDZ9y8n
 zL4h04wHMCVFDq4n7w5dHxy8p/jFNoa5UYXlJjcfATlOLTSM0Mn8RoYZdKuU1++eVa4a
 pwxeSm1HRprdUHTdOFjlasO5YSZ+D35o3vSdjplmNdvgWYGH96sqLtMHQ+L9OsoMmeK8
 TKlw==
X-Gm-Message-State: ANoB5pmOY0+UYymBM5oC0sYhezOkZGo5A9QHeJjiBinFqaDQsNSbIHty
 WYBOL4v33Oa4FCU+uCP+J55tpYNTdgCC4jhCdiPvMxOubrO5BMXMCALx6/+Y4059hSnwBg1Jr3o
 FhGGSsgv2/bwmcMMvCvmUrYmVjyIg0DW6
X-Received: by 2002:a05:600c:3acb:b0:3d0:8916:78eb with SMTP id
 d11-20020a05600c3acb00b003d0891678ebmr17885939wms.68.1670474907291; 
 Wed, 07 Dec 2022 20:48:27 -0800 (PST)
X-Received: by 2002:a05:600c:3acb:b0:3d0:8916:78eb with SMTP id
 d11-20020a05600c3acb00b003d0891678ebmr17885928wms.68.1670474906982; Wed, 07
 Dec 2022 20:48:26 -0800 (PST)
MIME-Version: 1.0
From: =?UTF-8?B?5rGg5pys5bCa5pqJ?= <mt21a003@oecu.jp>
Date: Thu, 8 Dec 2022 13:48:15 +0900
Message-ID: <CADXXVoJZJZgLrP1RFEouT-3UzWJQn8aY_vws1sr-D5ua+gw-AA@mail.gmail.com>
Subject: About the frequency of the dual timer(SP804) and global timer in
 vexpress-a9
To: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000006ff48705ef49bf97"
Received-SPF: pass client-ip=202.232.129.24; envelope-from=mt21a003@oecu.jp;
 helo=gmgws.osakac.ac.jp
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 0fvZJpXl9jBG

--0000000000006ff48705ef49bf97
Content-Type: text/plain; charset="UTF-8"

Greeting from Japan.
I am currently planning to use dual timers to create timer interrupts and
figure the processing time using global timer.
However, neither could reveal the frequency.
Can someone please tell me the frequency of the timer for me?

Below is my development environment.


   - QEMU emulator version 7.1.0 (v7.1.0-11925-g4ec481870e-dirty) for
   Windows10 64bit
   - Vexpress-A9 board emulate(Dual core drive)


Thank you!

Naoki

--

--0000000000006ff48705ef49bf97
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Greeting from Japan.<br>I am currently planning to use dua=
l timers to create timer interrupts and figure the processing time using gl=
obal timer.<br>However, neither could reveal the frequency.<br>Can someone =
please tell me the frequency of the timer for me?<div><br></div><div>Below =
is my development environment.</div><div><br><ul><li>QEMU emulator version =
7.1.0 (v7.1.0-11925-g4ec481870e-dirty) for Windows10 64bit<br></li><li>Vexp=
ress-A9 board emulate(Dual core drive)</li></ul><br>Thank you!</div><div><b=
r></div><div>Naoki<br><br>--</div></div>

--0000000000006ff48705ef49bf97--
