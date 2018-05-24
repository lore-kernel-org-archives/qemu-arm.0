Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp1941676wre;
        Thu, 24 May 2018 07:41:42 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZqzRHGW6+jWg7NviShNS/NYgmtE3hyr1QefDYjKGlhCh1aayY6I/9J/+glxTbX2D0xKz5aD
X-Received: by 2002:ac8:2447:: with SMTP id d7-v6mr7463904qtd.50.1527172902881;
        Thu, 24 May 2018 07:41:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527172902; cv=none;
        d=google.com; s=arc-20160816;
        b=dnXv3Mq8DXhLiAdzRntWQmrJuCkhw4kevWKba496s3nlElqKboHwLigYksRr4VFp5d
         1oYs1sxg5sjFjhdtieJOPK3TrnRA9n3W23ttRzYEjQVeXoQB2lavwNJ2HNzFkUywyujt
         lEI3NJ0+8MTo2T8FnSlrouArTbEB7NnQuM2d6PcK8CCPnjsCy6oxTXXixWaIYD4PpWWn
         jWfVqtPSPeD+A0f32C3c+YFZR+5rXVnNTD7ekulyuzrDl2MT5aRDPRPK5QalhKSoKDHq
         O2I/iQfVjhEaW5Zqdy8HjrboMQFfFWWkwHqDteilyeC9Ep2twXnmBTP488KYiqCoFWcT
         aBfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=eSa0SHZj3Q67WjXoaElj7I7qTFZhFu6/lH8QJdAqjYw=;
        b=KcDMRETYd2ifHpg0RKgUQYVgnbIZu+j3O7NmgTgHHbuhI2KQeKsT/z9jQJQX1QtZCQ
         kRAGZ+711affnZPAZ139ZV6uh5SWnAw5SweNqEXN1H3AROFGUvYKnAfgJnoanKZwfy2e
         Xk5VthT7JT3/7wTLZOyrOlwAEQI9WKTyvjB74s+MqNjeGHlKqlJBsdW4xVLnjyXsfhTY
         m0O7n0JfZmeneTMi/Elwx/yOp9rnqlTQVTKMv0zGaS+NcBgdv8nLWZ+uESitddO1L6eo
         Cy139pOIYmG/4PQPfBVK8BS3eL2kO4LgxuJ3GzTzKlcT1rNhvk/0VzFDexJ2c0H7t/tj
         knkg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p19-v6si1160901qtk.330.2018.05.24.07.41.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 24 May 2018 07:41:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38981 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fLrQy-00011M-Gk
	for alex.bennee@linaro.org; Thu, 24 May 2018 10:41:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35840)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fLrQW-0000yc-4M
	for qemu-devel@nongnu.org; Thu, 24 May 2018 10:41:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fLrQS-00028N-15
	for qemu-devel@nongnu.org; Thu, 24 May 2018 10:41:12 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:52142 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fLrQL-000252-EU; Thu, 24 May 2018 10:41:01 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CC5C47C6A9;
	Thu, 24 May 2018 14:41:00 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-69.ams2.redhat.com
	[10.36.116.69])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ECBF72166BB2;
	Thu, 24 May 2018 14:40:59 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1527047633-12368-1-git-send-email-zhaoshenglong@huawei.com>
	<1527047633-12368-2-git-send-email-zhaoshenglong@huawei.com>
	<acca5b80-f527-bc39-0b63-147e53affb4b@redhat.com>
	<CAFEAcA-xbHtxora5TU9psYnBgP0+N8_nznhVppEkg7fmmwip3w@mail.gmail.com>
	<10801e6c-5028-add6-b082-22c5dc9758ca@redhat.com>
	<CAFEAcA-eW_1M42c+Fjt98AgVsnbwjwWap3JZFHNU9f8S0H_qww@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <38aee779-1baf-ab96-7489-0f34bda2f8e6@redhat.com>
Date: Thu, 24 May 2018 16:40:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-eW_1M42c+Fjt98AgVsnbwjwWap3JZFHNU9f8S0H_qww@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Thu, 24 May 2018 14:41:00 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Thu, 24 May 2018 14:41:00 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-devel] [PATCH V3 2/2] arm_gicv3_kvm: kvm_dist_get/put:
 skip the registers banked by GICR
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gt3CN9ZY2M9R

Hi Peter,

On 05/24/2018 04:16 PM, Peter Maydell wrote:
> On 24 May 2018 at 14:59, Auger Eric <eric.auger@redhat.com> wrote:
>> Hi,
>>
>> On 05/24/2018 03:14 PM, Peter Maydell wrote:
>>> On 24 May 2018 at 10:04, Auger Eric <eric.auger@redhat.com> wrote:
>>>> Now I am unclear about the semantics of the s->gicd_ipriority & friends.
>>>> With that change, is it supposed to contain only the states of SPIs or
>>>> contain the RAZ states of PPI/SGIs + states of SPIs. The array is
>>>> dimensionned to contain states for PPI/SGI+SPIs, right? In other words,
>>>> shouldn't we also shift field?
>>>
>>> The semantics of the gicd_ipriority and other data structures are
>>> set by the TCG GIC implementation, and include blank space at
>>> the start where the PPI/SGI bits would live. See this comment
>>> from arm_gicv3_common.h:
>>>
>>>  * Each bitmap contains a bit for each interrupt. Although there is
>>>  * space for the PPIs and SGIs, those bits (the first 32) are never
>>>  * used as that state lives in the redistributor. The unused bits are
>>>  * provided purely so that interrupt X's state is always in bit X; this
>>>  * avoids bugs where we forget to subtract GIC_INTERNAL from an
>>>  * interrupt number.
>>
>> If I understand Shannon's code correctly, the space for PPIs/SGIs is
>> currently overwritten by SPI state, hence my comment.
> 
> Only for KVM, not for TCG, and it's the other way round: we
> end up with two lots of PPI/SGI space in the data structure
> by mistake. Let me fish out the comment I made on the v2 of this
> series:
> 
> In the code in master, we have QEMU data structures
> (bitmaps, etc) which have one entry for each of GICV3_MAXIRQ
> irqs. That includes the RAZ/WI unused space for the SPIs/PPIs, so
> for a 1-bit-per-irq bitmap:
>  [0x00000000, irq 32, irq 33, .... ]
> 
> When we fill in the values from KVM into these data structures,
> we start after the unused space, because the for_each_dist_irq_reg()
> macro starts with _irq = GIC_INTERNAL. But we forgot to adjust
> the offset value we use for the KVM access, so we start by
> reading the RAZ/WI values from KVM, and the data structure
> contents end up with:
>  [0x00000000, 0x00000000, irq 32, irq 33, ... ]
> (and the last irqs wouldn't get transferred).
In kvm_dist_get_priority (new code), the offset is where we read and
field is where we write, correct? Offset was shifted so we effectively
read in KVM regs the num_irq-32 SPI states now but don't we start
writing at the beginning of bmp, (ie s->gicd_ipriority), at PPI/SGI
offset? What am I missing?

I don't understand you TCG remark above, sorry.

Thanks

Eric
> 
> With this change to the code we will get the offset right and
> the data structure will be filled as
>  [0x00000000, irq 32, irq 33, .... ]
> For TCG, where we never had this bug, this is how the data
> structure has always looked.
> 
> But for migration from the old version, the data structure
> we receive from the migration source will contain the old
> broken layout of
>  [0x00000000, 0x00000000, irq 32, irq 33, ... ]
> 
> So we need in inbound migration to identify when we need
> to fix this up (by copying the data down to get rid of that
> extra 0x00000000), which is "when KVM is enabled and the source
> is not a version new enough to have fixed this bug".
> 
>> If we stick to the
>> current semantics, can't we just add the last missing 32 SPI states and
>> we don't need the subsection?
> 
> You need a subsection, because that's how you get migration
> compatibility.
> 
> thanks
> -- PMM
> 
