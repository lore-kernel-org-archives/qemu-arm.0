Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp835784wrq;
        Wed, 6 Jun 2018 06:39:26 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLIPEs9W7/2xizL2/rL8EMxaXfqMPlgIDnoJPPW17j+d7lagXPtljZmB8nSJlLlJbvarViQ
X-Received: by 2002:a37:1416:: with SMTP id e22-v6mr1934668qkh.3.1528292366306;
        Wed, 06 Jun 2018 06:39:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528292366; cv=none;
        d=google.com; s=arc-20160816;
        b=lucp9dVrRiZPgA5OerWWpRyOKcf07MSgYb0R7ejv4RrZMIozmJs2QosZA14cHX9zy9
         VLlgOhfLFhsPmQObdx7nesU/DXjvRM25v5deYc+zIg9WnwYKKtUB61b9jL9cQYRM5gul
         8NuTG2e8NJgDAa3jDiCSB9Xt3SWDOYQ7Llzk6281YG/8m2YYGB8vjsbGIiZ8s53DR+/s
         0ZHUO/QAyf/GgZLgjOaN1+38qhvMQArXDehbQVuJQokO355OJlecw7PD4GiBwBixRzV8
         5psFouoYn3/b07NxzxobyefkYKrd3oZ3mb3Iw/ChSxx9rEowYQWHlj9IisKPkQpndpS3
         SJ3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=ShPTT8rfdLR1qhqxz/8YIY64qOM2jU3z9kCsWTx2F30=;
        b=PCpPzTpi3Eh32rgsAqBEUeOYmPfDUyFAwSDOcbjfrKL3ZmdvWyA/MQARP67ToQ/KVE
         d/8Zy5IbswQ6HfswgWDnGOxfgLiJ+GCBuEdSWlarxxX04XEEhDKn+kY19g64g/5UcfkD
         adPzwrDRSUBOOeSAmeFSwnoNNcn5wDhn42KGoglZ1dgIM3JXG1U0RjY/L6lt0E4oKk95
         txJt/2XMWuTBA7NDjqSSFPPQnkSStRSaufNPWH8bPxjRTX7345QvI62h87EpHcVdAnDB
         Wir9GU6Pmz1pqGoryag8KFzf5Oq4rO8pM17u93qLCWto9YdQ8MptShvv1XPMgk6GGlES
         +jsg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=a7FVw5te;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n55-v6si703533qta.74.2018.06.06.06.39.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 06 Jun 2018 06:39:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=a7FVw5te;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52502 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fQYer-0005Ym-QI
	for alex.bennee@linaro.org; Wed, 06 Jun 2018 09:39:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35611)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQYec-0005TO-6u
	for qemu-arm@nongnu.org; Wed, 06 Jun 2018 09:39:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQYeX-0006a3-8p
	for qemu-arm@nongnu.org; Wed, 06 Jun 2018 09:39:10 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:43900)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQYeX-0006Zl-1H; Wed, 06 Jun 2018 09:39:05 -0400
Received: by mail-qt0-x244.google.com with SMTP id y89-v6so6323803qtd.10;
	Wed, 06 Jun 2018 06:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ShPTT8rfdLR1qhqxz/8YIY64qOM2jU3z9kCsWTx2F30=;
	b=a7FVw5te1nv1GoXPN13Ggk+Euw5povlTyg3mDn5M2LZeW4OdjUmco7yllj63ZjTdPz
	C1zLNAg80mKPjycvFYZjQh9Z33yqOEhnUF8eqxV6sUOKzqLr+ikgqe7ILMU29h/vIS4g
	QIjRhZzL/oTDtHmAQc9tV+YJA4ebIpz1B85nyfKAm6tqRpOKwC2BwbTerORsrp0XbJua
	2Q03pREfxqX3ueivz6xm4VNs59gYWnz9Skad0AxiOy5oS6tZjDe07afLqvZz/+PQCwmA
	HOoqwCSk9EdB2HaBM7+mB9zXMlQtW2ca9Rf/YNGnUBhj85MzyUiwGcyhrR4yK+eQgXEO
	37Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=ShPTT8rfdLR1qhqxz/8YIY64qOM2jU3z9kCsWTx2F30=;
	b=AeQXka0ejmMWHscEBKRomVhIrX0MROW1Q6ZaLNLz09yO+ljG2hNdVLoUO1cdu1ZkPj
	W8pS0kXkdj7fUmMiBSztXs9pT9wZOVELzxYb4yGlezh5XCcMsuOTC098jKajGr8nkSeH
	SY63csrX9fFK1RJPU29QhhQrzEOHSOH2gBTlHAUREcsPlNhrCXKp3WTL0ACmBycaGYzY
	u7I5FDUoWH45zEg4EPzxnYpfKTrembRYX2rNbQn8kxtdu8tJbw8Q9EI2hQRyorqFLPJo
	kNErA1QEwtnPnebVSk+HkKvwzkuRgY94JYcGN7YuAMSLTY8gEv2/kxkLgp8x6rBaOOuF
	2Q/Q==
X-Gm-Message-State: APt69E2lH6LSXY1BulcSZ3DJoQS112mpx5n+aWJ/8wkjBDr0MNLPpiFP
	RFnDs25xxrR2Dm/z/X6kFCY=
X-Received: by 2002:ac8:5416:: with SMTP id
	b22-v6mr2838383qtq.332.1528292344271; 
	Wed, 06 Jun 2018 06:39:04 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	k2-v6sm29190212qkl.95.2018.06.06.06.38.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Jun 2018 06:39:03 -0700 (PDT)
To: luc.michel@greensocs.com, qemu-devel@nongnu.org
References: <20180606093101.30518-1-luc.michel@greensocs.com>
	<20180606093101.30518-2-luc.michel@greensocs.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <d1fa5a1a-91a8-e2e6-cd1f-cd0633591120@amsat.org>
Date: Wed, 6 Jun 2018 10:38:44 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180606093101.30518-2-luc.michel@greensocs.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: Re: [Qemu-arm] [PATCH 1/6] intc/arm_gic: Refactor operations on the
 distributor
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
	saipava@xilinx.com, edgari@xilinx.com, qemu-arm@nongnu.org,
	Jan Kiszka <jan.kiszka@web.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XHzB9DSYDyIc

On 06/06/2018 06:30 AM, luc.michel@greensocs.com wrote:
> From: Luc MICHEL <luc.michel@greensocs.com>
> 
> In preparation for the virtualization extensions implementation,
> refactor the name of the functions and macros that act on the GIC
> distributor to make that fact explicit. It will be useful to
> differentiate them from the ones that will act on the virtual
> interfaces.
> 
> Signed-off-by: Luc MICHEL <luc.michel@greensocs.com>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  hw/intc/arm_gic.c        | 164 ++++++++++++++++++++-------------------
>  hw/intc/arm_gic_common.c |   6 +-
>  hw/intc/arm_gic_kvm.c    |  23 +++---
>  hw/intc/gic_internal.h   |  51 ++++++------
>  4 files changed, 127 insertions(+), 117 deletions(-)
> 
> diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
> index ea0323f969..141f3e7a48 100644
> --- a/hw/intc/arm_gic.c
> +++ b/hw/intc/arm_gic.c
> @@ -92,11 +92,12 @@ void gic_update(GICState *s)
>          best_prio = 0x100;
>          best_irq = 1023;
>          for (irq = 0; irq < s->num_irq; irq++) {
> -            if (GIC_TEST_ENABLED(irq, cm) && gic_test_pending(s, irq, cm) &&
> -                (!GIC_TEST_ACTIVE(irq, cm)) &&
> -                (irq < GIC_INTERNAL || GIC_TARGET(irq) & cm)) {
> -                if (GIC_GET_PRIORITY(irq, cpu) < best_prio) {
> -                    best_prio = GIC_GET_PRIORITY(irq, cpu);
> +            if (GIC_DIST_TEST_ENABLED(irq, cm) &&
> +                gic_test_pending(s, irq, cm) &&
> +                (!GIC_DIST_TEST_ACTIVE(irq, cm)) &&
> +                (irq < GIC_INTERNAL || GIC_DIST_TARGET(irq) & cm)) {
> +                if (GIC_DIST_GET_PRIORITY(irq, cpu) < best_prio) {
> +                    best_prio = GIC_DIST_GET_PRIORITY(irq, cpu);
>                      best_irq = irq;
>                  }
>              }
> @@ -112,7 +113,7 @@ void gic_update(GICState *s)
>          if (best_prio < s->priority_mask[cpu]) {
>              s->current_pending[cpu] = best_irq;
>              if (best_prio < s->running_priority[cpu]) {
> -                int group = GIC_TEST_GROUP(best_irq, cm);
> +                int group = GIC_DIST_TEST_GROUP(best_irq, cm);
>  
>                  if (extract32(s->ctlr, group, 1) &&
>                      extract32(s->cpu_ctlr[cpu], group, 1)) {
> @@ -145,7 +146,7 @@ void gic_set_pending_private(GICState *s, int cpu, int irq)
>      }
>  
>      DPRINTF("Set %d pending cpu %d\n", irq, cpu);
> -    GIC_SET_PENDING(irq, cm);
> +    GIC_DIST_SET_PENDING(irq, cm);
>      gic_update(s);
>  }
>  
> @@ -153,13 +154,13 @@ static void gic_set_irq_11mpcore(GICState *s, int irq, int level,
>                                   int cm, int target)
>  {
>      if (level) {
> -        GIC_SET_LEVEL(irq, cm);
> -        if (GIC_TEST_EDGE_TRIGGER(irq) || GIC_TEST_ENABLED(irq, cm)) {
> +        GIC_DIST_SET_LEVEL(irq, cm);
> +        if (GIC_DIST_TEST_EDGE_TRIGGER(irq) || GIC_DIST_TEST_ENABLED(irq, cm)) {
>              DPRINTF("Set %d pending mask %x\n", irq, target);
> -            GIC_SET_PENDING(irq, target);
> +            GIC_DIST_SET_PENDING(irq, target);
>          }
>      } else {
> -        GIC_CLEAR_LEVEL(irq, cm);
> +        GIC_DIST_CLEAR_LEVEL(irq, cm);
>      }
>  }
>  
> @@ -167,13 +168,13 @@ static void gic_set_irq_generic(GICState *s, int irq, int level,
>                                  int cm, int target)
>  {
>      if (level) {
> -        GIC_SET_LEVEL(irq, cm);
> +        GIC_DIST_SET_LEVEL(irq, cm);
>          DPRINTF("Set %d pending mask %x\n", irq, target);
> -        if (GIC_TEST_EDGE_TRIGGER(irq)) {
> -            GIC_SET_PENDING(irq, target);
> +        if (GIC_DIST_TEST_EDGE_TRIGGER(irq)) {
> +            GIC_DIST_SET_PENDING(irq, target);
>          }
>      } else {
> -        GIC_CLEAR_LEVEL(irq, cm);
> +        GIC_DIST_CLEAR_LEVEL(irq, cm);
>      }
>  }
>  
> @@ -192,7 +193,7 @@ static void gic_set_irq(void *opaque, int irq, int level)
>          /* The first external input line is internal interrupt 32.  */
>          cm = ALL_CPU_MASK;
>          irq += GIC_INTERNAL;
> -        target = GIC_TARGET(irq);
> +        target = GIC_DIST_TARGET(irq);
>      } else {
>          int cpu;
>          irq -= (s->num_irq - GIC_INTERNAL);
> @@ -204,7 +205,7 @@ static void gic_set_irq(void *opaque, int irq, int level)
>  
>      assert(irq >= GIC_NR_SGIS);
>  
> -    if (level == GIC_TEST_LEVEL(irq, cm)) {
> +    if (level == GIC_DIST_TEST_LEVEL(irq, cm)) {
>          return;
>      }
>  
> @@ -224,7 +225,7 @@ static uint16_t gic_get_current_pending_irq(GICState *s, int cpu,
>      uint16_t pending_irq = s->current_pending[cpu];
>  
>      if (pending_irq < GIC_MAXIRQ && gic_has_groups(s)) {
> -        int group = GIC_TEST_GROUP(pending_irq, (1 << cpu));
> +        int group = GIC_DIST_TEST_GROUP(pending_irq, (1 << cpu));
>          /* On a GIC without the security extensions, reading this register
>           * behaves in the same way as a secure access to a GIC with them.
>           */
> @@ -255,7 +256,7 @@ static int gic_get_group_priority(GICState *s, int cpu, int irq)
>  
>      if (gic_has_groups(s) &&
>          !(s->cpu_ctlr[cpu] & GICC_CTLR_CBPR) &&
> -        GIC_TEST_GROUP(irq, (1 << cpu))) {
> +        GIC_DIST_TEST_GROUP(irq, (1 << cpu))) {
>          bpr = s->abpr[cpu] - 1;
>          assert(bpr >= 0);
>      } else {
> @@ -268,7 +269,7 @@ static int gic_get_group_priority(GICState *s, int cpu, int irq)
>       */
>      mask = ~0U << ((bpr & 7) + 1);
>  
> -    return GIC_GET_PRIORITY(irq, cpu) & mask;
> +    return GIC_DIST_GET_PRIORITY(irq, cpu) & mask;
>  }
>  
>  static void gic_activate_irq(GICState *s, int cpu, int irq)
> @@ -281,14 +282,14 @@ static void gic_activate_irq(GICState *s, int cpu, int irq)
>      int regno = preemption_level / 32;
>      int bitno = preemption_level % 32;
>  
> -    if (gic_has_groups(s) && GIC_TEST_GROUP(irq, (1 << cpu))) {
> +    if (gic_has_groups(s) && GIC_DIST_TEST_GROUP(irq, (1 << cpu))) {
>          s->nsapr[regno][cpu] |= (1 << bitno);
>      } else {
>          s->apr[regno][cpu] |= (1 << bitno);
>      }
>  
>      s->running_priority[cpu] = prio;
> -    GIC_SET_ACTIVE(irq, 1 << cpu);
> +    GIC_DIST_SET_ACTIVE(irq, 1 << cpu);
>  }
>  
>  static int gic_get_prio_from_apr_bits(GICState *s, int cpu)
> @@ -357,7 +358,7 @@ uint32_t gic_acknowledge_irq(GICState *s, int cpu, MemTxAttrs attrs)
>          return irq;
>      }
>  
> -    if (GIC_GET_PRIORITY(irq, cpu) >= s->running_priority[cpu]) {
> +    if (GIC_DIST_GET_PRIORITY(irq, cpu) >= s->running_priority[cpu]) {
>          DPRINTF("ACK, pending interrupt (%d) has insufficient priority\n", irq);
>          return 1023;
>      }
> @@ -366,7 +367,8 @@ uint32_t gic_acknowledge_irq(GICState *s, int cpu, MemTxAttrs attrs)
>          /* Clear pending flags for both level and edge triggered interrupts.
>           * Level triggered IRQs will be reasserted once they become inactive.
>           */
> -        GIC_CLEAR_PENDING(irq, GIC_TEST_MODEL(irq) ? ALL_CPU_MASK : cm);
> +        GIC_DIST_CLEAR_PENDING(irq, GIC_DIST_TEST_MODEL(irq) ? ALL_CPU_MASK
> +                                                             : cm);
>          ret = irq;
>      } else {
>          if (irq < GIC_NR_SGIS) {
> @@ -378,7 +380,9 @@ uint32_t gic_acknowledge_irq(GICState *s, int cpu, MemTxAttrs attrs)
>              src = ctz32(s->sgi_pending[irq][cpu]);
>              s->sgi_pending[irq][cpu] &= ~(1 << src);
>              if (s->sgi_pending[irq][cpu] == 0) {
> -                GIC_CLEAR_PENDING(irq, GIC_TEST_MODEL(irq) ? ALL_CPU_MASK : cm);
> +                GIC_DIST_CLEAR_PENDING(irq,
> +                                       GIC_DIST_TEST_MODEL(irq) ? ALL_CPU_MASK
> +                                                                : cm);
>              }
>              ret = irq | ((src & 0x7) << 10);
>          } else {
> @@ -386,7 +390,8 @@ uint32_t gic_acknowledge_irq(GICState *s, int cpu, MemTxAttrs attrs)
>               * interrupts. (level triggered interrupts with an active line
>               * remain pending, see gic_test_pending)
>               */
> -            GIC_CLEAR_PENDING(irq, GIC_TEST_MODEL(irq) ? ALL_CPU_MASK : cm);
> +            GIC_DIST_CLEAR_PENDING(irq, GIC_DIST_TEST_MODEL(irq) ? ALL_CPU_MASK
> +                                                                 : cm);
>              ret = irq;
>          }
>      }
> @@ -397,11 +402,11 @@ uint32_t gic_acknowledge_irq(GICState *s, int cpu, MemTxAttrs attrs)
>      return ret;
>  }
>  
> -void gic_set_priority(GICState *s, int cpu, int irq, uint8_t val,
> +void gic_dist_set_priority(GICState *s, int cpu, int irq, uint8_t val,
>                        MemTxAttrs attrs)
>  {
>      if (s->security_extn && !attrs.secure) {
> -        if (!GIC_TEST_GROUP(irq, (1 << cpu))) {
> +        if (!GIC_DIST_TEST_GROUP(irq, (1 << cpu))) {
>              return; /* Ignore Non-secure access of Group0 IRQ */
>          }
>          val = 0x80 | (val >> 1); /* Non-secure view */
> @@ -414,13 +419,13 @@ void gic_set_priority(GICState *s, int cpu, int irq, uint8_t val,
>      }
>  }
>  
> -static uint32_t gic_get_priority(GICState *s, int cpu, int irq,
> +static uint32_t gic_dist_get_priority(GICState *s, int cpu, int irq,
>                                   MemTxAttrs attrs)
>  {
> -    uint32_t prio = GIC_GET_PRIORITY(irq, cpu);
> +    uint32_t prio = GIC_DIST_GET_PRIORITY(irq, cpu);
>  
>      if (s->security_extn && !attrs.secure) {
> -        if (!GIC_TEST_GROUP(irq, (1 << cpu))) {
> +        if (!GIC_DIST_TEST_GROUP(irq, (1 << cpu))) {
>              return 0; /* Non-secure access cannot read priority of Group0 IRQ */
>          }
>          prio = (prio << 1) & 0xff; /* Non-secure view */
> @@ -543,7 +548,7 @@ static bool gic_eoi_split(GICState *s, int cpu, MemTxAttrs attrs)
>  static void gic_deactivate_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs)
>  {
>      int cm = 1 << cpu;
> -    int group = gic_has_groups(s) && GIC_TEST_GROUP(irq, cm);
> +    int group = gic_has_groups(s) && GIC_DIST_TEST_GROUP(irq, cm);
>  
>      if (!gic_eoi_split(s, cpu, attrs)) {
>          /* This is UNPREDICTABLE; we choose to ignore it */
> @@ -557,7 +562,7 @@ static void gic_deactivate_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs)
>          return;
>      }
>  
> -    GIC_CLEAR_ACTIVE(irq, cm);
> +    GIC_DIST_CLEAR_ACTIVE(irq, cm);
>  }
>  
>  void gic_complete_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs)
> @@ -584,14 +589,15 @@ void gic_complete_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs)
>      if (s->revision == REV_11MPCORE) {
>          /* Mark level triggered interrupts as pending if they are still
>             raised.  */
> -        if (!GIC_TEST_EDGE_TRIGGER(irq) && GIC_TEST_ENABLED(irq, cm)
> -            && GIC_TEST_LEVEL(irq, cm) && (GIC_TARGET(irq) & cm) != 0) {
> +        if (!GIC_DIST_TEST_EDGE_TRIGGER(irq) && GIC_DIST_TEST_ENABLED(irq, cm)
> +            && GIC_DIST_TEST_LEVEL(irq, cm)
> +            && (GIC_DIST_TARGET(irq) & cm) != 0) {
>              DPRINTF("Set %d pending mask %x\n", irq, cm);
> -            GIC_SET_PENDING(irq, cm);
> +            GIC_DIST_SET_PENDING(irq, cm);
>          }
>      }
>  
> -    group = gic_has_groups(s) && GIC_TEST_GROUP(irq, cm);
> +    group = gic_has_groups(s) && GIC_DIST_TEST_GROUP(irq, cm);
>  
>      if (s->security_extn && !attrs.secure && !group) {
>          DPRINTF("Non-secure EOI for Group0 interrupt %d ignored\n", irq);
> @@ -607,7 +613,7 @@ void gic_complete_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs)
>  
>      /* In GICv2 the guest can choose to split priority-drop and deactivate */
>      if (!gic_eoi_split(s, cpu, attrs)) {
> -        GIC_CLEAR_ACTIVE(irq, cm);
> +        GIC_DIST_CLEAR_ACTIVE(irq, cm);
>      }
>      gic_update(s);
>  }
> @@ -655,7 +661,7 @@ static uint32_t gic_dist_readb(void *opaque, hwaddr offset, MemTxAttrs attrs)
>                      goto bad_reg;
>                  }
>                  for (i = 0; i < 8; i++) {
> -                    if (GIC_TEST_GROUP(irq + i, cm)) {
> +                    if (GIC_DIST_TEST_GROUP(irq + i, cm)) {
>                          res |= (1 << i);
>                      }
>                  }
> @@ -675,11 +681,11 @@ static uint32_t gic_dist_readb(void *opaque, hwaddr offset, MemTxAttrs attrs)
>          res = 0;
>          for (i = 0; i < 8; i++) {
>              if (s->security_extn && !attrs.secure &&
> -                !GIC_TEST_GROUP(irq + i, 1 << cpu)) {
> +                !GIC_DIST_TEST_GROUP(irq + i, 1 << cpu)) {
>                  continue; /* Ignore Non-secure access of Group0 IRQ */
>              }
>  
> -            if (GIC_TEST_ENABLED(irq + i, cm)) {
> +            if (GIC_DIST_TEST_ENABLED(irq + i, cm)) {
>                  res |= (1 << i);
>              }
>          }
> @@ -696,7 +702,7 @@ static uint32_t gic_dist_readb(void *opaque, hwaddr offset, MemTxAttrs attrs)
>          mask = (irq < GIC_INTERNAL) ?  cm : ALL_CPU_MASK;
>          for (i = 0; i < 8; i++) {
>              if (s->security_extn && !attrs.secure &&
> -                !GIC_TEST_GROUP(irq + i, 1 << cpu)) {
> +                !GIC_DIST_TEST_GROUP(irq + i, 1 << cpu)) {
>                  continue; /* Ignore Non-secure access of Group0 IRQ */
>              }
>  
> @@ -713,11 +719,11 @@ static uint32_t gic_dist_readb(void *opaque, hwaddr offset, MemTxAttrs attrs)
>          mask = (irq < GIC_INTERNAL) ?  cm : ALL_CPU_MASK;
>          for (i = 0; i < 8; i++) {
>              if (s->security_extn && !attrs.secure &&
> -                !GIC_TEST_GROUP(irq + i, 1 << cpu)) {
> +                !GIC_DIST_TEST_GROUP(irq + i, 1 << cpu)) {
>                  continue; /* Ignore Non-secure access of Group0 IRQ */
>              }
>  
> -            if (GIC_TEST_ACTIVE(irq + i, mask)) {
> +            if (GIC_DIST_TEST_ACTIVE(irq + i, mask)) {
>                  res |= (1 << i);
>              }
>          }
> @@ -726,7 +732,7 @@ static uint32_t gic_dist_readb(void *opaque, hwaddr offset, MemTxAttrs attrs)
>          irq = (offset - 0x400) + GIC_BASE_IRQ;
>          if (irq >= s->num_irq)
>              goto bad_reg;
> -        res = gic_get_priority(s, cpu, irq, attrs);
> +        res = gic_dist_get_priority(s, cpu, irq, attrs);
>      } else if (offset < 0xc00) {
>          /* Interrupt CPU Target.  */
>          if (s->num_cpu == 1 && s->revision != REV_11MPCORE) {
> @@ -740,7 +746,7 @@ static uint32_t gic_dist_readb(void *opaque, hwaddr offset, MemTxAttrs attrs)
>              if (irq >= 29 && irq <= 31) {
>                  res = cm;
>              } else {
> -                res = GIC_TARGET(irq);
> +                res = GIC_DIST_TARGET(irq);
>              }
>          }
>      } else if (offset < 0xf00) {
> @@ -751,14 +757,16 @@ static uint32_t gic_dist_readb(void *opaque, hwaddr offset, MemTxAttrs attrs)
>          res = 0;
>          for (i = 0; i < 4; i++) {
>              if (s->security_extn && !attrs.secure &&
> -                !GIC_TEST_GROUP(irq + i, 1 << cpu)) {
> +                !GIC_DIST_TEST_GROUP(irq + i, 1 << cpu)) {
>                  continue; /* Ignore Non-secure access of Group0 IRQ */
>              }
>  
> -            if (GIC_TEST_MODEL(irq + i))
> +            if (GIC_DIST_TEST_MODEL(irq + i)) {
>                  res |= (1 << (i * 2));
> -            if (GIC_TEST_EDGE_TRIGGER(irq + i))
> +            }
> +            if (GIC_DIST_TEST_EDGE_TRIGGER(irq + i)) {
>                  res |= (2 << (i * 2));
> +            }
>          }
>      } else if (offset < 0xf10) {
>          goto bad_reg;
> @@ -776,7 +784,7 @@ static uint32_t gic_dist_readb(void *opaque, hwaddr offset, MemTxAttrs attrs)
>          }
>  
>          if (s->security_extn && !attrs.secure &&
> -            !GIC_TEST_GROUP(irq, 1 << cpu)) {
> +            !GIC_DIST_TEST_GROUP(irq, 1 << cpu)) {
>              res = 0; /* Ignore Non-secure access of Group0 IRQ */
>          } else {
>              res = s->sgi_pending[irq][cpu];
> @@ -872,10 +880,10 @@ static void gic_dist_writeb(void *opaque, hwaddr offset,
>                      int cm = (irq < GIC_INTERNAL) ? (1 << cpu) : ALL_CPU_MASK;
>                      if (value & (1 << i)) {
>                          /* Group1 (Non-secure) */
> -                        GIC_SET_GROUP(irq + i, cm);
> +                        GIC_DIST_SET_GROUP(irq + i, cm);
>                      } else {
>                          /* Group0 (Secure) */
> -                        GIC_CLEAR_GROUP(irq + i, cm);
> +                        GIC_DIST_CLEAR_GROUP(irq + i, cm);
>                      }
>                  }
>              }
> @@ -893,26 +901,26 @@ static void gic_dist_writeb(void *opaque, hwaddr offset,
>  
>          for (i = 0; i < 8; i++) {
>              if (value & (1 << i)) {
> -                int mask =
> -                    (irq < GIC_INTERNAL) ? (1 << cpu) : GIC_TARGET(irq + i);
> +                int mask = (irq < GIC_INTERNAL) ? (1 << cpu)
> +                                                : GIC_DIST_TARGET(irq + i);
>                  int cm = (irq < GIC_INTERNAL) ? (1 << cpu) : ALL_CPU_MASK;
>  
>                  if (s->security_extn && !attrs.secure &&
> -                    !GIC_TEST_GROUP(irq + i, 1 << cpu)) {
> +                    !GIC_DIST_TEST_GROUP(irq + i, 1 << cpu)) {
>                      continue; /* Ignore Non-secure access of Group0 IRQ */
>                  }
>  
> -                if (!GIC_TEST_ENABLED(irq + i, cm)) {
> +                if (!GIC_DIST_TEST_ENABLED(irq + i, cm)) {
>                      DPRINTF("Enabled IRQ %d\n", irq + i);
>                      trace_gic_enable_irq(irq + i);
>                  }
> -                GIC_SET_ENABLED(irq + i, cm);
> +                GIC_DIST_SET_ENABLED(irq + i, cm);
>                  /* If a raised level triggered IRQ enabled then mark
>                     is as pending.  */
> -                if (GIC_TEST_LEVEL(irq + i, mask)
> -                        && !GIC_TEST_EDGE_TRIGGER(irq + i)) {
> +                if (GIC_DIST_TEST_LEVEL(irq + i, mask)
> +                        && !GIC_DIST_TEST_EDGE_TRIGGER(irq + i)) {
>                      DPRINTF("Set %d pending mask %x\n", irq + i, mask);
> -                    GIC_SET_PENDING(irq + i, mask);
> +                    GIC_DIST_SET_PENDING(irq + i, mask);
>                  }
>              }
>          }
> @@ -930,15 +938,15 @@ static void gic_dist_writeb(void *opaque, hwaddr offset,
>                  int cm = (irq < GIC_INTERNAL) ? (1 << cpu) : ALL_CPU_MASK;
>  
>                  if (s->security_extn && !attrs.secure &&
> -                    !GIC_TEST_GROUP(irq + i, 1 << cpu)) {
> +                    !GIC_DIST_TEST_GROUP(irq + i, 1 << cpu)) {
>                      continue; /* Ignore Non-secure access of Group0 IRQ */
>                  }
>  
> -                if (GIC_TEST_ENABLED(irq + i, cm)) {
> +                if (GIC_DIST_TEST_ENABLED(irq + i, cm)) {
>                      DPRINTF("Disabled IRQ %d\n", irq + i);
>                      trace_gic_disable_irq(irq + i);
>                  }
> -                GIC_CLEAR_ENABLED(irq + i, cm);
> +                GIC_DIST_CLEAR_ENABLED(irq + i, cm);
>              }
>          }
>      } else if (offset < 0x280) {
> @@ -953,11 +961,11 @@ static void gic_dist_writeb(void *opaque, hwaddr offset,
>          for (i = 0; i < 8; i++) {
>              if (value & (1 << i)) {
>                  if (s->security_extn && !attrs.secure &&
> -                    !GIC_TEST_GROUP(irq + i, 1 << cpu)) {
> +                    !GIC_DIST_TEST_GROUP(irq + i, 1 << cpu)) {
>                      continue; /* Ignore Non-secure access of Group0 IRQ */
>                  }
>  
> -                GIC_SET_PENDING(irq + i, GIC_TARGET(irq + i));
> +                GIC_DIST_SET_PENDING(irq + i, GIC_DIST_TARGET(irq + i));
>              }
>          }
>      } else if (offset < 0x300) {
> @@ -971,7 +979,7 @@ static void gic_dist_writeb(void *opaque, hwaddr offset,
>  
>          for (i = 0; i < 8; i++) {
>              if (s->security_extn && !attrs.secure &&
> -                !GIC_TEST_GROUP(irq + i, 1 << cpu)) {
> +                !GIC_DIST_TEST_GROUP(irq + i, 1 << cpu)) {
>                  continue; /* Ignore Non-secure access of Group0 IRQ */
>              }
>  
> @@ -979,7 +987,7 @@ static void gic_dist_writeb(void *opaque, hwaddr offset,
>                 for per-CPU interrupts.  It's unclear whether this is the
>                 corect behavior.  */
>              if (value & (1 << i)) {
> -                GIC_CLEAR_PENDING(irq + i, ALL_CPU_MASK);
> +                GIC_DIST_CLEAR_PENDING(irq + i, ALL_CPU_MASK);
>              }
>          }
>      } else if (offset < 0x400) {
> @@ -990,7 +998,7 @@ static void gic_dist_writeb(void *opaque, hwaddr offset,
>          irq = (offset - 0x400) + GIC_BASE_IRQ;
>          if (irq >= s->num_irq)
>              goto bad_reg;
> -        gic_set_priority(s, cpu, irq, value, attrs);
> +        gic_dist_set_priority(s, cpu, irq, value, attrs);
>      } else if (offset < 0xc00) {
>          /* Interrupt CPU Target. RAZ/WI on uniprocessor GICs, with the
>           * annoying exception of the 11MPCore's GIC.
> @@ -1016,21 +1024,21 @@ static void gic_dist_writeb(void *opaque, hwaddr offset,
>              value |= 0xaa;
>          for (i = 0; i < 4; i++) {
>              if (s->security_extn && !attrs.secure &&
> -                !GIC_TEST_GROUP(irq + i, 1 << cpu)) {
> +                !GIC_DIST_TEST_GROUP(irq + i, 1 << cpu)) {
>                  continue; /* Ignore Non-secure access of Group0 IRQ */
>              }
>  
>              if (s->revision == REV_11MPCORE) {
>                  if (value & (1 << (i * 2))) {
> -                    GIC_SET_MODEL(irq + i);
> +                    GIC_DIST_SET_MODEL(irq + i);
>                  } else {
> -                    GIC_CLEAR_MODEL(irq + i);
> +                    GIC_DIST_CLEAR_MODEL(irq + i);
>                  }
>              }
>              if (value & (2 << (i * 2))) {
> -                GIC_SET_EDGE_TRIGGER(irq + i);
> +                GIC_DIST_SET_EDGE_TRIGGER(irq + i);
>              } else {
> -                GIC_CLEAR_EDGE_TRIGGER(irq + i);
> +                GIC_DIST_CLEAR_EDGE_TRIGGER(irq + i);
>              }
>          }
>      } else if (offset < 0xf10) {
> @@ -1044,10 +1052,10 @@ static void gic_dist_writeb(void *opaque, hwaddr offset,
>          irq = (offset - 0xf10);
>  
>          if (!s->security_extn || attrs.secure ||
> -            GIC_TEST_GROUP(irq, 1 << cpu)) {
> +            GIC_DIST_TEST_GROUP(irq, 1 << cpu)) {
>              s->sgi_pending[irq][cpu] &= ~value;
>              if (s->sgi_pending[irq][cpu] == 0) {
> -                GIC_CLEAR_PENDING(irq, 1 << cpu);
> +                GIC_DIST_CLEAR_PENDING(irq, 1 << cpu);
>              }
>          }
>      } else if (offset < 0xf30) {
> @@ -1058,8 +1066,8 @@ static void gic_dist_writeb(void *opaque, hwaddr offset,
>          irq = (offset - 0xf20);
>  
>          if (!s->security_extn || attrs.secure ||
> -            GIC_TEST_GROUP(irq, 1 << cpu)) {
> -            GIC_SET_PENDING(irq, 1 << cpu);
> +            GIC_DIST_TEST_GROUP(irq, 1 << cpu)) {
> +            GIC_DIST_SET_PENDING(irq, 1 << cpu);
>              s->sgi_pending[irq][cpu] |= value;
>          }
>      } else {
> @@ -1106,7 +1114,7 @@ static void gic_dist_writel(void *opaque, hwaddr offset,
>              mask = ALL_CPU_MASK;
>              break;
>          }
> -        GIC_SET_PENDING(irq, mask);
> +        GIC_DIST_SET_PENDING(irq, mask);
>          target_cpu = ctz32(mask);
>          while (target_cpu < GIC_NCPU) {
>              s->sgi_pending[irq][target_cpu] |= (1 << cpu);
> diff --git a/hw/intc/arm_gic_common.c b/hw/intc/arm_gic_common.c
> index aee50a20e0..295ee9cc5e 100644
> --- a/hw/intc/arm_gic_common.c
> +++ b/hw/intc/arm_gic_common.c
> @@ -204,8 +204,8 @@ static void arm_gic_common_reset(DeviceState *dev)
>          }
>      }
>      for (i = 0; i < GIC_NR_SGIS; i++) {
> -        GIC_SET_ENABLED(i, ALL_CPU_MASK);
> -        GIC_SET_EDGE_TRIGGER(i);
> +        GIC_DIST_SET_ENABLED(i, ALL_CPU_MASK);
> +        GIC_DIST_SET_EDGE_TRIGGER(i);
>      }
>  
>      for (i = 0; i < ARRAY_SIZE(s->priority2); i++) {
> @@ -222,7 +222,7 @@ static void arm_gic_common_reset(DeviceState *dev)
>      }
>      if (s->security_extn && s->irq_reset_nonsecure) {
>          for (i = 0; i < GIC_MAXIRQ; i++) {
> -            GIC_SET_GROUP(i, ALL_CPU_MASK);
> +            GIC_DIST_SET_GROUP(i, ALL_CPU_MASK);
>          }
>      }
>  
> diff --git a/hw/intc/arm_gic_kvm.c b/hw/intc/arm_gic_kvm.c
> index 204369d0e2..799136732a 100644
> --- a/hw/intc/arm_gic_kvm.c
> +++ b/hw/intc/arm_gic_kvm.c
> @@ -140,10 +140,10 @@ static void translate_group(GICState *s, int irq, int cpu,
>      int cm = (irq < GIC_INTERNAL) ? (1 << cpu) : ALL_CPU_MASK;
>  
>      if (to_kernel) {
> -        *field = GIC_TEST_GROUP(irq, cm);
> +        *field = GIC_DIST_TEST_GROUP(irq, cm);
>      } else {
>          if (*field & 1) {
> -            GIC_SET_GROUP(irq, cm);
> +            GIC_DIST_SET_GROUP(irq, cm);
>          }
>      }
>  }
> @@ -154,10 +154,10 @@ static void translate_enabled(GICState *s, int irq, int cpu,
>      int cm = (irq < GIC_INTERNAL) ? (1 << cpu) : ALL_CPU_MASK;
>  
>      if (to_kernel) {
> -        *field = GIC_TEST_ENABLED(irq, cm);
> +        *field = GIC_DIST_TEST_ENABLED(irq, cm);
>      } else {
>          if (*field & 1) {
> -            GIC_SET_ENABLED(irq, cm);
> +            GIC_DIST_SET_ENABLED(irq, cm);
>          }
>      }
>  }
> @@ -171,7 +171,7 @@ static void translate_pending(GICState *s, int irq, int cpu,
>          *field = gic_test_pending(s, irq, cm);
>      } else {
>          if (*field & 1) {
> -            GIC_SET_PENDING(irq, cm);
> +            GIC_DIST_SET_PENDING(irq, cm);
>              /* TODO: Capture is level-line is held high in the kernel */
>          }
>      }
> @@ -183,10 +183,10 @@ static void translate_active(GICState *s, int irq, int cpu,
>      int cm = (irq < GIC_INTERNAL) ? (1 << cpu) : ALL_CPU_MASK;
>  
>      if (to_kernel) {
> -        *field = GIC_TEST_ACTIVE(irq, cm);
> +        *field = GIC_DIST_TEST_ACTIVE(irq, cm);
>      } else {
>          if (*field & 1) {
> -            GIC_SET_ACTIVE(irq, cm);
> +            GIC_DIST_SET_ACTIVE(irq, cm);
>          }
>      }
>  }
> @@ -195,10 +195,10 @@ static void translate_trigger(GICState *s, int irq, int cpu,
>                                uint32_t *field, bool to_kernel)
>  {
>      if (to_kernel) {
> -        *field = (GIC_TEST_EDGE_TRIGGER(irq)) ? 0x2 : 0x0;
> +        *field = (GIC_DIST_TEST_EDGE_TRIGGER(irq)) ? 0x2 : 0x0;
>      } else {
>          if (*field & 0x2) {
> -            GIC_SET_EDGE_TRIGGER(irq);
> +            GIC_DIST_SET_EDGE_TRIGGER(irq);
>          }
>      }
>  }
> @@ -207,9 +207,10 @@ static void translate_priority(GICState *s, int irq, int cpu,
>                                 uint32_t *field, bool to_kernel)
>  {
>      if (to_kernel) {
> -        *field = GIC_GET_PRIORITY(irq, cpu) & 0xff;
> +        *field = GIC_DIST_GET_PRIORITY(irq, cpu) & 0xff;
>      } else {
> -        gic_set_priority(s, cpu, irq, *field & 0xff, MEMTXATTRS_UNSPECIFIED);
> +        gic_dist_set_priority(s, cpu, irq,
> +                              *field & 0xff, MEMTXATTRS_UNSPECIFIED);
>      }
>  }
>  
> diff --git a/hw/intc/gic_internal.h b/hw/intc/gic_internal.h
> index 7fe87b13de..6f8d242904 100644
> --- a/hw/intc/gic_internal.h
> +++ b/hw/intc/gic_internal.h
> @@ -27,30 +27,31 @@
>  
>  #define GIC_BASE_IRQ 0
>  
> -#define GIC_SET_ENABLED(irq, cm) s->irq_state[irq].enabled |= (cm)
> -#define GIC_CLEAR_ENABLED(irq, cm) s->irq_state[irq].enabled &= ~(cm)
> -#define GIC_TEST_ENABLED(irq, cm) ((s->irq_state[irq].enabled & (cm)) != 0)
> -#define GIC_SET_PENDING(irq, cm) s->irq_state[irq].pending |= (cm)
> -#define GIC_CLEAR_PENDING(irq, cm) s->irq_state[irq].pending &= ~(cm)
> -#define GIC_SET_ACTIVE(irq, cm) s->irq_state[irq].active |= (cm)
> -#define GIC_CLEAR_ACTIVE(irq, cm) s->irq_state[irq].active &= ~(cm)
> -#define GIC_TEST_ACTIVE(irq, cm) ((s->irq_state[irq].active & (cm)) != 0)
> -#define GIC_SET_MODEL(irq) s->irq_state[irq].model = true
> -#define GIC_CLEAR_MODEL(irq) s->irq_state[irq].model = false
> -#define GIC_TEST_MODEL(irq) s->irq_state[irq].model
> -#define GIC_SET_LEVEL(irq, cm) s->irq_state[irq].level |= (cm)
> -#define GIC_CLEAR_LEVEL(irq, cm) s->irq_state[irq].level &= ~(cm)
> -#define GIC_TEST_LEVEL(irq, cm) ((s->irq_state[irq].level & (cm)) != 0)
> -#define GIC_SET_EDGE_TRIGGER(irq) s->irq_state[irq].edge_trigger = true
> -#define GIC_CLEAR_EDGE_TRIGGER(irq) s->irq_state[irq].edge_trigger = false
> -#define GIC_TEST_EDGE_TRIGGER(irq) (s->irq_state[irq].edge_trigger)
> -#define GIC_GET_PRIORITY(irq, cpu) (((irq) < GIC_INTERNAL) ?            \
> +#define GIC_DIST_SET_ENABLED(irq, cm) (s->irq_state[irq].enabled |= (cm))
> +#define GIC_DIST_CLEAR_ENABLED(irq, cm) (s->irq_state[irq].enabled &= ~(cm))
> +#define GIC_DIST_TEST_ENABLED(irq, cm) ((s->irq_state[irq].enabled & (cm)) != 0)
> +#define GIC_DIST_SET_PENDING(irq, cm) (s->irq_state[irq].pending |= (cm))
> +#define GIC_DIST_CLEAR_PENDING(irq, cm) (s->irq_state[irq].pending &= ~(cm))
> +#define GIC_DIST_SET_ACTIVE(irq, cm) (s->irq_state[irq].active |= (cm))
> +#define GIC_DIST_CLEAR_ACTIVE(irq, cm) (s->irq_state[irq].active &= ~(cm))
> +#define GIC_DIST_TEST_ACTIVE(irq, cm) ((s->irq_state[irq].active & (cm)) != 0)
> +#define GIC_DIST_SET_MODEL(irq) (s->irq_state[irq].model = true)
> +#define GIC_DIST_CLEAR_MODEL(irq) (s->irq_state[irq].model = false)
> +#define GIC_DIST_TEST_MODEL(irq) (s->irq_state[irq].model)
> +#define GIC_DIST_SET_LEVEL(irq, cm) (s->irq_state[irq].level |= (cm))
> +#define GIC_DIST_CLEAR_LEVEL(irq, cm) (s->irq_state[irq].level &= ~(cm))
> +#define GIC_DIST_TEST_LEVEL(irq, cm) ((s->irq_state[irq].level & (cm)) != 0)
> +#define GIC_DIST_SET_EDGE_TRIGGER(irq) (s->irq_state[irq].edge_trigger = true)
> +#define GIC_DIST_CLEAR_EDGE_TRIGGER(irq) \
> +    (s->irq_state[irq].edge_trigger = false)
> +#define GIC_DIST_TEST_EDGE_TRIGGER(irq) (s->irq_state[irq].edge_trigger)
> +#define GIC_DIST_GET_PRIORITY(irq, cpu) (((irq) < GIC_INTERNAL) ?            \
>                                      s->priority1[irq][cpu] :            \
>                                      s->priority2[(irq) - GIC_INTERNAL])
> -#define GIC_TARGET(irq) s->irq_target[irq]
> -#define GIC_CLEAR_GROUP(irq, cm) (s->irq_state[irq].group &= ~(cm))
> -#define GIC_SET_GROUP(irq, cm) (s->irq_state[irq].group |= (cm))
> -#define GIC_TEST_GROUP(irq, cm) ((s->irq_state[irq].group & (cm)) != 0)
> +#define GIC_DIST_TARGET(irq) (s->irq_target[irq])
> +#define GIC_DIST_CLEAR_GROUP(irq, cm) (s->irq_state[irq].group &= ~(cm))
> +#define GIC_DIST_SET_GROUP(irq, cm) (s->irq_state[irq].group |= (cm))
> +#define GIC_DIST_TEST_GROUP(irq, cm) ((s->irq_state[irq].group & (cm)) != 0)
>  
>  #define GICD_CTLR_EN_GRP0 (1U << 0)
>  #define GICD_CTLR_EN_GRP1 (1U << 1)
> @@ -79,8 +80,8 @@ uint32_t gic_acknowledge_irq(GICState *s, int cpu, MemTxAttrs attrs);
>  void gic_complete_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs);
>  void gic_update(GICState *s);
>  void gic_init_irqs_and_distributor(GICState *s);
> -void gic_set_priority(GICState *s, int cpu, int irq, uint8_t val,
> -                      MemTxAttrs attrs);
> +void gic_dist_set_priority(GICState *s, int cpu, int irq, uint8_t val,
> +                           MemTxAttrs attrs);
>  
>  static inline bool gic_test_pending(GICState *s, int irq, int cm)
>  {
> @@ -93,7 +94,7 @@ static inline bool gic_test_pending(GICState *s, int irq, int cm)
>           * GICD_ISPENDR to set the state pending.
>           */
>          return (s->irq_state[irq].pending & cm) ||
> -            (!GIC_TEST_EDGE_TRIGGER(irq) && GIC_TEST_LEVEL(irq, cm));
> +            (!GIC_DIST_TEST_EDGE_TRIGGER(irq) && GIC_DIST_TEST_LEVEL(irq, cm));
>      }
>  }
>  
> 
