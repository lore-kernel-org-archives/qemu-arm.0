Received: by 2002:a4f:9ad8:0:0:0:0:0 with SMTP id b85-v6csp13858ivh;
        Tue, 3 Jul 2018 13:08:47 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpc7iRPQSobwHRcLO5/2n7Ytm4V8ph3TfAg5ZM/mPKYuYpSDNaWCSLgRGSVEsAWTFwSBtjZb
X-Received: by 2002:ac8:2908:: with SMTP id y8-v6mr28669314qty.45.1530648527521;
        Tue, 03 Jul 2018 13:08:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530648527; cv=none;
        d=google.com; s=arc-20160816;
        b=vbmF1m1OW3Pvw+Od0Ms0TvMVVdpHNfbYhOKO9XIi56BHLakYiQ/TlKReSMQLEiszw6
         XlKzwUm1QafOPifLOQMfxBIxxxqaOOna3zeU1t3AsFWfIw/Kf0AtUvmOQvq+KITpAUoc
         YcAycZoXD/5/GDoHmWsF3VFY1nG59EI6CSEOrHyQtgS0mZo5R2vLyQYPE0yZ2fudGmfz
         bwru8RZOwLK0CcErV0gyal2QwrHfy+eeUD4rbjrfPb0bqi8BzE+/4BZxnJaRvDu52Ksb
         yS49vlVrNFjOAx5QeUv4Qjl4IICJMHapKGFmoKPLfpnTyICPLbR2MKLkeAis86Gik6j1
         E8eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=jCULhvVklPDCaff/g50V6PPJdMNRq66XWKyJroqoG6s=;
        b=0M3G5PHMyN7WqMVXfQxkCwovIAG/jfQH4VhXCb5gM70hj1q48pwYQG5z3NeCVGfgzr
         ninWA9IV+TqXt7KOZvIpQSLtDQ8WGhclZa3+PWHw5Puv2QYbBAsBgDHr4YZIIsdZo7GT
         USQVAmTUfsUrhKxmodD4WoDuWcHnZJJGK0v6FyvNon5fBNt+wJ7Ph9hEckwlSpdy3GRL
         S1Ui71GvQdenkW5isMOCOtgIO+oMn1bvRx+TK9iarEi14rWEhGN311zsgaGsbP94xXP6
         jsAZfuqvi9d7/6iLpmZpyPgkL6cE8J0Zbi6BDZyOifGD9YWCZ9tnp59NVHnkcZVsiFqF
         afqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MCfW0fHq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 22-v6si1883395qvg.68.2018.07.03.13.08.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 03 Jul 2018 13:08:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MCfW0fHq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42449 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1faRbT-0000hF-38
	for alex.bennee@linaro.org; Tue, 03 Jul 2018 16:08:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34067)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1faRbH-0000gN-Fr
	for qemu-arm@nongnu.org; Tue, 03 Jul 2018 16:08:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1faRbG-0004Ha-Hw
	for qemu-arm@nongnu.org; Tue, 03 Jul 2018 16:08:35 -0400
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:36080)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1faRbG-0004HB-CM
	for qemu-arm@nongnu.org; Tue, 03 Jul 2018 16:08:34 -0400
Received: by mail-oi0-x244.google.com with SMTP id r16-v6so6340031oie.3
	for <qemu-arm@nongnu.org>; Tue, 03 Jul 2018 13:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jCULhvVklPDCaff/g50V6PPJdMNRq66XWKyJroqoG6s=;
	b=MCfW0fHqUen8qIu6WJRUkaSu6BhIOOFiSI/XDVTXGy9xH5Qq0t1sD8nOFYK6pLV7gf
	oC++kU1WW2jvUdzqyCp84XdGoMLD8aizJx6C3PlKPCac+57MLe92PhUxW/5/wzfc/6DG
	VKmiBD6pe7mfN5TDExm5BDgN6m51cXx0UbnZA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jCULhvVklPDCaff/g50V6PPJdMNRq66XWKyJroqoG6s=;
	b=KRCqu8Tu4avN4ZgezBzj1mL/gKkiYJq6KEsMVtmG0dTbVqVEOiBYbUDNMlGwNKmnS1
	TD6vbEO0wir6qgvUh7/R946EvmqrscHN1ViZ/oxE1XGn+8GAZkNdQS0yg/rdNVswm3eF
	OHm7WVcJiJHPgbwvP4bYffro0uB6wvlD7z6ckePK7tUFm35jRdnv9eussYNENkfNAzy6
	VhvitsyyFqectDxWO7GBI9LUdW4BqQdoUI6nT9I1t0Hgz3+B5l0+7CQZfZ0JI8VnAUaB
	xgVodqsgpm1qelStrk/Tt+J7sBSKTvwyii3XFzIMI6z1VovspPqN1+EZNcRd0GTb4VdH
	95TA==
X-Gm-Message-State: APt69E3ibhem3yBj7PlTD+XZbRn2Iwob+hobFEtU67HjCHLRD1uynVA4
	vdOzxcY9j3qtNx5U0w25QY1tBVtaZJ03YnYlN8ARrg==
X-Received: by 2002:aca:f409:: with SMTP id
	s9-v6mr23768267oih.102.1530648513646; 
	Tue, 03 Jul 2018 13:08:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:554d:0:0:0:0:0 with HTTP;
	Tue, 3 Jul 2018 13:08:13 -0700 (PDT)
In-Reply-To: <20180703184922.GA14422@roeck-us.net>
References: <20180626200008.GA680@roeck-us.net>
	<CAFEAcA_non89OR_-W3Fhr6gG0v0kkgg-ffJx-9K_h=U-Hz_wbg@mail.gmail.com>
	<20180702162733.GB32333@roeck-us.net>
	<CAFEAcA8+ZxcRLBgonZaqpAfumKFvhk7yDhX=Fe0KjoeTxWsczg@mail.gmail.com>
	<20180702170522.GA9885@roeck-us.net>
	<CAFEAcA97xX72WabGwn7GAQJxMcpzYzyV9yDBg1qF0zLuSDZwSA@mail.gmail.com>
	<20180702175740.GA14904@roeck-us.net>
	<CAFEAcA8noUOGt_9LpfRTRX52n4Z66XzudYFfW=180c92vzPH-g@mail.gmail.com>
	<20180702183717.GA22482@roeck-us.net>
	<CAFEAcA_p8vOs_1_4sAf1SvvPb44z885doU0821eh=-e0K5B3_A@mail.gmail.com>
	<20180703184922.GA14422@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Jul 2018 21:08:13 +0100
Message-ID: <CAFEAcA9pa7YTLnHYD0c7GvkkmiwD+Yyk9qr6G_EC2JeWdMB26Q@mail.gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-arm] [PATCH] hw/char/cmsdk-apb-timer: Correctly identify
 and set one-shot mode
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kIVXn1iJYfNv

On 3 July 2018 at 19:49, Guenter Roeck <linux@roeck-us.net> wrote:
> Oddly enough, I now seem to be unable to reproduce the problem either.
> Weird, when I wrote the patch it was absolutely necessary.
>
> The only other change I can think of would be the code to set the
> serial baud rate in the boot loader, which I did not have initially.
> Is it possible that the hangup could have been caused by that ?

Seems unlikely -- unless you're actually connecting the emulated
serial port to a real host serial port, we don't do anything with
the baudrate in the cmsdk uart model except complain if the
guest hasn't set it to something valid.

> Is it worth tracking it down, or are we ok ?

It does worry me a little, but if neither you nor I can repro
it at the moment there's not a lot we can do about it I think.
Looking at the ptimer and cmsdk timer code I think it *should*
now implement what the hardware does...

If you see the problem again in future let me know and we
can have another go at figuring out what's going on.

> The series WFM as well. I'll send out a Tested-by: in a minute.

Thanks for the testing.

-- PMM
