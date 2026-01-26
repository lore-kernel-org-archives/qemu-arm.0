Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F19D6D1950B
	for <qemu-arm@archiver.kernel.org>; Mon, 26 Jan 2026 17:17:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vkQDq-000890-Bm; Mon, 26 Jan 2026 12:17:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vkQDB-0007i4-TI
 for qemu-arm@nongnu.org; Mon, 26 Jan 2026 12:17:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vkQD7-0002bQ-NG
 for qemu-arm@nongnu.org; Mon, 26 Jan 2026 12:17:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1769447823;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r7m2f4+ZXq+0iSX73kfDki03Ofvt8M2V42S0brORK1g=;
 b=CykJvQudD0SrH0x3X0eiTo+qXv8ytydR9Xk5mPAzPMenXUt9EYgrhzbkDZfFinrUYjW4bN
 1zfcGiL/umMS+OetNL2hNgQsJUoyFiaE/uM3x6arzIlvigG4AQ118VXmJ8Ip8wLJeSvdUl
 ft+iZkN6qwrx2bbCP+dP4gCX3bmPw/8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-335-DjnVeWzHOviVzqD9-qbd9Q-1; Mon, 26 Jan 2026 12:17:01 -0500
X-MC-Unique: DjnVeWzHOviVzqD9-qbd9Q-1
X-Mimecast-MFC-AGG-ID: DjnVeWzHOviVzqD9-qbd9Q_1769447820
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-432db1a9589so3646194f8f.0
 for <qemu-arm@nongnu.org>; Mon, 26 Jan 2026 09:17:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769447820; x=1770052620;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r7m2f4+ZXq+0iSX73kfDki03Ofvt8M2V42S0brORK1g=;
 b=wJZQqCKnIqcN7q9KnrIZrvo+7gaDI5gs9FG4hl0l0BgagXNs3LxIMufb67QoDRQ5LV
 hFUig0nhvbP6nyWxRADA/CJro4BUQpIviHVv3ZVmCrmaVtRtiiEY6Vw3hM8SlsA4qznp
 fBSWxVf9aTLyZAp+m+y5PPLL+/R47x/4RbHZb3Qgbc2u561I7U+PoFVAb0ncdhK/IQ4p
 6fuoXaiqngDPaEngAV6L8/FIYo3hr7bzxBmMxbV6BvMszqEV/oY3864XDj/aWrX/JuOT
 xxord5GCciN9pnPzgdHXr3EcjZMAiNkh6NQ3AWcbVkTOJsJXIgvtZwSMGnvsai0CDbrK
 kr9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvBcP6v+KWYt5YquRNGrTXpqNU2imW5+joA+kHRUejuxgtaET47G0nQ7gLPP0qlcgyJ+fjAZoD4Q==@nongnu.org
X-Gm-Message-State: AOJu0YwZPdIXSbiwloe1lmM5k520EKjweqweF9x1LbtA7zuW01uQEb/2
 sb1D2IR8nu+qfHe/7/ObTMMPiyFW+yu1XQefsBeJ7SsFMrOBOhwezEGH1+a2ske09mcnN0pWpbv
 thuQ+VVPgrT1h9fbFub9nyuJncmC75FYAe1sV7rxCwj9HqQt3H2qhWLdUFkufYw==
X-Gm-Gg: AZuq6aLo39b1LpscGKivmuWtIanJQsRp8O4ThUDuxG0c1G8OPoeadjXZbabPEdrG8Mf
 q/FZyuvu+wSbqXBdy1g5br1cKqRfspZv/bs2byC7l2Gw+qsk2zxHTXBf2B7362DPL0dgwBV/Tf1
 K/4XtmKladntZm6sjbwP9qpgYww1HAt9GJoM012vTLn/HaDjmLpBLUj6DQw8i7Jyl8UFsQKsGrx
 eZC/Rcp7vlw9iM0a2Q4uolmA6Qrpksjbs4A8F7e2J7E1NSusOhvoPbhRXQ2VTm8DjIwdmTvjfMT
 fv22Pqs/c1ZgnosBouvFJ/gs4xJ9F3tHZZMFaChvOonCc1PE1RnkrQgv99LIhVS1B4KZQr+H2gv
 FvAv15q3ZHH/2lv0G6Ex+Ws0RuyiYEcOZZqYvX9SJ/pymwuKa5qUX+lUjtw==
X-Received: by 2002:a05:6000:25c5:b0:42f:b707:56e6 with SMTP id
 ffacd0b85a97d-435ca1adcf1mr7896797f8f.34.1769447819550; 
 Mon, 26 Jan 2026 09:16:59 -0800 (PST)
X-Received: by 2002:a05:6000:25c5:b0:42f:b707:56e6 with SMTP id
 ffacd0b85a97d-435ca1adcf1mr7896759f8f.34.1769447819060; 
 Mon, 26 Jan 2026 09:16:59 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435b1c30293sm31852296f8f.19.2026.01.26.09.16.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jan 2026 09:16:58 -0800 (PST)
Message-ID: <746207ca-db61-4cd4-ae2d-237c6aae9589@redhat.com>
Date: Mon, 26 Jan 2026 18:16:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/11] Mitigation of "failed to load
 cpu:cpreg_vmstate_array_len" migration failures
To: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, cohuck@redhat.com, maz@kernel.org,
 oliver.upton@linux.dev, sebott@redhat.com, gshan@redhat.com,
 ddutile@redhat.com, peterx@redhat.com, philmd@linaro.org,
 pbonzini@redhat.com, Richard Henderson <richard.henderson@linaro.org>
References: <20260126165445.3033335-1-eric.auger@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260126165445.3033335-1-eric.auger@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GYT1zpTDhdMi1UHUbjFcvXVwCsTXLAgtHt60NhFcIgU_1769447820
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi Peter, Richard,

On 1/26/26 5:52 PM, Eric Auger wrote:
> When migrating ARM guests accross same machines with different host
> kernels we are likely to encounter failures such as:
>
> "failed to load cpu:cpreg_vmstate_array_len"
>
> This is due to the fact KVM exposes a different number of registers
> to qemu on source and destination. When trying to migrate a bigger
> register set to a smaller one, qemu cannot save the CPU state.
>
> For example, recently we faced such kind of situations with:
> - unconditionnal exposure of KVM_REG_ARM_VENDOR_HYP_BMAP_2 FW pseudo
>   register from v6.16 onwards. Causes backward migration failure.
> - removal of unconditionnal exposure of TCR2_EL1, PIRE0_EL1, PIR_EL1
>   from v6.13 onwards. Causes forward migration failure.
>
> This situation is really problematic for distributions which want to
> guarantee forward and backward migration of a given machine type
> between different releases.
>
> While the series mainly targets KVM acceleration, this problem
> also exists with TCG. For instance some registers may be exposed
> while they shouldn't. Then it is tricky to fix that situation 
> without breaking forward migration. An example was provided by
> Peter: 4f2b82f60 ("target/arm: Reinstate bogus AArch32 DBGDTRTX
> register for migration compat). 
>
> This series introduces 2 CPU array properties that list
> - the CPU registers to hide from the exposes sysregs (aims
>   at removing registers from the destination)
> - The CPU registers that may not exist but which can be found
>   in the incoming migration stream (aims at ignoring extra
>   registers in the incoming state)
>
> An example is given to illustrate how those props
> could be used to apply compats for machine types supposed to "see" the
> same register set accross various host kernels.
>
> Mitigation of DBGDTRTX issue would be achieved by setting
> x-mig-safe-missing-regs=0x40200000200e0298 which matches
> AArch32 DBGDTRTX register index.
>
> The first patch improves the tracing so that we can quickly detect
> which registers do not match between the incoming stream and the
> exposed sysregs

Most of the patches of the series have collected R-bs. Do you have
concerns with the approach?

This aims at solving distro real life issues wrt cross kernel migration
failures and we would appreciate to get a generic solution within 11.0
timeframe.
Also [PATCH v4 0/2] arm: add kvm-psci-version vcpu property 
(https://lore.kernel.org/all/20251202160853.22560-3-sebott@redhat.com/)
is part of this initiative and also collected R-bs/T-bs.

Looking forward to your feedbacks.

Eric 
>
> ---
>
> Available at:
> https://github.com/eauger/qemu/tree/mitig-v6
>
> ---
>
> Tests:
> - migration with 10.2 machine with old qemu featuring DBGDTRTX
>   and this one where it is removed. Forward migration works.
>   backward doesn't because the register is not present in the
>   input migration stream and write_list_to_cpustate() fails
>   while write_raw_cp_reg and reading it back. write_raw_cp_reg()
>   seems to read an unintialized values from  cpu->cpreg_values[i].
>   write has no effect since type is ARM_CP_CONST but read_raw_cp_reg
>   returns ri->resetvalue which differs from uninitialized value.
>   I would have expected the initial cpu->cpreg_values[i] to match
>   reset value which is obviously not the case. Laso the comment hints
>   that it should be. So maybe another issue? Nevertheless I am
>   not totally sure supporting backward migration for TCG is a must.
>   This may be fixed separately if it is confirmed this is a bug.
>
> - migration with accel=kvm back and forth old host/qemu where
>   host does not feature fixes for TCR2_EL1, PIRE0_EL1, PIR_EL1
>   and recent KVM_REG_ARM_VENDOR_HYP_BMAP_2 FW and more recent
>   kernel/this qemu that feature them. Migration works forward
>   and backward with 10.1 machine type.
>
> History:
>
> v5 -> v6:
> - move GString init and collected Sebastian's R-b
>
> v4 -> v5:
> - Fixed issue reported by Sebastian about aggregated array
>   props. This lead to the introduction of
>   hw/arm/virt: Introduce framework to aggregate hidden-regs
>   and safe-missing-regs
> - Collected additional hacks from Connie
>
> v3 -> v4:
> - Collected Connie's & Sebastian's R-bs
> - Squashed patches 3 and 5
> - various typos and rewording
>
> v2 -> v3:
> - revert target/arm: Reinstate bogus AArch32 DBGDTRTX register for migration compat
> - fix some typos and rework target/arm/cpu.h hidden_regs comment (Connie)
> - Even for TCG we use KVM index
>
> v1 -> v2:
> - fixed typos (Connie)
> - Make it less KVM specific (tentative hidding of TCG regs, not
>   tested)
> - Tested DBGDTRTX TCG case reported by Peter
> - No change to the property format yet. Ran out of idea. However
>   I changed the name of the property with x-mig prefix
> - Changed the terminology, kept hidding but remove fake which was
>   confusing
> - Simplified the logic for regs missing in the incoming stream and
>   do not check anymore they are exposed on dest
>
>
> Eric Auger (11):
>   hw/arm/virt: Rename arm_virt_compat into arm_virt_compat_defaults
>   target/arm/machine: Improve traces on register mismatch during
>     migration
>   target/arm/cpu: Allow registers to be hidden
>   target/arm/machine: Allow extra regs in the incoming stream
>   kvm-all: Enforce hidden regs are never accessed
>   target/arm/cpu: Implement hide_reg callback()
>   target/arm/cpu: Expose x-mig-hidden-regs and x-mig-safe-missing-regs
>     properties
>   hw/arm/virt: Declare AArch32 DBGDTRTX as safe to ignore in incoming
>     stream
>   Revert "target/arm: Reinstate bogus AArch32 DBGDTRTX register for
>     migration compat"
>   hw/arm/virt: Introduce framework to aggregate hidden-regs and
>     safe-missing-regs
>   hw/arm/virt: [DO NOT UPSTREAM] Enforce compatibility with older
>     kernels
>
>  include/hw/arm/virt.h     | 23 ++++++++++
>  include/hw/core/cpu.h     |  2 +
>  target/arm/cpu.h          | 48 +++++++++++++++++++++
>  accel/kvm/kvm-all.c       | 12 ++++++
>  hw/arm/virt.c             | 89 ++++++++++++++++++++++++++++++++++++---
>  target/arm/cpu.c          | 11 +++++
>  target/arm/debug_helper.c | 29 -------------
>  target/arm/helper.c       | 12 +++++-
>  target/arm/kvm.c          | 35 ++++++++++++++-
>  target/arm/machine.c      | 70 +++++++++++++++++++++++++++---
>  target/arm/trace-events   | 10 +++++
>  11 files changed, 298 insertions(+), 43 deletions(-)
>


