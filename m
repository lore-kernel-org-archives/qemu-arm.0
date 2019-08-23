Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp498802wrs;
        Fri, 23 Aug 2019 05:19:08 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwXQ6rNjhw53lDASEbg7leJ+xkQY01E2g+o14IMUX1nIOAukSOQJOnH1hxBz8L6xiGeFIdn
X-Received: by 2002:a37:6508:: with SMTP id z8mr3571436qkb.492.1566562747993;
        Fri, 23 Aug 2019 05:19:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566562747; cv=none;
        d=google.com; s=arc-20160816;
        b=Ib+bG0x8HREZxXABFMvxLRofAa8AP5CRgAldewg37Bweh4nC4dDblE0G2cSloTq1kf
         jsh3RZKHOfKg5Z+R+mg0b2dfhSs9YJ/cAvOrvTSgSGu9p4O5S14214wiUHvH0GTd8y1S
         gZAz6PHNH/Wx3sPr3U5vxqvlhPraXueixePIiZjzdY3vga0T+G+ldM7PsKseGzC6zuiY
         hq/CpNGlpvNkNMamyWd0pCpFHW12kH+3nz0icU9/UiU16RC889RPm2+bbn0CdEN29Rfb
         vwOIQRqqI49Q5hLHTjLnJuGAPHAJLc2QuSpPRvsfEelR6Wq7/30FmDTYQub+qlFhKDkj
         ID5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jZVslk/s2CGtJfOBeOGpr+pgecW/7dXqzCewqbgW2Ho=;
        b=FiRysy5FKQs0I+DU5E0dHJjMxP5OXpKk96GFYwvZQOxCYXJYTLUFtZaCEgrKE4799k
         ye1N57rS2IjuOHpGB9KyGxIcRdigg6Ghx9pviL81BlCQWm/5oC4bv2/O+vi+oDaESTeX
         CaKKcMPuRP4oSFO3nE85dAXXFHXb+tF/2ggjuUQXSmCyiNIcm6R0tvMDNtPxw8fVx9LG
         OCPZf1lhFF9BWITr9mnGiQwCR86B7jlEpNLQK6WMOe6UMtcm9yjRcJQG59GQMsR2QFwm
         Ai/6oSnZeLxT1eOJ0vTO4+iY8XLNxkxhpYBJ6j4ea0LZXh+5/guAKg9n4Hpdp6mCzlE3
         Md+g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QCsr5M7k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n25si1825366qta.133.2019.08.23.05.19.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Aug 2019 05:19:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QCsr5M7k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i18X4-0006My-MU
	for alex.bennee@linaro.org; Fri, 23 Aug 2019 08:19:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57089)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i18WX-0006KB-Nw
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 08:18:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i18WW-0001dG-Kj
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 08:18:33 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:40418)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i18WU-0001bV-Lv
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 08:18:32 -0400
Received: by mail-ot1-x343.google.com with SMTP id c34so8546974otb.7
 for <qemu-arm@nongnu.org>; Fri, 23 Aug 2019 05:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jZVslk/s2CGtJfOBeOGpr+pgecW/7dXqzCewqbgW2Ho=;
 b=QCsr5M7k1qk/RIaO6no/cTiC16+cTYm/8FzRCmBltOcUATBfuC1KBoK+LWN5d2DRAv
 kNoYgNl95870voVS+5cCC8oA7Odf4rdKvVS7YuTD3h+KtpWh2rHxS9eue4E6Tb9+Knf3
 7l+H8TK5f54uK8x3XRHqSzxUH248pJ7IPsDujp+9qpqjHord9YDbI8b+RaxtpqiRbJtE
 /KiXmXTDYzpHz8rePOoS7wIcNVfnlT/iUXATp5QmycLGuXnGm1R05VdiW441QXYTq0DW
 jBUtNY2nGr0IEdSmerrgeMyFPyxHvbdnqmHf0LNQ+IjF/RPolSq/j6Iu3pxXMYam/NvB
 I2Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jZVslk/s2CGtJfOBeOGpr+pgecW/7dXqzCewqbgW2Ho=;
 b=Y2RpCbUdv0j07Md4eXfjQWG37xLLHzAyM+WpR6t++De5Cpzk8Bq3ARz99g6hUNT46F
 ZmaNq4U6C7DkcRVL9b+YfbLfegR3ajiu0Y771ALZtbpIC3coXzJmqfT46+gRsr9o7kas
 LdY4PR4EAyCHZTooyljd+txadgE3kaL5iF/dK5EtFp1Fr5xesCEp9dFTzX4s2shyI7R/
 9gDRaQ40mUGZp2sBwq6FGN/cOw9xi9jifiaxlmCYCQjkqWu6FreztFMR4bWNFl2H7te/
 UqGMVKBDnDWXVLCzC+x1zcsf870nKjZi2zuJ46rjfNzkg8iyi+fasJGKhsheqHn0+SWX
 U7KQ==
X-Gm-Message-State: APjAAAUV8qcbJnvcXPfFI8MXZXKVx6lCK3g21mCt0SqsIiWq/iJ8n2qf
 nAJRS7evFIcrlZcO6PpJyjZk8StWTbnDADVSE/vkDg==
X-Received: by 2002:a05:6830:1015:: with SMTP id
 a21mr4047900otp.232.1566562708591; 
 Fri, 23 Aug 2019 05:18:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-6-richard.henderson@linaro.org>
In-Reply-To: <20190819213755.26175-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Aug 2019 13:18:17 +0100
Message-ID: <CAFEAcA8y+peVsV8gDcAxwoPoi=GuGjrVWBbZ2AsUwKHXAN-0RQ@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-arm] [PATCH v2 05/68] target/arm: Convert Data Processing
 (immediate)
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uQhxEvzAuSmZ

On Mon, 19 Aug 2019 at 22:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Convert the modified immediate form of the data processing insns.
> For A32, we can finally remove any code that was intertwined with
> the register and register-shifted-register forms.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 449 +++++++++++------------------------------
>  target/arm/a32.decode  |  29 +++
>  target/arm/t32.decode  |  42 ++++
>  3 files changed, 186 insertions(+), 334 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
