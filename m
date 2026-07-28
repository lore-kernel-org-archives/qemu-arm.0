Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFB44C54F54
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Jul 2026 16:38:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wokoL-0000Ht-3a; Tue, 28 Jul 2026 12:37:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wokoI-0000Gw-GD
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 12:37:42 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wokoH-0004fP-1K
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 12:37:42 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-81f36179d72so1096177b3.2
 for <qemu-arm@nongnu.org>; Tue, 28 Jul 2026 09:37:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785256660; cv=none;
 d=google.com; s=arc-20260327;
 b=VL4UuqNK9Z7BroreeiSwmy7HB1RWCe2Mi8faWhMH3Oah0F/Gp2ChatQ+l6yJ+hAZbg
 IjMFUdC4xrI87eyAVnCJd9oS5P1H2sVDWeXocUuaZLMV19008ksTTTy6SZwAP1ha0eK8
 97O+S3hq1ag7DYo5PvOO3pEpr9JDcmtA85+qeXcPQ1nQNrwdVfWZyJi98pvyEQFQrMRN
 0uQyE2lIzPTsu8AIbZWXNbNR+/zyN6LSLPmgsPyPc7Nqq2FULMnotQG+JqxdVXnvp1qF
 kKJB22mb4eMiuxk9GfOOdlL4PtJNZG4Im4Sna+gXdpzO6wpsejWVCQSMkR9nqIe9nvu9
 AVNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=HjVbGqXGHao/ljNfW8VTiFOvgtcWBnLzj9V9m6yRolE=;
 fh=kPKijPaEMft+XkgV+JV6JMuvqSUXNyCzTv6fIk4FZjI=;
 b=chOKV1gKHNYR6JrNis2r/t+tGU9PKhaw8LZR+7eLXtK42U0kS9jZ6QI79GbolILvaJ
 3KAOOCN/vhKhbenTUYMiIoCZXXTIJpXVE5IL+C5j2a1KBF4X40rP9Q9duILNHCD08LLs
 2Pv6YSXAPH6WvtU8zm+qkkjFYgE3AoW4+4e8fKfqHQRMAcQRb0xZjpDa7wAuF8UbkjSc
 ioX3RMv4KlsTCFbcp2tG9TR4T6ChOFbutfofTS9HJsd3huXYyZ1itsIVfKrVtlMNzrRQ
 qLm1K7UtlN2Ouvap+yhDzreMnk5PBqaCh1A/ASwRS/lkCDbL+XzGifHYjVnDlb9nM2nF
 6m7Q==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785256660; x=1785861460; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=HjVbGqXGHao/ljNfW8VTiFOvgtcWBnLzj9V9m6yRolE=;
 b=HkM5njLMw+Czu1DcaxGlyy9ENDIJUi7hT5np6cZSygQTUkw9Whyp0N84sHxBk7/MKq
 vVXPOW0jSZR2fGG4N55DMmRPQhHgYuq8gvcrgm+7cBkxdLLCqUJ/QZGffRr7fNSH8mMS
 Q2x0ZlXV7GkNBA91imF2yW+UAlpvIRxN7XZMUseGXecNrTarl3cnoclXkZ/lr8nuOI6c
 SP+BiuuuOJLLZ9i/fxFHejG50IiQGXis9iPlNpyr5Fx2K23ct5xGQQvIc7B/9ce4Ic6R
 K1ex4Y1jT2xj+GPTJjH+FbusA86I6XvM/SP8L1NSZt3PCjYP6iqixspegRlcfSK3LEsr
 8R3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785256660; x=1785861460;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=HjVbGqXGHao/ljNfW8VTiFOvgtcWBnLzj9V9m6yRolE=;
 b=P1ADebA9BXt4MXHbjeAAGXA5ofUnIZvW6BakBMXBACLMIYEZNOs7MjmLduGCehihqa
 Yu/uwor+oHCjJRKWjItpyf10smte5osQgwMYZkNVHc1R3mVacTMGNh3sOuAueZjKT7G/
 jzbaly4ttGdJPppV+wx2vUtZL3VfmbCiZf45oMxRiAVkcypyzho73j/MZVxFWav5Hjix
 z18gw5CJSs7LrgK2IaQMLcuU4rmKU4td+KRoDiw8qGyhpQwZt8IgRF/WwwtG6Vwmyw5b
 NLGV8VL3bR1ZlFNJGKe0f5d6lYYKjJlP7twUawmMYcF3Elc++amhUTiWejY1aKqwwp+5
 nmvg==
X-Forwarded-Encrypted: i=1;
 AHgh+RpEBASGdZWTYMdiViVhl6fU/BrcwOWJ9ZagnYObKyyXWox2SgdMvKWa2GzTMphsCQulzIryfZavHA==@nongnu.org
X-Gm-Message-State: AOJu0YwHxyAEipZAjWQRHkS9pwp+omNEH08V2q0L4odde4IpGkNyEuDX
 AqalYamw12M3dBbHQcro2qJp+d45BB418maN4JAko4Z97sHTXUVG5cT0U5wfQ8xggfoj+84XDAX
 AEiOoewb9SNrRRxujT0xK3UdJc+QN6fe8gOSGI0NS9A==
X-Gm-Gg: AR+sD10qEAov+ZMihmAOYKnY4bx+GUvyxjHhNY647uvSljswe5Sgcf3wNnKdzQpgSyb
 4+X/bc2l0IU2KlRfcHOz0/yHhbGaTS5dX01ngSIr2jrv3nj7YTkBtxZAWcqU19c4KpDe1CrJ9I3
 E2O21vKhDWRj2qBIWxMhUYxyG7S0w+N+vnHyGV3FbMZfaA42kpjFM4/Oe2UIi/xT9A24Wc15LBY
 RJHtB49q0EtPRbc03RRCk6z9GNxYkL8PlccYYZn2Hg9mmnHd11vR4pVt7L6+XJ27LflhxH0zB1R
 GNujMgAlu67+2rW9KcBRM5enSmKkWTCKACyfjiSSQ7RYHA==
X-Received: by 2002:a05:690c:6b88:b0:81f:69e:1c70 with SMTP id
 00721157ae682-81f992042b8mr14821037b3.38.1785256659584; Tue, 28 Jul 2026
 09:37:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260721184656.530230-1-richard.henderson@linaro.org>
 <20260721184656.530230-20-richard.henderson@linaro.org>
In-Reply-To: <20260721184656.530230-20-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Jul 2026 17:37:28 +0100
X-Gm-Features: AUfX_mypG0BHWhwRLCWmj-v9L__GS1Lpd07uo9fqWHxjdBrJMKKE_aPWFXF2qLY
Message-ID: <CAFEAcA8SinMnnYyWxzbNsE-B9tB3TQ8KiXQem1KZ9Vt9sH5EEQ@mail.gmail.com>
Subject: Re: [PATCH 19/20] target/arm: Implement PMULL, PMLAL
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
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

On Tue, 21 Jul 2026 at 19:49, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---


> +void HELPER(sve_pmull_q)(void *vd, void *vn, void *vm, uint32_t desc)
> +{
> +    intptr_t opr_sz = simd_oprsz(desc);
> +    uint64_t *n = vn, *m = vm;
> +    Int128 *d0 = vd;
> +    Int128 *d1 = vd + sizeof(ARMVectorReg);
> +
> +    for (intptr_t i = 0; i < opr_sz / 16; ++i) {
> +        Int128 rl = clmul_64(n[2 * i + 0], m[2 * i + 0]);
> +        Int128 rh = clmul_64(n[2 * i + 1], m[2 * i + 1]);
> +        d0[i] = rl;
> +        d1[i] = rh;

Doesn't this put the two 64-bit halves of the results in the
wrong order on big-endian hosts? Compare how we handle
writing back the Int128 result in sve2_adcl_d.

> +    }
> +}
> +
> +void HELPER(sve_pmlal_q)(void *vd, void *vn, void *vm, uint32_t desc)
> +{
> +    intptr_t opr_sz = simd_oprsz(desc);
> +    uint64_t *n = vn, *m = vm;
> +    Int128 *d0 = vd;
> +    Int128 *d1 = vd + sizeof(ARMVectorReg);
> +
> +    for (intptr_t i = 0; i < opr_sz / 16; ++i) {
> +        Int128 rl = clmul_64(n[2 * i + 0], m[2 * i + 0]);
> +        Int128 rh = clmul_64(n[2 * i + 1], m[2 * i + 1]);
> +        d0[i] = int128_xor(d0[i], rl);
> +        d1[i] = int128_xor(d1[i], rh);
> +    }
> +}

Similarly here.

(The other places where we use Int128 in helpers -- ZIP, UZP,
TRN, and some moves -- don't need endianness handling as they
are just copying 128 bits of data from one vector to another
without interpreting it.)

thanks
-- PMM

