Received: by 10.25.208.211 with SMTP id h202csp632467lfg;
        Thu, 18 Feb 2016 06:16:28 -0800 (PST)
X-Received: by 10.55.214.213 with SMTP id p82mr8912352qkl.54.1455804987897;
        Thu, 18 Feb 2016 06:16:27 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l74si48782768qgl.121.2016.02.18.06.16.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Feb 2016 06:16:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:41658 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aWPNb-0004YG-A1
	for alex.bennee@linaro.org; Thu, 18 Feb 2016 09:16:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54518)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aWPNY-0004Uf-0e
	for qemu-arm@nongnu.org; Thu, 18 Feb 2016 09:16:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aWPNW-00036N-QG
	for qemu-arm@nongnu.org; Thu, 18 Feb 2016 09:16:23 -0500
Received: from mail-vk0-x22c.google.com ([2607:f8b0:400c:c05::22c]:35611)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aWPNW-000369-E3
	for qemu-arm@nongnu.org; Thu, 18 Feb 2016 09:16:22 -0500
Received: by mail-vk0-x22c.google.com with SMTP id e6so45156940vkh.2
	for <qemu-arm@nongnu.org>; Thu, 18 Feb 2016 06:16:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=jSJ0aRuSkCNi0YvHS/7p8EnDvtftFMHFU2EbnfcLDBU=;
	b=GnqVLFfv2/KIhQAX4sdT0fb5X87PMMZvk+qj+WGNnOQXe3E6ZSBHWl3Pn1aM6H1wFs
	GofrRpQ0PtpkEhJd8H9iB2czN7NwIwQEeNZEQj486rwD7QVVAQL/RY5qSu0BvRVhmpzC
	CrqM8W4wuOCUZS+qZTVx3VnWZ76XYCjsMKEy8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=jSJ0aRuSkCNi0YvHS/7p8EnDvtftFMHFU2EbnfcLDBU=;
	b=IVk52wJEKUe9ahgcEV4h0+7GGktDeGSuXu8C6qsTmeLkuNns6/p1h62meX/JWMAw+3
	7jqa231r913j1sPUHroyyxhWtMP3djElkDJm3w3SjIWPQaqG1eXiKItA0iMRwzWEeqYx
	6VOrzlB3f+a8KAGmrVgzk0AOoBUGy7QREkDu6Fr3oJgIw/duztu0C+1hbTqVxcLF6x7l
	8KxfX4RR8o+jDEKu6u+hMdjBe4ePify00QZV6OrtiFgID+fDS0+CN8SElLlkgRbDsBPr
	7p6cjsy3a8IkCYQGtLihaBEFN/WokwQEbNo+5wFSdL/e2Bi147b1qmvrCpYqbxVQHdjx
	pixA==
X-Gm-Message-State: AG10YOQhoVA0P+O6327vJFKvFO0ZvUCxPUUuw/Cxjh9S/ibF1HiPSMxFDMRMzp3ms3a9ZdymCbMTt3loAkCB0rZP
X-Received: by 10.31.141.2 with SMTP id p2mr6316871vkd.37.1455804982060; Thu,
	18 Feb 2016 06:16:22 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Thu, 18 Feb 2016 06:16:02 -0800 (PST)
In-Reply-To: <1455620981-13868-1-git-send-email-zxq_yx_007@163.com>
References: <1455620981-13868-1-git-send-email-zxq_yx_007@163.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Feb 2016 14:16:02 +0000
Message-ID: <CAFEAcA89cyfRPMH+cN=UQ7Ogb6XZE+R0nejkzzCxWG1UerfCAA@mail.gmail.com>
To: xiaoqiang zhao <zxq_yx_007@163.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22c
Cc: Evgeny Voevodin <e.voevodin@samsung.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Michael Walle <michael@walle.cc>, qemu-arm <qemu-arm@nongnu.org>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Subject: Re: [Qemu-arm] [PATCH v3 00/16] QOM'ify hw/timer/*
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
X-TUID: FBT5ocPS3qEt

On 16 February 2016 at 11:09, xiaoqiang zhao <zxq_yx_007@163.com> wrote:
> This patch series QOM'ify timer code under hw/timer directory.
> Main idea is to split the initfn's work, some to TypeInfo.instance_init
> and some is placed in DeviceClass::realize.
> Drop the use of SysBusDeviceClass::init if possible.
>
> changes in v3:
> * remove unnecessary OBJECT cast
> * refine some commit message
> * use DeviceClass::vmsd instead of vmstate_register to register
>   the VMState if possible
>
> changes in v2:
> fix a stupid typo (timmer->timer)
>
> xiaoqiang zhao (16):
>   hw/timer: QOM'ify arm_timer (pass 1)
>   hw/timer: QOM'ify arm_timer (pass 2)
>   hw/timer: QOM'ify exynos4210_mct
>   hw/timer: QOM'ify exynos4210_pwm
>   hw/timer: QOM'ify exynos4210_rtc
>   hw/timer: QOM'ify pl031
>   hw/timer: QOM'ify pxa2xx_timer

I have taken these patches (1, 2, 4, 5, 6, 12, 14) into target-arm.next.

thanks
-- PMM
