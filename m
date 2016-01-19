Received: by 10.25.159.19 with SMTP id i19csp2644395lfe;
        Tue, 19 Jan 2016 10:07:02 -0800 (PST)
X-Received: by 10.55.72.70 with SMTP id v67mr39049881qka.47.1453226822432;
        Tue, 19 Jan 2016 10:07:02 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z139si38648611qka.98.2016.01.19.10.07.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Jan 2016 10:07:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:38683 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aLagH-000892-Rs
	for alex.bennee@linaro.org; Tue, 19 Jan 2016 13:07:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51706)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aLagF-00085O-GJ
	for qemu-arm@nongnu.org; Tue, 19 Jan 2016 13:07:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aLagC-0000Uq-DC
	for qemu-arm@nongnu.org; Tue, 19 Jan 2016 13:06:57 -0500
Received: from mail-vk0-x22f.google.com ([2607:f8b0:400c:c05::22f]:33819)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aLagC-0000UP-96
	for qemu-arm@nongnu.org; Tue, 19 Jan 2016 13:06:56 -0500
Received: by mail-vk0-x22f.google.com with SMTP id e185so13660369vkb.1
	for <qemu-arm@nongnu.org>; Tue, 19 Jan 2016 10:06:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=iw6o01n7dknseldV2+gKcySUrwHytGJGWxYX8TLux1U=;
	b=G0ikjNXqu0oEatorE7xHnwHUvgs7JQDs93CMB4JlCIkWWb44s7H8Cr0u0M8ajLfMMA
	/j82luEqiWOdr0/lTQG3OD/mr/RdtWaVsOMzAr3Mb6wovIphJIj3lp8ABDEJeJxRj/og
	GxdYVifeDuogPlS2TU4AZDC9ZWmho2cXMRnKg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=iw6o01n7dknseldV2+gKcySUrwHytGJGWxYX8TLux1U=;
	b=EFFzFRQ2rX56rsvi2rSi79CFBqGL94bJNpzaYP0q9RjoTbNzX+Uc+UwwpXTNpVMdXx
	DXFeayH5NT5m6oWM7+Kz5iX3Kc/AEpgPDSV7YHlgonEPSqwTHs5PZEc+Ufz6Olj9phNt
	q/2AZTiPsbd8p/osC9zMpJj7iEZyg7zj6cp35Kv5NWzH+RCLm+w7E/69eLP0iPWavA1X
	aLKG9vwP7H9lym3g0qo0HluMgeOKE37WG1G9gaN2ZCMe/sEjLaPG/BfjpAeyN4CwrYFu
	M6CxjfecirZoxbHabudLqgpSU5WCP66DceLmB7+7UrfjQ/9mItsevZv05uqeEDJ36as8
	/uXQ==
X-Gm-Message-State: ALoCoQmeCBdF/M/NVRjxKVoc5u6WPPGxOJxRhjc3tW9CWwXAun1XXBs9otQPxKTS77xFsjZ6CheHCy0cWNk446/iDmlj6pzQHsvuW8hsjJdIWlv7PZUMP4M=
X-Received: by 10.31.141.2 with SMTP id p2mr21464923vkd.37.1453226813846; Tue,
	19 Jan 2016 10:06:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Tue, 19 Jan 2016 10:06:34 -0800 (PST)
In-Reply-To: <cover.1453100525.git.crosthwaite.peter@gmail.com>
References: <cover.1453100525.git.crosthwaite.peter@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jan 2016 18:06:34 +0000
Message-ID: <CAFEAcA_7LzPjSkkjG4Y8zHss_zzHn5-c9_oFru9k1uYakaPs5w@mail.gmail.com>
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22f
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	sridhar kulkarni <sridhar_kulk@yahoo.com>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?Q?Piotr_Kr=C3=B3l?= <piotr.krol@3mdeb.com>
Subject: Re: [Qemu-arm] [PATCH v1 00/17] ARM big-endian and setend support
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
X-TUID: WIGWRpo4TMSZ

On 18 January 2016 at 07:12, Peter Crosthwaite
<crosthwaitepeter@gmail.com> wrote:
> Hi All,
>
> This patch series adds system-mode big-endian support for ARM. It also
> implements the setend instruction, and loading of BE binaries even in
> LE emulation mode.
>
> Based on Paolo's original work. I have moved all the BE32 related work
> to the back of the series. Multiple parties are interested in the BE8
> work just on its own, so that could potentially be merged w/o BE32.
> PMM requested BE32 be at least thought out architecturally, so this
> series sees BE32 functionality through.
>
> I have tested all of LE. BE8 and BE32 in both linux-user mode (for
> regressions) and system mode (BE8 and BE32 are new here).
> My test application is here, the README gives some example command
> lines you can run:
>
> https://github.com/pcrost/arm-be-test

Thanks for picking this up again. I've sent out my review comments on it now.

-- PMM
