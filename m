Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp7015939wrm;
        Wed, 16 Oct 2019 04:31:24 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyY6k7nW3wYSXZ/6iO1Lq2UjZ+AEckzIPlHoJmK08k75f07DFW0e9SKr1QxJK5eZ00RHzmA
X-Received: by 2002:a0c:b35c:: with SMTP id a28mr19551238qvf.238.1571225483899;
        Wed, 16 Oct 2019 04:31:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571225483; cv=none;
        d=google.com; s=arc-20160816;
        b=gPFuytS12Ro+5fVyzcU341xoOMP50lIChxxLdshEoENXqXMuyp32d72oQkWS1nw4ke
         yc9qnqxdJIouDTfi2RrVoTbpE41nmF40KErkuxS5RwApqEv1yGB+kW4tnYF82G2ztn3n
         HSuM9HMSN/QjZ8OUJGcmThkR6TOOXS6hO5zQTRJrGMzvSk/uJSD+NwRcc3DK3J9XSJq0
         D3ZOZmEvCx8OAmJqp+7FhZO3erejcNHy4NbW6x8geGryB/FOrrJ3ca/bmzjMu9pfrz6g
         QnWkYCDxOvtw5aD3hiPmDt795PgpwqTckmIfe7H2mkRuQMXzXci36fBS+pnf8dvluNfa
         h/vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=cP7wYXPS1LIP0QvJUqyPcWVisGTLgBxAvOkjcnJYZTw=;
        b=z4mexbC4Zc36x1AmAC6goaHfKbnXxHe+QB0Ccr5Er4tOBi4rCjL0tBptqH5pupEVbF
         +MO+gcdZJ7XYC7e99vewyxXpeSxu4H249emdbC7pmcBaustQFc3stQKaRYl50XBhRHO+
         eZD0rDNFcooV0IJ70sPmWnSfsKV+IZToa6FfAFn8aUQk0FMmAHVLGtoDn6in6fUdtxjb
         6IcmSb6yt5DV5FiY69U5tXC+1m0FrinB0jXCLgesQXTlGrpFpD/ZGwj802MaFzXtu19X
         QmlW1NGrG2ez4vy1odupy4o2qYxStzkL8BigIk4lR0wbAeWRdurtyOAQ4+3VnnJvYrjx
         H28w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=U5PWcI3g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f14si23591070qtm.362.2019.10.16.04.31.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Oct 2019 04:31:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=U5PWcI3g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iKhWV-00039A-7h
	for alex.bennee@linaro.org; Wed, 16 Oct 2019 07:31:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42317)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <joel.stan@gmail.com>) id 1iKhQQ-0006Ii-K3
 for qemu-arm@nongnu.org; Wed, 16 Oct 2019 07:25:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <joel.stan@gmail.com>) id 1iKhQP-0003qO-Kv
 for qemu-arm@nongnu.org; Wed, 16 Oct 2019 07:25:06 -0400
Received: from mail-qk1-x743.google.com ([2607:f8b0:4864:20::743]:37870)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <joel.stan@gmail.com>)
 id 1iKhQP-0003qK-HD; Wed, 16 Oct 2019 07:25:05 -0400
Received: by mail-qk1-x743.google.com with SMTP id u184so22373796qkd.4;
 Wed, 16 Oct 2019 04:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=cP7wYXPS1LIP0QvJUqyPcWVisGTLgBxAvOkjcnJYZTw=;
 b=U5PWcI3gn+bq9MQR5PUH10Pv8w+eFBRpCvZWKJRqFNHkmqXVHNlySUjTlyNdLHBN/K
 QkZ2EVvb0CX8yYkHvvCM+qco487KaVCs1YPHly6G4VH2W8GNFULVUmdRhbzJW7sCYKPr
 ivJnWNKxFDtbVRmDb/bndF3u0SVziYpFcyUx0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=cP7wYXPS1LIP0QvJUqyPcWVisGTLgBxAvOkjcnJYZTw=;
 b=X8ToXMid9+/Zi0vySLgcYWIVXjOHo421aFfuWheY4qOEZtKf4z8jqNwR+twYo9uqw5
 1iJd0dO9n8jTWX53mUCAxHYMGP/lX6hBcYNr9G5VWcdxS655Wk3NhCLrSqJPVA4hGbxE
 0NERGBkPWR4/RFP1FiVd6HRmctvlOac0EI3t5jx9ZMIzhLWb1cU43jBGNv1v0xmgz6jf
 PtC3wMtIUZV4qDNUIhfjwMAxbG9ReesxOq1HM0iRt9NfGT/avpS3lXtWXLTg3joSheRV
 FZLxnpjQr6kxzj3oFyHsVA1xlRYG3QvwQDWuXPnXnc744nx/Dp+3kVqXWiZVXr4IdsTL
 gSPA==
X-Gm-Message-State: APjAAAX7NgN5A/LVr2MbwD6TbM5JXS7jh8GeH5YyRZ8n0F3aI6G9Sw7z
 jkshwGb83rBgrPA8xGDzFy305ZRgogxNuNS8cLo=
X-Received: by 2002:a37:d87:: with SMTP id 129mr40610041qkn.414.1571225104884; 
 Wed, 16 Oct 2019 04:25:04 -0700 (PDT)
MIME-Version: 1.0
References: <20191016085035.12136-1-clg@kaod.org>
 <20191016085035.12136-5-clg@kaod.org>
In-Reply-To: <20191016085035.12136-5-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 16 Oct 2019 11:24:53 +0000
Message-ID: <CACPK8XfVdYNy45mnVx_4Bq00iaFjC78w-F=omw1Db0wJ-FU7xA@mail.gmail.com>
Subject: Re: [PATCH 4/5] aspeed/i2c: Add support for DMA transfers
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::743
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, Andrew Jeffery <andrew@aj.id.au>,
 Eddie James <eajames@linux.vnet.ibm.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YIiEtWev6ASm

On Wed, 16 Oct 2019 at 08:50, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> The I2C controller of the Aspeed AST2500 and AST2600 SoCs supports DMA
> transfers to and from DRAM.
>
> A pair of registers defines the buffer address and the length of the
> DMA transfer. The address should be aligned on 4 bytes and the maximum
> length should not exceed 4K. The receive or transmit DMA transfer can
> then be initiated with specific bits in the Command/Status register of
> the controller.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>
