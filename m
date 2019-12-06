Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp1124069lff;
        Fri, 6 Dec 2019 10:39:34 -0800 (PST)
X-Google-Smtp-Source: APXvYqzYLxpb25fi6ac/6pD2cgkwgVMc3Bu7yaMWTzecuHlYXREDTXC/WsXXMBvrq4F3hwBcojTO
X-Received: by 2002:ac8:1b1a:: with SMTP id y26mr13856270qtj.191.1575657574574;
        Fri, 06 Dec 2019 10:39:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575657574; cv=none;
        d=google.com; s=arc-20160816;
        b=f+W7pCRKq8vssdZ2nTY7K49IgrKPTNtB58sOcbLRBd2hqzmyojgXzxXGy7FzSpynjT
         Ae4xL1XnDoalrQA6BCLhVT0NRwE5abyZPVMPCDc8f2a4L1655xyzySF7NCEOkAB55YIa
         HGqWDXUO/lAUJyyxKMaiaFlzG1oNXRkQUz40ZgIimH1Ih0tU341rlQEdg790+ZAxukB7
         lvdM26Aw0bgoGkq9oEPQHRPBmUHDFaKGgGUODer4nijHQcZ2ZThMGao+O2ZkwwJBJQDD
         Ijkd/tj3E1RXmVkeFJxx9Iqvhhjcx/vGfU+9B9TmPJY3ui1AoEUZLwvacchU+rTfnvjF
         09kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=eh9xvqGv160fKMlLUwlPlM7qfEP0isz5KYXYGxgyu8c=;
        b=Wprrlb+xMWNIoGiWKMXFxqkMO/31KhnlGrO8UPlu4F8AqR/T668em05C+6UWTlmj+t
         JwrisNSzpmSeDGNHkJhzIVSzNycKu2Bf7KDcdMD1UleIZC8/tGiQRpZMNwgYyeqTiOTZ
         3WY23F0xKjVRjhjfaEBjvFPruqpvBWGq6rjqOTdhSPnU4gkl1Dm+EmTdKjNERhIF8SqQ
         Jz/qVK4ywQtly/LTGuSQ1+6MU1hwQupMmBLhhYHyrk2nemT8pB15YjwnOwZ0SjvwCnmi
         kK5jz5RItwGQ7i/VlGbnRGDBdlUOwfiwXCHdZ9NKFU2hQm1r5/geMjcBsqnmlo3w1duf
         y9yw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=wACfxTUl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x8si9267564qkf.173.2019.12.06.10.39.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Dec 2019 10:39:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=wACfxTUl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1idIVp-0006CJ-K0
	for alex.bennee@linaro.org; Fri, 06 Dec 2019 13:39:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57259)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1idIVX-0006An-JX
 for qemu-arm@nongnu.org; Fri, 06 Dec 2019 13:39:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1idIVT-0008Vg-4J
 for qemu-arm@nongnu.org; Fri, 06 Dec 2019 13:39:13 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:33852)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1idIVP-0008Sz-9V
 for qemu-arm@nongnu.org; Fri, 06 Dec 2019 13:39:09 -0500
Received: by mail-ot1-x341.google.com with SMTP id a15so6673939otf.1
 for <qemu-arm@nongnu.org>; Fri, 06 Dec 2019 10:39:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=eh9xvqGv160fKMlLUwlPlM7qfEP0isz5KYXYGxgyu8c=;
 b=wACfxTUlczOZsG7CCDJ5ZRZYorQx6HmmA6N/te+cyrzutNJJ4HsJmfbIIB4BL1vyNd
 iLK5kQ80Gm7RqGznez8vHvqZgraxshgcUHXJug7YhOAGeKXFw8SNnZdchqrPs0MhCqnD
 ihIiy2Up0ULk9ZRK5L6nnec60KSVt5Hi2nmzCl2yNIhA2uVg7nM8LJc7HH9HMc4SyXx3
 LPDARTMnGfjmSrVIriqZV/RwYk0XPcKxPLm15jAAQ7734HLgbIeroaqpv/XS0odRLhUD
 mf7u4RWQuWsGBn4WH7I4hJLhHHtGn0AalxhM3Lq1YQAoi9lJHxWvbqyHpt4EEHlNMTCl
 irFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=eh9xvqGv160fKMlLUwlPlM7qfEP0isz5KYXYGxgyu8c=;
 b=oeVT7x0My+0UZ2vrum8lTApa/UBhxH6o6HHCrhCSQMrLLO4s1xt7mJ7GsHIcOkrMxy
 2IjOBSQnp70+VKCZyaFfD5nbgdy+43Gu6UCO7/ZXYKa7oF3QMgc3o5dLWhrRKeN5nUhW
 +OagvKwFkGDahPjM5kWh4hnr/rEpbJaFejd+pPO9uME7NAIH/cZ2LlGxPV4A6we6/85b
 8TEWnhzYWYL0djAI3IlVmOLtjWQz7DoalDIx6M5Q2SuIl0kUYUlLRCfl8Wt3XaygbeVp
 UaROkjvlUk6z2NtypgjfeKt3TONhyOx9syeMLdQsPAfD+yXTX5qClcSXXBIVyS/YL/lC
 VI5w==
X-Gm-Message-State: APjAAAWqksObmOp+xRVCTFXx5Gu4KFL6jOT0a09pATuaCRcsPnBFQLlH
 iM4ucEvkw4rGYbjdr325WRhURzXY1xgq22jpOcTMTg==
X-Received: by 2002:a05:6830:13d3:: with SMTP id
 e19mr12398993otq.135.1575657544333; 
 Fri, 06 Dec 2019 10:39:04 -0800 (PST)
MIME-Version: 1.0
References: <20191206162303.30338-1-philmd@redhat.com>
In-Reply-To: <20191206162303.30338-1-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Dec 2019 18:38:53 +0000
Message-ID: <CAFEAcA8npEnhYJoiTTJ=o4xFuPmEtW_Ga1e3Ka4KOpbuph5Cpg@mail.gmail.com>
Subject: Re: [PATCH v2] hw/arm/sbsa-ref: Simplify by moving the gic in the
 machine state
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
 Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Leif Lindholm <leif.lindholm@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IlCBtZtCFkXO

On Fri, 6 Dec 2019 at 16:23, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com=
> wrote:
>
> Make the gic a field in the machine state, and instead of filling
> an array of qemu_irq and passing it around, directly call
> qdev_get_gpio_in() on the gic field.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>


Applied to target-arm.next, thanks.

-- PMM
