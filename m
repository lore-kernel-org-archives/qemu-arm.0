Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7784CC6B30
	for <qemu-arm@archiver.kernel.org>; Thu, 15 Oct 2026 10:43:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xHIvg-0007pD-7p; Thu, 15 Oct 2026 06:43:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xHIvb-0007ns-I4
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 06:43:16 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xHIvY-0006iX-E0
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 06:43:15 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-8b0d91601bdso3107307b3.1
 for <qemu-arm@nongnu.org>; Thu, 15 Oct 2026 03:43:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792060990; cv=none;
 d=google.com; s=arc-20260327;
 b=JC7BCUvLDR+qhh1i8pFWDQpPthji4hJqfpQlsFEU/iKo5X/qNpRpQL6LVsCV193Pjh
 JUgIqefrAfLs1QoRrDZ3NWAJ90KYc3yKY3Q01r4osRjIQUd/+wwky0paC3WD/w4+7zP2
 sN1hPjbW+yjDbzrrHIjl6q50BGKVTmbq5DTKGCtAKodxfr3Y+3FhNv/AcknpyA6doprV
 1hiBgITDS+vnjkmLY1GzMNpdylLSohp/Ux/BVRIz4EN0mLQXCMHLaAmss0/ly9RdzTxK
 6Q89/cr1tlc/dD1j7hnffzbaX4e2lmjpb0RQnYxFnMJ8rUr9a3mgvU0Xgd0Z3XavPzjJ
 LdXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :dkim-signature;
 bh=goJEpo9WJS29B8YvteJZWomX9CylYDEkhExGEjFe6N8=;
 fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
 b=ACLGq0RCziv6sJQpcGfi3mZu/MrsazLrOkoo7PTTjDFDlPRfBde9Epo3Jvka9NmCwe
 SobVojhfjTgDxeGnAJiR7QRxCaYNdc/4+Jox+nZFz2qV6BvBTdep2iTMmXXRcV2nSQyJ
 gn8jEPFPiZ9MThqaPgLRFcb08VAruJjFULZ148F637cjQqsdY+KEYFKFV4D08oUbG2ID
 DNysjVyFR0ZjmafApEJq0tBYj5fyKMgc0ESMLzYnePZgLxsHOmoz4wnws9hQXeeMestW
 AWUabMv+zTCDnTgVG06fJcooj1in9iRam3VyAMRtxaod3c349gYTO5MuVcr2Cpi/EREj
 E0nw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792060990; x=1792665790; darn=nongnu.org;
 h=content-type:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=goJEpo9WJS29B8YvteJZWomX9CylYDEkhExGEjFe6N8=;
 b=tmgCVVg0dpqazdqqfaT544e3TATkanVYqeHSoDrS8Bx5fBKEBZELFP9ItRQ8njq0wb
 2bANEMzRJzDAgAGp8NDZqXiCuJ3SgZVWdnJQOCRpywXL/s5KOB6mMfvPkk+UGYharMw4
 LRmA1tVVKVYy3f5BVVnjYeBvbReI1UOsG5IvMcjyZsIkUi3S/33Xkc9UeAlTDYXLC8/z
 PcylwXRIKuAC2azwuVhEkfGQdKbeAQjzwrqvbAQBCp1JOCm8dCKkBLdF/kQb1UIZs/vE
 j3DOYOBOQyW03V5JF0/kbYAKy0AhaGAy/bKEpq3awT5Src3t2s27EcksafPmvWcbggFt
 +pAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792060990; x=1792665790;
 h=content-type:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=goJEpo9WJS29B8YvteJZWomX9CylYDEkhExGEjFe6N8=;
 b=LGFFJOQgMTpbtNIXl/Ui4UwaRJyani9vc3MtCsuo/EItCps+GR/unOJer3jUz0A0al
 B3ekGfybA9Jcx8e6G7wR8W/HhpdfyLPuEcb1IXZ6uX9kD5cdG+otkfsMsGjUhthv9/LW
 2q2qy+JGVnZrL1/B08A5vzYp5PlD1HHy1gPHs+UW9s0+DUG1m+dH+ghN712PpQd9hkAu
 cPY3b35sQpyO4e/FNILnbQINTmC2J7KHb9iT/bKwqTJtnN5IyOBETvSpulyNqpGPiHto
 TYMP9lF3ZZIhIXk62DGCdFONf6eVyYbgRI7urjUyv93RvfR+gIVF1Cf5DU32/3zUs9C5
 Ds4A==
X-Gm-Message-State: AFq9FYKaRAgskzg72djgsX5/u2fUD8TylizZuwx2leW5fjoI8VRrILSd
 iKJGF/iK0qabZSHohBbSdn9wBBgnWsImOuK2P/P6NTJTG4bHDVb7H4uOwZF2xsAoW/bmKK3HWMW
 D0+0a+ElLdA03nNLZDOKSviLb7XJgpPbqtl++kuz/jf8/FxqJN3yHsx4=
X-Gm-Gg: AYBFou3mE1A3BRlv80rcFUdiZom4q9t1geihhUM61IwRG8Iyn24BXWOndWkiB9qjJ6w
 UYU3E/m4WQhb/Dd7cz9L5KQFcZPPGvpfdtUxpfhzyVIzanFqYRh5r0A1XXmzKCagYcMbtCdE05C
 uoW+zhoSiQ6RtEidaCCZAJANt2L8eUPHKa1Oaef1K1aksBjssUflWxHjznsAcxMz8V/cEpmzYMw
 M+05aJTawmGGSiJQtxHF0NzTqlFK6lEoyIzf3j8hMojcbPMlOPzx4Yb6naQ/SkUX9hXou9iqrgU
 N/p2ixTpKVlw3D/p4DlPy+EVlwVZtFSulJANXCW7IvG/oVlWzdbLm89wM9MRD0DoVE2O2Kjoe2I
 JxvVjkHStW0Pt7vS0nd7SBC//r7wt+JW5UI2Baxfz
X-Received: by 2002:a05:690c:6601:b0:8b0:a01e:2cd4 with SMTP id
 00721157ae682-8b0a01e3479mr48027897b3.31.1792060989554; Thu, 15 Oct 2026
 03:43:09 -0700 (PDT)
MIME-Version: 1.0
References: <20261013083933.1024405-1-peter.maydell@linaro.org>
 <20261013083933.1024405-45-peter.maydell@linaro.org>
In-Reply-To: <20261013083933.1024405-45-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Oct 2026 11:42:57 +0100
X-Gm-Features: AclHuK8lN38F5_bdx-GxNkdPO7fyPPY7qDliYUkgp7JGXyOO6SseT0qayM34A_Y
Message-ID: <CAFEAcA-2+rrNObsLnMgy2zVbQQbxFd5tezqESZzk=eBYGg1XjA@mail.gmail.com>
Subject: Re: [PATCH 44/86] target/arm: GICv5 cpuif: Handle PPI injection in
 vPPI pending reads
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
> The GICv5 cpuif allows the hypervisor to configure PPIs to be
> directly injected into a VM.  Setting the appropriate bit in
> ICH_PPI_DVIR<n>_EL2 causes that physical PPI to appear as a virtual
> PPI in the virtual interupt domain.

"interrupt"

>
> Directly injected PPIs mostly behave like true virtual PPIs; the
> exception is that their pending state tracks the pending state of the
> underlying physical PPI, and guest operations that read or update the
> pending state work on the physical PPI's pending state.  (Hypervisor
> operations via ICH_PPI_PENDR<n>_EL2 are not changed, and don't work
> with the physical PPI pending state.)
>
> The complication here is that when nested virtualization is active
> the EL1 timer PPIs must be redirected so that they appear with
> different virtual PPI IDs from their physical PPI IDs.  All other
> injection is a simple 1:1 mapping with a physical PPI always
> injecting to the virtual PPI with the same ID.
>
> In this commit we update the places which read the pending state
> of virtual PPIs to honour the DVI bits and report the pending
> state of the underlying direct-injected PPI.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>


> +static uint64_t gic_virt_ppi_pending(CPUARMState *env, int reg)
> +{
> +    /*
> +     * Return the pending state of the virtual PPIs; this is the
> +     * combination of the ICH_PPI_PENDR<n>_EL2 state and the pending
> +     * state of the physical PPIs which are being direct-injected.
> +     */
> +    uint64_t dvi_pend = env->gicv5_cpuif.ppi_pend[reg];
> +    uint64_t ppi_dvi = env->gicv5_cpuif.ich_ppi_dvi[reg];
> +    uint64_t dvi_mask = gic_virt_dvi_mask(env, reg);
> +
> +    if (reg == 0 &&
> +        (arm_hcr_el2_eff(env) & (HCR_NV | HCR_NV1)) == HCR_NV) {
> +        if (arm_is_secure_below_el3(env)) {
> +            /* 30 -> 20 and 27 -> 19 */
> +            if (extract64(ppi_dvi, 30, 1)) {
> +                dvi_pend = deposit64(dvi_pend, extract64(dvi_pend, 30, 1), 20, 1);
> +            }
> +            if (extract64(ppi_dvi, 27, 1)) {
> +                dvi_pend = deposit64(dvi_pend, extract64(dvi_pend, 27, 1), 19, 1);
> +            }
> +        } else {
> +            /* 30 -> 26 and 27 -> 28 */
> +            if (extract64(ppi_dvi, 30, 1)) {
> +                dvi_pend = deposit64(dvi_pend, extract64(dvi_pend, 30, 1), 26, 1);
> +            }
> +            if (extract64(ppi_dvi, 27, 1)) {
> +                dvi_pend = deposit64(dvi_pend, extract64(dvi_pend, 27, 1), 28, 1);
> +            }
> +        }

This code gets the order of arguments to deposit64() wrong:
they are value, start, length, fieldval, so should be
  dvi_pend = deposit64(dvi_pend, 20, 1, extract64(....))
and so on.

-- PMM

