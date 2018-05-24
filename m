Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp1957064wre;
        Thu, 24 May 2018 07:57:11 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIdfU5CzMKjrpXoD+ji0hZ37QE9aCXMj/rakyG++Nz51Kr0DAJq7hPK47eFC/LReBbL/0eP
X-Received: by 2002:aed:2805:: with SMTP id r5-v6mr7558363qtd.28.1527173831701;
        Thu, 24 May 2018 07:57:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527173831; cv=none;
        d=google.com; s=arc-20160816;
        b=snowA+f5r4Nm/IKGswgf6UeDubY2geE/GmN/PGkwYipJPmeg0LMFvMI2I7EbQ8K63l
         7VWzDnaogYI6ZxeHT/jPlHr2O0m8bWKA7B0f1e8ViDqgYXk73HODh8HpTXH9XffwdN1X
         Mw3xTmNqlw1/xuBh7csThdikeJX1YlqTTAlkXTLbg2N2dioxlxZ8nHgjGMpfPT5wx8vi
         zrR2HdkQs2ehcL0RhDR4+GMfuDYjtitvdxOOX+wFpIOfGc6xe9Zfk5gzhPzUnsEbd+L5
         qJuiYyjH0V3SjI/mDAuZ4gWnGH9jxFNTbHMsNJcYsAfjMq6EZTRnx4I36Iz1zZPO0jrZ
         7ukQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=MEfuUcBPbq5FSE9UMJDp7TmTk+64kXpeg1hlQvLIkxE=;
        b=sxTFNxZBoUIkPpABBS3pQAMiEF8aYGlTHbcN8ObqZh0gfzGIkPQKaSTYadk522Jhj0
         kk4kTuxXpyFqE+nCmUgRVaBwcYYRrCCoFoBHdGD3mEKwZG5uQLlRF7fxILAc9h7gUSkp
         oMYKklry/B4bsuMtGiWkwyPeA/CSiIexbVwHgrZvr2DMS9kqkWtDK7tYttEnEv6h9vwu
         932rCn5pDBsYqXCNd1uKGwiTLGbsZxrmpo0o4MfBYfRHgbUIQefsfoMng7rrMszfRNZP
         4AxQbZCd2jXHCac0pC1V/HcI6oHuzB+ZYcoO0b5Qoa6TGhHRLTyFiuvddSSXsOB7Tenj
         C/bg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=R7URoXO4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f202-v6si10561570qka.28.2018.05.24.07.57.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 24 May 2018 07:57:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=R7URoXO4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39028 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fLrfz-0005Ww-7n
	for alex.bennee@linaro.org; Thu, 24 May 2018 10:57:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39103)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fLrfn-0005VR-UF
	for qemu-arm@nongnu.org; Thu, 24 May 2018 10:57:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fLrfm-0002zX-Ma
	for qemu-arm@nongnu.org; Thu, 24 May 2018 10:56:59 -0400
Received: from mail-ot0-x243.google.com ([2607:f8b0:4003:c0f::243]:45947)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fLrfm-0002yu-I1
	for qemu-arm@nongnu.org; Thu, 24 May 2018 10:56:58 -0400
Received: by mail-ot0-x243.google.com with SMTP id 15-v6so2270157otn.12
	for <qemu-arm@nongnu.org>; Thu, 24 May 2018 07:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=MEfuUcBPbq5FSE9UMJDp7TmTk+64kXpeg1hlQvLIkxE=;
	b=R7URoXO4Y01qrGWqqa+olhOj2LtVddsUEhIwRkXhbMFQrrYWQkAO/GsjSuKqHWsXX1
	qjNKqwghY7bZqzMBWCQa3ZT3kcOOhw69X7GSz5pCgqq+YhIZBb6ANGGhd39JsP8dEAFv
	eWzllawvrifDmx/zuGekraZ3U95GYJlNnnzwk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=MEfuUcBPbq5FSE9UMJDp7TmTk+64kXpeg1hlQvLIkxE=;
	b=q1kf3qW/Z+vP0Uq/AzRLZbIMEjzsZJwf2jHDxWJeJezA4dDU5iccHubqNulok6/UWj
	0YvNw9aAPG1JU2nlesrxvYIt2sC8o3Z/5C1XFtikr5nOsYTOWNqDMys0vQd7HkI7s7aV
	lW8YFCTZG0LIndLZav3M7ZOexGObfYgz132Kn9aKr7vZ8/IcR+4m6xto3FfblwkJ38Os
	0U8hRJFaKMlczJWazSJYuK91u7aIPskGvjmvceoAJVlydty3/YEzaDsQdKV/zkyKeqlA
	1l/kpHYSDxYOY5gRjJmPHCTipmrbk9uyW1hBD9P3zQUD0qfrD718Il4fXFdoHYXgNlZz
	GYpg==
X-Gm-Message-State: ALKqPwdmAvwGQE2eyJSM5r6iii1nWCwe5M5viQCNrQaaiwPdQa+jao4r
	4kZrhI0K2OTmMVwNfEuLiC85dLVUzNklUTF9aeF8GQ==
X-Received: by 2002:a9d:2625:: with SMTP id
	a34-v6mr5004667otb.308.1527173817635; 
	Thu, 24 May 2018 07:56:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP; Thu, 24 May 2018 07:56:37
	-0700 (PDT)
In-Reply-To: <38aee779-1baf-ab96-7489-0f34bda2f8e6@redhat.com>
References: <1527047633-12368-1-git-send-email-zhaoshenglong@huawei.com>
	<1527047633-12368-2-git-send-email-zhaoshenglong@huawei.com>
	<acca5b80-f527-bc39-0b63-147e53affb4b@redhat.com>
	<CAFEAcA-xbHtxora5TU9psYnBgP0+N8_nznhVppEkg7fmmwip3w@mail.gmail.com>
	<10801e6c-5028-add6-b082-22c5dc9758ca@redhat.com>
	<CAFEAcA-eW_1M42c+Fjt98AgVsnbwjwWap3JZFHNU9f8S0H_qww@mail.gmail.com>
	<38aee779-1baf-ab96-7489-0f34bda2f8e6@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 24 May 2018 15:56:37 +0100
Message-ID: <CAFEAcA9oCppg2C32vd3YKKmvfO7n1KnFeXG14CV7UHcZpxcTqA@mail.gmail.com>
To: Auger Eric <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::243
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
X-TUID: XBu7e/Hz8d3I

On 24 May 2018 at 15:40, Auger Eric <eric.auger@redhat.com> wrote:
> Hi Peter,
>
> On 05/24/2018 04:16 PM, Peter Maydell wrote:
>> Only for KVM, not for TCG, and it's the other way round: we
>> end up with two lots of PPI/SGI space in the data structure
>> by mistake. Let me fish out the comment I made on the v2 of this
>> series:
>>
>> In the code in master, we have QEMU data structures
>> (bitmaps, etc) which have one entry for each of GICV3_MAXIRQ
>> irqs. That includes the RAZ/WI unused space for the SPIs/PPIs, so
>> for a 1-bit-per-irq bitmap:
>>  [0x00000000, irq 32, irq 33, .... ]
>>
>> When we fill in the values from KVM into these data structures,
>> we start after the unused space, because the for_each_dist_irq_reg()
>> macro starts with _irq = GIC_INTERNAL. But we forgot to adjust
>> the offset value we use for the KVM access, so we start by
>> reading the RAZ/WI values from KVM, and the data structure
>> contents end up with:
>>  [0x00000000, 0x00000000, irq 32, irq 33, ... ]
>> (and the last irqs wouldn't get transferred).
> In kvm_dist_get_priority (new code), the offset is where we read and
> field is where we write, correct? Offset was shifted so we effectively
> read in KVM regs the num_irq-32 SPI states now but don't we start
> writing at the beginning of bmp, (ie s->gicd_ipriority), at PPI/SGI
> offset? What am I missing?

Oops, yes, you're right. My explanation applies to the
various other bitmaps, where we are accessing the
fields in the data structure using gic_bmp_ptr32(bmp, irq),
but not to gicd_ipriority[], which we are directly accessing
starting with the first word, not by indexing via bmp[irq].

So we need to handle these two cases differently.
You're correct that for gicd_ipriority[], the code in
master reads and writes to that data structure as:
 [0, 0, ..., 0, irq 32, irq 33, ..., 0, 0, ... 0]
so all the values are in the right place but we:
 (a) unnecessarily read/write zeroes for the PPI/SGI fields
 (b) fail to transfer the last 32 interrupts

We can fix the gicd_ipriority[] case simply by adding
   bmp = GIC_INTERNAL;
before the assignment to 'field' in both kvm_dist_get_priority()
and kvm_dist_put_priority(). This doesn't affect migration
compatibility. We should do this separately from fixing the
other bitmaps, because it's simpler.

> I don't understand you TCG remark above, sorry.

You can migrate a TCG VM as well as a KVM one. The
TCG GICv3 doesn't use any of this code in hw/intc/arm_gicv3_kvm.c,
so it doesn't have any of these bugs. So any fixups for the
KVM bugs so we get migration correct in the
"buggy VM" -> "not buggy VM" situation should not misidentify
a TCG VM as "buggy".

PS: I have a feeling that kvm_dist_get/set_priority have
an endianness problem -- the 'reg' we read from the kernel
will be a 32-bit value with the priority byte for the
lowest-numbered IRQ in its least significant byte, but if
the host is big-endian we'll write that to the wrong offset
in the gicd_priority[] array...

thanks
-- PMM
