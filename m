Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp2514127wrg;
        Mon, 17 Jun 2019 06:36:55 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyTJ+Hr6br8WcKmgAS3FkaOfluAf/kNBkebe0c4B4FF1h6EWX6JAltpfzYKwF0IdPqk4aUh
X-Received: by 2002:a50:90c6:: with SMTP id d6mr97088135eda.19.1560778615337;
        Mon, 17 Jun 2019 06:36:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560778615; cv=none;
        d=google.com; s=arc-20160816;
        b=r1hb6QSkcGDYPVLKyaqHZhMhFgXcLYNZ01Yxn1E20XV9x2O9Bo2X53+vTB7Sp4mYe6
         bfgjwqrASUfKkMWEVpCHCyyIMDK+yTc2wkBbWTzFG0tBZwllQKrtKBIYN6D9G5JsCG0N
         zy7GM74TJPI6GrS2sIZMAohybxcvK/NGzf2z9TAJN/i0GvewKHx0h8k8Q98lx2BcOHoD
         8H55HlHFVwS4ZGPt3kGfuCoog6jYg1vYnVoVWvnvddCk3Wjmfv+iCx3sRJZcsndi7Npv
         gEE8TzPwnqsckVA5FZg1efAqKiiQmlQDQde+kLq+bFi/rLRzY5Kxk11WdET68eTpLmjk
         gMPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=3LmEa9D147d/B0YCc+D13PS3P1DCMG2zfXXCUyJxbmE=;
        b=jBWtmv80H7pycCMVILcAkpXaqfee+b1uiCpvktLSPUz1lODZeeooCWPvpmaOvF+XW/
         tF5dDfCORarTOzQCUsgFcMQY/3k5PCJ44lsTK+WTsJakb1jDsQrz3uPBXKlFP9q7/gxn
         RV/KgOFC73cXbu8x5viez28oOyk/TO13Ze3YTYYftCWZjo/+vffow3u68Y3cS2jyGdSr
         uYvhTqU9hbPO0oeiyHvRxrKLK3ebdj8EfIAkclmWFAOzvHOshQ0w09MoqRxyH4Zy31AD
         X2sag59f5xTyOLFZemFh5iukMkoH/XLKOyFAaFQxLFiXI+yqIMfDvPVpbDOsmzqFme98
         1Bow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=w9bjLguE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p19si7167247ejb.24.2019.06.17.06.36.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Jun 2019 06:36:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=w9bjLguE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47596 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hcroc-0001xR-Fi
	for alex.bennee@linaro.org; Mon, 17 Jun 2019 09:36:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58217)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hcroW-0001x7-IR
 for qemu-arm@nongnu.org; Mon, 17 Jun 2019 09:36:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hcroV-000061-CY
 for qemu-arm@nongnu.org; Mon, 17 Jun 2019 09:36:48 -0400
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f]:34643)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hcroV-00005W-3D
 for qemu-arm@nongnu.org; Mon, 17 Jun 2019 09:36:47 -0400
Received: by mail-ot1-x32f.google.com with SMTP id n5so9310994otk.1
 for <qemu-arm@nongnu.org>; Mon, 17 Jun 2019 06:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3LmEa9D147d/B0YCc+D13PS3P1DCMG2zfXXCUyJxbmE=;
 b=w9bjLguERrshO5KRzuWLQUPmn5OCEm2qmcK+3ixhkyQg8eBimMIg1tDprS/seC7j0O
 T2v/Ynifv7L+fsijTCSq57ig2qcdats1wa6Hk9uDULKEnwB3xdYMz6IL9PGNZdtjc5p3
 KYVl0DX0vjeg/WtCAd7bxUSf1jptib2dFzClD4kSESBd0AhPq0XNJZ/VNTfMGIx/OOfw
 yzf8yQb5K11pGgDxa1qrsNNSKrPuygG7iPyP4CDPhokeXLhehjlMWfFgzE5t+TQtt44f
 PhHANeWUe2U/1AjOzdLyKmSlW1sBWW+hj9cCq746hWUGj4BRKCc/VXj7viUGBNANK1w0
 kj2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3LmEa9D147d/B0YCc+D13PS3P1DCMG2zfXXCUyJxbmE=;
 b=c+97oe4BU5vkVlv4ZjlMHee2F+thqw2sGi4KT4r99JcwHz2wGgLtyVqjcFKsWE0d0P
 H9p6kjYsEwOAlUWgyXajy/ng+VclOb20WxaEtYRMJ8LJplDivTki97v9wFfHnOhwstV+
 djQmGFZ5SdIfnKANsTTz2mdo76CWi9+zUIwoWqAfq1XgXyaqDsOiR9uH7nVPOjZITNr2
 Yj92OSBi41JpVmMTxnh6AhbAEwHdJRHJcMiqrp9en6dpNfJ7NiAeOvq/gNUEAn5H8Jw4
 WGG87OSRXRrmQjCe0qBGky8x+lfiEQOO2iTxCqqNIE8ACMFF3yDrZ0nH9FG6KMFZfxhG
 IuZQ==
X-Gm-Message-State: APjAAAXYuKOQii0PmrLyiM3ZrRkXG71s3kNiM7ddZPouIVZo/1GiKtx4
 ALZoglmqNQEcDFedoWhz2KeGrjZQT8GJV6nFqVlOaQ==
X-Received: by 2002:a9d:7245:: with SMTP id a5mr20367622otk.232.1560778606140; 
 Mon, 17 Jun 2019 06:36:46 -0700 (PDT)
MIME-Version: 1.0
References: <7757fcde65574754a8123d473be4b8a2@ALHUN12EXCH02.Parsons.com>
 <CAFEAcA9KYsqTcXTTkPmL+x97i7v5X9J2gOPNg-P0oFVNoTFzfg@mail.gmail.com>
 <4ca9467fcfa649ad8ef1f1f5f1bdf701@ALHUN12EXCH02.Parsons.com>
In-Reply-To: <4ca9467fcfa649ad8ef1f1f5f1bdf701@ALHUN12EXCH02.Parsons.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 17 Jun 2019 14:36:35 +0100
Message-ID: <CAFEAcA81YHFkDvsjWLiY6EoqgQSoeDKFAxNrGB6_m_B0cwaCFA@mail.gmail.com>
To: "Bensch, Alexander" <Alexander.Bensch@parsons.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::32f
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
X-TUID: bMiOWPVdH13l

On Mon, 17 Jun 2019 at 14:15, Bensch, Alexander
<Alexander.Bensch@parsons.com> wrote:
> Sorry for missing some of the details, as well. The CPU I'm currently try=
ing to base my emulation off of the Cortex-M3, although I'm not actually su=
re whether the device I'm attempting to emulate is an M3 or M4. From what I=
've read the only real difference is some Thumb support and a DSP module, n=
either of which I need hopefully.
>
> The register that I was referring to was control register 15, which in th=
e docs I have is referred to simply as "CPU control register." My version o=
f QEMU (which I will try updating as you suggested) refers to 'cp15.mvbar' =
and 'cp15.vbar', which I have been investigating as the likely base address=
 for execution.

MVBAR and VBAR are registers for A-profile CPUs. M-profile is
significantly different. (In particular M-profile does not
have a "cp15".) QEMU supports both, but changing things
related to A-profile will either have no effect or bad
effects on emulating an M-profile CPU.

M-profile does have a register called "CONTROL", but this
doesn't have anything related to the vector table address in it.

Is it possible this register is not part of the CPU but is
in the SoC?

I would definitely recommend if you don't have them already
getting a copy of the v7M architecture reference manual
and the Cortex-M3/M4 technical reference manuals. Then
you can cross-reference against whatever docs you have so
you can see what's actually architectural and what's
specific to the thing you're trying to emulate, and you
can use the architecture's names for things that are
architectural, which will make this conversation less
confusing :-)

> You mention v8M. I haven't looked into that version of the arch, but coul=
d it be possible to execute v7M instructions on a v8M CPU?

v8M is the next version that supports (among other things)
TrustZone for M profile. You would still want to deal with
the v7M CPUs though. I mention it just because the v8M
init-svtor implementation is a useful guide to implementing
the v7M init-vtor.

> I'd like to avoid modifying QEMU as much as possible, so if there's any w=
orkarounds like that I'm receptive to them.

If you are trying to get QEMU to model a board/SoC that
it does not already model, then you are inherently
looking at modifying QEMU, I'm afraid. That is the only
way to add new board models.

thanks
-- PMM
