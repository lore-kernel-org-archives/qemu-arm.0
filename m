Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF219C53219
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Jul 2026 15:35:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wojqM-0000xo-AD; Tue, 28 Jul 2026 11:35:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wojqG-0000qk-08
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 11:35:42 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wojqE-0002El-EX
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 11:35:39 -0400
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-c15cd3fd760so428819866b.2
 for <qemu-arm@nongnu.org>; Tue, 28 Jul 2026 08:35:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785252935; cv=none;
 d=google.com; s=arc-20260327;
 b=JRQeW1mTrnF8WOIOkVp6eVftC72/F/l6Aa9Wdx1e4zLsHoUSNv4Ox6x96yQPU2AcL1
 W+r2ga4L/SYtEPy2c3N9p5ItTvBU3CxJ5UztRVxf+kShd93/qZIMvJRRi2CkAMPWFdhC
 hZnQDJy0nNGPNexirCfNOYXDu7osWpcolA1rENxdlQn8f0pm4XhsiD04TpcmDW1KELw7
 PbEmeBc44HReOFc9r5nIPZpH891WgRf+hajn74HBXF9vz81Y3rApUiVrlhV8LUxvBWtC
 JiHA3ctufFVbuK4kI2Xb1eY8dk+lWxJI3yLyaDnfg+cJMJGcubAsoVvy3Jj+IoC82nQL
 6waw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=bNtLwb6th+DGqc1clfZZuDiT8g78E+W4g/BU+0Ht5sU=;
 fh=Y0Tia4XTBSUhjeHBJMmuctAi/Gx3GdXNAGNFuhZQrR8=;
 b=am4g6iSmsRFYHTvsIDCkSaDHoSkbfAbZ8ooswlfslFczDRyh2vaMcrJqM/jPySOthM
 dIDFEVzcSVDB0WJeURC7Li6LDLTbGW8mobYVjOs1jrqBSxH5RaV7F8q81mdDNOiPyVw1
 Q1BEXOxK1Vt4xoGZ1b9hvqlLYokERssAZj8o2Y2zLp2Z43DJ2+uT+r+Zp4jDb6Oy2Vl2
 S6ZGSnUJtN6FLxpqtba1vcH6RtbynKB9y14tZLaoKGGEbRSPxGhjZ08YTqRjLK9DXXIc
 qTYuYXESh27PhwYG34JbT8Uiqr2t+UgCRhPyiegER9GVT0HT/RQRdgw88zifu89FjiZW
 6Wug==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785252935; x=1785857735; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=bNtLwb6th+DGqc1clfZZuDiT8g78E+W4g/BU+0Ht5sU=;
 b=h3TxeqQP3Zttk5ERjnBpHdVgd6LI+A+wEgeLDAog8PppL4ZW8X2dz2Pk0W1s79/52B
 JyBiDqniNznfuZ8v/iAPeqjDwnrSvWJmYym741l4q8D1XWklBwPfzQ8lsqmeZqdlUuaG
 Z4uPyJqPf27Xn4tcnGD4au9ovWyThMusWgYlEkaGwDbWFZuBONiJ4SCMr9cLfVPeGvxw
 3j31M9VsSoV1ij14q8XmEnb0+rrtWtUB8QrIuzJE/2dWzVdvaws6aPLViwNSI/DTN++L
 m6+5onR/8MRvNlzzeU8h0uSbNQ5F4EMLJxY4ZT0bLu6VNt0w86r8W1HWs0hVxEL4l7HL
 jWsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785252935; x=1785857735;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=bNtLwb6th+DGqc1clfZZuDiT8g78E+W4g/BU+0Ht5sU=;
 b=kDDW/irxybw6mRHJt7rClvRXLMroPtuH3OSkwcNC9rH3EEUakTF3HjPb2X+DlBJNgN
 VkCiTiJt5FExXMQvF2HWj//v4ePM6/Bap2/6ELjpOAOFkliWf9q9/FYQUKQacq7kyDv/
 wTTuxneTL1EI3vxUcPtghyXWfUWjj6unkzaGByykpouQDLq2KPDB4XfhWMeYErL2eMvF
 uyISI+o/VlMdDwQNIXiHgNGLy6XM19SZd7NPhxYSK1mQbIpNjkz3KbIUE1egmfU/9pKt
 xIsewa5QPok9FDGKPnuVhQz6aDuhFnKaoLm8oFfGrpz5eFEmX8sQgQi23g4T8gWrrbGr
 kjeA==
X-Forwarded-Encrypted: i=1;
 AHgh+RpcEAmfI8AIcSkqZVUneM22pKAKix1k8BLTK8jorcqhmNMhGznhewROGJQrsRuKLl+bX0d/XWm8oQ==@nongnu.org
X-Gm-Message-State: AOJu0Yy9aa857YBpZFVPz/Yskc5F3wcLhrInV7FelhILP+RHKkeki5VQ
 anHlT8YWeAv4iTH/mb9THDabahaxRx/GVmbzjkrbssZLy6uxW34ZQS1K9nIflcVOL0k/Vy96dwS
 E0yv0c8k8rkUS6e71mJoG8xrs5hRVHD+NMKC/uDkhaeN3HxIQ4NO4
X-Gm-Gg: AR+sD12VDl7x+w6Q7C+HFEz98xo7Xeqfmn97Tgwnbar6l1oesSwbWHTerMiB5Gw+lyT
 ZEgflnRu7bc1QjC7Ftg1FVZmyp9scADioOjhW25Nv2mB0meNGobrAHKPe1NGEZ4dUoXBsiMHE8S
 UvZmJYyCukYtGDURhE0yNmrBI8wQNH+/7zIuXKDCZY2x/k2obj5a6MVwBfOdGYitdu2E6AggZnw
 S+/6VxDnYaedJLZZ7Z3dqZCKePkwQ1XbZZjyONtXM/68AetBgQc4LgLMvE2KTyM+kT38IWkGGuK
 SKthiStvNulAsoW7xDwdCsIhrqp4PFnTnVQ6diz2bZ1qeg==
X-Received: by 2002:a17:907:c706:b0:c16:6fdb:222 with SMTP id
 a640c23a62f3a-c1f7246c31dmr155579066b.48.1785252935136; Tue, 28 Jul 2026
 08:35:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260721184656.530230-1-richard.henderson@linaro.org>
 <20260721184656.530230-12-richard.henderson@linaro.org>
In-Reply-To: <20260721184656.530230-12-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Jul 2026 16:35:20 +0100
X-Gm-Features: AUfX_mzGU2gm4OweVLqis-aItdOGYe39OH3Pb5G8MULZr4wdjKqbTKrTPCYSPAU
Message-ID: <CAFEAcA_b5sWi=wx9ituMtOx=Ztg_SfFsTPdEOG23EUm2CST5HA@mail.gmail.com>
Subject: Re: [PATCH 11/20] target/arm: Rename isar_feature_aa64_sve_bitperm
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
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
> Rename from isar_feature_aa64_sve2_bitperm to match
> the feature name: FEAT_SVE_BITPERM.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

