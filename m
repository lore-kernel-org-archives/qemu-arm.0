Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp489234lfp;
        Fri, 7 Feb 2020 03:59:42 -0800 (PST)
X-Google-Smtp-Source: APXvYqwjrIUrN/gYl5IeLCJmwQeixgtz2HGUad3ipaw7TfAz+dPIbpkw4HWUQ+e2gyEalSxb2/97
X-Received: by 2002:ac8:76c4:: with SMTP id q4mr6984850qtr.323.1581076781952;
        Fri, 07 Feb 2020 03:59:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581076781; cv=none;
        d=google.com; s=arc-20160816;
        b=A5NEIwLYXK6M2Wi+bC9WBw2m+rybGDY+JGdyhMosu/aTICM9LrTAqFlVtH/AWfOVRg
         vjILirMRPWv2d1K15+QaBYkDArj/IK6VPYjUAT7ETPij4tsystCBRB/LdpTc/xTlOoD4
         3aGKa9RyjXpm0CkrCTuJshAQRROVBCyIh0e/2c2fncYL15A4albGN4CmOR8QU4BaycU+
         /4JFm88N4PLQvXTgaTSr6J/2CFkTQIn+QhibdNd//nyCcunkKYGyhEG6M5M01fueLPaw
         7ObT4jUqoLdSk45ho6MfF3zDGtQsFyELc3VXDhHMKH81VNK7EyPuzWRxgsb5LokRs1WX
         UcZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=E19fk3bg12ZgnPQArsaMN6KJslPcvXLVjVWlcuBwsJM=;
        b=tJx5gU8cT/+7jMgyD/C30W8mupzLm9viHvfFNKuV5xNimnUr+wfl7/MJ8tz4sVKRg8
         s2F6mSXSVv6yAkHQ/A7FD2rKyf+mIXEBVZhmtXPpuU3sEScC/JA3kYWCAH+jgqGVvg+M
         US3s32uulGUFKN3DkWzJ8QfCZ1eLDN0n2i1uZ1UkA02CYr/7T+V97V++9Wg2c1V3B1hN
         fibT1bsB3qSU72+DWleOCe+m4TfhTLsFx/2nYht/n4Gqm8pCcLDW8SMDasFYOrP02Z6G
         itvrGrkTN0A94W8IWAbtEyM0MJO/RKRvlxd4sWvP9xIcmrA8J70GEgeGsCcSdE4gYN/x
         djig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=wUpaWc7x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y12si1179540qky.60.2020.02.07.03.59.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Feb 2020 03:59:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=wUpaWc7x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j02IP-0001wP-DU
	for alex.bennee@linaro.org; Fri, 07 Feb 2020 06:59:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40295)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j02IH-0001w1-Ja
 for qemu-arm@nongnu.org; Fri, 07 Feb 2020 06:59:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j02IG-0000eq-Hu
 for qemu-arm@nongnu.org; Fri, 07 Feb 2020 06:59:33 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:43203)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j02IG-0000cA-CJ
 for qemu-arm@nongnu.org; Fri, 07 Feb 2020 06:59:32 -0500
Received: by mail-oi1-x242.google.com with SMTP id p125so1687122oif.10
 for <qemu-arm@nongnu.org>; Fri, 07 Feb 2020 03:59:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E19fk3bg12ZgnPQArsaMN6KJslPcvXLVjVWlcuBwsJM=;
 b=wUpaWc7xs6bHtj2/nm/IJU1mRPx2fvx5LD1rxypRlIn+MdQI4esNOmWN9c+kENGsMn
 nGKLuyO7BTrBpW/93rqS+R8zKToeXI4G27ZeF38obqluLCvYDOKC3envP0nviQtHhISc
 9OGnsUdQBXbIBkI7eMvZFXG7uJwrm/EWrZcKwgr+qlfQzAQk3laBPhPdT6XXA84uDDkR
 eXoq0CFnhSX33FnZ0CXDteP13ZMY1sfFaDrbWnTPuT1dMLoCFz9JEsFJgFaHy9dxq4mb
 gPiPenNpM0FmSdvwG291P0tt3FX/HF71JGImxDZkGKETr88OKVANTvAlmistspr4pz1X
 0LOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E19fk3bg12ZgnPQArsaMN6KJslPcvXLVjVWlcuBwsJM=;
 b=HyqtR4KMi2/5cpRSOo+PYLEjhS+0DdJWnmZk+76IPy2s3kR3dmoUhTAGC+yW0Gb98l
 zGPdKmAHOVLpjXzkH8SGFdclFQOh1Ur2KvVHoRbpTciytCIi94NtoSPLc99+ldYdKGTI
 dZvy8mO9rLTdS5eHeAx7ujJ4JTjnnkfONLSIUEgntmbvQtWCRaFaRF9TUaidQRD0eHvP
 h+lt3YP29URVqUpwxQFt3TJMD4XUK1MKgo/MavaI5ZHZU7VHYvfsRDwezdFPig6O/29w
 gdjvgHh/H0fGKTEms+MFOdNmpBpjCBdo22PKWGyzJFrz8JonrD5NJIY3Ch5b/zIPwj1a
 +nRw==
X-Gm-Message-State: APjAAAVm2VONKtsJDb5QoQ6l+/ZE9C6LUHcPw1x5606kZL6Q7reiQsUx
 hCO1S0hApxfuM+GpcEIFQm/6h1dv6PFdQFC3aUQk2g==
X-Received: by 2002:a54:4f16:: with SMTP id e22mr1871929oiy.170.1581076771478; 
 Fri, 07 Feb 2020 03:59:31 -0800 (PST)
MIME-Version: 1.0
References: <2357909.uYzqtL8Sc2@desktop2>
In-Reply-To: <2357909.uYzqtL8Sc2@desktop2>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 7 Feb 2020 11:59:20 +0000
Message-ID: <CAFEAcA-4LDRH3A-PVphzQn3F82hODV8f0YsZuVqygn-jFi_p+w@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] bcm2835_dma: Fix TD mode
To: Rene Stange <rsta2@o2online.de>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Andrew Baumann <andrew.baumann@microsoft.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5phY3W7Gp/R7

On Mon, 3 Feb 2020 at 15:41, Rene Stange <rsta2@o2online.de> wrote:
>
> Hi Philippe,
>
> this v2 patch splits the initial fix into two commits as suggested.
>
> Regards,
>
> Rene
>
>
> Rene Stange (2):
>   bcm2835_dma: Fix the ylen loop in TD mode
>   bcm2835_dma: Re-initialize xlen in TD mode
>
>  hw/dma/bcm2835_dma.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)

Applied to target-arm.next, thanks (with the commit message
tweak suggested by Philippe).

-- PMM
