Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5372064lfp;
        Tue, 11 Feb 2020 09:58:34 -0800 (PST)
X-Google-Smtp-Source: APXvYqxH0G2jaQyssMizupH4W6OPxys7D9YHjfAhIbBBkKWmzjhGM5BRqMJ5DoT8ys3gkCPyOvx2
X-Received: by 2002:ae9:c316:: with SMTP id n22mr7068180qkg.72.1581443914039;
        Tue, 11 Feb 2020 09:58:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581443914; cv=none;
        d=google.com; s=arc-20160816;
        b=s/4lb3D4nIco8jIJQ3z3Uv07FUCYoXNSgnyl7iYlqCcW5Kef69Sh4LrShCO5X4y9Hz
         ECyiT18iiPUDmjfmbZCPKTmTVvliw8eoBvpZR6HgvN2PLe9sk8zdglIdJdU6vIV5YNYU
         gQIVG9I506LRVwp3R2vUpTOHRMHGO4ULNI1SdYVBrAfbwlb34PQTInMhITCA7sKbN6bG
         mE/V+IMfCTTaXCe1JsYup248Expigf+4S1oGBk9nRrCBDgnr5T1xjmSXF461NlYWJMNS
         5PYV9ADdEj3UzEggZ62Dba3DBGPt98DfH7MSShswMtEsevil5vTsWFqav3M7C37BSDQE
         e3rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dS4V1ioc4cE+TiPXsCl6QMyY7qNQDAKLHZvdg6nxPoA=;
        b=W+PYmHLilhOujRv9oeAesx3l5FKlUUFCyvYLsQWUBP2OgUmzoghsGHZpGI5FcFYXlW
         Quoza1RqGutioBYr8roqmR0Xg5BFQmfKjbyjilFdXP+X5bbN8SpGkfxfBHz5gSheSfgU
         Neol7+mlju3tGgnB66k+lXLchW/3JdVIZVDKVxrjHLxpwJJcb2hp993/eKR0TlyDsAwu
         PWs+OyrZrjaD4v5mh78Yp7ngnG9lZwVpNN6XS6t6Uz/KaB2cVJ+31p5mJu+xtt5l3BBU
         oZOSggRvDSgdA4DSU2+aP6+keoCI+t1+CHVdiFTTtseEC1YYLl2E0SruhqDQjpjy9NVH
         TA3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bPapeTgX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o66si2380414qka.227.2020.02.11.09.58.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Feb 2020 09:58:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bPapeTgX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j1Znt-0002oi-GU
	for alex.bennee@linaro.org; Tue, 11 Feb 2020 12:58:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32921)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j1ZnP-0002o0-OW
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 12:58:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j1ZnJ-000683-KK
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 12:57:58 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:33127)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j1ZnE-00064f-Lm
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 12:57:53 -0500
Received: by mail-ot1-x341.google.com with SMTP id b18so11041363otp.0
 for <qemu-devel@nongnu.org>; Tue, 11 Feb 2020 09:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dS4V1ioc4cE+TiPXsCl6QMyY7qNQDAKLHZvdg6nxPoA=;
 b=bPapeTgXEHZZG7XwvGW/52yMapoF/lnwM1o6x+Hd8wXeJjoM2dnSUxN7qjUie2J6Z0
 ipb9wC13SpCeNoMkRgH5mecnHSUjj7/GRv1gRy7SvVH1E+cJcGzQI1ngGHd9p4JdS2ny
 RMK5/KIXRCYfQh1ZECLyMzoGxRkASvCclzg1/obhOpVZpg4TwcP+U2vhdopOjz2vNUuV
 K21EHVcruMrHuY6ExgoHZuQI6yeV/LjweSeqG/bWvXYhcSxfU/wvzp9U0IEG7fYIP8gt
 dq5tY2MkiwiADevwbZS2T3EE6QbIPx4PnPAnr3XcAIgLP5WU6pTWFkVOSBGcix4HffMV
 WOlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dS4V1ioc4cE+TiPXsCl6QMyY7qNQDAKLHZvdg6nxPoA=;
 b=QNyb79jfJCCCbMNVyeDKre0hK2MytjQuoOpXpCnH0/CUNy++D+CB6oI8cbVNpdUzzo
 qCc1J8NroYtHJy5KLWlK7uAEF8GS/lB6beM5WOqku4Mvp577sCFXemMhNgJr0HO0Svqt
 TbuIQarFiJGq7X69d1nll2WIOaF4RKTMQFwU9gXo97oUx1KApWbRGeQ7d8iDTsCRykY0
 ZXm1xdHFI1Twb5jebTfZph+qRQb5l2W4Ajcahx/5gIbYTyiD8RsDEWU7/BwfWWuXRLfa
 AqnT0yBq2Tz5Pve+QKoUFF6mx1C60oHsALDjZ8YwrFqmDwFbsaZ4iXXUypHx2xJ0bT7n
 N9Wg==
X-Gm-Message-State: APjAAAV5/45exLfNAGGroJDfPvJMNC0fNOXttoUVFWSMjndPpHfCGNvR
 Rca+mX0mRkr/tFtInUHL7it5zm5s3jv1bhj5QZUcKQ==
X-Received: by 2002:a05:6830:13da:: with SMTP id
 e26mr5772377otq.97.1581443870716; 
 Tue, 11 Feb 2020 09:57:50 -0800 (PST)
MIME-Version: 1.0
References: <20200207095409.11227-1-rka@sysgo.com>
In-Reply-To: <20200207095409.11227-1-rka@sysgo.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Feb 2020 17:57:39 +0000
Message-ID: <CAFEAcA_vgg8mVw+-vfjWcouyOOnM_qZPdsPFmSgatV4Lq5Panw@mail.gmail.com>
Subject: Re: [PATCH] i.MX: Fix inverted register bits in wdt code.
To: Roman Kapl <rka@sysgo.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Y5QZ7JUmwYmt

On Fri, 7 Feb 2020 at 09:55, Roman Kapl <rka@sysgo.com> wrote:
>
> Documentation says for WDA '0: Assert WDOG output.' and for SRS
> '0: Assert system reset signal.'.
>
> Signed-off-by: Roman Kapl <rka@sysgo.com>
> ---
>  hw/misc/imx2_wdt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to target-arm.next, thanks.

(It looks like we're missing a lot of the watchdog
functionality in our model, ie the actual watchdog
timer parts, enable bits, etc etc...)

-- PMM
