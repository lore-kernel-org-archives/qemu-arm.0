Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp1088060lfp;
        Wed, 5 Feb 2020 23:05:06 -0800 (PST)
X-Google-Smtp-Source: APXvYqzY8drWdZfOdhgJbVFndmkTrOouUp4EGr9P6fygp0DpchxJZG72xHqHX/4c8My16TA38FI0
X-Received: by 2002:a05:6214:88c:: with SMTP id cz12mr1140339qvb.95.1580972706087;
        Wed, 05 Feb 2020 23:05:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580972706; cv=none;
        d=google.com; s=arc-20160816;
        b=WtGY+7iMVDl53XKQhBMql8pdlXOB/owmBDqATkEkaNnb/0+Afc1xGvXc0vYtb6bQum
         Fl2GlZNaSkz0V5RkdtWfspGUvTESko50d+Jl/yAUHMblwF3d8Bf3bSI9bUXtVpLXVhge
         MVoRc4c3DQ5dHpc5zyQHYE4BCG4HV/JqGRLmfp0tIUrK2CP1WIoOPSDUe0aZLFnnOong
         oiE6DvbfyKMU/zu7bqtDhcQ8wVABjaLRf7wJ1KAio0yc3hiXXU3QplYW7ZG+x7AvHqTO
         slUGqxiuWABhbGTAPQkZZmeh27xaLib8VMVzTlAkIbFYkpERuIkjp2tS8zUW0hjrF2nL
         JDwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=h672+PvYOg4F9GqkfTlAyYdpuih/rH914wY/nGyuogk=;
        b=Fk2jiGoLCSE6RBGlwmAzPe/hC/+Ik+kzQ2ecjFPXKdo3FhHydEUiTZCh1xrPgoRYKW
         dhbajT1BYEaxK/CaBTGiMoGYJX30kNdYUAhLaNurGT2tvp+9qHGDUjXJzuQjZJDpdHDc
         Gx5EgyWcR6hS0GBT8nVMvcAA8t1jsuRIEUMyTAvZy5QHH5Ja1cbOMFMb1wtuz5Rkegy3
         dK/QxWB+zvowdcKAf1LcNWVI+dCyoWo+Rk8RvMnwl0/wamGEw2SeyoNfhSirkoX+i/NI
         T6M8DLLEtYw1lmDgJMA7uOKI0cHpGa+gmkwkzQUhjb6fkAKiUgOB9Q8zgbR0ZMFmPrjb
         avvg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b="jq/HND09";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i65si1197395qke.190.2020.02.05.23.05.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Feb 2020 23:05:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b="jq/HND09";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:33130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1izbDl-0004oW-Dj
	for alex.bennee@linaro.org; Thu, 06 Feb 2020 02:05:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50032)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <joel.stan@gmail.com>) id 1izbDP-0004nz-UK
 for qemu-arm@nongnu.org; Thu, 06 Feb 2020 02:04:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <joel.stan@gmail.com>) id 1izbDN-0006zu-S5
 for qemu-arm@nongnu.org; Thu, 06 Feb 2020 02:04:42 -0500
Received: from mail-qk1-x742.google.com ([2607:f8b0:4864:20::742]:32907)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <joel.stan@gmail.com>)
 id 1izbDG-00066f-CR; Thu, 06 Feb 2020 02:04:35 -0500
Received: by mail-qk1-x742.google.com with SMTP id h4so4584335qkm.0;
 Wed, 05 Feb 2020 23:04:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=h672+PvYOg4F9GqkfTlAyYdpuih/rH914wY/nGyuogk=;
 b=jq/HND09rlub7v5VE0z/kEmhohKZ7Zbx+9C64fiKh/8UGEk8U3gMAOTkXE/+jF8ii9
 WTirQjCUn8/LLu3FyKwP4SYEmQjQnj6pfhiBmN+j2t8V4Xg9CTgaO5pxCDweekfJEyVE
 5NzYK1u6Slg8xcb1Xv/r+2qFloNcpdndi5rJM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=h672+PvYOg4F9GqkfTlAyYdpuih/rH914wY/nGyuogk=;
 b=qYJlfXIUcevBaGymcDBsNeIL/mVkPKzHWIeQk4hdLWQBJtpcIUjejiLCXIwowA/NYU
 3XWRzMH1J0z6kTso/BuvYbTAPCLCDldCVZ9oSZ1kxHFAknirwuCJhD/vC0Qh/l24YPmN
 lVpSVF4wDD6xhFJYaDCHXhqzSSOtiaLIXquXfL7k2a+uep9uKHl7RdG9z8k1yHdz0x1U
 Sjjtiq9Bppah0SQ9hqnqPiqsW5oMfCKE1bpGKQJO8xCFIWZbY6Ue2TxnXIQJ4hvALf5d
 +DwlPHyjyrmggRbWW6B4XmoiupfRSlfV6jZwuS+zKtVfPJPAiFXUu+mIXfZeKtHvFp1r
 c+YQ==
X-Gm-Message-State: APjAAAWH++HvBd/Vhc1UyYue/HWlT3SDNBwBDIBDERTk9GaBZkPxRbUc
 RA1S54wdzaVT2xECaw5xogdkPmoEdttLJ2oQ1Ck=
X-Received: by 2002:a37:dd8:: with SMTP id 207mr1266280qkn.292.1580972673487; 
 Wed, 05 Feb 2020 23:04:33 -0800 (PST)
MIME-Version: 1.0
References: <20200203180904.2727-1-linux@roeck-us.net>
 <20200203180904.2727-2-linux@roeck-us.net>
 <accf297f-0c54-7475-8817-c1014999a57d@kaod.org>
 <7fe70871-c0e3-4ff6-bfda-17b45aa50c5e@roeck-us.net>
 <22a96987-9548-1335-8b04-00167ed9491d@kaod.org>
 <20200205174345.GA7754@roeck-us.net>
In-Reply-To: <20200205174345.GA7754@roeck-us.net>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 6 Feb 2020 07:04:20 +0000
Message-ID: <CACPK8XesxroZii2-r-HTigW4-7Ahw4TQNG1r-YO2K09S7Ap9=Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] m25p80: Improve command handling for Jedec and
 unsupported commands
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::742
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, Andrew Jeffery <andrew@aj.id.au>,
 Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PoRVEo072kFs

On Wed, 5 Feb 2020 at 17:43, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Wed, Feb 05, 2020 at 11:08:07AM +0100, C=C3=A9dric Le Goater wrote:
> >
> > ok. we will need to model SFDP one day.
> >
> > Are you using the OpenBMC images or do you have your own ?
> >
>
> I am running images built from upstream/stable kernel branches.

I think C=C3=A9dric was wondering which flash images and therefore
filesystems you were using in your testing.

I had a poke around here but I couldn't work out where 'mtd32' came from:

https://github.com/groeck/linux-build-test/blob/master/rootfs/arm/run-qemu-=
arm.sh

Cheers,

Joel
