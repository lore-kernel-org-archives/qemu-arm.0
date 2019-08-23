Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp749733wrs;
        Fri, 23 Aug 2019 08:55:09 -0700 (PDT)
X-Google-Smtp-Source: APXvYqztGr14dRUupJvoJCyBjSwETZNTYqgNqI8y0s8jrWheBbHWXQL+VL0H/pNaP5nbuwXej5OD
X-Received: by 2002:a05:620a:52e:: with SMTP id h14mr4805054qkh.358.1566575709634;
        Fri, 23 Aug 2019 08:55:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566575709; cv=none;
        d=google.com; s=arc-20160816;
        b=S+B5KzQ6M8Za4xBEJ+Elr2YVcbKqLe6MWty/0NqjgwCGcxUjoeOY+k0kabE4HXY+rd
         PEkKl/B/vLX3sv0oFzhIGkyRDHcRJSVj6Epmy5roU6Q+SYGZPa6whwWUY5h88cywmXbv
         t/Lgk7laATs/qK/YSGB9wA8BHS0bwuDVYcvWmWaiYWxSgwKNCiJX/1donsl/Yu9u3LFU
         /PcMBN4eji/pXhpZc0oY3YF3MesA2tOtR0Za8b6yEtcCc0x3IFKGsfAcxtwSNESW9yIF
         7lMlxcIdXlVuDAEXfJRPs+dhD3ZC3SHyzG8coZqmvDHN6CkxqTv/mlOEOLCsjUctCeBu
         8A4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wGT5CIRpmIvinPclMWr9KZrZpY0xjN+/dF52/I6pKtU=;
        b=q4+t5LN41UitjSMhfp/x4dA1GGu2j+PPKXnFY4c3kAAONnA0gVAr82mQKgsXTu9mi4
         uZcLbhr3itMygBZEKwC9HxCusX/B7ApKCU+wr4CDCGHwhCtcmVxCR3r70kNgyfqNYxIn
         PMju93QYAEgszJ6hi0JhTUTFL4VDyOI2FtxUJ74w6xlpzmdSWEIJ/BhrmHS5gxhuI39Q
         TwE7Vt0On2mkEQRY7Rt9DdK+L2QwqQzomZLXlb3xuzQqN6gOy53KF3TGEoiogxz/hSe+
         //eZxFWV3cilTd68QP2/gqcKhsbqGEjjoUweUadag0q8ZxXJD2d6ery0KQGBsfmgdw7q
         odXw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XKtfDzql;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v36si2316388qth.383.2019.08.23.08.55.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Aug 2019 08:55:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XKtfDzql;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i1Bu9-00058J-20
	for alex.bennee@linaro.org; Fri, 23 Aug 2019 11:55:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39041)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i1Bss-0003wq-Ev
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 11:53:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i1Bsr-0001sT-DT
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 11:53:50 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:43633)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i1Bsr-0001r1-6j
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 11:53:49 -0400
Received: by mail-oi1-x241.google.com with SMTP id y8so7337582oih.10
 for <qemu-arm@nongnu.org>; Fri, 23 Aug 2019 08:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wGT5CIRpmIvinPclMWr9KZrZpY0xjN+/dF52/I6pKtU=;
 b=XKtfDzql4eKufSOH5voJkiDYIpr4mf2n84DX/5SMq338k6xl7L9hhuTSUNnw27A/R7
 HlnyXK5IomPRNHWnIrvIIzEHuO+LYiw52+WJ7fHgnopB7aH6gzlzghxph27Imkgey6uT
 ct0T4MEUDWg9fokgzyCxnxeEiRBm/dGTfogl0ONYtv32wEjhIRwe2pBjf8CA9Ff+RknH
 CzqCvZH8geAnD4G/rsrFka+j6Jr3PkSHw4nSKiQA8YVv8VX1Ynk/J9qXEYw9/SQN2Si0
 G57PaIpcnX+DhJA9T/xDsyvV/e7lIltCWvy5a0S7QL03mg5rxHCUfosdxvN0pxAVK0Cx
 Px2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wGT5CIRpmIvinPclMWr9KZrZpY0xjN+/dF52/I6pKtU=;
 b=s4Bw3O7qadL1H49/1ldI8G01umicXaAbV8mKE5vCsmCmMOdp6PQ9M5aBtiYw+dhlek
 kjLrtio501Xp7yF4IJqm2Mcl5trB68oTYyjRUcPMDa2HfGqy/xX2m8OxrZrYvkHjHK2L
 Wy+TtVMbSviZTYvsDeP6dvIexShDXz/rJ/KAz8DEK7MMn5SxSE4EjTwK8+DSe555vIj4
 s2fyNbHC1MGhAbYc6wQqavBQWwXqUJWZjAVZZ24pKIiT7msg1VPNmv5ofD2mqw/CPCPl
 KVY6FRo95dLOg2HZxNOshmRVjFmFpM5nol1SehNwYKsASQwejEZ5eBTWUjBdaKLNc2+r
 V5pQ==
X-Gm-Message-State: APjAAAVdBTS//qD2u/sLdtKyJHJk1IjFZntexU5CJfYu+kyk1Cu7IZs/
 83ph/cfoF1oIpwz/QRm3USc5hSHaGtXVKsIFgQPQtA==
X-Received: by 2002:a54:4718:: with SMTP id k24mr3582109oik.146.1566575628134; 
 Fri, 23 Aug 2019 08:53:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-24-richard.henderson@linaro.org>
In-Reply-To: <20190819213755.26175-24-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Aug 2019 16:53:37 +0100
Message-ID: <CAFEAcA-p630ZSwBkdZ5ZGi+12ktjo1cJeA78EV1U9r6VSvm-jA@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::241
Subject: Re: [Qemu-arm] [PATCH v2 23/68] target/arm: Convert Parallel
 addition and subtraction
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
X-TUID: rXMFMCHx2S77

On Mon, 19 Aug 2019 at 22:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 229 ++++++++++++++++++++---------------------
>  target/arm/a32.decode  |  44 ++++++++
>  target/arm/t32.decode  |  44 ++++++++
>  3 files changed, 200 insertions(+), 117 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
