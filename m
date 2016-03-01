Received: by 10.25.208.211 with SMTP id h202csp1833847lfg;
        Tue, 1 Mar 2016 13:10:39 -0800 (PST)
X-Received: by 10.140.92.175 with SMTP id b44mr4535437qge.88.1456866639509;
        Tue, 01 Mar 2016 13:10:39 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i109si32760734qgf.26.2016.03.01.13.10.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 01 Mar 2016 13:10:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:52282 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aarZ0-0007e9-Uh
	for alex.bennee@linaro.org; Tue, 01 Mar 2016 16:10:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57335)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aarYx-0007di-Mp
	for qemu-arm@nongnu.org; Tue, 01 Mar 2016 16:10:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aarYw-0001U4-Rz
	for qemu-arm@nongnu.org; Tue, 01 Mar 2016 16:10:35 -0500
Received: from mail-vk0-x229.google.com ([2607:f8b0:400c:c05::229]:33009)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aarYw-0001Tw-G9
	for qemu-arm@nongnu.org; Tue, 01 Mar 2016 16:10:34 -0500
Received: by mail-vk0-x229.google.com with SMTP id k196so182621595vka.0
	for <qemu-arm@nongnu.org>; Tue, 01 Mar 2016 13:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=bbNOAw1Ys/hEFZPjoccWUKjnT/nOgh+9wZOCmrfq2kw=;
	b=XXvBRA7SciBZAbG/nPyB2uL4ZkYc+yK6yY1NTtOLe3dBSVLHknZHZ3PugZ9UyrqbZh
	6JiX/o+1US2Ktd0YTaa0G1OqIeeSlTa2So0xNFYdCL1LiXgJ+RRTd/dlDgZfNrgvVMYL
	MDOtSAGwmZMV2uY2j1WUhRHevUbwGPasYGw0Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=bbNOAw1Ys/hEFZPjoccWUKjnT/nOgh+9wZOCmrfq2kw=;
	b=BbHYan9sThHRnu05BmSjTNGx+vIpdJh77jjh+3masP/bP+8xozmW5IjBFTxWqdq5jF
	jjVngE/ndv9f+FXxO62DxGvwn4UQqo/yzYS1A5GRXe3x7TZvl+gwBOrHOY5OIgpaeOWH
	a7XAVR4aIkj9G+8S+QOdbnGH3JTJdoDBP/qTBbgbAXH/jzTolkhuaM3yMFH4JwclsX3z
	ncb/OkqlRh6cC1dc2bf8DgjlqZw41wBKiSD62r7+C3yb2tjKLTOwjn2qVGaP+opV31pN
	XkwhHg9bxpZYH7EERUekgPbEMXXOaVPZ49vGsWnAYqq8OG1P42oSC9915ORSSyIixYY6
	D+Cw==
X-Gm-Message-State: AD7BkJLsNWimhGZTaIfQXYCaktTB+H4Gd9xDitWg0gt+eGOqKFYvtKD1A5DdsS+om8134nGyBS/5sByc54k+ttai
X-Received: by 10.31.194.130 with SMTP id s124mr16755159vkf.92.1456866634056; 
	Tue, 01 Mar 2016 13:10:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Tue, 1 Mar 2016 13:10:14 -0800 (PST)
In-Reply-To: <56D5F451.3000304@gmail.com>
References: <1456854176-7813-1-git-send-email-peter.maydell@linaro.org>
	<56D5F451.3000304@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Mar 2016 21:10:14 +0000
Message-ID: <CAFEAcA89JGiEhD+u+-Q_a0zvK6wFODw7qBdHmrQ8ayMg_ffgGw@mail.gmail.com>
To: Sergey Fedorov <serge.fdrv@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::229
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2] hw/intc/arm_gic.c: Implement
	GICv2 GICC_DIR
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
X-TUID: iEA4+AK9WkzE

On 1 March 2016 at 19:58, Sergey Fedorov <serge.fdrv@gmail.com> wrote:
> On 01.03.2016 20:42, Peter Maydell wrote:
>>
>> The GICv2 introduces a new CPU interface register GICC_DIR, which
>> allows an OS to split the "priority drop" and "deactivate interrupt"
>> parts of interrupt completion. Implement this register.
>> (Note that the register is at offset 0x1000 in the CPU interface,
>> which means it is on a different 4K page from all the other registers.)
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

>> +static void gic_deactivate_irq(GICState *s, int cpu, int irq, MemTxAttrs
>> attrs)
>> +{
>> +    int cm = 1 << cpu;
>> +    int group = gic_has_groups(s) && GIC_TEST_GROUP(irq, cm);
>
>
> Looks like we don't have to check for gic_has_groups() here, because there
> is no way to set the interrupt group to 1, if gic_has_groups() is not true.

True, but we don't generally seem to rely on it -- this is just
the same line that was already present in gic_complete_irq().

> Anyway,
>
> Reviewed-by: Sergey Fedorov <serge.fdrv@gmail.com>

Thanks.

-- PMM
