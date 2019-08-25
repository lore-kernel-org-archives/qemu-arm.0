Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp2952298wrs;
        Sun, 25 Aug 2019 09:27:31 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxWa1B3BJhTFvQBY+3Fll4M+O4dlFwZZ3rDugCuR9beLB22stgHnTqzef2BwNy6n3slvMHA
X-Received: by 2002:a37:8e06:: with SMTP id q6mr12141915qkd.89.1566750451108;
        Sun, 25 Aug 2019 09:27:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566750451; cv=none;
        d=google.com; s=arc-20160816;
        b=i0KQD7ixwEe+FjHUrcUGSK651mqaQXCfcKx4vqmxWdKYsPB3G26WzilUzboF+RhrG5
         97ZYrCvRxFw7Mv0oH8N7ECkDqam82QtrA4pd8x3rUlptcd7LH0T87whRTRO2qLAOE/Qa
         MwUfU11ICxqrma7Iz99Q/L7LaTDdCdgVA9Bm43Yd0COsTnk+SzMGDlsaX4ZTU1FBoBCn
         QzOndh4dvUStvtjjzWTXLVIxKL8lOnGXDtsRIAZmJ5Hl+ROC0odj7vWn4kQtBVr8tTM/
         V+cNesCbIQv9i4PMvp0YJEAAfK6mNJQSrYcZNpS+MGeFrDl8xu/yWo7z+1RIfuUW9V16
         9+Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OImiG2cDAenKoZj3WQWQ8ZnkWoAxTGj0z60lc768Cm0=;
        b=haEnPBKOBXDcrPeqml3xIh3lSDK+exQbu7/tqItpFgkRndxzuBwOM1lKs8umXv6x/G
         yL2EEdiv2AMeeW3zM/m/3GFaOM5aKwHhpwpkNynf0l1Ob9wcs7wV/UyVVKBa95xjVO3V
         Bt9HsM8XcXRE44WfoEqL75hP98xfgY3EC1vGb6SqRIKKJLOlEM6mQ4dEa+3cpATOqebh
         QGCSUGHpx46lOr0fJIamGIY2qZpXCs3T0IY4CxmmVFHWtt5eqzj5YOsxzrzkQaLWgEsM
         DES3Dzx6XtB2dDwBlG4pQbGF+Tedc7bXA7d+fcyJRVJGckzeqUlda/wThsCK82rLDWor
         p5/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bNzzb6bo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x57si6221122qtx.384.2019.08.25.09.27.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 25 Aug 2019 09:27:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bNzzb6bo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i1vMY-00013W-HP
	for alex.bennee@linaro.org; Sun, 25 Aug 2019 12:27:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34225)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i1vMM-00013J-M0
 for qemu-arm@nongnu.org; Sun, 25 Aug 2019 12:27:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i1vML-0004Q2-P0
 for qemu-arm@nongnu.org; Sun, 25 Aug 2019 12:27:18 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:42973)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i1vML-0004Nz-Jg
 for qemu-arm@nongnu.org; Sun, 25 Aug 2019 12:27:17 -0400
Received: by mail-ot1-x342.google.com with SMTP id j7so13046414ota.9
 for <qemu-arm@nongnu.org>; Sun, 25 Aug 2019 09:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OImiG2cDAenKoZj3WQWQ8ZnkWoAxTGj0z60lc768Cm0=;
 b=bNzzb6boW3s+JAJPd+MYx2GpYFf3t8LdngstA9wH2QbHLnh9eRyoeWz+wl4NgkLbuJ
 qkweZjO1Y+iXia5DmWe5g+5hrO1CVKVH93Ws2zFZbCsSlit0lwFx2/LHhraWf3Yi394T
 5JSpv3oysfZjWIk4MWzZSDqbWJLZn3g5V3t0LXLdpPAItGIzeyAluZEeWr53nGrJ8etl
 j8mo7sW9LKEC9TnY6mo8M5fF0KOJ4Mps9JklrPJOjcu0hBvzjoPobWvscpgiyJBeWqqM
 X03TwV6opct5fSEKyP+RyXaeLWcB4I1eTx3nT9agqidk5Y+LGUzK+2JdIilqZBvBileL
 k4gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OImiG2cDAenKoZj3WQWQ8ZnkWoAxTGj0z60lc768Cm0=;
 b=aVhtEn+eO1asBaRT/fnW1Lr/JE/HRyIOiVIEL1H8TYkklwX648rANlHkPdVmR/oOmc
 3wVr+cXtaO/tpCjM2xOF/uA8aS1DKLCX2CupPwO/OrjLor2lOy2rq9ohxRTz66STG/z7
 S1ABsk8DIEsrTuvQnPeH1/VAjIh+wVQKxvmoTlS5xmB5KxDj9o2poB6ZmqrzsFc1D/RY
 T/JLTCGIRtzbVEBkEIIvUKKDPCtSaQGGMAmgSMCYrktVQ4OWA33iUA65gXS0ftDMOi8o
 u1yombZbJuMjnb0EZg+eWfWiO+MsSbhaAci4xFp5wnFW5YfXA6KLpTFEpJawp2KqMDon
 nIIA==
X-Gm-Message-State: APjAAAXrKUz3g30jD7udye1Mt7ZojFYHS45ybqBiqf17bTD8EGrPqwVv
 jvApl9ZT5flHRm1S/6GakcjIm0e/N2YRevNW8X28mw==
X-Received: by 2002:a9d:4817:: with SMTP id c23mr8729062otf.97.1566750436663; 
 Sun, 25 Aug 2019 09:27:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-40-richard.henderson@linaro.org>
In-Reply-To: <20190819213755.26175-40-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 25 Aug 2019 17:27:05 +0100
Message-ID: <CAFEAcA9eJCF+tjoUfQnJMyAX9YPkyOHCU1OAjR=hW3O4-p5xdQ@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-arm] [PATCH v2 39/68] target/arm: Convert Table Branch
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
X-TUID: Rdo8DR2k+FGK

On Mon, 19 Aug 2019 at 22:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 57 +++++++++++++++++++++++++-----------------
>  target/arm/t32.decode  |  8 +++++-
>  2 files changed, 41 insertions(+), 24 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
