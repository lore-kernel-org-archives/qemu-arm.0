Received: by 10.25.208.211 with SMTP id h202csp2294477lfg;
        Wed, 24 Feb 2016 06:47:38 -0800 (PST)
X-Received: by 10.140.157.214 with SMTP id d205mr52407204qhd.3.1456325257975;
        Wed, 24 Feb 2016 06:47:37 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u3si3071058qka.23.2016.02.24.06.47.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 24 Feb 2016 06:47:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:36279 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aYaj3-00039X-CD
	for alex.bennee@linaro.org; Wed, 24 Feb 2016 09:47:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42657)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aYaig-0002ro-Tc
	for qemu-devel@nongnu.org; Wed, 24 Feb 2016 09:47:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aYaif-0004CI-OH
	for qemu-devel@nongnu.org; Wed, 24 Feb 2016 09:47:14 -0500
Received: from mail-vk0-x233.google.com ([2607:f8b0:400c:c05::233]:33014)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aYaie-0004C1-GD
	for qemu-devel@nongnu.org; Wed, 24 Feb 2016 09:47:13 -0500
Received: by mail-vk0-x233.google.com with SMTP id k196so18770007vka.0
	for <qemu-devel@nongnu.org>; Wed, 24 Feb 2016 06:47:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=FYOMAPfXUH+ME9P4LRinxn6CReUPaNZ2VwoJXFXxQts=;
	b=W0mHYfVOyZ2Ow0w3G6CSwG0HKAqVD45ij81PgTPzE6FeX4Apbi1AzAqP4lHgmWgL8J
	+uTKYDRciOQZTIuSTiXux6Blfjl0WuzlwyVDCNXTz4uLOmaxsUjgM2T+GRT9U0yeoknN
	U5X3ae1co8W/S8NnYXFGbgws7jUNl7w3ahuZ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=FYOMAPfXUH+ME9P4LRinxn6CReUPaNZ2VwoJXFXxQts=;
	b=LwIaoziTFRv4s8eBNVa5doumAfHwuDnQJos0rzpzwADoRFJs3Yufn2j9Fvy4ojXaU2
	zgwcFMaJyrsD+DV58LAaxjnkeEvXb7iMS0mSYdgPdFcRX2S39GkNtvV6zAmT09ceyunC
	+E4uD6pgS5eWSy8sI4tLXJUcKf0IZbC1Y054XBPtFiCJ5GzWppI0kyP4C3nT4SaQKDpS
	p5hH58+s5fcFf/Qdk+O8kiuaIGVLgsdSOnfbl7uosAo9czlV8AtOdaA31LWgWxa4Z8Ft
	HmkLuTv8d0KgZuOTK2J5JyZ3MUxxUKioLaMoLPxgoAWLrZVq7B0GKjEsTuwN49AY4rM/
	lskw==
X-Gm-Message-State: AG10YOTMN4DD8C5pI+e7eSD/gu7q3RgOVUAqn7nMtxAdjB2X8gU0mn6FZHnryQ4xY1v+gVDX7+xv3xg3QQZNvTrF
X-Received: by 10.31.141.2 with SMTP id p2mr33472958vkd.37.1456325232026; Wed,
	24 Feb 2016 06:47:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Wed, 24 Feb 2016 06:46:52 -0800 (PST)
In-Reply-To: <CAHzK-V0PNTEotDoHAgNY8_wVnym0fkm+kY+6wh4gwEXZrT+4Gw@mail.gmail.com>
References: <1456172720-12650-1-git-send-email-peter.maydell@linaro.org>
	<1456172720-12650-2-git-send-email-peter.maydell@linaro.org>
	<CAHzK-V0PNTEotDoHAgNY8_wVnym0fkm+kY+6wh4gwEXZrT+4Gw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 24 Feb 2016 14:46:52 +0000
Message-ID: <CAFEAcA_e5oeBLqj+PebwEPGJkVi_CYpANOb+qrkz21fTAbM9Sg@mail.gmail.com>
To: Shlomo Pongratz <shlomopongratz@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::233
Cc: Shlomo Pongratz <shlomo.pongratz@huawei.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Pavel Fedin <p.fedin@samsung.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [Qemu-devel] [RFC 1/5] hw/intc/arm_gicv3_common: Add state
	information
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: zHK1gGMMUuyg

On 24 February 2016 at 12:50, Shlomo Pongratz <shlomopongratz@gmail.com> wrote:
>
>
> On Monday, February 22, 2016, Peter Maydell <peter.maydell@linaro.org>
> wrote:
>>
>> +struct GICv3CPUState {
>> +    uint64_t affinity_id;            /* Cached affinity ID of the CPU */
>> +
>> +    /* Redistributor */
>> +    uint32_t level;                  /* Current IRQ level */
>> +    /* RD_base page registers */
>> +    uint32_t gicr_ctlr;
>> +    uint32_t gicr_waker;
>> +    uint64_t gicr_propbaser;
>> +    uint64_t gicr_pendbaser;
>> +    /* SGI_base page registers */
>> +    uint32_t gicr_igroupr0;
>> +    uint32_t gicr_ienabler0;
>> +    uint32_t gicr_ipendr0;
>> +    uint32_t gicr_iactiver0;
>> +    uint32_t gicr_icfgr0;
>> +    uint32_t gicr_icfgr1;
>> +    uint8_t gicr_ipriorityr[GIC_INTERNAL];
>> +
>> +    /* CPU interface */
>> +    uint64_t icc_ctlr_el1[2];
>> +    uint64_t icc_pmr_el1;
>> +    uint64_t icc_bpr[2];
>> +    uint64_t icc_ap1r[4][2];
>> +    uint64_t icc_igrpen0_el1;
>> +    uint64_t icc_igrpen1_el1;
>> +};
>> +
>> +typedef struct GICv3CPUState GICv3CPUState;
>> +
>> +struct GICv3State {
>>      /*< private >*/
>>      SysBusDevice parent_obj;
>>      /*< public >*/
>> @@ -41,9 +83,61 @@ typedef struct GICv3State {
>>      uint32_t num_irq;
>>      uint32_t revision;
>>      bool security_extn;
>> +    bool irq_reset_nonsecure;
>>
>>      int dev_fd; /* kvm device fd if backed by kvm vgic support */
>> -} GICv3State;
>> +    Error *migration_blocker;
>> +
>> +    /* Distributor */
>> +
>> +    /* for a GIC with the security extensions the NS banked version of
>> this
>> +     * register is just an alias of bit 1 of the S banked version.
>> +     */
>> +    uint32_t gicd_ctlr;
>> +    DECLARE_BITMAP(group, GICV3_MAXSPI);        /* GICD_IGROUPR */
>> +    DECLARE_BITMAP(enabled, GICV3_MAXSPI);      /* GICD_ISENABLER */
>> +    DECLARE_BITMAP(pending, GICV3_MAXSPI);      /* GICD_ISPENDR */
>> +    DECLARE_BITMAP(active, GICV3_MAXSPI);       /* GICD_ISACTIVER */
>> +    DECLARE_BITMAP(level, GICV3_MAXSPI);        /* Current level */
>> +    DECLARE_BITMAP(edge_trigger, GICV3_MAXSPI); /* GICD_ICFGR */
>> +    uint8_t gicd_ipriority[GICV3_MAXSPI];
>> +    uint8_t gicd_itargetsr[GICV3_MAXSPI];
>> +    uint64_t gicd_irouter[GICV3_MAXSPI];
>> +
>> +    GICv3CPUState *cpu;
>> +};

> I just wonder why the internal interrupts are excluded from the new
> GICv3State and the new access API don't handle them?
> Is it because they aren't required by KVM?
> I see that they are only referenced in gicr_ipriority.
>
> What am I missing?

Which internal interrupts did you have in mind? In GICv3
the PPIs and SGIs have state which lives in the redistributor
(in this data structure layout that's in the gicr_ipendr0,
gicr_ienabler0, etc in each GICv3CPUState struct). SPIs
have state which lives in the distributor (that's the
enabled/pending/etc bitmaps in the GICv3State struct).

I removed the confusing macros which tried to make the
two things appear the same (letting you mark an interrupt
as enabled whether the irq was for an SGI/PPI or an SPI)
because we shouldn't need them. The emulation code should
clearly separate the responsibilities of the distributor
from those of the redistributor (as happens in the real
hardware), and so it should in general already know what
kind of interrupt it's dealing with, and be able to just
work directly with the right data structure. If it looks
like you need a single accessor that works on both SGI/PPI
and SPI it's probably an indication that the code should
be restructured.

thanks
-- PMM
