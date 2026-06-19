Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB360CD98F2
	for <qemu-arm@archiver.kernel.org>; Fri, 19 Jun 2026 13:33:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1waZLg-000849-SP; Fri, 19 Jun 2026 09:33:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1waZLf-00080W-MK
 for qemu-arm@nongnu.org; Fri, 19 Jun 2026 09:33:31 -0400
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1waZLe-0004Jq-2u
 for qemu-arm@nongnu.org; Fri, 19 Jun 2026 09:33:31 -0400
Received: by mail-yx1-xb135.google.com with SMTP id
 956f58d0204a3-662bf1dab83so2580110d50.3
 for <qemu-arm@nongnu.org>; Fri, 19 Jun 2026 06:33:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781876008; cv=none;
 d=google.com; s=arc-20240605;
 b=P//PHhkASMRPOKLmOn0KgVeMvFYJrF6kqWh+eyhwxRq5gVP1ODBFDQKM3DWaiSkcgx
 4sw681JO1pvltjIcHsjVnTg/iZlM3S/Jxgx2h+QtVVS6XpkYxfupKOnVcTUr4ceMhxVZ
 8X1ReTdDfpT8EQvA2bgDXZv5QBJQOFB7ct3cgFN49ov53wvJhcIvjvFutM3Oc4FCqOum
 O7671CqwI4s3z6Ya/neP21COXAH2p4jb1yMry6chpX7lGrYo4nKjNkAt4T3GrTLHkcVi
 ahVrYiNlNmZ+oCRMkreHPM+DMaRD4Vu9H5o27nFuXZipd1y5v7YnmFeX104Zx+oNsqFB
 mnTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=nn+EQsgoSzTw5w+961jb6+lbuHvg7FauP87mFpheBP4=;
 fh=oO8ebAoKk1W3AFy/VRzeGQ6dG/3uDVYvCaPyGhkN+vE=;
 b=lk3Ero/nVNIceiy2CpMOzM3Df9EMdeM9IUoKONIcSjc1Xy5sTjx9B6xfOk6QhXA2gv
 CPFI75UBsyfWKRlIt0a8s3EubNhMQS30t53zfA9B5OT0e5YkBz/LbLoyjVQ1fVNg8Nla
 il/GNtQgxVP6WT3aS/4RCrFbS3VfeEtSwDwyUHnoGT67zBOFqRmJappgoRsOMqozE4Ue
 QAOpRYytwdh7kIOzGWnUdEzKUtsY+xYSItrdgVKFPitnqPyx5y/bnkZF8yLyd9RFNdHE
 /wDF7Xej9JStDGOGjQ8a1+NnDiyu3znFp0tcgzunv650apKf/22kLIItocojl2CFiyKl
 YCag==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781876008; x=1782480808; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nn+EQsgoSzTw5w+961jb6+lbuHvg7FauP87mFpheBP4=;
 b=zOWukc361y/ZjslURwC0gDVuQ/VUQ8oXEEkUGusrhwhxkO80JN3WsWvbhEYxMZO3ew
 xreKCzcmdXttwGiqpRUeuzZ248eTtELSRFqJf3QpSP4sizZJ5DSfF2MVzFDA7oLxzCwN
 RIbm7rBeNSamYYCMY5h+DK8Rcf/mvVyTi02x1KvkadtIvUC0PDIHIB3bNOL9g0Ygu7ln
 3VKw/qL6zt7A32P9X1rrfQUm0djEWekkaeQetYWFHCeA6ceKLfXD1nBzYTHIU9yrj6bb
 FyQvbkOFYc60giq/VvorD3Py9sevBSR4P3Ic5sIYX0fs0gvmh5fG7Kv0HVoX7vq+A1oQ
 nXLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781876008; x=1782480808;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nn+EQsgoSzTw5w+961jb6+lbuHvg7FauP87mFpheBP4=;
 b=dHREgYDwQcuiNqwiF55MLRbdEEoIZNaOtpN0sz6mG7EHNfmzpuhsCLjKRZMdiwJe4t
 jGN9Z5ajQGhyOb9bXxA/FokSzsR1w8xQLTtJoaV8FmHRqzjeZ+o32o4UJ08Fc/vvqmHB
 EhBKDXPMzK7itx4+0G0exiJ69hMfTOtGL7OmtLpZ8zdw8zEt3BhZ1Txpmo4/yrHogzF4
 JnR1W4gQBuYOPlth+jb9EZM+wjjf+CllMVhkzV1RsbBPBLHwBJMSvTBcvZvwy/WTIiSM
 vPpYBokAJhfLJWaRkrYwrTZCD44crTI5h6O3WIGAycvNIXeIdWSPggyEwm0NL8rWyFD1
 ue0w==
X-Forwarded-Encrypted: i=1;
 AFNElJ8yac1Zs6CwQ5NNYcGRY7LjGZfCX/JWH60Jd7pJrEC1ubne3knQtTecWLICxYTTe5R5CyQaNMiPOw==@nongnu.org
X-Gm-Message-State: AOJu0Yzb/dT0wdFDQm7Aq00rwKAv6PsStzrRKlcbRTw4duGcS04cSlFX
 psJA17K8i1yvg+osAxrHD51q43OnxbIUFp4pjCLeKJPZAdt5X3mIK0jdqjHhEcD14b1l/YTznSt
 318aOkTE9a3Icsvpl+t/evyLkj6sOf9bRnafsIBz08g==
X-Gm-Gg: AfdE7clTN8R8QxMhansb9Kc/kR1FVAo9ixyxwFJFd75zvoffvEczZeMSptoEygiJKA6
 AeqtCQ7GI5ZpdT6Jho8ADV65jwXbUDl8KRvDxVL2hFB8OvINq4feLg6M3b2LxGk1HeZ3na2KZIM
 4Uf3up2JNYqsQD0fKv1Ni6QhmL8KDRiVWwiVyH4yCIGq2DNzH6M6CIfPoez0ULVNQDTxyrMvfUz
 5ovJCKQwwTP8ELtM1zyS2Rw+ZIyyP8xvMSSxz1Qb8TdwzKvmNUnAYiypgCfFq0kkoaUplN43euk
 uHkz8wx9djt3/931vemYUVf6tme46KtkUS9CSwvKRp/BpbNPRxRLi8Fr
X-Received: by 2002:a05:690e:e83:b0:660:62e5:92c9 with SMTP id
 956f58d0204a3-662fccd3261mr4313947d50.63.1781876007233; Fri, 19 Jun 2026
 06:33:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260618041517.573469-1-richard.henderson@linaro.org>
 <20260618041517.573469-6-richard.henderson@linaro.org>
In-Reply-To: <20260618041517.573469-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Jun 2026 14:33:15 +0100
X-Gm-Features: AVVi8CdaW9p9A0UWgM2lxZHQN18suuRaBg__cTEiT6qcpfUunOCj-Jemb6i28P4
Message-ID: <CAFEAcA_wh1mC_bFU15m4B_aJriBqKbrCfpXxOXYj74Oy=53NCQ@mail.gmail.com>
Subject: Re: [PATCH 05/10] target/arm: Implement FMLALL (multiple and indexed
 vector)
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb135.google.com
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

On Thu, 18 Jun 2026 at 05:16, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/translate-sme.c | 4 ++++
>  target/arm/tcg/sme.decode      | 4 ++++
>  2 files changed, 8 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

