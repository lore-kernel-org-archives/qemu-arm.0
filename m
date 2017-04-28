Received: by 10.25.0.144 with SMTP id 138csp1021245lfa;
        Thu, 27 Apr 2017 17:10:42 -0700 (PDT)
X-Received: by 10.55.64.65 with SMTP id n62mr4457432qka.283.1493338242230;
        Thu, 27 Apr 2017 17:10:42 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m30si4437398qtg.155.2017.04.27.17.10.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 27 Apr 2017 17:10:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34694 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d3tUf-0006TW-Mp
	for alex.bennee@linaro.org; Thu, 27 Apr 2017 20:10:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42707)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1d3tUc-0006TR-NG
	for qemu-arm@nongnu.org; Thu, 27 Apr 2017 20:10:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1d3tUZ-0002Bk-4x
	for qemu-arm@nongnu.org; Thu, 27 Apr 2017 20:10:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37494)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <wei@redhat.com>)
	id 1d3tUY-00027I-SO; Thu, 27 Apr 2017 20:10:35 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CAE274E4F5;
	Fri, 28 Apr 2017 00:10:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com CAE274E4F5
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=wei@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com CAE274E4F5
Received: from [10.10.123.28] (ovpn-123-28.rdu2.redhat.com [10.10.123.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2573D8630D;
	Fri, 28 Apr 2017 00:10:31 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1493314727-6951-1-git-send-email-wei@redhat.com>
	<CAFEAcA-KKvhspYza=8TNNuFtqzco=ChhtS6Aa5hnn8=Cb036-Q@mail.gmail.com>
From: Wei Huang <wei@redhat.com>
Message-ID: <4dbaaea9-7576-9acf-5327-b22db6f00ed2@redhat.com>
Date: Thu, 27 Apr 2017 19:10:30 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-KKvhspYza=8TNNuFtqzco=ChhtS6Aa5hnn8=Cb036-Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Fri, 28 Apr 2017 00:10:33 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 0/2] Fix compilation dependency
 issues of CONFIG_ARM_V7M
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7iV77BKjNxfs



On 04/27/2017 04:13 PM, Peter Maydell wrote:
> On 27 April 2017 at 18:38, Wei Huang <wei@redhat.com> wrote:
>> CONFIG_ARM_V7M is used to control the compilation of NVIC and SysTick
>> Timer in QEMU. These two devices are not available when CONFIG_ARM_V7M
>> is un-defined. This can cause problems with ARMv7M code as it is tightly
>> integrated with NVIC for processing IRQ and exception.
>>
>> This patchset addresses the problem by introducing stub functions when
>> CONFIG_ARM_V7M is not defined. It also makes the compilation of several
>> existing v7M-profile SoCs depedent on CONFIG_ARM_V7M.
> 
> Can you explain in what situation this causes a problem?
> It's not clear to me what you're trying to fix...

In our downstream code, we try to minimize the number of supported
devices to reduce the maintenance effort. ARM v7M is not in the
supported list.

For most unsupported devices, we can remove them by configuring
default-configs file, except for CONFIG_ARM_V7M=y. This is because the
ARMv7m code in target/arm/helper.c intertwines with NVIC code. As a
result we have to keep NVIC and SysTick in order to compile helper.c,
which is not desirable.

This patchset tries to address the problem by making NVIC and SysTick
removable.

PS: There is a compilation issue under user mode. I will send out
another version to address it (by adding #ifndef CONFIG_USER_ONLY in
stub code).

> 
> thanks
> -- PMM
> 
