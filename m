Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp1972996wre;
        Thu, 24 May 2018 08:09:53 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLXkdpC8XuW5wKzmd3x2bFdPWFHgPWhyX0DlJy27n5zGXbXADgRQd6mKLceDzDV539Vud16
X-Received: by 2002:ac8:2b37:: with SMTP id 52-v6mr7386736qtu.97.1527174592940;
        Thu, 24 May 2018 08:09:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527174592; cv=none;
        d=google.com; s=arc-20160816;
        b=l4adPSMOFTydzDgJWQqANjK1b0kHXrCIYinhM0jImroThPTno4BFf3VN9aEi3P1bTQ
         KCrIsBp2EjWQ0DmupAyMjMIQ4+LnbNGA6ejuKhBNeCIS84JgLhaMuwbvqjNKT74KvSPr
         CfkDCpeCro+UJ1cRWQXKg7hNLfI2erVMXfc33og0rVicw96BJuI9vV8RFZqZ4sOl9llg
         3Z0YD8URbDAoqvB9maqu64i/ULEuF7R3yTXjFKKopLN1NLFc7uwAAn49igMPT+MAvFK3
         DrYoFO1LgQ9t/JE7Blu3m+Y2RMFai8DOhCqKnrsMeuhoNUWx/Z/hXUADwSxvU32NcToN
         FcFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=l57KKirP+8AjuPxYv9u7gPdWOS2zJjc5+FKN/8XE7VM=;
        b=SH12uY6H6gUSvl7rY5wGLUoCZ7pt71HjIUgrWxyiGEzyBA+4jgpeweRHbfaLxS0uEK
         RNdYR4b252EA97eZ8PcSHWBc28P791rBXGbH4UUkAK7PWn0WHUfj1n/gOPREN1cglAlw
         sw3mWR/yeaguNBmrVBD1xH1LIFz0FRjzXDhL47mH+13EE/eMeAI1MeOkA1NaUZdmM/er
         +NFZ1Fay++swzA6QCycVcVnLGMaLKbNHTEvDQ+65zpL03Mq/Gv7Ptn9jKJ5IgvlOuha3
         8oTOiyWwVLm1qHIQVHPQpSv7elBNkhL+sgIqTTCHENvvBhqTcMLxl559v4lN7m2ytN4X
         ZPSA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s63-v6si3754661qke.127.2018.05.24.08.09.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 24 May 2018 08:09:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39097 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fLrsG-0006U0-Bp
	for alex.bennee@linaro.org; Thu, 24 May 2018 11:09:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43211)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fLrs2-0006S2-1H
	for qemu-arm@nongnu.org; Thu, 24 May 2018 11:09:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fLrry-0004Tg-TM
	for qemu-arm@nongnu.org; Thu, 24 May 2018 11:09:38 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:58062 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fLrry-0004TC-OK; Thu, 24 May 2018 11:09:34 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 45389BB41D;
	Thu, 24 May 2018 15:09:34 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-69.ams2.redhat.com
	[10.36.116.69])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 77A312156601;
	Thu, 24 May 2018 15:09:33 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1527047633-12368-1-git-send-email-zhaoshenglong@huawei.com>
	<1527047633-12368-2-git-send-email-zhaoshenglong@huawei.com>
	<acca5b80-f527-bc39-0b63-147e53affb4b@redhat.com>
	<CAFEAcA-xbHtxora5TU9psYnBgP0+N8_nznhVppEkg7fmmwip3w@mail.gmail.com>
	<10801e6c-5028-add6-b082-22c5dc9758ca@redhat.com>
	<CAFEAcA-eW_1M42c+Fjt98AgVsnbwjwWap3JZFHNU9f8S0H_qww@mail.gmail.com>
	<38aee779-1baf-ab96-7489-0f34bda2f8e6@redhat.com>
	<CAFEAcA9oCppg2C32vd3YKKmvfO7n1KnFeXG14CV7UHcZpxcTqA@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <362b56e4-5e15-d01d-2aae-5efe1aaf661d@redhat.com>
Date: Thu, 24 May 2018 17:09:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9oCppg2C32vd3YKKmvfO7n1KnFeXG14CV7UHcZpxcTqA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Thu, 24 May 2018 15:09:34 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Thu, 24 May 2018 15:09:34 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH V3 2/2] arm_gicv3_kvm:
 kvm_dist_get/put: skip the registers banked by GICR
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
Cc: Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lNv2zTEeApG6

Hi Peter,

On 05/24/2018 04:56 PM, Peter Maydell wrote:
> On 24 May 2018 at 15:40, Auger Eric <eric.auger@redhat.com> wrote:
>> Hi Peter,
>>
>> On 05/24/2018 04:16 PM, Peter Maydell wrote:
>>> Only for KVM, not for TCG, and it's the other way round: we
>>> end up with two lots of PPI/SGI space in the data structure
>>> by mistake. Let me fish out the comment I made on the v2 of this
>>> series:
>>>
>>> In the code in master, we have QEMU data structures
>>> (bitmaps, etc) which have one entry for each of GICV3_MAXIRQ
>>> irqs. That includes the RAZ/WI unused space for the SPIs/PPIs, so
>>> for a 1-bit-per-irq bitmap:
>>>  [0x00000000, irq 32, irq 33, .... ]
>>>
>>> When we fill in the values from KVM into these data structures,
>>> we start after the unused space, because the for_each_dist_irq_reg()
>>> macro starts with _irq = GIC_INTERNAL. But we forgot to adjust
>>> the offset value we use for the KVM access, so we start by
>>> reading the RAZ/WI values from KVM, and the data structure
>>> contents end up with:
>>>  [0x00000000, 0x00000000, irq 32, irq 33, ... ]
>>> (and the last irqs wouldn't get transferred).
>> In kvm_dist_get_priority (new code), the offset is where we read and
>> field is where we write, correct? Offset was shifted so we effectively
>> read in KVM regs the num_irq-32 SPI states now but don't we start
>> writing at the beginning of bmp, (ie s->gicd_ipriority), at PPI/SGI
>> offset? What am I missing?
> 
> Oops, yes, you're right. My explanation applies to the
> various other bitmaps, where we are accessing the
> fields in the data structure using gic_bmp_ptr32(bmp, irq),
> but not to gicd_ipriority[], which we are directly accessing
> starting with the first word, not by indexing via bmp[irq].
> 
> So we need to handle these two cases differently.
> You're correct that for gicd_ipriority[], the code in
> master reads and writes to that data structure as:
>  [0, 0, ..., 0, irq 32, irq 33, ..., 0, 0, ... 0]
> so all the values are in the right place but we:
>  (a) unnecessarily read/write zeroes for the PPI/SGI fields
>  (b) fail to transfer the last 32 interrupts
> 
> We can fix the gicd_ipriority[] case simply by adding
>    bmp = GIC_INTERNAL;
> before the assignment to 'field' in both kvm_dist_get_priority()
> and kvm_dist_put_priority(). This doesn't affect migration
> compatibility. We should do this separately from fixing the
> other bitmaps, because it's simpler.

Agreed for the other bitmaps. I actually stumbled on
kvm_dist_get_priority and got stuck there ;-) So indeed the subsection
is needed.
> 
>> I don't understand you TCG remark above, sorry.
> 
> You can migrate a TCG VM as well as a KVM one. The
> TCG GICv3 doesn't use any of this code in hw/intc/arm_gicv3_kvm.c,
> so it doesn't have any of these bugs. So any fixups for the
> KVM bugs so we get migration correct in the
> "buggy VM" -> "not buggy VM" situation should not misidentify
> a TCG VM as "buggy".

Ah OK. Thank you for the clarification

Eric
> 
> PS: I have a feeling that kvm_dist_get/set_priority have
> an endianness problem -- the 'reg' we read from the kernel
> will be a 32-bit value with the priority byte for the
> lowest-numbered IRQ in its least significant byte, but if
> the host is big-endian we'll write that to the wrong offset
> in the gicd_priority[] array...
> 
> thanks
> -- PMM
> 
