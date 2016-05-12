Received: by 10.25.208.137 with SMTP id h131csp720627lfg;
        Thu, 12 May 2016 07:36:09 -0700 (PDT)
X-Received: by 10.55.192.7 with SMTP id o7mr10218331qki.27.1463063769406;
        Thu, 12 May 2016 07:36:09 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o98si8758272qge.88.2016.05.12.07.36.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 May 2016 07:36:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57809 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b0rih-0004Mm-9E
	for alex.bennee@linaro.org; Thu, 12 May 2016 10:36:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51116)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b0ric-0004FM-Cd
	for qemu-arm@nongnu.org; Thu, 12 May 2016 10:36:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b0riU-0003iO-UP
	for qemu-arm@nongnu.org; Thu, 12 May 2016 10:36:01 -0400
Received: from mail-vk0-x22d.google.com ([2607:f8b0:400c:c05::22d]:36518)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b0riU-0003i4-If
	for qemu-arm@nongnu.org; Thu, 12 May 2016 10:35:54 -0400
Received: by mail-vk0-x22d.google.com with SMTP id s184so99730900vkb.3
	for <qemu-arm@nongnu.org>; Thu, 12 May 2016 07:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=mvxgefBkNqOYw1gmrVkg6MMO9a8FbjGjk2fqBX5HgIQ=;
	b=N3CT3Kn46ClQNoIvtlzHNYI83FQT5o2auTbgMAzyhM7dmgPNIU+sfeMx9q+r0KPp0r
	vSuLw76uTQzqRE/f8uZBX2jmgKm6rnj9G84KQf3DMSEzrKtmO61WYt5Mcq7ouJHUgj+4
	HLQ/bw3gt1xpa8A7qcv7LJ+yvOR9+VTaZK0Lc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=mvxgefBkNqOYw1gmrVkg6MMO9a8FbjGjk2fqBX5HgIQ=;
	b=fTpP97MuGkqi5JmSwcel9jWO2WJWR5M9C2BuZR51CLfdE29cS0NDBSSsjkrIZJ/b24
	flAGqpwjtffbQSoIPrMm2ual+ryJ+EZpVkvrx36rGO6BVRnABlZhQtFiuEbf2n9qMB9x
	2FDukeuymYshqYYtpkCPpBfu8iDxNPsWBE8CIXsBsmT/lfv+6b4b9Y/mIcrqlg5x5CT2
	lJfongBTSSMx+y41QPFv2rqVHOOIE4H4p2bXFkHyihYNu5QeAb8QBGkI5mlRVGw4k2ab
	XBfp31lgfud06ilPeM4WijzaNyXNBrOU4Dg1ZVSne/pSLG0KKylTiOcr1f6QGUdWZgNk
	HioA==
X-Gm-Message-State: AOPr4FXqe/u7wXPyQ7nNu+e2xZrnnVoLSrLV1ZKn8cc+R0CfqEd6GmjkiJM7DArGUCrRC4xeEOqV3EEXm6rDpL36
X-Received: by 10.176.6.100 with SMTP id f91mr4415622uaf.38.1463063754075;
	Thu, 12 May 2016 07:35:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Thu, 12 May 2016 07:35:34 -0700 (PDT)
In-Reply-To: <573493A7.3030604@linaro.org>
References: <1462814989-24360-1-git-send-email-peter.maydell@linaro.org>
	<5732D667.3040105@huawei.com>
	<CAFEAcA_ptjAd-hLUmfVr=47KD9w8-cyZJuWHgSvkwZKfgU+jaw@mail.gmail.com>
	<573493A7.3030604@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 May 2016 15:35:34 +0100
Message-ID: <CAFEAcA8BeETRW_Rm5HwGX6_y6sBez86p5-WYUZoPdin54KoTxw@mail.gmail.com>
To: Shannon Zhao <shannon.zhao@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22d
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 00/23] GICv3 emulation
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Patch Tracking <patches@linaro.org>,
	Shlomo Pongratz <shlomo.pongratz@huawei.com>,
	Shlomo Pongratz <shlomopongratz@gmail.com>,
	Pavel Fedin <p.fedin@samsung.com>, QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Shannon Zhao <zhaoshenglong@huawei.com>,
	Christoffer Dall <christoffer.dall@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mCxVJsKSqR5K

On 12 May 2016 at 15:31, Shannon Zhao <shannon.zhao@linaro.org> wrote:
> On 2016=E5=B9=B405=E6=9C=8812=E6=97=A5 21:53, Peter Maydell wrote:
>> On 11 May 2016 at 07:51, Shannon Zhao <zhaoshenglong@huawei.com> wrote:
>>> Hi Peter,
>>>
>>> On 2016/5/10 1:29, Peter Maydell wrote:
>>>
>>>> Code review, testing, attempts to run guests other than Linux
>>>> welcome (UEFI, anybody?)
>>> I run a guest with UEFI firmware. It gets stuck when kernel boots:
>>>
>>> [    0.186331] Brought up 1 CPUs
>>> [    0.186613] SMP: Total of 1 processors activated.
>>> [    0.187976] CPU: All CPU(s) started at EL1
>>> [    0.191060] alternatives: patching kernel code
>>> [    0.234352] devtmpfs: initialized
>>> [    0.273918] SMBIOS 3.0.0 present.
>>> [    0.280438] clocksource: jiffies: mask: 0xffffffff max_cycles:
>>> 0xffffffff, max_idle_ns: 7645041785100000 ns
>>> [    0.289983] pinctrl core: initialized pinctrl subsystem
>>> [    0.347558] NET: Registered protocol family 16
>>
>> Hmm, this works for me. I'm using the Linaro built UEFI from
>> https://releases.linaro.org/components/kernel/uefi-linaro/15.12/release/=
qemu64/QEMU_EFI.fd
>> and a 4.4 kernel and a command line
>> ./build/a64-targets-nodbg/aarch64-softmmu/qemu-system-aarch64 -m 1024
>> -M virt,gic-version=3D3 -cpu cortex-a57 -nographic -kernel
>> ~/test-images/virtv8/Image -bios /tmp/QEMU_EFI.fd -append
>> 'console=3DttyAMA0,38400 keep_bootcon root=3D/dev/vda2'
>>
> I wget the UEFI you use from above url and test with below script. It
> still hangs.
> ./qemu/aarch64-softmmu/qemu-system-aarch64 -smp 1 \
> -m 1024 -M virt,gic-version=3D3 -cpu cortex-a57 -nographic -kernel Image =
\
> -bios QEMU_EFI.fd -append 'console=3DttyAMA0 root=3D/dev/ram
> earlycon=3Dpl011,0x9000000 rw'

Can you put the Image file somewhere I can download it, please?

thanks
-- PMM
