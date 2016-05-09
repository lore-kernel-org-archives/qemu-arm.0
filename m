Received: by 10.25.208.137 with SMTP id h131csp1669659lfg;
        Mon, 9 May 2016 09:58:41 -0700 (PDT)
X-Received: by 10.140.230.20 with SMTP id a20mr38728299qhc.68.1462813121459;
        Mon, 09 May 2016 09:58:41 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x189si19246099qhb.21.2016.05.09.09.58.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 May 2016 09:58:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42313 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1azoW0-0007wu-Vu
	for alex.bennee@linaro.org; Mon, 09 May 2016 12:58:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53064)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1azoVx-0007pe-7i
	for qemu-arm@nongnu.org; Mon, 09 May 2016 12:58:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1azoVv-0001Gg-5J
	for qemu-arm@nongnu.org; Mon, 09 May 2016 12:58:36 -0400
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:35606)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>)
	id 1azoVv-0001Gc-0Q; Mon, 09 May 2016 12:58:35 -0400
Received: by mail-oi0-x241.google.com with SMTP id w198so27537892oiw.2;
	Mon, 09 May 2016 09:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=z4Y9A2Jf9F6GociQw8N8SuIsXmOo5r/D8PpOKXGIwk8=;
	b=j3y0QrMJ7PkiRI+kupEJE3xTK0IQNS/9A/eg1fUH+0A/+AZNk6bSfQTAC5jPorbqiH
	aFyjlYZDTYoq0uRHlO/pxgDXOm/qRHvSOWJjP/jg4yFeSj2tUWWwElWOwLmNIFqz5tku
	Hyw7QZ1VY6mVDIf/vSnKDnPEt2kZmibHHhZ8XN4EDPYr/aFzDtz0AXZ1UziRtcStiC3F
	SPZY3bl76uXlCHWSfeNnodFE7cunL7Q8o19Stzzx+piMjN7L64rUw+JDv11zbgDZj/xQ
	+iAwyVHQvShKCLIXdYtXl6vtO0toAoWag2c6WFFZhYFy9w2VbOUv42p/rQ/Y9qtOIbyn
	1YIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=z4Y9A2Jf9F6GociQw8N8SuIsXmOo5r/D8PpOKXGIwk8=;
	b=ck+B4hWiJs/mdZL0TAxCUoSpKk9gm4o1moZHVCIpoOGJ667T0uhU7ABZPo5wZABmRc
	/8NCtcg2blRJUWph+eGbmWd8IjYgktR1ean8wh9a0c8fsmVhFvGcjwey5IPJHyjNwnqN
	C8g6MqA9hSsPxnRutysq32Mm2BZwcom3mFdI+qoGdH/2YLQt+uQBTxHhacP1WGMOzoba
	E5YQh+fWL4gbfV35DhUbMzKDVOx57XzlDPj57smmD+zG90wi8IHZDOdDUANjZJ/aY+Mv
	oiBxGbKgINYyGPxIkf3JYXCvWCYy/LVCZBUrpoJGXAHYiXpK+JFLZ1c56w9550QWyV4R
	9DUA==
X-Gm-Message-State: AOPr4FVMhWSBumil9zrufUs/dhM1FiQOdYFCZqIlW11k8K9I+ok2jXchGCXywf6cb3OJ0KXSgA41UThsC64Eag==
X-Received: by 10.157.8.149 with SMTP id 21mr610227otf.109.1462813114023; Mon,
	09 May 2016 09:58:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.142.193 with HTTP; Mon, 9 May 2016 09:58:04 -0700 (PDT)
In-Reply-To: <20160507015121.GF16305@toto>
References: <cover.1462557987.git.alistair.francis@xilinx.com>
	<6459df5e54365d5dbe8a1b047a85ec65c67e9232.1462557987.git.alistair.francis@xilinx.com>
	<CAFEAcA-G1jfUuK5JDFDnrFG5tKOt_VPnLBj7CD4WGkhrx_zp8w@mail.gmail.com>
	<20160507015121.GF16305@toto>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Mon, 9 May 2016 09:58:04 -0700
X-Google-Sender-Auth: bC1apaCSvxApNJvvdkrMIcphUZ0
Message-ID: <CAKmqyKMNbNoph2s1F4ZnC_Dqc-t_=bRtm5+oAHXnvdF09KHVeg@mail.gmail.com>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v1 2/2] target-arm: Enable EL2
 for the A53s and A57s
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
Cc: Edgar Iglesias <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2hCmPHXvn/S2

On Fri, May 6, 2016 at 6:51 PM, Edgar E. Iglesias
<edgar.iglesias@gmail.com> wrote:
> On Fri, May 06, 2016 at 11:25:52PM +0100, Peter Maydell wrote:
>> On 6 May 2016 at 19:11, Alistair Francis <alistair.francis@xilinx.com> wrote:
>> > Enable EL2 by default for the A53s and A57s.
>> >
>> > Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
>>
>> I don't really want to do this until we actually have
>> something approaching a workable EL2 implementation
>> (ideally including support in the GIC, since EL2's
>> not much good without it). I'd hope that software ought
>> to be able to work with an "EL3, but no EL2" CPU, since
>> that's a valid combination, unless it's very strongly
>> tied to a particular h/w implementation.
>
> Yes, I agree, we've got a few more things to take care of.

I haven't been keeping up with the EL2 status on mainline, so if you
guys don't want to enable it yet that's fine with me. Just thought I'd
try.

I assume you don't have any fundamental problems with the first patch
then, so hopefully at least that can get in.

I might have to look at disabling EL3 support for the ZynqMP machine
form the command line, as I can't boot Linux with EL3 but not EL2.

Thanks,

Alistair

>
> Cheers,
> Edgar
>
