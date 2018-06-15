Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp999138wrq;
        Fri, 15 Jun 2018 08:44:02 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIYi3UIyfIZ0nRQS59Y6vcP/55j6CVY/Y4cNa0Yv3KDWoQ97cLH0Cnwo4azG7fkR51/IEAn
X-Received: by 2002:ac8:320d:: with SMTP id x13-v6mr1954536qta.246.1529077442206;
        Fri, 15 Jun 2018 08:44:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529077442; cv=none;
        d=google.com; s=arc-20160816;
        b=jRbGGCJlC/1QgbuijxC5OE8NcWKjaRPOJrLSeiyOO3WhPRZz9L98ks+XQSZWhJHkXE
         vFt5iydr9xfqsEMm8NKmoQYh8CFcefM2tKb2fnenlBQVM9JMxrUPT4oXsuNnHc7Si7Ho
         0Jg/hobKSJGaqDACih849b7GnS0A1oqYpR6E+q/S6+R74qGwdjyPH9bEW/26/1Qr9DgO
         SRV4lfoipn0hA7nDF5YKFXayrwsDGXw9qyAAPaM4Bbf1QNmWgCOK1GXmcvV1gzPV8QUE
         fhIpPpMLkogYsYe8kmg+KIck6icnJh9uaCPDYUZNOaP9YEf4lejGT9gumyb+R8Yfs7By
         4w4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=SoH6TdTHUFr9LzUwcVVYx3BlJvap88VWrTGU53yLDiI=;
        b=pRHT4WXTsuDXuyTYkqFvADy/L4rLtT4WybCnSsWm16GCYviNjbdLQmsICSMNQ0mj09
         zsA2+ZhOAh9y5GZbXl14tzhlTVtEfLXm5PKn7GpvRXA8oIHHik8ezptMOhrOKkBpDuzC
         SLc5dK1Mb6LS/ZhJwnELR4fTUjOcg5W8w3f5R8FsbfagWX2ZifX4DXjzzazmfeKtr5qE
         DD6pl7h7GIm8MWePLbkmH42qt3Bt5faqv6NqbsOEt7C/xynOFB+Y+Mw+RbnKxsngHMZG
         AAY1mBNbnJnEchkwPB5CyTJfum8RVpPmRw+0/CdeQD4EkrhLsYjS5NFPklcZmoKiQwdL
         vIvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f12-v6si5174632qtc.343.2018.06.15.08.44.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Jun 2018 08:44:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47659 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fTqtN-0002TW-LA
	for alex.bennee@linaro.org; Fri, 15 Jun 2018 11:44:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45274)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fTqGw-00028K-6v
	for qemu-arm@nongnu.org; Fri, 15 Jun 2018 11:04:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fTqGt-0007Nz-3H
	for qemu-arm@nongnu.org; Fri, 15 Jun 2018 11:04:18 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:57240 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fTqGs-0007Nk-TI; Fri, 15 Jun 2018 11:04:15 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 707C887A81;
	Fri, 15 Jun 2018 15:04:14 +0000 (UTC)
Received: from localhost.localdomain (ovpn-117-106.ams2.redhat.com
	[10.36.117.106])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A13C22026609;
	Fri, 15 Jun 2018 15:04:13 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1528554193-27270-1-git-send-email-eric.auger@redhat.com>
	<1528554193-27270-3-git-send-email-eric.auger@redhat.com>
	<CAFEAcA_R_68FDq-=1coazcTpc1MGqh2ZanccP8C=C9ZJ9_T_6Q@mail.gmail.com>
	<CAFEAcA8B2qu1g2yGn4HiWCBhX2Can+UyrL==QTdKvxL7_Wq2Xg@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <b3b74960-f3a6-4db9-946a-055e25534564@redhat.com>
Date: Fri, 15 Jun 2018 17:04:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8B2qu1g2yGn4HiWCBhX2Can+UyrL==QTdKvxL7_Wq2Xg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Fri, 15 Jun 2018 15:04:14 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Fri, 15 Jun 2018 15:04:14 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [PATCH 2/2] hw/arm/virt: Silence dtc /memory warning
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
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /T2LdFvzE68q

Hi Peter,

On 06/15/2018 03:16 PM, Peter Maydell wrote:
> On 15 June 2018 at 13:26, Peter Maydell <peter.maydell@linaro.org> wrote:
>> On 9 June 2018 at 15:23, Eric Auger <eric.auger@redhat.com> wrote:
>>> When running dtc on the guest /proc/device-tree we get the
>>> following warning: Warning (unit_address_vs_reg): Node /memory
>>> has a reg or ranges property, but no unit name".
>>>
>>> Let's fix that by adding the unit address to the node name. We also
>>> don't create the /memory node anymore in create_fdt(). We directly
>>> create it in load_dtb. /chosen still needs to be created in create_fdt
>>> as the uart needs it. In case the user provided his own dtb, either
>>> the bank is added to the existing /memory node or if this latter is
>>> not found we create a new separate memory node.
>>>
>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>> ---
>>>  hw/arm/boot.c | 20 ++++++++++++++------
>>>  hw/arm/virt.c |  6 ------
>>>  2 files changed, 14 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
>>> index 1e2be20..2054670 100644
>>> --- a/hw/arm/boot.c
>>> +++ b/hw/arm/boot.c
>>> @@ -593,24 +593,32 @@ static int load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
>>>              g_free(nodename);
>>>          }
>>>      } else {
>>
>> I think you need also to change the "if" half of this if..else,
>> which deals with NUMA, because it assumes a "/memory" node was
>> created by the virt.c code and now it will not be.
> 
> ...I think this breaks the tests/numa-test part of 'make check'.

correct!

Thanks

Eric
> 
> thanks
> -- PMM
> 
