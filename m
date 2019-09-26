Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1844761wrp;
        Thu, 26 Sep 2019 01:32:36 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwWvyN0fOWXP4aC6zA5/TfqdaqcurmapmWfbI6/pZDd60j0677lXAEKt4M968OcST04NvyZ
X-Received: by 2002:a17:906:b84d:: with SMTP id ga13mr1317225ejb.236.1569486756771;
        Thu, 26 Sep 2019 01:32:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569486756; cv=none;
        d=google.com; s=arc-20160816;
        b=maQ47HClugZWjnqFZFk+Miuk+yiT2/NeprIFeTg2Y/Ik+5+zDF8XmSEK0tj5sf4wjO
         YIC3mFN07uNOZ3h874IJ1getCt0I7W5YE4yyyiY+onKDRntJ1yVXkyMTiHkr8p+qB+3G
         LNQJEzla0V0dA9IfThN1FGAhZkhT7HqqMbA+oGHFFaozmDmWG9MYZaq1d075W8RNOKbG
         LTbAMdQXx+qd2zon6fJUaGPwnCwpezFsTeESmxml8G+wqAMY1R9AmJ/2dpuczXo5/p18
         q+12aLAX4HBjXTrp1ary0H3sOWsKJv0HWbMoQ2NUKSkDKedGHkgS03ku2NgNvZEcCa24
         b3bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=O0m0+ASv5bNMX1fJC0A3etI6ESjZ/QMosSeHzHEHeY0=;
        b=Nf4HGRA3Fohb+Jv0/+gaCBasgkFkOvzP1LKhiqz1YqJ6O6B9f9V9AShWukw8Q2/lPa
         hBg99DBANhlfQsWMLxItzCL0AG5pKP663LSR5J9gdfU6crzDPAC5RIszdrD0JqTo6cKO
         TzpRKC1AmQTHOEEyhKTubTTL1/2VCfwxd+kWGYeP2qS0l1yzC9U/9/cA4vM2PM9Sc25i
         AuAtSlwnGaOOriNsEcbbzH+DpwIbzldE58fT96FfL5GZ+mJZ/C5fD4ePcO1PywhDNdU9
         WlxJh/wMKb6X1xaVD2nKzzSBm9KQBbSL9rCJd8JnqMwPlCgLdSerpBkfdCTdekKui2RU
         ULug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=PYW7e5U6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o32si902108edc.306.2019.09.26.01.32.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Sep 2019 01:32:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=PYW7e5U6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:60806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iDPCV-0000Nh-8e
	for alex.bennee@linaro.org; Thu, 26 Sep 2019 04:32:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42959)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <joel.stan@gmail.com>) id 1iDPBH-0008M4-TE
 for qemu-arm@nongnu.org; Thu, 26 Sep 2019 04:31:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <joel.stan@gmail.com>) id 1iDPBF-0004ov-Ui
 for qemu-arm@nongnu.org; Thu, 26 Sep 2019 04:31:19 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:42012)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <joel.stan@gmail.com>)
 id 1iDPBF-0004nB-R1; Thu, 26 Sep 2019 04:31:17 -0400
Received: by mail-qt1-f193.google.com with SMTP id w14so1791858qto.9;
 Thu, 26 Sep 2019 01:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=O0m0+ASv5bNMX1fJC0A3etI6ESjZ/QMosSeHzHEHeY0=;
 b=PYW7e5U6NoenapiFpeWUOzzoxXeHJw6IGNl8mSY2pow7acd71exAF0iFwgIvV9tPl8
 olYcMU3nJPoLDtf3JPjkcaPnT3P/NdZejbxj7FTvqwhnvYQVzacbkfUxLSoQjEw0MRAa
 Rvm4ZiAsJy5p1nomkDCQvag6L9AQCLe0EDqSo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=O0m0+ASv5bNMX1fJC0A3etI6ESjZ/QMosSeHzHEHeY0=;
 b=NDyCCaYD/AgPhCp+tYApo2G6qpERgYngW1HIiGwdbqmcmMxBlhyxkmq08JoNAUrfg0
 gva+FRerX8FNuXthcTaWfvWIhFWfyujOCn8VkVa+AkuYknsxpI9Ub9ZEJgT0eOd5dTX5
 v4p34LYDKa3nhIl+6yBHdz1waCIhx32xLtMeCCv0VMp0/eaqxikouqE8J+QPa7Ll3hxi
 4riAsOrpNAeJD7schzmiU+wBJsRH0foFSAuCGYPkeuM7pAiV7tmO/nQfWxxt2czJnW8L
 1rxvkj4hTyr7/gTKOjoAqaZjlIyEZ8eSx/6rUTpeTtVU4cVrJChB0MpB5XxIdLQID6L4
 Plww==
X-Gm-Message-State: APjAAAUGvUkVllA12MhL/sdpNh21Gati7OrMphelnMd9rz9/yjKsHet+
 +TEfTU/CzBnyFnEI5JySCoL8c/ddmmgKQhw5MVU=
X-Received: by 2002:ac8:2f81:: with SMTP id l1mr2670640qta.269.1569486614145; 
 Thu, 26 Sep 2019 01:30:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190925143248.10000-1-clg@kaod.org>
 <20190925143248.10000-6-clg@kaod.org>
In-Reply-To: <20190925143248.10000-6-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 26 Sep 2019 08:30:02 +0000
Message-ID: <CACPK8Xeg6ELCnLNbS1W+ZLRFdaA4efd+d+j=aJBMgQX8VNLssg@mail.gmail.com>
Subject: Re: [PATCH v2 05/23] aspeed/timer: Add support for control register 3
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
X-TUID: M2U7/VgsfJpB

On Wed, 25 Sep 2019 at 14:33, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> The AST2500 timer has a third control register that is used to
> implement a set-to-clear feature for the main control register.
>
> This models the behaviour expected by the AST2500 while maintaining
> the same behaviour for the AST2400.
>
> The vmstate version is not increased yet because the structure is
> modified again in the following patches.
>
> Based on previous work from Joel Stanley.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>
