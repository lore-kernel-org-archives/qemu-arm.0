Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp410650lfg;
        Fri, 5 Mar 2021 06:48:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxI3P8yifYSwshQTnr02IP3/P+FnsG9j7fH62OrywI7MUGjO695AZzx438oReMJnYIoKGgc
X-Received: by 2002:a05:6e02:1a49:: with SMTP id u9mr9027495ilv.140.1614955719868;
        Fri, 05 Mar 2021 06:48:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614955719; cv=none;
        d=google.com; s=arc-20160816;
        b=wo835Eo0hPkzR5Dj2pG/IC6qk50ohfhLw22u7u45nLMOXt/gkeuKZJnZFQpfmLpYmV
         E6ZTizgvqAZixcsujSaQjG+Mee3E2bi5MzDUQ32e6AdWUR8+Mw865Zk6NfBGnNUJTjK6
         xMAK2OcUdEXqokC55VKUf8jsiPb0iTW9XisGDvUTfWmxYjYk/qLQl7ShNS/waadW+AGC
         YC9jPxFkqrVRC0IqdGotika9oQmPMel5o2kngeaGjD9QaHhohE+09MRDCIv63sab9MCD
         2b2YFzTtO5E7NkiwiZbnzIAhuLR6xA32r443YGhFvGbAl9Dego+SA4IujyVUFjrvbcz5
         MPPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ut45ZNUFx4I9cGZaEL3mdBFu9mwmY1NBE3AgGM/zY1s=;
        b=BfMNgiaQfkXZJ9qvujs5dQN/rDJ2gU4gbSczfg1/T7lOYBY6Sgsn3FHr1EllzcD/vl
         NhBN8lLgELPMb8+lmOof0jA1pGwDw/EQAUF1cuCA/ebXZtdU9aOBRH2tMJzpCdv2v5tr
         Q9HQUllWSOM/mavCvqApeGDyn/LhhF8yc2/aEHBOhvG5lmZ1koZGVmp2C8WasxxPNwRy
         FsAgYVjhGrtk7+u/NP3FEGNxMKMiUcsLqcKbtKyWNbxZ1jg8V4lfePVHYMIQH/t4T9fN
         2kRhLhpf0z5O+uKxG4NTzOeBuKG0XkjfgQ+oJRqk24oXbTshUzrDnPezFkl/aMqVSOpa
         gmNA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VJ6aht5P;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z15si2511882ilm.67.2021.03.05.06.48.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Mar 2021 06:48:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VJ6aht5P;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lIBkt-0001gt-57
	for alex.bennee@linaro.org; Fri, 05 Mar 2021 09:48:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIBkk-0001ed-Ml
 for qemu-arm@nongnu.org; Fri, 05 Mar 2021 09:48:30 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:35637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIBkj-00079b-04
 for qemu-arm@nongnu.org; Fri, 05 Mar 2021 09:48:30 -0500
Received: by mail-ej1-x62a.google.com with SMTP id dx17so3983675ejb.2
 for <qemu-arm@nongnu.org>; Fri, 05 Mar 2021 06:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ut45ZNUFx4I9cGZaEL3mdBFu9mwmY1NBE3AgGM/zY1s=;
 b=VJ6aht5POT1QMUZgS8+gcBJfkvfrPQJA2S6GfMKaglMmDMDcCZxeIh92Bh1GCnyT85
 htGc97DsbJTNMENlXFSnTMD8E6b+SeqDHhjwrQPSSLomDtkR6fJLYyaxWuombeO00SfF
 +c7i+73dkgTYY83y2EHvL04gePjzoJ7z5Kbcr2cIEfjpHfBJm9JkcH0nmGF+RgbRobl8
 xVII+bocu5I2H4b0T9470phS/EaX2hTgEyYKg4udEOF0eCYxgdCKFqwHpSZFHVsj9rFR
 OwNVwf4vcW3LVO3xI0IAOHvw2ObEsHtXmvgNzBt1sQVNK9a+0pWJ/R+DUzkLZDygPIg1
 ZTvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ut45ZNUFx4I9cGZaEL3mdBFu9mwmY1NBE3AgGM/zY1s=;
 b=i0oBAR4sBXdGtm8dw9/Qz+N9Oe5/1+z/Q2W6jguVlX2owpzuS0a2Lf+zqo+KiWjoa4
 MvFD0RMi2qnWuLm15NwP3nETGLKVie3GnX8Qe1mGDKOoIlqSa+cikObEJNHM8Bip5J0E
 Cd+rQnSunBYEazHklZBsPvSXnc5BJ+9RTBV1xyfMY9CUJThmFn7bwFYKCLd+AjwRiLuD
 jWeyn96Mo+Ltv2Gk4SPnAYlIZnYbZSAAeOUx1UF+aGQABSue+GF3zNEeZ4xjXtI9hVTB
 BINKC1HTjRilAhdfseYwGC38GHP8zs13YDktiEYLhxB5CicBLTPXsTn2Zd4/pguf0JyM
 2z6A==
X-Gm-Message-State: AOAM531AxYLIneJMpPARLOYOW456bLvNznSmoZgxv1iM/x6NLbhZrdHn
 yqOfxQvSbyE+epUGNdq53fnMow/O/4rf/sRzBoeqwWoWu6E=
X-Received: by 2002:a17:906:16ca:: with SMTP id
 t10mr2537956ejd.85.1614955707326; 
 Fri, 05 Mar 2021 06:48:27 -0800 (PST)
MIME-Version: 1.0
References: <20210211141515.8755-1-peter.maydell@linaro.org>
In-Reply-To: <20210211141515.8755-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Mar 2021 14:48:11 +0000
Message-ID: <CAFEAcA-yS0XcCU7CW2hDr=SLMB2WcNQbdtK=Ei8tk-86bW+i8g@mail.gmail.com>
Subject: Re: [PATCH 0/9] hw/display/pl110, pxa2xx_lcd: Tidy up template headers
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KU03155lni70

Ping for review?

thanks
-- PMM

On Thu, 11 Feb 2021 at 14:15, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> For a long time now the UI layer has guaranteed that the console
> surface is always 32 bits per pixel, but some older display device
> models still have the code to handle other depths.  This patchset
> cleans up that dead code for the pl110 and pxa2xx_lcd devices.  For
> the pxa2xx_lcd we can remove the template header entirely; the pl110
> still uses it to handle the wide variety of guest pixel formats that
> it has to support, but we can at least simplify it from a
> doubly-nested set of inclusions to a single layer.
>
> thanks
> -- PMM
>
> Peter Maydell (9):
>   hw/display/pl110: Remove dead code for non-32-bpp surfaces
>   hw/display/pl110: Pull included-once parts of template header into
>     pl110.c
>   hw/display/pl110: Remove use of BITS from pl110_template.h
>   hw/display/pxa2xx_lcd: Remove dead code for non-32-bpp surfaces
>   hw/display/pxa2xx_lcd: Remove dest_width state field
>   hw/display/pxa2xx: Remove use of BITS in pxa2xx_template.h
>   hw/display/pxa2xx: Apply brace-related coding style fixes to template
>     header
>   hw/display/pxa2xx: Apply whitespace-only coding style fixes to
>     template header
>   hw/display/pxa2xx: Inline template header
>
>  hw/display/pl110_template.h  | 120 +-------
>  hw/display/pxa2xx_template.h | 447 ------------------------------
>  hw/display/pl110.c           | 123 ++++++---
>  hw/display/pxa2xx_lcd.c      | 520 ++++++++++++++++++++++++++++++-----
>  4 files changed, 542 insertions(+), 668 deletions(-)
>  delete mode 100644 hw/display/pxa2xx_template.h
