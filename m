Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp774692lff;
        Sat, 18 Jan 2020 12:02:45 -0800 (PST)
X-Google-Smtp-Source: APXvYqxlUd5fBZlOdiL0+S9+7C/Yzr/ivkMwAu8La+0cAx5KH2c0pKJwMza2Hu923lLIighVyTiV
X-Received: by 2002:a17:906:bb0c:: with SMTP id jz12mr13742793ejb.298.1579377765575;
        Sat, 18 Jan 2020 12:02:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579377765; cv=none;
        d=google.com; s=arc-20160816;
        b=dQawHGgG2h/G0e8R/Jqg4iiNMkn80u7gqMyPBPqvjQivhPfJQ+4FgNTgjkuCrMsOan
         XoPHnk8RxdW7VSw93NMj+BrHSpMDpFpvGoKdv0APZnlNQfRUmoFJ+Tbr6Ff2DEtDsXrj
         wAWJnAFWRltKML9QFw4vUbWR25HzjrlkEVuHMUh5YwGf7QDTi93n8SvD7DgYkQYMrubl
         /0ReCq7rh8aa0eENwQKenC3cDsnx1WPBSJrrZlEjYANL7YwiH9dBqOItZSOjGJWBw9nA
         mk1YcKgJDBtTlJVs5jCHT23PUvN4eiU+ybGX21c2zLT1i3Zvf0O3yyDFdEGJD7wMzWqp
         Wn7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wguOEihUd+VI4+Vn19DhpQntYTdCBaRAm/KrPXqPGF8=;
        b=nOmJLZWDzyfcgEWEYeKTMRBiIIRil5TJd09bXa1lh0HrmAWsEZCHl736x7R87XWAUM
         iPs1iBu4l2BT+r6iQ+KGxKpma6bKhhPQCeIPV1eS7jEjSy6o2YpD7P1s6lboxlL9fGhV
         3ySqcjgVSc6Xz4+pbXB+5zA8Lonvb872pcs6p6vYceoADFLM8M9oeWvOFIdXK9k4lcCK
         pC+hXIa0RqUUnz1cNTRA03QavVkWQiqOFYvKIyr2rA0Q8HUl0d6TG9/JER+tyhUrEWG3
         NmAh2nhE3zlb8RNH8pdBfB0yYXWYyU1s4JeW7kOaDkUUA+TG2GMMgAlkQjnU+wS+ZJ/1
         S4fA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CDtL90A9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h4si5110035edn.602.2020.01.18.12.02.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 18 Jan 2020 12:02:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CDtL90A9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1isuIu-0006L2-40
	for alex.bennee@linaro.org; Sat, 18 Jan 2020 15:02:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54438)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1isuIX-0006Hi-N7
 for qemu-arm@nongnu.org; Sat, 18 Jan 2020 15:02:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1isuIV-00084g-Re
 for qemu-arm@nongnu.org; Sat, 18 Jan 2020 15:02:21 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:42053)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1isuIV-00081a-LO
 for qemu-arm@nongnu.org; Sat, 18 Jan 2020 15:02:19 -0500
Received: by mail-oi1-x241.google.com with SMTP id 18so25321963oin.9
 for <qemu-arm@nongnu.org>; Sat, 18 Jan 2020 12:02:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wguOEihUd+VI4+Vn19DhpQntYTdCBaRAm/KrPXqPGF8=;
 b=CDtL90A9z7Nza0eqxTD4PMXXVVu/U8oTfgIteMallKEWYzHRRmfDDPH3nwtUg0Y0uV
 dOFhKZqbIWCxj5unRAkIlDevAtviacQnfnI4KMDj55IedUlG3phUkY2xeCraeSl1GenY
 7nDTrWnoozAk0jVjQCmh6bFFUMb5saA3vZJu4yPe67kyTGptdsNy3/3SoBVJojiAhl/3
 FzSIfdusNj9WOq2H8uSjlS06iiPhFIw9OVPBcgpdsosaaI0ocb+ddD58w+jMb3C9b2yo
 JmcYVtNudug1r7zeEtTFsmNf6CF9cQw88TWYkqGK6J2jccmcmte8L6sELv1MlzWOIoSe
 2A2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wguOEihUd+VI4+Vn19DhpQntYTdCBaRAm/KrPXqPGF8=;
 b=T5bXOSU10+Z6KFBnCXfGKCWia2zBbgIQoeNkcpToeTtcxr9prbpU4+Kfw+R74rDX4f
 cWH3112gI9lABshaWd9GTacFM/n3fVEmN5ZacqbzVZNtua8ASyb33JWRNC0DWB/Tn6XF
 ktZS+8PlXarryTEB6zZmXVBZn7a69vT37OrbeqDzJWMEMm73blsY5HaHs75y5fqcoxSr
 cHBRJlmxCmJ9aTJ+/i0ovR4/ykkhmRN8pdJFPnX8EqkxZQzRTMGdkfaF+wDp8hgjf/Xq
 W04EjsgLYvmpLat5TJ7NwamYEzlo70mki9tWI/kD5cCJVk+I4KvWPH6teF4fcQ99QKYk
 D8ug==
X-Gm-Message-State: APjAAAUJBLpquvhtg+VxwjJIp6uGKtaP69ba8iGe79GbQctBcDrvH5ty
 +cT/Sb9Ab+Y81TYVrzq4/griPO3Zxz8brF1eDjg43w==
X-Received: by 2002:aca:f484:: with SMTP id s126mr7758304oih.48.1579377737376; 
 Sat, 18 Jan 2020 12:02:17 -0800 (PST)
MIME-Version: 1.0
References: <20200110203942.5745-1-linux@roeck-us.net>
 <20200110203942.5745-7-linux@roeck-us.net>
 <CAFEAcA_v98GcR06PWfm+=VnteQN_Q7iKK4wobAg6NrVSP1AyDg@mail.gmail.com>
 <20200117182939.GC13396@roeck-us.net>
 <CAFEAcA9zWeW1k-K7qVzCSOA70BmOCa9onT2z_QUQK-=0AJ+NjQ@mail.gmail.com>
 <7a9967c6-a370-9137-10fd-095113dd9852@roeck-us.net>
In-Reply-To: <7a9967c6-a370-9137-10fd-095113dd9852@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 18 Jan 2020 20:02:06 +0000
Message-ID: <CAFEAcA99CgreMMeTH+nmnY+6OU2xY3A-db6MfBuU8i_MCA+y3w@mail.gmail.com>
Subject: Re: [PATCH 6/6] hw/arm/exynos4210: Connect serial port DMA busy
 signals with pl330
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::241
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +MeJgoyQGRn5

On Sat, 18 Jan 2020 at 15:08, Guenter Roeck <linux@roeck-us.net> wrote:
> Do only the pointers have to be in Exynos4210State, or the entire
> data structures ? In the armsse code it looks like it is the complete
> data structures.

Either works. Embedding the entire data structure is the more
"modern" approach, but we don't generally go to the effort of
converting from the older style to the newer.

> Also, it seems to me that this means that not only pl330 and uart states
> are affected, but everything created with qdev_create(). If so, the entire
> file needs a serious rework, not just its pl330 / uart initialization.
> Am I missing something ?

Yeah, all that stuff is broken, but don't feel you need to fix it.
You just brought the pl330 pointers to my attention specifically
by declaring locals in this patch, at which point it's just
as easy to put those pointers in the state struct where they
should be.

thanks
-- PMM
