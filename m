Received: by 10.25.85.209 with SMTP id j200csp1092793lfb;
        Mon, 13 Jun 2016 02:05:32 -0700 (PDT)
X-Received: by 10.140.181.70 with SMTP id c67mr13681439qha.20.1465808732519;
        Mon, 13 Jun 2016 02:05:32 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o131si3039398qka.76.2016.06.13.02.05.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Jun 2016 02:05:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54531 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bCNoK-00007y-0K
	for alex.bennee@linaro.org; Mon, 13 Jun 2016 05:05:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39157)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bCNoB-0008U3-V3
	for qemu-arm@nongnu.org; Mon, 13 Jun 2016 05:05:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bCNo4-0002Rw-2e
	for qemu-arm@nongnu.org; Mon, 13 Jun 2016 05:05:22 -0400
Received: from mail-vk0-x233.google.com ([2607:f8b0:400c:c05::233]:35559)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bCNo3-0002Ra-VR
	for qemu-arm@nongnu.org; Mon, 13 Jun 2016 05:05:16 -0400
Received: by mail-vk0-x233.google.com with SMTP id d127so170209032vkh.2
	for <qemu-arm@nongnu.org>; Mon, 13 Jun 2016 02:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Bs2I9sAxm0eRIO4NKbtQXaNWNHwppwE8rZFaU2Cq2iQ=;
	b=Teu/T6f5auNMtySYfBOHU74c5mPQ4Nz0O7YRTJAVKpyoiIOas+CzcQq6T4LG9ViPTs
	rBcCaWCJ9QPblNUGHcwfDztSPrlkArSCELO9bIowRzTbnqJ/ZEYUmahn5t+r6m0F5rNS
	WHbF5xVBi0KjEQXkNdC+mGu3i3hjbjgu/PrNk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Bs2I9sAxm0eRIO4NKbtQXaNWNHwppwE8rZFaU2Cq2iQ=;
	b=Dc4uODXuLQlOSbRkpTA4cbVcaNEfwdPtbzkSnSWFjcee5MquHMHGwU2P+WoAZzk5AF
	RZ6P0DZx86oezk18OollZ/cQA1ZBVylQthyOqlE2RzgqoFZhQBHmuIP01njQnv8orSMK
	zC2Ilg/yRsIUqtMjphUTolUks97vu+Fs7tmw/LZngY7dayRg4nS16Dxd46iGnTLYLGzF
	WsKFCMbMcuY16pBBWYstQCA0qLNHHfSmFUNmR/+u+Pb7kJHL8EPq+KdED1cSQCp72geB
	Wspqr/JjQO9IvarVqVOukgiEuUqR/chpMCA69eFvPqGB7OJDnleK2Aohpg+DSoD1/hB5
	IRdA==
X-Gm-Message-State: ALyK8tIdAC70mdt2lk9yEnDzRLbUt379v/tKuAv82Z6+Z3gJ6n94hkwPh5PW6Yy2JhKDtY3iAio4wZHxN8ujq20m
X-Received: by 10.176.0.146 with SMTP id 18mr5638609uaj.17.1465808714345; Mon,
	13 Jun 2016 02:05:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.97.68 with HTTP; Mon, 13 Jun 2016 02:04:54 -0700 (PDT)
In-Reply-To: <575E5239.6030408@huawei.com>
References: <1464274540-19693-1-git-send-email-peter.maydell@linaro.org>
	<1464274540-19693-12-git-send-email-peter.maydell@linaro.org>
	<575E5239.6030408@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Jun 2016 10:04:54 +0100
Message-ID: <CAFEAcA-B4Mt_+owi7oCyH=qde1Sda2imKEXdtrYfhVq5JtWzdw@mail.gmail.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::233
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 11/22] hw/intc/arm_gicv3:
 Implement GICv3 distributor registers
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
Cc: Patch Tracking <patches@linaro.org>,
	Shlomo Pongratz <shlomo.pongratz@huawei.com>,
	Shlomo Pongratz <shlomopongratz@gmail.com>,
	Pavel Fedin <p.fedin@samsung.com>, QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Shannon Zhao <shannon.zhao@linaro.org>,
	Christoffer Dall <christoffer.dall@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: if1DCvAYUsgJ

On 13 June 2016 at 07:27, Shannon Zhao <zhaoshenglong@huawei.com> wrote:
>
>
> On 2016/5/26 22:55, Peter Maydell wrote:
>> +static uint8_t gicd_read_ipriorityr(GICv3State *s, MemTxAttrs attrs, int irq)
>> +{
>> +    /* Read the value of GICD_IPRIORITYR<n> for the specified interrupt,
>> +     * honouring security state (these are RAZ/WI for Group 0 or Secure
>> +     * Group 1 interrupts).
>> +     */
>> +    uint32_t prio;
>> +
>> +    if (irq < GIC_INTERNAL || irq >= s->num_irq) {
>> +        return 0;
>> +    }
>> +
>> +    prio = s->gicd_ipriority[irq];
>> +
>> +    if (!attrs.secure && !(s->gicd_ctlr & GICD_CTLR_DS)) {
>> +        if (!gicv3_gicd_group_test(s, irq)) {
>> +            /* Fields for Group 0 or Secure Group 1 interrupts are RAZ/WI */
> Here this check assure this interrupt belongs to Group 0 and NS access
> is not permitted, so it should return 0. But it doesn't say anything
> about Secure Group 1.

We're testing the GICD_IGROUPR bit here. If DS is zero (security
enabled), then IGROUPR == 0 means "Group 0 or Secure Group 1", which
is what the comment says we're testing. (If you care which of 0 and S1
it is then you look at IGRPMODR, but for security checks like these
we don't need to.)

>> +            return 0;
>> +        }
>> +        /* NS view of the interrupt priority */
>> +        prio = (prio << 1) & 0xff;
>> +    }
> So maybe here it should check if attrs.secure is true and the Group is
> 1, then return 0.

I'm confused. If attrs.secure is true this is a secure access which
should be allowed to see anything, shouldn't it?

>> +    return prio;
>> +}

thanks
-- PMM
