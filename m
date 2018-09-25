Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp496537wrt;
        Tue, 25 Sep 2018 03:28:46 -0700 (PDT)
X-Google-Smtp-Source: ACcGV60hH0qpNGLWmeipKmupefsl9AgYbkEDkI7awfkIqiJsK72cf3aHLtmcdLuyCPhjeRCbZBTP
X-Received: by 2002:ae9:edc5:: with SMTP id c188-v6mr222709qkg.208.1537871326678;
        Tue, 25 Sep 2018 03:28:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537871326; cv=none;
        d=google.com; s=arc-20160816;
        b=NImCwKmebsDPsw8L/5MQslxYVw/+9gKWvKyf6uiswaS+twg3ZiEsgD3upT8zYQnwHP
         5AefunCp4ETVkpzN+Lro6hooQhuPxnplJ3OeoYcq6bYGqMRfLOALlb9XCSzpXvsbYgtr
         uZDj014s4+yOJrQE2HZUrrzzBI9FGz6/w3Tf9l5aCD/81u9L/VvvjgWYHrWZ1fdfa056
         iqH64Gr64+7XnbDmAY98RA5JmdRbWkqnBpO9VMxHonMLJGtwsE5LSROD48QDYwh6L1/I
         3TCI4qdxS20bF5s6WLqq0eUGSoSLhGoJmzo1qxJPWCt6kcmFUv5VdDcPRC5WDWfi20v+
         Dq4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=8t3g5oebXmJtts9y3yOXu/QSE2oziSkbmJSiTZTYyPY=;
        b=Xi8oHdzhIhlKh5KhKRrCXcO2verxPEV39OW9HxIVSj+Z0hp/tpI5L6ZiIQ3DJWSsqO
         fgc3WdvpSOVfAAr78Kff6vukxySMi4spQBWYiDjYhq2MaAGfsBsVKidASSKBhKJu8EEM
         IoaWHhEs+EYKhM4gCInJC1o+WetRYIImHsHr+EqJfVvYTK5M/cs9ZAdbGZBv1JFlsg7/
         XeIZ+q1Q4vY6oQdPp0PlEzz5IftoMO0MbnM8ORoX3fQoniYWJMIWWDhAFI4/SvCevlJb
         Cc4JrfbwYD+auWpvVPc9C94g9VhBXBrOHAffmVRecrSw7aXVEdp7wCd4XMBL20tH2y74
         SjEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="L/WT/pnd";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f15-v6si72828qvo.67.2018.09.25.03.28.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 25 Sep 2018 03:28:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="L/WT/pnd";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52030 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g4kaE-0004SX-4P
	for alex.bennee@linaro.org; Tue, 25 Sep 2018 06:28:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39137)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g4kZ5-0003Fl-5L
	for qemu-devel@nongnu.org; Tue, 25 Sep 2018 06:27:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g4kUS-0002jo-4h
	for qemu-devel@nongnu.org; Tue, 25 Sep 2018 06:22:49 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:39036)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1g4kUQ-0002j0-9v
	for qemu-devel@nongnu.org; Tue, 25 Sep 2018 06:22:48 -0400
Received: by mail-oi1-x242.google.com with SMTP id y81-v6so1010117oia.6
	for <qemu-devel@nongnu.org>; Tue, 25 Sep 2018 03:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8t3g5oebXmJtts9y3yOXu/QSE2oziSkbmJSiTZTYyPY=;
	b=L/WT/pndvPCGTyYkBRZniHFM9TUhJLtGnbYS174UgyDedBu3KkWHPONFZi9UyVGRxJ
	XdfwrNkAANxa5VNqX65Eguw2xJaYZujaY9sV/GRSNyqAwG0QFFh/2xbxySnkOy3HByci
	K6/FcVipVAcmYAA31KGcA1GoDSlqBVB25wTrE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8t3g5oebXmJtts9y3yOXu/QSE2oziSkbmJSiTZTYyPY=;
	b=lKsYPZvPg3NkqzfriKrooPZge6oJGaW1npZ5jbvsZuCmFXoimABB/d7/AqYgQkKZsq
	p6PsAIDlYtCQ/qZ2IHfxAL/gkCGgkHGBng2LdSP+CB5NbLKGw+SciM0h+WSz5CsBu3ym
	+65yLybSzYMSa92FF7PbT2N9RpxvTIGWwi/JhOaKgEo/TJMpzVMfALneVKHcV1J6PraK
	d5EMt+y0hK4xnBYTsMgrgBr4jW8iehbcy2aSb32lfrD65pEN/laaxRJgZ2kNtPeeScw2
	UtZUN78qyah6FfyQ4g/9K3s5NkcvksdmW1Zxa0xUu7xnRW7dGZ+HroHCoQ5CWQg7sdm9
	jGQw==
X-Gm-Message-State: ABuFfohw6wbc2Mk48hPqzEGFS5eIK2phcPMQ2YB2Xui0j8jD3l0E8T2b
	HQOi+5EYYKrtyhj540sUevFR1UAwTBH89ixgVeIA8A==
X-Received: by 2002:aca:5412:: with SMTP id
	i18-v6mr170758oib.187.1537870964885; 
	Tue, 25 Sep 2018 03:22:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:20e3:0:0:0:0:0 with HTTP; Tue, 25 Sep 2018 03:22:24
	-0700 (PDT)
In-Reply-To: <20180831220920.27113-1-joel@jms.id.au>
References: <20180831220920.27113-1-joel@jms.id.au>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Sep 2018 11:22:24 +0100
Message-ID: <CAFEAcA_PQS2zc3Wdn1PTZOZY5CBjJw6UE2QP-Qc2A26bNr-4ug@mail.gmail.com>
To: Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::242
Subject: Re: [Qemu-devel] [PATCH v6 0/3] arm: Add nRF51 SoC and micro:bit
 machine
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Stefan Hajnoczi <stefanha@gmail.com>,
	=?UTF-8?Q?Steffen_G=C3=B6rtz?= <contrib@steffen-goertz.de>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Jim Mussared <jim.mussared@gmail.com>, Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: n+xNugUcj/p9

On 31 August 2018 at 23:09, Joel Stanley <joel@jms.id.au> wrote:
> v6: Rework based on Peter's review
> v5: Change back to ARMv7M from ARMMProfile
> v4: Fix number of IRQs
> v3: Rebase on Stefan's cortex-m0 series
> v2: Addresses review from Peter and Stefan
>
> This short series implements a minimal definition of the Nordic
> Semiconductor nRF51, a Cortex-M0 ARM SoC, and the BBC micro:bit, a
> machine that will use this SoC.
>
> Joel Stanley (3):
>   MAINTAINERS: Add NRF51 entry
>   arm: Add Nordic Semiconductor nRF51 SoC
>   arm: Add BBC micro:bit machine

Applied to target-arm.next, thanks.

-- PMM
