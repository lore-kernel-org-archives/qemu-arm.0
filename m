Received: by 10.25.85.209 with SMTP id j200csp1105406lfb;
        Mon, 13 Jun 2016 02:42:06 -0700 (PDT)
X-Received: by 10.55.31.72 with SMTP id f69mr13387516qkf.36.1465810926116;
        Mon, 13 Jun 2016 02:42:06 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x77si14702904qgx.58.2016.06.13.02.42.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Jun 2016 02:42:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54773 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bCONg-0005NO-Qh
	for alex.bennee@linaro.org; Mon, 13 Jun 2016 05:42:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47811)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1bCOLl-00044K-GA
	for qemu-devel@nongnu.org; Mon, 13 Jun 2016 05:40:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1bCOLh-0001rQ-6o
	for qemu-devel@nongnu.org; Mon, 13 Jun 2016 05:40:04 -0400
Received: from szxga01-in.huawei.com ([58.251.152.64]:22039)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1bCOLW-0001o2-4v; Mon, 13 Jun 2016 05:40:01 -0400
Received: from 172.24.1.136 (EHLO szxeml432-hub.china.huawei.com)
	([172.24.1.136])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id DMC12850; Mon, 13 Jun 2016 17:35:47 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by szxeml432-hub.china.huawei.com
	(10.82.67.209) with Microsoft SMTP Server id 14.3.235.1;
	Mon, 13 Jun 2016 17:35:38 +0800
Message-ID: <575E7E68.5020001@huawei.com>
Date: Mon, 13 Jun 2016 17:35:36 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1464274540-19693-1-git-send-email-peter.maydell@linaro.org>
	<1464274540-19693-12-git-send-email-peter.maydell@linaro.org>
	<575E5239.6030408@huawei.com>
	<CAFEAcA-B4Mt_+owi7oCyH=qde1Sda2imKEXdtrYfhVq5JtWzdw@mail.gmail.com>
In-Reply-To: <CAFEAcA-B4Mt_+owi7oCyH=qde1Sda2imKEXdtrYfhVq5JtWzdw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A090204.575E7E76.0069, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-06-18 04:22:30, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 22af8b8da73b2aba8ced350f0340812a
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 58.251.152.64
Subject: Re: [Qemu-devel] [PATCH v2 11/22] hw/intc/arm_gicv3: Implement
 GICv3 distributor registers
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
Cc: Patch Tracking <patches@linaro.org>,
	Shlomo Pongratz <shlomo.pongratz@huawei.com>,
	Shlomo Pongratz <shlomopongratz@gmail.com>,
	Pavel Fedin <p.fedin@samsung.com>, QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Shannon Zhao <shannon.zhao@linaro.org>,
	Christoffer Dall <christoffer.dall@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZXMbtppTPGsg



On 2016/6/13 17:04, Peter Maydell wrote:
> On 13 June 2016 at 07:27, Shannon Zhao <zhaoshenglong@huawei.com> wrote:
>> >
>> >
>> > On 2016/5/26 22:55, Peter Maydell wrote:
>>> >> +static uint8_t gicd_read_ipriorityr(GICv3State *s, MemTxAttrs attrs, int irq)
>>> >> +{
>>> >> +    /* Read the value of GICD_IPRIORITYR<n> for the specified interrupt,
>>> >> +     * honouring security state (these are RAZ/WI for Group 0 or Secure
>>> >> +     * Group 1 interrupts).
>>> >> +     */
>>> >> +    uint32_t prio;
>>> >> +
>>> >> +    if (irq < GIC_INTERNAL || irq >= s->num_irq) {
>>> >> +        return 0;
>>> >> +    }
>>> >> +
>>> >> +    prio = s->gicd_ipriority[irq];
>>> >> +
>>> >> +    if (!attrs.secure && !(s->gicd_ctlr & GICD_CTLR_DS)) {
>>> >> +        if (!gicv3_gicd_group_test(s, irq)) {
>>> >> +            /* Fields for Group 0 or Secure Group 1 interrupts are RAZ/WI */
>> > Here this check assure this interrupt belongs to Group 0 and NS access
>> > is not permitted, so it should return 0. But it doesn't say anything
>> > about Secure Group 1.
> We're testing the GICD_IGROUPR bit here. If DS is zero (security
> enabled), then IGROUPR == 0 means "Group 0 or Secure Group 1", which
> is what the comment says we're testing. (If you care which of 0 and S1
> it is then you look at IGRPMODR, but for security checks like these
> we don't need to.)
> 
Oh, right.

-- 
Shannon

