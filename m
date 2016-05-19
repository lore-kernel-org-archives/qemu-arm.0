Received: by 10.25.208.137 with SMTP id h131csp3027448lfg;
        Thu, 19 May 2016 06:29:09 -0700 (PDT)
X-Received: by 10.55.189.132 with SMTP id n126mr14836539qkf.117.1463664549784;
        Thu, 19 May 2016 06:29:09 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c135si12538145qhc.46.2016.05.19.06.29.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 19 May 2016 06:29:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50438 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b3O0j-0007OI-5t
	for alex.bennee@linaro.org; Thu, 19 May 2016 09:29:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38468)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b3Ntl-0000q8-Hc
	for qemu-arm@nongnu.org; Thu, 19 May 2016 09:21:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b3Ntf-0002dx-Mt
	for qemu-arm@nongnu.org; Thu, 19 May 2016 09:21:56 -0400
Received: from mail-vk0-x22b.google.com ([2607:f8b0:400c:c05::22b]:36827)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b3Nte-0002dZ-Vl
	for qemu-arm@nongnu.org; Thu, 19 May 2016 09:21:51 -0400
Received: by mail-vk0-x22b.google.com with SMTP id y2so31592619vka.3
	for <qemu-arm@nongnu.org>; Thu, 19 May 2016 06:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9QqaiKCHQBOWoqAEN8byB128Zvrpzn8xWnKAZ5Pi3MU=;
	b=jGVItBgrxQBzHg2S+uH1Vn/bMdV1yZu6x0qvnaINRnPT9OPTQNgsrffdh9GYZx3JYv
	fyR2oczS3LdyuwBeTQA+/KNvVoSVLyyvis5bmA7o0k2aeG9/ZaSlfg5GVIEAOC5g5RCU
	VHr96ExPFFPgYgvEqvi3wx1vK/51EoJ2k/rrM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9QqaiKCHQBOWoqAEN8byB128Zvrpzn8xWnKAZ5Pi3MU=;
	b=HK0cbtmGD7vzA5/uxZvaOujP17SRoVMo5+7TtaXdreZmKKJv4S6BnaCtA2mNAH3sMY
	Tjg/nP9dSyN/CrPkMcGCsos+zEj8XumeEBJ5KI5B7ziH/y8NXXGgfCwa4bxxYd8WU/no
	W/GcT0FXXQrk8oe8k9E2HFDoh+ZsxoxsmTCQsPqqq0AVWV+WM07irbhxhZ1NXXXDY6Wp
	ORCWTeT0y+GpY4stv5Ut6ZLFku3wCSWsL9Pro9pasRmXUqxNpaXUvphVIOAyEL+g+bh/
	2EZ87dJ9AGlembpwbzIneyDnV5UrMvMR0nuCMCqxLSmGWPcXGzBEUghsZuebGg7QLO/I
	yEBA==
X-Gm-Message-State: AOPr4FXk7djbUHNXivnGb0jIfWcMqr7xcOvdJFSj2WbJTO2pPPHmWme1w9KqAXc9UK7jobSh4MLZOyYKkgUlqUHC
X-Received: by 10.176.0.182 with SMTP id 51mr7374865uaj.4.1463664110553; Thu,
	19 May 2016 06:21:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Thu, 19 May 2016 06:21:31 -0700 (PDT)
In-Reply-To: <573DB8A2.1000701@huawei.com>
References: <1462814989-24360-1-git-send-email-peter.maydell@linaro.org>
	<1462814989-24360-11-git-send-email-peter.maydell@linaro.org>
	<573DB8A2.1000701@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 May 2016 14:21:31 +0100
Message-ID: <CAFEAcA93G2YF2M2X3cQQnMkb5V9uY0kOk-s36uwgOuVFY85Cgw@mail.gmail.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22b
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 10/23] hw/intc/arm_gicv3:
 Implement functions to identify next pending irq
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
X-TUID: i4ppquaCRLtn

On 19 May 2016 at 13:59, Shannon Zhao <zhaoshenglong@huawei.com> wrote:
>
>
> On 2016/5/10 1:29, Peter Maydell wrote:
>> +    uint32_t pend, grpmask;
>> +    uint32_t pending = *gic_bmp_ptr32(s->pending, irq - GIC_INTERNAL);
>> +    uint32_t edge_trigger = *gic_bmp_ptr32(s->edge_trigger, irq - GIC_INTERNAL);
>> +    uint32_t level = *gic_bmp_ptr32(s->level, irq - GIC_INTERNAL);
>> +    uint32_t group = *gic_bmp_ptr32(s->group, irq - GIC_INTERNAL);
>> +    uint32_t grpmod = *gic_bmp_ptr32(s->grpmod, irq - GIC_INTERNAL);
>> +    uint32_t enable = *gic_bmp_ptr32(s->enabled, irq - GIC_INTERNAL);
>> +
> Since you use "irq - GIC_INTERNAL" many times, how about moving into the
> gic_bmp_ptr32()?

The bmp* functions are supposed to be generic (with APIs matching
the bitmap.h ones), so passing it X should give you bit X in the bitmap.

Maybe it would be less confusing to make the bitmaps all have 32 unused
bits at the start, so the bit for interrupt X is bit X in the bitmap...
That only costs us five words of memory per CPU, so it seems worth
it for the code clarity and avoiding annoying bugs.

>>  /**
>> + * gicv3_irq_group:
>> + *
>> + * Return the group which this interrupt is configured as (GICV3_G0,
>> + * GICV3_G1 or GICV3_G1NS).
>> + */
>> +static inline int gicv3_irq_group(GICv3State *s, GICv3CPUState *cs, int irq)
> use uint32_t instead of int in this and other functions?

Neither interrupt numbers nor group numbers are particularly
large or specifically 32-bit, so 'int' seemed the most reasonable
type to use.

thanks
-- PMM
