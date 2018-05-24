Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp1915206wre;
        Thu, 24 May 2018 07:17:08 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZphB+Z0nJCeEg5TgqnXr3/2o4ikAXuw+c/MmKfgfHFx/6GC4mB5+CstQAOhIL55m0ISS4dK
X-Received: by 2002:ac8:5293:: with SMTP id s19-v6mr6927916qtn.311.1527171428181;
        Thu, 24 May 2018 07:17:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527171428; cv=none;
        d=google.com; s=arc-20160816;
        b=IROKYfeD+b1pH9SK0HsIesKjLw49mM94iJmgAlcJRxpO7q1uM46BPk8INO5T9gmzoS
         RUduGRKy3o0TwQYdhRp+zKpYAojwtiViRil+vE/4HW7dMQczK36Kb0/sFxumeL+hIf2B
         Gmf3ptE884wetYZTTdFDHkJ/xf22BIb5ZDK7mtbwXllVU+jLnugmBaFnOC1XjT3CsO0f
         RM2HW609JdBscjg73FlW1lA1MvG84JgIK8zRSKj7GiAPyb8Aj+pOZkwWBesrZPnMvJaD
         Cpf2v34zkvq3WAtCjdOd2IcNcw2o2VFJM7tcaXb1plZtnWIJFSuc4iAejIJbXCU84aIJ
         1ueg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=apEAqb7UHUkU1NSz2xWjH3FpCUKgpcWU0Py0Ww0+jy8=;
        b=Gs8RXeVvTSCwuUpYgjiklW2qMXYe+AveAnLkjFWG1hPs/7haiEkM1MFjtlvDoh+IHt
         6DGd3QBsegSkmB3nUlrn5fr+T5OC0Urgqiazbtf2I55CIIyRdXM3s18MGYiD4Ume59Jb
         ZXMAI3rEshWRRBgDwIOzPDAPM7TW4WecBEKYH++AKs4RAx9b/CPSkpeugRxFruSQs5DE
         K1cCA3KNzIJZgpsInDBB4X5h5dKYQN84pXB6xrx18te0t1qVETRjZFITny4ZvFOSanDL
         S9XkpYh09xPb/6hdoBVQlWzuLvVOLl+ie2lYRrLm1QKTO14/rjajh3S9fH4/PYXR9L+d
         gDwQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AvijnOhg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v51-v6si3716299qtb.201.2018.05.24.07.17.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 24 May 2018 07:17:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AvijnOhg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38913 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fLr3D-0002RF-O3
	for alex.bennee@linaro.org; Thu, 24 May 2018 10:17:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59805)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fLr34-0002PV-1T
	for qemu-arm@nongnu.org; Thu, 24 May 2018 10:16:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fLr32-0006s6-TF
	for qemu-arm@nongnu.org; Thu, 24 May 2018 10:16:57 -0400
Received: from mail-ot0-x242.google.com ([2607:f8b0:4003:c0f::242]:45494)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fLr32-0006rv-O9
	for qemu-arm@nongnu.org; Thu, 24 May 2018 10:16:56 -0400
Received: by mail-ot0-x242.google.com with SMTP id 15-v6so2101320otn.12
	for <qemu-arm@nongnu.org>; Thu, 24 May 2018 07:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=apEAqb7UHUkU1NSz2xWjH3FpCUKgpcWU0Py0Ww0+jy8=;
	b=AvijnOhgedj+LgcfVeMRCsdwDICVwivSBZQ0EFi5sIILvlTNPf1j8STbbt3TYbAOA7
	xQEsQD6jhrxnL3VydF3TN+PVrnFzHtBDCUHIzitapzUGmzQh+arr6KJULMPnZQ0/3amC
	GMWTx7p9JbUtY97xgS39S+E/qeHwLds2ZfRRI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=apEAqb7UHUkU1NSz2xWjH3FpCUKgpcWU0Py0Ww0+jy8=;
	b=H6tcqzjNsI0ixFX1Db9YT10yK1IKmX07IuC4hAe8/yifHT9H6Y8UC/x7bRwr9qh/iO
	pK9Nn4t04VNcIlfi5gNwxrkDq/bkXvKTSPEtckHn96LQnhllYyClx/P5k/xn0dINOCR6
	6F30D6LeK/MUn+LK3Xk6sRlIhNr8Cm4bji2haIhpH/OJYBsBXa/JMuXCCWbC5AyiJU4g
	AalkBUweLTOcqNJragO52tEbKY+hLiysZrDAYCQi1TQayr42Z7KGPXXZZ3Tkp+XEHrn/
	QgIPdf+oMK/qQHwNjWwDupuU+nHZIwgq3yud21YmWxIyFAInuyBPHHQseZkoNvRcMjtS
	fWvg==
X-Gm-Message-State: ALKqPwdFKAJZsBnGvve5k1Zj96ZNuP/tHzFne5Ufdh5Gg5GAUXa7Qy/E
	JoamF2N7e1wDg5s3+LcGCiHpYcmBUkdfskHVAmAVwQ==
X-Received: by 2002:a9d:2842:: with SMTP id
	h2-v6mr5087836otd.210.1527171415920; 
	Thu, 24 May 2018 07:16:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP; Thu, 24 May 2018 07:16:35
	-0700 (PDT)
In-Reply-To: <10801e6c-5028-add6-b082-22c5dc9758ca@redhat.com>
References: <1527047633-12368-1-git-send-email-zhaoshenglong@huawei.com>
	<1527047633-12368-2-git-send-email-zhaoshenglong@huawei.com>
	<acca5b80-f527-bc39-0b63-147e53affb4b@redhat.com>
	<CAFEAcA-xbHtxora5TU9psYnBgP0+N8_nznhVppEkg7fmmwip3w@mail.gmail.com>
	<10801e6c-5028-add6-b082-22c5dc9758ca@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 24 May 2018 15:16:35 +0100
Message-ID: <CAFEAcA-eW_1M42c+Fjt98AgVsnbwjwWap3JZFHNU9f8S0H_qww@mail.gmail.com>
To: Auger Eric <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::242
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
X-TUID: 48QJNz1BWZxy

On 24 May 2018 at 14:59, Auger Eric <eric.auger@redhat.com> wrote:
> Hi,
>
> On 05/24/2018 03:14 PM, Peter Maydell wrote:
>> On 24 May 2018 at 10:04, Auger Eric <eric.auger@redhat.com> wrote:
>>> Now I am unclear about the semantics of the s->gicd_ipriority & friends.
>>> With that change, is it supposed to contain only the states of SPIs or
>>> contain the RAZ states of PPI/SGIs + states of SPIs. The array is
>>> dimensionned to contain states for PPI/SGI+SPIs, right? In other words,
>>> shouldn't we also shift field?
>>
>> The semantics of the gicd_ipriority and other data structures are
>> set by the TCG GIC implementation, and include blank space at
>> the start where the PPI/SGI bits would live. See this comment
>> from arm_gicv3_common.h:
>>
>>  * Each bitmap contains a bit for each interrupt. Although there is
>>  * space for the PPIs and SGIs, those bits (the first 32) are never
>>  * used as that state lives in the redistributor. The unused bits are
>>  * provided purely so that interrupt X's state is always in bit X; this
>>  * avoids bugs where we forget to subtract GIC_INTERNAL from an
>>  * interrupt number.
>
> If I understand Shannon's code correctly, the space for PPIs/SGIs is
> currently overwritten by SPI state, hence my comment.

Only for KVM, not for TCG, and it's the other way round: we
end up with two lots of PPI/SGI space in the data structure
by mistake. Let me fish out the comment I made on the v2 of this
series:

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
For TCG, where we never had this bug, this is how the data
structure has always looked.

But for migration from the old version, the data structure
we receive from the migration source will contain the old
broken layout of
 [0x00000000, 0x00000000, irq 32, irq 33, ... ]

So we need in inbound migration to identify when we need
to fix this up (by copying the data down to get rid of that
extra 0x00000000), which is "when KVM is enabled and the source
is not a version new enough to have fixed this bug".

> If we stick to the
> current semantics, can't we just add the last missing 32 SPI states and
> we don't need the subsection?

You need a subsection, because that's how you get migration
compatibility.

thanks
-- PMM
