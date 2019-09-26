Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1839579wrp;
        Thu, 26 Sep 2019 01:25:52 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyL3+q/03EE5gYS4JUWjzLUIf990pOjErQ1WRyaZg4tPT5GLSlYfBVjU1+ZZbRJZeMxnEfU
X-Received: by 2002:a17:906:5214:: with SMTP id g20mr1934561ejm.220.1569486352172;
        Thu, 26 Sep 2019 01:25:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569486352; cv=none;
        d=google.com; s=arc-20160816;
        b=dts3Mw5ro49xnCMbshiwWmI539HpvolHwNlUCxKnxQkZeBbULx0/+P5dX3CLvg5QWj
         I/fsfsS0KCujaDkCt0QNMFbsdbi8C7PKJrQeRcLM7cJgKNDHZVqM6tsf+4C3RYrNKp0N
         CEjlUZAbt0sUIPxVprl9p5tBBGQFPAfqLxhzwN4gOibNhNk0idxMRQuqVIKA84q/+0De
         Cf4FtGrwUXFnXzwu0+h3TwYuwNJBv+DZDp9COG8lItWD0x5JQXAdcmBmJ9LbAMTAfpf6
         T4kSDiMzQur2wv9fT4hdxUZfrCZmRPn90JRub0OwjdMa+uu4TYlKiEb5teKs7n0YadzY
         N42g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=D6Mx/VpyHufy8B0XMwB5HfzvyGWw2IgWI1L7L02xe6w=;
        b=t1sKzbSV8abtwWKC/HyunWcRlic1pJFHBNMi0GiMIt4ufg6QAscX79DiZgi3DOwyfl
         HOQOgKeYUMhzkPbN6lEOs9veKP2L3SAAOburOwzUvy/PKJ4sFSZC2BpLmSjy9fUjDMaR
         LfDDlVonXiWl4+vJTyGG9GhfzZWa3lQgWbfZn1/e3XHUGmo7tuzRPs9TdrA27wSaZPrp
         yUG8EyRA27irA7kWSOD0L7NsFEGZgNh+X15gUpWP+C403xnYSnNZrpMoUZQZj4dg8lNZ
         b5bE4XpA/CLJGbauHlf1Ar8RE4aMHLp0Ot6I2e59xdNFMCJCWzyIzSsoZiEBtDQeERyI
         ystw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=PCCtXR35;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b16si899531edb.341.2019.09.26.01.25.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Sep 2019 01:25:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=PCCtXR35;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:60764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iDP5z-0003BW-5E
	for alex.bennee@linaro.org; Thu, 26 Sep 2019 04:25:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41858)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <joel.stan@gmail.com>) id 1iDP5f-0003AQ-GJ
 for qemu-arm@nongnu.org; Thu, 26 Sep 2019 04:25:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <joel.stan@gmail.com>) id 1iDP5e-0006Ab-Jc
 for qemu-arm@nongnu.org; Thu, 26 Sep 2019 04:25:31 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:35777)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <joel.stan@gmail.com>)
 id 1iDP5e-000695-Ez; Thu, 26 Sep 2019 04:25:30 -0400
Received: by mail-qt1-f193.google.com with SMTP id m15so1837471qtq.2;
 Thu, 26 Sep 2019 01:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=D6Mx/VpyHufy8B0XMwB5HfzvyGWw2IgWI1L7L02xe6w=;
 b=PCCtXR35cTDUcjZKZbUnNzeTeJ76Ji4glmcU3g6p9OoB5IKNOKiDK/dz5YvkzRe7RS
 mbldH6sKk/eF5n1rmqAsIBu37M2TdsOpKdcA5i6ZU7yzjmbgLKz/WRU7Q4XI4q6lpi3k
 nlfyH+ZDMMTQ4YKzuJVXolYU6vhqFoUQ+Joos=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=D6Mx/VpyHufy8B0XMwB5HfzvyGWw2IgWI1L7L02xe6w=;
 b=LwZswgceNMx1vOD+xfrcAzwxeH0jL1KRNxy12riSu603xbElVMHeqshszHpWh1I73U
 BunAA6RASSa+YoIGdFbAl4MSaA7IyCSFehzHuw14N9iYckb3ww138pfoKY63iRLARzAG
 XqjynLwsFEmg0UXCb7YQxTt523WkxwsJV3vd9mGePcXOLt/MiVq8uaf3c2LJjalv5t2l
 +0HehSl1KuCxnt4LnQNYUbcuT5/88SIwuqIiVrbujX6j3zjkf89bxCxFwkEjaiyd0L+c
 yrHHmQ7GRxV52JuxBwhRrR2S9F/mhmQYxha4Qwwx+JOshi1zF6tFMDHJFTMqrbPI3F6s
 QxuA==
X-Gm-Message-State: APjAAAUQXIKOvuO+t6JEDHAB1TLgXTLEULGWWzaVxzYFyLXQhiGsqnSg
 hZzhdHTmAekD4kN2aNpe9GFkYAxIA2+mwJurP/EBkQ==
X-Received: by 2002:ac8:2d8b:: with SMTP id p11mr2679264qta.220.1569486269825; 
 Thu, 26 Sep 2019 01:24:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190925143248.10000-1-clg@kaod.org>
 <20190925143248.10000-14-clg@kaod.org>
In-Reply-To: <20190925143248.10000-14-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 26 Sep 2019 08:24:18 +0000
Message-ID: <CACPK8XcoXmFqBWN2jwAb2SYkwY4Tn7qwo_Q=+OaNS7FrSQ1DQQ@mail.gmail.com>
Subject: Re: [PATCH v2 13/23] aspeed/smc: Add AST2600 support
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.160.193
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
X-TUID: BdAiLarD0pXX

On Wed, 25 Sep 2019 at 14:34, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> The AST2600 SoC SMC controller is a SPI only controller now and has a
> few extensions which we will need to take into account when SW
> requires it. This is enough to support u-boot and Linux.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Acked-by: Joel Stanley <joel@jms.id.au>
