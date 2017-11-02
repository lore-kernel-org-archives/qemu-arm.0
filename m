Received: by 10.223.161.27 with SMTP id o27csp2053829wro;
        Thu, 2 Nov 2017 05:53:34 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+SiYGXZlaLcb6hWUDejKDDqF38WPPRBB4r9/bOYOmrK1XQ6Hs8gxAugjzmuTY/VEd2Ja2n9
X-Received: by 10.37.80.2 with SMTP id e2mr2142835ybb.449.1509627214881;
        Thu, 02 Nov 2017 05:53:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1509627214; cv=none;
        d=google.com; s=arc-20160816;
        b=YS0Ke//2EWoLiEVx6PtEloivhGubuXotLZU7MZkvKdjedNqvFOGlOdQpYG7FjZjoS7
         z+7FBgSQhrgwEXhm7I+761YjgZZevU83BpBoH1PAYfuyS1rKbbjx/zrfe3arKrY3J3xa
         4u8mvUaYWOkepQpAr/FGUE+l/XP7heHaVae7Uvg/D2wKm/ARAzAUcb0d5MDPL1QB3r/2
         rDNBk2GDkRvgxVJQAvCffVzZ3hIzQ8WEy2aIIM2erJU0xMUiWghw8Gb40Ea8YM5uONQR
         CHMx9uM6N6G2gKH/Bzl/hAyyntFMKuw9UDvGLJ7EEeG/OYA6Ho8uSvaDrLbbezdoY3GB
         wGSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=d2XUgTMXsZ2/oZ2TvsIh7yItjTTuq4TZHua/jBW3lmY=;
        b=DWmRH3Yrdh7ms+31BFgFDbJJnj4e68p7e7SJxsz2Iy6Dzgj6NclckaH0YawV2PvQQZ
         zLGROlOGsnZwUS3nQRgYQ9Jy75l5hHm/bSS65K89FT8YHpvTOqrXF2hjM44qeWZHKx8H
         IAeGlR9hnTmb9jg+bH2ukSnNAtZfmIXZuUqvkMKYhufdz+hTSq4RDah3nMz3/Xg7z4CB
         YeAT+8cGR4XS9YlSY8Bf976JalyE/KdjJmKpvhK4ietQRcNZIYF/CBvQv5T8e7bT2Gl4
         BoM/adOpVIxlfSsnkSkB+mSBPhgN0DboIHsKbtS5NTf0IjO55Q0pkYJMK4P/pCLUtyf7
         n3Mg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jQEFUbL7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u9si714339ybu.739.2017.11.02.05.53.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 02 Nov 2017 05:53:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jQEFUbL7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60227 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eAF02-000256-CK
	for alex.bennee@linaro.org; Thu, 02 Nov 2017 08:53:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44460)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eAEzt-00024A-4p
	for qemu-arm@nongnu.org; Thu, 02 Nov 2017 08:53:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eAEzs-0007nr-8N
	for qemu-arm@nongnu.org; Thu, 02 Nov 2017 08:53:25 -0400
Received: from mail-wm0-x22e.google.com ([2a00:1450:400c:c09::22e]:48801)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eAEzs-0007mx-2h
	for qemu-arm@nongnu.org; Thu, 02 Nov 2017 08:53:24 -0400
Received: by mail-wm0-x22e.google.com with SMTP id p75so10886748wmg.3
	for <qemu-arm@nongnu.org>; Thu, 02 Nov 2017 05:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=d2XUgTMXsZ2/oZ2TvsIh7yItjTTuq4TZHua/jBW3lmY=;
	b=jQEFUbL7VVvLzO2d0GbPrVXqGJYlXULRey1EptQncyJnkDPLWI/X9UxxVhBnc+M8/q
	B5hCcYyUjlDmZL0RCwmlRADbPhdyGJoASELYOdPCo6ntrBC4i8kmdaxr4Z2+9lDupgZk
	wGFoPHhJ6Y1XGWqDj6yDTJZ8Jjp26RzYEGaE8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=d2XUgTMXsZ2/oZ2TvsIh7yItjTTuq4TZHua/jBW3lmY=;
	b=Eh3Ypa3rnVniFHa2CaYoZoHpc6K/IdcA1aFSFEUe8Qd8/GTSo8guyHihGtZcVLpFMz
	VQNad0PhujApgSVpFaTJdZwOzhRi5siy7XC6HgjN+sXO5OO7wY1/1o2KKJ5e3DqwaZXb
	wPTQhdpDvGQ3hdBLixdtLTT8taDTD4Od5eODEF8dp9YNdQDAGwjfq44j7UVbQ76tRYbn
	VP1fDQbAn6F2ZbUpGVRIG3pS7Etw8EYOGETzYlhOq7bFH7y1gUgu/2qbTgNtPBO42ptQ
	mUGV7GN3/kr29Kl1pLHQErglpOpss+E/CNnBiAxgAJG96QmAdtLlkSPHXpVJU2MPWdpe
	CmMQ==
X-Gm-Message-State: AMCzsaUm9ETZgr/TKlU54MOm8SdFKOYiMPi+sySxPKb7SZmzmbFj7VaT
	nr560pIUTS+uchLTebrB24x/uki6pZq/4tt50wgkUw==
X-Received: by 10.28.46.136 with SMTP id u130mr1427546wmu.127.1509627202756;
	Thu, 02 Nov 2017 05:53:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.161.5 with HTTP; Thu, 2 Nov 2017 05:53:02 -0700 (PDT)
In-Reply-To: <1508772937-21054-2-git-send-email-eric.auger@redhat.com>
References: <1508772937-21054-1-git-send-email-eric.auger@redhat.com>
	<1508772937-21054-2-git-send-email-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 2 Nov 2017 12:53:02 +0000
Message-ID: <CAFEAcA81ogq6py71ejK7JD52A8LrQz1v92M1HZPCfPVBZy1vww@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::22e
Subject: Re: [Qemu-arm] [RFC v2 1/4] hw/intc/arm_gicv3_its: Don't abort on
 table save failure
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
Cc: Andrew Jones <drjones@redhat.com>, Vijay Kilari <vijay.kilari@gmail.com>,
	Juan Quintela <quintela@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, wu.wubin@huawei.com,
	wanghaibin.wang@huawei.com, Christoffer Dall <christoffer.dall@linaro.org>,
	eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dkeCcLWtgBWT

On 23 October 2017 at 16:35, Eric Auger <eric.auger@redhat.com> wrote:
> The ITS is not fully properly reset at the moment. Caches are
> not emptied.
>
> After a reset, in case we attempt to save the state before
> the bound devices have registered their MSIs and after the
> 1st level table has been allocated by the ITS driver
> (device BASER is valid), the first level entries are still
> invalid. If the device cache is not empty (devices registered
> before the reset), vgic_its_save_device_tables fails with -EINVAL.
> This causes a QEMU abort().
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reported-by: wanghaibin <wanghaibin.wang@huawei.com>
>
> ---
>
> this patch would deserve being cc'ed stable (2.10)
> This goes along with patches 1-5 of
> [PATCH v5 00/10] vITS Migration fixes and reset, candidate
> for being cc'ed stable
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

We could/should put this patch into qemu now, right (it's
the rest of the series that's RFC) ?

thanks
-- PMM
