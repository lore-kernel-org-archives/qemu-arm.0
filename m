Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp8698599lff;
        Thu, 16 Jan 2020 09:58:29 -0800 (PST)
X-Google-Smtp-Source: APXvYqyVfwo4VLZYqtl6UMPrM0dT7FMXcKg9dz0IQgbRPBvrDSq+Jw17GWpxVmDHBoRzAV6UeuMF
X-Received: by 2002:a37:98c6:: with SMTP id a189mr33777388qke.500.1579197509801;
        Thu, 16 Jan 2020 09:58:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579197509; cv=none;
        d=google.com; s=arc-20160816;
        b=sQ+OX2ixgeU3Nt/ekCG6mMU4d+sgkMFwUiuX7fWCeHiPHRwX2M49Mwt10/TjHXYyTg
         wox0//LsGLXAePHCvSCsE+awd3bzZCAOq5wtPeizZ8XWPosyibhekixxOY8vHsQiLajo
         5z3ptDqVi8eHFn5XXDW/BvWBmFH+gFYUQLuQl5S+MCNttyUKiVD/PwQ0ffAybG9sy+lw
         SXfez4xdbhsbS8Mv3EIvpwutKVjsY0l9OVEhblFFlhCn/jnuXFjwbCnf9aAv/1Tdcibs
         a5l8WDB6Ycsu4TTpwubRgFR1t3twl9sXe/KK65Swt1nAGM0z3rcr4dP/KV3ItXHPhYTK
         QHzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LaGzoLaCaPaWKUIyizELR2Z8xWinEiB9Q1ve7KEjYyo=;
        b=Pty+mDeiKDNR9qT1CPIThnpejEOScFwQZy3we1tD8s7ixCxHVo7PRcjs/eZubmzeBi
         Vs22wyIFvqZcl3cJrtsGFIIBRrn58Q5Ex5LtHMQydT2nUXN0b9I7QLUUK0DaW5BK/Xh2
         aIinVoo9DAyKi5Jro45zud85JDUCAOO/7wShsdFeQkSore4QI/3trp0FFxpnnsY4vqqp
         t5URl6mT2Jr+K5EGTaWnDo2ljyW5dsqNYOEmcEum7CpAMCzv/Y//Y/JA74oehyra+KHa
         cprmVnB5EEQO9wuuQgp93iMwAX+9gGYXfw1Z9WbnwkwKgq5AmIprpdv8GZSaBz6Ctucs
         olqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gzntHbHN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h34si12786161qtc.116.2020.01.16.09.58.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Jan 2020 09:58:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gzntHbHN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1is9PZ-0004EA-74
	for alex.bennee@linaro.org; Thu, 16 Jan 2020 12:58:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33098)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1is9PQ-00049C-3X
 for qemu-arm@nongnu.org; Thu, 16 Jan 2020 12:58:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1is9PO-0000eX-Vi
 for qemu-arm@nongnu.org; Thu, 16 Jan 2020 12:58:19 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:46797)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1is9PO-0000dK-NH
 for qemu-arm@nongnu.org; Thu, 16 Jan 2020 12:58:18 -0500
Received: by mail-ot1-x343.google.com with SMTP id r9so20182089otp.13
 for <qemu-arm@nongnu.org>; Thu, 16 Jan 2020 09:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LaGzoLaCaPaWKUIyizELR2Z8xWinEiB9Q1ve7KEjYyo=;
 b=gzntHbHN1qrvDBzVHh5HYSGkjiDVZ3inM2zCfI9W5IpztBV/7uc13he4OTqZ7BbajY
 uS2P8Zo4AT1rRNuqG9P/shyx65KGXlURlc22swsdghugBgyESX98c5nr9VRut3B/4Tmu
 xozyc/3QxLjYhXgB5tsbSpl+H0RcpHzD9nPhkIe1oUdOlCtW5DqVUFn6Rb77Q1xEMo2G
 Is5weJSGm4xE2NkTlln+5mE0EeyOY9wM5iRmfWD0xfbMw2+BoNghZNYtiBP16vFcZbVz
 B4gWt04kVLBWY64/CottCyNFAvPzokbyG7pnv/kgZNwpWfmdd4Hu+9qO7GP983xihUan
 1LqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LaGzoLaCaPaWKUIyizELR2Z8xWinEiB9Q1ve7KEjYyo=;
 b=meU6fy+4DVxgWUZJLGh1sHjL/L1iP3X3FzOU2Q7f6A73A8b+890WAXNBr8h6WVkGTC
 m4zEWPwqP3F74Xy6bbetQPDVZzHJNAkouPyUfwfWYY/ekhFJZMwIdel4rQgHkK6kARk7
 c3W2WkslwGQwIfK0+a9Gm6gQdzrtfqiUGDWlz9mwM2TQoX/w5+rHxr/vF7PgHhfu7W3+
 wl71ioKfSoGz55s51jrufsMfnssEatD8AycgqouUgNYj7CEAwH5WIMQPcjinUNQyI42A
 wueNfkuyq8fLm2Vj5LNcm14IU6mC0mHP/NFv4Fj8ZcMGZDSyed4LJM1mDgHGz41q6dGK
 5r2g==
X-Gm-Message-State: APjAAAVYKD96pLw3u7e4J36VXwwfKnF9/pxYidRSp5SIGKGJBhIZYOgm
 AEKUXwM8+3bgdxSljf2u0NgOXqlhOVDCh5eW4w7jpNSCqmA=
X-Received: by 2002:a05:6830:1586:: with SMTP id
 i6mr2865433otr.221.1579197497389; 
 Thu, 16 Jan 2020 09:58:17 -0800 (PST)
MIME-Version: 1.0
References: <20191226175132.28116-1-martin@kaiser.cx>
 <20200108084604.28173-1-martin@kaiser.cx>
In-Reply-To: <20200108084604.28173-1-martin@kaiser.cx>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Jan 2020 17:58:06 +0000
Message-ID: <CAFEAcA-z7gCkowOqWQx-0=N_0hW6nm69NgDbDHLKnqwsrjmV3g@mail.gmail.com>
Subject: Re: [PATCH v2] i.MX: add an emulation for RNGC
To: Martin Kaiser <martin@kaiser.cx>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
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
Cc: qemu-arm <qemu-arm@nongnu.org>, Peter Chubb <peter.chubb@nicta.com.au>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 09gPMUYTLI19

On Wed, 8 Jan 2020 at 08:46, Martin Kaiser <martin@kaiser.cx> wrote:
>
> Add an emulation for the RNGC random number generator and the compatible
> RNGB variant. These peripherals are included (at least) in imx25 and
> imx35 chipsets.
>
> The emulation supports the initial self test, reseeding the prng and
> reading random numbers.
>
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> ---
> changes in v2
>  add a VMStateDescription
>  rename __imx_rngc_reset to imx_rngc_do_reset
>  fix a typo



Applied to target-arm.next, thanks.

-- PMM
