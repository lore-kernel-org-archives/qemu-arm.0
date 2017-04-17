Received: by 10.25.0.144 with SMTP id 138csp1124737lfa;
        Sun, 16 Apr 2017 21:11:28 -0700 (PDT)
X-Received: by 10.55.188.65 with SMTP id m62mr6158214qkf.259.1492402288470;
        Sun, 16 Apr 2017 21:11:28 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p123si9703935qkf.234.2017.04.16.21.11.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 16 Apr 2017 21:11:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34778 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1czy0d-0008Uh-Vv
	for alex.bennee@linaro.org; Mon, 17 Apr 2017 00:11:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59722)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1czxzm-0008A8-H4
	for qemu-devel@nongnu.org; Mon, 17 Apr 2017 00:10:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1czxzi-0008Mf-GR
	for qemu-devel@nongnu.org; Mon, 17 Apr 2017 00:10:34 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:36176)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1czxzi-0008MT-Bz; Mon, 17 Apr 2017 00:10:30 -0400
Received: by mail-qk0-x241.google.com with SMTP id v75so18069466qkb.3;
	Sun, 16 Apr 2017 21:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=0H8jMUKTIYJCDvqu9QzeftM4Hbj8weaICvTWs8H29zU=;
	b=R4Peh8tXDPKxk7dHPNzPXmJRGQaMBHYYPAsmL0lGnaC3+tg6KwB2sTDGm1P4mSHrpR
	13LeDNsn0RXuw28K6KrG04107Y4Mm2yjqhT6tECw5EqqsG87jSLQW61t1PgA+R/OFFWU
	VdJBJTS7FxwxkNg/m2MLUXfCNostP8yaCA4qbYO03OMKLy/LiZFWJKZEyc9b7hz7QRFx
	EEz6s2qkEJ3UKnUCYOYzmGANd7At7JMAZ+jM/lQf1fBZ3zMBMnbkAv7WVnAwI4Eg6cn/
	HGzaqEqh67tzaoso5llN43a2Y9NxiRrggxUi421o18+iRzsT65XLV5UACwtkv04MGA7p
	AxLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=0H8jMUKTIYJCDvqu9QzeftM4Hbj8weaICvTWs8H29zU=;
	b=jwu91NQRCTL94xcnSEUZG6UFXMaGZQ/OzN2TXG1igst33z++fTBTkdy6Wfp7o1D7kq
	LQRRgeMjYpncFg9BROVO0eJhPB1YABx5f6hfMB9sGk1th1OpAeAWyAPSA2YV+wL9+8Xj
	fk4jISHQKYGtz6XIdKGiDypCyRr5CUanFUPEpjTL9SWp89KH8a7mei5aZ5xduYXgqP4J
	UtiMeVctFI3CKESQnSD2KeVC8HkzvIkSPq5n97VY3yoT2cbsWkOW9+gscP1zlXQutxlR
	JEuhbSA6pzYZw7ASnAPOX4FZM9LBNUAii4E1apr2Ls5PeBYEoJK35a3AD20HlCxn6B4k
	lD1w==
X-Gm-Message-State: AN3rC/4y1sNKdCNmyjXZZonPyiMLkrl7kBK3cWmF0PYKiFiOgVqPOruG
	nAgVPJhKUwY8MA==
X-Received: by 10.55.40.197 with SMTP id o66mr7644773qko.59.1492402229744;
	Sun, 16 Apr 2017 21:10:29 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id 1sm6464229qtb.40.2017.04.16.21.10.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 16 Apr 2017 21:10:29 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1487262963-11519-1-git-send-email-peter.maydell@linaro.org>
	<1487262963-11519-6-git-send-email-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b3c7907d-ab29-486c-102f-760b12e99688@amsat.org>
Date: Mon, 17 Apr 2017 01:10:26 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1487262963-11519-6-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH v2 05/13] arm: gic: Remove
 references to NVIC
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
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VwVWZtRKo12l

On 02/16/2017 01:35 PM, Peter Maydell wrote:
> From: Michael Davidsaver <mdavidsaver@gmail.com>
>
> Now that the NVIC is its own separate implementation, we can
> clean up the GIC code by removing REV_NVIC and conditionals
> which use it.
>
> Signed-off-by: Michael Davidsaver <mdavidsaver@gmail.com>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  hw/intc/gic_internal.h   |  7 ++-----
>  hw/intc/arm_gic.c        | 31 +++++--------------------------
>  hw/intc/arm_gic_common.c | 23 ++++++++---------------
>  3 files changed, 15 insertions(+), 46 deletions(-)
>
> diff --git a/hw/intc/gic_internal.h b/hw/intc/gic_internal.h
> index 3f31174..7fe87b1 100644
> --- a/hw/intc/gic_internal.h
> +++ b/hw/intc/gic_internal.h
> @@ -25,9 +25,7 @@
>
>  #define ALL_CPU_MASK ((unsigned)(((1 << GIC_NCPU) - 1)))
>
> -/* The NVIC has 16 internal vectors.  However these are not exposed
> -   through the normal GIC interface.  */
> -#define GIC_BASE_IRQ ((s->revision == REV_NVIC) ? 32 : 0)
> +#define GIC_BASE_IRQ 0
>
>  #define GIC_SET_ENABLED(irq, cm) s->irq_state[irq].enabled |= (cm)
>  #define GIC_CLEAR_ENABLED(irq, cm) s->irq_state[irq].enabled &= ~(cm)
> @@ -75,7 +73,6 @@
>
>  /* The special cases for the revision property: */
>  #define REV_11MPCORE 0
> -#define REV_NVIC 0xffffffff
>
>  void gic_set_pending_private(GICState *s, int cpu, int irq);
>  uint32_t gic_acknowledge_irq(GICState *s, int cpu, MemTxAttrs attrs);
> @@ -87,7 +84,7 @@ void gic_set_priority(GICState *s, int cpu, int irq, uint8_t val,
>
>  static inline bool gic_test_pending(GICState *s, int irq, int cm)
>  {
> -    if (s->revision == REV_NVIC || s->revision == REV_11MPCORE) {
> +    if (s->revision == REV_11MPCORE) {
>          return s->irq_state[irq].pending & cm;
>      } else {
>          /* Edge-triggered interrupts are marked pending on a rising edge, but
> diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
> index 521aac3..8e5a9d8 100644
> --- a/hw/intc/arm_gic.c
> +++ b/hw/intc/arm_gic.c
> @@ -156,17 +156,6 @@ static void gic_set_irq_11mpcore(GICState *s, int irq, int level,
>      }
>  }
>
> -static void gic_set_irq_nvic(GICState *s, int irq, int level,
> -                                 int cm, int target)
> -{
> -    if (level) {
> -        GIC_SET_LEVEL(irq, cm);
> -        GIC_SET_PENDING(irq, target);
> -    } else {
> -        GIC_CLEAR_LEVEL(irq, cm);
> -    }
> -}
> -
>  static void gic_set_irq_generic(GICState *s, int irq, int level,
>                                  int cm, int target)
>  {
> @@ -214,8 +203,6 @@ static void gic_set_irq(void *opaque, int irq, int level)
>
>      if (s->revision == REV_11MPCORE) {
>          gic_set_irq_11mpcore(s, irq, level, cm, target);
> -    } else if (s->revision == REV_NVIC) {
> -        gic_set_irq_nvic(s, irq, level, cm, target);
>      } else {
>          gic_set_irq_generic(s, irq, level, cm, target);
>      }
> @@ -367,7 +354,7 @@ uint32_t gic_acknowledge_irq(GICState *s, int cpu, MemTxAttrs attrs)
>          return 1023;
>      }
>
> -    if (s->revision == REV_11MPCORE || s->revision == REV_NVIC) {
> +    if (s->revision == REV_11MPCORE) {
>          /* Clear pending flags for both level and edge triggered interrupts.
>           * Level triggered IRQs will be reasserted once they become inactive.
>           */
> @@ -589,11 +576,6 @@ void gic_complete_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs)
>              DPRINTF("Set %d pending mask %x\n", irq, cm);
>              GIC_SET_PENDING(irq, cm);
>          }
> -    } else if (s->revision == REV_NVIC) {
> -        if (GIC_TEST_LEVEL(irq, cm)) {
> -            DPRINTF("Set nvic %d pending mask %x\n", irq, cm);
> -            GIC_SET_PENDING(irq, cm);
> -        }
>      }
>
>      group = gic_has_groups(s) && GIC_TEST_GROUP(irq, cm);
> @@ -768,7 +750,7 @@ static uint32_t gic_dist_readb(void *opaque, hwaddr offset, MemTxAttrs attrs)
>      } else if (offset < 0xf10) {
>          goto bad_reg;
>      } else if (offset < 0xf30) {
> -        if (s->revision == REV_11MPCORE || s->revision == REV_NVIC) {
> +        if (s->revision == REV_11MPCORE) {
>              goto bad_reg;
>          }
>
> @@ -802,9 +784,6 @@ static uint32_t gic_dist_readb(void *opaque, hwaddr offset, MemTxAttrs attrs)
>              case 2:
>                  res = gic_id_gicv2[(offset - 0xfd0) >> 2];
>                  break;
> -            case REV_NVIC:
> -                /* Shouldn't be able to get here */
> -                abort();
>              default:
>                  res = 0;
>              }
> @@ -1028,7 +1007,7 @@ static void gic_dist_writeb(void *opaque, hwaddr offset,
>                  continue; /* Ignore Non-secure access of Group0 IRQ */
>              }
>
> -            if (s->revision == REV_11MPCORE || s->revision == REV_NVIC) {
> +            if (s->revision == REV_11MPCORE) {
>                  if (value & (1 << (i * 2))) {
>                      GIC_SET_MODEL(irq + i);
>                  } else {
> @@ -1046,7 +1025,7 @@ static void gic_dist_writeb(void *opaque, hwaddr offset,
>          goto bad_reg;
>      } else if (offset < 0xf20) {
>          /* GICD_CPENDSGIRn */
> -        if (s->revision == REV_11MPCORE || s->revision == REV_NVIC) {
> +        if (s->revision == REV_11MPCORE) {
>              goto bad_reg;
>          }
>          irq = (offset - 0xf10);
> @@ -1060,7 +1039,7 @@ static void gic_dist_writeb(void *opaque, hwaddr offset,
>          }
>      } else if (offset < 0xf30) {
>          /* GICD_SPENDSGIRn */
> -        if (s->revision == REV_11MPCORE || s->revision == REV_NVIC) {
> +        if (s->revision == REV_11MPCORE) {
>              goto bad_reg;
>          }
>          irq = (offset - 0xf20);
> diff --git a/hw/intc/arm_gic_common.c b/hw/intc/arm_gic_common.c
> index 4a8df44..70f1134 100644
> --- a/hw/intc/arm_gic_common.c
> +++ b/hw/intc/arm_gic_common.c
> @@ -99,9 +99,7 @@ void gic_init_irqs_and_mmio(GICState *s, qemu_irq_handler handler,
>       *  [N+32..N+63] PPIs for CPU 1
>       *   ...
>       */
> -    if (s->revision != REV_NVIC) {
> -        i += (GIC_INTERNAL * s->num_cpu);
> -    }
> +    i += (GIC_INTERNAL * s->num_cpu);
>      qdev_init_gpio_in(DEVICE(s), handler, i);
>
>      for (i = 0; i < s->num_cpu; i++) {
> @@ -121,16 +119,12 @@ void gic_init_irqs_and_mmio(GICState *s, qemu_irq_handler handler,
>      memory_region_init_io(&s->iomem, OBJECT(s), ops, s, "gic_dist", 0x1000);
>      sysbus_init_mmio(sbd, &s->iomem);
>
> -    if (s->revision != REV_NVIC) {
> -        /* This is the main CPU interface "for this core". It is always
> -         * present because it is required by both software emulation and KVM.
> -         * NVIC is not handled here because its CPU interface is different,
> -         * neither it can use KVM.
> -         */
> -        memory_region_init_io(&s->cpuiomem[0], OBJECT(s), ops ? &ops[1] : NULL,
> -                              s, "gic_cpu", s->revision == 2 ? 0x2000 : 0x100);
> -        sysbus_init_mmio(sbd, &s->cpuiomem[0]);
> -    }
> +    /* This is the main CPU interface "for this core". It is always
> +     * present because it is required by both software emulation and KVM.
> +     */
> +    memory_region_init_io(&s->cpuiomem[0], OBJECT(s), ops ? &ops[1] : NULL,
> +                          s, "gic_cpu", s->revision == 2 ? 0x2000 : 0x100);
> +    sysbus_init_mmio(sbd, &s->cpuiomem[0]);
>  }
>
>  static void arm_gic_common_realize(DeviceState *dev, Error **errp)
> @@ -162,7 +156,7 @@ static void arm_gic_common_realize(DeviceState *dev, Error **errp)
>      }
>
>      if (s->security_extn &&
> -        (s->revision == REV_11MPCORE || s->revision == REV_NVIC)) {
> +        (s->revision == REV_11MPCORE)) {
>          error_setg(errp, "this GIC revision does not implement "
>                     "the security extensions");
>          return;
> @@ -255,7 +249,6 @@ static Property arm_gic_common_properties[] = {
>      DEFINE_PROP_UINT32("num-irq", GICState, num_irq, 32),
>      /* Revision can be 1 or 2 for GIC architecture specification
>       * versions 1 or 2, or 0 to indicate the legacy 11MPCore GIC.
> -     * (Internally, 0xffffffff also indicates "not a GIC but an NVIC".)
>       */
>      DEFINE_PROP_UINT32("revision", GICState, revision, 1),
>      /* True if the GIC should implement the security extensions */
>
