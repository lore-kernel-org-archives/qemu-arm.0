Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 820A3D2FED9
	for <qemu-arm@archiver.kernel.org>; Tue, 27 Jan 2026 20:52:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vkq2M-0001HK-TP; Tue, 27 Jan 2026 15:51:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vkq2L-0001GV-AF
 for qemu-arm@nongnu.org; Tue, 27 Jan 2026 15:51:45 -0500
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vkq2J-0002BA-3g
 for qemu-arm@nongnu.org; Tue, 27 Jan 2026 15:51:44 -0500
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-78fdb90b670so55842617b3.2
 for <qemu-arm@nongnu.org>; Tue, 27 Jan 2026 12:51:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769547101; cv=none;
 d=google.com; s=arc-20240605;
 b=LwroQv0x9ENefT6+V60F6wfMTuqqRZwbjmSgWa6QXzLw5rF8D1jcNo5KTFabslqcPV
 ENKEZ4w1zzFFj29fQnn0zZODnybQvrxpweHJSbIEi7XOav2DtEs65ks4uc2OUfyjyp67
 Q0AiQd9PDCJyGBhgvoaAfyAAFz3IZi2jRXjohG57ZUgw02FwiTjhDSnFozE9KjfYHBag
 j/NKzy4wg9sgIErzO9j9W1hWfdjw3Bordsb5HVe/9sNhSD07bsodPpe4gaGkaDyCoU6q
 xiiJYGvLwgl0MXPRnF+f/3bp8D7fUNq12mjrUaQl/7LMNoBKoGfkcLWv7y9N5bKB/inH
 QjwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=j650I8U36tmy5ppnM3eeepIzkkg2D22/3Dxbno5Zfao=;
 fh=C8R2SAyE3X8kf+GYHqFJpiFCwtMPhFBmuT/qx6gyqsE=;
 b=kl0YFoqYzOU04O+0zlE3AMRw0gEefyOegxN0nHXwxBD9DtjUCoNUcZYHVMAdM1IvlR
 QcVFuqMWaxQ7wiliRhEHwEuelSlWmz1XGHL95i7UD/hZ2lJlqPwTYA7NlBOiQv2EuFWO
 aq0aWrjqoItiVG1qqJOzTVt8AooF34L892HySMt63V7Zp+mr0e9qYpUFB23fW8WFesk8
 G6BkEN4eSeZKu4lCT9pXAPvKA8oQAp8KSeDyecFutQCHE55bH7qMV2w0gibrjrID0rZm
 Mlf2a1/pic3EuJfbBqCqeIWgo8y4Hlhll7akiURMMaJwlQsidPoCxBs9BP+SUwWHDE3D
 GJZA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769547101; x=1770151901; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=j650I8U36tmy5ppnM3eeepIzkkg2D22/3Dxbno5Zfao=;
 b=Qt54+C8NhRqb1P3aaAWWR+JNN+qJVOlEI2Yxh7gd59uGtWOS336v/rrcD7/yhh1JzV
 X0WSumMsLaoyO9733CctOpC/Vf0/olWZTikDqweCJzT3SEcSHH0r5V9b/WfTBh7G0HSm
 O6+/Dr7VEeXrRjcXasjf0xMM7ZDtuy3FyNbdc8/KtMB3pgxUihgltHLrvnLtSYLffgpz
 xmXlqw6QrYUiEe3rdtoLle7qsxCpfMwbPOSmqNkl2hpcFF8856m3Vj20/D8qnRa5wmD6
 DSlz9fy0N/oJct3hQUJijOiy/b1ujUQYccwxTXoQ8ZT99m14xxzfGyDqaPjjre5M65bk
 Ca/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769547101; x=1770151901;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j650I8U36tmy5ppnM3eeepIzkkg2D22/3Dxbno5Zfao=;
 b=Pdzu0r6P8UTg9Er0Lnn1Kc5qYkSJJTrtVv4Jy/aHpI81M2T2lPxw/WRICjB9nipqOY
 /mNiq9qzrwecWF9GFQHiv4A3bUsOTjq+xAb0ru0B3di6f3aTFjDnJYbh/KHY/D0VwAJa
 Un9xUQUDPMD5csJcEpsLn1NPb56EfeJnQQXeLR6nUNLU5gclDxW4WO+qLh6r0BJC/X+D
 Ba0smDCf5Mb8NMBEgbWonsBZymFNfe9mQVQyx+jVJ0mpSOiDpVr22VV/EtlsenghLGqk
 C7+GpwD2R65qmupI3Kvr5IWaMV+/CfbURhl5bcv98csWlBhdeYcQMC6iny59hW3TCbnt
 rZAQ==
X-Gm-Message-State: AOJu0YynbHyKQ/bZ9D/Ryx985e+EetXulwx9l6d8NsQO0L+G2Ulh2/CY
 /AzBFH4fZJhTBFUN379hQReYg1MxXwfUYSciqF2RXWof5xj5RQmDwCEukMw4ET8rZk2QuZd2A8O
 WrtbURcBeUYFT2od24gGeCjbdGF0TozVYVcqFUCFIRjlBCAH/LNsaaY8=
X-Gm-Gg: AZuq6aKN3vA5Jo2URxa0b5+EcVhRkHQda2ZGg3Elji/NjbRbwe6us6SuM/1A8RevcLi
 KZVRzkLYenworTUn+r9PJz6RA4krBNBYLN0wqctgpGO57j8lW/qoSSH8qHBOTVp32vaFpxV9YXe
 IK/4N5hEIT+VgkbflgS/VVid3OcrvYtb56ohLkrFfUywtrvlAVYTekIlzlSHxdeZCG7s0jUd0zt
 r7wpv89Xl66ea70Qw+mQU8/jNz4boX3CH1idQ4BlTSnUUqsUQmYjmJDWYdfHrcz7xmoRw==
X-Received: by 2002:a05:690c:e584:b0:794:184a:bc68 with SMTP id
 00721157ae682-7947ab562e7mr16195487b3.23.1769547100872; Tue, 27 Jan 2026
 12:51:40 -0800 (PST)
MIME-Version: 1.0
References: <20260127154813.591744-1-peter.maydell@linaro.org>
 <20260127154813.591744-2-peter.maydell@linaro.org>
In-Reply-To: <20260127154813.591744-2-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Jan 2026 20:51:29 +0000
X-Gm-Features: AZwV_QhtdwLkO2ezduCKgEdrwZIPTFkpMIvWyDiwCdmtiryQCR7yh8XUqORLeKQ
Message-ID: <CAFEAcA8kK=br3h+49ruFhpx3aO29ErB8jsEabNJU--vmKj4j6A@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] target/arm: Make smcr_write() handle
 SME-without-SVE
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, 
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1131.google.com
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

On Tue, 27 Jan 2026 at 15:48, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Currently smcr_write() implicitly assumes that SME implies SVE,
> because it will call sve_vqm1_sve_for_el() when SMCR.SM is 0, and
> sve_vqm1_sve_for_el() will assert in that situation.
>
> This is the only place where we call that function without
> it being guarded by a check on whether SVE is implemented.
> Adjust smcr_write() so that it also avoids asking for the
> SVE vector length when SVE is not implemented.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> I did think about making sve_vqm1_sve_for_el() return some
> value rather than asserting, but (a) what would be the right
> value? and (b) this was the only place that needed fixing.
> ---
>  target/arm/helper.c | 19 +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index dce648b482..a3dd84a2d6 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -4936,12 +4936,12 @@ static void smcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
>                         uint64_t value)
>  {
>      int cur_el = arm_current_el(env);
> -    int old_len = sve_vqm1_for_el(env, cur_el);
> +    ARMCPU *cpu = env_archcpu(env);
> +    int old_len = cpu_isar_feature(aa64_sve, cpu) ? sve_vqm1_for_el(env, cur_el) : 0;
>      uint64_t valid_mask = R_SMCR_LEN_MASK | R_SMCR_FA64_MASK;
> -    int new_len;
>
>      QEMU_BUILD_BUG_ON(ARM_MAX_VQ > R_SMCR_LEN_MASK + 1);
> -    if (cpu_isar_feature(aa64_sme2, env_archcpu(env))) {
> +    if (cpu_isar_feature(aa64_sme2, cpu)) {
>          valid_mask |= R_SMCR_EZT0_MASK;
>      }
>      value &= valid_mask;
> @@ -4953,10 +4953,17 @@ static void smcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
>       * current values for simplicity.  But for QEMU internals, we must still
>       * apply the narrower SVL to the Zregs and Pregs -- see the comment
>       * above aarch64_sve_narrow_vq.
> +     *
> +     * If the CPU has only SME and not SVE, then turning streaming mode
> +     * on and off can't ever change the SVL; we must avoid calling
> +     * sve_vqm1_for_el() to ask for the SVE vector length when SM is 0
> +     * because it will assert.
>       */
> -    new_len = sve_vqm1_for_el(env, cur_el);
> -    if (new_len < old_len) {
> -        aarch64_sve_narrow_vq(env, new_len + 1);
> +    if (cpu_isar_feature(aa64_sve, cpu)) {
> +        int new_len = sve_vqm1_for_el(env, cur_el);
> +        if (new_len < old_len) {
> +            aarch64_sve_narrow_vq(env, new_len + 1);
> +        }
>      }

This isn't right -- I forgot that SMCR also has the SME vector
length, so old_len / new_len can be different here and we need
to call narrow_vq for that case.

Also aarch64_sve_narrow_vq() does this:

    assert(vq <= env_archcpu(env)->sve_max_vq);

and I think that should be asserting that the new vq is <=
MAX(sve_max_vq, sme_max_vq).

-- PMM

