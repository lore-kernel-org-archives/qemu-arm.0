Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C806CC6B30
	for <qemu-arm@archiver.kernel.org>; Thu, 15 Oct 2026 10:53:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xHJ4k-0002SR-Hv; Thu, 15 Oct 2026 06:52:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xHJ4j-0002Qn-E3
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 06:52:41 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xHJ4h-0007qc-Oj
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 06:52:41 -0400
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-c3f04e0e65fso102405266b.2
 for <qemu-arm@nongnu.org>; Thu, 15 Oct 2026 03:52:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792061558; cv=none;
 d=google.com; s=arc-20260327;
 b=cf6vnKO6JeU2GL6QZ4I4yr/3HVURir5/2O25qU64rG08ssk8rlmkE98cc6ClTxQqGM
 RmXotCCwkV1u2B1TkaxRgEPwgMFTncrsIo1nvcB8k6T4rWsCie0PR2exbCnBVlKXbULQ
 v/muMsLR79bUoOs3ITJhYxc07ZNY4Snxh7vKjdAsuQTlTgjTO0wfMYkmV1KeKgDxVtm3
 RNZQGFhenCcxlQwn6My6RQ3N26bWpfaUP3cFUCPJRFDZklXuhaGGrcveyBfcey7d6BrS
 sPemebTnjN5Rv36anLPT9slopMchjopdP/qyK4NxQTPvdchGDxessx7Vl+VaDIT7T+7y
 T1NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :dkim-signature;
 bh=82nOw34p6r8quozBtV6O6375kWs8MNR6yskY5g7RwKI=;
 fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
 b=OHIhyBeJXN1hP5acU8rkmTJMUzBXUuFi+Up8R3mQD0xe/3OyqBdfSflhMlAVNMC7W1
 s/TUM/jQ0zCU7MIeHM8azg1nsuXDulNWF4DuseyXGadjWNOkUpE6EahoEmckRRk5VQXI
 D+6VdOaT0Sg3DERTbk5SqyjdOIjhEd+cjpu/lQBArjwG91EaS9kuCCPQVWk/822vtEcl
 LHnJ13R4iYtd1ed71j7YFAZjQFwH8d/2OLNiU3K1K3W0/wtcnUEvruvZvks5kBjA7ExQ
 Ody0u/UQygbnhNqHrnKMBRLK3Shn2VJ/TUL7+qjwN84JjrahvQmeQPyc2/3q6JpLJARl
 y6yw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792061558; x=1792666358; darn=nongnu.org;
 h=content-type:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=82nOw34p6r8quozBtV6O6375kWs8MNR6yskY5g7RwKI=;
 b=lQ//XKDrAZVW+30z5tGkccE6dMRIMia8XI1GMC2t+YgWkdaQ57yXffQErDSPzH5kTs
 O+rzgp87u0Hc5v18H/i0XHX5Ythjuz5HEXdGz6qGKNt5DmC666D2XXRr5Kl3KQ1CUN0e
 Vmbm5SmidCU6gy6FuE9RID8VR65ygovLvyKACrLHLJUvq/s/E6F/CRoEQArrYt8VAUhS
 oJqU54jry4BqLjdYtruOD8raao2ULCq7Qz1q2FCw949ZHxdUEgfYZlDr0z1R70GZwvT8
 rfYtPzYpF89hN9m+qoNXn01S+ORe7/HJjGXj/Bum8XhH5pZ4mBr8e7CBPU3KCR6A0Um+
 oi/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792061558; x=1792666358;
 h=content-type:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=82nOw34p6r8quozBtV6O6375kWs8MNR6yskY5g7RwKI=;
 b=BC7RovOrefQelurdAT60GH8FD589VJnr86dIASaxBbI96EYEfrk33ZtHh5zAsTEeM5
 J5EBMHw9U++9YDFbS4nPZ8pl9Xta8vtJRt6ZNzTHPqCbzQ6ZvRIeRnDXOM27GLEDDcD7
 7LTBdTwF3GV+79MCCiAua1wcCE0bHCQ5ptQZJBcX0LzVQFlgucXczkHY6bILz6boUEti
 2uQ5Ois06Nll3o2ACZtGHXTLqDeKJePR5TsLDfRLMox4vWr3rf1WHEH5jn4BtuNb5Vfa
 ahmGjhaHfMFGef/O4z/AGJlWVgeKIKhZtgo0Gybh8edsL9aMa3x7MEnb2wP8mwRHzL/+
 7w8A==
X-Gm-Message-State: AFq9FYIcaFDNdrodNCnVX4nAoMpJjR8OPPIhHAM54DMazfz3Iw+3aJyp
 nm+ySp5f4ZNTL9d8MEE8dZq2ZuFTvBFRAP7IiO8OCJoNDAHyyC2FHGEfafWsPIPABDLQNyBNfQG
 TwML9VcDAfpcjmte/5cFzpaZXUqpaj9cWtEknXhUwhs68/E/uegHYOro=
X-Gm-Gg: AYBFou0I7mqTRaNqyaf9Ytz9LaUwi6g+HytXdEAANBPHE97UVV4eq918TQNUHz8pN6H
 RjzbLI0Wj4f8FNdZUBawr362yYQHjYFC7H03QnQ14g4Lo88O6GfmqIwCFM1T8MUmbudcdLMeu7h
 2R72d3zM3snxDINDLRiQX/pTyuykTWLDR2zSQADHLFFqZCX5QWQBhnhnMG60PMOLvKkOJct2ezL
 aBjyvFZCqCR/MJhKiWo7pqKgGGqNBES+Kt54SOCbhoMnpzkQQfYiwSrlfgMAmr2tWjpWoPNzh5x
 pPipt5KHtFkZOuzGi2kgPZRLhoYZUo+e+PM7E5OMb4eGOrtySBk/Xq3SfzVEw53nAJbwwFBVV4Z
 YkYDDXWmRcP2G7pvRQCrVf+qeCHjWwL6umPSFCik=
X-Received: by 2002:a17:907:2d88:b0:c2e:4373:521 with SMTP id
 a640c23a62f3a-c31aa0d2286mr1589276966b.46.1792061558337; Thu, 15 Oct 2026
 03:52:38 -0700 (PDT)
MIME-Version: 1.0
References: <20261013083933.1024405-1-peter.maydell@linaro.org>
 <20261013083933.1024405-56-peter.maydell@linaro.org>
In-Reply-To: <20261013083933.1024405-56-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Oct 2026 11:52:25 +0100
X-Gm-Features: AclHuK_Vll3GDo6Gs_0u4ampo0VYsopa_vjcc0BCMlP0LZz7a0eKc9ItaJEhrfI
Message-ID: <CAFEAcA8SkMpPwVPB1NWXpuPo+AWtCBY4uWqE2Zxfrqc19KWeBw@mail.gmail.com>
Subject: Re: [PATCH 55/86] hw/intc/arm_gicv5: Implement IRS_VMAP_L2_VMTR
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Tue, 13 Oct 2026 at 09:40, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> The IRS_VMAP_L2_VMTR register allows the guest to make a level 2 VM
> table valid.  It's similar to what the IRS_MAP_L2_ISTR register does
> for the IST, but it's 64 bits, and so it is R/W and has an M bit for
> "actually do the operation" so that the guest can write it as two 32
> bit halves.  Since we don't cache anything yet, all the "make valid"
> operation needs to do is write to the VALID bit in the L1 table entry
> in guest memory.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

> +static void irs_vmap_l2_vmtr_write(GICv5 *s, GICv5Domain domain, uint64_t value)
> +{
> +    GICv5Common *cs = ARM_GICV5_COMMON(s);
> +    GICv5VMTConfig *cfg = &s->vmt_config[domain];
> +    uint32_t vmid = FIELD_EX64(value, IRS_VMAP_L2_VMTR, VM_ID);
> +    bool m = FIELD_EX64(value, IRS_VMAP_L2_VMTR, M);
> +    hwaddr l1_addr;
> +    uint64_t l1_vmte;
> +    MemTxResult res;
> +
> +    if (!gicv5_domain_has_virt(cs, domain) || !cfg->valid || !cfg->structure) {
> +        /*
> +         * The whole register is RAZ/WI if no virt, or if the VM
> +         * table is invalid or not 2 level.
> +         */
> +        return;
> +    }
> +
> +    /*
> +     * Otherwise, write to the register. The M bit is WO/UNKNOWN,
> +     * and we make sure it is 0, so that a 32-bit write to the low
> +     * half of the register never appears to have the M bit set.
> +     */
> +    cs->irs_vmap_l2_vmtr[domain] = value & ~R_IRS_VMAP_L2_VMTR_M_MASK;
> +
> +    if (!m || vmid >= (1 << cfg->vm_id_bits)) {
> +        /*
> +         * If guest didn't actually ask to make the L2 table valid, or
> +         * the ID is out of range, do nothing except the register update.
> +         */
> +        return;
> +    }
> +
> +    /* Find the relevant L1 VMTE and set its VALID bit */
> +    l1_addr = l1_vmte_addr(cs, cfg, vmid);
> +
> +    l1_vmte = address_space_ldq_le(&cs->dma_as, l1_addr, cfg->txattrs, &res);
> +    if (res != MEMTX_OK) {
> +        goto txfail;
> +    }
> +
> +    l1_vmte = FIELD_DP64(l1_vmte, L1_VMTE, VALID, 1);

This is missing a check for "is the VALID bit already set in the L1_VMTE?"
(which per the spec is supposed to be a "has no effect" situation). In this
patch the lack of a check is harmless, but when we add the code later to
cache VM table entries we'll fall through into that and incorrectly
corrupt the cached VM table entries by re-initializing them.

> +
> +    address_space_stq_le(&cs->dma_as, l1_addr, l1_vmte, cfg->txattrs, &res);
> +    if (res != MEMTX_OK) {
> +        goto txfail;
> +    }
> +
> +    return;
> +
> +txfail:
> +    /* Reportable with EC=0x0 if sw error reporting implemented */
> +    qemu_log_mask(LOG_GUEST_ERROR, "L1 VMTE update failed for VMID 0x%x at "
> +                  "physical address 0x" HWADDR_FMT_plx "\n", vmid, l1_addr);
> +}
> +

-- PMM

