Received: by 10.25.208.137 with SMTP id h131csp742458lfg;
        Thu, 12 May 2016 08:23:14 -0700 (PDT)
X-Received: by 10.55.159.75 with SMTP id i72mr10145441qke.29.1463066594863;
        Thu, 12 May 2016 08:23:14 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e4si8892720qge.36.2016.05.12.08.23.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 May 2016 08:23:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58327 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b0sSI-0007FK-AW
	for alex.bennee@linaro.org; Thu, 12 May 2016 11:23:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58424)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1b0s7T-0000j3-Vg
	for qemu-devel@nongnu.org; Thu, 12 May 2016 11:01:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1b0s7N-0001aN-4V
	for qemu-devel@nongnu.org; Thu, 12 May 2016 11:01:42 -0400
Received: from mail-pf0-x235.google.com ([2607:f8b0:400e:c00::235]:35055)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1b0s7M-0001ZR-ST
	for qemu-devel@nongnu.org; Thu, 12 May 2016 11:01:37 -0400
Received: by mail-pf0-x235.google.com with SMTP id 77so31537055pfv.2
	for <qemu-devel@nongnu.org>; Thu, 12 May 2016 08:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=RJpfmovm7iZDrZhrWwimjLf7ZfaQllDafPvNAXP+5x0=;
	b=igx4t0K6CxgDChtxheIMwaMMsU94LsHR7khCJuz2BWD2is9rA/p6n36b274p5s4nOM
	Ehlzp+eU7LCBdosmyqJMpsmf2BFnFpcTO0HFeX/8HjxNCMR7hVFe2wQMxfc6SN06OBTo
	XS8hdJ6S49eMZv16QU4l37QZQttCkdRARaV0U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=RJpfmovm7iZDrZhrWwimjLf7ZfaQllDafPvNAXP+5x0=;
	b=VpnXCRaRVQAb5lGmmupXFds2j8lpy+kdqAI1qUXEz/D/9nZR8URU40zpNNdiaYvk/c
	w3rZ4b2++g/XfG6mMHyYZhP4JCvmle+UkPIkRo0dyGWdjeIhgTf9qdIDTRD02BnT/8Ol
	xY4u/2vO1nAFPxOP9SobwUpjdyK3gJF0tAsOI8it5d+gMKwP1qhUyPxzkcC7b3h4vQDh
	nKEF57vMKf9JkUedv6h00bvBXcbcNx48YSlHiZpzsQFD9jveuN1jDvyuiTvKZbNT6ujk
	+zxq/JVv9h4lZuaDEOyceiPLJ2qdvb7BnAs7ZFoB+3/j+vP4WU/0DrLMyACYc6mgPtmH
	6yOg==
X-Gm-Message-State: AOPr4FXJq0Vwbso8evMUPA3PmmgHYq63nJ776EC95jYWbZ5cYdkWecpQiH0gdXTqtFv9qbg/
X-Received: by 10.98.43.133 with SMTP id r127mr14695633pfr.38.1463065295896;
	Thu, 12 May 2016 08:01:35 -0700 (PDT)
Received: from [10.13.7.150] ([104.238.32.71])
	by smtp.gmail.com with ESMTPSA id
	l123sm20589318pfl.36.2016.05.12.08.01.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 12 May 2016 08:01:34 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1462814989-24360-1-git-send-email-peter.maydell@linaro.org>
	<5732D667.3040105@huawei.com>
	<CAFEAcA_ptjAd-hLUmfVr=47KD9w8-cyZJuWHgSvkwZKfgU+jaw@mail.gmail.com>
	<573493A7.3030604@linaro.org>
	<CAFEAcA8BeETRW_Rm5HwGX6_y6sBez86p5-WYUZoPdin54KoTxw@mail.gmail.com>
From: Shannon Zhao <shannon.zhao@linaro.org>
Message-ID: <57349AC9.5070407@linaro.org>
Date: Thu, 12 May 2016 23:01:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8BeETRW_Rm5HwGX6_y6sBez86p5-WYUZoPdin54KoTxw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::235
Subject: Re: [Qemu-devel] [PATCH 00/23] GICv3 emulation
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
Cc: Patch Tracking <patches@linaro.org>,
	Shlomo Pongratz <shlomo.pongratz@huawei.com>,
	Shlomo Pongratz <shlomopongratz@gmail.com>,
	Pavel Fedin <p.fedin@samsung.com>, QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Shannon Zhao <zhaoshenglong@huawei.com>,
	Christoffer Dall <christoffer.dall@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pKcOz/1cafNx

On 2016年05月12日 22:35, Peter Maydell wrote:
> On 12 May 2016 at 15:31, Shannon Zhao <shannon.zhao@linaro.org> wrote:
>> > On 2016年05月12日 21:53, Peter Maydell wrote:
>>> >> On 11 May 2016 at 07:51, Shannon Zhao <zhaoshenglong@huawei.com> wrote:
>>>> >>> Hi Peter,
>>>> >>>
>>>> >>> On 2016/5/10 1:29, Peter Maydell wrote:
>>>> >>>
>>>>> >>>> Code review, testing, attempts to run guests other than Linux
>>>>> >>>> welcome (UEFI, anybody?)
>>>> >>> I run a guest with UEFI firmware. It gets stuck when kernel boots:
>>>> >>>
>>>> >>> [    0.186331] Brought up 1 CPUs
>>>> >>> [    0.186613] SMP: Total of 1 processors activated.
>>>> >>> [    0.187976] CPU: All CPU(s) started at EL1
>>>> >>> [    0.191060] alternatives: patching kernel code
>>>> >>> [    0.234352] devtmpfs: initialized
>>>> >>> [    0.273918] SMBIOS 3.0.0 present.
>>>> >>> [    0.280438] clocksource: jiffies: mask: 0xffffffff max_cycles:
>>>> >>> 0xffffffff, max_idle_ns: 7645041785100000 ns
>>>> >>> [    0.289983] pinctrl core: initialized pinctrl subsystem
>>>> >>> [    0.347558] NET: Registered protocol family 16
>>> >>
>>> >> Hmm, this works for me. I'm using the Linaro built UEFI from
>>> >> https://releases.linaro.org/components/kernel/uefi-linaro/15.12/release/qemu64/QEMU_EFI.fd
>>> >> and a 4.4 kernel and a command line
>>> >> ./build/a64-targets-nodbg/aarch64-softmmu/qemu-system-aarch64 -m 1024
>>> >> -M virt,gic-version=3 -cpu cortex-a57 -nographic -kernel
>>> >> ~/test-images/virtv8/Image -bios /tmp/QEMU_EFI.fd -append
>>> >> 'console=ttyAMA0,38400 keep_bootcon root=/dev/vda2'
>>> >>
>> > I wget the UEFI you use from above url and test with below script. It
>> > still hangs.
>> > ./qemu/aarch64-softmmu/qemu-system-aarch64 -smp 1 \
>> > -m 1024 -M virt,gic-version=3 -cpu cortex-a57 -nographic -kernel Image \
>> > -bios QEMU_EFI.fd -append 'console=ttyAMA0 root=/dev/ram
>> > earlycon=pl011,0x9000000 rw'
> Can you put the Image file somewhere I can download it, please?
I just upload it to
http://people.linaro.org/~shannon.zhao/ACPI_ARM/Image

-- 
Shannon
