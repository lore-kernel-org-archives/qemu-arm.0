Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp797901wrt;
        Fri, 28 Sep 2018 07:43:51 -0700 (PDT)
X-Google-Smtp-Source: ACcGV61LZAmjKDubalNMH6NmWsnr4BjTWJUPgxWf01MIBwZyANhjNgLv5+VAASDLcUSsQllPWD8v
X-Received: by 2002:a0c:b6c1:: with SMTP id h1-v6mr11852644qve.141.1538145831716;
        Fri, 28 Sep 2018 07:43:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538145831; cv=none;
        d=google.com; s=arc-20160816;
        b=e4AkBmqYNz6jpRw8DheO+jrYd5Jc8blp7zqiSx0jW3xfC935OvLqvDBdUpIMsYhQLi
         JbjKPXhPxj2qLEiuY5PAwAWB7ax7/lhEUd+V6HSYtdsfimXnJjAeXpJ1gP1Qoy3siQHa
         cepTgOIvbYdjTDzYqotOL+bQT1+ZU8S5q7eCu3f7zPii/6S4N0Yl4sXbVvVU4F92MjPA
         5Nhg9OUkOxKtKT/5ganE0QPBGP0PML3hvbUsRyRsEZ9KhPZWesG6GOkoSVMSCsx8072E
         9LgsI7aFXs2PXWCdmtktj5DjBeSXei+O2l3QGBA9zTWjZB0Pl/Nng7Tdv7co2l0BffPl
         dZbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature;
        bh=39LyydSVYUHc7lAibJHKx1yskvapPWpH5TY2SUc0h+0=;
        b=n7H+AQq7RrsywHAqodAAqmBjcaADiF8IXHacrtpgRt1hvGyyapsEHgWpy8NLWWwEx/
         UKI2YvnxFd3bK7DWHG1dnD72hpJn9QShmusGL9+5njF0ujLlmoToh4e6mR2DAy3uG1EK
         yOshMBvKYeCQ7TkONj6xYDQJn4s/vMrnLIZGapEIDbpGmEh/F0hO6+V73DCC7jO1Vy2t
         bis4XiwQNP2h4wmtas1uUDMBiEXjW+plaoeny2ciibYmIPMkxEGoqZuycbtlnpM6rNDv
         Ri0LgwC2T49RiKsnFK9cUTnyua5VXtHgb4X4zWaYyIdyL8C9vVnZ4K24krXVZfFwTqVs
         VoDg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AH9Erg8q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q2-v6si984846qtq.186.2018.09.28.07.43.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 28 Sep 2018 07:43:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AH9Erg8q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43763 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g5tzj-0000Xi-6l
	for alex.bennee@linaro.org; Fri, 28 Sep 2018 10:43:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40982)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g5tzW-0000Vj-9m
	for qemu-arm@nongnu.org; Fri, 28 Sep 2018 10:43:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g5tzV-0004GQ-Mq
	for qemu-arm@nongnu.org; Fri, 28 Sep 2018 10:43:38 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:36864)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1g5tzV-0004Fz-Gy
	for qemu-arm@nongnu.org; Fri, 28 Sep 2018 10:43:37 -0400
Received: by mail-ot1-x344.google.com with SMTP id o13-v6so6265595otl.4
	for <qemu-arm@nongnu.org>; Fri, 28 Sep 2018 07:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=39LyydSVYUHc7lAibJHKx1yskvapPWpH5TY2SUc0h+0=;
	b=AH9Erg8qi+Se/D3zt34BUkICeM1rr+9A1ql6rGwViECHAd6sdxFuTW6KMMxrO03c/S
	+wzaRG7QuVhp5cSzWGtZqqIFzIGx14xSu/f+cXVZul26/e3YQCzMtYhHj0BjtbhyFoZc
	x+h2oKXpqnlJHpbGW8GGndLpBS9jQ5/EYYFcg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=39LyydSVYUHc7lAibJHKx1yskvapPWpH5TY2SUc0h+0=;
	b=EP4ta0IaoAL6/GalybdqVbMQ4YfX+YWqcr15FQHtoW+iL7DA7hvsIsFilhDdAJSGhY
	XGZFjz9iSbD41E9Rs0WNjB9VJvE8PyCTf1LFN0ely+HwiNm15l+rGB+WImyrwp5doGqk
	pkDaA9O4dhbQIcpu3b01RUeGNk07R29YHe5JmGQVsuoyiCvYaZ/sQfB8PGE625I4tNpg
	0IN38MVENeERvcJDoKelKjz+66DQUc7qy/HKiETZHEDM26KImUYOVIH39WPXLPyI7cFM
	zm1bl584GDLFMhTvI4Q3MB7HbrbLYbSnObDlDJA6LaKLCP9CuDXUGgi2+qmnzFUvEbyb
	xS4A==
X-Gm-Message-State: ABuFfogE4s6INIvL2J6hmZj3YiKxFfbm1sMfrrJX7CnV4bGgTDzrp6O7
	4zaLs7U3GNbq7NpiDORa06Hrbbrna9iglKVHvaHoFQ==
X-Received: by 2002:a9d:210a:: with SMTP id
	i10-v6mr10350918otb.238.1538145816881; 
	Fri, 28 Sep 2018 07:43:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:20e3:0:0:0:0:0 with HTTP; Fri, 28 Sep 2018 07:43:16
	-0700 (PDT)
In-Reply-To: <20180928135003.8650-12-clg@kaod.org>
References: <20180928135003.8650-1-clg@kaod.org>
	<20180928135003.8650-12-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 28 Sep 2018 15:43:16 +0100
Message-ID: <CAFEAcA-hFpXOKz5yfBbNwJGPLG4DqUE7TUYLLJ8stzbk5kq-5w@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-arm] [PATCH 11/11] net: xgmac: convert SysBus init method
 to a realize method
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Rob Herring <robh@kernel.org>, Jason Wang <jasowang@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gbNjSvldc/m9

On 28 September 2018 at 14:50, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: qemu-arm@nongnu.org
> Cc: Rob Herring <robh@kernel.org>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  hw/net/xgmac.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
