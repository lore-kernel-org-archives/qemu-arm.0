Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp2636116wrg;
        Mon, 17 Jun 2019 08:31:32 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy/JwWrTb/qeLZh/p+qzWnl3o+Z28+DuYAK/8XL0jeL2YK/lobYIUKyXfkwtS6V4OiZOqPK
X-Received: by 2002:a50:92a5:: with SMTP id k34mr93677458eda.90.1560785492871;
        Mon, 17 Jun 2019 08:31:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560785492; cv=none;
        d=google.com; s=arc-20160816;
        b=pwo/DijQ5HVIu8RRLS8npJ/+IKOSnmLoFXdkxvGpK1VGMXMTjdas17H17nfdp0m/Ol
         e7GNRqUMH9/Sz53EXP5YGlbxISxAHpAcHAoN/3jBkli6Nc+cWNvf4CcXNBPtdE2t810d
         26/8nBgQSTBkK2dLAbHdoKmnRFk49qPrTzSez+sDy3xLJCDO+orz+E/4dxrZEpPN/u09
         obBdzmHZgwDLltHJkwBpcH60MKGu3G9YZC4ARL7HmyrXkrMBobKs/m4A6I8lysMxbRzI
         kcA5i3rjDH6TVDLyOibmXMElps53+jpRzbxiHI3Vk805j2SOkzqtIQ1ouBTOAI4CRZe3
         UlrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=5Qvaofb31nfFHzogmDlK79qRviKuf2psB9IjlV+GksI=;
        b=J85zgC3yEEntXGTHslL7ys/uheBe1JwvkQnWPRg+JOv0bLMwmIo2rS4iVcGB2eHPpj
         /cN/6+WJOO1+Gb/PfkFnh5USHYo2bdePuhYHTzv345kgrqoGhMkQxJT1c8Vq7VBREkNd
         C78nmZaQlHdNr8uHFrgNh7gj3NHM/Mi8h2mxC9/AAOklCtM/gGRToAQJ+MUezF/17usA
         h3BGk+3KLGANza30BbSKM6pa5N4BYHyJ58IJ2ORWPBe5gS+aDexaNG+OeLxlhGj2+JVV
         umD21Lj64mIXpYHDu92bdCKD021E6aK06NWMZfNnOagD2rzv5OqkKcU7Yk8CBJyPRZl2
         VTTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=afPX4TMR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w27si9426132edw.366.2019.06.17.08.31.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Jun 2019 08:31:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=afPX4TMR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48518 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hctbX-0002Rd-Tj
	for alex.bennee@linaro.org; Mon, 17 Jun 2019 11:31:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48776)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hcsp4-00022T-8S
 for qemu-arm@nongnu.org; Mon, 17 Jun 2019 10:41:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hcsp2-0004xv-Oz
 for qemu-arm@nongnu.org; Mon, 17 Jun 2019 10:41:26 -0400
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c]:46324)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hcsp2-0004xE-Jo
 for qemu-arm@nongnu.org; Mon, 17 Jun 2019 10:41:24 -0400
Received: by mail-oi1-x22c.google.com with SMTP id 65so7135627oid.13
 for <qemu-arm@nongnu.org>; Mon, 17 Jun 2019 07:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5Qvaofb31nfFHzogmDlK79qRviKuf2psB9IjlV+GksI=;
 b=afPX4TMRPg1SxO0lhSKv5kSN4k92MAmWkkkOScAlQ5uQVXLc9v4eFBQBClvwm9+vh9
 mwHwoMmX/b8FrUq4XGlNfNDJCIJS7RPXSSEdzBC11BZdTZ8W9M8lr6nC6eqjhjAXi8RM
 4UyfpAHzebwuSRsq+/soH9n6E3Xj+H0YFovn+KJukg+YKAco8qq20PmpmzGbXyfPLJFN
 UU3AbMmtxOoNof5l9fiM4Y3jirgMd9ilHoB2HFtWo/LMAZ+gDyZa1uXs+EcvbsxHrRgM
 14XYht5iQuxaxCiAyIc+JJgWhf29I+TyTPmvNF/JTgiK1VZsMZ/VSTzGBqCR96VyUNgF
 iGGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5Qvaofb31nfFHzogmDlK79qRviKuf2psB9IjlV+GksI=;
 b=A6SoBzxAGER0YQVfHZZLjrzrWZAM+D07/2pkQABClyZEvaxUnib2OG61WypSEd6zAW
 fpqeMFM488owU8uj/wJABKAY3odjGc5ulSwsw+8Xutb5Mf5dIZ5YPESMPvdx3RaCQKbx
 AC6KbwL3Dux63enHudEG9DSF2L5e8sSuYYtDjlx6UvZ5bVWlas7e4zo9tSmayr+yHXWe
 foP9r7L8/HAs2zsBwRbC9UY7GXFAbFCoZe7chgDC4cDn3DDbXkrm7mw7mIi2mkInSYIE
 RgzE8Xqz9BsN788TetYaBT7yd7UHgttndXAeQOB3StAw+x2TrT7W8X6zxpakOeAWosLM
 ziHw==
X-Gm-Message-State: APjAAAVwYIVLDQt5nRzivDx6Y9tRFTYe5/ISvv+NnH4/W7Wln9yRypO0
 eO+XNgMfmeSevng/nPioOrfLAn9DuYK1Wk67JSAz0A==
X-Received: by 2002:a05:6808:8f1:: with SMTP id
 d17mr10642159oic.170.1560782483584; 
 Mon, 17 Jun 2019 07:41:23 -0700 (PDT)
MIME-Version: 1.0
References: <7757fcde65574754a8123d473be4b8a2@ALHUN12EXCH02.Parsons.com>
 <CAFEAcA9KYsqTcXTTkPmL+x97i7v5X9J2gOPNg-P0oFVNoTFzfg@mail.gmail.com>
 <4ca9467fcfa649ad8ef1f1f5f1bdf701@ALHUN12EXCH02.Parsons.com>
 <CAFEAcA81YHFkDvsjWLiY6EoqgQSoeDKFAxNrGB6_m_B0cwaCFA@mail.gmail.com>
 <826f48411ef4496e95ce0fcb42ac3e83@ALHUN12EXCH02.Parsons.com>
In-Reply-To: <826f48411ef4496e95ce0fcb42ac3e83@ALHUN12EXCH02.Parsons.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 17 Jun 2019 15:41:12 +0100
Message-ID: <CAFEAcA8f+z1YScY7U3i2qSQZz+vma0i+Kv7tLgraFuBRadakoA@mail.gmail.com>
To: "Bensch, Alexander" <Alexander.Bensch@parsons.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::22c
Subject: Re: [Qemu-arm] [EXTERNAL] Re: Custom machine: Forcing initial boot
 address
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
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SLUCgOiccsbX

On Mon, 17 Jun 2019 at 15:37, Bensch, Alexander
<Alexander.Bensch@parsons.com> wrote:
> Sounds like I need to look over the documentation again. I may have misid=
entified which CPU the target device is using if cp15 is only present on th=
e A series. As a side note, is there an overview for implementing a new boa=
rd in QEMU? I've searched for a week but haven't been able to turn up anyth=
ing comprehensive, and none of the currently existing boards seem to have f=
ollowed any clear structure for implementation. Reference material for crea=
ting a device would really help me out.

No, I'm afraid we don't have documentation for creating new boards.
The best advice is to look at one of the more recently added
existing boards, and follow the kinds of things that it does.
Older board models and device models tend to use styles or
APIs that are deprecated or have better approaches nowadays.

thanks
-- PMM
