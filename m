Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4C28C61DD6
	for <qemu-arm@archiver.kernel.org>; Tue,  1 Sep 2026 15:22:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x1QJH-00064d-Vr; Tue, 01 Sep 2026 11:22:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x1QJG-000648-UA
 for qemu-arm@nongnu.org; Tue, 01 Sep 2026 11:22:02 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x1QJF-0008OU-8h
 for qemu-arm@nongnu.org; Tue, 01 Sep 2026 11:22:02 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-855de2d0d4dso17717407b3.0
 for <qemu-arm@nongnu.org>; Tue, 01 Sep 2026 08:22:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788276120; cv=none;
 d=google.com; s=arc-20260327;
 b=Si5/6b+/xGldXe8d5N6LuK8JTRltUnJ8XA/5loRR6eYQEFxokRw/3/5t/OEjT8zUeZ
 IGlFfJx50eSQMoCG0iPIHDsrDfajII9RPLTxxGz/rpVsV08gpl8cb/1KPtf3Rd/zvuAR
 oZic3VR6OIooNXTxt+WaTNGvSWiPup31ZG28PD+KpoJ7tvcZtyiepRhOYSspSVpgCurF
 CKaicJGVbZNPd3iFDdN0rehnYDl167veVE3BMXGxo6pslN1+m1w8CRHo/7baW5jRfKfM
 d3GVst31ub8oAdt7CbDFhR3qtjVL8MlAfujJHEsDlRU7S6QvHfKKvj4qJwkw68EMY+Zp
 THvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=NPTGdcFSJhaCrmSR24FP951+qs5BMX8kS9irH5bhNYk=;
 fh=KKa5U1qC1t1Fex1ivDZyWvwIyrRIqmY9RtZ5gl9Shuw=;
 b=VS8L38yug55MK9vTh8n4YtWa7VySsAitAQVxyILcfgp9NjkPXYzi6qDlHpsTP8gUnb
 sUDAIh40zP0PEeYUiIismMEPWWRoskxmsSRKrBnNRQRZXiMfbxfOBEKfy1xO5oOaPQfp
 v3rqTWTmDGYgwHM5x+N5E6SZ8VDbXJC9SRAannX1Cmcwusbzpw3vZr2JotB+0xl2S3tH
 NKqxI6YYd4ZvBDQ4oYDMBjC/KfZbyUHxxOd3V8DSwELR+4d0ScLOuUPo7hn9+67K4JYx
 TSGFNknXngWhLD9rk6NiAK6tePWOvz1j+LP+qPvyTQd/wjhanagWFjfUkJixtVwpW8pg
 P1Mw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1788276120; x=1788880920; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=NPTGdcFSJhaCrmSR24FP951+qs5BMX8kS9irH5bhNYk=;
 b=Ps8BY5rrKskk+lDsgG5t3S3QF4C2RDVx7HCwGLy00Q1cdxulAD/UjQvFkM6UcfS1TK
 4PX7psLWtr1D3VnZvFrtEK5wDUHnf5G4U6aKTavE85IvqV+OrLEO/rGE7wv7ngVZh+lD
 LkWsEeJmpUF1edcy2KZwMR13c8Vv2zmgyekt9KnP9w4Jo/AQLu7UE4Z5UQMXDh/UpPS/
 csrn18K8WUWk3zRmgL4FLuL+8IDQteGhtYCEPse6tf6unKXiBoR7adjIm9nGM0Zg0xJN
 IHGZ6LDMkHPyk2uhdXzBBWCnzeU3l3xXzZRtsjYf7OSJ1+DPlEQlTXk5ocs94MybT+ZS
 pgLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788276120; x=1788880920;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=NPTGdcFSJhaCrmSR24FP951+qs5BMX8kS9irH5bhNYk=;
 b=Oj7c/JgdUen3b1FewWFCDS2LbU0fZM3ZzHQHxoipaRP4/vH3XsSCSwU70nQ/57kHRX
 zdLr41e4gJGqsBrokoiho9n2iXQuYJ2bobjzSJ7w2XJ/p7pkuPO+zV1GM6hYBcdzzXVM
 zSwHctWX3fu22Upz6E48abnyVMJCtGPGGPAhhVuOYJ6a6iQIND3DGNCVLzeJF3xKVri1
 RVpqdo/tETHhzZKtAPB9eCuC0Oxs2kY+IrFDjWcqfJcH47+Kc1udsyhnUI55Rfxb87fo
 XfoRKzSyLT8Xa/zv7WyWidSfzYgp2Z3OUO4o+qcUUhSFzm1p3dPBpBHlwcu2AhLLddrI
 D+/A==
X-Forwarded-Encrypted: i=1;
 AKwUvBxN4hK+0Slb8VaUHzEYe0V+zOup1j1GnY33Z1kEbqRuFVYUt/5ynNEBslkj28dR+5Zp9eN7Cbi0Hw==@nongnu.org
X-Gm-Message-State: AFuF++mFoEJtRtmUEQjStw8PMr7ic91Nddp5nY0Lm9mDA0M1hX7Mb1Xj
 DNK7o82Go+U2P7ZVvZA3tYbXM/QomCoHkOg9fv/06ZEm3V77i9ZPCrCRw9Sw6nhMMvaIWb+ZDdB
 2jTKwluUKCCEGOxM7CCPWL5UzF6ZOjZEZamIz7cZEIg==
X-Gm-Gg: AYBFou2f61sGm9uQSh97EHgTtnUPONYmrK4A7rJE4TgJefpTKs/sTFpJjKiRot/ht9j
 xzrpcaymT+iqI2hfmdydcMWS/P6uvRHWPDgC24KiBGAFVNQ13E2qNxXJ4fGj3VfheKouwCqy0uD
 etKTzVTJ9al924Z1LlkxUkeico/b4yuzCQOkHyR3JoCtr8G1prHvak4YRJG3crb7UTiI0XOuWES
 J3dgw7gIsesr4OtcV/s5mozw/4515ui7ljjh7oE2m9rgBJavB9JvbU6OUG5lkz108H4MCbUBi6H
 0aTClW4ZpFdOTa4aBE+rpdiUmNEB782UV4goW3eHODpILFcKoqvRzX2+818N+BQDgpxqBLUQj3w
 nNGSTsUT3BEhYauDVo2ewBvz6T0LB4jMDqYUVMjo=
X-Received: by 2002:a05:690c:a7dc:b0:80e:dc2:873b with SMTP id
 00721157ae682-8694d0f26c1mr25481777b3.16.1788276119819; Tue, 01 Sep 2026
 08:21:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260815203730.1468365-1-richard.henderson@linaro.org>
 <20260815203730.1468365-9-richard.henderson@linaro.org>
In-Reply-To: <20260815203730.1468365-9-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Sep 2026 16:21:47 +0100
X-Gm-Features: AcwNN1XgVCv_F9f-hV547-VZRoptUeYrotU46yMTkTDPrOiyTTR_lcVQRovmu5g
Message-ID: <CAFEAcA_S-bbWV6aSJp+LaQVPD3c1v4mrHoM-ZWs-meY=M8nFXw@mail.gmail.com>
Subject: Re: [RFC PATCH 08/18] accel/tcg: Replace size with first/last in
 probe_access_flags
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org
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

On Sat, 15 Aug 2026 at 21:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/accel/tcg/probe.h        | 24 +++++++++++++++++-------
>  accel/tcg/cputlb.c               | 15 ++++++++-------
>  accel/tcg/user-exec.c            |  7 +++++--
>  semihosting/uaccess.c            | 10 ++++------
>  target/arm/tcg/sve_helper.c      |  5 ++++-
>  target/riscv/tcg/op_helper.c     |  4 ++--
>  target/riscv/tcg/vector_helper.c | 21 ++++++++++++---------
>  target/s390x/tcg/mem_helper.c    |  4 ++--
>  8 files changed, 54 insertions(+), 36 deletions(-)
>
> diff --git a/include/accel/tcg/probe.h b/include/accel/tcg/probe.h
> index e3068a79de..06faf1269d 100644
> --- a/include/accel/tcg/probe.h
> +++ b/include/accel/tcg/probe.h
> @@ -49,23 +49,33 @@ static inline void *probe_read(CPUArchState *env, vaddr addr, int size,
>  /**
>   * probe_access_flags:
>   * @env: CPUArchState
> - * @addr: guest virtual address to look up
> - * @size: size of the access
> + * @addr: virtual address
> + * @first: beginning of virtual address range
> + * @last: end of virtual address range
>   * @access_type: read, write or execute permission
>   * @mmu_idx: MMU index to use for lookup
>   * @nonfault: suppress the fault
>   * @phost: return value for host address
>   * @retaddr: return address for unwinding
>   *
> - * Similar to probe_access, loosely returning the TLB_FLAGS_MASK for
> - * the page, and storing the host address for RAM in @phost.
> + * Probe an access for [@first, @last], where @addr is somewhere
> + * in that range.  Normally @addr == @first, but some targets have
> + * accesses which are forcibly aligned after an initial fault for an
> + * inaccessible page (e.g. Arm DC_ZVA, where [@first, @last] will be
> + * the bounds of the cacheline containing @addr).
> + *
> + * If the access does not satisfy @access_type:
> + *   - if @nonfault is false, raise an exception at @addr
> + *   - otherwise return TLB_INVALID_MASK.
> + *
> + * Otherwise, return the TLB_FLAGS_MASK for the page, and set @phost:
> + *   - host address for @addr, if direct host accesses are allowed,
> + *   - otherwise NULL.
>   *
> - * If @nonfault is set, do not raise an exception but return TLB_INVALID_MASK.
>   * Do not handle watchpoints, but include TLB_WATCHPOINT in the returned flags.
>   * Do handle clean pages, so exclude TLB_NOTDIRY from the returned flags.
> - * For simplicity, all "mmio-like" flags are folded to TLB_MMIO.
>   */

We should mention in here somewhere that it's a bug in the caller if
first/last aren't on the same page (and we assert that).

> diff --git a/target/riscv/tcg/vector_helper.c b/target/riscv/tcg/vector_helper.c
> index b7b3805a6d..87f2196bc7 100644
> --- a/target/riscv/tcg/vector_helper.c
> +++ b/target/riscv/tcg/vector_helper.c

I don't understand the code in these riscv vector functions well
enough to have been able to check whether we have "calculation of
'last' might wrap around to 0" issues here. The other changes
in this patch look OK on that front.

-- PMM

