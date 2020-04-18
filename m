Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp1261203lfm;
        Fri, 17 Apr 2020 20:22:57 -0700 (PDT)
X-Google-Smtp-Source: APiQypLBxv6xwAr6P/9vz4h9CvScqkvSQT5LetC1tt54RU47vg1zLsGZAsrzwcPCyptnA/nopuVy
X-Received: by 2002:a37:c0d:: with SMTP id 13mr6437934qkm.25.1587180176960;
        Fri, 17 Apr 2020 20:22:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587180176; cv=none;
        d=google.com; s=arc-20160816;
        b=QkDR9x2VfPhSHOYOqFtmOGdmHKKLlSzH+PVHVoO+eXiSLwD9XPcO1GTsrIVKTICIHF
         FRz0nXFOlc34Ek+2q9CpmQb52z0ybZCNZUmjem6NmMv1ExE+W0j6gbWjRMR1KPbOWdfw
         M70UHmQd7rJyA7p6YeI5zcGPuE3KM+E+Je7pndeNrFvvWGEsi/pN/7m/qJLyIxpvQHV1
         WFqC/1RLU43mtOPqRruaRsMiRRZ34Tv/a3wr4Y+fNefQYCFp8pL+Y8DIy10B1wM67sx7
         NtO03fh0lUsieHSy7o7NEggRFKiBuUdRFJrc208tMWkNBjo84ASScwhXu/GYbjEgY+Dv
         Uuiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :to:subject;
        bh=NN7wPVv3DLXfKZD9h+MwdMPfsXwbVPgx6BUrULyy7uo=;
        b=Hh7jEyoYB1y9wDQqShWYDKTSJaAYVfz0V//peV1/nnTiEeNbnqpRE1n7tHuB4sUDnJ
         g7UuSIN+1kBX5TKGCY5W3Ak0xWKUTWhHThMAQ/bZM+g8vwjSDocEDz2X9lVU446S2Yfb
         x1ATwRZQReKbP9WL0A9KAiZuimOJ8r43UeDie3I6qRKD+NOTm1TfZJIQlcfboT3z4wz6
         g10de3bjYn4E9f3yUx5ky358yInf2JX2i5VFZAhwchW2Xo5jEINZQBnxdP2JvlCJDU4H
         2PEZkdWjb+LDYIeVqxu5V0J/H0BbiwWdIzYrmsE3eXo2cAgrp6dqwVuK+Fy0J1jrguEL
         U70g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 14si11394256qtp.272.2020.04.17.20.22.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Apr 2020 20:22:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:54352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jPe4G-00052V-6o
	for alex.bennee@linaro.org; Fri, 17 Apr 2020 23:22:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44783)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhukeqian1@huawei.com>) id 1jPe44-00052C-CI
 for qemu-arm@nongnu.org; Fri, 17 Apr 2020 23:22:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhukeqian1@huawei.com>) id 1jPe40-0002YF-NM
 for qemu-arm@nongnu.org; Fri, 17 Apr 2020 23:22:42 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:3672 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhukeqian1@huawei.com>)
 id 1jPe3y-0002O2-G3; Fri, 17 Apr 2020 23:22:39 -0400
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id B2ABCFFFF7C2FECB6CBD;
 Sat, 18 Apr 2020 11:22:28 +0800 (CST)
Received: from [127.0.0.1] (10.173.221.230) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.487.0;
 Sat, 18 Apr 2020 11:22:21 +0800
Subject: Re: [PATCH 2/3] intc/gicv3_kvm: use kvm_gicc_access to get
 ICC_CTLR_EL1
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200413091552.62748-1-zhukeqian1@huawei.com>
 <20200413091552.62748-3-zhukeqian1@huawei.com>
 <CAFEAcA9iUAtVvuv_8AOm0TkYzDD54QHZEL_DKRv_b_YpaVTJ_g@mail.gmail.com>
From: zhukeqian <zhukeqian1@huawei.com>
Message-ID: <4d163384-ea47-17fb-9575-bcfdfa05b05e@huawei.com>
Date: Sat, 18 Apr 2020 11:22:19 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9iUAtVvuv_8AOm0TkYzDD54QHZEL_DKRv_b_YpaVTJ_g@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.173.221.230]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.190
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: wanghaibin.wang@huawei.com, Igor Mammedov <imammedo@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: K2VaFQgIPD8W

Hi Peter,

On 2020/4/17 19:09, Peter Maydell wrote:
> On Mon, 13 Apr 2020 at 10:18, Keqian Zhu <zhukeqian1@huawei.com> wrote:
>>
>> Replace kvm_device_access with kvm_gicc_access to simplify
>> code.
>>
>> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
>> ---
>>  hw/intc/arm_gicv3_kvm.c | 5 ++---
>>  1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
>> index ca43bf87ca..85f6420498 100644
>> --- a/hw/intc/arm_gicv3_kvm.c
>> +++ b/hw/intc/arm_gicv3_kvm.c
>> @@ -678,9 +678,8 @@ static void arm_gicv3_icc_reset(CPUARMState *env, const ARMCPRegInfo *ri)
>>      }
>>
>>      /* Initialize to actual HW supported configuration */
>> -    kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_CPU_SYSREGS,
>> -                      KVM_VGIC_ATTR(ICC_CTLR_EL1, c->gicr_typer),
>> -                      &c->icc_ctlr_el1[GICV3_NS], false, &error_abort);
>> +    kvm_gicc_access(s, ICC_CTLR_EL1, c->cpu->cpu_index,
>> +                    &c->icc_ctlr_el1[GICV3_NS], false);
> 
> This works at the moment, but I'd rather we avoided looking into
> cpu->cpu_index inside the GIC code. The cpu_index is the overall
> index of the CPU of all CPUs in the system, which is not in
> theory the same as "index of this CPU for this GIC". The two
> currently match up because arm_gicv3_common_realize() populates
> its s->cpu[i].cpu by calling qemu_get_cpu(i), but in future
> we might change that code (eg so that the board code has to
> explicitly wire up the CPUs to the GIC object by passing
> pointers to the CPUs to the GIC via link properties). So I'd
> rather not have the internals of the GIC code bake in the
> assumption that 'global CPU index is the same as the index
> of the CPU for this GIC object'.
OK, I get it. This patch can be ignored.
> 
> (All the other places that call kvm_gicc_access() are doing it
> as part of a loop from 0 to n->num_cpus, so they don't have this
> issue.)
> 
> thanks
> -- PMM
> 
> .
> 
Thanks,
Keqian

