Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp4599978wrm;
        Mon, 14 Oct 2019 08:50:35 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwTj+UY3B7diYt2keuXV8Y9BvT12dEZDU7jiRCYYN8PDJaMZkEvLJEHOT0GUkDYo92Ul1ES
X-Received: by 2002:aed:2f04:: with SMTP id l4mr33172683qtd.345.1571068234793;
        Mon, 14 Oct 2019 08:50:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571068234; cv=none;
        d=google.com; s=arc-20160816;
        b=W5T922+yfsJLe1GrRP9fkfFBxcTWRjT/8uhkxwPJzQhZzMYNdPYBR/T3OccV/w8AQ5
         Lz9AyBaF8YewayX4keFRokJ+DcDu3HaLUcYQccflcwlP1IqrbVs9uYUxXlFP4KMuZ4wK
         bFOBFrV6+//oLZtEh2gKhz+081gZt/j1spA8GGNVYoxVpPFS8AVJ3qrtRSSq7IZ8QFz5
         hSYK3lIJ9wwB2Mq+IsZ3F0fBwkNanYDvyA1TvygNkP+DeLI8ziurU0bTnL+KKYrFq1KL
         UlA6eKUq9iOm+oblZtG21tFW02+SPoLLBI2GWrYIYt2sxRBoXFikrBgVim6ord9RgCuo
         joVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=rCb7D5gkeVaSwddOI1LsIISMT/+XwM/ydhEjVq54D/I=;
        b=mKLpES8opP6KFF0RNGwqhtP1L322rXkPpfeSctRDC2Ik53cA/RH0dggPYndFJwZIaz
         wUzvzg0kwbRmeO27kl4gRcbNm9t/o8UtWh3iNZCgQ36zhC/O+ICp9Xm0pAD0dOHBtqnS
         ocjEAtfGa8J8d+YCXH8osLv8qoKFvGJOQ9jiJdtu+qGLz+OjHVSByih1VgaXNHEWAtWx
         hnEpqMkb1lj/qudz3gYBJQabmAk+u1cZlTlAYFix28i62RLty8jcDdNX04ubkzXgG3Fn
         DUbkW3oZ8pWSZTKHkl4shHbPrm3Zx80Y/jAudZlddYpbgpMLFsnJYigpQWDObwb/CM1d
         te6A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hdv26wwp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y63si17538282qkb.261.2019.10.14.08.50.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Oct 2019 08:50:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hdv26wwp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iK2cD-0000Xm-Qy
	for alex.bennee@linaro.org; Mon, 14 Oct 2019 11:50:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33835)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iK2Yh-0005FQ-8Q
 for qemu-arm@nongnu.org; Mon, 14 Oct 2019 11:46:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iK2Yf-00084j-6d
 for qemu-arm@nongnu.org; Mon, 14 Oct 2019 11:46:55 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:37860)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iK2Yd-000836-7Y
 for qemu-arm@nongnu.org; Mon, 14 Oct 2019 11:46:53 -0400
Received: by mail-oi1-x241.google.com with SMTP id i16so14147046oie.4
 for <qemu-arm@nongnu.org>; Mon, 14 Oct 2019 08:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=rCb7D5gkeVaSwddOI1LsIISMT/+XwM/ydhEjVq54D/I=;
 b=hdv26wwpptnVy/gkVYCbFhooTIAP+apKZzNcOKvOLDDrOCYAcP3nRXxqqW3askA9l9
 jdAhF2O6Lb/eV8Hmn+oM2wGsbCvw70HmZagb6R/CO4uryHBaAxmafdLeOtppxqXpLhqa
 9IsWdMuZFtEN3izdwVJ4QlPlZPa26AL1yr3T30LcLjTMMwNRFlyzcRdviDE6EZPtom2a
 YHy+Mq58Bq0vP/h0+YpASbY/yKMeMiuYwU+NmZiqy9Pu0V/pWqeDWAzl08qr1xe9NN5X
 8TfOPXtZSFC3wFKv88G0+Tm9cd0XP/5DkTTYGnqK8Zj01OY6yRQkNeogDkqZuzapkvxT
 py0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=rCb7D5gkeVaSwddOI1LsIISMT/+XwM/ydhEjVq54D/I=;
 b=Mj73E1061/8y9+gDU/aohjUJJ0THfR9RYgCU1gEZnd1axq+t16loyrtD/pL6KUbGdk
 WGeN2/D3zIBodZGlWh56AuBnV1OqCOJ58OT3MlcRsF+ei/Rub2NOLGhSiaa7EOUH1wVi
 M/Cez84v1obr8pkDT1gQ3t2drfkC8jVqIbR2a84dAs8jvbjCHc2VbAgjEUaLH8AzQW13
 dn1L8QuUi44H+rR7kllA0qOhNtsKtjitVgH/ukGP/FSBU+dTRJ9F85KI/yW3X9vGV+Yh
 f/vpePoEe/5P+vl6r5i73+yP1AdrAtF22fFKRNsrOfX6+sovlk7rZUOrTQVYjDJoK57O
 J7Jg==
X-Gm-Message-State: APjAAAXeHudGGDB4rd1Gf6vwYrwUUEN0TQt7mtaHcoty8kfDra7CTo+C
 euWFp7AkPqwanI7XykqmTtea9HcS8corNPT51Eanzct51T0=
X-Received: by 2002:a05:6808:9:: with SMTP id u9mr25460529oic.98.1571068009994; 
 Mon, 14 Oct 2019 08:46:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190925143248.10000-1-clg@kaod.org>
In-Reply-To: <20190925143248.10000-1-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Oct 2019 16:46:39 +0100
Message-ID: <CAFEAcA_i_3p8AJKWCVA4VcxBj9g1y_atid1Di4eLhWKkfY00Vw@mail.gmail.com>
Subject: Re: [PATCH v2 00/23] aspeed: Add support for the AST2600 SoC
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::241
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mv/Q/RjS9H9b

On Wed, 25 Sep 2019 at 15:33, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> Hello,
>
> The series starts with a watchdog fix and a new model for the SDHCI
> controller. Follows the code for the AST2600 SoC.
>
> Most of the Aspeed models are reworked with an object class to
> introduce the AST2600 variant. A model for the AST2600 SoC and a
> simple AST2600 EVB machine is proposed at the end of the series. It
> can boot the OpenBMC firmware image which is currently used for HW
> bringup.



Applied to target-arm.next, thanks.

-- PMM
