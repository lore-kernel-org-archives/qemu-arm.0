Received: by 10.25.208.211 with SMTP id h202csp1128787lfg;
        Wed, 16 Mar 2016 04:51:30 -0700 (PDT)
X-Received: by 10.140.241.74 with SMTP id m71mr4829202qhc.36.1458129090264;
        Wed, 16 Mar 2016 04:51:30 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f91si2962143qga.57.2016.03.16.04.51.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 16 Mar 2016 04:51:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:55484 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ag9z7-0001vZ-ST
	for alex.bennee@linaro.org; Wed, 16 Mar 2016 07:51:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34085)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ag9z4-0001sa-OP
	for qemu-arm@nongnu.org; Wed, 16 Mar 2016 07:51:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ag9z3-00082A-Sd
	for qemu-arm@nongnu.org; Wed, 16 Mar 2016 07:51:26 -0400
Received: from mail-vk0-x22b.google.com ([2607:f8b0:400c:c05::22b]:33629)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ag9z3-00081y-OU
	for qemu-arm@nongnu.org; Wed, 16 Mar 2016 07:51:25 -0400
Received: by mail-vk0-x22b.google.com with SMTP id k1so58199110vkb.0
	for <qemu-arm@nongnu.org>; Wed, 16 Mar 2016 04:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=kv+uxCFxy/VYmgpAPEAAhrCKKvLu5IeSWS0ZRsj2rfU=;
	b=W6i9OZ44aeymt0Kl1Pd47muBC4sK324ZkilrDcR8Oc0WwvHgjgfvfDciEmz4Za+DQ2
	PdIKysw7ur4IpptzKHOqrdF/owWdjvO7nL1Y/pHCXfz0BhbKvxpDoCY9SfmLY6pidJZY
	/sbMrqtRp1a3+ktTb4Y5H2penZ2JykmyEBFsk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=kv+uxCFxy/VYmgpAPEAAhrCKKvLu5IeSWS0ZRsj2rfU=;
	b=Afq/7G3Rasf77hEULpuT9KoemSJD/ccWUW3I72LWzf6UYPlpoX0NJ/5WQjn4QxCmDx
	Z4/6C8ESE5m16dRNV6fYCOhIIdU59uYHSQGJXU0po63fD8qvw2R51tkgc758JeEW0eE8
	IM+bgbRgcZyiEZQKZfFcCT7bS9Fw0ma/IZJb1kto5dJ/UJXvT/BWRnIWimNJNGV8dsqe
	5nJ9xkzOgGDk10pxf4ewlnC0HlhU0W1JD2rfqSotszT2tKhOD7QeZA2rjljnmX2YiNYE
	UDfSMvWz1fVEQbx5iXSz6BtBOhFipVSfbQhCAUEkg4QAN4Rjyogo8G1ho1D/or/TiROv
	GVbw==
X-Gm-Message-State: AD7BkJL9PzhA1q4KbMUBOUfygQBJ4Kh+oQrU1DhKUJX9GZlZPsdLZJMWhj0n++11IzoH4tQ7LQaRKaumDPg8hcMZ
X-Received: by 10.31.8.210 with SMTP id 201mr3844005vki.90.1458129085292; Wed,
	16 Mar 2016 04:51:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Wed, 16 Mar 2016 04:51:05 -0700 (PDT)
In-Reply-To: <1457334350-5675-2-git-send-email-zxq_yx_007@163.com>
References: <1457334350-5675-1-git-send-email-zxq_yx_007@163.com>
	<1457334350-5675-2-git-send-email-zxq_yx_007@163.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 16 Mar 2016 11:51:05 +0000
Message-ID: <CAFEAcA-JJRoy43w3wTS0dEeE4WYKPnaTWUZDGaD0Fe4JWxSJuw@mail.gmail.com>
To: xiaoqiang zhao <zxq_yx_007@163.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22b
Cc: Rob Herring <robh@kernel.org>, qemu-arm <qemu-arm@nongnu.org>,
	Andrew Zaborowski <balrogg@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH 1/9] hw/arm: QOM'ify armv7m.c
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
X-TUID: iM79UwHscfP3

On 7 March 2016 at 07:05, xiaoqiang zhao <zxq_yx_007@163.com> wrote:
> Drop the use of old SysBus init function and use instance_init
>
> Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>
> ---
>  hw/arm/armv7m.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
