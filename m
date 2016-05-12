Received: by 10.25.208.137 with SMTP id h131csp718710lfg;
        Thu, 12 May 2016 07:31:30 -0700 (PDT)
X-Received: by 10.55.79.5 with SMTP id d5mr10251526qkb.30.1463063490777;
        Thu, 12 May 2016 07:31:30 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k9si8766568qgd.22.2016.05.12.07.31.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 May 2016 07:31:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57781 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b0reE-0000Tz-2B
	for alex.bennee@linaro.org; Thu, 12 May 2016 10:31:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50051)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1b0re7-0000KX-8q
	for qemu-arm@nongnu.org; Thu, 12 May 2016 10:31:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1b0re0-0001kw-Ke
	for qemu-arm@nongnu.org; Thu, 12 May 2016 10:31:22 -0400
Received: from mail-pa0-x22d.google.com ([2607:f8b0:400e:c03::22d]:33815)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1b0rdz-0001kM-9A
	for qemu-arm@nongnu.org; Thu, 12 May 2016 10:31:16 -0400
Received: by mail-pa0-x22d.google.com with SMTP id r5so31078274pag.1
	for <qemu-arm@nongnu.org>; Thu, 12 May 2016 07:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=HCDSCtvmEk9ibixcIj5VximW5TC4FjTWn2HJ+suGkaI=;
	b=dtUqz81OtEO6/HfC4o6GXXVKqpiuwUcdhKDmM+RBi9dotfMbHN5tTWyl0i2RkCF7U5
	/yOBgPzq/gwZ3H3/zRC7ZzM+zfXqCYSJjaLYC20w6RZu6asV30zAHHkZcGehqe8fyQoP
	npfVhdzf3nWe8fUSBOzPEul1Zma+ArvEDigkA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=HCDSCtvmEk9ibixcIj5VximW5TC4FjTWn2HJ+suGkaI=;
	b=goGer+wj5rD8eddl83vcya1MeLzYcCld4gwqqT11j577m53k28ec1Ck8k7srC98bGy
	fO9mZYrI8coXJq3It03GjlHvLXGiYpZX0tq36LnRF3aLGsx++QEgIA52+9y/g1uWsdtv
	o3BDiTaoBmRN0UsV6pm+L8miFw/XiyRICrKHxATFj/NOwpBR6Tr8+jWRbSWJUL6I/x4W
	X+XygNLtgtc2tPt5GuOycL9rYf9mwTPmC6hUsn+MPuzsAX0uvlje7SC7pVuCmtPeeag3
	SPiyiLn+7Ip3HiQk4YUAyFK5a7HhCNwkMBpuDQheTcI8x0YUW9SHzx5cO/V4Mb7kDksV
	8Ebg==
X-Gm-Message-State: AOPr4FVFmN8NZ00XHsSRk5IAcOc3WRYvUJMPTAobsiQqk/cN42O4bDHLiNEx9+8sb8XKhCzg
X-Received: by 10.66.41.43 with SMTP id c11mr14443454pal.96.1463063474038;
	Thu, 12 May 2016 07:31:14 -0700 (PDT)
Received: from [10.10.9.42] ([167.160.116.163])
	by smtp.gmail.com with ESMTPSA id
	ey12sm20417606pac.26.2016.05.12.07.31.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 12 May 2016 07:31:12 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>
References: <1462814989-24360-1-git-send-email-peter.maydell@linaro.org>
	<5732D667.3040105@huawei.com>
	<CAFEAcA_ptjAd-hLUmfVr=47KD9w8-cyZJuWHgSvkwZKfgU+jaw@mail.gmail.com>
From: Shannon Zhao <shannon.zhao@linaro.org>
Message-ID: <573493A7.3030604@linaro.org>
Date: Thu, 12 May 2016 22:31:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_ptjAd-hLUmfVr=47KD9w8-cyZJuWHgSvkwZKfgU+jaw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c03::22d
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
	qemu-arm <qemu-arm@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nc7z5UPEGm8z

On 2016年05月12日 21:53, Peter Maydell wrote:
> On 11 May 2016 at 07:51, Shannon Zhao <zhaoshenglong@huawei.com> wrote:
>> Hi Peter,
>>
>> On 2016/5/10 1:29, Peter Maydell wrote:
>>
>>> Code review, testing, attempts to run guests other than Linux
>>> welcome (UEFI, anybody?)
>> I run a guest with UEFI firmware. It gets stuck when kernel boots:
>>
>> [    0.186331] Brought up 1 CPUs
>> [    0.186613] SMP: Total of 1 processors activated.
>> [    0.187976] CPU: All CPU(s) started at EL1
>> [    0.191060] alternatives: patching kernel code
>> [    0.234352] devtmpfs: initialized
>> [    0.273918] SMBIOS 3.0.0 present.
>> [    0.280438] clocksource: jiffies: mask: 0xffffffff max_cycles:
>> 0xffffffff, max_idle_ns: 7645041785100000 ns
>> [    0.289983] pinctrl core: initialized pinctrl subsystem
>> [    0.347558] NET: Registered protocol family 16
> 
> Hmm, this works for me. I'm using the Linaro built UEFI from
> https://releases.linaro.org/components/kernel/uefi-linaro/15.12/release/qemu64/QEMU_EFI.fd
> and a 4.4 kernel and a command line
> ./build/a64-targets-nodbg/aarch64-softmmu/qemu-system-aarch64 -m 1024
> -M virt,gic-version=3 -cpu cortex-a57 -nographic -kernel
> ~/test-images/virtv8/Image -bios /tmp/QEMU_EFI.fd -append
> 'console=ttyAMA0,38400 keep_bootcon root=/dev/vda2'
> 
I wget the UEFI you use from above url and test with below script. It
still hangs.
./qemu/aarch64-softmmu/qemu-system-aarch64 -smp 1 \
-m 1024 -M virt,gic-version=3 -cpu cortex-a57 -nographic -kernel Image \
-bios QEMU_EFI.fd -append 'console=ttyAMA0 root=/dev/ram
earlycon=pl011,0x9000000 rw'

Booting log:
http://paste.ubuntu.com/16375541/

> (which panics for not finding the root fs because I didn't bother
> to put that into the command line, but it doesn't hang at the
> early stage yours does).
> 
> Did you build the QEMU you're testing from the patchset I sent out,
> or did you try pulling my git tree? I've just realised I forgot
> to update the git tree branch (now done).
> 
I just apply the patches you sent out(since you didn't mention there is
a tree for them).

Thanks,
-- 
Shannon
