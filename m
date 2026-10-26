Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33C8606A31A
	for <qemu-arm@archiver.kernel.org>; Mon, 26 Oct 2026 15:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=IgXKrlnB
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xLN4W-00083B-6A; Mon, 26 Oct 2026 11:57:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xLN4S-00082d-Bo
 for qemu-arm@nongnu.org; Mon, 26 Oct 2026 11:57:13 -0400
Received: from mail-yx1-xb134.google.com ([2607:f8b0:4864:20::b134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xLN4Q-0006TG-Mk
 for qemu-arm@nongnu.org; Mon, 26 Oct 2026 11:57:12 -0400
Received: by mail-yx1-xb134.google.com with SMTP id
 956f58d0204a3-67a6cc9acbeso112280d50.3
 for <qemu-arm@nongnu.org>; Mon, 26 Oct 2026 08:57:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793030229; cv=none;
 d=google.com; s=arc-20260327;
 b=VbxcPyAP8H4OtwBgL1MRlWd5D1NtAhmhtdA2MXdssNfy7/O9HT+dFFHCUu2HbwjkAF
 7+nEXlfygyqp/3EWXj5bP3e/dusNmH1oRvwOph0ld34tX5K7VCICYxbZbjL/P6656lu6
 RATNr6zdODnCOGieQ2DQ0OfaeB20w2s9iUUhd5ZRUCmmTQ9CDewxeZcqN02rH1swWPWk
 NJ3tWfwa4JKDBvOsXx670CF7KupxJcKX/D9/CLSi8MoYbbwO3DkBMk/PbKmGaHJuG9nu
 Zgl+d/5PIzyq/qF3y4YaJx+NmvZJpZSv4WeYX1kYM6fd19JrPKhDE/q2KkIHz5Ukputs
 xAMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=zx0KTyhOYR8ruT5VlXEVTdnIHHi3M2k8T+AyKfHyLrs=;
 fh=Bdlfl8xv85uV+f6UN3HPWp+uLOdm7Ga3gAe2geXfF8c=;
 b=SGa1R9tmDDGpNHz2MtJ+L1KfWNp77ltip3jubLvMWM51/xtc6lHGkFpYypcZqT66oY
 L6QXeUmotprafOJRGC8QWKbOO4UeIPfyN1Z8zj1FGAndog9HwYbjxqszcp6egMm75h06
 4KDkPCPGcAxKXJdKB/zF5ARYsFfVPFKmS0WwhNZJtQNfrmhh/WbZC8BhQS7UVVucB4Qn
 aI8wXORc6Je3QX6FDspWIfUSGPursdk0qBEyexH3aUn3VG1mfgrHyrQJa4cj3einl5UU
 YzAN6SMA5v7MUCDUNRpAMob7u4ndibRJbpGNuXloo3FRHZXnzpT42NM5wgdiTu4SYyXk
 QDEg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793030229; x=1793635029; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=zx0KTyhOYR8ruT5VlXEVTdnIHHi3M2k8T+AyKfHyLrs=;
 b=IgXKrlnBrWSoNi1VJWGpqbboXerqdgMiNDMu/tf58AM7tzrPrn/P/lGAtvQW8abI2W
 tCReDpfbLS2S4t6zAV8fhd/dOMkvnzvhWYMnAW4KwT+fO7Bnzv+Ih/iRtTlEz8FaTJUZ
 YSZSSpg//P41SsCMMnhMra6GzdR7rG78gkTYJvkkzdPBfAXNE7mUSMHPoBe47niL3hRG
 +uIImc8W3iyQQdRENkR6bxnx1v4x5iZwyvBlEd6IlDiCArzR7Jqypy79o++fGWtOI7j0
 dB4WsEMSCL3pqgBCe1jIAwKL/IVVyQRRsCF6hFt3F2rbAR1FXlI4/kdLwpNixjQi9WJM
 Xbig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793030229; x=1793635029;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=zx0KTyhOYR8ruT5VlXEVTdnIHHi3M2k8T+AyKfHyLrs=;
 b=DQMSQgprBckeuB6cGwaVXvK6tRUtxtBj57wOMGFf6M3nWsojVzFOBJKN6FKBOMbYyR
 eLb2e0AXgw14N5O4hudzihh2M6v9lsOLJK6deOmLqaPL0dfAM2tubh3GKdllUSLHmRRE
 wmg78zTqr9wopMViFjLIbHYHSnOdpLHe1Jp0vB6aaaikamzup5H0+0Pei/pCR04PqCWT
 mMGpm3sXO3/b9XMQmXDC3JS3ZPzvQFHTlaWIL2WBB3v1IDb5NSx0ivEilNkSEd4Xg4vi
 6raCGV4l88V9YUxptj9KA/dMsgiot5ZsHmCMAsdVjwmIGxnOgMBJxxeRcUOcc4ye/7/j
 rZgg==
X-Forwarded-Encrypted: i=1;
 AKwUvBwVnq3vwUpyVu/Uabrdv4bKarBFI55mtqE56Tz53ffo0pVusUX/sPhFGfHBXK2aoeOiIWIcqdbfQA==@nongnu.org
X-Gm-Message-State: AFq9FYJqB5bzOVWCwal0vKfEf3FP/sAc6s1brd0Bh9pO5/UFf+Fu3A4q
 ruvF5KlivFX+CorqS2cpMhAn69KagURKwiJT5yX86Epz95QFq4Gusu0C+rNHUf3h9HyttTkF4dh
 u3mQ+m/+fQNmTuMvbiJsFiewwPevT3Lc7nxEq3f3Z/g==
X-Gm-Gg: AYBFou2RvWXMIQoV2DFinjx9+nT1iBHiiQLmdUdQX3vadMFe55+Pkfr5t9Ji8E6pYOz
 ZqxdSluP4cuOJIacuaWR2hxBePjtlnWxiXSCCZ6DM3PvrNYdZDQbcn8l8bAda8B9HfHn8g0Qwv0
 F2RODXBceavA23j/M8Vg9CEPHM4P73JiSusEZ+kntgDx5K3bsS9F5F/5xfPXlDUgAQwR6tnmZ8f
 WWf3CKhEYPVZkjfkikuNHohMYwqaOICiFyCXxSNVePYbrRl5ksdiPOS0oZzaZ3dUilLvFzXIIVs
 iXUK4i7dA9lmFvicW6HQBCZf4xwnod/jtbyDagrprJJ7OYSo6kRv0pd6NMgp8IGak3h4u7xkDzd
 GCgQQl3pqt/z4UZsmj8RlheP/3AqmzHQC18S4cM2KF0R+0h+9Lnm7tPZU8lS2X9HR5NYQHYrmAB
 JKRwv9RUaxL/1m/DKxYKoE
X-Received: by 2002:a05:690e:2621:b0:679:992e:3acb with SMTP id
 956f58d0204a3-67a454233e9mr3564621d50.58.1793030229113; Mon, 26 Oct 2026
 08:57:09 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261023135924.64990-1-marcelomanzo@gmail.com>
 <20261023135924.64990-3-marcelomanzo@gmail.com>
In-Reply-To: <20261023135924.64990-3-marcelomanzo@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 26 Oct 2026 15:56:56 +0000
X-Gm-Features: AclHuK97d_JZkXguIbsfiFJqJ2XfqzDI8SVzAIjq6k1hHrDb-ij9jQQMlvcIC6M
Message-ID: <CAFEAcA_t=VXby_UkxG_s4X0tbsOq8JDR4yP2g1iQKwG0uYf84A@mail.gmail.com>
Subject: Re: [PATCH v5 01/16] hw/arm/bcm2838_pcie: add BCM2838 PCIe Root
 Complex
To: Marcelo Manzo <marcelomanzo@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, philmd@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb134.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 23 Oct 2026 at 14:59, Marcelo Manzo <marcelomanzo@gmail.com> wrote:
>
> Add the PCI-facing "root" part (D0:F0) of the BCM2838 (Raspberry Pi
> 4B / BCM2711) PCIe Root Complex: a PCIe root port with the vendor's
> device/vendor IDs and capability offsets, not usable on its own
> without the host-facing part added in the next patch.
>
> Adapted from patch 13/41 of Sergey Kambalin's "Raspberry Pi 4B
> machine" series (patchwork series 829638, posted to qemu-devel in
> 2024 but never merged) against current QEMU master; the surrounding
> PCIe/GENET networking support for raspi4b was left unmerged upstream
> (base scaffolding aside), so this and the following patches complete
> and debug that series to get real networking working under
> raspi4b.
>
> Signed-off-by: Marcelo Manzo <marcelomanzo@gmail.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

