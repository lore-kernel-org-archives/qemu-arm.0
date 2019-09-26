Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1840465wrp;
        Thu, 26 Sep 2019 01:27:08 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx5HemaFfKiKsLH7/6/cFU1Bvt/Hht8gQyDjC50SoRFPk4prjQO8wWCm3fxs3sFetVvxByb
X-Received: by 2002:a17:906:a84d:: with SMTP id dx13mr2039916ejb.230.1569486428145;
        Thu, 26 Sep 2019 01:27:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569486428; cv=none;
        d=google.com; s=arc-20160816;
        b=qfu4vHpDFTAA8AWkvGwTmRYMu0vBk+Y78M2UB5ZpT2n0eQb3ILVqvr364mMetsEudF
         7uOnPNBB5SYB8e7B0MrB8mMYQJjgNijuXL9RuT/qp/mLKfAx+OPimkaupYPjjAd9jkV8
         bDkx87T8x/QmySlNT5a7tVbrDzcV6Du1k86CulaEoT590xobb08+bxMwiSS0+xNhq/I0
         Q6b5GGFn+osZUree3XzDCI+nymrHXGIdyPmdy6GBmTvhok8y8UDhUsRQY51PEyha+qXS
         jUS38eT0I6FgCKCYXnzdOarFciVbrMFchucyHBQi4huH6eidl/FNHSt1wA9/1qQ1M7L2
         DM1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=ZtG5Pr0RHWHMT8XFJiT4USvH2vGOaKnwuPQ2WdbG8FU=;
        b=mtWXuzuhrYoMo8/dasGPMQjH1Svl8Go4WTLcRYqjuXX3KqrDisJOwM5VWAcGyCO619
         ltYoO/G0LEGlfxkLI9qBXchwSj1+sWULifUAZZRZQW3PWc+mBqK26Bc+0Nyv9p4zcRQl
         WR+adOUQOIoQ88q9DeMRMkJJfbDR+I+FJ2scD5bY+oXokQ9cNhlB9aDjbRUfNHSzruZQ
         5VCz1csa/3VIvTFFeI1FNjF7n61MGASodIgDETSzvkUjK6mpQSobh504CdcCo3e1WbfN
         P3Au83hU0mHdan23O6kzncwaKY8EgDY/DgArXM9txGFL/sZQaCB21bsPbbuPkapRVCrK
         f2Wg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=LJ63yuan;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f41si909945edf.113.2019.09.26.01.27.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Sep 2019 01:27:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=LJ63yuan;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:60774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iDP7D-00048F-2p
	for alex.bennee@linaro.org; Thu, 26 Sep 2019 04:27:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42157)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <joel.stan@gmail.com>) id 1iDP6p-00046l-9D
 for qemu-arm@nongnu.org; Thu, 26 Sep 2019 04:26:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <joel.stan@gmail.com>) id 1iDP6o-0008Rh-EB
 for qemu-arm@nongnu.org; Thu, 26 Sep 2019 04:26:43 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:37322)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <joel.stan@gmail.com>)
 id 1iDP6o-0008QY-Af; Thu, 26 Sep 2019 04:26:42 -0400
Received: by mail-qt1-f196.google.com with SMTP id l3so1824838qtr.4;
 Thu, 26 Sep 2019 01:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ZtG5Pr0RHWHMT8XFJiT4USvH2vGOaKnwuPQ2WdbG8FU=;
 b=LJ63yuanw1QvldSAPg1gYyKpo7cnyxfLKm++34fwfIBZ9rKclsJEH/R9BFQaOZzVMW
 qvGrHjhMFCvsjRkKnzObt3DoqvpyyI2bd0L+jndnppSAEJy8WODaWPwf9jmnHWxMXK9u
 oJo3KkDtGVSNukQ0xCsnkpQce57JA8pb5ki18=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZtG5Pr0RHWHMT8XFJiT4USvH2vGOaKnwuPQ2WdbG8FU=;
 b=cK6VA+0gSSf/ZMrXzt5kORiP06feGYLcF9i4gcjAkJ0mbhkltR7RFpZ6c3YFTOARKv
 X034q7dZ+7JV9ULDrvl7FEjBvByLipHNfjot9iVRlv4lm+FxyiP6tR/R9FMPRGc37xyE
 K8zdIsjEYR571OFXyFVVn3gUVACKXugHFClkd1j9pPMY+rJWXVweG40YZzZmn3ND2YfY
 be1IilrL4p/ot5uc0VU8h5HjTaRwg1TN7fPFlnz53HlhcrKboYLkdE5rsZlCLzmw/pFP
 insfUV4poDVzlUNKTatAbXGnklP3Yw/vHXAdAEKJFmuqNTKP4QfK2Axv+ctbyHpkbBCY
 P0SA==
X-Gm-Message-State: APjAAAW3eVMAzcyHwOIRQM7DYOmnPs8kiEI+gJDrtC16M4vDNZmVMcvN
 rtU9TAByqtQObTBH6NAhBpP8IXdzfNVAlmcZbRM=
X-Received: by 2002:ac8:2f81:: with SMTP id l1mr2658804qta.269.1569486341522; 
 Thu, 26 Sep 2019 01:25:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190925143248.10000-1-clg@kaod.org>
 <20190925143248.10000-20-clg@kaod.org>
In-Reply-To: <20190925143248.10000-20-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 26 Sep 2019 08:25:30 +0000
Message-ID: <CACPK8XcBRvicL-pqkj1bKRNR9xVDMXKzDA-uMjvB9JmJqKCYSg@mail.gmail.com>
Subject: Re: [PATCH v2 19/23] m25p80: Add support for w25q512jv
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.160.196
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
X-TUID: N+qD3fhlgMfF

On Wed, 25 Sep 2019 at 14:35, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>
