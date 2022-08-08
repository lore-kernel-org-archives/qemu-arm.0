Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp2394268ejf;
        Mon, 8 Aug 2022 02:17:46 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7p1/JNmerD4ypoLn698U2dcJBOsxwouaw1KFhLW4nDoQoLrf6m1KUL2LGDNjpu3kNoLgHB
X-Received: by 2002:a05:6214:1c47:b0:474:8d1e:f432 with SMTP id if7-20020a0562141c4700b004748d1ef432mr14899054qvb.94.1659950265796;
        Mon, 08 Aug 2022 02:17:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1659950265; cv=none;
        d=google.com; s=arc-20160816;
        b=VynqBR42yZTbvAq/WTJQGbWaTvy8Pr7kDhADO4dbHtEPCONr15oJNDqHQxPRW6msb2
         Cp0G67Qn5YEbk1KaMqTEs5InMeDT0O46+GvZvxcneCOrOnJJ/Pwh2Mf79G2CZlv1E3ZS
         L8oV0cJcFHOTSUExc/H9YLuNzmV1U3EdkMByd1jfMPgHDeGC9lp/X8X3RcUQZt3mJqmH
         ZPDTnQt5pzZlA+HoLMZT7NjdiOnUhGRxaA/3FvIpqWhHAmx5kma1MdBGNsYJI52XUBkQ
         Jv53YujM4TsgpPBn7Lk+OfiqltVuVcd7BBuOD014eggLYaA+31D+SzknkrZQSJri6G7e
         Qb7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :references:in-reply-to:subject:cc:to:from:message-id:date
         :dkim-signature;
        bh=0JRISw5/F6BQTf/AoaoF+vN9x30iJC3ABT/dmM+w+JI=;
        b=rF4xev/OF6t2e4XUVwgjhVQipaio3Uhb+ZiTXWCsAUOSSH5luBBB8wzjSi/NnW7GQI
         o68oTV5VQhL1H2z81+5dF1DLvfSLlcDvHRgQmbql0jaGBuS7ExNKMImFnG4te/kmc3MT
         cVwdkDoevQJtJ8nx7epjbSCAWp2AU35fsQKi41oX+K+GnpflrDLLs/T15LZTpUjXAQgA
         HYRnIiFgtVFzlqdsRA6jvCGW6PcvN5qB5fyMaHQWyEE7NORyNqScEkJRWQ6R50Vlbifa
         UebV091wPZc4crqltIV4Z/eK/76AHIccdwS4FFWe9LdIsIRLad9EVIlhnR8J5ePLDK8Y
         Db1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=UKCVH9K3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ey16-20020a05622a4c1000b00342f18b0e50si3238502qtb.414.2022.08.08.02.17.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Aug 2022 02:17:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=UKCVH9K3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from localhost ([::1]:42240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oKytN-0003gw-7W
	for alex.bennee@linaro.org; Mon, 08 Aug 2022 05:17:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maz@kernel.org>)
 id 1oKyst-0003bf-QM; Mon, 08 Aug 2022 05:17:15 -0400
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1]:44602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maz@kernel.org>)
 id 1oKysr-0005ih-8R; Mon, 08 Aug 2022 05:17:15 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4D44BB80A07;
 Mon,  8 Aug 2022 09:17:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14418C433D6;
 Mon,  8 Aug 2022 09:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1659950223;
 bh=zEDyLLb7DPexaoRG+gXjeV7xPt+Yzgy6jad7tKTi13s=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=UKCVH9K3QfaMYoEYiXmwfWh4DAumIfZiXa5cwraN0PUT/ULv3NWBvMES0sjusH29J
 dB3QYQgRsc2joa3EuWIhaoOtlRcQadOgi7pcK+y/VPcO0CqqwGD1GOJe6QPsU+VG0F
 7UbBKTYsauYrrG0+xZkdT+AWlYZ1PuBuz4IHJYg0zNdI9RcCzNO2dUqQdaYCDacGYQ
 J/b7hr3zmrL62JAlkkW72U97FSzsExaHqil4bXWt6SzNrMuu7uLk8mdIXVlMi+U9wP
 ANEU2A0lr9UlHyFgAbUREjQ9v1Fh8BvLFxtqX7zr3lUxfaONXIVAzjqyR4Kdyvz6AR
 RpnyLUtLY1uKA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=why.misterjones.org)
 by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <maz@kernel.org>) id 1oKyse-001cmS-P8;
 Mon, 08 Aug 2022 10:17:00 +0100
Date: Mon, 08 Aug 2022 10:17:00 +0100
Message-ID: <87fsi7w0vn.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Gavin Shan <gshan@redhat.com>
Cc: eric.auger@redhat.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 peter.maydell@linaro.org, richard.henderson@linaro.org, cohuck@redhat.com,
 zhenyzha@redhat.com, shan.gavin@gmail.com
Subject: Re: [PATCH 1/2] hw/arm/virt: Improve address assignment for highmem
 IO regions
In-Reply-To: <0ed2ebc7-8d6e-7555-3af4-31eb071a584b@redhat.com>
References: <20220802064529.547361-1-gshan@redhat.com>
 <20220802064529.547361-2-gshan@redhat.com>
 <dcca0792-4f62-2cf0-9080-309d2e78e690@redhat.com>
 <9c8365c6-d27b-df76-371d-bd32ca2a26f7@redhat.com>
 <87tu6tbyk9.wl-maz@kernel.org>
 <0ed2ebc7-8d6e-7555-3af4-31eb071a584b@redhat.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/27.1
 (x86_64-pc-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: gshan@redhat.com, eric.auger@redhat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, peter.maydell@linaro.org, richard.henderson@linaro.org,
 cohuck@redhat.com, zhenyzha@redhat.com, shan.gavin@gmail.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=maz@kernel.org; helo=ams.source.kernel.org
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4dkhMIcZYgQY

On Wed, 03 Aug 2022 14:02:04 +0100,
Gavin Shan <gshan@redhat.com> wrote:
> 
> Hi Marc,
> 
> On 8/3/22 5:01 PM, Marc Zyngier wrote:
> > On Wed, 03 Aug 2022 04:01:04 +0100,
> > Gavin Shan <gshan@redhat.com> wrote:
> >> On 8/2/22 7:41 PM, Eric Auger wrote:
> >>> On 8/2/22 08:45, Gavin Shan wrote:
> >>>> There are 3 highmem IO regions as below. They can be disabled in
> >>>> two situations: (a) The specific region is disabled by user. (b)
> >>>> The specific region doesn't fit in the PA space. However, the base
> >>>> address and highest_gpa are still updated no matter if the region
> >>>> is enabled or disabled. It's incorrectly incurring waste in the PA
> >>>> space.
> >>> If I am not wrong highmem_redists and highmem_mmio are not user selectable
> >>> 
> >>> Only highmem ecam depends on machine type & ACPI setup. But I would say
> >>> that in server use case it is always set. So is that optimization really
> >>> needed?
> >> 
> >> There are two other cases you missed.
> >> 
> >> - highmem_ecam is enabled after virt-2.12, meaning it stays disabled
> >>    before that.
> > 
> > I don't get this. The current behaviour is to disable highmem_ecam if
> > it doesn't fit in the PA space. I can't see anything that enables it
> > if it was disabled the first place.
> > 
> 
> There are several places or conditions where vms->highmem_ecam can be
> disabled:
> 
> - virt_instance_init() where vms->highmem_ecam is inherited from
>   !vmc->no_highmem_ecam. The option is set to true after virt-2.12
>   in virt_machine_2_12_options().
> 
> - machvirt_init() where vms->highmem_ecam can be disable if we have
>   32-bits vCPUs and failure on loading firmware.

Right. But at no point do we *enable* something that was disabled
beforehand, which is how I understood your previous comment.

> 
> - Another place is where we're talking about. It's address assignment
>   to fit the PA space.

Alignment? No, the alignment is cast into stone: it is set to the
smallest power-of-two containing the region (natural alignment).

> 
> >> 
> >> - The high memory region can be disabled if user is asking large
> >>    (normal) memory space through 'maxmem=' option. When the requested
> >>    memory by 'maxmem=' is large enough, the high memory regions are
> >>    disabled. It means the normal memory has higher priority than those
> >>    high memory regions. This is the case I provided in (b) of the
> >>    commit log.
> > 
> > Why is that a problem? It matches the expected behaviour, as the
> > highmem IO region is floating and is pushed up by the memory region.
> > 
> 
> Eric thought that VIRT_HIGH_GIC_REDIST2 and VIRT_HIGH_PCIE_MMIO regions
> aren't user selectable. I tended to explain why it's not true. 'maxmem='
> can affect the outcome. When 'maxmem=' value is big enough, there will be
> no free area in the PA space to hold those two regions.

Right, that's an interesting point. This is a consequence of these
upper regions floating above RAM.

> 
> >> 
> >> In the commit log, I was supposed to say something like below for
> >> (a):
> >> 
> >> - The specific high memory region can be disabled through changing
> >>    the code by user or developer. For example, 'vms->highmem_mmio'
> >>    is changed from true to false in virt_instance_init().
> > 
> > Huh. By this principle, the user can change anything. Why is it
> > important?
> > 
> 
> Still like above. I was explaining the possible cases where those
> 3 switches can be turned on/off by users or developers. Our code
> needs to be consistent and comprehensive.
> 
>   vms->highmem_redists
>   vms->highmem_ecam
>   vms->mmio
> 
> >> 
> >>>> 
> >>>> Improve address assignment for highmem IO regions to avoid the waste
> >>>> in the PA space by putting the logic into virt_memmap_fits().
> > 
> > I guess that this is what I understand the least. What do you mean by
> > "wasted PA space"? Either the regions fit in the PA space, and
> > computing their addresses in relevant, or they fall outside of it and
> > what we stick in memap[index].base is completely irrelevant.
> > 
> 
> It's possible that we run into the following combination. we should
> have enough PA space to enable VIRT_HIGH_PCIE_MMIO region. However,
> the region is disabled in the original implementation because
> VIRT_HIGH_{GIC_REDIST2, PCIE_ECAM} regions consumed 1GB, which is
> unecessary and waste in the PA space.
> 
>     static MemMapEntry extended_memmap[] = {
>         [VIRT_HIGH_GIC_REDIST2] =   { 0x0, 64 * MiB },
>         [VIRT_HIGH_PCIE_ECAM] =     { 0x0, 256 * MiB },
>         [VIRT_HIGH_PCIE_MMIO] =     { 0x0, 512 * GiB },
>     };
> 
>     IPA_LIMIT           = (1UL << 40)
>     '-maxmem'           = 511GB              /* Memory starts from 1GB */
>     '-slots'            = 0
>     vms->highmem_rdist2 = false
>     vms->highmem_ecam   = false
>     vms->highmem_mmio   = true
>

Sure. But that's not how QEMU works today, and these regions are
enabled in order (though it could well be that my recent changes have
made the situation more complicated).

What you're suggesting is a pretty radical change in the way the
memory map is set. My hunch is that allowing the highmem IO regions to
be selectively enabled and allowed to float in the high IO space
should come as a new virt machine revision, with user-visible options.

Thanks,

	M.

-- 
Without deviation from the norm, progress is not possible.
