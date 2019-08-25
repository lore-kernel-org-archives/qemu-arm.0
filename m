Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp3152843wrs;
        Sun, 25 Aug 2019 14:25:20 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwvEzD3n9xXxzTAvqIrIOly72ZqKrvoobbw1zRViNKEQB1Jn49tFDSES7OXE7M84dHj1BpH
X-Received: by 2002:a50:f4b6:: with SMTP id s51mr15740908edm.204.1566768320833;
        Sun, 25 Aug 2019 14:25:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566768320; cv=none;
        d=google.com; s=arc-20160816;
        b=Wap3/3EhBfEDfJioEuAewll1fEmlb+PtFd5oqC0Geos3Mh+iwVGInmLd8i6F3R8HzW
         hLkJBcrxz9o5BS3GPx1tGUjYiv3AKRdcWL65p83r0RkxFRpE5ZUqnqw7W1NTom6uKJOf
         2xqfMFwTgRoh1CHaB4D52EW5giH/pp726UOdLzRg8Ocm6Z6Xi0dubbg/OYQkU3FlRF4g
         YomSOrurIPta7BtUFbAXVDNHfwXo1t1v6A8jHVOpyrvXKBGtihreY/gw7qapPo0Ccdh+
         Pd7NRSKrQLIzR9jauppjkl1QCCjSSWzUV+kCazhvVJi4p5YOJqcwJRDUsnvp4QeFgtKv
         xBXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nXjc4ujN8Ti2yYt/HglvZ3kuHstCglbKEVSqw7EoV9M=;
        b=GkYYtQVlunIor1HUTYuTl4Vedc9TLCACAhZKbemA9OGmZJAI/pcm5m22dtSpYuLV0p
         rCLdsucvkpybtPUcZUUtdSYAQEDSD5a7EFvBiLlnBk/Nq3ILkbXDjPe2HdX/gp6CreJt
         66Xi9u8vyNy+qaFTDOkwJSL1O7YxDg2LT3YctCMtgzc1RmeRuPbvtHCBoTNGB8LfFHxI
         GXLHnVYq5FQPhKfYnW0uYXHVjViKMcvd+yqHwLsf0uWXAL6xJ3mxdznBfTyvm4Dl13OV
         yRC66/rCpA5Mt5+bPC5GenSdIeScuLVT+E9CgO8bEilXt4lofyoBN71jStYMh+hJNegJ
         g+2A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="lqT8/Idy";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a26si5498723edc.119.2019.08.25.14.25.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 25 Aug 2019 14:25:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="lqT8/Idy";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i200l-0004IV-Sc
	for alex.bennee@linaro.org; Sun, 25 Aug 2019 17:25:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56356)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i200Y-0004IJ-NF
 for qemu-arm@nongnu.org; Sun, 25 Aug 2019 17:25:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i200X-0002MB-NI
 for qemu-arm@nongnu.org; Sun, 25 Aug 2019 17:25:06 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:42456)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i200X-0002LU-Hi
 for qemu-arm@nongnu.org; Sun, 25 Aug 2019 17:25:05 -0400
Received: by mail-oi1-x242.google.com with SMTP id o6so10681870oic.9
 for <qemu-arm@nongnu.org>; Sun, 25 Aug 2019 14:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nXjc4ujN8Ti2yYt/HglvZ3kuHstCglbKEVSqw7EoV9M=;
 b=lqT8/IdyU3LCx2Mdr6/XH7CUGmKyR1saOHer7uoZpVGymANh4O8Z2INyiXE9ptNurP
 8Y5pietDPvBB9QsH3RKj/+9SYrX3Tmu+URaUEZ2E7MVGEcSdPyzbcX+UPVahPUDWWYCu
 63y0sie41u2iqB/1x9EX+9lDIK9xjkHVT5MdCNfrWRGYFK8/na2QhPFeSwV6QFrBZD/q
 3whkF0cxD5QpIn0nvWCZKGFYZT5ryET0kCZHIFDogddbsq3DHoyFiObBp9WWbYBAxAsp
 oBq9kaSqsB5rAWtNwEdv7heIGxbM4mRl8WV6zrlpIXZRa82cYzxW+H6rcadFWPiKvc4i
 ZiWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nXjc4ujN8Ti2yYt/HglvZ3kuHstCglbKEVSqw7EoV9M=;
 b=haOcRTdjHAAKKSAOp9TufX6RC2CDZwHYopIu22Kvxowsa6C6LRmJD2XlLTbOsVjXQA
 BuNrLgUMAa6YX84XxqDiwXrHyAhgQ7CwhDlkUgJ2H9qSOn17jh1yrCwb+WWUUBssINLh
 b58P6AJCVV+OdvDROE1uUMXIwbM4QZPGDRAH8/vgiTGRjq8mAWTLMkEIY5oOSbjrShC4
 wW0jRbZnu/pRGnLMq/r5aRoEa/NLONS6PIB7H+I2RWkeqpyXvma+Wu5W5OLrD4fa8l4W
 te/voTaXPMts8A9M9KdBllcaBd7HqwjrsQymK6FoKq+AfqEH6zUtEDZydj4gsM85ZC1k
 dfZA==
X-Gm-Message-State: APjAAAV0ZqRlgMiOGudWSO7YXPawH9N2/Gci0FFePq7xBho8mwg4WyPz
 l5QH72g4xECkUAXqsWoB1rC9X4cDNrtq4xg0QJXYmQ==
X-Received: by 2002:a54:4718:: with SMTP id k24mr9887873oik.146.1566768304377; 
 Sun, 25 Aug 2019 14:25:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-49-richard.henderson@linaro.org>
In-Reply-To: <20190819213755.26175-49-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 25 Aug 2019 22:24:53 +0100
Message-ID: <CAFEAcA_geYNUvKuiGaBtL1bphZhhxQcNh9LTCc+DkM3v=0KSnA@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
Subject: Re: [Qemu-arm] [PATCH v2 48/68] target/arm: Convert T16 add pc/sp
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
X-TUID: lENjyko5Muh7

On Mon, 19 Aug 2019 at 22:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 12 +-----------
>  target/arm/t16.decode  |  7 +++++++
>  2 files changed, 8 insertions(+), 11 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
