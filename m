Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp7009244wrm;
        Wed, 16 Oct 2019 04:25:35 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwKDKmDEgWh62cvydygzuaCqAEpaakwWyqdqu5gRkcQ9Cvz9vkhJuc4cs1Gu9dO2Lws14aU
X-Received: by 2002:ac8:7302:: with SMTP id x2mr43850184qto.323.1571225134971;
        Wed, 16 Oct 2019 04:25:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571225134; cv=none;
        d=google.com; s=arc-20160816;
        b=yqLm0KTdb2LsDEAk+pqZtJTBve6kxYolXhfoqwgIltFkHrfnqhDzzPO2TJItq35AzJ
         O/fbmSm3ZcFJQA/dvYHNF9pUzv8VM2oB3ABPWT+Ri2jiRToOBAvzD+MXdHsZaPSbHZOk
         1gI9gNTMrEmpqKYEvcTtJ76SBAyCavJu/ZjqWwm0RkB8dK7kjl6YhecXPvqlSBTAAxDK
         2GO6gQqqZ1QkVYat2ECQLYDMW0oS4d+aJkUchwTXlfEzInCbIZqv+2D05CWcY50pl3Qz
         ObdZd1x5nyStfswynQdByxeQZxIAUDrPww0a0gO5e4ialo9XWrZXUabHeU4uYyhcnTZT
         F+Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=eH+1OsIsWYsvPFE4doGalrk7GlwE8kT2Ztu1aB99Yoo=;
        b=TEehbxss9ZZXXdEufoq/PrGwz1dbsu68KxI8+0AZq8QdqNOjxnVg3pEzeh9nJAb7tg
         Q8zdFbb8LnZiNyebq2M1tbDY9giEWqk+X9f7VPtfbTScHabtLWFE/eG2+us54A4hubTE
         Le10yc51yoZk5NbzqDJhKxcR0tkBQT+LsQuO/RD1/1qRRJCrYun86fNyBli8qhZSTAgk
         oMaImmilexMbPo1DJe3ZleYpieStHf4XDsfeNB9+Kw6mOVAidyx6MVNt9Zhy3VhwtMQf
         Xqc8r4BQ6glvPhG4cilsVREHLtgvsfBnMlFduRxGYbxPE2HPllEto+1wmz62cBzTFxJF
         Kvew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=DoJ1Y9pQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d10si26768529qtg.260.2019.10.16.04.25.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Oct 2019 04:25:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=DoJ1Y9pQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iKhQs-0006DJ-6h
	for alex.bennee@linaro.org; Wed, 16 Oct 2019 07:25:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42286)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <joel.stan@gmail.com>) id 1iKhQK-00069I-GR
 for qemu-arm@nongnu.org; Wed, 16 Oct 2019 07:25:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <joel.stan@gmail.com>) id 1iKhQI-0003oX-Mq
 for qemu-arm@nongnu.org; Wed, 16 Oct 2019 07:25:00 -0400
Received: from mail-qt1-x842.google.com ([2607:f8b0:4864:20::842]:44054)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <joel.stan@gmail.com>)
 id 1iKhQI-0003oQ-JE; Wed, 16 Oct 2019 07:24:58 -0400
Received: by mail-qt1-x842.google.com with SMTP id u40so35454834qth.11;
 Wed, 16 Oct 2019 04:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=eH+1OsIsWYsvPFE4doGalrk7GlwE8kT2Ztu1aB99Yoo=;
 b=DoJ1Y9pQldeRYkhrgN/gM0B+noh/KN+pWnmVqFJ6bAnhrkiEwWUmg6Q3/igh3DXkAX
 cbdjoBno+iAx7mdiQiHpbNFAhNqgeRDsE5sF83DalUviqXsb5fXvwpU7NPslyIr63K+L
 V79jOpLm8MLX06EG4gGZln3cF/FPNigezkGt8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=eH+1OsIsWYsvPFE4doGalrk7GlwE8kT2Ztu1aB99Yoo=;
 b=r3rxmZ1Tv8hwarJmnTk6BvOzvMuAm6XpcQ6a3SShJcBn5u8+hcvTuJSMSG3SDwGmn5
 5nIxqxvINiuAdkKr+/6wRHfH5dc07spWV1caWQjzsZIYVYTVMLDr5veknpq/bEuiU1uZ
 2JFN7WYff4f2RwigjYfiguq54PF9y7C3Rg6W3IQB+DHhHbkzqTiEXL8mDzCeL1CPCw/v
 96CJ86Tcf5kBrm/D9+UcIsgPpnLlS0HTeQF0h6tOj5LGP2D/uU+wXxPghz+rfVvCSKrm
 ujXY0DUzlJXOea1V6iBXS67pSKHCAU/ln+jz2+Hco7bdSUHFpTW8/3eOlYeW5ga4Qdgd
 coaA==
X-Gm-Message-State: APjAAAU56NkPG+iLaWbkMBxpfoPKIi1GxNGx3hNQKkH0QUmywKI/XWIN
 2d2Ly6cIbA9QAGV9U+ENoh7pPnsCOmWhMrA2He8=
X-Received: by 2002:ac8:5347:: with SMTP id d7mr44263224qto.269.1571225097946; 
 Wed, 16 Oct 2019 04:24:57 -0700 (PDT)
MIME-Version: 1.0
References: <20191016085035.12136-1-clg@kaod.org>
 <20191016085035.12136-6-clg@kaod.org>
In-Reply-To: <20191016085035.12136-6-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 16 Oct 2019 11:24:45 +0000
Message-ID: <CACPK8XdoxaZjH=vCB5Vm-vv=bxLdJ1A9DknAUkiCzzsmBj+GNQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] aspeed/i2c: Add trace events
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::842
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
X-TUID: Wrp3N2kX2Ug6

On Wed, 16 Oct 2019 at 08:50, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>
