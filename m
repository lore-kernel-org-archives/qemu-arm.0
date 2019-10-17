Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1217298wrm;
        Thu, 17 Oct 2019 09:58:54 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxSmQqMnJ5gPK718FRzURDSpUNoKgz7epIdGAr9v1X2cB+wy+/UTS+syqUIWI8HirOTKFf4
X-Received: by 2002:ae9:e206:: with SMTP id c6mr3967811qkc.284.1571331534474;
        Thu, 17 Oct 2019 09:58:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571331534; cv=none;
        d=google.com; s=arc-20160816;
        b=uGktWQbZIjD8J1gt+A5hsIVhFT+dmyOfzl6IjpJ+IzybkjBynu3xj1pSnGtpWqKav/
         o9L6JtM1lOz0zUmxC/np5OGHLoI7Si+/xxlO1n/vdp3Oa3GdqEHyxo9vXGZDPjpPDanm
         HzSzuneRstfz+EPaaHhS35a9Qnmm7WybZG4kqbVNTXURxSxhh1Bzxv/uPMNZMcJLRqfK
         WijT+6Vi4NV7co3+NVOsGz2XZiQJZhW4g9EnwPGy7Y/GBv8sZKA3c8oOu+FLmdlCh/U1
         pFpIRBqAproKp4NeMS5UuwQlkqK0B/4dgTnzzWKTgD7EelJMa20/KikTxfUq6RWq1fwM
         ow0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=y9ZSlsYdwjwLKINTtXzEqwFkN0ObS5a2YzjMPz4vtNo=;
        b=eOXN3MXr7yHxL/daarnSEl70pHg/y5s/P9MJYwliqyJYUoq8T+VBN0SusmNb6UDOgL
         Y/cWq4uW9S5dzRlKFHNieXjMtk7FVNUXjj9d4XWs/9MuAdWPwe4kH/+7mhhOjsO8sOBq
         fgG5YsduxbGH5XYgqTBumz97+UxpvdJS5rLGaSee6ioQlyVnODSdruq2spAFSvaJx080
         Rg6LogyMhObrmudfe6wjgM/Yzw/EK3imFZNHXX7bSWkecfFngaZL5BmfOlZ2xBh2mi3P
         Uxdjzw4KPGObysF/H+NwZ+6j7YTBtVkJIb7rMBtwjBX76cKDcBVndKFQ4OUmG/FXFoIw
         8/0A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=A3wjScqK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b18si2486939qkl.303.2019.10.17.09.58.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Oct 2019 09:58:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=A3wjScqK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iL96z-0000Rr-Cj
	for alex.bennee@linaro.org; Thu, 17 Oct 2019 12:58:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38115)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iL8Yf-0005qv-Tw
 for qemu-arm@nongnu.org; Thu, 17 Oct 2019 12:23:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iL8Ye-0006dt-PD
 for qemu-arm@nongnu.org; Thu, 17 Oct 2019 12:23:25 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:45980)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iL8Ye-0006dT-KQ
 for qemu-arm@nongnu.org; Thu, 17 Oct 2019 12:23:24 -0400
Received: by mail-oi1-x244.google.com with SMTP id o205so2635098oib.12
 for <qemu-arm@nongnu.org>; Thu, 17 Oct 2019 09:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=y9ZSlsYdwjwLKINTtXzEqwFkN0ObS5a2YzjMPz4vtNo=;
 b=A3wjScqK8w1PwuBDHmD/Muw5+PwOiR0GccU8Nv7E2p+k6O2fPS8cFPPFBWIHy77Pye
 Gvz4X3ayIU7Nl1LlSXHMUzyzmCB8XIZsTVPmFfGoYBWWdNDjACCpC6KTHPphCr6T/TRp
 5qwdlvjqCERziOFwfLqjdcRXjd2k9mXD/g9C1+BQRP3jh4HTeLX35kks2SUu8OSjXjRi
 HJ5gyTWNqGOtHzbKy4qOlmd2F1+fM/77m6FDYsQlIJS3wrH+ZY315p4CnRnRV9tm9lFQ
 kkjXB+pPy9f5/4utcMH7tEb1zmHabQ63p0MOzQe1aCPIVg7waH18z3ThtZa7KujFxBBm
 tihw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=y9ZSlsYdwjwLKINTtXzEqwFkN0ObS5a2YzjMPz4vtNo=;
 b=fhIBjIDG2WZgH0t/T/Is8tMbvssQRmWa2+XKfGmxSbpm6Z7Y6JxW2UWJjLf87/qJ74
 T38hZLu8JXNlrBCQPY6YcC3STW4HolG93SQ1v760FKyeqApDq5NSD0fSTrPAtdUBoDnB
 CGubKO6bAoNaWOT+PKBMQFgHmQOxfSpOimt8BMPN3rB4g0GUC4UcIF70XWUzOJuPZ9gb
 oXo85iy0EwAsiOmsUZwNFIAZJO+8omjthmQOUFgs03k/Zt8VObxaaJSajhJKYC3DBdT6
 y8+3t4HCq5gD3EXxXbn23Rbxo8lo5yPG66FSSZQCTbBImFN48PA3UM1JG03KhM7PIF15
 VdUw==
X-Gm-Message-State: APjAAAXRxedGYu0PlJ/d1GFvTDVf/caiKzjbJwKtAmAZqs8isRVS+glc
 rsQjbRokEKpITN3Jg/1a5ENzCBWFyAD+fkr+3zDyVA==
X-Received: by 2002:a05:6808:9:: with SMTP id u9mr3997466oic.98.1571329403409; 
 Thu, 17 Oct 2019 09:23:23 -0700 (PDT)
MIME-Version: 1.0
References: <20191007170646.14961-1-f4bug@amsat.org>
In-Reply-To: <20191007170646.14961-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Oct 2019 17:23:12 +0100
Message-ID: <CAFEAcA9DiMXu9a6nzSo4967y9G2E3tC8ijHF2=b6Kvpt=XeYEw@mail.gmail.com>
Subject: Re: [PATCH 0/3] hw/arm/raspi: Split the UART block from the AUX block
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
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
Cc: Alistair Francis <alistair@alistair23.me>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pEB079QYFh+u

On Mon, 7 Oct 2019 at 18:06, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> The BCM2838 has many more peripherals than his little brother,
> the BCM2837. With the raspi4, the Linux kernel takes more steps
> to configure the various MUXed devices. At some point it started
> to bug me, so I plan to add a dummy simple BCM2835_SPI block.
> It is cleaner to add it as a separate device than mixed with the
> AUX block. As a first step, split the UART block out.
>
> Since this part is self-contained and my raspi4 branch is getting
> too big, I'm sending it as a single series.

If you squash patches 1 and 2 together and avoid doing
things like renaming all the register offset constant
names (or, for stuff like fixing up comment syntax and
checkpatch nits, do them in a preparatory patch), then it
becomes somewhat easier to review, because then you can use
git diff --color-moved and can see easily that code has
only been moved to the other file without any accidental
extra changes.

thanks
-- PMM
