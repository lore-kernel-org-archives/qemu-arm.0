Received: by 2002:adf:fd4f:0:0:0:0:0 with SMTP id h15csp1170362wrs;
        Tue, 12 Mar 2019 20:16:51 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyEkIZ4DuBpRimBtqq/6uXcChNNvop4CN+6QgaTQifi2SRD5vnMH3fFdKOr5lwNpzWytAxP
X-Received: by 2002:a81:9484:: with SMTP id l126mr477347ywg.209.1552447011858;
        Tue, 12 Mar 2019 20:16:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552447011; cv=none;
        d=google.com; s=arc-20160816;
        b=ZvrcIGQNm0H/JYgsB25YYPYmM7WYTkAdZBSyjq3S+K2lpjgRMnRIyzIVsSo5FM32e5
         72rcq2fOxEtS+mT3ZYcorx4oMJr9/Fj5VXWLHjBLNLhaiT7CZ4frHNZBTos/fIsjq7cX
         vwEr2Z0l3WLB1pdXIHPAon6OaAoQvCsygOuXs7ptjCFpiKmWbFchL7wHUpphzudgcb8Q
         vrUmZ0GfEBMwcphJnvsvK6yRz8bchHJ+oZnJk3PlHQ0n5YR45GuLNV9i2TjHQ4uYtMVh
         O3aqt7vkMlS4x3h8nq0xRsvtvLjemr6RzRLTxYOiKT0SiZ4O+wlMPbIIlj+r83GAplVu
         L4sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=GiiaO4EZedTRTQC9hWhVASn8bqVtSqiIYX5jlyyi1og=;
        b=qZxFts0dtPkWc7Rq9Coivhwu2db0G2xhilnNn0jNe20wU2PlEeCrccERiSHdkYZMg7
         bHszr5pjDfaLf9gPYL/AQu/OHVy1OS06wSvoi14vS8C+VXPr6ZqpPw6C+gG+5R3WzeqF
         cVPjc6bu6KKddZZUhyqSR+9jndqT11l5XKUIgEsMk+/6uuIKi7B2WhmXBzLnp3dnuXBr
         IcFgwmviFbmMSaR/AQo2J4mrITT+2WTJDPBuU1Ob5aPkt3jG+Z5rG3ERvph/yl4D7HPP
         4E4W2QX98ELCKGefnraJeBOr4e6ou27sNrsoCIqGmJ41DFxJOz/Du7zEaVH8wZrUqx+G
         +wcA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p206si6031059yba.350.2019.03.12.20.16.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Mar 2019 20:16:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:37347 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h3uNv-0002BW-8h
	for alex.bennee@linaro.org; Tue, 12 Mar 2019 23:16:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52974)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1h3u4y-0002Tk-Sq
	for qemu-arm@nongnu.org; Tue, 12 Mar 2019 22:57:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1h3tqu-0005kE-JT
	for qemu-arm@nongnu.org; Tue, 12 Mar 2019 22:42:46 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:2193 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <gengdongjiu@huawei.com>)
	id 1h3tqt-0005d1-U5; Tue, 12 Mar 2019 22:42:44 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id 787CB8939A1192A8AE38;
	Wed, 13 Mar 2019 10:42:39 +0800 (CST)
Received: from [127.0.0.1] (10.142.68.147) by DGGEMS406-HUB.china.huawei.com
	(10.3.19.206) with Microsoft SMTP Server id 14.3.408.0; Wed, 13 Mar 2019
	10:42:29 +0800
To: <peter.maydell@linaro.org>, <qemu-arm@nongnu.org>,
	<qemu-devel@nongnu.org>, <richard.henderson@linaro.org>
References: <1552395177-12608-1-git-send-email-gengdongjiu@huawei.com>
From: gengdongjiu <gengdongjiu@huawei.com>
Message-ID: <1dc2936c-6180-c743-fd88-aef3dea5dd6a@huawei.com>
Date: Wed, 13 Mar 2019 10:42:21 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1552395177-12608-1-git-send-email-gengdongjiu@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.142.68.147]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.190
Subject: Re: [Qemu-arm] [PATCH V3] target/arm: change arch timer registers
 access permission
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
Cc: wangnan0@huawei.com, chenguoping@huawei.com, wuyuming3@huawei.com,
	larkin.zhanglixin@huawei.com, linqiangmin@huawei.com, liuyutao2@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FQeG9tSJbR8w

Add "Reviewed-by" from Richard because Richard has reviewed it in patch v2[1], thanks.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

[1]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg604509.html

On 2019/3/12 20:52, Dongjiu Geng wrote:
> Some generic arch timer registers are Config-RW in the EL0,
> which means the EL0 exception level can have write permission
> if it is appropriately configured.
> 
> When VM access registers, QEMU firstly checks whether they have RW
> permission, then check whether it is appropriately configured.
> If they are defined to read only in EL0, even though they have been
> appropriately configured, they still do not have write permission.
> So need to add the write permission according to ARMV8 spec when
> define it.
> 
> Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
> ---
> Change since V2:
> 1. Change 'Ready only' to 'read only' in the comments
> 
> Change since V1:
> 1. Change 'PL1_RW | RL0_RW' to PL0_RW because PL0_RW implied that the higher PLx all have RW permission
> 
> When VM kernel or Hypervisor configures the timer registers to RW in EL0
> user space, it will still have below panic when EL0 user space access
> the timer registers.
> 
> [INFO ]@(el0_sync:60): UNIMPLEMENTED, esr=2000000
> [INFO ]@(unimpl_exception:88): KERNEL UNIMPLEMENTED EXCEPTION
> [INFO ]@(unimpl_exception:98): FAR=0000000000000000, ESR=02000000 (EC=0x0, IL=0x1, ISS=0x0)
> [INFO ]@(dump_registers:64): KERNEL REGISTERS
> [INFO ]@(dump_registers:68): X0=00000000f52b7d50 X1=00000000040d5040
> [INFO ]@(dump_registers:68): X2=0000004000033e10 X3=0000000000000000
> [INFO ]@(dump_registers:68): X4=000000007fffffff X5=0000000000000020
> [INFO ]@(dump_registers:68): X6=0000000000000020 X7=000000000c00b030
> ---
>  target/arm/helper.c | 30 +++++++++++++++---------------
>  1 file changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 2607d39..c8d3c21 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -2665,7 +2665,7 @@ static const ARMCPRegInfo generic_timer_cp_reginfo[] = {
>      /* per-timer control */
>      { .name = "CNTP_CTL", .cp = 15, .crn = 14, .crm = 2, .opc1 = 0, .opc2 = 1,
>        .secure = ARM_CP_SECSTATE_NS,
> -      .type = ARM_CP_IO | ARM_CP_ALIAS, .access = PL1_RW | PL0_R,
> +      .type = ARM_CP_IO | ARM_CP_ALIAS, .access = PL0_RW,
>        .accessfn = gt_ptimer_access,
>        .fieldoffset = offsetoflow32(CPUARMState,
>                                     cp15.c14_timer[GTIMER_PHYS].ctl),
> @@ -2674,7 +2674,7 @@ static const ARMCPRegInfo generic_timer_cp_reginfo[] = {
>      { .name = "CNTP_CTL_S",
>        .cp = 15, .crn = 14, .crm = 2, .opc1 = 0, .opc2 = 1,
>        .secure = ARM_CP_SECSTATE_S,
> -      .type = ARM_CP_IO | ARM_CP_ALIAS, .access = PL1_RW | PL0_R,
> +      .type = ARM_CP_IO | ARM_CP_ALIAS, .access = PL0_RW,
>        .accessfn = gt_ptimer_access,
>        .fieldoffset = offsetoflow32(CPUARMState,
>                                     cp15.c14_timer[GTIMER_SEC].ctl),
> @@ -2682,14 +2682,14 @@ static const ARMCPRegInfo generic_timer_cp_reginfo[] = {
>      },
>      { .name = "CNTP_CTL_EL0", .state = ARM_CP_STATE_AA64,
>        .opc0 = 3, .opc1 = 3, .crn = 14, .crm = 2, .opc2 = 1,
> -      .type = ARM_CP_IO, .access = PL1_RW | PL0_R,
> +      .type = ARM_CP_IO, .access = PL0_RW,
>        .accessfn = gt_ptimer_access,
>        .fieldoffset = offsetof(CPUARMState, cp15.c14_timer[GTIMER_PHYS].ctl),
>        .resetvalue = 0,
>        .writefn = gt_phys_ctl_write, .raw_writefn = raw_write,
>      },
>      { .name = "CNTV_CTL", .cp = 15, .crn = 14, .crm = 3, .opc1 = 0, .opc2 = 1,
> -      .type = ARM_CP_IO | ARM_CP_ALIAS, .access = PL1_RW | PL0_R,
> +      .type = ARM_CP_IO | ARM_CP_ALIAS, .access = PL0_RW,
>        .accessfn = gt_vtimer_access,
>        .fieldoffset = offsetoflow32(CPUARMState,
>                                     cp15.c14_timer[GTIMER_VIRT].ctl),
> @@ -2697,7 +2697,7 @@ static const ARMCPRegInfo generic_timer_cp_reginfo[] = {
>      },
>      { .name = "CNTV_CTL_EL0", .state = ARM_CP_STATE_AA64,
>        .opc0 = 3, .opc1 = 3, .crn = 14, .crm = 3, .opc2 = 1,
> -      .type = ARM_CP_IO, .access = PL1_RW | PL0_R,
> +      .type = ARM_CP_IO, .access = PL0_RW,
>        .accessfn = gt_vtimer_access,
>        .fieldoffset = offsetof(CPUARMState, cp15.c14_timer[GTIMER_VIRT].ctl),
>        .resetvalue = 0,
> @@ -2706,31 +2706,31 @@ static const ARMCPRegInfo generic_timer_cp_reginfo[] = {
>      /* TimerValue views: a 32 bit downcounting view of the underlying state */
>      { .name = "CNTP_TVAL", .cp = 15, .crn = 14, .crm = 2, .opc1 = 0, .opc2 = 0,
>        .secure = ARM_CP_SECSTATE_NS,
> -      .type = ARM_CP_NO_RAW | ARM_CP_IO, .access = PL1_RW | PL0_R,
> +      .type = ARM_CP_NO_RAW | ARM_CP_IO, .access = PL0_RW,
>        .accessfn = gt_ptimer_access,
>        .readfn = gt_phys_tval_read, .writefn = gt_phys_tval_write,
>      },
>      { .name = "CNTP_TVAL_S",
>        .cp = 15, .crn = 14, .crm = 2, .opc1 = 0, .opc2 = 0,
>        .secure = ARM_CP_SECSTATE_S,
> -      .type = ARM_CP_NO_RAW | ARM_CP_IO, .access = PL1_RW | PL0_R,
> +      .type = ARM_CP_NO_RAW | ARM_CP_IO, .access = PL0_RW,
>        .accessfn = gt_ptimer_access,
>        .readfn = gt_sec_tval_read, .writefn = gt_sec_tval_write,
>      },
>      { .name = "CNTP_TVAL_EL0", .state = ARM_CP_STATE_AA64,
>        .opc0 = 3, .opc1 = 3, .crn = 14, .crm = 2, .opc2 = 0,
> -      .type = ARM_CP_NO_RAW | ARM_CP_IO, .access = PL1_RW | PL0_R,
> +      .type = ARM_CP_NO_RAW | ARM_CP_IO, .access = PL0_RW,
>        .accessfn = gt_ptimer_access, .resetfn = gt_phys_timer_reset,
>        .readfn = gt_phys_tval_read, .writefn = gt_phys_tval_write,
>      },
>      { .name = "CNTV_TVAL", .cp = 15, .crn = 14, .crm = 3, .opc1 = 0, .opc2 = 0,
> -      .type = ARM_CP_NO_RAW | ARM_CP_IO, .access = PL1_RW | PL0_R,
> +      .type = ARM_CP_NO_RAW | ARM_CP_IO, .access = PL0_RW,
>        .accessfn = gt_vtimer_access,
>        .readfn = gt_virt_tval_read, .writefn = gt_virt_tval_write,
>      },
>      { .name = "CNTV_TVAL_EL0", .state = ARM_CP_STATE_AA64,
>        .opc0 = 3, .opc1 = 3, .crn = 14, .crm = 3, .opc2 = 0,
> -      .type = ARM_CP_NO_RAW | ARM_CP_IO, .access = PL1_RW | PL0_R,
> +      .type = ARM_CP_NO_RAW | ARM_CP_IO, .access = PL0_RW,
>        .accessfn = gt_vtimer_access, .resetfn = gt_virt_timer_reset,
>        .readfn = gt_virt_tval_read, .writefn = gt_virt_tval_write,
>      },
> @@ -2758,7 +2758,7 @@ static const ARMCPRegInfo generic_timer_cp_reginfo[] = {
>      /* Comparison value, indicating when the timer goes off */
>      { .name = "CNTP_CVAL", .cp = 15, .crm = 14, .opc1 = 2,
>        .secure = ARM_CP_SECSTATE_NS,
> -      .access = PL1_RW | PL0_R,
> +      .access = PL0_RW,
>        .type = ARM_CP_64BIT | ARM_CP_IO | ARM_CP_ALIAS,
>        .fieldoffset = offsetof(CPUARMState, cp15.c14_timer[GTIMER_PHYS].cval),
>        .accessfn = gt_ptimer_access,
> @@ -2766,7 +2766,7 @@ static const ARMCPRegInfo generic_timer_cp_reginfo[] = {
>      },
>      { .name = "CNTP_CVAL_S", .cp = 15, .crm = 14, .opc1 = 2,
>        .secure = ARM_CP_SECSTATE_S,
> -      .access = PL1_RW | PL0_R,
> +      .access = PL0_RW,
>        .type = ARM_CP_64BIT | ARM_CP_IO | ARM_CP_ALIAS,
>        .fieldoffset = offsetof(CPUARMState, cp15.c14_timer[GTIMER_SEC].cval),
>        .accessfn = gt_ptimer_access,
> @@ -2774,14 +2774,14 @@ static const ARMCPRegInfo generic_timer_cp_reginfo[] = {
>      },
>      { .name = "CNTP_CVAL_EL0", .state = ARM_CP_STATE_AA64,
>        .opc0 = 3, .opc1 = 3, .crn = 14, .crm = 2, .opc2 = 2,
> -      .access = PL1_RW | PL0_R,
> +      .access = PL0_RW,
>        .type = ARM_CP_IO,
>        .fieldoffset = offsetof(CPUARMState, cp15.c14_timer[GTIMER_PHYS].cval),
>        .resetvalue = 0, .accessfn = gt_ptimer_access,
>        .writefn = gt_phys_cval_write, .raw_writefn = raw_write,
>      },
>      { .name = "CNTV_CVAL", .cp = 15, .crm = 14, .opc1 = 3,
> -      .access = PL1_RW | PL0_R,
> +      .access = PL0_RW,
>        .type = ARM_CP_64BIT | ARM_CP_IO | ARM_CP_ALIAS,
>        .fieldoffset = offsetof(CPUARMState, cp15.c14_timer[GTIMER_VIRT].cval),
>        .accessfn = gt_vtimer_access,
> @@ -2789,7 +2789,7 @@ static const ARMCPRegInfo generic_timer_cp_reginfo[] = {
>      },
>      { .name = "CNTV_CVAL_EL0", .state = ARM_CP_STATE_AA64,
>        .opc0 = 3, .opc1 = 3, .crn = 14, .crm = 3, .opc2 = 2,
> -      .access = PL1_RW | PL0_R,
> +      .access = PL0_RW,
>        .type = ARM_CP_IO,
>        .fieldoffset = offsetof(CPUARMState, cp15.c14_timer[GTIMER_VIRT].cval),
>        .resetvalue = 0, .accessfn = gt_vtimer_access,
> 

