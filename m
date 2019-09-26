Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1844089wrp;
        Thu, 26 Sep 2019 01:31:47 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw12UrN1K0rbSf+6vAhhtz3RGtzOgB5ME+uosKw6YyY9Jx/BJClKHcW8EdnJ7Hz6RKJehlC
X-Received: by 2002:a17:906:b34c:: with SMTP id cd12mr2047209ejb.48.1569486707913;
        Thu, 26 Sep 2019 01:31:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569486707; cv=none;
        d=google.com; s=arc-20160816;
        b=nILDr5gTpQR4zT3Ye9Jqnfmp+skH4e1l4cD0a+tSTSCAcDZ0jj62TEjCwVH0hWD++Z
         fy8EHN0nu4ZHNdEGgOAKj9muIwrU6KRjGORtu1xZyYSkSArjfWD0FjRtlHaxVV0Bfkmk
         D29rTgr0w04s/+dSCYlhfGeonuCoXWeRoGSK5XDUEdZdUkktWWV6g72W0SHPSjYaTy6Y
         PPpnWLUQpspPgqhNDAjr5fDhRv8FGzfSIhUgZKRcBFfpg3KFAigJAIkGqVAz/kb15y/7
         97SLZR3c0tsCIDkkdbaIRK9ea5Ee+YD6WJMkKXEw+qEtpJclyiQiwwuJzfb8TRUtr93t
         ACzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=cg2ut29QP6u7q8oVmEl3m422EvhLFg+tMxF6PP1oBiY=;
        b=aFFT4+hIM/ySSFA87nXWng+XCR7m2pJuXdz+ZZbTd2iiopd6UNbGqEmGC3/LArZRhM
         eAyswtXSCsvDbtDdiW48gF9XYslBvgUNCJsDSkVsvpys1YnnwERkS6vg8zNCHgKISlHQ
         FH+yTXNNaGtNOujo+9CvXZsjzDzn3sSw2L70BaHLfrw0K1nM9syR1JwJKwNiGY56WTAZ
         UG6HOtapNRU/PuQ0A+G+0aJss0nbTSS+Qe/KwStfptte00OGabSg0R6hj8YVvyREubyg
         joTBM3YTqv1BS0qADgSCq9ey6vJQ5aP37FLOrFy96oNeXm2NSqVVyR1M734GhO5kjaoc
         bdkw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=T91wRr4A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z21si679546ejw.229.2019.09.26.01.31.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Sep 2019 01:31:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=T91wRr4A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:60798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iDPBi-00081F-Fu
	for alex.bennee@linaro.org; Thu, 26 Sep 2019 04:31:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42906)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <joel.stan@gmail.com>) id 1iDPB1-0007wG-75
 for qemu-arm@nongnu.org; Thu, 26 Sep 2019 04:31:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <joel.stan@gmail.com>) id 1iDPAy-0004b7-Kh
 for qemu-arm@nongnu.org; Thu, 26 Sep 2019 04:31:02 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:41328)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <joel.stan@gmail.com>)
 id 1iDPAy-0004ax-HG; Thu, 26 Sep 2019 04:31:00 -0400
Received: by mail-qk1-f194.google.com with SMTP id p10so1039775qkg.8;
 Thu, 26 Sep 2019 01:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=cg2ut29QP6u7q8oVmEl3m422EvhLFg+tMxF6PP1oBiY=;
 b=T91wRr4AEZJFUe4X88uhzhUp8VeYkVsoSFegtWzltCWPMaXi7jl3KuMY+MqAfMuHh+
 hANp+0XE23eEpYl0Km4xSWTeVHAeLF2OWiXEGroUpOntlbyNx/96TnBD4DIFo5Gs8Kd6
 5SGoD8bcxZlgF9h/ERHsvERIgLJBtLA+Qiu6w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=cg2ut29QP6u7q8oVmEl3m422EvhLFg+tMxF6PP1oBiY=;
 b=a171S9rvpvVSAQHd9qJQ/gTM8P8Rm/LPs+SuQhhv3xuStHjGm4dYlyYbC6W0qG4k8G
 Lq/ddCre8uFZinHVUgRnurkrSp8oFA/IMapCxwvDz/FRsH4+Xp12ONHiItWd/z9d3RkN
 839Y3NvojXnLKkml4PrOxIc2gieWZbE3/25mBrLUcR4a77Maa2e72JZdCrDGN6k1y4fR
 GeB9o5T596N5vaEjIMW4HNVUR319x4f9Aat7hBi8koWPqD3nM7rVLywk8zGBjJoR5dfO
 LqX8V38y2S9oifco6ZkqsH3zqNmoj8Z2cBcVpXrElhii3KIOWqN+LWLMx99JKshPG03d
 gEjA==
X-Gm-Message-State: APjAAAXCprS5fa12z65f4uJHjusJW0SE7UPswXuI+uXg2+Av7LzWD5QT
 77MUvHj6dzdjh0/uwXkI/Ox1Ji623xClRA0ZkuY=
X-Received: by 2002:a37:f61e:: with SMTP id y30mr2064158qkj.208.1569486597084; 
 Thu, 26 Sep 2019 01:29:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190925143248.10000-1-clg@kaod.org>
 <20190925143248.10000-5-clg@kaod.org>
In-Reply-To: <20190925143248.10000-5-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 26 Sep 2019 08:29:45 +0000
Message-ID: <CACPK8Xet=D0bu1w_AxdGoK90LuDF9CU=GJjDy6Zu4SC24068ZA@mail.gmail.com>
Subject: Re: [PATCH v2 04/23] aspeed/timer: Introduce an object class per SoC
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.222.194
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
X-TUID: uNgxQWJDHpcH

On Wed, 25 Sep 2019 at 14:33, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> The most important changes will be on the register range 0x34 - 0x3C
> memops. Introduce class read/write operations to handle the
> differences between SoCs.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>
