Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E317CD8C92
	for <qemu-arm@archiver.kernel.org>; Mon,  8 Jun 2026 13:07:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wWZhS-0004Bt-76; Mon, 08 Jun 2026 09:07:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWZhH-0004AC-NU
 for qemu-arm@nongnu.org; Mon, 08 Jun 2026 09:07:20 -0400
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWZhE-0006o4-NA
 for qemu-arm@nongnu.org; Mon, 08 Jun 2026 09:07:19 -0400
Received: by mail-yx1-xb130.google.com with SMTP id
 956f58d0204a3-660e9ea26b9so4040122d50.3
 for <qemu-arm@nongnu.org>; Mon, 08 Jun 2026 06:07:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780924035; cv=none;
 d=google.com; s=arc-20240605;
 b=D5Iz0d0UNmFNLoAdgJJgeVP2YDySVwvxycP1QN8UNB6Nu1UMp99LwuRPlvesGVoTLi
 HV+wVR0Hv/BRaJEkuQxfNKW7E8iq/tQgo+MG+MezjqGy0XnRfOP+Hr4BBpUOccfpIVjq
 j7tWkhWvLGGDpIr2yQRPx6E3KAPpMd1u5+a35ckIcRGDAyeHOeuJb7TTcqt5fQeK7AmS
 H8ZrzRvK95ZfPBnEDIZPZv0/82Z5tlXKg/iY7+1Lz/ZfL4fYkGXZi+MoaXJAk7lqVD5r
 VMf3OHtFMt8qOq1qYT4yFeZyddJC6cHPkemcm5+x605mUbKX016L+XRYkp2Yo9gZxV1J
 hqgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=X2E6QoyoXiQqafcCnuYVQGqLMF+AEhSP/fPIZuT/MpE=;
 fh=at+TNkD0LoocYCoaBA2h228v+QA2AnTobO5UcJ1LO7A=;
 b=K2ftkG0ZLouZJrkCvy9i98E2dxvWAUM3oxyqBYTCWf35SD2L1vlnCT9ZXScqz1XuL2
 Xhed0EPuaPwCu5jvHnUn7JITN0ty+6cTsda/1j3d8JPS7asHQglf7o2NzzVzJd67moGs
 Us04yfOy5DInMQHGQrgXmGGZTdovIOuPkk6Ka0qAgywzYAKhGJ7ol7ORc9vici1eO6Xc
 mdZ33Q0WW/yecZBEnPiG0vCsKgSbBDSi9MYId6HjQ2BWEJRXTaSflbXY/xjghdK1GnaZ
 gQZjIjeN0X1NTXDQBUgHw98DckbtBZm1QQ3vvhud76vt9Dn73uuUWmGr/tZX2CgbPN01
 lsIA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780924035; x=1781528835; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=X2E6QoyoXiQqafcCnuYVQGqLMF+AEhSP/fPIZuT/MpE=;
 b=KYoRll/9NZxmuqrr1EAZZs5Lgl0+y0x5tNH+2xn2Ltq97Ve3s4olA8mbRNJlBF+287
 /p/10Yfzq3laTQPOksFsQbZOZwr1T6Gtlv+zrZ5KSdStnKYphZ4bAEcAm3gNz2TThsJe
 6yMXaggaaxoT+Aonoluxc5HvdKFsSpaiyuxorL3ZMj25MjSQ6ptgFLznyA5qZpMp3uiS
 6g+b+BNyAtxm0uBVXc+2rMmtkhYq55jZtwqTJ9etsrPtsi4VJmYizoQUFn6i04LGSQjq
 IAi735qHuknbNAdoN1a5wCEmDSB2kq4xBajaSfi0RYpBrLaVaOF0NSX8Xi68WRs2WEFw
 0Hpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780924035; x=1781528835;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X2E6QoyoXiQqafcCnuYVQGqLMF+AEhSP/fPIZuT/MpE=;
 b=bl0GhHgkSzn/VQl3tCZBErq4CO33EnkqYtL5HbCRUtDDjnO7cfDteIwHIj6FcY9dZM
 x0nEy5TlBcp4vOXi0dCeYC63wQSkH+bsd1KrZgr7W9hqe2pAKyCEQM381kIstkCON53o
 Qr/CwSlDojLwpfzpZDVEnQn8dlmLoUnpghEMzhdXJZRntwR6Nim5i1GiGPcKhjLAU4O0
 aMiKmUr+ptkQz4Ir+gAvz+6eMnldIPi0/fElUR/JyeAwX/RPPIx5cVcO5pusxaL2y7OP
 E4LlIvARso9MvTu4yB4T51pQV5060KsAZhbk/bs3ZMf8IU8AnrO9MWPN7Vl4DMIGsqxJ
 8beA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+l2XbaexCjYkGyhMH5p9+/+94ZncJZ2eAHnUdRZXo3yrTja3OeNkqyvMM/QZTZXITpQkzrJWm2/A==@nongnu.org
X-Gm-Message-State: AOJu0YwlSz3qLUXVbmyQFkuSHnQ+CI5RABCJjuwukfE4NxlcPnyizc19
 7ZM349FHgU9LV3tzGvkax8giax88SrHeHubTlsxVlI38j1HggQy3UCUXzyjemIyHp3RctYA8Sq1
 2IVCXaDqGsufXkMeYt2gVWruQeXe0/8XLRe6DRq1qgw==
X-Gm-Gg: Acq92OEudYEPFQKOmvdnNtXqHiaN1PxxGP6X8OAXxvc7jbtu22qG8Nbmf5ujI/EWrDT
 agy1NxbrM84xZowl5h2C5M10894CxgmA9GidSXNRuez7oJWmOOQxuUHJPw1A3p6H1jQWOou/+U2
 VJiejF21/WiyF71m6upXT5yNbHFohv25pY3+D/csozwSQR4uLoh87lLbLvArqaUGkfFIg3TrXg5
 sra01C+1jc7ytQbbsU+xDcoWkjaL2kad7wkADfwci3rcM6M3CA8DbOy5EJNwGor3KhXsx0lBzIj
 Ggtogq2WzP3eNy/q+YrF+OieUNlCYdQRl8eyrUpj+rmBNSU+JWlQo1A6EgrQ0JGOSlhucJoDaFQ
 JGQ==
X-Received: by 2002:a05:690e:144b:b0:660:8e61:1a60 with SMTP id
 956f58d0204a3-661073da64dmr12653994d50.14.1780924035332; Mon, 08 Jun 2026
 06:07:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260529114723.42040-1-peter.maydell@linaro.org>
 <20260529114723.42040-18-peter.maydell@linaro.org>
 <745e66c7-2a9b-4185-bae7-77e10623332b@linux.dev>
 <20260607182221.4357-1-wrigjl@proton.me>
In-Reply-To: <20260607182221.4357-1-wrigjl@proton.me>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Jun 2026 14:07:03 +0100
X-Gm-Features: AVVi8CcPWkIESGx4vqtg_G5eMNCMNTKW_VlAYElXxaQxdD1ktV5N9k1BylPAKfM
Message-ID: <CAFEAcA-xEaA2LM=17Q1pKOF6L=rHhaDimXeSmLe=BtDqeaBeFA@mail.gmail.com>
Subject: Re: [PATCH] target/arm/hvf: manually sync ID_AA64ISAR0_EL1 on vCPU
 init
To: Jason Wright <wrigjl@proton.me>
Cc: agraf@csgraf.de, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 zenghui.yu@linux.dev, richard.henderson@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb130.google.com
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

On Sun, 7 Jun 2026 at 19:22, Jason Wright <wrigjl@proton.me> wrote:
>
> Commit 887eaa8a29 ("target/arm: implement FEAT_RNG_TRAP for RNDR/RNDRRS")
> gave ID_AA64ISAR0_EL1 a readfn so the RNDR field can reflect SCR_EL3.TRNDR
> at read time, and marked the cpreg ARM_CP_NO_RAW in the system-emulation
> path.  HVF then trips its hvf_arch_init_vcpu() assertion that no ID
> register in hvf_sreg_list[] is NO_RAW, aborting on boot on Apple Silicon:
>
>   Assertion failed: (!(ri->type & ARM_CP_NO_RAW)),
>   function hvf_arch_init_vcpu, file hvf.c, line 1442.
>
> Reproduce with:
>
>   qemu-system-aarch64 -M virt,accel=hvf -cpu host \
>                       -nographic -display none -bios /dev/null
>
> Mirror the existing treatment of ID_AA64PFR0_EL1: move
> HV_SYS_REG_ID_AA64ISAR0_EL1 into the SYNC_NO_RAW_REGS block in
> sysreg.c.inc so the assert loop skips it, and push QEMU's view of the
> register to the vCPU at init time.  HVF does not expose EL3, so
> SCR_EL3.TRNDR is never set and the readfn is functionally static there.
>
> Reported-by: Zenghui Yu <zenghui.yu@linux.dev>
> Fixes: 887eaa8a29 ("target/arm: implement FEAT_RNG_TRAP for RNDR/RNDRRS")
> Signed-off-by: Jason Wright <wrigjl@proton.me>
> ---
>  target/arm/hvf/hvf.c        | 4 ++++
>  target/arm/hvf/sysreg.c.inc | 2 +-
>  2 files changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
> index d88cbe7c82..afa1120c8a 100644
> --- a/target/arm/hvf/hvf.c
> +++ b/target/arm/hvf/hvf.c
> @@ -1485,6 +1485,10 @@ int hvf_arch_init_vcpu(CPUState *cpu)
>      ret = hv_vcpu_set_sys_reg(cpu->accel->fd, HV_SYS_REG_ID_AA64PFR0_EL1, pfr);
>      assert_hvf_ok(ret);
>
> +    ret = hv_vcpu_set_sys_reg(cpu->accel->fd, HV_SYS_REG_ID_AA64ISAR0_EL1,
> +                              GET_IDREG(&arm_cpu->isar, ID_AA64ISAR0));
> +    assert_hvf_ok(ret);
> +

For ID_AA64PFR0_EL1, we do "read the value from hvf, update it,
write it back", and we do not either read or write the isar.idregs[]
entry for it.

For ID_AA64MMFR0_EL1, we read the hvf value into the isar.idregs[]
array entry, update it there, and write it back to hvf.

For ID_AA64ISAR0_EL1, we write whatever is in the isar.idregs[]
array entry into hvf.

Why do we do three different things for these three registers ?

thanks
-- PMM

