Received: by 10.25.208.211 with SMTP id h202csp3275554lfg;
        Fri, 26 Feb 2016 02:22:44 -0800 (PST)
X-Received: by 10.55.75.144 with SMTP id y138mr817018qka.96.1456482161886;
        Fri, 26 Feb 2016 02:22:41 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 18si12518373qho.50.2016.02.26.02.22.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 26 Feb 2016 02:22:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:48601 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aZFXl-0006WY-7T
	for alex.bennee@linaro.org; Fri, 26 Feb 2016 05:22:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45686)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aZFXh-0006SA-LH
	for qemu-arm@nongnu.org; Fri, 26 Feb 2016 05:22:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aZFXg-0001vm-TO
	for qemu-arm@nongnu.org; Fri, 26 Feb 2016 05:22:37 -0500
Received: from mail-vk0-x234.google.com ([2607:f8b0:400c:c05::234]:35401)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aZFXg-0001vf-PC
	for qemu-arm@nongnu.org; Fri, 26 Feb 2016 05:22:36 -0500
Received: by mail-vk0-x234.google.com with SMTP id e6so73133322vkh.2
	for <qemu-arm@nongnu.org>; Fri, 26 Feb 2016 02:22:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=1FJByU2goO89FxeFJtFCrHvCdG5mSFpxJHWr60Md6CQ=;
	b=U5dc/eMyWmD870tIuLS+Ur/Lx+hIxkUSkvhKP8N522LZpfGxs/2YIYk4eMDVgqXuyr
	z8zlnNeauiXoSYrDY8TK0Gl0YUftNAe4/JOJHAb17I2F65S2oH4Lqu/UUnalCjcSWev2
	upjeLy5gTAMAtTXJjy0SVE+ZGtrPgjckXLJ6M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=1FJByU2goO89FxeFJtFCrHvCdG5mSFpxJHWr60Md6CQ=;
	b=Nq8L93MDhDe2RDBK94DYJeri6bmrSoXY4tLAAaczleIYptG49Z4ov6ET2fowJXIMUb
	sZZzDpWxr0Lsfa7caSqGd0yxNdR3xOg+V97c89w083mHA0lxD+Irdq+CenGL87EMmB4w
	XmXV1f1gGANwZmUDh2OuTlPwZ3VrJXQRNoYHkzhHaFHXDw48O8K8hlit+bE39MPplg3p
	RlZ4Kos3f4gzcvvfI6HjX4kVjhQH9pDYGaXjOUEaOXYTlUYiNfks1XUeNPBQ8HAOWIik
	acAMuCLxG3NF/leOFG7zPV1t0NoGyqrHtFpYqpcOirXN1h8bhcPcX4QJ2alMOrQnJVWq
	bdxg==
X-Gm-Message-State: AD7BkJLs5zxJW2SaQ8hCGbSae1pLWdc0k02tkns+VP62RE3h5qhvj/ja8QYVISd35M876GaAr3aAujMXlW6BcG6n
X-Received: by 10.31.52.147 with SMTP id b141mr496925vka.82.1456482156467;
	Fri, 26 Feb 2016 02:22:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Fri, 26 Feb 2016 02:22:17 -0800 (PST)
In-Reply-To: <20160226080631.GB9352@cbox>
References: <1456402182-11651-1-git-send-email-peter.maydell@linaro.org>
	<CAFEAcA9d6u=2GLo5UEXGPzb=9bZNnk-CgEOt=235giCdPTW_pw@mail.gmail.com>
	<20160226080631.GB9352@cbox>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Feb 2016 10:22:17 +0000
Message-ID: <CAFEAcA940YM=cbKTtEqO0yym9=WpXvVjPZMFCY0S4CWOVB1E0A@mail.gmail.com>
To: Christoffer Dall <christoffer.dall@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::234
Cc: Marc Zyngier <marc.zyngier@arm.com>, qemu-arm <qemu-arm@nongnu.org>,
	"kvmarm@lists.cs.columbia.edu" <kvmarm@lists.cs.columbia.edu>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] virt: Lift the maximum RAM
 limit from 30GB to 255GB
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
X-TUID: JArIMpnG9GSz

On 26 February 2016 at 08:06, Christoffer Dall
<christoffer.dall@linaro.org> wrote:
> On Thu, Feb 25, 2016 at 04:51:51PM +0000, Peter Maydell wrote:
>> [Typoed the kvmarm list address; sorry... -- PMM]
>>
>> On 25 February 2016 at 12:09, Peter Maydell <peter.maydell@linaro.org> wrote:
>> > The virt board restricts guests to only 30GB of RAM. This is a
>> > hangover from the vexpress-a15 board, and there's inherent reason
>
> did you mean "there's *no* inherent reason" ?

Yes :-)

>> > for it. 30GB is smaller than you might reasonably want to provision
>> > a VM for on a beefy server machine. Raise the limit to 255GB.

>> > CC'ing kvm-arm as a heads-up that my proposal here is to make
>> > the kernel devs do the heavy lifting for supporting >255GB.
>> > Discussion welcome on whether I have the tradeoffs here right.
>
> I think so, this looks good to me.

> Reviewed-by: Christoffer Dall <christoffer.dall@linaro.org>

Thanks.
-- PMM
