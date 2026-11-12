Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B78D60A263F
	for <qemu-arm@archiver.kernel.org>; Thu, 12 Nov 2026 18:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=jCgnN1zD
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xRa17-0008HF-Qo; Thu, 12 Nov 2026 13:59:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gromero@redhat.com>)
 id 1xRa10-00087K-PO
 for qemu-arm@nongnu.org; Thu, 12 Nov 2026 13:59:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gromero@redhat.com>)
 id 1xRa0y-0003MU-Ko
 for qemu-arm@nongnu.org; Thu, 12 Nov 2026 13:59:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1794509955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NtRBhOHjeOzTzWjg6DXPe7MhMpeEzOdFi3EEngytfa4=;
 b=jCgnN1zDi83H84MA7iwzPIulJTb7dxxHVaYC5t56d0yWc+y0Bz5qe0wWD2+xST/db7vCv5
 dApK96+ZmTRXiXhMRS4wEApOejFc4dTjsXRgmyChJToT1rv3gSz2WY0wQ/9gMqcN2T4FiL
 3ESuwREjH53tUs1fvsxMUzdUWGFeceU=
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com
 [74.125.82.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-459-G7frDqQyMXW3O8FEB_J-OQ-1; Thu, 12 Nov 2026 13:59:12 -0500
X-MC-Unique: G7frDqQyMXW3O8FEB_J-OQ-1
X-Mimecast-MFC-AGG-ID: G7frDqQyMXW3O8FEB_J-OQ_1794509951
Received: by mail-dl1-f69.google.com with SMTP id
 a92af1059eb24-16bc6f3fdb1so23137c88.0
 for <qemu-arm@nongnu.org>; Thu, 12 Nov 2026 10:59:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794509951; x=1795114751;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=NtRBhOHjeOzTzWjg6DXPe7MhMpeEzOdFi3EEngytfa4=;
 b=BXTSxvw63cQRh2ct0xgTI9eMEEiZrHIC3a8fuNvA9btlivGa4G3H41H4futaiX71We
 fCYeLTCbcpjTQHuO7rfwUuRaoU+AkIo12D4JLnzzoITRPTyzNotV1BFjzqSjX3dJy/gP
 5f9dmmA+fPk6AoaGJFlazl95U+VoHTQb9u1oIOHkOOzgbp+Mia7BcBLa57HBOdciRQxd
 3okXEFF88gzT7WIkiX2xxfEMOE6jRwuoEEMO+jvi110NN+C57mk/Zh7T+jkk3HrN4rzQ
 YIXn+3td8sV+ABpY3dAgq1ZKlHKrJb4bzBq/t0U/yjdVNAwmu/WOjz9fToX+DWknXsqa
 pR8g==
X-Forwarded-Encrypted: i=1;
 AL+hErGktIpda6dBuJBagfW6hmYR1PutKEj97qFYnkHK3IAYRh6YW1fs1SV2HkDIyUY5aSJQFGPgsKMy4g==@nongnu.org
X-Gm-Message-State: APuU4Z8+JWPWKIRc6JnixnY6Q1pgxCCqIfAN7nNd5HhZagUNdrNNR/y5
 844ykf944GPrJoSmacFKZ/Ki2fxkzjurykHwOj6u/iWrimlx0mb9FP3EC11sz6jF//HrvcXs5ur
 9ijlkejzCyPXLDGeW1G0vlaWz8HbM3HyJ0EmuCMWiococDPR6ieZr5Q==
X-Gm-Gg: AYBFou25/u0wrwRQoy8uz9ei4XOFYT188JV7xT2rfYVJkqaT4B74mbutP79w633Zhtq
 iI1mgtzdPSmGuDF8ETmh0vPlC9Y6HGE+U+fWn4OnLBv9F1+HLLcQ3ukuQTWHnlnYYgK4lYNqP6J
 LUwcMWGPWyyaENhJyru228AT5VAKlRa6WWVuYHn8X8nyrG+5aXpQUVMfPY3k2jIWXjYrYgQT6Yd
 +U8BiqWWb2SVTuX2mPVwOifSk43F0Ntz0CLHv2ddelgpQAaOXxOIynlBnD8POKSNfuv/HTwAyHj
 9aWh/TqqZ5JUPZzDH6of28e2ijPT0WYbib6hkK3nmGfsiHTVvxrrFW8oytGSW1iWjPiRbWJr2+C
 jE7PqEIHk+GCbCAySlLjauGdNyagYxYQF
X-Received: by 2002:a05:7022:3a87:b0:1a0:b8f5:872d with SMTP id
 a92af1059eb24-1b5030683c8mr439742c88.4.1794509950800; 
 Thu, 12 Nov 2026 10:59:10 -0800 (PST)
X-Received: by 2002:a05:7022:3a87:b0:1a0:b8f5:872d with SMTP id
 a92af1059eb24-1b5030683c8mr439715c88.4.1794509950112; 
 Thu, 12 Nov 2026 10:59:10 -0800 (PST)
Received: from x1 ([187.15.85.204]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1b5031b2519sm718289c88.13.2026.11.12.10.59.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2026 10:59:09 -0800 (PST)
Date: Thu, 12 Nov 2026 19:59:00 +0100
From: Gustavo Romero <gromero@redhat.com>
To: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Cc: Jim MacArthur <jim.macarthur@linaro.org>, qemu-devel@nongnu.org, 
 Eric Auger <eric.auger@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Leif Lindholm <leif.lindholm@oss.qualcomm.com>
Subject: Re: [PATCH 2/2] hw/arm/sbsa-ref.c: Increase SMMU space for Root
 registers
Message-ID: <xl3axqq44u62xqw2gahgo4cehbapbirkywpbkyx547mdya7ycs@qekmzwnxmco7>
References: <20261016-jmac-smmu-root-registers-v1-0-e78e8879d347@linaro.org>
 <20261016-jmac-smmu-root-registers-v1-2-e78e8879d347@linaro.org>
 <dxrwkmt76n62imxwycc6j2mcjihdhqmhukzc3ypojuepkprzsp@dm4yqcp75wrt>
 <avSYUeEmFFBdVePq@linaro.org>
 <47529a98-e02d-4cfe-a8b5-8b3f44bda15c@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <47529a98-e02d-4cfe-a8b5-8b3f44bda15c@oss.qualcomm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jAcT47szM_AP0trS80Hus7956dYeNkuLCKCsOAdGPNU_1794509951
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gromero@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Jim and Pierrick,

On Wed, Nov 11, 2026 at 10:10:18AM -0800, Pierrick Bouvier wrote:
> On 11/11/2026 8:31 AM, Jim MacArthur wrote:
> > On Fri, Nov 06, 2026 at 11:21:12PM +0100, Gustavo Romero wrote:
> >> Hi Jim,
> >>
> >> On Fri, Oct 16, 2026 at 10:40:52AM +0100, Jim MacArthur wrote:
> >>> In our implementation, SMMU Root registers are directly after the
> >>> non-optional SMMU registers. Realms registers will be added above the
> >>> root registers later.
> >>
> >> nit: Root registers
> > 
> > Noted.
> > 
> >>
> >>
> >>>
> >>> Signed-off-by: Jim MacArthur <jim.macarthur@linaro.org>
> >>> ---
> >>>  hw/arm/sbsa-ref.c | 2 +-
> >>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
> >>> index 158b461eb4..0747f5ca9f 100644
> >>> --- a/hw/arm/sbsa-ref.c
> >>> +++ b/hw/arm/sbsa-ref.c
> >>> @@ -129,7 +129,7 @@ static const MemMapEntry sbsa_ref_memmap[] = {
> >>>      [SBSA_GPIO] =               { 0x60020000, 0x00001000 },
> >>>      [SBSA_SECURE_UART] =        { 0x60030000, 0x00001000 },
> >>>      [SBSA_SECURE_UART_MM] =     { 0x60040000, 0x00001000 },
> >>> -    [SBSA_SMMU] =               { 0x60050000, 0x00020000 },
> >>> +    [SBSA_SMMU] =               { 0x60050000, 0x00040000 },
> >>
> >> Why +0x20000 bytes here instead of +0x10000 bytes (1 x 64K page)?
> > 
> > Ultimately the plan is to add the Realm registers in here as well, and
> > those have to be at a 128K-aligned offset from the SMMU base, so per the
> > original plan they would have started at 0x40000. Now that you mention it
> > though, it makes more sense to slot the Realm registers in at offset 0x20000
> > and move the Root registers to 0x40000 when we do so - which means we still
> > have space in the memory map for a second SMMU. So for now, I'll trim
> > this back to +0x10000.
> > 
> >>
> >> Most importantly, incresing the size of the SBSA_SMMU index is not enough, we
> >> need to increase also the size of the "arm-smmuv3" container (memory region).
> >>
> >> With this change applied I still see:
> >>
> >> 0000000060050000-000000006006ffff (prio 0, i/o): arm-smmuv3
> > 
> > Thanks, I hadn't spotted that the actual allocation was specified separately;
> > I'll fix that in the next version.
> > 
> >>
> >> on (qemu) info mtree.
> >>
> >> 2 x 64K pages: Page 0 and Page 1. Rather we should see a range to fit 3 x 64K:
> >>
> >> 0000000060050000-000000006007ffff (prio 0, i/o): arm-smmuv3
> >>
> >> Another issue, afaics, is that the Root register page will be added to
> >> every machine that uses the SMMUv3 device, right? Because we're not gating the
> >> addition of Root registers based on the presence of RME.
> >>
> >> So I think we should add one boolean "x-root" property (flag) to the SMMUv3
> >> device that will be used to increase the size of the "arm-smmuv3" if it's set
> >> and let it by default set to "false".
> >>
> >> This "x-root" property would be set at the machine level, so via
> >> object_property_set_bool() in create_smmu. For example:
> >>
> >> diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
> >> index 0747f5ca9f..36b0164510 100644
> >> --- a/hw/arm/sbsa-ref.c
> >> +++ b/hw/arm/sbsa-ref.c
> >> @@ -630,6 +630,7 @@ static void create_smmu(const SBSAMachineState *sms, PCIBus *bus,
> >>                               &error_abort);
> >>      object_property_set_link(OBJECT(dev), "secure-memory", OBJECT(secure_sysmem),
> >>                               &error_abort);
> >> +    object_property_set_bool(OBJECT(dev), "x-root", true, &error_abort);
> >>      sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> >>      sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
> >>      for (i = 0; i < NUM_SMMU_IRQS; i++) {
> >> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> >> index 9d9bc2601b..9912fbf920 100644
> >> --- a/hw/arm/smmuv3.c
> >> +++ b/hw/arm/smmuv3.c
> >> @@ -2267,6 +2267,7 @@ static void smmu_realize(DeviceState *d, Error **errp)
> >>      SMMUv3Class *c = ARM_SMMUV3_GET_CLASS(s);
> >>      SysBusDevice *dev = SYS_BUS_DEVICE(d);
> >>      Error *local_err = NULL;
> >> +    uint64_t size = SMMUV3_REGS_SIZE;
> >>  
> >>      if (!smmu_validate_property(s, errp)) {
> >>          return;
> >> @@ -2291,8 +2292,12 @@ static void smmu_realize(DeviceState *d, Error **errp)
> >>  
> >>      qemu_mutex_init(&s->mutex);
> >>  
> >> +    if (s->has_root) {
> >> +        size += SMMUV3_ROOT_PAGE_SIZE;
> >> +    }
> >> +
> >>      memory_region_init_io(&sys->iomem, OBJECT(s),
> >> -                          &smmu_mem_ops, sys, TYPE_ARM_SMMUV3, 0x20000);
> >> +                          &smmu_mem_ops, sys, TYPE_ARM_SMMUV3, size);
> >>  
> >>      sys->mrtypename = TYPE_SMMUV3_IOMMU_MEMORY_REGION;
> >>  
> >> @@ -2382,6 +2387,7 @@ static const Property smmuv3_properties[] = {
> >>      /* Identifier used for ACPI IORT SMMUv3 (and DSDT for CMDQV) generation */
> >>      DEFINE_PROP_UINT8("identifier", SMMUv3State, identifier, 0),
> >>      DEFINE_PROP_BOOL("accel", SMMUv3State, accel, false),
> >> +    DEFINE_PROP_BOOL("x-root", SMMUv3State, has_root, false),
> >>      /* GPA of MSI doorbell, for SMMUv3 accel use. */
> >>      DEFINE_PROP_UINT64("msi-gpa", SMMUv3State, msi_gpa, 0),
> >>      /*
> >> diff --git a/include/hw/arm/smmuv3-common.h b/include/hw/arm/smmuv3-common.h
> >> index a538334066..5d1cb759c3 100644
> >> --- a/include/hw/arm/smmuv3-common.h
> >> +++ b/include/hw/arm/smmuv3-common.h
> >> @@ -411,7 +411,10 @@ REG32(EVENTQ_IRQ_CFG2,     0xbc)
> >>  
> >>  #define A_IDREGS           0xfd0
> >>  
> >> -#define SMMU_ROOT_REG_START 0x20000
> >> +#define SMMUV3_PAGE_SIZE        0x10000
> >> +#define SMMUV3_REGS_SIZE        (2 * SMMUV3_PAGE_SIZE) /* Page 0 and Page 1 */
> >> +#define SMMUV3_ROOT_REG_OFFSET  0x20000
> >> +#define SMMUV3_ROOT_PAGE_SIZE   SMMUV3_PAGE_SIZE
> >>  
> >>  REG32(ROOT_IDR0,            0x0)
> >>      FIELD(ROOT_IDR0, ROOT_IMPL,   0,  1)
> >> diff --git a/include/hw/arm/smmuv3.h b/include/hw/arm/smmuv3.h
> >> index e2708e13fe..a8b354438c 100644
> >> --- a/include/hw/arm/smmuv3.h
> >> +++ b/include/hw/arm/smmuv3.h
> >> @@ -92,6 +92,7 @@ struct SMMUv3State {
> >>      OnOffAuto cmdqv;
> >>  
> >>      Notifier machine_done;
> >> +    bool has_root;
> >>      SMMUv3RootRegBank root;
> >>  };
> >>
> >>
> >> Cheers,
> >> Gustavo
> > 
> > Thank you for doing this. The only complication is that we'll probably want
> > an x-realms flag as well later, and if we do the rearrangement of the map
> > as above then SMMUV3_ROOT_REG_OFFSET will have to be variable. I'll handle
> > that when we get to the Realm part.

@Jim Why would you need to rearrange the SMMUV3_ROOT_REG_OFFSET? I was expecting
the Root registers would stay still at +0x20000, i.e., at the start of the
"OPTIONAL pages", just after the "SMMU Register Page 1".


> 
> The biggest different with realms is the presence of GPC, for which the
> GPT has to be configured correctly to allow accesses.
> However, in TF-A, this is gated behind cpu support for realms, which
> also require setting up GPT.
> 
> ```
> /* drivers/arm/smmu/smmu_v3.c */
> 	if (is_feat_rme_present()) {
> 		if ((mmio_read_32(smmu_base + SMMU_ROOT_IDR0) &
> 				  SMMU_ROOT_IDR0_ROOT_IMPL) == 0U) {
> 			WARN("Skip SMMU GPC configuration.\n");
> 		} else {
> 			uint64_t gpccr_el3 = read_gpccr_el3();
> 			uint64_t gptbr_el3 = read_gptbr_el3();
> 
> 			/* SMMU_ROOT_GPT_BASE_CFG[16] is RES0. */
> 			gpccr_el3 &= ~(1UL << 16);
> 			mmio_write_32(smmu_base +SMMU_ROOT_GPT_BASE_CFG,
> 				      gpccr_el3);
> 			mmio_write_64(smmu_base + SMMU_ROOT_GPT_BASE,
> 				      gptbr_el3 << 12);
> 			mmio_setbits_32(smmu_base + SMMU_ROOT_CR0,
> 					SMMU_ROOT_CR0_GPCEN);
>                 }
>         }
> ```
> 
> As a result, once both will enabled (root + realm), I think we can
> enable both by default, as they will be automatically depend on cpu
> support for realms. For now, root only would have to be false by default
> though.

@Pierrick Thanks a lot for the pointer. So I think we can rename "x-root" flag
with the introduction of the Realm Registers to something like "x-realm" and
gate both Root and Realm register banks based on it. Also, I could not find out
anything in the docs that contradicts it, so the Root registers are always
present on SMMUs with RME.

Yes, that's what I think too, for now the Root registers would not be exposed
by default.


Cheers,
Gustavo


