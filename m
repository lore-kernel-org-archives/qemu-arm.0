Received: by 10.25.208.211 with SMTP id h202csp453124lfg;
        Thu, 17 Mar 2016 06:49:28 -0700 (PDT)
X-Received: by 10.55.201.81 with SMTP id q78mr14297308qki.98.1458222567347;
        Thu, 17 Mar 2016 06:49:27 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b7si7899411qhd.42.2016.03.17.06.49.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 17 Mar 2016 06:49:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:35027 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1agYIo-0004TE-Re
	for alex.bennee@linaro.org; Thu, 17 Mar 2016 09:49:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52447)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1agYG7-0007pV-Q4
	for qemu-devel@nongnu.org; Thu, 17 Mar 2016 09:46:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1agYG6-0007r6-GT
	for qemu-devel@nongnu.org; Thu, 17 Mar 2016 09:46:39 -0400
Received: from mail-vk0-x230.google.com ([2607:f8b0:400c:c05::230]:36666)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1agYG6-0007qs-Ch
	for qemu-devel@nongnu.org; Thu, 17 Mar 2016 09:46:38 -0400
Received: by mail-vk0-x230.google.com with SMTP id q138so10543256vkb.3
	for <qemu-devel@nongnu.org>; Thu, 17 Mar 2016 06:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=geMCHJam1DuolH4+/E8i1x0BxLz/KuhhNPQf/TqRjcU=;
	b=U5HlZiIggVr7jYeyxpd20/DaenLvwFJ0h6ovTcErQhJB1WTlSt/tF/TqeI87qcJhHz
	00Pbw9XyL4+nhJxBpLD7rzdgAvbqchqhgSPZmIpZF7LqMynDOy0DIqXNwDyD+3vn26dE
	hxbrtjLKORJycQrNnvA0VpbFhb6KsHqZIlqH8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=geMCHJam1DuolH4+/E8i1x0BxLz/KuhhNPQf/TqRjcU=;
	b=hN1Z2lnIrjdHerwE00puaEeGeLbZeIeLTjFFMnzSlfsCVhHOZa/fe/NBvBoo+jGqqV
	Op7OsUZbv1xanITbqZa81eEROSn/Q2nDR3m5e1eGu5mLvSwg5P+3RkMUKPda0VYv1lEn
	nte18GNXJkWIqGVE9VTF5El0J3q3YJ78snNsQoUuCo/mRKkVeUdqqdCPPaan5T1F5jx6
	dJ7UkH8d+2VkbGRGSVhLOUzJFhQBa8gWrQsv+e/dy0ECU7JPPeebfCCDYD94ZuP+eEs/
	aR1fJsuIdyesAj1VqCIych1ggqKKbo/YbB+xH8tkC5vzlcAxy9FRQqT9BeeyxS+8uyx0
	8W0A==
X-Gm-Message-State: AD7BkJK48TZdFcTQcSSvEZ7PW5GIMo7yFQpTy94009bk3vuF5vnX14legjlV+tQFhB94KMmxBIiBXCDWcnhAt/wZ
X-Received: by 10.31.180.85 with SMTP id d82mr10140520vkf.83.1458222397802;
	Thu, 17 Mar 2016 06:46:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Thu, 17 Mar 2016 06:46:18 -0700 (PDT)
In-Reply-To: <CAA8zJ3CYn+Pjp8RphPR7+L=CeOZ3nDfosjF6yPZeefSj1utBag@mail.gmail.com>
References: <1458210790-6621-1-git-send-email-peter.maydell@linaro.org>
	<CAA8zJ3CYn+Pjp8RphPR7+L=CeOZ3nDfosjF6yPZeefSj1utBag@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Mar 2016 13:46:18 +0000
Message-ID: <CAFEAcA_T_Bfiv_ESnM5wTVUeP8S2Pk-RLz6xpvPYACm1hj4E9A@mail.gmail.com>
To: Thomas Hanson <thomas.hanson@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::230
Cc: qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Antonio_Huete_Jim=C3=A9nez?= <tuxillo@quantumachine.net>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Patch Tracking <patches@linaro.org>
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH] hw/arm/bcm2836: Wire up CPU
	timer interrupts correctly
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ZFYaTMy/2ra7

On 17 March 2016 at 13:37, Thomas Hanson <thomas.hanson@linaro.org> wrote:
>
> On Mar 17, 2016 4:33 AM, "Peter Maydell" <peter.maydell@linaro.org> wrote:
>>
>> Wire up the CPU timer interrupts in the right order, with the
>> nonsecure physical timer on cntpnsirq, the hyp timer on cnthpirq,
>> and the secure physical timer on cntpsirq. (We did get the
>> virt timer right, at least.)

> What drives the order?

This is modelling the hardware:
https://www.raspberrypi.org/documentation/hardware/raspberrypi/bcm2836/README.md

The interrupt controller has 4 lines named CNTPSIRQ, CNTPNSIRQ, etc,
and we need to hook the lines from the CPU up to the interrupt
controller appropriately. The names we ended up with in QEMU's
CPU model (GTIMER_PHYS, etc) don't match the signal names that
a hardware A7 uses, which is slightly irritating, but not a big deal.

The A7 TRM lists which timer is which signal:
http://infocenter.arm.com/help/topic/com.arm.doc.ddi0464f/BABBABDJ.html
(though you can pretty much guess from the signal names).

thanks
-- PMM
