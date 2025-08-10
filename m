Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 588BFC87FCA
	for <qemu-arm@archiver.kernel.org>; Sun, 10 Aug 2025 13:32:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ul6A2-000322-M9; Sun, 10 Aug 2025 09:32:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ul69m-0002yY-SL
 for qemu-arm@nongnu.org; Sun, 10 Aug 2025 09:32:16 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ul69j-0005KX-Ua
 for qemu-arm@nongnu.org; Sun, 10 Aug 2025 09:32:13 -0400
Received: by mail-yb1-xb31.google.com with SMTP id
 3f1490d57ef6-e7311e66a8eso3218885276.2
 for <qemu-arm@nongnu.org>; Sun, 10 Aug 2025 06:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754832728; x=1755437528; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4a+1rRJDKqWQsRx2A+SIAn0OH7mlg7e4jUDSAR3Hw+k=;
 b=XAiRz0GAsFjq8eica40TkfNawzh+2tW/pns0DBPdeZBLtIuOqcAPhPsCUG4HfPUT/R
 qG+C1g3nowGwHjFQGu4nsWhTtfyOIq0+vcPo0SncEZ3S7WRcXJqdECiukP2agwrSnB+p
 gmaKBUH0AP292Zcx+IRQFLJ5Y0M7KwvFtvwUoy83B7viOCpsXexUv1ZG0MofN+hN9j4v
 XwKTIEfX9xZErhLVbcQPe1CJ2+txBK47dWXCdb7pR6GAMT95RgEHeLNv95LJFBco9JCx
 vBZiiwSmz4Um8RNX7p4b/0rGMxsJ17PosD8Pzf87wm3/NFcbztqXjyWHgY38rv1iZOh/
 ZOWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754832728; x=1755437528;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4a+1rRJDKqWQsRx2A+SIAn0OH7mlg7e4jUDSAR3Hw+k=;
 b=ZxNml51rRZCd0hoJ6Sw0O41SpXJIRwigQPfuf1lvrrP0/iTUxDsjCZsvHhx0o7S6mR
 3xKUBzmRV7eTdveFzU2hmfVeIwA6YoF8tLysvd5HOh1r0MBkFCJk/PZ2Tx4lFv7Pwt1z
 /NZ+0tNOz1Hma7+QpyyUMtm+MzsHOdnruW/P8ca8FAdZ60orHyZXcUnKBXoJdRi8ujRu
 HOqNoOzMANrc5+EwEwW807XZRv2GOf3g/W910GfyukwE3X56oQJe11eHgPEOE8u2z7RU
 51UlSUtBuaN6Uj9XaGSMJVWZumLKYJ01mFXzA56wY3I5OBESSlkwNCz5roKz3/+2udai
 PenA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwdg6v8Omm6Jq8K0wS0VgELgi1V8NNSS86CUAKFIfduhEb+64riTpk2RrPslyZ1N6TpuIxEEaeQg==@nongnu.org
X-Gm-Message-State: AOJu0YxDI2w46qHMlFu37NZc44ldKrbtP0GwLBcAHOa8xE4uTAJQ/709
 mnKNeHUFYXfv3/+f7Xvqsp51gLbpR4KrtslKRCkJTiNX/bFS2sGcRR3s+T2w89yMQEzd/ghcAzO
 d07R1MClcYhPcwpqczJVuckDE/TcKlNA5IxX7cUlVGQ==
X-Gm-Gg: ASbGncvJsbuOUcNW0O3XqB35DpQI0xwdQvsg3eRi60vGZzG9dmJpmVtgP3dyhbd7YWS
 NFLrz+jRaa4EzRIN5yf6bBEfs3FCHAqG9TYUoCEnc662NhLtHde97GEUo/f4YxuXVoXVTVD+WWy
 zDyyPRqEtnoXwSzPQO6xQspL5BCIoFTNTyCtXNovRVBm6QsPepOp+04OZIt6cY1gZutVtZTnlOX
 YDv5NUQ
X-Google-Smtp-Source: AGHT+IEx48t+wkyr4+LjxZfbUnm88FeFcnOAvFmsR1/1vXSfQsWvW+ehtfUpT/tjPsMDQONHVmRZvn/PIpwnoHyLDFA=
X-Received: by 2002:a05:690c:6202:b0:71b:69ed:50ba with SMTP id
 00721157ae682-71bf0e34ademr115573397b3.23.1754832727807; Sun, 10 Aug 2025
 06:32:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250722131925.2119169-1-smail.aider@huawei.com>
 <b06c4273-650b-4ba3-bf35-9af16bfc70e7@tls.msk.ru>
In-Reply-To: <b06c4273-650b-4ba3-bf35-9af16bfc70e7@tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 10 Aug 2025 14:31:56 +0100
X-Gm-Features: Ac12FXzLkhVWjMVKKkhJaN0zTN4oPQ-dKieb8tSk8HP8x82ek4RQBd2pTs7-Wq8
Message-ID: <CAFEAcA8oSaNp3bKeOF-xcfNnWhm-vYnbwr9_yrpHDQcDwOmwDQ@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Trap PMCR when MDCR_EL2.TPMCR is set
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: Smail AIDER <smail.aider@huawei.com>, qemu-devel@nongnu.org, 
 alexander.spyridakis@huawei.com, zhangyue165@huawei.com, qemu-arm@nongnu.org, 
 liuyutao2@huawei.com, qemu-stable@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb31.google.com
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

On Sun, 10 Aug 2025 at 08:57, Michael Tokarev <mjt@tls.msk.ru> wrote:
>
> On 22.07.2025 16:19, Smail AIDER via wrote:
> > Trap PMCR_EL0 or PMCR accesses to EL2 when MDCR_EL2.TPMCR is set.
> > Similar to MDCR_EL2.TPM, MDCR_EL2.TPMCR allows trapping EL0 and EL1
> > accesses to the PMCR register to EL2.
>
> Ping?
>
> Has this patch been forgotten?

This is v1, it got code review comments, and there is a v2 on list.

The v2 on my list but it's passed the "worth putting into 10.1"
point already and hasn't yet been reviewed. I was assuming RTH would
review as he looked at v1.

-- PMM

