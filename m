Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F21BCDE008
	for <qemu-arm@archiver.kernel.org>; Fri, 26 Jun 2026 08:48:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wd2E0-0001eD-0g; Fri, 26 Jun 2026 04:47:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wd2Dy-0001cz-2N
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 04:47:46 -0400
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wd2Dw-0006eV-KQ
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 04:47:45 -0400
Received: by mail-yx1-xb12e.google.com with SMTP id
 956f58d0204a3-6647bc8f900so912834d50.0
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 01:47:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782463663; cv=none;
 d=google.com; s=arc-20260327;
 b=m5MzfprWlvIL9VA0fQupJV50mcYeh1+3Nh3gRY3nytPEY79P93vNB0E1d3jmKahx3K
 WLivDAASWOAhKJb6RYs3LhlDozkvX/oCodUxedkB3E607cmG0tq2iOt7/ec9wbXrs+aS
 P7mWL9Xe+YqQSpsI1MR8+kVfeiihQOddynV9omUMPpXt2s3GmH1PpQiU/50fJvq0t+g5
 MNtcmwt3cMeW4/m45GPTrlPcQgeMNwZbQ2bCinXHHaai39Q9JbMmaUisR8PC3KBRn/wM
 /61vp2zfY1aFKGM7cS4RAapdtbJlX5YbRNzpZM6CX2oKmimxPBJpogWLgmdSJjhK1fKF
 8HtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=68kgUU/w3XTlGLUvPcU8AgkULNeWQmRqt9ekv85PYd0=;
 fh=kY4IrH7pBbgVLCFxVzRVnJW6Y9M44jEvfNCvS6Wtf8c=;
 b=iGGboVTY/eP8Qgz6dBlMe3wSuDVbXcH7hBR/R0iySNc4f8K04HRkcbG+5bUFkvAowJ
 7/egKS/zbBhiiylmbjFJV1HhkFcIqHZ7TbpxRTJNAMKBqL7rKGPXskFmH0OyCTSGyfsH
 xyxqPBBMiy7yxXwc6Duce0/C1x6wlVEC7PTF9T/SsnXSj70qaoCQjK0O+YWEffL5WFtI
 aFmUwmSdwVvzBdSigmVtm+d9fF6akt78iPRauG4JjrakfjWJrFE/liGtjtwNxDK58AdV
 uhvZ9JNB2R418Q2NQfZXLXz0W7lAxZWSNvILKSX9oj8bCXO8KLJzWO4zvrS543Z6i+9j
 v7dA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782463663; x=1783068463; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=68kgUU/w3XTlGLUvPcU8AgkULNeWQmRqt9ekv85PYd0=;
 b=rEv/yU/NB++sejPDnECkGfxa2YciXj4Rmr6byPGudP2rt7pXzY72P1zQp2GHnkoMtw
 iHH2bDatVP08mgF5CT6EHuzPt4ySUE6XZLgp8WVQMNOt1Lx9NxFsGp4d1BiBsTD5zFPL
 0tzMVRdThKmgtytHG1SIbfANwsKYNXi+Fh9+XOowRDxEhfyUa8hCnJzcbBRad1So5y5f
 xXyWPjYWdk8DbJdMRyM/fBmaHmpKrF43bTXZ8eYqlkYYo5953qUxvopsHtcS9VDlcDGw
 IKQS7v5dnv3l7WSJrSHgNcAIvEtDBW98lVrT7vss3JiMzfGLtcVXCGfqtpq3DH9VVJqb
 dQlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782463663; x=1783068463;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=68kgUU/w3XTlGLUvPcU8AgkULNeWQmRqt9ekv85PYd0=;
 b=S2ONn6Qc8K1pffR257F+MO+6fmfEvA7hGnBYGGbYzRjxiLF8cjSsmvuAIRRLFoPkkr
 ejtmMossyRHzUephQTGf5K20hWhNU8TuKw+Egc8uTD6Piwwg0hhY1iAbwOVqLK3KQ9um
 LCtYRjUdxfV1u69y/OWJHt3KiS8mLVoA9H8bcXqnciR5cpAsiFjucHQPHlDUc0VoatHn
 dWtd3DeHsB2uPw13OfydxNObheEQdGwlkAYF4FvVqLgBhd0rbAi50j/2DXd0PALVQj1Q
 wCqumCQ+0Iqa5ClpJfeH+5kVZuSjjH9lGC9fZWoHWHKHSs5VEZW20JJX7GPiXCbQe6tr
 V2FQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RpC2uqaO62s/079l0dqhq4KX7723HyBJqhmqGWzhbjGNcSElHsDpq0NQK/mG7vUeB0rOgVlnRib3Q==@nongnu.org
X-Gm-Message-State: AOJu0Yym17/yEVXavZhhW6d/e6flAYWuRUimYXMhDtLChIzY/3CAeyP8
 Y6UZOlO3rjEDbvmfedXwBDZov+RJXnmfPOiwRMnI3Hi6advenV3Pi5JuRqFcr64Vo9pCEHWBVvw
 jfPrhvt0i9I0Ijaww5d2aax+VIZI0OgTFC+m1/emhTQ==
X-Gm-Gg: AfdE7cljeJuHRzsayqUoP7HVSqzOTJmjTaAMw6tgqEHwzh54pkwEa4mcrRleGiWvT4y
 yFBW8Eg7O0aat+iMclnpxZ/TybMwJWXpE77LxRay2Vr1Yl0LxM9/n/iUZgc8qSyHRHMTIE/GMDh
 n78cEQW5lVDxlm8I+d8dma1rk9/ehiBk6L5gbz82DXsyLPrtqc+G9F5X1sYGHzyyCPZPN1B3rpW
 E7RLSoI7gjTLfyWXBhFaGfEPHXK3uGRihge5asaUGI4YGp1jqEdgTh4i+rLgX7z8+u2+khikwXO
 lztKlrgSPAGApL6EhZN8dp4na9RaA6hn5vUQkVRRBSld1NBFoiHP8J3c
X-Received: by 2002:a05:690e:1207:b0:662:f28b:7c63 with SMTP id
 956f58d0204a3-66487e77653mr4609413d50.63.1782463663324; Fri, 26 Jun 2026
 01:47:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260624-jmac-fprcvt-v2-0-dc6cf8e512b6@linaro.org>
In-Reply-To: <20260624-jmac-fprcvt-v2-0-dc6cf8e512b6@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Jun 2026 09:47:31 +0100
X-Gm-Features: AVVi8CewcwFSOjQa2qWPxbwBvA7NyTQfs4ypJcx8d6XL5bMPsuOLT1AQJFt3We4
Message-ID: <CAFEAcA99ws+EPh1eL72ygPd2XxAiBUZ6Jfqe_ky7+0Jn-jYWGQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] Implement FEAT_FPRCVT in cpu_max
To: Jim MacArthur <jim.macarthur@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>,
 Alex Bennee <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12e.google.com
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

On Wed, 24 Jun 2026 at 14:37, Jim MacArthur <jim.macarthur@linaro.org> wrote:
>
> This introduces new forms of FCVTXX instructions which convert floating
> point to integer but place the results in SIMD & FP registers, and
> forms of the [SU]CVTF instructions which convert from integer to FP
> with a source in SIMD & FP registers. The logic for conversion and test
> values are otherwise the same as the versions which use general-purpose
> registers.
>
> Signed-off-by: Jim MacArthur <jim.macarthur@linaro.org>
> ---
> Changes in v2:

Since it looks like you'll need to respin this anyway,
a minor patch structuring nit:

> Jim MacArthur (6):
>       target/arm/tcg/cpu64.c: Add FEAT_FPRCVT to cpu_max
>       linux-user/aarch64/elfload.c: Add FPRCVT
>       docs/system/arm: Add FEAT_FPRCVT to A-profile support

We generally put all of these in one patch, since they're
just single lines needed to expose the feature to the
guest and document that we've done it. Compare e.g.
commit c45b02cb24ee. So you can just squash these together.

thanks
-- PMM

