Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp4918552lfp;
        Mon, 17 Feb 2020 02:25:02 -0800 (PST)
X-Google-Smtp-Source: APXvYqxRamUF6SJK/N63rFPwqCv28wxQDykTez0EB/DOdWrwAHUcvCdy0/ECJhZ0OTwI2V+030SY
X-Received: by 2002:a0c:ee91:: with SMTP id u17mr11508653qvr.22.1581935102773;
        Mon, 17 Feb 2020 02:25:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581935102; cv=none;
        d=google.com; s=arc-20160816;
        b=Z4NgZis5Mu6u6ZqW6sZFaucZQkwkzp21tbV4W4fdE8zJV9AfyLr+P1yE9TFY0nyHbV
         bNJyrNFQbdRE6TQ0m0/4sGreqyHwG/uZKNpFCK7G7j0+J5YRdjwwXhaWdMwBUsP5im0y
         XznMl+FHNToyG4CaTYan5APUGmUBumRoMhorjWikjya6uSrgEBFNTT/sxGGqvee+ui79
         WpgouaLcZRQHlUl+N/sILBnyj0NTdizodAcG898Iy47bTggDGgx5LxCIS76TYe6L7xGR
         CbL2GTgK7T39KT04CgY/Tl66JFsP5vTkELrC5LGWKqeoM33Laa3eR7Blwsn+/owGc8Dw
         K73g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=RMzYn/RKf0PSTpkNpMCiA6qbaK1zSkfbqyqrqgmljZc=;
        b=hVtwhAOpYeJGIyj6gk1pODYhQkpPRlSf0lPmTTONRrQhtNse08ZC0hwUiRnI3cYB43
         ErzHVMbj5/fZLGyCM4PQhR9IgFyFumHppoX9uE2a7BhSTjiFs3JSYVJ09ZjW8VuVyO2q
         zgDvDfENqUM/WpmCJoY1cUtfPXgr4eKOF3MMhJfew/tc5hiOqA/Zcq5knSK4epHOvevx
         qU8/DYvWBrffwK5Zy69M5KyCPs+SGwlyuSRwAulFwd6y60Dr6QySnfyDiTS+oUQCL5yO
         pxxJWtJXOz25eS3FZKvmvh915KNy7K9JHIYpcBo5HJJvAn8jkwVbRDbqDU1denAatLpd
         s6OQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=wjUrSAHm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dy9si64348qvb.63.2020.02.17.02.25.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Feb 2020 02:25:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=wjUrSAHm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j3daI-0002hy-5S
	for alex.bennee@linaro.org; Mon, 17 Feb 2020 05:25:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59505)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j3da9-0002cO-7N
 for qemu-arm@nongnu.org; Mon, 17 Feb 2020 05:24:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j3da8-0000yZ-8C
 for qemu-arm@nongnu.org; Mon, 17 Feb 2020 05:24:53 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:37120)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j3da8-0000y1-3h
 for qemu-arm@nongnu.org; Mon, 17 Feb 2020 05:24:52 -0500
Received: by mail-ot1-x344.google.com with SMTP id l2so9389235otp.4
 for <qemu-arm@nongnu.org>; Mon, 17 Feb 2020 02:24:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=RMzYn/RKf0PSTpkNpMCiA6qbaK1zSkfbqyqrqgmljZc=;
 b=wjUrSAHmVZJkvMebx6bTjcECp3rj11XnCUy1OlNt1IMrtBvEvit5uFjxWKEwE2BH1B
 pb0pxFTFlosofy+22pm/vDWAZWZchXjc0D6fzCUELcuT4ubBtyZOLRCSgZ/6FPaOwH4A
 pWH+7pW/QN0pmTExaSJUOOjNMHgooVYGDUAp2GalICI9acq//dfFQdOOW0mAZwp5/OYE
 zPCIofjjVu7L45qwo/WCCdNsOSd/uXg6EMwxqYlJwxW3rktPpwl0nxaz5+OeO9XetB+9
 Kci/ZYNnf6IaWBCmoIR78CryPFoN+MIvFArVoCCROKoM3DfUsw2ijdFZYq8LRBd2ugpt
 6EfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=RMzYn/RKf0PSTpkNpMCiA6qbaK1zSkfbqyqrqgmljZc=;
 b=Fow4ApRb/bFxKvZ7TXhZ6Yr1d1L+dHlw0t+q9J2rsS3AgYHip8X4z28ztXBqdSaNUg
 qoaSveLAGrr1gBxLnMhHi59+StjymwOARNCBzLqdz8CpP/0iCz1Y7AJfuwW3oTzV9pU2
 oLl+qmOlOxIGStf94ywfzU8SzgNRR/UW/C+4T7n3/I+/A/1lUGUyXC9ZiyC89JSFH4JL
 ldrVjLApBjW8O7ln1ALDN/YhfaFQHav2sn2z0QpFkWRmNN4+xvELZZXU1xxMI6aKAMcU
 g/Ns+hbv17RXmBME7vjAU/H8lkfmU1gRNtrNzwSMDbVymN/6Y8FuZAXvo2ITH6tKdtal
 VG1A==
X-Gm-Message-State: APjAAAWodGLVQ5cygMh3MTv9VagvsbJI3wB7JZwdhcpTsIcCeqEaTOG9
 07j3UQcKUtcSSpI8L4cfavlObxV0N0ucglYO63Qeaw==
X-Received: by 2002:a05:6830:1184:: with SMTP id
 u4mr11117605otq.221.1581935091103; 
 Mon, 17 Feb 2020 02:24:51 -0800 (PST)
MIME-Version: 1.0
References: <20200121013302.43839-1-joel@jms.id.au>
 <6ac783d8-84c0-2200-9c7b-964f8dc56da9@kaod.org>
In-Reply-To: <6ac783d8-84c0-2200-9c7b-964f8dc56da9@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 17 Feb 2020 10:24:40 +0000
Message-ID: <CAFEAcA_3VGA67HhrTpyeEpq=va7RqLh=sSxZ_KvAjYCWQxUxCQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] aspeed/scu: Implement chip id register
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
 Joel Stanley <joel@jms.id.au>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UNCfeTTjwB3+

On Mon, 17 Feb 2020 at 09:29, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> On 1/21/20 2:33 AM, Joel Stanley wrote:
> > This implements the chip id register in the SCU for the ast2500 and
> > ast2600. The first patch is a cleanup to separate out ast2400 and
> > ast2500 functionality.
> >
> > Joel Stanley (2):
> >   aspeed/scu: Create separate write callbacks
> >   aspeed/scu: Implement chip ID register
> >
> >  hw/misc/aspeed_scu.c | 93 +++++++++++++++++++++++++++++++++-----------
> >  1 file changed, 70 insertions(+), 23 deletions(-)
> >
>
> Hello Peter,
>
> I see you have merged patches more recent than this series. Do you
> plan to take them later on ? They apply correctly on mainline.

Sorry, these didn't get onto my to-review queue for some reason;
I've just put them into target-arm.next.

thanks
-- PMM
