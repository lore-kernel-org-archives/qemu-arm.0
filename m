Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp1907486lfp;
        Thu, 30 Jan 2020 05:44:07 -0800 (PST)
X-Google-Smtp-Source: APXvYqyAJ8suJ3JhGdvRdiTY5AE1GyGem46Ab1VGbmEgSKmLgzHoTgXX2opFEoDS419gKe/XCoVU
X-Received: by 2002:a0c:e4c1:: with SMTP id g1mr4548064qvm.45.1580391846873;
        Thu, 30 Jan 2020 05:44:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580391846; cv=none;
        d=google.com; s=arc-20160816;
        b=t14RM2ZhFt86jlrEdN7pfQr3WbqFHOz3WBFAOu3NZQ1M4O9375VhdxUOApiLyZdG/H
         Wyf65Bf3FfYaKQIZokc9kJNb1//tA0Go85tDp2caT3C3rxxO/SyFNeXpk5zk9ATJrazg
         Vk/vpNR1ALQas5CPYFdnnIXJmiXPDSwtAoTsK/fyM/xoW9cDUL3UUa2W5twuE6NGIYNn
         xEmph5ZAemX0qEOnvYq1tZOKvfzeNP9lFlouPwV0EfwMVUVLovCc43LkV8t6XVRwx9Ux
         9OAEQH7xwrBUL0cl5WqnwCWN+shoRozmYmAkdLXOSUziMN21kXLdTdy6MgNePM+ZyTIz
         UuMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=OkXZ5mBnjCBuyBuOnpbdspAfHsDoISRmIcMli/2QOx0=;
        b=kVMN4CoGOXaqAYp6tUvySuUwpmiEEKq13f97CBZHvfE3qsOGHRcIm/q5NWFEImUggb
         GaluvZIeUYr2G6VshM1ApDofWuBD7iIUOiCCKZABQtJv9U8F8GHYuk9xrBdyLX5viK1I
         JcRUxGQ5BrXisdXFXh8b0UtAGC/VaMkeYuofyRUiNDm38tgl54GSSIbzG+LmuwGXJgmX
         +tVv6fA0xnj4lW1TgU+p/0coRqxK3Jw0K/37RcJejXTSNbmVEYE58wwXediPz1xQ+Qav
         ASPLsw7FHi2apqy+g0I1VVSvbCT0+tQMItayUeTXulrhDJM3ewmzCGqFN5OZ714zCZ5h
         Gg5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qXMfA3Wp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p14si3793282qke.264.2020.01.30.05.44.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Jan 2020 05:44:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qXMfA3Wp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ixA74-0008QC-8N
	for alex.bennee@linaro.org; Thu, 30 Jan 2020 08:44:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49962)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1ixA6n-0008OV-7L
 for qemu-arm@nongnu.org; Thu, 30 Jan 2020 08:43:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1ixA6l-0007oN-TX
 for qemu-arm@nongnu.org; Thu, 30 Jan 2020 08:43:49 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:41119)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1ixA6l-0007mS-NR
 for qemu-arm@nongnu.org; Thu, 30 Jan 2020 08:43:47 -0500
Received: by mail-oi1-x243.google.com with SMTP id i1so3493457oie.8
 for <qemu-arm@nongnu.org>; Thu, 30 Jan 2020 05:43:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=OkXZ5mBnjCBuyBuOnpbdspAfHsDoISRmIcMli/2QOx0=;
 b=qXMfA3Wp7sjcxcCi/q3pxYPbEG6nqjEuIuFBNPIKKMSBCPfK6U4kwgf82JxhUdtGpS
 52jjpgyY2Jomh2jxk570ldcJohdIpcaarEhFdrScM4OztonoQ4IVOVFAZS9xNAwZ9bz+
 WRBftE22ncG0DVCci71T1+RFlfXY0J2jPV2SXrg4+MXy0TVu2gdOiHVlluE/UqKiNPB6
 k/sqLxn0zEEB+fhZCPmrsP5StuHAqYb+9oXCVQokU7bxfD3vea5hFVzYc+RMi90AtaM1
 ixWJWCIjBzfIZb9Iz3geSLO5hjpjWj5rkcpzzDI6TF1aPvtc9fegnjf01EBcQvvrtpOb
 ESUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=OkXZ5mBnjCBuyBuOnpbdspAfHsDoISRmIcMli/2QOx0=;
 b=efyuRA9JVNzsE+m83aCYOVCyOj/0qWIVVJhpG7iT/S41rvF2M6DtOvM9ot1PjkNPLi
 OHD3WeiwDdbiNpAQbfbjiFV/2sVax3K7wv8xXoh2wy9GOGxY59Dw1wIvIbLh77Zy/l92
 GH83RKZBcDJFdkeLuOFS1K5TF2KapN8Mli6qs70XN6gLEY8Vm2/ejvROe4MU+KDLUdT1
 FqoN66Ndx9HM/NgVcDtMNXFqr6Ikm/x5U/rXr0lbaxcxtsuCZRSbeedbxxGGfKwwblFA
 fJb9mDIpsGI8j0jfW+bV6cZJwogcOsaLEnyEZJhZczGfpXiN7uEIXGNEMVkAbteQpqKk
 hrRQ==
X-Gm-Message-State: APjAAAU3e1lfeFOBlINi9ZeAg1cuFQ6qNqzZnC2+S+aOm9hVC7vt5wiO
 fL6Ec2UCp2DBnqIY8Uh2nIVOmeTuUuEs+djZcyIi5g==
X-Received: by 2002:aca:b2c5:: with SMTP id b188mr2881404oif.163.1580391826827; 
 Thu, 30 Jan 2020 05:43:46 -0800 (PST)
MIME-Version: 1.0
References: <20200120235159.18510-1-f4bug@amsat.org>
 <773d1201-17fc-40b1-fa9a-06ed03732e89@redhat.com>
In-Reply-To: <773d1201-17fc-40b1-fa9a-06ed03732e89@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 Jan 2020 13:43:35 +0000
Message-ID: <CAFEAcA9+_Ok=CbvfBK5oOSPK04FJQi=ZCX7sjFeDwJ0erH1+Cg@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] hw/arm/raspi: Run U-Boot on the raspi machines
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Laurent Bonnans <laurent.bonnans@here.com>,
 Cheng Xiang <ext-cheng.xiang@here.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YiVYStqOA1VY

On Tue, 28 Jan 2020 at 06:53, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> Hi Peter,
>
> (Cc'ed Wainer from the Python part).
>
> On 1/21/20 12:51 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> > Following Laurent report:
> > https://www.mail-archive.com/qemu-devel@nongnu.org/msg639950.html
> >
> > The SYS_timer is already merged, see:
> > https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3Dd05be883fc
> > "hw/timer/bcm2835: Add the BCM2835 SYS_timer"
> >
> > The first patch should fix Laurent other issue.
> > Then few python patches are require to break into U-Boot console,
> > and the last patches add U-Boot tests for Raspi2 and Raspi3.
> >
> > Laurent, if you successfully test U-Boot with this patchset again,
> > do you mind replying with a "Tested-by:" tag?
> >
> > Regards,
> >
> > Phil.
> >
> > Since v3:
> > - rewrote '-smp' fix.
> > - tests use Debian 'trustable' u-boot.elf
> >
> > previous feedbacks from Peter on v3:
> > https://www.mail-archive.com/qemu-devel@nongnu.org/msg655415.html
> >
> > v3: https://www.mail-archive.com/qemu-devel@nongnu.org/msg653807.html
> > Supersedes: <20191019234715.25750-1-f4bug@amsat.org>
> >
> > Philippe Mathieu-Daud=C3=A9 (7):
> >    hw/arm/raspi: Remove obsolete use of -smp to set the soc 'enabled-cp=
us'
>
> While the first patch is reviewed by Alistair, the rest (acceptance
> tests) still requires an eye from Cleber/Eduardo.
>
> Can you queue the first patch via your qemu-arm tree?

OK, I've queued patch 1 (and dropped the rest from my
to-review queue on the assumption that somebody else will
pick them up and/or you'll send a respin at some point).

-- PMM
