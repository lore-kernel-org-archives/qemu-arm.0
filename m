Received: by 10.28.71.155 with SMTP id m27csp388423wmi;
        Fri, 23 Mar 2018 05:09:13 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4/ZP/n/khtyrvhqZZehz+PgD4O1Eb8mJKsl9mKDYVgwrV8mBsMb2k1rfQRFOHSvq7wQITAb
X-Received: by 10.200.17.137 with SMTP id d9mr3501421qtj.300.1521806953467;
        Fri, 23 Mar 2018 05:09:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521806953; cv=none;
        d=google.com; s=arc-20160816;
        b=bLA3LmKjmMuA8yJtywWI1qpi563UGs7QgvSoIZ5kbt7lCa0+g3+sBOUSpviEISTqbp
         i5dk3E71KlhefFlDisfAdRpxEHQu7jCOFL+h4n93c66uD/9m3jXFBIU53zJ/Nex/WzUN
         9JUOteM/0R/pdPxWoHgzp6lq/Ckn4v2Ui4yDOOLQic8isj1tLorwc0oxb7YNJH324RyF
         pivdw+eLKMIhAy98CZJRBKasKY5K/iAKHHXawm4c0IqKlgo3cIK/D9oLnc1N9TPtxTO0
         6ubjhP5SifeYtFC9LpGKJV5/qXvIxQWrbGBYSszal0rWa7S+icAcMrM7H/cbq8YrRIK7
         /E1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=lZIz2UNYcfdzYhA6yW860bLgjgWEWETOl6lDDVHhYIU=;
        b=ZCCgi0KsnpVeBJQGvBIthUqXVr1/GCo65sBftTjN6vPKUxY7WgAQrXd+GY++ZrZWjT
         9uXBLhWSnsyLdf3mZTEqx0ZOUtChpalWJ4yrru52Zy5hBCYI21ndLsEqYOiwW2FvHE72
         Ph9f7oaYcVC/bu9MmNvfXE3gEsGWJ3IEkC1IG1XVKPOMeAXyzdQxD1cQnLmpJVnZwZdf
         /zzKlylaZEfcA8uwPyJBM9FmWNSzGoJ86hT7wsHTDB/1FSxUAeC5YFBsSdISpqGwvFr3
         L0mTWJ2/wN/iwNs37Zl57A1wNftqL9b86gfLG2OkjTmWJSy55NZMGha1J8BF2KSaNG9U
         DWCw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Bysfqvy6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i39si2455999qtb.102.2018.03.23.05.09.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Mar 2018 05:09:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Bysfqvy6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37628 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ezLVR-0002ed-0A
	for alex.bennee@linaro.org; Fri, 23 Mar 2018 08:09:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55665)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ezLVE-0002d2-Cw
	for qemu-arm@nongnu.org; Fri, 23 Mar 2018 08:09:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ezLVD-000780-9z
	for qemu-arm@nongnu.org; Fri, 23 Mar 2018 08:09:00 -0400
Received: from mail-ot0-x244.google.com ([2607:f8b0:4003:c0f::244]:33779)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ezLVD-00077d-3k
	for qemu-arm@nongnu.org; Fri, 23 Mar 2018 08:08:59 -0400
Received: by mail-ot0-x244.google.com with SMTP id 23-v6so2451433otj.0
	for <qemu-arm@nongnu.org>; Fri, 23 Mar 2018 05:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=lZIz2UNYcfdzYhA6yW860bLgjgWEWETOl6lDDVHhYIU=;
	b=Bysfqvy6oDw148BqgMB+oDxa4QTpb6DJTbrvEQxZqQqO5snEzkqDl59qk381z6TmFg
	K25nEI4yCDPhv3KAoHgcsNfQzOP4Let6ugZ0hEswZg0I6lc/EgzmvOsKjprCSb6eyVqd
	OkxtLPNARm3R6omwR/DCL/+h04nBje4TUHvxY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=lZIz2UNYcfdzYhA6yW860bLgjgWEWETOl6lDDVHhYIU=;
	b=A4rEZ1ZT4tSBY8RCPXwccAoQC38iwNsAJi/8hI83kTtciVg9Xi/R/7WDw3A1NSJPTv
	d5kVKaPDPNWj23J4ymO+01P+60qP3b2FT3u4Oe7TKgOTpN08m4nhZ4b1vHfNK2XDcMBY
	SskVgYUyxWZY3Am3zquuSylkWSFOYg25JgfMgCgqGpaF7Vln+Z24Ou+tbL4baXdBD0uf
	chFJl/PZHf/85pQk/ElgnAfYdHGpNMI88Hezz98Zv1jf4fYMpemkPXcrMJ6kxGm4KcV4
	ELQ/lS4mMpK3mw/Qnf+XkST+VvajkZOIRYLwojbojD9YqRsEjIXasSQN4UcUdUP4H7AZ
	EIdg==
X-Gm-Message-State: AElRT7EL6WOe6BD+lS9kU06H72yuUR2qKSHh3EJV9qrYQS4CH71kN7Dw
	Hppr94eqcBIKV9cUiSNnbnErB9I5eLx7JM/w08MlEw==
X-Received: by 2002:a9d:2ae1:: with SMTP id
	e88-v6mr18857663otb.308.1521806938401; 
	Fri, 23 Mar 2018 05:08:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2286:0:0:0:0:0 with HTTP; Fri, 23 Mar 2018 05:08:38
	-0700 (PDT)
In-Reply-To: <5AB21130.2020309@huawei.com>
References: <1521530809-11780-1-git-send-email-zhaoshenglong@huawei.com>
	<1521530809-11780-3-git-send-email-zhaoshenglong@huawei.com>
	<CAFEAcA96qV_f7i_36Yzb-QV7W9SRHKfJpg=rvv3tia2X-Xi7QQ@mail.gmail.com>
	<5AB0F254.3050503@huawei.com>
	<CAFEAcA-Ct3qa0OFZ4U+9RH68SQJgmkxJKKS5e+if_MuL2pSu3A@mail.gmail.com>
	<5AB21130.2020309@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Mar 2018 12:08:38 +0000
Message-ID: <CAFEAcA8yr+KJFwBSksMP-VjNbsSd190VCzB4wGwOCoaX2ScDiA@mail.gmail.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::244
Subject: Re: [Qemu-arm] [PATCH v2 2/2] arm_gicv3_kvm: kvm_dist_get/put: skip
 the registers banked by GICR
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
Cc: Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jRtGkftpS/RB

On 21 March 2018 at 08:00, Shannon Zhao <zhaoshenglong@huawei.com> wrote:
> On 2018/3/20 19:54, Peter Maydell wrote:
>> Can you still successfully migrate a VM from a QEMU version
>> without this bugfix to one with the bugfix ?
>>
> I've tested this case. I can migrate a VM between these two versions.

Hmm. Looking at the code I can't see how that would work,
except by accident. Let me see if I understand what's happening
here:

In the code in master, we have QEMU data structures
(bitmaps, etc) which have one entry for each of GICV3_MAXIRQ
irqs. That includes the RAZ/WI unused space for the SPIs/PPIs, so
for a 1-bit-per-irq bitmap:
 [0x00000000, irq 32, irq 33, .... ]

When we fill in the values from KVM into these data structures,
we start after the unused space, because the for_each_dist_irq_reg()
macro starts with _irq = GIC_INTERNAL. But we forgot to adjust
the offset value we use for the KVM access, so we start by
reading the RAZ/WI values from KVM, and the data structure
contents end up with:
 [0x00000000, 0x00000000, irq 32, irq 33, ... ]
(and the last irqs wouldn't get transferred).

With this change to the code we will get the offset right and
the data structure will be filled as
 [0x00000000, irq 32, irq 33, .... ]

But for migration from the old version, the data structure
we receive from the migration source will contain the old
broken layout of
 [0x00000000, 0x00000000, irq 32, irq 33, ... ]
so if the new code doesn't do anything special to handle
migration from that old version then it will write zeroes to
irq 32..63, and then write incorrect values for all the irqs
after that, won't it?

That suggests to me that we need to have some code in the
migration post-load routine that identifies that the data
is coming from an old version with this bug, and shifts
all the data down in the arrays so that the code to write
it to the kernel can handle it.

thanks
-- PMM
