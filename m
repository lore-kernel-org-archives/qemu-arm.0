Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 311BCC5B572
	for <qemu-arm@archiver.kernel.org>; Mon, 17 Aug 2026 15:02:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wvyqV-0001NF-J1; Mon, 17 Aug 2026 11:01:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wvyqT-0001He-RW
 for qemu-arm@nongnu.org; Mon, 17 Aug 2026 11:01:49 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wvyqR-0005bC-QZ
 for qemu-arm@nongnu.org; Mon, 17 Aug 2026 11:01:49 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-8111c0c7561so42466967b3.3
 for <qemu-arm@nongnu.org>; Mon, 17 Aug 2026 08:01:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786978906; cv=none;
 d=google.com; s=arc-20260327;
 b=ZtXPF3gj9Hk9e+EaCjMhlxUe6Bq2B/AVieS8ORmeJc/lxCDzOK9xm2yiBdZ11H9kBb
 /H+WGbIAOBK6thV4ueI4SnYRuOgu8ZL1uFZlDwcEHYDitOe+ITXYiobVbozsBG2l0mra
 d9nZFTdrZDDQJnbUFGdKU7qfrccNUN35vs6N6374WaAslFiyrvOKusgFdLoBRz5MP1eH
 wwfIIy74NpWd9RagQUQhmHZp6/pm6FiyGceFgqJ7Fui/zLTZbciA43OCzqvZc1a7TUt2
 KsL1KskHkRAUnZVEoDVh8FumPmzs6KisyzP+14qu8+gIJZpfwWD4+rpmbFE8XasHezIz
 sdxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=HDVmgTG4FVPA91nr8zreT6qotEHoroa3CbRzNIbmnAU=;
 fh=9NAJb/vLxRdRqa/2yYKrb0a9S50XvdDrS6/6N07rE50=;
 b=XBrpZlSmKATPhgPati2e4v3o0B5elAhj9VkXNk5FSldruCxoytbGbHiDVVfaLTK96m
 m/oUXLU25bA0ipeeMF6tRuVzsjQ/VyWKWSrN26yOXdcUBKRz/E85NQq6Qw2I4G+VZzXT
 g1sC3X6qbTRgIrdjpHUt5bZ9KVaIn8XrOus18LEUf8Zis+LQEPEiN2sEtzdQWSsiQtbb
 QtuBOdfamDdcKv5lWsK4TyaaN7bzuAAX0gcrK3pAp0nl8qEpjCCu6psg3UmhRKpUQiD1
 oOy/wKOf/zY0ei+nwD4E7kDt7KY2ER58VLkWU4pyT2e1MBd8O92eVdaLQtaxOlgaL9jD
 DaGA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786978906; x=1787583706; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=HDVmgTG4FVPA91nr8zreT6qotEHoroa3CbRzNIbmnAU=;
 b=DIfrftZS4gqyHdfO1c/sxRfzWdU69T4/6d/+ZeJAfLqwqsbTs76SSfW7x122c4en2S
 JW91aoPEZYnSOZ/OngdJOAIlv65/85zz/vN/+AqUYs+0fOBgDIgvtVcGeiIPkXeTWiOT
 2+YTbhGt9ULeuWiOH6XTqmRDASefbD7NPjEV8PTiRSMD5G3GZ6DbyZ6mR3whKzAQN3Jf
 XUKPf4lBrE525np8OBsv0tx/C9xcQcwDL9O1VUFCybTkZf1Ij7d/gMMmmbxvsqJSjf9E
 yDsQ75lgwAD+AXQTdxJ7nD03W8AeG35tw+ZtFV92HPqTlavjKzQkfQIeRGdl8GbTm0gu
 T5vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786978906; x=1787583706;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=HDVmgTG4FVPA91nr8zreT6qotEHoroa3CbRzNIbmnAU=;
 b=KYPPiLqVB/lDT5x8OM1E2iD8tsbT4BlsfRO6ym4WqYY/DZelJp70OKYoSnVOBdpVXd
 1CshyT7eqdStlLfpNfaI+ZqiZqvTaj53ugG9ey702gP+40EEvPEDTDpmOlsKw5FDJiYM
 qkoS8C10GlgKkXmboQS2S8bjYnIvCrtVhMe1aLJSoleuFhZgf2fJqtpbkIOxRVEGTmzq
 qfh7TZRbaXrx8GJ9VCb/oZmtwGQ45RZp8RS5b4rmgvhbkmNCXEGeDE1/s7HYNPBTyIkK
 lC0sT1hBR84qsV/Yn/F+BfiOWQHbf86fMs+DDYfJUz0CCSNZQf0eotJjA3zdhnjCNYyh
 VdXQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RpUgM+7cqpn7M5n46bY1gzMCSJMTU/Llj8SxCJohoi2ssfhkx+ngp0q5Un8eJ/sjjoVF7cD+Yxcxw==@nongnu.org
X-Gm-Message-State: AOJu0YwXsnS46iYoVBKF4/amG7/7aLzqYHeqlcXTf5cbDsTiLHI8PmhK
 DxGKSloXOv5NGO4GJS1mzD19VKHIHH2xb19+VkRuHjx8/9MqOGpuHb7BK8XaiZm6FnG4SaoDuK4
 4G/srzVk5zmMGr9IvmPEJ70mg89qwptOt8lQUec7qlQ==
X-Gm-Gg: AR+sD11F8rOL06QgyqGWeZyLxFQAEqOe+td/yBly83p7om0dFFVlIYiGE1aJ9DtirgR
 xU3i03b4aJjHOJmvbesHK2iIngFLbSE9HcZPfPjLxOI5jrFbcTR8/XVTd7mPPBgwCSMn8WBanU1
 p5kRXVYJp9wDQUwZaMkPEgaM/zNi7gcCxBiGWKa0oTCBXLiU1b2cGLmldFdBVE5xXBArZ9E6Xgv
 3u2coovfuePXg2Z99DiV2Qol1HY4H5gRzwy/kSwkBZkO9GaTowpSNpCOMSghcoBA3jZVOzQBjyJ
 O2sOdugOhW1k2G+il3T6lEJfilweySAf293+gB0uWUW3fQphvbizsTePb06r09jmxnOzwc0Yxkm
 SZvm7/0T5C2IUncdBd7oKTX7k7zz/
X-Received: by 2002:a05:690c:e:b0:81e:87ca:4799 with SMTP id
 00721157ae682-841304da213mr5789877b3.23.1786978906100; Mon, 17 Aug 2026
 08:01:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260812204435.295067-1-richard.henderson@linaro.org>
In-Reply-To: <20260812204435.295067-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 17 Aug 2026 16:01:34 +0100
X-Gm-Features: AcwNN1WW_HWdS_jS3dF5mVGmnKwDpUBHF072Nqs8tjTNLfbwW576k-8vQxXOLvk
Message-ID: <CAFEAcA-xmbhZFG+zVcQDt02UJ5ELY2bOiCkVVW=60oZgzujiqA@mail.gmail.com>
Subject: Re: [PATCH v2 00/10] target/arm: Introduce cpu types max-v8 and max-v9
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
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

On Wed, 12 Aug 2026 at 21:44, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This is something that we've talked about for quite some time,
> having separate "max" cpu types for Armv{8,9}, because Armv9
> prohibits some deprecated Armv8 features.  Retaining all features
> simultaneously has the potential to cause confusion.
>
> Changes for v2:
>   - Re-reorg cpu_max_initfn, avoiding the build failures without tcg.
>   - Move aarch32 tcg parts of cpu_max_initfn to tcg/cpu32.c.
>   - Separate patch updating feature comments in aarch64_max_tcg_initfn.
>   - Do not avoid aa32_max_features for v9 -- the registers still exist
>     and describe the features that might be present at EL0.
>
> r~
>
> Richard Henderson (10):
>   target/arm: Tidy cpu_max_initfn
>   target/arm: Pass ARMCPU to aarch64_aa32_a57_init
>   target/arm: Pass aarch64_enabled to aarch64_aa32_a57_init
>   target/arm: Sink aarch64_aa32_a57_init into aarch64_max_tcg_initfn
>   target/arm: Split out aarch32_max_tcg_init
>   target/arm: Move aa32_max_features to tcg/cpu32.c

I've applied these (1..6)...

>   target/arm: Annotate arch revisions in aarch64_max_tcg_initfn

and this (9) with the minor comment fixups I noted (but not
doing anything about AA64ISAR.API or re-sorting the out of
order ID reg field setting) to target-arm.next.

thanks
-- PMM

