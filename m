Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F8D2CA5FFF
	for <qemu-arm@archiver.kernel.org>; Wed,  7 Oct 2026 04:50:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xEJbN-0006ut-KH; Wed, 07 Oct 2026 00:50:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xEG80-0000mJ-VA
 for qemu-arm@nongnu.org; Tue, 06 Oct 2026 21:07:52 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xEG7c-0002OP-AV
 for qemu-arm@nongnu.org; Tue, 06 Oct 2026 21:07:16 -0400
Received: by mail-pg1-x52b.google.com with SMTP id
 41be03b00d2f7-cc4c7fab7b6so2414539a12.0
 for <qemu-arm@nongnu.org>; Tue, 06 Oct 2026 18:02:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791334926; cv=none;
 d=google.com; s=arc-20260327;
 b=QVbV06Yal4/2ildOWLcUQGwskM0w3oI8kHVcraiRb6FYLrCVutx4QTHxRc5n8/VhMX
 O4EbTVv378uUA1TbErE+cst7hNuEZgxPURXUHhGnAXJ6YYpI8y8odiefuVungR9kH0lg
 ZHuDpnEahWVD9NErZ8jHmFgmfzyhsnzaT45Ikuj2zqQ274OL0UJDsK7gyQ8N5RbqSmdB
 3UeyW1VZAh6ivLLcHSmRddlHkzB1QvrX4GwbwXLgPcu8r2mGM7rI+h3bLgqAAUvE98Py
 Fy3NQ9yREEU8oDAgwlAx6Kvz6kKt/fVHhbCjWYE2qUl7wyBxotY0ScJwnsDBUcHsXgI7
 jiYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=rA6d3LHupZheAqdSUzkSD64WVV+9ZI/EreB9XaQHC/A=;
 fh=Y/7C/wrpwWVjzemrmGWBzzqlWWZSFVNPq87pY3l68dA=;
 b=awaQWSIxCZ7wvaEzrIRDv+Ue6BlD+HENH1dsclCQgQWqTY6279Bp8WIn37lKP4o7N/
 kodfq++0xSJTIyJdVXxK525IuoCGHTsou91SeO8DLCFo4b0DFIWHbPjzNNjDVMxb++eV
 C0sfyHqWqOI+kskkdMMzDFgrlJT50M4PpkYURdjSlOnHqDDYn8106+hnu4keF2gRmw3V
 rA66yam4ECa9JAQTLtAysAkxzIZIinvPt57FesjGxi1zXI8c4kUBC4uWtnZvtifubr8A
 TRmv3BJqNBgRm4tJVTR4UJ8LyooHytCN91bSkEzI8HBa73VBZYb0Z1e5bUooDNsJWJwD
 StmQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791334926; x=1791939726; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=rA6d3LHupZheAqdSUzkSD64WVV+9ZI/EreB9XaQHC/A=;
 b=hpV4+ph1VKDk33FAVHeuOoQAdV3eTDQukQCZJXBClNJSgxoBvR1iX83K3k+tmYeoGb
 T2OGDUD4v35E9a3qZSnrEjcojDvOyA46L0hrNvI9VH98zNrrzv3R/96Ug659Ef9JoJXj
 TDtZc3tH0Zsuuap/UsU04Pcyy714Ekth6OSmNvnSBN4paRWlFbQZQP+f4Y5d8+G5k8j9
 ASyFwmsCC3A0vzACAzXCmzwPO7XHUT1vTuTJiKi9CZdYs++Riws5aWL8yKuyu15QsUkH
 Xr7GIL3rCzxc1tYorAN8Xa728c7zSltGM3gPme7K1o5ucrY/eOl65Yz9RcXjpSL6efho
 4Ssw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791334926; x=1791939726;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=rA6d3LHupZheAqdSUzkSD64WVV+9ZI/EreB9XaQHC/A=;
 b=TD+ogOU1Jv82f/5yYb0Vz/ordwjm3fcYweJLGF7pyRllbtp0hwx79QsjBoMMplYXco
 Ze+zofMMdWe+16DsflFVwB0x8EsW49IaQ/fwnAaK/ROAs8zGIVf6qM6CbNhhAabX5u0f
 1T3PoqGxd9vq6ad5d8ekoRJKUHDr1pcYJ3gOSNNifx5QPo222rasT3IaA5JnOVgrJIg1
 lBQmRxmzsFBM/MeS6/NXdGBawy6kwiYT1S6ikgNb58oQbpOYGImPZLAoga3LaEN/sXST
 s1LQBmJ813UruayzEpR7k0K8UrNFY+oUhTHgByJmD4toEKGKaFMl6t2hUlgz7JYnJcfZ
 TJHQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxqzryxxIcibR+hwuzfXfG7XZLmngsBPoTy1esLPAmBKpzehBqJKHaB7p0uMMEOjzq6ZPN3HVct2A==@nongnu.org
X-Gm-Message-State: AFuF++mAqDxw2+D9IlfpIZIY2s6NtbvKWsr81EeOb0N5ZwXiwZ5fdW90
 1HSzGfL95ZXT7BwW1g9w1xmvOvECl1X5nK4AGnQH28M+duR/V7u1cmXTepB8y8+dcHP3HBOxhDK
 7epoWlopExMfdULOJ1zUQznZ1B7rnF2+WcEFzNK/raxV0QOzSDiyfqXQ=
X-Gm-Gg: AYBFou1GzIhh+MeLPLxNPBailMvzEbxCGgYGrkGUQAov7ekyDvTg2g0F9HA1r+csD2g
 Z27o7SAQKmemlo3zLAxYnVdYDGV7XOJ4Ry1k1e4yr82VNy3pDHEHEYupZhi6iYUL05nAIG5eEmm
 IadC1uEHtl/rknTkQB/CFi6JXWop0qLPv1c3MTSUVqTPsV8121aLNrmOFQOioP4USaFIm9NwwAE
 OyICJtjgMWZKqPZl/awJ4cxE3dtCOQWmmThDbM3Vm6mYugAED4TILyoh4b09KGlsOwSfOAb14Y0
 ODRMn8UN6qScg2yH2BnhjYQqioUy4qVs4oiPWz5JIg4ztlk6a4JRMAYPJDbxotUKXOyCHEWD2XG
 1KFI7ouXErXSVOQ2hFCooE1A2FmuAlQL67v2APXs=
X-Received: by 2002:a05:690c:a4c2:b0:8a8:466a:72a with SMTP id
 00721157ae682-8ae95adcf20mr30134807b3.67.1791288519607; Tue, 06 Oct 2026
 05:08:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260923214453.45335-1-manuele.conti@archimede-energia.com>
 <20260923214453.45335-3-manuele.conti@archimede-energia.com>
In-Reply-To: <20260923214453.45335-3-manuele.conti@archimede-energia.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 6 Oct 2026 13:08:28 +0100
X-Gm-Features: AclHuK-8UMHKAjJ5zTHc4ltC633LRsQFOwpjqDLQx6EXdJBO2C4fSFQuKJFbmpo
Message-ID: <CAFEAcA_i-iRvgWMdiLstnaosHANJE-OG_5oNZkhwqXHPgPT_qQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] hw/misc/stm32_rcc: mirror oscillator ready and system
 clock status
To: Manuele Conti <manuele.conti@archimede-energia.com>
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair@alistair23.me>,
 qemu-arm@nongnu.org, 
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Wed, 23 Sept 2026 at 22:56, Manuele Conti
<manuele.conti@archimede-energia.com> wrote:
>
> RM0090 7.3.1/7.3.3: HSERDY follows HSEON, PLLRDY follows PLLON and
> SWS follows SW. Upstream stored raw values, so firmware polling for
> ready or checking SWS never saw the expected state.
>
> Mirror enable bits into ready bits on CR writes and SW into SWS on
> CFGR writes. Clock switching is instantaneous in QEMU. No oscillator
> startup or PLL lock delay is modelled.
>
> Add qtest writing HSEON/PLLON/SW and checking HSERDY/PLLRDY/SWS,
> including clearing again on HSEOFF/PLLOFF.
>
> Signed-off-by: Manuele Conti <manuele.conti@archimede-energia.com>
> ---
>  hw/misc/stm32_rcc.c              | 18 ++++++++++
>  tests/qtest/meson.build          |  3 +-
>  tests/qtest/stm32f405-rcc-test.c | 57 ++++++++++++++++++++++++++++++++
>  3 files changed, 77 insertions(+), 1 deletion(-)
>  create mode 100644 tests/qtest/stm32f405-rcc-test.c
>
> diff --git a/hw/misc/stm32_rcc.c b/hw/misc/stm32_rcc.c
> index 5cfb39e560..ba64a87bdd 100644
> --- a/hw/misc/stm32_rcc.c
> +++ b/hw/misc/stm32_rcc.c
> @@ -90,6 +90,24 @@ static void stm32_rcc_write(void *opaque, hwaddr addr,
>      }
>
>      switch (addr) {
> +    case STM32_RCC_CR:
> +        /*
> +         * Oscillators become ready immediately in QEMU.
> +         * Mirror enable bits into ready bits: HSEON->HSERDY,
> +         * PLLON->PLLRDY. See RM0090 7.3.1.
> +         */
> +        value = deposit32(value, 17, 1, extract32(value, 16, 1));
> +        value = deposit32(value, 25, 1, extract32(value, 24, 1));

The manual says that also bit 27 is the RDY flag for bit 26
(PLLI2SON) and bit 1 is the RDY flag for bit 0 (HSION).
I think we should make those also follow their ON bits
while we're here.

Otherwise this change looks good.

thanks
-- PMM

