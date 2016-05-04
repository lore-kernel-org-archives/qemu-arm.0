Received: by 10.25.208.137 with SMTP id h131csp194429lfg;
        Wed, 4 May 2016 07:28:13 -0700 (PDT)
X-Received: by 10.28.0.87 with SMTP id 84mr30756233wma.68.1462372093666;
        Wed, 04 May 2016 07:28:13 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m71si5273435wmb.117.2016.05.04.07.28.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 04 May 2016 07:28:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48259 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1axxmO-0006D1-HD
	for alex.bennee@linaro.org; Wed, 04 May 2016 10:27:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56375)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1axxly-0005bp-6f
	for qemu-devel@nongnu.org; Wed, 04 May 2016 10:27:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1axxlm-00018z-L6
	for qemu-devel@nongnu.org; Wed, 04 May 2016 10:27:24 -0400
Received: from mail-yw0-x22d.google.com ([2607:f8b0:4002:c05::22d]:33183)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1axxll-000153-EC
	for qemu-devel@nongnu.org; Wed, 04 May 2016 10:27:18 -0400
Received: by mail-yw0-x22d.google.com with SMTP id t10so94311423ywa.0
	for <qemu-devel@nongnu.org>; Wed, 04 May 2016 07:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nO5DcfwTMGl7pmyxgTQnXptSAGJq4AEa5EHs7VjAHqQ=;
	b=Xg2h/mGBuJDcd7/odNJsDjLBJrAiLVOkEF/xtIgbFAo2A7/5nrvPj4VxMwjJBgkhq2
	IZu36H5OqGJ0X9d9cn9CYGBsoPruOzAy7+p6t9KH4FpxfZD1n0lMTr7qJ6OU7KMeEjg7
	XEBlBmo7qx2wlc5BjNyHSOS9hBHlmJQ6cHzxI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nO5DcfwTMGl7pmyxgTQnXptSAGJq4AEa5EHs7VjAHqQ=;
	b=Qu8+f1QhNtwwBcROvBBJnD1Q/y1rHITPyXeyXBk3CxLZqYSNyw7mfZSrTfL1TrPQXF
	G+YlQvnFa1CFYaMc/sZQRwMlqY2Z5KO7Tq87qIo+yBm8RsAaNgeSd8xByrlYjGYEA/1E
	RjSNCcJBD59ROSqUPEtXCsoYHUafsXN7C8SzSheClqBZFFNOKGjuzvJjZmJhv8M3h0zf
	/66kd4lPGrMwg1QRQb/6GCKa5jlQI2llSKrAZncP0u9kiwpeh5BepGRGwpkUoX9TOfoU
	wpLj/io4QcmxYvvBuk5bONBAzaPIVWBEaWo7KFlnFNKqvG3Jf0geUICdR5L7LW8esjlE
	hxxw==
X-Gm-Message-State: AOPr4FV1w7pTC31SJspgUSZrgop7GYa7ZB4gn9II7ThiEZuQBKQP/cforOk+YZCQImXZLdzykzzUH9wEWSOYYkPb
X-Received: by 10.176.0.204 with SMTP id 70mr5807799uaj.4.1462372016205; Wed,
	04 May 2016 07:26:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Wed, 4 May 2016 07:26:36 -0700 (PDT)
In-Reply-To: <1458815374-22279-1-git-send-email-zxq_yx_007@163.com>
References: <1458815374-22279-1-git-send-email-zxq_yx_007@163.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 4 May 2016 15:26:36 +0100
Message-ID: <CAFEAcA8ohPD0pwkZYfE8RmDjpu15vUeYNo+wn4PFo2f4ZEq3Rg@mail.gmail.com>
To: xiaoqiang zhao <zxq_yx_007@163.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4002:c05::22d
Subject: Re: [Qemu-devel] [PATCH 0/5] QOM'ify hw/display devices
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>, Michael Walle <michael@walle.cc>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	hirofumi@mail.parknet.co.jp
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: G9lGzRAkOQ+Z

On 24 March 2016 at 10:29, xiaoqiang zhao <zxq_yx_007@163.com> wrote:
> This patch set trys to QOM'ify hw/display files, see commit messages
> for more details
>
> xiaoqiang zhao (5):
>   hw/display: QOM'ify exynos4210_fimd.c
>   hw/display: QOM'ify jazz_led.c
>   hw/display: QOM'ify milkymist-tmu2.c
>   hw/display: QOM'ify milkymist-vgafb.c
>   hw/display: QOM'ify pl110.c

Hi; I was going to review this series (apologies for taking so
long!), but looking at my email archive and the patchwork server
the patches in it seem a bit confused. I see seven patches, not five,
with rather odd patch number indications:
 1/5
 2/5
 3/6
 4/5
 5/6
 5/5
 6/6

(and 5/5 and 6/6 seem to be the same). Could you resend the
series with the correct patches in it, please?

thanks
-- PMM
