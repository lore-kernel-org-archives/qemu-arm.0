Received: by 10.25.21.156 with SMTP id 28csp1604235lfv;
        Mon, 11 Jul 2016 11:36:25 -0700 (PDT)
X-Received: by 10.55.170.20 with SMTP id t20mr28002840qke.162.1468262185137;
        Mon, 11 Jul 2016 11:36:25 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 23si231939qkq.180.2016.07.11.11.36.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Jul 2016 11:36:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35508 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bMg48-0008Nx-JB
	for alex.bennee@linaro.org; Mon, 11 Jul 2016 14:36:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42683)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bMg43-0008M8-0o
	for qemu-arm@nongnu.org; Mon, 11 Jul 2016 14:36:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bMg40-0007TD-PB
	for qemu-arm@nongnu.org; Mon, 11 Jul 2016 14:36:18 -0400
Received: from mail-vk0-x231.google.com ([2607:f8b0:400c:c05::231]:33677)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bMg40-0007Su-9E
	for qemu-arm@nongnu.org; Mon, 11 Jul 2016 14:36:16 -0400
Received: by mail-vk0-x231.google.com with SMTP id x130so24030990vkc.0
	for <qemu-arm@nongnu.org>; Mon, 11 Jul 2016 11:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7YIzA9uYoGBIU5bu9ajN1Mk4MDl+mpf9TBal+CZrlzI=;
	b=bJVBmbKfehP8dkYctBayXzKDSlwAQulbx0uc50Zs8VsF7K0rsOwR4UwNSp6vKDg8pp
	d2Gn4y1pNpIRR7pu4Fz3cZ31Kq2asLnv9rq7k2KQtQVSWM5K2sTdYk7DAb7FWpdTqsKu
	coS8AYThRtMsiDfhT1ZyUVVyCl6jxbVdxVC+4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7YIzA9uYoGBIU5bu9ajN1Mk4MDl+mpf9TBal+CZrlzI=;
	b=QzjiQkbOBhDb4Um2fGnjLnsrrXwSCAanbWDYDdXKjEb0qu8KdWUnAVTaM/d5sdXI8c
	L+Hv2LSWJaxXFriaHzZ9s4NhiPuFxBRYiSdLikOi9oqsHtJB0JIcPcpuTu9o+Ug6fcdw
	5pjH4dtlSyYyfdwzmFZ/1xKzsF6jpLgkWgDydZyKW08TKb3+1ULfGt2Vq/fB19JhArh0
	CmeKMkKIMeEEIIpVwN+rl1M4a0aRyMjr1mIBIXHVEmzkE6UwkpKZNk1OwA2LMtcf6//i
	Ye36Po5+ebLnTyO98r16kyXGU1ASDWt2zf0bwKQb5dmOd/gmuxPOBDcuaI1DEdbGwTn2
	WQeg==
X-Gm-Message-State: ALyK8tLHENPotv/ugUEv85aV5eeORZ165f8BpLyW/jFHTJYPW9wlEIH9FwKWwYIeERvhchGxGh7oU1mtkEUtXpxs
X-Received: by 10.176.65.71 with SMTP id j65mr10009957uad.103.1468262175665;
	Mon, 11 Jul 2016 11:36:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.137.69 with HTTP; Mon, 11 Jul 2016 11:35:56 -0700 (PDT)
In-Reply-To: <458161468261386@web2h.yandex.ru>
References: <1466694717-556963-1-git-send-email-afarallax@yandex.ru>
	<CAFEAcA8mTv4LJh2WO5chuga+ZqAEWkzTeoTn8M4t+K5LGGnhNQ@mail.gmail.com>
	<458161468261386@web2h.yandex.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Jul 2016 19:35:56 +0100
Message-ID: <CAFEAcA_Lq-8s7wx4bu+t6MJxXau5aoo6B2QJPGXJ=VWtztHNjw@mail.gmail.com>
To: Sergey Sorokin <afarallax@yandex.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::231
Subject: Re: [Qemu-arm] [PATCH] target-arm: Add missed AArch32 TLBI sytem
 registers
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
X-TUID: VsYz1Uwy+lbU

On 11 July 2016 at 19:23, Sergey Sorokin <afarallax@yandex.ru> wrote:
> 11.07.2016, 20:39, "Peter Maydell" <peter.maydell@linaro.org>:
>>>  +
>>>  + CPU_FOREACH(other_cs) {
>>>  + tlb_flush_page_by_mmuidx(other_cs, pageaddr, ARMMMUIdx_S1E2, -1);
>>>  + }
>>>  +}
>>>  +
>>>   static const ARMCPRegInfo cp_reginfo[] = {
>>>       /* Define the secure and non-secure FCSE identifier CP registers
>>>        * separately because there is no secure bank in V8 (no _EL3). This allows
>>>  @@ -1238,6 +1343,14 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
>>>         .type = ARM_CP_NO_RAW, .access = PL1_W, .writefn = tlbiasid_write },
>>>       { .name = "TLBIMVAA", .cp = 15, .opc1 = 0, .crn = 8, .crm = 7, .opc2 = 3,
>>>         .type = ARM_CP_NO_RAW, .access = PL1_W, .writefn = tlbimvaa_write },
>>>  + { .name = "TLBIALLNSNH",
>>>  + .cp = 15, .opc1 = 4, .crn = 8, .crm = 7, .opc2 = 4,
>>>  + .type = ARM_CP_NO_RAW, .access = PL2_W,
>>>  + .writefn = tlbiall_nsnh_write },
>>>  + { .name = "TLBIALLNSNHIS",
>>>  + .cp = 15, .opc1 = 4, .crn = 8, .crm = 3, .opc2 = 4,
>>>  + .type = ARM_CP_NO_RAW, .access = PL2_W,
>>>  + .writefn = tlbiall_nsnh_is_write },
>>
>> These don't exist on v7 unless the virtualization extensions are present
>> (though they do exist on v8 without EL3).
>
> So I should check arm_feature(env, ARM_FEATURE_EL2) to add these registers,
> e.g. by moving them to el2_cp_reginfo, right?

That would make them incorrectly not exist for v8-without-EL3, I think.
If there isn't a suitable reginfo array for this case, you might need
to either list them in two arrays or add a new array.

thanks
-- PMM
