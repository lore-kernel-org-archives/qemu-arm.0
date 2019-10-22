Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp5964900wrm;
        Tue, 22 Oct 2019 05:55:39 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwIluZ44uUodmYP/BLXFec4n29AHiw/lEH/WPPVlWIXjkapitdLcY5sl2EQn6jPfeQYV8D+
X-Received: by 2002:a37:de0c:: with SMTP id h12mr2726436qkj.495.1571748939745;
        Tue, 22 Oct 2019 05:55:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571748939; cv=none;
        d=google.com; s=arc-20160816;
        b=f9qjVfRvdVn+WFhubgyH/jxoqgEAGmEIFqx3xGvjplpjXI2VzETcde+TGvRo9Z8XL9
         lLmKCP9YLxzgwtkCi5q/4u2hwJsCIpvPoGW3EWr3jCLsW3jCFLLUwQ/5L1vRRcKYadn3
         fZa1ZI9sOH5KVEG2Uv76o0Gf2wzkzWR0I73C6lbN0orgOnHOU6JU5Mb4Hqe7wCHjB4hB
         GhS4Qn/bm5yUoe7IoSv1yy2ddhV4gkfaQLJYiB9gdPmzJwwbUbJ0snZMuut41IFVeP5c
         78tBRXWUKBd5bygLFDTENui0nAOWTqN8BCJTVh41MmlDEnrRWWQEgPYBqagp0+Cqr8Yl
         k+iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=sn/GDBXUuAdmTWjZEO1yUcczL0rcJnI01GKFkqvT3kA=;
        b=I9ZapIiK50bXtIGtj0Wzn850/zR6jxNm6ErShYqH4QwB7PlYnVS1rf0pl+9mub0Fs1
         Kz2eZ9F8CCQ30WYgcBveiQkHXGzipbp6wmd/72Ug2sKR/0ZDWzf6Bq1nmhAfaZ1eKvpJ
         K7R2/uEvFiSKwMBri61clQT7nJqeAPjtRTTZN/4iHqaNbXgZC9+13advIMhAJaIAqmEc
         NI+KvPxdTEfJTzSy0y2TV3R6dNwtrowpY2VtsFqp/0HLnBvS+JUqVurtBRWNeFJMbH+M
         v8zxt3vXvrTOT2AHgHlx7KqBVV7G9PI1ZseXds6M36N3kfUISHPwu38Gk6Fov7bMQpBr
         hNjg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=F9j9NFdM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l3si9436055qvn.81.2019.10.22.05.55.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Oct 2019 05:55:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=F9j9NFdM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iMthL-0004uW-96
	for alex.bennee@linaro.org; Tue, 22 Oct 2019 08:55:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57210)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iMtgM-0004S4-EL
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 08:54:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iMtgK-0004UQ-Cy
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 08:54:38 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:34435)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iMtgK-0004TA-2G
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 08:54:36 -0400
Received: by mail-oi1-x244.google.com with SMTP id 83so14078051oii.1
 for <qemu-devel@nongnu.org>; Tue, 22 Oct 2019 05:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=sn/GDBXUuAdmTWjZEO1yUcczL0rcJnI01GKFkqvT3kA=;
 b=F9j9NFdMTfga1WfjjIQ9l7UY0KIs6kkjd4w8ksZfzCibRHTGmFxgO1Php3h4YGUjio
 JGgEkccAtPDyMcUIAu5Zombu5jc7RqNbZ/InvZLVXTGZg2hzpjpZoKDx3ljXls7RvzRX
 BDrsr/2owmui3P5dX/o0sX3PbHTxWj0g4fg97G/hiVcHxq+UWArgLFE+Xis+g4M8GwCg
 Okm+WKG9aoIwe+GW2Mi9X886pnXPb9SrO4AwXDbAg9SNqaNGr6e6IyeDswHrB6ADXLAB
 UQu2ORJpX5G5V0HNA2VF+GWqFuwKSoFdgzelFIcSF0jjs9hKq9F45HY/8kKZzHPK4g4e
 ct3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=sn/GDBXUuAdmTWjZEO1yUcczL0rcJnI01GKFkqvT3kA=;
 b=Lpt7Eyliv89MHBz3T7s7ZpOq+MOjy+vh2p53B1eRxfd3oD/HLe0bSPsicW/sm/EPWn
 MOyIFRxPfWV9Szr4iVvItgpHGWF7fk3TJ/peWb8onANjH4JVSCyGvUYSMnlrrmkb+Y4G
 0XZrQ7iYOJRWDK3ByfJc1aEGqj56aYt/HNqA3q+Cc14uedgl1/xaJefIsSYeN721CyTA
 8Gq6JpRZ/FBmJhgCiPxi8drdTpNr6vUkquIhuzTUYa3aTKcEpUcv1KwUEE7Txkk9YF9b
 G5fVelc9MZ8KvvX060EZG2U9kb0YMF9iTjgrFe5+rUtSsxuJuD3DffbcpOMB24YITe9N
 fRww==
X-Gm-Message-State: APjAAAVjtyujAOS4oHLJcOXb8S1fetWTEcA6nbRh2A97PIxeev8GmP+G
 Xv8GRj7kCkDymiyi0/WM0VIphmuGiMV4s1Y9iN0QUw==
X-Received: by 2002:aca:3b41:: with SMTP id i62mr2645558oia.48.1571748874272; 
 Tue, 22 Oct 2019 05:54:34 -0700 (PDT)
MIME-Version: 1.0
References: <20191005154748.21718-1-f4bug@amsat.org>
 <6ac9df42-a928-0d45-4aa5-3155a1a3ceaa@redhat.com>
In-Reply-To: <6ac9df42-a928-0d45-4aa5-3155a1a3ceaa@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 Oct 2019 13:54:23 +0100
Message-ID: <CAFEAcA9xSLbZ_gzA2r+dVVbFyA06iJJ9EUR=z53BRrORKRO40Q@mail.gmail.com>
Subject: Re: [PATCH 0/5] hw/arm/exynos4210: Add acceptance tests to the
 SMDKC210 board
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?B?RnLDqWTDqXJpYyBCYXNzZQ==?= <contact@fredericb.info>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Evgeny Voevodin <e.voevodin@samsung.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Dmitry Solodkiy <d.solodkiy@samsung.com>, Cleber Rosa <crosa@redhat.com>,
 Maksim Kozlov <m.kozlov@samsung.com>, Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rt08ENQzdFB1

On Fri, 18 Oct 2019 at 15:48, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> Hi Peter,
>
> On 10/5/19 5:47 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> > Philippe Mathieu-Daud=C3=A9 (5):
> >    tests/boot_linux_console: Add initrd test for the Exynos4210
> >    hw/sd/sdhci: Add a comment to distinct the i.MX eSDHC functions
> >    hw/sd/sdhci: Add dummy Samsung SDHCI controller
> >    hw/arm/exynos4210: Use the Samsung s3c SDHCI controller
> >    tests/boot_linux_console: Add sdcard test for the Exynos4210
>
> Can you take patches 2-4 from this series? (C part, not Python).
> All these patches have been reviewed.

Sure, I've done that. I assume we'll get the test in via
some other path.

thanks
-- PMM
