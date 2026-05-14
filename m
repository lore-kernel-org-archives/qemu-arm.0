Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B67ECCD4F39
	for <qemu-arm@archiver.kernel.org>; Thu, 14 May 2026 12:04:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wNUmw-00075z-J8; Thu, 14 May 2026 08:03:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wNUmg-0006zr-Ip
 for qemu-arm@nongnu.org; Thu, 14 May 2026 08:03:26 -0400
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wNUmb-0001Ud-3j
 for qemu-arm@nongnu.org; Thu, 14 May 2026 08:03:18 -0400
Received: by mail-yx1-xb131.google.com with SMTP id
 956f58d0204a3-651c366f7efso9154453d50.1
 for <qemu-arm@nongnu.org>; Thu, 14 May 2026 05:03:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778760196; cv=none;
 d=google.com; s=arc-20240605;
 b=g8JYxKqPoavRvCM74cpUKOW2Yyt8qe3Qu7frvsqwC96GHPrsHokQhip6IaL8hdyH8R
 gESq9m+MyrwYxgrNQPRwgWoyeBzUob266HIzScEQSWgN96gfUG6iAcWZx5MPmeUsp0Kd
 9OoD3iogeOVLubzcFbkGuwm2MWO0HvNEx4E6qFC5ZfNCGkivjXjCDZVYfl/P3U48S488
 SwW3LYBsix6T0pgLmMr53KXUv2qms8tu/ucmzYzxwLHxW/JrfFppr/8ItS9wKGBgJzq0
 mWOh/eW+oWItKw8uMoPQ7XlYoEbVoUML4Vr/4I/3JNwKfXOm+0CfXlwDJWJHZYNaDZRR
 DMLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=RtH1GVy43aR/pNASorrIVQckpf8j5btmuAqwGqnuXaQ=;
 fh=h6/6Soe5R0gAI4DD/N62P0lqPQRAnR7YwRUv5IH1j7Q=;
 b=YM6jgLNrvOWZsfsMUCNztywT7eqmT4CgGtWfXVBhCm1b0coDgtY1hRVAaMcXsTMqfl
 YmM73kGpqRIDUfNgNBXdS+SGjup99IwUJJYL2vRRTUloHQ02zpeT7gnEtiSNvJl4YxtG
 6i/0DrF+kgUsCI6BT58bF0Gl3PkwHp5kq/ax2uEEdcG1BsB2+KbeXhgZRG54SkscNtYR
 arwb6T7QODJOAnSSGzwfa3++r18oYJslXkk+V7z1nmWAWIDS8wYqJfFh569uxnCYqElO
 8WvNsjPnFPbu/T1pLkfrQ1FtFNxgE65OzC9NtO+sOmQTgXkxC8/d8DMc1WSJog43Cr2i
 9SNQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778760196; x=1779364996; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RtH1GVy43aR/pNASorrIVQckpf8j5btmuAqwGqnuXaQ=;
 b=KVBdRWavc+z+hO6gH4OvBvEDh9x/JHVzPr6ZJGCuufRcavNimIDWoM5UhMja2X6DJS
 p9WLEAYjE8vhhtbi0fz18jr29brZNyLIzpJe5e2TTiLMh/CxP5Ep9FyXSZ4N59dbFs8x
 TFBpKdntoSsgBkBrRJtc6gyj+0F2VLuLDBb7OAjh+6bHWvW/Xx0LXiBJ+TOGcQI9J9i5
 vRf9GwVKtuVnp0ZoIYYYXijUknLQR/oiaW07GRBTt3Fz6bGVuTDi6rEWMhloim26SPRf
 KQIzvyNadqD07EdYTi+/lASd0dMBjHQmSb4JcRd0bQ30Hs/Uu6Pl4C9p8lQft9tdvl6T
 RfWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778760196; x=1779364996;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RtH1GVy43aR/pNASorrIVQckpf8j5btmuAqwGqnuXaQ=;
 b=h7Q/aqrs1ReaKg307kerqhbxT1Ir1b/T/igBK4b0ZCPpIJNO4OQxkySlWFREoXZYO7
 5qSzVBdxUTzOSjcKw/JF/YTPJR+rKE57zJv5ottQU5ow0q0wfWmEsFIzfP7wj5lPhVUY
 DHcvjpHW88Mh+aPa9OWBqi+HRD3Vm4pUYWY/yaddE452QVAadnXTsi2eLkk7gLr4Jp6o
 ql5yw1RsOMsJ7UupcSlU6Ujg50Rt68ZjXru+OT126AN5XXGgxmfMUGIAnNo2npRvHkx3
 bkswHsuUAMBHg5S9y8qm6bzQuFIP8SfUFBH3wnWrTjcNEq6hkJIjviS2uSjCcBi3pvnV
 nU2w==
X-Forwarded-Encrypted: i=1;
 AFNElJ/hgXKznd24io2zYlLFp1frEGnxbk7ZM4yCE52PqS9nw8nnFFsq+QBdsIP4DyRDeJjtrNx1pAfsDQ==@nongnu.org
X-Gm-Message-State: AOJu0YyFhjNTrTHHBmcYST78774USnc9GpYp7GRo465W/xNtRLe76Cue
 ceY5TH1sBOQFFp1AQ1743j1Xyye+XBJLt8m8zOKwUZzOerBEH/tWSW/cgnSFHkbmDQaxJlLejVW
 OBTFHZegFGC0ArwuQFh/oypclOpeipAcyVgunE8UNQQ==
X-Gm-Gg: Acq92OEzkov2LKty5sahql6jIG75dZ8Y5uJmEJYTBViwosE9MfoI+nnjBKabQul7tzf
 rdWQCls4Ef7/XNLGxQxP1ZhDPFtX8DCdbEWWMdnPoI5Yyw1AdQfbuQ6U6waepAGXpl9w+CgA+qs
 5/HD/X2RgDsq/OGiN+YQ3n69SbQAZIbjS3+vgzkxOT4ij5SSxop1KaNO87FSQOfyTE4DRna/YNi
 MZwB5ZqU2vgBiiOgHLjBkzk0s1Aj9dkyqW1plY90aQwUH8r5w63NgbDfIoKv+Pxn5xalTDc7KNo
 vBiODjEm1ORvI6UwAHDkMSWy9Q852FoDCZInHRuL1PADGY5JX5oRH09OFxDJZoKJ9yo=
X-Received: by 2002:a53:b7c7:0:b0:653:8ef:935 with SMTP id
 956f58d0204a3-65df63797ffmr5537135d50.54.1778760195503; 
 Thu, 14 May 2026 05:03:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260507234413.643512-1-richard.henderson@linaro.org>
 <20260507234413.643512-37-richard.henderson@linaro.org>
In-Reply-To: <20260507234413.643512-37-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 May 2026 13:03:04 +0100
X-Gm-Features: AVHnY4La00HUOeJrVDzSW57f5rcAy-KA9jUPIhnXBN9dc0OlK1F_4jkM00OdCUs
Message-ID: <CAFEAcA8UpR-Q9oypm8v3CgwDK80+kXFcMkH9JCmUdc4=14HPCA@mail.gmail.com>
Subject: Re: [PATCH v4 36/60] target/arm: Implement LUTI2, LUTI4 for AdvSIMD
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb131.google.com
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

On Fri, 8 May 2026 at 00:49, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/helper-defs.h   |  5 ++++
>  target/arm/tcg/translate-a64.c | 38 +++++++++++++++++++++++++
>  target/arm/tcg/vec_helper.c    | 52 ++++++++++++++++++++++++++++++++++
>  target/arm/tcg/a64.decode      |  6 ++++
>  4 files changed, 101 insertions(+)

> diff --git a/target/arm/tcg/vec_helper.c b/target/arm/tcg/vec_helper.c
> index 3231bb2100..f0dc11bc8a 100644
> --- a/target/arm/tcg/vec_helper.c
> +++ b/target/arm/tcg/vec_helper.c
> @@ -3345,3 +3345,55 @@ DO_SME2_LUT(4,4,h, 2)
>  DO_SME2_LUT(4,4,s, 4)
>
>  #undef DO_SME2_LUT
> +
> +void HELPER(gvec_luti2_b)(void *vd, void *vn, void *vm, uint32_t desc)
> +{
> +    unsigned part = simd_data(desc);
> +    unsigned vl = simd_oprsz(desc);
> +    unsigned elements = vl / 8;

Isn't simd_oprsz() the size in bytes? The pseudocode for
these ASIMD insns calculates the element count using sizes
in bytes, with "elements = 128 / esize" (esize being 8 or 16),
but I think for us we want "vl" for the _b insns and "vl / 2"
for the "_h" ones.

> +    unsigned ibase = elements * part;
> +    ARMVectorReg scratch;
> +
> +    do_lut_b(&scratch, vm, vn, elements, ibase, 0, 2, 8, 1);
> +    memcpy(vd, &scratch, vl);
> +    clear_tail(vd, vl, simd_maxsz(desc));

> +void HELPER(gvec_luti4_h)(void *vd, void *vn, void *vm, uint32_t desc)
> +{
> +    unsigned part = simd_data(desc);
> +    unsigned vl = simd_oprsz(desc);
> +    unsigned elements = vl / 16;
> +    unsigned ibase = elements * part;
> +    ARMVectorReg scratch;
> +
> +    do_lut_h(&scratch, vm, vn, elements, ibase, 0, 2, 16, 1);

LUTI4 has 4-bit indexes, so we should be passing "4" as the
isize to do_lut_h(), not "2".

> +    memcpy(vd, &scratch, vl);
> +    clear_tail(vd, vl, simd_maxsz(desc));
> +}

thanks
-- PMM

