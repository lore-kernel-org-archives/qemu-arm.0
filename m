Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp9823368lff;
        Fri, 17 Jan 2020 05:47:50 -0800 (PST)
X-Google-Smtp-Source: APXvYqyFL0fVJb76wZ+JTIS43XtfOIAj3Oh0sVdKJ2EvQoayy/tFLsEgbrWtbqIy5ALP08ZV6Hrq
X-Received: by 2002:a17:906:f241:: with SMTP id gy1mr7856694ejb.340.1579268870909;
        Fri, 17 Jan 2020 05:47:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579268870; cv=none;
        d=google.com; s=arc-20160816;
        b=xJ/Mrp9r2WhlBdmm3Pk/KU7BwNFBsCYpTO+W/MxSiRvmezAqjYBz2QwMtHHH7QOIl0
         EoSFmFaCzZgk9VK4xnUX3e/qFnsyfCh2vVWzk2YvBKyRcRq31u5s5isMiQEDi3JM8fVA
         KzCZQUGYYw/zCODFy0xMWY5AUQn7/J9dGzZTWoTk8lKz3LsP+9ROs/Vu/KLhBytrdcsL
         923kJIXLxsYjZoFBBMNvA9r/SmMHgCvX5pIdrf9p23Ne4Q81u8uN9Z5+ONff4PD1g2+G
         1gFmC5NKyHF9VUaXiQYcnXSnvpU2N8FWkdCAw0lI2APX2KSygDkfg+nW8hpCOb9/JpKd
         cbyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1XpXY3S/iADEqZL6RCLeEGiyJcbLnU2P+ZQvjil7INA=;
        b=04OcTHPZsB3cdyy4GtAW9XViZ7XBurV/AmIVHtcozAq+BN94Be2bHBSYabahX15VMH
         XpNz7lATgCO74ZfpS1KgsPu5ZmOpSs258QwHPxy2p0JPEUIjayGqtm6cxG39pvzSguZJ
         wnLZAKoZoI8ACxdmot+tHO/8xcrmN040oVXZFjxyt3dRo1f9q1teUbWRbVe4axvMEbZ+
         Cl+EwQPhJnhRoIe2neTnLMJKWj0QLMRYdcjiOV26Y8lOHPbYW+0fiVubV8+iRWQ7Ws9P
         ByLjEYAIhY08BSbKVsYjACc5+YpqrCxtMlJQ63Nl7MKOyq29YBUXKdHxjZQJ+JVgFs53
         PEEA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yzNmLBez;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r22si17291075eds.264.2020.01.17.05.47.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Jan 2020 05:47:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yzNmLBez;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1isRyX-0001Sb-Ix
	for alex.bennee@linaro.org; Fri, 17 Jan 2020 08:47:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50435)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1isRvS-0007D7-OI
 for qemu-arm@nongnu.org; Fri, 17 Jan 2020 08:44:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1isRvR-0008AU-Nt
 for qemu-arm@nongnu.org; Fri, 17 Jan 2020 08:44:38 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:42694)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1isRvR-00088d-Hq
 for qemu-arm@nongnu.org; Fri, 17 Jan 2020 08:44:37 -0500
Received: by mail-oi1-x242.google.com with SMTP id 18so22198256oin.9
 for <qemu-arm@nongnu.org>; Fri, 17 Jan 2020 05:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1XpXY3S/iADEqZL6RCLeEGiyJcbLnU2P+ZQvjil7INA=;
 b=yzNmLBezVokaDTotMxd+upbESYDYX5QLi8r06xLA1N1Mmgvyq62xjt8Mfz28MSidC+
 B7yvwl6cviImSBTu4c0DTI2v1OJ07eraxbTlMXBJ3md1QTfJdINpjtplTdZOa7x39sF5
 PI/Np9zWYX5IE/A+FDvZ1Ark37hHwjb+JfRhAlX7xYW7/i57tYE3RXbpZa4ZTjq3G+gD
 wkngiTJhiGl3/OYw9C7OwcZ0mx9Ai6k4siqYBsqG7ODQeeeUplGgfWaE0qCUE8PX8w5M
 5En0dVuBArVkEvw/QPm0Pweg1VHx+tJJv+UU7o9T0yD347bttc4alwVd7h5rZqp4Hm36
 yKww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1XpXY3S/iADEqZL6RCLeEGiyJcbLnU2P+ZQvjil7INA=;
 b=lw6zbzG/6vxDwIVfXFHwIRBseaYxqU7/c1pNYEMt3nkw1LZf0YLyRLgXV9C145SVKr
 4tgXnKDRkSr7lMaBt2Gw8GyrmENNsHpxPvs8qYjD4iz4ZRqFdOYU4xDnqya3OYzvzdDv
 QPevl/PEfYZLtAj98Y0IifpBvnU73nUSCkFxLQ+jpcqOM5UBJ14WqX/8HEFZG7KBYi0Y
 yO6vi0eDRCEowhEj5ORy1kdsP1sEO0j7kpWoJieZSyL1oXlJDYunXCibnooaQBT8AqBL
 JDvH0PTnDPH9LeKSP/vr2+ZEA7+RIQEu+wVGKVHkwU/FPXEJejQJWVLvuki91LjFiEcq
 vPYQ==
X-Gm-Message-State: APjAAAUx7j0pDI1JHMgyOk77z/fkidbtIh+kBf4B6DJW7WthIW227PKO
 gIEyEnDmTQGlglXdGyJJgskUKm0w4udVofQMhGc5Cg==
X-Received: by 2002:aca:3d7:: with SMTP id 206mr3457852oid.98.1579268675049;
 Fri, 17 Jan 2020 05:44:35 -0800 (PST)
MIME-Version: 1.0
References: <20200110203942.5745-1-linux@roeck-us.net>
 <20200110203942.5745-6-linux@roeck-us.net>
In-Reply-To: <20200110203942.5745-6-linux@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Jan 2020 13:44:24 +0000
Message-ID: <CAFEAcA8NX4_vy8UWgtrt1ZTw-D0GYzVYUGrkT7t6ej6V3joeVw@mail.gmail.com>
Subject: Re: [PATCH 5/6] hw/char/exynos4210_uart: Add receive DMA support
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 23bMlcIixgwt

On Fri, 10 Jan 2020 at 20:39, Guenter Roeck <linux@roeck-us.net> wrote:
>
> To support receive DMA, we need to inform the DMA controller if receive data
> is available. Otherwise the DMA controller keeps requesting data, causing
> receive errors.
>
> Implement this using an interrupt line. The instantiating code then needs
> to connect the interrupt with the matching DMA controller GPIO pin.
>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
