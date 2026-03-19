Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C676C1090257
	for <qemu-arm@archiver.kernel.org>; Thu, 19 Mar 2026 17:17:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w3Gzx-0002yb-8T; Thu, 19 Mar 2026 13:17:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w3Gzv-0002y7-4v
 for qemu-arm@nongnu.org; Thu, 19 Mar 2026 13:17:27 -0400
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w3Gzt-0004wU-Hd
 for qemu-arm@nongnu.org; Thu, 19 Mar 2026 13:17:26 -0400
Received: by mail-yx1-xb132.google.com with SMTP id
 956f58d0204a3-64c31ca77b4so1641611d50.2
 for <qemu-arm@nongnu.org>; Thu, 19 Mar 2026 10:17:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773940644; cv=none;
 d=google.com; s=arc-20240605;
 b=JRLdwTTvI7FDEihqxoKVdgCMGpMPmSrOGY6bNVwZPQpOI6dM29gMfdSHJ97yY+QvXv
 MY/MGygfUWzaZA7PD7XHHyZ7zJ5uQ9ga7BUExMr1grrg038ly3gpDzXgCptelX2BqeRf
 Bda/mksC5nqsOp0WCcbLrEuRY9qUCjXKWDsiiII6MP5zObm6PBDvEPO4qr0Sti4SljK/
 3JPYDG43kScDMqZ+FOVBfr7sJ6Wk7yLc4poTqIrFTPOsSGA1Oojh0OuvMmf3Tx4Qh/MO
 PoGn2wifUDp5/GP2kZIovDMi9w7lZLF4Dn+0QH+ALIEVS/fRpqVOISmmzLtVa4FEL4lr
 VL0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=YCfuWH8bT9x/PhAdwRasHtQQEXTD1hekvbgghEbTFKg=;
 fh=y/6p8HSQVKmUOwjHSMO28jU0rx498PPD4OxiJ4HXU5s=;
 b=FfskZA8htFuS1hWpwFV71Dtd2nX3ZFExJL/B+qAQsfVy6Lx9TiU7j6ZSZVREhphTp7
 LTZbLdbsRRZvyB2k10dhSFOldYJZaQuZBp8nfBqthYUp+/Yd2Lshx2p26BWfa3yNGFHZ
 V3QIJ158TQyDQhe2cc7CefvCpaqvzYqUpL0YuvFflwEyBxtGNd6Qg/Aeyf+dqdAuOKgj
 YKGfyhbJEMZKdbw7zP9QYZJXxFT7jvbhYvdQjYq6BZMnNflRb3zSYZPMuR36cIe7EKyR
 9N5f0cvhuj/Z8IEZiYfVCbzqvZrwy5DOSy1KDNXg0byB5Vfmxz7F+UOVL3SbZSp4BCtn
 pGoQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1773940644; x=1774545444; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YCfuWH8bT9x/PhAdwRasHtQQEXTD1hekvbgghEbTFKg=;
 b=yQrIZfmYKVwioBtC3eLSsRSah04DkvFUSnr3LRn/kTr6A3/YE4tUlORCgm6aJ1pzJb
 aH0Y1cvDKa1DsOc0xvX/tt0mkg84VNqXDn8n2LEgNz6w8m7MPgUcrfi8n/qc5WXr62pN
 qK+PCF8YEzBBpPACgmbfX/fWG1jisKnYSSEBg6l0h/1mZCGFGN4RezT9jt6wiLN2zfpi
 DYbds5PRbQEq+LtpZOR+bpfv3AQ+SAQy6jQ+A+Tq9gOXtMi8OCz5XiZ5xd7dzMzs4E3R
 xoX0p9cEpVviOiwlcTFTZFjEONurEpJuMAUBgxoQd2H85//+x9zTKJNUoUXPo4hnqtc+
 n4TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773940644; x=1774545444;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YCfuWH8bT9x/PhAdwRasHtQQEXTD1hekvbgghEbTFKg=;
 b=Vpn/KuFN8IPP8ysXbo81Mr5Nl87AJUXgBDMF4AoTzdJsVdIOECKHAT2SC/96MQiqlv
 sR56PY8RNoc2yuuf9Zd9t+xyswBJ/mLUL6So8+qUSqja2P8OCYhcLC7NXE2XIgAuWkM3
 mYhnBFbdAUMN3IjOPeQtm6UfP/aeW/nAvWwluoofMoF8/kUXZ4qsBiwxzBDJhevaTGzg
 tpDwFjKPbcI2c1cXnunTWCDbimlM9v5hPmDWdyBdmQfN9iz0JBYujxePynL0Te1dmJBm
 n0YTh97S5zs1fUxuC7KPvTUnUtEFnu34dS6QiM0rh7lUnniGLQ6Ttnq77dh+90tr50G4
 lDZw==
X-Gm-Message-State: AOJu0YxDVmGmNsRnNNhcRqTP6M8sCoH1BRy6r8XjNe/844QTuA9U+bBG
 LbC8oaHByG6A53bQP/6jt3AS58TtQBje4695zFPLCQ0/I+5YatpX0bD2GJ3CTuhMKkdUKXGPgy2
 M9iGJAOiH/zn6erYD67M4RXMraE+q39LiBnq8/1/8Og==
X-Gm-Gg: ATEYQzyxKRoyM5ShVOCfJK3YC/ERMmY2e1l8eV570tehbUHMtbSk6kFWFPiLNQuM8R1
 Rdta2HxEe/F9wI+aZY4EaKJX2sSv+wpp99l5Du4XL9Gh7LKhN9qCbTL19oLYpzGidCAAqyTWIc6
 IQ7b2wBM1e7VxgyY/amFaHCiZkuutJH3gD/5MgAVvEhTnl859dQzFP2Xfnvb0yW6OtAN2MMc26g
 5muvIj4Lb+etGI/g8rb4qlKxbwFeozIG1OX39qHTd7S9SJo70UHP2e/fDyqkL8Cn9LA+L/sIQC4
 eiMzMfpSXTdDqGz0rzsmtIfPjRdUVrcbuLp4IdQQOwDYiOz9XakQxWPHRNQSeEsGpVJIwJwsy7N
 y5g==
X-Received: by 2002:a05:690e:d45:b0:64c:9f31:e33 with SMTP id
 956f58d0204a3-64eaa7f38d3mr332062d50.65.1773940643626; Thu, 19 Mar 2026
 10:17:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260317122517.47627-1-zenghui.yu@linux.dev>
In-Reply-To: <20260317122517.47627-1-zenghui.yu@linux.dev>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Mar 2026 17:17:11 +0000
X-Gm-Features: AaiRm53BOTvRKZalQUSrNqMq3FTDwSag3h_vL90K1ryzA8KOQfSwIpXJRDUxlnI
Message-ID: <CAFEAcA9bGVuWXAPA0=EaAWXhSigm_yf5OYfnYoTjaQ8x1qXKYg@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Don't skip access flag fault for AccessType_AT
To: Zenghui Yu <zenghui.yu@linux.dev>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, richard.henderson@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb132.google.com
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

On Tue, 17 Mar 2026 at 12:25, Zenghui Yu <zenghui.yu@linux.dev> wrote:
>
> As per the pseudo code from DDI0487 M.a.a (on J1-16021) AArch64.S1Walk():
>
>   // Check descriptor AF bit
>   elsif (descriptor<10> == '0' && walkparams.ha == '0' &&
>           (!accdesc.acctype IN {AccessType_DC, AccessType_IC} ||
>            boolean IMPLEMENTATION_DEFINED "Generate access flag fault on IC/DC operations")) then
>       fault.statuscode = Fault_AccessFlag;
>
> an access flag fault should be generated for AccessType_AT, if the AF bit
> is 0 and !param.ha.

Did you find this by code inspection, or because it caused
a guest to go wrong?

We should probably

Cc: qemu-stable@nongnu.org

> Fixes: efebeec13d07 ("target/arm: Skip AF and DB updates for AccessType_AT")
> Signed-off-by: Zenghui Yu <zenghui.yu@linux.dev>
> ---
>  target/arm/ptw.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index 8b8dc09e72..572048d560 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -2118,6 +2118,12 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
>      descaddr &= ~(hwaddr)(page_size - 1);
>      descaddr |= (address & (page_size - 1));
>
> +    /* Check descriptor AF bit */
> +    if (!(descriptor & (1 << 10)) && !param.ha) {
> +        fi->type = ARMFault_AccessFlag;
> +        goto do_fault;
> +    }
> +
>      /*
>       * For AccessType_AT, DB is not updated (AArch64.SetDirtyFlag),
>       * and it is IMPLEMENTATION DEFINED whether AF is updated
> @@ -2127,15 +2133,9 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
>          /*
>           * Access flag.
>           * If HA is enabled, prepare to update the descriptor below.
> -         * Otherwise, pass the access fault on to software.
>           */
> -        if (!(descriptor & (1 << 10))) {
> -            if (param.ha) {
> -                new_descriptor |= 1 << 10; /* AF */
> -            } else {
> -                fi->type = ARMFault_AccessFlag;
> -                goto do_fault;
> -            }
> +        if (!(descriptor & (1 << 10)) && param.ha) {
> +            new_descriptor |= 1 << 10; /* AF */
>          }

This is definitely correct behaviour for AT insns. The only
thing I'm wondering about is what we should do for the
ptw->in_debug == true case. Before commit efebeec13d07 we
were checking !ptw->in_debug to skip both the testing and
the updating of the access flag; now we will skip the update
(definitely correct) but will fail debug accesses if the
access flag is not set.

There's an argument that if you're doing a debugger access
it's not very helpful for it to not work just because the OS
happens to have cleared the access flag on the page table entry
(we also ignore permissions on debug accesses, though there
are some code paths where we do enforce permissions, not
really intentionally).

On the other hand, we don't and I think have never suppressed
AccessFlag faults for the get_phys_addr_v6 short-descriptor
tables, so honouring them here too is at least consistent.

Richard, what do you think?

thanks
-- PMM

