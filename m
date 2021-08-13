Received: by 2002:a19:f24a:0:0:0:0:0 with SMTP id d10csp294651lfk;
        Fri, 13 Aug 2021 09:29:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz8CDnpv0JC8HZgtjB8yw4wkGaQOfDyADi7YDOHOgjLl+Ob1EemjbSIzo32r5xmxQojBJii
X-Received: by 2002:a1f:9b97:: with SMTP id d145mr2424688vke.17.1628872142593;
        Fri, 13 Aug 2021 09:29:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628872142; cv=none;
        d=google.com; s=arc-20160816;
        b=DAtlKvQ2qFkQgXeDoQc5Nb9OC9apeM+Svj1PjbJChDYqr6/fAriza1qySo7gKGC3Fj
         U3AM/K+q3UeCkWqrjizp6+S9ysgXGy9xZ+0PakRpytU92lA90g7Y28Dwf8O1JkVVX+56
         Y1DXOBBj1R7iTbvQVzPuTZVWkC5hdcqiBTHM4x3666J/Ij9f6HWHXi3ImFnqu/pUCSF8
         W8XyWR8wzp/6c8Sbwwz8cO5tWgI7BFOke655bhn/LT0hNnYvLiXa7OdTqJtRmKJ0Z1ks
         FK6TSr7a9Qt8AosaxmxSJvamB6BAJSgbafyrW8NTLCC0qWI9NSz4Hnn94eBghw0s5SeL
         e1sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5hIf9deYMKkyVe1TjzJitVmHm4cUsZH1bUzmbdwL0HY=;
        b=J/koiDS2cw3RpgdvH9AQ06XUxeiWR/HAcyN6Z1tYpvNpyfYMTRYdoh2dq9uM4jagIy
         lL00CJEXlRS/ScmVCvGif+tHhV8+FGkeFL7ddCwC8FJhDjCgHYtPR05o0HZ5Dx2qY3x6
         pdALVvjdUS5VVAQkmlKH4li3yP4poLNb2G2NpqSUdf47rJxXR+K3Gii+2oiHllnhtzzF
         +tYBIjpqP88C7mUomDi+8n+PuzpBME8NGXP+irCgT4i2bi1smb7DzD7GnYzpBz2y9NHQ
         NvlDchSgLpdJcvgOocCLjHbJitT9wunV9E/cS5hYJx1a+D0/UUfmwlSmmsjd8ftZIw6W
         cc4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="wkFwYV/5";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r21si1010817ual.5.2021.08.13.09.29.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Aug 2021 09:29:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="wkFwYV/5";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mEa3J-0006vM-Tn
	for alex.bennee@linaro.org; Fri, 13 Aug 2021 12:29:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mEa3A-0006sV-5Z
 for qemu-arm@nongnu.org; Fri, 13 Aug 2021 12:28:52 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:41857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mEa37-0001p7-PY
 for qemu-arm@nongnu.org; Fri, 13 Aug 2021 12:28:51 -0400
Received: by mail-ej1-x62d.google.com with SMTP id d11so19300348eja.8
 for <qemu-arm@nongnu.org>; Fri, 13 Aug 2021 09:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5hIf9deYMKkyVe1TjzJitVmHm4cUsZH1bUzmbdwL0HY=;
 b=wkFwYV/5C+ESdKDKmz6u2DAAkdMDaJgs9S7nH9CoiLwWUfvUTb947X4PuPNL71o8Ls
 ODx1STn0dmf1QvwEoyl4Nrc0HHCOiHY7kqdE1RS9FYhVgoyy/zvk40Q97r470Mq97hZB
 BmG6RayoliP0X1pEJEP2v36KRDN3LyVn6FPVpeWPDTEyYFPGUGY/e3N4ZYZuDDlnmvWd
 8YpX/PYl2PG+3d1ePAsjDZ7Kgn3SrSXksMZYOwV5owZBJvbIrfnBG61FH1ofOyBvkZ/s
 gqmlKUs5lftT3x86g1loget+h38hdHfqwkM6us0uBowBvtsh14HZkSSX+FWGEXkb/1gA
 82Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5hIf9deYMKkyVe1TjzJitVmHm4cUsZH1bUzmbdwL0HY=;
 b=G6TB+9ripovCcOIIAJ2p08XMd5HPdcA613Ti2Sbc0GBQBZIOJN/3ZlRJEV2fWbzmRX
 rQSoLQ5qxh2cfIzwbUHYHrLZo8UCO+n4KKL3mqyuqufkJHqzbRNJN45okgltfUdwhNmk
 H/tPYl/NizGhvQgWFIpIPEIWZ7oq4Rg98GBUi4fTctM6kskVVeWWr3H7SqBki606b2PC
 YfGqjic0149ZvomWAphf3PcbM6d1BUZ6iO3psrhSevhqqxNjj6zkqql42Cwx2kunQ3Le
 b1IVrCD65LQ9tSRhrz/LbG+rZRJNQh+cHhDGRnBXSg4GcSL7JumF5hq+xqGd+qd12ys0
 Yv6g==
X-Gm-Message-State: AOAM532Y7OS1m/JQz7vs8tySsn1e9TwwFwE6IemvY8pdPCe3oLggrqpT
 R7366N5MU53j3cWKZTo5r5BRgO5SRigDWnXDvPoh0w==
X-Received: by 2002:a17:907:1048:: with SMTP id
 oy8mr3228937ejb.382.1628872127855; 
 Fri, 13 Aug 2021 09:28:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210806144700.3751979-1-jlu@pengutronix.de>
In-Reply-To: <20210806144700.3751979-1-jlu@pengutronix.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Aug 2021 17:28:02 +0100
Message-ID: <CAFEAcA-tpYBK7enDU01gQ-ZNWnOSve0Gz7AjCFcC7quicWBKKg@mail.gmail.com>
Subject: Re: [PATCH] hw/char/pl011: add support for sending break
To: Jan Luebbe <jlu@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3CbIl3Gf2PO3

On Fri, 6 Aug 2021 at 15:47, Jan Luebbe <jlu@pengutronix.de> wrote:
>
> Break events are currently only handled by chardev/char-serial.c, so we
> just ignore errors, which results in no behaviour change for other
> chardevs.
>
> Signed-off-by: Jan Luebbe <jlu@pengutronix.de>


Applied to target-arm.next for 6.2, thanks.

If you're connecting the pl011 to the serial backend, you might
also need to implement the CHR_IOCTL_SERIAL_SET_PARAMS handling
so that when the guest sets the baud rate etc it actually works...
CHR_IOCTL_SERIAL_SET_TIOCM and _GET_TIOCM to wire up the flow control
signals will also be helpful I suspect.

-- PMM
