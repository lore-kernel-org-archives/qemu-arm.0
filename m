Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83061C9830E
	for <qemu-arm@archiver.kernel.org>; Thu, 24 Sep 2026 09:57:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x9gCn-0004Oh-2w; Thu, 24 Sep 2026 05:57:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1x9gCl-0004Nt-Ft
 for qemu-arm@nongnu.org; Thu, 24 Sep 2026 05:57:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1x9gCh-0005WF-HZ
 for qemu-arm@nongnu.org; Thu, 24 Sep 2026 05:57:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1790243842;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XPDUYn2sNH+tuYff9vyFITqIs0ucy3tacjD7MAHGCvo=;
 b=Nf/8oCnHeACcdpJoVKdN3mGN1ZKXNuwIPQsBzeoqIcEq3CQN1B6e392GLDYf/ROz2su6Fh
 QRWdIsHOT9aZG5fnCXQ3TDxbwFJWZ3F0R6VzBU//JI+8aVC3+/oM3qRf1e1E8CUc9ahJU3
 L/jsp8GETl9Xj1kaAnBq9VSx+gDsVmU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-478-Zib7_b6iNAuA2mw_mIr8aw-1; Thu, 24 Sep 2026 05:57:20 -0400
X-MC-Unique: Zib7_b6iNAuA2mw_mIr8aw-1
X-Mimecast-MFC-AGG-ID: Zib7_b6iNAuA2mw_mIr8aw_1790243840
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-4870663a5c4so697427f8f.1
 for <qemu-arm@nongnu.org>; Thu, 24 Sep 2026 02:57:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790243839; x=1790848639;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=XPDUYn2sNH+tuYff9vyFITqIs0ucy3tacjD7MAHGCvo=;
 b=TVolM92n6KgkBAMUna2OfMDa9EUMZPexCskyKIn1s/6rUGVIOq3O75JtQPvNuXKdHl
 Q5Y+Jzgt+82rGP4QMPou5UYZ4loYrLPgEPz3ggkTHNo7/clWQE6nu/DLKZFVyy1PEPa/
 Xt5VcPWfKpNU6ixQqqAQsnQRxmYwN6D2MPfLUPYEoMQCscK+lnVtyEJZMHOLlktOHIc1
 cD/vI/KlFHN1iCDoSB+SGzXJRh9fxhQE5Kq/PxHvnYJVB9emd4YgeN+mQmjzzHqneYqx
 bsoCtAiuva1uB3PYCqpuI5g0jb7UYUGUHKfLwwpC90Xhd2x+zKH49oHx4ddMgo2eODjq
 Kojg==
X-Forwarded-Encrypted: i=1;
 AKwUvBzLtcIWibRC0aVPOU+LBjRJRhd7qqMe/Dw2zDiWRSfjC/OKU3VUSVBPNiO3Y3VagAiGrLeXtST9og==@nongnu.org
X-Gm-Message-State: AFuF++kuZ3FvuDJDaR7b8zt1X1KQ6QiiJGFgE+PdPCVWNuJY+DTZObPs
 EP145YxvtsZ1SQo+BD1AyqTJJIcqH5FgaDpyCbZli4sFe/NAlUdzmp9k7dXx33rGNBmLIxG3xXa
 9hmHbudWVtwFio/66B4sDE25D6JCGxaHtdBfceprduGH9ZapOFuXGjg==
X-Gm-Gg: AYBFou0oruPYybaOaZifv0lOSYGVwUPdX1ptnFtErYI1Ua+gDO9HVykpOtzpLu/GYCM
 i6i33usAQxPdXLp84aHtMgAgLFbey7IZiOYew7ApzzL0q6LodAdtCCOZ3vDZR5cnI1JmJaupQKS
 vSxQZDzZWKqNxDGp2SBHFBR+wtYGrBVdkIqt1YpRaZ52g6gmBPjFHS5+Xf/bQVPM5SUHO8Nb1qj
 I952oQnkSVY0O034dKy6NFsw7J2A5kX7lRTFEgZtrnXhCcir7pCs/xsH7ulTy9vMXBy5cRfHC98
 n7eHrdcbb0N07EnAGiSAVA4ZaDRFjLtWxzPYj2x/NQ744MQb2V8XGtoG1vvoQFY0wduoyLBzr3B
 MWJdk1h9tejOycEMTiV3V+RRiHXuJ9wxyJL2eMRZtx9Pz09W+
X-Received: by 2002:a05:6000:2913:b0:488:6078:8aef with SMTP id
 ffacd0b85a97d-48871725c5fmr3067129f8f.20.1790243839439; 
 Thu, 24 Sep 2026 02:57:19 -0700 (PDT)
X-Received: by 2002:a05:6000:2913:b0:488:6078:8aef with SMTP id
 ffacd0b85a97d-48871725c5fmr3067097f8f.20.1790243838957; 
 Thu, 24 Sep 2026 02:57:18 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48868889337sm13769957f8f.34.2026.09.24.02.57.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Sep 2026 02:57:18 -0700 (PDT)
Message-ID: <aabcb61b-8341-423f-b113-e7ab2b34c2ac@redhat.com>
Date: Thu, 24 Sep 2026 11:57:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v4 08/25] target/arm/kvm: handle writeback for special
 ID register fields
To: Khushit Shah <khushit.shah@nutanix.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, kvmarm@lists.linux.dev
Cc: cohuck@redhat.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, maz@kernel.org, oliver.upton@linux.dev,
 berrange@redhat.com, abologna@redhat.com, jdenemar@redhat.com,
 gshan@redhat.com, skolothumtho@nvidia.com, sebott@redhat.com,
 armbru@redhat.com, philmd@linaro.org, yangjinqian1@huawei.com,
 shaju.abraham@nutanix.com, mark.caveayland@nutanix.com,
 ping@khushitshah.com, sandesh.patel@nutanix.com
References: <20260921123249.1708067-1-khushit.shah@nutanix.com>
 <20260921123249.1708067-9-khushit.shah@nutanix.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260921123249.1708067-9-khushit.shah@nutanix.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: sMexjTFkURiRZ25_iYrs8RMe4s0yQ9tbrTriZN5_OI8_1790243840
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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



On 9/21/26 2:32 PM, Khushit Shah wrote:
> Some fields should not be written back to KVM for various reasons:
>  - ID_AA64PFR0_EL1.GIC / ID_PFR1_EL1.GIC are fabricated by KVM based on
>    the gic-version property.
>  - KVM does not allow writing 0 to ID_DFR0_EL1.CopDbg, which breaks
>    booting an AArch64-only guest on a host that also supports AArch32.
>  - ID_DFR0_EL1.PerfMon is populated by KVM even for AArch64-only guests
>    but is not writable there.
>  - MPIDR_EL1 is managed by KVM based on vCPU index.
>  - Hold off writing back CLIDR_EL1 until we properly support exposing
>    cache topology to a KVM guest.
>
> Signed-off-by: Khushit Shah <khushit.shah@nutanix.com>
> ---
>  target/arm/cpu-idregs.c |  6 ++++++
>  target/arm/cpu-idregs.h |  2 ++
>  target/arm/kvm.c        | 40 +++++++++++++++++++++++++++++++++++++++-
>  3 files changed, 47 insertions(+), 1 deletion(-)
>
> diff --git a/target/arm/cpu-idregs.c b/target/arm/cpu-idregs.c
> index d58b8ed063..1f7ebfe9bb 100644
> --- a/target/arm/cpu-idregs.c
> +++ b/target/arm/cpu-idregs.c
> @@ -107,3 +107,9 @@ bool arm_field_is_writable(const ARM64SysRegField *field)
>      return (arm64_id_regs[field->index].writable_mask & field_mask)
>             == field_mask;
>  }
> +
> +bool field_matches(const ARM64SysRegField *field, ARMIDRegisterIdx index,
> +                   const char *name)
> +{
> +    return field->index == index && !strcmp(field->name, name);
> +}
> diff --git a/target/arm/cpu-idregs.h b/target/arm/cpu-idregs.h
> index aab1a79db1..8ef3f9350e 100644
> --- a/target/arm/cpu-idregs.h
> +++ b/target/arm/cpu-idregs.h
> @@ -35,4 +35,6 @@ extern ARM64SysReg arm64_id_regs[NUM_ID_IDX];
>  
>  uint64_t arm_get_field_mask(const ARM64SysRegField *field);
>  bool arm_field_is_writable(const ARM64SysRegField *field);
> +bool field_matches(const ARM64SysRegField *field, ARMIDRegisterIdx index,
> +                   const char *name);
>  #endif
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index 2d94b3a884..70d9a07580 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -1317,10 +1317,40 @@ bool kvm_arm_cpu_post_load(ARMCPU *cpu)
>      return true;
>  }
>  
> +static bool arm_field_skip_writeback_always(const ARM64SysRegField *field)
> +{
> +    /*
> +     * GIC is controlled by the gic-version property and fabricated by KVM
> +     * when the vGIC device is created, so a named CPU model must not touch
> +     * it. KVM also rejects writing 0 to ID_DFR0_EL1.CopDbg, which breaks
> +     * booting a model that lacks AArch32 support on a host that supports
> +     * it. MPIDR_EL1 is managed by KVM based on vCPU index, skip writing it
> +     * back. Similarly, skip writing back CLIDR_EL1 till we properly
> +     * support exposing cache for KVM guest.
> +     */
> +    return field_matches(field, ID_AA64PFR0_EL1_IDX, "GIC")
> +        || field_matches(field, ID_PFR1_EL1_IDX, "GIC")
> +        || field_matches(field, ID_DFR0_EL1_IDX, "CopDbg")
> +        || field->index == MPIDR_EL1_IDX
> +        || field->index == CLIDR_EL1_IDX;

what does happen for SMIDR_EL1 and GMID_EL1 whose value could not be
initialized from host. The setter for any of their field shall fail.
> +}
> +
> +static bool
> +arm_field_skip_writeback_if_not_writable(const ARM64SysRegField *field)
> +{
> +    /*
> +     * KVM populates ID_DFR0_EL1.PerfMon even for AArch64-only guests but
> +     * does not expose it as writable there, so skip it when it is not
> +     * writable.
> +     */
> +    return field_matches(field, ID_DFR0_EL1_IDX, "PerfMon");
> +}
> +
>  /*
>   * Copy writable ID reg fields from isar.idregs[] into the KVM cpreg list,
>   * so the subsequent write_list_to_kvmstate() pushes them to KVM.
> - * Only writable fields are copied.
> + * Only writable fields are copied; fields that must not be written back
> + * (see arm_field_skip_writeback_*) are skipped.
>   * Returns -1 if any vCPU's ID reg value differs from the host value and the
>   * field is not writable.
>   */
> @@ -1357,6 +1387,14 @@ static int kvm_arm_write_idregs_to_cpreg_list(ARMCPU *cpu)
>                  continue;
>              }
>  
> +            if (arm_field_skip_writeback_always(field) ||
> +                (!arm_field_is_writable(field) &&
> +                 arm_field_skip_writeback_if_not_writable(field))) {
> +                /* Never write this field back; keep KVM's value. */
> +                writable_mask &= ~field_mask;
> +                continue;
> +            }
> +
>              if (!arm_field_is_writable(field)) {
>                  error_report("%s.%s is not writable: host=0x%" PRIx64
>                               ", requested=0x%" PRIx64,
v9 has changed the way new field values are stored. writable field props
and non writable field props could have different setters. A non
writable field setter just needs to check the new value is the same as
the current host value. No need to record the new value in the hashtable
for further commitment.

Eric


