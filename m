Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5366BC53219
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Jul 2026 15:23:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wojeX-0000wn-Rv; Tue, 28 Jul 2026 11:23:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wojeS-0000l6-Do
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 11:23:28 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wojeP-0000ME-P7
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 11:23:28 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-69eae037da1so6313769a12.3
 for <qemu-arm@nongnu.org>; Tue, 28 Jul 2026 08:23:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785252201; cv=none;
 d=google.com; s=arc-20260327;
 b=co0oL2oP56Rm7M1oI66acY3Ec42QpPLA7UXsVQa6jduDUp3cFzEd0Hwgua1osrq0K3
 gDJ4n7jwsJCqNCzrB9nPUWQOxNhscWbxMO4fO7PgnNmPJ/LvJ/uHCVNy1uY7G6xNSw/f
 EDve4R6iu4L5LFtnrcYO7XHxRkhRDwQTfX2uwWqBvAy+15IsHNVoGOIr42v5WmuW6T3L
 kn5/Cum0S89dj72n7VJLueT74c+0GmpIEfxd6+5Ryqlm28VpztEBgVnwPj1wD8QlV7Kp
 EkbbJBamTA4NqczsegcB0xnvRyvOTEvq5zuX5CUtrAwL7KXXqgNsJCu1uVqxWXGCNx8h
 6JnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=3D9cl0lpRNgws1XwyCCcUEGTjvGjvczqkgCPVzYz//M=;
 fh=W+XZSojLhKGyrzaBG/ilHAlkMfAImEflLOrjb4iJ7/I=;
 b=A7cPHXpfMbN577SMNEEDpECZtXqFMTpAw5cmO7f57w6z6YP7kzyzluLEQhlJEb8C+F
 CE2uPXUZcVRvuFCIqcZM/nxe4vyU0kOssQnoEUiCDOt+YBPjAaj2nGhxoMHG/qwhQ5TF
 qUiSdA3+kRSgqXSSZlfffSAxnQsoHqpRfr/cTlrbWm5cJl8oR1wpp0S7FKQYjtGnsg4R
 SyFTbQ8ZBKMAb2mW9T6vkO7+ed+nwhCFVR1wWEOJEZ7ZPsFJZHOJxZgZDHoZw5nAEJz4
 YcQezD924jBV34nWgXmQkOLvCNqlM1kanCkAlfbn13SfskBnMIhLiW7GItXirdtc616i
 UgkQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785252201; x=1785857001; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=3D9cl0lpRNgws1XwyCCcUEGTjvGjvczqkgCPVzYz//M=;
 b=goaq7mqBH8TexDGStFBtMmXTW9Yl9suV2sd15H8wo56JHqqgzIiJuwMZd1F4YYL+Oi
 wUXCGznQPE9f2L14bbMlPdQ729Gvk57RdqkwzArORW/8SyKOtux4rsqqecC2N3/L98Xd
 rX8Yq6IODDkSPE/CkG/2dPM02ecMPgt4AIEbZze9k1+tdQocNNTRq0DmkgLC3WjnO31P
 WtOOu8nBl80tJTv+vo3lK+g0rgK8tbqbI/ix+2Q6AUyCnaeaJxBqi+jyoQx6yiRBQCJe
 ZMwWNTrBcAmkraLbSR10fVYO0qlHXyH3iQNmg0elMyiP7gMqtdONwi5VhsXdACXj+1Kl
 E99A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785252201; x=1785857001;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=3D9cl0lpRNgws1XwyCCcUEGTjvGjvczqkgCPVzYz//M=;
 b=HqCxOUETkO9SRJ8O3gHVW2H2+Y0Cfx1yw+BHS8DAfPkEDdrYidzLWCmzpn8f2AWUKE
 W/nQ2r9Q70DXYypx5Xz0sjf4G/++1p05Pr2pVrsQStDouo8FeVoNw2pPiWBcOVpdIGnJ
 +TOb5zZKjhqhlXS4fUk7BrHAFzyQQah2snFZBxQvmGMdltCRFAQHecpYlucV73oM8B1Y
 ieRNoRNs34RbWldSTd9zyRyzXfbfbpApNhXtRghGc+yVjzfdL4HhJYjz1KIKQx4xLCOZ
 rxH0NfflvE4heU4Co8KzcGC8kGt1P1s+unpMKQk/lKhBLuVihECUSl6cYqRltGTTngqT
 Nlyg==
X-Forwarded-Encrypted: i=1;
 AHgh+RrO63UJ4m48a9u48Drq8qg3qpsmq8b+f+OPcoA77CAYJRxPe6kU9aFRM622brlqTOVovNhnfrSBiA==@nongnu.org
X-Gm-Message-State: AOJu0YzqoTunExkJFbKUwW9SsVFHStpii5aBtbjQSSU1sTY1mmqH8rod
 bfYrTYVvg0L4rtiB/mbuup7+fsJK97YuoU8RDnWxWwTpvYrjB//EX/I8jEgYGw/F/ZNg0HHEOJT
 vJawqP5MHxPfLjVnow522A2sfJHgr91jrqlMzI9L3lkGzscMC/tR4
X-Gm-Gg: AR+sD12QIYuMccqutd0ED4rSsmaIsX8vCUxkIUvuEtP1217VDQzYFbsAYBGvDENzHrN
 fwfiVPXxbEgtgx1nGxa1Idw6/4Gwdd5fUvbA//FruNR91z46OpBntu6RLncqmidj629tg73u0Dj
 1UZ2QdA94AXLFmlrYT8EI8lfTEZTJF944XvEW0SOoIC7tZxDGpOR2QrViaQKa7Wy5J4FkyhSLlt
 NiIeaI+NHitxLqTgPaM9p3J/dcFyvgkB16puuDlmFpJZonXLmhIFKdTQJXcSbVwaUWu6qTeMFRY
 kwiTch9nqvPiQWWCKZ+aPkT8CMRHTGLbQiIMm1DtC7k+Yg==
X-Received: by 2002:a17:907:8b87:b0:c19:6ac7:89a3 with SMTP id
 a640c23a62f3a-c1f7221e4d5mr154431066b.37.1785252201276; Tue, 28 Jul 2026
 08:23:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260721184656.530230-1-richard.henderson@linaro.org>
 <20260721184656.530230-5-richard.henderson@linaro.org>
In-Reply-To: <20260721184656.530230-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Jul 2026 16:23:06 +0100
X-Gm-Features: AUfX_mzb08mrtV5D-0Uf6X1HcfPyZA_M3dImyQREw1_zgg1lAtHnr6NWShOR9jY
Message-ID: <CAFEAcA8PA37omSTHFR0WDnT7TE6nNqdNofLJ2iOaqwHNob5HkA@mail.gmail.com>
Subject: Re: [PATCH 04/20] target/arm: Remove DO_ZPZZ_AH_FP_B16 from
 translate-sme.c
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
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

On Tue, 21 Jul 2026 at 19:52, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Expand the macro at each use site.
> Merge the two arrays and index by fpcr_ah.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

