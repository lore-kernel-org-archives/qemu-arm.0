Received: by 10.25.205.13 with SMTP id d13csp115408lfg;
        Wed, 14 Dec 2016 02:19:55 -0800 (PST)
X-Received: by 10.55.161.87 with SMTP id k84mr15869966qke.234.1481710795151;
        Wed, 14 Dec 2016 02:19:55 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id f129si29798361qkc.284.2016.12.14.02.19.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 14 Dec 2016 02:19:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46604 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cH6fA-00084F-DW
	for alex.bennee@linaro.org; Wed, 14 Dec 2016 05:19:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43611)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cH6f2-0007uA-Rn
	for qemu-arm@nongnu.org; Wed, 14 Dec 2016 05:19:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cH6ew-0002GV-NW
	for qemu-arm@nongnu.org; Wed, 14 Dec 2016 05:19:44 -0500
Received: from mail-vk0-f43.google.com ([209.85.213.43]:36153)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cH6ew-0002GH-Al
	for qemu-arm@nongnu.org; Wed, 14 Dec 2016 05:19:38 -0500
Received: by mail-vk0-f43.google.com with SMTP id p9so20753930vkd.3
	for <qemu-arm@nongnu.org>; Wed, 14 Dec 2016 02:19:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=J+XXJK8T8AclS0lVxsE5L0dI7tnSZD2QEDoFt9triGw=;
	b=ACoPjI0d4bcGZB+CxPTS0uVxBqN7mos/nLVzU5/RBMXYLghWb4mdqzQwioNRQvAADz
	rYllUYR04GJRkAKs7ItNFM7Tl6wOSIiCE1+3pqLyIVX7woEX3AriJm9j4e2mT5udHRKR
	N1laPFKaTvXx7ZfgLKydMTzYfCJHQRc64z1As=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=J+XXJK8T8AclS0lVxsE5L0dI7tnSZD2QEDoFt9triGw=;
	b=OFtn/D5dfuXT/t51io13d1KAhil39YoGdvO8wcAsOy9FKBgZz1nAcH8oC4jThWCex/
	ZFJre1fD+tatKnJLiSWkru7z4lQPE0UJfOEgXDTGbEA+0OUQiegQjAelqxSlGYMJJgP8
	RKG3xpdPT1YI6vNxqayA1/DF9UuUSPBMOpgr0JrYNhrLMVdF3rYyxSuIZpTcnyIId4KN
	8ykH3xc5AbWxX4kquS3+UkPY9gC+WRM7HmH0OmrP8Z1h7yI6bRC9sFT4qpC+sfHxWCHg
	wmFNrFLJwtYCH34DFoIE0qaC/BLqKdRhPRBVJ2MpWl5JkqslWGmRrCOnN2lTMO+tN/5z
	vZRA==
X-Gm-Message-State: AKaTC01AyF6ztrYaBVDRmEJBsKH3DFsRQlREZb0f7NPtNemVlT0vTQO5JiM0uhO5x0Sz052hHpHkqpNI0J6BIrrU
X-Received: by 10.31.8.8 with SMTP id 8mr43046437vki.173.1481710717499; Wed,
	14 Dec 2016 02:18:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.176.14 with HTTP; Wed, 14 Dec 2016 02:18:17 -0800 (PST)
In-Reply-To: <20161213211606.x4cssgt4knld4m4z@hawk.localdomain>
References: <1481625384-15077-1-git-send-email-peter.maydell@linaro.org>
	<20161213211606.x4cssgt4knld4m4z@hawk.localdomain>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 14 Dec 2016 10:18:17 +0000
Message-ID: <CAFEAcA9xBBaXVya6KY9DG1cFuu4vBd6KyuJ+3soZtc2V=gOnNQ@mail.gmail.com>
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.213.43
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 00/23] arm: Add virtualization
 to GICv3, and enable EL2 on 64-bit CPUs
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bcnEaSpjZjDa

On 13 December 2016 at 21:16, Andrew Jones <drjones@redhat.com> wrote:
> On Tue, Dec 13, 2016 at 10:36:01AM +0000, Peter Maydell wrote:
>> This patchset adds support for the Virtualization extensions to QEMU's
>> GICv3 emulation. This was the last missing piece that was stopping
>> us from turning on the EL2 support in the CPU model, so the patchset
>> also adds support for enabling it all on the virt board via the
>> '-machine virtualization=on' option.
>>
>> The result works well enough to allow booting a KVM outer guest kernel
>> and then running QEMU + an inner guest under KVM inside it. The outer
>> guest KVM also passes the kvm-unit-tests GIC tests.
>>
>
> I've started some testing with this. When I boot an outer (L1) kernel
> with more than one cpu allocated I get
>
> [    3.441908] CPU: CPUs started in inconsistent modes
> [    3.442787] ------------[ cut here ]------------
> [    3.445434] WARNING: CPU: 0 PID: 1 at arch/arm64/kernel/smp.c:418 smp_cpus_done+0x80/0xa0
> ...
>
> and KVM does not init. Booting with only one cpu I see we do start in EL2
> and KVM does init. I'm booting the L1 kernel through UEFI (AAVMF). Also,
> my L1 guest kernel is 4.9 based, but not pure upstream. I can try a more
> pure 4.9 kernel with a defconfig later.

Yeah, I don't think I ever tried an SMP config in outer QEMU.
This seems like it would be a problem with the boot.c code rather than
the new GIC features, though... I'll have a look.

thanks
-- PMM
