Received: by 10.25.159.19 with SMTP id i19csp501688lfe;
        Fri, 15 Jan 2016 06:34:50 -0800 (PST)
X-Received: by 10.55.26.22 with SMTP id a22mr13397180qka.0.1452868490660;
        Fri, 15 Jan 2016 06:34:50 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k30si13592634qgk.52.2016.01.15.06.34.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Jan 2016 06:34:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:47207 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aK5Sk-0000Y1-5x
	for alex.bennee@linaro.org; Fri, 15 Jan 2016 09:34:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35175)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aK5Si-0000Xn-07
	for qemu-arm@nongnu.org; Fri, 15 Jan 2016 09:34:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aK5Sh-0003Gx-4c
	for qemu-arm@nongnu.org; Fri, 15 Jan 2016 09:34:47 -0500
Received: from mail-vk0-x236.google.com ([2607:f8b0:400c:c05::236]:34473)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aK5Sg-0003Gr-Tp
	for qemu-arm@nongnu.org; Fri, 15 Jan 2016 09:34:47 -0500
Received: by mail-vk0-x236.google.com with SMTP id a123so269341592vkh.1
	for <qemu-arm@nongnu.org>; Fri, 15 Jan 2016 06:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=MFAXgSHhEuW/Ym44QH2xToOGfXt+MadIKjPqHFbGGlg=;
	b=k1k4EDkf/d3X5tNvchcLy93X4+noATOJLVTmjB+VkpEL5sDuxap28dFeyRfMAFUbuu
	2RjKJ6np/aUvRdY35PrwmazeKFgXjdRpensTFO/UKOvNDnS2c24H8F7hJQBL3E8vMfuz
	B5YIbIFchKtTT0WUj5BS1it3VxMBf8xVfuTgc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=MFAXgSHhEuW/Ym44QH2xToOGfXt+MadIKjPqHFbGGlg=;
	b=ApbW0qiU6HouFnCjo+iXtYJeIbOBjwPjmaSW642Nv6Cit/ZHsXSs050GezAHnfDlzx
	tIP/6WQ48ctF28saAtBeSO9bN9q9WEru7Y5251cGZsrl716xPuQCnF6JyUqvCUzJtJt5
	yp+Pj35Z0FY7Izqwjpv+wlVY3ffA/lpWTxT+zlTJTPo11krTpxXDSSwkemUTSTWp8B4m
	xTnh+kF6ewQbVSZL4G4pDovPp1VWrJ4V6a5TsGJFzZui7bRYvhXkh42lYEufeYwsZcl9
	2srXcnB1OrP+kjCtcN32I0EXddpv99r7e+tWhy/ucb6t+/rXo85bR+OLAGBL4xtjQAIb
	6vww==
X-Gm-Message-State: ALoCoQnh3ULXmkFiJ9/5cs1/rv30VeS7S5V63O1Pw0ilPfgy/cVRBpXhfazoZXnd9TdBlDBXX2jX4d768s6C7pHMDWhqOT3LLUSwdedZIWMO263eGurtBSc=
X-Received: by 10.31.131.203 with SMTP id f194mr7894955vkd.90.1452868486381;
	Fri, 15 Jan 2016 06:34:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Fri, 15 Jan 2016 06:34:26 -0800 (PST)
In-Reply-To: <56967AA4.40300@redhat.com>
References: <1452696857-4091-1-git-send-email-shannon.zhao@linaro.org>
	<20160113161641.GC10709@hawk.localdomain> <56967AA4.40300@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 Jan 2016 14:34:26 +0000
Message-ID: <CAFEAcA_f=j0KupJG6z1E+O7oqbhgKbSCdUob9GOdsEQRCBuz_w@mail.gmail.com>
To: Laszlo Ersek <lersek@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::236
Cc: Andrew Jones <drjones@redhat.com>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	"edk2-devel@lists.01.org" <edk2-devel@ml01.01.org>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Shannon Zhao <shannon.zhao@linaro.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2] ARM: Virt: Don't generate
 RTC ACPI device when using UEFI
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
X-TUID: fiLZAWIX3d4x

On 13 January 2016 at 16:26, Laszlo Ersek <lersek@redhat.com> wrote:
> On 01/13/16 17:16, Andrew Jones wrote:
>> On Wed, Jan 13, 2016 at 10:54:17PM +0800, Shannon Zhao wrote:
>>> When booting the VM with UEFI, UEFI takes ownership of the RTC hardware.
>>> While UEFI can use libfdt to disable the RTC device node in the DTB that
>>> it passes to the OS, it cannot modify AML. Therefore, we won't generate
>>> the RTC ACPI device at all when using UEFI.
>>
>> I think a condensed comment similar to this commit message would be nice
>> in build_dsdt, or somewhere. We have a policy for mach-virt of generating
>> ACPI for everything we generate DT. It'd be good if we documented all the
>> divergences in order to avoid confusion. [...]
>
> Good idea!

I'm happy with the code in this patch, so you can add my
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Shannon, I'm assuming you're planning a v3 with the comment that
Andrew and Laszlo suggest.

thanks
-- PMM
