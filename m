Received: by 10.223.197.9 with SMTP id q9csp4620481wrf;
        Tue, 17 Oct 2017 06:47:57 -0700 (PDT)
X-Received: by 10.55.40.81 with SMTP id o78mr13485294qkh.343.1508248077354;
        Tue, 17 Oct 2017 06:47:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508248077; cv=none;
        d=google.com; s=arc-20160816;
        b=UU5ypNlnB+p0aT4ca6AmbFEPIoXDq1SpBG0yluJMqH0nAIaSafpr1z6Bp/LIl8A0bj
         r4UOgIF/WDcfmK8708odNCr0gZRpB5cIxSggCgY2RMpmsIordb5kJRrPS49Zydfx3wHC
         8I6X+MUT2r2Ni3LDcn7pQ6jNZrWzoiCPdqC/0umH9qht8QIvDBJVn8vU44f0KRYVHeXG
         Y9WmFRA6fCrRFMs7zGKMpfcYQ+ufqho6mEX2JAFHc1R4eJEv7RKPe8mcX4wPxTeU2zFK
         UKMuYZpABQF26QdDw1RT3H4cwVx9ZLdI2CirfJa8AWkfVZ1Ab4ak+1Cev59GsGC/id44
         52DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=diq3fswOaZ2QvQFYWyI7na9WRUjZV7kyDhgZPvQxzO8=;
        b=x9k+aijzVp2qxzpfq9VTLwZfplfkqOe08lnzUvgd2+yi3Z6lY2GU1AQc4MjNkFFrcF
         oLXGP4YxbBpwGxXfEc04dm7Zn/jo8SK+xYm2KTzXCzfmJvxQMM6uu/gCqo/wtP5Icyzx
         HgD0tuEHTiIdCoAMsF4t8ALM6b3X6y9ApFVF0XGYwPLJppPDWT7zE0TD026MeAW6MQnJ
         HjravLmMlJfox0qIhwiPfY5odrX1QDSS8YrfOQELUg9RGuza4hsPKphAgQAXCPVZJqbH
         ZRQgDIDy9+JMkj4usGV/goiXrSpbWqp5Xq4JGV4L4iR6ewZuEtEltq/gUKisFu373vdu
         scKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LWzIARsi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h9si1380267qti.206.2017.10.17.06.47.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Oct 2017 06:47:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LWzIARsi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39492 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e4SDr-00019o-8o
	for alex.bennee@linaro.org; Tue, 17 Oct 2017 09:47:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47700)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e4S8O-0005dx-1u
	for qemu-devel@nongnu.org; Tue, 17 Oct 2017 09:42:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e4S8N-0008QK-1R
	for qemu-devel@nongnu.org; Tue, 17 Oct 2017 09:42:16 -0400
Received: from mail-wm0-x233.google.com ([2a00:1450:400c:c09::233]:49769)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e4S8M-0008Pq-Qr
	for qemu-devel@nongnu.org; Tue, 17 Oct 2017 09:42:14 -0400
Received: by mail-wm0-x233.google.com with SMTP id b189so3946080wmd.4
	for <qemu-devel@nongnu.org>; Tue, 17 Oct 2017 06:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=diq3fswOaZ2QvQFYWyI7na9WRUjZV7kyDhgZPvQxzO8=;
	b=LWzIARsidsadUaZNLdNU0hbn8xJlDIbXYIt6yjMcLnYtK+SlRwSnI3ygJ8DtUpc0Tr
	SNYTYgGf5QxJXMnTGcoKkr0VsrZN9cOFbDZlkZsexLB3MF8ZZVe54D5Wtb/NTA5AdXhg
	r/1wPIiJPfe5dm29/WuJaF3FEa4ONouqwPMME=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=diq3fswOaZ2QvQFYWyI7na9WRUjZV7kyDhgZPvQxzO8=;
	b=Ye9Nb7zTnKZnlgpI72TbN6LJ8MDjm0s04OvMy6RyO5AZq1Ltg95ua0pXZ3c5X9E2Rv
	BAP4X5NQxKmVh99qzW709SfKwZLpLDuO3m7kVPPY2gXeW6OMYe5wbUkBORsVb04JKq68
	A/QYrGrQcIuDI/uuqlzzvwvpve4Yiv6SNanMHztBlyGDQHCtR+vgnQ8qRSTJGAUUDhx1
	V/1p9tkOzDFOdtSQEYai2vZOCFmk7gEAG+pRCU0K39Pu9aDJHigqJ5+BArNbEiHg636j
	jLD2nxNQEgO8BjGB4AAZLSXsI2qAii6ULz6tipkOylX0k8EcHDMCTzlIhDoXi767yCg/
	UU+A==
X-Gm-Message-State: AMCzsaUhbVm4yUIjkx2wXGGKNOfsHwVnTn1jSSAJtRwu6CmiqBYuNw9I
	vAGMlvzEl53SWzXS9dapkAUhWkYK93eFVW+ZW0usSw==
X-Google-Smtp-Source: ABhQp+TjamG9ZhxhzNXGzDa7uLK927zGMY1wy4KzlZRtbFa6VDwpicsLAYn4dG8Al6Rhba8+q9tx723Niw97JHqrR+k=
X-Received: by 10.28.113.196 with SMTP id d65mr3354600wmi.151.1508247733590;
	Tue, 17 Oct 2017 06:42:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.139.195 with HTTP; Tue, 17 Oct 2017 06:41:52 -0700 (PDT)
In-Reply-To: <1506737310-21880-5-git-send-email-alindsay@codeaurora.org>
References: <1506737310-21880-1-git-send-email-alindsay@codeaurora.org>
	<1506737310-21880-5-git-send-email-alindsay@codeaurora.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Oct 2017 14:41:52 +0100
Message-ID: <CAFEAcA94pxKuPZZgKOMXyW8xteHTBWz-JM6mGOX-ot6OeBt-tw@mail.gmail.com>
To: Aaron Lindsay <alindsay@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::233
Subject: Re: [Qemu-devel] [PATCH 04/13] target/arm: Mask PMU register writes
 based on PMCR_EL0.N
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
Cc: Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
	Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jTjNK0yklWkP

On 30 September 2017 at 03:08, Aaron Lindsay <alindsay@codeaurora.org> wrote:
> This is in preparation for enabling counters other than PMCCNTR
>
> Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
> ---
>  target/arm/helper.c | 24 +++++++++++++++---------
>  1 file changed, 15 insertions(+), 9 deletions(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index ecf8c55..54070a3 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -30,11 +30,6 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
>                                 hwaddr *phys_ptr, MemTxAttrs *txattrs, int *prot,
>                                 target_ulong *page_size_ptr, uint32_t *fsr,
>                                 ARMMMUFaultInfo *fi);
> -
> -/* Definitions for the PMCCNTR and PMCR registers */
> -#define PMCRD   0x8
> -#define PMCRC   0x4
> -#define PMCRE   0x1
>  #endif
>
>  static int vfp_gdb_get_reg(CPUARMState *env, uint8_t *buf, int reg)
> @@ -876,6 +871,17 @@ static const ARMCPRegInfo v6_cp_reginfo[] = {
>      REGINFO_SENTINEL
>  };
>
> +/* Definitions for the PMU registers */
> +#define PMCRN   0xf800

We usually name this kind of whole-field mask value something like PMCRN_MASK.

(We also have a FIELD() macro in hw/registerfields.h for defining
mask/length/shift constants; though it can be a bit verbose in
the length of the names it uses, so I don't insist on its use
if you don't like the results. I'm on the fence myself about it.)

> +#define PMCRN_SHIFT 11
> +#define PMCRD   0x8
> +#define PMCRC   0x4
> +#define PMCRE   0x1
> +
> +#define PMU_NUM_COUNTERS(env) ((env->cp15.c9_pmcr & PMCRN) >> PMCRN_SHIFT)
> +/* Bits allowed to be set/cleared for PMCNTEN* and PMINTEN* */
> +#define PMU_COUNTER_MASK(env) ((1 << 31) | ((1 << PMU_NUM_COUNTERS(env)) - 1))
> +
>  static CPAccessResult pmreg_access(CPUARMState *env, const ARMCPRegInfo *ri,
>                                     bool isread)
>  {
> @@ -1060,14 +1066,14 @@ static void pmccfiltr_write(CPUARMState *env, const ARMCPRegInfo *ri,
>  static void pmcntenset_write(CPUARMState *env, const ARMCPRegInfo *ri,
>                              uint64_t value)
>  {
> -    value &= (1 << 31);
> +    value &= (PMU_COUNTER_MASK(env) | (1 << 31));

PMU_COUNTER_MASK always contains bit 31, so why do we manually OR it in
again here?

>      env->cp15.c9_pmcnten |= value;
>  }
>
>  static void pmcntenclr_write(CPUARMState *env, const ARMCPRegInfo *ri,
>                               uint64_t value)
>  {
> -    value &= (1 << 31);
> +    value &= (PMU_COUNTER_MASK(env) | (1 << 31));
>      env->cp15.c9_pmcnten &= ~value;
>  }
>
> @@ -1115,14 +1121,14 @@ static void pmintenset_write(CPUARMState *env, const ARMCPRegInfo *ri,
>                               uint64_t value)
>  {
>      /* We have no event counters so only the C bit can be changed */
> -    value &= (1 << 31);
> +    value &= PMU_COUNTER_MASK(env);
>      env->cp15.c9_pminten |= value;
>  }
>
>  static void pmintenclr_write(CPUARMState *env, const ARMCPRegInfo *ri,
>                               uint64_t value)
>  {
> -    value &= (1 << 31);
> +    value &= PMU_COUNTER_MASK(env);
>      env->cp15.c9_pminten &= ~value;
>  }
>
> --
> Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.\nQualcomm Technologies, Inc. is a member of the\nCode Aurora Forum, a Linux Foundation Collaborative Project.

Shouldn't these '\n' in your sig be literal line breaks? :-)

thanks
-- PMM
