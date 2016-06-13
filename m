Received: by 10.25.85.209 with SMTP id j200csp1043033lfb;
        Sun, 12 Jun 2016 23:30:18 -0700 (PDT)
X-Received: by 10.55.200.152 with SMTP id t24mr13462383qkl.197.1465799418382;
        Sun, 12 Jun 2016 23:30:18 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d73si14261653qke.270.2016.06.12.23.30.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 12 Jun 2016 23:30:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54027 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bCLO5-000570-Sk
	for alex.bennee@linaro.org; Mon, 13 Jun 2016 02:30:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36412)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1bCLNC-0004pk-Gf
	for qemu-devel@nongnu.org; Mon, 13 Jun 2016 02:29:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1bCLN9-0004Vs-Bi
	for qemu-devel@nongnu.org; Mon, 13 Jun 2016 02:29:22 -0400
Received: from szxga01-in.huawei.com ([58.251.152.64]:16878)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1bCLM6-0004AU-Vx; Mon, 13 Jun 2016 02:29:19 -0400
Received: from 172.24.1.136 (EHLO szxeml433-hub.china.huawei.com)
	([172.24.1.136])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id DMB67378; Mon, 13 Jun 2016 14:27:16 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by szxeml433-hub.china.huawei.com
	(10.82.67.210) with Microsoft SMTP Server id 14.3.235.1;
	Mon, 13 Jun 2016 14:27:08 +0800
Message-ID: <575E5239.6030408@huawei.com>
Date: Mon, 13 Jun 2016 14:27:05 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>, <qemu-arm@nongnu.org>,
	<qemu-devel@nongnu.org>
References: <1464274540-19693-1-git-send-email-peter.maydell@linaro.org>
	<1464274540-19693-12-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1464274540-19693-12-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A090204.575E524D.0029, ss=1, re=0.000, recu=0.000,
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
Cc: patches@linaro.org, Shlomo Pongratz <shlomo.pongratz@huawei.com>,
	Shlomo Pongratz <shlomopongratz@gmail.com>,
	Pavel Fedin <p.fedin@samsung.com>, Shannon Zhao <shannon.zhao@linaro.org>,
	Christoffer Dall <christoffer.dall@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: inDiN+EsuGO7



On 2016/5/26 22:55, Peter Maydell wrote:
> +static uint8_t gicd_read_ipriorityr(GICv3State *s, MemTxAttrs attrs, int irq)
> +{
> +    /* Read the value of GICD_IPRIORITYR<n> for the specified interrupt,
> +     * honouring security state (these are RAZ/WI for Group 0 or Secure
> +     * Group 1 interrupts).
> +     */
> +    uint32_t prio;
> +
> +    if (irq < GIC_INTERNAL || irq >= s->num_irq) {
> +        return 0;
> +    }
> +
> +    prio = s->gicd_ipriority[irq];
> +
> +    if (!attrs.secure && !(s->gicd_ctlr & GICD_CTLR_DS)) {
> +        if (!gicv3_gicd_group_test(s, irq)) {
> +            /* Fields for Group 0 or Secure Group 1 interrupts are RAZ/WI */
Here this check assure this interrupt belongs to Group 0 and NS access
is not permitted, so it should return 0. But it doesn't say anything
about Secure Group 1.

> +            return 0;
> +        }
> +        /* NS view of the interrupt priority */
> +        prio = (prio << 1) & 0xff;
> +    }
So maybe here it should check if attrs.secure is true and the Group is
1, then return 0.

> +    return prio;
> +}
> +
> +static void gicd_write_ipriorityr(GICv3State *s, MemTxAttrs attrs, int irq,
> +                                  uint8_t value)
> +{
> +    /* Write the value of GICD_IPRIORITYR<n> for the specified interrupt,
> +     * honouring security state (these are RAZ/WI for Group 0 or Secure
> +     * Group 1 interrupts).
> +     */
> +    if (irq < GIC_INTERNAL || irq >= s->num_irq) {
> +        return;
> +    }
> +
> +    if (!attrs.secure && !(s->gicd_ctlr & GICD_CTLR_DS)) {
> +        if (!gicv3_gicd_group_test(s, irq)) {
> +            /* Fields for Group 0 or Secure Group 1 interrupts are RAZ/WI */
Same here.

> +            return;
> +        }
> +        /* NS view of the interrupt priority */
> +        value = 0x80 | (value >> 1);
> +    }
> +    s->gicd_ipriority[irq] = value;
> +}

-- 
Shannon

