Received: by 10.25.21.156 with SMTP id 28csp49197lfv;
        Thu, 11 Aug 2016 03:24:09 -0700 (PDT)
X-Received: by 10.237.44.66 with SMTP id f60mr9808713qtd.11.1470911049329;
        Thu, 11 Aug 2016 03:24:09 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f124si1136719qkd.239.2016.08.11.03.24.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Aug 2016 03:24:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47342 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bXn9k-00081y-NR
	for alex.bennee@linaro.org; Thu, 11 Aug 2016 06:24:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37267)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bXn9g-0007zm-3Y
	for qemu-arm@nongnu.org; Thu, 11 Aug 2016 06:24:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bXn9e-0007MZ-8M
	for qemu-arm@nongnu.org; Thu, 11 Aug 2016 06:24:03 -0400
Received: from mail-ua0-x22f.google.com ([2607:f8b0:400c:c08::22f]:34924)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bXn9e-0007MO-4D
	for qemu-arm@nongnu.org; Thu, 11 Aug 2016 06:24:02 -0400
Received: by mail-ua0-x22f.google.com with SMTP id n59so111620038uan.2
	for <qemu-arm@nongnu.org>; Thu, 11 Aug 2016 03:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=v97gWJ6EdZhr8GEms6ZICc9bJHPvBO40I7MXkZlSHH0=;
	b=Yj0eN+5M/JI8j41N8lEEaLwyKjhq4gdIWUrue4Rp5TYS47vtpYPHx6nb5DFFFmxpWw
	3L0442eHEM7F6hlcM/yDQPHmNign9zr2UIR0aheumOBXiQIkqx3jNCo8MbInYxA+6LfO
	Aof5kPEhJ5a5WNJnsR6Mse2hAyJmVyJgRhztU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=v97gWJ6EdZhr8GEms6ZICc9bJHPvBO40I7MXkZlSHH0=;
	b=P1yw16ZzpR1GntSPnBZeGAGWIwcwR9MjQhLTbxsmSjEhXnoFJzQ4qtlhvu0hPquJyz
	wADzWYr3LAa9W6u5TDFuGduwOwqGCaAvE6yYxItIfVRLsV0yUgLTYcZp+qv7BtS5U/VK
	uixEckISc+5VC08pVLG2tHCiGnNLwxWrgi7MeaE/0+daUBFR9ikksr91d8mxDUHoB5yj
	fuL7YELD5Wx+Mb9n3t1NN5JyBZ+mL4LoFvGjCbs/ynV/foHLID0w0gnUcTvSqiXykwxX
	LJT/PVCwc17eEk0jkrRoRpC4SdLDAO/cinxiCFXAGqsVY/kOg+/j8Uiodn4HQeDZgfjF
	U9aQ==
X-Gm-Message-State: AEkoouvUInJSIeE61fRoAdmRuEUAPDkOYMMAv/M28l5Gn1oYMqzduRRzTp+L9mKbg1lsxF4vkNeu9i0vtWVUtYDL
X-Received: by 10.159.35.47 with SMTP id 44mr3583282uae.38.1470911041718; Thu,
	11 Aug 2016 03:24:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.150.17 with HTTP; Thu, 11 Aug 2016 03:23:41 -0700 (PDT)
In-Reply-To: <1470158147-16378-6-git-send-email-clg@kaod.org>
References: <1470158147-16378-1-git-send-email-clg@kaod.org>
	<1470158147-16378-6-git-send-email-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Aug 2016 11:23:41 +0100
Message-ID: <CAFEAcA9k73Dyb8fAP0gJfuyX8wb_e2a8W1k9XMeeNRM_19-t9w@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::22f
Subject: Re: [Qemu-arm] [PATCH v3 05/10] palmetto-bmc: replace palmetto_bmc
 with aspeed
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: z3AqMCMs0S3Q

On 2 August 2016 at 18:15, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> This is mostly a name replacement to prepare ground for other SoCs
> specificities. It also adds a TypeInfo struct for the palmetto-bmc
> board with a custom initialization for the same reason.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
