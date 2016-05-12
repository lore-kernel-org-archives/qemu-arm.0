Received: by 10.25.208.137 with SMTP id h131csp702931lfg;
        Thu, 12 May 2016 06:55:45 -0700 (PDT)
X-Received: by 10.140.89.202 with SMTP id v68mr9481501qgd.95.1463061345739;
        Thu, 12 May 2016 06:55:45 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f91si8672465qga.24.2016.05.12.06.55.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 May 2016 06:55:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57492 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b0r5c-0004K5-Rx
	for alex.bennee@linaro.org; Thu, 12 May 2016 09:55:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39918)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b0r3R-0001cB-Dm
	for qemu-devel@nongnu.org; Thu, 12 May 2016 09:53:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b0r3O-0000ue-O0
	for qemu-devel@nongnu.org; Thu, 12 May 2016 09:53:28 -0400
Received: from mail-vk0-x22a.google.com ([2607:f8b0:400c:c05::22a]:33345)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b0r3O-0000uY-6k
	for qemu-devel@nongnu.org; Thu, 12 May 2016 09:53:26 -0400
Received: by mail-vk0-x22a.google.com with SMTP id o133so98267486vka.0
	for <qemu-devel@nongnu.org>; Thu, 12 May 2016 06:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=XZpOFAQdx3+3kcrD5wBjtOBngcUYizo8jfo39g6pMF0=;
	b=aV5WtZKrW6PEzbTBQOybSbkwrj5wu0Tbk3Nf6KFO4SwSlNLf1uM1lHLmkQRqJSaRPL
	3qg6CYA7UtxWbMfO2hD6HjQjqwRtEEa9gt1VP95dD9nNYy2GG9xAIS6Z9uPz3aESzzTW
	RrceEgrnU8hOwkjRUue09zMU5ExpK73YFmuT0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=XZpOFAQdx3+3kcrD5wBjtOBngcUYizo8jfo39g6pMF0=;
	b=A7ALYl8vVu+uVhfeQXKJ328kidvOltn39dqiHZoHKqUF7YMUrZ88XDs8qB3I/DFj6k
	bMY+Ll+lEEUjz7iWr8BxKrAp9A0PAOEuk3dDRaoLRHDsNpkFMifllpHjvWOnXEwK+0oP
	smUfQGG6Umd3XJxEs+dNu5PEI3iEItlEl3qFULqRNGqKbiElYS4a4Z0ML8Fwn7aoQBPH
	IxbdyuT0J6IvbYyhVbtup8ky5Nm+iP7iqK6Ts3gQUv5uKRCtDqr2lj1sYOk319kwOf5E
	/RnPaxN6P1ecJJ+xjoMlVFib/YSVWWuypJ2nx6CGawYxsbbfU95+K4LNs16rFVWY26wJ
	1tWQ==
X-Gm-Message-State: AOPr4FUP4T23d3x7NNqts04cCh5x3zvKQG86cTTKBBcAxbH6geMEthhsXsxAmY/aWRsuxl4TtN6H5MKQXIfqKJph
X-Received: by 10.176.4.20 with SMTP id 20mr4799006uav.125.1463061204817; Thu,
	12 May 2016 06:53:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Thu, 12 May 2016 06:53:05 -0700 (PDT)
In-Reply-To: <5732D667.3040105@huawei.com>
References: <1462814989-24360-1-git-send-email-peter.maydell@linaro.org>
	<5732D667.3040105@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 May 2016 14:53:05 +0100
Message-ID: <CAFEAcA_ptjAd-hLUmfVr=47KD9w8-cyZJuWHgSvkwZKfgU+jaw@mail.gmail.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22a
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
	qemu-arm <qemu-arm@nongnu.org>, Shannon Zhao <shannon.zhao@linaro.org>,
	Christoffer Dall <christoffer.dall@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qx5mxF8Yvlkr

On 11 May 2016 at 07:51, Shannon Zhao <zhaoshenglong@huawei.com> wrote:
> Hi Peter,
>
> On 2016/5/10 1:29, Peter Maydell wrote:
>
>> Code review, testing, attempts to run guests other than Linux
>> welcome (UEFI, anybody?)
> I run a guest with UEFI firmware. It gets stuck when kernel boots:
>
> [    0.186331] Brought up 1 CPUs
> [    0.186613] SMP: Total of 1 processors activated.
> [    0.187976] CPU: All CPU(s) started at EL1
> [    0.191060] alternatives: patching kernel code
> [    0.234352] devtmpfs: initialized
> [    0.273918] SMBIOS 3.0.0 present.
> [    0.280438] clocksource: jiffies: mask: 0xffffffff max_cycles:
> 0xffffffff, max_idle_ns: 7645041785100000 ns
> [    0.289983] pinctrl core: initialized pinctrl subsystem
> [    0.347558] NET: Registered protocol family 16

Hmm, this works for me. I'm using the Linaro built UEFI from
https://releases.linaro.org/components/kernel/uefi-linaro/15.12/release/qemu64/QEMU_EFI.fd
and a 4.4 kernel and a command line
./build/a64-targets-nodbg/aarch64-softmmu/qemu-system-aarch64 -m 1024
-M virt,gic-version=3 -cpu cortex-a57 -nographic -kernel
~/test-images/virtv8/Image -bios /tmp/QEMU_EFI.fd -append
'console=ttyAMA0,38400 keep_bootcon root=/dev/vda2'

(which panics for not finding the root fs because I didn't bother
to put that into the command line, but it doesn't hang at the
early stage yours does).

Did you build the QEMU you're testing from the patchset I sent out,
or did you try pulling my git tree? I've just realised I forgot
to update the git tree branch (now done).

thanks
-- PMM
