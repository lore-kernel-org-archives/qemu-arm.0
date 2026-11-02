Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6A3606A337
	for <qemu-arm@archiver.kernel.org>; Mon,  2 Nov 2026 10:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=cNtyfD+O
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xNotL-0004Lt-4q; Mon, 02 Nov 2026 05:03:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xNotG-0004LC-BK
 for qemu-arm@nongnu.org; Mon, 02 Nov 2026 05:03:49 -0500
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xNotE-0004T9-DB
 for qemu-arm@nongnu.org; Mon, 02 Nov 2026 05:03:45 -0500
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-8ab43af5e97so29559977b3.1
 for <qemu-arm@nongnu.org>; Mon, 02 Nov 2026 02:03:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793613823; cv=none;
 d=google.com; s=arc-20260327;
 b=Fj55y7brRSn7GtTRCn9XzaKXobAUHIrfqGKll+vaq4RewY14CmQDgmpYlPkB2qClEs
 EnpvmoHy6P782r9ezYYQmhOchf0j5JqZ+PcMPCfzQM1Z8C5r7/4EV0BlbXoPo58YOOPe
 bVesOAzgZEMO/ZlKiblQ4rnpHIhMwMtVLJ+8DxcG36K4YOc/Q9HKgCo6u4qd8QT1b7TP
 srWVxC0BBjqQ/GF9gkyQ3a+wbHPgvc7551/hb6uOaML2AtNBc6cY+ZDC3ha7Bl+HBscS
 tcIrqx/iAIxOmr6ydoxWBtOh2rEQqvRE8I1IwjGuRtK4a4zsABCB667rD8A/Ozv4EwOM
 3Dbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=3PCeyUgACBxkxGIdjbwMbxKtQcw67ovdML6Bm60fRd4=;
 fh=OpCl3mjAXHz5o4hgQuIakC9UUSZTKZNl7YwRFKSk7l8=;
 b=h6+T1Fcc1eBzbRJuUswAwUCWMg64XEhgLaB+FNNovMm5BGKl/WmuTAoU/9BQ/ZelvU
 jjTtSHG1k5M/FXKoUz8/45pkbc6fGUU0eSoxempfAOKavLN2uo5U9Zqrjv+n3/5No2Ag
 rtSaCarhNzqeajafs88R90jYlhnKacaLIWn6CYqXddBnByL4inFMwmA8BccjBj7YkeD+
 ijL/TU2K/JTxWveMOYd7NL+8TCpKgLY0rMZfkQtAuyk6WzWcxpXSZXgRo8uOA1qAPL+a
 7l5t6SMecp0j4SL8fEhJy19chQkryPwiFDiMw5dT0vL285N+bXKEZoQ78EnyS0CqYsuA
 2XCA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793613823; x=1794218623; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=3PCeyUgACBxkxGIdjbwMbxKtQcw67ovdML6Bm60fRd4=;
 b=cNtyfD+OrsCN9yw5zzo8BxZqeW/5Qo0kSCzqE2bhdKJxihuTFPYDAx7si6PapneD2n
 GfRY3kCbj38VSlu782Ozd9hPDFZjM/D5CczUgWGbnyDGcKs0Ku2ML1snFxb4Po6X4TKc
 nx6Z3mN5yIczW8r3ynQLTC7JFjZieSBj4UY9HjKCIrFxcIELMlJwdSQTlkuPdEdnO3iu
 uZYjL3siNCHXvSnQ9p5eOs7hwGVb3LXEECKQGuOTVw9PbTIVQcCJtyTJw8Cw7dawSLf1
 M5P1wlnlRXn0RYNRNOpJ7PTvZde7TeONg/ACfi2RdW7g1yPbcGdW1RA/CeKzVA2LaxPR
 8rcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793613823; x=1794218623;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=3PCeyUgACBxkxGIdjbwMbxKtQcw67ovdML6Bm60fRd4=;
 b=V05BRt1/pywlqHlE9S3trcUk6NLILuafICNLW2LdGMV14SofTBYM/9V36Nsux+bfwj
 dkh3F86Ez2wmQmjmtsPC4F6jtUOvg166g3HbVQE0fO+BVqO9Gnsv0eip9IKYr2pGbzlK
 75K8H4XoF2RchkwLfK/oGMKcJYbFe8OTZvW46ijf3F57bWMdNA/1YcJa3mpiuXgzXWDd
 XXppZBt6OH4vi7f5a1t6ho/w1HVxv6SPxkOUlHecDiQDegYe+GakYgrN/C7L9FLMiF4K
 tOWvNN7Gp266oozDp/L6zAAeWnW6YuqlKdaoymoW+vfXsD7YQvabLjsTqSy/oEcz1HRr
 mLqA==
X-Forwarded-Encrypted: i=1;
 AKwUvBw5uHXu0KPDsbtkmX041OGhpnnq8OykwHFOmJzbmduZ9B2oONsORZ7kzrBqV1i+hdTwhDtO7lz3Dg==@nongnu.org
X-Gm-Message-State: APuU4Z8zuT+f0YfMx/mE6eiQDqqalJfGPjYvdWwYMUZABhB6gP71gj3E
 FquyrZIcI4HM31mlLGPVSH+AQdxZiHaliEaIYC9fGBxe9217ph2YyTEvUgrmuVP/89juZZFnLKp
 pHvCtnsitSfkf54l+dlmUNDCg+Aoa9XZPc9ot4ReSax0+4ll5R22TtOY=
X-Gm-Gg: AYBFou1R1Mgp29GKChJBOsoEvM/UA4f0PdLSk12impKH4RV4CxTXIaqse0XkzbcYDkw
 oyV1gWxs9WofeJU8qSKdY7n3cvAXEN4E+RMGn5CGoNVjiSiM3ivl4xeyNMqBHBLcVQ8JW0Drf1w
 SUCp9NoaAbbpEUjbCyELkZ3pqhN2MkFrOmZ7EULvdQoQbqceSw0Q6ubkIYiyZrXv0I5CQwuB9Z3
 zzVd/CGIhsZLwA5ukee1xNg/RYpUM0opQvdO9ksEakJtZBkcpL6WbbE5gc5hUHZ1CUQ/UvDd0US
 Yqcnykijx0T1EtJLRKvZM2My0Hv00ASWVwMa5uQTPOacwQHhgVIUIfNPvnVsD7WxCjh/R/t3WY2
 ueMVu0419RUnzROMbk8tn4KzzPTGwZKbMJIJaWkErGvV/pS2kzFvvHHDK4yVBCNz4dSmLPhxJR7
 woBs8vSjYiE5EwgSxMTmCS
X-Received: by 2002:a05:690c:6e84:b0:887:b388:9911 with SMTP id
 00721157ae682-8b2b66ce121mr70477897b3.8.1793613822903; Mon, 02 Nov 2026
 02:03:42 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261030143435.57230-1-sebott@redhat.com>
In-Reply-To: <20261030143435.57230-1-sebott@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Nov 2026 10:03:31 +0000
X-Gm-Features: AclHuK-ntKtbrUXsA6sy08LZBiwA6VtDa1QqbGDeYu0mVRQrRnRISWbkHGj_j_0
Message-ID: <CAFEAcA8aRV9TSQZ_Czj+5cZ7=frq7uQG4yuk9H414wBUKiyxtA@mail.gmail.com>
Subject: Re: [PATCH 0/2] target/arm/cpu64: migration tolerance for PMMIR_EL1
To: Sebastian Ott <sebott@redhat.com>
Cc: Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112f.google.com
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
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 30 Oct 2026 at 14:34, Sebastian Ott <sebott@redhat.com> wrote:
>
> PMMIR_EL1 is exposed from Linux v7.3 onwards. Backward migration
> to an older kernel would fail without cpreg migration tolerance
> definition for this register. Fix a couple of typos while at it.
>
> Sebastian Ott (2):
>   target/arm/cpu64: fix typos in kvm_arm_set_cpreg_mig_tolerances()
>   target/arm/cpu64: Define cpreg migration tolerance for PMMIR_EL1
>
>  target/arm/cpu64.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
>



Applied to target-arm.next, thanks.

-- PMM

