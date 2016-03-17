Received: by 10.25.208.211 with SMTP id h202csp492404lfg;
        Thu, 17 Mar 2016 08:02:07 -0700 (PDT)
X-Received: by 10.140.25.206 with SMTP id 72mr14942324qgt.49.1458226927553;
        Thu, 17 Mar 2016 08:02:07 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y83si8148375qka.43.2016.03.17.08.02.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 17 Mar 2016 08:02:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:35672 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1agZR8-0003d5-TI
	for alex.bennee@linaro.org; Thu, 17 Mar 2016 11:02:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49757)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1agZQP-0002G9-Ar
	for qemu-arm@nongnu.org; Thu, 17 Mar 2016 11:01:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1agZQO-0000dW-Ht
	for qemu-arm@nongnu.org; Thu, 17 Mar 2016 11:01:21 -0400
Received: from mail-vk0-x22b.google.com ([2607:f8b0:400c:c05::22b]:36726)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1agZQO-0000cQ-Dq
	for qemu-arm@nongnu.org; Thu, 17 Mar 2016 11:01:20 -0400
Received: by mail-vk0-x22b.google.com with SMTP id q138so13447847vkb.3
	for <qemu-arm@nongnu.org>; Thu, 17 Mar 2016 08:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=t17yGH47OdlxYe0EVlckbDhRurdJuSbjoL66Ny3aimg=;
	b=JEwelBJLVEwcvE6NgqRQ4vgWUK0cuap6LFMZilkrE+Ak3mpX6lYaAfgeh1mt4XY0yT
	HnI13R1SHPVtvDGpgfoa8XM5Go5jnOPUN6JCzgc8/D0HUxBv2mHC6f5zctNJ32voombd
	axHWbbvoUFkboOFh0zuJGcWULjrsHsPtDJ5fs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=t17yGH47OdlxYe0EVlckbDhRurdJuSbjoL66Ny3aimg=;
	b=WVj/mjb3MPG0ugk/9PK30FoExBoZessOXkrYQsthLPDWib2n3d/MuQprH+MjXrRyfx
	9tkbzfpWYWY4yoQA/eR+lQFuDp+SopI37ESMnFShkj+RYD06wAASECm/Mo6/ih1B7eeR
	l0yJuDdvxOolOyINI46Qm0oVjsaKtQvUyEZvFBHJmWtSP/S+E8ENALx3KYWdfUWbP28Q
	kX+eojFZQO1BJmszbh4+yzaKntew4n+RXe2Ioj4x1HVRBobGQeCYBY2KEDVg5xG963RC
	33lRW9/qFc1GpTQmkM+dHJ1knhI9ZU8ZfaNJn8Ve7hQEuVhiTj2Zq9wN58UJt+zbMDzI
	HTkg==
X-Gm-Message-State: AD7BkJIp2aaoWeLbB7tPpI3FTOrL+pkPjrKdOItQkjXxU2tB77h1r3RtUI/QcxpZ9UCEDsDk4daMBnPyXGbr8zsb
X-Received: by 10.31.52.147 with SMTP id b141mr11922993vka.82.1458226878446;
	Thu, 17 Mar 2016 08:01:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Thu, 17 Mar 2016 08:00:59 -0700 (PDT)
In-Reply-To: <761259451cb8d9bc5823589d63c3c1e4@walle.cc>
References: <1456110933-5457-1-git-send-email-zxq_yx_007@163.com>
	<1456110933-5457-4-git-send-email-zxq_yx_007@163.com>
	<761259451cb8d9bc5823589d63c3c1e4@walle.cc>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Mar 2016 15:00:59 +0000
Message-ID: <CAFEAcA9Afp32O6Jz_x=b+5c+RnPqCmouUhLdY4ptnmcbLes7vA@mail.gmail.com>
To: Michael Walle <michael@walle.cc>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22b
Cc: Guan Xuetao <gxt@mprc.pku.edu.cn>, xiaoqiang zhao <zxq_yx_007@163.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	Maksim Kozlov <m.kozlov@samsung.com>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Subject: Re: [Qemu-arm] [PATCH v4 3/9] hw/timer: QOM'ify lm32_timer
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
X-TUID: r6qwgV9nruFI

On 17 March 2016 at 14:59,  <michael@walle.cc> wrote:
> [I had some problems with my mailserver and the v5 version didn't make it
> through. I know there is a v5 version of this patch series and I've tested
> with the v5 version]
>
>
> Am 2016-02-22 04:15, schrieb xiaoqiang zhao:
>>
>> * split the old SysBus init function into an instance_init
>>   and a Device realize function
>> * use DeviceClass::realize instead of SysBusDeviceClass::init
>>
>> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>> Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>
>
>
> Signed-off-by: Michael Walle <michael@walle.cc>

Signed-off-by: doesn't make much sense in this situation -- did
you want Acked-by, Reviewed-by, Tested-by, or some combination
of those ?

thanks
-- PMM
