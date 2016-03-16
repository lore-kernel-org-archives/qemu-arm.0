Received: by 10.25.208.211 with SMTP id h202csp1131849lfg;
        Wed, 16 Mar 2016 04:57:17 -0700 (PDT)
X-Received: by 10.140.109.33 with SMTP id k30mr4472758qgf.45.1458129437290;
        Wed, 16 Mar 2016 04:57:17 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o31si2975039qko.59.2016.03.16.04.57.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 16 Mar 2016 04:57:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:55548 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1agA4i-0000i7-UQ
	for alex.bennee@linaro.org; Wed, 16 Mar 2016 07:57:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35656)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1agA4f-0000en-UH
	for qemu-arm@nongnu.org; Wed, 16 Mar 2016 07:57:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1agA4f-0000ja-6b
	for qemu-arm@nongnu.org; Wed, 16 Mar 2016 07:57:13 -0400
Received: from mail-vk0-x22a.google.com ([2607:f8b0:400c:c05::22a]:34982)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1agA4f-0000jH-1p
	for qemu-arm@nongnu.org; Wed, 16 Mar 2016 07:57:13 -0400
Received: by mail-vk0-x22a.google.com with SMTP id e6so58259581vkh.2
	for <qemu-arm@nongnu.org>; Wed, 16 Mar 2016 04:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=i7CLx3NPCUl/diqS7pItud7QIiSI0MeZ/RYY7XetguU=;
	b=d6CAJv5GZ913V7w9kPuF+v8OoamQvVvnwhgL5bM0SJRNi84TvrlKlU/lChFmBmBI8G
	vx07wX4dXrenwDYSFfdrvDw7ObJtnVTBbcKCw8LkeLQ4BUOJQr++UN3k7rmlKeIOgRI0
	sd7sAw2ZX2FMF7BwPrr+QhnZuwIYYBUHyCS0k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=i7CLx3NPCUl/diqS7pItud7QIiSI0MeZ/RYY7XetguU=;
	b=O1xkf7JiHiV53AhuhZBkg50uI4+9dyrO4vMa6/86cnq5t0FJxqVHxv2e6PzoXGJPE0
	KAR9mh5Z/84IX/6d3jDenffBZ8T/mHApvUweg92pUwS7Bgv/MrBquSQPSunrUNUSQo/7
	miSJKNf77F+wur6NSrdeyaYD+niyaQxP2OgoklKDDQpBlZqK7I40ZI5XfjBdswaVLa5B
	jGOGCcVwjBvfrx5A+Lyssk4oPye5yg7Wx2xk2L3OpDEoLtCASfHNx4MAX/z5exMM0gbo
	86y8fEv2unkGlHl1Pv+uQu1u5Fihrz14aoiICcBfyC6tWt9794T/Cj5mSzHNqwdMjRlB
	TXkg==
X-Gm-Message-State: AD7BkJIRzRfuf3LY6XW5HwjMzI+Hre8eWApW3C7NbG0ZKi+jmnF789osnIxK8gZW5mBNd8DSSl8biaBaZDUV5Qrf
X-Received: by 10.31.52.147 with SMTP id b141mr3787562vka.82.1458129432601;
	Wed, 16 Mar 2016 04:57:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Wed, 16 Mar 2016 04:56:53 -0700 (PDT)
In-Reply-To: <1457334350-5675-5-git-send-email-zxq_yx_007@163.com>
References: <1457334350-5675-1-git-send-email-zxq_yx_007@163.com>
	<1457334350-5675-5-git-send-email-zxq_yx_007@163.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 16 Mar 2016 11:56:53 +0000
Message-ID: <CAFEAcA9QBShnRGSdkAY+gP7pMgtwaVCJ2UVPawviyfSt97W4pw@mail.gmail.com>
To: xiaoqiang zhao <zxq_yx_007@163.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22a
Cc: Rob Herring <robh@kernel.org>, qemu-arm <qemu-arm@nongnu.org>,
	Andrew Zaborowski <balrogg@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH 4/9] hw/arm: QOM'ify pxa2xx.c
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
X-TUID: shZJphSujgIE

On 7 March 2016 at 07:05, xiaoqiang zhao <zxq_yx_007@163.com> wrote:
> Drop the use of old SysBus init function and use instance_init
>
> Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>
> ---
>  hw/arm/pxa2xx.c | 26 +++++++++++---------------
>  1 file changed, 11 insertions(+), 15 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Again, more cleanups are possible on these devices...

thanks
-- PMM
