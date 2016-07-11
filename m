Received: by 10.25.21.156 with SMTP id 28csp1582092lfv;
        Mon, 11 Jul 2016 10:39:32 -0700 (PDT)
X-Received: by 10.55.204.3 with SMTP id r3mr27797735qki.91.1468258772476;
        Mon, 11 Jul 2016 10:39:32 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l32si751560qtl.100.2016.07.11.10.39.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Jul 2016 10:39:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35221 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bMfB5-0000hO-Ti
	for alex.bennee@linaro.org; Mon, 11 Jul 2016 13:39:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57400)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bMfAz-0000eu-53
	for qemu-arm@nongnu.org; Mon, 11 Jul 2016 13:39:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bMfAw-0004h3-SO
	for qemu-arm@nongnu.org; Mon, 11 Jul 2016 13:39:24 -0400
Received: from mail-vk0-x234.google.com ([2607:f8b0:400c:c05::234]:34858)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bMfAw-0004gY-GV
	for qemu-arm@nongnu.org; Mon, 11 Jul 2016 13:39:22 -0400
Received: by mail-vk0-x234.google.com with SMTP id v6so148829125vkb.2
	for <qemu-arm@nongnu.org>; Mon, 11 Jul 2016 10:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=4dDF66PPTF1PCv3MgpDQl0YHMoP/zGwJMrHf4Z66UVM=;
	b=Uh4PeFJtQJLTwlWGUVVBSr+ZjmAFc8CFIJqeJWu9TizxkykYuU2cH8a/M9Fpgfq+HY
	0+3VCorMmXdIlQfWmVFrt8KfRxUZ6BaWAHIBwzpq9H2TCNTEPN1lMO615y4P8UJSfCdG
	+xFIS23Zs/ZYvawSzPhHFEbm7PoZQyR/eRec8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=4dDF66PPTF1PCv3MgpDQl0YHMoP/zGwJMrHf4Z66UVM=;
	b=UoThcfLEXo6jT3GFHw5hCaoqRuAGzOvUdqTNvN111dxOb8e0idxvYosk0IGg5SEc3K
	ARI+5esLsS02alunn6uW5qlVuvBBcoLgs8eblLNkOkAmFFsAoHnXS2NYKwyTA9KKohHP
	rm1trq2V6PhdHXsI73yxgSpPg4zxBqvXUmzFCxsyQXrkb3Jm9oIbrTsKZtRXcaHBhhr6
	FDZvn49lpfhjRy5+ZKoYWDKd13MpfZcv7mYU2pwEbZyKcJSzbh4T2ATpYRWGzjjVVtxG
	fY1ozl5R4MV8TeiyfIIel9sHd6x47sxgqXzMqmKRYopLupDPKTvpJOObc0vcDsDQv5uu
	AhmA==
X-Gm-Message-State: ALyK8tI7hMA7GrIjRFPjSFFQUo5wEkJaSXbjtEJmjbOepPvmyYBpRcBuobboF9Az1MRjpgua6LUJs8gVKTEmbOtu
X-Received: by 10.176.65.71 with SMTP id j65mr9870174uad.103.1468258761586;
	Mon, 11 Jul 2016 10:39:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.137.69 with HTTP; Mon, 11 Jul 2016 10:39:02 -0700 (PDT)
In-Reply-To: <1466694717-556963-1-git-send-email-afarallax@yandex.ru>
References: <1466694717-556963-1-git-send-email-afarallax@yandex.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Jul 2016 18:39:02 +0100
Message-ID: <CAFEAcA8mTv4LJh2WO5chuga+ZqAEWkzTeoTn8M4t+K5LGGnhNQ@mail.gmail.com>
To: Sergey Sorokin <afarallax@yandex.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::234
Subject: Re: [Qemu-arm] [PATCH] target-arm: Add missed AArch32 TLBI sytem
 registers
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6/BpI1XkLdtM

On 23 June 2016 at 16:11, Sergey Sorokin <afarallax@yandex.ru> wrote:
> Some PL2 related TLBI system registers are missed in AArch32
> implementation. The patch fixes it.
>
> Signed-off-by: Sergey Sorokin <afarallax@yandex.ru>
> ---
>  target-arm/helper.c | 148 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 148 insertions(+)

Apologies for the delayed review, I think I missed this patch and
failed to put it in my to-review queue.

A couple of minor points below but most of this is good.

> +static void tlbimva_hyp_write(CPUARMState *env, const ARMCPRegInfo *ri,
> +                              uint64_t value)
> +{
> +    CPUState *cs = ENV_GET_CPU(env);
> +
> +    tlb_flush_page_by_mmuidx(cs, value & TARGET_PAGE_MASK, ARMMMUIdx_S1E2, -1);

TARGET_PAGE_MASK isn't what you think it is (TARGET_PAGE_BITS is only 10).
You need to do something that's definitely a 12 bit mask (use extract32,
or MAKE_64BIT_MASK, or a literal, I don't care much).

> +}
> +
> +static void tlbimva_hyp_is_write(CPUARMState *env, const ARMCPRegInfo *ri,
> +                                 uint64_t value)
> +{
> +    CPUState *other_cs;
> +    uint64_t pageaddr = value & TARGET_PAGE_MASK;

Ditto.

> +
> +    CPU_FOREACH(other_cs) {
> +        tlb_flush_page_by_mmuidx(other_cs, pageaddr, ARMMMUIdx_S1E2, -1);
> +    }
> +}
> +
>  static const ARMCPRegInfo cp_reginfo[] = {
>      /* Define the secure and non-secure FCSE identifier CP registers
>       * separately because there is no secure bank in V8 (no _EL3).  This allows
> @@ -1238,6 +1343,14 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
>        .type = ARM_CP_NO_RAW, .access = PL1_W, .writefn = tlbiasid_write },
>      { .name = "TLBIMVAA", .cp = 15, .opc1 = 0, .crn = 8, .crm = 7, .opc2 = 3,
>        .type = ARM_CP_NO_RAW, .access = PL1_W, .writefn = tlbimvaa_write },
> +    { .name = "TLBIALLNSNH",
> +      .cp = 15, .opc1 = 4, .crn = 8, .crm = 7, .opc2 = 4,
> +      .type = ARM_CP_NO_RAW, .access = PL2_W,
> +      .writefn = tlbiall_nsnh_write },
> +    { .name = "TLBIALLNSNHIS",
> +      .cp = 15, .opc1 = 4, .crn = 8, .crm = 3, .opc2 = 4,
> +      .type = ARM_CP_NO_RAW, .access = PL2_W,
> +      .writefn = tlbiall_nsnh_is_write },

These don't exist on v7 unless the virtualization extensions are present
(though they do exist on v8 without EL3).

>      REGINFO_SENTINEL
>  };
>
> @@ -3273,6 +3386,22 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
>        .type = ARM_CP_NO_RAW, .access = PL1_W, .writefn = tlbimva_write },
>      { .name = "TLBIMVAAL", .cp = 15, .opc1 = 0, .crn = 8, .crm = 7, .opc2 = 7,
>        .type = ARM_CP_NO_RAW, .access = PL1_W, .writefn = tlbimvaa_write },
> +    { .name = "TLBIIPAS2",
> +      .cp = 15, .opc1 = 4, .crn = 8, .crm = 4, .opc2 = 1,
> +      .type = ARM_CP_NO_RAW, .access = PL2_W,
> +      .writefn = tlbiipas2_write },
> +    { .name = "TLBIIPAS2IS",
> +      .cp = 15, .opc1 = 4, .crn = 8, .crm = 0, .opc2 = 1,
> +      .type = ARM_CP_NO_RAW, .access = PL2_W,
> +      .writefn = tlbiipas2_is_write },
> +    { .name = "TLBIIPAS2L",
> +      .cp = 15, .opc1 = 4, .crn = 8, .crm = 4, .opc2 = 5,
> +      .type = ARM_CP_NO_RAW, .access = PL2_W,
> +      .writefn = tlbiipas2_write },
> +    { .name = "TLBIIPAS2LIS",
> +      .cp = 15, .opc1 = 4, .crn = 8, .crm = 0, .opc2 = 5,
> +      .type = ARM_CP_NO_RAW, .access = PL2_W,
> +      .writefn = tlbiipas2_is_write },
>      /* 32 bit cache operations */
>      { .name = "ICIALLUIS", .cp = 15, .opc1 = 0, .crn = 7, .crm = 1, .opc2 = 0,
>        .type = ARM_CP_NOP, .access = PL1_W },
> @@ -3605,6 +3734,25 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
>      { .name = "HTTBR", .cp = 15, .opc1 = 4, .crm = 2,
>        .access = PL2_RW, .type = ARM_CP_64BIT | ARM_CP_ALIAS,
>        .fieldoffset = offsetof(CPUARMState, cp15.ttbr0_el[2]) },
> +    { .name = "TLBIALLH", .cp = 15, .opc1 = 4, .crn = 8, .crm = 7, .opc2 = 0,
> +      .type = ARM_CP_NO_RAW, .access = PL2_W,
> +      .writefn = tlbiall_hyp_write },
> +    { .name = "TLBIALLHIS", .cp = 15, .opc1 = 4, .crn = 8, .crm = 3, .opc2 = 0,
> +      .type = ARM_CP_NO_RAW, .access = PL2_W,
> +      .writefn = tlbiall_hyp_is_write },
> +    { .name = "TLBIMVAH", .cp = 15, .opc1 = 4, .crn = 8, .crm = 7, .opc2 = 1,
> +      .type = ARM_CP_NO_RAW, .access = PL2_W,
> +      .writefn = tlbimva_hyp_write },
> +    { .name = "TLBIMVAHIS", .cp = 15, .opc1 = 4, .crn = 8, .crm = 3, .opc2 = 1,
> +      .type = ARM_CP_NO_RAW, .access = PL2_W,
> +      .writefn = tlbimva_hyp_is_write },
> +    { .name = "TLBIMVALH", .cp = 15, .opc1 = 4, .crn = 8, .crm = 7, .opc2 = 5,
> +      .type = ARM_CP_NO_RAW, .access = PL2_W,
> +      .writefn = tlbimva_hyp_write },

This doesn't exist on v7.

> +    { .name = "TLBIMVALHIS",
> +      .cp = 15, .opc1 = 4, .crn = 8, .crm = 3, .opc2 = 5,
> +      .type = ARM_CP_NO_RAW, .access = PL2_W,
> +      .writefn = tlbimva_hyp_is_write },

Nor does this.

>      { .name = "TLBI_ALLE2", .state = ARM_CP_STATE_AA64,
>        .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 7, .opc2 = 0,
>        .type = ARM_CP_NO_RAW, .access = PL2_W,
> --
> 1.9.3

thanks
-- PMM
