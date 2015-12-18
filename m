Received: by 10.182.158.201 with SMTP id ww9csp932043obb;
        Fri, 18 Dec 2015 01:01:21 -0800 (PST)
X-Received: by 10.140.81.227 with SMTP id f90mr3371085qgd.54.1450429281891;
        Fri, 18 Dec 2015 01:01:21 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p70si15424352qkh.25.2015.12.18.01.01.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 18 Dec 2015 01:01:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:59034 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a9quf-0007Vk-Mb
	for alex.bennee@linaro.org; Fri, 18 Dec 2015 04:01:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50295)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a9qua-0007Tw-DX
	for qemu-arm@nongnu.org; Fri, 18 Dec 2015 04:01:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a9quZ-0007TF-HL
	for qemu-arm@nongnu.org; Fri, 18 Dec 2015 04:01:16 -0500
Received: from mail-vk0-x234.google.com ([2607:f8b0:400c:c05::234]:36536)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a9quY-0007T0-Av
	for qemu-arm@nongnu.org; Fri, 18 Dec 2015 04:01:15 -0500
Received: by mail-vk0-x234.google.com with SMTP id f2so23092257vkb.3
	for <qemu-arm@nongnu.org>; Fri, 18 Dec 2015 01:01:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=duM/wciCKMJxLi6SHXeBSfcVHkPN3d3mxFNvu/Hfre8=;
	b=HwyWrl3vZ4eyqbHoRwrpzFJylBl3ksbUFQlrpLqvVb0E2oZZ/mX/41mT/B+mLK1bJa
	qgiAfSpoHIW08SNRC8ErNvx9KAYjEBUhRzakKyl6eiNInQaSHzcEdFeU4KpY5VLB4x4i
	oH8cnMb4E6uaOjrHnfS9m4c6gfDgHBm8pydYA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=duM/wciCKMJxLi6SHXeBSfcVHkPN3d3mxFNvu/Hfre8=;
	b=lNKtFNAB4oq2PvqV2TU7kqfexFHOfu2vYErtUM1gq8j9MbpGMMhYxOdx3JGv5TtXEq
	LOXge9vyCvwyDQu2aCqbhofBNoo+pjgJqiKeiF8G9cephBBaYR7TeLGqe78jy4AVjZxI
	GA94NsSL9K2/cR5BkY68eP32pNwRgfSrQL2ojaG+tR2i3d2f2TufGi5DekcR7tKR2FMd
	A7GjmMGioBxxXZpIwka2XtUeg5Z+ff39EW7vsnc10+LK1rBo/ro3iyIJOuY9N8UDyd3x
	mV9CLG5Wnde1K5JoFU8RflR0wcm0vxRpJOo/Kw2/hlF9d4U94gM/owzjO531CYyV09G8
	51HA==
X-Gm-Message-State: ALoCoQlniiY4V83mW3Q43flGWUqdfRUu6nd5P4n08ruLuXPn8sS1qsW7Q6L+0DeUQnstSC+TWqYt73xLPDBiC2uvbfSzigrBLP7as5wyyosSSBFSIi16jWY=
X-Received: by 10.31.47.197 with SMTP id v188mr1553771vkv.6.1450429273751;
	Fri, 18 Dec 2015 01:01:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Fri, 18 Dec 2015 01:00:54 -0800 (PST)
In-Reply-To: <CAKmqyKN-0YTai2tYbBoJsH9A022hpDcs89jwRsKOr2upgFdwXA@mail.gmail.com>
References: <1449851831-4966-1-git-send-email-peter.maydell@linaro.org>
	<1449851831-4966-7-git-send-email-peter.maydell@linaro.org>
	<CAKmqyKN-0YTai2tYbBoJsH9A022hpDcs89jwRsKOr2upgFdwXA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Dec 2015 09:00:54 +0000
Message-ID: <CAFEAcA9Zxf_Zk5XJ+zB8mByaxzVkcJAxtg6BG1CPDA6-OqViyA@mail.gmail.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::234
Cc: Patch Tracking <patches@linaro.org>, Markus Armbruster <armbru@redhat.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Kevin O'Connor <kevin@koconnor.net>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 06/10] sdhci_sysbus: Create SD
 card device in users, not the device itself
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
X-TUID: nblZVG1/Uj5U

On 18 December 2015 at 00:18, Alistair Francis
<alistair.francis@xilinx.com> wrote:
> On Fri, Dec 11, 2015 at 8:37 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
>>
>> +    /* Create and plug in the SD cards */
>> +    for (i = 0; i < XLNX_ZYNQMP_NUM_SDHCI; i++) {
>> +        BusState *bus;
>> +        DriveInfo *di = drive_get_next(IF_SD);
>> +        BlockBackend *blk = di ? blk_by_legacy_dinfo(di) : NULL;
>> +        DeviceState *carddev;
>> +
>> +        bus = qdev_get_child_bus(DEVICE(&s->soc.sdhci[i]), "sd-bus");
>
> This looks like the same thing I was trying to avoid with my SPI
> patches. We were trying to avoid the machine reaching into the SoC
> when getting the child busses. Instead expose the bus to the SoC so
> the board can just get it straight from there.

Yes, I wrote this code first and then saw your patches second.
Whatever we do, we should deal with the problem the same way.

thanks
-- PMM
