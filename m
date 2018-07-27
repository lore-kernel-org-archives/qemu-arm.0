Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp665302wru;
        Fri, 27 Jul 2018 05:49:18 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfo3737jOlZJodA5To9x8bIJLRQMXycOwF6QBhrJikklm68Fhwa1Oe5mgnWH57AwZo7EeeZ
X-Received: by 2002:a37:8186:: with SMTP id c128-v6mr5696803qkd.414.1532695758451;
        Fri, 27 Jul 2018 05:49:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532695758; cv=none;
        d=google.com; s=arc-20160816;
        b=Z80f4W4MYclmneM2W0hqh5HgD59RyRPrVRqrn8mLWBBOKvItJ817MXnZLhnBRJoR6a
         wkM1VTdimOA+GH6X45m50bFqXyK3/5VX/DBxDzlxY8cqcFk5F8VxrofHDdP/vmCsDKQs
         cXs75OHlihW+ElTkm7uaBNovm0RWvwc5UK2eVsX6Ku/rSCv36sqPYeMPAXoDrIpu05wz
         90FC/DOgRHrInJNaNsUwlVIXhoi+AVH2hFG2dVWrh9yhT3Gk76VJqcVjuivd1m3nzRsv
         kuHShz+HxnfxnpbO6S+LxhZPLksrlYgFnczSQnKhi2THYztePDzXH5MByppaQQ6wAHY8
         OelQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=PBG1J2kfKWqlhVO4EpClraXy/R3VqhZaX1DtlK3ybjU=;
        b=mCjhc4NjNLEnxwNTTBddD8PMFUKyEZpON1xov4iR9MiZnCqyovqNSLtV7Eunqu4F9B
         0cwPR/sNLipjVN58+sS3LrBqYKFAiQ89Fg/TyW9hTZmZ7gdHnJpmby4s7uyhB6LaEbXm
         syIa9s7UbBH1pnBOCAHWuWQzROE5JaKwqVc4kWcT5vVYgAu9bE52scT3tNCPYfA12AWn
         0X9AtUNfAz7+uCnM4Vd+sfShv+DfSaWNlaWlZk1bNck59zGf24l8cpCZrpLTSsnBIvat
         sxLLDxramWeBabYJVTkk31dhPTpXhxvMY4h6XkcxLd93lxYOMvnBUtbCIPxPyT1jHsef
         yYbg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=XukMxe+Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k40-v6si1730047qta.133.2018.07.27.05.49.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 27 Jul 2018 05:49:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=XukMxe+Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41111 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fj2BK-0000FW-0b
	for alex.bennee@linaro.org; Fri, 27 Jul 2018 08:49:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38902)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fj2BA-0000F9-77
	for qemu-arm@nongnu.org; Fri, 27 Jul 2018 08:49:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fj2B7-00049b-1W
	for qemu-arm@nongnu.org; Fri, 27 Jul 2018 08:49:08 -0400
Received: from mail-ua0-x241.google.com ([2607:f8b0:400c:c08::241]:40889)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fj2B6-00049R-Q1; Fri, 27 Jul 2018 08:49:04 -0400
Received: by mail-ua0-x241.google.com with SMTP id p22-v6so3242948uao.7;
	Fri, 27 Jul 2018 05:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=PBG1J2kfKWqlhVO4EpClraXy/R3VqhZaX1DtlK3ybjU=;
	b=XukMxe+Yt/YwaJTfYpyFaoTTYTitMEtGRUVw6R2KoaXe+po1mPENVhTQyQtIiNvNDH
	3+QMncjRDTLDYwXEcog9gAUUHadZvKkxzZ0oAHgUkEVAGINRK0IYoiM4aywI3mdXOXAz
	MtK3gIEVj7HF9Wo8OmmsEDB/FWw20E+eAPgDHtjvcbfWQYTNNm/3/+0l1ZdltBTx6d5W
	vJ/plLO2qsmZTvSTymHMTSp0C4nRXZm78Jr2m354CCY33e6bZhrBsWI85LA310ot6n+I
	p7tKISzA8GIbSzYnIcikvx8/KSnYElFqdLVAVE/JJ+8R+ib+u+xNv7bJlEyrY/JwVGOi
	XUFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=PBG1J2kfKWqlhVO4EpClraXy/R3VqhZaX1DtlK3ybjU=;
	b=q5HQ2HUiqxjwnBOozOWHWBFM0tMHy/VG6hcMaOoSM0CkPi8RWkHpAtBc42hogMKvxV
	eYtfrJ/UM57MfdP+X2sw071zTvTu0W4tERbThb6R2Hi08+bWi+2nG1024UaXM4l2WDxm
	uPs82DDvoqwTL7XzbeAvCBO2d1I6Y568DmUvy+zuLFmEsdZztvzyrPzLDJMt6wIudHDJ
	e8f0ZRVseSt0gcNPAjkJVZyc8exiFj9HEnef9CrLeobKvlJKb3TGxEcHiBVtRUDOP9/2
	G0xvSeCMcAZkSK13vC/jRN5kmzHFIAWQXc4CbzpjBhyZb+syJxHAFPCav6ekrCjyVWYY
	5v/g==
X-Gm-Message-State: AOUpUlFb8gr0njDNjWHzJOAkZdKkOFOKhF7Y/xYsxdBKyfs/GWsY/fn0
	6BvCo4CQ9ez/H2VtlyIHm1o=
X-Received: by 2002:a9f:311e:: with SMTP id
	m30-v6mr4382427uab.56.1532695744097; 
	Fri, 27 Jul 2018 05:49:04 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	e185-v6sm1160000vkd.15.2018.07.27.05.49.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Jul 2018 05:49:03 -0700 (PDT)
To: Luc Michel <luc.michel@greensocs.com>
References: <20180727095421.386-1-luc.michel@greensocs.com>
	<20180727095421.386-10-luc.michel@greensocs.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Autocrypt: addr=f4bug@amsat.org; prefer-encrypt=mutual; keydata=
	mQINBDU8rLoBEADb5b5dyglKgWF9uDbIjFXU4gDtcwiga9wJ/wX6xdhBqU8tlQ4BroH7AeRl
	u4zXP0QnBDAG7EetxlQzcfYbPmxFISWjckDBFvDbFsojrZmwF2/LkFSzlvKiN5KLghzzJhLO
	HhjGlF8deEZz/d/G8qzO9mIw8GIBS8uuWh6SIcG/qq7+y+2+aifaj92EdwU79apZepT/U3vN
	YrfcAuo1Ycy7/u0hJ7rlaFUn2Fu5KIgV2O++hHYtCCQfdPBg/+ujTL+U+sCDawCyq+9M5+LJ
	ojCzP9rViLZDd/gS6jX8T48hhidtbtsFRj/e9QpdZgDZfowRMVsRx+TB9yzjFdMO0YaYybXp
	dg/wCUepX5xmDBrle6cZ8VEe00+UQCAU1TY5Hs7QFfBbjgR3k9pgJzVXNUKcJ9DYQP0OBH9P
	ZbZvM0Ut2Bk6bLBO5iCVDOco0alrPkX7iJul2QWBy3Iy9j02GnA5jZ1Xtjr9kpCqQT+sRXso
	Vpm5TPGWaWljIeLWy/qL8drX1eyJzwTB3A36Ck4r3YmjMjfmvltSZB1uAdo1elHTlFEULpU/
	HiwvvqXQ9koB15U154VCuguvx/Qnboz8GFb9Uw8VyawzVxYVNME7xw7CQF8FYxzj6eI7rBf2
	Dj/II6wxWPgDEy3oUzuNOxTB7sT3b/Ym76yOJzWX5BylXQIJ5wARAQABtDFQaGlsaXBwZSBN
	YXRoaWV1LURhdWTDqSAoRjRCVUcpIDxmNGJ1Z0BhbXNhdC5vcmc+iQI+BBMBAgAoBQI3aGSw
	AhsPBQkmUJgABgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRDj4yws3q3A3nS+EACxKosO
	3DZdwdVPXLVvSAA5y3Ohr2ByWN06RlVEkKWkOxm0lQ96LxBOZ03mDC+He/36DHaP+fujPBTz
	XjTXygWWZUtk0flDWR1w0a4yhX/JHfL5yloMZrxifCwouf2Sv9Yd6D46pzMeGsq8aCvbZYSf
	lDi3KXsVHc+jbmRwxtzJxz7366dsTC1tOJmjVSxc8bE55pHnPFOT1KKM9fxGWZFYx0UqAL/1
	NkrOKP5eXdJ51EhQa5pjivJw6dQlfWMQURG4o4e2+aLe4TkS2FI0r6nTgmoDmTT74u35NzZW
	Q3xjqcfqUX52+0drwlta22guNDbcJ4J+/I6FBF1C7CoSysBiIrldZQ6cJZ19st3jb7NHAoNk
	DcUt5I3gt4EpaiijWEEYAhw1/NSagm9bfn9veBqzVHNQrz76NZMiy2kP2vAxKOvo1XVlcEl0
	8MQ+IAUvYcLvU6yHRB4da7ts+ufqriNI5WBpvoLPRRa0wFDTj0nX/CfWFX9UkTwHA6/SWlhE
	hHau4xrpzFENwF5UDFtMkleo/u5Ipv7q8wYNs5JBpSXGmm4oSV9BbW0gp28D8fY4GGv1+6Dz
	BNDeuIdPf2NX0X55uyphpB0J4d70uNszAWXr7VqGOBbGrHcNHeT62BvoRd8bUQhaEyiJwOyC
	Ny4YIWW+I8W2wXkW+vSrZfEro2GZjQ==
Message-ID: <799aa201-ee60-a04d-d241-ad60b8150cd6@amsat.org>
Date: Fri, 27 Jul 2018 09:48:59 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180727095421.386-10-luc.michel@greensocs.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400c:c08::241
Subject: Re: [Qemu-arm] [PATCH v5 09/20] intc/arm_gic: Add virtualization
 enabled IRQ helper functions
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
Cc: Peter Maydell <peter.maydell@linaro.org>, mark.burton@greensocs.com,
	qemu-devel@nongnu.org, saipava@xilinx.com, edgari@xilinx.com,
	qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wUMn3eqONeHA

On 07/27/2018 06:54 AM, Luc Michel wrote:
> Add some helper functions to gic_internal.h to get or change the state
> of an IRQ. When the current CPU is not a vCPU, the call is forwarded to
> the GIC distributor. Otherwise, it acts on the list register matching
> the IRQ in the current CPU virtual interface.
> 
> gic_clear_active can have a side effect on the distributor, even in the
> vCPU case, when the correponding LR has the HW field set.
> 
> Use those functions in the CPU interface code path to prepare for the
> vCPU interface implementation.
> 
> Signed-off-by: Luc Michel <luc.michel@greensocs.com>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/intc/arm_gic.c      | 32 +++++++---------
>  hw/intc/gic_internal.h | 83 ++++++++++++++++++++++++++++++++++++++++++

You can set scripts/git.orderfile up for a more natural 'headers changes
before source' review.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

>  2 files changed, 97 insertions(+), 18 deletions(-)
> 
> diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
> index 94d5982e2a..26ed7ea58a 100644
> --- a/hw/intc/arm_gic.c
> +++ b/hw/intc/arm_gic.c
> @@ -220,11 +220,12 @@ static uint16_t gic_get_current_pending_irq(GICState *s, int cpu,
>                                              MemTxAttrs attrs)
>  {
>      uint16_t pending_irq = s->current_pending[cpu];
>  
>      if (pending_irq < GIC_MAXIRQ && gic_has_groups(s)) {
> -        int group = GIC_DIST_TEST_GROUP(pending_irq, (1 << cpu));
> +        int group = gic_test_group(s, pending_irq, cpu);
> +
>          /* On a GIC without the security extensions, reading this register
>           * behaves in the same way as a secure access to a GIC with them.
>           */
>          bool secure = !gic_cpu_ns_access(s, cpu, attrs);
>  
> @@ -251,11 +252,11 @@ static int gic_get_group_priority(GICState *s, int cpu, int irq)
>      int bpr;
>      uint32_t mask;
>  
>      if (gic_has_groups(s) &&
>          !(s->cpu_ctlr[cpu] & GICC_CTLR_CBPR) &&
> -        GIC_DIST_TEST_GROUP(irq, (1 << cpu))) {
> +        gic_test_group(s, irq, cpu)) {
>          bpr = s->abpr[cpu] - 1;
>          assert(bpr >= 0);
>      } else {
>          bpr = s->bpr[cpu];
>      }
> @@ -264,11 +265,11 @@ static int gic_get_group_priority(GICState *s, int cpu, int irq)
>       * a BPR of 1 means they are [7:2], and so on down to
>       * a BPR of 7 meaning no group priority bits at all.
>       */
>      mask = ~0U << ((bpr & 7) + 1);
>  
> -    return GIC_DIST_GET_PRIORITY(irq, cpu) & mask;
> +    return gic_get_priority(s, irq, cpu) & mask;
>  }
>  
>  static void gic_activate_irq(GICState *s, int cpu, int irq)
>  {
>      /* Set the appropriate Active Priority Register bit for this IRQ,
> @@ -277,18 +278,18 @@ static void gic_activate_irq(GICState *s, int cpu, int irq)
>      int prio = gic_get_group_priority(s, cpu, irq);
>      int preemption_level = prio >> (GIC_MIN_BPR + 1);
>      int regno = preemption_level / 32;
>      int bitno = preemption_level % 32;
>  
> -    if (gic_has_groups(s) && GIC_DIST_TEST_GROUP(irq, (1 << cpu))) {
> +    if (gic_has_groups(s) && gic_test_group(s, irq, cpu)) {
>          s->nsapr[regno][cpu] |= (1 << bitno);
>      } else {
>          s->apr[regno][cpu] |= (1 << bitno);
>      }
>  
>      s->running_priority[cpu] = prio;
> -    GIC_DIST_SET_ACTIVE(irq, 1 << cpu);
> +    gic_set_active(s, irq, cpu);
>  }
>  
>  static int gic_get_prio_from_apr_bits(GICState *s, int cpu)
>  {
>      /* Recalculate the current running priority for this CPU based
> @@ -353,21 +354,20 @@ uint32_t gic_acknowledge_irq(GICState *s, int cpu, MemTxAttrs attrs)
>      if (irq >= GIC_MAXIRQ) {
>          DPRINTF("ACK, no pending interrupt or it is hidden: %d\n", irq);
>          return irq;
>      }
>  
> -    if (GIC_DIST_GET_PRIORITY(irq, cpu) >= s->running_priority[cpu]) {
> +    if (gic_get_priority(s, irq, cpu) >= s->running_priority[cpu]) {
>          DPRINTF("ACK, pending interrupt (%d) has insufficient priority\n", irq);
>          return 1023;
>      }
>  
>      if (s->revision == REV_11MPCORE) {
>          /* Clear pending flags for both level and edge triggered interrupts.
>           * Level triggered IRQs will be reasserted once they become inactive.
>           */
> -        GIC_DIST_CLEAR_PENDING(irq, GIC_DIST_TEST_MODEL(irq) ? ALL_CPU_MASK
> -                                                             : cm);
> +        gic_clear_pending(s, irq, cpu);
>          ret = irq;
>      } else {
>          if (irq < GIC_NR_SGIS) {
>              /* Lookup the source CPU for the SGI and clear this in the
>               * sgi_pending map.  Return the src and clear the overall pending
> @@ -375,22 +375,19 @@ uint32_t gic_acknowledge_irq(GICState *s, int cpu, MemTxAttrs attrs)
>               */
>              assert(s->sgi_pending[irq][cpu] != 0);
>              src = ctz32(s->sgi_pending[irq][cpu]);
>              s->sgi_pending[irq][cpu] &= ~(1 << src);
>              if (s->sgi_pending[irq][cpu] == 0) {
> -                GIC_DIST_CLEAR_PENDING(irq,
> -                                       GIC_DIST_TEST_MODEL(irq) ? ALL_CPU_MASK
> -                                                                : cm);
> +                gic_clear_pending(s, irq, cpu);
>              }
>              ret = irq | ((src & 0x7) << 10);
>          } else {
>              /* Clear pending state for both level and edge triggered
>               * interrupts. (level triggered interrupts with an active line
>               * remain pending, see gic_test_pending)
>               */
> -            GIC_DIST_CLEAR_PENDING(irq, GIC_DIST_TEST_MODEL(irq) ? ALL_CPU_MASK
> -                                                                 : cm);
> +            gic_clear_pending(s, irq, cpu);
>              ret = irq;
>          }
>      }
>  
>      gic_activate_irq(s, cpu, irq);
> @@ -542,11 +539,10 @@ static bool gic_eoi_split(GICState *s, int cpu, MemTxAttrs attrs)
>      return s->cpu_ctlr[cpu] & GICC_CTLR_EOIMODE;
>  }
>  
>  static void gic_deactivate_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs)
>  {
> -    int cm = 1 << cpu;
>      int group;
>  
>      if (irq >= s->num_irq) {
>          /*
>           * This handles two cases:
> @@ -557,11 +553,11 @@ static void gic_deactivate_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs)
>           * and so this is UNPREDICTABLE. We choose to ignore it.
>           */
>          return;
>      }
>  
> -    group = gic_has_groups(s) && GIC_DIST_TEST_GROUP(irq, cm);
> +    group = gic_has_groups(s) && gic_test_group(s, irq, cpu);
>  
>      if (!gic_eoi_split(s, cpu, attrs)) {
>          /* This is UNPREDICTABLE; we choose to ignore it */
>          qemu_log_mask(LOG_GUEST_ERROR,
>                        "gic_deactivate_irq: GICC_DIR write when EOIMode clear");
> @@ -571,11 +567,11 @@ static void gic_deactivate_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs)
>      if (gic_cpu_ns_access(s, cpu, attrs) && !group) {
>          DPRINTF("Non-secure DI for Group0 interrupt %d ignored\n", irq);
>          return;
>      }
>  
> -    GIC_DIST_CLEAR_ACTIVE(irq, cm);
> +    gic_clear_active(s, irq, cpu);
>  }
>  
>  static void gic_complete_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs)
>  {
>      int cm = 1 << cpu;
> @@ -606,11 +602,11 @@ static void gic_complete_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs)
>              DPRINTF("Set %d pending mask %x\n", irq, cm);
>              GIC_DIST_SET_PENDING(irq, cm);
>          }
>      }
>  
> -    group = gic_has_groups(s) && GIC_DIST_TEST_GROUP(irq, cm);
> +    group = gic_has_groups(s) && gic_test_group(s, irq, cpu);
>  
>      if (gic_cpu_ns_access(s, cpu, attrs) && !group) {
>          DPRINTF("Non-secure EOI for Group0 interrupt %d ignored\n", irq);
>          return;
>      }
> @@ -622,11 +618,11 @@ static void gic_complete_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs)
>  
>      gic_drop_prio(s, cpu, group);
>  
>      /* In GICv2 the guest can choose to split priority-drop and deactivate */
>      if (!gic_eoi_split(s, cpu, attrs)) {
> -        GIC_DIST_CLEAR_ACTIVE(irq, cm);
> +        gic_clear_active(s, irq, cpu);
>      }
>      gic_update(s);
>  }
>  
>  static uint32_t gic_dist_readb(void *opaque, hwaddr offset, MemTxAttrs attrs)
> diff --git a/hw/intc/gic_internal.h b/hw/intc/gic_internal.h
> index cc5acc5d41..45c2af0bf5 100644
> --- a/hw/intc/gic_internal.h
> +++ b/hw/intc/gic_internal.h
> @@ -141,10 +141,17 @@ REG32(GICH_LR63, 0x1fc)
>  #define GICH_LR_PRIORITY(entry) (FIELD_EX32(entry, GICH_LR0, Priority) << 3)
>  #define GICH_LR_STATE(entry) (FIELD_EX32(entry, GICH_LR0, State))
>  #define GICH_LR_GROUP(entry) (FIELD_EX32(entry, GICH_LR0, Grp1))
>  #define GICH_LR_HW(entry) (FIELD_EX32(entry, GICH_LR0, HW))
>  
> +#define GICH_LR_CLEAR_PENDING(entry) \
> +        ((entry) &= ~(GICH_LR_STATE_PENDING << R_GICH_LR0_State_SHIFT))
> +#define GICH_LR_SET_ACTIVE(entry) \
> +        ((entry) |= (GICH_LR_STATE_ACTIVE << R_GICH_LR0_State_SHIFT))
> +#define GICH_LR_CLEAR_ACTIVE(entry) \
> +        ((entry) &= ~(GICH_LR_STATE_ACTIVE << R_GICH_LR0_State_SHIFT))
> +
>  /* Valid bits for GICC_CTLR for GICv1, v1 with security extensions,
>   * GICv2 and GICv2 with security extensions:
>   */
>  #define GICC_CTLR_V1_MASK    0x1
>  #define GICC_CTLR_V1_S_MASK  0x1f
> @@ -236,6 +243,82 @@ static inline uint32_t *gic_get_lr_entry(GICState *s, int irq, int vcpu)
>      }
>  
>      g_assert_not_reached();
>  }
>  
> +static inline bool gic_test_group(GICState *s, int irq, int cpu)
> +{
> +    if (gic_is_vcpu(cpu)) {
> +        uint32_t *entry = gic_get_lr_entry(s, irq, cpu);
> +        return GICH_LR_GROUP(*entry);
> +    } else {
> +        return GIC_DIST_TEST_GROUP(irq, 1 << cpu);
> +    }
> +}
> +
> +static inline void gic_clear_pending(GICState *s, int irq, int cpu)
> +{
> +    if (gic_is_vcpu(cpu)) {
> +        uint32_t *entry = gic_get_lr_entry(s, irq, cpu);
> +        GICH_LR_CLEAR_PENDING(*entry);
> +    } else {
> +        /* Clear pending state for both level and edge triggered
> +         * interrupts. (level triggered interrupts with an active line
> +         * remain pending, see gic_test_pending)
> +         */
> +        GIC_DIST_CLEAR_PENDING(irq, GIC_DIST_TEST_MODEL(irq) ? ALL_CPU_MASK
> +                                                             : (1 << cpu));
> +    }
> +}
> +
> +static inline void gic_set_active(GICState *s, int irq, int cpu)
> +{
> +    if (gic_is_vcpu(cpu)) {
> +        uint32_t *entry = gic_get_lr_entry(s, irq, cpu);
> +        GICH_LR_SET_ACTIVE(*entry);
> +    } else {
> +        GIC_DIST_SET_ACTIVE(irq, 1 << cpu);
> +    }
> +}
> +
> +static inline void gic_clear_active(GICState *s, int irq, int cpu)
> +{
> +    if (gic_is_vcpu(cpu)) {
> +        uint32_t *entry = gic_get_lr_entry(s, irq, cpu);
> +        GICH_LR_CLEAR_ACTIVE(*entry);
> +
> +        if (GICH_LR_HW(*entry)) {
> +            /* Hardware interrupt. We must forward the deactivation request to
> +             * the distributor.
> +             */
> +            int phys_irq = GICH_LR_PHYS_ID(*entry);
> +            int rcpu = gic_get_vcpu_real_id(cpu);
> +
> +            if (phys_irq < GIC_NR_SGIS || phys_irq >= GIC_MAXIRQ) {
> +                /* UNPREDICTABLE behaviour, we choose to ignore the request */
> +                return;
> +            }
> +
> +            /* This is equivalent to a NS write to DIR on the physical CPU
> +             * interface. Hence group0 interrupt deactivation is ignored if
> +             * the GIC is secure.
> +             */
> +            if (!s->security_extn || GIC_DIST_TEST_GROUP(phys_irq, 1 << rcpu)) {
> +                GIC_DIST_CLEAR_ACTIVE(phys_irq, 1 << rcpu);
> +            }
> +        }
> +    } else {
> +        GIC_DIST_CLEAR_ACTIVE(irq, 1 << cpu);
> +    }
> +}
> +
> +static inline int gic_get_priority(GICState *s, int irq, int cpu)
> +{
> +    if (gic_is_vcpu(cpu)) {
> +        uint32_t *entry = gic_get_lr_entry(s, irq, cpu);
> +        return GICH_LR_PRIORITY(*entry);
> +    } else {
> +        return GIC_DIST_GET_PRIORITY(irq, cpu);
> +    }
> +}
> +
>  #endif /* QEMU_ARM_GIC_INTERNAL_H */
> 
