Received: by 10.25.159.19 with SMTP id i19csp1069838lfe;
        Wed, 13 Jan 2016 03:53:08 -0800 (PST)
X-Received: by 10.140.166.198 with SMTP id m189mr42953228qhm.35.1452685988755;
        Wed, 13 Jan 2016 03:53:08 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v64si1012690qhv.61.2016.01.13.03.53.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Jan 2016 03:53:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:36603 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aJJzA-0002g8-FE
	for alex.bennee@linaro.org; Wed, 13 Jan 2016 06:53:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38020)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aJJz8-0002fx-Q8
	for qemu-arm@nongnu.org; Wed, 13 Jan 2016 06:53:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aJJz7-0002Ta-JT
	for qemu-arm@nongnu.org; Wed, 13 Jan 2016 06:53:06 -0500
Received: from mail-vk0-x236.google.com ([2607:f8b0:400c:c05::236]:34022)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aJJz7-0002TU-F9
	for qemu-arm@nongnu.org; Wed, 13 Jan 2016 06:53:05 -0500
Received: by mail-vk0-x236.google.com with SMTP id a123so229604716vkh.1
	for <qemu-arm@nongnu.org>; Wed, 13 Jan 2016 03:53:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Cb/Uu9yieNQxUXkk3B5CoooTRFJGsrWt6yTbs/bUbO0=;
	b=MgDqnWRjlQ7jz5193D+0pO00GqIOdlgxqAe9EThQyS2SbyzADAC/BB75wILuWD2IEE
	K/wmSrmeAM+O5+Zj081a8acuXeB7MuIH+AXOW60RaaxqQDBP1MDdHRHgL2zMfQ0Mlvuo
	mNlqQRkE9CDf80Bb51dnwgPqR7PXZvxE8+BtY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Cb/Uu9yieNQxUXkk3B5CoooTRFJGsrWt6yTbs/bUbO0=;
	b=Ib+RVVRYMw5MwMG6J0hfjRwxgaERGzesnVmsgwOrFgYGqAXln9VYWgRm+5f+MBatf4
	ITW/YcX0vTGdEOIBW0t0MGgUYtmZvif83pIPH8gyTvdhi0sQ0+qjhVaN49Ib18E1T2Mx
	dNNenXQin4CVRSi0ELTMwoxlxeOFROY6+7fyGIivvuV7rJDuggFRkrzCINiEr8bDisBQ
	4wBqqEwk5mG3uNpcq3GLdyOxX8uAwFTOhEQfXYVUTIVhsJfeYdB+gonXcQI4J2AqCFSW
	5gha9QJVUErdwX0H4Yx1cpZqJNtUnRK+jp0VyLRIvqMQiPN9rzuDn6j0BmFoBvVCJ0kJ
	x4Ew==
X-Gm-Message-State: ALoCoQkcFrNQLuRGHpaK7POjcW3gkMuVP12eNmTrNBBhLSNbaex3k2JxVkOG8bvqHqJqj1+scUcyDF+dc67SOL1YXddOvM5I85LGfRGx52zz5+2eGX3mM8M=
X-Received: by 10.31.180.145 with SMTP id d139mr85662953vkf.83.1452685983876; 
	Wed, 13 Jan 2016 03:53:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Wed, 13 Jan 2016 03:52:44 -0800 (PST)
In-Reply-To: <56962B73.3080407@redhat.com>
References: <1452612274-30218-1-git-send-email-shannon.zhao@linaro.org>
	<5696246B.8080304@redhat.com>
	<CAKv+Gu-EaQOAXmbiGp9k55_t1X6SNbtaMScF01qgPKW7SU4vug@mail.gmail.com>
	<56962B73.3080407@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 13 Jan 2016 11:52:44 +0000
Message-ID: <CAFEAcA_0+gntO3EHooZGJ4x0sA+_GLBZXg=2FrxGfFZ5G_EWZQ@mail.gmail.com>
To: Laszlo Ersek <lersek@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::236
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	"edk2-devel@lists.01.org" <edk2-devel@ml01.01.org>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Shannon Zhao <shannon.zhao@linaro.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>
Subject: Re: [Qemu-arm] [PATCH] ARM: Virt: Don't generate RTC ACPI node when
	using UEFI
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
X-TUID: SC+hIi+JHj4m

On 13 January 2016 at 10:48, Laszlo Ersek <lersek@redhat.com> wrote:
> On 01/13/16 11:20, Ard Biesheuvel wrote:
>> I am not buying it either, to be honest. In fact, I think it is
>> another reason why we should mandate UEFI when using ACPI (which is
>> already the case in practice). Then, we can simply omit the RTC ACPI
>> node entirely.
>
> Good point.

Yes, a patch that simply removed the RTC device from the
ACPI table altogether would I think be better. That then
continues with the current approach that the tables provided
by QEMU are intended for use only with a UEFI bios in
the picture.

thanks
-- PMM
