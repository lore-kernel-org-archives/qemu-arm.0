Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26BECCD98DA
	for <qemu-arm@archiver.kernel.org>; Tue, 16 Jun 2026 12:27:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wZSsT-0007jX-6s; Tue, 16 Jun 2026 08:26:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wZSsR-0007j9-Pi
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 08:26:47 -0400
Received: from mail-yx1-xb12d.google.com ([2607:f8b0:4864:20::b12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wZSsQ-0004Ey-6p
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 08:26:47 -0400
Received: by mail-yx1-xb12d.google.com with SMTP id
 956f58d0204a3-660e9ea26b9so4688141d50.3
 for <qemu-arm@nongnu.org>; Tue, 16 Jun 2026 05:26:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781612805; cv=none;
 d=google.com; s=arc-20240605;
 b=fHggPFU56nI5W783dKu5GRkTosq/2ySbRdi7VrrjuCtAMTT5U2+nS0A7nWyh4yicWj
 MhB6sn04WJm7yZsS+qh/7QO3r0fSyT5M8TNc+55HH+y7O5bQeUIbXMu7V3LhtGul7FPw
 rbtmF6uKBTTphYj0p7UqCxUehEliWGcR+E2UkBzI3b68whe8KcjiIeveZwysv/Bb2iJh
 Mzb+1p2SfPuSisNQ73WAR3VLuNewZ+yj1w7xPhsqXuiCWn2Shr0MRSpJ/aeCLPruOamL
 EFbnJUyNG0u1HC4dEmJd2yk9c9JIcn+qCjgSBToZjCkME+v6Jsmj4HNsYuid5ypDV6YT
 GxuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=XW1YIPWU0bgHm2lScKMLxzRhGW+1ykgETiJsM1WB5h8=;
 fh=5U9xZqY+pEZMbAYurjZlnefGx3csiXf4Dqe8Z0maQI4=;
 b=kM7KcsAZLatokiKYix+RgnseRqlhYCNyoekIEQPQZ3F4wfgvtsa7H3VrK9N2WYctLc
 jVYFL/eTesA/hf6vdYTW0vgF3vDNZPe0bsoHfpYnDIJNU7M+Jv9Io0Ux5GPPZnUtRMUd
 Q1mINM6gKjBBLXG0JHuAF920rvGeXLdQcLbuoozvrNWwkLwRmQNd090vjR4shHIDLZAL
 7PYu9OQYG9XtxS5NIGsZeLJ+sNMvtr+2eXUEkHI+E6q88RRX7z/VG4JeqITTaGs1oO0e
 Cj0/OBqTMe0lebC3HODi9A55Uz29q5XkgIlkpB8xlXuwJa3UjKoM/96rVPt6BkBtSDG4
 eOtw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781612805; x=1782217605; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XW1YIPWU0bgHm2lScKMLxzRhGW+1ykgETiJsM1WB5h8=;
 b=NDWl+qYhsN/YYGnS2EWX9bHwG2ipVhaTFXceo9DvSak3sPm/JnfYKZnPKVHsH2J8Xk
 f0kSJlsaioQeToWaw31S9OT/acQz2v/Wx3QuR6rILWbZX70fystqJSqJy4OWQSXDqMq4
 YH2Zaos7MIYseH/SHDyZJEtaX59X/zQulUCrcIsfu4Ohd1BmvMvOlGjQZz1JrHQkMOM4
 lAZhyqW1TlcV/mIlpy20mYmDzrkqUkjd8Fv82PuD6h7+jlkh8/CcC5LgZgGA5SRdHJl6
 Gn0cjILiHEZzM7fKMQYLzXwFK13MNThKg13XVsb9I03bSqsQMWXi60YToqiFk9sNH/2E
 6upQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781612805; x=1782217605;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XW1YIPWU0bgHm2lScKMLxzRhGW+1ykgETiJsM1WB5h8=;
 b=eJsaHmB1UD1OD08SYEPPiiGy2M5e1T9D0RKO2SlGw/eocoB+VDMVvf/yPf6vaGIdVk
 Ddh2GzYLcR9HuPAVo90shJ8VbAO8scnUHZBm18tL1nQ4vzwLfqNIlUiWb+/zcgDqTwdq
 EZURqAaOo3Hz4vfL1CfLl2BkYE6drPhNrJAXuxkAeoK3GTM8/tcnnNaMnfEYecC2xoCy
 LkktvHTLKTlFfGNrr9Ix+IuEgO2DUmB0YvU3xz2XFXFvOCGdxGBaD4p/n1zntx9BvM+3
 S4W1s9LM6+A3p6yqpXz1D4wO90J1sozg2rPDxezzfxxrLwjd2hCBORDxut+HspcbMA7r
 ej8A==
X-Forwarded-Encrypted: i=1;
 AFNElJ8oQsXAdMQl87EFj1ay6FUHlESCKhkFzOX7Bojyu5WEPJ+irwOwbooCfGVHVow3qxMlCYk+TAVlkw==@nongnu.org
X-Gm-Message-State: AOJu0YwTJPe6Cm55PFu+baeJD91H6DI3E7KnR2vU0t7Y5ZUYdrbwoetf
 0EjGCpfVxgeOK6QkC2Wfona1+UNKJqQrQfDekr+c7+p17WvuLmCZgywff87LFEx+BpR9HvrlU3G
 l/D/zPgqztDyaP3/H2MkvApSGTNNhk2bB+m0HQkwRXw==
X-Gm-Gg: Acq92OHQDcQzV447dJ7hjjXZ9JGH3J4vOFP+d7E6ya996s497lmOG4e0KD03luja1hM
 /UVWbhgUhW5tEqVU5pk0O4xoInyQjKWtCbB9g2xQxP0UgB+Ovi1QB0Bxe1RsODdJBrGaSQTfY12
 ox4VqGxsyhf85bIPruqnA6Og9NgHNJJqpsUIu3MVJRupKzgYndnHOgezWR0UnTuabFyTBrNojiI
 B8fMJy/RUgSr7u6lUeW17grwtaH1PRisvz9k4MQHsKRba9F9uz0PW6Bcgl62y0rFR9hkxT6ITaS
 3EIUkvRFrsflmV9Cxzx2HT5tG/XPg2AKj1/oV5+13gNy/9lntxzXALD3Xy10RIaigBY=
X-Received: by 2002:a53:c146:0:b0:660:60a9:2b33 with SMTP id
 956f58d0204a3-6628500a341mr10278526d50.53.1781612804531; Tue, 16 Jun 2026
 05:26:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260604234852.573178-1-richard.henderson@linaro.org>
 <20260604234852.573178-7-richard.henderson@linaro.org>
In-Reply-To: <20260604234852.573178-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Jun 2026 13:26:30 +0100
X-Gm-Features: AVVi8Cfhi__nhw-4Yg6hoWK6Xyztxz3YSauEQpS_W1qEU45LloDWZHWNsEGd8c0
Message-ID: <CAFEAcA-snZqV9wT=U8Z_WS8SLuC0Sk9SLd=GNMRTqTKMBuBFDA@mail.gmail.com>
Subject: Re: [PATCH 06/25] target/arm: Implement SVE bitwise unary operations
 (predicated, zeroing)
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12d.google.com
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

On Fri, 5 Jun 2026 at 00:50, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This includes CLS, CLZ, CNT, CNOT, NOT, FABS, FNEG.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/translate-sve.c | 21 ++++++++++++++++++---
>  target/arm/tcg/sve.decode      |  8 ++++++++
>  2 files changed, 26 insertions(+), 3 deletions(-)
>
> diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
> index e090a0383d..2e138f9ac0 100644
> --- a/target/arm/tcg/translate-sve.c
> +++ b/target/arm/tcg/translate-sve.c
> @@ -781,30 +781,41 @@ static gen_helper_gvec_3 * const sve_cls_fns[4] = {
>      gen_helper_sve_cls_s, gen_helper_sve_cls_d,
>  };
>  TRANS_FEAT(CLS_m, aa64_sme_or_sve, gen_gvec_ool_arg_zpz, sve_cls_fns[a->esz], a, 0)
> +TRANS_FEAT(CLS_z, aa64_sme2p2_or_sve2p2, gen_gvec_ool_arg_zpz, sve_cls_fns[a->esz], a, 1)
>
>  static gen_helper_gvec_3 * const sve_clz_fns[4] = {
>      gen_helper_sve_clz_b, gen_helper_sve_clz_h,
>      gen_helper_sve_clz_s, gen_helper_sve_clz_d,
>  };
>  TRANS_FEAT(CLZ_m, aa64_sme_or_sve, gen_gvec_ool_arg_zpz, sve_clz_fns[a->esz], a, 0)
> +TRANS_FEAT(CLZ_z, aa64_sme2p2_or_sve2p2, gen_gvec_ool_arg_zpz, sve_clz_fns[a->esz], a, 1)
>
>  static gen_helper_gvec_3 * const sve_cnt_zpz_fns[4] = {
>      gen_helper_sve_cnt_zpz_b, gen_helper_sve_cnt_zpz_h,
>      gen_helper_sve_cnt_zpz_s, gen_helper_sve_cnt_zpz_d,
>  };
> -TRANS_FEAT(CNT_zpz_m, aa64_sme_or_sve, gen_gvec_ool_arg_zpz, sve_cnt_zpz_fns[a->esz], a, 0)
> +TRANS_FEAT(CNT_zpz_m, aa64_sme_or_sve, gen_gvec_ool_arg_zpz,
> +           sve_cnt_zpz_fns[a->esz], a, 0)
> +TRANS_FEAT(CNT_zpz_z, aa64_sme2p2_or_sve2p2, gen_gvec_ool_arg_zpz,
> +           sve_cnt_zpz_fns[a->esz], a, 1)

With this and the others below, if we want to wrap then we should
wrap the CNT_zpz_m line in the earlier patch where we added it,
not add it unwrapped and then wrap here.

(If there's nothing else in the series that needs a respin,
it's not worth respinning just for this.)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

