Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1960964wrp;
        Thu, 19 Sep 2019 22:11:01 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw+cKGZdMxvUopa2VO046a43HzlFHjMpUpXoywck2bH5agH7emVngUN9CDSL4sU6QOQzGdF
X-Received: by 2002:a37:9b0e:: with SMTP id d14mr1726252qke.315.1568956261156;
        Thu, 19 Sep 2019 22:11:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568956261; cv=none;
        d=google.com; s=arc-20160816;
        b=EUAfQ/E/Ms8thyFkNXIaCJvwWSrEZV1kyacJox+504OwbtE+Q9bQtErxn+slduRBit
         YqjoSHtlrvZBDVqkjFWObbUcYJtzf+3tlW+v52ZZySkDDEVh/CjwnWtp6tcXZAHR/lIH
         amx1EWBvS1OFWe2SAmb19F4CGkJ/XI1zVptFRmCwX3Rbs0Db2cmHpdXMBayBRwAQH7+t
         N5AI4F5MrD3knOJjMUMLIquh+pFPwX7zV0PF6kGgkyaiO1seE1LuPZVfdgbgSD0x2ljc
         mhfqanxysSHythSN5Z1gU4znnGn0CLd0913zu96XEU1ChCrveWJi9Oshu5gfE4YyiofC
         QgFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=g0qEXed5iOU4JinfxUM2U+9IdAViVG2LZAwSzlIGZDo=;
        b=on9RHgK/YfI5MLK4eAXtMps4w9bVmZnXmugeHMnpxH2wGYlcU+fpJEChFJxRDYwMFD
         FIXHHH+mxw8lB6iENGyaieL1Pw2+KhjlrvY03F+v6KsV99W+HQs7mMIPrm4zDQuuyNyd
         7TbpHfA4fTt5AIWSYSo0GovyE0ikGdQuy3l6vA8+DGUBOF5gLxBg09tVVnRH2FIdMIiH
         R8nA/s8Owl3ZKUJBITdIkSzIfsRfV/66cqPkEJoHD5X9mN1DCwgXyfB6aZS/njXtg6C1
         nYdRff9YEs/peWX375g1Rezhe/1p2eHoWG3qq3jScNJrkhcMATOsYPO7LQNLLbaWt60Q
         gagw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=BoEDMyif;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m9si1161652qvh.13.2019.09.19.22.11.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Sep 2019 22:11:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=BoEDMyif;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iBBC8-0000hk-GJ
	for alex.bennee@linaro.org; Fri, 20 Sep 2019 01:11:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36903)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <joel.stan@gmail.com>) id 1iBAwl-0006rO-VS
 for qemu-arm@nongnu.org; Fri, 20 Sep 2019 00:55:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <joel.stan@gmail.com>) id 1iBAoS-0006x6-Bu
 for qemu-arm@nongnu.org; Fri, 20 Sep 2019 00:46:33 -0400
Received: from mail-qt1-x843.google.com ([2607:f8b0:4864:20::843]:37475)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <joel.stan@gmail.com>)
 id 1iBAoS-0006x2-8H; Fri, 20 Sep 2019 00:46:32 -0400
Received: by mail-qt1-x843.google.com with SMTP id d2so7233193qtr.4;
 Thu, 19 Sep 2019 21:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=g0qEXed5iOU4JinfxUM2U+9IdAViVG2LZAwSzlIGZDo=;
 b=BoEDMyifvs3cFsADrs6qHOaqBaoF706geX3KrwzVygQ3p7hll/G7g+73EP9DOeGQp+
 +7GyYuPW/VKg1yrYS1y7Lq7n86pQeFnQ9owD0F6Cml4rR0FfH9sbTkbw+EUXQPl1Iyun
 Sjq8JQai6rWHjZamUt9zkLqiEjBw8FIrfwZ/M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=g0qEXed5iOU4JinfxUM2U+9IdAViVG2LZAwSzlIGZDo=;
 b=VmJeA/EmS3jKQfQGMwQUMCopz/tZfvHpffPfC59zpZ5R8cvJZPf39R4F+8/7A9IKSs
 lnM1Ez8JeVm0YU4otvKE270LaLKGoRXEh7BiJ81XAH/v6R5pISzKxdTClGJpgIAdtDXr
 rK17LTVL/XH0VwFpvWgT4I6e92QWk4hGTwtjlC9QwSqQnaxNI7Z+L+9oGs2u17NBzK5k
 of2+jVagGwfHO+/qx5gYERL09qOBUpib7mgFLzQK9XFuBdcF9bwO85h8+bSraUX4DVIR
 tIqvFjhBq2mogEaEKquRZ/Wq5c2dkfdEkf+hKtEfardI7oM5mWaKt/5v/aa16RU1daBX
 fgGg==
X-Gm-Message-State: APjAAAVkFK1F7xnn9gpBDLyGW/EBmZRZ7VDi1tVB7kKSXDRqBPnQTRVf
 EaDqQWziU2zuY0PXjEHr8jmXplb1l2aSYfGnLKs=
X-Received: by 2002:a0c:e48b:: with SMTP id n11mr11678939qvl.38.1568954791622; 
 Thu, 19 Sep 2019 21:46:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190919055002.6729-1-clg@kaod.org>
 <20190919055002.6729-13-clg@kaod.org>
In-Reply-To: <20190919055002.6729-13-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 20 Sep 2019 04:46:19 +0000
Message-ID: <CACPK8XcJRT8fa81vp7aC8f+yfOxaHMFd9+tijq7j1D68DGbFcQ@mail.gmail.com>
Subject: Re: [PATCH 12/21] aspeed/smc: Add AST2600 support
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::843
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: spesyvCCx98C

On Thu, 19 Sep 2019 at 05:51, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> The AST2600 SoC SMC controller is a SPI only controller now and has a
> few extensions which we will need to take into account when SW
> requires it.
>
>  - 4BYTE mode
>  - HCLK divider has changed (SPI Training)
>  - CE0-2 Read Timing Compensation registers
>
> This is enough to support u-boot.

As easy as that! I hope the Linux driver is as simple :)


> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>
