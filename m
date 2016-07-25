Received: by 10.25.21.156 with SMTP id 28csp1264421lfv;
        Mon, 25 Jul 2016 09:35:08 -0700 (PDT)
X-Received: by 10.200.54.185 with SMTP id a54mr31627735qtc.63.1469464508501;
        Mon, 25 Jul 2016 09:35:08 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q26si18407564qtb.67.2016.07.25.09.35.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Jul 2016 09:35:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33477 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bRiqR-0000B1-V1
	for alex.bennee@linaro.org; Mon, 25 Jul 2016 12:35:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51368)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1bRiqM-0000Aj-Rr
	for qemu-arm@nongnu.org; Mon, 25 Jul 2016 12:35:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1bRiqM-0005oW-1r
	for qemu-arm@nongnu.org; Mon, 25 Jul 2016 12:35:02 -0400
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:36599)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>)
	id 1bRiqL-0005oA-Ty; Mon, 25 Jul 2016 12:35:01 -0400
Received: by mail-oi0-x241.google.com with SMTP id d204so17132330oig.3;
	Mon, 25 Jul 2016 09:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=sBspZ0PvyWv9yl7p9j7JRwepouaTP3FSkul0Id7TEZs=;
	b=0c2Pe/gjg3YYIvLIJVlZSpDvd18mY05ZDQRxv4J5lkn/jIR5bRerB3SYHVwxiKVvV8
	pS9KrujF2vZ4Wh1/8kNCQG39RZttFcktQolFgbVWjjqQt38kZaG122KKpl3xsdoVxh8v
	fEUM7KwhQNk6ZvQizQ13t5h5PvqmVAFIIXs6zDz/MwbkhuPmiTSWWLohyTIGKs8ZyCGr
	kYc3jM5h7KNjtPi33i/37o7QrxYn/lYMLt30R1Oo9RtqAe1z1ULtU0t8+p1K/1nfkHmg
	iT0e8r8t+kjru7OVgG0WB+EfiEP86RZwIklNE9okntKCNM4ze9ekfDsajy8gMy2O55lq
	RJ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=sBspZ0PvyWv9yl7p9j7JRwepouaTP3FSkul0Id7TEZs=;
	b=T2cr/ohBoN45EUFntqQcVpzife+rhDEn64VkgaNdynP1DHt2b9nhHKoOyT4tHlnQ+G
	oP62xZjsq/DBTbLN37LTA5ppyyNpppTZXyKqbTuSmr56H4NDqbobDw4BXNIXd6cXcBEN
	cBwcefC8meCpdFha9IpquzmTjjkpnYoypG0EPPErkIqGBrnJ3uPHe+RM9PLNBm4hLucj
	kq7Yj9e+aODr8vWVhFHZAEWA783Z+jxiJtyCrqNscYR+q+6wNNjuR4+8QZOKCa/ce84m
	oEdKHeUKLCQlCbYmw1WJvXMPq3y1wzQfPvyH4AnTrg8LvTOKpj6DYI2CpxVj8wKcuZwE
	TNPw==
X-Gm-Message-State: AEkoouvITWcEZTfQjYpDIHE72ocvAHkOVfWPqiY6rQAgjwZ9aYAIZgNYJs5hHJcnw54OadHh+1pD/9MGrrk8qw==
X-Received: by 10.202.206.66 with SMTP id e63mr8928082oig.136.1469464501116;
	Mon, 25 Jul 2016 09:35:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.14.72 with HTTP; Mon, 25 Jul 2016 09:34:31 -0700 (PDT)
In-Reply-To: <CAFEAcA_H3xc_MCQSLANHYjWtUPMj+wMRtCMY3eTEfGWcnYDO1g@mail.gmail.com>
References: <cover.1468279072.git.alistair.francis@xilinx.com>
	<8bf7719a88e0b2fcb12fd230b00df01f1b70f192.1468279072.git.alistair.francis@xilinx.com>
	<CAFEAcA_H3xc_MCQSLANHYjWtUPMj+wMRtCMY3eTEfGWcnYDO1g@mail.gmail.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Mon, 25 Jul 2016 09:34:31 -0700
X-Google-Sender-Auth: 63Vw_dRUoHh8WsL74LKPO-bO3RQ
Message-ID: <CAKmqyKOvv2y2LYHYsSPKTDSCZM-jP-ytNT0k6P4SxQcBCBSYBw@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v1 4/5] cadence_gem: Correct
 indentation
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
Cc: Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 93GhpQ3+ACJX

On Mon, Jul 25, 2016 at 8:48 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 12 July 2016 at 00:20, Alistair Francis <alistair.francis@xilinx.com> wrote:
>> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
>> ---
>>
>>  hw/net/cadence_gem.c | 182 +++++++++++++++++++++++++--------------------------
>>  1 file changed, 91 insertions(+), 91 deletions(-)
>
> I assume this patch comes out empty if you use 'git show -w';
> would be nice to say so specifically in the commit message if true.

It is empty, I'll update the commit message.

Thanks,

Alistair

>
> thanks
> -- PMM
>
