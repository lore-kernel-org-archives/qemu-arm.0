Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12E28CCFA18
	for <qemu-arm@archiver.kernel.org>; Thu,  6 Nov 2025 10:32:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vGxHn-0004kd-G8; Thu, 06 Nov 2025 05:32:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vGxHm-0004k7-8B
 for qemu-arm@nongnu.org; Thu, 06 Nov 2025 05:32:10 -0500
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vGxHk-0004Cu-JH
 for qemu-arm@nongnu.org; Thu, 06 Nov 2025 05:32:09 -0500
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-78488cdc20aso8100687b3.1
 for <qemu-arm@nongnu.org>; Thu, 06 Nov 2025 02:32:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1762425126; x=1763029926; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0qUTVtkkVIeWkiwu2fshGWRQNdoVaE4OvRpHTH8UH4Q=;
 b=r5s9JzjQcCJ/POqYTMFTtC4U0MYhnDjxSA2HusDGglSRWiKNO9vsXxPPF+RLxO+alB
 4GjTEKKMbM2HDxqoZZJb1ewV1a0kOq2QYMCh6cLV5ALUvr6nwnL0xfJnSSDA4G84vLJP
 8Mv1fw+FzFynQesqkEFNaMpB0tftvFnihfwwtFIl4geDRf6P9brZ7htwUZLiLj6jondE
 S7JV0gfufEeKmjMsgQMejG1/UMaE/cQC+WBZnU5ikQFNwrX7nrf1dbMFrlQA3HiyB3T/
 qOpNEscqnnMg8kD3LdtyW5Uthp1okNc271yDFQ8STYuVpoF2bhSxW2D77PDjJv7g3kv8
 8i6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762425126; x=1763029926;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0qUTVtkkVIeWkiwu2fshGWRQNdoVaE4OvRpHTH8UH4Q=;
 b=SXpGbS1FRcTogI/4VLwcffsczdtjif1H8elUiKJr86vXhA5he6G90qF2XKh6gHgLW8
 WNuJih1s27u8XnwStugqvWP6V4xm8FSo/SJM1qTQDzUi4RbGGEnK8cR1SXnX3/3M9sHs
 4v9nvXoBhUS+22mPe30guhD1LaqDcph2V/PI5vE/WTT2WKvqgZT83O2eeZV41NX9CK+B
 8SFWj73Zy5UQNz5P1U+O3SecCKls7ASMwj9hFF8xKguUOfQ2DT5/uop4sO3F11gqjn+r
 uOwdPB24sxwAOxkcUcLvrGSTDVqljyAYLpm4NZUnFMsLWSSAyfMCFnLbglq5EdwMV52x
 I00w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOXTigx5FhtBij3p4fmZula5HknpqfvXv52hI+Xd4CeNYyhU1DiI1PVsexjpL7LUkKGeNKerKTog==@nongnu.org
X-Gm-Message-State: AOJu0YyAWH3KY3Kp/RZVaqS/q5l/Yi4NhAYYpsTnoP4dQJSwkJhGHLSG
 Qx6s886LkOmxY0xuT62QSe9jHgkkZb6kDCK6bRaxg49hjo9Y+OVHYpmd30Ym0eK+6ie6bCX0cH8
 85Jkttem8lXNOnb4WxY2ijTB2y6hGXoUWQBu6tkUN/g==
X-Gm-Gg: ASbGncsixr2AxahTNSTmUxalsbsqaroPCymSBsg3k29jtnXUpNBXyIHighVOmBRgqb6
 CDLcwDaLinNp8vSWBBjIx+szHdMFcAe+az7RGqddKaxHUvhSU9fnyCVnOcbMq8dabX0t02sphvS
 ZBg0pFWeOIBqOhvNNWhgcZ1ZVl3cQzBWexPdjWVdIn7+w2FeovaMxIl1vuITRVjcODwxyWzjX8L
 wFuaJ5k3+l4+aMUKEWpsQ6vA8s2P7SczMG9D6L9FdJL+NqYrwdmCgTzY5TAvw==
X-Google-Smtp-Source: AGHT+IHBf4Ud1HMNrFd+DrvdV0UvNiwH7w5CiIVR1XpTovjVDm6LdA/O8Kb+QG1cJITDz59kn3z22J9XwIrjw9wIPcw=
X-Received: by 2002:a05:690e:4248:b0:63f:a727:8403 with SMTP id
 956f58d0204a3-63fd355c052mr4300610d50.38.1762425126277; Thu, 06 Nov 2025
 02:32:06 -0800 (PST)
MIME-Version: 1.0
References: <20251104-feat-mte-tagged-far-v1-1-cdfd7db40397@gmail.com>
 <9b196058-a0e3-422e-86a6-7c405681bf42@linaro.org>
In-Reply-To: <9b196058-a0e3-422e-86a6-7c405681bf42@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Nov 2025 10:31:55 +0000
X-Gm-Features: AWmQ_bn3naln20q-4M_XF_Kwll009HdD_p629bS3VMrEXzO1iMwLExhZXk-Ysc8
Message-ID: <CAFEAcA_wOPO-BsMUB7_CtLKgb2HQEx4K62WJxoekabQ5Mo=Cpw@mail.gmail.com>
Subject: Re: [PATCH] target/arm: add support for FEAT_MTE_TAGGED_FAR
To: Gustavo Romero <gustavo.romero@linaro.org>
Cc: Gabriel Brookman <brookmangabriel@gmail.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
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

On Wed, 5 Nov 2025 at 17:49, Gustavo Romero <gustavo.romero@linaro.org> wrote:
>
> Hi Gabriel,
>
> Thanks for your contribution.
>
> On 11/4/25 21:50, Gabriel Brookman wrote:
> > FEAT_MTE_TAGGED_FAR is a feature required for MTE4. The feature
> > guarantees that the full address (including tag bits) is reported after
> > a SEGV_MTESERR, and advertises itself in the ID_AA64PFR2_EL1 system
> > register. QEMU was already reporting the full address, so this commit
> > simply advertises the feature by setting that register, and unsets the
> > register if MTE is disabled.
> >
> > Signed-off-by: Gabriel Brookman <brookmangabriel@gmail.com>
> > ---
> > This patch is the first step toward implementing ARM's Enhanced Memory
> > Tagging Extension (MTE4). MTE4 guarantees the presence of several
> > subfeatures: FEAT_MTE_CANONICAL_TAGS, FEAT_MTE_TAGGED_FAR,
> > FEAT_MTE_STORE_ONLY, FEAT_MTE_NO_ADDRESS_TAGS, and FEAT_MTE_PERM,
> > none of which are currently implemented in QEMU.
> >
> > According to the ARM ARM, the presence of any of these features (except
> > FEAT_MTE_PERM) implies the presence of all the others. For simplicity
> > and ease of review, I plan to introduce them one at a time. This first
> > patch focuses on FEAT_MTE_TAGGED_FAR.
>
> I think it's ok to add these "subfeatures" separately.

We can add the implementation of the subfeatures separately,
but we should not enable them in 'max' until they're all
present. (We don't always adhere strictly to the architecture's
"feature X implies Y exists" rules, but in this case
because they're really a tightly linked bundle that add
up to "MTE4" I think that presnting only a subset to guests
is likely to result in them not behaving correctly.)

thanks
-- PMM

