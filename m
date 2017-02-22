Received: by 10.25.0.147 with SMTP id 141csp937324lfa;
        Wed, 22 Feb 2017 04:10:38 -0800 (PST)
X-Received: by 10.55.67.77 with SMTP id q74mr21772931qka.127.1487765437987;
        Wed, 22 Feb 2017 04:10:37 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b3si737499qkh.14.2017.02.22.04.10.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 22 Feb 2017 04:10:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51786 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cgVkh-0004VJ-AB
	for alex.bennee@linaro.org; Wed, 22 Feb 2017 07:10:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34610)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marc.zyngier@arm.com>) id 1cgVke-0004V2-30
	for qemu-arm@nongnu.org; Wed, 22 Feb 2017 07:10:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marc.zyngier@arm.com>) id 1cgVka-0002Rs-Tw
	for qemu-arm@nongnu.org; Wed, 22 Feb 2017 07:10:32 -0500
Received: from foss.arm.com ([217.140.101.70]:51106)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marc.zyngier@arm.com>)
	id 1cgVka-0002RM-Nv; Wed, 22 Feb 2017 07:10:28 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4F8C628;
	Wed, 22 Feb 2017 04:10:26 -0800 (PST)
Received: from [10.1.207.16] (usa-sjc-imap-foss1.foss.arm.com [10.72.51.249])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id
	04BD93F220; Wed, 22 Feb 2017 04:10:24 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>,
	Vijay Kilari <vijay.kilari@gmail.com>
References: <1487313115-9510-1-git-send-email-vijay.kilari@gmail.com>
	<1487313115-9510-3-git-send-email-vijay.kilari@gmail.com>
	<CAFEAcA8618+LGejFq6SpBEwGrNpfamBBX3MFWjss-ZxJ7Xk8mg@mail.gmail.com>
	<CALicx6tqxXZxBTxYvF55ydBg5CB1to3MsEkhaohucx4EAZcEJA@mail.gmail.com>
	<CAFEAcA_NbQNzrUUCAS2e5Xso0rg6H3+nzDjTc9i8Tc+GLpXvLw@mail.gmail.com>
	<CALicx6uiFYXsOMaiCH9HYW_jxbMSg+QSCrbVr0D-UKWwtf+TwA@mail.gmail.com>
	<CAFEAcA8sTEtJGpvrL3qCQ7OfUaQ5Ym0siQfGMnTpaUQw+Uzh_A@mail.gmail.com>
From: Marc Zyngier <marc.zyngier@arm.com>
Organization: ARM Ltd
Message-ID: <62ac5c71-9a6f-44f4-3a39-34644691e477@arm.com>
Date: Wed, 22 Feb 2017 12:10:23 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8sTEtJGpvrL3qCQ7OfUaQ5Ym0siQfGMnTpaUQw+Uzh_A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 217.140.101.70
Subject: Re: [Qemu-arm] [PATCH v8 2/5] hw/intc/arm_gicv3_kvm: Add
 ICC_SRE_EL1 register to vmstate
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
Cc: Pavel Fedin <p.fedin@samsung.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Vijaya Kumar K <Vijaya.Kumar@cavium.com>,
	Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: G3yPzpdJkZHR

On 22/02/17 12:05, Peter Maydell wrote:
> On 22 February 2017 at 11:56, Vijay Kilari <vijay.kilari@gmail.com> wrote:
>> On Mon, Feb 20, 2017 at 3:21 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
>>> My expectation was that the KVM GICv3 emulation would
>>> make these bits RAO/WI like the TCG implementation.
>>> Is there maybe a bug in the kernel side where it
>>> doesn't implement bypass but has made these bits be
>>> RAZ/WI rather than RAO/WI ?
>>
>> Do you have any inputs on this?
> 
> I talked to Marc Z who agreed this is a KVM bug -- the kernel
> should have these bits be RAO/WI like TCG. I think Marc
> was going to write a patch...

I'll post that in a minute.

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
