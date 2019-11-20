Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp1801515lfc;
        Wed, 20 Nov 2019 02:32:41 -0800 (PST)
X-Google-Smtp-Source: APXvYqwNWi5VpkVuKvTGf+KwRY7h8ka04jzRwi4VrcDFk7sZRboebLdM8R5lGJ1cUsYhi5KOCIXA
X-Received: by 2002:a37:a848:: with SMTP id r69mr1594014qke.487.1574245961617;
        Wed, 20 Nov 2019 02:32:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574245961; cv=none;
        d=google.com; s=arc-20160816;
        b=T/umvspxg6meQH7zYmL67Zo10uyKoMC07/HRhSuOUTSl3NjcKIY0qFtI5W/5UATsdg
         iD0I8YrBaK+9leoRvSivzEeQ/MQyz5j5xubYxB7bIYdZBLSAu4gL6bBspyufxPK7t8Xq
         kI0vrEkPhxo8FhUpXV56fslO/UiGNGNz9KoJbXWlwd9muIobTVB5mQCxF0m75iYEaI18
         /22t30ENfJNANHxxnxvhpj9/xOc7pxbFDLoPuR/3+zK0+GAh0Xv0YCRPveA96xXgV5l4
         GjUUCQgSgQHU4ygCKBsyKF0qL3dB3FIIBrHQHSvZ8zS8/CVmPZ/vWFGCs5Mh/dqL+mt4
         oZ6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MyULrr8n1VFQYQPL12Jw2hqL20N+48hCyExX/wzvy9g=;
        b=QrOM2S+K5AWTZPsHtzyJd1mg4VpXHaqgKtAEGGJ5ydIE3Kcxc48seqZ5BGPccMRiZM
         Lpg8yoJPkTDA57x51BUIhROkDPsGwg7Sp0jYeADkx2MASodWo7GFL44kIJktU4fEXsLS
         5iFd1g5iyUFlW0JQOypphJjmYwLVc/n3MHL2t+KxFFi769RmmPrLYc8nDvnlSQK7z4Yd
         PW8dLS+xDV/YZPcsjKHrYp/mZCqjpyEZm6NdX5Dc1JAC8/2uASb9ul89TGHc0JEpsjn0
         GymjInvsKi+7RfDWrWANizx+HmAQP1YOPPWFZXo0meJnTJzc86TH59TtAWoEtkUW+1I7
         QJKA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L0TsPE5L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l12si16028502qta.20.2019.11.20.02.32.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Nov 2019 02:32:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L0TsPE5L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iXNHs-0000pD-Ds
	for alex.bennee@linaro.org; Wed, 20 Nov 2019 05:32:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56709)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iXNHM-0000mr-3C
 for qemu-arm@nongnu.org; Wed, 20 Nov 2019 05:32:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iXNHJ-0002Y5-U7
 for qemu-arm@nongnu.org; Wed, 20 Nov 2019 05:32:06 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:33638)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iXNHH-0002Ll-NX
 for qemu-arm@nongnu.org; Wed, 20 Nov 2019 05:32:05 -0500
Received: by mail-oi1-x244.google.com with SMTP id m193so22053842oig.0
 for <qemu-arm@nongnu.org>; Wed, 20 Nov 2019 02:32:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MyULrr8n1VFQYQPL12Jw2hqL20N+48hCyExX/wzvy9g=;
 b=L0TsPE5LEkZjg/SNpJEInZPax4kluEZFgr+NUmNbsJSCe90jvr8pVBkYXAymlE/SuR
 GhTaZGdk8xgdpenMNUj2Wh331hpUkfqsNLsym+/VYcybu2vXyQUZbfOBiw1cJDTMrv6z
 PbR3+q9dgf7UsqbbyOQIL3S0c+10s0Wp+YqD4VmTdQtc14+Bb8V3OV0J/52VAG0jyzae
 qWdVVKH8QBRHkBxhQ20kDrGhxMdkj1Iwsa2Xj4bH669FhEvDgN8e4Bca2PxFLkmOye6U
 l4H7bLEKuWzdh9KaiLbc13D26BQok5exYyhWHr6UB6bTRRGGREBT4NLeiPZR8pnza6CG
 WRGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MyULrr8n1VFQYQPL12Jw2hqL20N+48hCyExX/wzvy9g=;
 b=uh461oUjkrI7rVxdcNwuJhGbwKWBNGUf8+2s+JeUXIC0Jirx3ANrG6CIYWixUUh6u8
 AQVzLbA3mslByfS8f7RNPDiQfDRq1TpULUJHeKnhc1gvD+UnQsJFRbeJteNeNrPSnPzu
 teqQr0iYDSwo2YOtiJnn7bIh9h9Xr+jEBoIUul1o8naAd9vWplt9TwghHhk/V5J+iYCk
 yURgEZdlKba+EqWy/NBtiZu95Vq+M28citCwqxzQUydlRHWiE3dX0RHDsWPrI6tnhvFo
 CO51LqIbcQEjCv/JNuMjQNaFLN/BW1VPwGt3dxsSDRHj8bmnjyxtKZGGXZWq03X782jo
 mDUQ==
X-Gm-Message-State: APjAAAUyFRvoMFKOJGlx84xmvR7ZBDZChXTfgVJinLy0P1/7Yt75dIjn
 0ibPDNO6/27r/k8QM1urfx8VA4W9gBAAhnPoSirGbm/DwNY=
X-Received: by 2002:aca:4945:: with SMTP id w66mr2219891oia.98.1574245919164; 
 Wed, 20 Nov 2019 02:31:59 -0800 (PST)
MIME-Version: 1.0
References: <20191004025509.3012-1-david@gibson.dropbear.id.au>
 <CAFEAcA9soWUfyfvV5Onyy0wP842Gq698_sZ+E1xGwkmnrLHnJg@mail.gmail.com>
 <20191120052701.GJ5582@umbus.fritz.box>
In-Reply-To: <20191120052701.GJ5582@umbus.fritz.box>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 20 Nov 2019 10:31:48 +0000
Message-ID: <CAFEAcA-2B=tLfc9y3ri_p9nOWBAaiDkhgRQ9r-hjdmYbpzbBiA@mail.gmail.com>
Subject: Re: [PATCH] exynos4210_gic: Suppress gcc9 format-truncation warnings
To: David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3cdOxP9i63vk

On Wed, 20 Nov 2019 at 05:27, David Gibson <david@gibson.dropbear.id.au> wrote:
>
> On Mon, Oct 14, 2019 at 01:51:39PM +0100, Peter Maydell wrote:
> > If we assert() that num_cpu is always <= EXYNOS4210_NCPUS
> > is that sufficient to clue gcc in that the buffer can't overflow?
>
> Interestingly, assert(s->num_cpu <= EXYNOS$210_NCPUS) is *not*
> sufficient, but assert(i <= EXYNOS4210_NCPUS) within the loop *is*
> enough.  I've updated my patch accordingly.
>
> This isn't 4.2 material, obviously.  Should I just sit on it until 5.0
> opens, or does one of you have someplace to stage the patch in the
> meanwhile?

Easy fixes for compiler warnings aren't inherently out of scope
for 4.2. I'm also collecting stuff for 5.0 anyway so I suggest you
just send the patch.

-- PMM
