Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp2799185wre;
        Fri, 25 May 2018 01:43:45 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKATeH4/wYvoiYvuwGc8CeRyEDncVqLddEd+3oW59S7HmZjaJzfRql7YN76CzPNCYhU7w4c
X-Received: by 2002:aed:2785:: with SMTP id a5-v6mr1232497qtd.249.1527237825151;
        Fri, 25 May 2018 01:43:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527237825; cv=none;
        d=google.com; s=arc-20160816;
        b=FXO4vSf34HUzGmsZcAC5xtnRIXkBlADurwSOKkYXK3SZ/F2koTyKweIYUwEEQ1XzYs
         b7LVo5XbV4CnNEAJhR4bXwzepDUOWiue/Q2E2x5Ln42Zxs6dH7DEmo9V5iHMIzJmxClP
         AfUW/2dKtz5J3f4iSwhqumQTl8p5KDHTxcwHhMnY6gdiFEhmmopOqPgouALb74B3Lbpc
         dW1w0Nx+n+mCuFj79hep5jAzZL4crq5wjoswUL3JWYJO8Sdr7g7trpww3XTIVZYDl5xf
         bXij9mRzOj4FiT9LjNQQXIgxg7dRUe0vixC0ERmcbZSWovFqWZCUuaGF5OS0vDQkxBEV
         3dgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:references:to:mime-version
         :user-agent:from:date:message-id:arc-authentication-results;
        bh=Bi8aS422HWK4I/SZOrUB06o/EA2DPcV6E87ttO2ca5o=;
        b=eh9dGAL2s3PYoRxs5FPbNKnHSUrbBSLtfyXoGxSCXD1rFLbwuw15q9hsasJM67k9s2
         gyQQLLcMT+soSWGAOCFDRCeYOZW7eUp+I3e8vr4lcFMQ7w+Eo6fZ40DNJzp9Hoq9nPVD
         Yh9E7olcaJINeWfuYIqJIwZ9JjcUXtnY1+wYaKpKmKayoq+IxEIZVknSjlaLQLaGEtps
         BdD+akLb4t8q6fTJdomrEStQa0N84RNNL/hSsrL/rBPNh5ec+Oa3StP9kb//z2w0peXd
         zLIBo3I7J6AlepjiqmOXOCdZoVOkWi+ii0u/OSBrAkOhPYpbZmwOLU4qpmdddvc15WwC
         guww==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x1-v6si9187293qvc.198.2018.05.25.01.43.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 25 May 2018 01:43:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42509 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fM8K8-0005jI-K9
	for alex.bennee@linaro.org; Fri, 25 May 2018 04:43:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44034)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1fM8Js-0005i8-Vx
	for qemu-arm@nongnu.org; Fri, 25 May 2018 04:43:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1fM8Jp-0005AZ-R3
	for qemu-arm@nongnu.org; Fri, 25 May 2018 04:43:29 -0400
Received: from [45.249.212.32] (port=57898 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <zhaoshenglong@huawei.com>)
	id 1fM8Jp-000543-G2; Fri, 25 May 2018 04:43:25 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id 9DF5A9BB57787;
	Fri, 25 May 2018 16:43:18 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by DGGEMS406-HUB.china.huawei.com
	(10.3.19.206) with Microsoft SMTP Server id 14.3.382.0; Fri, 25 May 2018
	16:43:09 +0800
Message-ID: <5B07CC79.1070905@huawei.com>
Date: Fri, 25 May 2018 16:42:33 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>, Auger Eric
	<eric.auger@redhat.com>
References: <1527047633-12368-1-git-send-email-zhaoshenglong@huawei.com>
	<1527047633-12368-2-git-send-email-zhaoshenglong@huawei.com>
	<acca5b80-f527-bc39-0b63-147e53affb4b@redhat.com>
	<CAFEAcA-xbHtxora5TU9psYnBgP0+N8_nznhVppEkg7fmmwip3w@mail.gmail.com>
	<10801e6c-5028-add6-b082-22c5dc9758ca@redhat.com>
	<CAFEAcA-eW_1M42c+Fjt98AgVsnbwjwWap3JZFHNU9f8S0H_qww@mail.gmail.com>
	<38aee779-1baf-ab96-7489-0f34bda2f8e6@redhat.com>
	<CAFEAcA9oCppg2C32vd3YKKmvfO7n1KnFeXG14CV7UHcZpxcTqA@mail.gmail.com>
In-Reply-To: <CAFEAcA9oCppg2C32vd3YKKmvfO7n1KnFeXG14CV7UHcZpxcTqA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 45.249.212.32
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
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1G807Bf74oa1



On 2018/5/24 22:56, Peter Maydell wrote:
> On 24 May 2018 at 15:40, Auger Eric <eric.auger@redhat.com> wrote:
>> > Hi Peter,
>> >
>> > On 05/24/2018 04:16 PM, Peter Maydell wrote:
>>> >> Only for KVM, not for TCG, and it's the other way round: we
>>> >> end up with two lots of PPI/SGI space in the data structure
>>> >> by mistake. Let me fish out the comment I made on the v2 of this
>>> >> series:
>>> >>
>>> >> In the code in master, we have QEMU data structures
>>> >> (bitmaps, etc) which have one entry for each of GICV3_MAXIRQ
>>> >> irqs. That includes the RAZ/WI unused space for the SPIs/PPIs, so
>>> >> for a 1-bit-per-irq bitmap:
>>> >>  [0x00000000, irq 32, irq 33, .... ]
>>> >>
>>> >> When we fill in the values from KVM into these data structures,
>>> >> we start after the unused space, because the for_each_dist_irq_reg()
>>> >> macro starts with _irq = GIC_INTERNAL. But we forgot to adjust
>>> >> the offset value we use for the KVM access, so we start by
>>> >> reading the RAZ/WI values from KVM, and the data structure
>>> >> contents end up with:
>>> >>  [0x00000000, 0x00000000, irq 32, irq 33, ... ]
>>> >> (and the last irqs wouldn't get transferred).
>> > In kvm_dist_get_priority (new code), the offset is where we read and
>> > field is where we write, correct? Offset was shifted so we effectively
>> > read in KVM regs the num_irq-32 SPI states now but don't we start
>> > writing at the beginning of bmp, (ie s->gicd_ipriority), at PPI/SGI
>> > offset? What am I missing?
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
> 
If we do bmp += GIC_INTERNAL, we should also add this to offset,
otherwise we will put the SGI/PPIs data to SPIs, right?

Thanks,
-- 
Shannon

