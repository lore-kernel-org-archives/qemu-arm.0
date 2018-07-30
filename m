Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp4026772wru;
        Mon, 30 Jul 2018 10:30:23 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfMJH49s1kA/e1iMf0M1S6Oiv5Bn4QI166wam1U18H9IPpknE3wM2SjsM5IjTMHCeNY+FRv
X-Received: by 2002:a37:1348:: with SMTP id d69-v6mr15946079qkh.253.1532971823694;
        Mon, 30 Jul 2018 10:30:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532971823; cv=none;
        d=google.com; s=arc-20160816;
        b=We8iLWfi0MPhD082tBg9Xos886KWZuhMWjpeAgbsKADpaPjWczgwtuguNbXo0UIOS2
         kg/OxGARWsDsJDVekgtpXmurcwPmd9/C/5PMOx6yVldhUc7YncLKrzXOQEwnm2XBBrke
         6dQmHxZ7fibwEA7aKhBEVCdW62cOQRZ8Apn+h7jtDbCgV92LTC66+3K6dJ2pMDEfzPie
         rFCkqs/gLbG+7h3boFSR8rLrnBJHN5E92mjxxD9jvR1sq150W/3fa/kLzjaFUIRfL0pw
         mD/Msp+B1hC1oB0yMmlqHqh+nsYT0qFAzHX9Jco2iHHKF0iwu9eXRyw60kmK22sNgEBv
         0skA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=bAz5M7MDh8k5p0jFjvKkr/RHeh9OAAOsi1DI07DBI2Y=;
        b=choP8f9PLKV7dAvdQT42DVcrrOsrt+UWKZ7TXObWM0R+bX2wdViq6Rnvy+H7lNyYqH
         lUF+o0GZwdvoDCL8HIQATuKPPvk2GdTOe7Wdc8QdXZ8azX0wrLVyzDRTFPdJ2oAcCT5n
         4qomTbAgGQQMvOS/Z+EuvRS1Egk1M8wISmmcuoisM2yOdYNWBKCwM5evCWZITcojCy5u
         LL27chCBjlhXBM65IWAx3gjgvQkfYLvBemn/F3eLtVivkAWRbGUmzAwuzKR3g1doDGtl
         D8IgeUEiQ9BAd87At6XecshyzbUK6E8SKlqcYJ5WLmzFs6+QYOH2ABD1A53FOG01IC2E
         NxJg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aA1ysKzo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p5-v6si170873qkf.174.2018.07.30.10.30.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 30 Jul 2018 10:30:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aA1ysKzo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54055 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fkBzz-0007hu-3l
	for alex.bennee@linaro.org; Mon, 30 Jul 2018 13:30:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57646)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fkBzG-0006ja-2j
	for qemu-arm@nongnu.org; Mon, 30 Jul 2018 13:29:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fkBzF-0005NY-1e
	for qemu-arm@nongnu.org; Mon, 30 Jul 2018 13:29:38 -0400
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:39139)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fkBzE-0005NJ-RJ
	for qemu-arm@nongnu.org; Mon, 30 Jul 2018 13:29:36 -0400
Received: by mail-oi0-x241.google.com with SMTP id d189-v6so22714980oib.6
	for <qemu-arm@nongnu.org>; Mon, 30 Jul 2018 10:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=bAz5M7MDh8k5p0jFjvKkr/RHeh9OAAOsi1DI07DBI2Y=;
	b=aA1ysKzobiLFJ77HUQdLETzSOEjVJVjL4fwKCKC/zFi4y6Uo9RcbV3+z44OPd6gW/y
	ZBpkIcmPAeytRSpdeV7tbMVjmwUyxtRVjFVeWs0jD6n8zZqqIPMu5i54llNbUuuAUI9b
	qQKFPn2GYbhneu+gYP0bTgpgmUU42JOTg0rKw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=bAz5M7MDh8k5p0jFjvKkr/RHeh9OAAOsi1DI07DBI2Y=;
	b=J23+YXDdT+nDjGCnDL/80t4AWFs8cpsgQKfomlwLvK3CJnHiy9L6y2MvIIGankyyIM
	w3X1Sx0YtJjMoHK51+vE3NZbw/MZXbaMGqBE1acVcFgsPlid5j8ISsSN/+oAd6Rc0cXc
	L9QN2HcabqBMy7UL9RnfKtYWWEQpThs9rWsEt4DIm4z2CYMZKuEdTkDlvECnILFdgU6y
	w+21QidPLN7Fmaa8t7V5eutmtOF8P8tO+1pf7wCkT2cvIiFW6HNcqfnqBe9o8Jt4hf2P
	U5sGAhrPIhHelkj+TkI+SBk0/NQyC5Lv4XkNfan995MNaypti5+7AjpOISCefzkyjjgy
	B1Gw==
X-Gm-Message-State: AOUpUlFBuAorsOvStx2XKSFjMI06fP9LaVUCGZdnyLIymi0bicqGl8zA
	4xBUyWv2poxZfU//Qj+lyrYHFDV+YP3LExNxocqfig==
X-Received: by 2002:aca:4a49:: with SMTP id
	x70-v6mr16967349oia.11.1532971776034; 
	Mon, 30 Jul 2018 10:29:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Mon, 30 Jul 2018 10:29:15
	-0700 (PDT)
In-Reply-To: <20180725085944.11856-3-stefanha@redhat.com>
References: <20180725085944.11856-1-stefanha@redhat.com>
	<20180725085944.11856-3-stefanha@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 30 Jul 2018 18:29:15 +0100
Message-ID: <CAFEAcA-i3PepdAJzDViGHjgDPWTTLiqmGMszNeT41+MmjK-viA@mail.gmail.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-arm] [PATCH v3 2/7] hw/arm: rename TYPE_ARMV7M to
 TYPE_ARM_M_PROFILE
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Jim Mussared <jim@groklearning.com>,
	=?UTF-8?Q?Steffen_G=C3=B6rtz?= <mail@steffen-goertz.de>,
	Su Hang <suhang16@mails.ucas.ac.cn>, Liviu Ionescu <ilg@livius.net>,
	Alistair Francis <alistair@alistair23.me>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Steffen Gortz <qemu.ml@steffen-goertz.de>,
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
	Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yVD7Tc06meQ7

On 25 July 2018 at 09:59, Stefan Hajnoczi <stefanha@redhat.com> wrote:
> The TYPE_ARMV7M class is really a container for an ARM M Profile CPU,
> NVIC, and related pieces.  It can also be used for ARMv6-M and ARMv8-M.
> Rename the class since it is not exclusive to ARMv7-M.
>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  hw/arm/Makefile.objs                         |   1 -
>  include/hw/arm/{armv7m.h => arm-m-profile.h} |  37 ++-
>  include/hw/arm/iotkit.h                      |   4 +-
>  include/hw/arm/msf2-soc.h                    |   4 +-
>  include/hw/arm/stm32f205_soc.h               |   4 +-
>  hw/arm/arm-m-profile.c                       | 271 +++++++++++++++++
>  hw/arm/armv7m.c                              | 290 -------------------
>  hw/arm/iotkit.c                              |   2 +-
>  hw/arm/mps2-tz.c                             |   1 -
>  hw/arm/mps2.c                                |   6 +-
>  hw/arm/msf2-soc.c                            |   2 +-
>  hw/arm/stellaris.c                           |   4 +-
>  hw/arm/stm32f205_soc.c                       |   2 +-
>  13 files changed, 313 insertions(+), 315 deletions(-)
>  rename include/hw/arm/{armv7m.h => arm-m-profile.h} (65%)
>  delete mode 100644 hw/arm/armv7m.c

It would be nice if this rename showed up in the patch as
a rename, rather than a "delete everything and have a new one"...
Reviewing this is going to be painful enough to make me wonder
whether it really matters that we call this "m-profile" rather
than "v7m" (we have a lot of places that use 'v7m' as a somewhat
inaccurate name for "M profile" anyway, including a bunch
of new code I wrote that's really v8m related.)

thanks
-- PMM
