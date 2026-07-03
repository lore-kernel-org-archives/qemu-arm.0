Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D2E0C43458
	for <qemu-arm@archiver.kernel.org>; Fri,  3 Jul 2026 10:03:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wfajz-0005ld-S6; Fri, 03 Jul 2026 06:03:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wfajy-0005je-ST
 for qemu-arm@nongnu.org; Fri, 03 Jul 2026 06:03:22 -0400
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wfajw-0000SU-Vw
 for qemu-arm@nongnu.org; Fri, 03 Jul 2026 06:03:22 -0400
Received: by mail-yx1-xb12c.google.com with SMTP id
 956f58d0204a3-664bb15d05dso514697d50.3
 for <qemu-arm@nongnu.org>; Fri, 03 Jul 2026 03:03:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783072999; cv=none;
 d=google.com; s=arc-20260327;
 b=BLTXa3gMigBqhEbXtgQIkXUW1GVJL7X20vv7ESxyxLkFeDZxvM+KoaGIDF1ERFJV98
 v0ORxhkPVN9bi25pu+A6oa2ybz6MZrUZdJVFf39CzGL1anacHiW5Q7WGA9SR+6AHzo1s
 GNkuK+BOqxq+aty2ozxIKQ5yGOc9PTa9FcgKcgn2gnS32Yne9wYO89DQRgQm084wq/2Q
 Yf1MMHGSMnMuogROJBIK8TtaZp5R9OJhL4PGu8R6i9hLHOYTXgUsgdzvYIMbUqc1vrkX
 xX3haVabe6tNM1NT8KdEEqmZ4olEGuGo8wUOtMQPAXkmFdJ2eqoh5p2X5Jp4fiSxYua7
 obXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=epB6p1IaO3Hz3hNH5GQYE225pgX3YCgJo21cysGxwJw=;
 fh=pjF22/DHSXEsRctPm269CoOoR0dmtfJsAC1Lt7HDtx0=;
 b=rxo5zmDeX6BSdZngbcbiKlF/FOuWOgfpf1Z3V5nRNlVnTTxSiPwK38RdxGo0f0+KUa
 dsOxO1cSgqnqOW3eoRD+nwZ1pw3iib3/loGNSXlHZ21luYWCZyNxAbIxMT5q2lquH+Hq
 Zbusj9B05zYfM4pkxtHyotPorIZvHEdj811WwzYWdEr+ucJXxMEeSipZ8pQEEe//T44g
 7Q3/6NEZQR/kJSRIjHtrlaDs5KCkFA67xsvXjwkPkkL7SjuIqOl3s8kcAUdAR6dRvU4+
 I7I+UGitBNU1QOvarGjvfS9/kfmvFPE7eKAz2+bzOpP4a5p9ctr1CM/SdvTmdNag0VwS
 yS3A==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783072999; x=1783677799; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=epB6p1IaO3Hz3hNH5GQYE225pgX3YCgJo21cysGxwJw=;
 b=VEbGkggm7l3CZZ3ewlZiAPtzIrNzwOXaH4iY56xdt8S4OlUpMEn8riebw+qmFRlXex
 GS17OELlqYIcwtNsuAFA2NkX9QsOZLpgbvA2vmHEzvWSFQwSEtqb2L21mqFHI3mXWf9K
 BTApwoS3XkuRVrx8Om8+sI+Fi83cHeccS6+3baL13oVT+NzCxuxQbzVDlMTF8xmIkQG2
 cPsPaeNDFw0s4PjOirvuN6cmSP5RGUA3rp/mM8UcKPkQ2rxiL6c5peSIpCpD8lNx47xq
 pDgysSandZ5vDHNpQSrwfPnUUK5jCjifNjJppvoBDLgofnXuhaGUndBAX6rsuJFXQtLw
 c76g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783072999; x=1783677799;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=epB6p1IaO3Hz3hNH5GQYE225pgX3YCgJo21cysGxwJw=;
 b=o00DF8NF7ad/0WAzwq+eCR1ci+qtMZJLIQE472uX8jQA4rKtGVjTw3F68SzgaEsgVB
 9kVNkFJNtb/fsYHsTE5AgjglnwV6OUb8WB3qCUnK9Rh8k3+xwgtSUlRX+caLFpD704WY
 Zhtwav97nUeqqq0fsqTZHeD9UNhN0xxL1AtqlHc8BBU+yn+VPcilgDoPs8pv2M3ZV0Rc
 LOxKRWzNZIGDYVILm4f86r1i0TQM5TyZD/MQTQeyyYppSx5IlGU13IHg4For8Ze+dBaj
 ypqA8aQ9YlPNHjhDB259xUfTBfWSyUQt9klCzFF6Cu06xu9U3u5E6qizjaCc4mFymdiv
 5L6Q==
X-Forwarded-Encrypted: i=1;
 AHgh+Rpit8lbEry/qpBGNrGD/dFVHRW57/gNPH1DmCWxoLW/1jBreEkeNXcJBhl5igPIdI9HIC2Agnal5w==@nongnu.org
X-Gm-Message-State: AOJu0YwPKpSWuLR8rQtrB6MU6JK6WnBXA+vAqBsCNqZREc6N1BNS1LB1
 szZjqp4Obv7qHSan8L/WW+whLxfblWQvhoXKoMOCbqvGdV6nUreYLvXaGbfDWY1+Ib3jmISA6Yi
 xgDvndamaFMQXrT0A1LmvcC1Z0nBO8qOmmZ7agEA5sA==
X-Gm-Gg: AfdE7ckp69tM/ExWmq0QzK9gFHQyLFXUrpmr10O2C7Oqypq0U4+YXphqhzgjfxogHIR
 wmxCH12jVBxg/yWmmlvCZipXPpfz8MFOzhnkThDHtvmyMOKUCQOf0ocoW6yppL6pE/1rTpYH/XL
 174qqQs3yjezPMoxbP7XxAliPQJYjcMtqm1KREgDw/+8/9YKqK87V/rS9ZJNv9VqOCbt98ODfkL
 rnp6iDBq7VqJCLmsrXECE0IvpCdicc5IZqoWUWrBsJijhCkC4uleR2Kz3A20KSWFMj6e6CF9t7L
 H/3YoRlzGPtd4aSu0dD7/2akoYWHqN2pY3NFMNaUC1vbx3FD1hwq/tDj
X-Received: by 2002:a05:690e:400f:b0:664:ae6a:efd with SMTP id
 956f58d0204a3-6659671ed2bmr7444502d50.71.1783072999369; Fri, 03 Jul 2026
 03:03:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260529114723.42040-1-peter.maydell@linaro.org>
 <20260529114723.42040-18-peter.maydell@linaro.org>
 <745e66c7-2a9b-4185-bae7-77e10623332b@linux.dev>
 <20260607182221.4357-1-wrigjl@proton.me>
 <20260629205213.82391-1-wrigjl@proton.me>
In-Reply-To: <20260629205213.82391-1-wrigjl@proton.me>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Jul 2026 11:03:06 +0100
X-Gm-Features: AVVi8CfKE7udJySa1k_xy0B3X4nGBmsWNBKGg5XWrHY-BPxKes0qjDHAsYmWhtk
Message-ID: <CAFEAcA_ePFPA=Bu33D4kchSUjeaXw25tcggNLiYeRvR2cp-6tw@mail.gmail.com>
Subject: Re: [PATCH v2] target/arm/hvf: seed NO_RAW ID registers from
 isar.idregs[] on vCPU init
To: Jason Wright <wrigjl@proton.me>
Cc: agraf@csgraf.de, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 zenghui.yu@linux.dev, richard.henderson@linaro.org, philmd@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12c.google.com
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

On Mon, 29 Jun 2026 at 21:52, Jason Wright <wrigjl@proton.me> wrote:
>
> Commit 887eaa8a29 ("target/arm: implement FEAT_RNG_TRAP for RNDR/RNDRRS")
> gave ID_AA64ISAR0_EL1 a readfn so the RNDR field can reflect SCR_EL3.TRNDR
> at read time, and marked the cpreg ARM_CP_NO_RAW in the system-emulation
> path.  HVF then trips its hvf_arch_init_vcpu() assertion that no ID
> register in hvf_sreg_list[] is NO_RAW, aborting on boot on Apple Silicon:
>
>   Assertion failed: (!(ri->type & ARM_CP_NO_RAW)),
>   function hvf_arch_init_vcpu, file hvf.c, line 1441.
>
> Reproduce with:
>
>   qemu-system-aarch64 -M virt,accel=hvf -cpu host \
>                       -nographic -display none -bios /dev/null
>
> Fix it the same way ID_AA64PFR0_EL1 already is: list
> HV_SYS_REG_ID_AA64ISAR0_EL1 in the SYNC_NO_RAW_REGS block in sysreg.c.inc
> so the assert loop skips it, and seed the vCPU's copy at init time.
>
> While here, unify how the three isar.idregs[]-backed ID registers are
> seeded.  isar.idregs[] already holds QEMU's intended value for each (the
> host caps, probed once at realize via hv_vcpu_config_get_feature_reg(),
> plus any QEMU adjustment), so there is no need to read each register back
> from the vCPU first.  Seed PFR0, ISAR0 and MMFR0 directly from
> isar.idregs[], dropping the two per-vCPU hv_vcpu_get_sys_reg() reads:
>
>   - PFR0: take the GIC sysreg-interface bit from env->gicv3state, as the
>     id_aa64pfr0_read() readfn does.  Identical to the previous code
>     whenever a GICv3 sysreg interface is present (the configuration HVF
>     runs in practice); it differs only in that a vCPU with no GICv3 now
>     reports ID_AA64PFR0_EL1.GIC == 0 instead of inheriting the host's
>     value, which matches the field's meaning.
>   - ISAR0: no overlay is needed; HVF does not expose EL3, so
>     SCR_EL3.TRNDR is never set and the readfn is constant.
>   - MMFR0: still clamp PARANGE to the chosen IPA size, updating
>     isar.idregs[] in place because the page-table walker and the
>     ID_AA64MMFR0_EL1 cpreg resetvalue read PARANGE back from there.
>
> Reported-by: Zenghui Yu <zenghui.yu@linux.dev>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Fixes: 887eaa8a29 ("target/arm: implement FEAT_RNG_TRAP for RNDR/RNDRRS")
> Signed-off-by: Jason Wright <wrigjl@proton.me>

Thanks for respinning this. I've applied it to target-arm.next,
so it should get upstream within the next week.

-- PMM

