Received: by 10.25.21.156 with SMTP id 28csp42571lfv;
        Tue, 2 Aug 2016 01:00:16 -0700 (PDT)
X-Received: by 10.200.40.99 with SMTP id 32mr95657804qtr.97.1470124816609;
        Tue, 02 Aug 2016 01:00:16 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g60si904786qtd.118.2016.08.02.01.00.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 02 Aug 2016 01:00:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54518 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bUUca-0007JM-0o
	for alex.bennee@linaro.org; Tue, 02 Aug 2016 04:00:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54113)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bUUcU-0007GD-IM
	for qemu-arm@nongnu.org; Tue, 02 Aug 2016 04:00:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bUUcT-0004Dp-9w
	for qemu-arm@nongnu.org; Tue, 02 Aug 2016 04:00:10 -0400
Received: from mail-vk0-x234.google.com ([2607:f8b0:400c:c05::234]:34492)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bUUcS-0004CB-34
	for qemu-arm@nongnu.org; Tue, 02 Aug 2016 04:00:09 -0400
Received: by mail-vk0-x234.google.com with SMTP id s189so116821601vkh.1
	for <qemu-arm@nongnu.org>; Tue, 02 Aug 2016 01:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Ycg+HFoyVx51X4S8+BiZYKglYHAMAns2d+FOeBMd22g=;
	b=JVRC0JzHxy0Na3M5V0E0wqxWLiontEy8qqENWti1fQGHhr/Kd95Q/pRqaO1bGX14xM
	NdkBM0cX+7r1TjVVq9IiOuQiZpiXhyuviBTG938Hol4E92ZS594uUhs/v1qKVmLW11Fd
	NgPoNqU86vVOMe4Jv9a8kMh5PZu12u+gTrlMU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Ycg+HFoyVx51X4S8+BiZYKglYHAMAns2d+FOeBMd22g=;
	b=EI4rLRBMMwjzY0pbVIaO5dz/60W1uJ8yPhsHGgMeOj+eToVsYBVpInfzea9uyLzbVE
	wTxt4QQyvTMXfIDWT/1/ra2ZIAlnWC/jgibSfpBre7AHclA7AcU0aVfRfU026Q0CpwAx
	MicN49LF8H7M7iNEUZIoXSKwsAfa6xa1Amt9+dLpa1YTYVKDO+5VmauQw2mA4yoiZo/I
	UH929LDHCpTX/2RGTOhPrr9oXQlmRsxsxnkTIWJCnl7vuTFr+RLbztEqeNzi3eotoQcO
	6qMwhVpO6yiBuX8FBG2KaxO8UsTjXyL6TBoI3JpIr+Yr/CgDxLw19/ArTCBtP1b6sEYa
	Y+qg==
X-Gm-Message-State: AEkoous8D++Rlvmlkrx7ppViNBHGvqAb1x8u1QUWER7jfZU1oQzqSiO7+sqqLr+VsxdXdhXe6IJzFoKTg8QizK07
X-Received: by 10.31.89.134 with SMTP id n128mr20928815vkb.83.1470124807197;
	Tue, 02 Aug 2016 01:00:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.150.200 with HTTP; Tue, 2 Aug 2016 00:59:46 -0700 (PDT)
In-Reply-To: <20160801111433.2af5c013@nial.brq.redhat.com>
References: <1468975744-12587-1-git-send-email-kwangwoo.lee@sk.com>
	<1468975744-12587-2-git-send-email-kwangwoo.lee@sk.com>
	<CAFEAcA_5jngVxajJxdJ0krz0inrkdjTNYYZ+5SNGOipoQo35ZA@mail.gmail.com>
	<79b91f02b26441be993e372cef44002d@nmail01.hynixad.com>
	<20160801094607.057cef2f@nial.brq.redhat.com>
	<CAFEAcA_6TQym4k3wiFEiAwwErJF0NDyqE8gDacfWK+n-rTsQyg@mail.gmail.com>
	<20160801111433.2af5c013@nial.brq.redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Aug 2016 08:59:46 +0100
Message-ID: <CAFEAcA9cbsq5oWCABMww3EWkV8cPsaGJrO0NyPyc4Ph7aA_MQg@mail.gmail.com>
To: Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::234
Subject: Re: [Qemu-arm] [RFC PATCH 1/3] hw/arm/virt: add hotplug memory
 support
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
Cc: Xiao Guangrong <guangrong.xiao@linux.intel.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"woosuk.chung@sk.com" <woosuk.chung@sk.com>,
	qemu-arm <qemu-arm@nongnu.org>, Shannon Zhao <shannon.zhao@linaro.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"hyunchul3.kim@sk.com" <hyunchul3.kim@sk.com>,
	"kwangwoo.lee@sk.com" <kwangwoo.lee@sk.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2XdEFByhLIqw

On 1 August 2016 at 10:14, Igor Mammedov <imammedo@redhat.com> wrote:
> On Mon, 1 Aug 2016 09:13:34 +0100
> Peter Maydell <peter.maydell@linaro.org> wrote:
>> On 1 August 2016 at 08:46, Igor Mammedov <imammedo@redhat.com> wrote:
>> > Base alignment comes from max supported hugepage size,
>>
>> Max hugepage size for any host? (if so, should be defined
>> in a common header somewhere)
>> Max hugepage size for ARM hosts? (if so, why is TCG
>> different from KVM?, and should still be in a common
>> header somewhere)
> It's the same for TCG but it probably doesn't matter much there,
> main usage is to provide better performance with KVM.
>
> So I'd say it's host depended (for x86 it's 1Gb),
> probably other values for ARM and PPC

We probably don't want to make the memory layout depend
on the host architecture, though :-(

>>
>> > while
>> > size alignment should depend on backend's page size
>>
>> Which page size do you have in mind here? TARGET_PAGE_SIZE
>> is often not the right answer, since it doesn't
>> correspond either to the actual page size being used
>> by the host kernel or to the actual page size used
>> by the guest kernel...
> alignment comes from here: memory_region_get_alignment()
>
> exec:c
>    MAX(page_size, QEMU_VMALLOC_ALIGN)
> so it's either backend's page size or a min chunk QEMU
> allocates memory to make KVM/valgrind/whatnot happy.

Since that's always larger than TARGET_PAGE_SIZE
why are we checking for an alignment here that's
not actually sufficient to make things work?

thanks
-- PMM
