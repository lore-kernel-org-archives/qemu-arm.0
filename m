Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7444EC54F4C
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Jul 2026 14:35:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1woiuN-0006a6-Gw; Tue, 28 Jul 2026 10:35:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1woiuD-0006P2-S8
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 10:35:47 -0400
Received: from mail-yx1-xb12b.google.com ([2607:f8b0:4864:20::b12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1woiu0-0000EW-Ai
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 10:35:35 -0400
Received: by mail-yx1-xb12b.google.com with SMTP id
 956f58d0204a3-6685483aad2so4910821d50.0
 for <qemu-arm@nongnu.org>; Tue, 28 Jul 2026 07:35:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785249323; cv=none;
 d=google.com; s=arc-20260327;
 b=rTLjoS2f8xMiHh+NXh2W09Gg65gNyNIUORTJZWvCst+2IGv/DQ+0BAIgFR8yOnj4/j
 TiQv6OcMWdSqpPC3a2I0kJ4HrU4N9UG7zeNCxcJEF+cH3wDGFbZQPf9GgXCWeBqFotab
 3jj4CFgW7jd85tniXNOusWME6DpITfrfQ8+RLpugCb0+CMBJBfOAYZ+QCWj2GdnyJ2Zm
 xGlsXUZ4zOKw27y53dBG5yRPK8T3XZ0a+R+8zoYWOyU2dgzagGjkBjEVPxNRiRj5QmOA
 PeKam/qAFhccBfHFQyyFxjwr9nTu4MCwshlqx+g5BuXRdMQ0pVmnny+9/2D7Sy3m2GtN
 D1OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=8zdjuGvJTGsQwq2F1n0Ey0GkjCD1z1YqRCka3lBjlr0=;
 fh=G4UmKx2iFGLM/Gbx2XT8y5yP4uY04OlANrdR6h+Nobs=;
 b=Z8ocmHCoGbiTY/WtaoZL01XBSrnY3hjeTV5pIjhoYzHFPDAH8nTsrmVj9kt/EAd3/6
 fTFoeaDOZYyvPuZ5YLZz5csXwL1cbpivrPWTo5hHNgoyuGc++DyreZJknZW0JJuKwJUf
 DDfGr1HmXB7BJ7Hqd7f+TfP9Vizu6S1xcdMALqVcrCA2G1rSS4kQsjAZXLgCJuLi5hoP
 RXJOGDp5mykSkn6oluyghMUJ+p7jMjHyY6Jj9v8YNWKIlH3A0QVQJzGQ3v3Yqe+kx1Zj
 3MAqeAn/hbGslWEsfopMOPl0+fftCUNPMEhWI9W+usE9tazd5nCCEMm7iS+h52AOzoy+
 3BcA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785249323; x=1785854123; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=8zdjuGvJTGsQwq2F1n0Ey0GkjCD1z1YqRCka3lBjlr0=;
 b=qeNecfh4exff0mNMbQ46IDLJOXGzEmYHt8/tBODXZE9yOzVcX9v7D8k+sNeqZw69Hf
 3aU04O8E1BjoYCcQdsdeBpFw7jHizG2vxXiy1MqHB2GRpwb3J8B/3bWOoE7ylSdCiohx
 Tvu8iYz5vfGhLcdp2FhHnh8DSVi7Afmiwy3302xdNb9+YQxMgyeiH6bfOOsCq6327Dm8
 IGxdJYiWZH7Ic+dHpHV6suWUaicg5sXKo1jSaijaR4ko3XDGw1QBveQPr4K30OopTvcf
 YE3sue+pnVtoNyvtWIdwc8jREtRX6kwWWzTEpv5abnfnimwVBlG+sBt1Bf+ygXjurrm2
 BI5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785249323; x=1785854123;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=8zdjuGvJTGsQwq2F1n0Ey0GkjCD1z1YqRCka3lBjlr0=;
 b=KO1Bf5NGfm4EFB7pExu7FSVWRsoEc8Xvv8c3hYijYPdNSVk5fRtcKoEugT41j7h+un
 60FsT+I7IfYXMNrUAF3l4W/fVfo+lutZsEgekIhBr+w66PU3O7LbPVwtgvAH0XnkSJrS
 n0bPZHjz9nSnadMjWuLzKZ0Z3pOWLCjNWPZZcCu7UDc/MUXsRGjpScASmqf3B5ayiuHt
 jWWBTDqn/SQuR5GQvr6HYMHHHYXud9cAaGNFPdK7ZUwVz9ee/GjrdNuBURMAwhiPQX+c
 bpLKBxLVG/z3hSXD2mhb5hUbaWdrhu0FgAOjOovKCXCza6+LP79xgxHwB4ow6z50Q8/8
 404Q==
X-Forwarded-Encrypted: i=1;
 AHgh+RpK0EWYB/FcGnNxuu0y/1L/uRjOscfcsawFLjY5qk0sj9y1ELb5Yekc3r/eqt1YCebyAn0HMcE2jg==@nongnu.org
X-Gm-Message-State: AOJu0YxcovS5gdFG4jGjo+xjRLXlUqI2WQGQVTLYCoOi4PmPKDLHHIsg
 OytHty721BjQ8zl+iVgQYORlmWdDP2SF5YYjnNw90EX+vXvdRVnrzeY94Yb0P10AUY3pn3yb4iB
 2oPFnh1k4a8kGhPHB4Vct7mB7dIK5TmEF5tfClYBVow==
X-Gm-Gg: AR+sD10+w0pKmsXP4/WnqFk07yHPmxSz4uyDlFHdCzXPRcjuNzvH7JXAtEo7iqiqu21
 eHag7lCduq7v7neTb1K1ASKCJ87iaPmn3dfDgfLMZpaAxhFLNGUdhO2tO1EDONB/FMtYzpsvw06
 ywpBJebTGkAtA6YTaGIVp3DqMehyrYu920Lz5SYtQ5ra0C3YCwUOqZbG4fPA0B7rGN/gU3JPQ+q
 xzQtBrnNlrdKC6QQRxORaGPljBSgSrCv7jNTDu73AjvIFbhO5IacKpmgqtunok+n3lf5brr0h2P
 98sc0cztxWueOM/5slpoGaf7Un89ZBfzWaSmarUFmSaVKA==
X-Received: by 2002:a05:690e:25e6:b0:667:8b91:2419 with SMTP id
 956f58d0204a3-6690587b56cmr845448d50.96.1785249323330; Tue, 28 Jul 2026
 07:35:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260717232306.378988-1-richard.henderson@linaro.org>
 <20260717232306.378988-11-richard.henderson@linaro.org>
In-Reply-To: <20260717232306.378988-11-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Jul 2026 15:35:11 +0100
X-Gm-Features: AUfX_mybFjM-ZTAbW-M7iEp3YfR85oNH22ooPlplyuhKoeDN2wuNIhtfWjP20s4
Message-ID: <CAFEAcA--TV8fXLHFBUbUEi0wr+4Vu+wqYED2RevMG3bUyEpMnA@mail.gmail.com>
Subject: Re: [PATCH 09/17] target/arm: Drop TLB_MMIO check in
 allocation_tag_mem_internal
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12b.google.com
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

On Sat, 18 Jul 2026 at 00:25, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> There is a memory_region_is_ram check later that
> actually does that this was trying to do.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/mte_helper.c | 11 -----------
>  1 file changed, 11 deletions(-)
>
> diff --git a/target/arm/tcg/mte_helper.c b/target/arm/tcg/mte_helper.c
> index 997248bd57..6177dea842 100644
> --- a/target/arm/tcg/mte_helper.c
> +++ b/target/arm/tcg/mte_helper.c
> @@ -181,17 +181,6 @@ allocation_tag_mem_internal(CPUARMState *env, int ptr_mmu_idx,
>          goto fini;
>      }
>
> -    /*
> -     * If not backed by host ram, there is no tag storage: access unchecked.
> -     * This is probably a guest os bug though, so log it.
> -     */
> -    if (unlikely(ret.flags & TLB_MMIO)) {
> -        qemu_log_mask(LOG_GUEST_ERROR,
> -                      "Page @ 0x%" PRIx64 " indicates Tagged Normal memory "
> -                      "but is not backed by host ram\n", ptr);
> -        goto fini;
> -    }

The memory_region_is_ram() check is on the MR we got back
from looking up the tag addr in the tag address space
(which should always be RAM unless the board code messed
something up). That's not the same as this check, which is
looking at how the physical address is backed.

Does RAM being monitored by a plugin appear as the TLB_MMIO
flag here, or is that some other flag? If it does appear
as TLB_MMIO, that would be a reason not to make this check
here. But in that case you need to adjust the logging
on the !memory_region_is_ram() check below, because we
will now wind up there for both the "board code error"
case (address is backed by host RAM but there's no tag RAM
for it) and the "guest error" cases (guest configured some
MMIO-backed range as Tagged in the page tables).

thanks
-- PMM

