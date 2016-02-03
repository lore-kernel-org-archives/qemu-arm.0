Received: by 10.25.159.19 with SMTP id i19csp1274981lfe;
        Wed, 3 Feb 2016 07:08:26 -0800 (PST)
X-Received: by 10.55.73.69 with SMTP id w66mr2130687qka.39.1454512106221;
        Wed, 03 Feb 2016 07:08:26 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c69si5877966qkb.11.2016.02.03.07.08.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 Feb 2016 07:08:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:35511 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aQz2f-0002YI-LG
	for alex.bennee@linaro.org; Wed, 03 Feb 2016 10:08:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48230)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aQz2d-0002Vh-6Z
	for qemu-arm@nongnu.org; Wed, 03 Feb 2016 10:08:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aQz2Z-00087g-9F
	for qemu-arm@nongnu.org; Wed, 03 Feb 2016 10:08:23 -0500
Received: from mail-vk0-x234.google.com ([2607:f8b0:400c:c05::234]:35831)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aQz2Z-00087S-4g
	for qemu-arm@nongnu.org; Wed, 03 Feb 2016 10:08:19 -0500
Received: by mail-vk0-x234.google.com with SMTP id e6so15891485vkh.2
	for <qemu-arm@nongnu.org>; Wed, 03 Feb 2016 07:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=q7m4UEllYmOtI9Yh6wc27nEvd4hLLK+iPoLH9FkPUdE=;
	b=O8A7CxZFDs5eKPiyjl34fBAZyzoCWGdKYxd2snLTT1zNsy13GEV1cnEDT3zCZZfBjF
	oydYCZfIDSDVf7EIX4dFp+4L9nP2JmeoHqvYjR3hMwg0Mg1ik7X4yGp295q2oB7ECeLx
	BVt+RTp4elMs+qvOn3AzsMgNgk5NHyUotQu3E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=q7m4UEllYmOtI9Yh6wc27nEvd4hLLK+iPoLH9FkPUdE=;
	b=jTiBFSX8LUD5bc8HLp8cKVHNnmoHUJ1M9MdlFVrSQ+iGAGkbZdBizKtvXIstn85y1h
	YNN5QthVXGfxAk+YoP6G5RuEyETJFJB5EZspOtLdgsxtIN4Nl7UmDfIatl5IfNw9eQz3
	3jAvZfzynf0OyMBpsf5Ww2t8g1cpZAoqg2rbK4Hy1PhlD5EEvjDoio4jei2qe+FmkOwA
	ZBKTyleuX+77+I7gC1FpWeUCizho8rhHMT/5xGMl3lMH5ZtpP0cen4LMA5STI7/PMDX4
	c5l4YiKUzEVTitylYDfvZ6cKlQy3jd4Iwyp4hx6OjLQyzDN+yvxxWt65Koa+r9sYrdQ/
	0dRA==
X-Gm-Message-State: AG10YOTtxkjofA4UGNowe+L4HCTNqX+equ+Px8T/C4+YnG80ER2uBMYB4CvQIFrsGc4xQj3IJ4xGP7UxO3Nvseyv
X-Received: by 10.31.131.199 with SMTP id f190mr1511947vkd.90.1454512097860;
	Wed, 03 Feb 2016 07:08:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Wed, 3 Feb 2016 07:07:58 -0800 (PST)
In-Reply-To: <1454107844-15704-1-git-send-email-Andrew.Baumann@microsoft.com>
References: <1454107844-15704-1-git-send-email-Andrew.Baumann@microsoft.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 3 Feb 2016 15:07:58 +0000
Message-ID: <CAFEAcA9O1-Bn_vJLpmNZ=yWzV6Yr3gR+hLdAUKVxi5CcSxKCnw@mail.gmail.com>
To: Andrew Baumann <Andrew.Baumann@microsoft.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::234
Cc: Rob Herring <robh@kernel.org>,
	=?UTF-8?Q?Gr=C3=A9gory_ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>, QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-arm] [PATCH v5 0/8] Raspberry Pi 2 support
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: aFFUWsK05Bc1

On 29 January 2016 at 22:50, Andrew Baumann
<Andrew.Baumann@microsoft.com> wrote:
> This patch series adds initial support for Raspberry Pi 2
> (bcm2836). It is heavily based on the original (out of tree) work of
> Gregory Estrade, Stefan Weil and others to support Raspberry Pi
> 1. Thanks are also due to Peter Crosthwaite for the code reviews and
> feedback.

Thanks, applied to target-arm.next.

-- PMM
