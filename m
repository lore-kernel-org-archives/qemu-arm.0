Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp4095157wrm;
        Mon, 7 Oct 2019 10:43:17 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwlugdM3uYX2bGsAyKgIdQuOfeH4rncLcoodgVLiWMzErvwyV7FRzS+WSmuk5Wyh+o57cb4
X-Received: by 2002:a37:7402:: with SMTP id p2mr24558625qkc.457.1570470197832;
        Mon, 07 Oct 2019 10:43:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570470197; cv=none;
        d=google.com; s=arc-20160816;
        b=0+RzpRy7TcAFyjM4HMvVQutvcA/vH2O2F2LbSyqR2h+n3eFVygcs89skiYYenkuKHz
         c+zYgk1MMqT0kkRkU9ytz3eNgmyevzP+XO6o4+OHkN9UHKHXixsD682iA/FBBbaI/d5W
         Y8pTyYlEHBbUUu2iIMyA42uXOJ1D/bkdV5S2iyjVTcTP43ca/GOv84s2g/uL4z8zKAD9
         SWxxA/jSsjGyLljOJmcJsj/1ptweiBB9/hYI4qz7ymOWG1wbF1TWxVd7HjM1FRGOrELy
         KBR09CV9dDcWIdM75DC12pH1S+ttSlymw1jCsqUEZQZIQsAdg81uzvykOPFpdfwIwf91
         LcCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:to:from:date;
        bh=UPcpTQSi7VXhqtxvLfOXbN2IwD881LYjHFdrb1IRVbE=;
        b=p1ZEM8qNA29flG2YUCr+ZO1CLWrONFdW96L5yuY1iNbHJahoOCneadhCCk/7hx2rv8
         NH5zhDYX63Q27dQ/LMrk2EikF8pRd1TrtpvUjXpImeAkdLZss+1p6r1iWrRnczjYYEWc
         qiVKPukploHmLN7+uhan+HNVfco67temv3Vt3OYRmIqNR5GuKCp0cK6lMUGotsLFi0Jx
         w5R8iME46M79vuSDGMuBlTUsKq+AZd2HQxKcGCmPj1l4OFMpuls5Ryk02ccagq0HWj8Z
         bE9YHPxn8GNzJGpwLBHGu7YMmoAB0S3RL9huW0vM453gCnJtKCFStVdWGvUPNi6c2ym+
         9Avg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 184si14608767qkd.245.2019.10.07.10.43.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Oct 2019 10:43:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from localhost ([::1]:48250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iHX2T-0006eU-8O
	for alex.bennee@linaro.org; Mon, 07 Oct 2019 13:43:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42977)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <k.kozlowski.k@gmail.com>) id 1iHX2H-0006c4-Gs
 for qemu-arm@nongnu.org; Mon, 07 Oct 2019 13:43:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <k.kozlowski.k@gmail.com>) id 1iHX2G-0004ct-0A
 for qemu-arm@nongnu.org; Mon, 07 Oct 2019 13:43:05 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:37428)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <k.kozlowski.k@gmail.com>)
 id 1iHX2D-0004aP-40; Mon, 07 Oct 2019 13:43:01 -0400
Received: by mail-wm1-f67.google.com with SMTP id f22so377196wmc.2;
 Mon, 07 Oct 2019 10:43:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=UPcpTQSi7VXhqtxvLfOXbN2IwD881LYjHFdrb1IRVbE=;
 b=ugys95Gk6K4EH1TBsVyPoLodHNCN6GQuiFQVcR0Ar2l6PDCN+WlP1Bp1fMC8sIezQS
 129D+UP6smYuyOVa3IPjVMBqPODG7le+ys3NgL7GqlLbzIBq+bUh+LZZtRpVQBexQVMN
 TGr38e2658cMG478mhAnncNS0MfTGKKPQ2cALPE6OsmOdUMg7sNqxVuBM8eMNBzvtrPq
 lxbmwftXSaACq8m5QcOX0dpY1oxSIfvkFNL3F2WlacQXsv7MsBDvGfJ09qrg3MchXX7H
 7ydKRKy32e5g9EeedNsY1QPH6nEhgLsqytyj6LJMPM4ae1uvXFQtEHFAs1dRfxYRRrII
 PtPw==
X-Gm-Message-State: APjAAAXqpu1CT7UuyLgK8J/gSB/V18q0+msecz868d5JGPRzStILS5ow
 A8WD72arYr6c19+p1BRYcD4=
X-Received: by 2002:a1c:3182:: with SMTP id x124mr377956wmx.168.1570470179609; 
 Mon, 07 Oct 2019 10:42:59 -0700 (PDT)
Received: from kozik-lap ([194.230.155.145])
 by smtp.googlemail.com with ESMTPSA id s10sm164130wmf.48.2019.10.07.10.42.57
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 07 Oct 2019 10:42:58 -0700 (PDT)
Date: Mon, 7 Oct 2019 19:42:56 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH 0/5] hw/arm/exynos4210: Add acceptance tests to the
 SMDKC210 board
Message-ID: <20191007174256.GA9803@kozik-lap>
References: <20191005154748.21718-1-f4bug@amsat.org> <20191007091024.GC541@pi3>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191007091024.GC541@pi3>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.67
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
Cc: =?utf-8?B?RnLDqWTDqXJpYw==?= Basse <contact@fredericb.info>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Evgeny Voevodin <e.voevodin@samsung.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-devel@nongnu.org,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org,
 Dmitry Solodkiy <d.solodkiy@samsung.com>, Cleber Rosa <crosa@redhat.com>,
 Maksim Kozlov <m.kozlov@samsung.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Qp1CJ3AAUE1l

On Mon, Oct 07, 2019 at 11:10:24AM +0200, Krzysztof Kozlowski wrote:
> On Sat, Oct 05, 2019 at 05:47:43PM +0200, Philippe Mathieu-Daud=C3=A9 wro=
te:
> > Hi all,
> >=20
> > Yesterday Peter Maydell asked on IRC if I had any working Exynos4
> > image. I looked at some old backuped notes and could boot Guenter
> > initrd with BusyBox.
> > I'll use this cover letter to share my notes, they might help to
> > have this board fully usable again.
> >=20
> > This board is listed as "Odd Fixes". Since we have it covered, I
> > thought it was worthwhile to have it covered by tests to avoid
> > more regressions.
> >=20
> > Fr=C3=A9d=C3=A9ric Basse used this board last year:
> > https://fredericb.info/2018/03/emulating-exynos-4210-bootrom-in-qemu.ht=
ml
> >=20
> > I'll have a look a these particular commits he added:
> >=20
> > - https://github.com/frederic/qemu-exynos-bootrom/commit/9be5c9f2253dbc=
04ee
> >=20
> >    sd: add sd clock support to SDHC_CLKCON
> >=20
> > - https://github.com/frederic/qemu-exynos-bootrom/commit/6f045949ee2fde=
c624
> >=20
> >    sd: always reply to ACMD41 (SD_APP_OP_COND)
> >=20
> > Guenter also carries on this patch:
> >=20
> > - https://github.com/groeck/qemu/commit/0a80543cc910d
> >=20
> >   hw/timer/exynos4210_mct: Initialize timer before starting it
> >=20
> >   When booting a recent Linux kernel, the qemu message "Timer with peri=
od
> >   zero, disabling" is seen, apparently because a timer is started before
> >   being initialized.  Fix the problem by initializing the offending tim=
er
> >   before starting it.
> >=20
> > It might also be interesting to use Krzysztof's initramfs image:
> > https://github.com/krzk/tools/blob/master/run-qemu.sh#L29
>=20
> I haven't been working on QEMU since 2 years but I can try to find that
> initramfs image.
>=20
> The recent initramfs I create, is for testing kernel under my Buildbot.
> I take standard initramfs from Arch ARM and then I add some more stuff:
> Source/instruction is here:
> https://github.com/krzk/tools/tree/master/buildbot/initramfs
> and the script making it for each boot is here:
> https://github.com/krzk/tools/blob/master/buildbot/build-slave-deploy.sh#=
L50
> https://github.com/krzk/tools/blob/master/pi/make-initramfs.sh
>

I checked my initramfs. I created it simply from a running Arch ARM
    instance with `fakeroot mkinitcpio -g file.cpio.gz`

You could automatize the process by:
1. Downloading and extracting
   http://os.archlinuxarm.org/os/ArchLinuxARM-odroid-latest.tar.gz,
2. Running mkinitcpio or creating initramfs manually (e.g. my script
   above).

Best regards,
Krzysztof
