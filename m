Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62072C624D5
	for <qemu-arm@archiver.kernel.org>; Tue,  1 Sep 2026 15:33:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x1QU4-0000Vc-7F; Tue, 01 Sep 2026 11:33:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x1QU1-0000UR-0e
 for qemu-arm@nongnu.org; Tue, 01 Sep 2026 11:33:09 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x1QTy-0002hO-4n
 for qemu-arm@nongnu.org; Tue, 01 Sep 2026 11:33:08 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-864cd11a932so14460007b3.0
 for <qemu-arm@nongnu.org>; Tue, 01 Sep 2026 08:33:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788276785; cv=none;
 d=google.com; s=arc-20260327;
 b=BLRNExn0aPtUs6PO0VTP0lvFyAv2kOsN7mYeMLxOtWanAugDZ+/oCwcpoWhtpi4buR
 /qbAlzuXKuUsBs+Q5gvphN5GDI2B7yUUKy+EfFZf7Ooh0WVnSjKdbQqjN3qpT/PEjiWj
 sJKlCnuNh5w7FXhX6pkUYo2htZp7xure2hEiFDLXgCCezF/3bPLM8b55y2Mjz46sbzED
 sUoNrQFPhKFH1MGxbc1aw6CAejTeFO4gfNR79hHSc5mNHlGmgcILdYhsvkk4xLnjotMt
 7ioBMDkqsmTVLJQQWGLjPY3mq8pMggBAeT6IARCaXU9kWT5ZRJzluHVtOaEPB47DiQ73
 /ggg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=TfsYZWGUp3JEz46SYJF6kaNN+w8kJcJepqqETpNYZOw=;
 fh=qyknB8vinIEildVMOcKV9ZpcCastN6yqmbSCZO20s9A=;
 b=LCwZOAlow7r2SemwbI4KayjLxuG9Sj9vCj8KhY9/HVOqvkV1LJntEFNl4mPkmRQFI1
 oL5Ca6vfORPORkRQHNNMHbWfjTgW1IKxg/5FntXiylno2l85QFIXe2BncJVRhS0MGqXr
 bEJUK4CPk7RcIBrTrnZvSNVVwsC4ksYVE24vS+kiecbmAZIWgEy7h3x/oLAG1Td/200Y
 G0STTTYOM8qgJTDufT3GGYtHYSM4zj5hhnEj5RZQ4fHEJq72uJjkJ0qppofZx6f6Q7uN
 e8k68zIdTLxJSDqCgLe1AtIf42qcnoSqPml08gjCMQRpSlBHeL5p3B2kpX+H2PY3SNAJ
 Hghg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1788276785; x=1788881585; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=TfsYZWGUp3JEz46SYJF6kaNN+w8kJcJepqqETpNYZOw=;
 b=t+gUDO6kwIJCXPcg15Nfy0i/2s4AkYNrzlibE/mfzzSEJu5E9yHeIBTHpdfrcHPvhq
 qFNcAqipWC3AiO52XbVmrgKGCSO3DWJg2Ng4FBsS7tyPKyDlzVFVjU7qHBS1OGswHzTt
 LvqjJoVCiTxMt92bYhxZUIqocTs2x9avM9aQSyIFddyMAqZuBYAucZ7pKhvmSpXfnPC2
 siRRRHpFvqRiTtDVRL9TGy+EYDDtYAfR/SW7DWge9RDx+UM7GspZPQrYHdYMli37NXna
 +uH4WbcAzDVQmjfbJlswPN2D3i3aPcc1PHbEYeLDM9x1BaYfULJoOIOTedfjHfpnMeXL
 E7Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788276785; x=1788881585;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=TfsYZWGUp3JEz46SYJF6kaNN+w8kJcJepqqETpNYZOw=;
 b=lZ1V+zX7DiiJOG4+pNIg8BM0MSorCjexjXi9g4TSzcgouFut+8snFfJNztfcg05EY0
 2fZYZJ6xUZacFcoUY1PXo3Oz0rTpNWk0PkHHKrr9gYDYrr1dGDJCJfA4kTZ+Jl/HYrfB
 hcKc4GIa4A4egcCt3Dm7R5Vg9jKIOmJQ46Lt7UeaOLvm7kX8DZrdEplWb6uIiCOtc8PV
 UNt2Sphfc4R2Wdx7PnckMs3Z0JJiNjrEdXxIriD5zl66cyn77xpgNkcCkXtcOJbXTO7r
 hUWEiTSmXyePW47dS6e9yw2CnXIuwdgMIVBm68G148ZpM40tMeFnfAcE4HrbvY1fztly
 Vr9A==
X-Forwarded-Encrypted: i=1;
 AKwUvByz+ot2afZoVsPR6vxcBbynaaf9AtCWW6J4Azo7/IJD6C7dB6pqqcwL6HJkJ1wWt61cO25edTFXmg==@nongnu.org
X-Gm-Message-State: AFuF++mvsrC8WM44tcIUvAHPGhXv45ZMVjze/Umb2sa53evKN1et0/UE
 J5tAJ83+vy+kvrX8Gw02vnsx8s3klaGLlpp2tE+/ibGLqrejU+oVxKOyWfqVm1HydI0Hf4Ts69x
 OZr4VGmK785WLWNl4T1PNTYXSBMs0+b2oow94LvVyHA==
X-Gm-Gg: AYBFou3OG5QEkp9hatDOTvUg/y0i+N1t7slTkR1wYKbouDSoQ8aFQY03L9CFIfn+Jyb
 /OAPgyqg3lxzKu0h6eke+8dvMQ/NT0JdDBrVSs7NEJTk48AuSoW0CTdugwuzDKzT9r/u3AdsIdq
 S2brOt2eXiHaZtpIrhvChDQYOAcPxcQYYExKnY5y+ZYzF/uOjc17fyjWc/ovN4W0+4RK8+diMFd
 JCgthEdjOuw8YD1f3y3rCPKaL/XBGEQpZLaDcGAzm8No8wlIs6gqvrLvrS3537aHovxEfBm1h6y
 /w7gKEX/T+lwnq0jPADKQRp563iIlrzZujl0nGYb36k02bjZK2IiS5Pj0hzHW5xrOvHOT9qcrMf
 02ipPEpD+AbJ5FbOOytbqt9Svrk9WyU4jVl9oZNo=
X-Received: by 2002:a05:690c:6612:b0:82d:8dc0:9cf with SMTP id
 00721157ae682-8694d8b47dfmr27793407b3.13.1788276784411; Tue, 01 Sep 2026
 08:33:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260815203730.1468365-1-richard.henderson@linaro.org>
 <20260815203730.1468365-12-richard.henderson@linaro.org>
In-Reply-To: <20260815203730.1468365-12-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Sep 2026 16:32:52 +0100
X-Gm-Features: AcwNN1VaWNaLBvJzUz4ncwiHukBE1sGNIdi--zfmzWUHZDkOOjWrXqjsU6ZrGdw
Message-ID: <CAFEAcA_SLOJ9HufYt5B88S5LwCKo1Cmj8EqcvRn1Ym0jCFc_WA@mail.gmail.com>
Subject: Re: [RFC PATCH 11/18] accel/tcg: Replace size with first/last in
 tlb_fill_align
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
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

On Sat, 15 Aug 2026 at 21:39, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Propagate the API change down one step further within cputlb.c.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>


> @@ -1664,8 +1665,8 @@ static bool mmu_lookup1(CPUState *cpu, MMULookupPageData *data, MemOp memop,
>      if (!tlb_hit(tlb_addr, addr)) {
>          if (!victim_tlb_hit(cpu, mmu_idx, index, access_type,
>                              addr & TARGET_PAGE_MASK)) {
> -            tlb_fill_align(cpu, addr, access_type, mmu_idx,
> -                           memop, data->size, false, ra);
> +            tlb_fill_align(cpu, addr, addr, addr + data->size - 1,
> +                           access_type, mmu_idx, memop, false, ra);

Can the "addr + data->size - 1" in these mmu lookup functions overflow?

>              maybe_resized = true;
>              index = tlb_index(cpu, mmu_idx, addr);
>              entry = tlb_entry(cpu, mmu_idx, addr);
> @@ -1833,8 +1834,8 @@ static void *atomic_mmu_lookup(CPUState *cpu, vaddr addr, MemOpIdx oi,
>      if (!tlb_hit(tlb_addr, addr)) {
>          if (!victim_tlb_hit(cpu, mmu_idx, index, MMU_DATA_STORE,
>                              addr & TARGET_PAGE_MASK)) {
> -            tlb_fill_align(cpu, addr, MMU_DATA_STORE, mmu_idx,
> -                           mop, size, false, retaddr);
> +            tlb_fill_align(cpu, addr, addr, addr + size - 1,
> +                           MMU_DATA_STORE, mmu_idx, mop, false, retaddr);
>              did_tlb_fill = true;
>              index = tlb_index(cpu, mmu_idx, addr);
>              tlbe = tlb_entry(cpu, mmu_idx, addr);
> @@ -1849,8 +1850,8 @@ static void *atomic_mmu_lookup(CPUState *cpu, vaddr addr, MemOpIdx oi,
>       * but addr_read will only be -1 if PAGE_READ was unset.
>       */
>      if (unlikely(tlbe->addr_read == -1)) {
> -        tlb_fill_align(cpu, addr, MMU_DATA_LOAD, mmu_idx,
> -                       0, size, false, retaddr);
> +        tlb_fill_align(cpu, addr, addr, addr + size - 1,
> +                       MMU_DATA_LOAD, mmu_idx, 0, false, retaddr);

thanks
-- PMM

