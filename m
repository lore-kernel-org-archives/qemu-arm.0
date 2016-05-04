Received: by 10.25.208.137 with SMTP id h131csp196740lfg;
        Wed, 4 May 2016 07:32:28 -0700 (PDT)
X-Received: by 10.28.184.78 with SMTP id i75mr9989934wmf.36.1462372348291;
        Wed, 04 May 2016 07:32:28 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m10si5482228wmg.50.2016.05.04.07.32.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 04 May 2016 07:32:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48289 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1axxqV-0003ni-4C
	for alex.bennee@linaro.org; Wed, 04 May 2016 10:32:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58455)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <michael@walle.cc>) id 1axxqM-0003X0-2X
	for qemu-arm@nongnu.org; Wed, 04 May 2016 10:32:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <michael@walle.cc>) id 1axxqA-0002RP-Go
	for qemu-arm@nongnu.org; Wed, 04 May 2016 10:31:56 -0400
Received: from ssl.serverraum.org ([213.133.101.245]:51595)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <michael@walle.cc>)
	id 1axxqA-0002JQ-Be; Wed, 04 May 2016 10:31:50 -0400
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
	(using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
	(No client certificate requested)
	by ssl.serverraum.org (Postfix) with ESMTPSA id 08A3A223AB;
	Wed,  4 May 2016 16:31:35 +0200 (CEST)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 04 May 2016 16:31:34 +0200
From: michael@walle.cc
To: Peter Maydell <peter.maydell@linaro.org>
In-Reply-To: <CAFEAcA8ohPD0pwkZYfE8RmDjpu15vUeYNo+wn4PFo2f4ZEq3Rg@mail.gmail.com>
References: <1458815374-22279-1-git-send-email-zxq_yx_007@163.com>
	<CAFEAcA8ohPD0pwkZYfE8RmDjpu15vUeYNo+wn4PFo2f4ZEq3Rg@mail.gmail.com>
Message-ID: <3c5b37394680b8b4940236d7bc313be2@walle.cc>
X-Sender: michael@walle.cc
User-Agent: Roundcube Webmail/1.1.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 213.133.101.245
Subject: Re: [Qemu-arm] [PATCH 0/5] QOM'ify hw/display devices
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
Cc: xiaoqiang zhao <zxq_yx_007@163.com>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	hirofumi@mail.parknet.co.jp
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CHEjJueH9FXD

Am 2016-05-04 16:26, schrieb Peter Maydell:
> On 24 March 2016 at 10:29, xiaoqiang zhao <zxq_yx_007@163.com> wrote:
>> This patch set trys to QOM'ify hw/display files, see commit messages
>> for more details
>> 
>> xiaoqiang zhao (5):
>>   hw/display: QOM'ify exynos4210_fimd.c
>>   hw/display: QOM'ify jazz_led.c
>>   hw/display: QOM'ify milkymist-tmu2.c
>>   hw/display: QOM'ify milkymist-vgafb.c
>>   hw/display: QOM'ify pl110.c
> 
> Hi; I was going to review this series (apologies for taking so
> long!)
> but looking at my email archive and the patchwork server
> the patches in it seem a bit confused. I see seven patches, not five,
> with rather odd patch number indications:
>  1/5
>  2/5
>  3/6
>  4/5
>  5/6
>  5/5
>  6/6
> 
> (and 5/5 and 6/6 seem to be the same). Could you resend the
> series with the correct patches in it, please?


Oh my. I wanted to test the milkymist stuff last week, but didn't find 
time to complete it. I'll try it this week(end).

If 5/5 and 6/6 is the milkymist-vgafb.c, then I noticed the duplication, 
too.

-michael

