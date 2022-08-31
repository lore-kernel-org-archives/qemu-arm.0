Received: by 2002:a17:906:1c87:0:0:0:0 with SMTP id g7csp453483ejh;
        Wed, 31 Aug 2022 09:13:46 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7yzStRPrDCeMsCds+oPRuQz6McHlZN3nhabf/qkMIYXaRtREZzHl2I9VA89v0+GpXxyd1s
X-Received: by 2002:ac8:5d88:0:b0:344:8185:d28a with SMTP id d8-20020ac85d88000000b003448185d28amr19933504qtx.259.1661962425908;
        Wed, 31 Aug 2022 09:13:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661962425; cv=none;
        d=google.com; s=arc-20160816;
        b=F1p44W/aM+T3CITOeQurN4p3rkudU4qsFn5x4bxzmBTlUf+RhZJdLF4uaKbdOxV3QE
         wIYJ2/VaV0I/HKO46fBIWZ+5iYr6auhPvD10QAPr9aOVha8Evu7A76v32Ymb7dQ8xhIg
         ohIbyFJln1mJd8TbpSP3C5RTKYBP5EDu2xNKLeWarDkJaitMeRj+os32NwBTo4wzt0pU
         8xrhFcrbwuWH7w0Kb51JYSzSVenzEeYnDdJ6QS2UwGUdx2wfSrF2SKESAKrNg2BZ5auP
         msSDk4z31XbNvJg7Wai1OTshmW9c2sYMYYQLlQ1NxGK2YFwRHo4eHdHSkkdA2tqEMOm7
         yejg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=R1e6KnCFR1rzIeOLowBHM76WhuWR9uQco3Dt74BpyMA=;
        b=jzLp4NgLm+1FMdCkvC9Kse1C1OnZC8+CqzA9RoaGXxLjMVJ1vWdbgvyBHu1I61wfPx
         a6VgGXsBTCIukd6ppmbnKIzm71RiHbaOZ1++aPAlhzm+fFAUBapB7sEaIWOn3SjmKrev
         j9aGWlGZ7XgSarYJXAFg9NpDsuLEOm1RHHPI0+krBgfw87rszkfG/fl+AZoqfS+9BZym
         yXmWQMIfZqN3jed826tni36k0guBQVPmHE+NHG04nFoABob+ZbE834Bq5yVlRJBMQhe6
         a0B3r6odUtQLLeZVR6oo236WQowBsFv+SR9Ydoc2tK+UUJzg1Zrf95lgRVqoAUkpVfKG
         7GBw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=kelHxYjD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q12-20020a05620a0d8c00b006b62b7811e6si8937027qkl.716.2022.08.31.09.13.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 Aug 2022 09:13:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=kelHxYjD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:55656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oTQLZ-0002vl-Ec
	for alex.bennee@linaro.org; Wed, 31 Aug 2022 12:13:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <k.manaouil@gmail.com>)
 id 1oTPyz-0006Xz-9d
 for qemu-arm@nongnu.org; Wed, 31 Aug 2022 11:50:25 -0400
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332]:46030)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <k.manaouil@gmail.com>)
 id 1oTPyk-0003oQ-6R
 for qemu-arm@nongnu.org; Wed, 31 Aug 2022 11:50:23 -0400
Received: by mail-ot1-x332.google.com with SMTP id
 l5-20020a05683004a500b0063707ff8244so10516704otd.12
 for <qemu-arm@nongnu.org>; Wed, 31 Aug 2022 08:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc;
 bh=R1e6KnCFR1rzIeOLowBHM76WhuWR9uQco3Dt74BpyMA=;
 b=kelHxYjDaHWSzPk+l801rd7O5JsJ1DCTb3OFih1ExmYqhmMM3mB/1oHqdhaTY5iChF
 g8pZGsNAsit8LrxeI6La3c4XD9EmuAz0VhRU3wfuJLh+cdv84vsc1MNJJO2JN4M0XbO4
 /SjsdkyEIII+rM2Vb8NR5UjP5azlsFuca/vSPWET0nCda4H5osKC0XvepNB93OpwQ2aA
 UxpN37GIz3/jYFRsUixGP+l59DTf55pGiUsonh/GmW2G7D8CSZGBQjcWVpB1N9aNi/Vc
 XttYuSfGH76Qx/7FNcvnExhfJt4T0lZsefxj0gZTadcyfBjNU/OyRddK1xceE5Uppnes
 SSkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc;
 bh=R1e6KnCFR1rzIeOLowBHM76WhuWR9uQco3Dt74BpyMA=;
 b=ehZG+2WAAhqXWaNVAPOpKedcyYYWR8rDJpuZGLRB0kdAnB2dYCSmmcYY1JCFrZW41C
 /LbzcJjQHObgbyOdxl8WIbpa0MEPKUMUqMOKGlVY0BkIaAL2DUi4DJpmSlYh9UttYCz7
 yDx0ElohWeVCa6wvUbi9lbwa+Zt0y9cI6zDN7mGZNa+D3jeL1xzC4xjfo3Y0jzTxoxD5
 FA5hwQDssyaza3z2Mft8v1E11fWtlu2gEih3ouTs1I1H3GxfXndX6HhCm4r18MDULnKX
 CsYggz+xaW9kKF6Cwel0tV472HTL24+LznK2UK6mbzP8XJKP8PAswjOazG6y6kWmAgob
 DeMw==
X-Gm-Message-State: ACgBeo3Lh1QvM/e7HxyEuM+sSfzxag9yHPkcirVhRCsSSyjHU/o3Ys/6
 jyhg+LWwkbZv7Y7Vn6+Nfu8PHsQJHTUhwNHrzgpliTaaMEY=
X-Received: by 2002:a9d:134:0:b0:637:2db8:b211 with SMTP id
 49-20020a9d0134000000b006372db8b211mr10457393otu.106.1661961008423; Wed, 31
 Aug 2022 08:50:08 -0700 (PDT)
MIME-Version: 1.0
From: Karim Manaouil <k.manaouil@gmail.com>
Date: Wed, 31 Aug 2022 16:49:58 +0100
Message-ID: <CADsNLn3cZmZkSzmX6wiaujgpuBO3w+7s+QoUxTCZ3X4n1OEzkg@mail.gmail.com>
Subject: Can qemu-system-aarch64 boot a Linux kernel with 16K PAGE_SIZE?
To: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000089a7d605e78b733c"
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=k.manaouil@gmail.com; helo=mail-ot1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 31 Aug 2022 11:56:20 -0400
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
X-TUID: Rv7ShQHWrw0y

--00000000000089a7d605e78b733c
Content-Type: text/plain; charset="UTF-8"

Hi,

I compiled Linux v6-rc3 for aarch64 using 16K pages
(CONFIG_ARM64_64K_PAGES=y)
but it doesn't seem to boot with qemu-system-aarch64 (no logs appear.
However,
it boots fine with 4K and 64K pages).

I use the following command:

qemu-system-aarch64 \
       -machine virt \
       -cpu cortex-a72 \
       -smp 4 \
       -m 2G \
       -kernel $ARM_KERNEL \
       -append "root=/dev/vda rw console=ttyAMA0 earlyprintk=serial" \
       -hda $DISK_IMG
       -nographic

Then just a blank screen.

Thus, the question is, can qemu-system-aarch64 boot a Linux kernel compiled
with 16K pages?

Host: Debian 10 (Buster)
Host kernel: Linux v5.16.0
Qemu version: QEMU emulator version 3.1.0

Cheers
Karim

--00000000000089a7d605e78b733c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<br><br>I compiled Linux v6-rc3 for aarch64 using 16K p=
ages (CONFIG_ARM64_64K_PAGES=3Dy)<br>but it doesn&#39;t seem to boot with q=
emu-system-aarch64 (no logs appear. However,<br>it boots fine with 4K and 6=
4K pages).<br><br>I use the following command:<br><div><br></div><div>qemu-=
system-aarch64 \<br></div>=C2=A0 =C2=A0 =C2=A0=C2=A0 -machine virt \<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0-cpu cortex-a72 \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0-sm=
p 4 \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0-m 2G \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0-=
kernel $ARM_KERNEL \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0-append &quot;root=3D/de=
v/vda rw console=3DttyAMA0 earlyprintk=3Dserial&quot; \<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0-hda $DISK_IMG<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0-nographic<br><di=
v><br></div><div>Then just a blank screen.<br></div><div><br></div>Thus, th=
e question is, can qemu-system-aarch64 boot a Linux kernel compiled with 16=
K pages?<br><br>Host: Debian 10 (Buster)<br>Host kernel: Linux v5.16.0<br><=
div>Qemu version: QEMU emulator version 3.1.0</div><div><br></div><div>Chee=
rs</div><div>Karim<br></div></div>

--00000000000089a7d605e78b733c--
